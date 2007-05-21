Received: from ug-out-1314.google.com ([66.249.92.171])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hq5G3-0000Ne-Ul
	for linux-mtd@lists.infradead.org; Mon, 21 May 2007 06:36:57 -0400
Received: by ug-out-1314.google.com with SMTP id m2so857639uge
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 May 2007 03:36:54 -0700 (PDT)
From: borasah@gmail.com
To: linux-mtd@lists.infradead.org
Subject: 128 MiB NAND flash - all eraseblocks bad
Date: Mon, 21 May 2007 13:44:02 +0300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200705211344.02914.borasah@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

After I did some progress on 64MiB NAND flash on the eval board(Au1200 - 
DB1200), I decided to try my chance on our custom board. 

The NAND part we use in our custom board is K9F1G08U0A. It has (2K + 64) page 
size and (128K + 4K) eraseblock size.

Kernel -> 2.6.20.1. Error messages:
	NAND device: Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND 128MiB 3,3V 
	8-bit)
	Scanning device for bad blocks
	Bad eraseblock 0 at 0x00000000
	Bad eraseblock 1 at 0x00020000
	...
	Bad eraseblock 1022 at 0x07fc0000
	Bad eraseblock 1023 at 0x07fe0000
	Creating 2 MTD partitions on "NAND 128MiB 3,3V 8-bit":
It marks all the eraseblocks as BAD. I tried it in 2.6.11 but the same...

The first thing I suspect was timings. I examined processor and NAND 
datasheets; seems processor NAND block timing paramters are slower than 
equivalent NAND flash timing paremeters.  Also the driver can access 
manufacturer id etc. So I think it shouldnt be a problem. Then I debugged 
"nand_scan"(linux-2.6.11) a bit and reached to the point that there may be 
some wrong things in "au1xxx_nand_command". What may be the cause of these 
error messages? Where should I look at?

Thanks...

--
Bora SAHIN
