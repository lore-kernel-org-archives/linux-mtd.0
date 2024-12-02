Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B21D7833D
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 17:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=X6h7oITMQ0hv3vmJfdDBY9RSJPiQyOqZ5D9M7ZGkpNU=; b=XILOaS9Ky/9aQ9b34ucpzjuEF/
	RZn+Fm7P1uzdpozJ3jgsxkDa+irUFVX7hTQ3smle6dCM67xxvwYigdJQlaDPTygZ6JgTXvZ9iFSE8
	94ogNqorJ+Ibd2UZGnd6msqIQSR/A4S/+y1vtzsNYGmlWTcJ1RX41PFElt0TUlxdn2gZ10bI1iJrl
	euxczgMqkz1EpZDxm8Lro8+0jV/IkYL9Pq3HuvrMCSF/8GeYsbQwCdQvhqUcikYd6ZASumIi5mhJg
	Z5yjltQSJ2lO8lfpUkOYGZi2mkLMFKDfRRYjpd269Qg42JPOXmUboiBYOIuiyS0OaT/RqHait2Zgx
	2kwNYFqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAOD-0000000739K-15mC;
	Mon, 02 Dec 2024 17:39:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAHg-000000071VW-20uc
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 17:32:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE03C5C58BA;
	Mon,  2 Dec 2024 17:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B186C4CED1;
	Mon,  2 Dec 2024 17:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160751;
	bh=w6qO0Ed/ublU69cCli1C54Cmd72s6/ejpFNGotr9uzI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Rn1qsH8VMjXlRnQHHa9Dv++TvuG6MSvi1tGugzebcjkhjuluwxukyhCupbFV3tNGs
	 HiJXBOa2SA9qR24iA06crMO49iD1hjRj6xOrgv+KM+hAXv5H4KqKCwuQXsek6+ZB5Z
	 5mD8+l/gJywwdqKjA6MlYbOGTaNrnv9UytiEwNGtyBgMFTu9zUz4kHsNs3BJ4/yilz
	 eui4ZFhp27082Kjc4dl1tu+BzDq1HMxknSaa+wXulCEl7FoMhZKX2w9puG2tAJH80/
	 9bKhZL4ih+nN2yEb7em2KP/SjlLMc5WYGWIyZG/+G+B46RzbSvaiG7TTO9YlgPLwOW
	 tuwHh3GKVUGSA==
Date: Mon, 02 Dec 2024 11:32:29 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, David Jander <david@protonic.nl>, 
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Schocher <hs@denx.de>, 
 linux-kernel@vger.kernel.org
To: Jonas Rebmann <jre@pengutronix.de>
In-Reply-To: <20241202-mb85rs128ty-v1-2-a660b6490dc8@pengutronix.de>
References: <20241202-mb85rs128ty-v1-0-a660b6490dc8@pengutronix.de>
 <20241202-mb85rs128ty-v1-2-a660b6490dc8@pengutronix.de>
Message-Id: <173316074958.3037004.1498863519585640694.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: mchp48l640 add mb85rs128ty
 compatible
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_093232_561696_0122F843 
X-CRM114-Status: GOOD (  10.11  )
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


On Mon, 02 Dec 2024 17:35:21 +0100, Jonas Rebmann wrote:
> Add a compatible string to support Fujitsu MB85RS128TY.
> 
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.example.dtb: eeram@0: compatible: ['microchip,48l640'] is too short
	from schema $id: http://devicetree.org/schemas/mtd/microchip,mchp48l640.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.example.dtb: eeram@0: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/microchip,mchp48l640.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241202-mb85rs128ty-v1-2-a660b6490dc8@pengutronix.de

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
