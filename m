Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUJ4w-0004Yn-0x
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 13:45:51 +0000
Received: by fxm14 with SMTP id 14so434349fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 06:45:47 -0700 (PDT)
Subject: Re: [PATCH 5/6] mtdinfo: add regioninfo/sectormap display
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <BANLkTimY1DwxBBi=peQzqwoLktgVna-0KA@mail.gmail.com>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307427548-29306-5-git-send-email-vapier@gentoo.org>
	<1307432463.11104.65.camel@localhost>
	<BANLkTimY1DwxBBi=peQzqwoLktgVna-0KA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 16:41:29 +0300
Message-ID: <1307540489.31223.87.camel@localhost>
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

I've just pushed this little patch to make sure the code is more
readable when you add your changes. Otherwise this "out:" label looks
ugly.

>From bc1f5c0902ce4e10f062d6e37f3f8773506e6915 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Wed, 8 Jun 2011 16:21:40 +0300
Subject: [PATCH] mtdinfo: separate out ubi information printing

We are going to add some more code which prints eraseblocks map, so we need to
make 'print_dev_info()' a bit smaller to keep the code readable.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 ubi-utils/src/mtdinfo.c |   41 +++++++++++++++++++++++------------------
 1 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index 666d739..ca0ad71 100644
--- a/ubi-utils/src/mtdinfo.c
+++ b/ubi-utils/src/mtdinfo.c
@@ -160,6 +160,27 @@ static int translate_dev(libmtd_t libmtd, const char *node)
 	return 0;
 }
 
+static void print_ubi_info(const struct mtd_info *mtd_info,
+			   const struct mtd_dev_info *mtd)
+{
+	struct ubigen_info ui;
+
+	if (!mtd_info->sysfs_supported) {
+		errmsg("cannot provide UBI info, becasue sub-page size is "
+		       "not known");
+		return;
+	}
+
+	ubigen_info_init(&ui, mtd->eb_size, mtd->min_io_size, mtd->subpage_size,
+			 0, 1, 0);
+	printf("Default UBI VID header offset:  %d\n", ui.vid_hdr_offs);
+	printf("Default UBI data offset:        %d\n", ui.data_offs);
+	printf("Default UBI LEB size:           ");
+	ubiutils_print_bytes(ui.leb_size, 0);
+	printf("\n");
+	printf("Maximum UBI volumes count:      %d\n", ui.max_volumes);
+}
+
 static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int mtdn)
 {
 	int err;
@@ -206,25 +227,9 @@ static int print_dev_info(libmtd_t libmtd, const struct mtd_info *mtd_info, int
 	printf("Device is writable:             %s\n",
 	      mtd.writable ? "true" : "false");
 
-	if (!args.ubinfo)
-		goto out;
-
-	if (!mtd_info->sysfs_supported) {
-		errmsg("cannot provide UBI info, becasue sub-page size is "
-		       "not known");
-		goto out;
-	}
-
-	ubigen_info_init(&ui, mtd.eb_size, mtd.min_io_size, mtd.subpage_size,
-			 0, 1, 0);
-	printf("Default UBI VID header offset:  %d\n", ui.vid_hdr_offs);
-	printf("Default UBI data offset:        %d\n", ui.data_offs);
-	printf("Default UBI LEB size:           ");
-	ubiutils_print_bytes(ui.leb_size, 0);
-	printf("\n");
-	printf("Maximum UBI volumes count:      %d\n", ui.max_volumes);
+	if (args.ubinfo)
+		print_ubi_info(mtd_info, &mtd);
 
-out:
 	printf("\n");
 	return 0;
 }
-- 
1.7.2.3


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
