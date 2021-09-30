Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEF8C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 13:59:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2049A619E7
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 13:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2049A619E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ln2HEEQCSSf9FoaHxPPCmfP57UBiXbmm+z3WZt5FAkg=; b=OAXpPmDtCUAQGM
	TsH7BF4TufKPTeucyIdlERWPpcg3NxlADroodgZcVWvOs/mYu3skaMuxnNwy78YWwAnEtSS+YGE3V
	jz0ix2Olb0FkN5Q6/naeJvxQx7Fn319Yxs2BZ9UdTopgidAHRWa6g4t5urhglqRmsj+oiOsIvQgJl
	j+xyRvK20qoUqfor5homkL5y9+enfqb6K9bV1yWBnxH2xMGP72F2Vn7iNb5mHqtBqzaEPYETyymed
	aF+hMoYXFrW/KEVahMkm+GmSH0KCp4B/pv8zFCnM3L9/ezSPl69lF5glLN6f5HvWgA63DCG9Xy8zg
	ICR6SI1UtMz6oC6DVLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVwaA-00EbLw-3E; Thu, 30 Sep 2021 13:58:42 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVwa5-00EbKe-Ub
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 13:58:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C7F57240014;
 Thu, 30 Sep 2021 13:58:32 +0000 (UTC)
Date: Thu, 30 Sep 2021 15:58:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Boris
 Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: add MEMREAD ioctl
Message-ID: <20210930155831.672acdee@xps13>
In-Reply-To: <YVXBf0v0AQ5+G9dt@larwa.hq.kempniu.pl>
References: <20210920070221.10173-1-kernel@kempniu.pl>
 <20210928155859.433844cb@xps13>
 <20210928162402.6bb64fcf@collabora.com>
 <20210928163519.08cd1138@xps13>
 <YVTBoAnQKYLNpOPc@larwa.hq.kempniu.pl>
 <20210930085133.13b5a228@collabora.com>
 <20210930104721.03dc45bb@xps13>
 <YVXBf0v0AQ5+G9dt@larwa.hq.kempniu.pl>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_065838_142144_4F771786 
X-CRM114-Status: GOOD (  25.94  )
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

SGkgTWljaGHFgiwKCmtlcm5lbEBrZW1wbml1LnBsIHdyb3RlIG9uIFRodSwgMzAgU2VwIDIwMjEg
MTU6NTQ6MDcgKzAyMDA6Cgo+ID4gPiA+ID4gPiBJIHJlbWVtYmVyIGRpc2N1c3Npbmcgc2VhcmNo
IGEgbmV3IFJFQUQgaW9jdGwgd2l0aCBTYXNjaGEgSGF1ZXIgYSBmZXcKPiA+ID4gPiA+ID4geWVh
cnMgYmFjaywgYnV0IEkgY2FuJ3QgZmluZCB0aGUgZGlzY3Vzc2lvbi4uLiAgICAgIAo+ID4gPiA+
IAo+ID4gPiA+IEkgdGhpbmsgdGhpcyBpcyB0aGUgdGhyZWFkIGluIHF1ZXN0aW9uOgo+ID4gPiA+
IAo+ID4gPiA+ICAgICBodHRwczovL3d3dy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1t
dGQvMjAxNi1BcHJpbC90aHJlYWQuaHRtbCM2NzA4NQo+ID4gPiA+IAo+ID4gPiA+IEluIGZhY3Qs
IGl0IGxvb2tzIGxpa2UgQm9yaXMgYmVhdCBtZSB0byBwcmVwYXJpbmcgYSBkcmFmdCBwYXRjaCBh
ZGRpbmcgYQo+ID4gPiA+IE1FTVJFQUQgaW9jdGwgYnkgc29tZSBmaXZlIHllYXJzOgo+ID4gPiA+
IAo+ID4gPiA+ICAgICBodHRwczovL3d3dy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1t
dGQvMjAxNi1BcHJpbC8wNjcxODcuaHRtbCAgICAKPiA+ID4gCj4gPiA+IEV4YWN0bHkgdGhlIG9u
ZSBJIHdhcyByZWZlcnJpbmcgdG8uIE5vdGUgdGhhdCB0aGlzIHBhdGNoIHN0aWxsIGNvbnRhaW5z
Cj4gPiA+IHRoZSB1bmJvdW5kZWQgbWFsbG9jIHdoaWNoIEkgdGhpbmsgaXMgd29ydGggZml4aW5n
LCBidXQgb3RoZXIgdGhhbgo+ID4gPiB0aGF0IGFuZCB0aGUgYWRkaXRpb24gb2YgRUNDIHN0YXRz
LCBpdCBsb29rcyBwcmV0dHkgc2ltaWxhciB0byB5b3Vycy4gIAo+IAo+IFJpZ2h0LCB0aGFua3Mu
Cj4gCj4gPiA+ID4gSSBndWVzcyB0aGUgYmlnIHF1ZXN0aW9uIGZyb20gbXkgcGVyc3BlY3RpdmUg
aXM6IHNob3VsZCBJIHJldml2ZSBCb3JpcycKPiA+ID4gPiBvcmlnaW5hbCBlZmZvcnQgb24gdGhl
IE1FTVJFQUQgaW9jdGwgKHdoaWNoIHJldHVybnMgbW9yZSBkZXRhaWxlZAo+ID4gPiA+IGJpdGZs
aXAgc3RhdHMgaW4gdGhlIHN0cnVjdHVyZSBwYXNzZWQgYnkgdXNlciBzcGFjZSkgb3Igd291bGQg
dGhhdCBiZSBhCj4gPiA+ID4gd2FzdGUgb2YgdGltZSBiZWNhdXNlIHRoZSBzdWJzeXN0ZW0gd2ls
bCBiZSBzd2l0Y2hlZCBvdmVyIHdob2xlc2FsZSB0byBhCj4gPiA+ID4gbmV3IHdheSBvZiBkb2lu
ZyBJL08gKG10ZF9pb19vcCkgaW4gdGhlIGZvcmVzZWVhYmxlIGZ1dHVyZSBhbmQgdGhlcmVmb3Jl
Cj4gPiA+ID4gZXhwb3NpbmcgeWV0IGFub3RoZXIgaW9jdGwgdG8gdXNlciBzcGFjZSB0b2RheSB3
b3VsZCBiZSBmcm93bmVkIHVwb24/Cj4gPiA+ID4gICAgIAo+ID4gPiAKPiA+ID4gVGhhdCdzIG5v
dCBteSBjYWxsIHRvIG1ha2UsIGJ1dCBJIHRoaW5rIHRob3NlIDIgdGhpbmdzIGFyZSBvcnRob2dv
bmFsCj4gPiA+IGFuZCBjYW4gYmUgYWRkcmVzc2VkIHNlcGFyYXRlbHkuICAKPiA+IAo+ID4gQWdy
ZWVkLiAgCj4gCj4gVGhhbmsgeW91IGJvdGggLSBpdCBzb3VuZHMgbGlrZSBJIHNob3VsZCBzdGFy
dCB3b3JraW5nIG9uIGEgdjIgdGhhdCB3aWxsCj4gbWFrZSB0aGUgbmV3IE1FTVJFQUQgaW9jdGwg
cmV0dXJuIG1vcmUgZGV0YWlsZWQgRUNDIHN0YXRpc3RpY3MgdG8gdXNlcgo+IHNwYWNlLgo+IAo+
IEJvcmlzLCBJIHRoaW5rIGEgU3VnZ2VzdGVkLWJ5IHRhZyBjcmVkaXRpbmcgeW91IGlzIGluIG9y
ZGVyIGZvciBib3RoIHRoZQo+IHVuYm91bmRlZCBtYWxsb2MgaXNzdWUgYW5kIHRoZSBNRU1SRUFE
IGlvY3RsLCBidXQgc3VibWl0dGluZy1wYXRjaGVzLnJzdAo+IHNheXMgSSBzaG91bGQgbm90IGFk
ZCB0aGlzIHRhZyB3aXRob3V0IHlvdXIgcGVybWlzc2lvbi4gIFNvLCBhcmUgeW91Cj4gb2theSB3
aXRoIG1lIGFkZGluZyBpdD8KPiAKPiBNaXF1ZWwsIGFzIGZvciB0aGUgdW5ib3VuZGVkIG1hbGxv
YyBpc3N1ZSwgc2hvdWxkIEkgYWRkcmVzcyB0aGlzIGluIGEKPiBzZXBhcmF0ZSAocHJlbGltaW5h
cnkpIHBhdGNoIG9yIHJhdGhlciBzdWJtaXQgYSB0d28tcGF0Y2ggdjIgc2VyaWVzCj4gKHVuYm91
bmRlZCBtYWxsb2MgZml4ICsgbmV3IE1FTVJFQUQgaW9jdGwpPwoKQm90aCB3b3JrIGFzIGxvbmcg
YXMgeW91IGtlZXAgdGhlIGNoYW5nZXMgaW4gZGlmZmVyZW50IGNvbW1pdHMgOikKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
