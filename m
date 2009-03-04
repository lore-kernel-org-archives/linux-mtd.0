Received: from mail-ew0-f172.google.com ([209.85.219.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lern1-0006q1-HW
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 14:09:42 +0000
Received: by ewy20 with SMTP id 20so3059442ewy.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Mar 2009 06:09:37 -0800 (PST)
Message-ID: <49AE8BA0.7060903@gmail.com>
Date: Wed, 04 Mar 2009 15:09:36 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
Subject: [PATCH] onenand: test before subtraction on unsigned
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

len is unsigned so will wrap around when sizeof(struct otp_info) is greater than
len.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 529af27..7c2ebe9 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2296,11 +2296,12 @@ static int onenand_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 		if (!action) {	/* OTP Info functions */
 			struct otp_info *otpinfo;
 
-			len -= sizeof(struct otp_info);
-			if (len <= 0) {
+			if (len <= sizeof(struct otp_info)) {
+				len = 0;
 				ret = -ENOSPC;
 				break;
 			}
+			len -= sizeof(struct otp_info);
 
 			otpinfo = (struct otp_info *) buf;
 			otpinfo->start = from;
