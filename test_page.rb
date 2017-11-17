module Pages
  class InspirePage
    include Capybara::DSL

    def visit_page
      visit 'https://inspire.com'
      sleep 3
    end

   def login
      click_modal('.btn-header-login')
      sleep 2 
    end

   def fill_out_login
      fill_in 'E-mail',  { id: 'email', with: 'ross_test@inspire.com' }
      fill_in 'Password', { id: 'pw', with: 'password1' }
      within('form#signin_form') do
        click_modal('.button')
        sleep 3
      end
    end

    def fill_in_title(title)
      fill_in 'title', { id: 'title', with: title }
    end

    def fill_in_body(body)
      fill_in 'body', { class: 'posttextarea', with: body }
    end

    def click_modal(klass)
      find(klass).click
    end

    def click_href(href)
      find(:xpath, "//a[@href=\"#{href}\"]").click
    end

    def click_dropdown(option)
      find('#privacy_chosen').click
      find('#privacy_chosen .active-result', text: option).click
    end
 end
end
