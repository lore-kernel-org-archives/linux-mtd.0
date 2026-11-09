Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7595D606A321
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 05:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x6tS6V2Z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Xnar5CUG;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rtu9/jAN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+vEEnqB7pL9kgCelWo5ZAurvuqlufsyL+JkB9kqPCBQ=; b=x6tS6V2Z+l/UnXy0NU/w72Q3mU
	vD8z5iCZj1p8jEiOXk13tD3KQow2kEnW4dOhWqILB3p3bGCJIiI8l661WuCdry/YN2qjqlFADL2Ss
	E95KfWz5axGkx7uOmk3OnhHGP5ewyFgjUYECpHlFpAiL1bj1sGa8seQ30IoPdGYtMpznvxeuhg+Lp
	Q77Cldyju6jBVAVW/L4CRKzUJb8hLYhT84Tl0x2eX7eMLp9qLw5cD2f4YrQpn32VCRQQDS0fDN2kg
	MgzTsHGoPdOOpyhBx3Cii3l9ccSf+CaQmWzrM6Fd/BiQev85ZDQPigR103ksqdEFfUq4f0fdeWLMF
	2wyP/+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHv4-0000000HPPt-0fyV;
	Mon, 09 Nov 2026 05:27:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHv2-0000000HPPh-2j5c
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Nov 2026 05:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rNI0FhTOj0/kWQb6qFtt+AdoxirvrS8PR1o6nERy2kA=; b=Xnar5CUGvNGY6sJ/mAD3+jWSwG
	AkvCcSgg/au37kKpcNyG6KWgqGTDB5HXZLvzqIJ8vnE0r8NK3iXlRwln8e2P2tgWNyPYY2k/qnZNj
	NefpHvamQ9B1eBIT4dNaxdkduQqvongM8YZXGtCG2kKJpReJiD+I67GzsbxhcJVJbXzZ/tb7Z3Uyu
	Gd+HcS47UUDQzolZno5FvkY/wZXT85eFuDw4VulyZoYxKT2fA6t5IvHhJHnaENCfFbB+U4tB1EvRZ
	lmzaX0X7uxL3w08o/HTePrskFZsC+LKiwMbV3SCootr0aHQsHtFGca22lddM3Zjr7YnoDmmQ5Uk2R
	xeoebCuQ==;
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHuv-00000006KCD-42uS
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 05:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rtu9/jANHgrk8oBvee/yT73qI0nL6CZeeU68zbfB/QOqzYEXFT5MHe+6kLAKbNxs6+rUSkAgjByoK
	 X9ZGmya5cqmthfYkAmffjIMcxKtN9fokyyvZ8t09nbFf0TPLVfR3vxeyi0vs76nllFiDptNBeOBBH0
	 YVYdsXvl4MaqivUo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af159bfe8d-60c2c;
	Mon, 09 Nov 2026 13:27:27 +0800 (CST)
X-RM-TRANSID: 2ee46af159bfe8d-60c2c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af159bcc11-8263b;
	Mon, 09 Nov 2026 13:27:27 +0800 (CST)
X-RM-TRANSID: 2ee86af159bcc11-8263b
From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	michal.simek@amd.com,
	linux-kernel@vger.kernel.org,
	Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mtd: rawnand: fix GPIO descriptor leak in rawnand_dt_parse_gpio_cs()
Date: Mon,  9 Nov 2026 13:27:23 +0800
Message-ID: <20261109052724.1032-2-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
References: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_052742_723639_B8747BF8 
X-CRM114-Status: GOOD (  11.49  )
X-Spam-Score: -0.5 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

rawnand_dt_parse_gpio_cs() acquires one GPIO descriptor per loop
iteration with gpiod_get_index_optional().  If a later iteration
fails, the descriptors acquired so far are never released, leaking
the GPIO references.

Roll back with gpiod_put() on the error path.  gpiod_put() accepts
NULL, so the NULL slots left by absent optional GPIOs need no special
casing.

Fixes: b85c943d181a ("mtd: rawnand: Add a helper to parse the gpio-cs DT property")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
Verified against current upstream master.  Not runtime-tested (no
hardware using gpio-cs).

 drivers/mtd/nand/raw/nand_base.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5466,7 +5466,7 @@ int rawnand_dt_parse_gpio_cs(struct device *dev, struct gpio_desc ***cs_array,
 			     unsigned int *ncs_array)
 {
 	struct gpio_desc **descs;
-	int ndescs, i;
+	int ndescs, i, ret;
 
 	ndescs = gpiod_count(dev, "cs");
 	if (ndescs < 0) {
@@ -5481,8 +5481,14 @@ int rawnand_dt_parse_gpio_cs(struct device *dev, struct gpio_desc ***cs_array,
 	for (i = 0; i < ndescs; i++) {
 		descs[i] = gpiod_get_index_optional(dev, "cs", i,
 						    GPIOD_OUT_HIGH);
-		if (IS_ERR(descs[i]))
-			return PTR_ERR(descs[i]);
+		if (IS_ERR(descs[i])) {
+			ret = PTR_ERR(descs[i]);
+
+			while (--i >= 0)
+				gpiod_put(descs[i]);
+
+			return ret;
+		}
 	}
 
 	*ncs_array = ndescs;
-- 
2.39.2




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
