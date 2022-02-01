Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6283FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Feb 2022 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpY3+Di/5T7iDJFm3wdNhka/J2HpvKeExEtxM5Rkczo=; b=CYXgCcxx3U7hBl
	9DEVU+3FEeIadxnlDuYyTwHlxn1xJYl7K7xotvc613xAdV94HGpfEysrCC0FM19PIZh8/OM0aTiEc
	H3jYB2NYhxcI8DwWGu7PX5yp8OgrW62YCWWuqAbsPhbVSz4b39D2MhgkCmZSEoRrw9MEc2APyWzOF
	awTBo7themieFsCL9CsbrO5o1V573anRvQeygKgOV2Gh5tQbw3YxdDPdg+wAasxzGPdMceJTcKvht
	iSjWgTq9JyeLOvU5KXtXMRvcJANeT0JuDLey4BKI0Wn8o1ZBkx0frB0h4Y4Bik3K6EzSHgz0iWyRN
	1cyovq+fjW3dPrMU1JAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEvVB-00ClnZ-7h; Tue, 01 Feb 2022 15:55:29 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEvV8-00ClmG-5R; Tue, 01 Feb 2022 15:55:27 +0000
Received: by mail-oi1-f169.google.com with SMTP id b186so27945897oif.1;
 Tue, 01 Feb 2022 07:55:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BIOHVYrkUV2xJeNiNC056YPJOZ8/TdHWrOUE5wcAtsg=;
 b=AsXYj2gSd8VXqgAUtxnefE/TjqE8ne7twWF3wzLqPjq1qsruB9RSOcKSkjYfzK15ht
 IXucwlO6sQt5TnKAef7iNYzjprMwKdZAeSDcT7DykhM5n+nz36V30ew6BzTvE1lLOsvd
 6jH51SxwN4YHngQE/k3tKIjahVv5ZE3lgfA2Bg7JtEEfcrcGImNh+3/sJN0uM5kOKXfN
 WhgVSPvZ8U15zkgx8F21//vSDWFr+S0qHR67eUP7D0qHWQJh/BUFonX8XP6g4cw5IJnT
 7Lqc8e6fPR1QcX6+9fW+xZ+9ef/F9R/dxv1JLVI9UuXdq/om4XC6Q9B6Qd+WgqsJq5Py
 7oVg==
X-Gm-Message-State: AOAM532QvWOk66r2T+RCFylNVn+o6bEcpTHlU94jH3i+ing6opc8J1Rh
 tCpjCq5ebbsCj0DaisBOIF6mDxPdbQ==
X-Google-Smtp-Source: ABdhPJxBrh/ir0cmOW9wJ0tFhEtPE2+p0SLWpOeItg+jaohY58A/07Nx1NrilC1u3e7v5UKhgu1fBQ==
X-Received: by 2002:a05:6808:3098:: with SMTP id
 bl24mr1677697oib.312.1643730924088; 
 Tue, 01 Feb 2022 07:55:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q14sm17568505otg.77.2022.02.01.07.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 07:55:23 -0800 (PST)
Received: (nullmailer pid 100417 invoked by uid 1000);
 Tue, 01 Feb 2022 15:55:22 -0000
Date: Tue, 1 Feb 2022 09:55:22 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH REBASED 2/2] dt-bindings: nvmem: cells: add MAC address
 cell
Message-ID: <YflX6kxWTD6qMnhJ@robh.at.kernel.org>
References: <20220125180114.12286-1-zajec5@gmail.com>
 <20220126070745.32305-1-zajec5@gmail.com>
 <20220126070745.32305-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126070745.32305-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_075526_237325_B0FC3609 
X-CRM114-Status: GOOD (  23.73  )
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

T24gV2VkLCBKYW4gMjYsIDIwMjIgYXQgMDg6MDc6NDVBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBU
aGlzIGFkZHMgc3VwcG9ydCBmb3IgZGVzY3JpYmluZyBkZXRhaWxzIG9mIE5WTUVNIGNlbGwgY29u
dGFpbmluZyBNQUMKPiBhZGRyZXNzLiBUaG9zZSBhcmUgb2Z0ZW4gZGV2aWNlIHNwZWNpZmljIGFu
ZCBjb3VsZCBiZSBuaWNlbHkgc3RvcmVkIGluCj4gRFQuCj4gCj4gSW5pdGlhbCBkb2N1bWVudGF0
aW9uIGluY2x1ZGVzIHN1cHBvcnQgZm9yIGRlc2NyaWJpbmc6Cj4gMS4gQ2VsbCBkYXRhIGZvcm1h
dCAoZS5nLiBCcm9hZGNvbSdzIE5WUkFNIHVzZXMgQVNDSUkgdG8gc3RvcmUgTUFDKQo+IDIuIFJl
dmVyc2VkIGJ5dGVzIGZsYXNoIChyZXF1aXJlZCBmb3IgaS5NWDYvaS5NWDcgT0NPVFAgc3VwcG9y
dCkKPiAzLiBTb3VyY2UgZm9yIG11bHRpcGxlIGFkZHJlc3NlcyAodmVyeSBjb21tb24gaW4gaG9t
ZSByb3V0ZXJzKQo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWls
ZWNraS5wbD4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL252bWVtL2NlbGxzL21hYy1hZGRyZXNzLnlh
bWwgICAgIHwgOTQgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOTQgaW5z
ZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL252bWVtL2NlbGxzL21hYy1hZGRyZXNzLnlhbWwKPiAKPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2NlbGxzL21hYy1hZGRyZXNz
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vY2VsbHMvbWFj
LWFkZHJlc3MueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAw
Li5mOGQxOWU4N2NkZjAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL252bWVtL2NlbGxzL21hYy1hZGRyZXNzLnlhbWwKPiBAQCAtMCwwICsx
LDk0IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0Qt
Mi1DbGF1c2UKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL252bWVtL2NlbGxzL21hYy1hZGRyZXNzLnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IE5W
TUVNIGNlbGwgY29udGFpbmluZyBhIE1BQyBhZGRyZXNzCj4gKwo+ICttYWludGFpbmVyczoKPiAr
ICAtIFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiArCj4gK3Byb3BlcnRpZXM6
Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiBtYWMtYWRkcmVzcwo+ICsKPiArICBmb3Jt
YXQ6Cj4gKyAgICBkZXNjcmlwdGlvbjogfAo+ICsgICAgICBTb21lIE5WTUVNIGNlbGxzIGNvbnRh
aW4gTUFDIGluIGEgbm9uLWJpbmFyeSBmb3JtYXQuCj4gKwo+ICsgICAgICBBU0NJSSBzaG91bGQg
YmUgc3BlY2lmaWVkIGlmIE1BQyBpcyBzdHJpbmcgZm9ybWF0dGVkIGxpa2U6Cj4gKyAgICAgIC0g
IjAxOjIzOjQ1OjY3Ojg5OkFCIiAoMzAgMzEgM2EgMzIgMzMgM2EgMzQgMzUgM2EgMzYgMzcgM2Eg
MzggMzkgM2EgNDEgNDIpCj4gKyAgICAgIC0gIjAxLTIzLTQ1LTY3LTg5LUFCIgo+ICsgICAgICAt
ICIwMTIzNDU2Nzg5QUIiCj4gKyAgICBlbnVtOgo+ICsgICAgICAtIGFzY2lpCj4gKwo+ICsgIHJl
dmVyc2VkLWJ5dGVzOgo+ICsgICAgdHlwZTogYm9vbGVhbgo+ICsgICAgZGVzY3JpcHRpb246IHwK
PiArICAgICAgTUFDIGlzIHN0b3JlZCBpbiByZXZlcnNlZCBieXRlcyBvcmRlci4gRXhhbXBsZToK
PiArICAgICAgU3RvcmVkIHZhbHVlOiBBQiA4OSA2NyA0NSAyMyAwMQo+ICsgICAgICBBY3R1YWwg
TUFDOiAwMSAyMyA0NSA2NyA4OSBBQgo+ICsKPiArICBiYXNlLWFkZHJlc3M6Cj4gKyAgICB0eXBl
OiBib29sZWFuCj4gKyAgICBkZXNjcmlwdGlvbjogfAo+ICsgICAgICBNYXJrcyBOVk1FTSBjZWxs
IGFzIHByb3ZpZGVyIG9mIG11bHRpcGxlIGFkZHJlc3NlcyB0aGF0IGFyZSByZWxhdGl2ZSB0bwo+
ICsgICAgICB0aGUgb25lIGFjdHVhbGx5IHN0b3JlZCBwaHlzaWNhbGx5LiBSZXNwZWN0aXZlIGFk
ZHJlc3NlcyBjYW4gYmUgcmVxdWVzdGVkCj4gKyAgICAgIGJ5IHNwZWNpZnlpbmcgY2VsbCBpbmRl
eCBvZiBOVk1FTSBjZWxsLgoKV2hpbGUgYSBiYXNlIGFkZHJlc3MgaXMgY29tbW9uLCBhcmVuJ3Qg
dGhlcmUgZGlmZmVyZW50IHdheXMgdGhlIGJhc2UgaXMgCm1vZGlmaWVkLiAKClRoZSBwcm9ibGVt
IHdpdGggdGhlc2UgcHJvcGVydGllcyBpcyBldmVyeSBuZXcgdmFyaWF0aW9uIHJlc3VsdHMgaW4g
YSAKbmV3IHByb3BlcnR5IGFuZCB0aGUgZW5kIHJlc3VsdCBpcyBzb21ldGhpbmcgbm90IHdlbGwg
ZGVzaWduZWQuIEEgdW5pcXVlCmNvbXBhdGlibGUgc3RyaW5nLCAiI252bWVtLWNlbGwtY2VsbHMi
IGFuZCBjb2RlIHRvIGludGVycHJldCB0aGUgZGF0YSBpcyAKbW9yZSBmbGV4aWJsZS4KCkZvciBz
b21ldGhpbmcgbGlrZSB0aGlzIHRvIGZseSwgSSBuZWVkIHNvbWUgbGV2ZWwgb2YgY29uZmlkZW5j
ZSB0aGlzIGlzIAplbm91Z2ggZm9yIGV2ZXJ5b25lIGZvciBzb21lIHRpbWUgKElPVywgZmluZCBh
bGwgdGhlIHByZXZpb3VzIGF0dGVtcHRzIAphbmQgZ2V0IHRob3NlIHBlb3BsZSdzIGJ1eS1pbiku
IFlvdSBoYXZlIGZvdW5kIGF0IGxlYXN0IDMgY2FzZXMsIGJ1dCBJIApzZWVtIHRvIHJlY2FsbCBt
b3JlLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
