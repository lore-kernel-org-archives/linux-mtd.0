Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F75FECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 09:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+BusmRlz4g7HtY61q7GeC615dROpwj9xdY/a53wQu90=; b=jzUEwR8YYGN9wji4adiaZe61cB
	EdQjEOSMlwjQ1JOLE7uJH7O0SOIfH245AlPLPP2ja23V5OC2GRWPmy0PvAG/3H2YXCEPGg2bY8FrD
	/KaFPHe3GPAnYIa+8rUD0QdL/6tEnCBUfhcUUHViTCjioVCsCQd3uLpdD8DL9Z/fSXfenc28IzZ+u
	aVeTlzRsgToWMB1bStw7+7yOFUiKjK8lZ2q/Zlz8u4fo9OfR+nTzl8Da4Ix1HbxEMTyqrppnNGu1g
	FBgCxccChx7Q6LEaQ/XrL/BEJ3+Lgf5xfnVhR0NYFiRDNMHCncjz9tUHHojtdai++gkvdHLon9MxS
	7eWgd1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snb1C-00000001O6w-3RJO;
	Mon, 09 Sep 2024 09:49:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaxO-00000001NVX-1Rew
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 09:45:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7CCB75C57BD;
	Mon,  9 Sep 2024 09:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4EEC4CEC8;
	Mon,  9 Sep 2024 09:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725875112;
	bh=OpoEq4rq2tR/fK1v7ChPxH80mWmyJhcEfy4/a87kMhE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=VwCz+g3mUFf+nc1DPxX053KtYES3DWrH2oz2tPjikFd0evUqUl3ZOjg9NfG+bZras
	 9ZALv+uFcbQHW6jKOuh0mjxQr1b+F8NZsYsN4j8r/Yjjj9+OPm1k0MeM1x9koacCW1
	 8gOd36sELxt06KofkZK6O+clK5jexyGHq8smwUxmWe2mHupGS+FdDOMS+9rnTdLLCD
	 BLhFzALlfmPGlCJxqC5TpfJCC0xShq9lxMewXlzNVahOfRT5YPCRqEiCghuSqVjTX+
	 DusYW3ifJ0v+4ApkTFb0Ct8ymahJQRyesAPBDdca0tG2T8Qfs//ny1wUxbhUEM/XCK
	 4cVcwXJnYbEag==
Date: Mon, 09 Sep 2024 04:45:11 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240909-ep93xx-v12-18-e86ab2423d4b@maquefel.me>
References: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
 <20240909-ep93xx-v12-18-e86ab2423d4b@maquefel.me>
Message-Id: <172587510150.3289209.1561633350794103525.robh@kernel.org>
Subject: Re: [PATCH v12 18/38] dt-bindings: mtd: Add ts7200 nand-controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_024514_514267_1E6AE023 
X-CRM114-Status: UNSURE (   9.57  )
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


On Mon, 09 Sep 2024 11:10:43 +0300, Nikita Shubin wrote:
> Add YAML bindings for ts7200 NAND Controller.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/mtd/technologic,nand.yaml  | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240909-ep93xx-v12-18-e86ab2423d4b@maquefel.me

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
