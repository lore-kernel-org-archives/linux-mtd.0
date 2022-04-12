Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0312EC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 07:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QGC3tZ/zi4KL4Uns1H3pJxR+VbnQDhtGvnqGNYc+ac=; b=vJVjQhQdt3AKug
	BGYXB7sVoRfYTtSeuVucFSeykshvwSzfSqI4yY54SOyUb/hKUd2I9/dk6TlW22BJXfuqu8qqJDOTV
	HZ4zt/77QaTZD86PW0UyWXxfGYzqhmNHvGaJW3Pr85I3IRhX3DIHFO+g7BpaOps0SuU//kJZz4ENu
	Kh0M152EOUb5j/A0Vxm7VmCwT7FeEmnppNACOfxCYhRheYFVSebwNkSnWv6lUYPLzcX8TLrFGop4b
	FKuD7VR4FspENF3+fAeCz5dccCfFwINoHzodAvdYJFlvfKxtK+H3GFbWYSrJOkyZ+oIPOw6E1oDVY
	QDdRjS6H7yZXyJoSw5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neBMc-00CMV7-Ds; Tue, 12 Apr 2022 07:55:02 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neBGG-00CJNc-Uj
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 07:48:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A4B9FF80A;
 Tue, 12 Apr 2022 07:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649749706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YW/FpTIll39+9L5ULUaE9f07ZfIeCCQhSd38iCsA3pg=;
 b=aXzEGK9EGcOVOJifzQG1YR9RgJX9bx4SRppY92QDfZCpkF7UG+SuAE+Vt3fD+s4lUG9Dp/
 6E2GOvRJUD3BrQQRuyBjEG+aPdyB+l36E0p6D5FAv0+/lUp9U/0BO+UexyjYN4nbjbBKi3
 yKTP2jtMkAMg4BZuEJtHoDGlf3stW/95B1L1ZFDcIx1wGTsTUjAmLnV+PLRNQbOc8s11D6
 FHRkgZg4BlnxjYRczCsHCgpPCxz242Zd0t2mGEjZrB8JJvC4krFD1gtGPAUu6q1j90u+c/
 8BFlf51DjUxZS/ikaKKj/5jV85k1S3INssgYwm81Xq1Zsnt5wDKZwG/775U/ug==
Date: Tue, 12 Apr 2022 09:48:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <p.yadav@ti.com>, Paul Cercueil
 <paul@crapouillou.net>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bastian Hecht <hechtb@googlemail.com>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Guennadi Liakhovetski
 <g.liakhovetski@gmx.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: Fix return value check of
 wait_for_completion_timeout
Message-ID: <20220412094822.3818ebc2@xps13>
In-Reply-To: <61783400-4df2-47af-78a7-7acb715c3a71@gmail.com>
References: <202204121253.NcZifMQi-lkp@intel.com>
 <20220412063703.8537-1-linmq006@gmail.com>
 <20220412090649.33bb3f8b@xps13>
 <61783400-4df2-47af-78a7-7acb715c3a71@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_004829_297769_D582E347 
X-CRM114-Status: GOOD (  28.25  )
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

SGkgTWlhb3FpYW4sCgpsaW5tcTAwNkBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAxMiBBcHIgMjAy
MiAxNTo0MjowMiArMDgwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IFRoYW5rcyBmb3IgeW91ciByZXBs
eS4KPiAKPiBPbiAyMDIyLzQvMTIgMTU6MDYsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBN
aWFvcWlhbiwKPiA+Cj4gPiBsaW5tcTAwNkBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAxMiBBcHIg
MjAyMiAwNjozNjo1MiArMDAwMDoKPiA+ICAKPiA+PiB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVv
dXQoKSByZXR1cm5zIHVuc2lnbmVkIGxvbmcgbm90IGludC4KPiA+PiBJdCByZXR1cm5zIDAgaWYg
dGltZWQgb3V0LCBhbmQgcG9zaXRpdmUgaWYgY29tcGxldGVkLgo+ID4+IFRoZSBjaGVjayBmb3Ig
PD0gMCBpcyBhbWJpZ3VvdXMgYW5kIHNob3VsZCBiZSA9PSAwIGhlcmUKPiA+PiBpbmRpY2F0aW5n
IHRpbWVvdXQgd2hpY2ggaXMgdGhlIG9ubHkgZXJyb3IgY2FzZS4KPiA+Pgo+ID4+IEZpeGVzOiA4
MzczOGQ4N2UzYTAgKCJtdGQ6IHNoX2ZsY3RsOiBBZGQgRE1BIGNhcGFiaWx0eSIpCj4gPj4gU2ln
bmVkLW9mZi1ieTogTWlhb3FpYW4gTGluIDxsaW5tcTAwNkBnbWFpbC5jb20+Cj4gPj4gLS0tCj4g
Pj4gY2hhbmdlIGluIHYyOgo+ID4+IC0gaW5pdGlhbGl6ZSByZXQgdG8gMS4KPiA+PiAtLS0KPiA+
PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc2hfZmxjdGwuYyB8IDggKysrKystLS0KPiA+PiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9mbGN0bC5jIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc2hfZmxjdGwuYwo+ID4+IGluZGV4IGI4NWI5YzZmY2M0Mi4uMjM3MzI1MWY1ODVi
IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3NoX2ZsY3RsLmMKPiA+PiAr
KysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zaF9mbGN0bC5jCj4gPj4gQEAgLTM4NCw3ICszODQs
OCBAQCBzdGF0aWMgaW50IGZsY3RsX2RtYV9maWZvMF90cmFuc2ZlcihzdHJ1Y3Qgc2hfZmxjdGwg
KmZsY3RsLCB1bnNpZ25lZCBsb25nICpidWYsCj4gPj4gIAlkbWFfYWRkcl90IGRtYV9hZGRyOwo+
ID4+ICAJZG1hX2Nvb2tpZV90IGNvb2tpZTsKPiA+PiAgCXVpbnQzMl90IHJlZzsKPiA+PiAtCWlu
dCByZXQ7Cj4gPj4gKwlpbnQgcmV0ID0gMTsgIAo+ID4gRG9lcyBub3QgbG9vayByaWdodC4gSSBr
bm93IHRoaXMgZnVuY3Rpb24gcmV0dXJucyA+IDAgb24gcG9zaXRpdmUKPiA+IG91dGNvbWVzIGJ1
dCB0aGlzIGRvZXMgbm90IG1ha2UgYW55IHNlbnNlIGluIHRoZSBmaXJzdCBwbGFjZS4gIAo+IAo+
IFllcywgSSBtYWRlIGEgbWlzdGFrZSwgTm93IEkgcmVhbGl6ZSB0aGF0IGluIHYyLCBpdCB3aWxs
IHJldHVybiAxIGluIGVycm9yIHBhdGgKPiAKPiB3aGVuIERNQSBzdWJtaXQgZmFpbGVkLgoKTm90
IDEsIGJ1dCBhIHByb3BlciBlcnJvciBjb2RlIHBsZWFzZSAoLUVUSU1FRE9VVCwgLUVJTlZBTCwg
d2hhdGV2ZXIpCgo+IAo+IEFuZCBmb3IgcGF0Y2ggdjEsIGl0IHdpbGwgcmV0dXJuIDDCoCBpZiBj
YWxscyB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQgc3VjY2VlZHMuCj4gCj4gPiBUaGlzIGZ1
bmN0aW9uIGlzIHN0YXRpYyBhbmQgb25seSBjYWxsZWQgdHdpY2UsIHBsZWFzZSB0dXJuIGl0IGlu
dG8KPiA+IHNvbWV0aGluZyBsaWtlOgo+ID4KPiA+IGlmIChkbWFfZmlmb190cmFuc2ZlcigpKQo+
ID4gCWVycm9yCj4gPiBlbHNlCj4gPiAJb2sgIAo+IAo+IFNvIEkgd2FudCB0byBrZWVwIHJldD4w
IG1lYW5zIHN1Y2Nlc3MuCj4gCj4gT3IgY291bGQgSSBzZXQgcmV0ID4gMCBhZnRlciBpbiB3YWl0
X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoKSBzdWNjZXNzIHBhdGg/Cj4gCj4gbGlrZToKPiAKPiDC
oMKgwqAgaWYodGltZV9sZWZ0ID09IDApCj4gCj4gwqDCoMKgIMKgwqDCoCDCoMKgwqAgcmV0ID0g
LUVUSU1FRE9VVDsKPiAKPiDCoMKgwqAgZWxzZQo+IAo+IMKgwqDCoCDCoMKgwqDCoMKgIMKgIHJl
dCA9IDE7CgpZb3UgY2FuIGluaXRpYWxpemUgcmV0IHRvIHplcm8gYXQgdG8gdG9wLiBTbyB0aGF0
IGFueXRoaW5nICE9IDAgaXMgYW4KZXJyb3IgKGxpa2UgYSBsb3Qgb2YgZnVuY3Rpb25zIGluIHRo
ZSBrZXJuZWwpLiBBbmQgdXNlOgoKCWlmIChkbWFfZmlmb190cmFuc2ZlcigpKQoJCWVycm9yKCk7
Cgo+IAo+IFdoYXQgZG8geW91IHRoaW5rPwo+IAo+IAo+IFRoYW5rcywKPiAKPiA+PiArCXVuc2ln
bmVkIGxvbmcgdGltZV9sZWZ0Owo+ID4+ICAKPiA+PiAgCWlmIChkaXIgPT0gRE1BX0ZST01fREVW
SUNFKSB7Cj4gPj4gIAkJY2hhbiA9IGZsY3RsLT5jaGFuX2ZpZm8wX3J4Owo+ID4+IEBAIC00MjUs
MTMgKzQyNiwxNCBAQCBzdGF0aWMgaW50IGZsY3RsX2RtYV9maWZvMF90cmFuc2ZlcihzdHJ1Y3Qg
c2hfZmxjdGwgKmZsY3RsLCB1bnNpZ25lZCBsb25nICpidWYsCj4gPj4gIAkJZ290byBvdXQ7Cj4g
Pj4gIAl9Cj4gPj4gIAo+ID4+IC0JcmV0ID0KPiA+PiArCXRpbWVfbGVmdCA9Cj4gPj4gIAl3YWl0
X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJmZsY3RsLT5kbWFfY29tcGxldGUsCj4gPj4gIAkJCQlt
c2Vjc190b19qaWZmaWVzKDMwMDApKTsKPiA+PiAgCj4gPj4gLQlpZiAocmV0IDw9IDApIHsKPiA+
PiArCWlmICh0aW1lX2xlZnQgPT0gMCkgewo+ID4+ICAJCWRtYWVuZ2luZV90ZXJtaW5hdGVfYWxs
KGNoYW4pOwo+ID4+ICAJCWRldl9lcnIoJmZsY3RsLT5wZGV2LT5kZXYsICJ3YWl0X2Zvcl9jb21w
bGV0aW9uX3RpbWVvdXRcbiIpOwo+ID4+ICsJCXJldCA9IC1FVElNRURPVVQ7Cj4gPj4gIAl9Cj4g
Pj4gIAo+ID4+ICBvdXQ6ICAKPiA+Cj4gPiBUaGFua3MsCj4gPiBNaXF1w6hsICAKCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
