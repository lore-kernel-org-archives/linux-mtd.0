Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2hib-00054v-J3
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 10:56:58 +0000
Received: by yxi11 with SMTP id 11so2829202yxi.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 03:56:56 -0700 (PDT)
Subject: Re: mtd-utils: ubiformat: writing images on flash with badblocks.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anton Olofsson <anol.martinsson@gmail.com>
Date: Sun, 11 Sep 2011 13:59:22 +0300
In-Reply-To: <CAMjE+nUOxOm4bBWKp1xAcVDjP-Pepd_GuJ=DcQ4jUcsohn-K=g@mail.gmail.com>
References: <CAMjE+nUOxOm4bBWKp1xAcVDjP-Pepd_GuJ=DcQ4jUcsohn-K=g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1315738766.18731.9.camel@sauron>
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

On Thu, 2011-08-25 at 10:26 +0200, Anton Olofsson wrote:
> Hi!
> 
> We encountered some problems with ubiformat
> and writing ubi-images onto flash with badblocks.
> 
> If a badblock was encountered during write ubiformat would
> skip writing that “file-block” altogether, and this would eventually
> result in EOF while trying to read the image file.
> 
> The quick fix was to rewind the filedescriptor for the next pass.
> 
> Im not sure if others have encountered this problem
> or even if this is the correct way to handle this situation.
> 
> Here is the change made though:


Hi, thanks for the fix, but I have few notes:

1. The patch does not have your Signed-off-by:
2. The patch is line-wrapped, so does not apply.


> --- a/ubi-utils/ubiformat.c
> +++ b/ubi-utils/ubiformat.c
> @@ -546,6 +546,11 @@ static int flash_image(libmtd_t libmtd, const
> struct mtd_dev_info *mtd,
>                                 if (mark_bad(mtd, si, eb))
>                                         goto out_close;
>                         }
> +                       /*rewind fd so next read_all(...) reads correct block*/
> +                       if (lseek(fd, -mtd->eb_size, SEEK_CUR) == -1) {
> +                               sys_errmsg("unable to rewind file");
> +                               goto out_close;
> +                       }
>                         continue;

But most importantly, I think this will break the case when the input
is stdout (pipe), not a file. So I quickly cooked the below patch
instead. I did not test it - would it be possible for you to give it a
test and let me know if it is ok, in which case I'll push it to the
mtd-utils repository.

>From 737ca8095332bf2d8110135de6e522fdb07a42df Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@intel.com>
Date: Sun, 11 Sep 2011 13:52:08 +0300
Subject: [PATCH] ubiformat: handle write errors correctly

This issue was reported and analyzed by
Anton Olofsson <anol.martinsson@gmail.com>:

when ubiformat encounters a write error while flashing the UBI image (which may
come from a file of from stdout), it correctly marks the faulty eraseblock as
bad and skips it. However, it also incorrectly drops the data buffer which was
supposed to be written, and reads next block of data.

This patch fixes this issue - in case of a write error, we preserve the current
data and write it to the next eraseblock, instead of dropping it.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@intel.com>
---
 ubi-utils/ubiformat.c |   22 ++++++++++++++++------
 1 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index bfa1730..c396b09 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -442,7 +442,7 @@ static int mark_bad(const struct mtd_dev_info *mtd, struct ubi_scan_info *si, in
 static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 		       const struct ubigen_info *ui, struct ubi_scan_info *si)
 {
-	int fd, img_ebs, eb, written_ebs = 0, divisor;
+	int fd, img_ebs, eb, written_ebs = 0, divisor, skip_data_read = 0;
 	off_t st_size;
 
 	fd = open_file(&st_size);
@@ -501,12 +501,15 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 			continue;
 		}
 
-		err = read_all(fd, buf, mtd->eb_size);
-		if (err) {
-			sys_errmsg("failed to read eraseblock %d from \"%s\"",
-				   written_ebs, args.image);
-			goto out_close;
+		if (!skip_data_read) {
+			err = read_all(fd, buf, mtd->eb_size);
+			if (err) {
+				sys_errmsg("failed to read eraseblock %d from \"%s\"",
+					   written_ebs, args.image);
+				goto out_close;
+			}
 		}
+		skip_data_read = 0;
 
 		if (args.override_ec)
 			ec = args.ec;
@@ -546,6 +549,13 @@ static int flash_image(libmtd_t libmtd, const struct mtd_dev_info *mtd,
 				if (mark_bad(mtd, si, eb))
 					goto out_close;
 			}
+
+			/*
+			 * We have to make sure that we do not read next block
+			 * of data from the input image or stdin - we have to
+			 * write buf first instead.
+			 */
+			skip_data_read = 1;
 			continue;
 		}
 		if (++written_ebs >= img_ebs)
-- 
1.7.6

-- 
Best Regards,
Artem Bityutskiy
