Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L8ce1-0001fP-4I
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 15:31:05 +0000
Received: from dlep95.itg.ti.com ([157.170.170.107])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id mB5FUvMf002455
	for <linux-mtd@lists.infradead.org>; Fri, 5 Dec 2008 09:31:02 -0600
Received: from dlee75.ent.ti.com (localhost [127.0.0.1])
	by dlep95.itg.ti.com (8.13.8/8.13.8) with ESMTP id mB5FUv67000076
	for <linux-mtd@lists.infradead.org>;
	Fri, 5 Dec 2008 09:30:57 -0600 (CST)
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 5 Dec 2008 09:30:54 -0600
Subject: Support for NAND devices > 4GB
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08025211EC67@dlee06.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All,

I have a Samsung NAND chip part number (K9WBG08U1M) which is a 32GB NAND ch=
ip with 4K page sizes.  It looks like it is actually 2 chips together as it=
 is reported in the kernel as having "2 NAND chips detected".  The kernel i=
s properly detecting the 4K page size but it seems like there is a limitati=
on in the mtd_info structure of 4GB for the size of the NAND.  Can anyone t=
ell me if there is support in the Linux MTD system for NAND devices greater=
 than 4GB?  Does anyone have a patch I could look at for this?

I have tried changing the size element in the mtd_info structure to u_int64=
_t and then changing the code in YAFFS2 and in the add_mtd_partitions funct=
ion to use do_div for the division of the size element but still no success=
.

I am working in a 2.6.10 kernel (which I cannot update) and will back port =
any patches people may have.

Again, any help that could be offered here would be greatly appreciated.

Sincerely,
Chase Maupin
