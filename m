Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570A6C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 20:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Szm43YdVQiN6YH/u1rKo8LDV8R/ochG6pIpUflP1GR8=; b=4yAW6IpOU/LQt2
	5TDrRuUX4VUAfY/qVFLevFKA+9PAnMaTv7R4vrBwlRwl6kM6Ry85/B4QA54IesO1M0hxcREJdJ1nW
	o5Coj/EXFMVGz3JbxeefSQq7nBeivswTfzCemATMnNFUXml0rHYM6b6sTTkpIb4kCsGPmM/8yWLOy
	ZIeqGAFyvYB6L5cWiWPGt/Q+LEgekVoFQSitlnCWoWCvHGGVMV/5x6PfvdoCI1+nBHYtnx34Akh51
	U09OsayBVULSgW6wAUwegUz8UyB3ctbJ/2x7qjoUaBL00kGq9TZef6WOvwe9gar8gqvdqIAE3ftFL
	wb7pia7//unxRIR7UqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pCQ-002dPK-59; Tue, 05 Jul 2022 20:31:10 +0000
Received: from mail-il1-f170.google.com ([209.85.166.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pCO-002dOF-0n
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2022 20:31:09 +0000
Received: by mail-il1-f170.google.com with SMTP id n9so3857152ilq.12
        for <linux-mtd@lists.infradead.org>; Tue, 05 Jul 2022 13:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GBoKp7b5qnasD5EVBeBmBvPwuf7kIJMBjmwIRdc6aOk=;
        b=dmVEjmQIPTuXD32CfD7g+YH+TJdsjxfvhyTPqO1vHyRpE7thIv5irMimrG3XtoWrWl
         SUCIc2TJhT6f3HF/LLBY7R/nORuUOwXno0nOBbBzYan6GeJbVe+q3d2jDAnr8UFXeTrB
         4oxBKdNr9m0KPywwDJTCoFUKpn3rzEFhzT7tRj+UmW02YNdwB7sNfrIDmIPO8fdhKUTf
         fLFfBTruiAt1UMR/fuuUnLlsd+hpJWl+t6FjdAhDtdHRpAU0EHzeq2zY1OzLVzlebPyP
         Fj8G4a6HABhycLxSQOV4wrX1bpAwSHnGzIc51qOBWUpXhoemhBhLhzYsJrVeouo+9S6E
         Mpbg==
X-Gm-Message-State: AJIora/ONmUjPraSZTdctiFJM4M8KVBvM0CHkTmRaTanHBXed6YNqgQv
	1gzTPqSBvogjOdBMOgj0vA==
X-Google-Smtp-Source: AGRyM1sv62Rsxnc0NMQUy/zTtbvNFhaXFxAjV8+DiQnB+mrYMvYYoP3LuKlavOxxZohXg22LXKkOrw==
X-Received: by 2002:a05:6e02:1a87:b0:2db:f29f:9c93 with SMTP id k7-20020a056e021a8700b002dbf29f9c93mr13241468ilv.232.1657053063287;
        Tue, 05 Jul 2022 13:31:03 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z18-20020a92bf12000000b002d11c598e12sm13636718ilh.61.2022.07.05.13.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:31:02 -0700 (PDT)
Received: (nullmailer pid 2573868 invoked by uid 1000);
	Tue, 05 Jul 2022 20:31:01 -0000
Date: Tue, 5 Jul 2022 14:31:01 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, rtanwar@maxlinear.com, miquel.raynal@bootlin.com, richard@nod.at, tlanger@maxlinear.com, vigneshr@ti.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/8] dt-bindings: mtd: intel: lgm-nand: Fix compatible
 string
Message-ID: <20220705203101.GA2573805-robh@kernel.org>
References: <20220702231227.1579176-1-martin.blumenstingl@googlemail.com>
 <20220702231227.1579176-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220702231227.1579176-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_133108_109129_517F13B7 
X-CRM114-Status: GOOD (  11.55  )
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

On Sun, 03 Jul 2022 01:12:20 +0200, Martin Blumenstingl wrote:
> The driver which was added at the same time as the dt-bindings uses the
> compatible string "intel,lgm-ebunand". Use the same compatible string
> also in the dt-bindings and rename the bindings file accordingly.
> 
> Fixes: 2f9cea8eae44f5 ("dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../mtd/{intel,lgm-nand.yaml => intel,lgm-ebunand.yaml}     | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename Documentation/devicetree/bindings/mtd/{intel,lgm-nand.yaml => intel,lgm-ebunand.yaml} (92%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
