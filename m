Received: from shawidc-mo1.cg.shawcable.net ([24.71.223.10]
	helo=pd5mo1so.prod.shaw.ca)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AYtyn-0004kl-LI
	for linux-mtd@lists.infradead.org; Tue, 23 Dec 2003 21:22:13 +0000
Received: from pd3mr2so.prod.shaw.ca (pd3mr2so-ser.prod.shaw.ca
	[10.0.141.178])2003))linux-mtd@lists.infradead.org;
	Tue, 23 Dec 2003 14:16:19 -0700 (MST)
Received: from shaw.ca (pd2ms2so-con.prod.shaw.ca [10.0.122.118])
 by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28 2003))
 with ESMTP id <0HQD00K029R7RI@l-daemon> for linux-mtd@lists.infradead.org;
 Tue, 23 Dec 2003 14:16:19 -0700 (MST)
Date: Tue, 23 Dec 2003 13:16:19 -0800
From: thomaspang@shaw.ca
To: linux-mtd@lists.infradead.org
Message-id: <50b0e50521.5052150b0e@shaw.ca>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-language: en
Content-transfer-encoding: 7BIT
Content-disposition: inline
Subject: Segmentation fault with mtd-snapshot-20031222
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have tried the latest MTD (snapshot dated 12/22/2003) and got the following error messages when I mounted and accessed the JFFS2 file system.  After getting those errors, the "ls" command is not working anymore.  

Any idea?  Thanks.



# mount -t jffs2 /dev/mtdblock3 /mnt
mtdblock_open
ok
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00051000: 0xc38f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00051004: 0xfa34 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00051008: 0x18d9 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005100c: 0xea31 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00051010: 0xd01e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00051014: 0x3a50 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00051018: 0xc271 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0005101c: 0x017f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00051020: 0x7a20 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00051024: 0x9eb2 instead
Further such events for this erase block will not be printed
# cd mnt
# ls
Chip not ready after erase suspended: status = 0x614c
end_request: I/O error, dev 1f:02 (mtdblock), sector 128
Error -5 while decompressing!
c014fe22(2322)->c0259000(4096)
Error -3 while decompressing!
c0150734(2587)->c0258000(4096)
Error -3 while decompressing!
c015114f(2506)->c0257000(4096)
ls: Success
ls: pc : [<00053b48>]    lr : [<00053b20>]    Not tainted
sp : bffffd84  ip : bffffd84  fp : bffffd98
r10: 00000000  r9 : 00000001  r8 : bffffe70
r7 : bffffda0  r6 : 0006d8b8  r5 : 00000008  r4 : bffffda0
r3 : 00000008  r2 : 00000000  r1 : bffffdec  r0 : bffffda0
Flags: nZCv  IRQs on  FIQs on  Mode USER_32  Segment user
Control: 571FF  Table: 062E8000  DAC: 00000015
Segmentation fault
