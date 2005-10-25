Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EUP8X-0007NI-F7
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2005 14:46:46 +0100
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j9PDkUbp006151
	for <linux-mtd@lists.infradead.org>; Tue, 25 Oct 2005 09:46:30 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j9PDkUvr092814
	for <linux-mtd@lists.infradead.org>; Tue, 25 Oct 2005 09:46:30 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j9PDkTNf020931
	for <linux-mtd@lists.infradead.org>; Tue, 25 Oct 2005 09:46:29 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce0510241800y4c3111a4gf4f34dc5c8ac2853@mail.gmail.com>
References: <1129819053.4219.10.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510201141520.5288@localhost.localdomain>
	<6934efce0510201038h2dbc72abvc610c894a9763bce@mail.gmail.com>
	<1130173789.15275.1.camel@windu.rchland.ibm.com>
	<6934efce0510241800y4c3111a4gf4f34dc5c8ac2853@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 25 Oct 2005 08:46:29 -0500
Message-Id: <1130247989.16443.3.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>
Subject: Re: Wrong CFI offset in cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-10-24 at 18:00 -0700, Jared Hulbert wrote:
> Sorry. It took me longer than it should have to track down a P30 part
> and get it on my machine.  Does this work for you?

No worries.  The patch seems to be working fine on my P30 chips.  I
don't have any other chips to test on at the moment, but it looks like
it should work.

Nicolas, could you try it on the chips you have?

> 
> [MTD] CHIPS: fix for P30 cfi parsing
> 
> Change to the extended cfi table parsing for Intel NOR flash that uses
> the info in the extended table to 'walk' the table rather than using
> hard coding for various primary extended query table version numbers.
> [From: Jared Hulbert <jaredeh@gmail.com>]
> 
> Index: trunk/drivers/mtd/chips/cfi_cmdset_0001.c
> ===================================================================
> --- trunk/drivers/mtd/chips/cfi_cmdset_0001.c	(revision 8)
> +++ trunk/drivers/mtd/chips/cfi_cmdset_0001.c	(revision 10)
> @@ -285,7 +285,7 @@
>  			      sizeof(struct cfi_intelext_otpinfo);
> 
>  		/* Burst Read info */
> -		extra_size += (extp->MinorVersion < '4') ? 6 : 5;
> +		extra_size += (unsigned int)extp->extra[extra_size+1]+2;
> 
>  		/* Number of hardware-partitions */
>  		extra_size += 1;
> @@ -519,7 +519,7 @@
>  		       sizeof(struct cfi_intelext_otpinfo);
> 
>  		/* Burst Read info */
> -		offs += (extp->MinorVersion < '4') ? 6 : 5;
> +		offs += (int)extp->extra[offs+1]+2;

Why (int) here and (unsigned int) above?  Not a big deal, but I'm
curious.

thx,
josh
