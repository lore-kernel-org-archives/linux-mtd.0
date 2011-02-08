Received: from p02c12o143.mxlogic.net ([208.65.145.76])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pmpml-0003ny-99
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2011 15:47:24 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Kernel panic using add_mtd_partitions
Date: Tue, 8 Feb 2011 09:47:46 -0600
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F3B0C88@EXV1.corp.adtran.com>
From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For some reason, I don't get e-mails I send to the list (though this is
set in my options), so sorry for the "new" thread.

> -----Original Message-----
> From: ANDY KENNEDY
> Sent: Tuesday, February 01, 2011 4:13 PM
> To: 'linux-mtd@lists.infradead.org'
> Subject: Kernel panic using add_mtd_partitions
>=20
>
123456789012345678901234567890123456789012345678901234567890123456789012
> I have gotten past the issue of not being able to see the NAND chip
and
> am working that issue (a symptom of an unrelated issue).
>=20
> Now I'm attempting to use add_mtd_partitions() to specify the
partitions.
> In the original kernel I was using (2.6.29) this worked without any
> issue.  In 2.6.36.1, the kernel panics.  The code I'm attempting to
use
> to configure the partitions is as follows:
>=20
> __maybe_unused static struct    mtd_partition   nand_partition_info[]
=3D {
>         { .name =3D  "Kernel partition",
>           .offset =3D 0,
>           .size =3D   4 * 1024 * 1024,
>         },
>         { .name =3D  "Root partition",
>           .offset =3D MTDPART_OFS_APPEND,
>           .size =3D   MTDPART_SIZ_FULL,
>         },
> };
>=20
>=20
>=20
>         add_mtd_partitions(&board_mtd, nand_partition_info,
ARRAY_SIZE(nand_partition_info));
>=20
> Any help would be great!
>=20
> Thanks,
> Andy


I believe I have isolated the issue, but I don't know how to fix it:

In the file drivers/base/core.c, around line 685, there is the code:

        list_for_each_entry(k, &dev->class->p->class_dirs.list, entry)
                if (k->parent =3D=3D parent_kobj) {
                        kobj =3D kobject_get(k);
                        break;
                }
The seg fault occurs at dev->class->p->class_dirs.list as
dev->class->p =3D=3D NULL.

In the file drivers/mtd/mtdcore.c around line 351/74 is the code:

static struct class mtd_class =3D {  // This is line ~74
        .name =3D "mtd",
        .owner =3D THIS_MODULE,
        .suspend =3D mtd_cls_suspend,
        .resume =3D mtd_cls_resume,
};

<snip to line 351>
        /* Caller should have set dev.parent to match the
         * physical device.
         */
        mtd->dev.type =3D &mtd_devtype;
        mtd->dev.class =3D &mtd_class;
        mtd->dev.devt =3D MTD_DEVT(i);


So, as we see, the mtd_class doesn't set p to anything, though it is
used very shortly after this call in get_device_parent.  The actual
dump is:

CPU 0 Unable to handle kernel paging request at virtual address
0000004c, epc =3D=3D 802a90d0, ra =3D=3D 802a90b8
Oops[#1]:
Cpu 0
$ 0   : 00000000 0000006e 00000000 00000000
$ 4   : 0000004c 87829d68 00000001 0000004c
$ 8   : 80473d19 00000000 00000001 0000000b
$12   : 23232323 f0000000 ff000000 23232323
$16   : 87819cd0 803a0000 87804700 803e0000
$20   : 8040e318 00000000 80420000 00000002
$24   : 00000002 8010881c
$28   : 87828000 87829d58 80410000 802a90b8
Hi    : 00000000
Lo    : 00000015
epc   : 802a90d0 get_device_parent+0x158/0x34c
    Not tainted
ra    : 802a90b8 get_device_parent+0x140/0x34c
Status: 11008403    KERNEL EXL IE
Cause : 00800008
BadVA : 0000004c
PrId  : 0a019554 (MIPS 34Kc)
Modules linked in:
Process swapper (pid: 1, threadinfo=3D87828000, task=3D87820000,
tls=3D00000000)
Stack : 10020aff 803a29a0 000002b4 00000000 87819cd0 803a0000 00000000
803e0000
        8040e318 00000000 80420000 00000002 80410000 80105144 80410000
802a8f28
        87819cd0 803a0000 00000000 803e0000 8040e318 802aa0b8 87819cd0
803a29c0
        000003e1 00000025 87819cd0 802a99b8 87819c00 87819cd0 87819c00
87819cd0
        8041ce14 05a00000 8040e318 00000000 80420000 00000002 80410000
802b1af8
        ...
Call Trace:
[<802a90d0>] get_device_parent+0x158/0x34c
[<802aa0b8>] device_add+0x128/0x68c
[<802b1af8>] add_mtd_device+0x2d8/0x394
[<804263a8>] my_nand_init+0x1b8/0x1d4


Again, any light you can shed on my problem would be welcomed.

Thanks,
Andy=20
