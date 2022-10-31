Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDA1ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Oct 2022 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWD5yxg2iPH6ja8HyWL8INbibXOGA02ZGNEH2bp1g7o=; b=UUHdmexIgwOuXK
	CMK3uw74Fy0YCDzOKxxUBx6lU7pqnHmD7SBuClfyrWRy5o4UjibVygpp5tdh4Uw9rGkUGSb31shZu
	IBz8+3nIcHZPtUUsudYN9z3bqtB4qB6nJJajbZ/zW+i7wxwTCVhotxBfXdpDFCwshUESknjQw1tMf
	Lm+vi1ImedONuraUb9oamz+uPqdv9lzw+S2LTHum2E3V+4cgs9wYse5PjohVZA9QidZdejoA3qqEJ
	7ghfzKbsglAYUYwWpzjObzrfg3TkqziagzshDFTzNKJaokiTc6F/ufYjZlBRSipSFE4vojXQOQRpE
	zgbBk06PqfTOuUkfd9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opW2d-00CLXv-G5; Mon, 31 Oct 2022 14:45:31 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opW2b-00CLW3-2K; Mon, 31 Oct 2022 14:45:30 +0000
Received: by mail-oi1-f175.google.com with SMTP id t62so2180028oib.12;
        Mon, 31 Oct 2022 07:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn4+1msnko+9e0m7siIGlOveOVoLkD2d39pnfpxZtnk=;
        b=vvF3C55G2teEdkO3wfN5vsXv3IQjtFf+A9cpLctjf3z041Sfy+XKpS+MAlGQ29w0OA
         Nr0sqgN4q/jeiQslQPfL5DeGYNatOmmRKa7T5GzM+shU7c3t9Z7wIPmhC75OxFCVC3hd
         3PMJLP/g4Ryjeo/IxZglfgEeM8YPlrGpoHlsXeEpNbzZsRkM1i0G0vuniMJAkzoA7Hxh
         +p0SUQI3EpOWWTjjqaxbUnk1DL97OdGCShiEIYTkRNYlxyFwNxdabi+4Ob0sWYuggmJ0
         z/0cK90N9AG78FhbhZJ4J9lo9BBPUtt1FUyKaxRgD3NW3qExAtZkis0EYj2sUX99kN0H
         FBzQ==
X-Gm-Message-State: ACrzQf3OYi49rv1WbG/ku30IHuG8XsAiBQdQbPUcSLrd4c5n27f5eWKs
	xFizDrj2i+BrM3Orp7l7J0CUIQdFnQ==
X-Google-Smtp-Source: AMsMyM4H8uQmmu7Jy4YGGytjMaM+JUYHpTj+D7MDv3fs/PXmunvqTxXEzKVvGNE6N6YKT+YNFglZ8Q==
X-Received: by 2002:a05:6808:1a27:b0:354:55e5:9777 with SMTP id bk39-20020a0568081a2700b0035455e59777mr14919019oib.267.1667227526966;
        Mon, 31 Oct 2022 07:45:26 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p5-20020a056870830500b0013b92b3ac64sm3124401oae.3.2022.10.31.07.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 07:45:26 -0700 (PDT)
Received: (nullmailer pid 2860621 invoked by uid 1000);
	Mon, 31 Oct 2022 14:45:28 -0000
Date: Mon, 31 Oct 2022 09:45:28 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>, Vignesh Raghavendra <vigneshr@ti.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Joel Peshkin <joel.peshkin@broadcom.com>, u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>, Conor Dooley <conor.dooley@microchip.com>, Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: mtd: partitions: u-boot: allow
 dynamic subpartitions
Message-ID: <166722752391.2860511.4769510396769806358.robh@kernel.org>
References: <20221018154202.4634-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018154202.4634-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_074529_127546_2B9B9266 
X-CRM114-Status: GOOD (  11.81  )
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

Ck9uIFR1ZSwgMTggT2N0IDIwMjIgMTc6NDI6MDEgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gVS1Cb290
IHBhcnRpdGlvbiBtYXkgY29udGFpbiBzdWJwYXJ0aXRpb25zLiBGb3IgZXhhbXBsZSBCcm9hZGNv
bQo+IGluY2x1ZGVzIGVudmlyb25tZW50IGRhdGEgYmxvY2sgaW4gdGhlIG1pZGRsZSBvZiBpdHMg
VS1Cb290IHBhcnRpdGlvbi4KPiAKPiBUaGlzIGFsbG93cyBkZXNjcmliaW5nIEJyb2FkY29tJ3Mg
VS1Cb290IGVudiBkYXRhIGFuZCB3aWxsIGFsbG93Cj4gcmVmZXJlbmNpbmcgaXRzIE5WTUVNIGNl
bGwgaW4gdGhlIGZ1dHVyZS4KPiAKPiBSZWc6IDExOGYzZmJlNTE3ZjQgKCJkdC1iaW5kaW5nczog
bXRkOiBwYXJ0aXRpb25zOiBzdXBwb3J0IGxhYmVsL25hbWUgb25seSBwYXJ0aXRpb24iKQo+IFJl
ZjogZGQ2MzgyMDJkZmI2NSAoImR0LWJpbmRpbmdzOiBtdGQ6IHBhcnRpdGlvbnM6IGFkZCBhZGRp
dGlvbmFsIGV4YW1wbGUgZm9yIHFjb20sc21lbS1wYXJ0IikKPiBTaWduZWQtb2ZmLWJ5OiBSYWZh
xYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gLS0tCj4gVjM6IEFkZCB0aGlzIHBhdGNo
IGFzIHByZS1yZXF1aXJlbWVudCBmb3IgdS1ib290LGVudi55YW1sICYgYnJjbSxlbnYKPiAtLS0K
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdS1ib290LnlhbWwgICAg
ICAgICB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCgpB
cHBsaWVkLCB0aGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
