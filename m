Received: from [2002:d412:e8ba::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BtQf9-0007Ru-5f
	for linux-mtd@lists.infradead.org; Sat, 07 Aug 2004 08:51:04 -0400
Date: Sat, 7 Aug 2004 13:50:56 +0100
From: Russell King <rmk+lkml@arm.linux.org.uk>
To: Linux Kernel List <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org
Message-ID: <20040807135056.C2805@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: 
Subject: [BUG] 2.6.8-rc3 redboot.c tries to kmalloc 256K
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

With 2.6.8-rc3, I'm unable to mount the jffs2 root filesystem on one of
my test systems.  The system uses redboot, so has a redboot partition
table.  However, the kernel was not detecting the table.

After prodding about for a while, I've found that redboot.c seems to
be trying to kmalloc 256K of memory.   The largest size that kmalloc
supports is 128K on MMUfull systems.

static int parse_redboot_partitions(struct mtd_info *master,
                             struct mtd_partition **pparts,
                             unsigned long fis_origin)
{
	...
printk("erasesize: %d\n", master->erasesize);
        buf = kmalloc(master->erasesize, GFP_KERNEL);

        if (!buf)
                return -ENOMEM;

produces:

sa1100-0: Found 2 x16 devices at 0x0 in 32-bit bank
 Intel/Sharp Extended Query Table at 0x0031
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
SA1100 flash: CFI device at 0x00000000, 32MiB, 32-bit
CFI: Found no sa1100-1 device at location zero
cmdlinepart: c03e69ec
cmdlinepart: returned -22
RedBoot: c03e69d8
erasesize: 262144
RedBoot: returned -12
SA1100 flash: using static partition definition
Creating 3 MTD partitions on "sa1100-0":
0x00000000-0x00040000 : "bootloader"
0x00040000-0x00080000 : "bootloader params"
0x00080000-0x02000000 : "jffs"
...
Kernel panic: VFS: Unable to mount root fs on unknown-block(0,0)

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
