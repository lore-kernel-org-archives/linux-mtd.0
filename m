Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D135C54E68
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2024 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+cURw0kEZiZcaN1pLVDISDlg8xGI6yanoWTGxZRMHU=; b=zyCMehfSW2mglt
	f3Rk3KpPsW9q6rt9hlfzrb6mxlSP0c0v4jm/RKxGbCp8gNkrHveBoAV8i43AyJtvG1HG9yShNuq2t
	KRtTVyWd6y4E+kRA3IVmTCkHVAcVolziOb9lGux2f2faVp+61KwyOxUAUNt7AeBYpy1J52q+XVFu0
	NQvdE8qyipGb3oCW+ZpvurxPaWE6HsIUoJXow2IZKInK/XjBCUv4zNBril3nlcpRDi7DiN+TzZw4g
	cklJFdSxXyYlYbav4trCUz8goAlbu74qoZB6ZbPQi9jOBUHR+dbbgh7HfvDIh50qsAEf7SrWc4J4D
	SEBq/nQZNEXClb2z6+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnIdW-000000038xI-0J3l;
	Thu, 21 Mar 2024 13:39:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnIdS-000000038w6-30m7
	for linux-mtd@lists.infradead.org;
	Thu, 21 Mar 2024 13:39:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AF530CE0E42;
	Thu, 21 Mar 2024 13:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45B4C433F1;
	Thu, 21 Mar 2024 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711028347;
	bh=CyqSIKd95/3uoReHNnW1elb9HosCTRAVT1Iw5QyGoYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kcx9GsdhjQvQQpYLWFnvdZLS+2ZKFWR6qmN9cHugEVPhYHa3TH1bw9xOWhbQMmnFG
	 RqF+a08SQ/ecPsw08+s4HtSPqF9f7aS5wpynb3GlpMvUM9qhMwRVLZwLSS7y/Lt+eN
	 vZRkHyZ3OjfHODobgA2AfG5SYrv/a2upSZH6I3Hg+Ig8p5FCfol9HVQgiGnOuDnkkE
	 Gk6DJcTIokLICiR2NJfixRatOMZQ1+x7emzlgjVwprfE/HPP9peRzYdJdt1F/T8agr
	 +3W/AL1REGEO2KflIeMTQoJKD/RO7A/TTnDg9I/KcMIuNTIVWblkh4Fvg+6e5AbXmH
	 nCwr/jeQgH/5Q==
Date: Thu, 21 Mar 2024 08:39:05 -0500
From: Rob Herring <robh@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: mtd: fixed-partitions: Add alignment
 properties
Message-ID: <20240321133905.GA1622174-robh@kernel.org>
References: <20240320052449.175786-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240320052449.175786-1-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_063910_991669_54A5F8B2 
X-CRM114-Status: GOOD (  20.00  )
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

On Wed, Mar 20, 2024 at 06:24:48PM +1300, Simon Glass wrote:
> Add three properties for controlling alignment of partitions, aka
> 'entries' in fixed-partition.
> 
> For now there is no explicit mention of hierarchy, so a 'section' is
> just the 'fixed-partitions' node.
> 
> These new properties are inputs to the Binman packaging process, but are
> also needed if the firmware is repacked, to ensure that alignment
> constraints are not violated. Therefore they are provided as part of
> the schema.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v9:
> - Move binding example to next batch to avoid build error
> 
> Changes in v7:
> - Drop patch 'Add binman compatible'
> - Put the alignment properties into the fixed-partition binding
> 
> Changes in v6:
> - Correct schema-validation errors missed due to older dt-schema
>   (enum fix and reg addition)
> 
> Changes in v5:
> - Add value ranges
> - Consistently mention alignment must be power-of-2
> - Mention that alignment refers to bytes
> 
> Changes in v2:
> - Fix 'a' typo in commit message
> 
>  .../bindings/mtd/partitions/partition.yaml    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
> index 1ebe9e2347ea..39c7d7672783 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
> @@ -57,6 +57,57 @@ properties:
>        user space from
>      type: boolean
>  
> +  align:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1

Shouldn't this and the others be 2?

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
