Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB00C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:17:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021492082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I5K8NzoO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="iqgWxxvM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 021492082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dLNGI3VfhYWcIkxJ7UAWgUJjADWa9m52jgidmZsPFOU=; b=I5K8NzoOodbu8bujDOwSyFJ56b
	9SDWkWHplSXbhAZ7Sc1gvmBjssf/IAOMGwoBRpgGxJQUD0iiPTzH+mXhWdPhlIW4qLkHkz6nzGfwe
	DFriqETfGltO8f0+4vAeAWP0q20Bmsrtz6o9UBXgNbPfroQoRNarW6uRNAep0LCotiNE04hUf/sM8
	6GaQoOZQ4Q8sEAgAgLJbr+neVHWVRtGibDGijP+7547Vi1w+Be0Qla124wACPs6PvZb8WFHH43HB5
	LRLV5+vQYbzsOeQu/UtLzjR5PHEiW4Tg8FSwt8GcFJRWTHn4uSZUw/lnKSdDf4Pj8uDxwgt+5ntTI
	PTOtHe9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiny-0003NW-W4; Mon, 04 Feb 2019 18:17:15 +0000
Received: from nh503-vm9.bullet.mail.kks.yahoo.co.jp ([183.79.56.195])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqimC-0001Wf-57
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:15:35 +0000
Received: from [183.79.100.141] by nh503.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:15:21 -0000
Received: from [183.79.100.134] by t504.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:21 -0000
Received: from [127.0.0.1] by omp503.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:21 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 707439.85057.bm@omp503.mail.kks.yahoo.co.jp
Received: (qmail 97127 invoked by alias); 4 Feb 2019 18:15:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304121; bh=dxTt4iYtXQRo7ldsfwhz/ngQEAeYWGc0osJyvdryYDg=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=iqgWxxvMu2S37otJlsq2Q8GuLUekRwDwlp/ZCO1zz9vMVd+BjiYiEtBoP3BorXfq0oMTfsBdOf6lEc9tG4MkeH+A1Ku1KOlaVh0ll03rRRof5sJAnQ4Fc077rV7sXNBinHmPb3fSmeoSUdy41wfpukyrj8lbQwG7xOY0JNXfbkw=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=SWWeydXUeDN1LbVUg65EwgJ4xj0U8c21Kjdpc4/pn9K3tkKjdxPFSvCARNyussVMcgtoUG/CbYGABQR963wdU9LdbMMh6xB5Zr+ZyvSTTLwiD2vMrGB/jWC2SFmb9QVSmQqMXmApWAQh3vh0mPjZzk2zy3bng20D0shRs6lQX7I=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:15:21 -0000
X-YMail-JAS: kJkpLooVM1nhyIVxLqv32eLbKa89e3a_wqG0I.KOLRuQoO6Bs67r.UeY5IBCNJYyu8D0vJZDvPnSME5kfVhwD.XduZWBu9BD1CMPJHWv8cdCHkckOrDzJMaUfEjeSfl_VITNxly5pA--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: L3TnKY8VM1nTb6vvL_xOpB1p7YwzzDzhei8WzA80R1UQ6x7
 hfwwceoXM5YHg0foh5YWkt7AUlh6mhgFXo_H_1SY61fAiFxNJUYFFbppfbo_
 pkIIZ7zNxu2xixawYTr53u5WWFyws9e.MDbPl6wkLJyjGmB7jzdk0FpfsM2E
 HBl8ktck4uRKrhCHYXqz14vFC0VlDbkLE9OFUJwtKC8RAi13h1YAqtdlWGyQ
 pnjo27q8RHCeFoiXWeiFGOE2wn_wsL8iB0r9msYtAdUQEx5f2zgyDwb8bVyw
 xdTzW_wS3GohqjWBOqqwePsuNNBcehG7OSXXt29o4P_3JVCgghP4vGTv6VfV
 Apa9m0R_729irzwlzR_Kd51ZELt01S3YuuZspzRKWcxuIjOIYDrfm6SmZ1FC
 CHph4YxebYXC.kV0xP435KD5oYtKDIFukYW.4AyQG8sesw8wZD2t5tXvWd17
 .Sc4aSuTv.zsI98_XBby50rMWcj7ggK4sV1IehWl7JTHx0RkumIW4ISNG_bv
 VxgpJ978EJoWTiyUJAWYBzSdOWOf3V9bnHLRf6Wu7kGzUVUKQ.j2FAgSVPHA
 W7O4xt6u_p96hnZfqKrkFhfc.VdU.3zYpkVrLRorz6Wty2BO2
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RESEND v4 10/11] mtd: cfi_cmdset_0002: Split to wait write buffer to
 check if completed
Date: Tue,  5 Feb 2019 03:15:04 +0900
Message-Id: <20190204181505.29841-11-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
References: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_101524_646956_06208DE2 
X-CRM114-Status: GOOD (  15.12  )
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
