Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF369C6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 16:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oz5Azx0rdxs1nzQuGIPHnutZUY0mXcNIyiSf7+oxABw=; b=UE7JUcm1RDYmI5
	+YHbIYw352RxzArYS8wTIh7o0uqqif+IJwTsgycw11rSmK6HFWVLGjHNh4XtW3mDXe1NOYaOve8XB
	z9entY8bHOMOlHRiZ+plqMjKOW7VJ7miXer4/yCsqyeUezHU71bILthP3v9sqOfAyxVoF03xWZXyF
	/LZFu2EDTTRU2WsjIvUsR013DX5uPt3IqzscoQu3uM/IZIE+7qh1raEITXOI95LinwIb5YH7p6jD3
	pTxOxy31Fq7rGPJCDvkjGAWpfBiW+R0k3lXLAROrkYbCgAAyqXJzD/qmaopw9bcxcKccCSCyQeXbO
	NWWEtJakjxXTnlZcyZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phCWW-00FCFV-1K;
	Tue, 28 Mar 2023 16:50:16 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phCWQ-00FCAq-2b;
	Tue, 28 Mar 2023 16:50:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 459EBE0003;
	Tue, 28 Mar 2023 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680022205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5lHjQqz2bvwIGLCUjlFOvqonsd4AdNqo2rm07pQiMA8=;
	b=emu/aTREplUYi19S5EGm8XKbz3GPz+d1zNFOUlGxHZKKsmHqfjSKxkSfntMCFy3G9k2nJ9
	+aPkpUlsl7W6O7lLUMQibPVkV2YtOjJsWhpPS+ZxmJSDr82SHQU/zx6IUis2pD7KWBhEQ1
	oGhnJoCRen3yih668hv1cKBQkom6UxBhwpyFZQ8iWZ+0Igtnqtqn9i2luhum0Si0OBZBLL
	yx6zs8+mK72ue65SBHTqgd4alxk5u7LQ0pq5lxIbYoO3xS1G3JA/vclPMcJoyOYwEZdh/T
	ApK5aGSilBv3p3tEL1oWSBOzIkItKlOL14M9w9ak+Dt26FzbJZU4MNEnnxxT/Q==
Date: Tue, 28 Mar 2023 18:50:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang
 <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@sberdevices.ru>, <oxffffaa@gmail.com>
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix bitmask for length in
 command word
Message-ID: <20230328185001.5661132b@xps-13>
In-Reply-To: <81632eee-533e-5e44-1520-5321a06c6797@sberdevices.ru>
References: <d4338bd5-125c-a9e7-cb46-6f5e1da05cfa@sberdevices.ru>
	<CAFBinCB3yuyNJD=7UJ7jzf45Masms_PD4sm42YNjO8M4cr+4wg@mail.gmail.com>
	<fe2ed378-cdac-dbb3-acd2-ff542bd7e887@sberdevices.ru>
	<81632eee-533e-5e44-1520-5321a06c6797@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_095011_104773_1AE52E7E 
X-CRM114-Status: GOOD (  25.72  )
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

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBUdWUsIDI4IE1h
ciAyMDIzIDE4OjU2OjE5ICswMzAwOgoKPiBIZWxsbyEKPiAKPiBATWlxdWVsIFJheW5hbCwgd2hh
dCBpcyB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2g/CgpQbGVhc2UsIGl0J3MgYmVlbiA2IGRheXMs
IHRoZXJlIGlzIGFsc28gYSBtYWludGFpbmVyIChMaWFuZykgaW4KYmV0d2VlbiwgSSdtIGZpbmUg
d2l0aCB0aGUgcGF0Y2ggYnV0IGl0IHdhcyB0b28gbGF0ZSB0byB0YWtlIGl0IGFzCnBhcnQgb2Yg
bXkgcHJldmlvdXMgZml4ZXMgUFIuIEFzIHNhaWQgZWFybGllciB0b2RheSBvbiB0aGUgbWFpbGlu
ZyBsaXN0CnRvIENocmlzdG9waGUgSSB3aWxsIG1ha2UgYW5vdGhlciBmaXhlcyBQUiBuZXh0IHdl
ZWsgKEknbGwgd2FpdCBmb3IgdGhlCmN1cnJlbnQgb25lIHRvIGJlIHBhcnQgb2YgdGhlIG5leHQg
LXJjIHRhZykuCgpCeSB0aGUgd2F5IGFueSByZWFzb24gbm90IHRvIGhhdmUgQ2MnZWQgc3RhYmxl
PwoKPiAKPiBUaGFua3MsIEFyc2VuaXkKPiAKPiBPbiAyMy4wMy4yMDIzIDEwOjU3LCBBcnNlbml5
IEtyYXNub3Ygd3JvdGU6Cj4gPiAKPiA+IAo+ID4gT24gMjIuMDMuMjAyMyAyMzoxMCwgTWFydGlu
IEJsdW1lbnN0aW5nbCB3cm90ZTogIAo+ID4+IEhlbGxvIEFyc2VuaXksCj4gPj4KPiA+PiB0aGFu
ayB5b3UgZm9yIHN1Ym1pdHRpbmcgdGhpcyBmaXghICAKPiA+IFRoYW5rcyEgIAo+ID4+Cj4gPj4g
T24gV2VkLCBNYXIgMjIsIDIwMjMgYXQgNzo0NeKAr1BNIEFyc2VuaXkgS3Jhc25vdgo+ID4+IDxh
dmtyYXNub3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOiAgCj4gPj4+Cj4gPj4+IFZhbGlkIG1hc2sg
aXMgMHgzRkZGLCB3aXRob3V0IHRoaXMgcGF0Y2ggdGhlIGZvbGxvd2luZyBwcm9ibGVtcyB3ZXJl
Cj4gPj4+IGZvdW5kOgo+ID4+Pgo+ID4+PiAxKSBbICAgIDAuOTM4OTE0XSBDb3VsZCBub3QgZmlu
ZCBhIHZhbGlkIE9ORkkgcGFyYW1ldGVyIHBhZ2UsIHRyeWluZwo+ID4+PiAgICAgICAgICAgICAg
ICAgICBiaXQtd2lzZSBtYWpvcml0eSB0byByZWNvdmVyIGl0Cj4gPj4+ICAgIFsgICAgMC45NDcz
ODRdIE9ORkkgcGFyYW1ldGVyIHJlY292ZXJ5IGZhaWxlZCwgYWJvcnRpbmcKPiA+Pj4KPiA+Pj4g
MikgUmVhZCB3aXRoIGRpc2FibGVkIEVDQyBtb2RlIHdhcyBicm9rZW4uCj4gPj4+Cj4gPj4+IEZp
eGVzOiA4ZmFlODU2YzUzNTAgKCJtdGQ6IHJhd25hbmQ6IG1lc29uOiBhZGQgc3VwcG9ydCBmb3Ig
QW1sb2dpYyBOQU5EIGZsYXNoIGNvbnRyb2xsZXIiKQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBBcnNl
bml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4gIAo+ID4+IFRoaXMgbWF0Y2hl
cyB3aGF0IEkgY2FuIHNlZSBpbiB0aGUgb2xkIHZlbmRvciBkcml2ZXIsIHNvOiAgCj4gPiBNb3Jl
b3ZlciBpdCB3YXMgY2xlYXIgdGhhdCBtYXNrIG9mIDB4M2YgaXMgdG9vIHNtYWxsIGZvciBsZW5n
dGggb2YgZGF0YSBpbgo+ID4gYnl0ZXMsIGZvciBleGFtcGxlIGZvciAyMDQ4ICsgT09CIHNpemUu
ICAKPiA+PiBBY2tlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5n
bEBnb29nbGVtYWlsLmNvbT4KPiA+Pgo+ID4+IFsuLi5dICAKPiA+Pj4gLSAgICAgICAgICAgICAg
IGNtZCA9IChsZW4gJiBHRU5NQVNLKDUsIDApKSB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsK
PiA+Pj4gKyAgICAgICAgICAgICAgIGNtZCA9IChsZW4gJiBHRU5NQVNLKDEzLCAwKSkgfCBzY3Jh
bWJsZXIgfCBETUFfRElSKGRpcik7ICAKPiA+PiBNeSB1bmRlcnN0YW5kaW5nIG9mIHRoZSB2ZW5k
b3IgZHJpdmVyIGlzIHRoYXQgdGhpcyAibGVuIiBpcyBvbmx5IHVzZWQKPiA+PiBmb3IgInJhdyIg
YWNjZXNzIChteSBvd24gd29yZHM6IGFueSBhY2Nlc3MgdGhhdCBkb2Vzbid0IHVzZSB0aGUgSFcg
RUNDCj4gPj4gZW5naW5lKS4gIAo+ID4gRXhhY3RseSwgJ2xlbicgaXMgb25seSBmb3IgcmF3IGFj
Y2Vzcy4gIAo+ID4+IEFzIGEgZnV0dXJlIGltcHJvdmVtZW50IChubyBuZWVkIHRvIHVwZGF0ZSBy
ZS1zZW5kIHRoaXMgcGF0Y2gpIGl0Cj4gPj4gd291bGQgYmUgZ3JlYXQgdG8gaGF2ZSBhICNkZWZp
bmUgd2l0aCBhIG1lYW5pbmdmdWwgbmFtZSBmb3IKPiA+PiAiR0VOTUFTSygxMywgMCkiIChtYXli
ZSBzb21ldGhpbmcgbGlrZSBORkNfQ01EX1JBV19MRU5HVEgpIGFzIGl0J3MKPiA+PiB1c2VkIGlu
IG11bHRpcGxlIHBsYWNlcyBub3cgIAo+ID4gQWNrCj4gPiAKPiA+IFRoYW5rcywgQXJzZW5peSAg
Cj4gPj4KPiA+Pgo+ID4+IEJlc3QgcmVnYXJkcywKPiA+PiBNYXJ0aW4gIAoKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
