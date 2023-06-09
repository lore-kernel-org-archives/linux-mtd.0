Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7F7C83005
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 15:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1QPQlCmLwhYUsPowYD9fn3mKX9mKW5GenVWETjy1uY=; b=KGwSvc0ly/tz0n
	guz4zo3OwjbgFxj61KSMtw6h3T/1shK7uhmkH+3w0P7JFxE0w90Cv0Li2JIxEDkz3dUHSMBtMf11u
	lDRDa+mEOjqRvn2b4/GP7wwjZemhQuuYmTAwFdKm7jVg01PstDK1FX+x7LgXR6N/LkHtfSwn9S3Sl
	9yZltNjOppiPczZx3O9Sp6CMwVv5EaFOw18KKzHNxB5RaNzfyqmks9O/sQ1lnNikmhySKnUzLtyTE
	1SHHEfjhFiqBiuBMAywR8ESxOW0IdA4wEBl4STy9xLrOyM5AVgqeoRgB0hiZxbcY3TRk8herQQPIS
	Y+Iruvk6/Fry8/LrmVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dzH-00DQHy-37;
	Fri, 09 Jun 2023 15:25:15 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dzD-00DQDZ-1y;
	Fri, 09 Jun 2023 15:25:13 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686324307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wHi7X7aAA8zTubfqvKuY/j0uPGYoVb4HVZekwL+kLeo=;
	b=ikU5TyFHddS4bXVpQ9jLoW1oxZt8dfvCzStC3yGGx28A68PWOuKuOMyObQKuHi5bM4kMZA
	taXg7EAF64VWa70dVM3JfWx3UWoTDSisWXhLUEb9K8K7JDsd1KZ7YY247P4VdabqT7JBW2
	sF9PJxtQmZJ1uROmvjTb17I/AKgipdUUK46yhLvE2mAYY1OBSFVr+IgM2XvOlubh5+I+Zw
	V4qIqxpkYbpPYSIEtV9bn42LP4oJKU3xUBfkTD1gzojObQ4J8MCKPqCqwMbCYBrzP5yjSp
	2rd4/Flnu4HCsBygR7Zhav+ZoSeZQie4p1Io0vw5aJ3PVh10KSY7MA/Q7CCD0g==
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
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A7A6240005;
	Fri,  9 Jun 2023 15:25:03 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: nand: meson: Fix 'nand-rb' property
Date: Fri,  9 Jun 2023 17:25:03 +0200
Message-Id: <20230609152503.1186962-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608044728.1328506-2-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'262bc0096b7c9122f5f815f094b068a1496a20f6'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_082511_783426_9F9F518E 
X-CRM114-Status: UNSURE (   5.93  )
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

On Thu, 2023-06-08 at 04:47:27 UTC, Arseniy Krasnov wrote:
> Add description of 'nand-rb' property. Use "Fixes" because this property
> must be supported since the beginning.
> 
> Fixes: fbc00b5e746f ("dt-bindings: nand: meson: convert txt to yaml")
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
