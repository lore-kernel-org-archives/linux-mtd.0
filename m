Received: from de01egw02.freescale.net ([192.88.165.103])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gplle-0001dz-Hm
	for linux-mtd@lists.infradead.org; Thu, 30 Nov 2006 08:16:47 -0500
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by de01egw02.freescale.net (8.12.11/de01egw02) with ESMTP id
	kAUDUEFw025995 for <linux-mtd@lists.infradead.org>;
	Thu, 30 Nov 2006 06:30:14 -0700 (MST)
Received: from zin33exm21.fsl.freescale.net (zin33exm21.ap.freescale.net
	[10.232.192.8])
	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP id kAUDFsMD004971
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Nov 2006 07:15:56 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: NOR read/write beyond end of flash partition
Date: Thu, 30 Nov 2006 18:45:53 +0530
Message-ID: <A4F93E6F2F2D4E4D8F6AF6C7562DDBD891559A@zin33exm21.fsl.freescale.net>
From: "Tigadi Kiran-r10350c" <R10350C@freescale.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>From linux-2.6.10/drivers/mtd/mtdchar.c file mtd_write routine is
implemented to check MTD size (if (*ppos =3D=3D mtd->size) and it will
return ENOSPC if you try to read beyond NOR MTD partition.

But mtd_read routine implemented in the same file does not have this
check. So when I try to read beyond end of NOR MTD partition it is
returning 0.=20

Please let me know if any code updates are required.


Regards,
Kiran
