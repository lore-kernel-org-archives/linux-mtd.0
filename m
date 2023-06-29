Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E98EB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jun 2023 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qv7XOBKrPo6PNIjaCu2Azje+vnxZ08PJCl95ckxatTc=; b=HKowEbwgDDSDrE
	IRdFh+dS9HjxmAXF5U9xYeBUhUnhMQniNsn/EcqGLXOKDVi4n9T4i6k+O6ZKMcO2deONLCfnpaKdo
	DJCJqND1tzw6e5m8+h3cLn7TQjiQd9LodhHW92DJx7OdyJGpUUtJ6E2Rv91s91gwaGF8gO0mgI/qh
	P3EJdYYEMUCO6E66PUfaPXAJJIN9pByYRF8Xz6iNLlAC2V5S/Rb77ZjlNKEmlZv7zPZtCyWUwzA3+
	Uv+/lIi/9fvfF5PiFCPWKilBG8u4FDoT09a2kTHsIfoFKs3gO3hHurNNoY45d4WaJwyX3rlb3/oKl
	bm2QKMFih6kG86alsmdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuMU-001VvP-31;
	Thu, 29 Jun 2023 16:19:14 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuMR-001Vug-1n;
	Thu, 29 Jun 2023 16:19:12 +0000
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-785d738d3feso21666139f.0;
        Thu, 29 Jun 2023 09:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688055549; x=1690647549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzFF9iYtdArZX/WdIkxczovu3b9psWf4QpXmpxsWlSo=;
        b=cb8Qr5MdjtdFisEZNbIFJfQvNyyiRPhVCSH3gaXG8rWN61PPYhGb7HtUlJnNPQ+82m
         976w4FF0ID3cjRKhwJgFUVhcujhHaEkzkYzY9E3g9zJNNCynVhmggacfQ7espfS9uhVI
         TDdV3f9woLldSjLlV3ht92UslTyoO3PMCmBnPrAdyJjdz957pIjJ8tqKOQYyjRH1E7Wk
         iLAeklqmnAeIrCxMEBkKXgro6YjUvtyEUSCXtsSklpWe89ZDRM0FzQNMEpHlBFHMJfiv
         sBRGcUPqueIPdVok0QGE4w4N8jeycWXI9ZDzemsPUx4vC6td24w7uvPOmxspoSe2rkck
         FIWQ==
X-Gm-Message-State: AC+VfDzB2tYw0Jr7gHcH+ZfVrmnzG52c6/wxzcsnFmWYNOQgCEhYJ0Ea
	O9ZoCTkZmNJ8U9oIUAp8yQ==
X-Google-Smtp-Source: ACHHUZ4Egtuwpgl/FjmgbZkIkLAoLebxcaeXSSJQrI05xRI+RigHebzty+j+IJ1GFKNXMDPF6py4fw==
X-Received: by 2002:a6b:6106:0:b0:783:6c18:1e97 with SMTP id v6-20020a6b6106000000b007836c181e97mr302767iob.8.1688055548803;
        Thu, 29 Jun 2023 09:19:08 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id v18-20020a02cbb2000000b0042acf389ac8sm2538540jap.130.2023.06.29.09.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 09:19:08 -0700 (PDT)
Received: (nullmailer pid 3137121 invoked by uid 1000);
	Thu, 29 Jun 2023 16:19:06 -0000
Date: Thu, 29 Jun 2023 10:19:06 -0600
From: Rob Herring <robh@kernel.org>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Richard Weinberger <richard@nod.at>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, kernel@sberdevices.ru, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, oxffffaa@gmail.com, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [RFC PATCH v1 1/2] dt-bindings: nand: meson: support for 512B
 ECC step size
Message-ID: <168805554569.3137064.405254444310669508.robh@kernel.org>
References: <20230628092937.538683-1-AVKrasnov@sberdevices.ru>
 <20230628092937.538683-2-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230628092937.538683-2-AVKrasnov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_091911_613950_9437A46F 
X-CRM114-Status: UNSURE (   9.43  )
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


On Wed, 28 Jun 2023 12:29:35 +0300, Arseniy Krasnov wrote:
> Meson NAND supports both 512B and 1024B ECC step size, so replace
> 'const' for only 1024B step size with enum for both sizes.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
> ---
>  Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
