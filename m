Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D7UBU-00071X-T8
	for linux-mtd@lists.infradead.org; Sat, 05 Mar 2005 02:58:49 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: kyungmin.park@samsung.com
In-Reply-To: <0ICU00GAFZ3KII@mmp2.samsung.com>
References: <0ICU00GAFZ3KII@mmp2.samsung.com>
Content-Type: text/plain
Date: Sat, 05 Mar 2005 08:58:41 +0100
Message-Id: <1110009521.4032.195.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: Trying to get 1Gb Samsung nand flash working
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-03-05 at 12:02 +0900, Kyungmin Park wrote:
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (<NULL> NAND 128MiB 3,3V
> 8-bi)
> NAND bus width 16 instead 8 bit
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND 128MiB 3,3V
> 8-b)
> Scanning device for bad blocks
> Creating 5 MTD partitions on "NAND 128MiB 3,3V 8-bit":
> 0x00000000-0x00010000 : "Booting Image"
> 0x00010000-0x00050000 : "U-Boot"
> 0x00050000-0x00080000 : "U-Boot Environment"
> 0x00080000-0x00280000 : "Kernel"
> 0x00280000-0x08000000 : "File System"

Can you please tell me the CVS $Id string from
drivers/mtd/nand/nand_bbt.c ?

tglx
