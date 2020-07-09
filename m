Return-Path: <SRS0=tdsA=AU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FF7C433DF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jul 2020 20:05:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB3BF20720
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jul 2020 20:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mR/brdlK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB3BF20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=in+SN1OW7YdG7AF3OG4LIb/DO6J1UNbO8lAp6Xw40Vk=; b=mR/brdlKlIVaGm69nQ1IBbmq1
	GcCaEd0OqqhA9U1ZBhNCAKO7/MvSoFG8Oshx+r79BOWKn86TdPyi9PgdyYNthFygTXxiUFJQj4bOm
	WWgzf8YVMM+GH308cDgwMhyuFCNQ2TEggsgpXSMCSvCto2e5+FmosWqQOEv3T1pFVKJjyqBNGjFik
	Jvf8omjvYHJ/nkkBXDA+6jqFLjFAIRpomJ7UqFuZzWoYMNW4gVML0Dei02hyNcAhCnx1eMNnU5cTA
	15idbGqWwJfqdHgzoSGLRNoO+Te+jzSBmuMt+DUsXaByp/pAp+i+lmzR/Jg6pbxVuGz7eRX+YkRiA
	+3UHJbvow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtckb-0002wH-8o; Thu, 09 Jul 2020 20:02:33 +0000
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtckY-0002vR-Ly
 for linux-mtd@lists.infradead.org; Thu, 09 Jul 2020 20:02:31 +0000
Received: by mail-il1-f194.google.com with SMTP id h16so3086269ilj.11
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jul 2020 13:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GbTUX1hwKznFo8qdo7VPy0xviwT8SF70NrxL0PIGu+g=;
 b=Umnwytd2qF1I4PH29SkLucYOYfep8t9s6h5EdiTWmdL8xVrZx1H4ZPJhmhseM77xuv
 ljd53NmhB1j1orTbXQb0nHUutOeUHwM3kyoJCR4s7aaokTMsrjcQ20s9yQfMy9Iq6Nln
 9p+kE2ObeoEQJ5TD7khAYv14Cn5efPrIDFLwIXP2zyprsJEQY++qQlKrpj6OrjnMLja6
 chATmR/PE3eMaZ4KnS8d6I0Ry7dyT3Jp/UjzJPFah0SjwLt1g0+G9xLO5hJLSSAFTwHR
 KE4eweWITRgiAmlZ2zqZCW+T0cp5+w/rhNUpkU8759VSm9TMKFGWJamU0hcffAm2DdQC
 Jtzw==
X-Gm-Message-State: AOAM5325XopnNZH4f7NCXJ5zdeVxypsUsRy3b4+LxoqyYGrLNb7iboT7
 75Yg4lJ2i7Ir5CxWfj+OYw==
X-Google-Smtp-Source: ABdhPJz0QSJxq4uXeq0pX5m+bVycJTydWUAO2wtdZvzLlVGo+HlU3R6Ma3f/G0BZECagKS2h0xdMkA==
X-Received: by 2002:a92:5fc9:: with SMTP id i70mr50905844ill.176.1594324949752; 
 Thu, 09 Jul 2020 13:02:29 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id s190sm2496383ilc.28.2020.07.09.13.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:02:29 -0700 (PDT)
Received: (nullmailer pid 798537 invoked by uid 1000);
 Thu, 09 Jul 2020 20:02:28 -0000
Date: Thu, 9 Jul 2020 14:02:28 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v12 1/2] dt-bindings: mtd: Document nand-ecc-engine
Message-ID: <20200709200228.GA798487@bogus>
References: <20200630072822.26828-1-miquel.raynal@bootlin.com>
 <20200630072822.26828-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630072822.26828-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_160230_731819_3745E785 
X-CRM114-Status: GOOD (  10.11  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, juliensu@mxic.com.tw,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, masonccyang@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 30 Jun 2020 09:28:21 +0200, Miquel Raynal wrote:
> This property is needed to precisely point to the hardware ECC engine
> to use when there are several of them available. Here, hardware also
> refers to the on-die possibility.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
