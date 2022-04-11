Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9BBC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 08:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EdArzXHmb9Ax7UBRkbf6Lt6TRU7leCzapZh/blTgVvY=; b=LToW4RriyHBbIm
	K2ieH+R8PSeEHiBsuc8laSDEk+QLfwTZa8zn2uffpELyRNv1opR/U3S3RcqliFwC1kynE3NLL+TYZ
	h2OCWZ1YK+UjTTnslE3oUYNcMhwU8a9CxmwXwEXkbS7bB+pgZIu205PjnMwxznvubMi8Pox8+ST63
	JYBugcuWRr8s2QSked8Mz0/AFuMGso1qyUTcBWrW67hndFtVFArYStQZ9X4JyBcuiQQCyQw2yHiZM
	RWyU72oMPoLWO4AbQ0nhx/ZDX5VDTcDmr0nCLiIyAi7A/rmwUV3WFuab/JpspTFLLBX/jwsnI1gRz
	iCsMdnj5LM30yfmPaH/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndprG-007g7z-H5; Mon, 11 Apr 2022 08:57:14 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndprD-007g59-AV
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 08:57:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 617041C000E;
 Mon, 11 Apr 2022 08:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649667426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N94CYxFySJWV4VTz8jcRQZhwRVn/OQKhsKV51XZEAU0=;
 b=RIsgV0HihF5l10iOAlUFxswjPna2xqnCkS24ImR02PY/9BRka7FVhGpbBMDlFA+1LKaulc
 kMF8P28DziXYcpQaO75+wm2W9c0vh9PBgZNtPLRLhRD+gDtwDcb9zgb5+gDUoSyKTUfZ2k
 be7QSdpggLiRjMJ8maI24tfVemarUPC2iOVOzrRQSMJO8lQyJ4c6qW7vqMMQycaIt1hgZL
 OltUOzfq7dVkGCX7q6NzEWkQ3s45rvweyMKDJ/b9EfIqnaW+ZabgL8GDRULRhwvxehm0zk
 Oai8JOE2ZRjQmXzzN+0i7CSntfwEVoZC0fOg4nn78Cz3nrVixp5cdURGuLBUow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mtd: jedec,
 spi-nor: remove unneeded properties
Date: Mon, 11 Apr 2022 10:57:03 +0200
Message-Id: <20220411085703.10796-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220408063720.12826-1-krzysztof.kozlowski@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'36f83e2754f9d2d96182a5570a16f057ab5932e0'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_015711_835507_31175641 
X-CRM114-Status: UNSURE (   5.49  )
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

On Fri, 2022-04-08 at 06:37:20 UTC, Krzysztof Kozlowski wrote:
> After conversion the jedec,spi-nor DT schema to reference other schemas
> (SPI and MTD) and use unevaluatedProperties, few properties are
> redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
