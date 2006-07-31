Received: from iris-63.mc.com ([63.96.239.141] helo=mc.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7eUb-0006Fw-H1
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 16:36:07 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: 2 back to back 512Mbit P30 16 bit wide flashes on 32 bit bus
Date: Mon, 31 Jul 2006 16:35:59 -0400
Message-ID: <33D5D4623368C945BFAFDC37D6C035E4019A3824@ad-email1.ad.mc.com>
From: "Miloslavsky, Philip" <pmilosla@mc.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a flash that I'm trying to get to work with MTD physmap.

I hear there are some bugs with P30 still, but for me the CFI interface
does not even work.

I have 2 back to back 512Mbit Intel strataflash P30 16 bit wide flashes
on 32 bit bus. One flash is on the lower half, one on the higher.

This is a sample sequence of events (the dump of the flash is in
integers):

inline_map_write: map->virt: 0xE1000000 ofs: 0x0 data: 0xF000F0=20
inline_map_write: bankwidth 1:0 2:0 4:1 8:0 large:0            =20
inline_map_write: map->virt: 0xE1000000 ofs: 0x0 data: 0xFF00FF=20
inline_map_write: bankwidth 1:0 2:0 4:1 8:0 large:0            =20
inline_map_write: map->virt: 0xE1000000 ofs: 0x550 data: 0x980098=20
inline_map_write: bankwidth 1:0 2:0 4:1 8:0 large:0              =20
cfi_probe_chip: base: 0x0 size: 0x7ffffff phys: 0xd0000000 virt:
0xe1000000 bankwidth: 0x=20
cfi_probe_chip: flash_base after CFI commands:

off 0x0:  0x890089 0x89198919 0x10001 0x10001 =20
off 0x10:  0x890089 0xBFCFBFCF 0x10001 0x10001
off 0x20:  0x890089 0x89198919 0x10001 0x10001
off 0x30:  0x890089 0xBFCFBFCF 0x10001 0x10001
off 0x40:  0x890089 0x89198919 0x10001 0x10001
off 0x50:  0x890089 0xBFCFBFCF 0x10001 0x10001
off 0x60:  0x890089 0x89198919 0x10001 0x10001
off 0x70:  0x890089 0xBFCFBFCF 0x10001 0x10001
off 0x80:  0x890089 0x89198919 0x10001 0x10001
off 0x90:  0x890089 0xBFCFBFCF 0x10001 0x10001
off 0xA0:  0x890089 0x89198919 0x10001 0x10001
off 0xB0:  0x890089 0xBFCFBFCF 0x10001 0x10001
off 0xC0:  0x890089 0x89198919 0x10001 0x10001
off 0xD0:  0x890089 0xBFCFBFCF 0x10001 0x10001
off 0xE0:  0x890089 0x89198919 0x10001 0x10001
off 0xF0:  0x890089 0xBFCFBFCF 0x10001 0x10001
off 0x100:  0x510051 0x520052 0x590059 0x10001
off 0x110:  0x0 0xA000A 0x10001 0x0          =20
off 0x120:  0x510051 0x520052 0x590059 0x10001
off 0x130:  0x0 0xA000A 0x10001 0x0          =20
off 0x140:  0x510051 0x520052 0x590059 0x10001
off 0x150:  0x0 0xA000A 0x10001 0x0          =20
off 0x160:  0x510051 0x520052 0x590059 0x10001
off 0x170:  0x0 0xA000A 0x10001 0x0          =20
qry_present:   offset multiplier 0x10 times x where x is 0x10
interleave: 2 device type: 8
inline_map_read: map->virt: 0xE1000000 ofs: 0x100 result: 0x510051

inline_map_read: bankwidth 1:0 2:0 4:1 8:0 large:0                =20
inline_map_read: map->virt: 0xE1000000 ofs: 0x110 result: 0x0=20
inline_map_read: bankwidth 1:0 2:0 4:1 8:0 large:0           =20
inline_map_read: map->virt: 0xE1000000 ofs: 0x120 result: 0x510051=20
inline_map_read: bankwidth 1:0 2:0 4:1 8:0 large:0                =20
map_word_equal:   Read: 0x510051 Expected: 0x510051
map_word_equal:   Read: 0x0 Expected: 0x520052    =20
map_word_equal:   Read NOT Expected

Note its reading from 0x120 not 0x104.


Thoughts? I don't think any set of geometry parameters will work for me.
I think I've tried them all at this point.

I am using linux 2.6.12.6 because I need chipset support that is only
available against that version.



--
Philip Miloslavsky =20




        volatile int * flash_zero;

xip_disable();

        cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type,
NULL);

        cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type,
NULL);

        cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type,
NULL);

=20

=20

      printk(KERN_CRIT "cfi_probe_chip: base: 0x%x size: 0x%x phys: 0x%x
virt: 0x%x bankwidth

: 0x%x \n",

                        (unsigned long)base, map->size -1, map->phys,
map->virt, map->bankwid

th);

        flash_zero =3D map->virt;

        printk(KERN_CRIT "cfi_probe_chip: flash_base after CFI commands:
\n");

        for(i =3D0; i < 0x60; i=3Di+4) {

          printk("off 0x%X:  0x%X 0x%X 0x%X 0x%X\n",  i*4, *(flash_zero
+i), *(flash_zero +i+

1), *(flash_zero +i+2), *(flash_zero +i+3

)); }
