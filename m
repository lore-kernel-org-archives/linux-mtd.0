Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta02.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16loFf-0004Au-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2002 09:43:56 +0000
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
Date: Fri, 15 Mar 2002 01:55:22 -0800 (PST)
From: Jim Zeus <zeusj@firstlinux.net>
To: David Woodhouse <dwmw2@infradead.org>,
	"David  Woodhouse" <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: (no subject)
Reply-To: zeusj@firstlinux.net
Message-Id: <20020315095523.2AAD73ED3@sitemail.everyone.net>
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

Hi, David
>Show me.

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/mtd/partitions.h>


#define WINDOW_ADDR 0x00000000
#define WINDOW_SIZE 0x01000000
#define BUSWIDTH 2

static struct mtd_info *mymtd;


static __u8 perseus_read8(struct map_info *map,unsigned long ofs)
{
	return __raw_readb(map->map_priv_1 + ofs);
}

static __u16 perseus_read16(struct map_info *map,unsigned long ofs)
{
	return __raw_readw(map->map_priv_1 + ofs);
}

static __u32 perseus_read32(struct map_info *map, unsigned long ofs)
{
	return __raw_readl(map->map_priv_1 + ofs);
}

static void perseus_copy_from(struct map_info *map, void *to, unsigned long=
 from, ssize_t len)
{
	memcpy(to, (void *)(map->map_priv_1 + from), len);
}

static void perseus_write8(struct map_info *map, __u8 d, unsigned long adr)
{
	*(__u8 *)(map->map_priv_1 + adr) =3D d;
}

static void perseus_write16(struct map_info *map, __u16 d, unsigned long ad=
r)
{
	*(__u16 *)(map->map_priv_1 + adr) =3D d;
}

static void perseus_write32(struct map_info *map, __u32 d, unsigned long ad=
r)
{
	*(__u32 *)(map->map_priv_1 + adr) =3D d;
}

static void perseus_copy_to(struct map_info *map, unsigned long to, const v=
oid *from, ssize_t len)
{
	memcpy((void *)(map->map_priv_1 + to), from, len);
}


static struct mtd_partition perseus_partition[]=3D{
    {=20
	    name: "Perseus Bootloader",=20
	    offset: 0,=20
	    size:   0x20000,
    },
    {
	   name:"Perseus Kernel",
	   offset:0x20000,
	   size:0x7e0000,
    },
    {=20
	    name: "Perseus RamDisk", /////
	    offset: 0x800000,
	    size:0x800000,=20
    }
};

#define NUM_PARTITIONS (sizeof(perseus_partition)/sizeof(perseus_partition[=
0]))


struct map_info perseus_map =3D {
	name: "Perseus StrataFlash map",
	size: WINDOW_SIZE,
	buswidth: BUSWIDTH,
	read8: perseus_read8,
	read16: perseus_read16,
	read32: perseus_read32,
	copy_from: perseus_copy_from,
	write8: perseus_write8,
	write16: perseus_write16,
	write32: perseus_write32,
	copy_to: perseus_copy_to,
};


static  int __init init_perseus(void)
{
	printk(KERN_NOTICE "Perseus Strataflash mapping:size %x at %x\n", WINDOW_S=
IZE, WINDOW_ADDR);
	perseus_map.map_priv_1 =3D (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE=
);
	printk("ZEUS:perseus_map.map_priv_1=3D%x\n",perseus_map.map_priv_1);
	if (!perseus_map.map_priv_1) {
		printk("Failed to ioremap\n");
		return -EIO;
	}
=09
	mymtd =3D do_map_probe("cfi_probe", &perseus_map);
	if (mymtd) {
		mymtd->module =3D THIS_MODULE;
		add_mtd_partitions( mymtd, perseus_partition, NUM_PARTITIONS );

		add_mtd_device(mymtd);
		printk("ZEUS:right end of init_perseus(I mean flash)\n");
		return 0;
	}
=09
	iounmap((void *)perseus_map.map_priv_1);
	printk("ZEUS:so its the wrong end of init_perseus(flash)\n");
	return -ENXIO;

}

mod_exit_t cleanup_perseus(void)
{
	if (mymtd) {
		del_mtd_device(mymtd);
		map_destroy(mymtd);
	}
	if (perseus_map.map_priv_1) {
		iounmap((void *)perseus_map.map_priv_1);
		perseus_map.map_priv_1 =3D 0;
	}
}

module_init(init_perseus);
module_exit(cleanup_perseus);

>Why JFFS not JFFS2?
sure I can use jffs2 too, but for more insurance , I use jffs:)

AND, after some modification, the phenomena I showed you in last mail has b=
een disappeared .=20
now, if i use "cp somefile /dev/mtd0", it said=A3=BA

MTD_open

MTD_ioctl

Invalid ioctl 5401 (MEMGETINFO =3D 80204d01)

MTD_write

Chip not ready for buffer write. Xstatus =3D 18, status =3D 98

cp: write: Input/output error

MTD_close

I think I have make the mtd up,but why I cant write?
and if I "mount /dev/mtdblock0 /jffs -t jffs",the kernel tell me mount fail=
ed and  said"Invalid argument"

BTW:
in my opinion, the "mtd_info" struct should be to describe a mtd device.
the "map_info" struct should be to describe a mapping area in memory which =
mapping to the mtd device(?) and WINDOW_ADDR is the PA of the mtd device(in=
 my file) and map_info.map_priv_1 is a pointer to the VA of the mtd device.
Is that right? to be honest , I am really confused by these.I cant find any=
 documentation to explain it .=20

thank you for your help!

Jim Zeus


_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Run a small business? Then you need professional email like you@yourbiz.com=
 from Everyone.net  http://www.everyone.net?tag
