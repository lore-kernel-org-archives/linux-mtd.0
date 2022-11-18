Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E031C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Nov 2022 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LTZ+OG8LiWvkwlK8ltot190LGoA/5ecosJhAqz59KQ=; b=ZV+BtOrVUNnRk/
	keiuWBrad9pjDbSeaAjLlZqCzxbwP/Ns/fwUX+LtZ2cyEOak5O/nLilAtT9ezQ6UyjcOJIGp0Stwd
	NtJqNRKfDAnntNJiYDhhie9nTEd6WX0c++UTiYA1y2V2vmMKywy0SIX+4HQ2hStXKQJuxHpdHckYL
	cYMijskImUojSS1TIFXO0yoHRmOeiIeUq38pKY1fEn8Z2BYJcUsFsDKOvmZ2G+z9oTw8JJrShKv5K
	7uMY2WztnZuy/fL4FehHlcnadipDbsivm8svAhXaAuSzLoZvb/SYbGZpdxCoYsBmAU3E8y5SMPwLg
	Uu0FHAg/o8pW4UmElL8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow29O-004Lib-Rd; Fri, 18 Nov 2022 14:15:26 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow29A-004LXN-Kb; Fri, 18 Nov 2022 14:15:14 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D1C8688;
	Fri, 18 Nov 2022 15:15:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1668780903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l7qFq+hb6tsUJLwHmcXcoBAd1kn5ubQZkT0q3bCuMFs=;
	b=f5Zsxj3Q7CiBCzS/6GtFEWucZJXGEO4bbycrzcFv8lAWDB8j8cH9tig9ivOCZ1FfC/easc
	TZ2+ExmaqRA9tECLwRMsZSVjw9hz6wfLYcy4ayC8BJfS/BLgcbeNCRk3JqtZECa6x//4MA
	RmAG/a3svn/C9E0/CSvSTGhdwIaVowVDIPBBp6zrY51ET494PVd4pT8Ig40V6G0/ijsc1E
	jIR3N4sE+PeXqdPdD4FqZPEcqltWViLiCCBf+Q8LYxFjIx12e8h8AuWWiAeB/ogAnN6yRw
	8S22cwguM4h2qJ4poiyulnH9MdF7pP+CKN62DzRY5NgeEGreGnWXEcDNOyiXZQ==
From: Michael Walle <michael@walle.cc>
To: tudor.ambarus@microchip.com
Cc: alexandre.belloni@bootlin.com,
	broonie@kernel.org,
	claudiu.beznea@microchip.com,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	nicolas.ferre@microchip.com,
	robh+dt@kernel.org
Subject: Re: [PATCH 1/8] spi: dt-bindings: Introduce spi-cs-setup-ns property
Date: Fri, 18 Nov 2022 15:14:58 +0100
Message-Id: <20221118141458.954646-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221117105249.115649-2-tudor.ambarus@microchip.com>
References: <20221117105249.115649-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_061512_863444_28DC7DE3 
X-CRM114-Status: GOOD (  10.14  )
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

From: Tudor Ambarus <tudor.ambarus@microchip.com>

> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index dca677f9e1b9..ead2cccf658f 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -44,6 +44,11 @@ properties:
>      description:
>        Maximum SPI clocking speed of the device in Hz.
>  
> +  spi-cs-setup-ns:
> +    description:
> +      Delay in nanosecods to be introduced by the controller after CS is
> +      asserted.
> +

Does this need a type as the spi-cs-setup-ns is apparently just 16bit? At
least the driver uses it that way.

But IMHO this should just be a normal uint32 value to be consistent with
all the other properties. Also the max value with 16bit will be 'just'
65us.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
