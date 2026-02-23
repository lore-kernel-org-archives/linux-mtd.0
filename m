Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD152E98DED
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Feb 2026 06:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agWjBNvEyHwv59Rit1U3lGwBAITSDkCKsUwmU7ifsjo=; b=TaO+5oHgGuaTrq
	1eHGhUVfIi0CsgSYi+UipOM5k5pg7SYEnyIJrLQJzEkBV5lSqRX9jZvH0CRvQFVZHF2v2ZV68aTG6
	tsBrFief8qUZtEhVbMC+kLH3XKdT2agVZtQ6N+LmQZkfd9YDJaL8w/eP6s8nXZP7+/alO9GNPC+q2
	hTikMXcr4Rl6Yc95aNGqyatQcPzHdXQxVAMx3339Fjf7kpXk0I2V7r7lPmQOukUZcoLu9YErw9zyo
	1DaobqhYXwCObFMCHCj/PG43ZJozFVldmpbBQHK0ogunHF0VYn493EFYbmbZ+U06b0IebXSlhMdRh
	LVmx+gjdFThRPUmwQWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPIF-0000000HHwn-2BSu;
	Mon, 23 Feb 2026 06:19:43 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPIC-0000000HHtD-0WkN
	for linux-mtd@lists.infradead.org;
	Mon, 23 Feb 2026 06:19:41 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-354b20c1112so2385911a91.3
        for <linux-mtd@lists.infradead.org>; Sun, 22 Feb 2026 22:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771827579; x=1772432379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nILoW48W9hqLRwmHITphjoIJRhEY+2JRSNwPbSj3wbI=;
        b=Dzlyfb4EUMTqR8L3UpjgAQcZjHv0KjYIoWe+KJTZWP8u0Nt+iKwZGzu/u/KXZG2woy
         Z249a9V8Eh1NkMff54G/mTuk53ZnIbhC/bgWb6B/rV7uq/9SfhfLRvWt3xRW0tfIjwE+
         5APKv8VRHHH/Zh8X9OtudCT7KA6y4cZrAYoz2Vq7qg7IElx1YjSBxwHoAamzqyMld9L4
         KHtnGASpGMndwk9woesMyYHNtuqPKqncrhxgTLDDwnzRXWoaT/GIUGArukVvi0+M3Ex+
         jdA7OyQCJ4V5QY6L/vTF0gUZ0kpCJ83Bun2CtOEmlrxkctH/OBA9E8SlpqQKcKi10heW
         g1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771827579; x=1772432379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nILoW48W9hqLRwmHITphjoIJRhEY+2JRSNwPbSj3wbI=;
        b=i3Md23XSJ9isW502v5CWVitzHXrAIwyp0yQ9lIo6TW/fmQvrwYQ5hbo7DqO3UFvEZ+
         eK+BGPyInEV+/Tmf1/Ng2ns++D1/5ymR0H+HPMjLwf2FWbL0ygLMl2ZqSFOeuEUfFPUd
         2lDAfLdu4JvU7u7cQhzwM+x2ImZEQz3/FixQdK7G9+7NEUOC+BEL6tnsBWWOSQ6zBh8y
         f4E5LDbiA3jrO9fg+ZNEdTHbAuQcGM4HqvOIAHyFEOApToGIpP+WA+e5BZYUiGOF+Aj1
         Un2leD2FWP8tNOgAou21ryR8X6JD0spZ+GQzEqR8YLym6NVqvCm//5BjkZdy+Ygi4TGc
         zimQ==
X-Forwarded-Encrypted: i=1; AJvYcCURw5hfH7Np1bnSl6Uvz/iOKnYOD9maI0iwY4ysO6YuOYCTBCQEmZpLfb4ivjOF+gKT0cYrVXiqKzA=@lists.infradead.org
X-Gm-Message-State: AOJu0YygV83sW/so7mYvsqYZmi3cKyb0r/29+dv1XlLMBOruj051gxNk
	KR8RuHVJTUDA2lUI4DOkGZPP/Yuvj6eiKwXp1UF3+1ByEj/tkdIGG4V1
X-Gm-Gg: ATEYQzx9qYHkbACXPwGUoeQpNGUSAze6mdk+JpPb2VUXuY6FWd0LPfsSEdb0dSgU2PI
	q1ubWqSae43jBgarxSoQGs9ZVfmTOasjcCPV30UNyuw6HtboN2lRTiZ2W35VR60mVAIdqMvY5ve
	Gs/DeUJ6xQGnt/NIfeXGBihMKzrNy+ftucEZpw/GpzkElAV8LJbPJ3W3sT77TCLQxbRs/q8ukIy
	CbAfAritz4hq8mklR92udZk8DtNs0PHqmqfe/7pADAeFk258KmdviXBMQwPMQ27TcN+qlq5zbym
	znXRLheT53NF5y2lRoDEGFgFIE8pDT4/dR5S7UB0n2m6FtwLAadkmceffmQiKdTr+Hgnxh10VKA
	KMh1M3+I8o2iu1mrG0V1Yd3IAcyrImT8NolKdcZG3nCbZrVKNhjneYpKFzFMOX6X6xc8T/wPNGh
	3SUg2HfTHsms+QZ50XND+Y47NWdo/MLdufFtjzAQO2PwEcDA==
X-Received: by 2002:a17:90b:498f:b0:354:a76e:7f08 with SMTP id 98e67ed59e1d1-358ae6a4304mr5524288a91.0.1771827579168;
        Sun, 22 Feb 2026 22:19:39 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d8e3e73sm9340820a91.15.2026.02.22.22.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:19:38 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id E38AD4136075;
	Mon, 23 Feb 2026 14:19:36 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>,
	Tianling Shen <cnsztl@gmail.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v6 2/3] mtd: spi-nand: Add support for randomizer
Date: Mon, 23 Feb 2026 14:17:05 +0800
Message-Id: <20260223061706.1027986-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260223061706.1027986-1-linchengming884@gmail.com>
References: <20260223061706.1027986-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_221940_178705_779C5736 
X-CRM114-Status: GOOD (  17.14  )
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

If a driver implements this callback, the core will invoke it during
device initialization (spinand_init) to enable or disable the randomizer
feature based on the device tree configuration.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 27 +++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8aa3753aaaa1..77a0371010c4 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1307,6 +1307,29 @@ static int spinand_create_dirmaps(struct spinand_device *spinand)
 	return 0;
 }
 
+static int spinand_randomizer_init(struct spinand_device *spinand)
+{
+	struct device_node *np = spinand->spimem->spi->dev.of_node;
+	bool enable = false;
+	int ret;
+
+	if (!spinand->set_randomizer)
+		return 0;
+
+	if (of_property_read_bool(np, "nand-enable-randomizer"))
+		enable = true;
+	else if (of_property_read_bool(np, "nand-disable-randomizer"))
+		enable = false;
+	else
+		return 0;
+
+	ret = spinand->set_randomizer(spinand, enable);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct nand_ops spinand_ops = {
 	.erase = spinand_erase,
 	.markbad = spinand_markbad,
@@ -1594,6 +1617,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->user_otp = &table[i].user_otp;
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
+		spinand->set_randomizer = table[i].set_randomizer;
 
 		/* I/O variants selection with single-spi SDR commands */
 
@@ -1881,6 +1905,9 @@ static int spinand_init(struct spinand_device *spinand)
 	 * ECC initialization must have happened previously.
 	 */
 	spinand_cont_read_init(spinand);
+	ret = spinand_randomizer_init(spinand);
+	if (ret)
+		goto err_cleanup_nanddev;
 
 	mtd->_read_oob = spinand_mtd_read;
 	mtd->_write_oob = spinand_mtd_write;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6a024cf1c53a..6a68a6c3866a 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -584,6 +584,7 @@ enum spinand_bus_interface {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: enable/disable read retry for data recovery
+ * @set_randomizer: enable/disable randomizer support
  *
  * Each SPI NAND manufacturer driver should have a spinand_info table
  * describing all the chips supported by the driver.
@@ -612,6 +613,8 @@ struct spinand_info {
 	unsigned int read_retries;
 	int (*set_read_retry)(struct spinand_device *spinand,
 			     unsigned int read_retry);
+	int (*set_randomizer)(struct spinand_device *spinand,
+			      bool enable);
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -668,6 +671,9 @@ struct spinand_info {
 	.read_retries = __read_retries,					\
 	.set_read_retry = __set_read_retry
 
+#define SPINAND_RANDOMIZER(__set_randomizer)				\
+	.set_randomizer = __set_randomizer
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -753,6 +759,7 @@ struct spinand_mem_ops {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: Enable/disable the read retry feature
+ * @set_randomizer: Enable/disable the randomizer feature
  */
 struct spinand_device {
 	struct nand_device base;
@@ -786,6 +793,8 @@ struct spinand_device {
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
