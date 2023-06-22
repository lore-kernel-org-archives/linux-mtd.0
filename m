Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D15EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUVn2C2RXuVNMA+YP9bJ0909hIF/cZqhuHs9gisWTsM=; b=MTlgV8xKcpUukB
	YDZ60QR2VIGaR6prpbXuAIL3A0aImr8if7P4dGD7r7fRGER9qs39C1YluROzuSayqDT7SCm/tnrY/
	6ehTbSYD+lLqxJB03dvbCNkXqD/YUhA5y6txytbV02WaiyMVUttDxpuGRlZM1wd/elkfkq8mBDI7O
	B3zHUeg5EliFz95LL+g9/vL7vEUTibJlXqBbQed5HvmxYxheMtorzav8kxfBN4pg91kBIWwKULmEk
	tQ//Ce8oixcFFI9G0dKS9lo9ZeDN4/eLz0PVpwh9S6UJUFYGRn/kTkIE6qLfODO/j2fly/fEo4NPO
	kkYhGw34uPJo00ByAhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRfM-001pVx-2c;
	Thu, 22 Jun 2023 21:16:32 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRfI-001pRD-07
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:16:31 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xWo+EJO7ji5ZXGqcAKix/vwh0gogpqAnDi3+17N9zKs=;
	b=dW4s4uVD8GC33YoQyihwhvmkJGasKZbYSnYuTC9BCBjM71dcJVNEleeiH6tpsMILzz8iKd
	VXbCslG30X0GHFkigeeZpJho5plCpPgbCspgScfhdp21gXgRQu7lbZDyBsY+GpuZxuwASF
	hpCnNzJIa6bEhEb/b1FD43/CRbLw9mYHe/LxjiNdLB32M6p54oLQYYnGrpQHWabkzmyOnN
	PfRF3LlBowovqWqc09/2JIkEZpEyjMCWDK/Uq302D2Aol8+OsTd0doW8XNs83QiIIHemfz
	yVi9qPpuit6W+B0ahT6cE36p7o1BEwo0xdswbaaQscjovCw6Y/4EPpPy2xTW7Q==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A42D40002;
	Thu, 22 Jun 2023 21:16:25 +0000 (UTC)
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
Subject: Re: [PATCH v3 01/17] dt-bindings: mtd: Accept nand related node names
Date: Thu, 22 Jun 2023 23:16:23 +0200
Message-Id: <20230622211623.3582419-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'da787688a5a08ece05a2f752d38b281fab8df846'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141628_234895_1A682F72 
X-CRM114-Status: UNSURE (   9.71  )
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

On Mon, 2023-06-19 at 09:29:00 UTC, Miquel Raynal wrote:
> There is no addition there, but the mtd.yaml file is so generic, it can
> be referenced by a wide variety of devices, including nand ones which
> already define the node name to "nand@<cs>". Right now it does not lead
> to any failure but when we will constrain more the schema, this will
> become a problem because we want the mtd-wide properties like label or
> partitions to be available for the callers.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
