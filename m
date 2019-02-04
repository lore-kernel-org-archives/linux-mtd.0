Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9544C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:16:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8738B2082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:16:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X4MzPfXl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="LEXxZkJR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8738B2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=H4W9LrI+F00HpnkbggGLvXv0EAExEfkpL1r6acGN/CA=; b=X4MzPfXliBrOo9FvCoiQTYbPod
	YB4uD9kJ0siYf/7cjJVoOr719y5Q7H23xbf87re5Aj1SjwCNbAwqqBlbgjwLiRzoTrMN7fqMk5QnV
	xWhJuJgTRsTAFNqgBKQdJTpBRF2r83MwKXcszA9sO2fEtlIaF4unoONlmKXyCa6HGQlBgWBNQGcWu
	cU894I5AMg4xlppVLgNuh5E/I3KhrfxJWiitb6lf9m4BBfYl3MsRA6FTsSdx5i8divnKuVPsfUjy6
	/BIEaULaClOScVg8oeLbmA/6C+xt+e5Mw30iucQxu9lQEH34cCRnEpppLwDwX+V0aiMboNmOdZvff
	+lhRU9vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqinJ-0002hg-1g; Mon, 04 Feb 2019 18:16:33 +0000
Received: from nh503-vm3.bullet.mail.kks.yahoo.co.jp ([183.79.56.189])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqimB-0001WC-Lq
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:15:26 +0000
Received: from [183.79.100.139] by nh503.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:15:20 -0000
Received: from [183.79.101.120] by t502.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:20 -0000
Received: from [127.0.0.1] by omp507.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:20 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 221702.18248.bm@omp507.mail.kks.yahoo.co.jp
Received: (qmail 97055 invoked by alias); 4 Feb 2019 18:15:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304120; bh=zT2mdO6m25fvRZEtKBL/+Foi2kn+9CbnK4vgganWpQQ=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=LEXxZkJRIO3kBiZH0mbdo+I9qeryRwuG/d/271TTTuG2Ej4KJHI1JHx/iLpblW43PbIqXaK6GXWMCQ8/cn+tpVHtDNuMvOrAoHsGdfcBKLpVPNnKUKmkCwYKX1YeJb7+H2ieSbbZFuMABoHc//hy8Q3TidoeBGrQNRyQithGzFk=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=uxJJRF98uZZzKqIFeomuaST24keBvWH1r586YEn5y8M2920SnyaFGZz5OA8tOeNl2WHuP6ml5rLyp4v3eha0RmKGo9fp6Bs4R1wEpe9jC2k1s5Lj2ih1/tHTXwzcO6H7zper0ri5vAPK58N2+HabeAHcLMazqNOB9vN4YxpoEd0=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:15:19 -0000
X-YMail-JAS: T18F8y0VM1kX8Lut44qNDqRKqQXOtlWEgnYz4OPQqrKh_GnZATKBXc4qMcXkmcMq1BNYy.6HEqavlP2iK_Z7GN2Ji2egLfrgr7deoXOm7g3_TisNhStvOHJsKJwkvAISLswWgb1h2Q--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: LrTShK4VM1lKKs1noNsUlSAIU1eduAYZ2ZrymtcljiK9GyA
 Z4Ja4JVDmBuI5Va1fRpSP1uC6izocXuLOqBZHQsrp3edGwCEl93LtL5vxOG0
 Tbwp_5da.6XWBKBgxE8m358BB_sb9zxdRSX0eC0rk3bVsgLDYma6ILE1b1eR
 8cElb4GRmlpsNsge59atczgMbxOVtiBi709WgTcXd_615dfRqMS0JlCggdjt
 7FzaLls5aXSctWhi5GNz6r5vh6fs0.salcaqlA4fExwDDL7h6Sv7n.s8B2ey
 GO4xTdKtE1xRwjMKzHUCWAJen.pDbrGNNqQAjQTk0yR2cc8wKsrLMZ3yCIL4
 6U_ELwmTUT8kRgGtNIpPaY9PoXXPPcknbk1rc9yHm2PX6GIIWetHELIm_zSH
 EbJVDt2y_4m_G_LHnJZMCre_Gxfir8KnFqTu8U4jL69jfPEb3_3W4VSOMOT3
 aXgqwHtCj5aMB8Q.pe4LkvPZo1X6RXpJNCypcwd9RhzmWrxSOLAvMf2SZ8J5
 wttQj8d9pKENB2nk9POz.t8YC6_ktQVBHq1QDGhttf1mm_ePszgX.NgXimzD
 jj_nGf1P4ZCwxzIbBCVkZzseVQ8murdIVouv9jviWB4GtEzs1
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RESEND v4 06/11] mtd: cfi_cmdset_0002: Split do_write_oneword()
 op_done goto statement
Date: Tue,  5 Feb 2019 03:15:00 +0900
Message-Id: <20190204181505.29841-7-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
References: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_101523_950431_E92D7ADB 
X-CRM114-Status: GOOD (  14.39  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Tokunori Ikegami <ikegami_to@yahoo.co.jp>, linux-mtd@lists.infradead.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabio Bettoni <fbettoni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

To reduce function size and remove the goto statement split the op_done goto
statement part into do_write_oneword_done() created a function.
Also split the start part into do_write_oneword_start() to find easier pairs.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v3:
- Rebased on the patch v4 01/11.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Change to split the start part of do_write_oneword() additionally.
- Fix indentation to call pr_debug().

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 57 ++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 6393af4..a11dc40 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1609,6 +1609,40 @@ static int __xipram do_write_oneword_once(struct map_info *map, struct flchip *c
 	return ret;
 }
 
+static int __xipram do_write_oneword_start(struct map_info *map,
+					   struct flchip *chip,
+					   unsigned long adr, int mode)
+{
+	int ret = 0;
+
+	mutex_lock(&chip->mutex);
+
+	ret = get_chip(map, chip, adr, mode);
+	if (ret) {
+		mutex_unlock(&chip->mutex);
+		return ret;
+	}
+
+	if (mode == FL_OTP_WRITE)
+		otp_enter(map, chip, adr, map_bankwidth(map));
+
+	return ret;
+}
+
+static void __xipram do_write_oneword_done(struct map_info *map,
+					   struct flchip *chip,
+					   unsigned long adr, int mode)
+{
+	if (mode == FL_OTP_WRITE)
+		otp_exit(map, chip, adr, map_bankwidth(map));
+
+	chip->state = FL_READY;
+	DISABLE_VPP(map);
+	put_chip(map, chip, adr);
+
+	mutex_unlock(&chip->mutex);
+}
+
 static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 				     unsigned long adr, map_word datum,
 				     int mode)
@@ -1620,19 +1654,14 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 
 	adr += chip->start;
 
-	mutex_lock(&chip->mutex);
-	ret = get_chip(map, chip, adr, mode);
+	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n", __func__, adr,
+		 datum.x[0]);
+
+	ret = do_write_oneword_start(map, chip, adr, mode);
 	if (ret) {
-		mutex_unlock(&chip->mutex);
 		return ret;
 	}
 
-	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
-		 __func__, adr, datum.x[0]);
-
-	if (mode == FL_OTP_WRITE)
-		otp_enter(map, chip, adr, map_bankwidth(map));
-
 	/*
 	 * Check for a NOP for the case when the datum to write is already
 	 * present - it saves time and works around buggy chips that corrupt
@@ -1641,8 +1670,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	 */
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
-		pr_debug("MTD %s(): NOP\n",
-		       __func__);
+		pr_debug("MTD %s(): NOP\n", __func__);
 		goto op_done;
 	}
 
@@ -1664,12 +1692,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	}
 	xip_enable(map, chip, adr);
  op_done:
-	if (mode == FL_OTP_WRITE)
-		otp_exit(map, chip, adr, map_bankwidth(map));
-	chip->state = FL_READY;
-	DISABLE_VPP(map);
-	put_chip(map, chip, adr);
-	mutex_unlock(&chip->mutex);
+	do_write_oneword_done(map, chip, adr, mode);
 
 	return ret;
 }
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
