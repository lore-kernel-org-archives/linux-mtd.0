Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27A3CDE009
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BC3Xe2jGpeGE4cWWNlwHGaV6pjFVKpuj+RRdIrB5Lts=; b=elQjertdEGqJwS
	2AXDdTEcrGat8/df3LZ5sZVK6d4ykt7FHSiCfB6LZNwz2ChNRxGRltbubcZPqFTr4HJheWywjauzU
	j2ePz8UhV2khLiEt/Gto9JZaPX9EuZ8yB/FfhoOGYDc2Y9d3zpgfd2cqOhdiB2B2yz7yU84FpfN1I
	/woEwSOA9SirOWTGvOBVVfFA+iCpHgn7jLF1fEuXxte8Z+N2RGcXkc+Zdh6P1oLJFg4kiIK5yuwPV
	XnTKDWa+Q7/Qaq7uDIt/UsxfDlTt7fANgfXZbKDcHV/0GO2DT0jqCxGSR0DivbBX2SKE3nSmeJqgV
	wIBvhSTfSGKHnAGZV+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stp6g-00000008XK3-1ztn;
	Thu, 26 Sep 2024 14:04:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stp61-00000008XDt-1FDM
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 14:03:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 68022A451B4;
	Thu, 26 Sep 2024 14:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085A0C4CEC5;
	Thu, 26 Sep 2024 14:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727359432;
	bh=jtCshB+kbsn9FzIzIwY86oEMwzDjCbBE1nTqG/gsx9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ue6+eDGlWGKfphSJdEdkbSB0MTnPYtfZ6oX/1NUUtZTB3BncchmRwnjY/aSG9Xqgu
	 vJh7HohBkSAlYbMWvh7cngB2t1BpoMg6fZuNz6zJyeIKHZo6cmQvx67b5SY0+9+Zct
	 2KMSEM0mPDm4K2G27car0LT3NUfn5eXeUEVFzNmF4uKv5o4Pw7H0+bXI2/5q2Gdybp
	 LIv6yuWL2nKqUQyIeAVm0Tc/lMyPpi3RrODjUEA+5AwK/we7lrOZoYy8SM5eDALJJv
	 0vh6dNdKCbD4rjzo6WwTCu4hS6IvmJ9U2UHoyoyISHi6V0n0OZjH8CojCmP/wFW2EO
	 D5Cnl6bdEuVng==
Date: Thu, 26 Sep 2024 09:03:51 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Simon Glass <sjg@chromium.org>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Li Lingfeng <lilingfeng3@huawei.com>,
	Christian Heusel <christian@heusel.eu>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [RFC PATCH v2 4/5] dt-bindings: block: Generalize and introduce
 property for partitions
Message-ID: <20240926140351.GA2596132-robh@kernel.org>
References: <20240925214544.6114-1-ansuelsmth@gmail.com>
 <20240925214544.6114-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240925214544.6114-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_070353_492624_183F218C 
X-CRM114-Status: GOOD (  25.73  )
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

On Wed, Sep 25, 2024 at 11:45:24PM +0200, Christian Marangi wrote:
> Generalize property from MTD partitions schema and introduce property for
> block partitions defined in OF.
> 
> Partition schema for block devices is a reduced schema of the MTD as
> only a few property are supported for it. (reg, label and read-only)
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/block/partitions/partition.yaml  | 33 +++++++++++++++++++
>  .../bindings/block/partitions/partitions.yaml | 27 +++++++++++++++
>  .../bindings/mtd/partitions/partition.yaml    | 10 ++----
>  3 files changed, 62 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/block/partitions/partition.yaml
>  create mode 100644 Documentation/devicetree/bindings/block/partitions/partitions.yaml

Partitions are partitions. We don't need them defined in both mtd and 
block. Could perhaps move them to bindings/partitions/, but that's not 
really worth it in my opinion. Just use and add to what's in mtd.

> 
> diff --git a/Documentation/devicetree/bindings/block/partitions/partition.yaml b/Documentation/devicetree/bindings/block/partitions/partition.yaml
> new file mode 100644
> index 000000000000..b9b1d8139e56
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/block/partitions/partition.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/block/partitions/partition.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Partition
> +
> +description: |

Don't need '|' if no formatting.

> +  This binding describes a single flash partition. Each partition must have its
> +  relative offset and size specified. Depending on partition function extra
> +  properties can be used.
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +properties:
> +  reg:
> +    description: partition's offset and size within the flash (in sector
> +      block, 512byte)
> +    maxItems: 1
> +
> +  label:
> +    description: The label / name for this partition.
> +
> +  read-only:
> +    description: This parameter, if present, is a hint that this partition
> +      should only be mounted read-only. This is usually used for flash
> +      partitions containing early-boot firmware images or data which should
> +      not be clobbered.
> +    type: boolean
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/block/partitions/partitions.yaml b/Documentation/devicetree/bindings/block/partitions/partitions.yaml
> new file mode 100644
> index 000000000000..9c161aac364d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/block/partitions/partitions.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/block/partitions/partitions.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Partitions
> +
> +description: |
> +  This binding is generic and describes the content of the partitions container
> +  node.
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +properties:
> +  '#address-cells':
> +    enum: [1, 2]
> +
> +  '#size-cells':
> +    enum: [1, 2]


Like *all* other 'partitions' nodes, you need a compatible to say what 
kind of partitions you have. It's conceivable that some vendor invented 
their own scheme just like MTD devices.

As I said before, this is just 'fixed-partitions'. If some properties 
aren't supported, that's fine. All the 'align' properties are for 
flashing tools and aren't supported in Linux. 

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
