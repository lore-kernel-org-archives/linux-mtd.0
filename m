Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E566AC5AE59
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jun 2025 14:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzOwVxAvD7D9iulEupKxTvZo9L3dhirUMCqyZoJiCbQ=; b=T1OUhm0B0DM9Zm
	B6faRDCKcM/sXQrs3xNfwn2Zb56RPboGuGNQo8S0wxOwwO1H1UM2GGVuTEYnY8mHjfaIlGBfHgjlK
	SupYW41nZNwCF945kt2T+GLgX4nMeqc5t8hyFlXJ1VqO6wq2GPFvPYrNTpMetjpHTzstHj7oMLfX3
	vICHyBwZVvucIIDtEQmqZI8YBbaeTMJBmsLOzcSiisaajNoSaYfKHyUPmQekWAvb7ndEBoWDOdbNa
	RovBpy/SmYfamPKhgVEie3AbsOycdCsmSAu7lCG6ZbIO+SeyMzlH7OJDGmRQ08MalWjctVR4vYHXx
	9YZX/ejdZmxqq3hl1ciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBHF-0000000Fjh8-1eWy;
	Thu, 05 Jun 2025 14:09:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAwQ-0000000FhFH-0iFx
	for linux-mtd@lists.infradead.org;
	Thu, 05 Jun 2025 13:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC29249EA8;
	Thu,  5 Jun 2025 13:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8273CC4CEE7;
	Thu,  5 Jun 2025 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749131253;
	bh=E9UAI5/sHcwgTTNJ9bwD0qg+BJ3oUIA5vyBcIyxvHu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jmdri2IOjk0732jc3DNoUQJM1nSm0hqSQxNSfR7rTBu0IR80Ay9p7es5CDUc/rHIo
	 /jsyD999SdJ6cTBNSVNtugt6XJAYCSsN6UePi/DwO3KhYURdgfh9rmmv+SEcLVsaKp
	 LzZJFu9Q3enHClb52Mym9E2s9XFt4h0mtkep0UXbcj+0a0FqYgrob1C0C0aFbSCCVn
	 xHhSFFw4EQLTEwk3wLJ7cbnVUH5gcHsc7kjexXR0wTiOiqApf4HpluPasKqX2d0biZ
	 CiZse0KDGIT22zvfKGG02pv2SYoc87hMmIzk0M2HMHXnWUqeMysT2l8902Uw6X2S4l
	 /YukcNQY7FqFg==
Date: Thu, 5 Jun 2025 08:47:31 -0500
From: Rob Herring <robh@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v13 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
Message-ID: <20250605134731.GA2439158-robh@kernel.org>
References: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
 <20250603194209.1341374-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250603194209.1341374-2-amit.kumar-mahapatra@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_064734_249845_D4CA9FB5 
X-CRM114-Status: GOOD (  23.36  )
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

On Wed, Jun 04, 2025 at 01:12:07AM +0530, Amit Kumar Mahapatra wrote:
> The AMD QSPI controller supports an advanced connection modes called
> Stacked mode which allow the controller to treat two different flashes
> as one storage.
> 
> In Stacked connection mode flashes share the same SPI bus, but different CS
> line, controller driver asserts the CS of the flash to which it needs to
> communicate. Stacked mode is a software abstraction rather than a
> controller feature or capability. At any given time, the controller
> communicates with one of the two connected flash devices, as determined by
> the requested address and data length. If an operation starts on one flash
> and ends on the other, the mtd layer needs to split it into two separate
> operations and adjust the data length accordingly. For more information on
> the modes please feel free to go through the controller flash interface
> below [1].
> 
> To support stacked mode, the existing MTD concat driver has been extended
> to be more generic, enabling multiple sets of MTD partitions to be
> virtually concatenated, with each set forming a distinct logical MTD
> device.
> 
> A new Device Tree property is introduced to facilitate this, containing
> phandles of the partitions to be concatenated with the one where the
> property is defined. This approach supports multiple sets of concatenated
> partitions.
> 
> [1] https://docs.amd.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Device-Interface
> 
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  .../bindings/mtd/partitions/partition.yaml     | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
> index 80d0452a2a33..2ef4bde02cd9 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
> @@ -57,6 +57,13 @@ properties:
>        user space from
>      type: boolean
>  
> +  part-concat-next:
> +    description: List of phandles to MTD partitions that need be concatenated
> +      with the current partition.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 16

Add:

       items:
         maxItems: 1

Because phandle-array is really a matrix.

> +
>    align:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      minimum: 2
> @@ -138,4 +145,15 @@ examples:
>              reg = <0x200000 0x100000>;
>              align = <0x4000>;
>          };
> +
> +        part0: partition@400000 {
> +            part-concat-next = <&part1>;
> +            label = "part0_0";
> +            reg = <0x400000 0x100000>;
> +        };
> +
> +        part1: partition@800000 {
> +            label = "part0_1";
> +            reg = <0x800000 0x800000>;
> +        };
>      };
> -- 
> 2.34.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
