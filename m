Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Adfch-00027l-I6
	for linux-mtd@lists.infradead.org; Tue, 06 Jan 2004 01:03:07 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: Amit Mistry <amit@einfochips.com>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 6 Jan 2004 14:07:51 +1300
References: <001a01c3d1b6$0dd6a650$db09a8c0@local.einfochips.co.in>
In-Reply-To: <001a01c3d1b6$0dd6a650$db09a8c0@local.einfochips.co.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040106010054.5A2C9159D6@desire.actrix.co.nz>
Subject: Re: mtd char and block both on same nand flash
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 03 January 2004 17:57, Amit Mistry wrote:
> I have to write the MTD NAND driver for K9x1208 FLASH chip. Now, the
> requirement is some of the blocks of FLASH need to be accessed like raw
> block access as they contains bootloader and rest of the blocks will be
> accessed through YAFFS file system. How can I access the some of the blocks
> with raw FLASH access method and rest with some file system? May be the
> correct question is: How can I distribute the whole NAND flash in a char
> device for few blocks and block device for rest of the blocks?  In MTD
> directory of linux kernel source, there are mtdchar.c and mtdblock.c they
> provide the functionality of char and block driver. Can I use the mtdchar.c
> and mtdblock.c of MTD layer or they are samples?  I would appreciate if you
> can help me out. Thanks in advance.

The mtdchar laye gices you the ability to read/write data to flash from user 
space.

The mtdblock stuff is only as a way to pass a name into JFFS2 or YAFFS for 
mounting the file system.

Probably he best way to achieve what you want is to partition the device into 
two partitions, one for the bootloader and one for YAFFS.

-- Charles
