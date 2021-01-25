document.addEventListener("turbolinks:load", () => {
  const art = document.getElementById('article')
  const sen = document.getElementById('sentiment')
  const f_btn = document.getElementById('filter_btn')
  const sort = document.getElementById('sort')
  const sort_n = document.getElementById('sort_new')
  const sort_o = document.getElementById('sort_old')
  const sort_m = document.getElementById('sort_many')
  const sort_l = document.getElementById('sort_less')
  const s_btn = document.getElementById('page_btn')
  if (f_btn) {
    const post_div = document.querySelectorAll('#post_div')
    const comment_div = document.querySelectorAll('#comment_div')
    const neutral_post = document.querySelectorAll('.neutral_post')
    const positive_post = document.querySelectorAll('.positive_post')
    const negative_post = document.querySelectorAll('.negative_post')
    const neutral_comment = document.querySelectorAll('.neutral_comment')
    const positive_comment = document.querySelectorAll('.positive_comment')
    const negative_comment = document.querySelectorAll('.negative_comment')
    block()
    showBtn()
    firstPage()
    f_btn.addEventListener('click', function () {
      if (art.value == "all") {
        if (sen.value == "all") {
          for (var i = 0; i < post_div.length; i++) {
            post_div[i].style.display = "block"
          }
          for (var i = 0; i < comment_div.length; i++) {
            comment_div[i].style.display = "block"
          }
        } else if (sen.value == "positive") {
          for (var i = 0; i < positive_post.length; i++) {
            positive_post[i].style.display = "block"
          }
          for (var i = 0; i < positive_comment.length; i++) {
            positive_comment[i].style.display = "block"
          }
          for (var i = 0; i < negative_post.length; i++) {
            negative_post[i].style.display = "none"
          }
          for (var i = 0; i < negative_comment.length; i++) {
            negative_comment[i].style.display = "none"
          }
          for (var i = 0; i < neutral_post.length; i++) {
            neutral_post[i].style.display = "none"
          }
          for (var i = 0; i < neutral_comment.length; i++) {
            neutral_comment[i].style.display = "none"
          }
        } else if (sen.value == "negative") {
          for (var i = 0; i < positive_post.length; i++) {
            positive_post[i].style.display = "none"
          }
          for (var i = 0; i < positive_comment.length; i++) {
            positive_comment[i].style.display = "none"
          }
          for (var i = 0; i < negative_post.length; i++) {
            negative_post[i].style.display = "block"
          }
          for (var i = 0; i < negative_comment.length; i++) {
            negative_comment[i].style.display = "block"
          }
          for (var i = 0; i < neutral_post.length; i++) {
            neutral_post[i].style.display = "none"
          }
          for (var i = 0; i < neutral_comment.length; i++) {
            neutral_comment[i].style.display = "none"
          }
        } else {
          for (var i = 0; i < positive_post.length; i++) {
            positive_post[i].style.display = "none"
          }
          for (var i = 0; i < positive_comment.length; i++) {
            positive_comment[i].style.display = "none"
          }
          for (var i = 0; i < negative_post.length; i++) {
            negative_post[i].style.display = "none"
          }
          for (var i = 0; i < negative_comment.length; i++) {
            negative_comment[i].style.display = "none"
          }
          for (var i = 0; i < neutral_post.length; i++) {
            neutral_post[i].style.display = "block"
          }
          for (var i = 0; i < neutral_comment.length; i++) {
            neutral_comment[i].style.display = "block"
          }
        }
      } else if (art.value == "post") {
        if (sen.value == "all") {
          for (var i = 0; i < post_div.length; i++) {
            post_div[i].style.display = "block"
          }
          for (var i = 0; i < comment_div.length; i++) {
            comment_div[i].style.display = "none"
          }
        } else if (sen.value == "positive") {
          for (var i = 0; i < positive_post.length; i++) {
            positive_post[i].style.display = "block"
          }
          for (var i = 0; i < positive_comment.length; i++) {
            positive_comment[i].style.display = "none"
          }
          for (var i = 0; i < negative_post.length; i++) {
            negative_post[i].style.display = "none"
          }
          for (var i = 0; i < negative_comment.length; i++) {
            negative_comment[i].style.display = "none"
          }
          for (var i = 0; i < neutral_post.length; i++) {
            neutral_post[i].style.display = "none"
          }
          for (var i = 0; i < neutral_comment.length; i++) {
            neutral_comment[i].style.display = "none"
          }
        } else if (sen.value == "negative") {
          for (var i = 0; i < positive_post.length; i++) {
            positive_post[i].style.display = "none"
          }
          for (var i = 0; i < positive_comment.length; i++) {
            positive_comment[i].style.display = "none"
          }
          for (var i = 0; i < negative_post.length; i++) {
            negative_post[i].style.display = "block"
          }
          for (var i = 0; i < negative_comment.length; i++) {
            negative_comment[i].style.display = "none"
          }
          for (var i = 0; i < neutral_post.length; i++) {
            neutral_post[i].style.display = "none"
          }
          for (var i = 0; i < neutral_comment.length; i++) {
            neutral_comment[i].style.display = "none"
          }
        } else {
          for (var i = 0; i < positive_post.length; i++) {
            positive_post[i].style.display = "none"
          }
          for (var i = 0; i < positive_comment.length; i++) {
            positive_comment[i].style.display = "none"
          }
          for (var i = 0; i < negative_post.length; i++) {
            negative_post[i].style.display = "none"
          }
          for (var i = 0; i < negative_comment.length; i++) {
            negative_comment[i].style.display = "none"
          }
          for (var i = 0; i < neutral_post.length; i++) {
            neutral_post[i].style.display = "block"
          }
          for (var i = 0; i < neutral_comment.length; i++) {
            neutral_comment[i].style.display = "none"
          }
        }
      } else {
        if (sen.value == "all") {
          for (var i = 0; i < post_div.length; i++) {
            post_div[i].style.display = "none"
          }
          for (var i = 0; i < comment_div.length; i++) {
            comment_div[i].style.display = "block"
          }
        } else if (sen.value == "positive") {
          for (var i = 0; i < positive_post.length; i++) {
            positive_post[i].style.display = "none"
          }
          for (var i = 0; i < positive_comment.length; i++) {
            positive_comment[i].style.display = "block"
          }
          for (var i = 0; i < negative_post.length; i++) {
            negative_post[i].style.display = "none"
          }
          for (var i = 0; i < negative_comment.length; i++) {
            negative_comment[i].style.display = "none"
          }
          for (var i = 0; i < neutral_post.length; i++) {
            neutral_post[i].style.display = "none"
          }
          for (var i = 0; i < neutral_comment.length; i++) {
            neutral_comment[i].style.display = "none"
          }
        } else if (sen.value == "negative") {
          for (var i = 0; i < positive_post.length; i++) {
            positive_post[i].style.display = "none"
          }
          for (var i = 0; i < positive_comment.length; i++) {
            positive_comment[i].style.display = "none"
          }
          for (var i = 0; i < negative_post.length; i++) {
            negative_post[i].style.display = "none"
          }
          for (var i = 0; i < negative_comment.length; i++) {
            negative_comment[i].style.display = "block"
          }
          for (var i = 0; i < neutral_post.length; i++) {
            neutral_post[i].style.display = "none"
          }
          for (var i = 0; i < neutral_comment.length; i++) {
            neutral_comment[i].style.display = "none"
          }
        } else {
          for (var i = 0; i < positive_post.length; i++) {
            positive_post[i].style.display = "none"
          }
          for (var i = 0; i < positive_comment.length; i++) {
            positive_comment[i].style.display = "none"
          }
          for (var i = 0; i < negative_post.length; i++) {
            negative_post[i].style.display = "none"
          }
          for (var i = 0; i < negative_comment.length; i++) {
            negative_comment[i].style.display = "none"
          }
          for (var i = 0; i < neutral_post.length; i++) {
            neutral_post[i].style.display = "none"
          }
          for (var i = 0; i < neutral_comment.length; i++) {
            neutral_comment[i].style.display = "block"
          }
        }
      }
      block()
      showBtn()
      firstPage()
    })
  }
  if (sort) {
    sort_n.addEventListener('click', function () {
      var list_div = filter_ary
      var arr = []
      for (var i = 0; i < list_div.length; i++) {
        arr.push(list_div[i])
      }
      arr.sort(function (a, b) {
        return -(Date.parse(a.dataset["time"]) - Date.parse(b.dataset["time"]))
      })
      for (var i = 0; i < arr.length; i++) {
        document.querySelector('.div_list').appendChild(arr[i])
      }
      filter_ary = arr
      showBtn()
      firstPage()
    })
    sort_o.addEventListener('click', function () {
      var list_div = filter_ary
      var arr = []
      for (var i = 0; i < list_div.length; i++) {
        arr.push(list_div[i])
      }
      arr.sort(function (a, b) {
        return Date.parse(a.dataset["time"]) - Date.parse(b.dataset["time"])
      })
      for (var i = 0; i < arr.length; i++) {
        document.querySelector('.div_list').appendChild(arr[i])
      }
      filter_ary = arr
      showBtn()
      firstPage()
    })
    sort_m.addEventListener('click', function () {
      var list_div = filter_ary
      var arr = []
      for (var i = 0; i < list_div.length; i++) {
        arr.push(list_div[i])
      }
      arr.sort(function (a, b) {
        return -(a.getAttribute('like_count') - b.getAttribute('like_count'))
      })
      for (var i = 0; i < arr.length; i++) {
        document.querySelector('.div_list').appendChild(arr[i])
      }
      filter_ary = arr
      showBtn()
      firstPage()
    })
    sort_l.addEventListener('click', function () {
      var list_div = filter_ary
      var arr = []
      for (var i = 0; i < list_div.length; i++) {
        arr.push(list_div[i])
      }
      arr.sort(function (a, b) {
        return a.getAttribute('like_count') - b.getAttribute('like_count')
      })
      for (var i = 0; i < arr.length; i++) {
        document.querySelector('.div_list').appendChild(arr[i])
      }
      filter_ary = arr
      showBtn()
      firstPage()
    })
  }
  if (s_btn) {
    var sel = document.getElementById('selectpage')
    s_btn.addEventListener('click', function () {
      var ary = filter_ary
      var items = 10;
      var pageIndexStart = (sel.value - 1) * items;
      var pageIndexEnd = sel.value * items;
      for (let i = 0; i < ary.length; i++) {
        ary[i].style.display = "none"
      }
      for (var i = pageIndexStart; i < pageIndexEnd; i++) {
        if (i >= ary.length) {
          break;
        }
        ary[i].style.display = "block"
      };
    })
  }
})

function block() {
  filter_ary = document.querySelectorAll("div[style^='display: block']")
}

function showBtn() {
  var block_ary = filter_ary
  var ary = [];
  for (let i = 0; i < block_ary.length; i++) {
    ary.push(block_ary[i]);
  }
  filter_ary = ary
  var opt = document.getElementById('selectpage');
  var btnNum = Math.ceil(ary.length / 10);
  var str = "";
  for (var i = 0; i < btnNum; i++) {
    str += ` <option id ="${i + 1}" value="${i + 1}">${i + 1}</option> `;
  }
  opt.innerHTML = str;
}

function firstPage() {
  var pageIndexStart = 0;
  var pageIndexEnd = 10;
  for (let i = 0; i < filter_ary.length; i++) {
    filter_ary[i].style.display = "none"
  }
  for (var i = pageIndexStart; i < pageIndexEnd; i++) {
    if (i >= filter_ary.length) {
      break;
    }
    filter_ary[i].style.display = "block"
  };
}