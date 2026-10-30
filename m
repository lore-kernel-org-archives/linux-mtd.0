Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D579F606A325
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 20:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JK0Ytjuc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lr16xVKD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZgJFR6SQwREoRl35jvZMLB1UNpM9N8rVXEQihodk5E0=; b=JK0Ytjucdl0lWX5b3kCdPL1mz2
	7a2AU3AtyoDYlFoZFDdzYuwA/9KoUBNKRrfMM4tZ6zqFx6YQcpOVPSMu67FW2p3x8vwW2YYhUJhrg
	2o2KgoteGddIi7TghYpNKgvFxT57wPhzmeDnuA3HEkCLlNWnRcPtdXQU19F1hMqQvhlxqSiyKM+Nc
	MmWTGnzOgHXNwTcO9RrRPruDOaj+DDYuwg+8+8ziJbpS6BZ4efMDUuyIXq7J+4R51/wtdwG16uoFo
	0M1/OqIBPoO/8Sc/LTHV08QGd2Zt5iJcYzSs0KgcpCZXTTNfrpzaXTJ2Co3jKzJemt5HUOywWq5I8
	Yci+++RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtIk-0000000CXgJ-0LoC;
	Fri, 30 Oct 2026 20:34:14 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtIg-0000000CXfr-3pJp
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 20:34:12 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so1818978a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2026 13:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793392448; x=1793997248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Nw8NpVUaIYw76IIZWbK2cq2xyPR6mLCTZOaoZttbUk=;
        b=Lr16xVKDUzcftNVaEGJg6vBuKYKYH2hYuQRTpFQg0noMuo9Wi8Rb+cSZ9c8mMiWfBR
         lTadrR0mmx7X7J2n07s3+DPOjBadf4P6/DC7Bpft3IWGbqI6aJLEw+FEcSOqF9kgcQbb
         llzyzVNqZZPZKZn8SUkkeOr408qDZVP0e0q8XrICMGY/TcufRf/UORNpJrdTe6VAy1M1
         yXi1kQc+jQg2fHk4FiS62JBnQIrTwAxwhuD9Q0iTEWW13R09wvZj6ogMrolPZSU17wTS
         52dSfHXLdwC1lMzd0nc6YX9jd8LSivzQHhrREHug0GcHbDJPUCowVcOovPOk7i8cvlcz
         SQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392448; x=1793997248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Nw8NpVUaIYw76IIZWbK2cq2xyPR6mLCTZOaoZttbUk=;
        b=CSjP+XPoeINKsaVH2F8U97VOo19giOuygxmMMN3DREoIEPvjLcwasscfyWxLQEb8sg
         +DQPzyyK/5cJE0336xg74r9G3XbD4T/7kvqMMr9GZv9NiQMhASXiTVFbU9hSzkh7TwTZ
         3JBo/0TAgJ1DihPUilSV4VX5RCCGJBsAhtcp+dAW5G0kvMBHFD5V4Ar3wSla6a1HrHiT
         mQ3OS+QQqZH89Z8XH8wMvwYOERpaJ03NMWq+PKZUkuDWKVvCgguUvWCGtBJOMNtB4lKu
         PCUkzQG/QoZhpdJlTPF4I4kKynii8ngJNJJdIiubcNHTsrcr8nsm2IVFxmg15mIpe/w2
         sF0A==
X-Forwarded-Encrypted: i=1; AKwUvBwN2Sz+iug5PgFYO95942JLP86cGJCfBl9v1pWweVuEYHX70KcDFXGGLJfY6hjgzggt2Mhh45vgH9U=@lists.infradead.org
X-Gm-Message-State: AFq9FYIvMf0Mzm84cSojFAq6ibhie47BVeOY68cfm5SZD57idFHmUyzg
	S4hk8igeeedrELiV4fqs9Tadh9SkHcq/W2vUkcAe4hjWb1MwmxuchmENWp9VroihMW0u
X-Gm-Gg: AYBFou1kQfojvLPaUX+CTTxaIAEg1lk9GPMaGpsmNYc3G3tBt198/lqqIp/LBX5cQNC
	6jOvgJw8eCrwuxKtLC8vElVeaP01Wez01tB0yZoagZkXgxc3WYbCS+zVzDstb28R18gQFuu6T3c
	TwzUZDgYVowrcw9a6ZWu/X9b1Cb/wDeCkg0iwL3nljChkGKYPHJfnwlkKZ8PrVd0HEhr2FJvaNI
	NXq9z202SBu672mPBpFH2JS/JhsVzE/2KElXbd4lPTYoKBnnkZoyrJpNRijlNq4+oAmAeBNVv3T
	R+gddwYubxOgV33SkMuLFM2ecKSoZHDLajSP3PEZH+12CTPxAuWH3XbaCORBHGKo6/4hibZn5/n
	qYPJyhPsourGON1WffITqzsoDtmO/K7KRT6OFADQMaytq6WSV1P3pZm/v6GOt7TXt9Lx/jcsqaz
	90IzvII1iw8sYdyaG9m6JWBVnNKqX9GqiMxHFxm2FUJXwwAMTj32iqasbYDqsnfhOuD8uqIVq5A
	NCdXJqPbYLntWxoSlEDNr8JveXZB4R3mgNVWlK4v5s7Tot3lhL54YDE/9rW51c9ftgZYviFSE3N
	pbPddymtSwZsjZMBpzU=
X-Received: by 2002:a05:6402:74b:b0:6a5:fbc6:cad1 with SMTP id 4fb4d7f45d1cf-6b4d4687f4dmr1772470a12.7.1793392447949;
        Fri, 30 Oct 2026 13:34:07 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9eebb0sm309091a12.8.2026.10.30.13.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:34:07 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>,
	Mikhail Zhilkin <csharper2005@gmail.com>
Subject: [PATCH] mtd: spinand: confirm ready state on SkyHigh S35ML chips
Date: Fri, 30 Oct 2026 22:33:42 +0200
Message-ID: <20261030203342.91172-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_133411_001715_4E54050D 
X-CRM114-Status: GOOD (  22.62  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On a Nokia XG-040G-MD with a SkyHigh 256 MiB SPI-NAND, UBI reports
fixable bit-flips during rootfs mount without this workaround:

  ubi0: fixable bit-flip detected at PEB 1979
  ubi0: schedule PEB 1979 for scrubbing
  ubi0: scrubbed PEB 1979 (LEB 5:53), data moved to PEB 645

Other reboots also report fixable bit-flips. A tester reports that after
applying the workaround, sysupgrade, multiple reboots and an active
workload produced no such warnings. Long-term operation is unverified.

spinand_wait() accepts a single non-busy status sample. On these chips,
the ready bit can briefly clear before the device is actually ready,
allowing a premature cache read or a new program/erase command. The
fallback status read for controllers with poll_status offload does not
provide a second ready confirmation in the usual case.

Mark the affected SkyHigh parts with a quirk and require a second ready
status sample after spinand_wait() for those parts. If the chip becomes
busy again, repeat the wait while the outer timeout has not elapsed.
Each inner wait has its own timeout, so the quirk can wait up to roughly
twice as long. Leave other SPI-NAND parts unchanged.

Suggested-by: Mikhail Zhilkin <csharper2005@gmail.com>
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
Notes for reviewers:

The two ready samples are taken in separate SPI transactions, without an
explicit delay. The duration of the premature-ready interval has not been
measured. If both samples fall within that interval, the wait can still
return too early. Would a measured, explicit delay be preferable here?

The on-device result comes from a Nokia XG-040G-MD with a 256 MiB SkyHigh
chip running OpenWrt with this workaround. The linux-next port has only
been compile-tested; the other S35ML entries flagged by this patch have
not been tested on hardware with this workaround.

 drivers/mtd/nand/spi/core.c    | 85 +++++++++++++++++++++++++++-------
 drivers/mtd/nand/spi/skyhigh.c | 12 +++--
 include/linux/mtd/spinand.h    |  1 +
 3 files changed, 76 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 133776ba53da0..b051ff1d6be5c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -710,6 +710,53 @@ int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
 	return status & STATUS_BUSY ? -ETIMEDOUT : 0;
 }
 
+/**
+ * spinand_wait_ready_confirmed() - Wait for the device to be ready
+ * @spinand: the spinand device
+ * @initial_delay_us: delay in us before starting to poll
+ * @poll_delay_us: time to sleep between reads in us
+ * @s: the pointer to variable to store the value of REG_STATUS
+ *
+ * Same as spinand_wait(), except for devices flagged with
+ * SPINAND_PREMATURE_READY_QUIRK, whose ready bit can flip back to busy
+ * shortly after first reporting ready. For those, a ready result from
+ * spinand_wait() is only trusted once a follow-up status read still shows
+ * the device ready, and spinand_wait() is called again otherwise. Each
+ * spinand_wait() gets its own SPINAND_WAITRDY_TIMEOUT_MS budget and no
+ * new one is started once that span has elapsed, so such a device can
+ * spend up to roughly twice that time here.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+static int spinand_wait_ready_confirmed(struct spinand_device *spinand,
+					unsigned long initial_delay_us,
+					unsigned long poll_delay_us, u8 *s)
+{
+	unsigned long timeo;
+	u8 status;
+	int ret;
+
+	if (!(spinand->flags & SPINAND_PREMATURE_READY_QUIRK))
+		return spinand_wait(spinand, initial_delay_us, poll_delay_us, s);
+
+	timeo = jiffies + msecs_to_jiffies(SPINAND_WAITRDY_TIMEOUT_MS);
+	do {
+		ret = spinand_wait(spinand, initial_delay_us, poll_delay_us,
+				   &status);
+		if (ret < 0)
+			return ret;
+
+		ret = spinand_read_status(spinand, &status);
+		if (ret)
+			return ret;
+	} while ((status & STATUS_BUSY) && time_before(jiffies, timeo));
+
+	if (s)
+		*s = status;
+
+	return status & STATUS_BUSY ? -ETIMEDOUT : 0;
+}
+
 static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
 			      u8 ndummy, u8 *buf)
 {
@@ -733,10 +780,10 @@ static int spinand_reset_op(struct spinand_device *spinand)
 	if (ret)
 		return ret;
 
-	return spinand_wait(spinand,
-			    SPINAND_RESET_INITIAL_DELAY_US,
-			    SPINAND_RESET_POLL_DELAY_US,
-			    NULL);
+	return spinand_wait_ready_confirmed(spinand,
+					    SPINAND_RESET_INITIAL_DELAY_US,
+					    SPINAND_RESET_POLL_DELAY_US,
+					    NULL);
 }
 
 static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
@@ -767,10 +814,10 @@ int spinand_read_page(struct spinand_device *spinand,
 	if (ret)
 		return ret;
 
-	ret = spinand_wait(spinand,
-			   SPINAND_READ_INITIAL_DELAY_US,
-			   SPINAND_READ_POLL_DELAY_US,
-			   &status);
+	ret = spinand_wait_ready_confirmed(spinand,
+					   SPINAND_READ_INITIAL_DELAY_US,
+					   SPINAND_READ_POLL_DELAY_US,
+					   &status);
 	if (ret < 0)
 		return ret;
 
@@ -814,10 +861,10 @@ int spinand_write_page(struct spinand_device *spinand,
 	if (ret)
 		return ret;
 
-	ret = spinand_wait(spinand,
-			   SPINAND_WRITE_INITIAL_DELAY_US,
-			   SPINAND_WRITE_POLL_DELAY_US,
-			   &status);
+	ret = spinand_wait_ready_confirmed(spinand,
+					   SPINAND_WRITE_INITIAL_DELAY_US,
+					   SPINAND_WRITE_POLL_DELAY_US,
+					   &status);
 	if (ret)
 		return ret;
 
@@ -939,8 +986,10 @@ static int spinand_mtd_continuous_page_read(struct mtd_info *mtd, loff_t from,
 		if (ret)
 			goto end_cont_read;
 
-		ret = spinand_wait(spinand, SPINAND_READ_INITIAL_DELAY_US,
-				   SPINAND_READ_POLL_DELAY_US, NULL);
+		ret = spinand_wait_ready_confirmed(spinand,
+						   SPINAND_READ_INITIAL_DELAY_US,
+						   SPINAND_READ_POLL_DELAY_US,
+						   NULL);
 		if (ret < 0)
 			goto end_cont_read;
 
@@ -1196,10 +1245,10 @@ static int spinand_erase(struct nand_device *nand, const struct nand_pos *pos)
 	if (ret)
 		return ret;
 
-	ret = spinand_wait(spinand,
-			   SPINAND_ERASE_INITIAL_DELAY_US,
-			   SPINAND_ERASE_POLL_DELAY_US,
-			   &status);
+	ret = spinand_wait_ready_confirmed(spinand,
+					   SPINAND_ERASE_INITIAL_DELAY_US,
+					   SPINAND_ERASE_POLL_DELAY_US,
+					   &status);
 
 	if (!ret && (status & STATUS_ERASE_FAILED))
 		ret = -EIO;
diff --git a/drivers/mtd/nand/spi/skyhigh.c b/drivers/mtd/nand/spi/skyhigh.c
index bf9ce163e6a7b..19f2380b0427a 100644
--- a/drivers/mtd/nand/spi/skyhigh.c
+++ b/drivers/mtd/nand/spi/skyhigh.c
@@ -88,7 +88,8 @@ static const struct spinand_info skyhigh_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_NO_RAW_ACCESS |
+		     SPINAND_PREMATURE_READY_QUIRK,
 		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
 				     skyhigh_spinand_ecc_get_status)),
 	SPINAND_INFO("S35ML01G300",
@@ -98,7 +99,8 @@ static const struct spinand_info skyhigh_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_NO_RAW_ACCESS |
+		     SPINAND_PREMATURE_READY_QUIRK,
 		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
 				     skyhigh_spinand_ecc_get_status)),
 	SPINAND_INFO("S35ML02G300",
@@ -108,7 +110,8 @@ static const struct spinand_info skyhigh_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_NO_RAW_ACCESS |
+		     SPINAND_PREMATURE_READY_QUIRK,
 		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
 				     skyhigh_spinand_ecc_get_status)),
 	SPINAND_INFO("S35ML04G300",
@@ -118,7 +121,8 @@ static const struct spinand_info skyhigh_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_NO_RAW_ACCESS |
+		     SPINAND_PREMATURE_READY_QUIRK,
 		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
 				     skyhigh_spinand_ecc_get_status)),
 };
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index d7c99fcfb85ef..0767964275cf2 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -492,6 +492,7 @@ struct spinand_ecc_info {
 #define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
 #define SPINAND_NO_RAW_ACCESS				BIT(4)
 #define SPINAND_ODTR_PACKED_PAGE_READ			BIT(5)
+#define SPINAND_PREMATURE_READY_QUIRK			BIT(6)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure

base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
