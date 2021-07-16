Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A69C12002
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 18:03:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3542860FE7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 18:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3542860FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fS0d1wyV6fczIbgkDD4iHWHrU3S4yAAn4sAvZw1YY2E=; b=f1kimLbZZq1WVr
	BdtcNkkNOmtwCdB+RzyNMtgPk65QvLfL91a9O/jiW/WwfKWd/xQCPwa2ssh2KBfFV1uNxBONCkoWa
	vXz7tEkSCiBOWRJEACQHgdqLhayZeda63z/0qQmVPzWzgGUPuW87CXC/mzGEhqpdzoYWsGmY8MaPy
	+QDpk2DECrmJHLTxbaJUySIVVd7sWHPuj2blZJBoI+c3l4dzIyrQf9f97nNuFEPSxsQ9OZTIv2FMA
	hZXCAVHxHf5NyGXbbkKK4XSCPSfSA7zJrmOCZOeBy4KYw/x9DBzLyN/kmstitlFYMhVmS9251+/K6
	hjXIlJRoc3XNxPEFHWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4SAt-00527y-H2; Fri, 16 Jul 2021 18:02:59 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4SAq-005278-RI
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 18:02:58 +0000
Received: by mail-io1-f44.google.com with SMTP id g22so11622528iom.1
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jul 2021 11:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o8ZKFwDkRHkveLaudUDVhxvrMvahOTC+Q27T5GsqDWc=;
 b=FntxkdqRmLR23mdP6uhLRaMfgMXxedOk0Vkcy2yeXG1lffRQkHEv6QlvW3+1cRszrp
 +PbNwODE/Hn0T7u2cQoSKTv1MogIjKY6dh5P9LxWETblvE3MJZct42z01AQNi8npYTX/
 XKpadKQ+nfH9Lxg9OaKaItZ84QsFutMeXFI2/nMUe3TQMJY7jhEfDr4mT3eFllqGKAqX
 zlwIzgN7VYlmlaqFGzL0JDDSpTxBQIN/RkW3UDqlaBz2WuWEVTwXIEzlN/g91Bsogz65
 R52x2s+R7jpLDfP850UIr71A/Y+YTJdvtOhCsiyeeJKby3EHLsMWcITJklTdqIJnxvRP
 PgbA==
X-Gm-Message-State: AOAM531/N5QSDPPV+n9KENzLx5/OTJwc9WMGXH+2NmmZzBeuBssWZmHh
 NW47D4FFI0ypV0CtEwmZ2A==
X-Google-Smtp-Source: ABdhPJxh7jTPpNQyp+Byi/egf6lVzgVhWXlz6KVf1X2/P0wH39CqS6+wkKXzdyM7NVt0sfMNR6fLKA==
X-Received: by 2002:a02:c9c2:: with SMTP id c2mr9890706jap.98.1626458576094;
 Fri, 16 Jul 2021 11:02:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id o12sm5104314ilg.10.2021.07.16.11.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 11:02:55 -0700 (PDT)
Received: (nullmailer pid 3687147 invoked by uid 1000);
 Fri, 16 Jul 2021 18:02:53 -0000
Date: Fri, 16 Jul 2021 12:02:53 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: memory: renesas,rpc-if: Miscellaneous
 improvements
Message-ID: <20210716180253.GA3684196@robh.at.kernel.org>
References: <d430f9c06d6691fe8a98f923cdb7ca13772834b1.1626262043.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d430f9c06d6691fe8a98f923cdb7ca13772834b1.1626262043.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_110256_923911_D3C814CC 
X-CRM114-Status: GOOD (  14.74  )
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

On Wed, Jul 14, 2021 at 01:30:13PM +0200, Geert Uytterhoeven wrote:
>   - Add missing "#{address,size}-cells",
>   - Fix rejection of legitimate flash subnodes containing multiple
>     compatible values,
>   - Add missing list of required properties.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../memory-controllers/renesas,rpc-if.yaml    | 23 ++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> index 990489fdd2ac33fe..c0d899a2305361b1 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> @@ -56,17 +56,34 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +

spi-controller.yaml already defines this.

>  patternProperties:
>    "flash@[0-9a-f]+$":
>      type: object
>      properties:
>        compatible:
> -        enum:
> -          - cfi-flash
> -          - jedec,spi-nor
> +        contains:
> +          enum:
> +            - cfi-flash
> +            - jedec,spi-nor
>  
>  unevaluatedProperties: false
>  
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - power-domains
> +  - resets
> +  - '#address-cells'
> +  - '#size-cells'
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/renesas-cpg-mssr.h>
> -- 
> 2.25.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
