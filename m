Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WG8i-0001W8-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 13:21:00 +0000
Received: from dagobert.svc.sysgo.de ([172.22.1.2])
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with ESMTP id h08Dpml05879
	for <linux-mtd@lists.infradead.org>; Wed, 8 Jan 2003 14:51:48 +0100
Date: Wed, 8 Jan 2003 14:51:48 +0100 (MET)
From: Armin Schindler <acs@sysgo.de>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: JFFS2 and NAND problems
Message-ID: <Pine.LNX.4.21.0301081436360.5479-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hello,

I use the latest CVS MTD together with a 16MB NAND Flash and
JFFS2. Creating and reading files seems to work very good,
but when I want to remove files I get error messages like:

 Short write in obliterating obsoleted node at 0x00876804: 20
and
 Node totlen on flash (0x00000002) != totlen in node ref (0x000002dc)

After umount, when I try to mount it again I get:

Empty flash at 0x0082bbf8 ends at 0x0082bc00
jffs2_scan_eraseblock(): Node at 0x008341fc {0x1985, 0xe002, 0x00000002) has invalid CRC 0x00000004 (calculated 0x3b50c69b)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00834214: 0x01f5 instead

If "Verify NAND page writes" is enabled, and I try to write the
response is: 
Write error in obliterating obsoleted node at 0x00ff800c: -5
Write of 2151 bytes at 0x00ff875c failed. returned -5, retlen 0
Not marking the space at 0x00ff875c as dirty because the flash driver returned retlen zero
ARGH. About to write node to 0x00ff875c on flash, but there are data already the re:
0x00ff875c: 19 85 e0 02 00 00 08 67 ce 51 d9 44 00 00 00 02

When I use e.g. ext2 or store data directly with the mtd character
device, the flash doesn't show any problem.

When using an AMD 1MB NOR Flash with JFFS2 the problem doesn't appear.

It seems to be a problem of JFFS2 together with the NAND flash.
Could this be something with a wrong block size ?

Thanks for any help. 

Armin


Armin Schindler <acs@sysgo.de>
SYSGO AG
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany
phone: +49 6136 9948-0
fax  : +49 6136 9948-10
http://www.sysgo.de
http://www.elinos.com
