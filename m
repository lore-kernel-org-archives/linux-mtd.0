Received: from nz-out-0506.google.com ([64.233.162.229])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ikj2L-00088L-5w
	for linux-mtd@lists.infradead.org; Wed, 24 Oct 2007 17:24:55 +0100
Received: by nz-out-0506.google.com with SMTP id z3so221566nzf
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Oct 2007 09:24:40 -0700 (PDT)
Message-ID: <22c797d00710240924p12576b8bqd9c498a403588ea0@mail.gmail.com>
Date: Wed, 24 Oct 2007 09:24:38 -0700
From: "atom ota" <atomota@sleepyhammer.com>
To: "Jason Lunz" <lunz@falooley.org>
Subject: Re: [PATCH] allow use of mtd and jffs2 on uml
In-Reply-To: <20071024155413.GA14077@falooley.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <22c797d00709272118i33d32b9dy93d5f5ec8f8edd30@mail.gmail.com>
	<20071024011712.GA3762@falooley.org>
	<1193208689.26096.48.camel@pmac.infradead.org>
	<20071024155413.GA14077@falooley.org>
Cc: linux-mtd@lists.infradead.org, Jeff Dike <jdike@addtoit.com>,
	David Woodhouse <dwmw2@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
	uml-user@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm not sure how to follow the "push ... down" instructions.  I used
your patch to build UML and jffs2 ran fine with block2mtd using a file
attached to /dev/ubdb.  Too bad about nandsim though.

Tom

On 10/24/07, Jason Lunz <lunz@falooley.org> wrote:
>
> Push the "depends on HAS_IOMEM" in mtd down closer to the parts that
> actually need it. This allows enough of mtd to build to let jffs2 be
> used on uml.
>
> Signed-off-by: Jason Lunz <lunz@falooley.org>
>
> ---
>
> On Wed, Oct 24, 2007 at 07:51:29AM +0100, David Woodhouse wrote:
> > Why build anything in chips/ or maps/ ?
>
> Did I mention it was crude? :)  I followed your suggestion, and this
> version is much cleaner.
>
> > We should make sure mtdram, nandsim and onenandsim are all buildable
> > too.
>
> I wanted to keep this a pure kbuild change. Getting nand and onenand to
> build for uml would involve making them not use readb and friends, or
> getting uml to provide stub versions.
>
>
>  arch/um/Kconfig             |    4 +---
>  drivers/mtd/Kconfig         |   12 +++++++-----
>  drivers/mtd/chips/Kconfig   |   11 ++++++++---
>  drivers/mtd/devices/Kconfig |    7 +++++++
>  4 files changed, 23 insertions(+), 11 deletions(-)
>
> Index: linux-2.6.23.1-uml/arch/um/Kconfig
> ===================================================================
> --- linux-2.6.23.1-uml.orig/arch/um/Kconfig
> +++ linux-2.6.23.1-uml/arch/um/Kconfig
> @@ -326,9 +326,7 @@
>
>  source "drivers/md/Kconfig"
>
> -if BROKEN
> -       source "drivers/mtd/Kconfig"
> -endif
> +source "drivers/mtd/Kconfig"
>
>  #This is just to shut up some Kconfig warnings, so no prompt.
>  config INPUT
> Index: linux-2.6.23.1-uml/drivers/mtd/devices/Kconfig
> ===================================================================
> --- linux-2.6.23.1-uml.orig/drivers/mtd/devices/Kconfig
> +++ linux-2.6.23.1-uml/drivers/mtd/devices/Kconfig
> @@ -78,6 +78,7 @@
>
>  config MTD_SLRAM
>         tristate "Uncached system RAM"
> +       depends on HAS_IOMEM
>         help
>           If your CPU cannot cache all of the physical memory in your machine,
>           you can still use it for storage or swap by using this driver to
> @@ -85,6 +86,7 @@
>
>  config MTD_PHRAM
>         tristate "Physical system RAM"
> +       depends on HAS_IOMEM
>         help
>           This is a re-implementation of the slram driver above.
>
> @@ -151,10 +153,13 @@
>           Testing MTD users (eg JFFS2) on large media and media that might
>           be removed during a write (using the floppy drive).
>
> +if HAS_IOMEM
>  comment "Disk-On-Chip Device Drivers"
> +endif
>
>  config MTD_DOC2000
>         tristate "M-Systems Disk-On-Chip 2000 and Millennium (DEPRECATED)"
> +       depends on HAS_IOMEM
>         select MTD_DOCPROBE
>         select MTD_NAND_IDS
>         ---help---
> @@ -177,6 +182,7 @@
>
>  config MTD_DOC2001
>         tristate "M-Systems Disk-On-Chip Millennium-only alternative driver (DEPRECATED)"
> +       depends on HAS_IOMEM
>         select MTD_DOCPROBE
>         select MTD_NAND_IDS
>         ---help---
> @@ -198,6 +204,7 @@
>
>  config MTD_DOC2001PLUS
>         tristate "M-Systems Disk-On-Chip Millennium Plus"
> +       depends on HAS_IOMEM
>         select MTD_DOCPROBE
>         select MTD_NAND_IDS
>         ---help---
> Index: linux-2.6.23.1-uml/drivers/mtd/Kconfig
> ===================================================================
> --- linux-2.6.23.1-uml.orig/drivers/mtd/Kconfig
> +++ linux-2.6.23.1-uml/drivers/mtd/Kconfig
> @@ -2,7 +2,6 @@
>
>  menuconfig MTD
>         tristate "Memory Technology Device (MTD) support"
> -       depends on HAS_IOMEM
>         help
>           Memory Technology Devices are flash, RAM and similar chips, often
>           used for solid state file systems on embedded devices. This option
> @@ -278,15 +277,18 @@
>           This enables read only access to SmartMedia formatted NAND
>           flash. You can mount it with FAT file system.
>
> -source "drivers/mtd/chips/Kconfig"
>
> -source "drivers/mtd/maps/Kconfig"
> +if HAS_IOMEM
> +       source "drivers/mtd/chips/Kconfig"
> +       source "drivers/mtd/maps/Kconfig"
> +endif
>
>  source "drivers/mtd/devices/Kconfig"
>
> -source "drivers/mtd/nand/Kconfig"
> -
> -source "drivers/mtd/onenand/Kconfig"
> +if HAS_IOMEM
> +       source "drivers/mtd/nand/Kconfig"
> +       source "drivers/mtd/onenand/Kconfig"
> +endif
>
>  source "drivers/mtd/ubi/Kconfig"
>
> Index: linux-2.6.23.1-uml/drivers/mtd/Makefile
> ===================================================================
> --- linux-2.6.23.1-uml.orig/drivers/mtd/Makefile
> +++ linux-2.6.23.1-uml/drivers/mtd/Makefile
> @@ -26,6 +26,9 @@
>  nftl-objs              := nftlcore.o nftlmount.o
>  inftl-objs             := inftlcore.o inftlmount.o
>
> -obj-y          += chips/ maps/ devices/ nand/ onenand/
> +obj-y          += devices/
> +ifdef CONFIG_HAS_IOMEM
> +obj-y          += chips/ maps/ nand/ onenand/
> +endif
>
>  obj-$(CONFIG_MTD_UBI)          += ubi/
>
