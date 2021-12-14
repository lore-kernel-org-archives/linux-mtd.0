Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CEAC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 17:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pwS2y6luZqxgpdqKxKzVNSoGjwtavaMTVBZumvYfqk=; b=S5DyM2Wc0Hkt8s
	RYMeGOdSiOomci/DbDzRa+Vg+BOgK4fNVWGB0KZayMOWS0dLgQ5YGUsW/3rwICnyPKD2DYDRYh84M
	Zr0K1NCUBc49130mNQeCKsfhBvqBOJgxj82CntYjNyORCRrUfpVlWMtirobMLTf+NOlWdllw1nPnP
	hQ2+ILoZ0R3XbHo3qUEzxMNOxkNrl+4MMwq6Aizc61GkxdWycqEGdPgdGwXKJuHP0XuWTnWAf+K+2
	KRe+oXwjkeXyGuchiow+59K9kN9ZM6Q0oz3t8BImVU1fm9HNOUMtkcMHm7itnwypcu9Sxm8UzqN6G
	xPTiptTN1E5v5Sk/VJMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxBkL-00F9ui-5H; Tue, 14 Dec 2021 17:37:49 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxBkI-00F9u0-Qb
 for linux-mtd@lists.infradead.org; Tue, 14 Dec 2021 17:37:48 +0000
Received: by mail-oi1-f182.google.com with SMTP id bf8so28148214oib.6
 for <linux-mtd@lists.infradead.org>; Tue, 14 Dec 2021 09:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WR9gGYu8QQ5K/woO2Lwtdpoe5T+WeJunkKn+dMZvc8w=;
 b=41aSKs+cYWXtpUthNnWk5f5m/TYkwxptTwq95nancsVaF/jby4c0pVbScaS9UIttFg
 4C/sKT6L3CKsBBVo+rHf/211N9JyfDn/RXs9sGhmF1CLxvCL2sC6MLw6uO36vvsQu2ct
 c9sOOcTUbpritas/UINIueensYujkOYKmsp6fv7zZM5lMrqxyiHVilTDKxn6k3Qs8S4+
 VlpWVz9fi4fschVYKOOzJg9kPaPk3ZUIXaTCQUC72npMlxkcaYrnJall+miNVtruNRTc
 zZCEGU8bP+WHqWWJVRC3degnQr+b5yPtmc+uRjHXlIPpMfhGyl7eUE9pYUl72xFhzUpO
 y/4A==
X-Gm-Message-State: AOAM531lJf6VIpYgbDnU4y4EizHfoM9U95C6wdnIYi5WSfIz0nafDdTP
 dQz1Mb+ouEdE88smFOhwnw==
X-Google-Smtp-Source: ABdhPJyeANG0XOSBeKhvl+rrKsdX6O51quAB/Q0zd1QnHPf6CDYKn4K8Pm5zHFarIk1R6asLr4/DpA==
X-Received: by 2002:a05:6808:1509:: with SMTP id
 u9mr35869237oiw.13.1639503465518; 
 Tue, 14 Dec 2021 09:37:45 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c9sm98122oog.43.2021.12.14.09.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 09:37:44 -0800 (PST)
Received: (nullmailer pid 3604503 invoked by uid 1000);
 Tue, 14 Dec 2021 17:37:44 -0000
Date: Tue, 14 Dec 2021 11:37:44 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 3/3] spi: dt-bindings: Add an example with two stacked
 flashes
Message-ID: <YbjWaE5ZwmuRd/EI@robh.at.kernel.org>
References: <20211210201039.729961-1-miquel.raynal@bootlin.com>
 <20211210201039.729961-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210201039.729961-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_093746_894970_5B7E0EC5 
X-CRM114-Status: GOOD (  15.72  )
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

On Fri, Dec 10, 2021 at 09:10:39PM +0100, Miquel Raynal wrote:
> Provide an example of how to describe two flashes in eg. stacked mode.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/spi/spi-controller.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> index 36b72518f565..048d2bbc74a5 100644
> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -139,4 +139,11 @@ examples:
>              spi-max-frequency = <100000>;
>              reg = <1>;
>          };
> +
> +        flash@2 {
> +          compatible = "jedec,spi-nor";
> +          spi-max-frequency = <50000000>;
> +          reg = <2>, <3>;
> +          stacked-memories = /bits/ 64 <0x10000000>, /bits/ 64 <0x10000000>;

stacked-memories = /bits/ 64 <0x10000000 0x10000000>;

While the source syntax allows for multiple (and mixed) /bits/ 
annotations, that's not something we support really.

If you have problems with the schema tools on this, let me know. The 
handling of this is not the greatest.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
