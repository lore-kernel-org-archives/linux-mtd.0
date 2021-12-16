Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08737C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 21:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSMKjMroLagF/BPTkNwHiy1CsDteS3a5tDABvRGuzw8=; b=gow4wle5gStqFM
	d/amnY19piFdA7LTRDhgEBc6WBxY7R11IDLIaJtvTVZcMor4D/OhI69WP26HTmQluwfe71HWre1AP
	PGAabpfxwtVq7Pqm3n9RiUxb+1iuAFs30suDg2wpCt7MM1oEyzhDu+JQSl1pdHAlZjFSAjjaj4s51
	0BgMlWWYohqBU75oNbX7rfkdriuvgnt+9sg6bpi2ZVPttm9olrch4IpNKr4VeILA81SjU8QlY0Imi
	OYTcWFz0zMw/IivW9z6ICQtzCzruI2P4PKrcSg6aA/lymjCqx1AtFFQBReRzcisgS8ZjTNyOY+F4h
	DEOoSz/OhMHKQt4zAOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxxzx-007c12-GK; Thu, 16 Dec 2021 21:09:09 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxxzu-007bzi-Go
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 21:09:07 +0000
Received: by mail-oi1-f174.google.com with SMTP id q25so800703oiw.0
 for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2021 13:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=06/jjv/bJmHWFH5eUbQUmPo7yQuVde6Xip0Sorxfb7M=;
 b=KSpYJzTOf43XUQ+WEjpt3zTVpfTHha2vLC8oGMJs+ZR98l1uy0jqdRHXFeYCnAkHBY
 ddsEAtgDlHvz+bcgISmPrEYtrrjcfrpqdh8MPotD5ys6DinrNzY45wC2oMlRTDtyeUIX
 /Ce2zJHNd26uHmbbB+fX1+dLBUXcNXGo7EmMTOztXAGwaqD1f7eZ6xUbDKyEoukM1Lx1
 yt2IN7t5HPbRo0vuMhK6jVeOIibSeDAm21bEbbVKEKRG6OFpjh1McxssdcZPjSDRK7V8
 ff3oDDqbjz7a3dUlI/vv9iPh6P3Pqv9wvU78BclBlIkXCUxNypIri5eb8j6eNxLjJM+J
 XdAg==
X-Gm-Message-State: AOAM5322gp7LXhB1WdM2s8yh+1hsdv0/LTDxR20V34CPNb/Kz6iEDm33
 ZXHYdii9+qD0LfH4KcVy5A==
X-Google-Smtp-Source: ABdhPJyYWmGUU8dkqr2GR0ddHvgpdwaNTc1g8sUB/ahEy63zu3VTYyvBjyCm533wqZrALABZQx1a5g==
X-Received: by 2002:aca:130e:: with SMTP id e14mr5746806oii.51.1639688945201; 
 Thu, 16 Dec 2021 13:09:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e4sm1210472oiy.12.2021.12.16.13.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 13:09:04 -0800 (PST)
Received: (nullmailer pid 766284 invoked by uid 1000);
 Thu, 16 Dec 2021 21:09:04 -0000
Date: Thu, 16 Dec 2021 15:09:04 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Julien Su <juliensu@mxic.com.tw>, Mark Brown <broonie@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v6 03/28] dt-bindings: mtd: nand-controller: Harmonize
 the property types
Message-ID: <Ybuq8AFCd7wC2RLe@robh.at.kernel.org>
References: <20211216111654.238086-1-miquel.raynal@bootlin.com>
 <20211216111654.238086-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216111654.238086-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_130906_594685_17364870 
X-CRM114-Status: GOOD (  10.84  )
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

On Thu, 16 Dec 2021 12:16:29 +0100, Miquel Raynal wrote:
> Harmonize the different properties in this file by:
> * dropping the non-necessary allOf's
> * always defining the keywords in the following order:
>     - first the "description" (when relevant),
>     - then the "type"/"$ref" and the other generic keywords ("enum",
>       "default", etc).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/nand-controller.yaml         | 26 +++++++++----------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
