Received: from ultra7.eskimo.com ([204.122.16.70])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HeTWq-0007pB-EX
	for linux-mtd@lists.infradead.org; Thu, 19 Apr 2007 11:06:17 +0100
Received: from [192.168.1.3] (c-24-22-32-76.hsd1.or.comcast.net [24.22.32.76])
	by ultra7.eskimo.com (8.14.0/8.14.0) with ESMTP id l3JA5tZc000334
	for <linux-mtd@lists.infradead.org>; Thu, 19 Apr 2007 03:05:55 -0700
Subject: Working with Intel 440BX Bios socket & flash parts
From: roger <roger@eskimo.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 19 Apr 2007 03:05:44 -0700
Message-Id: <1176977145.10132.33.camel@localhost2.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Scenario is an Intel 440BX/GX Motherboard with a STMicroelectronics 256k
Flash Part within the bios socket.

After loading the l440gx module, I can see:
/dev/mtd0
/dev/mtd0ro
/dev/mtdblock0


However, every time I try to access /dev/mtd0 in write mode, I get a
permission denied error.

Using stephan's work with the LinuxBios flashrom utility, flashrom will
"enable writing".  And then, I can view the contents of the bios
of /dev/mtd0 (ie. hexedit /dev/mtd0 or dd if=/dev/mtd0 of=bios.bin)
(Without using flashrom, /dev/mtd0 is just showing blank or "FF"
values.)

STMicroelectronics 256k Flash Part

# mtd_debug info /dev/mtd0
mtd.type = (unknown type - new MTD API maybe?)
mtd.flags = MTD_CAP_ROM
mtd.size = 1048576 (1M)
mtd.erasesize = 1048576 (1M)
mtd.writesize = 1 
mtd.oobsize = 0 
mtd.ecctype = MTD_ECC_NONE
regions = 0


If I'm not mistaken, I used to be able to dd if=/dev/null of=/dev/mtd0
bios flash parts of these with mtd a couple of years ago.

After putting a DOC2000 into the 32 DIP socket, I can write to the
DOC2000 modules without problem after using flashrom to enable writing
(or basically viewing or unhiding).

Am I forgetting something here?  Is there something more to writing to
the STMicroelectronics or Atmel at29c020 flash parts?


(On more minor note, I had to set the "clocksource=tsc" because the
linux kernel was setting to acpi_pm.  On modprobing l440gx, the clock
would stop with clocksource=acpi_pm.)

 
--
Roger
http://www.eskimo.com/~roger/index.html
Key fingerprint = 8977 A252 2623 F567 70CD 1261 640F C963 1005 1D61

Thu Apr 19 02:59:17 PDT 2007
