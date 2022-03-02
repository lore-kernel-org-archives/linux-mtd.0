Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3098BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 22:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ofi86kt9GVnBRv2adaQk5QxgbAzl4yvf4vjsu1zEdDY=; b=rYETYZslvYmwJy
	9zNtxrsiSb6W1EaN1EDLNsXLgJQuHYMHytpnEHqPP4Rudg6VzfzO32w5WpgtknhL+6DveetXs5IpN
	q2CcrVLbpZtXBfSCowMnx0rRJ7sCaZawbPmX6QCxXRB9PJVCXoeJ34QogFZYvSbG1XpG1eTlZJuCs
	v7DROQj+odcPrNIJDPFlXqeoX01OnbTjLs68EHbiu2rrBtJbnQ7UI5jzsSrtbXkMTYrj5nhaBu3n5
	PmdpHykwu4Wsa4g98TFqbyP4vkK9wlr0k48cZCtEL63a4jn9CGzW9gEJjwTnuJexwSJXCuMcKafYm
	vN6gjaCytdF6bSPu6m8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPX0R-004RMq-Ur; Wed, 02 Mar 2022 21:59:36 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPX0O-004RLa-74
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2022 21:59:33 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so3561094oos.9
 for <linux-mtd@lists.infradead.org>; Wed, 02 Mar 2022 13:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Qu1UuB2p88jejBUeTppCLZmThyB2NBuh2qoIYxclrJ0=;
 b=NQrEZleBfOmivug6YNkaOlro4UTisybFKSxZINMXz6ca34YwpjU1DniSzQq7s45qCP
 Ra+l2GukoxGTOo8OQFvzpk6EvNjtDrEIzcoopD1wSAyCeh4SH0bsXoGXUAaP47B7nEFq
 ul/45Vz67JNQLGfMBPnvzxleGVwr9n/TuhzyueDVEabe/Wl62wSsf2j5koxXNCrrHYJO
 VzYHxIw98G7epXKvLOCY4BQ9Mfp9QPelgvxYQ/5gi+ToxQ58jakahvlLjSkBx45KqZcN
 NyiLtbHuDEWnPhU+FPPTrUxGX7jQzCldKM/E+TRktCK1Ewqy9+Msnru+0ME3F8gEcbho
 KgYQ==
X-Gm-Message-State: AOAM531DInlEuOxnqMHbYO+vXkumtlroPiho8mk6tiCYSIShSIbBNTIb
 eSHpMRfg7lXU8SUuhUkkFw==
X-Google-Smtp-Source: ABdhPJyx91JNIzn6Cs8BTFJCDX9woUE85mryXqEj9TpESgDFUDa6M10DSB6TiCbbfyh1zYVWrMO45w==
X-Received: by 2002:a05:6870:c05:b0:d6:fa9f:bcd1 with SMTP id
 le5-20020a0568700c0500b000d6fa9fbcd1mr1663709oab.108.1646258368953; 
 Wed, 02 Mar 2022 13:59:28 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 l14-20020a4ac60e000000b002e0e75dcb82sm98740ooq.12.2022.03.02.13.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 13:59:26 -0800 (PST)
Received: (nullmailer pid 133360 invoked by uid 1000);
 Wed, 02 Mar 2022 21:59:25 -0000
Date: Wed, 2 Mar 2022 15:59:25 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tom Rini <trini@konsulko.com>, Ricardo Salveti <ricardo@foundries.io>,
 Michal Simek <michal.simek@xilinx.com>,
 Jorge Ramirez-Ortiz <jorge@foundries.io>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: mtd: partitions: add UBI binding
Message-ID: <Yh/ovYMV104jc+CE@robh.at.kernel.org>
References: <20220217102448.27586-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217102448.27586-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_135932_280148_DC364A9B 
X-CRM114-Status: GOOD (  21.84  )
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

T24gVGh1LCBGZWIgMTcsIDIwMjIgYXQgMTE6MjQ6NDhBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBV
QkkgaXMgb2Z0ZW4gdXNlZCBvbiBlbWJlZGRlZCBkZXZpY2VzIHRvIHN0b3JlIFVCSSB2b2x1bWVz
IHdpdGggZGV2aWNlCj4gY29uZmlndXJhdGlvbiAvIGNhbGlicmF0aW9uIGRhdGEuIFN1Y2ggdm9s
dW1lcyBtYXkgbmVlZCB0byBiZSBkb2N1bWVudGVkCj4gYW5kIHJlZmVyZW5jZWQgZm9yIHByb3Bl
ciBib290ICYgc2V0dXAuCj4gCj4gU29tZSBleGFtcGxlczoKPiAxLiBVLUJvb3QgZW52aXJvbm1l
bnQgdmFyaWFibGVzCj4gMi4gRGV2aWNlIGNhbGlicmF0aW9uIGRhdGEKPiAzLiBEZWZhdWx0IHNl
dHVwIChlLmcuIGluaXRpYWwgcGFzc3dvcmQpCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1p
xYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbXRkL3BhcnRp
dGlvbnMvdWJpLnlhbWwgICAgICAgICAgfCA2NyArKysrKysrKysrKysrKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLnlhbWwKPiAKPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL3ViaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0
aXRpb25zL3ViaS55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
MDAuLmNkMDgxZjA2ZDRjYgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdWJpLnlhbWwKPiBAQCAtMCwwICsxLDY3
IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL210ZC9wYXJ0aXRpb25zL3ViaS55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBVQkkgKFVuc29y
dGVkIEJsb2NrIEltYWdlcykgZGV2aWNlCj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICsgIFVCSSBp
cyBhIGxheWVyIHByb3ZpZGluZyBsb2dpY2FsIHZvbHVtZXMgKGNvbnNpc3Rpbmcgb2YgbG9naWNh
bCBibG9ja3MpIG9uIHRvcAo+ICsgIG9mIHJhdyBmbGFzaCBkZXZpY2VzLiBJdCBkZWFscyB3aXRo
IGxvdy1sZXZlbCBmbGFzaCBpc3N1ZXMgKGJpdC1mbGlwcywgYmFkCj4gKyAgcGh5c2ljYWwgZXJh
c2VibG9ja3MsIHdlYXJpbmcpIHByb3ZpZGluZyBhIHJlbGlhYmxlIGRhdGEgc3RvcmFnZS4KPiAr
Cj4gKyAgVUJJIGRldmljZSBpcyBidWlsdCBhbmQgc3RvcmVkIGluIGEgc2luZ2xlIGZsYXNoIHBh
cnRpdGlvbi4KPiArCj4gKyAgU29tZSAodXN1YWxseSBlbWJlZGRlZCkgZGV2aWNlcyB1c2UgVUJJ
IHZvbHVtZXMgb2Ygc3BlY2lmaWMgbmFtZXMgb3IgaW5kZXhlcwo+ICsgIHRvIHN0b3JlIHNldHVw
IC8gY29uZmlndXJhdGlvbiBkYXRhLiBUaGlzIGJpbmRpbmcgYWxsb3dzIGRlc2NyaWJpbmcgc3Vj
aAo+ICsgIHZvbHVtZXMgc28gdGhleSBjYW4gYmUgaWRlbnRpZmllZCBhbmQgcmVmZXJlbmNlZCBi
eSBjb25zdW1lcnMuCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIFJhZmHFgiBNacWCZWNraSA8
cmFmYWxAbWlsZWNraS5wbD4KPiArCj4gK2FsbE9mOgo+ICsgIC0gJHJlZjogcGFydGl0aW9uLnlh
bWwjCj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBjb25zdDogdWJp
Cj4gKwo+ICtwYXR0ZXJuUHJvcGVydGllczoKPiArICAiXnZvbHVtZS1bMC05YS1mXSskIjoKPiAr
ICAgIHR5cGU6IG9iamVjdAo+ICsgICAgZGVzY3JpcHRpb246IFVCSSB2b2x1bWUKPiArICAgIHBy
b3BlcnRpZXM6Cj4gKyAgICAgIHZvbHVtZS1uYW1lOgo+ICsgICAgICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0cmluZwo+ICsgICAgICB2b2x1bWUtaWQ6Cj4gKyAg
ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gKyAg
ICBhbnlPZjoKPiArICAgICAgLSByZXF1aXJlZDoKPiArICAgICAgICAgIC0gdm9sdW1lLW5hbWUK
PiArICAgICAgLSByZXF1aXJlZDoKPiArICAgICAgICAgIC0gdm9sdW1lLWlkCj4gKwo+ICt1bmV2
YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAg
IHBhcnRpdGlvbnMgewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7
Cj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgI3NpemUtY2VsbHMg
PSA8MT47Cj4gKwo+ICsgICAgICAgIHBhcnRpdGlvbkAwIHsKPiArICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJ1YmkiOwo+ICsgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwIDB4MTAwMDAwMD47
Cj4gKyAgICAgICAgICAgIGxhYmVsID0gImZpbGVzeXN0ZW0iOwo+ICsKPiArICAgICAgICAgICAg
ZW52OiB2b2x1bWUtMCB7Cj4gKyAgICAgICAgICAgICAgICB2b2x1bWUtbmFtZSA9ICJ1LWJvb3Qt
ZW52IjsKCldoeSBub3QgZG8gJ2NvbXBhdGlibGUgPSAidS1ib290LGVudiI7JyB0byBhbGlnbiB3
aXRoIG5vcm1hbCBwYXJ0aXRpb25zPwoKT3IgJ2xhYmVsJz8KCldlIGhhdmUgZW5vdWdoIHdheXMg
dG8gaWRlbnRpZnkgdGhpbmdzLCBJIGRvbid0IHRoaW5rIHdlIG5lZWQgYW5vdGhlci4KCj4gKyAg
ICAgICAgICAgIH07Cj4gKwo+ICsgICAgICAgICAgICBjYWxpYnJhdGlvbjogdm9sdW1lLTEgewoK
QXJlIDAgYW5kIDEgbWVhbmluZ2Z1bCBvciBqdXN0IG1hZGUgdXAgaW5kZXhpbmc/Cgo+ICsgICAg
ICAgICAgICAgICAgdm9sdW1lLWlkID0gPDk5PjsKPiArICAgICAgICAgICAgfTsKPiArICAgICAg
ICB9Owo+ICsgICAgfTsKPiAtLSAKPiAyLjM0LjEKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
