Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88F5C10F1A
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 08:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDDpD07ZGhmXrfeec8J7R9+FUv25020DVxQYaoGsBa4=; b=FBQ3n5pzKRTTFt
	ugzeGR1b+gUukks9mQs6WMtWks3VHlmzYr+5T7/hM0ocEWfB2IsD5EYepvjFieWJmOXfnE42anfgq
	nCgaEDOXJNBDjNDtCCzYNsVfkmtMdm+EKMvstsiFNYtf2qwlBv3faQRlBx/EnbOfGladMJ6Nwd+2H
	LcmgtNlKVFiVtbWB+AHk1EJOh8UHPwQXvPFeJeLmPEPtj4etiRLf3UapEO5yUdI7gF1dMM2+0LzjD
	jgD6DjRsSsbI//Q17ckrtkY2EFLeQh9JVzlGx5FdVOrpLAQbcaBN1J0pdui2Nl+s5Eq1uu1aYMaRk
	9igly5KNtNL/9haewRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Fpq-0000000A4pH-3unX;
	Tue, 07 May 2024 08:06:02 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Fpm-0000000A4nu-3lhp;
	Tue, 07 May 2024 08:06:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E695BE0009;
	Tue,  7 May 2024 08:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715069155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y9TepcGEoiKxLCbwlao4rlGSeQ9tpcI5kPyU38Gz2cI=;
	b=SpFGaQjHqBa1/EmaMM0V0Yv5VoQyM6W/gWWjS2btE9ZQTQxVehDqriIXAkPgnynxrxhRD+
	pV6OL/wqyJEdkYBN1GZVcgceosY9HP7sxbRWHej1+twLn+HQEuDNnEBBQVz5QPaFlUlyjT
	y1mude0egUS4aG38ywFou0RQgSq2Vh716RUZhuHieuAz5TwR0nTlU6VRCYjTqIOyPGZeoR
	aQxchupuRF8QxCgpd/JuICPP/BueU5pQ/QBMXstmsq7zugfzwcxKl+8RB1TtsI5J+DG/LP
	9l/Ar29/NkMYolWtO7s9fa7Aa8QrCxBz+vJb8LUMW+ORYVt7HkTTSza3ZJHJeQ==
Date: Tue, 7 May 2024 10:05:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v5 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Message-ID: <20240507100553.31578d0d@xps-13>
In-Reply-To: <e3ea7238-c80d-dfe9-28bf-df95708872d6@salutedevices.com>
References: <20240416085101.740458-1-avkrasnov@salutedevices.com>
	<20240416085101.740458-2-avkrasnov@salutedevices.com>
	<20240506154858.003bab54@xps-13>
	<d90f9d3d-7823-503f-4cc6-73783a083d0e@salutedevices.com>
	<20240507092726.4ab1afdb@xps-13>
	<e3ea7238-c80d-dfe9-28bf-df95708872d6@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_010559_223633_6571E56B 
X-CRM114-Status: GOOD (  22.13  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBvbiBUdWUsIDcg
TWF5IDIwMjQgMTA6MzU6NTEgKzAzMDA6Cgo+IE9uIDA3LjA1LjIwMjQgMTA6MjcsIE1pcXVlbCBS
YXluYWwgd3JvdGU6Cj4gPiBIaSBBcnNlbml5LAo+ID4gCj4gPiBhdmtyYXNub3ZAc2FsdXRlZGV2
aWNlcy5jb20gd3JvdGUgb24gVHVlLCA3IE1heSAyMDI0IDA5OjUzOjA2ICswMzAwOgo+ID4gICAK
PiA+PiBPbiAwNi4wNS4yMDI0IDE2OjQ4LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4+IEhp
IEFyc2VuaXksCj4gPj4+Cj4gPj4+IGF2a3Jhc25vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBv
biBUdWUsIDE2IEFwciAyMDI0IDExOjUxOjAwICswMzAwOgo+ID4+PiAgICAgCj4gPj4+PiBCb290
IFJPTSBjb2RlIG9uIE1lc29uIHJlcXVpcmVzIHRoYXQgc29tZSBwYWdlcyBvbiBOQU5EIG11c3Qg
YmUgd3JpdHRlbgo+ID4+Pj4gaW4gc3BlY2lhbCBtb2RlOiAic2hvcnQiIEVDQyBtb2RlIHdoZXJl
IGVhY2ggYmxvY2sgaXMgMzg0IGJ5dGVzIGFuZAo+ID4+Pj4gc2NyYW1ibGluZyBtb2RlIGlzIG9u
LiAgICAKPiA+Pj4KPiA+Pj4gT2sKPiA+Pj4gICAgIAo+ID4+Pj4gU3VjaCBwYWdlcyBsb2NhdGVk
IHdpdGggdGhlIHNwZWNpZmllZCBpbnRlcnZhbCB3aXRoaW4gc3BlY2lmaWVkIG9mZnNldC4gICAg
Cj4gPj4+Cj4gPj4+IEknbSBzb3JyeSBJIGRvbid0IGdldCB0aGF0IHNlbnRlbmNlLiAgICAKPiA+
Pgo+ID4+IFNvcnJ5LCBJIG1lYW4gdGhpcyAobGV0IG1lIGRyYXcgOikgKSA6Cj4gPj4KPiA+PiBb
IHBhZ2UgMCBdWyBwYWdlIDEgXVsgcGFnZSAyIF1bIHBhZ2UgMyBdWyBwYWdlIDQgXVsgcGFnZSA1
IF1bIHBhZ2UgNiBdWyBwYWdlIDcgXVsgcGFnZSA4IF1bIHBhZ2UgOSBdCj4gPj4KPiA+PiBGb3Ig
ZXhhbXBsZSwgd2UgaGF2ZSAxMCBwYWdlcyBzdGFydGluZyBmcm9tIHRoZSBiZWdpbm5pbmcgb2Yg
dGhlIGNoaXAgLSB0aGlzIGlzICJ3aXRoaW4gc3BlY2lmaWVkIG9mZnNldCIsCj4gPj4gZS5nLiBv
ZmZzZXQgaXMgMTAuIEJvb3RST00gb24gYXhnIG5lZWRzIHRoYXQgKGZvciBleGFtcGxlKSBldmVy
eSB0aGlyZCBwYWdlIG11c3QgYmUgd3JpdHRlbiBpbiAic3BlY2lhbCIKPiA+PiBtb2RlOiBzY3Jh
bWJsaW5nIGlzIG9uIGFuZCBFQ0MgaXMgMzg0IGJ5dGVzLiBTdWNoIHBhZ2VzIGFyZSAwLCAyLCA0
LCA2LCA4LiBFLmcuICJzcGVjaWZpZWQgaW50ZXJ2YWwiIHdpbGwKPiA+PiBiZSAzLiAgCj4gPiAK
PiA+IFNoYWxsIGJlIDIsIG5vPyAgCj4gCj4geWVzLCBzdGFydGluZyBmcm9tIDAgLSB0aGVuIDIu
IGUuZy4KPiBpZiAoIShwYWdlX251bSAlIDIpKQo+ICAgICBib290IFJPTSBuZWVkIHRoaXMgcGFn
ZQo+IAo+ID4gICAKPiA+Pgo+ID4+IFNvOgo+ID4+Cj4gPj4gYW1sb2dpYyxib290LXBhZ2VzOiAx
MAo+ID4+IGFtbG9naWMsYm9vdC1wYWdlLXN0ZXA6IDMgIAo+ID4gCj4gPiBPayBJIGdldCBpdC4g
VGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uIEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhl
Cj4gPiBsb2dpYyBiZWhpbmQgaXQgdGhvdWdoLiBEbyB5b3Uga25vdyB3aHkgdGhlIGJvb3RST00g
d291bGQgYWNjZXNzIG9ubHkKPiA+IG9uZSBwYWdlIG92ZXIgMiBvciAzPyBJcyB0aGVyZSBhIGRl
ZmF1bHQgdmFsdWU/IElzIHRoaXMgY29uZmlndXJhYmxlPyAgCj4gCj4gTm8sIGJvb3Qgcm9tIHNv
dXJjZSBpcyBjbG9zZWQsIEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gaXQuIEkgZ2V0IHRoaXMgbG9n
aWMKPiBmcm9tIG9sZCB2ZXJzaW9uIG9mIHZlbmRvcidzIHVib290IC0gaW4gcHJhY3RpY2UgdGhl
eSB1c2Ugbm9uIDIgb3IgMywgdGhleQo+IHVzZSBoYXJkY29kZWQgMTI4IHN0ZXAgdmFsdWUuIEFu
ZCBhbWxvZ2ljLGJvb3QtcGFnZXMgaXMgMTAyNAoKRmVlbHMgbGlrZSB0aGV5IGFyZSB0cnlpbmcg
dG8gdXNlIG9ubHkgdGhlIGZpcnN0IHBhZ2Ugb2YgZWFjaCBibG9jaywgbm8/CgpUaGF0J3MgdmVy
eSB3ZWlyZCBidXQgSSB1bmRlcnN0YW5kIGJldHRlci4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
