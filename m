Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YckOA-0006sM-PC
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 00:50:43 +0000
Received: by padcy3 with SMTP id cy3so2430929pad.3
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 17:50:21 -0700 (PDT)
Date: Mon, 30 Mar 2015 17:50:16 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: fsmc_nand.c: Use default timings if none are
 provided in the dts
Message-ID: <20150331005016.GI32500@ld-irv-0074>
References: <1426772069-12677-1-git-send-email-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1426772069-12677-1-git-send-email-sr@denx.de>
Cc: Viresh Kumar <viresh.linux@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 19, 2015 at 02:34:29PM +0100, Stefan Roese wrote:
> Without this patch the timings are all set to 0 if not specified in the dts.
> With this patch the driver falls back to use the defaults that are already
> present in the driver and are known to work okay for some (older) boards.
> 
> Tested on a custom SPEAr600 based board.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Viresh Kumar <viresh.linux@gmail.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>

Pushed to l2-mtd.git.

Brian
