Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1609CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1uxyfOKzpd0Ql/0HjzMUjlmcIe6WIYSI0zfrlrcSPRQ=; b=rHlubZj7HAbFlI
	DzBMft5r7I62Shrl1kgnk9ZbtjDZmD6XMlrH1VhCxf1+2qyRB2ooWHbKsYNa6UCbEVwTVkB0Reb7h
	4qJIzwv5Wz01e+BCyTDdgnLMIHDImhBCIvNzhonJY34sQrTLlratMhSCugQvQVvcbMtidx06QlkNU
	vseGw3d0VPBoNCnapsydqTeDTpVrAKKHOoEZBmR7QADGSXkTgL5RYNDG7GzAWUuvx5iIRZUOZ0umj
	dIlC0DbD010BIhkay+DPbcrO3eihtI2kCOierlSmPCRNTVwAVD2YzGvIa8C/E4XbkGKEryaRLxLxs
	cels62n7UXy9IvN9s0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nblTu-001map-Sw; Tue, 05 Apr 2022 15:52:34 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nblTj-001mYt-Ll; Tue, 05 Apr 2022 15:52:24 +0000
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso14906574fac.0; 
 Tue, 05 Apr 2022 08:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=73sr+mzCEmuVDVSdm+EpGuiiOfdHmYopaGe2xWN1rOQ=;
 b=bfIBH3O08HsXuM3OdD5uW4ahG7T8DoMZyp+Y+9UwF6njeMfo3ymbEwSoXa/oXKXbGy
 aZCpn1ScCwr/ejiHXi/mQQXuHh49qSZOShEIkYBKYxWo/bIIgsNIhUpzaXWGNEMma0kf
 hKebPm7VElS1mbKY0+pb8HHJMh6O/BCaVMK4314HrNgEtmdtNliXKVhFc3ggP3nXtdot
 jtJK1oWudBLCwR5QLadQ6ulifTEK2am4A6EIV+UWAjqRg/McpqRjl5SOwZ4D9hMWKxiz
 jfSttzaTo47iPkbTj7iGUP3Rcwl0IY6JQgA23vMQi9GZg38eR0lOFJOpfLNTYqiCy6q+
 NBlw==
X-Gm-Message-State: AOAM532mWtTeFJz6dA/OtYXMJKjgItfWLtaTp1LUDy2QBtUIFhBOc3pz
 hG9bVZ8NGowPrafDszJoyw==
X-Google-Smtp-Source: ABdhPJxNSzVmokJVTPd1XNB16cHa14S7IaMy1MJZPXDKNndI7oIgOU3kFQsdma7sT8pY4vAAcBr/KA==
X-Received: by 2002:a05:6870:f149:b0:dd:f3b0:986d with SMTP id
 l9-20020a056870f14900b000ddf3b0986dmr1904739oac.148.1649173940623; 
 Tue, 05 Apr 2022 08:52:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 2-20020a056870124200b000dd9ac0d61esm5524206oao.24.2022.04.05.08.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 08:52:19 -0700 (PDT)
Received: (nullmailer pid 3284623 invoked by uid 1000);
 Tue, 05 Apr 2022 15:52:17 -0000
Date: Tue, 5 Apr 2022 10:52:17 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org,
 Cai Huoqing <cai.huoqing@linux.dev>, Roger Quadros <rogerq@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, linux-mediatek@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 4/5] dt-bindings: spi: add binding doc for spi-mtk-snfi
Message-ID: <YkxlsU+P33ip2oWH@robh.at.kernel.org>
References: <20220404131818.1817794-1-gch981213@gmail.com>
 <20220404131818.1817794-5-gch981213@gmail.com>
 <1649088538.050456.1436949.nullmailer@robh.at.kernel.org>
 <CAJsYDVLaXAoL=TcPun6rckcA_cdUS-zFy_7M6uCpfzX+jbQEag@mail.gmail.com>
 <20220405092024.25d97c33@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405092024.25d97c33@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_085223_748851_EBFF41D5 
X-CRM114-Status: GOOD (  20.60  )
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

On Tue, Apr 05, 2022 at 09:20:24AM +0200, Miquel Raynal wrote:
> Hello,
> 
> gch981213@gmail.com wrote on Tue, 5 Apr 2022 10:55:51 +0800:
> 
> > Hi Rob!
> > 
> > On Tue, Apr 5, 2022 at 12:09 AM Rob Herring <robh@kernel.org> wrote:
> > > [...]
> > > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.example.dt.yaml: spi@1100d000: 'ecc-engine' is a required property
> > >         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> > > Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.example.dt.yaml:0:0: /example-0/soc/spi@1100d000/flash@0: failed to match any schema with compatible: ['spi-nand']  
> > 
> > I ran the tests myself and it's only complaining about the ecc-engine name:
> > 
> > /home/user/src/kernels/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.example.dtb:
> > spi@1100d000: 'ecc-engine' is a required property
> > From schema: /home/user/src/kernels/linux/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
> > 
> > It says nothing about the spi-nand part.

Did you use 'DT_CHECKER_FLAGS=-m' as it says above?

> > I'd like to keep the flash@0 node in the example to demonstrate the
> > nand-ecc-engine usage. What should I do?
> 
> You can try including spi-nand.yaml (like you do with
> spi-controller.yaml). You should no longer need to define
> nand-ecc-engine then as it is already described there?

Including spi-nand.yaml is wrong. If that just landed, then this may 
have run before the base moved to v5.18-rc1.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
