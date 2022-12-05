Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74241C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckBmbF030LeOSHUKIR269dZDYIOAVtZM+7GH4eiTOrE=; b=olqbFCDgHsnSxE
	YR/vD+tMdtVMhzLnEqzcU0ieKKAUKeKXujS3tQ0Z8lbb0AyZDUgDodc2BVPNPELaYPRttmC0CCNBv
	IS7WTUGBZp8X3IJ5la+iTxWy/kEa5+06t97BF2b8Ojpf8HIMGRqHMinOJsck3WO5JwMpWtyFtDGY/
	bBxRCWQkjbJpIEz2P+nv+gOXi2iA7MRPO6v9CkPH2U77BNEqmGXHBaXahivleyyW/AASdxCNDfFct
	zHzRhRK8M0Z3hm1REtmmQOWD+PuxjVNQ3WlQ0g/OTQUZSUP/Ja14uhbrCk3PCk/8RsUo3UvrPUutv
	u9souV7ZOCMiWEHk2QbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EHM-006SL7-2k; Mon, 05 Dec 2022 16:25:16 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EHJ-006SJd-Dd
	for linux-mtd@lists.infradead.org; Mon, 05 Dec 2022 16:25:14 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1441d7d40c6so14020441fac.8
        for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2022 08:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nazdpu5NA/yzv3brewocclL6XUkEccB3TGTof1h3fCI=;
        b=KjzmWtgSsGMpQHLUzC2jo/m8SCUPXBalieqZMotKJlB6oY/RxiROym9KRVVeFZtiY3
         yQI1GObohviCDbmdEPI3Y/IgDO6hJwxH56n5vDwrBRGO8H6XQe/WdxYsx/1J9WmhXTIl
         AFjyibWH3nXO0j3xpTPy/Xs0RHkrv3r5zZ7Mud4FpF+5lWhJPrg774vmgpvJ7Bq1k4kN
         WcATtdXHESnG9H5C7DNvQ7JJfosJmQYStKqgtk6crSxqV5JkadrvBL5h69isYCNeG5D9
         8mKmFfljMpTYPuH9ekvQpMn4hch71GIcZX8bQ/98moPnIaHYgsP/IGXNYWztDIjJPNjv
         hKKQ==
X-Gm-Message-State: ANoB5pnllPwH9t8lacZi9P6wYpvNAAn/CkivOl37rngTzs54dl0fIqZJ
	TUiEub5w9x0EZ7FgWqa2mQ==
X-Google-Smtp-Source: AA0mqf6b9a/2JVjrHrs9gtn3XTd/wBdw4WAOH5TxXmqIUyBPNjYrVJzgOxwTiw3L4gZ04JUs5qgfpg==
X-Received: by 2002:a05:6871:60d:b0:144:514c:434d with SMTP id w13-20020a056871060d00b00144514c434dmr6527676oan.50.1670257509908;
        Mon, 05 Dec 2022 08:25:09 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c14-20020a9d784e000000b0066e83a74b99sm5026643otm.35.2022.12.05.08.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 08:25:09 -0800 (PST)
Received: (nullmailer pid 2023663 invoked by uid 1000);
	Mon, 05 Dec 2022 16:25:08 -0000
Date: Mon, 5 Dec 2022 10:25:08 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
Message-ID: <20221205162508.GA2012644-robh@kernel.org>
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_082513_495531_F6DA28E3 
X-CRM114-Status: GOOD (  18.01  )
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

On Fri, Dec 02, 2022 at 02:37:58PM +0100, Geert Uytterhoeven wrote:
> Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
> FLASHes.
> 
> Merge the new entries with the existing entry for MT25QU02G.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> mt25qu512a is already in active use, causing "make dtbs_check" errors.
> mt25qu256a is supported by the Linux spi-nor driver, but there are no
> upstream users yet.
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 6cc491083650a0f9..92f65f682059a6ea 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - pattern: "^((((micron|spansion|st),)?\
>                (m25p(40|80|16|32|64|128)|\
> +              mt25qu(02g|256a|512a)|\

Let's not add new cases where the vendor is optional.

>                n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
>                atmel,at25df(321a|641|081a)|\
>                everspin,mr25h(10|40|128|256)|\
> @@ -34,7 +35,6 @@ properties:
>        - items:
>            - enum:
>                - issi,is25lp016d
> -              - micron,mt25qu02g
>                - mxicy,mx25r1635f
>                - mxicy,mx25u6435f
>                - mxicy,mx25v8035f
> -- 
> 2.25.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
