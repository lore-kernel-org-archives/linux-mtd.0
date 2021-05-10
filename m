Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5971CC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 16:52:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0B8E6128D
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 16:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0B8E6128D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VgpExC/+29xX0Fel+mAiIJKXet4X9OJP30wqwH6JGa8=; b=Qg9xE3ZZHUhBZx2VAJRvPSYe3
	CCHS3f4O7Zj+yjeYrctvLGTCRWFdCaAMMJEe7seFAeCAZVNBhQGyAcMxz8/oCGb/gtZ64ooinCyLf
	XA7zjhLznT83/mvc3AEA3cdMA4/5qTJa3ZToN6cWtn1cUQtrDkuvTUEkpB1GH1URBnnqQ6N5C/gn6
	ee1Z6WRpyobogeE0DoSQrroUxKTqroQXJHXejidO0WLbdHn/w2WIzVdP9z/q3OkXEhWLfjKEfuhcj
	HvBlQwrTS0IfmyRquxhOC9eG1ubzOdXpIiq9Kkwo4ZlQ8TmAnh9fs9pGJniNDmzp5tjydoxUHn3hc
	dQXwc7i/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg981-00F2Tq-19; Mon, 10 May 2021 16:51:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg97z-00F2TX-Hu
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 16:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=P4Gfvc7WvRaDyytGeBudSFp7SANRJPBrI8jAbvrebsY=; b=jXoUpB4ryvevgq2GsZhIKtcla2
 MDxW6MBTFrGUfnfunAmcm1enIpUEL/nehI//VFB+tyvjthcDibCwNv95IJNiLKD1n8kulEEgaoYNm
 040B/hg4jAXjINC/6JX8aSN4QvwFG8cI42hRl/oVDxxriW1Wld7AOkMSR8DnUMnjo1ZlcEpVpicx/
 3tATrftuDEgZtlJ3KwyqyumKe6B9lFLevN4LjagxXS0ZrsntSdNAGSNzOPtN47bTwFEgKEM3TK2uh
 wKbE2vl9Kzhq3McQXUkVeOoZ99Cryu7ogT6PDh/+ymxvX9WKnQiJd4wGXKLAEk5tsUJeZtaxqJmA3
 QgNN8Qjg==;
Received: from mail-oo1-f44.google.com ([209.85.161.44])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg97w-008wOU-Nm
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 16:51:30 +0000
Received: by mail-oo1-f44.google.com with SMTP id
 s24-20020a4aead80000b02901fec6deb28aso3596946ooh.11
 for <linux-mtd@lists.infradead.org>; Mon, 10 May 2021 09:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P4Gfvc7WvRaDyytGeBudSFp7SANRJPBrI8jAbvrebsY=;
 b=ilsDjthY2y+t64Y3ZLusvpQHVbKAQlFDu/n8a74GBuchwRQUoQaRXid015ZOP6nTBR
 ac2WuwpIV26BOB0RYLUs0sz1ZHhPjS2DxuzaQLW8KtGprVswzR/nj8JmqO50calV6MKm
 F9uzvJDRyY8j1IBTtzHM2CRiPcjO0W3FigDVEEkrEeHCoEq41S4nM3wuPxFhAO0l7OKX
 MuAu12tbzPadbJvuDffKoVeLyFPmAGXooVBHWJqN6Ld0rmtYHhpX9GDkpTKK3vx6gWv8
 feTE7jgtPPiOOz42N/YfDakoPl0I3S+exuGqBCwtZjYAlDoBF5YIvfd/w6HQ1LAVNJbz
 Mglw==
X-Gm-Message-State: AOAM532me0miMSNOHaQOVpWiDWK34amyOSCuUautjqfipfwRQ9eFqE5I
 MFzgbi5dwWI8aAmrxKbwnw==
X-Google-Smtp-Source: ABdhPJxKk/SA1ZPlD9CoXDK1oPSlU/HH61EzZIf0WmYXC+5w+QzKIgk2PqL2gT+rtg6jm9Bvo/+Hqw==
X-Received: by 2002:a4a:d4c7:: with SMTP id r7mr4290878oos.85.1620665487369;
 Mon, 10 May 2021 09:51:27 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 88sm3208519ott.51.2021.05.10.09.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 09:51:26 -0700 (PDT)
Received: (nullmailer pid 268705 invoked by uid 1000);
 Mon, 10 May 2021 16:51:25 -0000
Date: Mon, 10 May 2021 11:51:25 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/5] dt-binding: mtd: nand: Document gpio-cs property
Message-ID: <20210510165125.GA261277@robh.at.kernel.org>
References: <20210510104051.9701-1-miquel.raynal@bootlin.com>
 <20210510104051.9701-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210510104051.9701-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_095128_797700_DB3358FB 
X-CRM114-Status: GOOD (  24.16  )
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

On Mon, May 10, 2021 at 12:40:47PM +0200, Miquel Raynal wrote:
> To reach higher capacities, arrays of chips are now pretty common.
> Unfortunately, most of the controllers have been designed a decade ago
> and did not all anticipate the need for several chip-selects. The new
> cs-gpios property allows to workaround this limitation by adding as many
> GPIO chip-select as needed.

Subject and example have wrong property name.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 678b39952502..70a400e385b2 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -38,6 +38,15 @@ properties:
>  
>    ranges: true
>  
> +  cs-gpios:
> +    description:
> +      Array of chip-select available to the controller. The first
> +      entries are a 1:1 mapping of the available chip-select on the
> +      NAND controller (even if they are not used). As many additional
> +      chip-select as needed may follow and should be phandles of GPIO
> +      lines. 'reg' entries of the NAND chip subnodes become indexes of
> +      this array when this property is present.

Can we put some 'maxItems' value here. I want to make the meta-schema 
enforce that. I realize there's not really one here, but a 'should be 
enough' value is fine. We can bump it up if needed.

> +
>  patternProperties:
>    "^nand@[a-f0-9]$":
>      type: object
> @@ -164,14 +173,19 @@ examples:
>      nand-controller {
>        #address-cells = <1>;
>        #size-cells = <0>;
> +      gpio-cs = <0>, <&gpioA 1>; /* A single native CS is available */
>  
>        /* controller specific properties */
>  
>        nand@0 {
> -        reg = <0>;
> +        reg = <0>; /* Native CS */
>          nand-use-soft-ecc-engine;
>          nand-ecc-algo = "bch";
>  
>          /* controller specific properties */
>        };
> +
> +      nand@1 {
> +        reg = <1>; /* GPIO CS */
> +      };
>      };
> -- 
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
