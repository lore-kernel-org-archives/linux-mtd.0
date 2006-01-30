Received: from www.energomera.ru ([212.96.116.245] helo=ns2.energomera.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1F3UIm-0004Hz-30
	for linux-mtd@lists.infradead.org; Mon, 30 Jan 2006 03:22:34 -0500
Received: from ALEX (unknown [10.5.54.1])
	by ns2.energomera.ru (Postfix) with ESMTP id C05A94A65D
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Jan 2006 10:49:32 +0300 (MSK)
Date: Mon, 30 Jan 2006 10:49:45 +0300
From: "Alexey N. Larskiy" <kbsu-10@energomera.ru>
Message-ID: <629577101.20060130104945@energomera.ru>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: quoted-printable
Subject: MTd don't
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

I try use MT=C2/JFFS2 in my board based on ColdFire 5271 chip and NOR flash
Amd AM29PL160CB.
Blkmem worked, but MTD don't started.


CONFIG_MTD=3Dy
CONFIG_MTD_DEBUG=3Dy
CONFIG_MTD_DEBUG_VERBOSE=3D3
CONFIG_MTD_CHAR=3Dy
CONFIG_MTD_BLOCK=3Dy
CONFIG_MTD_CFI=3Dy
CONFIG_MTD_JEDECPROBE=3Dy
CONFIG_MTD_GEN_PROBE=3Dy
CONFIG_MTD_CFI_AMDSTD=3Dy
CONFIG_MTD_RAM=3Dy
CONFIG_MTD_ROM=3Dy
CONFIG_MTD_PHYSMAP=3Dy
CONFIG_MTD_PHYSMAP_START=3DFE000000
CONFIG_MTD_PHYSMAP_LEN=3D200000
CONFIG_MTD_PHYSMAP_BUSWIDTH=3D2

CONFIG_BLK_DEV_RAM=3Dy
CONFIG_BLK_DEV_RAM_SIZE=3D4096
CONFIG_BLK_DEV_BLKMEM=3Dy
CONFIG_NOFLASH=3Dy

> Linux version 2.4.31-uc0 (root@darkstar) (gcc version 2.95.3 20010315 (
> release)(ColdFire patches - 20010318 from http://fiddes.net/coldfire/)(uC=
linux X
> IP and shared lib patches from http://www.snapgear.com/)) #7 Mon Jan 30 1=
1:18:45
>  MSK 2006

> uClinux/COLDFIRE(m5270/5271)
> COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
> Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
> On node 0 totalpages: 2048
> zone(0): 0 pages.
> zone(1): 2048 pages.
> zone(2): 0 pages.
> Kernel command line:
> Calibrating delay loop... 65.94 BogoMIPS
> Memory available: 7868k/8192k RAM, 0k/0k ROM (705k kernel code, 215k data)
> kmem_create: Forcing size word alignment - mm_struct
> kmem_create: Forcing size word alignment - filp
> Dentry cache hash table entries: 1024 (order: 1, 8192 bytes)
> Inode cache hash table entries: 512 (order: 0, 4096 bytes)
> kmem_create: Forcing size word alignment - inode_cache
> Mount cache hash table entries: 512 (order: 0, 4096 bytes)
> kmem_create: Forcing size word alignment - bdev_cache
> kmem_create: Forcing size word alignment - cdev_cache
> kmem_create: Forcing size word alignment - kiobuf
> Buffer cache hash table entries: 1024 (order: 0, 4096 bytes)
> Page-cache hash table entries: 2048 (order: 1, 8192 bytes)
> POSIX conformance testing by UNIFIX
> Linux NET4.0 for Linux 2.4
> Based upon Swansea University Computer Society NET3.039
> Initializing RT netlink socket
> Starting kswapd
> kmem_create: Forcing size word alignment - file_lock_cache
> ColdFire internal UART serial driver version 1.00
> ttyS0 at 0x40000200 (irq =3D 77) is a builtin ColdFire UART
> ttyS1 at 0x40000240 (irq =3D 78) is a builtin ColdFire UART
> ttyS2 at 0x40000280 (irq =3D 79) is a builtin ColdFire UART
> kmem_create: Forcing size word alignment - blkdev_requests
> fec.c: Probe number 1 with 0x0000
> eth0: FEC ENET Version 0.2, dc:a1:5c:fd:7b:89
> FEC: No PHY device found.
> SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=3D256).
> CSLIP: code copyright 1989 Regents of the University of California.
> Blkmem copyright 1998,1999 D. Jeff Dionne
> Blkmem copyright 1998 Kenneth Albanowski
> Blkmem 1 disk images:
> 0: FE0D2DBC-FE1FC9BB [VIRTUAL FE0D2DBC-FE1FC9BB] (RO) <ROMFS>
> RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
> PPP generic driver version 2.4.2
> PPP MPPE compression module registered
> physmap flash device: 200000 at fe000000
> 1
> 2
> 3


1,2,3 - is modified chipreg.c:
struct mtd_info *do_map_probe(const char *name, struct map_info *map)
{
        struct mtd_chip_driver *drv;
        struct mtd_info *ret;

printk("1\n");
        drv =3D get_mtd_chip_driver(name);

        if (!drv && !request_module(name))
                drv =3D get_mtd_chip_driver(name);
printk("2\n");

        if (!drv)
                return NULL;

printk("3\n");
        ret =3D drv->probe(map);
#ifdef CONFIG_MODULES
        /* We decrease the use count here. It may have been a=20
           probe-only module, which is no longer required from this
           point, having given us a handle on (and increased the use
           count of) the actual driver code.
        */
        if(drv->module)
                __MOD_DEC_USE_COUNT(drv->module);
#endif
printk("4\n");

        if (ret)
                return ret;

printk("5\n");
        return NULL;
}
 =20

--=20
Best regards,
 Alexey                          mailto:kbsu-10@energomera.ru
