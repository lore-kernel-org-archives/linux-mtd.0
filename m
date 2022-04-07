Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC21C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 19:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7x0xGrSm258gmrmQrPb7ek11d71VHUq2LdMUC6QNaA=; b=31ptpiN9svS33+
	PVAyyRyMxkIEtvS5DZCdeFDLCJvrb1lAtjxgCkkx5UhfpivOZbv8LqzpT3voFMSlrnrWwCibPOzkW
	EtV4jAnowTWPZFMx3J5czdeF8wAo7ZCnTPl3oA34RcNYZHiABml3wM2gTtkoxIeDnQg/7NeUkRRVx
	KaErpa35pixJDM9FCnPzLov2KxsKDptWZP64D+EQqtP+gvIyn8Od+tZfZ3owIkK1oFnK+v20wt++5
	8/+V+rZEqKAtYkor2SW9tGShzMsC0NubnLa/S5K7FBQPatw9Eit8UK3Is3TpeK/aV5YCClWb6Appv
	TcKuQnQWBm5H3ydTuEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncXPS-00DeQn-Cb; Thu, 07 Apr 2022 19:03:10 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncXPO-00DePJ-Qn; Thu, 07 Apr 2022 19:03:08 +0000
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-e1dcc0a327so7424097fac.1; 
 Thu, 07 Apr 2022 12:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NQ6NbUsNxmOVH45bPoaIurWw7GEZCEr+aG9zT4r8iZk=;
 b=kjnBS3zIU0NNdBdcFe0i2J2YDoamHCXNnbokrptoBbq+IDTefguBWApSwIq7rGH6oP
 c3Hq6k4p+o0yDiGvh7IdEnTKfRMJWAR20Nmh15APAV2Gy2DLyQznFh/g+SRCAas7npjV
 vpRRK05SzQicMM3fMb2AOvbJvvV5HGGYuTJgXM1TzxqpzGECDnIXXVuws9lnL3wrMK+h
 1GA6Z45/7ZMF+6XOLACkTUj/Q2qK33XyXQ/iRKrT+LDMHMSrZOtgSV4tQef/+rchNjS8
 sPMTNoqtNuVkK4t5Qqds6ZXT3uHMCAQREOw8fL++fg5Usq13R01PqZ7Z80R+WCCSBcpt
 FjDQ==
X-Gm-Message-State: AOAM533Zx7iRdBqmnD7EXkCR5/qDoh5SON2E6LOdfuGzIxh59jVAWWZN
 /orrel3KRWuuqxGsNNaGeA==
X-Google-Smtp-Source: ABdhPJwjcQsN14WCT4vuJ2Ixk7iwlioV4sNsxqAdHX8vMZZKKLCQdUfhAOOFojZ3iNXQynPHiVIlJg==
X-Received: by 2002:a05:6870:e9a7:b0:de:e59a:7376 with SMTP id
 r39-20020a056870e9a700b000dee59a7376mr7688592oao.194.1649358184393; 
 Thu, 07 Apr 2022 12:03:04 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r25-20020a4aea99000000b0032447305d70sm7598890ooh.23.2022.04.07.12.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 12:03:03 -0700 (PDT)
Received: (nullmailer pid 1789446 invoked by uid 1000);
 Thu, 07 Apr 2022 19:03:03 -0000
Date: Thu, 7 Apr 2022 14:03:03 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: align SPI NOR node name with dtschema
Message-ID: <Yk81Z5G+2B9arV9a@robh.at.kernel.org>
References: <20220407143405.295907-1-krzysztof.kozlowski@linaro.org>
 <Yk8AJcFRmYEryqra@sirena.org.uk>
 <67f75e49-e0c1-463f-da39-4a2efe7cce3c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67f75e49-e0c1-463f-da39-4a2efe7cce3c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_120306_939090_854ECD41 
X-CRM114-Status: GOOD (  15.05  )
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

On Thu, Apr 07, 2022 at 05:23:40PM +0200, Krzysztof Kozlowski wrote:
> On 07/04/2022 17:15, Mark Brown wrote:
> > On Thu, Apr 07, 2022 at 04:34:05PM +0200, Krzysztof Kozlowski wrote:
> >> The node names should be generic and SPI NOR dtschema expects "flash".
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/mtd/hisilicon,fmc-spi-nor.txt | 2 +-
> >>  Documentation/devicetree/bindings/spi/spi-davinci.txt           | 2 +-
> >>  Documentation/devicetree/bindings/spi/spi-pl022.yaml            | 2 +-
> > 
> > Acked-by: Mark Brown <broonie@kernel.org>
> > 
> > but it would be easier to split this into per subsystem stuff.
> 
> With DTS changes I had 22 patches, so splitting is a trade-off. If
> that's preferred (actually can reduce conflicts), I'll split it and send
> a v2.

I've applied it.

Really, I would have just fixed spi-pl022.yaml. In general, I'm not that 
interested in taking fixes on the .txt bindings.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
