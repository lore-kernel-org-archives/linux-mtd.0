Received: from mail.professional-internet.de ([83.221.232.2]
	helo=hermes.professional-internet.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ECwO4-00073i-Q1
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2005 05:38:41 -0400
Received: from mailer.port.de ([195.4.0.127])
	by hermes.professional-internet.de (8.12.10/8.12.10) with ESMTP id
	j879QL6S017687
	for <linux-mtd@lists.infradead.org>; Wed, 7 Sep 2005 11:26:21 +0200
Received: from ulrich.port.de (ulrich.port.de [194.173.33.14])
	by mailer.port.de (8.12.10/8.12.7/SuSE Linux 0.6) with ESMTP id
	j879QLCQ005592
	for <linux-mtd@lists.infradead.org>; Wed, 7 Sep 2005 11:26:21 +0200
From: Ruediger Haertel <hae@port.de>
To: linux-mtd@lists.infradead.org
Date: Wed, 7 Sep 2005 11:26:29 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200509071126.30256.hae@port.de>
Subject: DiskOnChip - mount partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I have a DoC Mil+ 16MB. I am using 2.4.27-uc1 with this MTD=20
configuration:

CONFIG_MTD
CONFIG_MTD_PARTITIONS
CONFIG_MTD_CHAR
CONFIG_INFTL

CONFIG_MTD_DOC2001PLUS

The chip is correctly detected, after I removed the "2 way=20
interleave" in doc2001plus.c.
Then I did a=20
   nftl_format -b -i /dev/mtd5 98304
and
   docfdisk /dev/mtd5 50 0
which should give me /dev/mtd6 and /dev/mtd7 as far as I know.
However accessing /dev/mtd6 with
   eraseall /dev/mtd6
says: eraseall: /dev/mtd6: No such device

Device /dev/mtd6 has the following device files:
crw-------    1 0        0         90,  12 /dev/mtd6
brw-------    1 0        0         31,   6 /dev/mtdblock6
crw-------    1 0        0         90,  13 /dev/mtdr6

## snip - boot output

DiskOnChip Millennium Plus found at address 0x40000000                     =
                                                         =20
=46lash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba:NAND=20
16MB 3,3V)                                                         =20
1 flash chips found. Total DiskOnChip size: 16 MiB                         =
                                                         =20
INFTL: inftlcore.c $Revision: 1.13 $, inftlmount.c $Revision:=20
1.13 $                                                                =20
Partition check:                                                           =
                                                         =20
 inftla: unknown partition table

## snap

Do you have any hint what is going wrong or any pointer where I=20
should look.


=2D-=20
with best regards / salutations distingu=E9es / Cordiali Saluti /
med v=E4nliga h=E4lsningar / mit freundlichen Gruessen

Ruediger Haertel

+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
| port GmbH               phone +49 345 77755-0
| D-06132 Halle/Saale     mailto:service@port.de
| Germany                 http://www.port.de
| CAN Wiki                http://www.CAN-Wiki.info/
| ETHERNET Powerlink      http://www.epl-tools.com
| Newsletter:             http://www.port.de/register.html
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
