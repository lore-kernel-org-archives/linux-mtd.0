Received: from [202.106.187.156] (helo=sina.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IhGM-0003EC-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 03:56:35 +0100
Message-ID: <001c01c2134d$6811ed10$8ea8a8a8@yuanfei>
From: "Sleepy" <sleepygod@sina.com>
To: <linux-mtd@lists.infradead.org>
Subject: MTD 16M Flash module detection error?
Date: Fri, 14 Jun 2002 10:44:21 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I have a flash module come with Linkup7205SDB, which got total 8 AM29LV160DT
chips on it. We use it in 32bit mode 4way interleave. But some how I only
can detect the first 8M, the kernel give me the following messages:



Physmap flash device: 1000000 at 80000000

Physically mapped flash: Found 4 x16 devices at 0x0 in 32-bit mode
Amd/Fujisu Extended Query Table v1.0 at 0x0040

Physically mapped flash: JEDEC Device ID is 0xc4. Assuming broken CFI table.

Physically mapped flash: Swapping erase regions for broken CFI table.

Number of CFI chips: 1

0: offset=0x0, size=0x40000 blocks=31

1: offset=0x7c0000, size=0x20000 blocks=1

2: offset=0x7e0000, size=0x8000 blocks=2

3: offset=0x7F0000, size=0x10000 blocks=1



Creating 2 MTD partitions on "Physically mapped flash":

0x00000000 - 0x00200000 : "MYMTD0"

mtd: Giving out device 0 to MYMTD0

0x00200000 - 0x01000000 : "MYMTD1"

mtd: partition "MYMTD1" extends beyond the end of device "Physically mapped
flash" ------ size truncated to 0x600000

mtd: Giving out device 1 to MYMTD1

.

.

.



does any one know why I can not use the other 8M on the module?

thanks
