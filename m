Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90048EDE999
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u05X2Uc92JCJToHdfPr5vYWEwYzy8fXjSPX3zYq/Mg0=; b=TSyXiGX13QVHqU
	pucwzkiB1cAzKDer24EbCFGEx5CsCbza5C17UoN1YusQzIFKzJi4E+DOk35th7NpFHohlfLu1QftP
	NnZ2P07tWwKoy9BaDj5+wHnbKrLIadlGEwQaEpC3doIdpjSFv4AdO6yR/bDt1Ua0r8IJfTdGBIy7R
	Hp856uJUngNjDS7csvX6/WrTDWkwQwm6KV/0xvVXmVN5ZMrA6AzagMNEW2bkgo0LRlMNX28trLzas
	WZcj7Fl3Z3aLT7HF2FeIW3WwDVIuxHXybrCq8LLSNuxsTLbE1X69lcFGrXU3qH5ohvlw5SXzyFmDU
	GGsn3JSUHsjptnfWGfGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiCU-007mU9-2m;
	Thu, 14 Sep 2023 08:59:50 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiCQ-007mSV-18
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 08:59:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B1746000F;
	Thu, 14 Sep 2023 08:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694681980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJ4z2Gb0KptgoNfUT9OZZNooMDLvMmhtErYIxdhxYb8=;
	b=lnySrbnAZH83y3B6hI5qfEwR42Wat0GYBgiCKi8Ai3YXbPOC/m7mAR+9/wFBsbuQ9zhjWH
	m5HYL1/tTu5hqOikzBCl+OOViLmsh5IWkJXaeFhy53vUfuk74fENHKKH4J6TH9EQBxLvbR
	BOrcwpb17FTVQQG+MeB2S3kg+Pc6yiQR3SevphlU0IWig7aXOh8QIMxDOqTg8AqRH1gKoE
	ImYCsIp3YIbCI3Wj9WqefNYwvKz+57HrVhLkn39q/ILS5CFHC+lTviq4BlR8NIsIt09Oo8
	6k00RQNpTbgcLs3nXOB0guYkm9k83Cha+H5HsyDhgZCOwVlhbs9HLN0EzlHmww==
Date: Thu, 14 Sep 2023 10:59:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, MTD Maling
 List <linux-mtd@lists.infradead.org>, linux-spi
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Walle <michael@walle.cc>
Subject: Re: [PATCH] memory: renesas-rpc-if: Fix IO state based on flash
 type
Message-ID: <20230914105937.4af00bf2@xps-13>
In-Reply-To: <CAMuHMdWO8EdbxXetmc9-2jhZWeX1b_J74O0exo1Q85X9Gbc_SA@mail.gmail.com>
References: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
	<CAMuHMdV1qvypo1XmHBXV5Q1SHEhksMN3SxgweYxPu+=ZeDmg1A@mail.gmail.com>
	<TYCPR01MB5933571F06789BFF27A8FCC786E6A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
	<502336e9-2455-f3f6-57d1-807bc4b71f7f@linaro.org>
	<CAMuHMdWO8EdbxXetmc9-2jhZWeX1b_J74O0exo1Q85X9Gbc_SA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_015946_691005_7C959126 
X-CRM114-Status: GOOD (  32.18  )
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

SGkgR2VlcnQsCgorIE1pY2hhZWwgV2FsbGUKCmdlZXJ0QGxpbnV4LW02OGsub3JnIHdyb3RlIG9u
IFRodSwgMTQgU2VwIDIwMjMgMTA6MzQ6NTAgKzAyMDA6Cgo+IEhpIEtyenlzenRvZiwKPiAKPiBD
QyBSb2IsIE1pcXVlbAo+IAo+IE9uIFRodSwgU2VwIDE0LCAyMDIzIGF0IDEwOjA44oCvQU0gS3J6
eXN6dG9mIEtvemxvd3NraQo+IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3Rl
Ogo+ID4gT24gMzAvMDgvMjAyMyAxNzoxOCwgQmlqdSBEYXMgd3JvdGU6ICAKPiA+ID4+PiAgICAg
ICAgICAgICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKHJwYy0+cmVnbWFwLCBSUENJRl9DTU5DUiwg
QEAgLTc3NCw2Cj4gPiA+Pj4gKzc3NiwxMiBAQCBzdGF0aWMgaW50IHJwY2lmX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+Pj4gICAgICAgICAgICAgICAgIHJldHVybiBy
ZXQ7Cj4gPiA+Pj4gICAgICAgICB9Cj4gPiA+Pj4KPiA+ID4+PiArICAgICAgIGlmIChycGMtPmlu
Zm8tPnR5cGUgPT0gUlBDSUZfUlpfRzJMICYmICAKPiA+ID4+Cj4gPiA+PiBXb3VsZG4ndCB0aGlz
IGFwcGx5IHRvIG5vbi1SWi9HMkwgc3lzdGVtcywgdG9vPyAgCj4gPiA+Cj4gPiA+IEl0IGFwcGxp
ZXMsIGlmIHRoZSBkZXZpY2UgdXNlcyB0aGUgZmxhc2hbMV0gb3IgWzJdIGFuZCBpdCBuZWVkcwo+
ID4gPiA0LWJpdCB0eCBzdXBwb3J0Lgo+ID4gPgo+ID4gPiBbMV0gRmlndXJlIDIwOiBRVUFEIElO
UFVUL09VVFBVVCBGQVNUIFJFQUQg4oCTIEVCaC9FQ2gKPiA+ID4gaHR0cHM6Ly9tZWRpYS13d3cu
bWljcm9uLmNvbS8tL21lZGlhL2NsaWVudC9nbG9iYWwvZG9jdW1lbnRzL3Byb2R1Y3RzL2RhdGEt
c2hlZXQvbm9yLWZsYXNoL3NlcmlhbC1ub3IvbXQyNXEvZGllLXJldi1hL210MjVxX3Fsa3NfdV81
MTJfYWJhXzAucGRmP3Jldj0zZTViMmE1NzRmN2I0NzkwYjZlNThkYWNmNGM4ODliMgo+ID4gPgo+
ID4gPiBbMl0gc2VjdGlvbiA4LjE0Cj4gPiA+Cj4gPiA+IGh0dHBzOi8vd3d3LnJlbmVzYXMuY29t
L2V1L2VuL2RvY3VtZW50L2RzdC9hdDI1cWwxMjhhLWRhdGFzaGVldD9yPTE2MDg1ODYgIAo+ID4K
PiA+IEdlZXJ0LAo+ID4KPiA+IERvZXMgaXQgYW5zd2VyIHlvdXIgY29tbWVudCBvciBkbyB5b3Ug
ZXhwZWN0IGhlcmUgc29tZSBjaGFuZ2VzPyAgCj4gCj4gV2VsbCwgbm93IGl0IGhhcyBiZWVuIGNv
bmZpcm1lZCB0aGlzIGFwcGxpZXMgdG8gbm9uLVJaL0cyTCBzeXN0ZW1zLCB0b28sCj4gdGhlIGNo
ZWNrIGZvciBSUENJRl9SWl9HMkwgc2hvdWxkIHByb2JhYmx5IGJlIHJlbW92ZWQuICBJbiB1cHN0
cmVhbSwKPiBvbmx5IGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yemcybHssY30tc21hcmMt
c29tLmR0c2kgaGF2ZSBkZXZpY2VzCj4gdGhhdCBhcmUgY29tcGF0aWJsZSB3aXRoICJtaWNyb24s
bXQyNXF1NTEyYSIsIGJ1dCBvYnZpb3VzbHkgdGhleSBjYW4KPiBhcHBlYXIgZWxzZXdoZXJlLCB0
b28uCj4gCj4gTm93LCB0aGUgcHJlc2VuY2Ugb2YgdGhhdCBjb21wYXRpYmxlIHZhbHVlIGluIHJ6
ZzJseyxjfS1zbWFyYy1zb20uZHRzaQo+IGN1cnJlbnRseSBjYXVzZXMgYSBkdGJzX2NoZWNrIHdh
cm5pbmcsIGFzIGl0IGlzIG5vdCBkb2N1bWVudGVkLgo+IEhvd2V2ZXIsIHRoZXJlIGhhcyBiZWVu
IHNvbWUgcHVzaGJhY2sgYWdhaW5zdCBhZGRpbmcgbW9yZSBjb21wYXRpYmxlCj4gdmFsdWVzLCBj
ZnIuIG15IHBhdGNoIHRvIGFkZCBtdDI1cXU1MTJhWzFdLCBhbmQgTWlxdWVsJ3MgY29tbWl0IFsy
XS4KCkp1c3QgRllJLCBJIHNlbnQgWzJdIGFmdGVyIGFuIHVuc3VjY2Vzc2Z1bCBhdHRlbXB0IHRv
IHVwZGF0ZSB0aGF0IGxpc3QKdG9vLCBzZWUgWzNdLiBUaGUgaWRlYSBpczogaWYgeW91IGRvbid0
IGhhdmUgYW55dGhpbmcgdXNlZnVsIHRvIGFkZCwKanVzdCB1c2UgdGhlIGdlbmVyaWMgY29tcGF0
aWJsZS4gSWYgeW91IG5lZWQgc3BlY2lmaWMgY2hhbmdlcywgeW91IGNhbgphZGQgYW4gZW50cnku
CgpbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkL2Q4MTY0OTllLWJhYWItNjIw
MC0wNzgwLTE3YTgyMDViMjUyZUBsaW5hcm8ub3JnLwoKPiBCdXQgdGhlIGlzc3VlIEJpanUgaXMg
c2VlaW5nIHByb3ZlcyB0aGVyZSBpcyBhIG5lZWQgdG8gYWRkIHRoZXNlLgo+IAo+IEluIGFkZGl0
aW9uLCBJIGhhZCBob3BlZCB0byBnYXRoZXIgc29tZSBmZWVkYmFjayBvciBndWlkYW5jZSBmcm9t
IHRoZQo+IGh5cGVyYnVzIGFuZC9vciBzcGkgcGVvcGxlLCBhcyBpc3N1ZXMgdy5yLnQuIHBpbiBz
dGF0ZXMgd2lsbCBldmVudHVhbGx5Cj4gcG9wIHVwIG9uIG90aGVyIHN5c3RlbXMsIHRvbywgYW5k
IHRodXMgbWF5IG5lZWQgaGFuZGxpbmcgaW4gdGhlIGNvcmUsCj4gaW5zdGVhZCBvZiBpbiBlYWNo
IGluZGl2aWR1YWwgZGV2aWNlIGRyaXZlci4gIEJ1dCBvZiBjb3Vyc2UgdGhhdCBjYW4KPiBiZSBk
b25lIGxhdGVyLCB3aGVuIHRoZSBuZWVkIGFyaXNlcy4KPiAKPiBUaGFua3MhCj4gCj4gWzFdICJb
UEFUQ0hdIGR0LWJpbmRpbmdzOiBtdGQ6IGplZGVjLHNwaS1ub3I6IERvY3VtZW50IHN1cHBvcnQg
Zm9yCj4gbW9yZSBNVDI1UVUgcGFydHMiCj4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8zNjMxODYwNzliNDI2OTg5MTA3M2Y2MjBlM2UyMzUzY2Y3ZDI1NTlhLjE2Njk5ODgyMzguZ2l0
LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlCj4gWzJdIDRiMGNiNGU3YWIyZjc3N2MgKCJkdC1iaW5k
aW5nczogbXRkOiBzcGktbm9yOiBjbGFyaWZ5IHRoZSBuZWVkIGZvcgo+IHNwaS1ub3IgY29tcGF0
aWJsZXMiKS4KPiAKPiBHcntvZXRqZSxlZXRpbmd9cywKPiAKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydAo+IAo+IC0tCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBv
ZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwo+IAo+IEluIHBlcnNv
bmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEg
aGFja2VyLiBCdXQKPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkg
InByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
