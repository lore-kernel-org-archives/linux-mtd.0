Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PPu1R-0003J9-6I
	for linux-mtd@lists.infradead.org; Tue, 07 Dec 2010 09:39:47 +0000
Received: by gyg4 with SMTP id 4so7102896gyg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Dec 2010 01:39:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20101207072919.GA8511@falooley.org>
References: <22c797d00709272118i33d32b9dy93d5f5ec8f8edd30@mail.gmail.com>
	<20071024011712.GA3762@falooley.org>
	<1193208689.26096.48.camel@pmac.infradead.org>
	<20071227181524.GA19051@falooley.org>
	<20071228174853.GA4252@uranus.ravnborg.org>
	<20101207072919.GA8511@falooley.org>
Date: Tue, 7 Dec 2010 10:39:41 +0100
Message-ID: <AANLkTineLxHdcDKZEUGiqVNAauSX_xyQrs49kKaqhiWo@mail.gmail.com>
Subject: Re: [PATCH] mtd: allow mtd and jffs2 when ARCH=um
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: Jason Lunz <lunz@acm.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: atom ota <atomota@sleepyhammer.com>,
	user-mode-linux-devel@lists.sourceforge.net,
	Sam Ravnborg <sam@ravnborg.org>, Jeff Dike <jdike@addtoit.com>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 7, 2010 at 8:29 AM, Jason Lunz <lunz@acm.org> wrote:
>
> Allow parts of drivers/mtd to compile on uml by pushing the HAS_IOMEM
> dependencies down closer to the parts of mtd that actually need it.
> This allows enough of mtd to build to let jffs2 be used on uml.
>
> Signed-off-by: Jason Lunz <lunz@acm.org>
> ---
> =A0arch/um/Kconfig.rest =A0 =A0 =A0 =A0| =A0 =A04 +---
> =A0drivers/mtd/Kconfig =A0 =A0 =A0 =A0 | =A0 =A01 -
> =A0drivers/mtd/Makefile =A0 =A0 =A0 =A0| =A0 =A03 ++-
> =A0drivers/mtd/chips/Kconfig =A0 | =A0 =A04 ++++
> =A0drivers/mtd/devices/Kconfig | =A0 =A08 ++++++++
> =A0drivers/mtd/maps/Kconfig =A0 =A0| =A0 =A04 ++++
> =A0drivers/mtd/mtdchar.c =A0 =A0 =A0 | =A0 =A04 ++++
> =A0drivers/mtd/nand/Kconfig =A0 =A0| =A0 =A03 +++
> =A0drivers/mtd/onenand/Kconfig | =A0 =A03 +++
> =A0include/linux/mtd/map.h =A0 =A0 | =A0 =A02 ++
> =A010 files changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/arch/um/Kconfig.rest b/arch/um/Kconfig.rest
> index 0ccad0f..e34f399 100644
> --- a/arch/um/Kconfig.rest
> +++ b/arch/um/Kconfig.rest
> @@ -28,9 +28,7 @@ source "drivers/scsi/Kconfig"
>
> =A0source "drivers/md/Kconfig"
>
> -if BROKEN
> - =A0 =A0 =A0 source "drivers/mtd/Kconfig"
> -endif
> +source "drivers/mtd/Kconfig"

drivers/mtd was already marked as broken when we moved over to git (2.6.12-=
rc2).

Do you exactly know why it was marked and fixes this patch all issues?

> =A0source "drivers/leds/Kconfig"
>
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 1e2cbf5..a0e2a28 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -1,6 +1,5 @@
> =A0menuconfig MTD
> =A0 =A0 =A0 =A0tristate "Memory Technology Device (MTD) support"
> - =A0 =A0 =A0 depends on HAS_IOMEM
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Memory Technology Devices are flash, RAM and similar c=
hips, often
> =A0 =A0 =A0 =A0 =A0used for solid state file systems on embedded devices.=
 This option
> diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
> index 760abc5..ffa2e15 100644
> --- a/drivers/mtd/Makefile
> +++ b/drivers/mtd/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_MTD_OOPS) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=
=3D mtdoops.o
> =A0nftl-objs =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D nftlcore.o nftlmount.o
> =A0inftl-objs =A0 =A0 =A0 =A0 =A0 =A0 :=3D inftlcore.o inftlmount.o
>
> -obj-y =A0 =A0 =A0 =A0 =A0+=3D chips/ lpddr/ maps/ devices/ nand/ onenand=
/ tests/
> +obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D maps/ devices/ nand/ onena=
nd/ tests/
> +obj-$(CONFIG_HAS_IOMEM) =A0 =A0 =A0 =A0+=3D chips/ lpddr/
>
> =A0obj-$(CONFIG_MTD_UBI) =A0 =A0 =A0 =A0 =A0+=3D ubi/
> diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
> index 35c6a23..27382c9 100644
> --- a/drivers/mtd/chips/Kconfig
> +++ b/drivers/mtd/chips/Kconfig
> @@ -1,3 +1,5 @@
> +if HAS_IOMEM
> +
> =A0menu "RAM/ROM/Flash chip drivers"
> =A0 =A0 =A0 =A0depends on MTD!=3Dn
>
> @@ -240,3 +242,5 @@ config MTD_XIP
> =A0 =A0 =A0 =A0 =A0then say N.
>
> =A0endmenu
> +
> +endif # HAS_IOMEM
> diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> index 35081ce..8f6d85d 100644
> --- a/drivers/mtd/devices/Kconfig
> +++ b/drivers/mtd/devices/Kconfig
> @@ -112,6 +112,8 @@ config MTD_SST25L
> =A0 =A0 =A0 =A0 =A0Set up your spi devices with the right board-specific =
platform data,
> =A0 =A0 =A0 =A0 =A0if you want to specify device partitioning.
>
> +if HAS_IOMEM
> +
> =A0config MTD_SLRAM
> =A0 =A0 =A0 =A0tristate "Uncached system RAM"
> =A0 =A0 =A0 =A0help
> @@ -128,6 +130,8 @@ config MTD_PHRAM
> =A0 =A0 =A0 =A0 =A0doesn't have access to, memory beyond the mem=3Dxxx li=
mit, nvram,
> =A0 =A0 =A0 =A0 =A0memory on the video card, etc...
>
> +endif # HAS_IOMEM
> +
> =A0config MTD_LART
> =A0 =A0 =A0 =A0tristate "28F160xx flash driver for LART"
> =A0 =A0 =A0 =A0depends on SA1100_LART
> @@ -187,6 +191,8 @@ config MTD_BLOCK2MTD
> =A0 =A0 =A0 =A0 =A0Testing MTD users (eg JFFS2) on large media and media =
that might
> =A0 =A0 =A0 =A0 =A0be removed during a write (using the floppy drive).
>
> +if HAS_IOMEM
> +
> =A0comment "Disk-On-Chip Device Drivers"
>
> =A0config MTD_DOC2000
> @@ -249,6 +255,8 @@ config MTD_DOC2001PLUS
> =A0 =A0 =A0 =A0 =A0under "NAND Flash Device Drivers" (currently that driv=
er does not
> =A0 =A0 =A0 =A0 =A0support all Millennium Plus devices).
>
> +endif # HAS_IOMEM
> +
> =A0config MTD_DOCPROBE
> =A0 =A0 =A0 =A0tristate
> =A0 =A0 =A0 =A0select MTD_DOCECC
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index a0dd7bb..e793b29 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -1,3 +1,5 @@
> +if HAS_IOMEM
> +
> =A0menu "Mapping drivers for chip access"
> =A0 =A0 =A0 =A0depends on MTD!=3Dn
>
> @@ -553,3 +555,5 @@ config MTD_PISMO
> =A0 =A0 =A0 =A0 =A0When built as a module, it will be called pismo.ko
>
> =A0endmenu
> +
> +endif # HAS_IOMEM
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 4759d82..a434354 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -1075,6 +1075,7 @@ static unsigned long mtd_get_unmapped_area(struct f=
ile *file,
> =A0/*
> =A0* set up a mapping for shared memory segments
> =A0*/
> +#ifdef CONFIG_HAS_IOMEM
> =A0static int mtd_mmap(struct file *file, struct vm_area_struct *vma)
> =A0{
> =A0#ifdef CONFIG_MMU
> @@ -1113,6 +1114,7 @@ static int mtd_mmap(struct file *file, struct vm_ar=
ea_struct *vma)
> =A0 =A0 =A0 =A0return vma->vm_flags & VM_SHARED ? 0 : -ENOSYS;
> =A0#endif
> =A0}
> +#endif
>
> =A0static const struct file_operations mtd_fops =3D {
> =A0 =A0 =A0 =A0.owner =A0 =A0 =A0 =A0 =A0=3D THIS_MODULE,
> @@ -1125,7 +1127,9 @@ static const struct file_operations mtd_fops =3D {
> =A0#endif
> =A0 =A0 =A0 =A0.open =A0 =A0 =A0 =A0 =A0 =3D mtd_open,
> =A0 =A0 =A0 =A0.release =A0 =A0 =A0 =A0=3D mtd_close,
> +#ifdef CONFIG_HAS_IOMEM
> =A0 =A0 =A0 =A0.mmap =A0 =A0 =A0 =A0 =A0 =3D mtd_mmap,
> +#endif
> =A0#ifndef CONFIG_MMU
> =A0 =A0 =A0 =A0.get_unmapped_area =3D mtd_get_unmapped_area,
> =A0#endif
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 8229802..8bdd465 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -10,6 +10,8 @@ config MTD_NAND_ECC_SMC
> =A0 =A0 =A0 =A0 =A0The original Linux implementation had byte 0 and 1 swa=
pped.
>
>
> +if HAS_IOMEM
> +
> =A0menuconfig MTD_NAND
> =A0 =A0 =A0 =A0tristate "NAND Device Support"
> =A0 =A0 =A0 =A0depends on MTD
> @@ -533,3 +535,4 @@ config MTD_NAND_FSMC
> =A0 =A0 =A0 =A0 =A0Flexible Static Memory Controller (FSMC)
>
> =A0endif # MTD_NAND
> +endif # HAS_IOMEM
> diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
> index 4dbd0f5..166aa18 100644
> --- a/drivers/mtd/onenand/Kconfig
> +++ b/drivers/mtd/onenand/Kconfig
> @@ -1,3 +1,5 @@
> +if HAS_IOMEM
> +
> =A0menuconfig MTD_ONENAND
> =A0 =A0 =A0 =A0tristate "OneNAND Device Support"
> =A0 =A0 =A0 =A0depends on MTD
> @@ -75,3 +77,4 @@ config MTD_ONENAND_SIM
> =A0 =A0 =A0 =A0 =A0OneNAND MTD layer.
>
> =A0endif # MTD_ONENAND
> +endif # HAS_IOMEM
> diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
> index a9e6ba4..c7233ba 100644
> --- a/include/linux/mtd/map.h
> +++ b/include/linux/mtd/map.h
> @@ -388,6 +388,7 @@ static inline map_word map_word_ff(struct map_info *m=
ap)
> =A0 =A0 =A0 =A0return r;
> =A0}
>
> +#ifdef CONFIG_HAS_IOMEM
> =A0static inline map_word inline_map_read(struct map_info *map, unsigned =
long ofs)
> =A0{
> =A0 =A0 =A0 =A0map_word r;
> @@ -439,6 +440,7 @@ static inline void inline_map_copy_to(struct map_info=
 *map, unsigned long to, co
> =A0{
> =A0 =A0 =A0 =A0memcpy_toio(map->virt + to, from, len);
> =A0}
> +#endif /* CONFIG_HAS_IOMEM */
>
> =A0#ifdef CONFIG_MTD_COMPLEX_MAPPINGS
> =A0#define map_read(map, ofs) (map)->read(map, ofs)
> --
> 1.7.2.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>



--=20
Thanks,
//richard
