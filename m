Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91205606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2026 03:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PGsDX0F9;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=jS7UAufb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NxNKDWU2ygzAAkPPh37Ubdb0uXkv0hUAGzNtYv5hzq8=; b=PGsDX0F95GnrDzLFWvMKZmpP51
	WF4FnqM18lDSDRHgwQj7zRT7NsqspRijGTOO/Rfe/yXNDwxpl8lzTwKgghUMsjVSyz/8bZzcEeu+S
	QE3J1GCtBDvg2zbYV1sshiv5BLRUGClwho8Xh5xH9yUN58NRwprzHKUFvsp17HAXi9dDyxSqVERng
	2Q69dUf4dqo4euF5GITz1lnaZ4Csap+mvPJwD3Fu/d6yBomJuvTf650rocGy9VK5MckTCxAf7MI2T
	PPjoQDNG6wsnm9ZU/DID+l+jIbiabru3630JTl6fuUSkaLAIjo43muMVbMXIu6gEeLD4glVFXs9d3
	KP1lDlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBP7-00000001f8X-0SeN;
	Mon, 26 Oct 2026 03:29:45 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBP3-00000001f7y-1S66
	for linux-mtd@lists.infradead.org;
	Mon, 26 Oct 2026 03:29:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BQLkrYzA5a4M0h6NQaNmaq/76j0SSO4S3rXXiIgtZNo=;
	b=jS7UAufbwFhPTiNNeYKJKiTccUpIAfad0NoMp6zvZ0BRIzdz21OWIAHEBRY+JlrSJuLSMLWLL
	roZ75JHwmRqfTui1RkQp3PlbhkLA7hrX69MZHoQs+rfF2pVTbBSzThlzl7U8GDZm9ZAgcDLlNSE
	wiF/fE6wx9oDlmly2KyKf84=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jCfHp5LWsz1ps8v;
	Mon, 26 Oct 2026 11:29:26 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 81CF14057D;
	Mon, 26 Oct 2026 11:29:33 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 26 Oct 2026 11:29:32 +0800
Subject: Re: [PATCH 1/2] ubi: fastmap: Check the PEB numbers in the fastmap
 lists
To: Alejandro Pacheco <ale@alepacheco.dev>, Richard Weinberger
	<richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <6083713b-4c4e-4e17-93c5-61f3bb7a77f1@alepacheco.dev>
 <67870349-f17c-44ef-8647-28a78da80624@alepacheco.dev>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <40267039-6718-2d92-d5d4-63fc9c54c674@huawei.com>
Date: Mon, 26 Oct 2026 11:29:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <67870349-f17c-44ef-8647-28a78da80624@alepacheco.dev>
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_202941_997496_90F482AF 
X-CRM114-Status: GOOD (  27.19  )
X-Spam-Score: -3.8 (---)
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

1NogMjAyNi8xMC8yNCAyMDo0MywgQWxlamFuZHJvIFBhY2hlY28g0LS1wDoKPiBGcm9tOiBBbGVq
YW5kcm8gUGFjaGVjbyA8YWxlQGFsZXBhY2hlY28uZGV2Pgo+IAo+IHViaV9hdHRhY2hfZmFzdG1h
cCgpIHJlYWRzIHRoZSBmcmVlLCB1c2VkLCBzY3J1YiBhbmQgZXJhc2UgbGlzdHMgb2YgdGhlCj4g
ZmFzdG1hcCBhbmQgYWRkcyBldmVyeSBQRUIgbnVtYmVyIGluIHRoZW0gdG8gdGhlIGF0dGFjaCBp
bmZvcm1hdGlvbiBhcwo+IGl0IGlzIG9uIHRoZSBtZWRpYS4gdWJpX3dsX2luaXQoKSBsYXRlciB1
c2VzIHRoZXNlIFBFQiBudW1iZXJzIGFzCj4gaW5kZXhlcyBpbnRvIHViaS0+bG9va3VwdGJsLCB3
aGljaCBoYXMgdWJpLT5wZWJfY291bnQgZW50cmllcywgYW5kIHRoZQo+IFBFQnMgb2YgdGhlIHVz
ZWQgYW5kIHNjcnViIGxpc3RzIGJlY29tZSB0aGUgUEVCcyBvZiB0aGUgdm9sdW1lcycgTEVCcy4K
PiBOb25lIG9mIHRoZW0gaXMgY2hlY2tlZCBhZ2FpbnN0IHRoZSBkZXZpY2UsIHNvIGEgZmFzdG1h
cCBsaXN0aW5nIGEgUEVCCj4gbnVtYmVyIHRoYXQgaXMgbmVnYXRpdmUgb3Igbm90IGJlbG93IHVi
aS0+cGViX2NvdW50IG1ha2VzIHViaV93bF9pbml0KCkKPiB3cml0ZSBvdXRzaWRlIHViaS0+bG9v
a3VwdGJsLgo+IAo+IFRoZSBQRUIgbnVtYmVycyBvZiB0aGUgdHdvIHBvb2xzIGFyZSBub3QgYWZm
ZWN0ZWQ6IHNjYW5fcG9vbCgpIHJlYWRzCj4gZXZlcnkgcG9vbCBQRUIgZnJvbSB0aGUgZmxhc2gg
YmVmb3JlIHVzaW5nIGl0LCBhbmQgdGhlIE1URCBsYXllciByZWZ1c2VzCj4gYW4gb2Zmc2V0IG91
dHNpZGUgdGhlIGRldmljZS4gQSBQRUIgbnVtYmVyIG9mIGFuIEVCQSB0YWJsZSBpcyBvbmx5Cj4g
YWNjZXB0ZWQgd2hlbiBpdCBpcyBmb3VuZCBpbiB0aGUgdXNlZCBsaXN0Lgo+IAo+IENoZWNrIGV2
ZXJ5IFBFQiBudW1iZXIgb2YgdGhlIGZvdXIgbGlzdHMgYWdhaW5zdCB1YmktPnBlYl9jb3VudCwg
bmV4dCB0bwo+IHRoZSBvdGhlciBzYW5pdHkgY2hlY2tzIG9mIHRoZSBmYXN0bWFwLCBhbmQgdHJl
YXQgYSBmYXN0bWFwIHdpdGggYSBiYWQKPiBvbmUgYXMgdW51c2FibGUsIHNvIHRoYXQgVUJJIGF0
dGFjaGVzIGJ5IHNjYW5uaW5nIGluc3RlYWQuIEZhc3RtYXBzCj4gd3JpdHRlbiBieSBVQkkgYXJl
IG5vdCBhZmZlY3RlZDogdWJpX3dyaXRlX2Zhc3RtYXAoKSBvbmx5IGxpc3RzIFBFQnMgb2YKPiB0
aGUgZGV2aWNlLgo+IAo+IFRoaXMgbmVlZHMgYSBjcmFmdGVkIGZhc3RtYXAgKGl0cyBkYXRhIENS
QyBjYXRjaGVzIHJhbmRvbSBjb3JydXB0aW9uKQo+IG9uIGEgZGV2aWNlIHRoYXQgVUJJIGF0dGFj
aGVzIGF0IGJvb3Qgb3IgdGhhdCBhIHVzZXIgd2l0aAo+IENBUF9TWVNfUkVTT1VSQ0UgYXR0YWNo
ZXMuCj4gCj4gQW4gTExNIGNvZGluZyBhc3Npc3RhbnQgd2FzIHVzZWQgdG8gZmluZCB0aGlzIGJ1
ZyBhbmQgdG8gd3JpdGUgdGhpcwo+IHBhdGNoIGFuZCBpdHMgY2hhbmdlbG9nLgo+IAo+IEZpeGVz
OiBkYmI3ZDJhODhkMmEgKCJVQkk6IEFkZCBmYXN0bWFwIGNvcmUiKQo+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogQWxlamFuZHJvIFBhY2hlY28gPGFsZUBhbGVw
YWNoZWNvLmRldj4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9mYXN0bWFwLmMgfCA0MCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAz
MCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKClJldmlld2VkLWJ5OiBaaGloYW8g
Q2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC91YmkvZmFzdG1hcC5jIGIvZHJpdmVycy9tdGQvdWJpL2Zhc3RtYXAuYwo+IGluZGV4IDNmOWZi
N2MxODFmLi40MWVhZDZiNGYwYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvZmFzdG1h
cC5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2Zhc3RtYXAuYwo+IEBAIC01NTgsNyArNTU4LDcg
QEAgc3RhdGljIGludCB1YmlfYXR0YWNoX2Zhc3RtYXAoc3RydWN0IHViaV9kZXZpY2UgKnViaSwK
PiAgIAlzdHJ1Y3QgdWJpX2ZtX2VjICpmbWVjOwo+ICAgCXN0cnVjdCB1YmlfZm1fdm9saGRyICpm
bXZoZHI7Cj4gICAJc3RydWN0IHViaV9mbV9lYmEgKmZtX2ViYTsKPiAtCWludCByZXQsIGksIGos
IHBvb2xfc2l6ZSwgd2xfcG9vbF9zaXplOwo+ICsJaW50IHJldCwgaSwgaiwgcG51bSwgcG9vbF9z
aXplLCB3bF9wb29sX3NpemU7Cj4gICAJc2l6ZV90IGZtX3BvcyA9IDAsIGZtX3NpemUgPSB1Ymkt
PmZtX3NpemU7Cj4gICAJdW5zaWduZWQgbG9uZyBsb25nIG1heF9zcW51bSA9IDA7Cj4gICAJdm9p
ZCAqZm1fcmF3ID0gdWJpLT5mbV9idWY7Cj4gQEAgLTY0MCw4ICs2NDAsMTMgQEAgc3RhdGljIGlu
dCB1YmlfYXR0YWNoX2Zhc3RtYXAoc3RydWN0IHViaV9kZXZpY2UgKnViaSwKPiAgIAkJaWYgKGZt
X3BvcyA+PSBmbV9zaXplKQo+ICAgCQkJZ290byBmYWlsX2JhZDsKPiAgIAo+IC0JCXJldCA9IGFk
ZF9hZWIoYWksICZhaS0+ZnJlZSwgYmUzMl90b19jcHUoZm1lYy0+cG51bSksCj4gLQkJCSAgICAg
IGJlMzJfdG9fY3B1KGZtZWMtPmVjKSwgMCk7Cj4gKwkJcG51bSA9IGJlMzJfdG9fY3B1KGZtZWMt
PnBudW0pOwo+ICsJCWlmIChwbnVtIDwgMCB8fCBwbnVtID49IHViaS0+cGViX2NvdW50KSB7Cj4g
KwkJCXViaV9lcnIodWJpLCAiYmFkIFBFQiAlaSBpbiBmYXN0bWFwIGZyZWUgbGlzdCIsIHBudW0p
Owo+ICsJCQlnb3RvIGZhaWxfYmFkOwo+ICsJCX0KPiArCj4gKwkJcmV0ID0gYWRkX2FlYihhaSwg
JmFpLT5mcmVlLCBwbnVtLCBiZTMyX3RvX2NwdShmbWVjLT5lYyksIDApOwo+ICAgCQlpZiAocmV0
KQo+ICAgCQkJZ290byBmYWlsOwo+ICAgCX0KPiBAQCAtNjUzLDggKzY1OCwxMyBAQCBzdGF0aWMg
aW50IHViaV9hdHRhY2hfZmFzdG1hcChzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLAo+ICAgCQlpZiAo
Zm1fcG9zID49IGZtX3NpemUpCj4gICAJCQlnb3RvIGZhaWxfYmFkOwo+ICAgCj4gLQkJcmV0ID0g
YWRkX2FlYihhaSwgJnVzZWQsIGJlMzJfdG9fY3B1KGZtZWMtPnBudW0pLAo+IC0JCQkgICAgICBi
ZTMyX3RvX2NwdShmbWVjLT5lYyksIDApOwo+ICsJCXBudW0gPSBiZTMyX3RvX2NwdShmbWVjLT5w
bnVtKTsKPiArCQlpZiAocG51bSA8IDAgfHwgcG51bSA+PSB1YmktPnBlYl9jb3VudCkgewo+ICsJ
CQl1YmlfZXJyKHViaSwgImJhZCBQRUIgJWkgaW4gZmFzdG1hcCB1c2VkIGxpc3QiLCBwbnVtKTsK
PiArCQkJZ290byBmYWlsX2JhZDsKPiArCQl9Cj4gKwo+ICsJCXJldCA9IGFkZF9hZWIoYWksICZ1
c2VkLCBwbnVtLCBiZTMyX3RvX2NwdShmbWVjLT5lYyksIDApOwo+ICAgCQlpZiAocmV0KQo+ICAg
CQkJZ290byBmYWlsOwo+ICAgCX0KPiBAQCAtNjY2LDggKzY3NiwxMyBAQCBzdGF0aWMgaW50IHVi
aV9hdHRhY2hfZmFzdG1hcChzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLAo+ICAgCQlpZiAoZm1fcG9z
ID49IGZtX3NpemUpCj4gICAJCQlnb3RvIGZhaWxfYmFkOwo+ICAgCj4gLQkJcmV0ID0gYWRkX2Fl
YihhaSwgJnVzZWQsIGJlMzJfdG9fY3B1KGZtZWMtPnBudW0pLAo+IC0JCQkgICAgICBiZTMyX3Rv
X2NwdShmbWVjLT5lYyksIDEpOwo+ICsJCXBudW0gPSBiZTMyX3RvX2NwdShmbWVjLT5wbnVtKTsK
PiArCQlpZiAocG51bSA8IDAgfHwgcG51bSA+PSB1YmktPnBlYl9jb3VudCkgewo+ICsJCQl1Ymlf
ZXJyKHViaSwgImJhZCBQRUIgJWkgaW4gZmFzdG1hcCBzY3J1YiBsaXN0IiwgcG51bSk7Cj4gKwkJ
CWdvdG8gZmFpbF9iYWQ7Cj4gKwkJfQo+ICsKPiArCQlyZXQgPSBhZGRfYWViKGFpLCAmdXNlZCwg
cG51bSwgYmUzMl90b19jcHUoZm1lYy0+ZWMpLCAxKTsKPiAgIAkJaWYgKHJldCkKPiAgIAkJCWdv
dG8gZmFpbDsKPiAgIAl9Cj4gQEAgLTY3OSw4ICs2OTQsMTMgQEAgc3RhdGljIGludCB1YmlfYXR0
YWNoX2Zhc3RtYXAoc3RydWN0IHViaV9kZXZpY2UgKnViaSwKPiAgIAkJaWYgKGZtX3BvcyA+PSBm
bV9zaXplKQo+ICAgCQkJZ290byBmYWlsX2JhZDsKPiAgIAo+IC0JCXJldCA9IGFkZF9hZWIoYWks
ICZhaS0+ZXJhc2UsIGJlMzJfdG9fY3B1KGZtZWMtPnBudW0pLAo+IC0JCQkgICAgICBiZTMyX3Rv
X2NwdShmbWVjLT5lYyksIDEpOwo+ICsJCXBudW0gPSBiZTMyX3RvX2NwdShmbWVjLT5wbnVtKTsK
PiArCQlpZiAocG51bSA8IDAgfHwgcG51bSA+PSB1YmktPnBlYl9jb3VudCkgewo+ICsJCQl1Ymlf
ZXJyKHViaSwgImJhZCBQRUIgJWkgaW4gZmFzdG1hcCBlcmFzZSBsaXN0IiwgcG51bSk7Cj4gKwkJ
CWdvdG8gZmFpbF9iYWQ7Cj4gKwkJfQo+ICsKPiArCQlyZXQgPSBhZGRfYWViKGFpLCAmYWktPmVy
YXNlLCBwbnVtLCBiZTMyX3RvX2NwdShmbWVjLT5lYyksIDEpOwo+ICAgCQlpZiAocmV0KQo+ICAg
CQkJZ290byBmYWlsOwo+ICAgCX0KPiBAQCAtNzMyLDcgKzc1Miw3IEBAIHN0YXRpYyBpbnQgdWJp
X2F0dGFjaF9mYXN0bWFwKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksCj4gICAJCX0KPiAgIAo+ICAg
CQlmb3IgKGogPSAwOyBqIDwgYmUzMl90b19jcHUoZm1fZWJhLT5yZXNlcnZlZF9wZWJzKTsgaisr
KSB7Cj4gLQkJCWludCBwbnVtID0gYmUzMl90b19jcHUoZm1fZWJhLT5wbnVtW2pdKTsKPiArCQkJ
cG51bSA9IGJlMzJfdG9fY3B1KGZtX2ViYS0+cG51bVtqXSk7Cj4gICAKPiAgIAkJCWlmIChwbnVt
IDwgMCkKPiAgIAkJCQljb250aW51ZTsKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8KPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
