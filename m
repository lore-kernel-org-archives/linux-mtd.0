Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUInO-0005uJ-5A
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 17:13:34 +0000
Received: by mail-pd0-f178.google.com with SMTP id p10so2529528pdj.37
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 10:13:12 -0700 (PDT)
Date: Wed, 17 Sep 2014 10:13:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH v3 0/7] mtd: denali: A collection of trivial coding style
 fixes
Message-ID: <20140917171308.GC1193@ld-irv-0074>
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
>   mtd: denali: remove a set-but-unused variable
>   mtd: denali: remove unnecessary parentheses
>   mtd: denali: fix indents and other trivial things

This series still doesn't apply to l2-mtd.git.

Brian
