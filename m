Received: from mail.presenzia.net ([193.127.102.120])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeCXi-0003m7-W9
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 09:21:22 -0500
From: "Daniel Alomar" <dalomar@serrasold.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 21 Nov 2005 15:19:22 +0100
Message-ID: <004c01c5eea6$98d3db10$091a1bac@serra.es>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="US-ASCII"
Subject: Mounting errors
Reply-To: dalomar@serrasold.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

I'm trying to write a driver for my embedded board with a coldfire 5282. =
I'm
using uclinux with kernel 2.6.

With one driver I've this error:
...
Using /lib/modules/2.6.9-uc0/kernel/lib/crc32.ko
Command: insmod jffs2
Using /lib/modules/2.6.9-uc0/kernel/fs/jffs2/jffs2.ko
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
Command: mount -t jffs2 /dev/mtdblock3 /home
Command: sh /home/rcd
Shell invoked to run file: /home/rcd
/home/rcd: No such file or directory
Execution Finished, Exiting

Sash command shell (version 1.1.1)
/> Chip reports improper command sequence: status 0x70
Erase at 0x00480000 failed immediately: errno -5
Chip reports improper command sequence: status 0x70
Erase at 0x00460000 failed immediately: errno -5
Chip reports improper command sequence: status 0x70
Erase at 0x00440000 failed immediately: errno -5
Chip reports improper command sequence: status 0x70
...


And with the other one this at mount time:
...
Command: insmod jffs2
Using /lib/modules/2.6.9-uc0/kernel/fs/jffs2/jffs2.ko
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
Command: mount -t jffs2 /dev/mtdblock3 /home
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004:
0xffff instead
Empty flash at 0x00000008 ends at 0x0000000c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c:
0xffff instead
Empty flash at 0x00000010 ends at 0x00000014
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014:
0xffff instead
Empty flash at 0x00000018 ends at 0x0000001c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c:
0xffff instead
Empty flash at 0x00000020 ends at 0x00000024
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024:
0xffff instead
Empty flash at 0x00000028 ends at 0x0000002c =20
....

Any help will be welcome :-)

Regards,

Daniel Alomar i Claramonte
Research & Development Electronic Dept.
SERRA SOLDADURA, S.A.
WEB Site: http://www.serrasold.com
Knowledge Site: http://serratron.serrasold.com=20
