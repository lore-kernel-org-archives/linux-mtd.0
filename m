Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4F9C35FF4
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oHOAAAeMJOVAk4L2akSX+BUqmloJusazVNeQ7vZwJrg=; b=ieqxv31pidvzNSK9GCZxhu2joL
	N9q1q3G3IR9pBphnJj936vkfxBKqyBpQpDci1yKSUzLMdNDZKaIG8W5yCru9jt3tcpegRnFCjb6Yk
	a9P4jQUyGsfC8Iu4HttQq8yUuntLPx10YRab3u2XZYehFhhEiT3Yg3JTt/2V7mcdY9YE70f8tDFAM
	q/yFJaNLWkK3MPjgIGygSRKZW8NP7EcdqWrE13jMBo5Hqa9jKoyYgV70kqz72m3kBomZeeaLfAPWh
	O13yYU7lmlh5tOciB27E9ENHvA63iOWKbwAXAWPVDy9g7mYigUwzjG1kg1I27xpwFKbPU3zGpd9f2
	XK/PDGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tskbH-0000000Bfpd-23In;
	Thu, 13 Mar 2025 15:35:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsjaa-0000000BXXP-1y7F
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 14:31:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4F045A47525;
	Thu, 13 Mar 2025 14:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFB4C4CEDD;
	Thu, 13 Mar 2025 14:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741876270;
	bh=q7tcXhM/G+j/VE2KX9E2hy+pT9MDKbegYTC6EBQh5HM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=i/5mtUAaLkbWg/nIPtp5cJInyu+dncYZuqJPUOt9jcMookYcqt4XIZ6IupkOaDuHm
	 uLFMF6c4mBtyc5IAXD1F4vO0BBjIaKTk7c9o36jMBCa2H1Q0ZgJjtNYxtkQ2Mp2bJQ
	 gtQF5ysN0QNxgTZI2w5SeC886c7/LLH/qOtsHJKtnsC9I69Bp+KQYSm00/ngLcduB4
	 Qyt3kP20zJhSTir8Kj2uH96DEiJO8IV/u2apvPw4SMBF0ztztAWtIQ/VOt0gn+6Cf2
	 cn1TpIXuLRH+gi1JRC3OqzkArMfgqQNtH6easUrn+/p5MXvwkyYvHtUp4ZJA1XBVAf
	 yoFuBsIbwuXfg==
Date: Thu, 13 Mar 2025 09:31:09 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: vigneshr@ti.com, andersson@kernel.org, linux-mtd@lists.infradead.org, 
 miquel.raynal@bootlin.com, conor+dt@kernel.org, agross@kernel.org, 
 krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, richard@nod.at, 
 dmaengine@vger.kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, konradybcio@kernel.org, 
 manivannan.sadhasivam@linaro.org
To: Kaushal Kumar <quic_kaushalk@quicinc.com>
In-Reply-To: <20250313130918.4238-2-quic_kaushalk@quicinc.com>
References: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
 <20250313130918.4238-2-quic_kaushalk@quicinc.com>
Message-Id: <174187626948.2759710.10340632443652482523.robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: mtd: qcom,nandc: Document the SDX75
 NAND
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_073112_643139_ECE19738 
X-CRM114-Status: GOOD (  10.97  )
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


On Thu, 13 Mar 2025 18:39:13 +0530, Kaushal Kumar wrote:
> Document the QPIC NAND controller v2.1.1 being used in
> SDX75 SoC and it uses BAM DMA.
> 
> SDX75 NAND controller has DMA-coherent and iommu support
> so define them in the properties section, without which
> 'dtbs_check' reports the following error:
> 
>   nand-controller@1cc8000: Unevaluated properties are not
>   allowed ('dma-coherent', 'iommus' were unexpected)
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml   | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml: properties:compatible: 'anyOf' conditional failed, one must be fixed:
	'OneOf' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml: properties:compatible: Additional properties are not allowed ('OneOf' was unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250313130918.4238-2-quic_kaushalk@quicinc.com

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
