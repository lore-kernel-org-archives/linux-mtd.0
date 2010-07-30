Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OesCC-0006lG-Sx
	for linux-mtd@lists.infradead.org; Fri, 30 Jul 2010 16:12:29 +0000
Received: by eyd10 with SMTP id 10so801639eyd.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Jul 2010 09:12:26 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <AANLkTimY5d6_koSrmg7Ser0O1SveWCBpYs76tEqd3GaX@mail.gmail.com>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<AANLkTimY5d6_koSrmg7Ser0O1SveWCBpYs76tEqd3GaX@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 30 Jul 2010 19:12:17 +0300
Message-Id: <1280506337.2826.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-27 at 16:47 -0400, Matthew L. Creech wrote: 
> On Tue, Jul 27, 2010 at 11:12 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > OK, you are right, UBI should not bug you so early, there are still
> > plenty of reserved PEBs left. What do you think about the following
> > algorithm:
> >
> > 1. If this is a new image, preserve current behavior and warn.
> > 2. If we see that this is a system which has already been used, we warn
> > only when the reserve is really about to end, say, 5% of the reserve is
> > left.
> >
> 
> Sounds fine to me.  And the warning as-is isn't necessarily
> inaccurate; were it not for the errors later on, I probably would've
> assumed (correctly) that it's simply due to the fact that some NAND
> blocks which were initially good have since gone bad, causing my
> reserve pool of eraseblocks to drop.
> 
> Then again, that should probably be expected on any long-running NAND
> device, so it might make sense to only show the warning on a new
> image.  :)

Something like this, I guess, would be good enough?

>From fc3f6446e374f31c37ee0b5a4fc5de2e51d9e3de Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Fri, 30 Jul 2010 14:59:50 +0300
Subject: [PATCH] UBI: do not warn unnecessarily

Currently, when UBI attaches an MTD device and cannot reserve all 1% (by
default) of PEBs for bad eraseblocks handling, it prints a warning. However,
Matthew L. Creech <mlcreech@gmail.com> is not very happy to see this warning,
because he did reserve enough of PEB at the beginning, but with time some
PEBs became bad. The warning is not necessary in this case.

This patch makes UBI print the warning
 o if this is a new image
 o of this is used image and the amount of reserved PEBs is only 10% (or less)
   of the size of the reserved PEB pool.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |    3 ++-
 drivers/mtd/ubi/eba.c   |   42 +++++++++++++++++++++++++++++++++++++++---
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 13b05cb..78ae894 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -593,6 +593,7 @@ static int attach_by_scanning(struct ubi_device *ubi)
 	ubi->good_peb_count = ubi->peb_count - ubi->bad_peb_count;
 	ubi->max_ec = si->max_ec;
 	ubi->mean_ec = si->mean_ec;
+	ubi_msg("max. sequence number:       %llu", si->max_sqnum);
 
 	err = ubi_read_volume_table(ubi, si);
 	if (err)
@@ -981,7 +982,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	ubi_msg("number of PEBs reserved for bad PEB handling: %d",
 		ubi->beb_rsvd_pebs);
 	ubi_msg("max/mean erase counter: %d/%d", ubi->max_ec, ubi->mean_ec);
-	ubi_msg("image sequence number: %d", ubi->image_seq);
+	ubi_msg("image sequence number:  %d", ubi->image_seq);
 
 	/*
 	 * The below lock makes sure we do not race with 'ubi_thread()' which
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index b582671..fe74749 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1166,6 +1166,44 @@ out_unlock_leb:
 }
 
 /**
+ * print_rsvd_warning - warn about not having enough reserved PEBs.
+ * @ubi: UBI device description object
+ *
+ * This is a helper function for 'ubi_eba_init_scan()' which is called when UBI
+ * cannot reserve enough PEBs for bad block handling. This function makes a
+ * decision whether we have to print a warning or not. The algorithm is as
+ * follows:
+ *   o if this is a new UBI image, then just print the warning
+ *   o if this is an UBI image which has already been used for some time, print
+ *     a warning only if we can reserve less than 10% of the expected amount of
+ *     the reserved PEB.
+ *
+ * The idea is that when UBI is used, PEBs become bad, and the reserved pool
+ * of PEBs becomes smaller, which is normal and we do not want to scare users
+ * with a warning every time they attach the MTD device. This was an issue
+ * reported by real users.
+ */
+static void print_rsvd_warning(struct ubi_device *ubi,
+			       struct ubi_scan_info *si)
+{
+	/*
+	 * The 1 << 18 (256KiB) number is picked randomly, just a reasonably
+	 * large number to distinguish between newly flashed and used images.
+	 */
+	if (si->max_sqnum > (1 << 18)) {
+		int min = ubi->beb_rsvd_level / 10;
+
+		if (!min)
+			min = 1;
+		if (ubi->beb_rsvd_pebs > min)
+			return;
+	}
+
+	ubi_warn("cannot reserve enough PEBs for bad PEB handling, reserved %d,"
+		 " need %d", ubi->beb_rsvd_pebs, ubi->beb_rsvd_level);
+}
+
+/**
  * ubi_eba_init_scan - initialize the EBA sub-system using scanning information.
  * @ubi: UBI device description object
  * @si: scanning information
@@ -1237,9 +1275,7 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si)
 		if (ubi->avail_pebs < ubi->beb_rsvd_level) {
 			/* No enough free physical eraseblocks */
 			ubi->beb_rsvd_pebs = ubi->avail_pebs;
-			ubi_warn("cannot reserve enough PEBs for bad PEB "
-				 "handling, reserved %d, need %d",
-				 ubi->beb_rsvd_pebs, ubi->beb_rsvd_level);
+			print_rsvd_warning(ubi, si);
 		} else
 			ubi->beb_rsvd_pebs = ubi->beb_rsvd_level;
 
-- 
1.6.2.5

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
