Received: from mlbmx2.corp.harris.com ([137.237.90.74])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161kIq-0002sZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2001 08:12:48 +0000
Message-ID: <8D4C69676E66D511A1CB00508BBBB192157887@ranmx1.ran.harris.com>
From: "Fend, Matthias" <mfend@harris.com>
To: 'linux mtd' <linux-mtd@lists.infradead.org>
Subject: AW: AW: doc 2000 unknown partition table 
Date: Thu, 8 Nov 2001 03:21:23 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

ok, i did some further test with the doc2000...

raw write/read on /dev/nftla works fine.

nftldump said this

<snip>
...
sh-2.03# ./nftldump /dev/mtd0=20
MTD_open
MTD_ioctl
NFTL Media Header found at offset 0x00100000:
NumEraseUnits:    64
FirstPhysicalEUN: 64
Formatted Size:   983040
UnitSizeFactor:   0xff
Second NFTL Media Header found at offset 0x00104000
MTD_ioctl
MTD_ioctl
MTD_ioctl
Unit 64 is free
MTD_ioctl
MTD_ioctl
MTD_ioctl
Unit 65 is free
MTD_ioctl
MTD_ioctl
...
<snap>

but if i use nandwrite i get this messages

<snip>
...
sh-2.03# ./nandwrite /dev/mtd0 eraseall.c 0x0
MTD_open
MTD_ioctl
MTD_ioctl
MTD_ioctl
MTD_ioctl
MTD_ioctl
MTD_ioctl
MTD_ioctl
MTD_ioctl
MTD_ioctl
ECC needs a full sector write (adr: 1000 size 1d2)
Unexpected EOF in input file
MTD_close
sh-2.03#
...
<snap>

if i re-read the file with nanddump i get the file but at some =
locations it
seems to be corrupted. for example :

<snip>
...

D@@@-- erase the whole of a MTD device

   Copyright (C) 2000 Arcom Control System Ltd

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FI
@ DER A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA =
02111-1307, USA

   $Id: eraseall.c,v 1.7 2001/04/25 07:11:19 ollie Exp $
*/
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <time.h>
#include <sys/ioctl.h>
#include <sys/mount.h>
#include <string.h>
#i
`di,h<
#include <getopt.h>

#include <linux/mtd/mtd.h>
...
<snap>


???

matthias

	-----Urspr=FCngliche Nachricht-----
	Von:	David Woodhouse [SMTP:dwmw2@infradead.org]
	Gesendet am:	Mittwoch, 7. November 2001 19:53
	An:	Fend, Matthias
	Cc:	'linux mtd'
	Betreff:	Re: doc 2000 unknown partition table=20



	mfend@harris.com said:
	> Partition check:
	>  nftla: unknown partition table

	That's normal after you've just done nftl_format - there will have =
been
no=20
	partition table on there. If you tried to write a partition table with =

	fdisk and it still said that, then there's something wrong. Check that =

	you can read and write the raw /dev/nftla device.=20

	Also, try using the nftldump utility (on /dev/mtd0) to check that the
	contents of the flash are sane.=20

	--
dwmw2
