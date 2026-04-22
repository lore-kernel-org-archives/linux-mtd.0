Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA00F94CDB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2026 07:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5KKIk8gF5ueQdpu8DqCXmAJEsciz5D+NeHX6/+DUvQ=; b=47iH4wZ99dRNp/
	fPIATnrnfCSKLJNTAkoTHEew9qzodTgWjzf9gqGWrc+8JA9OlHu/E0swGDwBsU4ZZ+CnpdEqPJNKm
	GI4Zc4UGGhc9SC6Yr/w/G8zBSM1BcIhOXc8jCZEJOGPIE5C/DQjbU9stFnsbgiwRqn9gJdscMsSEm
	HFDc+SCo+PLRAZOkgF//I/AE9WvmSVEF4CoDwQzKnBG5h7GvDE8P3HhJDyYcOheuJUlodzn8U6Rkm
	GiCKSoP4PEMw5DQgW/uw0oCEeA53xZzS3r/j7/HkTcz5fQqlBCsDThte/44wVlDOLMtLM9hheYK3s
	cd/5l5+7TeS816JbrZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRcV-00000009hD1-37ic;
	Wed, 22 Apr 2026 07:03:35 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRcT-00000009hBs-2enq
	for linux-mtd@lists.infradead.org;
	Wed, 22 Apr 2026 07:03:34 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82f8bf96b46so2523602b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 22 Apr 2026 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776841412; x=1777446212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSXRoXNyL2G9tTF3pCq4QLzdSdaD1DteZMo7+cFocEo=;
        b=cXLuSmBkt5MpVkBTU1fNvkyR4TjyhD/Jos8zS+J8JfF835D5S+U31i60CHbg1BLSL0
         NkQB8fASkDlb8slsf5UaYqfD1GPtfRz0Z0da4+6h882cqdMIxHGynl9wU8AH0quBv/1j
         1XQfgjhV3knNOP5Iif7ZRY6hXfRdykOw/XEQg0nwB4G9ywbiFpILVJaD+WUCRY9/VIQQ
         Ws7f2/jXsnNEgCN5ghCTAnamVirw3cJfBlm+F1dunozYQ19etoHtnsXqLdbjYhbYUmdR
         M5hUknydXDD+TGO4DaMMp4BEEhGEwNKYWfYUrPStoM3YXgBsM0hDfXiEhbrHQyy8hJBO
         jSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841412; x=1777446212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mSXRoXNyL2G9tTF3pCq4QLzdSdaD1DteZMo7+cFocEo=;
        b=dql9GLW7f/2RKeQ41hGsHCpH5ctixYwF7I0ZWIibLhJKV/1lf9DV9/M31ehxUbwxso
         GsnVEYFu1Oap7Qu0ntC883iVDzkPFjfvgHKiuCB4MWmE77gMovG9gTXQXvNVQmp6iftm
         HEjltjPNMlbCl7+peYNg7Lrnl8Ts+I8wV/zDJ4k6TzodGauFsPZ/9T4njsLBoYWfN7lE
         DimwMMR5FYQf6Dmr+p+quuOsYYyJ3qWpP/lZMTAIhpQe+AiV3BXfduQbE2CSLXCBblzk
         H+pgkgLucOdCBm3s0RTcI7OJcrSewNRCeVwphjWOeI/pH4GVSbMxnP6dfBkpJLDH8sbn
         aVsg==
X-Gm-Message-State: AOJu0YyXWCksvYpx88UAPdafsPyIwhZzcg0Ne41SQgfzyZA1YAYk3pOL
	GmuR+OeZTFut+fM4q5Vy5qhm4K0nP6JN6kmzlgwuMADstnMrObp2s+kl
X-Gm-Gg: AeBDiet8fDmvi1k7PAfxdoECczMlllEohOnNXSY5IIHn1ZR+JZME05+cC3OW8OJfixZ
	5WFuESCv89bKsq2gpQcEQxJhrP281ib8dX0OGBNzePhNO8Hkud4NnjehqJfap07YYITUzLsXt1e
	sIiZ/nVhe0qJgn7fuKm1NKGK0RJypJbt36YQU38MTH1pDvqTEfB2bphXP5++CjloSdJf40afBAu
	lam0YeTRM0ROrQNDn4YJ0p1B+XHmsjBgRkvkTzkWcfHRv3bkk9RLjIQAfsPczSJkOOSSiK3ifUb
	hYQWxu/oe4Mf3A8+Fo9p0a1Uxqjr+D10fIr90U7IpL98ce9MwwY8kwDDi96iaAwQDQVL6nvgXMZ
	inTF9FgIaB648AybCKJ36/OS06QemUTyUDeSAq6L3KXehHnRtinDgy+oo1XN37Bx6VJi77iSJlF
	+No9Crhz5l/eGqH3yJpnXw1AoEUgUxQmJvSoYdn55rHOIGWZiNIJFeAlkn
X-Received: by 2002:a05:6a00:3498:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82f8c8bede5mr18881373b3a.30.1776841412109;
        Wed, 22 Apr 2026 00:03:32 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981829sm19411466b3a.12.2026.04.22.00.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 00:03:30 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 23E63416A045;
	Wed, 22 Apr 2026 15:03:28 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v9 2/3] mtd: spi-nand: Add support for randomizer
Date: Wed, 22 Apr 2026 15:02:02 +0800
Message-Id: <20260422070203.698716-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260422070203.698716-1-linchengming884@gmail.com>
References: <20260422070203.698716-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_000333_679832_4FC96D61 
X-CRM114-Status: GOOD (  16.23  )
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
 drivers/mtd/nand/spi/core.c | 20 ++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8aa3753aa..fee9a024d 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1307,6 +1307,22 @@ static int spinand_create_dirmaps(struct spinand_device *spinand)
 	return 0;
 }
 
+static int spinand_randomizer_init(struct spinand_device *spinand)
+{
+	struct device_node *np = spinand->spimem->spi->dev.of_node;
+	u32 rand_val;
+	int ret;
+
+	if (!spinand->set_randomizer)
+		return 0;
+
+	ret = of_property_read_u32(np, "nand-randomizer", &rand_val);
+	if (ret)
+		return 0;
+
+	return spinand->set_randomizer(spinand, rand_val == 1);
+}
+
 static const struct nand_ops spinand_ops = {
 	.erase = spinand_erase,
 	.markbad = spinand_markbad,
@@ -1594,6 +1610,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->user_otp = &table[i].user_otp;
 		spinand->read_retries = table[i].read_retries;
 		spinand->set_read_retry = table[i].set_read_retry;
+		spinand->set_randomizer = table[i].set_randomizer;
 
 		/* I/O variants selection with single-spi SDR commands */
 
@@ -1881,6 +1898,9 @@ static int spinand_init(struct spinand_device *spinand)
 	 * ECC initialization must have happened previously.
 	 */
 	spinand_cont_read_init(spinand);
+	ret = spinand_randomizer_init(spinand);
+	if (ret)
+		goto err_cleanup_nanddev;
 
 	mtd->_read_oob = spinand_mtd_read;
 	mtd->_write_oob = spinand_mtd_write;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 58abd306e..9ec45b727 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -585,6 +585,7 @@ enum spinand_bus_interface {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: enable/disable read retry for data recovery
+ * @set_randomizer: enable/disable randomizer support
  *
  * Each SPI NAND manufacturer driver should have a spinand_info table
  * describing all the chips supported by the driver.
@@ -613,6 +614,8 @@ struct spinand_info {
 	unsigned int read_retries;
 	int (*set_read_retry)(struct spinand_device *spinand,
 			     unsigned int read_retry);
+	int (*set_randomizer)(struct spinand_device *spinand,
+			      bool enable);
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -669,6 +672,9 @@ struct spinand_info {
 	.read_retries = __read_retries,					\
 	.set_read_retry = __set_read_retry
 
+#define SPINAND_RANDOMIZER(__set_randomizer)				\
+	.set_randomizer = __set_randomizer
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -754,6 +760,7 @@ struct spinand_mem_ops {
  * @user_otp: SPI NAND user OTP info.
  * @read_retries: the number of read retry modes supported
  * @set_read_retry: Enable/disable the read retry feature
+ * @set_randomizer: Enable/disable the randomizer feature
  */
 struct spinand_device {
 	struct nand_device base;
@@ -787,6 +794,8 @@ struct spinand_device {
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
