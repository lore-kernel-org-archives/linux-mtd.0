Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220E4EB64D8
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEY1EtEPkSJkTYRH9VazTPitk/XMjvw2K+mJY8aRwV4=; b=YI1N6OLmTY6tBw
	8hkng0TMgjklaawP7XVU7BCxoMhMDzSTWM3T16T2lFSeQZHTYpIVBb4QniBB/bScBJxDDKHa4TT/E
	LhGVmAioMnAGX/r+ZkmdlzGfyfzsjBT/gxs6BZfRx7ofolOW1zgQbbt9wSaJq430wfISJ88yw/aiK
	g2NUfqgLlFYpYrQUP6Nkbsz04gAxBI8CkvgMbwVuhQLQJfyQ7rx08d0uFsRBJ7qRwpLrj+Vt3Znfj
	rR/uUb6U2mGMxq3PEegur6Yp9qmTQ+/2NB0z6c1t2tf14PbN5eDRTCdwlWsmjCi7PO1A2UXaCN0qy
	vHRRDeR0YCOseZX/rb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qABL0-000woT-0f;
	Fri, 16 Jun 2023 15:26:10 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qABKs-000wmp-2H
	for linux-mtd@lists.infradead.org;
	Fri, 16 Jun 2023 15:26:07 +0000
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-77b210292c5so30678639f.1
        for <linux-mtd@lists.infradead.org>; Fri, 16 Jun 2023 08:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686929160; x=1689521160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igH/dcK7UCcdt51JQqBje+biMdflRhWO8VW1mIDbaBA=;
        b=JYVJy8qRQjEIPFtIo61igQg/1jKiW4+lYBecvQj4M8JoTDzI7LgtP2Zi0/jgD+9/Ex
         /02Gl7B0fCQ3wumslb+izel15cTMlZJV30wM5qbPS9X3lviZQ5lOv7iPnIt0A1pwZkNJ
         1ABOzaTW6JuOd85g3EVLP49HBcSauMbNSr42ydPCYA0FKOo1Pxl//bFZkJ89C/TfXs53
         uOPVXr9JesqbybRlctFTgaKVNponmXLyRAuj6FFxGC6D7jI04aGn8x25WjwLFzPclili
         PcoS6roPjhiaXhtbInM1atTr4Zq5gfqrAEW4bvkofOHU+BAm/ZyYJIs/hUIf3qyv5Fnf
         8fYA==
X-Gm-Message-State: AC+VfDxqGgTNpe7tDJ65A9ZwkIByzrY3OoTMHk8RxOloCNIxMqNxo1zH
	HtfZ3K4VF6CmMeJeBQppkA==
X-Google-Smtp-Source: ACHHUZ48fTuGjPo4zir12/6NYrJyr89szhEMf/qHhpj1EgSvzOKpkzcISzefuE043NmgDCj+Lqk36g==
X-Received: by 2002:a5d:8b99:0:b0:776:bfbe:a72b with SMTP id p25-20020a5d8b99000000b00776bfbea72bmr2873779iol.14.1686929159875;
        Fri, 16 Jun 2023 08:25:59 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id r18-20020a02c6d2000000b003e8a17d7b1fsm6401676jan.27.2023.06.16.08.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 08:25:59 -0700 (PDT)
Received: (nullmailer pid 442105 invoked by uid 1000);
	Fri, 16 Jun 2023 15:25:56 -0000
Date: Fri, 16 Jun 2023 09:25:56 -0600
From: Rob Herring <robh@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, git@amd.com, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, amitrkcian2002@gmail.com
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: jedec, spi-nor: Add DT property
 to avoid setting SRWD bit in status register
Message-ID: <20230616152556.GA440257-robh@kernel.org>
References: <20230616085513.17632-1-amit.kumar-mahapatra@amd.com>
 <20230616085513.17632-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230616085513.17632-2-amit.kumar-mahapatra@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_082602_768249_96EF95AE 
X-CRM114-Status: GOOD (  26.48  )
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

On Fri, Jun 16, 2023 at 02:25:12PM +0530, Amit Kumar Mahapatra wrote:
> If the WP signal of the flash device is not connected and the software sets
> the status register write disable (SRWD) bit in the status register then
> thestatus register permanently becomes read-only. To avoid this added a new
> boolean DT property "broken-wp". If WP signal is not connected, then this
> property should be set in the DT to avoid setting the SRWD during status
> register write operation.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 89959e5c47ba..10a6df752f6f 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -70,6 +70,21 @@ properties:
>        be used on such systems, to denote the absence of a reliable reset
>        mechanism.
>  
> +  broken-wp:

In the tied low case, that's designed behavior rather than broken. The 
name should reflect that.

> +    type: boolean
> +    description:
> +      The status register write disable (SRWD) bit in status register, combined
> +      with the WP signal, provides hardware data protection for the device. When
> +      the SRWD bit is set to 1, and the WP signal is either driven LOW or hard
> +      strapped to LOW, the status register nonvolatile bits become read-only and
> +      the WRITE STATUS REGISTER operation will not execute. The only way to exit
> +      this hardware-protected mode is to drive WP HIGH. If the WP signal of the
> +      flash device is not connected then status register permanently becomes
> +      read-only as the SRWD bit cannot be reset. This boolean flag can be used
> +      on systems in which WP signal is not connected, to avoid setting the SRWD
> +      bit while writing the status register. If the WP signal is hard strapped
> +      to LOW then it is not broken as it can be a valid use case.
> +
>    reset-gpios:
>      description:
>        A GPIO line connected to the RESET (active low) signal of the device.
> -- 
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
