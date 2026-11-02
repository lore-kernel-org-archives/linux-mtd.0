Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CECD606A336
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2026 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YDwy4uBu;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=TwyyYEyO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kc33OTaxunnPBTKYv0uPX9mjAqmaNW1cXmjVvOKifxg=; b=YDwy4uBudc9pov+8N8+wqWN3Ln
	iHZfyV7AOVQ8KJ4R7iqcXargOuHPkn7UVfENs4eESiaoSaHgQnr3RFNGUDzsjzzZdn8dWowZQJxYF
	nufMOApHwAs0/ur/ftsekVSMtAHDlOFj8xNPr5NWiefZOkMeWATgHAbSZSORrsZl5y1rnttnU8/FD
	LeAXZgwXa0t3rPd+7MeMzss9BiJGYtWxKHprDupVh92JI5r50gThkdUKI7aNrSQS6mcMiJ/wzUYgh
	kolhPC9PoPfrAHQUCUhCnD/k3v5EzkK8EcF6WqStyO4hq7/Bq/Lawxr1uOnv4rv2cX0UQja6Xx4A/
	HgauaGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsIY-0000000GeYB-26Ol;
	Mon, 02 Nov 2026 13:42:06 +0000
Received: from [113.46.200.222] (helo=canpmsgout07.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsIU-0000000GeUk-36WZ
	for linux-mtd@lists.infradead.org;
	Mon, 02 Nov 2026 13:42:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=fNLxPmfF5iOP6VBGiv9ly7jRrpfCi96AxdL2bHwH7mI=;
	b=TwyyYEyOEN3aUj1kjI1mjCxe1ezOva1vhveshpKccqj8miwYXnmodIuQTuN+RX4WAJFSOm2xW
	PTJ16NBPd1V0cMYeIdBYkXYmNVx8JM3aoZ//UKCZDufgBnRWY4lrjfpgw9C/fH0OVfVllWBikbP
	hHOsJs1hE2S95pH0wjHQd+w=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jJCXw00MvzLlTq;
	Mon,  2 Nov 2026 21:41:35 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id AACF440572;
	Mon,  2 Nov 2026 21:41:45 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 2 Nov 2026 21:41:44 +0800
Subject: Re: [PATCH 3/3] ubifs: check node hash calculation errors
To: <shao.mingyin@zte.com.cn>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <202611022014201140sh13oFtWkIgBr7UQKyMK@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2bf579ac-cc55-b88a-3ce5-9214d8434909@huawei.com>
Date: Mon, 2 Nov 2026 21:41:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <202611022014201140sh13oFtWkIgBr7UQKyMK@zte.com.cn>
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_054203_413764_92612348 
X-CRM114-Status: GOOD (  15.65  )
X-Spam-Score: -3.0 (---)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYvMTEvMiAyMDoxNCwgc2hhby5taW5neWluQHp0ZS5jb20uY24g5YaZ6YGTOgo+IHVi
aWZzX25vZGVfY2FsY19oYXNoKCkgY2FuIGZhaWwgd2hlbiBhdXRoZW50aWNhdGlvbiBpcyBlbmFi
bGVkIGFuZCB0aGUKPiBjcnlwdG8gb3BlcmF0aW9uIGZhaWxzLiAgRml2ZSBjYWxscyBpZ25vcmUg
dGhlIHJldHVybiB2YWx1ZSBhbmQgdXNlIHRoZQo+IHVuaW5pdGlhbGl6ZWQgc3RhY2sgYnVmZmVy
IGFzIHRoZSBub2RlIGhhc2g6IHJlcGxheV9idWQoKSBzdG9yZXMgaXQgaW4KPiB0aGUgcmVwbGF5
IGVudHJ5LCBtYWtlX2lkeF9ub2RlKCkgYW5kIHdyaXRlX2luZGV4KCkgY29weSBpdCBpbnRvIHRo
ZQo+IHBhcmVudCBicmFuY2ggb3IgdGhlIGluZGV4IHJvb3QsIGFuZCBjcmVhdGVfZGVmYXVsdF9m
aWxlc3lzdGVtKCkgY29waWVzCj4gaXQgaW50byBhbiBpbmRleCBicmFuY2ggYW5kIGludG8gdGhl
IG1hc3RlciBub2RlLiAgVmVyaWZ5aW5nIHRob3NlIG5vZGVzCj4gbGF0ZXIgdGhlbiBmYWlscyB3
aXRoIGEgaGFzaCBtaXNtYXRjaC4KPiAKPiBQcm9wYWdhdGUgdGhlIGVycm9yIGZyb20gYWxsIGZp
dmUgY2FsbCBzaXRlcy4KPiAKPiBGaXhlczogMTZhMjZiMjBkMmFmICgidWJpZnM6IGF1dGhlbnRp
Y2F0aW9uOiBBZGQgaGFzaGVzIHRvIGluZGV4IG5vZGVzIikKPiBGaXhlczogMTA0MTE1YTNlYjU0
ICgidWJpZnM6IEFkZCBoYXNoZXMgYW5kIEhNQUNzIHRvIGRlZmF1bHQgZmlsZXN5c3RlbSIpCj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBTaGFvIE1pbmd5aW4g
PHNoYW8ubWluZ3lpbkB6dGUuY29tLmNuPgpSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVu
Z3poaWhhbzFAaHVhd2VpLmNvbT4KPiAtLS0KPiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvcmVwbGF5
LmMgYi9mcy91Ymlmcy9yZXBsYXkuYwo+IGluZGV4IDI2MzA0NWUwNWNmMS4uNDQyNDkzZGMxOGM2
IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL3JlcGxheS5jCj4gKysrIGIvZnMvdWJpZnMvcmVwbGF5
LmMKPiBAQCAtNzMwLDcgKzczMCw5IEBAIHN0YXRpYyBpbnQgcmVwbGF5X2J1ZChzdHJ1Y3QgdWJp
ZnNfaW5mbyAqYywgc3RydWN0IGJ1ZF9lbnRyeSAqYikKPiAgIAkJCWdvdG8gb3V0X2R1bXA7Cj4g
ICAJCX0KPiAKPiAtCQl1Ymlmc19ub2RlX2NhbGNfaGFzaChjLCBzbm9kLT5ub2RlLCBoYXNoKTsK
PiArCQllcnIgPSB1Ymlmc19ub2RlX2NhbGNfaGFzaChjLCBzbm9kLT5ub2RlLCBoYXNoKTsKPiAr
CQlpZiAoZXJyKQo+ICsJCQlnb3RvIG91dDsKPiAKPiAgIAkJaWYgKHNub2QtPnNxbnVtID4gYy0+
bWF4X3NxbnVtKQo+ICAgCQkJYy0+bWF4X3NxbnVtID0gc25vZC0+c3FudW07Cj4gZGlmZiAtLWdp
dCBhL2ZzL3ViaWZzL3NiLmMgYi9mcy91Ymlmcy9zYi5jCj4gaW5kZXggZTc2OTNiOTRlNWI1Li4x
YzE3NmJlMjYxZTAgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvc2IuYwo+ICsrKyBiL2ZzL3ViaWZz
L3NiLmMKPiBAQCAtMzI5LDE0ICszMjksMTggQEAgc3RhdGljIGludCBjcmVhdGVfZGVmYXVsdF9m
aWxlc3lzdGVtKHN0cnVjdCB1Ymlmc19pbmZvICpjKQo+ICAgCWlmIChlcnIpCj4gICAJCWdvdG8g
b3V0Owo+IAo+IC0JdWJpZnNfbm9kZV9jYWxjX2hhc2goYywgaW5vLCBoYXNoKTsKPiArCWVyciA9
IHViaWZzX25vZGVfY2FsY19oYXNoKGMsIGlubywgaGFzaCk7Cj4gKwlpZiAoZXJyKQo+ICsJCWdv
dG8gb3V0Owo+ICAgCXViaWZzX2NvcHlfaGFzaChjLCBoYXNoLCB1Ymlmc19icmFuY2hfaGFzaChj
LCBicikpOwo+IAo+ICAgCWVyciA9IHViaWZzX3dyaXRlX25vZGUoYywgaWR4LCBpZHhfbm9kZV9z
aXplLCBtYWluX2ZpcnN0ICsgREVGQVVMVF9JRFhfTEVCLCAwKTsKPiAgIAlpZiAoZXJyKQo+ICAg
CQlnb3RvIG91dDsKPiAKPiAtCXViaWZzX25vZGVfY2FsY19oYXNoKGMsIGlkeCwgaGFzaCk7Cj4g
KwllcnIgPSB1Ymlmc19ub2RlX2NhbGNfaGFzaChjLCBpZHgsIGhhc2gpOwo+ICsJaWYgKGVycikK
PiArCQlnb3RvIG91dDsKPiAgIAl1Ymlmc19jb3B5X2hhc2goYywgaGFzaCwgbXN0LT5oYXNoX3Jv
b3RfaWR4KTsKPiAKPiAgIAllcnIgPSB1Ymlmc193cml0ZV9ub2RlX2htYWMoYywgbXN0LCBVQklG
U19NU1RfTk9ERV9TWiwgVUJJRlNfTVNUX0xOVU0sIDAsCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZz
L3RuY19jb21taXQuYyBiL2ZzL3ViaWZzL3RuY19jb21taXQuYwo+IGluZGV4IDdiZjI2NzIwNjJh
Mi4uMWE2MjczOWMzNzMxIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL3RuY19jb21taXQuYwo+ICsr
KyBiL2ZzL3ViaWZzL3RuY19jb21taXQuYwo+IEBAIC01Miw3ICs1Miw5IEBAIHN0YXRpYyBpbnQg
bWFrZV9pZHhfbm9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0IHViaWZzX2lkeF9ub2Rl
ICppZHgsCj4gICAJCX0KPiAgIAl9Cj4gICAJdWJpZnNfcHJlcGFyZV9ub2RlKGMsIGlkeCwgbGVu
LCAwKTsKPiAtCXViaWZzX25vZGVfY2FsY19oYXNoKGMsIGlkeCwgaGFzaCk7Cj4gKwllcnIgPSB1
Ymlmc19ub2RlX2NhbGNfaGFzaChjLCBpZHgsIGhhc2gpOwo+ICsJaWYgKGVycikKPiArCQlyZXR1
cm4gZXJyOwo+IAo+ICAgCXpub2RlLT5sbnVtID0gbG51bTsKPiAgIAl6bm9kZS0+b2ZmcyA9IG9m
ZnM7Cj4gQEAgLTg4Nyw3ICs4ODksOSBAQCBzdGF0aWMgaW50IHdyaXRlX2luZGV4KHN0cnVjdCB1
Ymlmc19pbmZvICpjKQo+ICAgCQl9Cj4gICAJCWxlbiA9IHViaWZzX2lkeF9ub2RlX3N6KGMsIHpu
b2RlLT5jaGlsZF9jbnQpOwo+ICAgCQl1Ymlmc19wcmVwYXJlX25vZGUoYywgaWR4LCBsZW4sIDAp
Owo+IC0JCXViaWZzX25vZGVfY2FsY19oYXNoKGMsIGlkeCwgaGFzaCk7Cj4gKwkJZXJyID0gdWJp
ZnNfbm9kZV9jYWxjX2hhc2goYywgaWR4LCBoYXNoKTsKPiArCQlpZiAoZXJyKQo+ICsJCQlyZXR1
cm4gZXJyOwo+IAo+ICAgCQltdXRleF9sb2NrKCZjLT50bmNfbXV0ZXgpOwo+IC4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
