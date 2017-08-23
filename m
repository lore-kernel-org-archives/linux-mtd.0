Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkRig-0000za-N8
 for linux-mtd@lists.infradead.org; Wed, 23 Aug 2017 09:13:05 +0000
Date: Wed, 23 Aug 2017 11:12:39 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nandsim: remove debugfs entries in error path
Message-ID: <20170823091239.hwfdkoabn22nirz7@pengutronix.de>
References: <20170823070304.1336-1-u.kleine-koenig@pengutronix.de>
 <20170823104052.2cba1eb2@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170823104052.2cba1eb2@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Wed, Aug 23, 2017 at 10:40:52AM +0200, Boris Brezillon wrote:
> On Wed, 23 Aug 2017 09:03:04 +0200
> Uwe Kleine-König <u.kleine-koenig@pengutronix.de> wrote:
> 
> > The debugfs entries must be removed before an error is returned in the
> > probe function. Otherwise another try to load the module fails and when
> > the debugfs files are accessed without the module loaded, the kernel
> > still tries to call a function in that module.
> 
> Unfortunately this patch conflicts with [1], but feel free to send it to
> stable with my
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> [1]http://git.infradead.org/l2-mtd.git/commit/e8e3edb95ce6a146bc774b6cfad3553f4383edc8

I didn't test, but I think e8e3edb95ce6a146bc774b6c should fix the
issue, too.

The key question now is: Is my fix
(http://patchwork.ozlabs.org/patch/804837/) important enough to still go
into 4.13 (e8e3edb95ce6a146bc774b6c certainly isn't suitable here)? If
yes, it "only" creates a merge conflict that should be trivial to fix.
If it's to late for 4.13 then my patch should go into stable with an
updated comment that references e8e3edb95ce6a146bc774b6c.

What do you think?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
