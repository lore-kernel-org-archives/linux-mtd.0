Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTaOM-00017Q-ER
 for linux-mtd@lists.infradead.org; Mon, 15 Sep 2014 17:48:50 +0000
Received: by mail-pd0-f174.google.com with SMTP id v10so6717640pde.5
 for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2014 10:48:25 -0700 (PDT)
Date: Mon, 15 Sep 2014 10:48:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Wei.Yang@windriver.com
Subject: [PATCH mtd-utils] libmtd: don't ignore "region index" parameter in
 mtd_regioninfo()
Message-ID: <20140915174821.GB14832@ld-irv-0074>
References: <1407294015-27884-1-git-send-email-Wei.Yang@windriver.com>
 <20140915173152.GA14832@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140915173152.GA14832@ld-irv-0074>
Cc: linux-mtd@lists.infradead.org, w90p710@gmail.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ioctl(MEMGETREGIONINFO) has one input parameter (regionindex) and three
output parameters (info about the erase region). There are two problems
in mtdinfo/libmtd here:

 1. mtdinfo.c doesn't initialize its region_info_user struct, instead
    passing uninitialized data to mtd_regioninfo()

 2. mtd_regioninfo() fails to utilize the 'regidx' parameter to fill out
    the regionindex parameter properly, so the garbage from mtdinfo.c is
    propagated to the ioctl()

This means that mtdinfo will continuously probe the same (possibly
out-of-range) erase region, instead of looping over the valid regions.

Let's fix this in the mtd_regioninfo() helper, and at the same time,
let's zero out the mtdinfo.c buffer, as an additional precaution to keep
from using uninitialized data.

Initial error report from Yang, when running "mtdinfo /dev/mtd0" on a
Cavium 6100 board:

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

Reported-by: Yang Wei <Wei.Yang@windriver.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Untested so far. Can you give this a run, Yang?

 lib/libmtd.c        | 2 ++
 ubi-utils/mtdinfo.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index aff4c8be01b5..a6665f08018e 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -901,6 +901,8 @@ int mtd_regioninfo(int fd, int regidx, struct region_info_user *reginfo)
 		return -1;
 	}
 
+	reginfo->regionindex = regidx;
+
 	ret = ioctl(fd, MEMGETREGIONINFO, reginfo);
 	if (ret < 0)
 		return sys_errmsg("%s ioctl failed for erase region %d",
diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index 5ac95aaabb8a..a86abd1542b4 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -253,6 +253,8 @@ static void print_region_info(const struct mtd_dev_info *mtd)
 	if (!args.node || (!args.map && mtd->region_cnt == 0))
 		return;
 
+	memset(&reginfo, 0, sizeof(reginfo));
+
 	/* First open the device so we can query it */
 	fd = open(args.node, O_RDONLY | O_CLOEXEC);
 	if (fd == -1) {
-- 
1.9.1
