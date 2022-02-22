Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6D2C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 18:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcXdW7HpoxXeZe5/RO7oKYp0cT/zyMfgxdo8Ux01evY=; b=NiS4HPsf8EhsN6
	NKRjsimVFHfEVtnyTWTr90NyuZBi+1KqQJU3O8ykJl/XXSlur0rIpQBAs+mrZw4P+HCo4Blg9Otni
	Zdi6pt2UWBGxWF30LFTHFvBhDJckQIb46xf4XIAhXZ5QmfNzdqbmvV12k5K+FL8yx3jD0Gk4jaNcW
	j440RTf0TQXbl6MUxGvHgpSqXgoB4GX62yLHft35rUMcvI6Nn6v3+lkTfQF2KRv4DCePUfFURBdGJ
	6ob8J54v2a8qa+sPBzDRQt66LG9jLoCrYaqnowocw6+rNztrt1y78CiKBrb8It17XQDEdn07O+x+8
	DUlAePGQf+8Tq65WLoZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMZkb-00BBBV-1S; Tue, 22 Feb 2022 18:19:01 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMZkY-00BBAM-LV
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 18:19:00 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 p12-20020a05683019cc00b005af1442c9e9so6391838otp.13
 for <linux-mtd@lists.infradead.org>; Tue, 22 Feb 2022 10:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dZA37Wq9AsM7HgP60crwW+rrro1mZPv8mUI1j+MC7vc=;
 b=YEaGdxk3dJhg/JWF3dQeLLcmfxzm4V+8JABoqenmBlmQwg6vFXCiTvZOocIdNPJ3QA
 DCO+Lxkw/jvJqrh/eSqRH77Hf3jKk90QWYj+IefTCH7yvuIRtpSrvOGhPXoBS/4W4Fxc
 DTjlmLLTYvkJvk5TBsEbmU2TbWLykKY0gdCSVkHnnCXm3Hp6BT9VPyt90/IkBCOwNVki
 zLnI4eoYDTFSq1qIml54yInGmSEBF5hkoGJRqEHQ+70PYEo4E8t5w9C23BcPlLzARNhL
 gWQBGym6OGuEmBb0Ai6dX44F9csq+2bejGOHQbhoJuCK8IHXaTpakPclR905h1oPmIq6
 Vugg==
X-Gm-Message-State: AOAM531xPXsL31sYeYOL7I8K8jyI7U4ts6/zp3dKwkc3cy+y3m32L7nl
 qC1Sln3WVTM0pvvwDZbXIw==
X-Google-Smtp-Source: ABdhPJxu9nZSZ8hW/j73ajkdEf7HToIrWKpSPCu1Ih/0M5yBwBLO2tglbXigu7E4/nhRUyR/4a+LDg==
X-Received: by 2002:a9d:784b:0:b0:5ad:52fd:5c24 with SMTP id
 c11-20020a9d784b000000b005ad52fd5c24mr6454761otm.1.1645553937947; 
 Tue, 22 Feb 2022 10:18:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i18sm5191183oof.29.2022.02.22.10.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:18:57 -0800 (PST)
Received: (nullmailer pid 3339764 invoked by uid 1000);
 Tue, 22 Feb 2022 18:18:56 -0000
Date: Tue, 22 Feb 2022 12:18:56 -0600
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC RFT PATCH v2 1/2] dt-bindings: mtd: partitions: Document
 new partition-dynamic nodes
Message-ID: <YhUpEOgMBX4iL2CB@robh.at.kernel.org>
References: <20220220173905.14165-1-ansuelsmth@gmail.com>
 <20220220173905.14165-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220220173905.14165-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_101858_730552_4BEBB2C3 
X-CRM114-Status: GOOD (  24.87  )
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

T24gU3VuLCBGZWIgMjAsIDIwMjIgYXQgMDY6Mzk6MDRQTSArMDEwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IERvY3VtZW50IG5ldyBwYXJ0aXRpb24tZHluYW1pYyBub2RlcyB1c2VkIHRvIHByb3Zp
ZGUgYW4gT0Ygbm9kZSBmb3IKPiBwYXJ0aXRpb24gcmVnaXN0cmVkIGF0IHJ1bnRpbWUgYnkgcGFy
c2Vycy4gVGhpcyBpcyByZXF1aXJlZCBmb3IgbnZtZW0KPiBzeXN0ZW0gdG8gZGVjbGFyZSBhbmQg
ZGV0ZWN0IG52bWVtLWNlbGxzLgo+IAo+IFdpdGggdGhlc2Ugc3BlY2lhbCBwYXJ0aXRpb25zLCBv
bmx5IHRoZSBsYWJlbCBpcyByZXF1aXJlZCBhcyB0aGUgcGFyc2VyCj4gd2lsbCBwcm92aWRlIHJl
ZyBhbmQgb2Zmc2V0IG9mIHRoZSBtdGQuIE5WTUVNIHdpbGwgdXNlIHRoZSBkYXRhIGZyb20gdGhl
Cj4gcGFyc2VyIGFuZCBwcm92aWRlIHRoZSBOVk1FTSBjZWxscyBkZWNsYXJlZCBpbiB0aGUgRFRT
LCAiY29ubmVjdGluZyIgdGhlCj4gZHluYW1pYyBwYXJ0aXRpb24gd2l0aCBhIHN0YXRpYyBkZWNs
YXJhdGlvbiBvZiBjZWxscyBpbiB0aGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuc3VlbCBTbWl0
aCA8YW5zdWVsc210aEBnbWFpbC5jb20+Cj4gLS0tCj4gIC4uLi9tdGQvcGFydGl0aW9ucy9wYXJ0
aXRpb24tZHluYW1pYy55YW1sICAgICB8IDU0ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24tZHluYW1p
Yy55YW1sCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24tZHluYW1pYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlvbi1keW5hbWljLnlhbWwK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uOTQ1MTI4ZTc1NGFj
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24tZHluYW1pYy55YW1sCj4gQEAgLTAsMCArMSw1NCBA
QAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xh
dXNlCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2No
ZW1hcy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24tZHluYW1pYy55YW1sIwo+ICskc2NoZW1hOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxl
OiBEeW5hbWljIFBhcnRpdGlvbgo+ICsKPiArZGVzY3JpcHRpb246IHwKPiArICBUaGlzIGJpbmRp
bmcgZGVzY3JpYmVzIGEgc2luZ2xlIGZsYXNoIHBhcnRpdGlvbiB0aGF0IGlzIGR5bmFtaWNhbGx5
IGFsbG9jYXRlZAo+ICsgIGJ5IGEgZGVkaWNhdGVkIHBhcnNlciB0aGF0IGlzIG5vdCBhIGZpeGVk
LXBhcnRpdGlvbiBwYXJzZXIuIFRvIGRlY2xhcmUgYQo+ICsgIHBhcnRpdGlvbiB0aGUgbGFiZWwg
aXMgcmVxdWlyZWQuIFRoaXMgY2FuIGJlIHVzZWQgdG8gZ2l2ZSBhIGR5bmFtaWMgcGFydGl0aW9u
Cj4gKyAgYW4gT0Ygbm9kZSBzbyB0aGF0IHN1YnN5c3RlbXMgbGlrZSBOVk1FTSBjYW4gd29yayBh
bmQgcHJvdmlkZSBOVk1FTSBDZWxscyB0bwoKJ3N1YnN5c3RlbXMgbGlrZSBOVk1FTScgaXMgYSBM
aW51eCBkZXRhaWwgdGhhdCBzaG91bGRuJ3QgYmUgaW4gYmluZGluZ3MuCgo+ICsgIHRoZSBzeXN0
ZW0uIEFuIGV4YW1wbGUgaXMgZGVjbGFyaW5nIHRoZSBwYXJ0aXRpb24gbGFiZWwgYW5kIGFsbCB0
aGUgTlZNRU0KPiArICBjZWxscyBpbiBpdC4gVGhlIHBhcnNlciB3aWxsIGRldGVjdCB0aGUgY29y
cmVjdCByZWcgYW5kIG9mZnNldCBhbmQgdGhlIE5WTUVNCj4gKyAgd2lsbCByZWdpc3RlciB0aGUg
Y2VsbHMgaW4gaXQgYmFzZWQgb24gdGhlIGRhdGEgZXh0cmFjdGVkIGJ5IHRoZSBwYXJzZXIuCj4g
Kwo+ICttYWludGFpbmVyczoKPiArICAtIEFuc3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFpbC5j
b20+Cj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGxhYmVsOgo+ICsgICAgZGVzY3JpcHRpb246IFRo
ZSBsYWJlbCAvIG5hbWUgZm9yIHRoZSBwYXJ0aXRpb24gYXNzaWduZWQgYnkgdGhlIHBhcnNlciBh
dAo+ICsgICAgICBydW50aW1lLiBUaGlzIGlzIG5lZWRlZCBmb3Igc3lic3lzdGVtIGxpa2UgTlZN
RU0gdG8gZGVmaW5lIGNlbGxzIGFuZAo+ICsgICAgICByZWdpc3RlciB3aXRoIHRoaXMgT0Ygbm9k
ZS4KCidsYWJlbCcgaXMgZ2VuZXJhbGx5IGZvciBodW1hbiBjb25zdW1wdGlvbiBhbmQgc2hvdWxk
IGJlIG9wYXF1ZSB0byB0aGUgCk9TIChvciBhdCBsZWFzdCB0aGUga2VybmVsKS4gUGVyaGFwcyBu
b2RlIG5hbWUgc2hvdWxkIGJlIHVzZWQgbGlrZSAKUmFmYcWCIGlzIGRvaW5nIGZvciBudm1lbVsx
XS4gVGhhdCBhcHBlYXJzIHRvIGJlIHRoZSBzYW1lIHByb2JsZW0gYXQgdGhlIApuZXh0IGxldmVs
IGRvd24uCgpSb2IKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjAyMTgwNzA3
MjkuMzI1Ni0xLXphamVjNUBnbWFpbC5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
