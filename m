Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4A9C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Feb 2022 22:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ps51C0242Uk3zeJkRz3DaYEN9kuTj/Tq6ylvaWosHxU=; b=G5dCMD2TyNaOUT
	27IQlUh/Xpvr4e57V29usHEfJlqK6MsfQ9TGf9F6w4proZ7ntKFay/kIAIFDJyXaMw/zH7LNQ8dJF
	beoJgCONViU5MEuhxcPe9NiTOltKtTiEhCy7iNuJ9TtRXm8gT3c4L6rg0ddEb8v/OkR/p29nv37fA
	TvGMQe/RzbPfLhp+HTj5NziQu59ixKn9ivDZQJEsxqQKX+Xb+28Q7Hd5qmRdevltl7XorFXtuXkvc
	ymey6XoltU8ZvLPUnCG0v5h7FGTj1iuFUAx3aLhYGOjLtkKk22m0Gq1mi4zXYUzHOY/CDcOCNIM5w
	84oXSC3dO9SBw/nv/dUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG6wJ-005YYS-Po; Fri, 04 Feb 2022 22:20:23 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG6wG-005YWg-G8
 for linux-mtd@lists.infradead.org; Fri, 04 Feb 2022 22:20:21 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 s6-20020a0568301e0600b0059ea5472c98so6105558otr.11
 for <linux-mtd@lists.infradead.org>; Fri, 04 Feb 2022 14:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sxZ5ZOHefV7TGCMx3CC+93djt+kWiLe2HpCoDPruzGA=;
 b=2DGbmXRbmsnURbJPEvacGjSQlrTvQm2BNCBQfVoe4SOPkTPe9oReC1RzDow/5BeyyT
 sHRimL+YdxaB7wDXatKuPVkOLAiJotF9py7AC00+h+pjl56iw/B05BVqSWZygDVGhaR0
 OXZjz8fMI6BakJaKtToICzCzHMynthe9GmRcXp+BnoYeHb6v+dqm4DLf3NxUdaOmSJBr
 fO8i2EDrJD2iCSW6Sa1a+PpVn0rlqDFxDXwBqPgGyS+66AJ0oGSjV4MOdVgN6wCYQqNK
 YT+c9/TsBPWx5IPBvlicxDt/kMBGZvwZq45nEJHTzXaeMs0aQcYqLCR9gNagqtAmYWWx
 hh9Q==
X-Gm-Message-State: AOAM533zTBJEtzJdCCSbUR4lTvi9FcbLZoJjTUqhe5Qc9s1cwfeVKLFg
 EO8Cp7t+3c5wRmStqpPOaA==
X-Google-Smtp-Source: ABdhPJzmUGS+U+icdKSfT+qh3JXJL3R+DgctsifiOiN2IRDb0ToL/KPxtgMyUZ1Qg1jPdQPwlcqHWQ==
X-Received: by 2002:a9d:69d1:: with SMTP id v17mr407535oto.183.1644013218309; 
 Fri, 04 Feb 2022 14:20:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f20sm1270009ooh.10.2022.02.04.14.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 14:20:17 -0800 (PST)
Received: (nullmailer pid 3284346 invoked by uid 1000);
 Fri, 04 Feb 2022 22:20:16 -0000
Date: Fri, 4 Feb 2022 16:20:16 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Michael Walle <michael@walle.cc>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Mark Brown <broonie@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-spi@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v6 2/3] spi: dt-bindings: Describe stacked/parallel
 memories modes
Message-ID: <Yf2moBgtTRSrkmD3@robh.at.kernel.org>
References: <20220126112608.955728-1-miquel.raynal@bootlin.com>
 <20220126112608.955728-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126112608.955728-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_142020_545970_923356C1 
X-CRM114-Status: GOOD (  10.60  )
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

On Wed, 26 Jan 2022 12:26:06 +0100, Miquel Raynal wrote:
> Describe two new memories modes:
> - A stacked mode when the bus is common but the address space extended
>   with an additinals wires.
> - A parallel mode with parallel busses accessing parallel flashes where
>   the data is spread.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  .../bindings/spi/spi-peripheral-props.yaml    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
