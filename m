Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671AEC76195
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 08:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCJRcyOxdUAlaH84lY20NnUuHnWAUfuQ73ibE8JpN18=; b=qooBzCxvH0UEoG
	t/cs4EpsbptRY6ij6Ag43V9cfrz3rcgA8F/f3U+vLxbkkaICncxymEbY5FhYeded+FPwTMyJAEhEx
	oYIABoL3wmibMolVTFSoSJtn//13YVGUghTq4GPoQ/KnA9kVUnocnnb9aP21QdwQ7dGIx298vaW7d
	EaLYmIov7CaBP1Hz2k/QVOIq1OMHzJX0lBf67tu6tKvdXWit14n2XpaKks7ZOOGsX2PzimhMM5a+m
	eRUniJFh71uwNVurXMH/CSEqeJP4V7jy7aBXaT5GDqKGrbJVj8Ufb+gfKNw1rJ8fSQOVCeLvoxrlo
	/ZjH7s3vo63w/Y+BDqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph4bd-00DZq0-1S;
	Tue, 28 Mar 2023 08:23:01 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph4bY-00DZoI-2q;
	Tue, 28 Mar 2023 08:22:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0A9BAE0009;
	Tue, 28 Mar 2023 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679991772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htgOFhIsEYf5tZDAyZCjs82oZQbrdIHpa5DymP6TNjs=;
	b=H9w01miYNhLNySU7HcvOf3gpLe5YiGRYH5ybiA8oI88eiOaa2y44LUW+zqgvAXuO5o6Vdd
	pHrVesjEnQVzk1FeIdMPtDh/zJAnHkWNb6DG2l4+aoAKcUjDXrVX96cv4XOur12WpzT7gl
	dTGqPWR1Ctmp0wVwB3HBqfRbGWAObxtQazj0R2lPRWcmuHqfBLAVHaz1urbFAiHc8A7K/r
	2iizLXfpdanRdCKJuKW8FZI2T0k5/DSLcdoNKvRJqNhmoXf8VjICYh1hcarVy02gp/20hx
	trrONIyzEG476kMeUHnz9N1jFfEnrm7aJXw1Olu4bJKKkzxG1SPKcsZokBc7bQ==
Date: Tue, 28 Mar 2023 10:22:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle
 <michael@walle.cc>, linux-mtd@lists.infradead.org, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Jaime Liao
 <jaimeliao.tw@gmail.com>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Michal Simek <monstr@monstr.eu>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 7/8] mtd: spi-nor: Enhance locking to support reads
 while writes
Message-ID: <20230328102246.7d36675d@xps-13>
In-Reply-To: <ebe01832-96c3-449a-462e-342ed706ef8a@linaro.org>
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
	<20230201113603.293758-8-miquel.raynal@bootlin.com>
	<c76eb1cf-3555-d042-a18f-93f240e1cd64@linaro.org>
	<20230324184112.2090f4a7@xps-13>
	<ebe01832-96c3-449a-462e-342ed706ef8a@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_012257_220945_BA1C0647 
X-CRM114-Status: GOOD (  35.44  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAyNyBNYXIg
MjAyMyAxMDoyOTowMyArMDEwMDoKCj4gT24gMy8yNC8yMyAxNzo0MSwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiA+IEhpIFR1ZG9yLAo+ID4gICAKPiAKPiBIaSEKPiAKPiA+IHR1ZG9yLmFtYmFydXNA
bGluYXJvLm9yZyB3cm90ZSBvbiBGcmksIDE3IE1hciAyMDIzIDA1OjU5OjA4ICswMDAwOgo+ID4g
ICAKPiA+PiBIaSwgTWlxdWVsLAo+ID4+Cj4gPj4gSSBmaW5kIHRoZSBvdmVyYWxsIGlkZWEgZ29v
ZC4gIAo+ID4gCj4gPiBUaGFua3MgYSBsb3QgZm9yIHRoZSBkZXRhaWxlZCByZXZpZXchCj4gPiAg
IAo+ID4+IE9uIDIvMS8yMyAxMTozNiwgTWlxdWVsIFJheW5hbCB3cm90ZTogIAo+ID4+PiBPbiBk
ZXZpY2VzIGZlYXR1cmluZyBzZXZlcmFsIGJhbmtzLCB0aGUgUmVhZCBXaGlsZSBXcml0ZSAoUldX
KSBmZWF0dXJlCj4gPj4+IGlzIGhlcmUgdG8gaW1wcm92ZSB0aGUgb3ZlcmFsbCBwZXJmb3JtYW5j
ZSB3aGVuIHBlcmZvcm1pbmcgcGFyYWxsZWwKPiA+Pj4gcmVhZHMgYW5kIHdyaXRlcyBhdCBkaWZm
ZXJlbnQgbG9jYXRpb25zIChkaWZmZXJlbnQgYmFua3MpLiBUaGUgZm9sbG93aW5nCj4gPj4+IGNv
bnN0cmFpbnRzIGhhdmUgdG8gYmUgdGFrZW4gaW50byBhY2NvdW50Ogo+ID4+PiAxIzogQSBzaW5n
bGUgb3BlcmF0aW9uIGNhbiBiZSBwZXJmb3JtZWQgaW4gYSBnaXZlbiBiYW5rLgo+ID4+PiAyIzog
T25seSBhIHNpbmdsZSBwcm9ncmFtIG9yIGVyYXNlIG9wZXJhdGlvbiBjYW4gaGFwcGVuIG9uIHRo
ZSBlbnRpcmUKPiA+Pj4gICAgIGNoaXAgKGNvbW1vbiBoYXJkd2FyZSBsaW1pdGF0aW9uIHRvIGxp
bWl0IGNvc3RzKQo+ID4+PiAzIzogUmVhZHMgbXVzdCByZW1haW4gc2VyaWFsaXplZCBldmVuIHRo
b3VnaCByZWFkcyBvbiBkaWZmZXJlbnQgYmFua3MKPiA+Pj4gICAgIG1pZ2h0IG9jY3VyIGF0IHRo
ZSBzYW1lIHRpbWUuICAgIAo+ID4+Cj4gPj4gMyMgaXMgdW5jbGVhciBpZiBvbmUgbGltaXRzIGp1
c3QgYXQgcmVhZGluZyB0aGUgY29tbWl0IG1lc3NhZ2UuIEFyZSB0aGUKPiA+PiByZWFkcyBzZXJp
YWxpemVkIHBlciBiYW5rIG9yIHBlciBmbGFzaD8gIAo+ID4gCj4gPiBQZXIgZmxhc2guCj4gPiAg
IAo+ID4+IEFmdGVyIHJlYWRpbmcgdGhlIGNvZGUsIGl0IGxvb2tzIGxpa2UgYWxsIHRoZSByZWFk
cyBhcmUgc2VyaWFsaXplZCBwZXIKPiA+PiBmbGFzaCByZWdhcmRsZXNzIGlmIGl0IHJlYWRzIHJl
Z2lzdGVycyBvciBtZW1vcnkuIEkgYXNzdW1lIHlvdSBtZWFudAo+ID4+IHRoYXQgY3Jvc3Npbmcg
YSBiYW5rIGJvdW5kYXJ5IHdpdGggYSBzaW5nbGUgcmVhZCBpcyBmaW5lLiAgCj4gPiAKPiA+IFll
cywgSSB3aWxsIHVwZGF0ZSB0aGF0IGl0ZW0gdG8gY2xhcmlmeS4gIAo+IAo+IHRoYW5rcyEKPiAK
PiA+ICAgCj4gPj4gQnV0IGNhbiB5b3UKPiA+PiByZWFsbHkgcmVhZCBmcm9tIGJhbmsgMSBhbmQg
YmFuayAzIGF0IHRoZSBzYW1lIHRpbWU/IFRoZSBjb2RlIGRvZXNuJ3QKPiA+PiB0YWtlIHRoaXMg
aW50byBjb25zaWRlcmF0aW9uLiAgCj4gPiAKPiA+IFllcyB0aGlzIGlzIHRha2VuIGludG8gYWNj
b3VudCBhbmQgc3VwcG9ydGVkLCBhIHJlYWQgY2FuIGNyb3NzIGEgYmFuawo+ID4gYm91bmRhcnku
ICAKPiAKPiBObywgSSBtZWFudCB0aGF0IHlvdSBjYW4ndCBkbyBhIHJlYWQgZnJvbSBiYW5rIDEg
YW5kIHdoaWxlIHRoZSBmaXJzdAo+IHJlYWQgaXMgaW4gcHJvZ3Jlc3MsIHRvIHN0YXJ0IGEgc2Vj
b25kIHJlYWQgZnJvbSB0aGUgM3JkIGJhbmsgYW5kCj4gcHJvY2VzcyBib3RoIHJlYWRzIGluIHBh
cmFsbGVsLCByZWFkaW5nIGZyb20gYm90aCBiYW5rcyBhdCB0aGUgc2FtZQo+IHRpbWUuIEF0IGxl
YXN0IG5vdCB3aXRoIHRoZSBjdXJyZW50IGNvZGUsIGJlY2F1c2UgeW91IHNldAo+IHJ3dy57b25n
b2luZ19pbywgb25nb2luZ19yZH0gdG8gdHJ1ZSBhbmQgdGhlIHNlY29uZCByZWFkIHdpbGwgd2Fp
dC4KPiBDcm9zcyBib3VuZGFyeSByZWFkcyBvbiBzdWNjZXNzaXZlIGJhbmtzIHNob3VsZCB3b3Jr
IHdpdGggY3VycmVudCBjb2RlLAo+IHllcy4gU28gd2hhdCBkb2VzIHRoZSBodyBzdXBwb3J0PwoK
T2ssIHNvcnJ5IGZvciB0aGUgY29uZnVzaW9uLiBTbywgSSB0aGluayBJIHJlbWVtYmVyIGEgZGlz
Y3Vzc2lvbiB3aGVyZQpJIHdhcyB0b2xkIHRoYXQgdGhpcyB3YXMgbm90IHN1cHBvcnRlZCBldmVu
IHRob3VnaCBpdCB3b3VsZCBub3QgYmUKZXh0cmVtZWx5IGNvbXBsZXggdG8gc3VwcG9ydCBhdCBh
IHBoeXNpY2FsIGxldmVsICgianVzdCIgYnkgaW5jcmVhc2luZwp0aGUgY3VycmVudCBzb3VyY2Up
LiBCdXQgSUlSQyByaWdodCBub3cgdGhpcyBpcyBub3Qgc3VwcG9ydGVkLiBBbnlob3csCnRoZSBt
YWluIHRhcmdldCBvZiB0aGUgUldXIGlzIHRvIHBlcmZvcm0gYSByZWFkIGR1cmluZyBhIHdoaWxl
LCB0aGlzIGlzCnZlcnkgaGFuZHkgZm9yIHBlcmZvcm1pbmcgZWcuIHN5c3RlbSB1cGRhdGVzIGJl
c2lkZXMgcmVkdWNpbmcgdGhlCm92ZXJhbGwgbGF0ZW5jeSwgYnV0IEkgZG9uJ3QgdGhpbmsgd2Ug
d2FudCB0byBicmluZyBldmVuIG1vcmUKcGFyYWxsZWxpc20gYmV0d2VlbiByZWFkcy4gQWN0dWFs
bHkgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gd291bGQKbm90IHdvcmsgYW5kIGEgd2hvbGUg
bXRkIEkvTyBzY2hlZHVsZXIgd291bGQgYmUgbmVlZGVkIGZvciB0aGF0LCB3aGljaAppcyB5ZXQg
YW5vdGhlciB0YXNrLgoKClsuLi5dCgo+ID4+PiBAQCAtMTA4Nyw3ICsxMTU3LDgxIEBAIHN0YXRp
YyB2b2lkIHNwaV9ub3JfdW5wcmVwKHN0cnVjdCBzcGlfbm9yICpub3IpCj4gPj4+ICAJCW5vci0+
Y29udHJvbGxlcl9vcHMtPnVucHJlcGFyZShub3IpOwo+ID4+PiAgfQo+ID4+PiAgCj4gPj4+ICtz
dGF0aWMgdm9pZCBzcGlfbm9yX29mZnNldF90b19iYW5rcyhzdHJ1Y3Qgc3BpX25vciAqbm9yLCBs
b2ZmX3Qgc3RhcnQsIHNpemVfdCBsZW4sICAgIAo+ID4+Cj4gPj4gcGFzcyBkaXJlY3RseSB0aGUg
YmFua19zaXplIGluc3RlYWQgb2YgdGhlIHBvaW50ZXIgdG8gbm9yLCB5b3UnbGwgYXZvaWQKPiA+
PiB0aGUgZG91YmxlIGRlcmVmZXJlbmNlLiAgCj4gPiAKPiA+IERvbmUKPiA+ICAgCj4gPj4gIAo+
ID4+PiArCQkJCSAgICB1bnNpZ25lZCBpbnQgKmZpcnN0LCB1bnNpZ25lZCBpbnQgKmxhc3QpICAg
IAo+ID4+Cj4gPj4gdW5zaWduZWQgbG9uZyBsb25nICpmaXJzdCwgKmxhc3QgPyAgCj4gPiAKPiA+
IEFjdHVhbGx5IEkgd2FudCB0aGVzZSB0byByZW1haW4gdW5zaWduZWQgaW50LCB0aGUgVUxMIHN1
ZmZpeCBqdXN0IG1lYW4KPiA+IHRoZSBpbnB1dCBtaWdodCBiZSBhIDY0LWJpdCB2YWx1ZSwgYnV0
IGl0IGlzIHF1aXRlIGNvbW1vbiB0byB0cmVhdCB0aGUKPiA+IG91dHB1dCBhcyAzMi1iaXQuIEhl
cmUgd2UgZG8gbm90IGV4cGVjdCB2YWx1ZXMgZ3JlYXRlciB0aGFuIDQuICAKPiAKPiBPay4gVGhl
biBtYXliZSB3ZSBzaG91bGQgbWF0Y2ggaG93IHdlIGRlZmluZSBuYmFua3MgaW4gTk9SLiBXYXMg
aXQgYSB1OD8KCldoeSBub3QuCgo+IAo+ID4gICAKPiA+Pj4gK3sKPiA+Pj4gKwkqZmlyc3QgPSBE
SVZfUk9VTkRfRE9XTl9VTEwoc3RhcnQsIG5vci0+cGFyYW1zLT5iYW5rX3NpemUpOwo+ID4+PiAr
CSpsYXN0ID0gRElWX1JPVU5EX0RPV05fVUxMKHN0YXJ0ICsgbGVuIC0gMSwgbm9yLT5wYXJhbXMt
PmJhbmtfc2l6ZSk7Cj4gPj4+ICt9Cj4gPj4+ICsKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
