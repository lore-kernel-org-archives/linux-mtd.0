Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2D6C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:16:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4F920823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:16:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQp1K+pg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tkBXcvCG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD4F920823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzR4xqpXzMKIFVWAwNQTFZP7Omn04hFt7x8iUjZIykA=; b=nQp1K+pgiw3xkd
	982jXyX7+OWiqhPdo0FKxYruGlQbz7yV24WMJn5ltlqoQGUUplV4oKSMHacV1vlwR0WLLbB0uomAi
	HcO+l+KSNvgK62rfD8epxpklLKsSsOOSv6PUr5C8vsD2DPz8q1peoghgfPAd5OdA9XA6LVXKivIrV
	VooZG8srR5Wo1urXVzXylkNDc3/h0ZuQ589c8utyW1qfR5HbHNPAVK7wTVJPk+aDoAwgcmyLqI29L
	ndl9nDhoeBB7qIRk1tQL/nhm+ZhZOs3nTgDKUKSv5Xp2diCiRazEtcYEIZ6JDgYlKr1TZbTznYtWQ
	naWq2TZ2It/4hiLHXHWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wov-00078s-EC; Mon, 04 Mar 2019 23:16:29 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wjm-0007DE-BM; Mon, 04 Mar 2019 23:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RkJgKZ7/RWwiMPeHfTo/axhDsmbzmHrxf9TV85lyEHc=; b=tkBXcvCGAk0z7IexlOIjcFu/S1
 tB0cKFUflUB4aW6Sfzj4wJ1t5TzinuOAjv5hHKzEEhGw/QJ+krJnkjUSzhDKdRYVkKVp9UZ9SABf4
 kNQuHtqUyJ/UKy/alztgI7I7/fqaz/ZyhFWp/9cKJED1SjIKk/3jbtlvH9X6C14HmOfh/1JONsKLg
 svJ83JtH9qhAGlOQSaZCH8hTV2HEMPirQmwK1hesrCs36DZ6M1Tpsk2t4ZN0A6dSJpSe5maDEX9pU
 wFXGXU9Xlm9ypMmlxAvZ9acnCCA4SenkMIjyyQZLtLwSVhVWOKrCYJfc5pkkStMfFrBv8aTOgrMjm
 HTqeNzGA==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w5i-00013o-W6; Mon, 04 Mar 2019 22:29:48 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AA89B240004;
 Mon,  4 Mar 2019 22:29:19 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 07/36] mtd: rawnand: Avoid a typedef
Date: Mon,  4 Mar 2019 23:28:12 +0100
Message-Id: <20190304222841.13899-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_172947_291194_A6ABF5BA 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In new code, the use of typedef is discouraged. Before moving this
section out of the raw NAND base, let's switch the nand_ecc_modes_t
type into a regular nand_ecc_mode enumeration.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c               | 4 ++--
 include/linux/mtd/rawnand.h                    | 6 +++---
 include/linux/platform_data/mtd-davinci.h      | 2 +-
 include/linux/platform_data/mtd-nand-s3c2410.h | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e14f02a01efd..05174c6a3099 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4881,8 +4881,8 @@ static int of_get_nand_ecc_mode(struct device_node *np)
 
 	/*
 	 * For backward compatibility we support few obsoleted values that don't
-	 * have their mappings into nand_ecc_modes_t anymore (they were merged
-	 * with other enums).
+	 * have their mappings into the nand_ecc_mode enum anymore (they were
+	 * merged with other enums).
 	 */
 	if (!strcasecmp(pm, "soft_bch"))
 		return NAND_ECC_SOFT;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 14748183508b..c5bf6bb49329 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -87,14 +87,14 @@ struct nand_chip;
 /*
  * Constants for ECC_MODES
  */
-typedef enum {
+enum nand_ecc_mode {
 	NAND_ECC_NONE,
 	NAND_ECC_SOFT,
 	NAND_ECC_HW,
 	NAND_ECC_HW_SYNDROME,
 	NAND_ECC_HW_OOB_FIRST,
 	NAND_ECC_ON_DIE,
-} nand_ecc_modes_t;
+};
 
 enum nand_ecc_algo {
 	NAND_ECC_UNKNOWN,
@@ -340,7 +340,7 @@ static const struct nand_ecc_caps __name = {			\
  * @write_oob:	function to write chip OOB data
  */
 struct nand_ecc_ctrl {
-	nand_ecc_modes_t mode;
+	enum nand_ecc_mode mode;
 	enum nand_ecc_algo algo;
 	int steps;
 	int size;
diff --git a/include/linux/platform_data/mtd-davinci.h b/include/linux/platform_data/mtd-davinci.h
index 1bbfa27cccb4..e7457be12b8f 100644
--- a/include/linux/platform_data/mtd-davinci.h
+++ b/include/linux/platform_data/mtd-davinci.h
@@ -81,7 +81,7 @@ struct davinci_nand_pdata {		/* platform_data */
 	 * Newer ones also support 4-bit ECC, but are awkward
 	 * using it with large page chips.
 	 */
-	nand_ecc_modes_t	ecc_mode;
+	enum nand_ecc_mode	ecc_mode;
 	u8			ecc_bits;
 
 	/* e.g. NAND_BUSWIDTH_16 */
diff --git a/include/linux/platform_data/mtd-nand-s3c2410.h b/include/linux/platform_data/mtd-nand-s3c2410.h
index f8c553f92655..ff6501c51244 100644
--- a/include/linux/platform_data/mtd-nand-s3c2410.h
+++ b/include/linux/platform_data/mtd-nand-s3c2410.h
@@ -52,7 +52,7 @@ struct s3c2410_platform_nand {
 
 	unsigned int	ignore_unset_ecc:1;
 
-	nand_ecc_modes_t	ecc_mode;
+	enum nand_ecc_mode	ecc_mode;
 
 	int			nr_sets;
 	struct s3c2410_nand_set *sets;
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
