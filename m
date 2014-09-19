Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XV1Y4-0006Rx-OR
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 17:00:45 +0000
Received: by mail-pd0-f182.google.com with SMTP id p10so120297pdj.41
 for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2014 10:00:23 -0700 (PDT)
Date: Fri, 19 Sep 2014 10:00:20 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH v3 0/7] mtd: denali: A collection of trivial coding style
 fixes
Message-ID: <20140919170020.GF1193@ld-irv-0074>
References: <1410865465-17941-1-git-send-email-yamada.m@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1410865465-17941-1-git-send-email-yamada.m@jp.panasonic.com>
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

On Tue, Sep 16, 2014 at 08:04:18PM +0900, Masahiro Yamada wrote:
> 
> 
> Masahiro Yamada (7):
>   mtd: denali: fix the format of comment blocks
>   mtd: denali: remove unnecessary variable initializations
>   mtd: denali: remove unnecessary casts
>   mtd: denali: change the type of iterators to int

I already merged these 4.

>   mtd: denali: remove a set-but-unused variable

This one was merged but you changed it (and falsely kept the
'Reviewed-by' tag). So I split it out into its own patch and dropped the
'Reviewed-by'.

>   mtd: denali: remove unnecessary parentheses
>   mtd: denali: fix indents and other trivial things

Applied a modified version of the last three, to l2-mtd.git. Feel free
to check my work, but git tells me that the end result is identical.

>  drivers/mtd/nand/denali.c | 558 +++++++++++++++++++++++++---------------------
>  1 file changed, 301 insertions(+), 257 deletions(-)
> 

Brian
