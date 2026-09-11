Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7D2C88E4A
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 10:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+6+oDvzvegmbYSOdXLbh6EdjY0R5cT0C6UiZBWPEis4=; b=gszvVxXOQ2xrbU
	KF4n8nBR9hE4Kf/bYuVkhVRqwForN0TjVqjWgBpteqLT7VVbk6jk8Cqgt3ywEmiETXZpbWMdjRFJ8
	2/leE1MYjneDeHJXFJC5Cxuu0y1on5cEioHnnMYTTKICnuDhSofXWaYFbJ7rFC0CawqkaErHgyXLA
	ypgL31BxZOoPpOYDi54NTPVN4/GJJWJAwnqxnhk8WwVJMtu9YgIP/OKskIRBnwx1ZkQo2stUspD2g
	/AER5qe+9orm6qE6iSKRc6V47TpjeApyJg7m7Tj7h2LIp2BEzO0lK3/iHNmyU3iCdEjcDvsKtF3fC
	cQLIDaW6ghC1bhan1ysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yiv-0000000GPfA-49lz;
	Fri, 11 Sep 2026 10:43:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yip-0000000GPcK-3jmJ
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 10:43:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6F11E4E401B0;
	Fri, 11 Sep 2026 10:43:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41FB8601DE;
	Fri, 11 Sep 2026 10:43:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F206E11C7AF8E;
	Fri, 11 Sep 2026 12:42:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789123383; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=bjHKtRQSF0AlroFIew4ip7HdNfgsUfAOjcAduhZmuKg=;
	b=xL52MhbnDiTT4Ille3+popcdtCBUl95DW+GSwUdKwrwTSGWP/1zExD+mjwE5IXGQuS9f3d
	RRaO94zI+RjLJgukDE656KnUoKxYaOg5sWGeIHRAVhRl4sEPzc07yO0XqgIzWSrlY7iVqI
	+fdTITBkZSbRIFYBo4oj5LhOu4IXa//Ru4Zw98ow0tCasxXCaxRvzB881aGMJKp9NikqvZ
	iqhVHqoX28bvWAbj6HrRYU9K30VSOtWZE5CQaBpsK9d/rxtlGjw1obCs6rp+zrB1t6iIvw
	Ujki2Uojx1TpJw9wNhEKpfl6HFovd9wSS5SaJwqehYfnQWMqQIPkwVFf673eZg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 11 Sep 2026 12:42:58 +0200
Subject: [PATCH v2] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
MIME-Version: 1.0
Message-Id: <20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7RimVhJceQ/DAulUJpEOtIRgC
 He3cgKX7+f/9zdIHIUT3IoNIi+SREMGcyqg69vwYhSXGUxpqrImwpFjUvSyYhoFg0acGIdVOnT
 llS5ce2sNQd6PkXPtcD+azL2kWePnuFrol/5jXQgJvatcTZaq1rT3p+r8lnDudIBm3/cvPoQYD
 MQAAAA=
X-Change-ID: 20260911-perso-fix-spi-nor-qe-mxic-d0513e9f4421
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Steam Lin <STLin2@winbond.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_034308_093588_E3C242C3 
X-CRM114-Status: GOOD (  13.60  )
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

Some flashes (eg. from Macronix) do set BFPT_DWORD15_QER_SR1_BIT6, which
means they do not have an SR2 to read from/write to. The new generic QE
helper was supposed to accommodate this situation but in the last version
that got merged, parts of that specific handling has been moved to a
more contained location, swp.c (which needed most of the extra code),
yet the Macronix case has been forgotten about in that generic QE
handling helper. Booting with such flashes will always fail probing.

Fix the situation by making sure SR2 reads just return 0 if
unsupported. This is safe since there is no chip with a write SR2 path
but no read SR2 path (which is now enforced in the SFDP parsing step).

This way, callers still do not have to care about the internal device
capabilities. Calling sr1_and_sr2 read/write helpers is safe in both
directions (not risk to get a spurious error). The behavior for SR1-only
chips is respected, the complexity in the core kept to its minimum.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/linux-mtd/178876719232.3543902.14451625037676421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840
Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
- Change the approach, see v1 thread below.
- Link to v1: https://lore.kernel.org/r/20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com
---
 drivers/mtd/spi-nor/core.c | 8 ++++++--
 drivers/mtd/spi-nor/sfdp.c | 3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e2b6efafdd8d..7bb197df5585 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -849,7 +849,8 @@ int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
 
 /**
  * spi_nor_read_sr1_and_sr2() - Read SR1 then SR2
- * General purpose helper.
+ * General purpose helper, always safe to call. Will expectedly ignore
+ * SR2 on certain chips.
  *
  * @nor: the spi_nor structure
  * @sr: pointer to a valid 2-byte array
@@ -864,7 +865,10 @@ int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8 *sr)
 	if (ret)
 		return ret;
 
-	return spi_nor_read_sr2(nor, &sr[1]);
+	if (nor->params->opcodes.read_sr2)
+		ret = spi_nor_read_sr2(nor, &sr[1]);
+
+	return ret;
 }
 
 /**
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c21a6953db96..641f17ad51a0 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -656,7 +656,8 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 
 	/* opcodes sanity check */
 	WARN_ON(!params->opcodes.read_sr1 ||
-		(!params->opcodes.write_sr1 && !params->opcodes.write_sr1_and_sr2));
+		(!params->opcodes.write_sr1 && !params->opcodes.write_sr1_and_sr2) ||
+		(!params->opcodes.read_sr2 && params->opcodes.write_sr2));
 
 	dword = bfpt.dwords[SFDP_DWORD(16)] & BFPT_DWORD16_4B_ADDR_MODE_MASK;
 	if (SFDP_MASK_CHECK(dword, BFPT_DWORD16_4B_ADDR_MODE_BRWR))

---
base-commit: 700bf34058ca7cd792236b1ba5caad3770d66208
change-id: 20260911-perso-fix-spi-nor-qe-mxic-d0513e9f4421

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
