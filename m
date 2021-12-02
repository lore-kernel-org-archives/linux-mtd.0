Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE459C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 00:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqIxF2f6p2PVNNVB3qDE/upoGGmBOSMeg4EkWTuy890=; b=u/QIlERKfc/gk2
	x/3GNZC9gGQ04Y/3oA6ghNIBj3MF6I1tTwGnLLEq+iK8D5nFlyfYq/CZunu+12pJS+cFMyJVJNhcs
	9gQpTSwMXyIzvw1owD2Zui/+e5BJNm7bukejr+2B3QmmgzO8e5iMl6oa3RFXGRyewClUs0g8PNbGK
	mOXs0sF4eINrAjXqFyxm+nB+zSIh1R02Te1I+r2g4WD8kRF+onpRJZNQ+TkMEYtD/FXm/c5PkPaFY
	CtHwjYQGnP8UM/ev+YOSQzKFpqpID1tUiipIkpRHxUAhhajJe7ep6aitxNa0E9uTGsF1cmJqYWwYO
	MoYIzXJZzk1NuBU+7rqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msZbf-00AOKS-FY; Thu, 02 Dec 2021 00:05:47 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msZbc-00AOJL-4x
 for linux-mtd@lists.infradead.org; Thu, 02 Dec 2021 00:05:45 +0000
Received: by mail-oi1-f178.google.com with SMTP id o4so52054567oia.10
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 16:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0bkKn3tZ7FiBBVjYUALy+8qnEtiYJ39lDvMOVGYdBNQ=;
 b=pff8xruCme8YCq6DrW8qjd2Yb7t3l9g69CCftUPJgMLzapwOfrOrrGfin28P+fv0lb
 /48kZpVKPosaXTAPut/eYJdqiqmBAP4xbuN47Lv7zVXW9GqFKLJA+8plmJY5JdbhN7Y7
 myJl3DHPeyjqoR3q2wuT4qXW/fX16F3QL2gEpQczN83qmnNwP38xhlT75tWpwdcqmXTV
 aPuap9Jy1aCORieZnPk1YemYHrFmYrcm/wu1Bgg4cfZzxqKNLgTre/fP7Eowa6eD8jMK
 RfmB6VWDQqL01/GqSPhhSj67fCuD+qMMWkQQAxN6UNRzlyW6FLKKoT2GVUSW6+y+gW5a
 qQVA==
X-Gm-Message-State: AOAM530VLdRdM5o+IEvL11xd0xkF8jRJq7tlH1HrKv+75a96GvvUgX7t
 iGYD2T8Y5aLJ0MHzX3xlQymexxMY1g==
X-Google-Smtp-Source: ABdhPJxvdKd5rlLlmcEgsM/v7ECzfatKekSh4MbmYVPn8M3B5sIO32f72Plo/XfSU7NkhSXcBeLbGA==
X-Received: by 2002:a05:6808:1aa8:: with SMTP id
 bm40mr1592625oib.38.1638403543151; 
 Wed, 01 Dec 2021 16:05:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 109sm520704otv.30.2021.12.01.16.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 16:05:42 -0800 (PST)
Received: (nullmailer pid 3267913 invoked by uid 1000);
 Thu, 02 Dec 2021 00:05:41 -0000
Date: Wed, 1 Dec 2021 18:05:41 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2 2/5] dt-bindings: mtd: spi-nor: Allow external
 properties
Message-ID: <YagN1c7/Ltt/mhNp@robh.at.kernel.org>
References: <20211126163450.394861-1-miquel.raynal@bootlin.com>
 <20211126163450.394861-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126163450.394861-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_160544_223558_8AE48863 
X-CRM114-Status: GOOD (  20.03  )
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

On Fri, Nov 26, 2021 at 05:34:47PM +0100, Miquel Raynal wrote:
> Setting "additionalProperties: false" will refuse any generic SPI
> property while they should be of course authorized. In practice it looks
> like many people used compatibles different than "jedec,spi-nor" in
> order to workaround this limitation because otherwise no SPI property
> could be used in the examples. Use "unevaluatedProperties: false"
> instead to allow defined properties to be used. It is likely that at the
> time of the conversion to yaml of the jedec file, the unevaluated
> keyword was not yet introduced.
> 
> Fixes: 3ff9ee2a8890 ("dt-bindings: mtd: spi-nor: Convert to DT schema format")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index ed590d7c6e37..81be0620b264 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -88,7 +88,7 @@ patternProperties:
>    "^otp(-[0-9]+)?$":
>      type: object
>  
> -additionalProperties: false
> +unevaluatedProperties: false

This has no effect unless you have referenced some other schema here. 
The series I referenced will solve what your trying to solve I think.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
