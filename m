Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27AAC54E94
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jan 2023 14:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8lojcuReZNgbxQArVgJ6qRU4y2uTq3watyM8HLmOn4=; b=LvdOMHxjlqbdNZNX4/fxytq7h6
	3zA0cgT//12qWep1HuiFxDVTUdzop1jpf+b+P33lFyk/3DjGzAGGwVmizmwpGuyZ4//HZNJjKetk1
	JjRfOdGlvQ+kFiUYczz/86vNvCz+Ah85BUjFeVDihplvkQ5S7XxMdcxZIyMlSmhsPHeSNHZ6gJEgo
	4QOlBMyQIuiPXzL7sy71HznJWOJF3GkHqmUfKg0PdfusSFfpn3xWuMOGwPKHL6fFRvCma1933GqRM
	4w4noZTJa2TyKHrU05kn+nFnr0esZyNNpvnQ15Mor5wzWYN8ZE51zEtgSiBSg3Z8T5BCQ4iHrLLKv
	2zX2T/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3LA-00BDab-Nx; Thu, 26 Jan 2023 14:35:00 +0000
Received: from www.zeus06.de ([194.117.254.36] helo=mail.zeus06.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL3L6-00BDWZ-BK
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2023 14:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=kicherer.org; h=
	mime-version:date:from:to:cc:subject:in-reply-to:references
	:message-id:content-type:content-transfer-encoding; s=k1; bh=1tB
	us/Wjve3WkRXheJCQHNpKO/mVG+IMli5vkcDa7BA=; b=KGBNik5ZvcuK47CyetC
	cLqW2JrGUcXoLww7as3CceN7FR365on36G4eJIwfRclJuNGjHa4Q0Hr9nhOLF38n
	twiexh3eQTj/48lSwF+kVSjBZgsAOIZbhvhJDKAWBSVtqZc1L7P8tTIGii8w3cux
	aAuEHLeb3ZM8sMtWtMCzPJkk=
Received: (qmail 324853 invoked from network); 26 Jan 2023 15:34:47 +0100
Received: by mail.zeus06.de with ESMTPA; 26 Jan 2023 15:34:47 +0100
X-UD-Smtp-Session: l3s6476p2@RtWVpivzXqrCdf4e
MIME-Version: 1.0
Date: Thu, 26 Jan 2023 15:34:47 +0100
From: Mario Kicherer <dev@kicherer.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com, Dhruva
 Gole <d-gole@ti.com>
Subject: Re: [PATCH v2] mtd: spinand: Add support for AllianceMemory
 AS5F34G04SND
In-Reply-To: <20230126095112.3fd55899@xps-13>
References: <20230117165441.1368447-1-dev@kicherer.org>
 <20230123113337.78f5e3db@xps-13>
 <fae6950f62ebde63b3be0cde384fbde9@kicherer.org>
 <20230125152733.3b6bf0bd@xps-13>
 <c452cc08efa87359294d7042ea68ffee@kicherer.org>
 <20230126095112.3fd55899@xps-13>
Message-ID: <07c86c5f57145fdc5f06c6f57b8fea84@kicherer.org>
X-Sender: dev@kicherer.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_063457_531565_12F6FB5D 
X-CRM114-Status: GOOD (  28.15  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTWlxdcOobCwKCkkgbWFkZSBhbGwgcmVxdWVzdGVkIGNoYW5nZXMgYW5kIGFkZGVkIGFk
ZGl0aW9uYWwgY29kZSB0byBtYWtlIHRoZSAKb29ibGF5b3V0CmZ1bmN0aW9ucyBjb21wYXRpYmxl
IHdpdGggYWxsIGZsYXNoZXMgb2YgdGhpcyBzZXJpZXMuCgpJIGFsc28gcmFuIG5hbmRiaXRlcnJz
IHdpdGggdGhlIGZvbGxvd2luZyByZXN1bHQ6CgojIG5hbmRiaXRlcnJzIC1pIC9kZXYvbXRkMTEK
aW5jcmVtZW50YWwgYml0ZXJyb3JzIHRlc3QKU3VjY2Vzc2Z1bGx5IGNvcnJlY3RlZCAwIGJpdCBl
cnJvcnMgcGVyIHN1YnBhZ2UKSW5zZXJ0ZWQgYml0ZXJyb3IgQCAwLzUKUmVhZCByZXBvcnRlZCA3
IGNvcnJlY3RlZCBiaXQgZXJyb3JzClN1Y2Nlc3NmdWxseSBjb3JyZWN0ZWQgMSBiaXQgZXJyb3Jz
IHBlciBzdWJwYWdlCkluc2VydGVkIGJpdGVycm9yIEAgMC8yClJlYWQgcmVwb3J0ZWQgNyBjb3Jy
ZWN0ZWQgYml0IGVycm9ycwpTdWNjZXNzZnVsbHkgY29ycmVjdGVkIDIgYml0IGVycm9ycyBwZXIg
c3VicGFnZQpJbnNlcnRlZCBiaXRlcnJvciBAIDAvMApSZWFkIHJlcG9ydGVkIDcgY29ycmVjdGVk
IGJpdCBlcnJvcnMKU3VjY2Vzc2Z1bGx5IGNvcnJlY3RlZCAzIGJpdCBlcnJvcnMgcGVyIHN1YnBh
Z2UKSW5zZXJ0ZWQgYml0ZXJyb3IgQCAxLzcKUmVhZCByZXBvcnRlZCA3IGNvcnJlY3RlZCBiaXQg
ZXJyb3JzClN1Y2Nlc3NmdWxseSBjb3JyZWN0ZWQgNCBiaXQgZXJyb3JzIHBlciBzdWJwYWdlCklu
c2VydGVkIGJpdGVycm9yIEAgMS81ClJlYWQgcmVwb3J0ZWQgNyBjb3JyZWN0ZWQgYml0IGVycm9y
cwpTdWNjZXNzZnVsbHkgY29ycmVjdGVkIDUgYml0IGVycm9ycyBwZXIgc3VicGFnZQpJbnNlcnRl
ZCBiaXRlcnJvciBAIDEvMgpSZWFkIHJlcG9ydGVkIDcgY29ycmVjdGVkIGJpdCBlcnJvcnMKU3Vj
Y2Vzc2Z1bGx5IGNvcnJlY3RlZCA2IGJpdCBlcnJvcnMgcGVyIHN1YnBhZ2UKSW5zZXJ0ZWQgYml0
ZXJyb3IgQCAxLzAKUmVhZCByZXBvcnRlZCA3IGNvcnJlY3RlZCBiaXQgZXJyb3JzClN1Y2Nlc3Nm
dWxseSBjb3JyZWN0ZWQgNyBiaXQgZXJyb3JzIHBlciBzdWJwYWdlCkluc2VydGVkIGJpdGVycm9y
IEAgMi82ClJlYWQgcmVwb3J0ZWQgOCBjb3JyZWN0ZWQgYml0IGVycm9ycwpTdWNjZXNzZnVsbHkg
Y29ycmVjdGVkIDggYml0IGVycm9ycyBwZXIgc3VicGFnZQpJbnNlcnRlZCBiaXRlcnJvciBAIDIv
NQpGYWlsZWQgdG8gcmVjb3ZlciAxIGJpdGZsaXBzClJlYWQgZXJyb3IgYWZ0ZXIgOSBiaXQgZXJy
b3JzIHBlciBwYWdlCgpJIHdvdWxkIHNheSB0aGlzIGxvb2tzIGdvb2Q/CgpJIHdpbGwgc2VuZCB0
aGUgbmV3IHBhdGNoIGluIGEgZmV3IHNlY29uZHMuCgpUaGFuayB5b3UhCk1hcmlvCgpPbiAyMDIz
LTAxLTI2IDA5OjUxLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIE1hcmlvLAo+IAo+IGRldkBr
aWNoZXJlci5vcmcgd3JvdGUgb24gV2VkLCAyNSBKYW4gMjAyMyAxNjowMzo1OCArMDEwMDoKPiAK
Pj4gT24gMjAyMy0wMS0yNSAxNToyNywgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gPj4gPj4gK3N0
YXRpYyBpbnQgYW1fZWNjX2dldF9zdGF0dXMoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5k
LCB1OCA+PiBzdGF0dXMpCj4+ID4+ID4+ICt7Cj4+ID4+ID4+ICsJc3dpdGNoIChzdGF0dXMgJiBB
TV9TVEFUVVNfRUNDX0JJVE1BU0spIHsKPj4gPj4gPj4gKwljYXNlIEFNX1NUQVRVU19FQ0NfTk9O
RV9ERVRFQ1RFRDoKPj4gPj4gPj4gKwkJcmV0dXJuIDA7Cj4+ID4+ID4+ICsKPj4gPj4gPj4gKwlj
YXNlIEFNX1NUQVRVU19FQ0NfMV9DT1JSRUNURUQ6Cj4+ID4+ID4+ICsJCXJldHVybiAxOwo+PiA+
PiA+PiArCj4+ID4+ID4+ICsJY2FzZSBBTV9TVEFUVVNfRUNDX01BWF9DT1JSRUNURUQ6Cj4+ID4+
ID4+ICsJCXJldHVybiA4Owo+PiA+PiA+PiArCj4+ID4+ID4+ICsJY2FzZSBBTV9TVEFUVVNfRUND
XzFfREVURUNURUQ6Cj4+ID4+ID4KPj4gPj4gPiBXaGF0IGRvZXMgdGhpcyBtZWFuICIxIGRldGVj
dGVkIj8KPj4gPj4gPj4gQWNjb3JkaW5nIHRvIHRoZSBtYW51YWwsIHRoZSBjaGlwIGNhbiByZXBv
cnQgdGhhdCBhIGJpdCBlcnJvciB3YXMgPj4gZGV0ZWN0ZWQKPj4gPj4gYnV0IGNvdWxkIG5vdCBi
ZSBjb3JyZWN0ZWQuCj4+ID4KPj4gPiBUaGF0IGRvZXMgbm90IG1ha2UgYSBsb3Qgb2Ygc2Vuc2Uu
IEVpdGhlciB5b3UgdXNlIGEgSGFtbWluZyBhbGdvcml0aG0sCj4+ID4geW91IHdpbGwgYmUgYWJs
ZSB0byBjb3JyZWN0IDEgYml0IGVycm9yIGFuZCB0byBkZXRlY3QgMiBiaXQgZXJyb3JzLCBvcgo+
PiA+IHlvdSB1c2UgYW5vdGhlciBhbGdvcml0aG0gKEJDSCwgdXN1YWxseSkgd2l0aCBhIHN0cmVu
Z3RoIG9mIFggKFggPiAxKQo+PiA+IGFuZCB5b3UnbGwgYmUgYWJsZSB0byBjb3JyZWN0IHVwIHRv
IFggZXJyb3JzIGFuZCBkZXRlY3QgWCsxIGVycm9ycy4KPj4gPgo+PiA+IEJ1dCBvbmx5IGJlaW5n
IGFibGUgdG8gZGV0ZWN0IGEgc2luZ2xlIGJpdCBmbGlwIHdpdGhvdXQgYmVpbmcgYWJsZSB0bwo+
PiA+IGNvcnJlY3QgaXQgaXMgc3RyYW5nZSAoZXZlbiB1c2VsZXNzPykuIFNvIEkgZG9uJ3QgdW5k
ZXJzdGFuZCBob3cgaXQKPj4gPiBzaG91bGQgYmUgdXNlZC4KPj4gCj4+IFVuZm9ydHVuYXRlbHks
IEkgZG8gbm90IGhhdmUgbXVjaCBleHBlcmllbmNlIHdpdGggTkFORCBmbGFzaGVzLiBUaGUKPj4g
bWFudWFsIGRvZXMgbm90IHNheSBtdWNoIG1vcmUgLSBwYWdlIDQxIGluIFsxXSBpbiBjYXNlIHlv
dSB3YW50IHRvCj4+IHNlZSBmb3IgeW91cnNlbGYuIEkgdGhvdWdodCByZXR1cm5pbmcgLUVCQURN
U0cgaW4gdGhpcyBjYXNlIHdvdWxkIGJlCj4+IHRoZSByaWdodCB0aGluZyB0byBkbyBhcyBhbiB1
bmNvcnJlY3RhYmxlIGVycm9yIGhhcHBlbmVkLgo+IAo+IDAwYiA9IE5vIGJpdCBlcnJvcnMgd2Vy
ZSBkZXRlY3RlZAo+IDAxYiA9IGJpdCBlcnJvciB3YXMgZGV0ZWN0ZWQgYW5kIGNvcnJlY3RlZAo+
IDEwYiA9IGJpdCBlcnJvciB3YXMgZGV0ZWN0ZWQgYW5kIG5vdCBjb3JyZWN0ZWQKPiAxMWIgPSBi
aXQgZXJyb3Igd2FzIGRldGVjdGVkIGFuZCBjb3JyZWN0ZWQsIGVycm9yIGJpdCBudW1iZXIgPSBF
Q0MgbWF4IAo+IHdoaWNoCj4gaXMgYWNjb3JkaW5nIHRvIGV4dGVuZGVkIHJlZ2lzdGVyLgo+IAo+
IEkgZ3Vlc3MgaXQgbWVhbnMgdGhhdCBpZiB5b3UgaGF2ZSBhIHN0cmVuZ3RoIG9mIFg6Cj4gLSBm
cm9tIDEgYmYgdG8gWC0xIHRoZSBzdGF0dXMgd2lsbCBiZSBzZXQgdG8gMHgxCj4gLSBpZiB5b3Ug
aGF2ZSBYIGJmIGl0IHdpbGwgYmUgc2V0IHRvIDB4Mwo+IC0gaWYgeW91IGhhdmUgbW9yZSB0aGFu
IFggYmYsIGl0IHdpbGwgYmUgc2V0IHRvIDB4Mi4KPiAKPiBQbGVhc2UgdXBkYXRlIHRoZSBjb2Rl
IGFuZCB1c2UgbXRkLXV0aWxzIChsaWtlIHRoZSBiaXQgZXJyb3IgdGVzdCkgdG8KPiB2ZXJpZnkg
d2hhdCB0aGUgdG9vbHMgc2F5cyBhbmQgYnkgdHJhY2luZyB0aGUgcmVnaXN0ZXIgdmFsdWVzIGV4
dHJhY3RlZAo+IHdpdGggYSBzaW1wbGUgcHJpbnRrIHRvIGZvbGxvdyBpZiB0aGUgYWJvdmUgbG9n
aWMgd29ya3MuCj4gCj4+IEkgaGF2ZSBub3QgdXNlZCB0aGUgZmxhc2ggbXVjaCB5ZXQsIHNvIEkg
Y2Fubm90IHNheSB0aGF0IEkgaGF2ZSBtdWNoCj4+IGNvbmZpZGVuY2UgaW50byB0aGUgY2hpcCdz
IGVycm9yIHJlcG9ydGluZy4gU28gZmFyIHRoZSBmbGFzaCB3b3JrZWQKPj4gd2l0aG91dCBpc3N1
ZXMuCj4+IAo+PiBTaG91bGQgSSBjaGFuZ2Ugc29tZXRoaW5nIGluIHRoZSBwYXRjaD8KPj4gCj4+
IEJlc3QgcmVnYXJkcywKPj4gTWFyaW8KPj4gCj4+IFsxXSAKPj4gaHR0cHM6Ly93d3cuYWxsaWFu
Y2VtZW1vcnkuY29tL3dwLWNvbnRlbnQvdXBsb2Fkcy9wZGYvZmxhc2gvQWxsaWFuY2VNZW1vcnlf
U1BJX05BTkRfRmxhc2hfSnVseTIwMjBfUmV2MS4wLnBkZgo+IAo+IAo+IFRoYW5rcywKPiBNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
