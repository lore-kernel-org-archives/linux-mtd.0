Received: from [66.207.118.118] (helo=MAILSRVR.ositech.com)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GDmzC-0001Wj-EN
	for linux-mtd@lists.infradead.org; Thu, 17 Aug 2006 19:52:59 +0100
Subject: jffs2
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Aug 2006 14:52:30 -0400
Content-class: urn:content-classes:message
Message-ID: <007020085773234AAACE3B66E13C18E8D71D96@MAILSRVR.ositech.com>
From: "Katey Yu" <katey.Yu@ositech.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

What's wrong?


Creating 5 MTD partitions on " Intel flash memory":
0x00000000-0x00010000 : "bootloader"
0x00010000-0x000b0000 : "kernel"
0x000b0000-0x00200000 : "filesystem"
0x00004000-0x00008000 : "config"
0x00000000-0x00200000 : "complete flash"

# mount -t jffs2  /dev/mtdblock3 /var/tmp
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004:
0x000d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008:
0x300c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c:
0x0008 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010:
0x000a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014:
0x300d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018:
0x0006 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c:
0x0007 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020:
0x0004 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024:
0x1006 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000028:
0x2004 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002000:
0xc00d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002004:
0xd870 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002008:
0x6000 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000200c:
0x300c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002010:
0xb004 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002014:
0x5003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002018:
0x0002 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000201c:
0x001c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002020:
0x3038 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00002024:
0x20b4 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00002000 is not formatted. It will be erased
Cowardly refusing to erase blocks on filesystem with no valid JFFS2
nodes
mount: wrong fs type, bad option, bad superblock on /dev/mtdblock3,
       or too many mounted file systems
