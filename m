Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8243CC7EE29
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 20:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNw8cqIVx+H4Gwklyaryo9/OUv+5rk2A7NBMsdEPZgE=; b=0Sgrwtlv800tkv
	FLW1HZy4M8P/sD0WoKdW4QJetAWdEgWyeJyMp+OB3j0QAbNkgMZrItOuK6wcUMc9SOPx6WDcV6cbl
	g7Cz95I8EUXnT4Vw1KKZpV0ydoTGHDLf6LsHhx7UmsbkD6lojmbGNNUqu/wpaAaak5mOuHdPAdVl4
	9BKLsYssL0sRVoxdKdBmRZg3alVFnmIPt2FG4Gp1Cs8vIo/t4vy5jwBPSpZX+w2KgCc0FxkTPtkrr
	MO7i4z5bfuHa3Q6ClTQ1IeXhvmXiYUWN8ruaSMZZTQNZMKrav7JLEenmO2ZRIP0//zT8oHxq8jSAi
	IW5UUBSWoWqqHPlGlvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7j5Z-00EEmT-1D;
	Fri, 09 Jun 2023 20:52:05 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7j5P-00EEki-1t
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jun 2023 20:51:59 +0000
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-33b6c47898dso9669685ab.0
        for <linux-mtd@lists.infradead.org>; Fri, 09 Jun 2023 13:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686343910; x=1688935910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwWeHAoYaF11bB9mZFv3houRJOLICswQAHnlj8zt7CY=;
        b=E7cSDLEBB7gkttltoaWI4sIBlZFljassbuO2tH0kelXY8A/jHpdbBTPUxe6rwHFnFm
         QmyAWOv73X/RcYUcG6ztOK4GIv5AGf420l41Z+ulTOZmH4s2Op4qg4DtELClFAcCxRgf
         EYcuNKkAmImcm1v62oQG+Y2j11Av7F59RiuaEoZbSIviHn6WPGTAKE4BBx5mEK9LQdEa
         s636jJnuOZWeV76/0xp1pDTxEy9NfeJImQLEO4Ld4ntuP9ZeTCLVwN7er/4hAEQHtq8i
         S8S/Y1kmfL1lYuzVat7baV2n2rxv6Z2D4DwF99Pbhhyz84nt8yU+nEvkaQ9/I/xaztXa
         liBA==
X-Gm-Message-State: AC+VfDxT5RJxm8PgiRJGJBgs5YT5vHF+CPiJrG9j63VDYSdALd43eF2Y
	y+QMS4W4P345Cgama7N3rw==
X-Google-Smtp-Source: ACHHUZ4riMrSDwUHA+k5LTF2kL3I4AgrIGl5wIGqX/SJgM1ZUWWEwLgxA67lhspp5qQqCuQi7nO/Xg==
X-Received: by 2002:a92:d90a:0:b0:331:4f70:a2b with SMTP id s10-20020a92d90a000000b003314f700a2bmr2557210iln.5.1686343910497;
        Fri, 09 Jun 2023 13:51:50 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id cu7-20020a05663848c700b004165ac64e0asm1169350jab.40.2023.06.09.13.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 13:51:49 -0700 (PDT)
Received: (nullmailer pid 2197051 invoked by uid 1000);
	Fri, 09 Jun 2023 20:51:47 -0000
Date: Fri, 9 Jun 2023 14:51:47 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Brian Norris <computersforpeace@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Christophe Kerello <christophe.kerello@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	Liang Yang <liang.yang@amlogic.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Samuel Holland <samuel@sholland.org>, 
	Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v2 00/17] Prevent NAND chip unevaluated properties
Message-ID: <20230609205147.GA2186622-robh@kernel.org>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_135155_630395_8E1633A2 
X-CRM114-Status: GOOD (  20.18  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jun 06, 2023 at 07:52:29PM +0200, Miquel Raynal wrote:
> As discussed with Krzysztof and Chris, it seems like each NAND
> controller binding should actually restrain the properties allowed in
> the NAND chip node with its own "unevaluatedProperties: false". This
> only works if we reference a yaml schema which contains all the possible
> properties *in the NAND chip node*. Indeed, the NAND controller yaml
> schema contains properties for the NAND chip which are not evaluated
> with this construction.
> =

> Link: https://lore.kernel.org/all/a23dd485-a3d9-e31f-be3e-0ab293fcfc4a@li=
naro.org/
> =

> While converting Marvell controller bindings, Chris explicitly pointed
> similar bindings which would also trigger errors when using
> "unevaluatedProperties: false" because of the problem mentioned above.
> =

> Here is an attempt at making this logic more robust:
> * All NAND chip properties which are specific to the raw NAND world are
>   moved into a raw-nand-chip.yaml file.
> * raw-nand-chip.yaml is referenced by all NAND controller bindings when
>   the NAND chip must be further constrained.
> * raw-nand-chip.yaml and spi-nand.yaml reference nand-chip.yaml.
> =

> These change made me realize the qcom,boot-partition property
> description was broken, and a few other descriptions needed small
> updates. Here is a batch of updates to fix all these.
> =

> Thanks,
> Miqu=E8l
> =

> Miquel Raynal (17):
>   dt-bindings: mtd: Accept nand related node names
>   dt-bindings: mtd: Create a file for raw NAND chip properties
>   dt-bindings: mtd: Mark nand-ecc-placement deprecated
>   dt-bindings: mtd: Describe nand-ecc-mode
>   dt-bindings: mtd: qcom: Fix a property position
>   dt-bindings: mtd: qcom: Prevent NAND chip unevaluated properties
>   dt-bindings: mtd: ingenic: Prevent NAND chip unevaluated properties
>   dt-bindings: mtd: sunxi: Prevent NAND chip unevaluated properties
>   dt-bindings: mtd: meson: Prevent NAND chip unevaluated properties
>   dt-bindings: mtd: brcmnand: Prevent NAND chip unevaluated properties
>   dt-bindings: mtd: denali: Prevent NAND chip unevaluated properties
>   dt-bindings: mtd: intel: Prevent NAND chip unevaluated properties
>   dt-bindings: mtd: rockchip: Prevent NAND chip unevaluated properties
>   dt-bindings: mtd: stm32: Prevent NAND chip unevaluated properties
>   dt-bindings: mtd: mediatek: Reference raw-nand-chip.yaml
>   dt-bindings: mtd: mediatek: Prevent NAND chip unevaluated properties
>   dt-bindings: mtd: ti,am654: Prevent unevaluated properties
> =

>  .../mtd/allwinner,sun4i-a10-nand.yaml         |   5 +-
>  .../bindings/mtd/amlogic,meson-nand.yaml      |   3 +
>  .../bindings/mtd/brcm,brcmnand.yaml           |   3 +
>  .../devicetree/bindings/mtd/denali,nand.yaml  |   9 +-
>  .../devicetree/bindings/mtd/ingenic,nand.yaml |   4 +
>  .../bindings/mtd/intel,lgm-ebunand.yaml       |   5 +-
>  .../bindings/mtd/mediatek,mtk-nfc.yaml        |   3 +-
>  .../devicetree/bindings/mtd/mtd.yaml          |   2 +-
>  .../bindings/mtd/nand-controller.yaml         |  85 +-------------
>  .../devicetree/bindings/mtd/qcom,nandc.yaml   |  45 ++++---
>  .../bindings/mtd/raw-nand-chip.yaml           | 111 ++++++++++++++++++
>  .../mtd/rockchip,nand-controller.yaml         |   3 +
>  .../bindings/mtd/st,stm32-fmc2-nand.yaml      |   3 +
>  .../bindings/mtd/ti,am654-hbmc.yaml           |   2 +
>  14 files changed, 172 insertions(+), 111 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/raw-nand-chip.y=
aml

For the series:

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
