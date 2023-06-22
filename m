Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6B1EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xGom3lRlgQvM0HuI1bLStMmo03GNJimkVDef301WOSI=; b=27yanl9IFVuvOH
	KSt806gDM7cbAPsUO2DoxNq5h4eB/nodH0LoQPQE0svcxbWJr+9jig8CxBxABiOYnXTPw/cEX/A68
	UC/jG84nXIsbgdj0dQX9FKCOkoGct18TUYvPIKaLGcKM4lAxpxN166Fddc7dhMOJAmNrSnxVONVGz
	Q5zXomyTlxS3TEQYzYsFYPIOR7K66p3GqUhwgYeDrahw9bbDD80BOIW66G3DUGiNBU3+rDxjkSitS
	VJ4C8LepvUZM+AvdSOheZuP3ko0XGH9j5yvniNfkwqtOS98mgkBvMfm+qa+Ulp6sTytex2OX4qWZr
	ZBPf/9H1EsUwVHf3B/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRfA-001pL1-0h;
	Thu, 22 Jun 2023 21:16:20 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRf8-001pIX-0O
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:16:19 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hYWn18Cvr+GC5a9HrPFwZyZneBQ0ZWR5sbfaEQPIDqU=;
	b=b7mZf4WWAKzna2RqUngwYOgoxoHSedQB5CpfO700DtQJyHFCtN20nGbrmpMYn/Dd1kTTpE
	E4znKR1pq7ZAOPvkQvPDp8/YcTqIyEgGSvtGk0yRP+x23xMygkJDezQgvYo5Ml1N0irowA
	VjxEPqqcENAQ566z/y3sE/7+foncBPf94nQ6K8Ih46KdXqCMWcI1X4FNjIAvV3/hkD4N+p
	q1ArQc56QcfwqUpojn9SazX3ORdVU+6ga7qCaY3IKheooTiFVYjgK6f6S+wSPoq7Hrf4Iv
	RjCTW0ujkYZ0fhXGp7E4s+zgDkYTqstHfW/XGyzxy/YP+QEZG5PZVRzTIv5vkw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 417AC1C0002;
	Thu, 22 Jun 2023 21:16:15 +0000 (UTC)
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
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 03/17] dt-bindings: mtd: Mark nand-ecc-placement deprecated
Date: Thu, 22 Jun 2023 23:16:13 +0200
Message-Id: <20230622211613.3582361-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-4-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'17241a02a84ef748d4ab7386c5a25771b1fa7cc7'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141618_318859_8B9E93B5 
X-CRM114-Status: UNSURE (   8.39  )
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

On Mon, 2023-06-19 at 09:29:02 UTC, Miquel Raynal wrote:
> The nand-ecc-placement property has been deprecated for a long time
> already, it does not really mean something useful for the ECC engines
> and is anyway in the vast majority of cases totally useless. Just mark
> it deprecated to avoid appealing people to use it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
