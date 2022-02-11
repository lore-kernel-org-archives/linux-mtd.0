Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A3DC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Feb 2022 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGt/RuuWKODl3yUT8rLj+izpJJaW/0BPfoZO8k9ZZdo=; b=zfivVktFETy31K
	UlKYP6S5lUDvUc7fmGht6JYlyVzy8bGTVPqw8pZU+cwRbsHY5/2F9wDPu5CHwpvrn7h+hTfW+LLu3
	+gUb3/A2T0Ua4PMNMKIHgQEmIDu0OaSo3zXj2osr46qXEGWuELO9R062PolFyAomAwNJoTS0rO97C
	YnSkcVHqHSyPeW+mw5ralJVm+rl6OXOGYMm4TYYANlLuOhEjx2cWvMnhWzcnb87fN8uQReXoJQox3
	Sz1lf6WDAW9Kx6rhZjJHlmbYMB7gJoOTUJgUGH0PzGl2HNyBWMwZTfJG6JxVxGwbXChifoqBLYX50
	/dIwkfSfl+2nUbiVRTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIVO7-007FmI-QM; Fri, 11 Feb 2022 12:51:00 +0000
Received: from mail-qt1-f169.google.com ([209.85.160.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIVO0-007Ffr-MA; Fri, 11 Feb 2022 12:50:57 +0000
Received: by mail-qt1-f169.google.com with SMTP id e16so8919026qtq.6;
 Fri, 11 Feb 2022 04:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=u6rmzGmHT/gQ3Tbc1nnAWIpxZbnc090wYLn3lrC8O20=;
 b=5DC/1zXJ+BL0PJpSclZwdolqdKWJBTbRl8i98sAcHV9/dbNfZ/mSLbOkHNUIyujqHx
 0L2cB9H0d0zKXSOlUJkd5I3rDs7NLTFwz2yU0jA2N2bDkkjeEkuNpoyvYNpQZqiYnJaW
 pe1/OTsUECxciWgUExrUZ0bjq1kGqK/QY8PfjSC1RDt5bND4cfGDOTqz0zqe8fZ80P8s
 57QOB/vydQzkfJ0Gks4LVb/VQZRN5NvgwoSxaSDQT5zHF4rpvsy44iAtHC+ypdId9tl4
 IVlXfueOH8UISGMy8PrmopLzi7nls+M+mIBpo3a9bTtPxBnpKL0diukz3sY2wSeWZa6S
 z84Q==
X-Gm-Message-State: AOAM532XceMOvwayVDDc2YuvLZNYEYyTD7anR3vHL0LCxBR2KDDN01vC
 HPM/iXdwjlnxlJGSPeZEEeYI5aSF2w==
X-Google-Smtp-Source: ABdhPJxnhE3MwVN8S27Aocl3jCWaP62tWrP7cI0vk9Yi0IoaXxKAmoQBS8EjSBot0OVZCNJT/mmHRQ==
X-Received: by 2002:ac8:5a08:: with SMTP id n8mr923470qta.332.1644583850026;
 Fri, 11 Feb 2022 04:50:50 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.10])
 by smtp.gmail.com with ESMTPSA id k4sm12361409qta.6.2022.02.11.04.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:49 -0800 (PST)
Received: (nullmailer pid 200784 invoked by uid 1000);
 Fri, 11 Feb 2022 12:50:33 -0000
Date: Fri, 11 Feb 2022 06:50:33 -0600
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
Subject: Re: [PATCH REBASED 1/2] dt-bindings: nvmem: extract NVMEM cell to
 separated file
Message-ID: <YgZbmT0WimUbZv97@robh.at.kernel.org>
References: <20220125180114.12286-1-zajec5@gmail.com>
 <20220126070745.32305-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126070745.32305-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_045052_799798_434A4324 
X-CRM114-Status: GOOD (  19.71  )
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

T24gV2VkLCBKYW4gMjYsIDIwMjIgYXQgMDg6MDc6NDRBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBU
aGlzIHdpbGwgYWxsb3cgYWRkaW5nIGJpbmRpbmcgZm9yIG1vcmUgc3BlY2lmaWMgY2VsbHMgYW5k
IHJldXNpbmcKPiAoc2hhcmluZykgY29tbW9uIGNvZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFm
YcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9udm1lbS9jZWxscy9jZWxsLnlhbWwgfCAzNCArKysrKysrKysrKysrKysrKysrCgpX
aHkgdGhlICdjZWxscycgc3ViZGlyPyBjZWxsLnlhbWwgaXMgYSBiaXQgZ2VuZXJpYyBmb3IgbWUg
YXMgRFQgZGVmaW5lcyAKJ2NlbGwnIHdoaWNoIGlzIGRpZmZlcmVudCBmcm9tIG52bWVtIGNlbGwu
IFdoaWxlIHdlIGhhdmUgdGhlIHBhdGggdG8gCmRpc3Rpbmd1aXNoLCAnJHJlZjogY2VsbC55YW1s
JyBkb2Vzbid0LgoKCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252bWVtLnlhbWwg
ICAgICB8IDIyICstLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMo
KyksIDIxIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2NlbGxzL2NlbGwueWFtbAo+IAo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vY2VsbHMvY2VsbC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL2NlbGxzL2NlbGwueWFt
bAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5hZGZjMmU2Mzlm
NDMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL252bWVtL2NlbGxzL2NlbGwueWFtbAo+IEBAIC0wLDAgKzEsMzQgQEAKPiArIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQo+ICslWUFNTCAx
LjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbnZtZW0vY2Vs
bHMvY2VsbC55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBOVk1FTSBjZWxsCj4gKwo+ICttYWludGFpbmVy
czoKPiArICAtIFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJv
Lm9yZz4KPiArCj4gK2Rlc2NyaXB0aW9uOiBOVk1FTSBjZWxsIGlzIGEgZGF0YSBlbnRyeSBvZiBO
Vk1FTSBkZXZpY2UuCj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1z
OiAxCj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgT2Zmc2V0IGFuZCBzaXplIGluIGJ5dGVz
IHdpdGhpbiB0aGUgc3RvcmFnZSBkZXZpY2UuCj4gKwo+ICsgIGJpdHM6Cj4gKyAgICAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzItYXJyYXkKPiArICAgIGl0ZW1z
Ogo+ICsgICAgICAtIG1pbmltdW06IDAKPiArICAgICAgICBtYXhpbXVtOiA3Cj4gKyAgICAgICAg
ZGVzY3JpcHRpb246Cj4gKyAgICAgICAgICBPZmZzZXQgaW4gYml0IHdpdGhpbiB0aGUgYWRkcmVz
cyByYW5nZSBzcGVjaWZpZWQgYnkgcmVnLgo+ICsgICAgICAtIG1pbmltdW06IDEKPiArICAgICAg
ICBkZXNjcmlwdGlvbjoKPiArICAgICAgICAgIFNpemUgaW4gYml0IHdpdGhpbiB0aGUgYWRkcmVz
cyByYW5nZSBzcGVjaWZpZWQgYnkgcmVnLgo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSByZWcKPiAr
Cj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9udm1lbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL252bWVtLnlhbWwKPiBpbmRleCA0M2VkN2UzMmU1YWMu
LmI3OWI1MWU5OGVlOCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbnZtZW0vbnZtZW0ueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9udm1lbS9udm1lbS55YW1sCj4gQEAgLTQxLDI3ICs0MSw3IEBAIHByb3BlcnRpZXM6
Cj4gIAo+ICBwYXR0ZXJuUHJvcGVydGllczoKPiAgICAiQFswLTlhLWZdKygsWzAtN10pPyQiOgo+
IC0gICAgdHlwZTogb2JqZWN0Cj4gLQo+IC0gICAgcHJvcGVydGllczoKPiAtICAgICAgcmVnOgo+
IC0gICAgICAgIG1heEl0ZW1zOiAxCj4gLSAgICAgICAgZGVzY3JpcHRpb246Cj4gLSAgICAgICAg
ICBPZmZzZXQgYW5kIHNpemUgaW4gYnl0ZXMgd2l0aGluIHRoZSBzdG9yYWdlIGRldmljZS4KPiAt
Cj4gLSAgICAgIGJpdHM6Cj4gLSAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvdWludDMyLWFycmF5Cj4gLSAgICAgICAgaXRlbXM6Cj4gLSAgICAgICAgICAtIG1p
bmltdW06IDAKPiAtICAgICAgICAgICAgbWF4aW11bTogNwo+IC0gICAgICAgICAgICBkZXNjcmlw
dGlvbjoKPiAtICAgICAgICAgICAgICBPZmZzZXQgaW4gYml0IHdpdGhpbiB0aGUgYWRkcmVzcyBy
YW5nZSBzcGVjaWZpZWQgYnkgcmVnLgo+IC0gICAgICAgICAgLSBtaW5pbXVtOiAxCj4gLSAgICAg
ICAgICAgIGRlc2NyaXB0aW9uOgo+IC0gICAgICAgICAgICAgIFNpemUgaW4gYml0IHdpdGhpbiB0
aGUgYWRkcmVzcyByYW5nZSBzcGVjaWZpZWQgYnkgcmVnLgo+IC0KPiAtICAgIHJlcXVpcmVkOgo+
IC0gICAgICAtIHJlZwo+ICsgICAgJHJlZjogY2VsbHMvY2VsbC55YW1sIwo+ICAKPiAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IHRydWUKPiAgCj4gLS0gCj4gMi4zMS4xCj4gCj4gCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
