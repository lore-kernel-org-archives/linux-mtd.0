Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E70606A325
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hCBCoLbm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+PT+B7AONRxMr7KhoZ0k+HGkRAIZt5huaVALKq5RZFk=; b=hCBCoLbmvEgQHwxve/qOicHJkN
	TrEJKBTzHbgwH3EODnxjxiIxCH3pyOHcbvfrSu1d+5En0zZfWWc4ID9W0jufbqZLEXjRxAOv9mfT/
	9LFOyTBeIRzr7bH9wrHPR180o3hGj9r8WdFS3cpLmhUws2s5lGeFH19vuCz1VmcwMteEE4yUSVzKr
	scPwNriK8S0yt02MBbklLLnPNl8J1D7f4zFFqwwyVnsNu/NmVhF6p5cCuLOJuUFCnZnO62GVNSf7C
	KwURzZcDdVTgr0/paVWPImdFhSx2UuY1NnK2cBB3pXZpCURXBPx0tYWMe/52dLRSizPDwsNwtr1EC
	lc2r6iiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbPl-00000008Emm-44hl;
	Wed, 18 Nov 2026 08:53:13 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbPi-00000008Eln-3sN3
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 08:53:12 +0000
Message-ID: <b6aaeb0077bb0238c74aed16adfd212fb2fcb0a4.camel@crapouillou.net>
Subject: Re: [PATCH v3 1/2] mtd: rawnand: ingenic: validate BCH error index
 in jz4725b_correct()
From: Paul Cercueil <paul@crapouillou.net>
To: Guanglei Zhu <zhugl3@xiaopeng.com>, harveyhuntnexus@gmail.com, 
	miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mips@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 liuwb@xiaopeng.com, 	stable@vger.kernel.org
Date: Wed, 18 Nov 2026 09:53:03 +0100
In-Reply-To: <20261118020751.1833498-1-zhugl3@xiaopeng.com>
References: <80f1ef9dd605d16df2add0a9dbdcdd5f9f508174.camel@crapouillou.net>
	 <20261118020751.1833498-1-zhugl3@xiaopeng.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005311_132394_09717364 
X-CRM114-Status: GOOD (  21.82  )
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

SGkgWmh1LAoKTGUgbWVyY3JlZGkgMTggbm92ZW1icmUgMjAyNiDDoCAxMDowNyArMDgwMCwgR3Vh
bmdsZWkgWmh1IGEgw6ljcml0wqA6Cj4gRnJvbTogV2VpYmluIExpdSA8bGl1d2JAeGlhb3Blbmcu
Y29tPgo+IAo+IFRoZSBKWjQ3MjVCIEJDSCBjb250cm9sbGVyIHJlcG9ydHMgZWFjaCBjb3JyZWN0
ZWQgYml0IGVycm9yIGFzIGFuCj4gaW5kZXggaW50byB0aGUgY29kZXdvcmQgaXQgd2FzIGFza2Vk
IHRvIGRlY29kZSwgaW4gdGhlIElOREVYMC9JTkRFWDEKPiBmaWVsZHMgb2YgdGhlIEJDSF9CSEVS
UiByZWdpc3RlcnMuIFRoZXNlIGZpZWxkcyBhcmUgMTMgYml0cyB3aWRlLCBidXQKPiBub3RoaW5n
IGluIGp6NDcyNWJfY29ycmVjdCgpIGNoZWNrcyB0aGUgcmVwb3J0ZWQgaW5kZXggYWdhaW5zdCB0
aGUKPiBzaXplIG9mIHRoZSBkYXRhIGJ1ZmZlciBiZWluZyBjb3JyZWN0ZWQ6Cj4gCj4gwqDCoMKg
IGJ1ZlsoYml0ID4+IDMpXSBePSBCSVQoYml0ICYgMHg3KTsKPiAKPiBXaXRoIGRhdGEgb3IgRUND
IGNvbWluZyBmcm9tIGFuIHVudHJ1c3RlZCBmbGFzaCwgdGhlIGRlY29kZXIgY2FuCj4gcmVwb3J0
IGFuIGluZGV4IHRoYXQgcG9pbnRzIHBhc3QgdGhlIGVuZCBvZiB0aGUgZGF0YSBidWZmZXIsIGFu
ZCB0aGUKPiBhYm92ZSBzdGF0ZW1lbnQgdGhlbiBmbGlwcyBhIGJpdCBvdXRzaWRlIHRoZSBidWZm
ZXIuCj4gCj4gU2tpcCB0aGUgY29ycmVjdGlvbiB3aGVuIHRoZSByZXBvcnRlZCBpbmRleCBkb2Vz
IG5vdCBwb2ludCBpbnRvCj4gdGhlIGRhdGEgYXJlYS7CoCBBIGJpdGZsaXAgaW4gdGhlIHBhcml0
eSBieXRlcyBkb2VzIG5vdCBhZmZlY3QgdGhlCj4gZGF0YSwgc28gcmVqZWN0aW5nIHRoZSBwYWdl
IGZvciBpdCB3b3VsZCBmYWlsIHJlYWRzIHRoYXQgYXJlCj4gcGVyZmVjdGx5IGNvcnJlY3RhYmxl
LCBhbmQgYW4gaW5kZXggYmV5b25kIHRoZSBjb2Rld29yZCBoYXMgbm8KPiBidWZmZXIgdG8gdXBk
YXRlIGluIHRoZSBmaXJzdCBwbGFjZS4KPiAKPiBGaXhlczogM2U2YWMyYWQ5MGIzICgibXRkOiBy
YXduYW5kOiBpbmdlbmljOiBBZGQgc3VwcG9ydCBmb3IgdGhlIEpaNDcyNUIiKQo+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogV2VpYmluIExpdSA8bGl1d2JAeGlh
b3BlbmcuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEd1YW5nbGVpIFpodSA8emh1Z2wzQHhpYW9wZW5n
LmNvbT4KClJldmlld2VkLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4K
CkNoZWVycywKLVBhdWwKCj4gLS0tCj4gdjM6IGFkZCBDYzogc3RhYmxlIGFuZCBteSBTaWduZWQt
b2ZmLWJ5IGFzIHRoZSBzZW5kZXIsIG1hdGNoaW5nCj4gwqDCoMKgIHRoZSByZXZpZXcgY29tbWVu
dHMgb24gMi8yLgo+IAo+IENoYW5nZXMgaW4gdjI6IHNraXAgdGhlIGNvcnJlY3Rpb24gZm9yIGFu
IGluZGV4IHRoYXQgZG9lcyBub3QgcG9pbnQKPiBpbnRvIHRoZSBkYXRhIGFyZWEgaW5zdGVhZCBv
ZiBmYWlsaW5nIHRoZSBwYWdlIHdpdGggLUVCQURNU0cuwqAgQQo+IGNvcnJlY3RhYmxlIGJpdGZs
aXAgaW4gdGhlIEVDQyBieXRlcyBsZWF2ZXMgdGhlIGRhdGEgdmFsaWQsIGFuZCB0aGUKPiBlYXJs
eSBleGl0IGFsc28gZHJvcHBlZCB0aGUgZXJyb3IgZW50cmllcyB0aGF0IGZvbGxvd2VkIGl0LsKg
IFRoaXMKPiBtYXRjaGVzIGhvdyBqejQ3NDBfZWNjX2NvcnJlY3QoKSB0cmVhdHMgaXRzIGluZGV4
ZXMuCj4gCj4gVmVyaWZpZWQgd2l0aCBhIHVzZXJzcGFjZSByZXBsaWNhIG9mIHRoZSBjb3JyZWN0
aW9uIGxvb3A6IHdpdGgKPiBwYXJhbXMtPnNpemUgPSA1MTIsIGFuIGluZGV4IG9mIDQwOTkgKHBh
cml0eSBhcmVhKSBmb2xsb3dlZCBieSBhCj4gZGF0YS1hcmVhIGluZGV4IG9mIDEwMCBpbiB0aGUg
c2FtZSBCSEVSUiByZWdpc3RlciBpcyBub3cgY29ycmVjdGVkCj4gKHYxIHJldHVybmVkIC1FQkFE
TVNHIGFuZCBsZWZ0IHRoZSBkYXRhIGVycm9yIHVuZml4ZWQpLCB0aGUgZmllbGQKPiBtYXhpbXVt
ICgweDFmZmYpIHByb2R1Y2VzIG5vIHdyaXRlIG91dHNpZGUgdGhlIGJ1ZmZlciwgYW5kIGluLXJh
bmdlCj4gaW5kZXhlcyBrZWVwIGNvcnJlY3RpbmcgYXMgYmVmb3JlLgo+IAo+IMKgZHJpdmVycy9t
dGQvbmFuZC9yYXcvaW5nZW5pYy9qejQ3MjViX2JjaC5jIHwgNCArKysrCj4gwqAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2luZ2VuaWMvano0NzI1Yl9iY2guYwo+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5p
Yy9qejQ3MjViX2JjaC5jCj4gaW5kZXggMmQwZTBhMjE5MmFlLi45YjFjM2Q0ZTVmNmEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9qejQ3MjViX2JjaC5jCj4gKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9qejQ3MjViX2JjaC5jCj4gQEAgLTI1OSw2
ICsyNTksMTAgQEAgc3RhdGljIGludCBqejQ3MjViX2NvcnJlY3Qoc3RydWN0IGluZ2VuaWNfZWNj
ICpiY2gsCj4gwqAJCQliaXQgPSAocmVnICYgQkNIX0JIRVJSX0lOREVYMF9NQVNLKSA+Pgo+IEJD
SF9CSEVSUl9JTkRFWDBfU0hJRlQ7Cj4gwqAJCX0KPiDCoAo+ICsJCS8qIFNraXAgaW5kZXhlcyBv
dXRzaWRlIHRoZSBkYXRhIGFyZWEuICovCj4gKwkJaWYgKGJpdCA+PSBwYXJhbXMtPnNpemUgKiA4
KQo+ICsJCQljb250aW51ZTsKPiArCj4gwqAJCWJ1ZlsoYml0ID4+IDMpXSBePSBCSVQoYml0ICYg
MHg3KTsKPiDCoAl9Cj4gwqAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
