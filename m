Received: from wproxy.gmail.com ([64.233.184.193])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Ca0WI-0003W4-23
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2004 18:37:55 -0500
Received: by wproxy.gmail.com with SMTP id 37so1307025wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Dec 2004 15:37:52 -0800 (PST)
Message-ID: <4de512b704120215377738f4ed@mail.gmail.com>
Date: Thu, 2 Dec 2004 16:37:52 -0700
From: Vernon Fuller <vernonfuller@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: mkfs.jffs2 missing magic?
Reply-To: Vernon Fuller <vernonfuller@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I compiled the latest mkfs.jffs2 and run it as 
mkfs.jffs2 -l -e 128KiB  -d /opt/src/romfs -o /opt/src/images/root.jffs
and load the image at 0x000240000 on my intel 28F640 J3 A (8Meg strata flash) 

the image I make has lots of Magic bitmasks in it, just not at the offsets 
jffs2_scan_eraseblock is looking for. 
image at 0x240000:
85 19 03 20 0C 00 00 00 B1 B0 1E E4 85 19 01 E0 
2B 00 00 00 E6 6E 26 7D 01 00 00 00 00 00 00 00 
02 00 00 00 2A 98 AF 41 03 04 00 00 EC 36 A8 A5 
FF 83 66 55 62 69 6E FF 85 19 02 E0 44 00 00 00 
1D FB F7 98 02 00 00 00 01 00 00 00 FD 41 00 00 
F5 01 F5 01 00 00 00 00 2A 98 AF 41 2A 98 AF 41 
2A 98 AF 41 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 AE A9 C8 14 85 19 01 E0 
2B 00 00 00 E6 6E 26 7D 01 00 00 00 01 00 00 00 
03 00 00 00 25 98 AF 41 03 04 00 00 BE F9 45 49 
17 28 32 EE 64 65 76 FF 85 19 02 E0 44 00 00 00 


jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240020:
0x0002 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240024:
0x2818 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0024002c:
0x4b3c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240030:
0x7001 instead

Which is right, mkfs.jffs2 or linux?  or do I not know how to use mkfs.jffs2?
