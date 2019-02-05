Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75133C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:09:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F26F2080F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:09:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DsLJ+bOJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="IdNpvFhH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F26F2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qio+lBKBI0UBo0xvoPnQfPLCOm0QUXO0ZifmyjEuHuw=; b=DsLJ+bOJ+y75eeT2xuioV2OUVV
	CowHAxfJ7Xc5xhNZAYEWnSuZzk635/xsItA/TPbo9DwgkG1p3DkiVZioiN51zLUuXp3ZItARIOK1n
	GfMQhFGwE9viZOxTk3wB/G+18Q6IfUkEBRezRJPJ/+ah4dYRR9j9kkam5S0Rb37EwcPX1sgoONtcz
	zlCBxE/UVlg6+v/MqZmseAX5bta2dkZPKxFHNx5a+xJSegYu3+wv9qA/60MnwDo9yuP4mvRMWKuXW
	q7bORz+WvGwp/ScmyKRyvT4nq4gz4u22gwC8QAprP3hGg28DEah+cU4d3h/Xsfv/l/DsVHhZ/6Eaw
	gakRKyTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr1Pn-0007D2-8Y; Tue, 05 Feb 2019 14:09:31 +0000
Received: from nh503-vm4.bullet.mail.kks.yahoo.co.jp ([183.79.56.190])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr1PI-0006lV-Ix
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 14:09:04 +0000
Received: from [183.79.100.140] by nh503.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 05 Feb 2019 14:08:57 -0000
Received: from [183.79.101.120] by t503.bullet.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:57 -0000
Received: from [127.0.0.1] by omp507.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:57 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 408139.19935.bm@omp507.mail.kks.yahoo.co.jp
Received: (qmail 45703 invoked by alias); 5 Feb 2019 14:08:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549375737; bh=HjpJs3bdlyLLTPHWvab8XDGrkndoAnTeJGTuXQEwJLg=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=IdNpvFhHaLu4HhdBtk6GW+Q3s8E7z5RFNJ015UhNTmbmtHiHyL6AwLWjYzGOaammzz8i+FcC5ti1ip+p4cdoJdTaSJKZNu3a+z48kJN61Ly9ezxU6qyT2Kje3Aqae7v2MnkwI6nGsF2ckiVZ+UoF8KSKp6JpRoRs5QMP5VSpcL8=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=J/yS1J8FAXIhVqUTwtToGhqXOSfegOebCP3Wd+vo8yMVnvjJtwlJeyLc1t/Npwj3OY0rwzytV2dg5Zg5G+6ABpL9SoxliLJOReJXAeybw0yGrxl4Ff3fn/98Kf8fCGMBCBip3l8Lsr1C+7wQqfwnPvPY8q83RKM1qSMVImPQSIU=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5006.mail.kks.ynwp.yahoo.co.jp with SMTP;
 5 Feb 2019 14:08:56 -0000
X-YMail-JAS: l80whe8VM1l4m9r5qx5kCZeD5W0fSKcGfG.dhbJvYEoxx5M5TDjy4PTZzYuuQ36PQGa9pDAUgD.LPw3OBcFelInD37GOK_LPQHGGsIMLHCy2iFV5oyKqty4wbDLg3GtMcRmKSARMYw--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: ZUd8DUUVM1l7JkrgkxsnQMeNMRbG3o7Hamm66vboRqkdQgH
 4l6yx1DeiXQBGeAKL6PfAIiR2DxKcCTt_UWnkGkQchZSWGDKiikIVk4YbUmy
 DZFuyHH_JBtZocKYAJ2Y5PfIVi8yHUDvgDgK8lW_sMcaAAsnvFPVN4AY5fMY
 NMgd.p9ePyV7Rc7jm.JjMv0P.AEDPvJD8ENxMhM2aHDpe6uiQuhfN.yqYr0Q
 By9__aTMH26QN_3Tm28nDAs2tsOeJ2JBCyFqeB4Ppp7KOV15e9jdrW_EVex0
 IKPlfS7EeXFujBdBxlMcu0kWWxoqZSgpTK431GYvLQD1S04W0kIP008jlc.h
 UsH6CX65umFc54tsKvLYsfsTtJwsXq5YQBSWGbBoVknVIAmJROfFSZ2l5Gcx
 wvrSA.XAqmnbPcpmyFB5oOZ3BrE3Bt1qg9IxyRy7fuSN1BPU_xxfv9cPNKWZ
 h9ble1MJKk8KzQiDkxDNeonwcVOYnjm6Hazg8Jw5eIl9tmIClGrFeH61OELU
 i_Yxepdnh.IZxty8cck913HVt3zMMRPkRBQJ2SBDc2I7jQ_T6R0.LqhKaAxU
 dak6AO0zbAJiVOcCw1RcOemkrnizmBaY6ULe1fywZ5psDI.4-
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH v5 05/11] mtd: cfi_cmdset_0002: Split do_write_oneword() to
 reduce function size
Date: Tue,  5 Feb 2019 23:07:53 +0900
Message-Id: <20190205140759.2360-6-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
References: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_060900_950027_19097E5C 
X-CRM114-Status: GOOD (  16.21  )
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
Changes since v4:
- None.

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
