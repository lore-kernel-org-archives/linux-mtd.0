Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qEkc-0000EQ-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 14:45:38 +0100
Received: from mail.utfors.se ([195.58.103.125])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qEka-0000EG-00
	for mtd@infradead.org; Thu, 19 Apr 2001 14:45:36 +0100
Received: from Win1 (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id PAA29595
	for <mtd@infradead.org>; Thu, 19 Apr 2001 15:44:31 +0200 (MET DST)
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <mtd@infradead.org>
Subject: mkfs.jffs2 again
Date: Thu, 19 Apr 2001 15:44:35 +0200
Message-ID: <000e01c0c8d6$dfb791c0$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1991.987680017@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

If I run mkfs.jffs2 on my PC(rh 7) I get this
when I mount it on my RPX(PPC860) board:
sh-2.03# mount -t jffs2 /dev/mtdblock0 mtdblock0/
mtdblock_open
ok
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
0x8519 inst
ead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004:
0x4400 inst
ead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008:
0x1dfb inst
ead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c:
0x0100 inst
ead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010:
0x0100 inst
ead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014:
0xed41 inst
ead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020:
0xf4de inst
ead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024:
0x9bde inst
ead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000028:
0x9bde inst
ead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000040:
0xfc56 inst
ead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
JFFS2: Erase block at 0x00008000 is not formatted. It will be erased
JFFS2: Erase block at 0x00010000 is not formatted. It will be erased
JFFS2: Erase block at 0x00018000 is not formatted. It will be erased
JFFS2: Erase block at 0x00020000 is not formatted. It will be erased
JFFS2: Erase block at 0x00028000 is not formatted. It will be erased
JFFS2: Erase block at 0x00030000 is not formatted. It will be erased
JFFS2: Erase block at 0x00038000 is not formatted. It will be erased

Then if I run mkfs.jffs2 on my RPX board I only get a few:
JFFS2: Erase block at 0x00000800 is not formatted. It will be erased

which I think is normal.


Can this be an big/little endian issue?



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
