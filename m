Date: Fri, 3 Aug 2007 08:27:13 +0530 (IST)
From: Satyam Sharma <satyam@infradead.org>
To: =?UTF-8?Q?Rafa=C5=82_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] mtd: Makefile fix (was Re: [PATCH] mtdsuper: licensce = GPL)
In-Reply-To: <46B1FFFB.6040209@interia.pl>
Message-ID: <alpine.LFD.0.999.0708030811330.23798@enigma.security.iitk.ac.in>
References: <46B0D1F7.9090805@interia.pl>
	<alpine.LFD.0.999.0708020318070.8258@enigma.security.iitk.ac.in>
	<46B18551.2020809@interia.pl>
	<alpine.LFD.0.999.0708021309430.8258@enigma.security.iitk.ac.in>
	<46B1FFFB.6040209@interia.pl>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="464262402-329667458-1186109839=:23798"
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--464262402-329667458-1186109839=:23798
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi,


On Thu, 2 Aug 2007, Rafał Bilski wrote:

> [...]
>  CC      drivers/mtd/chips/chipreg.mod.o
>  LD [M]  drivers/mtd/chips/chipreg.ko
>  CC      drivers/mtd/devices/block2mtd.mod.o
>  LD [M]  drivers/mtd/devices/block2mtd.ko
>  CC      drivers/mtd/mtd_blkdevs.mod.o
>  LD [M]  drivers/mtd/mtd_blkdevs.ko
>  CC      drivers/mtd/mtdblock.mod.o
>  LD [M]  drivers/mtd/mtdblock.ko
>  CC      drivers/mtd/mtdchar.mod.o
>  LD [M]  drivers/mtd/mtdchar.ko
>  CC      drivers/mtd/mtdcore.mod.o
>  LD [M]  drivers/mtd/mtdcore.ko
>  CC      drivers/mtd/mtdsuper.mod.o
>  LD [M]  drivers/mtd/mtdsuper.ko
> 
> % ls *.ko
> mtd_blkdevs.ko  mtdblock.ko  mtdchar.ko  mtdcore.ko  mtdsuper.ko

Yup, I end up with the above situation myself. Please try the patch
below.

David, are mtdcore, mtdsuper, mtdpart (and I also noticed mtdbdi.c
in -mm kernel) supposed to be linked into the same module or are they
supposed to be built as separate modules?

If separate, we need to apply Rafal's patch and ensure MODULE_LICENSE
(at least) in all the above files.

If the same module, then please consider applying the patch below.


[PATCH] mtd: Makefile fix

We want drivers/mtd/{mtdcore, mtdsuper, mtdpart}.c to be built and linked
into the same mtd.ko module. Fix the Makefile to ensure this, and remove
duplicate MODULE_ declarations in mtdpart.c, as mtdcore.c already has them.

Signed-off-by: Satyam Sharma <satyam@infradead.org>

---

 drivers/mtd/Makefile  |    2 +-
 drivers/mtd/mtdpart.c |    4 ----
 2 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 451adcc..6d958a4 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -3,9 +3,9 @@
 #
 
 # Core functionality.
+obj-$(CONFIG_MTD)		+= mtd.o
 mtd-y				:= mtdcore.o mtdsuper.o
 mtd-$(CONFIG_MTD_PARTITIONS)	+= mtdpart.o
-obj-$(CONFIG_MTD)		+= $(mtd-y)
 
 obj-$(CONFIG_MTD_CONCAT)	+= mtdconcat.o
 obj-$(CONFIG_MTD_REDBOOT_PARTS) += redboot.o
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 9c62368..6174a97 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -560,7 +560,3 @@ int parse_mtd_partitions(struct mtd_info *master, const char **types,
 EXPORT_SYMBOL_GPL(parse_mtd_partitions);
 EXPORT_SYMBOL_GPL(register_mtd_parser);
 EXPORT_SYMBOL_GPL(deregister_mtd_parser);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Nicolas Pitre <nico@cam.org>");
-MODULE_DESCRIPTION("Generic support for partitioning of MTD devices");
--464262402-329667458-1186109839=:23798--
