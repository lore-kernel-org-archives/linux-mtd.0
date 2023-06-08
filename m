Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C09C7EE23
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 15:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JD9kx0CzJMvBF+py28U/HN23ldbQWIbwHAi9Kq7GxtI=; b=pLra/sqTDfgAbK
	5I+h59QX0zP3GSXwdyN7wQQKIvz3HT+2FWc3fgpdIwh02yvNJ68DeNwnpuoJhTpvnNsLLsGwscDGx
	kbmi8DhjZkIvvZFfTr0/1xrUsWq5LB0FYkSXSOvYpD+67MyzA8qG9NEEsTnn1Vx2guEkRWKFOzIds
	mlDlXbEs8xuhRbTIhJ2KSzieEs1A9gUFk0RJWz40XiMQwvZPHjWpVd877RtpfEZFo9LJEQOpiXxCD
	jkTq9jcNJfsEqhJYehhKYNDJ8jXCrjgMEbjwBaIQh7v4jnTvazK6j9pyU76pUppil4MxF7AXiPcuY
	gZuGgYOpcU4yzPCB5llA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7HRR-009jG8-2l;
	Thu, 08 Jun 2023 15:20:49 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7HRO-009jFP-3A
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jun 2023 15:20:48 +0000
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-777a2ef8d45so24190939f.2
        for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2023 08:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686237644; x=1688829644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mKqTh6HvqAYJJix6iV1nUOxGnIFbJFjfMpRh030KYY=;
        b=EVrfTdr8vbPDVrX3psZ9BHUsRjSsDJKPSL7bOIU84wyOYP7V3WlS4Iiei19+gE6TYq
         S5jyKDI+YZ71UnbJYxUCnIDTTyd+cKZRJhN6xkQBGfCEs8J7HkoeflvgUGOtCOJZGn+k
         tkXNNs+lZiSC8DqUBfa6Xz0qrsa4Fuu6coSPiOiNIfkh9LDbbINy8G/dIvP8zQRGG8Qg
         8q75Dznj2k7L2KfN1kdGBV+nYK02XFMXdGbULSbHuiWJaozs/Qjy281uzYBMX0sOj+s1
         yRnO7qRX6Vaa1XX3c4D6I0/3Sac4ntvNPqbaI16cVdN62ZFc/RKq24T9OLXM7YtSkfFl
         QCng==
X-Gm-Message-State: AC+VfDypb1AzBJy9698pCecDEFD1bHDF3DuMG4N11VHoNNiG92ItJFEH
	xlkQ3H6k9UikCOmOksAQXvNmkyngHA==
X-Google-Smtp-Source: ACHHUZ7WZaxna4a3f+VJndPvJCsn8D0xI6SqGkSmJ/43JZbw3aDwZd52wbP8oQNr1It2Oy9/CK/RmA==
X-Received: by 2002:a6b:6f15:0:b0:776:feaf:8cec with SMTP id k21-20020a6b6f15000000b00776feaf8cecmr9620406ioc.3.1686237644514;
        Thu, 08 Jun 2023 08:20:44 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h16-20020a056638063000b0041f4e8862ebsm331982jar.73.2023.06.08.08.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 08:20:43 -0700 (PDT)
Received: (nullmailer pid 2715861 invoked by uid 1000);
	Thu, 08 Jun 2023 15:20:41 -0000
Date: Thu, 8 Jun 2023 09:20:41 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Pratyush Yadav <pratyush@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Michael Walle <michael@walle.cc>, Paul Cercueil <paul@crapouillou.net>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 07/17] dt-bindings: mtd: ingenic: Prevent NAND chip
 unevaluated properties
Message-ID: <20230608152041.GA2702460-robh@kernel.org>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-8-miquel.raynal@bootlin.com>
 <168607750937.1468225.8457774415279003681.robh@kernel.org>
 <20230607113314.5da62276@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607113314.5da62276@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_082047_020850_A0DA12C1 
X-CRM114-Status: GOOD (  22.00  )
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

On Wed, Jun 07, 2023 at 11:33:14AM +0200, Miquel Raynal wrote:
> Hi Rob,
> 
> robh@kernel.org wrote on Tue, 06 Jun 2023 12:52:00 -0600:
> 
> > On Tue, 06 Jun 2023 19:52:36 +0200, Miquel Raynal wrote:
> > > List all the possible properties in the NAND chip as per the example and
> > > set unevaluatedProperties to false in the NAND chip section.
> > > 
> > > Cc: Paul Cercueil <paul@crapouillou.net>
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/ingenic,nand.yaml | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >   
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > ./Documentation/devicetree/bindings/mtd/ingenic,nand.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/mtd/raw-nand-chip.yaml
> 
> It seems like your automated tooling failed to apply the second patch
> in this series (creating raw-nand-chip.yaml). It says "sha1 information
> is lacking or useless". This work is based on a recent -rc so I'm not
> sure what is "lacking or useless" in this case.

The base used is rc1.

> Anyway, do you plan to give this series a look anyway? Or should I
> rebase against a specific branch?

Yes, I'll leave it in the queue. I'm just getting back after being out a 
month.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
