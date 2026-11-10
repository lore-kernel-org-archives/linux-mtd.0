Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8B4606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4qYLWwZs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlmtqEUC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yJxbtyPbIMQXAKud2XFCJkjbSMf2hP/oN98ZK9krIhc=; b=4qYLWwZsRkk8XTT1Qxi82f7e//
	zx5Ah2rj018CPHI/ljH+j+GHb6gdJtalYKR3rlRvO7B4xmEHqioryeUWcBJHW9swJH49W+c46PMhe
	ZVIc2IsXKXTIdfcqOHPZQpo8hjE4gHmAiNEZtU4fbHvhU33Enq+fTyrxmajmQHvmokeqpIJaggT8X
	EFr1nHFNo48b3CKbhsNNQi8OhBfIVLPR1n/sYBlgvgox09BgfSWh0y38ZQmE5GYk/tpMEO45pz6Ho
	DQCdls9TSYO47+Qwr9qR0cb0U/Z7c1KHdma7nCELIsbAUdlu0ICpCZbzWwiekGI77g5FO5FhzKzRc
	1hMfp5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgy8-000000033wJ-0UMT;
	Tue, 10 Nov 2026 08:12:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgy6-000000033w5-2n9M
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 08:12:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 51DD96142B;
	Tue, 10 Nov 2026 08:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF031F0089F;
	Tue, 10 Nov 2026 08:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298357;
	bh=bTXEIJrXltZ6Al6XkL1OAv+336mzxu6CJtUlfsElLPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HlmtqEUCxzqkxDvtpgKh2ZTGYxIMku4RNOozJNrLUwic3iL1oU848KCOaGsNHKqQ9
	 XDuCZG29zwwiKkddXOsWkTd8PFc72dkKLyRgUxGgRxm1w9c/tzSa5dmGNfIv5Bvg5t
	 QWifeMMmsp4BJHxxwD0UiwaZOKDXuWxgcCwlC2wTuSTOigwST/wAMQWWb0+aI/ejdm
	 4nNXNLijluYitM0XcBuE+RUp446Zgjl3bPAuDSyB31VXWmc+EnKShoBG6r3d9bQB4s
	 XjNlH4ip/MhitYeQ8pNmiXts/63o+uR1PopoCsX90wAvqDUXEQmsUqA60VmsPdNka5
	 kqQsUTj1cEpRw==
Message-ID: <sashiko-outbox-206575@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/58] mtd: rawnand: tegra: retain open-handle state
 on removal
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, "Boris Brezillon" <bbrezillon@kernel.org>, "Lucas
 Stach" <dev@lynxeye.de>, "Dmitry Osipenko" <digetx@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, "Stefan Agner" <stefan@agner.ch>, "Thierry
 Reding" <thierry.reding@kernel.org>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-15-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
 <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-15-9137d08f05df@gmail.com>
Date: Tue, 10 Nov 2026 08:12:35 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiByYXduYW5kOiB0ZWdy
YTogY2xlYW51cCBoZWxwZXIgYW5kIGdvdG8gbWl4aW5nIGluCiAgdGVncmFfbmFuZF9jaGlwc19p
bml0KCkKLS0KCmNvbW1pdCAxZTY5YjY3ZTAwOGY3YjQyNDQ4OTQyM2U0ZDA3MmZiN2QzOGIzMDAw
CkF1dGhvcjogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgptdGQ6
IHJhd25hbmQ6IHRlZ3JhOiByZXRhaW4gb3Blbi1oYW5kbGUgc3RhdGUgb24gcmVtb3ZhbAoKVGhp
cyBjb21taXQgc3dpdGNoZXMgdGhlIFRlZ3JhIE5BTkQgY2hpcCBhbmQgY29udHJvbGxlciBhbGxv
Y2F0aW9ucyB0bwpyZWZlcmVuY2UtY291bnRlZCBsaWZldGltZSBtYW5hZ2VtZW50IHNvIHRoZXkg
YXJlIGZyZWVkIHdoZW4gdGhlIGZpbmFsIE1URApyZWZlcmVuY2VzIGFyZSByZWxlYXNlZCwgYW5k
IGNsZWFucyB1cCB0aGUgY2hpbGQgZGV2aWNlIG5vZGUgcmVmZXJlbmNlIGluCnRlZ3JhX25hbmRf
Y2hpcHNfaW5pdCgpLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvdGVncmFf
bmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdGVncmFfbmFuZC5jCj4gaW5kZXggMTEwNGQ3
NWI2Y2JlNi4uNTEzMGJlZTQ2ZDYwOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy90ZWdyYV9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy90ZWdyYV9uYW5kLmMK
PiBAQCAtMTA2NCwxMSArMTA2NCwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG5hbmRfY29udHJv
bGxlcl9vcHMgdGVncmFfbmFuZF9jb250cm9sbGVyX29wcyA9IHsKPiAgCS5zZXR1cF9pbnRlcmZh
Y2UgPSB0ZWdyYV9uYW5kX3NldHVwX2ludGVyZmFjZSwKPiAgfTsKPiAgCj4gK3N0YXRpYyB2b2lk
IHRlZ3JhX25hbmRfY2hpcF9yZWxlYXNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gK3sKPiAr
CWtmcmVlKGNvbnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3QgdGVncmFfbmFuZF9jaGlwLCBjaGlwKSk7
Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgdGVncmFfbmFuZF9jaGlwc19pbml0KHN0cnVjdCBkZXZp
Y2UgKmRldiwKPiAgCQkJCSBzdHJ1Y3QgdGVncmFfbmFuZF9jb250cm9sbGVyICpjdHJsKQo+ICB7
Cj4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOwo+IC0Jc3RydWN0IGRl
dmljZV9ub2RlICpucF9uYW5kOwo+ICsJc3RydWN0IGRldmljZV9ub2RlICpucF9uYW5kIF9fZnJl
ZShkZXZpY2Vfbm9kZSkgPSBOVUxMOwo+ICAJaW50IG5zZWxzLCBuY2hpcHMgPSBvZl9nZXRfY2hp
bGRfY291bnQobnApOwo+ICAJc3RydWN0IHRlZ3JhX25hbmRfY2hpcCAqbmFuZDsKPiAgCXN0cnVj
dCBtdGRfaW5mbyAqbXRkOwo+IEBAIC0xMDk2LDcgKzExMDEsNyBAQCBzdGF0aWMgaW50IHRlZ3Jh
X25hbmRfY2hpcHNfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAkJcmV0dXJuIHJldDsKPiAg
CX0KPiAgCj4gLQluYW5kID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpuYW5kKSwgR0ZQX0tF
Uk5FTCk7Cj4gKwluYW5kID0ga3phbGxvY19vYmooKm5hbmQpOwo+ICAJaWYgKCFuYW5kKQo+ICAJ
CXJldHVybiAtRU5PTUVNOwo+ICAKPiBAQCAtMTEwNyw3ICsxMTEyLDcgQEAgc3RhdGljIGludCB0
ZWdyYV9uYW5kX2NoaXBzX2luaXQoc3RydWN0IGRldmljZSAqZGV2LAo+ICAJaWYgKElTX0VSUihu
YW5kLT53cF9ncGlvKSkgewo+ICAJCXJldCA9IFBUUl9FUlIobmFuZC0+d3BfZ3Bpbyk7Cj4gIAkJ
ZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBXUCBHUElPOiAlZFxuIiwgcmV0KTsKPiAt
CQlyZXR1cm4gcmV0Owo+ICsJCWdvdG8gZnJlZV9jaGlwOwo+ICAJfQo+ICAKPiAgCWNoaXAgPSAm
bmFuZC0+Y2hpcDsKPiBAQCAtMTEyNywyMCArMTEzMiwzNSBAQCBzdGF0aWMgaW50IHRlZ3JhX25h
bmRfY2hpcHNfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gIAo+ICAJcmV0ID0gbmFuZF9zY2Fu
KGNoaXAsIDEpOwo+ICAJaWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+ICsJCWdvdG8gZnJlZV9j
aGlwOwo+ICAKPiAgCW10ZF9vb2JsYXlvdXRfZWNjKG10ZCwgMCwgJm5hbmQtPmVjYyk7Cj4gKwly
ZXQgPSBuYW5kX3NldF9yZWxlYXNlKGNoaXAsIHRlZ3JhX25hbmRfY2hpcF9yZWxlYXNlKTsKPiAr
CWlmIChyZXQpIHsKPiArCQluYW5kX2NsZWFudXAoY2hpcCk7Cj4gKwkJZ290byBmcmVlX2NoaXA7
Cj4gKwl9Cj4gIAo+ICAJcmV0ID0gbXRkX2RldmljZV9yZWdpc3RlcihtdGQsIE5VTEwsIDApOwo+
ICAJaWYgKHJldCkgewo+ICAJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIG10ZCBk
ZXZpY2U6ICVkXG4iLCByZXQpOwo+IC0JCW5hbmRfY2xlYW51cChjaGlwKTsKPiArCQluYW5kX2Rp
c2Nvbm5lY3QoY2hpcCk7Cj4gKwkJbXRkX3B1dF9tYXN0ZXIobXRkKTsKPiAgCQlyZXR1cm4gcmV0
Owo+ICAJfQo+ICAKPiAgCWN0cmwtPmNoaXAgPSBjaGlwOwo+ICAKPiAgCXJldHVybiAwOwo+ICsK
PiArZnJlZV9jaGlwOgo+ICsJa2ZyZWUobmFuZCk7Cj4gKwlyZXR1cm4gcmV0Owo+ICB9CgpbU2V2
ZXJpdHk6IExvd10KVGhpcyBpc24ndCBhIGJ1ZywgYnV0IHRlZ3JhX25hbmRfY2hpcHNfaW5pdCgp
IG1peGVzIF9fZnJlZShkZXZpY2Vfbm9kZSkgb24KbnBfbmFuZCB3aXRoIGEgbmV3IGdvdG8gZnJl
ZV9jaGlwIHVud2luZGluZyBwYXRoIGZvciBuYW5kLCByYXRoZXIgdGhhbgp1c2luZyBlaXRoZXIg
c2NvcGUtYmFzZWQgY2xlYW51cCBvciBnb3RvIHVud2luZGluZyBjb25zaXN0ZW50bHkgYWNyb3Nz
IHRoZQpmdW5jdGlvbi4gIEFsc28sIG5wX25hbmQgaXMgZGVjbGFyZWQgd2l0aCBfX2ZyZWUoZGV2
aWNlX25vZGUpID0gTlVMTCBhdAp0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbiBpbnN0ZWFkIG9mIGJl
aW5nIGRlZmluZWQgYW5kIGluaXRpYWxpemVkIGluIGEKc2luZ2xlIHN0YXRlbWVudCB3aGVyZSBv
Zl9nZXRfbmV4dF9jaGlsZCgpIGlzIGNhbGxlZC4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTAtc3VibWl0LXJhd25hbmQtcmV0
YWluZWQtaGFuZGxlLWxpZmV0aW1lLXYxLXYyLTAtOTEzN2QwOGYwNWRmQGdtYWlsLmNvbT9wYXJ0
PTE1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
