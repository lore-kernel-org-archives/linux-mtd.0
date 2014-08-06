Received: from mail.windriver.com ([147.11.1.11])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XErTZ-00040r-6F
 for linux-mtd@lists.infradead.org; Wed, 06 Aug 2014 03:01:17 +0000
From: <Wei.Yang@windriver.com>
To: <computersforpeace@gmail.com>, <dedekind1@gmail.com>
Subject: [PATCH v1] mtdinfo: Initialize reginfo variable before invoking
 mtd_regioninfo
Date: Wed, 6 Aug 2014 11:00:15 +0800
Message-ID: <1407294015-27884-1-git-send-email-Wei.Yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, wei.yang@windriver.com, w90p710@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Yang Wei <Wei.Yang@windriver.com>

If not initializing this variable, its value would be random. So
once the value of the regionindex field of region_info_user structure
is greater than mtd->numeraseregions. ioctl,which comes with MEMGETREGIONINFO,
would return -EINVAL

Signed-off-by: Yang Wei <Wei.Yang@windriver.com>
---
 ubi-utils/mtdinfo.c |    2 ++
 1 file changed, 2 insertions(+)

		Hi Guys,

		I got the following errors when running "mtdinfo /dev/mtd0" on Cavium 6100 board,


		root@CN61XX:~# mtdinfo /dev/mtd0
		mtd0
		Name:                           phys_mapped_flash
		Type:                           nor
		Eraseblock size:                65536 bytes, 64.0 KiB
		Amount of eraseblocks:          128 (8388608 bytes, 8.0 MiB)
		Minimum input/output unit size: 1 byte
		Sub-page size:                  1 byte
		Additional erase regions:       0
		Character device major/minor:   90:0
		Bad blocks are allowed:         false
		Device is writable:             true
		libmtd: error!: MEMGETREGIONINFO ioctl failed for erase region 0
		        error 22 (Invalid argument)
		Eraseblock region 0:  info is unavailable
		libmtd: error!: MEMGETREGIONINFO ioctl failed for erase region 1
		        error 22 (Invalid argument)
		Eraseblock region 1:  info is unavailable

		This patch is to fix the above errors. I have already verified it

		root@CN61XX:~# ./mtdinfo /dev/mtd0
		mtd0
		Name:                           phys_mapped_flash
		Type:                           nor
		Eraseblock size:                65536 bytes, 64.0 KiB
		Amount of eraseblocks:          128 (8388608 bytes, 8.0 MiB)
		Minimum input/output unit size: 1 byte
		Sub-page size:                  1 byte
		Additional erase regions:       0
		Character device major/minor:   90:0
		Bad blocks are allowed:         false
		Device is writable:             true
		Eraseblock region 0:  offset: 0 size: 0x10000 numblocks: 0x7f
		Eraseblock region 1:  offset: 0 size: 0x10000 numblocks: 0x7f

		root@CN61XX:~#


diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index 5ac95aa..a70db00 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -253,6 +253,8 @@ static void print_region_info(const struct mtd_dev_info *mtd)
 	if (!args.node || (!args.map && mtd->region_cnt == 0))
 		return;
 
+	memset(&reginfo, 0, sizeof(region_info_t));
+
 	/* First open the device so we can query it */
 	fd = open(args.node, O_RDONLY | O_CLOEXEC);
 	if (fd == -1) {
-- 
1.7.9.5
