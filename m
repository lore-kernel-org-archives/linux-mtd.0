Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6D9C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 13:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMa6bzDm81H/1Eep4uQSOs1mNR3ny+9/0shtRgo09/k=; b=P+aB8Fzpn5pOIj
	u3fLdn/am0tAHbSvHKr9ysadH3SySVebafXx6v+c7Lcd+6rTk6wes3SHT1ijaip7cUSvh6IS7YRa+
	bnGv8QkPUPSF2skfIntbAa/jB2K6QEfeDrr5aL31oWfEPxvLr3fi4Tj8XeLxHZ2xXeve9KquweIOo
	t7BC1nEhT8Blgd0dySb9jqXDMMKzfNfH+CmEMqhtJUg+g/Xk6BO94uBE+I9LqsmqOn9lPlZ+n4AF8
	UPUG7A3Hkg2Tu1NuBUBM82bMvcZJrZyGjt92hT2gKsm3QkV6jGX+LmYv+W0HGDntHRNWT1P3addb4
	1Qgc+R8XbBPRliZgSt3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6B48-006M0D-4k; Tue, 28 Jun 2022 13:15:40 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6B3x-006Luy-Ef
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 13:15:30 +0000
Received: by mail-io1-f46.google.com with SMTP id z191so12749614iof.6
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 06:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=eoO/x7bu4aRqXGjs88nzeRONL3YMYzeWgMsbV8yMbpY=;
        b=VFV7S4lyn6Iyb1Dydb3dsJX90jwvKJuuQo/IyMc+6Q5IGmdWjADkbzc9q6RWYXAzHY
         lU3IWMCJOV5fPbF4Gu/SaRK3ZahHQvOZNVl4yZeTRHjQy91ZPh3aoA4IQ9fjvW1JYDNy
         EP4UxwjWRKT1Ez0AtMPhU8NF2/WPMqZspoCYyUIfW6DCe5q1Ql0JRkFLlJv5Jg5B/KBn
         ah650hasqt+ioC7e+25t+9KpSYjHA3anLCT6po/8UmLacS9uYmXUp7PQOT4bUc044Kfa
         Ny0oXRJ/ni8LavSgwYutoHK1my5NxT1Z3smp7dLodRpn8/erNvkqKHhOH/LAtiJxClt4
         BF2Q==
X-Gm-Message-State: AJIora9iKbPZL5jCGaf4iJMyhR+BdEclqHAZB1eiKx+pge1iCb1h9EK4
	FU4KzSGaldKZYOIJV4FBOQ==
X-Google-Smtp-Source: AGRyM1uLRQIsoQb/m55If6Pna11BMZb9W0F/Ss94rf+Kxx2UN5mK1VltXoovNGgZqa3DJA5DrrhtYQ==
X-Received: by 2002:a6b:3f8a:0:b0:672:77f8:c000 with SMTP id m132-20020a6b3f8a000000b0067277f8c000mr9507935ioa.11.1656422128117;
        Tue, 28 Jun 2022 06:15:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id b15-20020a056602218f00b00669b2ffad32sm6640154iob.54.2022.06.28.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 06:15:27 -0700 (PDT)
Received: (nullmailer pid 313748 invoked by uid 1000);
	Tue, 28 Jun 2022 13:15:23 -0000
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, tlanger@maxlinear.com, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, vigneshr@ti.com, linux-kernel@vger.kernel.org, rtanwar@maxlinear.com
In-Reply-To: <20220628112731.2041976-2-martin.blumenstingl@googlemail.com>
References: <20220628112731.2041976-1-martin.blumenstingl@googlemail.com> <20220628112731.2041976-2-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v1 1/8] dt-bindings: mtd: intel: lgm-nand: Fix compatible string
Date: Tue, 28 Jun 2022 07:15:23 -0600
Message-Id: <1656422123.522235.313747.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_061529_527449_7C53DF86 
X-CRM114-Status: GOOD (  13.58  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 28 Jun 2022 13:27:24 +0200, Martin Blumenstingl wrote:
> The driver which was added at the same time as the dt-bindings uses the
> compatible string "intel,lgm-ebunand". Use the same compatible string
> also in the dt-bindings.
> 
> Fixes: 2f9cea8eae44f5 ("dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/mtd/intel,lgm-nand.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
