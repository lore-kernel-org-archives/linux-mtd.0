Received: from moutng.kundenserver.de ([212.227.126.186])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWmds-0005g2-CR
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 11:20:57 +0000
Message-ID: <509CE712.60303@corscience.de>
Date: Fri, 09 Nov 2012 12:20:50 +0100
From: =?ISO-8859-1?Q?Andreas_Bie=DFmann?= <biessmann@corscience.de>
MIME-Version: 1.0
To: Dimax <dimax.main@gmail.com>
Subject: Re: UBIFS failure on SheevaPlug Basic
References: <CAF9kqNHybAtg8od-h=B8qKKVuWhkieBnXfUuhxW53aHvEdeDZg@mail.gmail.com>
In-Reply-To: <CAF9kqNHybAtg8od-h=B8qKKVuWhkieBnXfUuhxW53aHvEdeDZg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Dimax,

On 09.11.2012 10:35, Dimax wrote:
> 1. Problem Description
> ---------------------------------

<snip>

> 1.2 Failure
> Everything is all right until I get power surge
> After that system fails with:
>=20
> Marvell>> boot
>=20
> UBI: mtd1 is detached from ubi0
> Creating 1 MTD partitions on "nand0":
> 0x000000500000-0x000020000000 : "mtd=3D2"
> UBI: attaching mtd1 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    129024 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          512 (aligned 512)
> UBI: data offset:                2048
> UBI: attached mtd1 to ubi0
> UBI: MTD device name:            "mtd=3D2"
> UBI: MTD device size:            507 MiB
> UBI: number of good PEBs:        4055
> UBI: number of bad PEBs:         1
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     1
> UBI: available PEBs:             0
> UBI: total number of reserved PEBs: 4055
> UBI: number of PEBs reserved for bad PEB handling: 40
> UBI: max/mean erase counter: 1/0
> UBIFS: recovery needed
> Error reading superblock on volume 'ubi:rootfs'!
> UBIFS not mounted, use ubifs mount to mount volume first!
> UBIFS not mounted, use ubifs mount to mount volume first!
> Wrong Image Format for bootm command
> ERROR: can't get kernel image!
>=20

we discussed that already:
http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/145526
And a possible solution exists here:
http://patchwork.ozlabs.org/patch/195174/

> 1.3 Recovery
> If I run again from the USB stick and mount Flash partition Debian
> kernel manage to recover it:
>=20
> root@debian:~# mount -t ubifs ubi0:rootfs /mnt
> [  306.205029] UBIFS: recovery needed
> [  309.341987] UBIFS: recovery completed
> [  309.345705] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> [  309.351738] UBIFS: file system size:   515192832 bytes (503118 KiB,
> 491 MiB, 3993 LEBs)
> [  309.359789] UBIFS: journal size:       25804800 bytes (25200 KiB,
> 24 MiB, 200 LEBs)
> [  309.367495] UBIFS: media format:       w4/r0 (latest is w4/r0)
> [  309.373352] UBIFS: default compressor: lzo
> [  309.377479] UBIFS: reserved for root:  4952683 bytes (4836 KiB)
>=20
> 2. Fixing
> =3D=3D=3D=3D=3D=3D
> 2.1. My first direction is to update u-boot with latest patches. There
> is a chance it will let u-boot be able to mount broken partition.
> There is another thread here where I work on it "Latest SheevaPlug u-bo=
ot"
>=20
> 2.2.
> My second plan is to separate rootfs partition into two partitions.
> One would be read only and will keep all static data. The second
> partition will be RW and will contain changing data.
> Actually all I need is to
> 1. Arrange let's say /flash_rw partiotion
> 2. Make rootfs partition read only

No, just use a /boot ro. All you need is kernel and initrd which should
be located in /boot. You can use a raw mtd for that too to avoid that
ubifs fails (as I understood is your fear).
Another alternative is to have two logical ubifs in a physical ubi
section. One of them is ro, the other rw mounted.

> 3. Fix u-boot settings
> And here I'm not sure how to do all this.

Just provide a correct cmdline so that the kernel knows about your
special nand organization. u-boot also want to know that to load the
kernel from appropriate position. Read about the mtdpart parameter in
u-boot, that should be sufficient for your needs.

> 2.3. u-boot
> I assume I should start with changing partitioning in u-boot:
> Currently I have
> mtdparts mtdparts=3Dorion_nand:0xa0000@0x0(u-boot),0x400000@0x100000(uI=
mage),0x1fb00000@0x500000(rootfs)
---------------------------------^----------------------------^

you will waste some space here! BTW did you think about your block size?

> How to split rootfs into two partitions?

You could handle it on a directory basis, just mount /boot from another f=
s.

Best regards

Andreas Bie=DFmann
