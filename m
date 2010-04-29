Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O7ZKm-0000cf-Lc
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 19:23:42 +0000
Date: Thu, 29 Apr 2010 21:23:33 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd/ubi: recognize empty flash with errors as empty
Message-ID: <20100429192333.GA12067@Chamillionaire.breakpoint.cc>
References: <20100423172819.GA29224@Chamillionaire.breakpoint.cc>
	<1272108241.11751.1635.camel@localhost.localdomain>
	<20100425210938.GA15192@Chamillionaire.breakpoint.cc>
	<1272257990.17386.2.camel@localhost>
	<20100426082855.GA18811@Chamillionaire.breakpoint.cc>
	<1272534149.7750.85.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1272534149.7750.85.camel@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy | 2010-04-29 12:42:29 [+0300]:

>> So I think the latter case is now broken. In fact I just copied some
>> random things into my mtd partition and after attach & mkvol they were
>> gone with no error.
>
>You mean UBI just attached your device? What would you expect it to do
>when it sees that part of eraseblocks contain corrupted headers? ATM, it
>just formats those eraseblocks. What would be your expectation?

Before the patch attaching a bootloader[0] partition would not work. Now
it does.

>> So in case we want to support something other than UBI then we should
>> probably add another error code in order to distinguish between read
>> error and not a vald EC / VID header.
>
>If you feed UBI flash with no valid UBI headers, it will be refused, I
>think.

It does not, not anymore. si->is_empty is only set if we find a valid EC
header. Unknown data results now in UBI_IO_BAD_{EC|VID}_HDR is excluded
from si->is_empty. Duh.

>I actually do not really see what is the use-case or scenario you want
>UBI to handle better.

The first case was:
- empty flash
- a bad block which is not marked as such.

This is now fixed. However, not empty flash with non-UBI data will be
now UBInized. Earlier, it was refused, you had to use flash_eraseall or
ubiformat first.

In my optinion accidently attaching is not a problem in the field. It is
only a problem if you are attaching by hand and you mix up the
partitions.

The patch attached should fix this and flash with something not UBI
will be refused again. It is compiled tested, don't have hw here right
now.

[0] assumed that the bootloader does not start with 0xff within the
    first few bytes.

Sebastian

---

Subject: mtd/ubi: don't ubinize everything

Since commit 9fb9b36c aka (" UBI: recognize empty flash with errors as
empty") it is now possible to attach a non-empty flash partition and it
will be UBInized. This patch brings the old behavior where attaching of
such partitions will be refused again. This is not a revert because
attaching empty flash with CRC errors will still be ubinized.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 533b1a4..7ed5c4f 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -763,6 +763,9 @@ int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
 			return UBI_IO_PEB_EMPTY;
 		}
 
+		if (read_err == -EBADMSG)
+			return UBI_IO_BAD_READ;
+
 		/*
 		 * This is not a valid erase counter header, and these are not
 		 * 0xFF bytes. Report that the header is corrupted.
@@ -1034,6 +1037,9 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 			return UBI_IO_PEB_FREE;
 		}
 
+		if (read_err == -EBADMSG)
+			return UBI_IO_BAD_READ;
+
 		/*
 		 * This is not a valid VID header, and these are not 0xFF
 		 * bytes. Report that the header is corrupted.
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 48e570c..99ed225 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -745,7 +745,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		bitflips = 1;
 	else if (err == UBI_IO_PEB_EMPTY)
 		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, &si->erase);
-	else if (err == UBI_IO_BAD_EC_HDR) {
+	else if (err == UBI_IO_BAD_EC_HDR || err = UBI_IO_BAD_READ) {
 		/*
 		 * We have to also look at the VID header, possibly it is not
 		 * corrupted. Set %bitflips flag in order to make this PEB be
@@ -756,11 +756,12 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		bitflips = 1;
 	}
 
+	if (err != UBI_IO_BAD_READ)
+		si->is_empty = 0;
+
 	if (!ec_corr) {
 		int image_seq;
 
-		/* There is an EC header, so the flash is not empty */
-		si->is_empty = 0;
 
 		/* Make sure UBI version is OK */
 		if (ech->version != UBI_VERSION) {
@@ -814,7 +815,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		return err;
 	else if (err == UBI_IO_BITFLIPS)
 		bitflips = 1;
-	else if (err == UBI_IO_BAD_VID_HDR ||
+	else if (err == UBI_IO_BAD_VID_HDR || err == UBI_IO_BAD_READ ||
 		 (err == UBI_IO_PEB_FREE && ec_corr)) {
 		/* VID header is corrupted */
 		err = add_to_list(si, pnum, ec, &si->corr);
@@ -828,7 +829,8 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 			return err;
 		goto adjust_mean_ec;
 	}
-	si->is_empty = 0;
+	if (err != UBI_IO_BAD_READ)
+		si->is_empty = 0;
 
 	vol_id = be32_to_cpu(vidh->vol_id);
 	if (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID) {
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index a637f02..dd8467e 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -99,6 +99,7 @@ enum {
 	UBI_IO_PEB_FREE,
 	UBI_IO_BAD_EC_HDR,
 	UBI_IO_BAD_VID_HDR,
+	UBI_IO_BAD_READ,
 	UBI_IO_BITFLIPS
 };
 
-- 
1.6.6.1
