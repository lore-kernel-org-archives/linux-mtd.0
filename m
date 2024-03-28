Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8329CD11DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 20:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92JdrXu8gB4b2183zbUAAIdfO8vFGgzjNjnNfnY3EN4=; b=LAnPPDKva43Leg
	CeoA3gRmqusPF+BAmfT4jcsQwiKsZp/E9zYdgkOCrAe5y0urwW0XGjVPSrl4MKS1Ael2OAeFTJE/a
	HJsM+ZWPoAHGCLYtr/XorfssxPR+PFkS3f0UpPDpyUBZxBnDvE7Lr2MSYLUdKHiBHvTFsXqjg5JEQ
	wAzjh4M4+1m9q9z/55YKFjC119sn1gHKDnybpR1u418CwZoIVllikfHJvRt30WfxuCXA2jw/PM44W
	+t29mbrFes0hcZ+M6UkChz6Ia1FbPSvre64KUT8jgD0niix4XOZ8j/zFpK4tTABbzRaee4J9nXokt
	ymDEogTVpKlT4+kPKaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpwV0-0000000FcDY-0OuW;
	Thu, 28 Mar 2024 20:37:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpwUw-0000000FcD5-0mP3
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 20:37:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 764C0CE2CDB;
	Thu, 28 Mar 2024 20:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2B2C433C7;
	Thu, 28 Mar 2024 20:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711658235;
	bh=o3TMU6J+1La8rLs2zcigdVj1AgPp6xVFZzSdMIJZ+dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M91K4TnGiHgnYf7fli2rIaNCPFSkgB6FKdjUAO5LIu+nLxhre2FmA5y0q+G5YL4e6
	 MiTAjHYTr1oxozM2m47RyyTZJ/LT5eG4uPj2MAyGRBedG6rcsR5Tax0POrIqgAoMyU
	 LKosAXuzI2Uy4snnO31W2VpbtqGm1tCav8w8LVxJNoRhfxmAtOS1HfewJiBVSdspFY
	 EC3ZzPqtPr9KcLWvpsmo5rzrdvQonI72X/tvdCOqtD8Sh92lPUEqy+SU2V6MiK52AD
	 +eMkSrIuaBew8BqY8qbXt9b8o7KxmCl99ESbA45vXyLDpOJr9RApK8z2FR4V2aPbqu
	 GVrhTPC293Q1A==
Date: Thu, 28 Mar 2024 15:37:13 -0500
From: Rob Herring <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Michael Walle <mwalle@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
	Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH v10 2/2] dt-bindings: mtd: fixed-partition: Add binman
 compatibles
Message-ID: <171165823084.305347.5584935515178377776.robh@kernel.org>
References: <20240326200645.1182803-1-sjg@chromium.org>
 <20240326200645.1182803-2-sjg@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240326200645.1182803-2-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_133718_499967_B58780D5 
X-CRM114-Status: GOOD (  18.08  )
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


On Tue, 26 Mar 2024 14:06:45 -0600, Simon Glass wrote:
> Add two compatibles for binman entries, as a starting point for the
> schema.
> 
> Note that, after discussion on v2, we decided to keep the existing
> meaning of label so as not to require changes to existing userspace
> software when moving to use binman nodes to specify the firmware
> layout.
> 
> Note also that, after discussion on v6, we decided to use the same
> 'fixed-partition' schema for the binman features, so this version
> adds a new 'binman.yaml' file providing the new compatibles to the
> existing partition.yaml binding.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v10:
> - Drop binman,entry since it is likely not necessary
> - Put the description back
> 
> Changes in v8:
> - Switch the patch ordering so the partition change comes first
> 
> Changes in v7:
> - Adjust MAINTAINERS entry
> - Put compatible strings into the 'fixed-partition' binding
> 
> Changes in v5:
> - Add mention of why 'binman' is the vendor
> - Drop  'select: false'
> - Tidy up the compatible setings
> - Use 'tfa-bl31' instead of 'atf-bl31'
> 
> Changes in v4:
> - Correct selection of multiple compatible strings
> 
> Changes in v3:
> - Drop fixed-partitions from the example
> - Use compatible instead of label
> 
> Changes in v2:
> - Use plain partition@xxx for the node name
> 
>  .../bindings/mtd/partitions/binman.yaml       | 53 +++++++++++++++++++
>  .../bindings/mtd/partitions/partition.yaml    | 21 ++++++++
>  MAINTAINERS                                   |  5 ++
>  3 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
