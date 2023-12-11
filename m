Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664AAC10DC3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 15:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5e7AxzjRgI9qfgmlmZzLqrOjPLFVuwvuSCGdrAd0dgw=; b=c490EMJYoZNOEo
	/G1EDxr+fF//PqEtYxTbd/ZL1/Y7AEWJDHnbxBd2mx/2F8B14PBdPaJVfy/xr+TWvIV8GUSbbqPXw
	97LiQrC6K3VY4y2h0AGqYixqEHN3jsW/HjEqEFW14ekCK4Tdzp6/ln0w/FrA8Sg4r0QRVWlXtF00j
	CgBSn/sN04HX2goidjSD5xT1I/Fh6B92cwe5S903cRVBpVbzZojc6jrCLqt8S3S3dMroITg1ZVnOI
	dInI8JxkdctVkUtTH34jzqtUh9udze2lYd03yOzjpW79oBfTfKWMmNe+BflwHm2Pt0f+B2JIpNU/T
	kykjLIXeJ3J2MlqVxlSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rChsT-005IRo-2i;
	Mon, 11 Dec 2023 15:07:25 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rChsE-005IJf-23;
	Mon, 11 Dec 2023 15:07:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6A27FF80D;
	Mon, 11 Dec 2023 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702307227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mCpgckyHYRCqWcLrdBFdkY7ytfN/j08qDrPdaUCnFjM=;
	b=NXtE0+6vHknV4JejSwmwtFfYY8e8PAl8atvUVbCIFhiAAGkuh57OFlS8a2lXa/Nt9mTWuC
	5nfYSVdQNaTJQ1xhCYVAllRXSMYL5Ov0pPywSpAe3ViN393GkPsJOpPCP03kmVoWLoKXZm
	KYyvDiS7IugU7ReUwOopHdiXUTUMy6hnf6SWOh/dFm5OXt635WXkVizTXMkEsOsJP5Ww95
	vYO3sUf6d3UfOcNVGPPs/w/GWuGWao65AT7cvLgTlDJUvHYUF7b0PYZhJKKWs4eaJh2xDH
	HtBvdp/5a5FAube0d/wRbUeYm5C2dSdKlSkAj3glmHf4F46/ya/KAg0Z5rYYEQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	<linux-rockchip@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/2] mtd: rawnand: rockchip: Add missing title to a kernel doc comment
Date: Mon, 11 Dec 2023 16:07:04 +0100
Message-Id: <20231211150704.109138-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211150704.109138-1-miquel.raynal@bootlin.com>
References: <20231211150704.109138-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_070710_893278_1B48E744 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

All fields of the nfc_cfg structure are documented but the name, which
leads to a W=1 warning. Add a title.

Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/rockchip-nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/rockchip-nand-controller.c b/drivers/mtd/nand/raw/rockchip-nand-controller.c
index ab1a9e8687e0..7baaef69d70a 100644
--- a/drivers/mtd/nand/raw/rockchip-nand-controller.c
+++ b/drivers/mtd/nand/raw/rockchip-nand-controller.c
@@ -108,6 +108,7 @@ struct rk_ecc_cnt_status {
 };
 
 /**
+ * struct nfc_cfg: Rockchip NAND controller configuration
  * @type: NFC version
  * @ecc_strengths: ECC strengths
  * @ecc_cfgs: ECC config values
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
