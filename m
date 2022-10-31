Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FC1FA3741
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 19:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zp2ZhHRfN9hErr+rMyfNNEBpuQE+yvemQkLfeeDMR7I=; b=Cdf/NXMwh5Y74V
	t5ykMeuxCHhU3ZapRLbU8fTtP/MMflTSs62LvlwXieXw6a+UQAlCVGuhhr5CPK65IekHK2TG5kHVN
	Ya++Mdh6gGHnhoijKljzJDu8W4v67VsQ9OlFw9so5J7Gbo7rhVcPBOKgDg47ff9iSSMdxwkU4g11S
	DH4g0rZnXSTzmZhc3lDoxTMNz/sg4cJ/BSIApVJU25tr9TNSIU8x3eNIv8X+/4Ytq3TMU/B4fBUsS
	0Gsj3YFuEZ0WVmfXVhLW2xdckuJlYeSHjK0Jn96iiHAA9ZMbW5WR9nVugqrHRUxq9Uhgj06VBB2LI
	y97XZqZ8uTOHWH6D5vDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opah4-00ENjV-9F; Mon, 31 Oct 2022 19:43:34 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opah1-00ENia-St; Mon, 31 Oct 2022 19:43:33 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46-20020a9d0631000000b00666823da25fso7362794otn.0;
        Mon, 31 Oct 2022 12:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uIj8F7o3xWdPkZPlyBxdDMdHvNd/oWAtYl8AntcMkY=;
        b=1J041unxmxQ4DUk767GKHmcImbRrhcMumtWjc4eaUj14lpfAXcZKrf2Ex7/9ZzTbjF
         jUncAqxuYgrbxq4aJe5YhA3yT1xYFheWnk5cffOttB+3BjCT/ZhGzl4kNfwjdUihiWB+
         OeHdwLZGwcAm35LwPDe37BHvKiUIANN3kZsqeiZSAGLsVWAl6h2bnv8Aa30bh5ipXL3n
         onc0D7v0MisVAM4Sgg/O7LwuXQUrKyeyjblJohjJY59reRJbKtcQokG7yQf6O03d4Zi3
         5CJkbdSC0PvjV4SPMbGcdxATiP4hQO4shwYw27p1kXqHWNhQgOulP+E+pM1fgvF6v0DZ
         OS4w==
X-Gm-Message-State: ACrzQf1+B3/wX7axMHZl4WH7LNRYvI4aIb97IrDKIQI0lkEW6FXZA9Y/
	VXxkCN3m9Ia9qwzxiUzLtw==
X-Google-Smtp-Source: AMsMyM5g7KTSYGxrZRcKyiAux4UsYqX+I25nfP9WEslETBfWyT/AE2QXqBuAEAt4tQmd0TLlfMb3Gw==
X-Received: by 2002:a9d:4109:0:b0:66c:5346:4505 with SMTP id o9-20020a9d4109000000b0066c53464505mr3136867ote.224.1667245409784;
        Mon, 31 Oct 2022 12:43:29 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p22-20020a4a8156000000b0049052c66126sm2711866oog.2.2022.10.31.12.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 12:43:29 -0700 (PDT)
Received: (nullmailer pid 3304763 invoked by uid 1000);
	Mon, 31 Oct 2022 19:43:30 -0000
Date: Mon, 31 Oct 2022 14:43:30 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 01/12] dt-bindings: mtd: Clarify all partition subnodes
Message-ID: <20221031194330.GA3299482-robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_124331_951582_75FC1AF2 
X-CRM114-Status: GOOD (  18.41  )
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

On Sat, Oct 29, 2022 at 01:59:22AM +0200, Miquel Raynal wrote:
> Over time the various ways to define MTD partitions has evolved. Most of
> the controllers support several different bindings. Let's define all
> possible choices in one file and mark the legacy ones deprecated. This
> way, we can just reference this file and avoid dupplicating these
> definitions.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/mtd.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
> index 25b91f25fcf4..9fcaa61b046c 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
> @@ -21,7 +21,25 @@ properties:
>        based name) in order to ease flash device identification and/or
>        describe what they are used for.
>  
> +  partitions:
> +    type: object

Also, this node needs 'additionalProperties: false'. Unless there cases 
of custom properties here. If so, then it gets more complicated and 
we'll need a partitions.yaml schema instead so we can do:

$ref: partitions.yaml
properties:
  my-extra-custom-property: true

unevaluatedProperties: false

(Multiple node levels doesn't work for that as child nodes from 2 
different schemas can't 'see' each other.)

> +    properties:
> +      '#address-cells': true
> +      '#size-cells': true
> +
> +    patternProperties:
> +      "partition@[0-9a-f]+":
> +        $ref: partitions/partition.yaml
> +
>  patternProperties:
> +  "@[0-9a-f]+$":
> +    $ref: partitions/partition.yaml
> +    deprecated: true
> +
> +  "^partition@[0-9a-f]+":
> +    $ref: partitions/partition.yaml
> +    deprecated: true
> +
>    "^otp(-[0-9]+)?$":
>      type: object
>      $ref: ../nvmem/nvmem.yaml#
> -- 
> 2.34.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
