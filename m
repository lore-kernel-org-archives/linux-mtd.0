Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FFEC41535
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Dec 2023 01:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=heQfuIBGUbMsVCP4glVuG8Vfsne6r7TxAieyjpiAQms=; b=PncRKLjkRnspZz
	4r6RO/NNjJnCOLSYA/vBhz1vfK0yGAo22/UdOahdRnID8WXu+7JvjSlvDoqNFADkyFNnDUn9I8JaY
	FMbS9JDpQJEmKqWEbHI8xvxgIhFIn974UqjdL1ZgF0YzIIbLTfqXzqo00I6p28edgqhh8HvDknPOo
	V0dvtLKy4CN7ODYgVpDbJg5siaq9qFgDAWREXTbcQs9AEYeWKXLr6Kng1ON8X/h7hiDsq0QwYaarK
	TDlHEmAqp6yEQTOBMgi+SUBueh7vaW3diduSlAD9iVGQg2tNhaNvbNsr+7Pv9qGh+Ga3/SWLHYXVe
	rtoPfhqjadS/mfWw2cOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEfrv-006y7a-0w;
	Sun, 17 Dec 2023 01:22:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEfrs-006y6p-38
	for linux-mtd@lists.infradead.org;
	Sun, 17 Dec 2023 01:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDF9260B4C;
	Sun, 17 Dec 2023 01:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B2BC433CA;
	Sun, 17 Dec 2023 01:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702776175;
	bh=FpOC4bwyd89s4G39nq7CQqxq/3M8hUupFE+Z+PJBTfs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LaBty1lRMQV2vNS915TYttaXZ2DeWEKZebRhiP1V6eNzJrgGlHT5kEVwVcEpvY5hG
	 hIkbV2EoKQTNb5GmEPV5vsP96c1QSOqxzZ/XH9sDkMfot4ksOBOD8QDpHemn/S6E9B
	 1P/aibZcFeT5wsj2+RoAKpNzo1ECl0o86E5AqSmnIoBXf7ccTh51ePLkOoBmVlr9v3
	 UAfF0+27xR1kJiMkk6ukOqz23FL5/CWz8aynWR/qqRDqgcYZKRjbAH7ll+r21pAOTW
	 Ch/OCeoR/AkNjQQVEBm0uubz6A4m6PZKQOIe0ELTS/VbIQ51ajlP907TiWSZ8VD0O5
	 MI/YCJlGgOwxg==
Received: (nullmailer pid 3635222 invoked by uid 1000);
	Sun, 17 Dec 2023 01:22:50 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <de0bd3647ed2560074aa3528716c203b8939fe1d.1702770711.git.daniel@makrotopia.org>
References: <cover.1702770711.git.daniel@makrotopia.org>
 <de0bd3647ed2560074aa3528716c203b8939fe1d.1702770711.git.daniel@makrotopia.org>
Message-Id: <170277617078.3635202.15310156602338483620.robh@kernel.org>
Subject: Re: [PATCH v5 2/7] dt-bindings: mtd: ubi-volume: allow UBI volumes
 to provide NVMEM
Date: Sat, 16 Dec 2023 19:22:50 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_172257_055219_ECFBD46E 
X-CRM114-Status: GOOD (  11.11  )
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


On Sun, 17 Dec 2023 00:09:41 +0000, Daniel Golle wrote:
> UBI volumes may be used to contain NVMEM bits, typically device MAC
> addresses or wireless radio calibration data.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mtd/partitions/linux,ubi.yaml  | 10 ++++++++++
>  .../devicetree/bindings/mtd/partitions/ubi-volume.yaml |  5 +++++
>  2 files changed, 15 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:34:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:37:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/de0bd3647ed2560074aa3528716c203b8939fe1d.1702770711.git.daniel@makrotopia.org

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
