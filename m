Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B69EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rkot54EL7BFxMI+9zEXIWSF0U92vthhfFjdSoE1HPPc=; b=45eZBfIk/sqrkY
	Ojbl36ziy2qXRzkHlBsDNPweOOhi66/e2+dxDx8N+s/5jC+ICgKZAGc1C0cR/ewjeajda2TEZwDcY
	FDOKeKyY/xjL8babX57G53OYQbo5n5CZMGZhw8ZmNEEYX6Qa7bBclLQJ3gQWlDocTIxPe5yfBmFGl
	9UM02wqdR1JMt4oePfJoY8DOb9u0S7b7sCyD+PXTq9y1G/4td3+lzUpkbbaV+EX9k8jqFupwjt303
	j8iM3/ZP91aBDFSvA++xL6rYQqx0MKXcBD6MxbDBErZAtk1D5QmkUvux3Wcz+kgI7JfhUWfXrJx9q
	i2kGL6MHrdSHzc+errrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRfH-001pRT-2I;
	Thu, 22 Jun 2023 21:16:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRfG-001pQ3-1M
	for linux-mtd@bombadil.infradead.org;
	Thu, 22 Jun 2023 21:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ITvh4pYDBidXoM+GUzOAUkqQsnkVTKSmB3FbxBlieyg=; b=HQp3jXJHxUG6GDXGv4p58TP8xT
	9kBeUvw4a/E5hFSJqAnRLEhoFQHn3gHkN+H5yoXMt5G3g6yKhdDUWj9dHCN9Wpzi3OSinITtdswI7
	s5jVTVsZqOy/8/+YpSxeIV2AK+IqpZeOaY25ZfRr7jW8jcp8dupqT8s6mlPfN+OeG8i5bkzn789CD
	VcpMQYz29Ei99rJ7GalZunsPb1S7oDHbfHBt6Ct+yoXeAed4vO2WXboKG+dPe4i50oHENIWfgOkxS
	MqvmXQa6Ba/oG/zII0U0QNi+A0nLKNq6wNlNTfd7gc5Wahbb18nk4IdPE9mR01P9ma0tP5clz1BbU
	boZsCrpg==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRf0-001Im6-0k
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:16:20 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ITvh4pYDBidXoM+GUzOAUkqQsnkVTKSmB3FbxBlieyg=;
	b=G5fqU5TF745yrr5fikdx9Ou/h8d48j4aV6xLRuuMm6WDh3PP9vkes4Y5kyI8mYFwJLRgfc
	8yHb/h3KuMxlgYSYxZeBxLuirbnpTHKCla3ZUtLZbFVVikJ4wy52gwNhFlRr8N9uib8pB+
	8biNilwx6jsIiZQwDpt4MCfGmQdYZE3mqCqJsaTjXm/WOQ8+KQIwUsxQsPYjduMoiZfmRX
	M9bLm6H1KvwED4DYBTI0xHsx5DnXgoJ1ESl7upaK4D0DGf6MAGaXA6f2fRJdcJv2ItVw3Q
	fow2LuvajXJShIUN00fsFctV+qasGcZTUYSq9XvHNJYzpl+M9VcqYQn9t/OpAQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9B9B240002;
	Thu, 22 Jun 2023 21:16:00 +0000 (UTC)
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
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 06/17] dt-bindings: mtd: qcom: Prevent NAND chip unevaluated properties
Date: Thu, 22 Jun 2023 23:15:59 +0200
Message-Id: <20230622211559.3581908-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-7-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7578bb1f9273aa47d540f71fef446118821784b1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_221613_653277_72A002B9 
X-CRM114-Status: UNSURE (   6.52  )
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

On Mon, 2023-06-19 at 09:29:05 UTC, Miquel Raynal wrote:
> List all the possible properties in the NAND chip as per the example and
> set unevaluatedProperties to false in the NAND chip section.
> 
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
