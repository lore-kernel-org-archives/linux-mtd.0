Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JqXqv-00027B-Mn
	for linux-mtd@lists.infradead.org; Mon, 28 Apr 2008 18:13:26 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m3SIDFSf000330 for <linux-mtd@lists.infradead.org>;
	Mon, 28 Apr 2008 11:13:15 -0700 (MST)
Received: from ld0162-tx32.am.freescale.net (ld0162-tx32.am.freescale.net
	[10.82.19.112])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id m3SIDEAs028968
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Apr 2008 13:13:15 -0500 (CDT)
Date: Mon, 28 Apr 2008 13:13:14 -0500
From: Scott Wood <scottwood@freescale.com>
To: Li Yang <LeoLi@freescale.com>
Subject: Re: [PATCH] MTD: fix partition scan control logic in physmap_ofand
	fsl_elbc_nand
Message-ID: <20080428181314.GK9849@ld0162-tx32.am.freescale.net>
References: <1204201051-13107-1-git-send-email-leoli@freescale.com>
	<1208890162.9212.646.camel@pmac.infradead.org>
	<989B956029373F45A0B8AF029708189002007C8F@zch01exm26.fsl.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <989B956029373F45A0B8AF029708189002007C8F@zch01exm26.fsl.freescale.net>
Cc: linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 25, 2008 at 07:09:59PM +0800, Li Yang wrote:
> The error can also be soft error like a typo in the cmdline or device
> tree.  I could be better to try other ways to see if we can find a sane
> partition table than just to fail.

If cmdline partition information exists, typo or not, then obviously
there was intent for the cmdline to be used.  It's better to let the user
know there's a problem than silently fall back to some other, likely
wrong partition information.

-Scott
