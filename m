Received: from florence.buici.com ([206.124.142.26])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSYVI-0000aI-Tw
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2004 05:18:06 -0500
Date: Fri, 12 Nov 2004 02:18:03 -0800
From: Marc Singer <elf@buici.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20041112101803.GA27300@buici.com>
References: <20041111220146.GA1898@buici.com> <1100213473.5074.81.camel@thomas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1100213473.5074.81.camel@thomas>
Subject: Re: cmdlineparts and chip initialization order
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 11, 2004 at 11:51:13PM +0100, Thomas Gleixner wrote:
> Provide more detailed information, please. Switch on MTD debugging and
> add some MTD_DEBUG in the relevant places.

In this dmesg dump, you can see that the CMDLINE-PART stuff occurs
before the NAND driver is initialized and after the NOR driver.  I am
assuming that this is the reason that the nand driver doesn't receive
partitions.  Is this not the case?


lpd79524 flash device: 1000000 at 44000000
lpd79524_norflash: Found 1 x16 devices at 0x0 in 16-bit bank
lpd79524_norflash: Found 1 x16 devices at 0x800000 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
DEBUG-CMDLINE-PART: parse_cmdline_partitions top
DEBUG-CMDLINE-PART: parsing <2m(boot),-(root);lpd79524_nandflash:32k(apex)ro,-(>
DEBUG-CMDLINE-PART: partition 1: name <root>, offset 0, size ffffffff, mask fla0
DEBUG-CMDLINE-PART: partition 0: name <boot>, offset 0, size 200000, mask flags0
DEBUG-CMDLINE-PART: mtdid=<lpd79524_norflash> num_parts=<2>
DEBUG-CMDLINE-PART: parsing <32k(apex)ro,-(root)>
DEBUG-CMDLINE-PART: partition 1: name <root>, offset 0, size ffffffff, mask fla0
DEBUG-CMDLINE-PART: partition 0: name <apex>, offset 0, size 8000, mask flags 3
DEBUG-CMDLINE-PART: mtdid=<lpd79524_nandflash> num_parts=<2>
2 cmdlinepart partitions found on MTD device lpd79524_norflash
Creating 2 MTD partitions on "lpd79524_norflash":
0x00000000-0x00200000 : "boot"
mtd: Giving out device 0 to boot
0x00200000-0x01000000 : "root"
mtd: Giving out device 1 to root
NAND device: Manufacturer ID: 0x98, Chip ID: 0x75 (Toshiba NAND 32MiB 3,3V 8-bi)
Scanning device for bad blocks
mtd: Giving out device 2 to lpd79524_nandflash
