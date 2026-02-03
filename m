Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C74EE83041
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Feb 2026 02:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CyhlNoKMPIbz4Y9atn+xE9ldcyaK0NshNlmNcPzPuUU=; b=OpyI++aklHXkqY
	K5EW7L5HTdsywsTvhVmkO+smH3G7xMKnjG3RjGJZLcwkLuNB8eVAz48zT0+prVpG9XGc02eIOiAUy
	1E7efCm5qNu0Al4Qw8Q6lpKK6uwplF+1VvCrphXi1PMdggaH4YG1G1OsiC4x6tm3FfaTPT3q6Slhp
	o1Y/Eopp/2LLS6n4wzU/4N+Z/jDqJbJIqNIshap91e+3ALLoVcUdQOF/uvedPQw01LsDduyC9l9V4
	TUF78oqZz3CAmwD7hAcJ5p/+RE/wTZ1zH1j0iol4UvGH3Kb0ECLdjpwvAh5EN87IL1Hvq4NsttQr2
	KoZAJFWI08OF1tw64dWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5wk-00000005uJF-0Tfn;
	Tue, 03 Feb 2026 02:15:18 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5wh-00000005uIG-2rzZ
	for linux-mtd@lists.infradead.org;
	Tue, 03 Feb 2026 02:15:16 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a91215c158so12656225ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 02 Feb 2026 18:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770084914; x=1770689714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+m0ZlyNgN/46S9/lck2vc53iLlFG3jEpqMgtswMP8s=;
        b=Vq/x7K/Qgxt6uR5wesE2WUOENr0SNKt0DwSmSadayGIQxjrJR90UsoxmlOMa6lfr3s
         T3ab+CMWLyEGt4p/0VK6w2Yj18UjjjoCerjuss7OjGwt1YcjLCUC12rqjmEV2FuB2Nhi
         KNvJ7M4S3wkOK/cCdf6KyujyFiC1Ur4TQZO3T8OwkhJDvtgL0p8d6k7Ifk7zcSYwoJf8
         gFWYhPc+9PH0wdx1xrrEDCa5zgMNhJZlWB5OCL1hW81HJHCP83farxT6LogX1PU2Qaxx
         7diF0ZLnAUMTw63mfPQs7Y4Llx1NahYf/X6VT+/RABCKe+kP1D4VAnzPZe8ULBXjAN2K
         /WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770084914; x=1770689714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+m0ZlyNgN/46S9/lck2vc53iLlFG3jEpqMgtswMP8s=;
        b=NYoznzd77AaUpnTi5FNubKMBdrJrWJzCBkgQ8RHYQLCvKQiDCU5oorLiHh3V8iBX2N
         NxN53AHgcKtrF5featFPS4UXwK/fq+cKqVIYM79sbkJr72aQEuxktm/bG4MRugs4BLQ1
         6bEkFDlnkbILW4FT17+lQqSyxViiQHcuOOCH0XpPW73sOnN3vNyeM96XOEBtyZyffa10
         zpSrjTPSdCLbuIRrqDR7AQ3mGGtu7lboogC5YMgMAW51W7onQ76Q0qKzZxJETn1BHguZ
         5Uwb+Z6PKdAzzqupL51y/AIiQBhIjpiEask/7FqX/qGvPSijrsOQeiYiwX1Qtuj0E+3u
         cJiw==
X-Forwarded-Encrypted: i=1; AJvYcCXzJiH3AI5K5ZTKNasfI3EpXsxvBqnWHFZwQKhQCaly51S0rBarSTnON4TO/K0FCfp+NSRfHymT7l0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2S4n0P3MUb6u534LsVNnPKaTxCmuYomKc8x3s9x6TQ3Of/t3S
	K1rOGpa6wWcNx2KfA/3pyipISOXV4TLJ5lrTiDA9HE2PxvJCowH319pfcbVrYA==
X-Gm-Gg: AZuq6aLcuxu0Ktzg3f1hdVRjqFcg4G43XTTqKnDw65BnwU3CXqZat9GGWtMAk+ks++J
	mZLaqWzvLemnD3RdSq5uSXFEEChWy1tRyh6AWUW3UTs3QqQvnH5yVx9dJmv5D7LoP2+s6qxnsuC
	WRLK+kPTAEfkoVaOij/brzlqV5yCSFt18V71lwJB/GMMD+dEZc7zjWVpZQm2oo3f65EMg5Yt5Wm
	vaHNzy1bFWol6NGnD34qDC/gPKh7T1OP7FJWXnSy9Pac95+t0J48m48YqmYHxMkwQ188XdVhMQX
	GcKGSARb0USPZ2YT1NheaUN5gJUH1iQyI5d2fOp7txN7qoKzKNAmj+2Z1X8EwveLpR3QfmV7U0H
	KWEzde/aOqyGQek55NOFKuQW7IdCVveqm07z3PQwnlFPmlHQrn9MsQndIsIPtH0yfRMSCwVQsXb
	Sfs/vasL3fmhbu5R94aEPPOqgT3wC5ch6JRw==
X-Received: by 2002:a17:902:ce08:b0:2a1:3e15:380e with SMTP id d9443c01a7336-2a8d815068bmr122304815ad.34.1770084914335;
        Mon, 02 Feb 2026 18:15:14 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414fc4sm160271425ad.32.2026.02.02.18.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 18:15:13 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 2DCEB4136074;
	Tue,  3 Feb 2026 10:15:12 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v4 1/2] mtd: spi-nand: Add support for randomizer
Date: Tue,  3 Feb 2026 10:13:57 +0800
Message-Id: <20260203021358.693291-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260203021358.693291-1-linchengming884@gmail.com>
References: <20260203021358.693291-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_181515_723968_374C3625 
X-CRM114-Status: GOOD (  16.65  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

This patch adds support for the randomizer feature.

It introduces a 'set_randomizer' callback in 'struct spinand_info' and
'struct spinand_device'.

If a driver implements this callback, the core will call it during
device initialization (spinand_init) to enable the randomizer.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 23 +++++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index d207286572d8..4f8ff94f5ccc 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -206,6 +206,12 @@ static int spinand_cont_read_enable(struct spinand_device *spinand,
 	return spinand->set_cont_read(spinand, enable);
 }
 
+static int spinand_randomizer_enable(struct spinand_device *spinand,
+				     bool enable)
+{
+	return spinand->set_randomizer(spinand, enable);
+}
+
 static int spinand_check_ecc_status(struct spinand_device *spinand, u8 status)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
@@ -1218,6 +1224,19 @@ static int spinand_create_dirmaps(struct spinand_device *spinand)
 	return 0;
 }
 
+static int spinand_randomizer_init(struct spinand_device *spinand)
+{
+	int ret;
+
+	if (spinand->set_randomizer) {
+		ret = spinand_randomizer_enable(spinand, true);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct nand_ops spinand_ops = {
 	.erase = spinand_erase,
 	.markbad = spinand_markbad,
@@ -1412,6 +1431,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->user_otp = &table[i].user_otp;
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
+		spinand->set_randomizer = table[i].set_randomizer;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
@@ -1588,6 +1608,9 @@ static int spinand_init(struct spinand_device *spinand)
 	 * ECC initialization must have happened previously.
 	 */
 	spinand_cont_read_init(spinand);
+	ret = spinand_randomizer_init(spinand);
+	if (ret)
+		goto err_cleanup_nanddev;
 
 	mtd->_read_oob = spinand_mtd_read;
 	mtd->_write_oob = spinand_mtd_write;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index ce76f5c632e1..e01315a71222 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -501,6 +501,7 @@ struct spinand_user_otp {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: enable/disable read retry for data recovery
+ * @set_randomizer: enable/disable randomizer support
  *
  * Each SPI NAND manufacturer driver should have a spinand_info table
  * describing all the chips supported by the driver.
@@ -527,6 +528,8 @@ struct spinand_info {
 	unsigned int read_retries;
 	int (*set_read_retry)(struct spinand_device *spinand,
 			     unsigned int read_retry);
+	int (*set_randomizer)(struct spinand_device *spinand,
+			      bool enable);
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -580,6 +583,9 @@ struct spinand_info {
 	.read_retries = __read_retries,					\
 	.set_read_retry = __set_read_retry
 
+#define SPINAND_RANDOMIZER(__set_randomizer)				\
+	.set_randomizer = __set_randomizer
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -635,6 +641,7 @@ struct spinand_dirmap {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: Enable/disable the read retry feature
+ * @set_randomizer: Enable/disable the randomizer feature
  */
 struct spinand_device {
 	struct nand_device base;
@@ -668,6 +675,8 @@ struct spinand_device {
 	bool cont_read_possible;
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);
+	int (*set_randomizer)(struct spinand_device *spinand,
+			      bool enable);
 
 	const struct spinand_fact_otp *fact_otp;
 	const struct spinand_user_otp *user_otp;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
