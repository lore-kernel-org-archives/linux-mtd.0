Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D29BEB64DC
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jun 2023 17:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOamQ7vPWKZi3FxjQay9puQFDraOaG3nmkrjtnEftCM=; b=iQ+7Tk87jMBc0N
	7b0h7jDOHGE4yu1mTfYW7+cfJGzj4k50IGHjMQ8HG9SH/VbswnEgMWky7A7RmSl4pikJ9LqKfxmEn
	c/LE2vaJVV6SeDvdVXsRXR7fNt7AA7weZbP0yfgZ86dADkIvTUV4/wkeCJT0heQsFRlkiH+At8dP0
	Pt01WIiilJIJc6/g82daYk4wBLHC/Q550eJGQsHRGTVU2e13ZqAYcW8CefWA01gK66wTKYm0nYpou
	tGMgiEZanlkWo7iNhvPgHn55LO39oAM+gFnWp8ENWOcEAScBHv97wH9MvFRPByH+pKqrqSkn10AhN
	cf7qTzOVBlPklAQ/ci5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBf6P-00Bvbn-32;
	Tue, 20 Jun 2023 17:25:13 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBf6M-00BvaB-1s
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jun 2023 17:25:12 +0000
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3422161e53bso10544685ab.1
        for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2023 10:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281908; x=1689873908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZJ+hfBpoF28qpVP1tAqIlMpScd7lp8C36ke23sPJp8=;
        b=KQCJYL8AcgDpeC5DxhagjUt2Nc88mFY24qb+me/ufOhKnOfNefEoSvf+NX/qtll5tC
         VhvrBmfJ9ro9zj0N9vrx+1UlF1vyuwsWcKZHA+9irur2oh+eRSU7TN3eiHFwdanJX4cV
         yCd1yEmxpIg59mq7xp5V1/g8fw+673pCuu/xZIBmPmhX6Dk5ZO9WXeJ99H9Pwu1U15Y1
         TbBpqMWjn3JRs2PCKjHiPt2NbO+xJFBgaR9ZS3KDB98c2RGXeR10DzHG2TYG9ma6Yn8u
         eIpG8tOI0nyqc/p7zwyGDap8n1sSPEufzhra4GYeO2bjZRUu1O3uWl/4LgznkaVxLhmD
         CMOA==
X-Gm-Message-State: AC+VfDwmvgV4yXO8c3xCPT1F/GMmq6fg1dII7bOxidpGNQ4TJ4N7x6I6
	hL2RuifSGY2LlJnnqckMUQ==
X-Google-Smtp-Source: ACHHUZ4H/q0T8pya673w/shwpYZ9QN8Qh4OiR7wXve8GAzm2Vls6m0Ux1AK9FTWt+Wu0v+SRZI3bgg==
X-Received: by 2002:a92:d3cb:0:b0:342:2b27:725c with SMTP id c11-20020a92d3cb000000b003422b27725cmr7398168ilh.6.1687281908194;
        Tue, 20 Jun 2023 10:25:08 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id z12-20020a92cecc000000b003428aca64bdsm723883ilq.84.2023.06.20.10.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 10:25:07 -0700 (PDT)
Received: (nullmailer pid 3856420 invoked by uid 1000);
	Tue, 20 Jun 2023 17:25:05 -0000
Date: Tue, 20 Jun 2023 11:25:05 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, robh+dt@kernel.org, richard@nod.at, linux-mtd@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vadym Kochan <vadym.kochan@plvision.eu>
Subject: Re: [PATCH v10 1/1] dt-bindings: mtd: marvell-nand: Convert to YAML
 DT scheme
Message-ID: <168728190550.3856357.9055862614036194300.robh@kernel.org>
References: <20230619040742.1108172-1-chris.packham@alliedtelesis.co.nz>
 <20230619040742.1108172-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230619040742.1108172-2-chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_102510_615867_AD666A98 
X-CRM114-Status: GOOD (  24.31  )
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


On Mon, 19 Jun 2023 16:07:42 +1200, Chris Packham wrote:
> From: Vadym Kochan <vadym.kochan@plvision.eu>
> 
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> There was also an incorrect reference to dma-names being "rxtx" where
> the driver and existing device trees actually use dma-names = "data" so
> this is corrected in the conversion.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v10:
>     - Formatting for description
>     - Restrict clocks to 1 item for non-8K devices
>     - Don't allow "marvell,armada-8k-nand-controller" without
>       "marvell,armada370-nand-controller" (undoes a change from v8)
> 
>     Changes in v9:
>     - depend on series from Miquel
>       https://lore.kernel.org/linux-mtd/20230606175246.190465-1-miquel.raynal@bootlin.com/
>     - enforce minimum/maximum for nand-rb
>     - move required: block for controller
>     - move unevaluatedProperties: for nand chip
>     - remove label, partitions and nand-on-flash-bbt which are covered by
>       generic schema
> 
>     Changes in v8:
>     - Mark deprecated compatible values as such
>     - Allow "marvell,armada-8k-nand-controller" without
>       "marvell,armada370-nand-controller"
>     - Make dma-names usage reflect reality
>     - Update commit message
> 
>     Changes in v7:
>     - Restore "label" and "partitions" properties (should be picked up via
>       nand-controller.yaml but aren't)
>     - Add/restore nand-on-flash-bbt and nand-ecc-mode which aren't covered
>       by nand-controller.yaml.
>     - Use "unevalautedProperties: false"
>     - Corrections for clock-names, dma-names, nand-rb and nand-ecc-strength
>     - Add pxa3xx-nand-controller example
> 
>     Changes in v6:
>     - remove properties covered by nand-controller.yaml
>     - add example using armada-8k compatible
> 
>     earlier changes:
> 
>     v5:
>        1) Get back "label" and "partitions" properties but without
>           ref to the "partition.yaml" which was wrongly used.
> 
>        2) Add "additionalProperties: false" for nand@ because all possible
>           properties are described.
> 
>     v4:
>        1) Remove "label" and "partitions" properties
> 
>        2) Use 2 clocks for A7K/8K platform which is a requirement
> 
>     v3:
>       1) Remove txt version from the MAINTAINERS list
> 
>       2) Use enum for some of compatible strings
> 
>       3) Drop:
>             #address-cells
>             #size-cells:
> 
>          as they are inherited from the nand-controller.yaml
> 
>       4) Add restriction to use 2 clocks for A8K SoC
> 
>       5) Dropped description for clock-names and extend it with
>          minItems: 1
> 
>       6) Drop description for "dmas"
> 
>       7) Use "unevalautedProperties: false"
> 
>       8) Drop quites from yaml refs.
> 
>       9) Use 4-space indentation for the example section
> 
>     v2:
>       1) Fixed warning by yamllint with incorrect indentation for compatible list
> 
>  .../bindings/mtd/marvell,nand-controller.yaml | 226 ++++++++++++++++++
>  .../devicetree/bindings/mtd/marvell-nand.txt  | 126 ----------
>  MAINTAINERS                                   |   1 -
>  3 files changed, 226 insertions(+), 127 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
