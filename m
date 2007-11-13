Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IrnYn-00085Y-Tl
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 23:39:44 -0500
Received: from mail-irva-8.broadcom.com (mail-irva-8 [10.10.64.221]) by
	mail-irva-10.broadcom.com (Postfix) with ESMTP id 9C9B22AE for
	<linux-mtd@lists.infradead.org>; Mon, 12 Nov 2007 20:39:22 -0800 (PST)
Received: from NT-SJCA-0752.brcm.ad.broadcom.com (nt-sjca-0752
	[10.16.192.222]) by mail-sj1-12.sj.broadcom.com (Postfix) with ESMTP id
	4C5D620501 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2007
	20:39:22 -0800 (PST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: jffs2 warning messages
Date: Mon, 12 Nov 2007 20:39:20 -0800
Message-ID: <E06E3B7BBC07864CADE892DAF1EB0FBD0213A23C@NT-SJCA-0752.brcm.ad.broadcom.com>
From: "Saleemuddin Mohammad" <msaleem@broadcom.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
=20
I am newbie to the mtd drivers and flash devices. I am trying to figure
out the root cause of some of kernel=20
Warning messages that i am getting while accessing the flash.
I am using Intel flash JS28F128P33T85 and linux kernel 2.6.14.
=20
Following messages are seen on the console=20
=20
Node totlen on flash (0x00b000b0) !=3D totlen from node ref (0x00001044)
Node totlen on flash (0x00b000b0) !=3D totlen from node ref (0x00001044)
Node totlen on flash (0x00b000b0) !=3D totlen from node ref (0x00001044)
Node totlen on flash (0x00b000b0) !=3D totlen from node ref (0x00001044)
Node totlen on flash (0x00b000b0) !=3D totlen from node ref (0x00001044)
Node totlen on flash (0x00b000b0) !=3D totlen from node ref (0x00001044)
=20
I am able to probe the flash and having following partitions on the
flash.
=20
#
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00020000 00020000 "boot"
mtd1: 00020000 00020000 "env"
mtd2: 00020000 00020000 "nvram"
mtd3: 00280000 00020000 "os"
mtd4: 00d00000 00020000 "user"
mtd5: 00020000 00008000 "vpd"
      =20
After searching this I found similar issue in the archive and patch is
available for this.=20
Since the patch is for the nand flash devices and this is NOR flash
device I was just wondering=20
if this patch works for my board as well.=20
If this patch cannot be applied can you please let me know if there is
any work around to fix this.=20
=20
Please let me know if you need any more information on this.
=20
Your respones are highly appreciated!
=20
Thanks & Regards,
Saleem
=20
