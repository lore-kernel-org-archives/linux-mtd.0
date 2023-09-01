Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676E7CA0FE1
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Sep 2023 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTCsCD0zlcp2zRWKBRxN5NYK6zmgb1G1UGzEy4bmiz8=; b=MIQ7KyHXae+n9S
	+L/GbE8EX5GXI88dKa/8EyilkSwBHlqawUe/l1zF5hQVrteThLQ7HURPI3V+UaQnQzM2i2VqVpjQI
	s6HosBCIPoi5Rhpy94Vv73zBp6uVUAxF0xPmFWgoHpDBH+78yyo7r6ZJYkJQhvq3yICtiifVhELU0
	JyOhOL6IKOI30S200dRL5rKhWHMeweSFC1RNLpbEjfmXVys0NACrewqx0hFsbI8ZeHS+25ngylMln
	97VLRdWj3NX49Yz7AjXx/ja3mHoQbTdgAz1NEag5gZ/+80r3rLPlEf4CgLKUNzYIVajByetBA9qxU
	Ta8I77dTuvOjhILzeltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc4QK-00HaDO-1n;
	Fri, 01 Sep 2023 13:42:56 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc4QH-00HaD4-2D
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 13:42:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A208B20009;
	Fri,  1 Sep 2023 13:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693575767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFhitebzeZDRmy+9UMlPzwkhNVK79lY88FkzLLsp83s=;
	b=b1gOHvd5A3mtZPBsk212YaR9Rm4UOwqjxorCQ9+MBAFZ4deykig3GfAlHW7adh5btQJcBJ
	AJXFdETsfwtSHqA/ys7BEpBx6zcL554599xrQFdmOzWr7APJ233lEhOL+PyUFkm9nvaVX1
	Sr85DM69E2dQi92O0cbed63NDg+DQvEOIvYLvpinrdGOlHloVDDZmRnZefjQXxCswv2SuU
	LLTPjOb+JMAAPpFEVydfKAfe6P5tN18DDjHPX9DO3n2xDCmj5B67/L8n/Zzry1F4TLmVmj
	tNb2GNjJLd86QeCmNTzw6IfBwYDOhddPGCkRgSY9cCMGIqxsjGSTlwveeChn1w==
Date: Fri, 1 Sep 2023 15:42:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dembskiy Igor <dii@itb.spb.ru>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, Akinobu Mita
 <akinobu.mita@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] mtd: tests: remove useless checks
Message-ID: <20230901154242.12417f09@xps-13>
In-Reply-To: <20230901133641.60817-1-dii@itb.spb.ru>
References: <20230901133641.60817-1-dii@itb.spb.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_064253_873485_F461FA3E 
X-CRM114-Status: GOOD (  14.08  )
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

SGkgSWdvciwKCmRpaUBpdGIuc3BiLnJ1IHdyb3RlIG9uIEZyaSwgIDEgU2VwIDIwMjMgMTY6MzY6
NDEgKzAzMDA6Cgo+IFJldHVybiB2YWx1ZSBvZiBtdGR0ZXN0X3NjYW5fZm9yX2JhZF8oKSBpcyBh
bHdheXMgMC4gU28gaXQgY2F1c2VzIHNlbnNlbGVzcwo+IGNoZWNrcyBpbiBzb21lIGZ1bmN0aW9u
cyBzdWNoIGFzIG10ZF9zdWJwYWdldGVzdF9pbml0KCkuCj4gCj4gRml4ZXM6IDA4NGRiNGIwMjBj
NyAoIm10ZDogdGVzdHM6IGludHJvZHVjZSBoZWxwZXIgZnVuY3Rpb25zIikKPiBTaWduZWQtb2Zm
LWJ5OiBEZW1ic2tpeSBJZ29yIDxkaWlAaXRiLnNwYi5ydT4KPiAtLS0KPiAgZHJpdmVycy9tdGQv
dGVzdHMvb29idGVzdC5jICAgICB8IDIgLS0KPiAgZHJpdmVycy9tdGQvdGVzdHMvcGFnZXRlc3Qu
YyAgICB8IDIgLS0KPiAgZHJpdmVycy9tdGQvdGVzdHMvcmVhZHRlc3QuYyAgICB8IDIgLS0KPiAg
ZHJpdmVycy9tdGQvdGVzdHMvc3BlZWR0ZXN0LmMgICB8IDMgKy0tCj4gIGRyaXZlcnMvbXRkL3Rl
c3RzL3N0cmVzc3Rlc3QuYyAgfCAyIC0tCj4gIGRyaXZlcnMvbXRkL3Rlc3RzL3N1YnBhZ2V0ZXN0
LmMgfCAyIC0tCj4gIGRyaXZlcnMvbXRkL3Rlc3RzL3RvcnR1cmV0ZXN0LmMgfCAyIC0tCj4gIDcg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL210ZC90ZXN0cy9vb2J0ZXN0LmMgYi9kcml2ZXJzL210ZC90ZXN0cy9v
b2J0ZXN0LmMKPiBpbmRleCAxM2ZlZDM5ODkzN2UuLjk3NmY0MGE1NjU2ZSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC90ZXN0cy9vb2J0ZXN0LmMKPiArKysgYi9kcml2ZXJzL210ZC90ZXN0cy9v
b2J0ZXN0LmMKPiBAQCAtMzk5LDggKzM5OSw2IEBAIHN0YXRpYyBpbnQgX19pbml0IG10ZF9vb2J0
ZXN0X2luaXQodm9pZCkKPiAgCXByX2luZm8oInRlc3QgMSBvZiA1XG4iKTsKPiAgCj4gIAllcnIg
PSBtdGR0ZXN0X2VyYXNlX2dvb2RfZXJhc2VibG9ja3MobXRkLCBiYnQsIDAsIGViY250KTsKPiAt
CWlmIChlcnIpCj4gLQkJZ290byBvdXQ7CgpXaGF0J3MgdGhlIHBvaW50IG9mIGtlZXBpbmcgImVy
ciA9IiBvciBldmVuIGtlZXBpbmcgYSByZXR1cm4gdmFsdWUgaWYKdm9pZCB3b3VsZCBiZSBtb3Jl
IGFwcHJvcHJpYXRlPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
