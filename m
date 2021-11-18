Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E51C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 22:24:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9451D61A79
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 22:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9451D61A79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9lMuuVeq7mqLMzkzf2u8zko1YyNpCgMg06YJJNzcG7s=; b=0Ph6DusPxrovAq
	ixrMO2JlE8JBn8Nrp8QG9+bbDw/p9ljcLKNrPVBf8SfkaKo7O517CvwA0RqvP9zFjlAQ3WLMbF8iz
	wqkJxIlNKngjr+f0ohXy6wCSmp8e4WIJbWaAZ8WVJw1b7OWmdA6LPVz7IEPOWVymv+YikvYOLNguV
	Z1A5p8ZFwWTFoQAtBIrkWQeO5PjRg0QJI7XUOV5ECZl2zRAYP63KtlmU4y6Qqyc/RG+ck4jQ0z5y8
	szeJ5Ef59+g+eSMilnn/ayhogVnCbfd3UDqW3k/KryPtulZrivV00TCrIzYYjrue3tlx/pBe0Past
	NEIQEOkK03WFNRAaH5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnpok-008xgh-FE; Thu, 18 Nov 2021 22:23:42 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnpob-008xfN-1X
 for linux-mtd@lists.infradead.org; Thu, 18 Nov 2021 22:23:34 +0000
Received: by mail-oi1-f175.google.com with SMTP id q25so17691233oiw.0
 for <linux-mtd@lists.infradead.org>; Thu, 18 Nov 2021 14:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=90rjTt6sCjRL8QevMPYuFl/P99rXCqrTBx6fBN4whw0=;
 b=MZQILV0QyJM1+GLMsw+f69+nAdAX3ZDVbl8NWD9fSWijb0lQ5kkZpnWx+C/bvFIeZA
 9l8yMDPvepfbQIWp6s1X5u51W6po17ByRwMBhI+VX22pJg3fKA2ML/p2mORQdgZyoJ9R
 +lSgfOSeRekmypApze9h+1tiwNG+VnVZxJC0P4SGggZUJ2JZXozBfD0B4KmNsj3hWL3+
 2cRZczDiJIcYFFkZFFh88deK5jX24iFdXXIgwGlthnD3L8QC7iSOqLtRP0Vla0DVVWk+
 LvGoJQff2O7xPSGFlEGu/iUqncKqIAPmFHOg10VPThYg/iNiuW7tTWLqJYbk5Aiy1QTH
 TFBg==
X-Gm-Message-State: AOAM533Q31A5F0ui5c4OWNrSIcGDB3K86+WVMlcSSOpXQPuZsC37zwdd
 IpNc3fRpFhNzwDu60lA6Nw==
X-Google-Smtp-Source: ABdhPJy5i/iXgnkQUQyKkZPVmCaH4AfnPGt8E+GJVKgm68l5AgifFZp04t/jxek2rBsgGWa7pl2BRQ==
X-Received: by 2002:aca:a989:: with SMTP id s131mr408097oie.71.1637274212460; 
 Thu, 18 Nov 2021 14:23:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r5sm203721oov.48.2021.11.18.14.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 14:23:31 -0800 (PST)
Received: (nullmailer pid 1864403 invoked by uid 1000);
 Thu, 18 Nov 2021 22:23:30 -0000
Date: Thu, 18 Nov 2021 16:23:30 -0600
From: Rob Herring <robh@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 2/3] spi: dt-bindings: cdns,qspi-nor: Move
 peripheral-specific properties out
Message-ID: <YZbSYl6Bjob+LxIi@robh.at.kernel.org>
References: <20211109181911.2251-1-p.yadav@ti.com>
 <20211109181911.2251-3-p.yadav@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109181911.2251-3-p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_142333_108279_D361C608 
X-CRM114-Status: GOOD (  12.98  )
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

On Tue, Nov 09, 2021 at 11:49:10PM +0530, Pratyush Yadav wrote:
> The spi-peripheral-props.yaml schema contains peripheral-specific
> properties for SPI controllers that should be present in the peripheral
> node. Move peripheral-specific properties to a separate file and refer
> to it in spi-peripheral-props.yaml.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes in v3:
> - s/slave/peripheral/g
> 
> Changes in v2:
> - New in v2.
> 
>  .../spi/cdns,qspi-nor-peripheral-props.yaml   | 42 +++++++++++++++++++
>  .../bindings/spi/cdns,qspi-nor.yaml           | 33 ---------------
>  .../bindings/spi/spi-peripheral-props.yaml    |  2 +
>  3 files changed, 44 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
