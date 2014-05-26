Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp39i-0000kT-IE
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:14:07 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id DA2DB423C2F5
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:13:41 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/27] Fix common bug in most nand drivers not showing a
 device in sysfs
Date: Tue, 27 May 2014 00:12:25 +0200
Message-Id: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


A comment in mtdcore.c function add_mtd_device() which is called by
mtd_device_parse_register() made me wonder:

"Caller should have set dev.parent to match the physical device."

In fact this is not done by most nand drivers.

What follows is a series which fixes this.

Tested: orion and omap2
Compile-Tested: atmel, gpio, fsmc, gpmi, plat, pxa3xx, s3c2410, sh_flctl,
		sharpsl, tmio, docg4, davinci, lpc32xx_mlc, lpc32xx_slc, mxc
Not tested at all (only be view, patches 19-27): bcm47, fsl_elbc, fsl_upm,
		fsl_ifc, jz4740, mpc5121m, ndfc, txx9ndfmx, socrates

The overall stat is

27 files changed, 36 insertions(+), 80 deletions(-)

and it fixes 21 of these bugs.

Regards,

Alexander Holler
