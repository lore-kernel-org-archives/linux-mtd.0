Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01D7C54E94
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jan 2023 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXQjX3gm5oiYVomtkJn6VPLhFhrUt7csfg9mQ9x6Elo=; b=29JaHaV6XQnHrd
	jR4q6An9/QZh6uq3du13zra4VcVdRkHqIfkich/M7piUKXd5yB4WFhwev1GI4V65Mdybd5hTg3h/8
	fiGIHdLZdSKHKn9zyks4FoCzjpemSF/yzwL216kyFHfZQlrJ9WoCrtBJ+V3wXFW3ccV5lUPT3t43F
	CPxVCWctU9Lqof8b7grxncNS1Ttad8wr+GcX/ri6axnL8YgnN6xi1tzE30XzCfk7paNx9PYwzQyoc
	3V3qxbs7FesQsOrZ//Ln+7GRAF4Zlhb50nYCni0uwDNDVNz4AdUNgByf7vsiPDsVr08PqNitM4S8/
	YSTk4EnQDkV0RXHhM+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxzx-00A7uQ-Rl; Thu, 26 Jan 2023 08:52:45 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxyX-00A7GF-9H
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2023 08:51:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8D06EE000E;
	Thu, 26 Jan 2023 08:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674723074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9n8ssSDibiOqBCRF537mEk7qaUXuw6GctioHmF+HkAQ=;
	b=LOuKsWfAKjbcLaihgDGWa00kEQwA4TEzchcJ06mznGzasSU6a9oWSnEl8tQ0SYHNrOXVh/
	+nCURw74KjAIVg+S8wk45pMpMdwUJSygzO93mmdyt1jEXOZVsbTYBQqta0QOcJ3+uRjNGs
	++OLPhSMEnUI8BAgITIMHEsFIZeGFjdmDXFMhT3ADHqnoocvHHxzLVKFj0e8eP3oKJwYKo
	klx+hdESczxNg2BAQQn/pvQruv/DgqzRdZ3H8gwzwRztzuT6GjwKl1O37mbi2uzzcJo86Q
	nlfaxH8J5Jd2Y2AiuLzGfQm1Uu4kZetgfi4wdFrPiHBX4ybcUhE+fq6LiIQfYg==
Date: Thu, 26 Jan 2023 09:51:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mario Kicherer <dev@kicherer.org>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com, Dhruva
 Gole <d-gole@ti.com>
Subject: Re: [PATCH v2] mtd: spinand: Add support for AllianceMemory
 AS5F34G04SND
Message-ID: <20230126095112.3fd55899@xps-13>
In-Reply-To: <c452cc08efa87359294d7042ea68ffee@kicherer.org>
References: <20230117165441.1368447-1-dev@kicherer.org>
	<20230123113337.78f5e3db@xps-13>
	<fae6950f62ebde63b3be0cde384fbde9@kicherer.org>
	<20230125152733.3b6bf0bd@xps-13>
	<c452cc08efa87359294d7042ea68ffee@kicherer.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_005117_670635_37C8AC0F 
X-CRM114-Status: GOOD (  28.86  )
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

SGkgTWFyaW8sCgpkZXZAa2ljaGVyZXIub3JnIHdyb3RlIG9uIFdlZCwgMjUgSmFuIDIwMjMgMTY6
MDM6NTggKzAxMDA6Cgo+IE9uIDIwMjMtMDEtMjUgMTU6MjcsIE1pcXVlbCBSYXluYWwgd3JvdGU6
Cj4gPj4gPj4gK3N0YXRpYyBpbnQgYW1fZWNjX2dldF9zdGF0dXMoc3RydWN0IHNwaW5hbmRfZGV2
aWNlICpzcGluYW5kLCB1OCA+PiBzdGF0dXMpCj4gPj4gPj4gK3sKPiA+PiA+PiArCXN3aXRjaCAo
c3RhdHVzICYgQU1fU1RBVFVTX0VDQ19CSVRNQVNLKSB7Cj4gPj4gPj4gKwljYXNlIEFNX1NUQVRV
U19FQ0NfTk9ORV9ERVRFQ1RFRDoKPiA+PiA+PiArCQlyZXR1cm4gMDsKPiA+PiA+PiArCj4gPj4g
Pj4gKwljYXNlIEFNX1NUQVRVU19FQ0NfMV9DT1JSRUNURUQ6Cj4gPj4gPj4gKwkJcmV0dXJuIDE7
Cj4gPj4gPj4gKwo+ID4+ID4+ICsJY2FzZSBBTV9TVEFUVVNfRUNDX01BWF9DT1JSRUNURUQ6Cj4g
Pj4gPj4gKwkJcmV0dXJuIDg7Cj4gPj4gPj4gKwo+ID4+ID4+ICsJY2FzZSBBTV9TVEFUVVNfRUND
XzFfREVURUNURUQ6ICAKPiA+PiA+Cj4gPj4gPiBXaGF0IGRvZXMgdGhpcyBtZWFuICIxIGRldGVj
dGVkIj8gIAo+ID4+ID4+IEFjY29yZGluZyB0byB0aGUgbWFudWFsLCB0aGUgY2hpcCBjYW4gcmVw
b3J0IHRoYXQgYSBiaXQgZXJyb3Igd2FzID4+IGRldGVjdGVkICAKPiA+PiBidXQgY291bGQgbm90
IGJlIGNvcnJlY3RlZC4gIAo+ID4gCj4gPiBUaGF0IGRvZXMgbm90IG1ha2UgYSBsb3Qgb2Ygc2Vu
c2UuIEVpdGhlciB5b3UgdXNlIGEgSGFtbWluZyBhbGdvcml0aG0sCj4gPiB5b3Ugd2lsbCBiZSBh
YmxlIHRvIGNvcnJlY3QgMSBiaXQgZXJyb3IgYW5kIHRvIGRldGVjdCAyIGJpdCBlcnJvcnMsIG9y
Cj4gPiB5b3UgdXNlIGFub3RoZXIgYWxnb3JpdGhtIChCQ0gsIHVzdWFsbHkpIHdpdGggYSBzdHJl
bmd0aCBvZiBYIChYID4gMSkKPiA+IGFuZCB5b3UnbGwgYmUgYWJsZSB0byBjb3JyZWN0IHVwIHRv
IFggZXJyb3JzIGFuZCBkZXRlY3QgWCsxIGVycm9ycy4KPiA+IAo+ID4gQnV0IG9ubHkgYmVpbmcg
YWJsZSB0byBkZXRlY3QgYSBzaW5nbGUgYml0IGZsaXAgd2l0aG91dCBiZWluZyBhYmxlIHRvCj4g
PiBjb3JyZWN0IGl0IGlzIHN0cmFuZ2UgKGV2ZW4gdXNlbGVzcz8pLiBTbyBJIGRvbid0IHVuZGVy
c3RhbmQgaG93IGl0Cj4gPiBzaG91bGQgYmUgdXNlZC4gIAo+IAo+IFVuZm9ydHVuYXRlbHksIEkg
ZG8gbm90IGhhdmUgbXVjaCBleHBlcmllbmNlIHdpdGggTkFORCBmbGFzaGVzLiBUaGUKPiBtYW51
YWwgZG9lcyBub3Qgc2F5IG11Y2ggbW9yZSAtIHBhZ2UgNDEgaW4gWzFdIGluIGNhc2UgeW91IHdh
bnQgdG8KPiBzZWUgZm9yIHlvdXJzZWxmLiBJIHRob3VnaHQgcmV0dXJuaW5nIC1FQkFETVNHIGlu
IHRoaXMgY2FzZSB3b3VsZCBiZQo+IHRoZSByaWdodCB0aGluZyB0byBkbyBhcyBhbiB1bmNvcnJl
Y3RhYmxlIGVycm9yIGhhcHBlbmVkLgoKMDBiID0gTm8gYml0IGVycm9ycyB3ZXJlIGRldGVjdGVk
CjAxYiA9IGJpdCBlcnJvciB3YXMgZGV0ZWN0ZWQgYW5kIGNvcnJlY3RlZAoxMGIgPSBiaXQgZXJy
b3Igd2FzIGRldGVjdGVkIGFuZCBub3QgY29ycmVjdGVkCjExYiA9IGJpdCBlcnJvciB3YXMgZGV0
ZWN0ZWQgYW5kIGNvcnJlY3RlZCwgZXJyb3IgYml0IG51bWJlciA9IEVDQyBtYXggd2hpY2gKaXMg
YWNjb3JkaW5nIHRvIGV4dGVuZGVkIHJlZ2lzdGVyLgoKSSBndWVzcyBpdCBtZWFucyB0aGF0IGlm
IHlvdSBoYXZlIGEgc3RyZW5ndGggb2YgWDoKLSBmcm9tIDEgYmYgdG8gWC0xIHRoZSBzdGF0dXMg
d2lsbCBiZSBzZXQgdG8gMHgxCi0gaWYgeW91IGhhdmUgWCBiZiBpdCB3aWxsIGJlIHNldCB0byAw
eDMKLSBpZiB5b3UgaGF2ZSBtb3JlIHRoYW4gWCBiZiwgaXQgd2lsbCBiZSBzZXQgdG8gMHgyLgoK
UGxlYXNlIHVwZGF0ZSB0aGUgY29kZSBhbmQgdXNlIG10ZC11dGlscyAobGlrZSB0aGUgYml0IGVy
cm9yIHRlc3QpIHRvCnZlcmlmeSB3aGF0IHRoZSB0b29scyBzYXlzIGFuZCBieSB0cmFjaW5nIHRo
ZSByZWdpc3RlciB2YWx1ZXMgZXh0cmFjdGVkCndpdGggYSBzaW1wbGUgcHJpbnRrIHRvIGZvbGxv
dyBpZiB0aGUgYWJvdmUgbG9naWMgd29ya3MuCgo+IEkgaGF2ZSBub3QgdXNlZCB0aGUgZmxhc2gg
bXVjaCB5ZXQsIHNvIEkgY2Fubm90IHNheSB0aGF0IEkgaGF2ZSBtdWNoCj4gY29uZmlkZW5jZSBp
bnRvIHRoZSBjaGlwJ3MgZXJyb3IgcmVwb3J0aW5nLiBTbyBmYXIgdGhlIGZsYXNoIHdvcmtlZAo+
IHdpdGhvdXQgaXNzdWVzLgo+IAo+IFNob3VsZCBJIGNoYW5nZSBzb21ldGhpbmcgaW4gdGhlIHBh
dGNoPwo+IAo+IEJlc3QgcmVnYXJkcywKPiBNYXJpbwo+IAo+IFsxXSBodHRwczovL3d3dy5hbGxp
YW5jZW1lbW9yeS5jb20vd3AtY29udGVudC91cGxvYWRzL3BkZi9mbGFzaC9BbGxpYW5jZU1lbW9y
eV9TUElfTkFORF9GbGFzaF9KdWx5MjAyMF9SZXYxLjAucGRmCgoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
