Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDEDECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8X5lxygiFFzdu1vRA8bONdQRk1AekrKDkHIF/DUWA8=; b=slWv9Zj37Zn7ao
	/HIGd72Sa5Zod2D2DN2Axwqn05OTdyhuIQ9kofWmpyMtHiHlSwfKeWYlGymkXzen+pTLgIJdA+zPl
	Z7olGS/GG6LYK3s8g344r/UqsmGf941memQSNMuicufaxo/pFwSkWiIQyWZGHJzMXfz4H3jTPbbNI
	ic6oe+jhMlHe77US9Spn8Ilc9j4p6BFthKh9sVJ50MbMnu9XwACxVGu89UqeDPJCtv7edT5SToAIM
	vmJapMoJFuWZSvxUZbpQjU84fRCCIVqOIrVMF6hLF8iD0RLQlrV2dvmDga1al6HPdHRz3DtJWPIRi
	Ie6nMEGhVWMLYhqpIWGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opboR-00FLNF-EE; Mon, 31 Oct 2022 20:55:15 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opboP-00FLLo-20; Mon, 31 Oct 2022 20:55:14 +0000
Received: by mail-oi1-f178.google.com with SMTP id s206so14048180oie.3;
        Mon, 31 Oct 2022 13:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCSN6Z+0y4J22903M64Zf4+jbjsk7cN/Snw9CD4bul8=;
        b=gSEgpsQXgIgR5KTZwc0bZMjs3IrpZlwWXK0OPPjfzQbz7h9xJw85uSIPLr0iQrh0WE
         6ZXMSy+8wfOfNBqcysz51pwKUm4GJP6e1Eyxxn5AbiucuwcArZIXOKKVLq8s3WfP8aVj
         IR0JkT4ItxD0gEcMdoTto9/xZwj2vYJ1AdycmX1zzXDPf1xLWCC1if//PJ+zyZ8N/2Jm
         +6+//gMyEc0Ek8Z+33Bt/GchKjnm5IWUM7X0QzKJNyq51SkNp3f2Fix0PZpwPgm8ckiX
         +unooLw59XwP7JfmVauYUe7OfOK7Uflapm2VlKKX8kC8ld3lQhtkGoMswyO1x4YqHJBG
         BZNg==
X-Gm-Message-State: ACrzQf3+rrP3en+478lS/NrqKoAspBIMBqX8Lx3mi45W0v3MA9BHDffl
	WiMDzRsXNlTRtMKefOFwJA==
X-Google-Smtp-Source: AMsMyM7XjXOlecZaxEkia4ZmEGJQotcenwAVinqsz6x6j+hsDlruF/WE8oHbdwgzxZc0aE6fkaNnfg==
X-Received: by 2002:a05:6808:f09:b0:359:b15d:349c with SMTP id m9-20020a0568080f0900b00359b15d349cmr14725300oiw.57.1667249711409;
        Mon, 31 Oct 2022 13:55:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id fp42-20020a05687065aa00b0013bc95650c8sm3541051oab.54.2022.10.31.13.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 13:55:10 -0700 (PDT)
Received: (nullmailer pid 3505400 invoked by uid 1000);
	Mon, 31 Oct 2022 20:55:12 -0000
Date: Mon, 31 Oct 2022 15:55:12 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Naga Sureshkumar Relli <nagasure@xilinx.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Walle <michael@walle.cc>, Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 06/12] dt-bindings: mtd: nand-chip: Reference mtd.yaml
Message-ID: <166724971189.3505343.6716916963356990521.robh@kernel.org>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
 <20221028235933.934850-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028235933.934850-7-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_135513_114751_D68F1BAE 
X-CRM114-Status: GOOD (  10.63  )
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


On Sat, 29 Oct 2022 01:59:27 +0200, Miquel Raynal wrote:
> A NAND chip is an MTD device. mtd.yaml already defines many useful and
> relevant properties, let's reference this file here to get access to
> these additional property definitions.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
