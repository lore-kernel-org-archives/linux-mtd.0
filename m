Received: from www.energomera.ru ([212.96.116.245] helo=ns2.energomera.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1F4EXv-0002te-SQ
	for linux-mtd@lists.infradead.org; Wed, 01 Feb 2006 04:45:16 -0500
Received: from ALEX (unknown [10.5.54.1])
	by ns2.energomera.ru (Postfix) with ESMTP id 2D3BC4A664
	for <linux-mtd@lists.infradead.org>;
	Wed,  1 Feb 2006 12:44:53 +0300 (MSK)
Date: Wed, 1 Feb 2006 12:45:05 +0300
From: "Alexey N. Larskiy" <kbsu-10@energomera.ru>
Message-ID: <26403391.20060201124505@energomera.ru>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Physmap don't detected AM29PL160CB
Reply-To: "Alexey N. Larskiy" <kbsu-10@energomera.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

uClinux 2.4.31-uc0 on Motorola M5271EVB like board.
Flash - 2mb AMD AM29PL160CB.

Blkmem worked, but when physmap options enabled, MTD don't started.


Kernel options:
  CONFIG_MTD=y
  CONFIG_MTD_DEBUG=y
  CONFIG_MTD_DEBUG_VERBOSE=3
  CONFIG_MTD_PARTITIONS=y
  CONFIG_MTD_CHAR=y
  CONFIG_MTD_BLOCK=y

  CONFIG_MTD_CFI=y
  CONFIG_MTD_JEDECPROBE=y
  CONFIG_MTD_GEN_PROBE=y
  CONFIG_MTD_CFI_AMDSTD=y
  CONFIG_MTD_RAM=y
  CONFIG_MTD_ROM=y

  CONFIG_MTD_PHYSMAP=y
  CONFIG_MTD_PHYSMAP_START=FE000000
  CONFIG_MTD_PHYSMAP_LEN=200000
  CONFIG_MTD_PHYSMAP_BUSWIDTH=2
  CONFIG_MTD_UCLINUX=y

  CONFIG_BLK_DEV_RAM=y
  CONFIG_BLK_DEV_RAM_SIZE=4096
  CONFIG_BLK_DEV_BLKMEM=y
  CONFIG_NOFLASH=y


Terminal:
Linux version 2.4.31-uc0 (root@darkstar) (gcc version 2.
95.3 20010315 (release)(ColdFire patches - 20010318 from http://fiddes.net/coldf
ire/)(uClinux XIP and shared lib patches from http://www.snapgear.com/)) #8 Wed
Feb 1 12:49:50 MSK 2006

uClinux/COLDFIRE(m5270/5271)
COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
On node 0 totalpages: 2048
zone(0): 0 pages.
zone(1): 2048 pages.
zone(2): 0 pages.
Kernel command line:
Calibrating delay loop... 65.94 BogoMIPS
Memory available: 7868k/8192k RAM, 0k/0k ROM (709k kernel code, 215k data)
kmem_create: Forcing size word alignment - mm_struct
kmem_create: Forcing size word alignment - filp
Dentry cache hash table entries: 1024 (order: 1, 8192 bytes)
Inode cache hash table entries: 512 (order: 0, 4096 bytes)
kmem_create: Forcing size word alignment - inode_cache
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
kmem_create: Forcing size word alignment - bdev_cache
kmem_create: Forcing size word alignment - cdev_cache
kmem_create: Forcing size word alignment - kiobuf
Buffer cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 2048 (order: 1, 8192 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
kmem_create: Forcing size word alignment - file_lock_cache
ColdFire internal UART serial driver version 1.00
ttyS0 at 0x40000200 (irq = 77) is a builtin ColdFire UART
ttyS1 at 0x40000240 (irq = 78) is a builtin ColdFire UART
ttyS2 at 0x40000280 (irq = 79) is a builtin ColdFire UART
kmem_create: Forcing size word alignment - blkdev_requests
fec.c: Probe number 1 with 0x0000
eth0: FEC ENET Version 0.2, 54:c2:f7:58:9c:db
FEC: No PHY device found.
SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=256).
CSLIP: code copyright 1989 Regents of the University of California.
Blkmem copyright 1998,1999 D. Jeff Dionne
Blkmem copyright 1998 Kenneth Albanowski
Blkmem 1 disk images:
0: FE0D3F60-FE1FDF5F [VIRTUAL FE0D3F60-FE1FDF5F] (RO) <ROMFS>
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
PPP generic driver version 2.4.2
PPP MPPE compression module registered
physmap flash device: 200000 at fe000000
1: cfi_probe
2
^^^^^^^^^^^^
is modified chipreg.c:
  struct mtd_info *do_map_probe(const char *name, struct map_info *map)
  {
          struct mtd_chip_driver *drv;
          struct mtd_info *ret;

          drv = get_mtd_chip_driver(name);

          if (!drv && !request_module(name))
                  drv = get_mtd_chip_driver(name);
  printk("1: %s", name);
          if (!drv)
                  return NULL;
  printk("2");
          ret = drv->probe(map);
  printk("3");
  ...

-- 
Best regards,
 Alexey               
