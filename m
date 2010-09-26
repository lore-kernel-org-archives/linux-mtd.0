Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OzvUi-000228-S1
	for linux-mtd@lists.infradead.org; Sun, 26 Sep 2010 17:58:38 +0000
Received: by bwz19 with SMTP id 19so4009849bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Sep 2010 10:58:35 -0700 (PDT)
Subject: Re: RE : UBI/UBIFS interrupted write page handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu Castet <matthieu.castet@parrot.com>
In-Reply-To: <F5C24FC168F95048BB6B9E0B13EB33152BA6F5304E@DIAMANT.xi-lite.lan>
References: <4C88DDD5.4060507@parrot.com>
	<1284054669.11335.21.camel@brekeke> <1285006478.1762.1.camel@brekeke>
	<4C9B7CD8.4070806@parrot.com>,<1285266914.1766.1.camel@brekeke>
	<F5C24FC168F95048BB6B9E0B13EB33152BA6F5304E@DIAMANT.xi-lite.lan>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 26 Sep 2010 20:58:31 +0300
Message-ID: <1285523911.1776.9.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-09-25 at 16:15 +0100, Matthieu Castet wrote:
> I ported our board bsp to ubi-2.6.git and merged ubifs-2.6.git. It
> will be easier to test. Once we get a stable version, I will backport
> it.

Good idea, thanks. You'll also test my latest changes then, which is
very nice!

> Here is the first result.
> 
> After some hours (5), I got "UBI error: check_data_ff: PEB 20 contains
> corrupted VID header, and the data does not contain all 0xFF, this may
> be a non-UBI PEB or a severe VID header corruption which requires
> manual inspection" error.

OK, this is bogus I think.

> I will sent you the dump in a private message for not spamming
> everybody. The block look like an interrupted erase block ; near all
> 0xff, unless some bits a the end (0xf7, 0xfb, 0xef, ...)
> 
> The test is still running, but because for each boot we got this slow
> dump (take near 1 min), I expect others errors to take longer to
> appear.

Your PEB 20 contains almost all 0xFFs, but not quite, and NAND pages are
read with ECC errors. I think this is a result of power cut during
erasure.

My new patch-set is trying to detect situations when we have a PEB which
contains important data, but its VID header is corrupted. We try to
preserve such PEBs instead of erasing. UBI would not spam so much if
debugging was disabled.

But there was an issue in these new changes - your PEB 20 was also
preserved, but obviously, this is wrong.

Here is the patch which applies on top of what you have and which should
fix this problem. You can find this also in ubi-2.6.git / old

However, since I did not push my "preserve PEBs" patch to the linux-next
branch, I can re-base it. So I actually modified my original patches and
incorporated these changes. So ubi-2.6.git / master was rebased, and it
contains the same changes as I'm sending to you.

So you can either just apply my patch on top, or sych with ubi-2.6.git /
master.

>From 4dd222dd4800665ad68b5c14dc52d7f587c81590 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 26 Sep 2010 20:47:28 +0300
Subject: [PATCH] UBI: Matthiew fixes - 1

Fixes on top of my "preserve corrupted" patch series for issues indicated
by Matthieu Castet.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/scan.c |   43 ++++++++++++++++++++++++++++++-------------
 1 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index ae901cc..30b7102 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -746,15 +746,15 @@ struct ubi_scan_leb *ubi_scan_get_free_peb(struct ubi_device *ubi,
  * @vid_hrd: the (corrupted) VID header of this PEB
  * @pnum: the physical eraseblock number to check
  *
- * This is a helper function which was created to distinguish between VID header
+ * This is a helper function which is used to distinguish between VID header
  * corruptions caused by power cuts and other reasons. If the PEB contains only
  * 0xFF bytes at the data area, the VID header is most probably corrupted
- * because of power cut (%0 is returned in this case). Otherwise, it was
+ * because of a power cut (%0 is returned in this case). Otherwise, it was
  * corrupted for some other reasons (%1 is returned in this case). A negative
  * error code is returned if a read error occurred.
  *
  * If the corruption reason was a power cut, UBI can safely erase this PEB.
- * Otherwise, we cannot do this, because we'd possibly destroy important
+ * Otherwise, it should preserve it to avoid possibly destroying important
  * information.
  */
 static int check_data_ff(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
@@ -912,15 +912,32 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		break;
 	case UBI_IO_BAD_HDR_EBADMSG:
 		if (ec_err == UBI_IO_BAD_HDR_EBADMSG)
-			/* Both EC and VID headers were read with data
-			 * integrity error, probably this is a bad PEB, bit it
-			 * is not marked a bad yet.
+			/*
+			 * Both EC and VID headers are corrupted and were read
+			 * with data integrity error, probably this is a bad
+			 * PEB, bit it is not marked as bad yet. This may also
+			 * be a result of power cut during erasure.
 			 */
 			si->maybe_bad_peb_count += 1;
 	case UBI_IO_BAD_HDR:
-		err = check_data_ff(ubi, vidh, pnum);
+		if (ec_err)
+			/*
+			 * Both headers are corrupted. There is a possibility
+			 * that this a valid UBI PEB which has corresponding
+			 * LEB, but the headers are corrupted. However, it is
+			 * impossible to distinguish it from a PEB which just
+			 * contains garbage because a power cut during erase
+			 * operation. So we just schedule this PEB for erasure.
+			 */
+			err = 0;
+		else
+			/*
+			 * The EC was OK, but the VID header is corrupted. We
+			 * have to check what is in the data area.
+			 */
+			err = check_data_ff(ubi, vidh, pnum);
 		if (!err)
-			/* This corruption is caused by a power cut - it's OK */
+			/* This corruption is caused by a power cut */
 			err = add_to_list(si, pnum, ec, 1, &si->erase);
 		else
 			/* This is an unexpected corruption */
@@ -1023,7 +1040,7 @@ static int check_what_we_have(struct ubi_device *ubi, struct ubi_scan_info *si)
 	max_corr = peb_count / 20 ?: 8;
 
 	/*
-	 * Few corrupted PEBs are not a problem and may be just a result of
+	 * Few corrupted PEBs is not a problem and may be just a result of
 	 * unclean reboots. However, many of them may indicate some problems
 	 * with the flash HW or driver.
 	 */
@@ -1048,14 +1065,14 @@ static int check_what_we_have(struct ubi_device *ubi, struct ubi_scan_info *si)
 	if (si->empty_peb_count + si->maybe_bad_peb_count == peb_count) {
 		/*
 		 * All PEBs are empty, or almost all - a couple PEBs look like
-		 * they may be bad PEB which were not marked as bad yet.
+		 * they may be bad PEBs which were not marked as bad yet.
 		 *
-		 * This piece of code basically tries to distinguish  between
-		 * the following 2 situations:
+		 * This piece of code basically tries to distinguish between
+		 * the following situations:
 		 *
 		 * 1. Flash is empty, but there are few bad PEBs, which are not
 		 *    marked as bad so far, and which were read with error. We
-		 *    want to go ahead and format this flash. While formating,
+		 *    want to go ahead and format this flash. While formatting,
 		 *    the faulty PEBs will probably be marked as bad.
 		 *
 		 * 2. Flash contains non-UBI data and we do not want to format
-- 
1.7.2.2

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
