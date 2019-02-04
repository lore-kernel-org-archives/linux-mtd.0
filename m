Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0F6C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:22:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756DD20821
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:22:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lmRFmlm2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="WS8Cl8BK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 756DD20821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=T224RpeRB9qFGaJG+rWgIAX156w1c3xpq88avggypCM=; b=lmRFmlm24nB9S3eI37q7HGHLGX
	llTV4pUErivbPJXPoCAI/69B79FN7eqRdN5ytnrS+Cyhg03AaTd1EntFVGLgYe51wmf4cdAc6R80J
	ibTDLXGF7OwA7UKxQ4JbUPxBFN8BPrRmEbMSeKZFu2nIwpYaxwIMpqWHt+6HletF+OStrj7/k8sur
	2EQsIoahMl5djaU4jmV1wt1BJGdh1fr/Yt28G4+AjvtHJfC120eqbuq0oiudXsaeO8MG0rlZeyHV2
	gGlTiYF7RgIxuYVK+9Nv4vsKrCW0QSL2NqzWTuaSDs9ztDmiBYHi6qK8r5IGY4NmRvC6IMFLMjfcW
	REYX9cFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqitI-0008A7-8A; Mon, 04 Feb 2019 18:22:44 +0000
Received: from nh503-vm8.bullet.mail.kks.yahoo.co.jp ([183.79.56.194])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiqq-0005jG-SU
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:20:24 +0000
Received: from [183.79.100.138] by nh503.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:20:11 -0000
Received: from [183.79.100.134] by t501.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:11 -0000
Received: from [127.0.0.1] by omp503.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:11 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 137341.85057.bm@omp503.mail.kks.yahoo.co.jp
Received: (qmail 42048 invoked by alias); 4 Feb 2019 18:20:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304410; bh=EI0eqf1hIccwOuuRqTXviSc3NLAFbx2J8Ofx9+0L2vA=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=WS8Cl8BKeolM7rks9D+qe2onSXDqOasI7JtLDCVf2dJAyFtxb6Pa+jOWteX/7mrS7POQ+ZVidzgKA4Pg11nUSe0ynz4PEtGHrZV7T1CUiHCrrcWwfnccPCki08ozenoFQCvmvCDgp880zhbXBf5fnucTuU8QNJpYEGolL8/AWeA=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=Y3YXnYUuBccXNerJvZaBsNxxvt7crLhHFsucGY3R/HOs6fvT+BxCjsfIFcaibNIwSfIl0OmJzfNCEXG+eVTn+9WoWw2TfgMytGrOHBanOJAV4sgfT4lGOQHBN1OITiDH1y4oCtUHZL1WO8kelIPnJSOAKU1cTW8TqJHZmkN99r8=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6006.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:20:10 -0000
X-YMail-JAS: RtmTJv4VM1nf4e1VQbHkp6qLbY3vmJfj2fQcSHUA6LwkhM0t8SSb3SEydt.pAJACsRifURPlY1qCnOBSvB0SgsGtVzi84vrE_PmGnKo9wUGOvfON2dnbHkpjohPTJdxxEBtG_texLw--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: WsVw0DwVM1mVpiHDhhdB5.ntpejrpirs_vOzkiWjUPFQ8pa
 SNZ7uKUN4FWOY2IJmC25O1f9DU0EJvt4CdPngKx3l0ROMLXCz9W_jTluANtr
 MTrysbILBTMxk5OoTmT_txOIBalfSXmEOfx5Oh7bArot17NUw4Shzs6FRcrW
 7c4vAYQPimPV6rUFqDig03h.FEQFpEH.T8xGP26Z8NHMFAMemgPYUvCeO903
 dkgwVcLylrtej6XrZLrJcnuh.rbWj_m0p1zKoXxOi2y1Oh8FWR7HTfWXMGGD
 MyyzJh3dNx73XH.B8STUPI1KXH2eoi0JSbJwB3a.0mGPiA5qzeVkjQdc07Ib
 htjy6NvMp_n7p9R2ReLCk29OrJCaE7nVUgLseYo7vokP4p4iy0nD0U6WaqQU
 6o2B5NXYjFTikTgVYh.i0Rqwod8kYWtNePWH_6r08EO.V2QUo_UeTTKcj8iM
 f_ZXhe7Lmgt4h.LmuOtFdtJkf7Yb4Z.prv8rrQ0d.yK9wpjpPLMvnTLwt5di
 l15y00.6wzVx9yq.8Y4XQOmP0sS.CY8x3Lc7havpkLFXzy8Xc2g7Vnx33e9x
 V8tpnDWdTd76xqvXsxfb2ZIJFD7PPHYf9Bxu6AcOS_nE.obM-
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [RESEND v4 05/11] mtd: cfi_cmdset_0002: Split do_write_oneword() to
 reduce function size
Date: Tue,  5 Feb 2019 03:19:58 +0900
Message-Id: <20190204182004.29894-6-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102013_195750_46BDF64F 
X-CRM114-Status: GOOD (  15.56  )
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Tokunori Ikegami <ikegami_to@yahoo.co.jp>, linux-mtd@lists.infradead.org,
 Fabio Bettoni <fbettoni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Reduce the size of do_write_oneword() by extracting a helper function
for the hardware access.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v3:
- Drop the unnecessary comment and blank line.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Just update the commit message for the comment
- Add Reviewed-by tag.

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 89 ++++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 92d3e82..6393af4 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1547,11 +1547,10 @@ static int cfi_amdstd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 				   do_otp_lock, 1);
 }
 
-static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
-				     unsigned long adr, map_word datum,
-				     int mode)
+static int __xipram do_write_oneword_once(struct map_info *map, struct flchip *chip,
+					  unsigned long adr, map_word datum,
+					  int mode, struct cfi_private *cfi)
 {
-	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo = jiffies + HZ;
 	/*
 	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
@@ -1564,42 +1563,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	 */
 	unsigned long uWriteTimeout = (HZ / 1000) + 1;
 	int ret = 0;
-	map_word oldd;
-	int retry_cnt = 0;
-
-	adr += chip->start;
-
-	mutex_lock(&chip->mutex);
-	ret = get_chip(map, chip, adr, mode);
-	if (ret) {
-		mutex_unlock(&chip->mutex);
-		return ret;
-	}
 
-	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
-		 __func__, adr, datum.x[0]);
-
-	if (mode == FL_OTP_WRITE)
-		otp_enter(map, chip, adr, map_bankwidth(map));
-
-	/*
-	 * Check for a NOP for the case when the datum to write is already
-	 * present - it saves time and works around buggy chips that corrupt
-	 * data at other locations when 0xff is written to a location that
-	 * already contains 0xff.
-	 */
-	oldd = map_read(map, adr);
-	if (map_word_equal(map, oldd, datum)) {
-		pr_debug("MTD %s(): NOP\n",
-		       __func__);
-		goto op_done;
-	}
-
-	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
-	ENABLE_VPP(map);
-	xip_disable(map, chip, adr);
-
- retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
@@ -1642,7 +1606,52 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 		UDELAY(map, chip, adr, 1);
 	}
 
-	/* Did we succeed? */
+	return ret;
+}
+
+static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
+				     unsigned long adr, map_word datum,
+				     int mode)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	int ret = 0;
+	map_word oldd;
+	int retry_cnt = 0;
+
+	adr += chip->start;
+
+	mutex_lock(&chip->mutex);
+	ret = get_chip(map, chip, adr, mode);
+	if (ret) {
+		mutex_unlock(&chip->mutex);
+		return ret;
+	}
+
+	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
+		 __func__, adr, datum.x[0]);
+
+	if (mode == FL_OTP_WRITE)
+		otp_enter(map, chip, adr, map_bankwidth(map));
+
+	/*
+	 * Check for a NOP for the case when the datum to write is already
+	 * present - it saves time and works around buggy chips that corrupt
+	 * data at other locations when 0xff is written to a location that
+	 * already contains 0xff.
+	 */
+	oldd = map_read(map, adr);
+	if (map_word_equal(map, oldd, datum)) {
+		pr_debug("MTD %s(): NOP\n",
+		       __func__);
+		goto op_done;
+	}
+
+	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
+	ENABLE_VPP(map);
+	xip_disable(map, chip, adr);
+
+ retry:
+	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
 	if (ret) {
 		/* reset on all failures. */
 		map_write(map, CMD(0xF0), chip->start);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
