Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604D7CE7A81
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiJOP5F+SIwEZJckiK3NvEP2CBv+KW/NgffMoWj+jtk=; b=3oS0WQXDyVvv4a
	u5vo8tO/IyiXTn3US7TVUVtS4Cj+ZRix1EvOqMIl77JnP0+q1xG65ut70TUUIMlRn0pBDs5AiGVLA
	GvcTNT1q3KN0vhhVKeTse9xisb/+ymmzQLqhLgqUZ7GPr67TvG+CO4AIfRnLViVAO1kogADFyi+gu
	EYNpEASB2LujKGLdtveQO2ue9n3K+yOeafcW5ViPt19bKnqrqiP/pAKntbSCYy04a11EsTt4UPyrw
	3BwRbBoDVUvKr7sKb+NtjUsFjaWmoTtzprHjvUh/ePF6LHcGFussaJxE9ukLJaFYQttBLOCg5lyF9
	8dEJl5m09FDsbJUwyi6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhHp-00Dly9-2t;
	Mon, 25 Sep 2023 08:49:49 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhHm-00Dlx2-1g
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 08:49:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19B2CFF803;
	Mon, 25 Sep 2023 08:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695631782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=INBNCslwxKAO9zA0oLb6M4ySYAmug40tgKE1H/MmE0A=;
	b=TYej/Qhs2tQt0X2X/1RpcZsO4PzpvkrHD6BxUtce/kqEyax4ZxRj1S/sEYcWjqB0CO7TOK
	HwaElyLLqzCZdL56EkdOOuZy6SXYGOEK7VBY9yirkxT/jTHZdITbC7qWW9+K1T9RHH3PMY
	JsKw3fQpnhmU+Xi8dCW88Y/WNNrhqDjfBoyZiz9uJtT04NQiy3CvxGZo3g9QC9utv3rz26
	grC+poafNhzfdTSS1R2PAgHR3MPF/KLR++jSqhXpz+P9tjBLbQLmhAJZtg7fznHcedhviv
	yQzPzPnn6QubeEZoxgSR9rRNwUqgUaHQ5DkaCsZHYycaOk1f1VBRO/ouHIH81Q==
Date: Mon, 25 Sep 2023 10:49:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <chengzhihao1@huawei.com>,
 <yi.zhang@huawei.com>, <yangerkun@huawei.com>
Subject: Re: [RFC] mtd: Fix error code loss in mtdchar_read() function.
Message-ID: <20230925104938.3f7b4284@xps-13>
In-Reply-To: <20230923005856.2538223-1-wangzhaolong1@huawei.com>
References: <20230923005856.2538223-1-wangzhaolong1@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_014946_996248_B2198BD1 
X-CRM114-Status: GOOD (  22.92  )
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

SGVsbG8sCgpSaWNoYXJkLCB5b3VyIGFkdmljZSBpcyB3ZWxjb21lIGhlcmUuCgp3YW5nemhhb2xv
bmcxQGh1YXdlaS5jb20gd3JvdGUgb24gU2F0LCAyMyBTZXAgMjAyMyAwODo1ODo1NiArMDgwMDoK
Cj4gSW4gdGhlIGZpcnN0IHdoaWxlIGxvb3AsIGlmIHRoZSBtdGRfcmVhZCgpIGZ1bmN0aW9uIHJl
dHVybnMgLUVCQURNU0cKCgkJCSAgICAgIHMvdGhlLy8JICAgICBzL2Z1bmN0aW9uLy8KCQkJICAg
ICAgLAoKPiBhbmQgJ3JldGxlbicgcmV0dXJucyAwLCB0aGUgbG9vcCBicmVhayBhbmQgdGhlIGZ1
bmN0aW9uIHJldHVybnMgdmFsdWUKCnMvYW5kLy8JCXJlbWFpbnMgdG8gMC4gVGhlIGxvb3AgYnJl
YWtzIGFuZCB0aGUgZnVuY3Rpb24KcmV0dXJucyAndG90YWxfcmV0bGVuJyB3aGljaCBpcyAwIGlu
c3RlYWQgb2YgdGhlIGVycm9yIGNvZGUuCgo+ICd0b3RhbF9yZXRsZW4nIGlzIDAsIG5vdCB0aGUg
ZXJyb3IgY29kZS4KCkFjdHVhbGx5IGFmdGVyIGxvb2tpbmcgYXQgdGhlIGNvZGUsIEkgaGF2ZSBu
byBzdHJvbmcgb3BpbmlvbgpyZWdhcmRpbmcgd2hldGhlciB3ZSBzaG91bGQgcmV0dXJuIDAgb3Ig
YW4gZXJyb3IgY29kZSBpbiB0aGlzIGNhc2UuIAoKVGhlcmUgaXMgdGhpcyBjb21tZW50IHJpZ2h0
IGFib3ZlLCBhbmQgSSdtIG5vdCBzdXJlIGl0IGlzIHN0aWxsIHVwIHRvCmRhdGUgYmVjYXVzZSBJ
IGJlbGlldmUgbWFueSBkcml2ZXJzIGp1c3QgZG9uJ3QgcHJvdmlkZSB0aGUgZGF0YSB1cG9uCkVD
QyBlcnJvcjoKCiAgICAgICAgICAgICAgICAvKiBOYW5kIHJldHVybnMgLUVCQURNU0cgb24gRUND
IGVycm9ycywgYnV0IGl0IHJldHVybnMKICAgICAgICAgICAgICAgICAqIHRoZSBkYXRhLiBGb3Ig
b3VyIHVzZXJzcGFjZSB0b29scyBpdCBpcyBpbXBvcnRhbnQKICAgICAgICAgICAgICAgICAqIHRv
IGR1bXAgYXJlYXMgd2l0aCBFQ0MgZXJyb3JzIQogICAgICAgICAgICAgICAgICogRm9yIGtlcm5l
bCBpbnRlcm5hbCB1c2FnZSBpdCBhbHNvIG1pZ2h0IHJldHVybiAtRVVDTEVBTgogICAgICAgICAg
ICAgICAgICogdG8gc2lnbmFsIHRoZSBjYWxsZXIgdGhhdCBhIGJpdGZsaXAgaGFzIG9jY3VycmVk
IGFuZCBoYXMKICAgICAgICAgICAgICAgICAqIGJlZW4gY29ycmVjdGVkIGJ5IHRoZSBFQ0MgYWxn
b3JpdGhtLgogICAgICAgICAgICAgICAgICogVXNlcnNwYWNlIHNvZnR3YXJlIHdoaWNoIGFjY2Vz
c2VzIE5BTkQgdGhpcyB3YXkKICAgICAgICAgICAgICAgICAqIG11c3QgYmUgYXdhcmUgb2YgdGhl
IGZhY3QgdGhhdCBpdCBkZWFscyB3aXRoIE5BTkQKICAgICAgICAgICAgICAgICAqLwoKPiBUaGlz
IHByb2JsZW0gY2F1c2VzIHRoZSB1c2VyLXNwYWNlIHByb2dyYW0gdG8gZW5jb3VudGVyIEVPRiB3
aGVuIGl0IGhhcwo+IG5vdCBmaW5pc2hlZCByZWFkaW5nIHRoZSBtdGQgcGFydGlvbiwgYW5kIHRo
aXMgYWxzbyB2aW9sYXRlcyB0aGUgcmVhZAo+IHN5c3RlbSBjYWxsIHN0YW5kYXJkIGluIFBPU0lY
Lgo+IAo+IExpbms6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
MjE3OTM5Cj4gU2lnbmVkLW9mZi1ieTogWmhhb0xvbmcgV2FuZyA8d2FuZ3poYW9sb25nMUBodWF3
ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9tdGRjaGFyLmMgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9tdGRjaGFyLmMgYi9kcml2ZXJzL210ZC9tdGRjaGFyLmMKPiBpbmRleCA4ZGM0
ZjVjNDkzZmMuLmJhNjBkYzZiZWY5OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjaGFy
LmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRjaGFyLmMKPiBAQCAtMjExLDcgKzIxMSw3IEBAIHN0
YXRpYyBzc2l6ZV90IG10ZGNoYXJfcmVhZChzdHJ1Y3QgZmlsZSAqZmlsZSwgY2hhciBfX3VzZXIg
KmJ1Ziwgc2l6ZV90IGNvdW50LAo+ICAJfQo+ICAKPiAgCWtmcmVlKGtidWYpOwo+IC0JcmV0dXJu
IHRvdGFsX3JldGxlbjsKPiArCXJldHVybiB0b3RhbF9yZXRsZW4gPyB0b3RhbF9yZXRsZW4gOiBy
ZXQ7CgpUaGlzIGlzIGtpbmQgb2Ygd3JvbmcsIGlmIHJldCBpcyAwIHRoZW4geW91IHJldHVybiBy
ZXQgd2hpbGUgeW91IHNob3VsZApyZXR1cm4gdG90YWxfcmV0bGVuLiBJbiBwcmFjdGljZSBpdCBk
b2VzIG5vdCByZWFsbHkgbWF0dGVyLCB0aGUgcmVzdWx0CmlzIHRoZSBzYW1lLCBidXQgaXQgbWFr
ZXMgaXQgaGFyZGVyIHRvIHVuZGVyc3RhbmQgdGhlIGNvZGUgSU1ITy4KCj4gIH0gLyogbXRkY2hh
cl9yZWFkICovCj4gIAo+ICBzdGF0aWMgc3NpemVfdCBtdGRjaGFyX3dyaXRlKHN0cnVjdCBmaWxl
ICpmaWxlLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLCBzaXplX3QgY291bnQsCgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
