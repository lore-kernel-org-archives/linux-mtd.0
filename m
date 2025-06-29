Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73BEC7EE39
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Jun 2025 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Gqsg75DEYapYt5R9lpBNOSGZc6bqCreRInmhy5hYGIg=; b=C3cYKBPQmNXHMM+aqg0O6/WHyh
	BQdlHSIIlIiC6k2b3l9ljd59s4TPrh9SMdsvfH9vcxzdJ9B5sFESQ2bD5zoiL/rV9bRBIBpxxhedo
	gxO6HNAKez0AbeN5DN4t9uId2N9lneQPaj4O+/sec8hm3PHSX8slmbZCq6FOupy0x4WVLWOSnQgYA
	aNdIP403ZGlbyKK9scsYeFbcWEadwGDU4F2CrBKSUUwXO0WuVdOnjEAxQPXDSj27kwZarbDorPGiY
	2jq5ux1BqtWiAE9a5mx2suKmaCvPFs7Fb+PG7941XqB4qbqUFNaWtCREuiYbGiuiEjllr7npD1a31
	Rtu+d5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVoLo-000000004zd-3RX2;
	Sun, 29 Jun 2025 09:29:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVoLl-000000004zE-1gC4;
	Sun, 29 Jun 2025 09:29:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5418C4409B;
	Sun, 29 Jun 2025 09:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBA4C4CEEB;
	Sun, 29 Jun 2025 09:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751189364;
	bh=hW2QT0dkXHNl3tJf1s4Ivv7cRC7FzorVHdUtVP/XD58=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YwTv7WuafqwCkunNtrXOesosznuhC5eF/imeYJpm3lQKQAQCm4JkUwc8hwxLOwqFJ
	 71sGELzn7Rc4cdspQS1ORwB7xmXWw8P7uc9Wje+2MT5w7xmZ3u4aYVleNEruEhrCmL
	 Myzf0Nn2NRjtZw8U2Z8SJ42AZpJab8ruxFtHeI1l4QPeYApGu6bd/EwKFoG+xP0Vgn
	 6cvcmRIJBJKS8arBIBlxpun1+nrcewqr1AMjGGdy1NDMPL6+8lfMFzzJPlnPG+lE5i
	 9GaLf/WEXftPRNO9l31RBM0tu9L0JQWWPgGeW4zpDSIhIF/C5FWXYYldlt0N50cudA
	 aUXXIufEacNsw==
Date: Sun, 29 Jun 2025 04:29:23 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, sophgo@lists.linux.dev, 
 Palmer Dabbelt <palmer@dabbelt.com>, Mark Brown <broonie@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 Michael Walle <mwalle@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@gmail.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
To: Zixian Zeng <sycamoremoon376@gmail.com>
In-Reply-To: <20250629-sfg-spifmc-v3-1-28db1f27e999@gmail.com>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
 <20250629-sfg-spifmc-v3-1-28db1f27e999@gmail.com>
Message-Id: <175118936320.3838715.11903647701453583408.robh@kernel.org>
Subject: Re: [PATCH v3 1/4] spi: dt-bindings: spi-sg2044-nor: Change SOPHGO
 SG2042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_022925_459658_37875B41 
X-CRM114-Status: UNSURE (   9.98  )
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


On Sun, 29 Jun 2025 16:23:10 +0800, Zixian Zeng wrote:
> SG2042 is not fully compatiable with SG2044,
> So it is necessary to become independent const
> 
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml: properties:compatible:oneOf: [{'const': 'sophgo,sg2044-spifmc-nor'}, {'const': 'sophgo,sg2042-spifmc-nor'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250629-sfg-spifmc-v3-1-28db1f27e999@gmail.com

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
