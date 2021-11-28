Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D889C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Nov 2021 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYakYMmr2tEiNVxIkTCfdnStguz2eZfU6XMTFTHdimc=; b=RdzS4EtrKp2J0X
	sPS6ArmSi8fGXMioiBkLuw4iDylyUI0Oy0uYEtg7dQesyQHDZrCgj53BVy4xULVpxfFNvTNSNVWWr
	SqpypNohCKzGO7ichdwtejCGsLTd4Q/bLXMl71JvyH19tyQUyK9u5X46Ga4FKskBRXm4cao4ZkGzZ
	4r5nTtRFWKV/paMtQp8mkWdwmSDLDkkTQyq+SFQAr5YWKC8ETM+jDGh7drwTRt+M5EXPhIMEqj8wD
	s7MXpzp2Fh6EjYaaz626p8Xk5fj60QSq8iO+uw2N10kOogV92USmANCdaYs9g3um06bvWoArV+ukC
	0YwMwEQzOnhIMCL+TrgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrNSO-00GGv7-T5; Sun, 28 Nov 2021 16:55:16 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrNSK-00GGuM-J6
 for linux-mtd@lists.infradead.org; Sun, 28 Nov 2021 16:55:13 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so22063794otv.9
 for <linux-mtd@lists.infradead.org>; Sun, 28 Nov 2021 08:55:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Kx4mjHYh3JbxTIKV4lb6j/qBNb/1oR0ibaR7m8wF84=;
 b=1o6KUCecO9aQ4Jv8sjcHR8cK8H9dWuCoh/kchLMKNwbWgenpwX9c7XlLmvg8iRbYKK
 xA7JW0zVtLIyXMPzedrivCPIX5Dh6SMrgCabtQyTRLgdmPbChhZe9V9bABppVrsM31js
 Jl8gI18VyOFnCMCOKYoXqAbKxAE5LtOZYMlHivSjd6EdVSVKYidN6eQIeKbMd051yCqM
 yhrDVcRwe41cltQwqaQ8MBsKy6aUs3Z7i5Ei1uqP3cIKi1iRd6zU4OtNaSvbRjSCf4OI
 RsomfTps4lRQLv+SH358KvkYYc2lpLlPwlM2iyllTDoLSxM6dA4QQiHRksgtacfqF5KR
 FvGg==
X-Gm-Message-State: AOAM531aCf4oz+eZimXXgrqdi4Y9TI39xN3k0osiSGYQn7XMZyJVbagk
 zAOUscIg4vRcrsEs7g2Pdg==
X-Google-Smtp-Source: ABdhPJzH+fMrufpgBICy1lv/D36s6g3VY8c0AiVKM2GIpW7BfPG91KQD8bigrq9CNfmGjd4PMkzL1Q==
X-Received: by 2002:a9d:12f2:: with SMTP id
 g105mr39803123otg.301.1638118511627; 
 Sun, 28 Nov 2021 08:55:11 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d6:afc8:f6e9:d57a:3e26:ee41])
 by smtp.gmail.com with ESMTPSA id
 w5sm2159875otk.70.2021.11.28.08.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 08:55:10 -0800 (PST)
Received: (nullmailer pid 2710081 invoked by uid 1000);
 Sun, 28 Nov 2021 16:55:06 -0000
Date: Sun, 28 Nov 2021 10:55:06 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-spi@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 5/5] spi: dt-bindings: Add an example with two stacked
 flashes
Message-ID: <YaO0ahOhM3XwLqND@robh.at.kernel.org>
References: <20211126163450.394861-1-miquel.raynal@bootlin.com>
 <20211126163450.394861-6-miquel.raynal@bootlin.com>
 <1638054802.100671.1973542.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1638054802.100671.1973542.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_085512_658348_5FA7F59A 
X-CRM114-Status: GOOD (  11.76  )
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

On Sat, Nov 27, 2021 at 04:13:22PM -0700, Rob Herring wrote:
> On Fri, 26 Nov 2021 17:34:50 +0100, Miquel Raynal wrote:
> > Provide an example of how to describe two flashes in eg. stacked mode.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/spi/spi-controller.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/spi/spi-controller.example.dts:40.23-45.15: Warning (spi_bus_reg): /example-0/spi@80010000/flash@2,3: SPI bus unit address format error, expected "2"

Unit-addresses are based on the first reg entry.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
