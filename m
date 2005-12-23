Received: from uproxy.gmail.com ([66.249.92.206])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EpcVC-0001dX-GU
	for linux-mtd@lists.infradead.org; Thu, 22 Dec 2005 21:17:54 -0500
Received: by uproxy.gmail.com with SMTP id m3so126892ugc
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Dec 2005 18:17:49 -0800 (PST)
From: husamsenussi@gmail.com
To: linux-mtd@lists.infradead.org
Date: Fri, 23 Dec 2005 02:11:11 +0000
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200512230211.11487.husamsenussi@gmail.com>
Subject: DiskOnChip Millennium Plus 64M in OMAP1510 device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm having problem loading the MDOC + driver, for some reason the driver=20
returning the wrong flash ID.

This is what I see in my log file

Jan =A01 00:18:32 h6300 user.info kernel: Flash chip found: Manufacturer ID=
: 98,=20
Chip ID: A5 (Toshiba:NAND 2GiB 1,8V 8-bit)
Jan =A01 00:18:32 h6300 user.info kernel: Flash chip found: Manufacturer ID=
: 98,=20
Chip ID: A5 (Toshiba:NAND 2GiB 1,8V 8-bit)
Jan =A01 00:18:32 h6300 user.info kernel: 2 flash chips found. Total DiskOn=
Chip=20
size: 0 MiB


I'm running linux 2.6.14.3 in iPAQ h6340 with OMAP1510 processer, and I'm=20
using the old driver because the new only support 16M

Thanks.
