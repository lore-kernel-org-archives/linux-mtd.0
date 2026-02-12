Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49233EDF04F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Feb 2026 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aNv8fjfO8UrOzcstNIQbXHiiCqJIiMcDwQ0jp1MlYCs=; b=UKsDOe2p45V5wS
	TVh4CUZUPIa2KDEutV3RSY+Y+CGry6U1kh+VaG5Kfj/PtdVvUqtvMQIA76O1gUgl4dMSoV8YnWpUs
	Q23KaPMJ5sfNfumT2zv7EMd3GbfX2MMAEYG0qYcT0nNHeTfTQXdHQDy65NT2VNBKuXBRjf3/2drvg
	BlIW7/QERiOoPxlirxGoOl5NdCbyiRmxUGeWa2vYOirU+J3/olPTpp/WbQBnuIN6D117Gx3lJgEUb
	XXGWHIqJxjJqKr/gIxVzJNXRl1n0mE6QX2lczixhvTmwqdbblz8togkwwQ3VnpgpGQ14CDJhEEpBm
	nYdZfSnF01zHOKuVj1LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRD8-00000001icH-0AQf;
	Thu, 12 Feb 2026 07:34:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRD5-00000001iby-3opT
	for linux-mtd@lists.infradead.org;
	Thu, 12 Feb 2026 07:34:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1168A43BEC;
	Thu, 12 Feb 2026 07:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62747C4CEF7;
	Thu, 12 Feb 2026 07:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770881638;
	bh=RjZLQwqHGUM3fe6f8/YcpBJlzL94xf9Sua0ZtzxuMRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6Veu8Xgpcigo7tkvuLV1NZppBh/7mOViq82pStgY/f1BARcv/o5rLl6rZShnl+m8
	 5DkxZGlWfUrLUrUssmMmXfaKCtjIjNd1qPvmPxCUDCohgoRcEezFsk1tiTR8NgVaBA
	 RoFlGtcvE4ccg5Qy0Kp58PLeD8TZ8BVAt0gsTE3yqPsRaOivE/p0t5FKtFGWE+7YuQ
	 lI9mw6AtLbXzCVyNZ+zX9PuPyKIfRiVbL4pPlq/+Z4k7eSWSHSLqNzP4dQGg61/QzR
	 umkfaAccgGQidB6X8tDaosWBF+z4Rv1FqvVOm9KsRWrdW84k1FJUWzSP4IC5mh/AcD
	 /MZr2tDMOYcPw==
Date: Thu, 12 Feb 2026 08:33:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Pablo Martin-Gomez <pmartin-gomez@freebox.fr>, 
	Tianling Shen <cnsztl@gmail.com>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: spinand: Add randomizer
 enable/disable properties
Message-ID: <20260212-white-numbat-of-variation-cde4ae@quoll>
References: <20260211100553.907585-1-linchengming884@gmail.com>
 <20260211100553.907585-2-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260211100553.907585-2-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_233359_989034_8330A726 
X-CRM114-Status: UNSURE (   8.68  )
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

On Wed, Feb 11, 2026 at 06:05:51PM +0800, Cheng Ming Lin wrote:
> diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> index 609d4a4ddd80..2fcbc4b73e95 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> @@ -67,6 +67,14 @@ properties:
>        the secure regions present.
>      $ref: /schemas/types.yaml#/definitions/uint64-matrix
>  
> +  nand-randomizer-enable:
> +    description: Enable the randomizer feature.
> +    type: boolean
> +
> +  nand-randomizer-disable:
> +    description: Disable the randomizer feature.
> +    type: boolean

Read again feedback from Miquel - two EXCLUSIVE properties. You miss
"not" with "required":
https://lore.kernel.org/all/20230118163208.GA117919-robh@kernel.org/

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
