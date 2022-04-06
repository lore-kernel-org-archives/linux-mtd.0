Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504EDC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Apr 2022 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeK8zZB693aXvcW5xf4FeIJW63aLFQAbTkEFQpXV2ZI=; b=vramWu+fjmPg1c
	5r2E2Es7eKrHzYocoxLRLF49OreB3R3iWB2jTpZhL5UCI5Df7pji28AQSOVKQTii57EvUSm5MjdAd
	NGx0z3BdJIIyKNUINu/RiQPAYcHwSlQV8aIUhcen8lxu+tyne8lc0s6SNIWLHiPE8YBfMb8h+vaOt
	bbDIG2qOQ3Ter21q0GAZfplPloL1ojdByCkXMgew9zzjP7Vv+XQz7dvotGXdSJokHSz9aT4L5z2Qr
	MQNM2L/rEF720cNK238dnMjiX05qAHISONyVhBQ5VNFJP3jcLmDg34jc0ODdbXWGWA35FwHUjTC1t
	32ujSWXhTlT8hdYQj/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc8KZ-00795i-Fe; Wed, 06 Apr 2022 16:16:27 +0000
Received: from mail.fmat.eu ([2a03:4000:21:70a:b8c2:1eff:fea5:fc02])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc8KU-00792T-DQ
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2022 16:16:25 +0000
Received: from authenticated-user (mail.fmat.eu [94.16.121.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.fmat.eu (Postfix) with ESMTPSA id A2843E00FE;
 Wed,  6 Apr 2022 18:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=matouschek.org;
 s=mail; t=1649261776;
 bh=NFkLe8wUwx7Fts3gPE0oC0Vmw4db7vqZzndlmpcQOyo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=LBTHuhBeh7kJRivdr1hGwNCYzEMVD5+gRNSP9HVL2eHL9AGiZQc+Hz52iddGz8Rqa
 2TGRsGG5csTfeLBibmEGqRF/0M3oV3XVjVJk6Rq+/9gPEeKumdDj/EE+LMpEN2Z4iO
 F3m5LY8LU2LPVtdcSxJe9wN2OJbmEAyJdcmmLT1c715lT1tdpdwZDXCPToHk2UaIkL
 H+Yi8+G+h3ZWBsRj4ISZ79YkDb0LYWz0dGkxDeL7Ebq+VjhiM5/4qGTbJq8Yh/d43C
 pSQLc5c8MbnxV1Gz7Mjt2YHh6WrcmtnWlIEq9XjfjoSMjanOQBa9vZyJIhOpkePGmM
 vGZFQsecEWXaw==
Message-ID: <c1387c1949a8ec705116f5ee8a73fa35979aa196.camel@matouschek.org>
Subject: Re: [PATCH] mtd: spinand: Add support for XTX XT26G0xA
From: Felix Matouschek <felix@matouschek.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Date: Wed, 06 Apr 2022 18:16:16 +0200
In-Reply-To: <20220404104141.7b7b79d5@xps13>
References: <20220401212951.1133780-1-felix@matouschek.org>
 <20220404104141.7b7b79d5@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_091623_013594_5068B2E4 
X-CRM114-Status: GOOD (  17.28  )
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

SGkgTWlxdWVsLAoKdGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4KCkFtIE1vbnRhZywgZGVtIDA0
LjA0LjIwMjIgdW0gMTA6NDEgKzAyMDAgc2NocmllYiBNaXF1ZWwgUmF5bmFsOgoKPiA+ICtzdGF0
aWMgaW50IHh0MjZnMHhhX29vYmxheW91dF9lY2Moc3RydWN0IG10ZF9pbmZvICptdGQsIGludAo+
ID4gc2VjdGlvbiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG10ZF9vb2JfcmVnaW9uICpyZWdpb24p
Cj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHNlY3Rpb24pCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FUkFOR0U7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKg
wqByZWdpb24tPm9mZnNldCA9IDg7Cj4gPiArwqDCoMKgwqDCoMKgwqByZWdpb24tPmxlbmd0aCA9
IDQwOwo+IAo+IE9ubHkgNDggT09CIGJ5dGVzPwo+IAo+IE1heWJlIHdlIGNhbiBiZSBtb3JlIGZ1
dHVyZSBwcm9vZiBieSBhc3N1bWluZyB0aGF0IEVDQyBieXRlcyB3aWxsCj4gYWx3YXlzIGJlIGF0
IHRoZSBlbmQgKG9yIGF0IGEgc3BlY2lmaWMgb2Zmc2V0KSBhbmQgd2hhdCB3aWxsIGNoYW5nZQo+
IGlzCj4gdGhlIGFtb3VudCBvZiBieXRlcyB1c2VkIGZvciBzdG9yaW5nIHRoZSBFQ0MgaW5mb3Jt
YXRpb24gaWYsIGxldCdzCj4gc2F5LAo+IHRoZSBjb21wYW55IGRlY2lkZXMgdG8gaW5jcmVhc2Ug
dGhlIHN0cmVuZ3RoLgo+IAo+IFNhbWUgYmVsb3cuCgpJJ20gbm90IHF1aXRlIHN1cmUgaWYgSSBp
bnRlcnByZXRlZCB0aGF0IGRhdGEtc2hlZXQgY29ycmVjdGx5LiAKVGhlIHNlY3Rpb24gZGVzY3Jp
YmluZyB0aGUgYXJyYXkgb3JnYW5pemF0aW9uIChwYWdlIDcpIHNheXMgdGhhdCB0aGVyZQphcmUg
MmsgKyA2NCBieXRlcyBwZXIgcGFnZS4gVGhlIHNlY3Rpb24gZGVzY3JpYmluZyB0aGUgRUNDIHBy
b3RlY3Rpb24KKHBhZ2UgNDEpIHNheXMgdGhhdCBvbmx5IG9mZnNldHMgODA4SCB0byA4MkZIIGNh
biBiZSB1c2VkIGZvciB1c2VyIGRhdGEKYW5kIGFyZSBjb3ZlcmVkIGJ5IEVDQy4KCj4gPiArc3Rh
dGljIGludCB4dDI2ZzB4YV9vb2JsYXlvdXRfZnJlZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50
Cj4gPiBzZWN0aW9uLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbXRkX29vYl9yZWdpb24gKnJlZ2lv
bikKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoc2VjdGlvbikKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVSQU5HRTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKg
wqDCoHJlZ2lvbi0+b2Zmc2V0ID0gMTsKPiA+ICvCoMKgwqDCoMKgwqDCoHJlZ2lvbi0+bGVuZ3Ro
ID0gNzsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4gK30KClRoZSBkYXRh
LXNoZWV0IHNheXMgdGhhdCBvbmx5IG9mZnNldHMgODAxSCB0byA4MDdIIGNhbiBiZSB1c2VkIGZv
ciB1c2VyCmRhdGEgYW5kIGFyZSBub3QgY292ZXJlZCBieSBFQ0MgKG9mZnNldCA4MDBIIGlzIHJl
c2VydmVkIGZvciB0aGUgYmFkCmJsb2NrIG1hcmspLgoKVGhlIHJlbWFpbmluZyAxNiBieXRlcyBm
cm9tIG9mZnNldCA4MzBIIHRvIDgzRkggYXJlIHJlYWQtb25seSB3aGVuIEVDQwppcyBlbmFibGVk
LCBzbyB0aGV5IGFyZSBvZiBubyB1c2U/IENhbiB5b3UgcGxlYXNlIGFkdmlzZSBpZiB0aGVyZSBp
cwpzb21ldGhpbmcgSSBjYW4gY2hhbmdlPwoKVGhhbmsgeW91LApGZWxpeAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
