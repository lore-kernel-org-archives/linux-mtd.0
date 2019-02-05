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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95DEC282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:10:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91AAB2080F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:10:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rhh/3Rku";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="OlHjyGwv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91AAB2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=q98q4nKYO6LAiE1Ku7DUDroBvLOJ7VzW9/LYg/IQ7rk=; b=Rhh/3RkucrcpLzyfVfoj5O18C/
	CzuznAu8fbsSMhE69i06JdZhhphlzxtDnwH27JfKwhnY5zyCi9ZTd1jAxbp6+jzgz4ai0XD11gik0
	TFrl0RExuof4aBuyXWrgxadkjW9ADCDvPv8kSASkZVIByLrTiAw3mUliCGiLETCl9rHnIqRnx27fR
	c2VODzPSx9H6x2gfqUBw0NlHIZHC2f4BvMh5JiD8IqCQ/vxK1W47ZGX+0bWjwTQxSB5ZX8B7iYuy6
	FxS/I7MfO0NarWkJTUN2tCFtwulIbjsAdC5OCI7XqslYGfLuAv1EcWKank9i9CN6xkHs/jAuGoP0h
	AAXCbarw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr1R7-0001Id-BW; Tue, 05 Feb 2019 14:10:53 +0000
Received: from nh504-vm0.bullet.mail.kks.yahoo.co.jp ([183.79.57.86])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr1PL-0006nZ-Vm
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 14:09:09 +0000
Received: from [183.79.100.140] by nh504.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 05 Feb 2019 14:09:01 -0000
Received: from [183.79.100.136] by t503.bullet.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:09:01 -0000
Received: from [127.0.0.1] by omp505.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:09:01 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 225684.91220.bm@omp505.mail.kks.yahoo.co.jp
Received: (qmail 45959 invoked by alias); 5 Feb 2019 14:09:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549375741; bh=ssXy/k0clGufVlNYlWCMwNSiy7A/NdhzVFLirntOmWM=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=OlHjyGwvCyEhgsKTgw1beaN4SBp2ftjAr4YBsfsbokG0dWffV01GOnQgcy+UTU36z9kFlBUYzdyRQs/50+H0ZtPD15IVarnaQZ9azTNSoz43XKncetuJySm8iOhTP+qAzMxrhVw8TkJgrgRX3qLJwas7+yYoLCju2LDlt3J9AoQ=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=X+lsqER+5nSk1QeJDv+l8e9vRtJhuV9FWl12OIjqk+McUv1FLdWLv1nb2NFZePmeVE4doEeyRNNucbsKsiQr76fmSchz4jby9JLkAswtXhs2U9uoV1/rrdfr3exzH5ITFeiTM6Ucdouo14AIlfkB/lXVcz23aNE5pxOrBlDXLOk=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5006.mail.kks.ynwp.yahoo.co.jp with SMTP;
 5 Feb 2019 14:09:00 -0000
X-YMail-JAS: SNNUQccVM1npwa9vxpNsKUloTREtbvV8veIWL8EUt2kNv2f_kX.zlRkdyDJeYSW1iLapjF0IPEkShqEjyo18Qv4NSZ07LbJGRXsDIBe..ugczk4ISCpog53TCNJABjM7Mh1fU3ZPVQ--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: baBQi8cVM1nwwGLsB8D_lg_HEcW1ERJLE.rp2xvpJf1bp3I
 BM5Vk41ASJJxpdEaGP03u0i0FeRDXhPogorYhemp3O.BA_JDTUM.qshExj2m
 dL.1_VPIqEwsC3JBJUP2ViDexLeNEDKZvm_WSPO0j9rpW0jdEFGd3CQvukgS
 inVJHOGJWkE6OKb_KAOCrVY0L7hFzEphuxAkzahbVEoSSPyO7GyzlnRKRhFE
 sMEJBwUdRfQi_vu5f1kparbgvCVvXbc7M3J67DTAMFuvKrnWN8P88mwLUQeA
 CCOm8WpshMKmcZLt8OfzE3nMLu4MOS_hpKFzDbJb89rbrgEAaMZw97J.pzh8
 BsMV.OVMYfSDNtbRpQyfpwqtRSffT2E9KIuVKqZz0M4Zpb6MIz5YCdF_pm.r
 3NhETXxVNTSIkQuBu8B25Wc2Gc7nminkYmvbgKJ4HX9NLLZpUGPei04X4tUp
 5yIPZTK3JhL0Q088xQIwnd967M2Bx90bS_m7.mxgexb0tdvB6BDIJVvoQ5p4
 lhRIqWjRmQG9AHDxZPUm3y9IeuNbavzVgoUwA.W5VGRi5tjrPTZVbVAKyLhD
 lNFkJx.mLonAquSeDKcrwiXk5j6c6yXTnuC4m5.r2mtyJmc9r
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH v5 11/11] mtd: cfi_cmdset_0002: Split do_write_oneword() to
 reduce exit paths
Date: Tue,  5 Feb 2019 23:07:59 +0900
Message-Id: <20190205140759.2360-12-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
References: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_060904_652318_38711247 
X-CRM114-Status: GOOD (  14.10  )
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
 linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami_to@yahoo.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabio Bettoni <fbettoni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The do_write_oneword_done() is called twice at the exit paths.
By splitting the retry functionality it can be reduced to call once.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v4:
- None.

Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 39 ++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index da48b4c..21ba6d6 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1643,25 +1643,16 @@ static void __xipram do_write_oneword_done(struct map_info *map,
 	mutex_unlock(&chip->mutex);
 }
 
-static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
-				     unsigned long adr, map_word datum,
-				     int mode)
+static int __xipram do_write_oneword_retry(struct map_info *map,
+					   struct flchip *chip,
+					   unsigned long adr, map_word datum,
+					   int mode)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	int ret = 0;
 	map_word oldd;
 	int retry_cnt = 0;
 
-	adr += chip->start;
-
-	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n", __func__, adr,
-		 datum.x[0]);
-
-	ret = do_write_oneword_start(map, chip, adr, mode);
-	if (ret) {
-		return ret;
-	}
-
 	/*
 	 * Check for a NOP for the case when the datum to write is already
 	 * present - it saves time and works around buggy chips that corrupt
@@ -1671,7 +1662,6 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
 		pr_debug("MTD %s(): NOP\n", __func__);
-		do_write_oneword_done(map, chip, adr, mode);
 		return ret;
 	}
 
@@ -1691,6 +1681,27 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	}
 	xip_enable(map, chip, adr);
 
+	return ret;
+}
+
+static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
+				     unsigned long adr, map_word datum,
+				     int mode)
+{
+	int ret = 0;
+
+	adr += chip->start;
+
+	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n", __func__, adr,
+		 datum.x[0]);
+
+	ret = do_write_oneword_start(map, chip, adr, mode);
+	if (ret) {
+		return ret;
+	}
+
+	ret = do_write_oneword_retry(map, chip, adr, datum, mode);
+
 	do_write_oneword_done(map, chip, adr, mode);
 
 	return ret;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
