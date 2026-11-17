Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF2606A334
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=liHg+YrE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pCOLkIuHtso8wR6pgq/4MKN77UYyole66DLTZVRpAIg=; b=liHg+YrEpPtxv4mcYwYrSNH2bO
	B2Fw7wP4KWurb5jQlLSomaEG8W1CfBvUQcPbOUXbAylSeYWrBSuO59uAJam8x4JnvGRGaGrD589XV
	7mlj0J6/QXAEonnLhhiA3zb2F67xvUZdj0ULD+hh6qa+F7A/YqbHxqg2MRX8cBduszXi5HWhIWden
	iXOr1E0r1Eca+wcKKkZ/ahdKsQRcBfmdy1GpdAqbdox8Vv44Sy92cleBl4nZpW6br2dhkHmip51IQ
	febk3DhRtsj1J77fxl7BlN0WRoSPLAVURxdFy3pHMHxrpXliCSW3SAzeO0eeiIQOnp5p2+FY12RL8
	k8G3AMuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK4h-000000066H6-1XQM;
	Tue, 17 Nov 2026 14:22:19 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK4e-000000066F2-3yFs
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 14:22:18 +0000
Message-ID: <80f1ef9dd605d16df2add0a9dbdcdd5f9f508174.camel@crapouillou.net>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: ingenic: validate BCH error index
 in jz4780_correct()
From: Paul Cercueil <paul@crapouillou.net>
To: Guanglei Zhu <zhugl3@xiaopeng.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>,  Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, 	linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, 	linux-kernel@vger.kernel.org, Weibin Liu
 <liuwb@xiaopeng.com>
Date: Tue, 17 Nov 2026 15:22:10 +0100
In-Reply-To: <20261105042405.71352-2-zhugl3@xiaopeng.com>
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
	 <20261105042405.71352-1-zhugl3@xiaopeng.com>
	 <20261105042405.71352-2-zhugl3@xiaopeng.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062217_154699_54F3299B 
X-CRM114-Status: GOOD (  20.03  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgWmh1LAoKTGUgamV1ZGkgMDUgbm92ZW1icmUgMjAyNiDDoCAxMjoyNCArMDgwMCwgR3Vhbmds
ZWkgWmh1IGEgw6ljcml0wqA6Cj4gRnJvbTogV2VpYmluIExpdSA8bGl1d2JAeGlhb3BlbmcuY29t
Pgo+IAo+IFRoZSBKWjQ3ODAgQkNIIGNvbnRyb2xsZXIgcmVwb3J0cyBlYWNoIGNvcnJlY3RlZCBi
aXQgZXJyb3IgYXMgYSBieXRlCj4gcGFpciBpbmRleCwgaW4gdGhlIElOREVYIGZpZWxkIG9mIHRo
ZSBCQ0hfQkhFUlIgcmVnaXN0ZXJzLiBUaGUgZmllbGQKPiBpcyAxMSBiaXRzIHdpZGUsIGJ1dCBu
b3RoaW5nIGluIGp6NDc4MF9jb3JyZWN0KCkgY2hlY2tzIHRoZSByZXBvcnRlZAo+IGluZGV4IGFn
YWluc3QgdGhlIHNpemUgb2YgdGhlIGRhdGEgYnVmZmVyIGJlaW5nIGNvcnJlY3RlZDoKPiAKPiDC
oMKgwqAgYnVmWyhpbmRleCAqIDIpICsgMF0gXj0gbWFzazsKPiDCoMKgwqAgYnVmWyhpbmRleCAq
IDIpICsgMV0gXj0gbWFzayA+PiA4Owo+IAo+IFdpdGggZGF0YSBvciBFQ0MgY29taW5nIGZyb20g
YW4gdW50cnVzdGVkIGZsYXNoLCB0aGUgZGVjb2RlciBjYW4KPiByZXBvcnQgYW4gaW5kZXggdGhh
dCBwb2ludHMgcGFzdCB0aGUgZW5kIG9mIHRoZSBkYXRhIGJ1ZmZlciwgYW5kIHRoZQo+IGFib3Zl
IHN0YXRlbWVudHMgdGhlbiBmbGlwIGJpdHMgb3V0c2lkZSB0aGUgYnVmZmVyLgo+IAo+IFNraXAg
dGhlIGNvcnJlY3Rpb24gd2hlbiB0aGUgcmVwb3J0ZWQgaW5kZXggZG9lcyBub3QgcG9pbnQgaW50
bwo+IHRoZSBkYXRhIGFyZWEuwqAgQSBiaXRmbGlwIGluIHRoZSBwYXJpdHkgYnl0ZXMgZG9lcyBu
b3QgYWZmZWN0IHRoZQo+IGRhdGEsIHNvIHJlamVjdGluZyB0aGUgcGFnZSBmb3IgaXQgd291bGQg
ZmFpbCByZWFkcyB0aGF0IGFyZQo+IHBlcmZlY3RseSBjb3JyZWN0YWJsZSwgYW5kIGFuIGluZGV4
IGJleW9uZCB0aGUgY29kZXdvcmQgaGFzIG5vCj4gYnVmZmVyIHRvIHVwZGF0ZSBpbiB0aGUgZmly
c3QgcGxhY2UuCj4gCj4gRml4ZXM6IGFlMDJhYjAwYWEzYyAoIm10ZDogbmFuZDogano0NzgwOiBk
cml2ZXIgZm9yIE5BTkQgZGV2aWNlcyBvbiBKWjQ3ODAKPiBTb0NzIikKPiBTaWduZWQtb2ZmLWJ5
OiBXZWliaW4gTGl1IDxsaXV3YkB4aWFvcGVuZy5jb20+CgpTaW5jZSB5b3UgaGF2ZSBhIEZpeGVz
OiB0YWcsIHlvdSBhbHNvIG5lZWQgdG8gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKCllvdSBh
bHNvIG5lZWQgdG8gYWRkIHlvdXIgb3duIFNpZ25lZC1vZmYtYnkgYWxvbmdzaWRlIExpdSdzLCBz
aW5jZSB5b3Ugc2VudCB0aGUKcGF0Y2guCgpUaGUgY2hhbmdlIGxvb2tzIGdvb2QgdG8gbWUsIHNv
IHlvdSBjYW4gYWRkIG15OgpSZXZpZXdlZC1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3Vp
bGxvdS5uZXQ+CgpQbGVhc2Ugc2VuZCBhIHYzIHdpdGggdGhlIENjOiBsaW5lLCB5b3VyIG93biBT
aWduZWQtb2ZmLWJ5LCBhbmQgbXkgUmV2aWV3ZWQtYnkuCgpDaGVlcnMsCi1QYXVsCgo+IC0tLQo+
IENoYW5nZXMgaW4gdjI6IHNraXAgdGhlIGNvcnJlY3Rpb24gZm9yIGFuIGluZGV4IHRoYXQgZG9l
cyBub3QgcG9pbnQKPiBpbnRvIHRoZSBkYXRhIGFyZWEgaW5zdGVhZCBvZiBmYWlsaW5nIHRoZSBw
YWdlIHdpdGggLUVCQURNU0cuwqAgQQo+IGNvcnJlY3RhYmxlIGJpdGZsaXAgaW4gdGhlIEVDQyBi
eXRlcyBsZWF2ZXMgdGhlIGRhdGEgdmFsaWQsIGFuZCB0aGUKPiBlYXJseSBleGl0IGFsc28gZHJv
cHBlZCB0aGUgZXJyb3IgZW50cmllcyB0aGF0IGZvbGxvd2VkIGl0LsKgIFRoaXMKPiBtYXRjaGVz
IGhvdyBqejQ3NDBfZWNjX2NvcnJlY3QoKSB0cmVhdHMgaXRzIGluZGV4ZXMuCj4gCj4gVmVyaWZp
ZWQgd2l0aCBhIHVzZXJzcGFjZSByZXBsaWNhIG9mIHRoZSBjb3JyZWN0aW9uIGxvb3A6IHdpdGgK
PiBwYXJhbXMtPnNpemUgPSA1MTIsIGFuIGluZGV4IG9mIDI1NiAoZmlyc3QgcGFyaXR5IHdvcmQp
IG9yIGF0IHRoZQo+IGZpZWxkIG1heGltdW0gKDB4N2ZmKSBwcm9kdWNlcyBubyB3cml0ZSBvdXRz
aWRlIHRoZSBkYXRhIGJ1ZmZlciwKPiBhbmQgaW4tcmFuZ2UgaW5kZXhlcyBrZWVwIGNvcnJlY3Rp
bmcgYXMgYmVmb3JlLgo+IAo+IMKgZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9qejQ3ODBf
YmNoLmMgfCA0ICsrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9qejQ3ODBfYmNoLmMKPiBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzgwX2JjaC5jCj4gaW5kZXggMTJiNWIw
NDg0ZmU5Li4zYTRjNWQ2ZTdmOGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
aW5nZW5pYy9qejQ3ODBfYmNoLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmlj
L2p6NDc4MF9iY2guYwo+IEBAIC0yMTYsNiArMjE2LDEwIEBAIHN0YXRpYyBpbnQgano0NzgwX2Nv
cnJlY3Qoc3RydWN0IGluZ2VuaWNfZWNjICpiY2gsCj4gwqAJCQkJCQlCQ0hfQkhFUlJfTUFTS19T
SElGVDsKPiDCoAkJCWluZGV4ID0gKHJlZyAmIEJDSF9CSEVSUl9JTkRFWF9NQVNLKSA+Pgo+IMKg
CQkJCQkJQkNIX0JIRVJSX0lOREVYX1NISUZUOwo+ICsJCQkvKiBTa2lwIGluZGV4ZXMgb3V0c2lk
ZSB0aGUgZGF0YSBhcmVhLiAqLwo+ICsJCQlpZiAoKGluZGV4ICogMikgKyAxID49IHBhcmFtcy0+
c2l6ZSkKPiArCQkJCWNvbnRpbnVlOwo+ICsKPiDCoAkJCWJ1ZlsoaW5kZXggKiAyKSArIDBdIF49
IG1hc2s7Cj4gwqAJCQlidWZbKGluZGV4ICogMikgKyAxXSBePSBtYXNrID4+IDg7Cj4gwqAJCX0K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
