Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5ZYt-0002qh-9l
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 08:18:32 +0000
Received: by eyh6 with SMTP id 6so1079418eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 01:18:29 -0700 (PDT)
Subject: Re: Mtd alignment bug affecting 1.4.X including current git
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kelly Anderson <kelly@silka.with-linux.com>
In-Reply-To: <4D9091B1.80002@silka.with-linux.com>
References: <4D9091B1.80002@silka.with-linux.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 11:16:07 +0300
Message-ID: <1301645767.2789.25.camel@localhost>
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

On Mon, 2011-03-28 at 07:48 -0600, Kelly Anderson wrote:
> If you create a patch I'll test it for you.

Kelly, would you please test the following patch:

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] libmtd: fix OOB read and write interface

When reading and writing OOB we specify the address as absolute
offset from the beginning of the MTD device. This offset is
basically an absolute page offset plus the OOB offset. And it does
not have to be aligned to the min. I/O unit size (NAND page size).

So fix the 'do_oob_op()' function and remove incorrect checking
that the offset is page-aligned. This check leads to the following
errors:

libmtd: error!: unaligned address 2, mtd0 page size is 2048

But obviously, the intent was to write to offset 2 of the OOB area
of the very first NAND page.

Instead of that incorrect check, we should check that the OOB offset
we write to is within the OOB size and the length is withing the OOB
size. This patch adds such check.

Reported-by: Kelly Anderson <kelly@silka.with-linux.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 lib/libmtd.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index e0c0934..e313fc3 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -1083,6 +1083,7 @@ int do_oob_op(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
 	struct mtd_oob_buf64 oob64;
 	struct mtd_oob_buf oob;
 	unsigned long long max_offs;
+	unsigned int oob_offs;
 	const char *cmd64_str, *cmd_str;
 	struct libmtd *lib = (struct libmtd *)desc;
 
@@ -1102,10 +1103,13 @@ int do_oob_op(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
 		errno = EINVAL;
 		return -1;
 	}
-	if (start % mtd->min_io_size) {
-		errmsg("unaligned address %llu, mtd%d page size is %d",
-		       (unsigned long long)start, mtd->mtd_num,
-		       mtd->min_io_size);
+
+	oob_offs = start & (mtd->min_io_size - 1);
+	if (oob_offs + length > mtd->oob_size) {
+		errmsg("Cannot write %llu OOB bytes to address %llu "
+		       "(OOB offset %u) - mtd%d OOB size is only %d bytes",
+		       (unsigned long long)length, (unsigned long long)start,
+		       oob_offs, mtd->mtd_num,  mtd->oob_size);
 		errno = EINVAL;
 		return -1;
 	}
-- 
1.7.2.3


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
