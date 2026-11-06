Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEC1606A32D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2026 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ca80WUSO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MxbJMTFTpmmf6sEBx38WuWBnOg7aHO8LfFCOMbl+5+o=; b=Ca80WUSOls/cpLZI82+5ropw5i
	8ieGTgKuH+YQPoswZ3CU+RhfFQ7mWL1VUom+fdMPrVajYZ5AIf+WxdUgS+kMksfqs453ALIPM+8bT
	hD7oNAUm+oq2DxYwALTSgrQTiBwc69cIntpAtIJc1BGaONIGx4ph4Z/ZmCICVSinRxpujkO3bTM20
	8SuM5uC/Qn4FLPbhr1npmfbTR2d6s7R6VUM3HKXyhohZeJjAR31xAMNFvRucEEggpD9u7KtXpezAy
	oX9hZJ+NuXocAWn+jAKcQKUlTMUR/fq6ukB5reRBRtDLj+2zfOdCLI3YmZerET5n6ZHUGSxO0LPFJ
	gdREDlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL4n-0000000ChOc-3Gw2;
	Fri, 06 Nov 2026 14:37:57 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL4l-0000000ChN3-2wEi
	for linux-mtd@lists.infradead.org;
	Fri, 06 Nov 2026 14:37:57 +0000
Message-ID: <91b7fc2fd16f1089449701c002dd33e191894871.camel@crapouillou.net>
Subject: Re: [PATCH v2 1/2] mtd: rawnand: ingenic: validate BCH error index
 in jz4725b_correct()
From: Paul Cercueil <paul@crapouillou.net>
To: Guanglei Zhu <zhugl3@xiaopeng.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>,  Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, 	linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, 	linux-kernel@vger.kernel.org, Weibin Liu
 <liuwb@xiaopeng.com>, Thomas Petazzoni	 <thomas.petazzoni@bootlin.com>
Date: Fri, 06 Nov 2026 15:37:47 +0100
In-Reply-To: <20261105042405.71352-1-zhugl3@xiaopeng.com>
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
	 <20261105042405.71352-1-zhugl3@xiaopeng.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_063755_908485_8BCA46B5 
X-CRM114-Status: GOOD (  16.37  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpMZSBqZXVkaSAwNSBub3ZlbWJyZSAyMDI2IMOgIDEyOjI0ICswODAwLCBHdWFuZ2xlaSBa
aHUgYSDDqWNyaXTCoDoKPiBGcm9tOiBXZWliaW4gTGl1IDxsaXV3YkB4aWFvcGVuZy5jb20+Cj4g
Cj4gVGhlIEpaNDcyNUIgQkNIIGNvbnRyb2xsZXIgcmVwb3J0cyBlYWNoIGNvcnJlY3RlZCBiaXQg
ZXJyb3IgYXMgYW4KPiBpbmRleCBpbnRvIHRoZSBjb2Rld29yZCBpdCB3YXMgYXNrZWQgdG8gZGVj
b2RlLCBpbiB0aGUgSU5ERVgwL0lOREVYMQo+IGZpZWxkcyBvZiB0aGUgQkNIX0JIRVJSIHJlZ2lz
dGVycy4gVGhlc2UgZmllbGRzIGFyZSAxMyBiaXRzIHdpZGUsIGJ1dAo+IG5vdGhpbmcgaW4gano0
NzI1Yl9jb3JyZWN0KCkgY2hlY2tzIHRoZSByZXBvcnRlZCBpbmRleCBhZ2FpbnN0IHRoZQo+IHNp
emUgb2YgdGhlIGRhdGEgYnVmZmVyIGJlaW5nIGNvcnJlY3RlZDoKPiAKPiDCoMKgwqAgYnVmWyhi
aXQgPj4gMyldIF49IEJJVChiaXQgJiAweDcpOwo+IAo+IFdpdGggZGF0YSBvciBFQ0MgY29taW5n
IGZyb20gYW4gdW50cnVzdGVkIGZsYXNoLCB0aGUgZGVjb2RlciBjYW4KPiByZXBvcnQgYW4gaW5k
ZXggdGhhdCBwb2ludHMgcGFzdCB0aGUgZW5kIG9mIHRoZSBkYXRhIGJ1ZmZlciwgYW5kIHRoZQo+
IGFib3ZlIHN0YXRlbWVudCB0aGVuIGZsaXBzIGEgYml0IG91dHNpZGUgdGhlIGJ1ZmZlci4KPiAK
PiBTa2lwIHRoZSBjb3JyZWN0aW9uIHdoZW4gdGhlIHJlcG9ydGVkIGluZGV4IGRvZXMgbm90IHBv
aW50IGludG8KPiB0aGUgZGF0YSBhcmVhLsKgIEEgYml0ZmxpcCBpbiB0aGUgcGFyaXR5IGJ5dGVz
IGRvZXMgbm90IGFmZmVjdCB0aGUKPiBkYXRhLCBzbyByZWplY3RpbmcgdGhlIHBhZ2UgZm9yIGl0
IHdvdWxkIGZhaWwgcmVhZHMgdGhhdCBhcmUKPiBwZXJmZWN0bHkgY29ycmVjdGFibGUsIGFuZCBh
biBpbmRleCBiZXlvbmQgdGhlIGNvZGV3b3JkIGhhcyBubwo+IGJ1ZmZlciB0byB1cGRhdGUgaW4g
dGhlIGZpcnN0IHBsYWNlLgo+IAo+IEZpeGVzOiAzZTZhYzJhZDkwYjMgKCJtdGQ6IHJhd25hbmQ6
IGluZ2VuaWM6IEFkZCBzdXBwb3J0IGZvciB0aGUgSlo0NzI1QiIpCj4gU2lnbmVkLW9mZi1ieTog
V2VpYmluIExpdSA8bGl1d2JAeGlhb3BlbmcuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6IHNr
aXAgdGhlIGNvcnJlY3Rpb24gZm9yIGFuIGluZGV4IHRoYXQgZG9lcyBub3QgcG9pbnQKPiBpbnRv
IHRoZSBkYXRhIGFyZWEgaW5zdGVhZCBvZiBmYWlsaW5nIHRoZSBwYWdlIHdpdGggLUVCQURNU0cu
wqAgQQo+IGNvcnJlY3RhYmxlIGJpdGZsaXAgaW4gdGhlIEVDQyBieXRlcyBsZWF2ZXMgdGhlIGRh
dGEgdmFsaWQsIGFuZCB0aGUKPiBlYXJseSBleGl0IGFsc28gZHJvcHBlZCB0aGUgZXJyb3IgZW50
cmllcyB0aGF0IGZvbGxvd2VkIGl0LsKgIFRoaXMKPiBtYXRjaGVzIGhvdyBqejQ3NDBfZWNjX2Nv
cnJlY3QoKSB0cmVhdHMgaXRzIGluZGV4ZXMuCj4gCj4gVmVyaWZpZWQgd2l0aCBhIHVzZXJzcGFj
ZSByZXBsaWNhIG9mIHRoZSBjb3JyZWN0aW9uIGxvb3A6IHdpdGgKPiBwYXJhbXMtPnNpemUgPSA1
MTIsIGFuIGluZGV4IG9mIDQwOTkgKHBhcml0eSBhcmVhKSBmb2xsb3dlZCBieSBhCj4gZGF0YS1h
cmVhIGluZGV4IG9mIDEwMCBpbiB0aGUgc2FtZSBCSEVSUiByZWdpc3RlciBpcyBub3cgY29ycmVj
dGVkCj4gKHYxIHJldHVybmVkIC1FQkFETVNHIGFuZCBsZWZ0IHRoZSBkYXRhIGVycm9yIHVuZml4
ZWQpLCB0aGUgZmllbGQKPiBtYXhpbXVtICgweDFmZmYpIHByb2R1Y2VzIG5vIHdyaXRlIG91dHNp
ZGUgdGhlIGJ1ZmZlciwgYW5kIGluLXJhbmdlCj4gaW5kZXhlcyBrZWVwIGNvcnJlY3RpbmcgYXMg
YmVmb3JlLgoKV2hhdCBib3RoZXJzIG1lLCBhbmQgbWF5YmUgaXQncyBqdXN0IG1lIG5vdCBrbm93
aW5nIE5BTkQgdGhhdCB3ZWxsOiB3b3VsZG4ndCBhCmJpdC1mbGlwIGluIHRoZSBwYXJpdHkgYXJl
YSBjYXVzZSBhIGNhc2NhZGUgb2YgZmFsc2UtcG9zaXRpdmVzIGluIHRoZSBkYXRhIHRvbywKbGVh
ZGluZyB0byBCQ0hfQkhJTlRfVU5DT1I/IEJlY2F1c2UgdGhlIEVDQyBjb2RlIGlzIHJlYWQgZnJv
bSB0aGUgcGFyaXR5IHJlZ2lvbiwKYW0gSSB3cm9uZz8KCkNoZWVycywKLVBhdWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
