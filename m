Received: from msr21.hinet.net ([168.95.4.121] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Xd8X-0000rA-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 08:34:13 +0100
Received: from stevexp (61-219-230-90.HINET-IP.hinet.net [61.219.230.90])
	by msr.hinet.net (8.9.3/8.9.3) with ESMTP id PAA16613
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 15:34:50 +0800 (CST)
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: nand_write_ecc
Date: Thu, 25 Jul 2002 15:33:41 +0800
Message-ID: <002801c233ad$a2d39810$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

I am using NAND flash as a root file system. When I and flash a new root
image to NAND flash and reboot the system. I copy a file to flash and
the system halt.  I got the following message when I operate the board. 
When nand_write_ecc  was called, I will print out message as,
"nand_write_ecc: col=%d last=%d page=%x ecc_code=%x %x %x %x %x %x". I
think the first nand_write_ecc was called by GC and when I copy the file
nand_write_ecc was called again. But as the following message, the two
calls write to the same page 0x18FF. Why they write the same page?

Steve Tsai


/home> cd /bin
nand_write_ecc: col=0 last=512 page=18ff ecc_code=c3 33 f ff ff ff

/bin>
/bin>
/bin>
/bin> cp test test3
ARGH. About to write node to 0x0011fe90 on flash, but there's data
already there
:
0x0011fe90: 85 19 04 20 70 01 00 00 1a f5 30 d9 ff ff ff ff
nand_write_ecc: col=0 last=512 page=18ff ecc_code=ff c0 f c0 c0 ff
nand_write_ecc: Failed write verify, page 0x000018ff
<2>jffs2_flush_wbuf(): Writ
e failed with -5
nand_write_ecc: col=0 last=512 page=18ff ecc_code=ff c0 f c0 c0 ff
nand_write_ecc: Failed write verify, page 0x000018ff
<2>jffs2_flush_wbuf(): Writ
e failed with -5
Write of 2269 bytes at 0x0044400c failed. returned -5, retlen 0
Not marking the space at 0x0044400c as dirty because the flash driver
returned r
etlen zero
