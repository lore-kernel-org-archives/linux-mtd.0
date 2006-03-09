Received: from mxs2.siemens.at ([194.138.12.133])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FHNzN-0001OH-Fx
	for linux-mtd@lists.infradead.org; Thu, 09 Mar 2006 11:27:54 -0500
Received: from vies1k7x.sie.siemens.at ([158.226.129.83])
	by mxs2.siemens.at  with ESMTP id k29GRgrT007391
	for <linux-mtd@lists.infradead.org>; Thu, 9 Mar 2006 17:27:42 +0100
Received: from nets139a.ww300.siemens.net ([158.226.129.98])
	by vies1k7x.sie.siemens.at (8.12.11/8.12.1) with ESMTP id
	k29GRVuf022889
	for <linux-mtd@lists.infradead.org>; Thu, 9 Mar 2006 17:27:42 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 9 Mar 2006 17:27:33 +0100
Message-ID: <38F58D7B92CB20438DF49D28B572CC6F13C49E@budgw09a.ww300.siemens.net>
From: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
To: <linux-mtd@lists.infradead.org>
Subject: SMC and BonFS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

I'm working with a developer board (Embest S3CEB2410 with S3C2410 =
processor) which has a SmartMedia Card
interface and is able to boot from it. Embest supplied a boot manager =
called Vivi with the board, and this boot manager can make BonFS =
partitions/fs.

I'm quite confused, because I don't know what bonfs is: I could locate =
no documentation on the web.=20

This command is used to create bonfs partitions on the SMC: (after =
booting from the SMC)
vivi> bon part 0 192k 1M

creates three partitions for vivi+param, kernel and the root filesystem.
According to vivi, this is the bonfs partition table: (on a 64MB SMC)
vivi> bon part info

BON info. (3 partitions)
No: offset      size            flags     bad
---------------------------------------------
 0: 0x00000000  0x00030000      00000000    0  192k
 1: 0x00030000  0x000d0000      00000000    0  832k
 2: 0x00100000  0x03efc000      00000000    0   62M+1008k

But Vivi also has an other set of tools, called "part". These tools are =
for manipulating MTD partitions:
vivi>part show

mtdpart info. (4 partitions)
name              offset        size        flag
------------------------------------------------
vivi            : 0x00000000    0x00020000     0  128k
param           : 0x00020000    0x00010000     0   64k
kernel          : 0x00030000    0x000c0000     0  768k
root            : 0x00100000    0x00140000     4    1M+256k

This has four partitions: the vivi and param partitions are merged in =
the list of bonfs. Partition sizes don't match: vivi+param=3D192k, but =
kernel is smaller than 832 (the difference is 64KB), and root partition =
is extremely small. Now I can't see the relationship between between =
Bonfs and mtd partitions. Is anybody here who 's seeing?

I would be very grateful if someone could tell me what are bonfs and mtd =
partitions meaning, what are the differences between them, and a few =
links on bonfs and/or mtd partitions are also welcome. Why do we need to =
use bonfs on SMC, if is it needed? My goal is to create such a bootable =
SMC which mounts its root filesystem from the root partition of the SMC, =
and this partition should be either JFFS(2) or cramfs. cramfs is now =
mounted perfectly, but I want to avoid using bonfs (since I don't what =
it's all about). Is it possible to simply partition (mtd) the SMC and to =
boot from that and mount a root filesystem?

Many thanks

Bye
--
Tamas Selmeci
Siemens PSE HU
Tel.   : +36-1-471-3861
Email  : tamas.selmeci@siemens.com
Address: H-1143 Budapest, Gizella ut 51-59
