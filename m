Return-Path: <SRS0=LjUq=RI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C803C4360F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 17:55:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 437C620652
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2019 17:55:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DuCwL0/R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 437C620652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCgdv/8PXZV/VE/v7CThoLaTF/l2O37gHfJy6LZthhs=; b=DuCwL0/RC9ePn8
	J3ceM+E/ugDsg1hqY3zwRFtwijF8Qcv8HeYvOeR65c61tuFwTQBB+9gj9y9UWKM9KT/bW5TxMKHjp
	X5HqJJybUNlWCN5NxFwDMuOoT+tBFAt4Z6l8Op3K39jNKMWPcxDSJ9+MUcyWoEn5fRfSkpyitKUoP
	HcVnwrC+GX15woG8FplovFQTshZH4XgTPkSFdkd4RYzqVhDnbork5FosfDeRfATfHmXtQY9YiAAVX
	irnMP3C08I+rYL7A5ChxwudzVBINUZCMFjX3b8njfHsqAkiPzp6JlMI7K1wFdNcuuZ+OPqVAm1WUK
	g4eS8/tgJISlvQkb3FFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1EHq-0004la-9x; Tue, 05 Mar 2019 17:55:30 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1EHn-0004jb-Dx
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2019 17:55:29 +0000
X-Originating-IP: 77.136.16.149
Received: from xps13 (149.16.136.77.rev.sfr.net [77.136.16.149])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B82D5240002;
 Tue,  5 Mar 2019 17:55:18 +0000 (UTC)
Date: Tue, 5 Mar 2019 18:55:00 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 02/10] mtd: rawnand: denali: refactor syndrome layout
 handling for raw access
Message-ID: <20190305184929.7f0bc93b@xps13>
In-Reply-To: <CAK7LNASeBDxsUj2fu0bh9G6dXV2jxeHp6iBG+8FytNbHGtVHKQ@mail.gmail.com>
References: <1549955582-30346-1-git-send-email-yamada.masahiro@socionext.com>
 <1549955582-30346-3-git-send-email-yamada.masahiro@socionext.com>
 <20190304100106.72ad49c3@xps13>
 <CAK7LNASeBDxsUj2fu0bh9G6dXV2jxeHp6iBG+8FytNbHGtVHKQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_095527_773164_96CE57A4 
X-CRM114-Status: GOOD (  29.33  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsIDUgTWFyCjIwMTkgMTg6MjA6MjIgKzA5MDA6Cgo+IEhpIE1pcXVl
bCwKPiAKPiBPbiBNb24sIE1hciA0LCAyMDE5IGF0IDY6MDEgUE0gTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgTWFzYWhpcm8sCj4gPgo+
ID4gTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4gd3JvdGUg
b24gVHVlLCAxMiBGZWIKPiA+IDIwMTkgMTY6MTI6NTQgKzA5MDA6Cj4gPiAgCj4gPiA+IFRoZSBE
ZW5hbGkgSVAgYWRvcHRzIHRoZSBzeW5kcm9tZSBwYWdlIGxheW91dCAocGF5bG9hZCBhbmQgRUND
IGFyZQo+ID4gPiBpbnRlcmxlYXZlZCkuIFRoZSAqX3BhZ2VfcmF3KCkgYW5kICpfb29iKCkgY2Fs
bGJhY2tzIGFyZSBjb21wbGljYXRlZAo+ID4gPiBiZWNhdXNlIHRoZXkgbXVzdCBoaWRlIHRoZSB1
bmRlcmx5aW5nIGxheW91dCB1c2VkIGJ5IHRoZSBoYXJkd2FyZSwKPiA+ID4gYW5kIGFsd2F5cyBy
ZXR1cm4gY29udGlndW91cyBpbi1iYW5kIGFuZCBvdXQtb2YtYmFuZCBkYXRhLgo+ID4gPgo+ID4g
PiBDdXJyZW50bHksIHNpbWlsYXIgY29kZSBpcyBkdXBsaWNhdGVkIHRvIHJlb3JnYW5pemUgdGhl
IGRhdGEgbGF5b3V0Lgo+ID4gPiBGb3IgZXhhbXBsZSwgZGVuYWxpX3JlYWRfcGFnZV9yYXcoKSBh
bmQgZGVuYWxpX3dyaXRlX3BhZ2VfcmF3KCkgbG9vawo+ID4gPiBhbG1vc3QgdGhlIHNhbWUuCj4g
PiA+Cj4gPiA+IFRoZSBpZGVhIGZvciByZWZhY3RvcmluZyBpcyB0byBzcGxpdCB0aGUgY29kZSBp
bnRvIHR3byBwYXJ0czoKPiA+ID4gICBbMV0gY29udmVyc2lvbiBvZiBwYWdlIGxheW91dAo+ID4g
PiAgIFsyXSB3aGF0IHRvIGRvIGF0IGV2ZXJ5IEVDQyBjaHVuayBib3VuZGFyeQo+ID4gPgo+ID4g
PiBGb3IgWzFdLCBJIHdyb3RlIGRlbmFsaV9yYXdfcGF5bG9hZF9vcCgpIGFuZCBkZW5hbGlfcmF3
X29vYl9vcCgpLgo+ID4gPiBUaGV5IG1hbmlwdWxhdGUgZGF0YSBmb3IgdGhlIERlbmFsaSBjb250
cm9sbGVyJ3Mgc3BlY2lmaWMgcGFnZSBsYXlvdXQKPiA+ID4gb2YgaW4tYmFuZCwgb3V0LW9mLWJh
bmQsIHJlc3BlY3RpdmVseS4gIAo+ID4KPiA+IENvdWxkIHlvdSBwbGVhc2UgY29tbWVudCB0aGUg
cHVycG9zZSBvZiB0aGVzZSB0d28gZnVuY3Rpb25zIGluIHRoZSBjb2RlCj4gPiBhcyB3ZWxsPyAg
Cj4gCj4gCj4gT0ssIEkgd2lsbC4KPiAKPiAKPiAKPiA+ID4KPiA+ID4gVGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB3cml0ZSBhbmQgcmVhZCBpcyBqdXN0IHRoZSBvcGVyYXRpb24gYXQKPiA+ID4gRUND
IGNodW5rIGJvdW5kYXJpZXMuIEZvciBleGFtcGxlLCBkZW5hbGlfcmVhZF9vb2IoKSBjYWxscwo+
ID4gPiBuYW5kX2NoYW5nZV9yZWFkX2NvbHVtbl9vcCgpLCB3aGVyZWFzIGRlbmFsaV93cml0ZV9v
b2IoKSBjYWxscwo+ID4gPiBuYW5kX2NoYW5nZV93cml0ZV9jb2x1bW5fb3AoKS4gU28sIEkgaW1w
bGVtZW50ZWQgWzJdIGFzIGEgY2FsbGJhY2sKPiA+ID4gcGFzc2VkIGludG8gWzFdLgo+ID4gPgo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Np
b25leHQuY29tPgo+ID4gPiAtLS0KPiA+ID4KPiA+ID4gQ2hhbmdlcyBpbiB2MjogTm9uZQo+ID4g
Pgo+ID4gPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kZW5hbGkuYyB8IDM1NCArKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gMSBmaWxlIGNoYW5nZWQsIDE2MyBp
bnNlcnRpb25zKCspLCAxOTEgZGVsZXRpb25zKC0pICAKPiA+Cj4gPiBUb28gYmFkIHRoYXQgdGhl
IHNpemUgb2YgdGhlIGRyaXZlciBkaWQgbm90IHNocmluayBtb3JlIHRoYW4gdGhhdCA6KSAgCj4g
Cj4gSW5kZWVkLCBsZXNzIHRoYW4gZXhwZWN0ZWQuCj4gCj4gQnV0LCBwbGVhc2UgZG8gbm90IG1p
c3MgdGhpcyBjb21taXQgaXMgYWRkaW5nCj4gZXJyb3IgY2hlY2sgdG8gZXZlcnkgb3BlcmF0aW9u
Lgo+IAo+IFByaW9yIHRvIHRoaXMgY29tbWl0LCB0aGUgY29kZSBqdXN0IGlnbm9yZWQgdGhlIHJl
dHVybiBjb2RlCj4gYmVjYXVzZSA5N2Q5MGRhOGE4ODY5NDlmIHNpbXBseSByZXBsYWNlZCBvbGQg
aG9va3MKPiBkZXNwaXRlIHRoZSBuZXcgb25lcyByZXR1cm4gdGhlIGVycm9yIGNvZGUuCj4gCj4g
Cj4gR2VuZXJhbGx5LCBldmVyeSBlcnJvciBjaGVjayBjb3N0cyB0d28gbGluZXMKPiBpbiB0aGUg
Zm9sbG93aW5nIGZvcm06Cj4gCj4gCj4gICByZXQgPSAoZG8gc29tZXRoaW5nKQo+ICAgaWYgKHJl
dCkKPiAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gCgpSaWdodCEKCj4gCj4gCj4gPiA+ICsKPiA+
ID4gK3N0YXRpYyBpbnQgZGVuYWxpX21lbWNweV9pbih2b2lkICpidWYsIHVuc2lnbmVkIGludCBv
ZmZzZXQsIHVuc2lnbmVkIGludCBsZW4sCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
dm9pZCAqcHJpdikKPiA+ID4gK3sKPiA+ID4gKyAgICAgbWVtY3B5KGJ1ZiwgcHJpdiArIG9mZnNl
dCwgbGVuKTsKPiA+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiA+ICB9ICAKPiA+Cj4gPiBNYXliZSB0
aGlzICJjYWxsYmFjayIgYW5kIHRoZSAoX291dCBjb3VzaW4pIGNvdWxkIGJlIHBhcnQgb2YgeW91
Cj4gPiBjb250cm9sbGVyJ3Mgc3RydWN0dXJlLAo+ID4gYW5kIHlvdSBjb3VsZCB1c2UgYSByZWFk
L3dyaXRlIGZsYWcgaW5zdGVhZCBvZgo+ID4gcGFzc2luZyB0aGUgZnVuY3Rpb25zJyBwb2ludGVy
PyAgCj4gCj4gVGhpcyBpcyB3aGF0IHRoZSBvbGQgY29kZSBkb2VzLgo+IAo+IFRoZXJlIGFyZSA0
IGNhbGxiYWNrcyBmb3IgdGhlIGNvbWJpbmF0aW9uCj4gb2YgcmF3L29vYiwgYW5kIHdyaXRlL3Jl
YWQuCj4gCj4gSSBkbyBub3Qga25vdyBob3cgeW91ciBzdWdnZXN0aW9uIGxvb2tzIGxpa2UsCj4g
YW5kIHdoZXRoZXIgaXQgd2lsbCBtYWtlIHRoZSBjb2RlIGNsZWFuZXIuCj4gCgpQbGVhc2UgZ2l2
ZSBpdCBhIHRyeSEKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
