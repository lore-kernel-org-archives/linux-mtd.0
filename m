Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JBfng-0005Cw-NU
	for linux-mtd@lists.infradead.org; Mon, 07 Jan 2008 00:25:15 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1JBfna-0004n4-Mc
	for linux-mtd@lists.infradead.org; Mon, 07 Jan 2008 00:25:05 +0000
Received: from pub082136092028.dh-hfc.datazug.ch ([82.136.92.28])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jan 2008 00:25:02 +0000
Received: from marcel by pub082136092028.dh-hfc.datazug.ch with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jan 2008 00:25:02 +0000
To: linux-mtd@lists.infradead.org
From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH] basic pxa3 nand controller support
Date: Mon, 7 Jan 2008 00:23:03 +0000 (UTC)
Message-ID: <loom.20080107T001557-159@post.gmane.org>
References: <f17812d70712201756h501a80cch8305d40fa479f5cf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

eric miao <eric.y.miao <at> gmail.com> writes:

> Early feedback is welcome, thanks!

Hi Eric

Overall the patch looks good, just a few comments.

The patch does not apply cleanly unless I remove the spurious newline before
line 1284 resulting in the following error:
patch: **** malformed patch at line 1284: pm_message_t state)

The DRCMR97 register is not defined anywhere, at lest not in 2.6.24-rc6:
drivers/mtd/nand/pxa3xx_nand.c:542: error: ‘DRCMR97’ undeclared (first use in
this function)

The registers and bit definitions should be moved to pxa-regs.h, not?

I had my troubles getting it to work on a custom PXA320 board. I kinda figured
out what platform data it needs, but still can't seem to get it to work properly:
pxa3xx-nand pxa3xx-nand: failed to detect flash

What kernel does your patch apply to? What CPUs/boards did you try it on? Can
you provide an example platform integration required to make it work?

Cheers

Marcel
