resource "newrelic_one_dashboard" "exampledash" {
  name = "New Relic Terraform Dashboard"
  permissions = "public_read_only"

  page {
    name = "New Relic Terraform Dashboard"
        // widgets are like formats which helps in displaying the data in different way...
    widget_billboard {
      title = "Requests per minute"
      row = 1
      column = 2
      width = 4
      height = 3

      nrql_query {
        query       = "FROM Transaction SELECT rate(count(*), 1 minute)"
      }
    }

    widget_bar {
      title ="Total-Pageviews"
      row = 1
      column = 7
      width = 4
      height = 3

      nrql_query {
        # account_id  = ""
        query       = "SELECT Count(*) FROM PageView "
      }

      # Must be another dashboard GUID
    #   linked_entity_guids = ["abc123"]
    }

    widget_pie {
      title = "Total transactions count, in application"
      row = 4
      column = 2
      width = 4
      height = 3

      nrql_query {
        # account_id  = <Another Account ID>
        query       = "SELECT count(*) FROM Transaction"
      }

      # Must be another dashboard GUID
      filter_current_dashboard = true
    }

     widget_table {
      title = "Total transactions done, in application"
      row = 4
      column = 7
      width = 4
      height = 3

      nrql_query {
        # account_id  = <Another Account ID>
        query       = "SELECT * FROM Transaction"
      }

      # Must be another dashboard GUID
      filter_current_dashboard = true
    }


 

    widget_markdown {
      title = "Dashboard Note"
      row    = 7
      column = 1
      width = 12
      height = 3

      text = "### Helpful Links\n\n* [New Relic One](https://one.newrelic.com)\n* [Developer Portal](https://developer.newrelic.com)"
    }
  }
}