Received: from web61207.mail.yahoo.com ([216.155.196.131])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CpP0M-0008EL-VM
	for linux-mtd@lists.infradead.org; Fri, 14 Jan 2005 05:48:36 -0500
Message-ID: <20050114104833.41929.qmail@web61207.mail.yahoo.com>
Date: Fri, 14 Jan 2005 02:48:32 -0800 (PST)
From: matrix lau <matrix_lau@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: 2k Page support for the mtd driver
Reply-To: matrix_lau@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

I am using the 2K page nand flash [NAND device:
Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND
128MiB 3,3V 8-bit)] in the ARM system, and the nand
driver was modified according to the NAND controller.

Now, I face a problem in mounting the JFFS2 system.
After program the JFFS2 to the mtdblock/2 by the
following cmd: dd if=JFFS2_FILE of=/dev/mtdblock/2
bs=128, then I mount it, the first time, it's ok.

However after umount then I mount it again, it can't
be mount again and with the following message: 

mount: wrong fs type, bad option, bad superblock on
/dev/mtdblock/2, or too many mounted file systems

I try with the 512 page device and it's ok, but
problems exists in 2Kpage nand.


Can any one help in the above issue?

Thanks
Matrix

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
