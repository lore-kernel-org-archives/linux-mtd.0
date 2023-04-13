Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB14C77B61
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Apr 2023 08:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVOB2tdN80b0yYCRG6TOt+YhSnrwSbUUhxYBOA2ZlI4=; b=R3Wp2HQON4SLn1
	Nyf6FTgxdpvSmvZEz3vxM1kP5VuBwE0tgAZcKcAxxqkZP8Y+YI3A+/sTxBSdKaMcnxAe70x9HhY9Y
	TwITSiMAqV/BfJYn15JiV98XFxb/uv5InsAJa64wcABZxaDAmUJ6yfPNBllRh4bBjVyZjji+mz59E
	V6p9fWwMGWbrudLuq8XgX2UL46NVE3fag3rcOltgADF0li5IddROLzBvCEC2NAQqDC+f4XXBO8qZ+
	Yy8YswhnCKYZLAZZms27HzbBGgJgaCx/HTnZ6eEjKWJJpgH40FFoW/NcOV03qR21neyL37SlfPo4r
	mlIQcpnYw9vJyfg3JTjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsER-005OwB-2J;
	Thu, 13 Apr 2023 08:23:03 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsEM-005Otw-30;
	Thu, 13 Apr 2023 08:23:00 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6464424000A;
	Thu, 13 Apr 2023 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681374176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ciag85mAmF6PS4e2a/+yCh2UQDbtdxy+oAzmgl6ZOwY=;
	b=XVLz1VEi8sbuAHXlIGv24JjCyZBV7wOiY3rPkDej9VhCaJyjmppyFWq9FrQ4uvDiNAbTsh
	BomeLjiGd2coZifqVaoEk75tlc7HjTN/sXsMSRdicSglQA3L9ozgoDRH2w7GpvGElJf/wD
	yWZeD6/mteB3R3fG4M8PfioM2PASX86g7aAiutruu4+v7zH43e/7K3AKzmJMJvUuvjkpiN
	+RqkKT7PFpqBCs1zrqEt422Pj8hdyNBFSpN3WGRi8vM7kIs8QkhpMS49jK0yOUln7gOodd
	8/aJ7aKZvdtqgnmMgtTLGsWVogZgkpUikiUEzlTkzAy3PU2u8/RRUH2nVmoykw==
Date: Thu, 13 Apr 2023 10:22:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liang Yang <liang.yang@amlogic.com>
Cc: Arseniy Krasnov <avkrasnov@sberdevices.ru>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, "yonghui.yu" <yonghui.yu@amlogic.com>
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before
 read
Message-ID: <20230413102253.2ee6bae4@xps-13>
In-Reply-To: <0c61eaae-053e-5768-a533-70b2ff0cc95d@amlogic.com>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
	<20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
	<20230412094400.3c82f631@xps-13>
	<ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
	<20230412113654.183350d0@xps-13>
	<4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
	<20230412141824.755b2bca@xps-13>
	<eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
	<20230412145715.58c2be4a@xps-13>
	<7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
	<20230412163214.0c764bb3@xps-13>
	<0c61eaae-053e-5768-a533-70b2ff0cc95d@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_012259_266363_5808E21E 
X-CRM114-Status: GOOD (  34.91  )
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

SGkgTGlhbmcsCgpsaWFuZy55YW5nQGFtbG9naWMuY29tIHdyb3RlIG9uIFRodSwgMTMgQXByIDIw
MjMgMTM6MzI6MDMgKzA4MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBPbiAyMDIzLzQvMTIgMjI6MzIs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiA+IAo+ID4gSGVs
bG8sCj4gPiAKPiA+IGxpYW5nLnlhbmdAYW1sb2dpYy5jb20gd3JvdGUgb24gV2VkLCAxMiBBcHIg
MjAyMyAyMjowNDoyOCArMDgwMDoKPiA+ICAgCj4gPj4gSGkgTWlxdWVsIGFuZCBBcnNlbml5LAo+
ID4+Cj4gPj4gT24gMjAyMy80LzEyIDIwOjU3LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4+
IFsgRVhURVJOQUwgRU1BSUwgXQo+ID4+Pgo+ID4+PiBIaSBBcnNlbml5LAo+ID4+Pgo+ID4+PiBh
dmtyYXNub3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gV2VkLCAxMiBBcHIgMjAyMyAxNToyMjoy
NiArMDMwMDogIAo+ID4+PiAgICA+Pj4+IE9uIDEyLjA0LjIwMjMgMTU6MTgsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6ICAKPiA+Pj4+PiBIaSBBcnNlbml5LAo+ID4+Pj4+Cj4gPj4+Pj4gYXZrcmFzbm92
QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMgMTM6MTQ6NTIgKzAzMDA6
ICAKPiA+Pj4+PiAgICAgPj4+PiBPbiAxMi4wNC4yMDIzIDEyOjM2LCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOiAgCj4gPj4+Pj4+PiBIaSBBcnNlbml5LAo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IGF2a3Jhc25v
dkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDEyIEFwciAyMDIzIDEyOjIwOjU1ICswMzAw
OiAgCj4gPj4+Pj4+PiAgICAgICA+Pj4+Pj4gT24gMTIuMDQuMjAyMyAxMDo0NCwgTWlxdWVsIFJh
eW5hbCB3cm90ZTogIAo+ID4+Pj4+Pj4+PiBIaSBBcnNlbml5LAo+ID4+Pj4+Pj4+Pgo+ID4+Pj4+
Pj4+PiBBVktyYXNub3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gV2VkLCAxMiBBcHIgMjAyMyAw
OToxNjo1OCArMDMwMDogIAo+ID4+Pj4+Pj4+PiAgICAgICAgID4+Pj4+Pj4+IFRoaXMgTkFORCBy
ZWFkcyBvbmx5IGZldyB1c2VyJ3MgYnl0ZXMgaW4gRUNDIG1vZGUgKG5vdCBmdWxsIE9PQiksIHNv
ICAKPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gIlRoaXMgTkFORCByZWFkcyIgZG9lcyBub3QgbG9v
ayByaWdodCwgZG8geW91IG1lYW4gIlN1YnBhZ2UgcmVhZHMgZG8KPiA+Pj4+Pj4+Pj4gbm90IHJl
dHJpZXZlIGFsbCB0aGUgT09CIGJ5dGVzLCI/ICAKPiA+Pj4+Pj4+Pj4gICAgICAgICA+Pj4+Pj4+
PiBmaWxsIE9PQiBidWZmZXIgd2l0aCB6ZXJvZXMgdG8gbm90IHJldHVybiBnYXJiYWdlIGZyb20g
cHJldmlvdXMgcmVhZHMgIAo+ID4+Pj4+Pj4+Pj4gdG8gdXNlci4KPiA+Pj4+Pj4+Pj4+IE90aGVy
d2lzZSAnbmFuZGR1bXAnIHV0aWxpdHkgcHJpbnRzIHNvbWV0aGluZyBsaWtlIHRoaXMgZm9yIGp1
c3QgZXJhc2VkCj4gPj4+Pj4+Pj4+PiBwYWdlOgo+ID4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+IC4u
Lgo+ID4+Pj4+Pj4+Pj4gMHgwMDAwMDdmMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYKPiA+Pj4+Pj4+Pj4+ICAgICBPT0IgRGF0YTogZmYgZmYgZmYgZmYg
MDAgMDAgZmYgZmYgODAgY2YgMjIgOTkgY2IgYWQgZDMgYmUKPiA+Pj4+Pj4+Pj4+ICAgICBPT0Ig
RGF0YTogNjMgMjcgYWUgMDYgMTYgMGEgMmYgZWIgYmIgZGQgNDYgNzQgNDEgOGUgODggNmUKPiA+
Pj4+Pj4+Pj4+ICAgICBPT0IgRGF0YTogMzggYTEgMmQgZTYgNzcgZDQgMDUgMDYgZjIgYTUgN2Ug
MjUgZWIgMzQgN2MgZmYKPiA+Pj4+Pj4+Pj4+ICAgICBPT0IgRGF0YTogMzggZWEgZGUgMTQgMTAg
ZGUgOWIgNDAgMzMgMTYgNmEgY2MgOWQgYWEgMmYgNWUKPiA+Pj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5y
dT4KPiA+Pj4+Pj4+Pj4+IC0tLQo+ID4+Pj4+Pj4+Pj4gICAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
bWVzb25fbmFuZC5jIHwgNSArKysrKwo+ID4+Pj4+Pj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQo+ID4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNv
bl9uYW5kLmMKPiA+Pj4+Pj4+Pj4+IGluZGV4IGY4NGExMDIzOGU0ZC4uZjJmMjQ3MmNiNTExIDEw
MDY0NAo+ID4+Pj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5j
Cj4gPj4+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+
Pj4+Pj4+Pj4+IEBAIC04NTgsOSArODU4LDEyIEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRf
cGFnZV9zdWIoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPiA+Pj4+Pj4+Pj4+ICAgIHN0YXRpYyBp
bnQgbWVzb25fbmZjX3JlYWRfcGFnZV9yYXcoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1
ZiwKPiA+Pj4+Pj4+Pj4+ICAgIAkJCQkgICBpbnQgb29iX3JlcXVpcmVkLCBpbnQgcGFnZSkKPiA+
Pj4+Pj4+Pj4+ICAgIHsKPiA+Pj4+Pj4+Pj4+ICsJc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5k
X3RvX210ZChuYW5kKTsKPiA+Pj4+Pj4+Pj4+ICAgIAl1OCAqb29iX2J1ZiA9IG5hbmQtPm9vYl9w
b2k7Cj4gPj4+Pj4+Pj4+PiAgICAJaW50IHJldDsgIAo+ID4+Pj4+Pj4+Pj4gICAgPj4+Pj4+Pj4g
KwltZW1zZXQob29iX2J1ZiwgMCwgbXRkLT5vb2JzaXplKTsgIAo+ID4+Pj4+Pj4+Pgo+ID4+Pj4+
Pj4+PiBJJ20gc3VycHJpc2VkIHJhdyByZWFkcyBkbyBub3QgcmVhZCB0aGUgZW50aXJlIE9PQj8g
IAo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gWWVzISBTZWVtcyBpbiBjYXNlIG9mIHJhdyBhY2Nlc3Mg
KHdoYXQgaSBzZWUgaW4gdGhpcyBkcml2ZXIpIG51bWJlciBvZiBPT0IgYnl0ZXMgcmVhZAo+ID4+
Pj4+Pj4+IHN0aWxsIGRlcGVuZHMgb24gRUNDIHBhcmFtZXRlcnM6IGZvciBlYWNoIHBvcnRpb24g
b2YgZGF0YSBjb3ZlcmVkIHdpdGggRUNDIGNvZGUgd2UgY2FuCj4gPj4+Pj4+Pj4gcmVhZCBpdCdz
IEVDQyBjb2RlIGFuZCAidXNlciBieXRlcyIgZnJvbSBPT0IgLSBpdCBpcyB3aGF0IGkgc2VlIGJ5
IGR1bXBpbmcgRE1BIGJ1ZmZlciBieQo+ID4+Pj4+Pj4+IHByaW50aygpLiBGb3IgZXhhbXBsZSBJ
J20gd29ya2luZyB3aXRoIDJLIE5BTkQgcGFnZXMsIGVhY2ggcGFnZSBoYXMgMiB4IDFLIEVDQyBi
bG9ja3MuCj4gPj4+Pj4+Pj4gRm9yIGVhY2ggRUNDIGJsb2NrIEkgaGF2ZSAxNiBPT0IgYnl0ZXMg
d2hpY2ggSSBjYW4gYWNjZXNzIGJ5IHJlYWQvd3JpdGUuIEVhY2ggMTYgYnl0ZXMKPiA+Pj4+Pj4+
PiBjb250YWlucyAyIGJ5dGVzIG9mIHVzZXIncyBkYXRhIGFuZCAxNCBieXRlcyBFQ0MgY29kZXMu
IFNvIHdoZW4gSSByZWFkIHBhZ2UgaW4gcmF3IG1vZGUKPiA+Pj4+Pj4+PiBjb250cm9sbGVyIHJl
dHVybnMgMzIgYnl0ZXMgKDIgeCAoMiArIDE0KSkgb2YgT09CLiBXaGlsZSBPT0IgaXMgcmVwb3J0
ZWQgYXMgNjQgYnl0ZXMuICAKPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBJbiBhbGwgbW9kZXMsIHdoZW4g
eW91IHJlYWQgT09CLCB5b3Ugc2hvdWxkIGdldCB0aGUgZnVsbCBPT0IuIFRoZSBmYWN0Cj4gPj4+
Pj4+PiB0aGF0IEVDQyBjb3JyZWN0aW9uIGlzIGVuYWJsZWQgb3IgZGlzYWJsZWQgZG9lcyBub3Qg
bWF0dGVyLiBJZiB0aGUgTkFORAo+ID4+Pj4+Pj4gZmVhdHVyZXMgT09CIHNlY3Rpb25zIG9mIDY0
IGJ5dGVzLCB5b3Ugc2hvdWxkIGdldCB0aGUgNjQgYnl0ZXMuCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4g
V2hhdCBoYXBwZW5zIHNvbWV0aW1lcywgaXMgdGhhdCBzb21lIG9mIHRoZSBieXRlcyBhcmUgbm90
IHByb3RlY3RlZAo+ID4+Pj4+Pj4gYWdhaW5zdCBiaXRmbGlwcywgYnV0IHRoZSBwb2xpY3kgaXMg
dG8gcmV0dXJuIHRoZSBmdWxsIGJ1ZmZlci4gIAo+ID4+Pj4+Pgo+ID4+Pj4+PiBPaywgc28gdG8g
Y2xhcmlmeSBjYXNlIGZvciB0aGlzIE5BTkQgY29udHJvbGxlcjoKPiA+Pj4+Pj4gMSkgSW4gYm90
aCBFQ0MgYW5kIHJhdyBtb2RlcyBpIG5lZWQgdG8gcmV0dXJuIHRoZSBzYW1lIHJhdyBPT0IgZGF0
YSAoZS5nLiB1c2VyIGJ5dGVzCj4gPj4+Pj4+ICAgICAgKyBFQ0MgY29kZXMpPyAgCj4gPj4+Pj4K
PiA+Pj4+PiBXZWxsLCB5b3UgbmVlZCB0byBjb3ZlciB0aGUgc2FtZSBhbW91bnQgb2YgZGF0YSwg
eWVzLiBCdXQgaW4gdGhlIEVDQwo+ID4+Pj4+IGNhc2UgdGhlIGRhdGEgd29uJ3QgYmUgcmF3IChh
dCBsZWFzdCBub3QgYWxsIG9mIGl0KS4gIAo+ID4+Pj4KPiA+Pj4+IFNvICJzYW1lIGFtb3VudCBv
ZiBkYXRhIiwgaW4gRUNDIG1vZGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiByZXR1cm5zIG9ubHkg
dXNlciBPT0IgYnl0ZXMgKGUuZy4KPiA+Pj4+IE9PQiBkYXRhIGV4Y2x1ZGluZyBFQ0MgY29kZXMp
LCBpbiByYXcgaXQgcmV0dXJucyB1c2VyIGJ5dGVzICsgRUNDIGNvZGVzLiBJSVVDIGNvcnJlY3QK
PiA+Pj4+IGJlaGF2aW91ciBpcyB0byBhbHdheXMgcmV0dXJuIHVzZXIgYnl0ZXMgKyBFQ0MgY29k
ZXMgYXMgT09CIGRhdGEgZXZlbiBpbiBFQ0MgbW9kZSA/ICAKPiA+Pj4KPiA+Pj4gSWYgdGhlIHBh
Z2UgYXJlIDJrKzY0QiB5b3Ugc2hvdWxkIHJlYWQgMmsrNjRCIHdoZW4gT09CIGFyZSByZXF1ZXN0
ZWQuCj4gPj4+Cj4gPj4+IElmIHRoZSBjb250cm9sbGVyIG9ubHkgcmV0dXJucyAyayszMkIsIHRo
ZW4gcGVyZm9ybSBhIHJhbmRvbSByZWFkIHRvCj4gPj4+IGp1c3QgbW92ZSB0aGUgcmVhZCBwb2lu
dGVyIHRvIG10ZC0+c2l6ZSArIG10ZC0+b29ic2l6ZSAtIDMyIGFuZAo+ID4+PiByZXRyaWV2ZSB0
aGUgbWlzc2luZyAzMiBieXRlcz8gIAo+ID4+Cj4gPj4gMSkgcmF3IHJlYWQgY2FuIHJlYWQgb3V0
IHRoZSB3aG9sZSBwYWdlIGRhdGEgMmsrNjRCLCBkZWNpZGVkIGJ5IHRoZSBsZW4gaW4gdGhlIGNv
bnRyb2xsZXIgcmF3IHJlYWQgY29tbWFuZDoKPiA+PiAJY21kID0gKGxlbiAmIEdFTk1BU0soNSwg
MCkpIHwgc2NyYW1ibGVyIHwgRE1BX0RJUihkaXIpOwo+ID4+IGFmdGVyIHRoYXQsIHRoZSBtaXNz
aW5nIG9vYiBieXRlcyhub3QgdXNlZCkgY2FuIGJlIGNvcGllZCBmcm9tIG1lc29uX2NoaXAtPmRh
dGFfYnVmLiBzbyB0aGUgaW1wbGVtZW50YXRpb24gb2YgbWVzb25fbmZjX3JlYWRfcGFnZV9yYXco
KSBpcyBsaWtlIHRoaXMgaWYgbmVlZC4KPiA+PiAJewo+ID4+IAkJLi4uLi4uCj4gPj4gCQltZXNv
bl9uZmNfcmVhZF9wYWdlX3N1YihuYW5kLCBwYWdlLCAxKTsKPiA+PiAJCW1lc29uX25mY19nZXRf
ZGF0YV9vb2IobmFuZCwgYnVmLCBvb2JfYnVmKTsKPiA+PiAJCW9vYl9sZW4gPSAobmFuZC0+ZWNj
LmJ5dGVzICsgMikgKiBuYW5kLT5lY2Muc3RlcHM7Cj4gPj4gCQltZW1jcHkob29iX2J1ZiArIG9v
Yl9sZW4sIG1lc29uX2NoaXAtPmRhdGFfYnVmICsgb29iX2xlbiwgbXRkLT5vb2JzaXplIC0gb29i
X2xlbik7Cj4gPj4KPiA+PiAJfQo+ID4+IDIpIEluIEVDQyBtb2RlLCB0aGUgY29udHJvbGxlciBj
YW4ndCBicmluZyBiYWNrIHRoZSBtaXNzaW5nIE9PQiBieXRlcy4gaXQgY2FuIHJlYWQgb3V0IHRo
ZSB1c2VyIGJ5dGVzIGFuZCBlY2MgYnl0ZXMgcGVyIG1lc29uX29vYmxheW91dF9vcHMgZGVmaW5l
LiAgCj4gPiAKPiA+IEFuZCB0aGVuIChpZiBvb2JfcmVxdWlyZWQpIHlvdSBjYW4gYnJpbmcgdGhl
IG1pc3NpbmcgYnl0ZXMgd2l0aAo+ID4gc29tZXRoaW5nIGFsb25nOgo+ID4gbmFuZF9jaGFuZ2Vf
cmVhZF9jb2x1bW5fb3AoY2hpcCwgbXRkLT53cml0ZXNpemUgKyBvb2JfbGVuLAo+ID4gCQkJICAg
b29iX2J1ZiArIG9vYl9sZW4sCj4gPiAJCQkgICBtdGQtPm9vYnNpemUgLSBvb2JfbGVuLAo+ID4g
CQkJICAgZmFsc2UpOwo+ID4gU2hvdWxkIG5vdCBiZSBhIGh1Z2UgcGVyZm9ybWFuY2UgaGl0LiAg
Cj4gCj4gQWZ0ZXIgZmluaXNoaW5nIEVDQyBtb2RlIHJlYWRpbmcsIHRoZSBjb2x1bW4gYWRkcmVz
cyBpbnRlcm5hbCBpbiBOQU5EIGRldmljZSBzaG91bGQgYmUgdGhlIHJpZ2h0IHBvczsgaXQgZG9l
c24ndCBuZWVkIHRvIGNoYW5nZSB0aGUgY29sdW1uIGFnYWluLiBzbyBhZGRpbmcgY29udHJvbGxl
ciByYXcgcmVhZCBmb3IgdGhlIG1pc3NpbmcgYnl0ZXMgYWZ0ZXIgRUNDIHJlYWRpbmcgbWF5IHdv
cmtzLgoKWWVzLCBpZiB0aGUgbGFzdCBieXRlIHJlYWQgaXMgdGhlIG9uZSByaWdodCBiZWZvcmUg
dGhlICJtaXNzaW5nIiBieXRlcywKdGhlbiB0aGF0IHdpbGwgd29yay4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
