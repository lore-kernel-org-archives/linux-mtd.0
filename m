Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC219C54731
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 10:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4pyjjXzk/deNZL6e216DE6+waihJXi6/I3S9ml+6DY=; b=SWE3xU+5UVOTSB
	Kl8DOWsZAJSIOCzpfmbINgFcHbVO+Ibj0por8yStZdXWkIY3Sj2GfHGE5FZDJNurht+N3FTwyQ3Cz
	deKb3OUg5Jorb9AVewaYmrzLUrwtnk7YIyWpyjad9b3koNiX1rnNwoIDwHDPHrcibCnwR8r0PajUk
	tyoyNPBVyB6Ad5YtHmMwxSKRtG8L0jsn8rVAdfYVlPDzgXnfnfwcocTujQjfAS9EGiKfj0u5jEsIf
	Oe9ks1L6oBADo6HVtDtCB06bw3obMjjplBpFwH1/7jOR1p050T6+lW9raJHc0YFLNRl02+9uXjoa3
	wvERXI12hgLXYjZFNH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWlu-00000006t67-2Od5;
	Mon, 26 Aug 2024 10:16:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWjy-00000006sOc-2PGc
	for linux-mtd@bombadil.infradead.org;
	Mon, 26 Aug 2024 10:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dLKzcc8nIc2CFJYpK4+TachOMGDy5qI0ug4xPu9hW8s=; b=rDsoQFAO61eQ66Mzq8y/JqdzPv
	6dmLSc9EtFZYut/MV96iZJObGpUQC/gPivco0ql3wyeuU53muwxf9XRu8B8N8CLKuD73h5z0kiudo
	xWYnYJr7+pcuG/sVstpSaVlhgLwt+TE2QBOfel/reD9+DgLXmSeXRmrLXwybbK29LawNwhGiq8A4R
	eLAo+vqXI83S4ILLNl3dZ2TN1O1yKhEVtJEl7EvaZwPc7e4AvXouq+Yh9RgxVYETV2ENahyTc9UXl
	yqS/O4TstbC5dOHo/qE/H0nS4GvGeJzNEF8cFrx8/6ZETlOIrGQDenmskuWKIoFlTybEoWAquKMoU
	nw+vbT8Q==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWju-0000000AdLM-2edv
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 10:14:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55B2C1BF207;
	Mon, 26 Aug 2024 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724667257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLKzcc8nIc2CFJYpK4+TachOMGDy5qI0ug4xPu9hW8s=;
	b=Yyj6aVCrkfiYHsTxqpekee8qgUOKJJWFetBc/x2Gy5U/IjCvXZnLBiBBYyB6kyzuPsdj5e
	Ik2bGUzJ5g8RhBTob7OpKa7vj8WbSINa5c/HvQHGnKgMWFW6LSjaqj5KNjCJy70tdeCX6l
	bfKZYFDE2oc+6gkLqMqUK5ZbU6Hnl4nJUrfLmMKrNHOc5/a0xaL6yEz2aDzclv3b1zkvA+
	Or52n+OLEjG7FFsWrRsxjKGpSv7XcPZZT8rjOzH3E6PsR04Qe/1NJNc7ZeWNC+V4DFOs+2
	MAJwUoQx7r73k79s8oj0J13whioCWo5bRfbIxuB5IfP+ZUCo9WrIo0jlacQNIw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 5/9] mtd: spi-nand: Expose spinand_write_reg_op()
Date: Mon, 26 Aug 2024 12:14:08 +0200
Message-ID: <20240826101412.20644-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-1-miquel.raynal@bootlin.com>
References: <20240826101412.20644-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_111422_810174_ACBFA4EE 
X-CRM114-Status: GOOD (  11.59  )
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

This helper function will soon be used from a vendor driver, let's
export it through the spinand.h header. No need for any export, as there
is currently no reason for any module to need it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 include/linux/mtd/spinand.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index aae9201a35a4..6f87c511c2ab 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -34,7 +34,7 @@ static int spinand_read_reg_op(struct spinand_device *spinand, u8 reg, u8 *val)
 	return 0;
 }
 
-static int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val)
+int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val)
 {
 	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(reg,
 						      spinand->scratchbuf);
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 14dce347dc46..8dbf67ca710a 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -533,6 +533,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 			   enum spinand_readid_method rdid_method);
 
 int spinand_upd_cfg(struct spinand_device *spinand, u8 mask, u8 val);
+int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val);
 int spinand_select_target(struct spinand_device *spinand, unsigned int target);
 
 #endif /* __LINUX_MTD_SPINAND_H */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
