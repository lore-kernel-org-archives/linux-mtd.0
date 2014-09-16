Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTglR-000391-Ro
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 00:37:03 +0000
Received: by mail-pa0-f52.google.com with SMTP id kq14so7472253pab.11
 for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2014 17:36:40 -0700 (PDT)
Date: Mon, 15 Sep 2014 17:36:20 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH v2 0/7] mtd: denali: A collection of trivial coding style
 fixes
Message-ID: <20140916003620.GA1193@ld-irv-0074>
References: <1410228117-14820-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1410228117-14820-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: Jiri Kosina <trivial@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>,
 Rashika Kheria <rashika.kheria@gmail.com>, linux-mtd@lists.infradead.org,
 "grmoore@altera.com" <grmoore@altera.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 09, 2014 at 11:01:50AM +0900, Masahiro Yamada wrote:
> Changes in v2:
>   - Join quotes strings into a single line
> 
> Masahiro Yamada (7):
>   mtd: denali: fix the format of comment blocks
>   mtd: denali: remove unnecessary variable initializations
>   mtd: denali: remove unnecessary casts
>   mtd: denali: change the type of iterators to int
>   mtd: denali: remove a set-but-unused variable
>   mtd: denali: remove unnecessary parentheses
>   mtd: denali: fix indents and other trivial things
> 
>  drivers/mtd/nand/denali.c | 562 +++++++++++++++++++++++++---------------------
>  1 file changed, 303 insertions(+), 259 deletions(-)

Pushed patches 1 to 5 to l2-mtd.git. Thanks!

Patch 6 has a conflict with another fix already in l2-mtd.git. Can you
rebase and resend?

BTW, my automatic build tests show that there's at least one other
'unused' warning left, in case you want to tackle it too:

    drivers/mtd/nand/denali.c: In function ‘denali_read_page_raw’:
    drivers/mtd/nand/denali.c:1221:11: warning: variable ‘irq_status’ set but not used [-Wunused-but-set-variable]
          uint32_t irq_status;

Brian
