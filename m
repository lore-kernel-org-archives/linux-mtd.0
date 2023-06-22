Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB873EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kB6hOVz1Gzw/4CJBKcjzbny4Jce89lGHTPhDjqckDA=; b=XvdXb+VjF95bFe
	ii4Lv05KrInbbXes5b4zy5a60jVtLkuCWzkYefvFOBI5uHzdGukVJgoNbBcyQ8slIXZpVqY7CF7bT
	NK+jakyZlJEkVnA0OfkmfY2oNqaFiB6sddGxITXKesoYIUrpbJ1hWbnSYEssXGUElOdime7HeUI3C
	PJjE2GYXCUVPrkADVH17Q94JJjsdUIn61PXbutn8X00+3I/5YuwLG/CNXEzTFb6juwtRiiqgxkcMO
	DFs2i6/OGScpA20786Ed4lA3b/x3JTI5St94j4WTmRVAy9/E4jTfDEt+PMwRTN1yJSbozp2ezlCs6
	Y3xIyCCqZUKRc1ZHhuxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCReQ-001ooA-2Y;
	Thu, 22 Jun 2023 21:15:34 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCReO-001omQ-19
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:15:33 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9DW+HvzcXe7ZwmeViX7a56vvn+KIaJGVc2KrAMmwjBc=;
	b=SDzvv175OKrdnbftxrh6+2adjr757r73tsgHheOcQkHLD78KXaFZ42vIXH6G2O5mUBQA+Z
	lVa1i0FW9p037dslJKmDbrf0bjaL8Zo5uI5RIVO20CM55RvDjU5OkbJPi+QdQzKXbmWjeE
	a0jKkwFsEG+JvjvtSpvUffAnO9XAH5e7BuRej1Zzflfl0xXQAhxCZTMMM2B+uMhPU6wFRI
	zDIrPFotmPJh5dTD+2T+YrfiwA3CbhbzkWvi0EErDlFfFY8bB136C0N0Zo4bcQM4Ycxf5u
	94+p3D3kh3q2S4X3hTC7fOVm/kDvzqJOrtQDnw3tISL387di9toCyHbddUTn0A==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2AD3E0005;
	Thu, 22 Jun 2023 21:15:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 13/17] dt-bindings: mtd: rockchip: Prevent NAND chip unevaluated properties
Date: Thu, 22 Jun 2023 23:15:27 +0200
Message-Id: <20230622211527.3581692-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-14-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd028c1cf2c56317cb7e34fd5e37c45db48fe498a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141532_533356_7A853926 
X-CRM114-Status: UNSURE (   6.98  )
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

On Mon, 2023-06-19 at 09:29:12 UTC, Miquel Raynal wrote:
> List all the possible properties in the NAND chip as per the example and
> set unevaluatedProperties to false in the NAND chip section.
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
