Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25CAC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 19:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqp3iQMqUxhG5rJzAWVsKiFoCa85ReNzJaynsv/+gVA=; b=aCqZMIoXY5PLG6
	wO56IErufnUv2wPZHBsOQGlA5FZHAPKElr5XoJKvn2Bugbw9N0XcwcZh91bCxHSUBhFnnbBb1ljy8
	3H/0wGra3xFPGvuhqjsaVp/lYQ/NM3yXvL96wr5UoNEJtjCuczMuWoo6ybnIC0WSbBMnOjaJtgsH2
	hIC4rMhnbh7lVT/luXM12TVy8EGmsbFscjoxZ1J7sA4wqlwTVlvNJtEQk3VbE7sE6wAezFh+4RuPm
	PC89arT3gSRMekHYWBosAPV/S5IxuqwMzjpkaWWWM2ODgTiKH2NlOyVBU67aVU1JVgjmKr3vvC8OV
	6+BG2ZTYC4BmuV99kAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6H8x-007sKi-2L; Tue, 28 Jun 2022 19:45:03 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6H8t-007sJM-M1
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2022 19:45:00 +0000
Received: by mail-il1-f175.google.com with SMTP id o4so8855637ilm.9
        for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2022 12:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I8oqYF8CYF/NfPnLUHRXbuyYwNz4NY7b0UEaAoOBFKI=;
        b=adGobuU+jVgmV4vSX4jw70GxoEFGgXx9icpM+qfU677Z6VL5el4diqppyCUiBb3kGq
         iMfmJhvdtw/4WThf4b6TrtNcNOsvrEpijIpupz18QLkxpI948bsqwM4raWKrjSQAFN+n
         ++I8U+PNPDrzjo1kIcwrM3ULlJRB7W9sVBvEOPBdCYcvdhd1DRSgdqlWcQosjFyG+UPK
         I7WbNLPXDI0f3eUBI0ro0qGn3lAWWgtzJY7JuXAKRRoCnkP/YYtRru2rCq0ccpySHOiq
         TA79ZRrItfiPZgpGeKRCETGR44TxgAYqX4/y9RBGiw3zR+9djtXOm/Sz6tLszeLcizkr
         Acyw==
X-Gm-Message-State: AJIora+wbFpNllhNtQaMXs3ND8TQXrc7QBDaS/6jBkH365Dpa6eVS9xf
	m0mN6l35XVrurI78AyvlqCrC2gjnCQ==
X-Google-Smtp-Source: AGRyM1txmib4nODs+eTLxrl5HRxMhZB1byUNtBdxp/31Zmns7iKmug7AOiZqEys9+SGEZanmP8UxbQ==
X-Received: by 2002:a92:6603:0:b0:2da:82b6:34a3 with SMTP id a3-20020a926603000000b002da82b634a3mr9166995ilc.250.1656445498116;
        Tue, 28 Jun 2022 12:44:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k15-20020a02a70f000000b00331b9a3c5adsm6357712jam.170.2022.06.28.12.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 12:44:57 -0700 (PDT)
Received: (nullmailer pid 863361 invoked by uid 1000);
	Tue, 28 Jun 2022 19:44:55 -0000
Date: Tue, 28 Jun 2022 13:44:55 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: =?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: partitions: support label/name
 only partition
Message-ID: <20220628194455.GA863329-robh@kernel.org>
References: <20220622010628.30414-1-ansuelsmth@gmail.com>
 <20220622010628.30414-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220622010628.30414-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_124459_759724_7530891F 
X-CRM114-Status: GOOD (  18.44  )
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

On Wed, 22 Jun 2022 03:06:26 +0200, Christian Marangi wrote:
> Document new partition nodes that declare only the label/name instead
> of the reg used to provide an OF node for partition registred at runtime
> by parsers. This is required for nvmem system to declare and detect
> nvmem-cells.
> 
> With these special partitions, the reg / offset is not required and a
> 'partition-' prefix is needed.
> The node name with the 'partition-' prefix stripped, is used to match
> the partition allocated by the parser at runtime and the parser will
> provide reg and offset of the mtd.
> If the partition to match contains invalid char for a node name, the
> label binding can be used to declare the partition name.
> 
> NVMEM will use the data from the parser and provide the NVMEM cells
> declared in the DTS, "connecting" the dynamic partition with a
> static declaration of cells in them.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/mtd/partitions/partition.yaml    | 20 +++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
