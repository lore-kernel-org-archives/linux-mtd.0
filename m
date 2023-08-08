Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A126C001DB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 19:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecY3DLPZe3UPhDHZt+JKGg2TndQzkEmKAB8nNVrAQww=; b=lo+AUxArcN5g8f
	5infP6Ivk9JlO8GiOTar3x2soIufS8gKLyQm+FAiUku/KW8XKLqTbvNRB2z1KG8svJZR1rDgFfNKE
	69CeQBhiS+MyxBOxDa8q5p2zWGgmsA3ex0Se9trueDE9YC6uOdUjnSkEGN/gHBeGtHgQVySfKTvD6
	IVo6TH9q9PtIPwkhE14TtwnRttZYUx0vP8SB7R+WHkrYYcrqYx7dvmryCko2gePuGqCypZAKY/rLG
	FQT49sDAevVJdf8MLw/CG+xoWYqgSYFFYEqKxp0+jssJz/XNB+qQHWb7B7Tx5kjBwABRMmAMphv2f
	otyBeW5KSzx7IoHCPs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTSQ7-003KMQ-2a;
	Tue, 08 Aug 2023 19:31:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTSQ4-003KLC-2E
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 19:31:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 200D962B44;
	Tue,  8 Aug 2023 19:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CF7C433C8;
	Tue,  8 Aug 2023 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691523062;
	bh=J7RrIowQ/RhLdZr79lNCXj2Xv8FU5WymsyiVAl5loJM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DmxbfSKUiCSyowjkmO3Qw37R4UyDsbZ7icgbNoPkhZPh+ldKpBVzJZ5hWqt5YNkL+
	 jxLxhwjmAyzN5I/Qn7V2jC5AYjLQ2STSeqYvTsXygafWyM/kR1wXCnvclZ4E4IYVOK
	 hBG2pSOEQrRUjZg/dZoE2TB4cwfFhQ8OY/ksD35ofITWbH6UtSNAJsVs3VLdrcz56D
	 DNqTuclzIOR5ILsIx+By9hmkVrLjKResPKJFA3AGEGMyosST1+LHQSOITOLNl+sQ19
	 lbb8/fN/hx5Jca20iOBJLw5eeN8Pp9x7DeJaGixeiYOcIwTSt+k3MR0nNHWBQI0YgG
	 N9ut5WPzV8H3g==
Received: (nullmailer pid 4099639 invoked by uid 1000);
	Tue, 08 Aug 2023 19:31:00 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <094e68da59bbd9efea1469b122f34f5dcf156f0f.1691510312.git.daniel@makrotopia.org>
References: <cover.1691510312.git.daniel@makrotopia.org>
 <094e68da59bbd9efea1469b122f34f5dcf156f0f.1691510312.git.daniel@makrotopia.org>
Message-Id: <169152306059.4099622.15085616978235620512.robh@kernel.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: mtd: add basic bindings for UBI
Date: Tue, 08 Aug 2023 13:31:00 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_123104_772721_91906715 
X-CRM114-Status: GOOD (  13.10  )
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


On Tue, 08 Aug 2023 17:03:19 +0100, Daniel Golle wrote:
> Add basic bindings for UBI devices and volumes.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/mtd/partitions/linux,ubi.yaml    | 65 +++++++++++++++++++
>  .../bindings/mtd/partitions/ubi-volume.yaml   | 35 ++++++++++
>  2 files changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:29:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:32:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/094e68da59bbd9efea1469b122f34f5dcf156f0f.1691510312.git.daniel@makrotopia.org

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
