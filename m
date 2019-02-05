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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77D0C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:10:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E7B52080F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U3BVsQz5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="U0/4CQiE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E7B52080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mOgfXmPHgHrzlAx2C1NSpB71v29EkT12sAp3BTdZLT0=; b=U3BVsQz5+ivQvjc8OVIFGpP8k8
	1UT33kJmx4MTG3EinzHc+PR6rZrdAdVMkQzmL6IGaD8y/hRQPUpWlNsvdovQta6V5BKNWw0W83TbJ
	VKLlgGPAZim1oDjsn5dy5aze8sYflH3rfMmDfe6132KSU4Gy2CNyP+jN6sAQFaClduTlcz/X4FCVw
	ZcnFUU9GgVkl0uMGmUo5JDv/SIMynPP2JVq4gBueL2yiSg8xDq1q3x4XY135OfQw5pllyJf5mjo+i
	GVIIQ/A5TzlH9GhdGtBoZdE9WAEda3ECYJ5mHyzT+SflgwdZEqfz0SQfPrYjY9q6WwrCITT5l+jZX
	vxqGpiqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr1Qr-000144-K0; Tue, 05 Feb 2019 14:10:37 +0000
Received: from nh502-vm6.bullet.mail.kks.yahoo.co.jp ([183.79.56.151])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr1PM-0006lU-J0
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 14:09:09 +0000
Received: from [183.79.100.138] by nh502.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 05 Feb 2019 14:09:00 -0000
Received: from [183.79.100.135] by t501.bullet.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:09:00 -0000
Received: from [127.0.0.1] by omp504.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:09:00 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 647378.98394.bm@omp504.mail.kks.yahoo.co.jp
Received: (qmail 45914 invoked by alias); 5 Feb 2019 14:09:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549375740; bh=Tvp6/aggrzOr9Ma4guV/srFHIw/qdJtfsXRRvjueahM=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=U0/4CQiEc1imTLP9gtfPyjdtuKZ43UvQRxsy3QOEu8TsE3fJjdyoVbxhb66+h/ZJ+HkPcfF9QiM3cyI2ph3jXkKIkbia83CHpFSiINJpt5pup5uDvbvv8k07EfqNAeE9UlEQ/Hb+8zSzBK7dh7jPbMjOcMxWArnVqpO2tF6lmcQ=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=Zwysqz+LE//hRP63UEguPdy3zAxfH1+x21FPEwRfTek326Qc4LZiUxoNgP0dehdGTcEqhcoEEYhhsyjRe/9/QzT+20Oc+Xq5vfZnvCLbDfH7TXzHCtnmtqEp0185eADzjWc80EzJOWR/8OQN7fpn4LHIUiKXRV9HwVbCaO53TyY=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5006.mail.kks.ynwp.yahoo.co.jp with SMTP;
 5 Feb 2019 14:09:00 -0000
X-YMail-JAS: SNNUQccVM1npwa9vxpNsKUloTREtbvV8veIWL8EUt2kNv2f_kX.zlRkdyDJeYSW1iLapjF0IPEkShqEjyo18Qv4NSZ07LbJGRXsDIBe..ugczk4ISCpog53TCNJABjM7Mh1fU3ZPVQ--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: _OErKFcVM1moMod7n8Uw2Xx0I2zK_QsjPQJLw0mnK7n5adS
 yFQT_uE29edOBeZFVMQVReDvmp.Hwomf754MR4_hq3TTyMCXclPctsoPAiLD
 wlteHSk0v3Os4A..XINs1vTXI3SkPTQfCRWDtQOLoZUFUd.cWwa5Oc9rU71p
 JPcWcVzIG4BZFe4TZaUyMkDTbwzeAlXwckc7.iDF.19wJtwCUFR5gFxzUU2q
 kAiI6W58MuCoG__8VQqTpD.Iz9VoYEkbuKxG90PzxjkUebBkaBO7V5GfFnG7
 h5CbiLtGMeXwRWJOc20gBnZ7IhnQHAKe.tXZIv0HUqbWSx8Jc5Q2xe3Znaql
 Do_wdbAfniKdBi2iyhF533abS2wvV9BqqNKe6h_ty5HxOaFm_TNtj8IM_cNL
 ZmQaZ.FwCIbBnmf.jbFTWbLLj1lbfYvR39Dgn6M5wpjEmU0s.jsh29lgx9AS
 GVVw3QNV5nDh8F7GUQo5mLXClIekQ__qmDLBpCI.Znn2Ld14GO7q7xxa1_BP
 e0hWFsGPusIKhqfdmGPhKdd5DefEYbCgORg7gNS87nUl20526tX4oLWKPZ_j
 BYH.NgWkz9UaCL1gdoLq2_cIGdyo.oqAIYEbTdVz3_Urxmymi
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH v5 10/11] mtd: cfi_cmdset_0002: Split to wait write buffer to
 check if completed
Date: Tue,  5 Feb 2019 23:07:58 +0900
Message-Id: <20190205140759.2360-11-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
References: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_060905_385740_0DB4690A 
X-CRM114-Status: GOOD (  15.34  )
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
Cc: linux-mtd@lists.infradead.org
---
Changes since v4:
- None.

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
