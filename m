Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEFBC46CD3
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Dec 2023 01:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vTfpBFEpTxXIQLPAoc1D8/pEtHSscD6/nDhgMs4sN7g=; b=lGZ0JTSFNIs2Dd
	uecWT/LXDU9t9ar8BnnAdvQeoejQXV9i7wskLYsdb4KXdi+NEUrwr8121eTWDD9r+leuwpqUlC8/x
	pdeiRr4bd2Ec/x644nJusxCUuJ8aB9rlRRFDbSGSthC75glpKvTimpeoWqdVwr3T7UDFfMzR1aNkw
	VG5ME2rD5VmvTcke7P2ujaWnCb8qgQV9ZFwtjdJj/mXrnPjJDL6r35lq5ULFzU+vYGIB/UvWSXKnh
	qj83KumMFraIZfYWvmUM9fs1BPXwo1UfAzRL411zAMkz2CyuDM/LfYnYTpShubsfVpnSJcIkmwBSa
	4UvRaJKlEY751anNoKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEfrv-006y7k-2f;
	Sun, 17 Dec 2023 01:22:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEfrs-006y6o-31
	for linux-mtd@lists.infradead.org;
	Sun, 17 Dec 2023 01:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 26578B8074E;
	Sun, 17 Dec 2023 01:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F09C433C7;
	Sun, 17 Dec 2023 01:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702776173;
	bh=x82aK+1Jdjbd8v4bEai4Qz9MoFSVQ3P7VWc3+Wr/b48=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MvS92Ok4nGTYn323Wjj1TkzHiSXxTtSLsLp3mTTkE/P5gp6fAE8y0fkCaOuEQ8bLK
	 nZY84vVkC9JLeT1yKDu89Lo4jh2d2vrV85wPqQoPVzOovOPVQW9fAAwe7RSsSxGpQF
	 MQKktDK1WpmVKjhWC3OFGftY82IejMnoggHpShp4kRZSEvbs3FeXK2lFsPbz6AvEWf
	 8MDpG7t/H3sDrqhqJPPeQ5rSwdHEJdyyOUerk6o9cM0cISGIVET3QOMzF7HwtdfR2+
	 yDubgTq2ykQWlQuA09hqpEBcGEECtXg8oGrP1RliAJPXgRJju1oJq92XdoydP6P2gM
	 FsFzyqAKWX4lQ==
Received: (nullmailer pid 3635219 invoked by uid 1000);
	Sun, 17 Dec 2023 01:22:50 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <a9c12b8cc183b103af421a4a350ae6ef1ec173c8.1702770711.git.daniel@makrotopia.org>
References: <cover.1702770711.git.daniel@makrotopia.org>
 <a9c12b8cc183b103af421a4a350ae6ef1ec173c8.1702770711.git.daniel@makrotopia.org>
Message-Id: <170277617017.3635158.15840964425194306798.robh@kernel.org>
Subject: Re: [PATCH v5 1/7] dt-bindings: mtd: add basic bindings for UBI
Date: Sat, 16 Dec 2023 19:22:50 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_172257_133534_5749C7FE 
X-CRM114-Status: GOOD (  10.73  )
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


On Sun, 17 Dec 2023 00:09:30 +0000, Daniel Golle wrote:
> Add basic bindings for UBI devices and volumes.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
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
./Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:18:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:23:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:29:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:32:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/a9c12b8cc183b103af421a4a350ae6ef1ec173c8.1702770711.git.daniel@makrotopia.org

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
