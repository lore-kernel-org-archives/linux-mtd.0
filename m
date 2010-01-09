Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTl5g-0004au-Ob
	for linux-mtd@lists.infradead.org; Sat, 09 Jan 2010 23:51:37 +0000
Received: by fxm22 with SMTP id 22so22933827fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Jan 2010 15:51:31 -0800 (PST)
Subject: Re: ubiattach fails with "bad image sequence number"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jeff Angielski <jeff@theptrgroup.com>
In-Reply-To: <4B2FF7CF.7040401@theptrgroup.com>
References: <4B2FF7CF.7040401@theptrgroup.com>
Content-Type: multipart/mixed; boundary="=-Pxdd5oR40ZW7sJDJsgWn"
Date: Sun, 10 Jan 2010 01:51:29 +0200
Message-Id: <1263081089.7315.119.camel@localhost.localdomain>
Mime-Version: 1.0
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


--=-Pxdd5oR40ZW7sJDJsgWn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 2009-12-21 at 17:33 -0500, Jeff Angielski wrote:
> If I ubiformat my NAND partition with an UBIFS image I keep on getting 
> "bad image sequence number" when I try to do the ubiattach.  If I just 
> do a plain ubiformat with no image then everything works fine when I 
> ubiattach.
> 
> I was wondering if somebody ran into something similar.  The steps are 
> so trivial it seems like something fundamentally wrong with either the 
> mkfs.ubifs or the ubiformat.
> 
> I did not see anything related to this on the UBFI FAQ or documentation.

I believe this is an ubiformat bug. Thanks for reporting and sorry for
inconvenience.

I attach and inline 2 patches which should fix this. I cannot have a
possibility to test them now, so they are untested. They are against the
latest mtd-utils.git (commit a4e502d99129da8ebba6d40b373a4422a175e9af).

Here we go.


>From 69d3d2a45e58d6f1561d7685008e90dae459cb85 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 10 Jan 2010 01:33:31 +0200
Subject: [PATCH 1/2] ubiformat: always initialize seq number

For some reasons sequence number was set to 0 in some case, which
is wrong.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 ubi-utils/src/ubiformat.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 3b0f49b..80f3a6d 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -912,7 +912,8 @@ int main(int argc, char * const argv[])
 				printf("yes\n");
 		} else
 			ubigen_info_init(&ui, mtd.eb_size, mtd.min_io_size, 0,
-					 si->vid_hdr_offs, args.ubi_ver, 0);
+					 si->vid_hdr_offs, args.ubi_ver,
+					 args.image_seq);
 		normsg("use offsets %d and %d",  ui.vid_hdr_offs, ui.data_offs);
 	}
 
-- 
1.6.2.5


>From 180c09de57d8e254716c562bd0537df543d12577 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 10 Jan 2010 01:39:24 +0200
Subject: [PATCH 2/2] ubiformat: be consistent with sequence numbers

This commit fixes a stupid an nasty bug. When we flash an UBI image,
we do not change its sequence numbers. But when we format the rest
of the PEBs (beyond the flashed image), we use a random (or specified
via cmdline) sequence number. As a result, we have a broken flash
format and UBI refuses it, because half of it has one sequence number,
another half has a different one.

What we have to do instead, we have to substitute image's sequence
number with ours.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 ubi-utils/src/ubiformat.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 80f3a6d..2316d67 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -295,7 +295,8 @@ static void print_bad_eraseblocks(const struct mtd_dev_info *mtd,
 	printf("\n");
 }
 
-static int change_ec(struct ubi_ec_hdr *hdr, long long ec)
+static int change_ech(struct ubi_ec_hdr *hdr, uint32_t image_seq,
+		      long long ec)
 {
 	uint32_t crc;
 
@@ -309,6 +310,7 @@ static int change_ec(struct ubi_ec_hdr *hdr, long long ec)
 		return errmsg("bad CRC %#08x, should be %#08x\n",
 			      crc, be32_to_cpu(hdr->hdr_crc));
 
+	hdr->image_seq = cpu_to_be32(image_seq);
 	hdr->ec = cpu_to_be64(ec);
 	crc = crc32(UBI_CRC32_INIT, hdr, UBI_EC_HDR_SIZE_CRC);
 	hdr->hdr_crc = cpu_to_be32(crc);
@@ -438,7 +440,8 @@ static int mark_bad(const struct mtd_dev_info *mtd, struct ubi_scan_info *si, in
 	return consecutive_bad_check(eb);
 }
 
-static int flash_image(const struct mtd_dev_info *mtd, struct ubi_scan_info *si)
+static int flash_image(const struct mtd_dev_info *mtd, const struct ubigen_info *ui,
+		       struct ubi_scan_info *si)
 {
 	int fd, img_ebs, eb, written_ebs = 0, divisor;
 	off_t st_size;
@@ -518,7 +521,7 @@ static int flash_image(const struct mtd_dev_info *mtd, struct ubi_scan_info *si)
 			fflush(stdout);
 		}
 
-		err = change_ec((struct ubi_ec_hdr *)buf, ec);
+		err = change_ech((struct ubi_ec_hdr *)buf, ui->image_seq, ec);
 		if (err) {
 			errmsg("bad EC header at eraseblock %d of \"%s\"",
 			       written_ebs, args.image);
@@ -918,7 +921,7 @@ int main(int argc, char * const argv[])
 	}
 
 	if (args.image) {
-		err = flash_image(&mtd, si);
+		err = flash_image(&mtd, &ui, si);
 		if (err < 0)
 			goto out_free;
 
-- 
1.6.2.5

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

--=-Pxdd5oR40ZW7sJDJsgWn
Content-Disposition: attachment; filename="0001-ubiformat-always-initialize-seq-number.patch"
Content-Type: text/x-patch; name="0001-ubiformat-always-initialize-seq-number.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

>From 69d3d2a45e58d6f1561d7685008e90dae459cb85 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 10 Jan 2010 01:33:31 +0200
Subject: [PATCH 1/2] ubiformat: always initialize seq number

For some reasons sequence number was set to 0 in some case, which
is wrong.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 ubi-utils/src/ubiformat.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 3b0f49b..80f3a6d 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -912,7 +912,8 @@ int main(int argc, char * const argv[])
 				printf("yes\n");
 		} else
 			ubigen_info_init(&ui, mtd.eb_size, mtd.min_io_size, 0,
-					 si->vid_hdr_offs, args.ubi_ver, 0);
+					 si->vid_hdr_offs, args.ubi_ver,
+					 args.image_seq);
 		normsg("use offsets %d and %d",  ui.vid_hdr_offs, ui.data_offs);
 	}
 
-- 
1.6.2.5


--=-Pxdd5oR40ZW7sJDJsgWn
Content-Disposition: attachment; filename="0002-ubiformat-be-consistent-with-sequence-numbers.patch"
Content-Type: text/x-patch; name="0002-ubiformat-be-consistent-with-sequence-numbers.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

>From 180c09de57d8e254716c562bd0537df543d12577 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 10 Jan 2010 01:39:24 +0200
Subject: [PATCH 2/2] ubiformat: be consistent with sequence numbers

This commit fixes a stupid an nasty bug. When we flash an UBI image,
we do not change its sequence numbers. But when we format the rest
of the PEBs (beyond the flashed image), we use a random (or specified
via cmdline) sequence number. As a result, we have a broken flash
format and UBI refuses it, because half of it has one sequence number,
another half has a different one.

What we have to do instead, we have to substitute image's sequence
number with ours.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 ubi-utils/src/ubiformat.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/ubi-utils/src/ubiformat.c b/ubi-utils/src/ubiformat.c
index 80f3a6d..2316d67 100644
--- a/ubi-utils/src/ubiformat.c
+++ b/ubi-utils/src/ubiformat.c
@@ -295,7 +295,8 @@ static void print_bad_eraseblocks(const struct mtd_dev_info *mtd,
 	printf("\n");
 }
 
-static int change_ec(struct ubi_ec_hdr *hdr, long long ec)
+static int change_ech(struct ubi_ec_hdr *hdr, uint32_t image_seq,
+		      long long ec)
 {
 	uint32_t crc;
 
@@ -309,6 +310,7 @@ static int change_ec(struct ubi_ec_hdr *hdr, long long ec)
 		return errmsg("bad CRC %#08x, should be %#08x\n",
 			      crc, be32_to_cpu(hdr->hdr_crc));
 
+	hdr->image_seq = cpu_to_be32(image_seq);
 	hdr->ec = cpu_to_be64(ec);
 	crc = crc32(UBI_CRC32_INIT, hdr, UBI_EC_HDR_SIZE_CRC);
 	hdr->hdr_crc = cpu_to_be32(crc);
@@ -438,7 +440,8 @@ static int mark_bad(const struct mtd_dev_info *mtd, struct ubi_scan_info *si, in
 	return consecutive_bad_check(eb);
 }
 
-static int flash_image(const struct mtd_dev_info *mtd, struct ubi_scan_info *si)
+static int flash_image(const struct mtd_dev_info *mtd, const struct ubigen_info *ui,
+		       struct ubi_scan_info *si)
 {
 	int fd, img_ebs, eb, written_ebs = 0, divisor;
 	off_t st_size;
@@ -518,7 +521,7 @@ static int flash_image(const struct mtd_dev_info *mtd, struct ubi_scan_info *si)
 			fflush(stdout);
 		}
 
-		err = change_ec((struct ubi_ec_hdr *)buf, ec);
+		err = change_ech((struct ubi_ec_hdr *)buf, ui->image_seq, ec);
 		if (err) {
 			errmsg("bad EC header at eraseblock %d of \"%s\"",
 			       written_ebs, args.image);
@@ -918,7 +921,7 @@ int main(int argc, char * const argv[])
 	}
 
 	if (args.image) {
-		err = flash_image(&mtd, si);
+		err = flash_image(&mtd, &ui, si);
 		if (err < 0)
 			goto out_free;
 
-- 
1.6.2.5


--=-Pxdd5oR40ZW7sJDJsgWn--
