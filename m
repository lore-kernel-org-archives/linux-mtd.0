Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1671067024
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 14:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtBTdqLX3mlkMWAeDPiIGcwipgZFXJNH962yyUWCvrc=; b=XrqEa3GvVFVNRk
	55zusX9iIE8AiZV4PbzfjVTsSoRoB9uKZETzIoWNZbMxlzQmguUghcDpKp6vJw5yQTEfpxpo0sxJa
	or+tSHgiVxhoMPgD2nHHHy+//iLRhP3ydv6Ph836F3Rnuqxolg+ZIjTSVcpyQY092uwxi+L0aE7p1
	HIwfrmnKvm61Fd6wj7Xds9C3FQNj+76UMd2ADhJx2/XHVREkfq678dUiqPqB5sv7joPjxuYSODL5s
	59svSmtum15tFV2OWLcN0mLYbnkChrN4qTSdJcJO7KlCNBAl9mmdwxKo1tdrLQp3/trbkIrymri6a
	KXRSlm+eYIcgDH9/nJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gfl-0000000EAux-46VP;
	Thu, 12 Mar 2026 14:05:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0gfj-0000000EAub-2WKd
	for linux-mtd@lists.infradead.org;
	Thu, 12 Mar 2026 14:05:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D11844188F;
	Thu, 12 Mar 2026 14:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8731DC4CEF7;
	Thu, 12 Mar 2026 14:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773324354;
	bh=IArRqOvl5YRKO4SFXiZ1D1+PZmcVrzUPe6uk+Cy+be4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJ3lg5X6iYjALC7onyBhYymjiHEYoeJhB+IGPRQqcZM57mJY8WgqmjOTAJHlAu7KJ
	 eWZ3dxZl3sYTV8ZES7SVJ8u5v7a7A0DOecTCn1pdhNZBwdDIzhmyk8aIR6wa69xNrS
	 ezEkI8OCzAIaXk8HMs5hMUtFHxHRwsLg1mZvcEN3uCiG031o9DyShSfz4UudUto5+x
	 Ec/XfBOTpH7jtgtU//mRKOzB486JVs+ojK8tj4tDExYAAotnwzVVQk/9Na5wZmA4k5
	 W3qbe0dJ6p97VPhJF8l8qfzf6HJ0bAjGv0/Xarq+yhahJDalvxrDbAbKAgnm9RxpBx
	 yy6MjnX1YIt+Q==
Date: Thu, 12 Mar 2026 09:05:53 -0500
From: Rob Herring <robh@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>,
	Tianling Shen <cnsztl@gmail.com>,
	Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v8 1/3] dt-bindings: mtd: spinand: Add randomizer
 enable/disable properties
Message-ID: <20260312140553.GA2914438-robh@kernel.org>
References: <20260305071042.1193522-1-linchengming884@gmail.com>
 <20260305071042.1193522-2-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305071042.1193522-2-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_070555_712367_F6225975 
X-CRM114-Status: GOOD (  19.62  )
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

On Thu, Mar 05, 2026 at 03:10:40PM +0800, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Add "nand-randomizer-enable" and "nand-randomizer-disable" boolean
> properties.
> 
> These properties allow enabling or disabling the randomizer feature
> via the device tree.
> 
> According to JEDEC standard JESD22-A117E, no single data pattern
> represents a universal worst-case for all NAND flash failure mechanisms.
> Different patterns, such as fully programmed, checkerboard, or mostly
> erased, can disproportionately stress specific cells (e.g., programmed,
> erased, or those influenced by adjacent states).
> 
> Given that no fixed pattern can cover all scenarios, the use of a
> randomized data pattern is a practical and effective mitigation strategy.
> Our hardware implements a randomizer feature that scrambles user data
> before it is written to the flash and restores the original data upon read.
> 
> This ensures the data stored on the media is more evenly distributed,
> thus reducing pattern-dependent degradation. This is especially crucial
> for preventing errors caused by unbalanced data (e.g., all zeros or
> all ones) in blocks with high program/erase (P/E) cycle counts.
> Ultimately, the randomizer improves the long-term reliability and
> endurance of the flash device.
> 
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> ---
>  .../devicetree/bindings/mtd/nand-chip.yaml     | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> index 609d4a4ddd80..2559cd97ccc5 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> @@ -67,6 +67,24 @@ properties:
>        the secure regions present.
>      $ref: /schemas/types.yaml#/definitions/uint64-matrix
>  
> +  nand-randomizer-enable:
> +    description:
> +      Enable the randomizer feature. This property is mutually-exclusive
> +      with nand-randomizer-disable.
> +    type: boolean
> +
> +  nand-randomizer-disable:
> +    description:
> +      Disable the randomizer feature. This property is mutually-exclusive
> +      with nand-randomizer-enable.
> +    type: boolean
> +
> +dependencies:
> +  nand-randomizer-enable:
> +    not:
> +      required:
> +        - nand-randomizer-disable

Rather than define this in the schema, make the properties inheritly 
mutually-exclusive with a single property:

nand-randomizer = <0|1>;

That's assuming you need not present to mean a 3rd thing such as use the 
bootloader setting. If you only need enable/disable, then a 
single boolean property works.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
