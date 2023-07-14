Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4120C0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jul 2023 20:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MiYL0MnG84UD9ZyTfoKizzxFY6+RVmWZQwVSJCVtvxA=; b=ZrWIxPsM2w2p0j
	mpzI7hSjxeubZPbXIspVYMQIiuU4U5Z1uEpb998HJ6iCOJVt3e6Xn/wfuaziVyss08nH4WZZcX5Yv
	HcMiCLDIW0YlMFh6lwdO1FW7T/jDQBmxCNRoYDeu8T0REzv6ApB5olP9tH0y+rdF2XETUmdqEk4ML
	g2q4iJ0MAJUfp2aBnhkX0NlBIII92Db4vMkSzjVMx5U8oo41bN79gXvcE2/sr+CpGAqwCoeyAk36x
	vO1xYcZfsJ1gs8T6IoXjvrELJL8QMiQkYxWKFa4bcerneJHbtcuQ9UiCSHOfs/5kjx+yjieTOeylB
	/cYM+fwcVC6iQ3iGu40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKPf4-007DOJ-09;
	Fri, 14 Jul 2023 20:45:10 +0000
Received: from mail-il1-f170.google.com ([209.85.166.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKPf1-007DNG-01;
	Fri, 14 Jul 2023 20:45:08 +0000
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-345a76c3a2eso10023775ab.2;
        Fri, 14 Jul 2023 13:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689367505; x=1691959505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjp2goDmU3eZUaBvWIsYt7Ff9ugaAud6phFHMfCuKPk=;
        b=G8MtgOZm6VVzBMwRqT/lt65SxygGCmr9oVql9VC7maDTx/tf49oxr9POioM/zKPgG5
         RRhN2wPKlLc+N4aCmn5xd8bGXEY9ATfI3IZIexrZi25vSXFqmSXL7Z7RyYWmPSD/CXgz
         nFhnxyy0Qtmcxlj86UBKxHL/PVS2zuS5BB08MaECjhAhZa6HQGg7KGHAtQWQmlULcgWc
         WlCV5m8ME2EZ6QJp57meirhgaO7dWJDRbvRF249GwG/Kzdtt5PgaQrO8xGkSLHHRO+F1
         5dh+8jMi2H2IRtVuHCKgeIpTEF0WifZiSDTdp6FB4xYrgbFLu166UHkHOcdDj7cjru9W
         TIIw==
X-Gm-Message-State: ABy/qLbeOjaIQHU3rGqCjlag4jIHY/YNAg6IJcFWeQTwSA5pAcwErPRy
	DGfV53eJtv6PC8RUYtu8iwtxtY2x5NyS
X-Google-Smtp-Source: APBJJlHYIZYxjmYxxwO8SeGpPnHJlVlcG1xS21FJsirLDGT6wdMnGUi4wUo4SySMRd5VSiQAB3oyzg==
X-Received: by 2002:a92:da8f:0:b0:345:c72d:33a5 with SMTP id u15-20020a92da8f000000b00345c72d33a5mr5385994iln.19.1689367505374;
        Fri, 14 Jul 2023 13:45:05 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id g11-20020a0566380bcb00b0042b48e5da4bsm2729732jad.134.2023.07.14.13.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 13:45:04 -0700 (PDT)
Received: (nullmailer pid 189489 invoked by uid 1000);
	Fri, 14 Jul 2023 20:44:50 -0000
Date: Fri, 14 Jul 2023 14:44:50 -0600
From: Rob Herring <robh@kernel.org>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, kernel@sberdevices.ru, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, oxffffaa@gmail.com, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [RFC PATCH v3 2/3] dt-bindings: nand: meson: make ECC properties
 dependent
Message-ID: <168936748954.189426.381778716587465848.robh@kernel.org>
References: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
 <20230711122129.2635558-3-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711122129.2635558-3-AVKrasnov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_134507_048102_812174BF 
X-CRM114-Status: GOOD (  11.50  )
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


On Tue, 11 Jul 2023 15:21:28 +0300, Arseniy Krasnov wrote:
> ECC properties 'nand-ecc-strength' and 'nand-ecc-step-size' depends on
> each other, so they must be both either set or not set. In first case
> ECC core will try to use these values if possible (by checking ECC caps
> provided by driver), in second case ECC core will select most optimal
> values for both properties.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---
>  Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
