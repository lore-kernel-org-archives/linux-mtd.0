Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqxD2-00084V-3f
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 06:26:28 +0000
Date: Fri, 15 Apr 2016 08:26:04 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 alex@nextthing.co, Daniel Walter <dwalter@sigma-star.at>
Subject: Re: [RFC] ubihealthd
Message-ID: <20160415062604.GA31101@pengutronix.de>
References: <1446764403-22742-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446764403-22742-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard, Daniel,

On Thu, Nov 05, 2015 at 11:59:59PM +0100, Richard Weinberger wrote:
> ubihealthd is a tiny C program which takes care of your NAND.
> It will trigger re-reads and scrubbing such that read-disturb and
> data retention will be addressed before data is lost.
> Currently the policy is rather trivial. It re-reads every PEB within
> a given time frame, same for scrubbing and if a PEB's read counter exceeds
> a given threshold it will also trigger a re-read.
> 
> At ELCE some people asked why this is done in userspace.
> The reason is that this is a classical example of kernel offers mechanism
> and userspace the policy. Also ubihealthd is not mandatory.
> Depending on your NAND it can help you increasing its lifetime.
> But you won't lose data immediately if it does not run for a while.
> It is something like smartd is for hard disks.
> I did this also in kernel space and it was messy.

I gave ubihealthd a try and it basically works as expected. I let it run
on a UBI device with a ton of (artificial) bitflips and the demon crawls
over them moving the data away.

Do you have plans to further work on this and to integrate it into the
kernel and mtd-utils?

One thing I noticed is that ubihealthd always scrubs blocks, even when
there are no bitflips in that block. Why is that done? I would assume
that rewriting a block when there are more bitflips than we can accept
is enough, no?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
