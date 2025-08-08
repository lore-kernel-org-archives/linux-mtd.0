Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE154C87FDA
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 09:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APLRWwQi/cTIE0OhAhGM/n1heD81Nd3qt8WnvK386Ow=; b=r5IAbQSSgMvoDl
	lGqthVUkeXVdFHV1K2GNUvuRf2YdHhry8TSHRGdyi9LbRoX5X69kVdlU641BuZymCPNikZlfI/w8h
	LaG8gTzFDl4g9FOk4fC/mvaDFzIG582yNW/2py5KjUvSohGDVFLKC6M/b6RdvSWrnnPLaljRicP3Q
	HRDl0rsmG0duBIT9FJKIsXjTVVC5U9itrLF+lRQ7IesyAiwGsdY3Cl260qBrLb/tBoEnvTV3sZVgw
	PCZHfz1iSMGvZvjN0V4h+k8iMxySqGiSwIT2zojDRQPtsVz/Txdx1vz1wIhAqZ/BxfbZuzToaYnB4
	fAnpF+5NL/Vn52hbHdMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJqY-00000002VBr-1Z7x;
	Fri, 08 Aug 2025 09:57:10 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJqW-00000002VB6-1o9e
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 09:57:09 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b390136ed88so1513920a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2025 02:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754647028; x=1755251828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vmKjWW1myNVQEZSQomIGtvbv8eIPEiLrdMSovGeNIY=;
        b=CYW6WiFslF3Sk8VKKvILQLuvixQ4CBT624FzA6nG9p9YB5OVr6a+KOCW44Dz16q4gh
         vvIto0bsm4sCpEOwEr55/USvs8Wl8kwi9q3fY8v+i4L0agvU+6C112eUhNSGXdiOtGU/
         lRVH5rk02v4FJVG7YMfRh505uS20/cEXUSmmsAWO1QfMOaMjGg37FRq/6tFmJm2P2zUH
         OVU2RECt6x0iojFHYN5ahwVvXcVuAjXcyszER/jIR3X6yd0/jAIWr993Q6goBkgCPeEk
         E/WUwwr0ZTDuxllAkml5fovNpkqum847GX9BNvbqLJ6UxF/pMts/cfFAXA9+2IVDECp/
         jrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754647028; x=1755251828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vmKjWW1myNVQEZSQomIGtvbv8eIPEiLrdMSovGeNIY=;
        b=rHJKjtiirbqUSLVnA0zfTo2h/orbbQhhwM/4nnlyk4HonhUavC5UzkrK6wmVVKmZFr
         zRfF9LE1uPvDkRQfhDNAl6+63vJJ/7l+myJNVlnuGWZhAH66Jps6PWWDeFcteta7KRgS
         KxarRtfEcL5s4EgLRBzPa7sdvcGMDBIODw2N7VsWu01ij32EC4huBQchBBMUZS7DuJEk
         RnyaSQB9BkuzunGstKfY7+299LeMjzWdAej+VsXVzHvl4NH3UYQRTmwkDKeqzE4l+uou
         rllF8XJkLjs+SlWD6XHoiUf0yjalyH9I+C4iraPjmNPcwbMuqEQeHhyYDML198Y4RIaL
         7Z8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBmjXMGR8w98CJ4ohRzDts4pDj5xfzlT//sdCZOiHGzhmNW9u+b3SfLqt29SzMQu6IM5jNu0OYQC8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBlLDwIExAGeZXQPVkULOSCccQrXqtP8tnqdsqeAuiij0JFylE
	RhbiLUjeL7BbQri0A9ZdugMYOtmNM+LvMESnlbIckuLJthVaVDmpTJLL
X-Gm-Gg: ASbGnctDqMAvcQZppvpSUYaa0JLKiyK6y5mPnfTGal7NM1DhkmAojdpk2V4uhEVS/dL
	LS6IlkgLfTCxk+j8G7c8hWebWG5GKXdQvVWMOG0ntqi25V02hXupw63YZg10V6/sj1dCy4eKhkO
	pnrA5CHx0xUatU9s9yTDD2KmH8vjSlSgJMHSStQd6xhAbIjNa33Ui0dpSfa6PrNuJpx2aIgfV7F
	EdSsCTJzQAdCduLyABj3nLHMaue9km2Apci+1JkqrxaVO0byNDb89VcwL2BW3v+e4RDEH9EfVjQ
	UF0vJiDXtcKbC8HcgXsZa4npi7hdNLFCsY+f4WmO7z7q9zSXjiTxPmKpBfYeEAoT6I9QacyX1gL
	cpbTMr6vJWKP6jzY0HLdq1Dkei+MMNjnEbeEZEt3vT8AYlCKB6VTnrzcC
X-Google-Smtp-Source: AGHT+IFxSlFjgGlX3SR7lGGDbtjjgA3/KdcOW6YRHUwFy2xGZWAKh00xM2XD3tfIzpmP6ms02kZyfw==
X-Received: by 2002:a17:902:f790:b0:240:71ad:a454 with SMTP id d9443c01a7336-242c1fd9671mr37529925ad.1.1754647027481;
        Fri, 08 Aug 2025 02:57:07 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef66efsm204467915ad.32.2025.08.08.02.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 02:57:07 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 38A28801D4;
	Fri,  8 Aug 2025 18:02:36 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 1/2] mtd: spi-nand: Add support for randomizer
Date: Fri,  8 Aug 2025 17:55:02 +0800
Message-Id: <20250808095503.906244-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250808095503.906244-1-linchengming884@gmail.com>
References: <20250808095503.906244-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_025708_473168_B83A2B47 
X-CRM114-Status: GOOD (  15.26  )
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

Add randomizer operation support for user data scrambling.

For more high-reliability concern, if subpage write not available with
hardware ECC and then to enable randomizer is recommended by default.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 18 ++++++++++++++++++
 include/linux/mtd/spinand.h |  7 +++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index b0898990b2a5..43ed5de282c5 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -854,6 +854,19 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
 	}
 }
 
+static int spinand_randomizer_init(struct spinand_device *spinand)
+{
+	int ret;
+
+	if (spinand->set_randomizer) {
+		ret = spinand->set_randomizer(spinand);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static bool spinand_use_cont_read(struct mtd_info *mtd, loff_t from,
 				  struct mtd_oob_ops *ops)
 {
@@ -1366,6 +1379,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->user_otp = &table[i].user_otp;
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
+		spinand->set_randomizer = table[i].set_randomizer;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
@@ -1543,6 +1557,10 @@ static int spinand_init(struct spinand_device *spinand)
 	 */
 	spinand_cont_read_init(spinand);
 
+	ret = spinand_randomizer_init(spinand);
+	if (ret)
+		goto err_cleanup_ecc_engine;
+
 	mtd->_read_oob = spinand_mtd_read;
 	mtd->_write_oob = spinand_mtd_write;
 	mtd->_block_isbad = spinand_mtd_block_isbad;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 27a45bdab7ec..80a5c6ac6cc5 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -499,6 +499,7 @@ struct spinand_user_otp {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: enable/disable read retry for data recovery
+ * @set_randomizer: enable randomizer
  *
  * Each SPI NAND manufacturer driver should have a spinand_info table
  * describing all the chips supported by the driver.
@@ -525,6 +526,7 @@ struct spinand_info {
 	unsigned int read_retries;
 	int (*set_read_retry)(struct spinand_device *spinand,
 			     unsigned int read_retry);
+	int (*set_randomizer)(struct spinand_device *spinand);
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -578,6 +580,9 @@ struct spinand_info {
 	.read_retries = __read_retries,					\
 	.set_read_retry = __set_read_retry
 
+#define SPINAND_RANDOMIZER(__set_randomizer)				\
+	.set_randomizer = __set_randomizer
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -633,6 +638,7 @@ struct spinand_dirmap {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: Enable/disable the read retry feature
+ * @set_randomizer: Enable the randomizer feature
  */
 struct spinand_device {
 	struct nand_device base;
@@ -673,6 +679,7 @@ struct spinand_device {
 	unsigned int read_retries;
 	int (*set_read_retry)(struct spinand_device *spinand,
 			     unsigned int retry_mode);
+	int (*set_randomizer)(struct spinand_device *spinand);
 };
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
