Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08969C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 19:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6yN7KrW2c/K8aNJLDTPf6JSraHG42SeCiuw81ZX8vc=; b=ZXk/8rxNxDRuru
	CAecCT9zCoafGch4FgNDkCMSMvETkJ2nqiLossk2IYw9BJYAo1AlXJ6GRKYvlJ/umdAcPkEmtsGdw
	4530HFeiJqYc3QqWo8BASBr0tGVzhbE3iW+BbiIfsZRjAw4OV/nsicZaXtdgauMOhtKA8jjSQnG5X
	IkOMF5HzVe1hHAILFfbiIYz6TfxEx4HFr/N3uJKVJMcyD1uOQu8C1L+aZnAXvZ/xxy6PLZSSFinRd
	dYrkF+YPYEYay/5yw9vZmKvRiK95oMlNJqSGL/2UQCtpEP3Wjaut86dOJQziQ6SzoO1Kmiho4Jf9k
	dvvXP6p23esbQXbvY4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDWDK-000Ivi-Fd; Mon, 18 Jul 2022 19:15:30 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDWDA-000InR-CF
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2022 19:15:21 +0000
Received: by mail-il1-f176.google.com with SMTP id f15so3059289ilj.9
        for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2022 12:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OQ2q0XPtbhdDAfmXDFLPzNTItqEfIgwYo8BHW9R3MfY=;
        b=AaAG2Y+M1ldbtGQdq0upXMXS6eoCpm0YDfedGq3jesZyynKcN91/x9V+uY17sJ0ApQ
         p6/Mk8XWvVfOMUCyKVu6dU5RcMZGQnnRxUww39GdZytoniunLua3YhH69o576Hz6732F
         N5e2BuT7J/52/RV0npbmyfd2BI55Vsxyt7eZPd5AHOjwmCUiHVIBQpw/p7EofacTHCLe
         A0fYL5JmKbBk+RhIJ9gxHc+WH0a1vBJgZFF2VL5UQjQfhKU7geJ9g8KjKVLFiH3pKNrA
         0UJPs/bZZAef1QBp9En2rKrPnRuJ/lykiNK82Jat4OzDe/4ytcbXuWSgi1zXWT7S8cX1
         mlmw==
X-Gm-Message-State: AJIora/hKEJZ438XLKNOVcLxhTLW70umOZ9qbPYMN3oFdiWOv2dbI07A
	Jz69bYGOkW/KKCArTNfUtPyWNFJaFg==
X-Google-Smtp-Source: AGRyM1ve70yIXqMpeLWi7yVQdpteGvqMDlMDjRmArBpu+KPLnLSj++gQ5cq8zqeU4X5SbM+lo0rYmg==
X-Received: by 2002:a05:6e02:180f:b0:2dc:7a7d:54e1 with SMTP id a15-20020a056e02180f00b002dc7a7d54e1mr14296819ilv.15.1658171718316;
        Mon, 18 Jul 2022 12:15:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o15-20020a056602124f00b0067c291212e9sm308126iou.9.2022.07.18.12.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 12:15:17 -0700 (PDT)
Received: (nullmailer pid 3375662 invoked by uid 1000);
	Mon, 18 Jul 2022 19:15:16 -0000
Date: Mon, 18 Jul 2022 13:15:16 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, u-boot@lists.denx.de, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mtd: partitions: add binding for U-Boot
 bootloader
Message-ID: <20220718191516.GA3375625-robh@kernel.org>
References: <20220711153041.6036-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220711153041.6036-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_121520_463034_53343452 
X-CRM114-Status: GOOD (  11.64  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxMSBKdWwgMjAyMiAxNzozMDo0MCArMDIwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3Rl
Ogo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBSaWdodCBu
b3cgdGhlcmUgaXMgbm8gKGtub3duKSByZWFsIHJlYXNvbiBmb3IgYSBjdXN0b20gYmluZGluZyBm
b3IKPiBzdGFuZGFyZCBVLUJvb3QgcGFydGl0aW9ucy4gQnJvYWRjb20ncyBVLUJvb3QgaG93ZXZl
ciByZXF1aXJlcyBleHRyYQo+IGhhbmRsaW5nIC0gbG9va2luZyBmb3IgZW52aXJvbm1lbnQgdmFy
aWFibGVzIHN1YmJsb2Nrcy4gVGhpcyBjb21taXQgYWRkcwo+IEJyb2FkY29tIHNwZWNpZmljIGJp
bmRpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdS1ib290LnlhbWwgICAg
ICAgfCA0OSArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRp
b25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3BhcnRpdGlvbnMvdS1ib290LnlhbWwKPiAKClJldmlld2VkLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
