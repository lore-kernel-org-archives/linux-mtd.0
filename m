Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73628C0218F
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 06:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Sr364A0OE6UMq4i+xAlsgPgcV0So2/q121ZWwtWe/Q=; b=a5BXgrjBqti1N8
	lM33ifNejFkZxBbrvtCV3GsxhQPg1s1leVBob905ddRROVf7HWFn3ieATbpTxhFLZMordXp8ybpsG
	kPwEs8kZuEhhy5qjBK4CG6Gys8SN9AXYcUzkY6YFHGK26NF5J5w5ZTxhgS3ZA4f5mHichl276FAFD
	3WM00XkREr2S5CELyTyfHLRyKx5svWPrk59UWYElzDkRPYqIAjViMXH16x35NbSorPmde/KGGQqsY
	YY8kIkp8z1XLtmUu+G4jDeeJy0AHrctc/nLKeLqG8vz9buNBjETVg37ooZZP/NLaankv9knqVZo2n
	yRsGqE/dFzrWbkUk9lWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCJw-0000000HMHd-2nKj;
	Tue, 04 Feb 2025 06:22:04 +0000
Received: from smtp-82.smtpout.orange.fr ([80.12.242.82] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCG6-0000000HLx9-0l20
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 06:18:08 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id fCFwtHY03MBalfCFztJres; Tue, 04 Feb 2025 07:18:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738649881;
	bh=2rigdcBP5Blbnm80a1gcLyNHTyPctzTAtz4Al0/l+0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=KNyaa5VZKs96XELNAwL6YcnuQVGssubBs5PudTymcgJmoHVH6zkCHtJe4PexTDKKH
	 S0mRkXiSHI5Nmtpcnyq88a0dul6gZUTZ6AGuqm624HCxGd0HGCnrAKt7cK25GTPuGT
	 Cf/DW4V2nRwe71lDMW64vPy4BLe4Vd/ZOsXkB4LRe3ffwveFlXT1q8REyb4wa3RIr/
	 fhno6I0wmKBoWv6dJKHI5Z8MI356w2u/ZGHM6hP9phxxeEpfJDuU9R6U4cj4Ilr3X+
	 oWz6aJtA+i6KL4XE1nrPJydfrGx00oGAlpqXKuAwVgVoGsB72IWK5mTc7eWSObccCC
	 hayXja0UbhPUA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 04 Feb 2025 07:18:01 +0100
X-ME-IP: 90.11.132.44
Message-ID: <e41d9378-e5e5-478d-bead-aa50a9f79d4d@wanadoo.fr>
Date: Tue, 4 Feb 2025 07:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: Add check and kfree() for kcalloc()
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: gmpy.liaowx@gmail.com, kees@kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, stable@vger.kernel.org
References: <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
 <20250204023323.14213-1-jiashengjiangcool@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250204023323.14213-1-jiashengjiangcool@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_221806_631222_32ECA3C1 
X-CRM114-Status: GOOD (  18.51  )
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

TGUgMDQvMDIvMjAyNSDDoCAwMzozMywgSmlhc2hlbmcgSmlhbmcgYSDDqWNyaXTCoDoKPiBBZGQg
YSBjaGVjayBmb3Iga2NhbGxvYygpIHRvIGVuc3VyZSBzdWNjZXNzZnVsIGFsbG9jYXRpb24uCj4g
TW9yZW92ZXIsIGFkZCBrZnJlZSgpIGluIHRoZSBlcnJvci1oYW5kbGluZyBwYXRoIHRvIHByZXZl
bnQgbWVtb3J5IGxlYWtzLgo+IAo+IEZpeGVzOiA3OGMwODI0N2I5ZDMgKCJtdGQ6IFN1cHBvcnQg
a21zZyBkdW1wZXIgYmFzZWQgb24gcHN0b3JlL2JsayIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJu
ZWwub3JnPiAjIHY1LjEwKwo+IFNpZ25lZC1vZmYtYnk6IEppYXNoZW5nIEppYW5nIDxqaWFzaGVu
Z2ppYW5nY29vbEBnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlbG9nOgo+IAo+IHYxIC0+IHYyOgo+
IAo+IDEuIFJlbW92ZSByZWR1bmRhbnQgbG9nZ2luZy4KPiAyLiBBZGQga2ZyZWUoKSBpbiB0aGUg
ZXJyb3ItaGFuZGxpbmcgcGF0aC4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL210ZHBzdG9yZS5jIHwg
MTkgKysrKysrKysrKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkcHN0b3Jl
LmMgYi9kcml2ZXJzL210ZC9tdGRwc3RvcmUuYwo+IGluZGV4IDdhYzhhYzkwMTMwNi4uMmQ4ZTMz
MGRkMjE1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZHBzdG9yZS5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbXRkcHN0b3JlLmMKPiBAQCAtNDE4LDEwICs0MTgsMTcgQEAgc3RhdGljIHZvaWQg
bXRkcHN0b3JlX25vdGlmeV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gICAKPiAgIAlsb25n
Y250ID0gQklUU19UT19MT05HUyhkaXZfdTY0KG10ZC0+c2l6ZSwgaW5mby0+a21zZ19zaXplKSk7
Cj4gICAJY3h0LT5ybW1hcCA9IGtjYWxsb2MobG9uZ2NudCwgc2l6ZW9mKGxvbmcpLCBHRlBfS0VS
TkVMKTsKPiArCWlmICghY3h0LT5ybW1hcCkKPiArCQlnb3RvIGVuZDsKCk5pdHBpY2s6IENvdWxk
IGJlIGEgZGlyZWN0IHJldHVybi4KCj4gKwo+ICAgCWN4dC0+dXNlZG1hcCA9IGtjYWxsb2MobG9u
Z2NudCwgc2l6ZW9mKGxvbmcpLCBHRlBfS0VSTkVMKTsKPiArCWlmICghY3h0LT51c2VkbWFwKQo+
ICsJCWdvdG8gZnJlZV9ybW1hcDsKPiAgIAo+ICAgCWxvbmdjbnQgPSBCSVRTX1RPX0xPTkdTKGRp
dl91NjQobXRkLT5zaXplLCBtdGQtPmVyYXNlc2l6ZSkpOwo+ICAgCWN4dC0+YmFkbWFwID0ga2Nh
bGxvYyhsb25nY250LCBzaXplb2YobG9uZyksIEdGUF9LRVJORUwpOwo+ICsJaWYgKCFjeHQtPmJh
ZG1hcCkKPiArCQlnb3RvIGZyZWVfdXNlZG1hcDsKPiAgIAo+ICAgCS8qIGp1c3Qgc3VwcG9ydCBk
bWVzZyByaWdodCBub3cgKi8KPiAgIAljeHQtPmRldi5mbGFncyA9IFBTVE9SRV9GTEFHU19ETUVT
RzsKPiBAQCAtNDM1LDEwICs0NDIsMjAgQEAgc3RhdGljIHZvaWQgbXRkcHN0b3JlX25vdGlmeV9h
ZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gICAJaWYgKHJldCkgewo+ICAgCQlkZXZfZXJyKCZt
dGQtPmRldiwgIm10ZCVkIHJlZ2lzdGVyIHRvIHBzYmxrIGZhaWxlZFxuIiwKPiAgIAkJCQltdGQt
PmluZGV4KTsKPiAtCQlyZXR1cm47Cj4gKwkJZ290byBmcmVlX2JhZG1hcDsKPiAgIAl9Cj4gICAJ
Y3h0LT5tdGQgPSBtdGQ7Cj4gICAJZGV2X2luZm8oJm10ZC0+ZGV2LCAiQXR0YWNoZWQgdG8gTVRE
IGRldmljZSAlZFxuIiwgbXRkLT5pbmRleCk7Cj4gKwlnb3RvIGVuZDsKCk1hdGVyIG9mIHRhc3Rl
LCBidXQgSSB0aGluayB0aGF0IGhhdmluZyBhbiBleHBsaWNpdCByZXR1cm4gaGVyZSB3b3VsZCBi
ZSAKY2xlYXJlciB0aGF0IGEgZ290byBlbmQ7Cgo+ICsKPiArZnJlZV9iYWRtYXA6Cj4gKwlrZnJl
ZShjeHQtPmJhZG1hcCk7Cj4gK2ZyZWVfdXNlZG1hcDoKPiArCWtmcmVlKGN4dC0+dXNlZG1hcCk7
Cj4gK2ZyZWVfcm1tYXA6Cj4gKwlrZnJlZShjeHQtPnJtbWFwKTsKCkkgdGhpbmsgdGhhdCBpbiBh
bGwgdGhlc2UgcGF0aHMsIHlvdSBzaG91bGQgYWxzbyBoYXZlCgljeHQtPlhYWG1hcCA9IE5VTEw7
CmFmdGVyIHRoZSBrZnJlZSgpLgoKb3RoZXJ3aXNlIHdoZW4gbXRkcHN0b3JlX25vdGlmeV9yZW1v
dmUoKSBpcyBjYWxsZWQsIHlvdSBjb3VsZCBoYXZlIGEgCmRvdWJsZSBmcmVlLgoKQ0oKCj4gK2Vu
ZDoKPiArCXJldHVybjsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGludCBtdGRwc3RvcmVfZmx1c2hf
cmVtb3ZlZF9kbyhzdHJ1Y3QgbXRkcHN0b3JlX2NvbnRleHQgKmN4dCwKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
