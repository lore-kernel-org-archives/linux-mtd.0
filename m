Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839E1EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXv2KPUN8HxaS3AYmCE3PBnRIE01qKZibC5CGe7VFOU=; b=Hx0xU5F/qYdmZT
	ILD5+Aj92m5YPCRM52duWw0hdVWH2Omoc9CUtC5XKhBTkncbjF+ztJNOBnmdJHcxfglAQJVfVId1t
	6C7U9T4ZkmZb6m1AlFbRnSpjdCirxKNFAO40Zw9PzMArxBWTeQ5gPgTqFojPNU7mkRnmIblOGuSHB
	MNjTvQdI0tUIfyibjMaJrRQs0K7hFi8pKpAjRJjkSzUjq/9u5cX9jV9UBjYvPF+tNdQexPs+nVG7e
	orqTTUIL5CZjqjGEvGRxxic7IqdUF6wlhFcjt+OUEMt/n+WbJ1uxno6C+BKqDgKDJBVZFftm9NiJo
	JX3g88wpH6fL0PWBonJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRdi-001oWr-1G;
	Thu, 22 Jun 2023 21:14:50 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRdf-001oUI-2R
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:14:49 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWVWnr8FXaOK/kyMs2PSKF1uzSJWMI1JblTsoyhBc4E=;
	b=pk3lMRaL9tN77AfAPReMe5BdaUxvwxOAEXT5oTT/wY9TP7duVsVojhQWWEETsiN9P+5hpp
	bQVWghLJK6tUpPrn70GXgYB9OoIuEAuBqlN0XvWOewcSQ7DG4uo0NvFMMJXfePcib4B/5R
	75+D1HFBY82+t5t6jqKmyTeMfnTelpSULNga1qLREZB8HXLyvZgjtGeaGG9tvGjTvD5yeQ
	s77I6wmGeYKmZ7nDawBlBPMRNuaSHme1uBT8dIc2cOH8x1eGP7Sn4XR6dQimKC3psRO/IK
	m8nFdoUiQPO3o3ZbFl7VB7sNMhLZyI2tHWL6Zh6MfrxY/spspeBm4NId/IgBAA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A049F40004;
	Thu, 22 Jun 2023 21:14:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v10 1/1] dt-bindings: mtd: marvell-nand: Convert to YAML DT scheme
Date: Thu, 22 Jun 2023 23:14:39 +0200
Message-Id: <20230622211439.3581500-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619040742.1108172-2-chris.packham@alliedtelesis.co.nz>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ad5c18c75d2a1de9eeaed60e417d308217f35e73'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141447_956602_8539B197 
X-CRM114-Status: UNSURE (   8.50  )
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

On Mon, 2023-06-19 at 04:07:42 UTC, Chris Packham wrote:
> From: Vadym Kochan <vadym.kochan@plvision.eu>
> 
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> There was also an incorrect reference to dma-names being "rxtx" where
> the driver and existing device trees actually use dma-names = "data" so
> this is corrected in the conversion.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
