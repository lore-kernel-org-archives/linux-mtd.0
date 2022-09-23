Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176E3ECAAD8
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Sep 2022 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/HYl6QBDoSnuyzk8+x9kfRh3ZY2bpW6wZbXdudabPY=; b=1VBC7FKRr/bUWW
	g8pDjydF4lw6DRhQNh0FdL25Gy8QyCxuBZoXsqOJv5qOiiCFELFxnFkePmj4VxceETM7CVvrfwR5M
	43Ms98NlgZ1tgg1NNZnPA61FFhcloD5CgKQPTzCohBnYVy/UiDkhPLvMpBECBk7EiEvG3PajOH+Ix
	O5Nx1UEXtX9E3HDpJQ04fz/Vl1R8SHmsHzMk3aKmfBarJke9x4IvoaHfmjvr+QljCOuJni8cYPLFe
	nFqwO+HAioahcKPhiaWl3q7OkfULFoXL8494212vX6lkC84Td5u3KkvfdAtelSPRaqj8jLvpH/Sje
	+QBKBIYqgsGLUYo+a3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obkub-004sre-Gn; Fri, 23 Sep 2022 15:48:21 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obkuO-004snH-GV; Fri, 23 Sep 2022 15:48:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5E00BFF809;
	Fri, 23 Sep 2022 15:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663948083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lo2OfiFsituiAjWzRKD+8mam5gTPh7hGEapVViTm41I=;
	b=fsi/9hSaY/0DUzrW2fRSEnNXqB9wsVkDc8+Ln6V2dgFk/WsWpD8ZUPRF9l1bhZLlpHMooS
	UDcKQSzp/PN4D6sKnKmilsjeKp3JQSGnxpTHDes8cuHi+m/PO+RLvmALwZiwdf/6KUl4UD
	ZDslRsUikY86FVM167/dIxig6MmRRNlOf4FfrTrqo5uh42ZpuaJnLPGBe696TODaRiCRBy
	KkmORG0fN6VwaMO9W7rgdunJtTMk9nrQFTPYCT76qaqVL2YDNmc9rs2P9I/Us4UOwiudae
	eeyXGsdPbxc12KynT7BaS50Xt5hi9ehrLZdQQcfofIRLaD3gkDcCKydFYDShFA==
Date: Fri, 23 Sep 2022 17:47:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Frank Rowand <frowand.list@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Robert
 Marko <robert.marko@sartura.hr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 00/20] nvmem: core: introduce NVMEM layouts
Message-ID: <20220923174759.299e504e@xps-13>
In-Reply-To: <20220901221857.2600340-1-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_084808_888552_6799CD6D 
X-CRM114-Status: GOOD (  31.39  )
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

SGkgTWljaGFlbCwKCkkgaGF2ZSBhIGZldyBhZGRpdGlvbmFsIHF1ZXN0aW9ucyByZWdhcmRpbmcg
dGhlIGJpbmRpbmdzLgoKbWljaGFlbEB3YWxsZS5jYyB3cm90ZSBvbiBGcmksICAyIFNlcCAyMDIy
IDAwOjE4OjM3ICswMjAwOgoKPiBUaGlzIGlzIG5vdyB0aGUgdGhpcmQgYXR0ZW1wdCB0byBmZXRj
aCB0aGUgTUFDIGFkZHJlc3NlcyBmcm9tIHRoZSBWUEQKPiBmb3IgdGhlIEtvbnRyb24gc2wyOCBi
b2FyZHMuIFByZXZpb3VzIGRpc2N1c3Npb25zIGNhbiBiZSBmb3VuZCBoZXJlOgo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMTEyMjgxNDI1NDkuMTI3NTQxMi0xLW1pY2hhZWxAd2Fs
bGUuY2MvCj4gCj4gCj4gTlZNRU0gY2VsbHMgYXJlIHR5cGljYWxseSBhZGRlZCBieSBib2FyZCBj
b2RlIG9yIGJ5IHRoZSBkZXZpY2V0cmVlLiBCdXQKPiBhcyB0aGUgY2VsbHMgZ2V0IG1vcmUgY29t
cGxleCwgdGhlcmUgaXMgKHZhbGlkKSBwdXNoIGJhY2sgZnJvbSB0aGUKPiBkZXZpY2V0cmVlIG1h
aW50YWluZXJzIHRvIG5vdCBwdXQgdGhhdCBoYW5kbGluZyBpbiB0aGUgZGV2aWNldHJlZS4KPiAK
PiBUaGVyZWZvcmUsIGludHJvZHVjZSBOVk1FTSBsYXlvdXRzLiBUaGV5IG9wZXJhdGUgb24gdGhl
IE5WTUVNIGRldmljZSBhbmQKPiBjYW4gYWRkIGNlbGxzIGR1cmluZyBydW50aW1lLiBUaGF0IHdh
eSBpdCBpcyBwb3NzaWJsZSB0byBhZGQgbW9yZSBjb21wbGV4Cj4gY2VsbHMgdGhhbiBpdCBpcyBw
b3NzaWJsZSByaWdodCBub3cgd2l0aCB0aGUgb2Zmc2V0L2xlbmd0aC9iaXRzCj4gZGVzY3JpcHRp
b24gaW4gdGhlIGRldmljZSB0cmVlLiBGb3IgZXhhbXBsZSwgeW91IGNhbiBoYXZlIHBvc3QgcHJv
Y2Vzc2luZwo+IGZvciBpbmRpdmlkdWFsIGNlbGxzICh0aGluayBvZiBlbmRpYW4gc3dhcHBpbmcs
IG9yIGV0aGVybmV0IG9mZnNldAo+IGhhbmRsaW5nKS4KPiAKPiBUaGUgaW14LW9jb3RwIGRyaXZl
ciBpcyB0aGUgb25seSB1c2VyIG9mIHRoZSBnbG9iYWwgcG9zdCBwcm9jZXNzaW5nIGhvb2ssCj4g
Y29udmVydCBpdCB0byBudm1lbSBsYXlvdXRzIGFuZCBkcm9wIHRoZSBnbG9iYWwgcG9zdCBwb2Nl
c3NpbmcgaG9vay4gUGxlYXNlCj4gbm90ZSwgdGhhdCB0aGlzIGNoYW5nZSBpcyBvbmx5IGNvbXBp
bGUtdGltZSB0ZXN0ZWQuCj4gCj4gWW91IGNhbiBhbHNvIGhhdmUgY2VsbHMgd2hpY2ggaGF2ZSBu
byBzdGF0aWMgb2Zmc2V0LCBsaWtlIHRoZQo+IG9uZXMgaW4gYW4gdS1ib290IGVudmlyb25tZW50
LiBUaGUgbGFzdCBwYXRjaGVzIHdpbGwgY29udmVydCB0aGUgY3VycmVudAo+IHUtYm9vdCBlbnZp
cm9ubWVudCBkcml2ZXIgdG8gYSBOVk1FTSBsYXlvdXQgYW5kIGxpZnRpbmcgdGhlIHJlc3RyaWN0
aW9uCj4gdGhhdCBpdCBvbmx5IHdvcmtzIHdpdGggbXRkIGRldmljZXMuIEJ1dCBhcyBpdCB3aWxs
IGNoYW5nZSB0aGUgcmVxdWlyZWQKPiBjb21wYXRpYmxlIHN0cmluZ3MsIGl0IGlzIG1hcmtlZCBh
cyBSRkMgZm9yIG5vdy4gSXQgYWxzbyBuZWVkcyB0byBoYXZlCj4gaXRzIGRldmljZSB0cmVlIHNj
aGVtYSB1cGRhdGUgd2hpY2ggaXMgbGVmdCBvdXQgaGVyZS4gVGhlc2UgdHdvIHBhdGNoZXMKPiBh
cmUgbm90IGV4cGVjdGVkIHRvIGJlIGFwcGxpZWQsIGJ1dCByYXRoZXIgdG8gc2hvdyBhbm90aGVy
IGV4YW1wbGUgb2YKPiBob3cgdG8gdXNlIHRoZSBsYXlvdXRzLgo+IAo+IEZvciBub3csIHRoZSBs
YXlvdXRzIGFyZSBzZWxlY3RlZCBieSBhIHNwZWNpZmljIGNvbXBhdGlibGUgc3RyaW5nIGluIGEK
PiBkZXZpY2UgdHJlZS4gRS5nLiB0aGUgVlBEIG9uIHRoZSBrb250cm9uIHNsMjggZG8gKHdpdGhp
biBhIFNQSSBmbGFzaCBub2RlKToKPiAgIGNvbXBhdGlibGUgPSAia29udHJvbixzbDI4LXZwZCIs
ICJ1c2VyLW90cCI7Cj4gb3IgaWYgeW91J2QgdXNlIHRoZSB1LWJvb3QgZW52aXJvbm1lbnQgKHdp
dGhpbiBhbiBNVEQgcGF0aXRpb24pOgo+ICAgY29tcGF0aWJsZSA9ICJ1LWJvb3QsZW52IiwgIm52
bWVtIjsKPiAKPiBUaGUgInVzZXItb3RwIiAob3IgIm52bWVtIikgd2lsbCBsZWFkIHRvIGEgTlZN
RU0gZGV2aWNlLCB0aGUKPiAia29udHJvbixzbDI4LXZwZCIgKG9yICJ1LWJvb3QsZW52Iikgd2ls
bCB0aGVuIGFwcGx5IHRoZSBzcGVjaWZpYyBsYXlvdXQKPiBvbiB0b3Agb2YgdGhlIE5WTUVNIGRl
dmljZS4KClNvIGlmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHRoZXJlIHNob3VsZCBiZToKLSBv
bmUgRFQgbm9kZSBkZWZpbmluZyB0aGUgc3RvcmFnZSBtZWRpdW0gZWVwcm9tL210ZC93aGF0ZXZl
ciwKLSBhbm90aGVyIERUIG5vZGUgZGVmaW5pbmcgdGhlIG52bWVtIGRldmljZSB3aXRoIHR3byBj
b21wYXRpYmxlcywgdGhlCiAgIm52bWVtIiAob3IgInVzZXItb3RwIikgYW5kIHRoZSBsYXlvdXQu
CklzIHRoaXMgY29ycmVjdD8gQWN0dWFsbHkgSSB3YXMgYSBiaXQgc3VycHJpc2VkIGJlY2F1c2Ug
Z2VuZXJhbGx5CnNwZWFraW5nLCBEVCBtYWludGFpbmVycyAocmlnaHRmdWxseSkgZG8gbm90IHdh
bnQgdG8gZGVzY3JpYmUgaG93IHdlCnVzZSBkZXZpY2VzLCB0aGUgbnZtZW0gYWJzdHJhY3Rpb24g
bG9va3MgbGlrZSBhIExpbnV4IHRoaW5nIHdoZW4gb24gdG9wCm9mIG10ZCBkZXZpY2VzIGZvciBp
bnN0YW5jZSwgc28gSSBqdXN0IHdhbnRlZCB0byBjb25maXJtIHRoaXMgcG9pbnQuCgpUaGVuLCBh
cyB3ZSBoYXZlIGFuIG52bWVtIGRldmljZSBkZXNjcmliZWQgaW4gdGhlIERULCB3aHkgbm90IGp1
c3QKcG9pbnRpbmcgYXQgdGhlIG52bWVtIGRldmljZSBmcm9tIHRoZSBjZWxsIGNvbnN1bWVyLCBy
YXRoZXIgdGhhbiBzdGlsbApoYXZpbmcgdGhlIG5lZWQgdG8gZGVmaW5lIGFsbCB0aGUgY2VsbHMg
dGhhdCB0aGUgbnZtZW0gZGV2aWNlIHdpbGwKcHJvZHVjZSBpbiB0aGUgRFQ/CgpNYXliZSBhbiBl
eGFtcGxlIHRvIHNob3cgd2hhdCBJIG1lYW4uIEhlcmUgaXMgdGhlIGN1cnJlbnQgd2F5OgoKbnZt
ZW1fcHJvdmlkZXI6IG52bWVtLXByb3ZpZGVyIHsKCXByb3BlcnRpZXM7CgoJbXljZWxsOiBteV9j
ZWxsIHsKCQlbcHJvcGVydGllcztdCgl9Owp9OwoKQW5kIHdlIHBvaW50IHRvIGEgY2VsbCB3aXRo
OgoKCW52bWVtLWNlbGxzID0gPCZteWNlbGw+OwoKQnV0LCBhcyBmb3IgdGhlIHRsdiB0YWJsZXMs
IHRoZXJlIGFyZSBtYW55IGNlbGxzIHRoYXQgd2lsbCBiZSBwcm9kdWNlZCwKYW5kIHRoZSBkcml2
ZXIgbWF5IGFueXdheSBqdXN0IGFzayBmb3IgdGhlIGNlbGwgbmFtZSAoZWcuIHBlcmZvcm1pbmcg
YQpsb29rdXAgb2YgdGhlICJtYWMtYWRkcmVzcyIgY2VsbCBuYW1lKSwgc28gd2h5IGJvdGhlcmlu
ZyB0byBkZXNjcmliZSBhbGwKdGhlIGNlbGxzIGluIHRoZSBEVCwgbGlrZToKCgludm1lbS1jZWxs
cy1wcm92aWRlcnMgPSA8Jm52bWVtX3Byb3ZpZGVyPjsKCldoYXQgZG8geW91IHRoaW5rPwoKTWF5
YmUgZm9yIHRoZSBtYWMgYWRkcmVzc2VzIHRoaXMgaXMgYSBiaXQgbGltaXRpbmcgYXMsIGluIHBy
YWN0aWNlLCB3ZQpvZnRlbiBoYXZlIGJhc2UgbWFjIGFkZHJlc3NlcyBhdmFpbGFibGUgYW5kIHVz
aW5nOgoKCW52bWVtLWNlbGxzID0gPCZteWNlbGwgSU5ERVg+OwoKYWxsb3dzIHRvIGR5bmFtaWNh
bGx5IGNyZWF0ZSBtYW55IGRpZmZlcmVudCBtYWMgYWRkcmVzc2VzLCBidXQgSSB3b25kZXIKaWYg
dGhlIGFwcHJvYWNoIHdvdWxkIGJlIGludGVyZXN0aW5nIGZvciBvdGhlciBjZWxsIHR5cGVzLiBK
dXN0IGFuIG9wZW4KcXVlc3Rpb24uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
