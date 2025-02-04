Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCC3C0218F
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 06:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ItIvxHqVpWl2PBPpwZawSB56qGQr7+MsrZVL0HJIIuk=; b=lCQvn0TlJdB58l
	SymAjG3wZRSeEzC6Bfk/TxvK4RnZ0h3JuiKF0HOLFcti19mSGLW5UtDM6eo7JoC8J7HdyybrXzBmh
	pueNxrDffbZ/8NlRIU9RFkWlXbKAjQVO+X1tazFZNNWzzMDP0cIFzLTBKSO/mH41tJ7C0JAz9CuS7
	roqzsDMie7tSmxT8HZoawj/jWy3AthVL4q5kksoEvWyVktoKQefEaHMN01nWkZfISaOFGn3I2FmWP
	tMLi8L522FVS/I+gKdzm6Zcz6CRvSPxyTu3o4K93u8LLSlAXe24HFTTNAI6NgLBPoDN/jr5kv7Rc8
	M90dk8MyAxcc5w5vfuRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCYJ-0000000HNQo-2y32;
	Tue, 04 Feb 2025 06:36:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCXj-0000000HNMH-0sLC
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 06:36:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 21B64A41927;
	Tue,  4 Feb 2025 06:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FC5C4CEDF;
	Tue,  4 Feb 2025 06:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738650978;
	bh=AoPZffDxKXgAYnlcQCovRARbXMgktVy5zIEqbFmvgqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FmesWUIztCVgHs01aJq5nV1qSuwJawTsW6KqDSdGxfhEfhrSDS+f32SAjxB4SA3pz
	 EynFBJLOf6fT+9BHnEKjMmi/DNPNokAjM0EXvTDgDicLkZrSjyBF1YAwyS5ttJAsBP
	 AKs59S9TuYQ8COtxg6DSTYrpKrtcrdaGKDiPDHO9LSuCRFn6nelAswD6mGzF3/mNSd
	 a9CV/naIamDgeaVtS9AKe9a9F6sd1TnQSWVD2LMbKtSMfLfSFjEIdGtEwuk3GywutA
	 HXD13HJ46aHitKCeEW/O4oQlKHYIjvP2f08qDmi5KNJGveTTF+JBenRHTHkQZqmEdZ
	 eaCADCY1zKDlQ==
Message-ID: <48ad8f05-a90b-499d-9e73-8e5ff032824a@kernel.org>
Date: Tue, 4 Feb 2025 07:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: Add check and kfree() for kcalloc()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: gmpy.liaowx@gmail.com, kees@kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, stable@vger.kernel.org
References: <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
 <20250204023323.14213-1-jiashengjiangcool@gmail.com>
 <e41d9378-e5e5-478d-bead-aa50a9f79d4d@wanadoo.fr>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <e41d9378-e5e5-478d-bead-aa50a9f79d4d@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_223619_390724_3FA7C569 
X-CRM114-Status: GOOD (  18.48  )
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

T24gMDQuIDAyLiAyNSwgNzoxNywgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgo+IExlIDA0LzAy
LzIwMjUgw6AgMDM6MzMsIEppYXNoZW5nIEppYW5nIGEgw6ljcml0wqA6Cj4+IEFkZCBhIGNoZWNr
IGZvciBrY2FsbG9jKCkgdG8gZW5zdXJlIHN1Y2Nlc3NmdWwgYWxsb2NhdGlvbi4KPj4gTW9yZW92
ZXIsIGFkZCBrZnJlZSgpIGluIHRoZSBlcnJvci1oYW5kbGluZyBwYXRoIHRvIHByZXZlbnQgbWVt
b3J5IGxlYWtzLgo+Pgo+PiBGaXhlczogNzhjMDgyNDdiOWQzICgibXRkOiBTdXBwb3J0IGttc2cg
ZHVtcGVyIGJhc2VkIG9uIHBzdG9yZS9ibGsiKQo+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmc+ICMgdjUuMTArCj4+IFNpZ25lZC1vZmYtYnk6IEppYXNoZW5nIEppYW5nIDxqaWFzaGVuZ2pp
YW5nY29vbEBnbWFpbC5jb20+Cj4+IC0tLQo+PiBDaGFuZ2Vsb2c6Cj4+Cj4+IHYxIC0+IHYyOgo+
Pgo+PiAxLiBSZW1vdmUgcmVkdW5kYW50IGxvZ2dpbmcuCj4+IDIuIEFkZCBrZnJlZSgpIGluIHRo
ZSBlcnJvci1oYW5kbGluZyBwYXRoLgo+PiAtLS0KPj4gwqAgZHJpdmVycy9tdGQvbXRkcHN0b3Jl
LmMgfCAxOSArKysrKysrKysrKysrKysrKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9t
dGRwc3RvcmUuYyBiL2RyaXZlcnMvbXRkL210ZHBzdG9yZS5jCj4+IGluZGV4IDdhYzhhYzkwMTMw
Ni4uMmQ4ZTMzMGRkMjE1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9tdGRwc3RvcmUuYwo+
PiArKysgYi9kcml2ZXJzL210ZC9tdGRwc3RvcmUuYwo+PiBAQCAtNDE4LDEwICs0MTgsMTcgQEAg
c3RhdGljIHZvaWQgbXRkcHN0b3JlX25vdGlmeV9hZGQoc3RydWN0IG10ZF9pbmZvIAo+PiAqbXRk
KQo+PiDCoMKgwqDCoMKgIGxvbmdjbnQgPSBCSVRTX1RPX0xPTkdTKGRpdl91NjQobXRkLT5zaXpl
LCBpbmZvLT5rbXNnX3NpemUpKTsKPj4gwqDCoMKgwqDCoCBjeHQtPnJtbWFwID0ga2NhbGxvYyhs
b25nY250LCBzaXplb2YobG9uZyksIEdGUF9LRVJORUwpOwo+PiArwqDCoMKgIGlmICghY3h0LT5y
bW1hcCkKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZW5kOwo+IAo+IE5pdHBpY2s6IENvdWxkIGJl
IGEgZGlyZWN0IHJldHVybi4KPiAKPj4gKwo+PiDCoMKgwqDCoMKgIGN4dC0+dXNlZG1hcCA9IGtj
YWxsb2MobG9uZ2NudCwgc2l6ZW9mKGxvbmcpLCBHRlBfS0VSTkVMKTsKPj4gK8KgwqDCoCBpZiAo
IWN4dC0+dXNlZG1hcCkKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZnJlZV9ybW1hcDsKPj4gwqDC
oMKgwqDCoCBsb25nY250ID0gQklUU19UT19MT05HUyhkaXZfdTY0KG10ZC0+c2l6ZSwgbXRkLT5l
cmFzZXNpemUpKTsKPj4gwqDCoMKgwqDCoCBjeHQtPmJhZG1hcCA9IGtjYWxsb2MobG9uZ2NudCwg
c2l6ZW9mKGxvbmcpLCBHRlBfS0VSTkVMKTsKPj4gK8KgwqDCoCBpZiAoIWN4dC0+YmFkbWFwKQo+
PiArwqDCoMKgwqDCoMKgwqAgZ290byBmcmVlX3VzZWRtYXA7Cj4+IMKgwqDCoMKgwqAgLyoganVz
dCBzdXBwb3J0IGRtZXNnIHJpZ2h0IG5vdyAqLwo+PiDCoMKgwqDCoMKgIGN4dC0+ZGV2LmZsYWdz
ID0gUFNUT1JFX0ZMQUdTX0RNRVNHOwo+PiBAQCAtNDM1LDEwICs0NDIsMjAgQEAgc3RhdGljIHZv
aWQgbXRkcHN0b3JlX25vdGlmeV9hZGQoc3RydWN0IG10ZF9pbmZvIAo+PiAqbXRkKQo+PiDCoMKg
wqDCoMKgIGlmIChyZXQpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoJm10ZC0+ZGV2
LCAibXRkJWQgcmVnaXN0ZXIgdG8gcHNibGsgZmFpbGVkXG4iLAo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG10ZC0+aW5kZXgpOwo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJu
Owo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBmcmVlX2JhZG1hcDsKPj4gwqDCoMKgwqDCoCB9Cj4+
IMKgwqDCoMKgwqAgY3h0LT5tdGQgPSBtdGQ7Cj4+IMKgwqDCoMKgwqAgZGV2X2luZm8oJm10ZC0+
ZGV2LCAiQXR0YWNoZWQgdG8gTVREIGRldmljZSAlZFxuIiwgbXRkLT5pbmRleCk7Cj4+ICvCoMKg
wqAgZ290byBlbmQ7Cj4gCj4gTWF0ZXIgb2YgdGFzdGUsIGJ1dCBJIHRoaW5rIHRoYXQgaGF2aW5n
IGFuIGV4cGxpY2l0IHJldHVybiBoZXJlIHdvdWxkIGJlIAo+IGNsZWFyZXIgdGhhdCBhIGdvdG8g
ZW5kOwoKWWVzLCBkcm9wIHRoZSB3aG9sZSBlbmQuCgo+PiArZnJlZV9iYWRtYXA6Cj4+ICvCoMKg
wqAga2ZyZWUoY3h0LT5iYWRtYXApOwo+PiArZnJlZV91c2VkbWFwOgo+PiArwqDCoMKgIGtmcmVl
KGN4dC0+dXNlZG1hcCk7Cj4+ICtmcmVlX3JtbWFwOgo+PiArwqDCoMKgIGtmcmVlKGN4dC0+cm1t
YXApOwo+IAo+IEkgdGhpbmsgdGhhdCBpbiBhbGwgdGhlc2UgcGF0aHMsIHlvdSBzaG91bGQgYWxz
byBoYXZlCj4gIMKgwqDCoMKgY3h0LT5YWFhtYXAgPSBOVUxMOwo+IGFmdGVyIHRoZSBrZnJlZSgp
Lgo+IAo+IG90aGVyd2lzZSB3aGVuIG10ZHBzdG9yZV9ub3RpZnlfcmVtb3ZlKCkgaXMgY2FsbGVk
LCB5b3UgY291bGQgaGF2ZSBhIAo+IGRvdWJsZSBmcmVlLgoKUmlnaHQsIGFuZCB0aGlzIGlzIGFs
cmVhZHkgYSBwcm9ibGVtIGZvciBmYWlsaW5nIApyZWdpc3Rlcl9wc3RvcmVfZGV2aWNlKCkgaW4g
X2FkZCgpIC0tIHRoZXJlIGlzIHVuY29uZGl0aW9uYWwgCnVucmVnaXN0ZXJfcHN0b3JlX2Rldmlj
ZSgpIGluIF9yZW1vdmUoKS4gU2hvdWxkIF9yZW1vdmUoKSBjaGVjayBjeHQtPm10ZCAKZmlyc3Q/
Cgp0aGFua3MsCi0tIApqcwpzdXNlIGxhYnMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
