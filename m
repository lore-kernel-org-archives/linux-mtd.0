Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13793F30924
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVobovb7iZg2bYO0JfB6eAO/pdAKoBMwXCK1bt/JLMw=; b=CuZ7bvcEHm5X2q
	V7zB8UX39XVv1eIIO6CyHeziPhBRtvf/MaftgYoBNlDejsp40Fkxdli1/8pIXFKtGPEX6LhnrKVza
	Wp6QYXWI0+heJkuEA1L6J9NcrnWBA5jMflbkSAsiMYME50qX91UyMJJEMr9SoNK0hY2rPmthBLxVh
	4utkHuazQW8OjdYp+4IX5xATqNsWQrdNRril0EdwzWx4g4ygILnlRn+SJxRgJhKR4bLfEnoxoVVjt
	U+zq7JFb4kEcVtHB3T6m5UFH7FTcdLG1THIOascYANxD4jiWsW7fwJOmBXvIwyKgHlNduzjYU8e5h
	95xm/3P+bJm8OkdivSwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Fh-00000001Qyt-3900;
	Thu, 05 Mar 2026 09:44:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Fe-00000001QwK-2HEK
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 09:44:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 69AC44E42566;
	Thu,  5 Mar 2026 09:44:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 408DB5FDEB;
	Thu,  5 Mar 2026 09:44:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58761103697F1;
	Thu,  5 Mar 2026 10:44:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772703851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qKbdSfvMKhaS1O9N44Ii5n4L97KLZKLOOIegRa3bjyg=;
	b=KRWp0R58lV8TzOHIuFGXEwGag71Epk/I1rydLhFdA4nYNpg6z6XFlCp5WTRQKSCwOyowDW
	eq9UdDia3F4XGD33ynxvtaS6sONv2v4oenFH4dNgSzrHS2ktq1ihJ6c4fXakTeBHSZzR0/
	rHS0EHA8XVIemkpmyFFXvWL6XBY+s4JEE04TqJskJxAhE9tmTH3VUhRM8tZijpo8kBf+v2
	1JQa2xxvO0rFMiaMe8eGjlClB35cTgniewKBs8UulOCTTwmHPOrB3OmEK7j65RxiKWWZ3J
	FkyQDGknn/lNlM7nmVYlnlxUB1uYCx3d7vqPDLnBESz60izKVvCMjDrf28c+xQ==
Message-ID: <5579e0f7-ccdc-4a39-9e45-f3a1296f448e@bootlin.com>
Date: Thu, 5 Mar 2026 10:44:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mtd: rawnand: sunxi: replace hard coded value by a
 define - take2
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-5-richard.genoud@bootlin.com>
 <13952574.uLZWGnKmhe@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <13952574.uLZWGnKmhe@jernej-laptop>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_014414_708630_5D093944 
X-CRM114-Status: GOOD (  18.38  )
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

TGUgMjEvMDIvMjAyNiDDoCAxMDoyMywgSmVybmVqIMWga3JhYmVjIGEgw6ljcml0wqA6Cj4gRG5l
IHBldGVrLCAyMC4gZmVicnVhciAyMDI2IG9iIDE3OjEwOjA5IFNyZWRuamVldnJvcHNraSBzdGFu
ZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPj4gVGhlIHVzZXIgZGF0
YSBsZW5ndGggKDQpIGhhcyBiZWVuIHJlcGxhY2VkIGFsbW9zdCBhbGwgb3ZlciB0aGUgZmlsZSwg
YnV0Cj4+IDIgcGxhY2VzIHdlcmUgZm9yZ290dGVuLgo+Pgo+PiBUaGUgdXNlciBkYXRhIGlzIHBs
YWNlZCBiZWZvcmUgdGhlIEVDQywgZm9yIGVhY2ggc3RlcC4KPj4gU28sIGluIHN1bnhpX25mY19o
d19lY2NfcmVhZF9leHRyYV9vb2IoKSwgdGhlIG9mZnNldCBvZiB0aGUgdXNlciBkYXRhIGluCj4+
IE9PQiBpcyBpbmRlZWQgKChlY2MtPmJ5dGVzICsgVVNFUl9EQVRBX1NaKSAqIGVjYy0+c3RlcHMp
Owo+Pgo+PiBBbmQgaW4gc3VueGlfbmFuZF9vb2JsYXlvdXRfZWNjKCksIHRoZSBvZmZzZXQgb2Yg
dGhlIEVDQyBjaHVuayBpbiBPT0IgaXMKPj4gdGhlIHNhbWUgb2Zmc2V0IHBsdXMgdGhlIGN1cnJl
bnQgdXNlciBkYXRhIHNpemU6Cj4+IHNlY3Rpb24gKiAoZWNjLT5ieXRlcyArIFVTRVJfREFUQV9T
WikgKyBVU0VSX0RBVEFfU1o7Cj4+Cj4+IEZpeGVzOiAxYmU3YWM3OGI3MmYgKCJtdGQ6IHJhd25h
bmQ6IHN1bnhpOiBSZXBsYWNlIGhhcmQgY29kZWQgdmFsdWUgYnkgYSBkZWZpbmUiKQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBSaWNoYXJkIEdlbm91ZCA8cmljaGFyZC5nZW5vdWRAYm9vdGxpbi5jb20+Cj4g
Cj4gVGhpcyBkb2Vzbid0IHJlYWxseSBuZWVkIEZpeGVzIHRhZyBzaW5jZSBpdCdzIG9ubHkgcmVm
YWN0b3JpbmcuCkluZGVlZC4KCj4gCj4gV2l0aCB0aGF0IHNhaWQ6Cj4gUmV2aWV3ZWQtYnk6IEpl
cm5laiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+CgoKVGhhbmtzIQo+IAo+IEJl
c3QgcmVnYXJkcywKPiBKZXJuZWoKPiAKPj4gLS0tCj4+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3VueGlfbmFuZC5jIHwgNCArKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3N1bnhpX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhpX25hbmQuYwo+PiBpbmRl
eCA5OWQzMDViYmRhNTMuLjVkOTI1YjU5YjYxOCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc3VueGlfbmFuZC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N1bnhp
X25hbmQuYwo+PiBAQCAtMTA1MSw3ICsxMDUxLDcgQEAgc3RhdGljIHZvaWQgc3VueGlfbmZjX2h3
X2VjY19yZWFkX2V4dHJhX29vYihzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLAo+PiAgIHsKPj4gICAJ
c3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChuYW5kKTsKPj4gICAJc3RydWN0IG5h
bmRfZWNjX2N0cmwgKmVjYyA9ICZuYW5kLT5lY2M7Cj4+IC0JaW50IG9mZnNldCA9ICgoZWNjLT5i
eXRlcyArIDQpICogZWNjLT5zdGVwcyk7Cj4+ICsJaW50IG9mZnNldCA9ICgoZWNjLT5ieXRlcyAr
IFVTRVJfREFUQV9TWikgKiBlY2MtPnN0ZXBzKTsKPj4gICAJaW50IGxlbiA9IG10ZC0+b29ic2l6
ZSAtIG9mZnNldDsKPj4gICAKPj4gICAJaWYgKGxlbiA8PSAwKQo+PiBAQCAtMTc0Nyw3ICsxNzQ3
LDcgQEAgc3RhdGljIGludCBzdW54aV9uYW5kX29vYmxheW91dF9lY2Moc3RydWN0IG10ZF9pbmZv
ICptdGQsIGludCBzZWN0aW9uLAo+PiAgIAlpZiAoc2VjdGlvbiA+PSBlY2MtPnN0ZXBzKQo+PiAg
IAkJcmV0dXJuIC1FUkFOR0U7Cj4+ICAgCj4+IC0Jb29icmVnaW9uLT5vZmZzZXQgPSBzZWN0aW9u
ICogKGVjYy0+Ynl0ZXMgKyBVU0VSX0RBVEFfU1opICsgNDsKPj4gKwlvb2JyZWdpb24tPm9mZnNl
dCA9IHNlY3Rpb24gKiAoZWNjLT5ieXRlcyArIFVTRVJfREFUQV9TWikgKyBVU0VSX0RBVEFfU1o7
Cj4+ICAgCW9vYnJlZ2lvbi0+bGVuZ3RoID0gZWNjLT5ieXRlczsKPj4gICAKPj4gICAJcmV0dXJu
IDA7Cj4+Cj4gCj4gCj4gCj4gCgoKLS0gClJpY2hhcmQgR2Vub3VkLCBCb290bGluCkVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
