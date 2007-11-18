Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1ItiLC-0007ro-NC
	for linux-mtd@lists.infradead.org; Sun, 18 Nov 2007 06:29:37 -0500
Received: from mail-irva-8.broadcom.com (mail-irva-8 [10.10.64.221]) by
	mail-irva-10.broadcom.com (Postfix) with ESMTP id C226F2AE for
	<linux-mtd@lists.infradead.org>; Sun, 18 Nov 2007 03:29:12 -0800 (PST)
Received: from NT-SJCA-0752.brcm.ad.broadcom.com (nt-sjca-0752
	[10.16.192.222]) by mail-sj1-12.sj.broadcom.com (Postfix) with ESMTP id
	42E5920502 for <linux-mtd@lists.infradead.org>; Sun, 18 Nov 2007
	03:29:06 -0800 (PST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: Flash error messages.
Date: Sun, 18 Nov 2007 03:29:04 -0800
Message-ID: <E06E3B7BBC07864CADE892DAF1EB0FBD022D1B6F@NT-SJCA-0752.brcm.ad.broadcom.com>
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

I observing following kernel warning messages while trying to boot the
image.
I am using Intel flash JS28F128P33T85 and linux kernel 2.6.14.
=20
Following messages are seen on the console=20
=20
Node header CRC failed at 0029d330. But it must have been OK earlier.
Node was: { 00b0, 20b0, 00b000b0, 00b000b0 }
Node totlen on flash (0x00b000b0) !=3D totlen from node ref (0x00000444)
jffs2_do_read_inode(): No data nodes found for ino #6
Node header CRC failed at 00cc8948. But it must have been OK earlier.
Node was: { 00b0, 20b0, 00b000b0, 00b000b0 }
Node totlen on flash (0x00b000b0) !=3D totlen from node ref (0x000000dc)
jffs2_do_read_inode(): No data nodes found for ino #11
=20
Have you ever seen these messages? Please let me know your expert advice
on this?

Thanks & Regards,
Saleem
=20
