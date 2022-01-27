Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17264C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 15:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQiRBhrGCySXFVgpBDe7UmX2wvHVeAqv1dh2oikPMM4=; b=O7W7GvS263kgCW
	fgKmFBcYHthNTXqAZ5NiDDxPj6w9LNfSuCMjSMgMyZXohTAAl1rd7+pw71cQL6SzUF169DDAOFlOf
	pHOg70VxznoUM76v0YMPmWL0Jz4phmHqa6L6Dx4gDqScUPSJtyVrXloJgUDWqLQyxj4FL0MPL8YKC
	ZRMgzIWt2FB0ty6FiABTpiUAf4xFp8iXAAxj67fQyeIbNyjtUQi3e7xy+954SWEr01rWB4lDe+0gE
	Q/0zgcWM1ouX7H472BtLm95R7QefucceEt0Iz4VxsluFBYb5ARSrw4qXejGXNSS2ofjCTaCq9oNUa
	kCidGwRsTzTvpIGVB3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6wr-00GINj-Qb; Thu, 27 Jan 2022 15:44:33 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6wo-00GIMr-Re
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 15:44:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6CE6AFF80A;
 Thu, 27 Jan 2022 15:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643298268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjHeCUIB9qZywsC634sVRE1jUeIoCHv3u6O5I1+pY2M=;
 b=m2U6HQl/9z/IREhPfkoCLCFLB0d3zBVEcGTEMfpmnuyA+V4Gt9r18zUa57G7xf/SVcjPVD
 CT7MfpbYFuWFei+QCMxzkI3W7WaO1o08Oq8LI/WK8xSJlUb+N7LU1KPTjMjUT7Zh0ha0U8
 oAp6/498dTxaJkV63nK7pz1EoSJAJA9RF/35j/QbHarvnrJUK+EJfOX3ihvhRD3OH+mI1H
 sIAKBRNqDc8rVTImrM9w7x7av0KjneE4TACWB/NKj88w8fzF5I3Ga9jUT3KmkrDwQWo1fh
 +oK0Q9MHkankOMmkBOtfY0OfKtFheKA6NsyjFn7ln6z9xEhZIKrHxq3YAMGO6A==
Date: Thu, 27 Jan 2022 16:44:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael
 Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Uwe Kleine-Konig
 <u.kleine-koenig@pengutronix.de>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: Fix misuses of of_match_ptr()
Message-ID: <20220127164425.755fe5cd@xps13>
In-Reply-To: <SI9D6R.T149KFA13SNK2@crapouillou.net>
References: <20220127110631.1064705-1-miquel.raynal@bootlin.com>
 <RQ8D6R.EBO0P9DUGF812@crapouillou.net> <YfKCtYR7ZrPu+waQ@piout.net>
 <SI9D6R.T149KFA13SNK2@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_074431_396975_68987AF4 
X-CRM114-Status: GOOD (  29.88  )
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

SGkgUGF1bCwKCnBhdWxAY3JhcG91aWxsb3UubmV0IHdyb3RlIG9uIFRodSwgMjcgSmFuIDIwMjIg
MTE6MzU6MTYgKzAwMDA6Cgo+IExlIGpldS4sIGphbnYuIDI3IDIwMjIgYXQgMTI6MzI6MDUgKzAx
MDAsIEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT4gYSDD
qWNyaXQgOgo+ID4gT24gMjcvMDEvMjAyMiAxMToxODoyNyswMDAwLCBQYXVsIENlcmN1ZWlsIHdy
b3RlOiAgCj4gPj4gIEhpIE1pcXVlbCwgIAo+ID4+ID4+ICBMZSBqZXUuLCBqYW52LiAyNyAyMDIy
IGF0IDEyOjA2OjMxICswMTAwLCBNaXF1ZWwgUmF5bmFsICAKPiA+PiAgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+IGEgw6ljcml0IDogIAo+ID4+ICA+IG9mX21hdGNoX3B0cigpIGVpdGhlciBl
eHBhbmRzIHRvIE5VTEwgaWYgIUNPTkZJR19PRiwgb3IgaXMgPj4gdHJhbnNwYXJlbnQKPiA+PiAg
PiBvdGhlcndpc2UuIFRoZXJlIGFyZSBzZXZlcmFsIGRyaXZlcnMgdXNpbmcgdGhpcyBtYWNybyB3
aGljaCBrZWVwID4+IHRoZWlyCj4gPj4gID4gb2ZfZGV2aWNlX2lkIGFycmF5IGVuY2xvc2VkIHdp
dGhpbiBhbiAjaWZkZWYgQ09ORklHX09GIGNoZWNrLCA+PiB0aGVzZSBhcmUKPiA+PiAgPiBjb25z
aWRlcmVkIGZpbmUuIEhvd2V2ZXIsIFdoZW4gbWlzdXNlZCwgdGhlIG9mX2RldmljZV9pZCBhcnJh
eSA+PiBwb2ludGVkCj4gPj4gID4gYnkgdGhpcyBtYWNybyB3aWxsIHByb2R1Y2UgYSB3YXJuaW5n
IGJlY2F1c2UgaXQgaXMgZmluYWxseSB1bnVzZWQgPj4gd2hlbgo+ID4+ICA+IGNvbXBpbGVkIHdp
dGhvdXQgT0Ygc3VwcG9ydC4KPiA+PiAgPgo+ID4+ICA+IEEgbnVtYmVyIG9mIGZpeGVzIGFyZSBw
b3NzaWJsZToKPiA+PiAgPiAtIEFsd2F5cyBkZXBlbmQgb24gQ09ORklHX09GLCBidXQgdGhpcyB3
aWxsIG5vdCBhbHdheXMgd29yayBhbmQgPj4gbWF5Cj4gPj4gID4gICBicmVhayBib2FyZHMuCj4g
Pj4gID4gLSBFbmNsb3NlIHRoZSBjb21wYXRpYmxlIGFycmF5IGJ5ICNpZmRlZidzLCB0aGlzIG1h
eSBzYXZlIGEgYml0IG9mCj4gPj4gID4gICBtZW1vcnkgYnV0IHdpbGwgcmVkdWNlIGJ1aWxkIGNv
dmVyYWdlLgo+ID4+ICA+IC0gVGVsbCB0aGUgY29tcGlsZXIgdGhlIGFycmF5IG1heSBiZSB1bnVz
ZWQsIGlmIHRoaXMgY2FuIGJlID4+IGF2b2lkZWQsCj4gPj4gID4gICBsZXQncyBub3QgZG8gdGhp
cy4KPiA+PiAgPiAtIEp1c3QgZHJvcCB0aGUgbWFjcm8sIHNldHRpbmcgdGhlIG9mX2RldmljZV9p
ZCBhcnJheSBmb3IgYSBub24gT0YKPiA+PiAgPiAgIGVuYWJsZWQgcGxhdGZvcm0gaXMgbm90IGFu
IGlzc3VlLCBpdCB3aWxsIGp1c3QgYmUgdW51c2VkLgo+ID4+ICA+Cj4gPj4gID4gVGhlIGxhdHRl
ciBzb2x1dGlvbiBzZWVtcyB0aGUgbW9yZSBhcHByb3ByaWF0ZSwgc28gbGV0J3MgdXNlIGl0LiAg
Cj4gPj4gPj4gIEkgZGlzYWdyZWUuIFRoZSBwcm9wZXIgc29sdXRpb24gd291bGQgYmUgdG8gbm90
IGhhdmUgb2ZfbWF0Y2hfcHRyKCkgIAo+ID4+ICBjb25kaXRpb25hbGx5IGRlZmluZWQuICAKPiA+
PiA+ID4gSSBkaXNhZ3JlZS4uLiAgCj4gPiAgIAo+ID4+ICBSaWdodCBub3cgaXQncyBkZWZpbmVk
IGJhc2ljYWxseSBsaWtlIHRoaXM6Cj4gPj4gICNpZmRlZiBDT05GSUdfT0YKPiA+PiAgI2RlZmlu
ZSBvZl9tYXRjaF9wdHIoX3B0cikgKF9wdHIpCj4gPj4gICNlbHNlCj4gPj4gICNkZWZpbmUgb2Zf
bWF0Y2hfcHRyKF9wdHIpIE5VTEwKPiA+PiAgI2VuZGlmICAKPiA+PiA+PiAgVGhpcyBpcyBiYWQs
IGJlY2F1c2UgaW4gdGhlICFDT05GSUdfT0YgY2FzZSwgdGhlIHBvaW50ZXIgaXMgbmV2ZXIgIAo+
ID4+ICByZWZlcmVuY2VkLCBhbmQgdGhlIGNvbXBpbGVyIGNvbXBsYWlucyBhYm91dCBpdCwgYXMg
eW91IGNhbiBub3RpY2UuICAKPiA+PiA+PiAgSW5zdGVhZCwgaXQgc2hvdWxkIGJlIGRlZmluZWQg
bGlrZSB0aGlzOiAgCj4gPj4gICNkZWZpbmUgb2ZfbWF0Y2hfcHRyKF9wdHIpIFBUUl9JRihJU19F
TkFCTEVEKENPTkZJR19PRiksIChfcHRyKSkgIAo+ID4+ID4+ICBUaGVuIGluIHRoZSAhQ09ORklH
X09GIGNhc2UgdGhlIGNvbXBpbGVyIHdpbGwgc2VlIHRoZSBhcnJheSBhcyA+PiBlZmZlY3RpdmVs
eSAgCj4gPj4gIHVudXNlZCwgYW5kIGRyb3AgaXQgYXMgbmVlZGVkLiAgCj4gPj4gPj4gIFdlIGFy
ZSBkb2luZyB0aGUgZXhhY3Qgc2FtZSB3b3JrIHdpdGggdGhlIFBNIGNhbGxiYWNrcywgd2l0aCB0
aGUgbmV3ICAKPiA+PiAgcG1fcHRyKCkgbWFjcm8uICAKPiA+PiA+PiAgTm90ZSB0aGF0IEkgZG9u
J3Qga25vdyB0aGUgYmVoYXZpb3VyIG9mIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsID4+IC4uLiks
IGl0ICAKPiA+PiAgbWlnaHQgYmUgYSBnb29kIGlkZWEgdG8gbWFrZSBpdCBhIE5PUCBpZiAhQ09O
RklHX09GIHNvIHRoYXQgdGhlID4+IGFycmF5IGlzCj4gPj4gIHJlbW92ZWQgYnkgdGhlIGNvbXBp
bGVyIGFzIGRlYWQgY29kZSAoaWYgaXQncyBub3QgdGhlIGNhc2UgYWxyZWFkeSkuICAKPiA+PiA+
ID4gLi4uIGJlY2F1c2UgQUNQSSBwbGF0Zm9ybXMgY2FuIHVzZSB0aGUgT0YgdGFibGUgdG8gcHJv
YmUgZHJpdmVycyBldmVuICAKPiA+IHdoZW4gdGhleSBkb24ndCBoYXZlIE9GIHN1cHBvcnQuICAK
PiAKPiBGYWlyIGVub3VnaC4gSSBkaWRuJ3QgdGhpbmsgYWJvdXQgdGhpcyB1c2UtY2FzZS4KClNv
IHNoYWxsIEkgZHJvcCBpdCBlbnRpcmVseSBpbiB0aGUgZW5kPyBPciBkbyBpdCBsaWtlIGluIHNl
dmVyYWwgb3RoZXIKZHJpdmVyczogZW5jbG9zZSB0aGUgb2ZfZGV2aWNlX2lkIGFycmF5IGluIGEg
I2lmZGVmPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
