Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6ECD35690
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 09:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RU3/UCjXJYWLFNjPi1VtO4Mxv3ofQhyZUkOuqQb7zeY=; b=vpz9OCxSb445S7RHwmbqslmv9o
	9rZiAbmi1PlLn4LszPWuWhg6Lmf8qbeQv4sDjklekfgi0Wsikhl+g6tefh7qCyYEmYD42SzYJLNM7
	gWGbQwDL/0y2npntngajzdgBNX2LurDmDpJUw/hutQT5usZfHy+/7MiSLqVMbLM3VVSIAqdis4Z23
	8kgARrsBJKfxbMcMvKU24Ta797q8IIsvOAKL8PQMwpcOGHd6WcYZwkDY355GdP6HNRN5Wy2Nyvoi/
	3Ka9yqH+B57+MXiM8KQtrmg/CBKXf8ctOvjl0VocwbSHCzcJ0da5L1cOca4nzn5GSr/V9uJj/TMGp
	xxSUGWSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1zK-0000000FlTx-1G55;
	Wed, 28 Jan 2026 09:37:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1zJ-0000000FlTQ-1NgD
	for linux-mtd@bombadil.infradead.org;
	Wed, 28 Jan 2026 09:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=PW4pkUCdf1qPYShW9GNPSaPOK4eq8XeP4l2rnH5x4M0=; b=XHXroYM2De6wiCC0IBPMfDdyj8
	EiuB4JKpw/+HVMH0x7JooHTjjPU4h8AXV0tuspzi7HQ5Ix2NKgk+WLCXUadLhjflkTl/SF+dNbfCS
	A+mmKaIm5dc7p5giX8Npxs7sDUb/1Eva7RS+kfg9YIZ3FKZcxCzI0GL2Jj1s89IkVSQlxDHYxM9zq
	ICcbyznXmnKfxsjBJwnhlmk61bN3vAc4KsEtBLJSedTN7ACkaD07G2iawP9dsYHtt66nrEPv1gb6D
	e0p7z8uL9rdl+WOukHfLL8xwMp8Az/UqkZvPnU0Aty7YFFPmeB9UbVwxawYVjyrxZSD/Ny0bUBCCh
	0QPPFC3A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1zE-00000008FAV-3rLd
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 09:37:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60F4841B72;
	Wed, 28 Jan 2026 09:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E797C4CEF1;
	Wed, 28 Jan 2026 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769593037;
	bh=BLeqdrA918b70I8RbA3CtdBP+GakpVCse5+C542muTY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kwCbn41Qm/PIgFyRsb0jLETLZNTNPGmHQIqVmV+HjWKJkHsE9nvRpa8J46LsIhW3q
	 2Rptk46YJBpxE06VFjD41kwHEYtnC5pUe/UGJp6FNDCikJ+87AfnjMp7ZNqGrVuM49
	 aXqgUTvEmMpcAESsM+MC1p98IkeDn3UAUENK6ZVPhlGb1xDGAVKjWt5g/4XNczJno4
	 ibZbxgCQnuxJO7fXp5pC0emlbIsRkeIfOs6r0I7uUeMlB7Fc5lYkgo6AZk9VdAAjwA
	 BdXB8cNnooCJVsy2Um0Ng3ueDri6/No2cNc13E2NSFvxdN0/y3eoH5tY4rRA9Omq01
	 8PKgGS6vxOqqQ==
Date: Wed, 28 Jan 2026 03:37:16 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, 
 Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org, 
 Mason Yang <masonccyang@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Conor Dooley <conor+dt@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <20260128-mxic-nand-v2-1-6f0cf94f2fd7@gmail.com>
References: <20260128-mxic-nand-v2-1-6f0cf94f2fd7@gmail.com>
Message-Id: <176959303628.238734.3843759154306421826.robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: mtd:
 mxic,multi-itfc-v009-nand-controller: convert to DT schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_093721_321558_17DB4966 
X-CRM114-Status: GOOD (  10.05  )
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


On Wed, 28 Jan 2026 07:58:00 +0000, Akhila YS wrote:
> Convert Macronix Raw NAND Controller Device Tree binding to DT Schema.
> 
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
> Changes in v2:
> - Add "Mason Yang" as maintainer.
> - Link to v1: https://lore.kernel.org/r/20260126-mxic-nand-v1-1-557df4a0dfa7@gmail.com
> ---
>  .../mtd/mxic,multi-itfc-v009-nand-controller.yaml  | 78 ++++++++++++++++++++++
>  .../devicetree/bindings/mtd/mxic-nand.txt          | 36 ----------
>  2 files changed, 78 insertions(+), 36 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml:11:5: [warning] too many spaces after hyphen (hyphens)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260128-mxic-nand-v2-1-6f0cf94f2fd7@gmail.com

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
