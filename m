Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AF1C77B6E
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 07:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4d2oRD6GlNi3WA0ZhxvGM6yFukm8+1U5Pm5jG2dDCg=; b=JsURjxuj9s05xk
	65QDIqHWMCUx5P4yaXXegfunyTkwF2nYOHgFiSahGzOxkwSBwG1RiadfC5ThYENE4s2IhX7lptx96
	8NcdufKyV8mrlVT6SVJo8vfC+aac18VLgcbfjRzIqbWv2QiTsnN8/2wo3A0iKElRdD6CV4Q4VuX1Q
	tFQSLSBSD5jcGyuFhMZIoKpn2oRlK3Zni/7RGyWUkZB8gqssFSkbjSTwrwwQc76f/BBZrKDLrrJZI
	J+3I9IMwFo0NYo9VS8/7acX2RrpLiO+Ax+b3J+Ib1NpZmJiyOsdMfRxICtWvxz+LwpRAQJccG2ifG
	KB36GHnaTkgMzPGSvEiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVCL-00291h-0P;
	Wed, 12 Apr 2023 07:47:21 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmVCF-0028yM-13;
	Wed, 12 Apr 2023 07:47:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3D6624000D;
	Wed, 12 Apr 2023 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681285625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tl8qiw+0w9MXIDlH7WD7qEaE1rT27aC7+yddYMTRrAw=;
	b=lJFRUAVhi7QhjUM8KhE+bGlOqqK83Y/4D+qAyp5DwQQOZZI5l1bx4mxWQp8wABN4tq5s+E
	QBNuVdRF4QssaRpZ28GzbgW/xfL3D243aKGL9REjBJIuoogtrxz6VSWsWkBIBVqwa1U4Ng
	fqGRSjomysmXiRzUrMD67xfDO5il0YYbmpYM9Rtp+okcjoXkDgJvsX0r7lh7esFYhqgy4g
	Ra/urhTpfr3E/UGeLNwoJJqdxV+8QrjKnDEBNRAc1kHq7rRdAGYDLzpx2vR9Ucqz2Pnwav
	gZDnLUv7NEJWL4amjDFonyAXW3j9iH/i/h+mxmyS8+dVUlA2xcoripRiMxbT6A==
Date: Wed, 12 Apr 2023 09:47:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before
 read
Message-ID: <20230412094651.39f4dbf6@xps-13>
In-Reply-To: <20230412094400.3c82f631@xps-13>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
	<20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
	<20230412094400.3c82f631@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_004715_666761_22D2B78F 
X-CRM114-Status: GOOD (  19.77  )
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

SGkgYWdhaW4sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIFdlZCwgMTIgQXBy
IDIwMjMgMDk6NDQ6MDAgKzAyMDA6Cgo+IEhpIEFyc2VuaXksCj4gCj4gQVZLcmFzbm92QHNiZXJk
ZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMgMDk6MTY6NTggKzAzMDA6Cj4gCj4g
PiBUaGlzIE5BTkQgcmVhZHMgb25seSBmZXcgdXNlcidzIGJ5dGVzIGluIEVDQyBtb2RlIChub3Qg
ZnVsbCBPT0IpLCBzbyAgCj4gCj4gIlRoaXMgTkFORCByZWFkcyIgZG9lcyBub3QgbG9vayByaWdo
dCwgZG8geW91IG1lYW4gIlN1YnBhZ2UgcmVhZHMgZG8KPiBub3QgcmV0cmlldmUgYWxsIHRoZSBP
T0IgYnl0ZXMsIj8KPiAKPiA+IGZpbGwgT09CIGJ1ZmZlciB3aXRoIHplcm9lcyB0byBub3QgcmV0
dXJuIGdhcmJhZ2UgZnJvbSBwcmV2aW91cyByZWFkcwo+ID4gdG8gdXNlci4KPiA+IE90aGVyd2lz
ZSAnbmFuZGR1bXAnIHV0aWxpdHkgcHJpbnRzIHNvbWV0aGluZyBsaWtlIHRoaXMgZm9yIGp1c3Qg
ZXJhc2VkCj4gPiBwYWdlOgo+ID4gCj4gPiAuLi4KPiA+IDB4MDAwMDA3ZjA6IGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCj4gPiAgIE9PQiBEYXRhOiBmZiBm
ZiBmZiBmZiAwMCAwMCBmZiBmZiA4MCBjZiAyMiA5OSBjYiBhZCBkMyBiZQo+ID4gICBPT0IgRGF0
YTogNjMgMjcgYWUgMDYgMTYgMGEgMmYgZWIgYmIgZGQgNDYgNzQgNDEgOGUgODggNmUKPiA+ICAg
T09CIERhdGE6IDM4IGExIDJkIGU2IDc3IGQ0IDA1IDA2IGYyIGE1IDdlIDI1IGViIDM0IDdjIGZm
Cj4gPiAgIE9PQiBEYXRhOiAzOCBlYSBkZSAxNCAxMCBkZSA5YiA0MCAzMyAxNiA2YSBjYyA5ZCBh
YSAyZiA1ZQo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25v
dkBzYmVyZGV2aWNlcy5ydT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29u
X25hbmQuYyB8IDUgKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+IGluZGV4IGY4NGExMDIzOGU0ZC4u
ZjJmMjQ3MmNiNTExIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25f
bmFuZC5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+IEBA
IC04NTgsOSArODU4LDEyIEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfcGFnZV9zdWIoc3Ry
dWN0IG5hbmRfY2hpcCAqbmFuZCwKPiA+ICBzdGF0aWMgaW50IG1lc29uX25mY19yZWFkX3BhZ2Vf
cmF3KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsCj4gPiAgCQkJCSAgIGludCBvb2Jf
cmVxdWlyZWQsIGludCBwYWdlKQo+ID4gIHsKPiA+ICsJc3RydWN0IG10ZF9pbmZvICptdGQgPSBu
YW5kX3RvX210ZChuYW5kKTsKPiA+ICAJdTggKm9vYl9idWYgPSBuYW5kLT5vb2JfcG9pOwo+ID4g
IAlpbnQgcmV0Owo+ID4gIAo+ID4gKwltZW1zZXQob29iX2J1ZiwgMCwgbXRkLT5vb2JzaXplKTsg
IAoKU2hvdWxkIHVzZSAweGZmIGluc3RlYWQgb2YgMHgwMCwgdGhhdCdzIHRoZSBkZWZhdWx0IHN0
YXRlIG9mIGEgTkFORApjZWxsLgoKQW5kIGFsc28gdGhpcyBtZW1zZXQgc2hvdWxkIGJlIGNvbmRp
dGlvbmVkIHRvICdvb2JfcmVxdWlyZWQnIEkKZ3Vlc3M/Cgo+IAo+IEknbSBzdXJwcmlzZWQgcmF3
IHJlYWRzIGRvIG5vdCByZWFkIHRoZSBlbnRpcmUgT09CPwo+IAo+ID4gKwo+ID4gIAlyZXQgPSBt
ZXNvbl9uZmNfcmVhZF9wYWdlX3N1YihuYW5kLCBwYWdlLCAxKTsKPiA+ICAJaWYgKHJldCkKPiA+
ICAJCXJldHVybiByZXQ7Cj4gPiBAQCAtODgxLDYgKzg4NCw4IEBAIHN0YXRpYyBpbnQgbWVzb25f
bmZjX3JlYWRfcGFnZV9od2VjYyhzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLAo+ID4g
IAl1OCAqb29iX2J1ZiA9IG5hbmQtPm9vYl9wb2k7Cj4gPiAgCWludCByZXQsIGk7Cj4gPiAgCj4g
PiArCW1lbXNldChvb2JfYnVmLCAwLCBtdGQtPm9vYnNpemUpOwo+ID4gKwo+ID4gIAlyZXQgPSBt
ZXNvbl9uZmNfcmVhZF9wYWdlX3N1YihuYW5kLCBwYWdlLCAwKTsKPiA+ICAJaWYgKHJldCkKPiA+
ICAJCXJldHVybiByZXQ7ICAKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
