Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO13O-0004g9-Vv
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 04:46:00 +0000
Received: by fxm19 with SMTP id 19so2898682fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Dec 2010 20:45:56 -0800 (PST)
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20101201164447.2215bc58@wker>
References: <20101129195014.19224240@wker> <20101201130534.5b95ce83@wker>
	<20101201164447.2215bc58@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Dec 2010 06:42:06 +0200
Message-ID: <1291264926.14534.32.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-12-01 at 16:44 +0100, Anatolij Gustschin wrote:
> On Wed, 1 Dec 2010 13:05:34 +0100
> Anatolij Gustschin <agust@denx.de> wrote:
> ... 
> > My question is:
> > Is it possible that the reset occured while running in
> > nor_erase_prepare() just after clearing the VID header magic,
> > but before clearing the EC header magic?
> 
> yes, it is possible and it seems this is the reason for
> that next issue we've observed. Adding the call to the
> machine restart callback in nor_erase_prepare() just before
> clearing EC header magic to simulate this hypothetical case
> we see:
You are right, Anatoli.

Looking closer to my own code, I see that I treat PEB as
"corrupted and should be preserved" if:

1. EC header is OK.
2. VID header is corrupted.
3. data area is not "all 0xFFs".

And in 'nor_erase_prepare()' we first invalidate the VID header, and
then invalidate the EC header. So there is a small window where you can
end up with all 3 conditions to be true.

The solution is to first invalidate the EC header, and only then the VID
header. Then in case of the race, we just lose the EC header, but VID
header will be all-right, and UBI will handle this - it'll move the data
from this PEB to another one, re-create EC header and use average EC
count. But if you test this scenario, it will be great!!

This patch should help (compile-tested only).



>From 7ddb9cb80ab54d118e2a055ce7a35649070578b1 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Thu, 2 Dec 2010 06:34:01 +0200
Subject: [PATCH] UBI: fix corrupted PEB detection for NOR flash

My new shiny code for corrupted PEB detection has NOR specific bug.
We tread PEB as corrupted and preserve it, if

1. EC header is OK.
2. VID header is corrupted.
3. data area is not "all 0xFFs"

In case of NOR we have 'nor_erase_prepare()' quirk, which invalidates
the headers before erasing the PEB. And we invalidate first the VID
header, and then the EC header. So if a power cut happens after we have
invalidated the VID header, but before we have invalidated the EC
header, we end up with a PEB which satisfies the above 3 conditions,
and the scanning code will treat it as corrupted, and will print
scary warnings, wrongly.

This patch fixes the issue by firt invalidating the EC header, then
invalidating the VID header. In case of power cut inbetween, we still
just lose the EC header, and UBI can deal with this situation gracefully.

This patch also adds one irrelevant comment about defining VID header
buffer on stack.

Thanks to Anatolij Gustschin <agust@denx.de> for tracking this down.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Reported-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/mtd/ubi/io.c   |   37 ++++++++++++++++++++++++++++---------
 drivers/mtd/ubi/scan.c |    4 ++++
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index c2960ac..3839253 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -480,12 +480,26 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	size_t written;
 	loff_t addr;
 	uint32_t data = 0;
+	/*
+	 * Note, we cannot generally define VID header buffers on stack,
+	 * because of the way we deal with these buffers (see the heder
+	 * comment). But we know this is NOR-specific piece of code, so we can
+	 * do this. But yes, this is error-prone and we should (pre-)allocate
+	 * VID header buffer instead.
+	 */
 	struct ubi_vid_hdr vid_hdr;
 
-	addr = (loff_t)pnum * ubi->peb_size + ubi->vid_hdr_aloffset;
+	/*
+	 * Note, it is important to first invalidate the EC header, and then
+	 * VID header. Otherwise a power cut may result in valid EC header and
+	 * invalid VID header, then UBI will treat this PEB as corrupted and
+	 * will try to preserve it, print scary warnings. See scan.c header
+	 * comment for more information.
+	 */
+	addr = (loff_t)pnum * ubi->peb_size;
 	err = ubi->mtd->write(ubi->mtd, addr, 4, &written, (void *)&data);
 	if (!err) {
-		addr -= ubi->vid_hdr_aloffset;
+		addr += ubi->vid_hdr_aloffset;
 		err = ubi->mtd->write(ubi->mtd, addr, 4, &written,
 				      (void *)&data);
 		if (!err)
@@ -499,13 +513,18 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	 * In this case we probably anyway have garbage in this PEB.
 	 */
 	err1 = ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
-	if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR)
-		/*
-		 * The VID header is corrupted, so we can safely erase this
-		 * PEB and not afraid that it will be treated as a valid PEB in
-		 * case of an unclean reboot.
-		 */
-		return 0;
+	if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR) {
+		struct ubi_ec_hdr ec_hdr;
+
+		err1 = ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
+		if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR)
+			/*
+			 * The VID and EC headers are corrupted, so we can
+			 * safely erase this PEB and not afraid that it will be
+			 * treated as a valid PEB in case of an unclean reboot.
+			 */
+			return 0;
+	}
 
 	/*
 	 * The PEB contains a valid VID header, but we cannot invalidate it.
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 3c63186..d4b1115 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -951,6 +951,10 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 			 * impossible to distinguish it from a PEB which just
 			 * contains garbage because of a power cut during erase
 			 * operation. So we just schedule this PEB for erasure.
+			 *
+			 * Besides, in case of NOR flash, we deliberatly
+			 * corrupt both headers because NOR flash erasure is
+			 * slow and can start from the end.
 			 */
 			err = 0;
 		else
-- 
1.7.3.2

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
