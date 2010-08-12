Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjVQK-00053N-Ks
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 10:54:13 +0000
Date: Thu, 12 Aug 2010 18:51:42 +0800
From: "Chuanxiao.Dong" <chuanxiao.dong@intel.com>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [PATCH v2 4/6]nand/denali: Add partition support
Message-ID: <20100812105142.GD11634@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=46rom 8720ac9ac4313e3e0fc460a7371e2339a33d4130 Mon Sep 17 00:00:00 2001
=46rom: Chuanxiao Dong <chuanxiao.dong@intel.com>
Date: Thu, 12 Aug 2010 18:23:59 +0800
Subject: [PATCH 4/6] nand/denali: Add partition support

In MRST platfrom, IAFW is in a protected partition which is created
by SCU FW. This partition can not be access by MTD driver. So if
did not create partitions in MRST platform, each time access the
first several blocks which is in protected partition will cause time
out.

User can pass partition info by cmdlinepart. When driver get the
partition info from command line, driver will create partitions as
command line said if the partition info is invalid(The 1st partition
must have a offset which is equal to the size of protected parition).
If there is no partition info in command line, driver will create 2
partitions as default.

This feature will not influence CE4100.

Signed-off-by: Chuanxiao Dong <chuanxiao.dong@intel.com>
---
 drivers/mtd/nand/Kconfig  |    1 +
 drivers/mtd/nand/denali.c |   75 +++++++++++++++++++++++++++++++++++++++++=
++++
 2 files changed, 76 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 6aece56..905955b 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -75,6 +75,7 @@ choice
=20
 config MRST_NAND_CONTROLLER
 	bool "MRST NAND controller"
+	select MTD_PARTITIONS
 	help
=20
 config CE4100_NAND_CONTROLLER
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 920c1cf..aa8f334 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -25,6 +25,7 @@
 #include <linux/pci.h>
 #include <linux/mtd/mtd.h>
 #include <linux/module.h>
+#include <linux/mtd/partitions.h>
=20
 #include "denali.h"
=20
@@ -1886,6 +1887,9 @@ void denali_drv_init(struct denali_nand_info *denali)
 	denali->irq_status =3D 0;
 }
=20
+#ifdef CONFIG_MTD_PARTITIONS
+static const char *part_probes[] =3D { "cmdlinepart", NULL };
+#endif
 /* driver entry point */
 static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_i=
d *id)
 {
@@ -1893,6 +1897,10 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
 	resource_size_t csr_base, mem_base;
 	unsigned long csr_len, mem_len;
 	struct denali_nand_info *denali;
+#ifdef CONFIG_MTD_PARTITIONS
+	int nr_parts;
+	struct mtd_partition *parts =3D NULL;
+#endif
=20
 	denali =3D kzalloc(sizeof(*denali), GFP_KERNEL);
 	if (!denali)
@@ -2147,7 +2155,74 @@ static int denali_pci_probe(struct pci_dev *dev, con=
st struct pci_device_id *id)
 		goto failed_req_irq;
 	}
=20
+#ifdef CONFIG_MTD_PARTITIONS
+	nr_parts =3D parse_mtd_partitions(&denali->mtd, part_probes, &parts, 0);
+	if (denali->platform =3D=3D INTEL_MRST &&
+		denali->manageblks =3D=3D 0) {
+		/* IAFW will manage the whole NAND, so NAND doesn't
+		 * support YAFFS2 or UBIFS file system, driver only
+		 * create one partition here to skip FW.
+		 * */
+		parts =3D kzalloc(sizeof(*parts), GFP_KERNEL);
+		parts->name =3D "Filesystem";
+		parts->offset =3D (uint64_t)denali->fwblks *
+						denali->mtd.erasesize;
+		parts->size =3D MTDPART_SIZ_FULL;
+		ret =3D add_mtd_partitions(&denali->mtd, parts, 1);
+		kfree(parts);
+	} else if (nr_parts >=3D 0 && denali->platform =3D=3D INTEL_MRST) {
+		/* First check the partition information get from cmdline
+		 * For CE4100 just bypass this
+		 * For MRST, driver need to parse whether the partition
+		 * info is suit for MRST platform. If not, driver will
+		 * make adjustment
+		 * Firmware is in protected partition which
+		 * can't be accseed by MTD driver.
+		 * The blocks firmware managed contain block table
+		 * information which is needed by firmware and Spectra FTL
+		 * layer.
+		 * So here, for MRST platform, we need create at lease 2
+		 * partitions to contain Kboot and filesystem.
+		 * */
+		uint64_t offset, size;
+		offset =3D (uint64_t)denali->fwblks *
+			denali->mtd.erasesize;
+		size =3D (uint64_t)denali->manageblks *
+			denali->mtd.erasesize;
+		size -=3D offset;
+		if (nr_parts =3D=3D 0 ||
+			parts[0].offset !=3D offset ||
+			parts[0].size < size) {
+			dev_warn(&dev->dev,
+					"warn:invalid mtd_parts"
+					" cmdline parameters\n"
+					"please make sure the"
+					" 1st partition has:\n"
+					"offset is equal to"
+					" %lld, size larger"
+					" than %lld\n"
+					" Now use the default"
+					" partition layout",
+					offset, size);
+			parts =3D kzalloc(2 * sizeof(*parts), GFP_KERNEL);
+			parts[0].name =3D "Kboot";
+			parts[0].offset =3D offset;
+			parts[0].size =3D size;
+			parts[1].name =3D "Filesystem";
+			parts[1].offset =3D MTDPART_OFS_APPEND;
+			parts[1].size =3D MTDPART_SIZ_FULL;
+			ret =3D add_mtd_partitions(&denali->mtd, parts, 2);
+			kfree(parts);
+		} else
+			ret =3D add_mtd_partitions(&denali->mtd, parts, nr_parts);
+	} else if (nr_parts > 0)
+		ret =3D add_mtd_partitions(&denali->mtd, parts, nr_parts);
+	else
+		ret =3D add_mtd_partitions(&denali->mtd, parts, 1);
+#else
 	ret =3D add_mtd_device(&denali->mtd);
+#endif
+
 	if (ret) {
 		dev_err(&dev->dev, "Spectra: Failed to register MTD: %d\n",
 				ret);
--=20
1.6.6.1
