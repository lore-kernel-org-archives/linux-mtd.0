Received: from pd9e41ed8.dip.t-dialin.net ([217.228.30.216] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1723t1-0006Y5-00
	for <linux-mtd@lists.infradead.org>; Mon, 29 Apr 2002 06:39:44 +0100
Message-Id: <200204290544.g3T5itB05294@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "" <cafe@eyou.com>, linux-mtd@lists.infradead.org
Subject: Re: the structs of MTD
Date: Mon, 29 Apr 2002 07:44:55 +0200
References: <20020429103500.62790.qmail@eyou.com>
In-Reply-To: <20020429103500.62790.qmail@eyou.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Monday, 29. April 2002 04:35,  wrote:
> Hi, I'm new to linux-mtd.
> I have a SAMSUNG  k9F5608U0M flash, 32M NAND Flash Memory.
> But the difficulty is I know little about the structs of MTD , such as
> struct mtd_chip_driver.
> So I don't know how to drive it . can you  explain these interrelated
> struct ?
> By the way, please explain detailedly how to drive the forenamed NAND Flash
> Memory ?
This chip is supported by the generic NAND driver already. You need just a 
driver for your specific hardware, where you supply baseaddress and access to 
CE, ALE and CLE pins. Have a look at drivers/mtd/nand/nand.c (generic nand 
driver) and drivers/mtd/nand/autcpu12.c (example for a hardware driver). Use 
latest CVS code. It contains all enhancements for NAND support.

The important pieces of the hardware driver are

void autcpu12_hwcontrol(iCONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_NAND=y
nt cmd)
This is the function, which supplies the manipulation of CE, CLE and ALE pins.

int __init autcpu12_init (void)
This is the main init function of the hardware driver
The main points of this function are
	/* map physical adress */
	autcpu12_fio_base=(unsigned long)ioremap(autcpu12_fio_pbase,SZ_1K);
Remaps the physical base address to a virtual address for driver usage

	/* Set address of NAND IO lines */
	this->IO_ADDR_R = autcpu12_fio_base;
	this->IO_ADDR_W = autcpu12_fio_base;
Set the address for read / write access to the chips data bus. In most cases 
the base address.

	this->hwcontrol = autcpu12_hwcontrol;
Set the function for access to controllines (CE, CLE, ALE)

	this->dev_ready = autcpu12_device_ready;
Give the function to read the ready/busy pin of the chip. If you do not have 
access to this pin set it to NULL.
	/* 20 us command delay time */
	this->chip_delay = 20;
Give a appropriate command delay time according to the chips datasheet.

Supply partitioning information, if you want to use more than one partition 
on the chip.

Following CONFIG's should be set
CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y	<--- if you want to use partitions
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_JFFS2=y <-- If you want to use JFFS2, which is recommended
CONFIG_MTD_NAND_AUTCPU12=y <-- Replace this by your hardware driver

For JFFS2 usage set
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_NAND=y

Enjoy.
-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
