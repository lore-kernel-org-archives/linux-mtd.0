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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9ECC282CB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:52:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A522080A
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:52:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dhhV1VPa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="p20XX0Z9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20A522080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dLNGI3VfhYWcIkxJ7UAWgUJjADWa9m52jgidmZsPFOU=; b=dhhV1VPaP4Pzjxjabpy/XfIgMN
	KBX9kHw1SBvmnEXAlLwpASnqIf9Qw5hMkFJevzAxQoqbTNhtY3uqekIc7a1gTZLMbXlhdz5CWy6LT
	gdLlbA6m3WiTpPW7LPHamX+NoM3IdHaVUG5CAMUmQ1v7kucEeEIlmsAFoXLz83t054RPlXlriPHb5
	VvA92FDtfEG2nMkV6IwOr+lsPYZf/pzGOO8AGJYj1d4gQCw2B3uLr/aPhTdKOEStJxgZ+HV/xStsQ
	ELYeytAZ1HAkVVwy9/JkuwHnitbNjMevocAYyB8MAxujynFa5MwYG4UpgLf1nf41c53l5fLP8Yfsd
	IOANxGYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiPQ-00014u-5a; Mon, 04 Feb 2019 17:51:52 +0000
Received: from nh605-vm2.bullet.mail.ssk.yahoo.co.jp ([182.22.90.75])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiAn-0002Qn-Rg
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 17:36:56 +0000
Received: from [182.22.66.104] by nh605.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:43 -0000
Received: from [182.22.91.132] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:43 -0000
Received: from [127.0.0.1] by omp605.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:43 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 820590.80484.bm@omp605.mail.ssk.yahoo.co.jp
Received: (qmail 78269 invoked by alias); 4 Feb 2019 17:36:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549301803; bh=dxTt4iYtXQRo7ldsfwhz/ngQEAeYWGc0osJyvdryYDg=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=p20XX0Z9J3JTJUckZQc5gF3N4f9S3GklqrsyLvJLDqhSgvmqdSpkrg6z2PbdhFcI2XHfbXHGTqID5dMM2WdN2U55C8yz8+dHgM8XK6cqx9cyT37FxjbvD4rfSWVxT4mBvvjjcXpAJ62hlmQVoL3HT4RkqVoQxG1xxlKbqrg9zGw=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=hYc2gTo2QvFfMszB4Z9YKM4gT4ADXxo+3a2XofcPbx+wVEi3qNhFuFpJpkpC3vDvCMmFC2X70WkwZnfZVDRFVONdQ+T8G00v4m2vDjQfyVmzVjRa0bD7S12pVT2IWkMs4RTp+dWwjlGWR95wSVZqZdPPzoNwXALkIMwBJdBg6g8=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 17:36:43 -0000
X-YMail-JAS: yrjq4swVM1lv9T9t1g5HNomk3JO7tPtyWi3Rldhn6dDGM.WcKKvbqu5QXXAT_IlkszMOSNy_.57ERJU2iG8Yprks83ltnDVbCvV2v3M9cP1LaiH2pnEWcgI6gFcQawpSyd9gZ41ktQ--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: 7SMC0P8VM1kOCkHalpS75YiTt_NUPU.Dueh3uJBRgcdSynM
 pVBcOkHGnbN.8PxJ9jMAOt1xSmTjfJLL5kVtjdPpALJl8XkhHp8WDAYXjqjR
 drT.vTBmCQXXUGjuGj1xfv4dW8T8zh4jnD1X8NIxAxU5gMDEE6u4Ix2OEX_K
 IORKN7t_o4OjI7lb5nMSCaYPDOvDC7ufDfXrvlpl2g268cVUOcfDCyhwvcwM
 kvN6erMnlqP.ypAa08eVRwBpXXqY4FFKDlKeRZmqX8LEn0225ljDMZZD2SzC
 B.c5qiPehTrOlTv5IQrnYNrfz9rQper14nStZLxETUkwa.iyL7.jo4yFMyzV
 HTGFALjpzR0qOkyswkzVzS6G3Wq82QBRt_cO4eL1TWMO2qHOZFqzW6IXtITl
 uOD7qxF0pWCXtKP1NGTcSJQUJcaUQai9k4deQJaS_a94EpNlVF3a_gkxPONY
 CRyU2OkfRf..uFvseM.jwW45XTGox..xtHI3ix147uFC3xewlqyj6VlSIKX_
 ylcQ6tr64yXACyo2um.uqB9OmbhUxg537OlOroJ15tREftzG05m2H0zScCvE
 4wTDXCyxXL.HkCGv.ZJGywDfYB4J2r5drvdwQG0HsfKWh5E2L
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 10/11] mtd: cfi_cmdset_0002: Split to wait write buffer to
 check if completed
Date: Tue,  5 Feb 2019 02:35:49 +0900
Message-Id: <20190204173550.29703-11-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_093646_248549_CC87C5C0 
X-CRM114-Status: GOOD (  14.82  )
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

Just refactor to split the wait from do_write_buffer().

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
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 81 +++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index d5954bf..da48b4c 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1820,6 +1820,51 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
+static int __xipram do_write_buffer_wait(struct map_info *map,
+					 struct flchip *chip, unsigned long adr,
+					 map_word datum)
+{
+	unsigned long timeo;
+	unsigned long uWriteTimeout;
+	int ret = 0;
+
+	/*
+	 * Timeout is calculated according to CFI data, if available.
+	 * See more comments in cfi_cmdset_0002().
+	 */
+	uWriteTimeout = usecs_to_jiffies(chip->buffer_write_time_max);
+	timeo = jiffies + uWriteTimeout;
+
+	for (;;) {
+		if (chip->state != FL_WRITING) {
+			/* Someone's suspended the write. Sleep */
+			DECLARE_WAITQUEUE(wait, current);
+
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			add_wait_queue(&chip->wq, &wait);
+			mutex_unlock(&chip->mutex);
+			schedule();
+			remove_wait_queue(&chip->wq, &wait);
+			timeo = jiffies + (HZ / 2); /* FIXME */
+			mutex_lock(&chip->mutex);
+			continue;
+		}
+
+		if (chip_good(map, adr, datum))
+			break;
+
+		if (time_after(jiffies, timeo)) {
+			ret = -EIO;
+			break;
+		}
+
+		/* Latency issues. Drop the lock, wait a while and retry */
+		UDELAY(map, chip, adr, 1);
+	}
+
+	return ret;
+}
+
 static void __xipram do_write_buffer_reset(struct map_info *map,
 					   struct flchip *chip,
 					   struct cfi_private *cfi)
@@ -1850,13 +1895,6 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				    int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
-	/*
-	 * Timeout is calculated according to CFI data, if available.
-	 * See more comments in cfi_cmdset_0002().
-	 */
-	unsigned long uWriteTimeout =
-				usecs_to_jiffies(chip->buffer_write_time_max);
 	int ret = -EIO;
 	unsigned long cmd_adr;
 	int z, words;
@@ -1913,34 +1951,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				adr, map_bankwidth(map),
 				chip->word_write_time);
 
-	timeo = jiffies + uWriteTimeout;
-
-	for (;;) {
-		if (chip->state != FL_WRITING) {
-			/* Someone's suspended the write. Sleep */
-			DECLARE_WAITQUEUE(wait, current);
-
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			add_wait_queue(&chip->wq, &wait);
-			mutex_unlock(&chip->mutex);
-			schedule();
-			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ / 2); /* FIXME */
-			mutex_lock(&chip->mutex);
-			continue;
-		}
-
-		if (chip_good(map, adr, datum))
-			break;
-
-		if (time_after(jiffies, timeo)) {
-			ret = -EIO;
-			break;
-		}
-
-		/* Latency issues. Drop the lock, wait a while and retry */
-		UDELAY(map, chip, adr, 1);
-	}
+	ret = do_write_buffer_wait(map, chip, adr, datum);
 
 	if (ret) {
 		do_write_buffer_reset(map, chip, cfi);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
