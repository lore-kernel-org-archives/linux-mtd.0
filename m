Return-Path: <SRS0=L3KX=EL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1FCC4741F
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 04:34:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D6520729
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 04:34:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DY9U2F1l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wNlJtu/t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37D6520729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n7YAnP9ubbRH99opPbN9rk3wdmA1viocjDBnt/UFXQ0=; b=DY9U2F1le1ut4nhObx+58y9IM
	bsyQpd9JjAamRds883hV08/tGfMiJqOhxdtOeV1Lp33yAlT9H8g1d63/JBbVnoVZqA0nuoK+o1clc
	YD03CDBiNezXaepYmUWt7XXQ3vYly2rHEoTGoCurMXih/CzZ9gu9gtAjjbn7JBX9o4da8i+P2+Ng4
	G3UPp5tODYXyzX156n8Jr1f2W6J5SKanhVx5eO5vCYf+C6Oh6C4tGZcdBp+65mCCJuFLgLk42ndQa
	RPntEc74AnSBR/0H866oBX2FMMEWz7P+reY3YMGEWGFDA5r+Pf3Zgv2YaigcUROVv3hek1ru9lmP9
	bnscs3eNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaWyC-0002xJ-7X; Thu, 05 Nov 2020 04:33:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW7K-000145-DJ
 for linux-mtd@merlin.infradead.org; Thu, 05 Nov 2020 03:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ToIj3qn6LC7L7pM0HaNTYsjdGwuX7RSbyNOYuS4MIXY=; b=wNlJtu/tWqvKfOdKz/r5WdqRlB
 jsqa8nH03oUWIbywxJGCzHl7eEqoNRQ5U728KwO81neE/GRmlbw4ZPemb4RKhAJhKmEhaqjzDs/Z3
 2XI3Up1ox9e7IMtxRwueGTN8iwdnHxbmtD5HpRFN0C4Yd0QwFidhykdLr8codiEGKT4efNTNG6oOI
 mVn+8ScD56GMW/XjpsZkb1OT51bPCfDOJRB+9yasBK/T/rteNOVoE/bWmYYlgay+U6obnTCQdkMGB
 P6QI2luZb8E3W4E4tLoDBB3egPvqE1Sx6nhjsJuMZPgLGG4UJ0MRr5PJtrnNUhJTT3M6FS5147Y4w
 g9U7vglw==;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaQYA-0002yV-70
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2020 21:42:40 +0000
Received: by mail-oi1-f193.google.com with SMTP id k26so519288oiw.0
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2020 13:42:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ToIj3qn6LC7L7pM0HaNTYsjdGwuX7RSbyNOYuS4MIXY=;
 b=s7pXPZsEq/c0GZ2dKz3uf4muSAFd4QAhX+GaInSiTjJf4sjY4PP/nYUMPMCH0+U57Q
 jOwYUf68HjBHV+qJASZs74Vuq5ukiCpg3jNfdeHy7FHRjGzLzVM7LHJlVKdVsHc7pQv2
 r4nR5/Rjmmm3otQgkqW/aNvAQTU6VVOXMyYjDUSj5l9hpFGgxfaOgCuTt76zRTuQUfUl
 UXEqUmzdh6HcuO6fExpsaprp/ZPPQUY72k+1LmJUwhC9enWDoqlU+q8g9Wej5UeR+9XE
 F90KS2h8n9Z2c7usufoFMHwODdmoFYWWYFe5sRV7F90YiUkSCCHuQF690XKRKkUVxW2y
 9pgw==
X-Gm-Message-State: AOAM531wrwiI59yZB0dLdBypHdNNQ7mOr+MQhgCgHu+GJTslJQhUmsWP
 9XXhKcbKzDNPFT7QTn9EdQ==
X-Google-Smtp-Source: ABdhPJwCkSpwP9Sk/Zsgc40Vavl3t/cXC+e77Qeb662HOtR1vtRPoh/6/T+FgFCAATxUtw1cMsBJAA==
X-Received: by 2002:aca:1a16:: with SMTP id a22mr1795494oia.50.1604526155853; 
 Wed, 04 Nov 2020 13:42:35 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l9sm760308otn.53.2020.11.04.13.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 13:42:35 -0800 (PST)
Received: (nullmailer pid 4172829 invoked by uid 1000);
 Wed, 04 Nov 2020 21:42:34 -0000
Date: Wed, 4 Nov 2020 15:42:34 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4] dt-bindings: mtd: gpmi-nand: Fix matching of clocks
 on different SoCs
Message-ID: <20201104214234.GA4172794@bogus>
References: <20201029162021.80839-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029162021.80839-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_214238_425944_801A8BE4 
X-CRM114-Status: GOOD (  11.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 29 Oct 2020 17:20:21 +0100, Krzysztof Kozlowski wrote:
> Driver requires different amount of clocks for different SoCs.  Describe
> these requirements properly to fix dtbs_check warnings like:
> 
>     arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: nand-controller@33002000: clock-names:1: 'gpmi_apb' was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v3:
> 1. Go back to fixed order of clocks, after explanation from Rob.
> 
> Changes since v1:
> 1. Do not require order of clocks (use pattern).
> ---
>  .../devicetree/bindings/mtd/gpmi-nand.yaml    | 76 +++++++++++++++----
>  1 file changed, 61 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
