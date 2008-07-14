Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KILNb-0002JO-44
	for linux-mtd@lists.infradead.org; Mon, 14 Jul 2008 10:34:03 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: Regarding NAND driver based on PrimeCell Static Memory
	Controller (PL350 series)
Date: Mon, 14 Jul 2008 03:33:57 -0700
Message-ID: <E06E3B7BBC07864CADE892DAF1EB0FBD095146C0@NT-SJCA-0752.brcm.ad.broadcom.com>
In-Reply-To: <1215797959.11567.448.camel@pmac.infradead.org>
References: <20080711223448.f5826678.yoichi_yuasa@tripeaks.co.jp>
	<20080711141053.GD13593@linux-mips.org>
	<1215797959.11567.448.camel@pmac.infradead.org>
From: "Divyanshu Verma" <dverma@broadcom.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20
Hi,
I am trying to implement a NAND driver for our SOC. The problem I am
facing is that, our NAND controller does not allow me to have access to
hardware specific control line. In other words, I cannot follow the
mechanism given on http://www.linux-mtd.infradead.org/ for NAND driver
as I cannot write  "my_nand_hwcontrol"  function. The H/w guys say that
all this is taken care in the controller itself.

I then decided to identify the NAND Chip as a MTD_BLOCK device, so that
I  will not require any Hwcontrol function. Now for doing so, is it
possible to write a kernel module for NAND which can use functions
exported by mtd/mtd_blkdevs.c ?

 =20
My very  cordial thanks for any heads up on this as I am struggling for
a long time.

Just for info I am using ARM PrimeCell Static Memory Controller (PL350
series) as NAND controller.They way h/w guys have designed it is that it
doesn't provide me access to HWCONTROL functions.


Thanks and regards,
Divyanshu=20
