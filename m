Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EF3C77B7F
	for <linux-mtd@archiver.kernel.org>; Thu, 11 May 2023 12:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhZSTru4z9WyKBTHXj8H+/pTI65TzSgSK2OZWtsnvrw=; b=ma1eWUsyfaYORh
	6bovetRuoyKwoPtxGwazxuWv8yWUzgTCMJbkwXg/dELYD1KS/ATCaXH7D2utKHu4LpXSUbMA1nSdj
	ULHT2ajXwWAuIos6v/b8zt3ZkhE3zO4O9H0145dw+705zGqdgKvk9KLBaFjbLQsxXpokBVJoPolbe
	Rq2vLIBQAWONwVrN3o36gtU4w+rYzCBMy/94fEpCV1pfEvoYOLdrMt/G7MpQzGtlMCMJ6Eat0kekG
	HpPWbvxT6eAtj3hfHk0zFpzxU/UHX49SdOJLLWKuOFrapLLaSTw9Mp0EM/Gj+tenzBJNiAPi8Smni
	nlpWPBsGWV5MU7+q2OPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px58r-008icu-0J;
	Thu, 11 May 2023 12:11:29 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px58m-008ibb-1B;
	Thu, 11 May 2023 12:11:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9AD8B1BF211;
	Thu, 11 May 2023 12:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683807077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHBJChe3M+z663zqQUKoIWUezcHT/WhhPyKWhZq8kK8=;
	b=Cvi008fTvCN+pV2cmdBb3tKzr2RMNBBDdWN6CdrV0PXczQIED2zitR7xMITRwpKLzAyRE2
	hduipi2MJQ8nMXirVterj1GmrbAn8iAbqFAsetmuhmQyXbLOxAYbfUh5EuAhQVVN4e+uHi
	nv70owS3/P69wCS4Sn1zy86jeuQOXgZQ7FAndeBWGccsqDtwUWPylGwrMRBgU/Pz7pmuoc
	CxiHMfIKfhlaTr27FL4xC9JI7g9as4jc8/BrxrUHaodA8SacHuVPhdAwsHJqWeqxiTBXnq
	6XcHotTtlWCoPWstMeA8i1XqEW08aq4958cO72s7KXm+MCW//CgEc8Id6JgYSg==
Date: Thu, 11 May 2023 14:11:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang
 <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] mtd: rawnand: meson: rename node for chip select
Message-ID: <20230511141114.04cbd9f1@xps-13>
In-Reply-To: <4561f558-1d34-a7a9-2a05-f6453b0ed9a9@sberdevices.ru>
References: <20230510110835.26115-1-AVKrasnov@sberdevices.ru>
	<20230510110835.26115-7-AVKrasnov@sberdevices.ru>
	<CAFBinCAbTuNGEG13f71F8vhN3yGce+kkYJ7PHMpZbh8DzSapJg@mail.gmail.com>
	<20230510225359.061c2df6@xps-13>
	<6918ed54-3929-4832-1e93-6eb55b75c82b@sberdevices.ru>
	<20230511111204.0b0b3d70@xps-13>
	<dd25efa3-e46a-e857-d355-53330a8a4181@sberdevices.ru>
	<4561f558-1d34-a7a9-2a05-f6453b0ed9a9@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_051125_667499_7A4CA886 
X-CRM114-Status: GOOD (  32.33  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUaHUsIDExIE1h
eSAyMDIzIDEzOjE2OjU5ICswMzAwOgoKPiBPbiAxMS4wNS4yMDIzIDEyOjE3LCBBcnNlbml5IEty
YXNub3Ygd3JvdGU6Cj4gPiAKPiA+IAo+ID4gT24gMTEuMDUuMjAyMyAxMjoxMiwgTWlxdWVsIFJh
eW5hbCB3cm90ZTogIAo+ID4+IEhpIEFyc2VuaXksCj4gPj4KPiA+PiBhdmtyYXNub3ZAc2JlcmRl
dmljZXMucnUgd3JvdGUgb24gVGh1LCAxMSBNYXkgMjAyMyAxMTo1OTowNyArMDMwMDoKPiA+PiAg
Cj4gPj4+IE9uIDEwLjA1LjIwMjMgMjM6NTMsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPj4+Cj4g
Pj4+IEhlbGxvIE1hcnRpbiwgTWlxdWVsCj4gPj4+ICAKPiA+Pj4+IEhpIE1hcnRpbiAmIEFyc2Vu
aXksCj4gPj4+Pgo+ID4+Pj4gbWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbSB3cm90
ZSBvbiBXZWQsIDEwIE1heSAyMDIzIDIyOjQwOjM3Cj4gPj4+PiArMDIwMDoKPiA+Pj4+ICAgICAK
PiA+Pj4+PiBIZWxsbyBBcnNlbml5LAo+ID4+Pj4+Cj4gPj4+Pj4gT24gV2VkLCBNYXkgMTAsIDIw
MjMgYXQgMToxM+KAr1BNIEFyc2VuaXkgS3Jhc25vdgo+ID4+Pj4+IDxBVktyYXNub3ZAc2JlcmRl
dmljZXMucnU+IHdyb3RlOiAgICAKPiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhpcyByZW5hbWVzIG5vZGUg
d2l0aCB2YWx1ZXMgZm9yIGNoaXAgc2VsZWN0IGZyb20gInJlZyIgdG8gImNzIi4gSXQgaXMKPiA+
Pj4+Pj4gbmVlZGVkIGJlY2F1c2Ugd2hlbiBPVFAgYWNjZXNzIGlzIGVuYWJsZWQgb24gdGhlIGF0
dGFjaGVkIHN0b3JhZ2UsIE1URAo+ID4+Pj4+PiBzdWJzeXN0ZW0gcmVnaXN0ZXJzIHRoaXMgc3Rv
cmFnZSBpbiB0aGUgTlZNRU0gc3Vic3lzdGVtLiBOVk1FTSBpbiB0dXJuCj4gPj4+Pj4+IHRyaWVz
IHRvIHVzZSAicmVnIiBub2RlIGluIGl0cyBvd24gbWFubmVyLCBzdXBwb3NlcyB0aGF0IGl0IGhh
cyBhbm90aGVyCj4gPj4+Pj4+IGxheW91dC4gQWxsIG9mIHRoaXMgbGVhZHMgdG8gZGV2aWNlIGlu
aXRpYWxpemF0aW9uIGZhaWx1cmUuICAgICAgCj4gPj4+Pj4gSW4gZ2VuZXJhbDogaWYgd2UgY2hh
bmdlIHRoZSBkZXZpY2UtdHJlZSBpbnRlcmZhY2UgKGluIHRoaXMgY2FzZToKPiA+Pj4+PiByZXBs
YWNpbmcgYSAicmVnIiB3aXRoIGEgImNzIiBwcm9wZXJ0eSkgdGhlIGR0LWJpbmRpbmdzIGhhdmUg
dG8gYmUKPiA+Pj4+PiB1cGRhdGVkIGFzIHdlbGwuICAgIAo+ID4+Pj4KPiA+Pj4+IFRydWUsIGFu
ZCBJIHdvdWxkIGFkZCwgYmluZGluZ3Mgc2hvdWxkIG5vdCBiZSBicm9rZW4uICAgIAo+ID4+Pgo+
ID4+PiBJIHNlZSwgdGhhdCdzIHRydWUuIFRoYXQgaXMgYmFkIHdheSB0byBjaGFuZ2UgYmluZGlu
Z3MuCj4gPj4+ICAKPiA+Pj4+ICAgICAKPiA+Pj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci55YW1sIGFuZAo+ID4+Pj4+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnlhbWwgc2hvdwo+
ID4+Pj4+IHRoYXQgdGhlIGNoaXAgc2VsZWN0IG9mIGEgTkFORCBjaGlwIGlzIHNwZWNpZmllZCB3
aXRoIGEgInJlZyIKPiA+Pj4+PiBwcm9wZXJ0eS4gICAgCj4gPj4+Pgo+ID4+Pj4gQWxsIE5BTkQg
Y29udHJvbGxlciBiaW5kaW5nIGV4cGVjdCB0aGUgY2hpcC1zZWxlY3QgdG8gYmUgaW4gdGhlCj4g
Pj4+PiAncmVnJyBwcm9wZXJ0eSwgdmVyeSBtdWNoIGxpa2UgYSBzcGkgZGV2aWNlIHdvdWxkIHVz
ZSByZWcgdG8gc3RvcmUgdGhlCj4gPj4+PiBjcyBhcyB3ZWxsOiB0aGUgcmVnIHByb3BlcnR5IHRl
bGxzIHlvdSBob3cgeW91IGFkZHJlc3MgdGhlIGRldmljZS4KPiA+Pj4+Cj4gPj4+PiBJIGFsc28g
ZnVsbHkgYWdyZWUgd2l0aCBNYXJ0aW4ncyBjb21tZW50cyBiZWxvdy4gQ2hhbmdpbmcgcmVnIGlz
IGxpa2VseQo+ID4+Pj4gYSB3cm9uZyBhcHByb2FjaCA6KQo+ID4+Pj4gICAgIAo+ID4+Pj4+IEFs
c28gdGhlIGNvZGUgaGFzIHRvIGJlIGJhY2t3YXJkcyBjb21wYXRpYmxlIHdpdGggb2xkIC5kdGJz
Lgo+ID4+Pj4+ICAgIAo+ID4+Pj4+PiBFeGFtcGxlOgo+ID4+Pj4+Pgo+ID4+Pj4+PiBbLi4uXSBu
dm1lbSBtdGQwLXVzZXItb3RwOiBudm1lbTogaW52YWxpZCByZWcgb24gL3NvYy9idXNAZmZlMDAw
MDAvLi4uCj4gPj4+Pj4+IFsuLi5dIG10ZCBtdGQwOiBGYWlsZWQgdG8gcmVnaXN0ZXIgT1RQIE5W
TUVNIGRldmljZQo+ID4+Pj4+PiBbLi4uXSBtZXNvbi1uYW5kIGZmZTA3ODAwLm5mYzogZmFpbGVk
IHRvIHJlZ2lzdGVyIE1URCBkZXZpY2U6IC0yMgo+ID4+Pj4+PiBbLi4uXSBtZXNvbi1uYW5kIGZm
ZTA3ODAwLm5mYzogZmFpbGVkIHRvIGluaXQgTkFORCBjaGlwcwo+ID4+Pj4+PiBbLi4uXSBtZXNv
bi1uYW5kOiBwcm9iZSBvZiBmZmUwNzgwMC5uZmMgZmFpbGVkIHdpdGggZXJyb3IgLTIyICAgICAg
Cj4gPj4+Pj4gVGhpcyBpcyBvZGQgLSBjYW4geW91IHBsZWFzZSBzaGFyZSB5b3VyIGRlZmluaXRp
b24gb2YgdGhlICZuZmMgbm9kZT8gICAgCj4gPj4+Cj4gPj4+IFN1cmUsIGhlcmUgaXQgaXM6Cj4g
Pj4+Cj4gPj4+IG10ZF9uYW5kOiBuZmNANzgwMCB7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
IAo+ID4+PiAJY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWF4Zy1uZmMiOwo+ID4+PiAJLi4u
Cj4gPj4+IAluYW5kQDAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gPj4+ICAg
ICAgICAgCXJlZyA9IDwwPjsKPiA+Pj4gICAgICAgICB9Owo+ID4+PiB9Cj4gPj4+Cj4gPj4+IEkg
Y2hlY2tlZCwgdGhhdCAnbmFuZF9zZXRfZmxhc2hfbm9kZSgpJyBpcyBjYWxsZWQgd2l0aCAnbmFu
ZEAwJyBhbmQgaSBzdXBwb3NlCj4gPj4+IHRoYXQgaXQgaXMgY29ycmVjdCAoYXMgWW91IG1lbnRp
b25lZCBiZWxvdykuIEJ1dCwgJ252bWVtX2FkZF9jZWxsc19mcm9tX29mKCknIGlzIGNhbGxlZAo+
ID4+PiB3aXRoIHBhcmVudDogJ25mY0A3ODAwJywgdGhlbiBpdCBpdGVyYXRlcyBvdmVyIGl0cyBj
aGlsZHMsIGUuZy4gJ25hbmRAMCcgYW5kIHRodXMgaSBnZXQgc3VjaAo+ID4+PiBzaXR1YXRpb24u
IEkgZ3Vlc3MsIHRoYXQgJ252bWVtX2FkZF9jZWxsc19mcm9tX29mKCknIG11c3QgYmUgY2FsbGVk
IHdpdGggJ25hbmRAMCcgPyAgCj4gPj4KPiA+PiBXZSByZWNlbnRseSBoYWQgaXNzdWVzIHdpdGgg
bnZtZW0gcGFyc2luZywgYnV0IEkgYmVsaWV2ZSBhIG1haW5saW5lCj4gPj4ga2VybmVsIHNob3Vs
ZCBub3cgYmUgcGVyZmVjdGx5IHdvcmtpbmcgb24gdGhpcyByZWdhcmQuIFdoYXQgdmVyc2lvbiBv
Zgo+ID4+IHRoZSBMaW51eCBrZXJuZWwgYXJlIHlvdSB1c2luZz8gIAo+ID4gCj4gPiBNeSBjdXJy
ZW50IHZlcnNpb24gaXM6Cj4gPiAKPiA+IFZFUlNJT04gPSA2ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ID4gUEFUQ0hMRVZFTCA9
IDIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgCj4gPiBTVUJMRVZFTCA9IDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKPiA+IEVYVFJBVkVSU0lPTiA9IC1yYzggCj4gPiAKPiA+
IEZpeCB3YXMgaW4gZHJpdmVycy9udm1lbS8qID8KPiA+IAo+ID4gVGhhbmtzLCBBcnNlbml5ICAK
PiAKPiBVcGQ6IEkgcmVzb2x2ZWQgcHJvYmxlbSBpbiB0aGUgZm9sbG93aW5nIHdheToKPiAKPiBu
YW5kQDAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gCXJlZyA9IDwwPjsvL2No
aXAgc2VsZWN0Cj4gCglwYXJ0aXRpb25zIHsKCQljb21wYXRpYmxlID0gLi4uCgo+IAlvdHBAMCB7
ICAgICAgICAgICAgICAgICAgICAgICAgIAo+IAkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47ICAgCj4g
CQkjc2l6ZS1jZWxscyA9IDwwPjsgICAgICAKCiNhZGRyZXNzL3NpemUtY2VsbHMgaXMgbm90IG5l
ZWRlZCBoZXJlCgo+IAkJY29tcGF0aWJsZSA9ICJ1c2VyLW90cCI7Cj4gCQlyZWcgPSA8QSBCPjsg
ICAgICAgICAgICAKPiAJfTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAJb3RwQDEg
eyAgICAgICAgICAgICAgICAgICAgICAgICAKPiAJCSNhZGRyZXNzLWNlbGxzID0gPDI+OyAgIAo+
IAkJI3NpemUtY2VsbHMgPSA8MD47ICAgICAgCgpEaXR0bwoKPiAJCWNvbXBhdGlibGUgPSAiZmFj
dG9yeS1vdHAiOwo+IAkJcmVnID0gPEMgRD47ICAgICAgICAgICAgCj4gCX07ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgCgoJfTsKCj4gfTsKPiAKPiBOb3cgbnZtZW0gc3Vic3lzdGVtIHBh
cnNlcyAnb3RwQDAnIGFuZCAnb3RwQDEnIGFuZCBlcnJvciBpcyBnb25lLiAnY29tcGF0aWJsZScg
dmFsdWVzIGFyZQo+IHRoZSBzYW1lIGFzIGluIGRyaXZlcnMvbXRkL210ZGNvcmUuYzptdGRfb3Rw
X252bWVtX2FkZCgpLiAncmVnJyBpbiAnbmFuZEAwJyBpcyB1c2VkIGFzCj4gY2hpcCBzZWxlY3Qg
YXMgc3VwcG9zZWQuCgpJIGRvbid0IGZ1bGx5IGdldCBpdC4gVGhlIHBhcnNpbmcgb24gdGhlIG52
bWVtIHNpZGUgc2hvdWxkIG5vdCBmYWlsIGlmCnRoZXJlIGlzIG5vIHN1YnBhcnRpdGlvbi9vdHAt
cmVnaW9uIGRlZmluZWQuIENhbiB5b3UgY29uZmlybSBhbiBlbXB0eQpOQU5EIGRldmljZSBub2Rl
IHdvcmtzPyBCZWNhdXNlIHlvdXIgbGFzdCBlLW1haWwgc3VnZ2VzdGVkIHRoZSBvcHBvc2l0ZS4K
Cj4gCj4gSSB0aGluaywgdGhpcyBwYXRjaCBzaG91bGQgYmUgYWJhbmRvbmVkIGluIHRoZSBuZXh0
IHZlcnNpb24uCj4gCj4gVGhhbmtzLCBBcnNlbml5Cj4gCj4gPiAgIAo+ID4+Cj4gPj4gVGhhbmtz
LAo+ID4+IE1pcXXDqGwgIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
