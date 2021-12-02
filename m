Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1436FC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 00:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDYIR9ZAUqJ0OigX4i0eAvxglrlxVnq0G9rU53IBq3g=; b=MisepUZGPuTH0+
	hz8GjQIvqI0xR5MGJXanylg7WzS9ISmNYWj4RaiRLsGxJ5mAut5K5Ly7ZcUhgywbH0xvHI+5PXJuP
	eUYpPbbbXkV2GfQ6Xt1x6vSQpnnbXx7b3BjSqOwKrhbc4/DJN82QtenNRIs3YwloDWvToDIFFwApr
	U0pA3lmW6UVXbmzhpr8849lqCCWqL3tl7+a30Xorg9CqC54wRizZE/WkbiB2y5NT4rIDa5spxJJlI
	z/y/eAGjqzMVUqV73rhsoQZTPPgQB0nDZvYT6akHaZqkiq03l3VZZtam8x/1FsLMKbydhx0CauEin
	mdCl7y8PuZR9TzhhQIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msZc0-00AOPW-F9; Thu, 02 Dec 2021 00:06:08 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msZbx-00AOOP-Q1
 for linux-mtd@lists.infradead.org; Thu, 02 Dec 2021 00:06:06 +0000
Received: by mail-oi1-f171.google.com with SMTP id t23so52073946oiw.3
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 16:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bnG7ZThgpV4GS+FXFDhi+FpBe4m9EJe3SskbxvTtuKI=;
 b=KEP6ypeBSsk4qocUefbJhxF973q3UUPifs0pEozyiCZ/k8qIATRAQtvWBKDnLVvpyZ
 uS/ElodZOyhcS15QX0nyKUphai03VICVGyuvf6R+hW9LWusEAPCtWAO7irQ4n1JAxs/q
 frzhN9qjBKWyHbJn9Dxgv8jU4p2Fo+RDYruepLspFDYWhyAXNw9JIimii10gSPQPvTJ7
 NJCOtu4a0SK5CDrwweTlDaEeu0Hx+KShS4+chEKDPtUSYVYETm41Jn8wN7B65fZmehrf
 R9w23SuDe8KUvCwDjLwNgL8/a1O5RdbYRTBiDy6lot4NjjtzzKJT27EUPYbfxCuIXR6K
 aSHQ==
X-Gm-Message-State: AOAM5332h4vzWxE1AiKYr+X54ITuKtKRIbEnq0CYJ//TywXxNv1qrg30
 iwl8PaYg/cIb10cjUQXKmw==
X-Google-Smtp-Source: ABdhPJy2jWZVjDaroFsVsg0OQeJFnrVrrkoB0ro9GC9c7tWalmkOqE7zHj7rA0Xl4XxjSd/sBct4Dg==
X-Received: by 2002:a05:6808:2014:: with SMTP id
 q20mr1587056oiw.117.1638403564899; 
 Wed, 01 Dec 2021 16:06:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a6sm610048oic.39.2021.12.01.16.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 16:06:04 -0800 (PST)
Received: (nullmailer pid 3268585 invoked by uid 1000);
 Thu, 02 Dec 2021 00:06:03 -0000
Date: Wed, 1 Dec 2021 18:06:03 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 devicetree@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 linux-mtd@lists.infradead.org, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: mtd: spi-nor: Allow two CS per device
Message-ID: <YagN64lqGVcTHi+e@robh.at.kernel.org>
References: <20211126163450.394861-1-miquel.raynal@bootlin.com>
 <20211126163450.394861-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211126163450.394861-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_160605_869919_B843F351 
X-CRM114-Status: GOOD (  11.35  )
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

On Fri, 26 Nov 2021 17:34:48 +0100, Miquel Raynal wrote:
> This will be needed in order to be able to describe Xilinx QSPI
> controller stacked and parallel modes.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
