Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5506C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 10:31:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3773206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 10:31:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nsH/1/x7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rcE6uRyd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3773206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3d159e9DDDzvpwBe6Jcxx64/YQFA10ly1slDmLuH9LE=; b=nsH/1/x7KU1BhbrlQNlJ4yMrlh
	v7AWQhW7e27pwajnKD6yw8lZW6y7jh+QQIAmFoEhHd2qxZvnbjMmGij5VXtqiGxlXDPqch/lNyKFV
	NBaZ51NRehMKe56jxSW+KBXg2thdejrWVPeOg9qIRhWME6Qk1g2tu2qMXXXwiX18WI+k2J0NHMygH
	5oxEHaCc8Uhjj300lX5VjJTUymZ/e94LrciDAseLgiUhS+sP7MoHTDG/f/u7smjSEtFca4so/x7vU
	EOduHP8KQKLKRg8zMgL+qLk25bn4J8vygWBDN+O0Dx+mKXHYQplyixu9Rgk4sbC50rQbjIpEwpCoc
	06FedLUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9SJG-00043p-SS; Thu, 28 Mar 2019 10:30:58 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9SJF-00041v-MH
 for linux-mtd@bombadil.infradead.org; Thu, 28 Mar 2019 10:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fMqGthmN4XVmh6lxSuGY43KlL5dSJr719ZG2u3I4Kro=; b=rcE6uRydmk4FsSB2MtG1qdNYK
 AwMDxjr3Vo8aDZWA8KQ+1xU8OQEkYwUIBH/jK7STNe7sp4ezQ3euMxvXN9PmWtfJpoM8jmbGfEO7p
 riOnrF/CUWbri+MZZwbPrffvj2G8cQr+H7pTlPqvqdjfThYHqmcDQbmGCjLLDXWNvWoJw/oTPJHe3
 hwoQIEeG/hIxMzIgrYOiC/T779ar1SbZqfu0AcU4IG1u8yDmJ5hqd4ACfBmxKCPwghQq+ox94ljTn
 PXFPehJfgPJgSVUwgUAOIXUELSUEfqGsf4hICt7Fhua3bBOYhEWGD8cgqkZT8ezTwpl4Wtb/gTHhK
 3YIHtr37A==;
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9RpQ-0001c6-Bz
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 10:00:12 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id x2S9wlJQ052359;
 Thu, 28 Mar 2019 17:58:54 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, bbrezillon@kernel.org, dwmw2@infradead.org,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 computersforpeace@gmal.com, paul.burton@mips.com, stefan@agner.ch,
 christophe.kerello@st.com, liang.yang@amlogic.com,
 geert@linux-m68k.org, devicetree@vger.kernel.org,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org,
 richard@nod.at, miquel.raynal@bootlin.com
Subject: [PATCH 7/7] mtd: rawnand: Add Macronix NAND block protection driver
Date: Thu, 28 Mar 2019 18:18:38 +0800
Message-Id: <1553768318-23149-8-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553768318-23149-1-git-send-email-masonccyang@mxic.com.tw>
References: <1553768318-23149-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com x2S9wlJQ052359
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_060008_801180_9C1A6685 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: juliensu@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>,
 zhengxunli@mxic.com.tw
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add a driver for Macronix NAND block protection function.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/nand/raw/mxic_nand.c     |  3 +++
 drivers/mtd/nand/raw/nand_macronix.c | 47 ++++++++++++++++++++++++++++++++++++
 include/linux/mfd/mxic-mx25f0a.h     |  3 +++
 3 files changed, 53 insertions(+)

diff --git a/drivers/mtd/nand/raw/mxic_nand.c b/drivers/mtd/nand/raw/mxic_nand.c
index 03886b2..9307ca2 100644
--- a/drivers/mtd/nand/raw/mxic_nand.c
+++ b/drivers/mtd/nand/raw/mxic_nand.c
@@ -262,6 +262,9 @@ static int mx25f0a_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto fail;
 
+	mtd->_lock = mxic_nand_lock;
+	mtd->_unlock = mxic_nand_unlock;
+
 	err = mtd_device_register(mtd, NULL, 0);
 	if (err)
 		goto fail;
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index a19caa4..db63350 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -21,8 +21,12 @@
 #define MACRONIX_RANDOMIZER_BIT BIT(1)
 #define MACRONIX_READ_RETRY_MODE 5
 
+#define ONFI_FEATURE_ADDR_MXIC_PROTECTION 0xA0
 #define ONFI_FEATURE_ADDR_MXIC_RANDOMIZER 0xB0
 
+#define MXIC_BLOCK_PROTECTION_ALL_LOCK 0x38
+#define MXIC_BLOCK_PROTECTION_ALL_UNLOCK 0x0
+
 struct nand_onfi_vendor_macronix {
 	u8 reserved[1];
 	u8 reliability_func;
@@ -146,6 +150,13 @@ static void macronix_nand_onfi_init(struct nand_chip *chip)
 		struct nand_onfi_vendor_macronix *mxic =
 				(void *)p->onfi->vendor;
 
+		if (p->supports_set_get_features) {
+			set_bit(ONFI_FEATURE_ADDR_MXIC_PROTECTION,
+				p->get_feature_list);
+			set_bit(ONFI_FEATURE_ADDR_MXIC_PROTECTION,
+				p->set_feature_list);
+		}
+
 		if (mxic->reliability_func & MACRONIX_READ_RETRY_BIT) {
 			chip->read_retries = MACRONIX_READ_RETRY_MODE + 1;
 			chip->setup_read_retry =
@@ -241,3 +252,39 @@ static int macronix_nand_init(struct nand_chip *chip)
 const struct nand_manufacturer_ops macronix_nand_manuf_ops = {
 	.init = macronix_nand_init,
 };
+
+int mxic_nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = {0};
+	int ret;
+
+	feature[0] = MXIC_BLOCK_PROTECTION_ALL_LOCK;
+	nand_select_target(chip, 0);
+	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_PROTECTION,
+				feature);
+	nand_deselect_target(chip);
+	if (ret)
+		pr_err("Lock MXIC NAND all blocks failed, err:%d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mxic_nand_lock);
+
+int mxic_nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	u8 feature[ONFI_SUBFEATURE_PARAM_LEN] = {0};
+	int ret;
+
+	feature[0] = MXIC_BLOCK_PROTECTION_ALL_UNLOCK;
+	nand_select_target(chip, 0);
+	ret = nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_PROTECTION,
+				feature);
+	nand_deselect_target(chip);
+	if (ret)
+		pr_err("Unlock MXIC NAND all blocks failed, err:%d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mxic_nand_unlock);
diff --git a/include/linux/mfd/mxic-mx25f0a.h b/include/linux/mfd/mxic-mx25f0a.h
index 5a8cfc7..cfce992 100644
--- a/include/linux/mfd/mxic-mx25f0a.h
+++ b/include/linux/mfd/mxic-mx25f0a.h
@@ -170,4 +170,7 @@ struct mx25f0a_mfd {
 	void __iomem *dirmap;
 };
 
+int mxic_nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+int mxic_nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+
 #endif // __MFD_MXIC_MX25F0A_H
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
