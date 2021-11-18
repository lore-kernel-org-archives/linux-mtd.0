Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142D7C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 22:24:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9502561139
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Nov 2021 22:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9502561139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WefEVQ9cSIAul210WN5oZRzNeUVwPFQkjvgY4xVXG0k=; b=POJKYAax6Z7xpw
	bjy2UjLu8lGT5RVW7qaLuk0UPPOJzSQgRGgNQyJQQnPwVtJc0VM+/gkx2qD0tY5//QGREztZe3eJl
	/lXqKblqIDQqjsTOkg9/cE4QAuUNJ+ZB3i0qbtwwIx5I1lDwWQx1K9MEtDUs9Vw/ClaIrBUayliVa
	Kq3qpH0kcIcHf6clNi9Lgmob9bQhaVsIEHvrZ5qZBhiDLC4nhxXXN+pTTRlNx8VyBRg1e4oe46HNg
	UhiDdvYwpA4Ax4HU7hG69kUV18ozFbIWEaUblGT924btb2P/zUSjw7B2ORE0Xyhioj9HBs2ZmQFWm
	ao8x/pbLbJrdYvMPdMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnpoY-008xfD-3i; Thu, 18 Nov 2021 22:23:30 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnpoU-008xeT-GF
 for linux-mtd@lists.infradead.org; Thu, 18 Nov 2021 22:23:27 +0000
Received: by mail-oi1-f176.google.com with SMTP id be32so17444066oib.11
 for <linux-mtd@lists.infradead.org>; Thu, 18 Nov 2021 14:23:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OsaV9L6ypm1eFtYxy97Ih2+Ie2rmYMcatbNwYzIQHN8=;
 b=N3xNbLPAryDpWw2Tflu1VWWWd/Yje0i9wqycs/S+CdihoD4caxQPT4UQhAcZzMm4U/
 hd0QOGQ7cTPc8zhAYyINgSnjpVUiHBzboMWsbeb0+4Qd43/Vg+z8MOydf8gI6HX2e8hj
 37Kfdsytzc2+McIjDc9J9cSETIB49D2Qx4wxSXdzRgCIs1LViyM2V1rTiBD88KBOwHVJ
 MT42Q+HgCRehGIkQh631y8IOQMOObGFJcbxTU7UUKOYlDG1BfwfTxm6F9l2IZk3H30LN
 vsedz8sml3gTf8afMVKaL/UjKou5nlSYh68TAfSZU8y3awNEjxJLAsxYH2q3X4hIRFsF
 Cmvg==
X-Gm-Message-State: AOAM5337Rkh2XbOEyYoj/cekKHAYOFigpscCOXrL+1RLMnzNHXhDhtkc
 CbxmGwE4DvDwS6dy2INKFw==
X-Google-Smtp-Source: ABdhPJwQaIQluWZ/UijkBOhentEr+irUw5GrTqdmEFrli8Wr1pQp9SGbS6LlABDbK/j6nU86G/VHdw==
X-Received: by 2002:a05:6808:9ae:: with SMTP id
 e14mr445604oig.68.1637274201868; 
 Thu, 18 Nov 2021 14:23:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n23sm244380oic.26.2021.11.18.14.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 14:23:21 -0800 (PST)
Received: (nullmailer pid 1864118 invoked by uid 1000);
 Thu, 18 Nov 2021 22:23:20 -0000
Date: Thu, 18 Nov 2021 16:23:20 -0600
From: Rob Herring <robh@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 1/3] spi: dt-bindings: add schema listing
 peripheral-specific properties
Message-ID: <YZbSWA5kSfORSzky@robh.at.kernel.org>
References: <20211109181911.2251-1-p.yadav@ti.com>
 <20211109181911.2251-2-p.yadav@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109181911.2251-2-p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_142326_574189_8B69B1C9 
X-CRM114-Status: GOOD (  25.84  )
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

On Tue, Nov 09, 2021 at 11:49:09PM +0530, Pratyush Yadav wrote:
> Many SPI controllers need to add properties to peripheral devices. This
> could be the delay in clock or data lines, etc. These properties are
> controller specific but need to be defined in the peripheral node
> because they are per-peripheral and there can be multiple peripherals
> attached to a controller.
> 
> If these properties are not added to the peripheral binding, then the
> dtbs check emits a warning. But these properties do not make much sense
> in the peripheral binding because they are controller-specific and they
> will just pollute every peripheral binding. So this binding is added to
> collect all such properties from all such controllers. Peripheral
> bindings should simply refer to this binding and they should be rid of
> the warnings.
> 
> There are some limitations with this approach. Firstly, there is no way
> to specify required properties. The schema contains properties for all
> controllers and there is no way to know which controller is being used.
> Secondly, there is no way to restrict additional properties. Since this
> schema will be used with an allOf operator, additionalProperties needs
> to be true. In addition, the peripheral schema will have to set
> unevaluatedProperties: false.
> 
> Despite these limitations, this appears to be the best solution to this
> problem that doesn't involve modifying existing tools or schema specs.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes in v3:
> - s/slave/peripheral/g
> - Drop the | on description.
> - Drop the compatible property.
> 
> Changes in v2:
> - Move other subnode properties listed in spi-controller.yaml to
>   spi-slave-props.yaml
> - Move the Cadence controller-specific properties out of
>   spi-slave-props.yaml. They will be added in a separate file.
> - Add a reference to spi-slave-props.yaml in spi-controller.yaml.
> - Update description.
> 
>  .../bindings/spi/spi-controller.yaml          | 69 +--------------
>  .../bindings/spi/spi-peripheral-props.yaml    | 87 +++++++++++++++++++
>  2 files changed, 89 insertions(+), 67 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
