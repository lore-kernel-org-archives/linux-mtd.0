Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EC1C46CD4
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Dec 2023 13:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JGSDGt76upsD49K9o6EDgPqqvYoinf0HdhusBdI1GKo=; b=BPPJOPrsnK0Vmf
	EkD5XaHmgxl5fIPr6SxDM/iWDoTMRBRSnnYbiveyhjEjM0NJ6UCx1p10P9Q3SYzRAC6C6Hbhp8cIE
	biesbah/p99KSD5y/l71JXwHWjqCiXYyGMKkbysPnus65kN3CkHoYbFa/gDxAhF5TBANawR50Nt8l
	lB/e0FSuJ8bJbZKPlkNjAsKKWhvK93kjP8z3h7q8b59onZHZiXsXSLT4U4VEjLxIspAHqVkMvQorR
	LT7fKAXBRHDs5fq4fEPVVnc5mtRrWrSIKq6KcM6TX5MGXTTxXfAvub7TuMIhRQsEPYEPExAMmeayG
	xCH9OpbO7LsYkvyRlGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJDNM-0010Sb-39;
	Fri, 29 Dec 2023 13:58:12 +0000
Received: from mailserv1.kapsi.fi ([2001:67c:1be8::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJDNI-0010Rz-1z
	for linux-mtd@lists.infradead.org;
	Fri, 29 Dec 2023 13:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Uuw+WxMCJEyjifVT1xr3A7m5oLTq/jZeNbIxOjUJKW8=; b=FygJJ3knaa+e6wUklrROK0OiiC
	jW/GeqZUrKbdGa8GEl/LH3Ftf6u4d2XzgRXeSee45OfkmHzqFwhOgs33sO4C4iAWAonY5CDB9+1u8
	JL503gQ603ipaxMVpphBercEwXJC3FOsHxwY7AkSewYTgpC2OWbis57W9SuKsz5TzHjrHwWcRX41k
	i2DGr/3EXL97OFn0wxrRUh7aom7KzKBBDQBN3hijJf0dapLpuvBmzUpHpgmlZD4T00I9Al3n367Kk
	VE9LeB+u5OV2xYTB6fX8/Ty38IojRQiJrrMjnmRrCd1NH83BPV4Nmtmbrne7gLFpOITZUp/o4J/xg
	b/HUNrxg==;
Received: from 87-95-52-44.bb.dnainternet.fi ([87.95.52.44]:39105 helo=mailserv.kapsi.fi)
	by mailserv1.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <maukka@ext.kapsi.fi>)
	id 1rJDMb-000suY-0Q;
	Fri, 29 Dec 2023 15:57:26 +0200
Received: by mailserv.kapsi.fi (sSMTP sendmail emulation); Fri, 29 Dec 2023 15:57:17 +0200
From: Mauri Sandberg <maukka@ext.kapsi.fi>
To: linux-mtd@lists.infradead.org
Cc: Mauri Sandberg <maukka@ext.kapsi.fi>
Date: Fri, 29 Dec 2023 15:56:53 +0200
Message-Id: <20231229135653.4764-1-maukka@ext.kapsi.fi>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 87.95.52.44
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
Subject: [PATCH] mkfs.ubifs: Add option to minimize the amount of LEBs
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_055809_169979_A9601E41 
X-CRM114-Status: GOOD (  18.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use case for the new option would be when you want to have a
non-mutable filesystem in a static ubifs volume and another
volume for writable data.

Currently you can find the minimal LEB count by running the
mkfs.ubifs once with too small max_leb_cnt. This patch uses
the already calculated minimal amount of LEBs as the max_leb_cnt
and then proceeds to create the image as usual.

Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 40 +++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 8f8d40b..02ca337 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -141,6 +141,7 @@ static int do_create_inum_attr;
 static char *context;
 static int context_len;
 static struct stat context_st;
+static int minimize;
 
 /* The 'head' (position) which nodes are written */
 static int head_lnum;
@@ -163,7 +164,7 @@ static struct inum_mapping **hash_table;
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
 
-static const char *optstring = "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQqaK:b:P:C:";
+static const char *optstring = "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQqaK:b:P:C:M";
 
 enum {
 	HASH_ALGO_OPTION = CHAR_MAX + 1,
@@ -202,6 +203,7 @@ static const struct option longopts[] = {
 	{"hash-algo",          1, NULL, HASH_ALGO_OPTION},
 	{"auth-key",           1, NULL, AUTH_KEY_OPTION},
 	{"auth-cert",          1, NULL, AUTH_CERT_OPTION},
+	{"minimize-lebs",      0, NULL, 'M'},
 	{NULL, 0, NULL, 0}
 };
 
@@ -258,6 +260,7 @@ static const char *helptext =
 "                         for signing\n"
 "    --auth-cert=FILE     Authentication certificate filename for signing. Unused\n"
 "                         when certificate is provided via PKCS #11\n"
+"-M  --minimize-lebs      use minimal amount of LEBs\n"
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in Kilobytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
@@ -420,8 +423,11 @@ static int validate_options(void)
 		return err_msg("too large LEB size %d, maximum is %d",
 				c->leb_size, UBIFS_MAX_LEB_SZ);
 	if (c->max_leb_cnt < UBIFS_MIN_LEB_CNT)
-		return err_msg("too low max. count of LEBs, minimum is %d",
-			       UBIFS_MIN_LEB_CNT);
+		if (minimize)
+			c->max_leb_cnt = UBIFS_MIN_LEB_CNT;
+		else
+			return err_msg("too low max. count of LEBs, minimum is %d",
+				       UBIFS_MIN_LEB_CNT);
 	if (c->fanout < UBIFS_MIN_FANOUT)
 		return err_msg("too low fanout, minimum is %d",
 			       UBIFS_MIN_FANOUT);
@@ -432,13 +438,13 @@ static int validate_options(void)
 	if (c->log_lebs < UBIFS_MIN_LOG_LEBS)
 		return err_msg("too few log LEBs, minimum is %d",
 			       UBIFS_MIN_LOG_LEBS);
-	if (c->log_lebs >= c->max_leb_cnt - UBIFS_MIN_LEB_CNT)
+	if (!minimize && c->log_lebs >= c->max_leb_cnt - UBIFS_MIN_LEB_CNT)
 		return err_msg("too many log LEBs, maximum is %d",
 			       c->max_leb_cnt - UBIFS_MIN_LEB_CNT);
 	if (c->orph_lebs < UBIFS_MIN_ORPH_LEBS)
 		return err_msg("too few orphan LEBs, minimum is %d",
 			       UBIFS_MIN_ORPH_LEBS);
-	if (c->orph_lebs >= c->max_leb_cnt - UBIFS_MIN_LEB_CNT)
+	if (!minimize && c->orph_lebs >= c->max_leb_cnt - UBIFS_MIN_LEB_CNT)
 		return err_msg("too many orphan LEBs, maximum is %d",
 			       c->max_leb_cnt - UBIFS_MIN_LEB_CNT);
 	tmp = UBIFS_SB_LEBS + UBIFS_MST_LEBS + c->log_lebs + c->lpt_lebs;
@@ -800,6 +806,9 @@ static int get_options(int argc, char**argv)
 		case AUTH_CERT_OPTION:
 			return err_msg("mkfs.ubifs was built without crypto support.");
 #endif
+		case 'M':
+			minimize = 1;
+			break;
 		}
 	}
 
@@ -847,8 +856,12 @@ static int get_options(int argc, char**argv)
 	if (c->leb_size == -1)
 		return err_msg("LEB size was not specified (use -h for help)");
 
-	if (c->max_leb_cnt == -1)
-		return err_msg("Maximum count of LEBs was not specified "
+	if (!minimize && c->max_leb_cnt == -1)
+		return err_msg("Maximum count of LEBs or --minimize-lebs was not specified "
+			       "(use -h for help)");
+
+	if (minimize && c->max_leb_cnt != -1)
+		return err_msg("You have to specify either --minimize-lebs or --max-leb-cnt "
 			       "(use -h for help)");
 
 	if (c->max_bud_bytes == -1) {
@@ -876,7 +889,8 @@ static int get_options(int argc, char**argv)
 
 	if (c->log_lebs == -1) {
 		c->log_lebs = calc_min_log_lebs(c->max_bud_bytes);
-		c->log_lebs += 2;
+		if (!minimize)
+			c->log_lebs += 2;
 	}
 
 	if (c->min_io_size < 8)
@@ -888,7 +902,10 @@ static int get_options(int argc, char**argv)
 		printf("\troot:         %s\n", root);
 		printf("\tmin_io_size:  %d\n", c->min_io_size);
 		printf("\tleb_size:     %d\n", c->leb_size);
-		printf("\tmax_leb_cnt:  %d\n", c->max_leb_cnt);
+		if (minimize)
+			printf("\tminimize:     %d\n", minimize);
+		else
+			printf("\tmax_leb_cnt:  %d\n", c->max_leb_cnt);
 		printf("\toutput:       %s\n", output);
 		printf("\tjrn_size:     %llu\n", c->max_bud_bytes);
 		printf("\treserved:     %llu\n", c->rp_size);
@@ -2553,7 +2570,10 @@ static int finalize_leb_cnt(void)
 {
 	c->leb_cnt = head_lnum;
 	if (c->leb_cnt > c->max_leb_cnt)
-		return err_msg("max_leb_cnt too low (%d needed)", c->leb_cnt);
+		if (minimize)
+			c->max_leb_cnt = c->leb_cnt;
+		else
+			return err_msg("max_leb_cnt too low (%d needed)", c->leb_cnt);
 	c->main_lebs = c->leb_cnt - c->main_first;
 	if (verbose) {
 		printf("\tsuper lebs:   %d\n", UBIFS_SB_LEBS);

base-commit: 9471c13faf76ff05f58d636b988bb066ad6d05fa
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
