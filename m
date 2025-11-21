Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05843CFC295
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Nov 2025 17:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lc7bMQFOzCFoNebx+M3nSXq/4FbuWodd62xMPleU8EY=; b=OIuVlq9U8762VHjk965uK3ZK53
	H32I/CYOWRV3QWXBTFlKw9j3d7HCK8pJ93arG3MP6vAskglnTNsBhSmgvYsxMY4H0uGH0MHz/mYZ4
	BJXHtzMSm7k5/FG0hVIyuWI9qfhVo7E9paqf64PrruA7/oG8YYJFpe4NWeY4zqDKSHJkxAOMKIIhk
	/+XV3UU+tx342hacNTKRmBq30zamWu/cV1Kk2/O38ZINPkDL1h7cRCUuG3yzSlZdLcq0r11RL6Vu+
	4g6c2ZzeoJo5A2grzFqYSQ8GEtCtflV/4gFQIohsePqkGUvXdq3/rQavedzU2ltJVXud2gWrSIYb1
	IuOyVW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUV3-00000008lbp-358l;
	Fri, 21 Nov 2025 17:00:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUV1-00000008lbY-38zL;
	Fri, 21 Nov 2025 17:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1D2D60515;
	Fri, 21 Nov 2025 17:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C79C116D0;
	Fri, 21 Nov 2025 17:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763744442;
	bh=90DNGtFm9MdQlp4AmTDRnAxa7ja0sbcC058ubJ/XCpw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QXVqhXKQsC6vuM6z3TZJVHYw9E2N8BceNMfCU1JtZYQ68/XXZg61NXd+fcuWoybbs
	 m+gutwnYEnCnNLvDInugffbf6Yv9bNdhrwq5rvl0NPaZcTB4KtneQT/TdKmvjTDtwC
	 0SEVb7NSsf0ombKmQSJtUKNiY5EkjvtuAVCszqp9CgNIkqwsb2Cu0xTtOHpZ503+MB
	 Vsg0kyP7Q74kvbGwUcEN+hYObx2LbE2Gys8tDJlDl7ZeP8C9YOiMsK6pd3iZF9o7YE
	 NVC7CYwgT3ESn9aUWU0jRWXqiCyHe82/sRK/Kf/dBx+zo3F1/yjLQld8Ew/IAcQQUm
	 RkTuipMD7zikQ==
Date: Fri, 21 Nov 2025 11:00:41 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Richard Weinberger <richard@nod.at>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
In-Reply-To: <20251121-mtd-memregion-v2-2-c5535fdcebe4@bootlin.com>
References: <20251121-mtd-memregion-v2-0-c5535fdcebe4@bootlin.com>
 <20251121-mtd-memregion-v2-2-c5535fdcebe4@bootlin.com>
Message-Id: <176374444102.1332163.10540866248088706987.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: mtd: physmap: Allow using
 memory-region to access memory resources
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


On Fri, 21 Nov 2025 16:42:36 +0100, Gregory CLEMENT wrote:
> Enable access to memory resources not only via I/O address using reg,
> but also through a portion of main memory using memory-region. To
> achieve this, new compatible strings have been introduced: mtd-mem and
> mtd-memro.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/mtd-physmap.yaml       | 59 +++++++++++++++-------
>  1 file changed, 40 insertions(+), 19 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/mtd-physmap.example.dtb: memlog (mtd-mem): $nodename:0: 'memlog' does not match '^(flash|.*sram|nand)(@.*)?$'
	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251121-mtd-memregion-v2-2-c5535fdcebe4@bootlin.com

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
