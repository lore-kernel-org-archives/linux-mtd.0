Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50597C46467
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Jan 2023 15:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfD2jCyQIw6LWKW75ReSGrCeqYrO63xT39MzFd+fQfY=; b=M35lPHB9m+Ssh2
	VpBc4vaQvHMFK/JXjZw56lxWJm5FcUYq2ynEICkrcxGlrs0Roo2pOrgfQSsOI2hL/j0oYwjdkF3w5
	+J6lpMGbc9WWc+G2n/1Z180Wd/PfqNPZVx+ed0iCuY/CROFowkPPOLVxwhAjLgaqGzcdYLLRY4+Gn
	q8wKT6X84QkgQE+8d2n59zxhtW7suWS7UmF1/DI/eckwHnBCuldX8ZSV+Tc5CQm33e9y8zI02w0xH
	qw3n15l8OoxgibPOSsVpD2Z2g/d9wxt8QLaJwQKi0qC+CRR0fmxCMeUMo0O08UQ9HTOTC1q1IkdNW
	Q01fu7V+nU08W8rHLOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEBHX-007X15-90; Sat, 07 Jan 2023 15:38:51 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEBHL-007Wx5-IO; Sat, 07 Jan 2023 15:38:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 29A1AFF808;
	Sat,  7 Jan 2023 15:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673105914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1R0tFrnRkxpaya7FaSMEH1Vxs62o5AiwN5XKT3zuHOw=;
	b=jYj6k5t0jgbDvGd8bBN/g2gAALOqzhmVIfHgCR4EGMSQQH+igzEXI72CvXV9rj2isD+3lB
	7plO+djicHvAMNALglZLvO7OdDiFcMYoltr+V4Y3269dV8SsStrd1wokepVu2GXaq3iAJz
	umt3+MRVjk4D5EmVCSNOYOp+jctimyb/o3O7W2xKRa2x6Thygx78mr7O4JW8R4czS7rt3G
	kAAVLU2wD7P2aEWQhWLeqZVxYjbhEkhvTqEdV+rOQq2+Zb5Hp7NP3STRWbwPV7ZQNhv/47
	xIs6Q+hqKVv5tG5T1B7j83eMuKuC2U11mLBh7sv2T5hgMVfoKc8A/4dWDFlX/A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	arnd@arndb.de,
	richard@nod.at,
	miquel.raynal@bootlin.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	herbert@gondor.apana.org.au,
	robh+dt@kernel.org,
	akpm@linux-foundation.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@microchip.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	pratyush@kernel.org,
	michael@walle.cc,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] MAINTAINERS: Update email of Tudor Ambarus
Date: Sat,  7 Jan 2023 16:38:29 +0100
Message-Id: <20230107153829.895550-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221226144043.367706-1-tudor.ambarus@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c0f7ae27539fbac267384a7bfc58296ea7550d52'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_073840_828946_A53A4A49 
X-CRM114-Status: UNSURE (   6.92  )
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

On Mon, 2022-12-26 at 14:40:43 UTC, Tudor Ambarus wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> My professional email will change and the microchip one will bounce after
> mid-november of 2022.
> 
> Update the MAINTAINERS file, the YAML bindings, MODULE_AUTHOR entries and
> author mentions, and add an entry in the .mailmap file.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Pratyush Yadav <pratyush@kernel.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
