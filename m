Received: from mail.dgt.com.pl ([195.117.141.2] helo=dgt.com.pl)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DOW1G-0005To-Jo
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 03:22:40 -0400
Message-ID: <42675482.1010908@dgt.com.pl>
Date: Thu, 21 Apr 2005 09:21:38 +0200
From: Wojciech Kromer <wojciech.kromer@dgt.com.pl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: jffs2 boot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there.

I have problem booting jffs2 device.
I can mount, read, write an test all files on my jffs2 mtd device,
but when i'm booting from it it says:


jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 
0x2705 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: 
0x4154 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c: 
0x322e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010: 
0x3720 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014: 
0x6570 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018: 
0x3220 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c: 
0x3033 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: 
0x2031 instead
......
Further such events for this erase block will not be printed
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 2, bad_blocks 0, c->nr_blocks 6


What's wrong? I've tried several mtd versions on linux-2.4.25 from denx.de
