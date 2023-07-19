Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EB7C001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 14:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oret98SGSNP6Bd5AmZoiDuhHF2tnrDEPGHoLZyX8uFY=; b=nxvxfbS2iSwqQ8/C2tbieulfvD
	kQ7MIVCau5e5mB98si9WX8UKwweysgUhhXqA+6JYcWvcTrx2NA76RsQlQVQBJUpNuzUBoBMmD8hEC
	nQA0p47JHQKnY5obM5RTzw7ai971Pg+57//puB6ARBldElQ8PAPj7nKf3k5Er/x4N/rJ3TrmyLptY
	cW6f8mXAei/+u7XKSU7HXgkamPubqAyaKpz5eWMtCgvOzVji9KD2E+u/xBtulBNGYxOWLQFW9CnNW
	8E28e1d4OtaK/6JJc7vIxqOd7rnoe59FPXMSUqkzbO+ymFpzy+nvws1w9yUM1oS9m68l8JyM+hAh6
	mah6i45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM85q-007i41-2f;
	Wed, 19 Jul 2023 14:23:54 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM85m-007i2Z-20
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 14:23:53 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R5dJQ0gzxzNmKd;
	Wed, 19 Jul 2023 22:20:22 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 22:23:40 +0800
Subject: Re: [RFC PATCH 05/21] ubifs: Pass worst-case buffer size to
 compression routines
To: Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>
CC: <linux-crypto@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
	Kees Cook <keescook@chromium.org>, Haren Myneni <haren@us.ibm.com>, Nick
 Terrell <terrelln@fb.com>, Minchan Kim <minchan@kernel.org>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Richard Weinberger
	<richard@nod.at>, David Ahern <dsahern@kernel.org>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Steffen Klassert <steffen.klassert@secunet.com>,
	<linux-kernel@vger.kernel.org>, <linux-block@vger.kernel.org>,
	<qat-linux@intel.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-6-ardb@kernel.org>
 <20230718223813.GC1005@sol.localdomain>
 <CAMj1kXE1fND2h8ts6Xtfn19wkt=vAnj1TumxvoBCuEn7z3V4Aw@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3330004f-acac-81b4-e382-a17221a0a128@huawei.com>
Date: Wed, 19 Jul 2023 22:23:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXE1fND2h8ts6Xtfn19wkt=vAnj1TumxvoBCuEn7z3V4Aw@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_072351_071408_76987C26 
X-CRM114-Status: GOOD (  22.09  )
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

5ZyoIDIwMjMvNy8xOSAxNjozMywgQXJkIEJpZXNoZXV2ZWwg5YaZ6YGTOgo+IE9uIFdlZCwgMTkg
SnVsIDIwMjMgYXQgMDA6MzgsIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4+Cj4+IE9uIFR1ZSwgSnVsIDE4LCAyMDIzIGF0IDAyOjU4OjMxUE0gKzAyMDAsIEFyZCBC
aWVzaGV1dmVsIHdyb3RlOgo+Pj4gQ3VycmVudGx5LCB0aGUgdWJpZnMgY29kZSBhbGxvY2F0ZXMg
YSB3b3JzdCBjYXNlIGJ1ZmZlciBzaXplIHRvCj4+PiByZWNvbXByZXNzIGEgZGF0YSBub2RlLCBi
dXQgZG9lcyBub3QgcGFzcyB0aGUgc2l6ZSBvZiB0aGF0IGJ1ZmZlciB0byB0aGUKPj4+IGNvbXBy
ZXNzaW9uIGNvZGUuIFRoaXMgbWVhbnMgdGhhdCB0aGUgY29tcHJlc3Npb24gY29kZSB3aWxsIG5l
dmVyIHVzZQoKSSB0aGluayB5b3UgbWVhbiB0aGUgJ291dF9sZW4nIHdoaWNoIGRlc2NyaWJlcyB0
aGUgbGVuZ2ggb2YgJ2J1ZicgaXMgCnBhc3NlZCBpbnRvIHViaWZzX2RlY29tcHJlc3MsIHdoaWNo
IGVmZmVjdHMgdGhlIHJlc3VsdCBvZiAKZGVjb21wcmVzc29yKGVnLiBsejQgdXNlcyBsZW5ndGgg
dG8gY2FsY3VsYXRlIHRoZSBidWZmZXIgZW5kIHBvcykuClNvLCB3ZSBzaG91bGQgcGFzcyB0aGUg
cmVhbCBsZW5naHRoIG9mICdidWYnLgoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6
aGloYW8xQGh1YXdlaS5jb20+Cgo+Pj4gdGhlIGFkZGl0aW9uYWwgc3BhY2UsIGFuZCBtaWdodCBm
YWlsIHNwdXJpb3VzbHkgZHVlIHRvIGxhY2sgb2Ygc3BhY2UuCj4+Pgo+Pj4gU28gbGV0J3MgbXVs
dGlwbHkgb3V0X2xlbiBieSBXT1JTVF9DT01QUl9GQUNUT1IgYWZ0ZXIgYWxsb2NhdGluZyB0aGUK
Pj4+IGJ1ZmZlci4gRG9pbmcgc28gaXMgZ3VhcmFudGVlZCBub3QgdG8gb3ZlcmZsb3csIGdpdmVu
IHRoYXQgdGhlIHByZWNlZGluZwo+Pj4ga21hbGxvY19hcnJheSgpIGNhbGwgd291bGQgaGF2ZSBm
YWlsZWQgb3RoZXJ3aXNlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFyZCBCaWVzaGV1dmVsIDxh
cmRiQGtlcm5lbC5vcmc+Cj4+PiAtLS0KPj4+ICAgZnMvdWJpZnMvam91cm5hbC5jIHwgMiArKwo+
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2ZzL3ViaWZzL2pvdXJuYWwuYyBiL2ZzL3ViaWZzL2pvdXJuYWwuYwo+Pj4gaW5kZXggZGM1MmFj
MGY0YTM0NWYzMC4uNGU1OTYxODc4ZjMzNjAzMyAxMDA2NDQKPj4+IC0tLSBhL2ZzL3ViaWZzL2pv
dXJuYWwuYwo+Pj4gKysrIGIvZnMvdWJpZnMvam91cm5hbC5jCj4+PiBAQCAtMTQ5Myw2ICsxNDkz
LDggQEAgc3RhdGljIGludCB0cnVuY2F0ZV9kYXRhX25vZGUoY29uc3Qgc3RydWN0IHViaWZzX2lu
Zm8gKmMsIGNvbnN0IHN0cnVjdCBpbm9kZSAqaW4KPj4+ICAgICAgICBpZiAoIWJ1ZikKPj4+ICAg
ICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Pj4KPj4+ICsgICAgIG91dF9sZW4gKj0gV09S
U1RfQ09NUFJfRkFDVE9SOwo+Pj4gKwo+Pj4gICAgICAgIGRsZW4gPSBsZTMyX3RvX2NwdShkbi0+
Y2gubGVuKSAtIFVCSUZTX0RBVEFfTk9ERV9TWjsKPj4+ICAgICAgICBkYXRhX3NpemUgPSBkbl9z
aXplIC0gVUJJRlNfREFUQV9OT0RFX1NaOwo+Pj4gICAgICAgIGNvbXByX3R5cGUgPSBsZTE2X3Rv
X2NwdShkbi0+Y29tcHJfdHlwZSk7Cj4+Cj4+IFRoaXMgbG9va3MgbGlrZSBhbm90aGVyIGNhc2Ug
d2hlcmUgZGF0YSB0aGF0IHdvdWxkIGJlIGV4cGFuZGVkIGJ5IGNvbXByZXNzaW9uCj4+IHNob3Vs
ZCBqdXN0IGJlIHN0b3JlZCB1bmNvbXByZXNzZWQgaW5zdGVhZC4KPj4KPj4gSW4gZmFjdCwgaXQg
c2VlbXMgdGhhdCBVQklGUyBkb2VzIHRoYXQgYWxyZWFkeS4gIHViaWZzX2NvbXByZXNzKCkgaGFz
IHRoaXM6Cj4+Cj4+ICAgICAgICAgIC8qCj4+ICAgICAgICAgICAqIElmIHRoZSBkYXRhIGNvbXBy
ZXNzZWQgb25seSBzbGlnaHRseSwgaXQgaXMgYmV0dGVyIHRvIGxlYXZlIGl0Cj4+ICAgICAgICAg
ICAqIHVuY29tcHJlc3NlZCB0byBpbXByb3ZlIHJlYWQgc3BlZWQuCj4+ICAgICAgICAgICAqLwo+
PiAgICAgICAgICBpZiAoaW5fbGVuIC0gKm91dF9sZW4gPCBVQklGU19NSU5fQ09NUFJFU1NfRElG
RikKPj4gICAgICAgICAgICAgICAgICBnb3RvIG5vX2NvbXByOwo+Pgo+PiBTbyBpdCdzIHVuY2xl
YXIgd2h5IHRoZSBXT1JTVF9DT01QUl9GQUNUT1IgdGhpbmcgaXMgbmVlZGVkIGF0IGFsbC4KPj4K
PiAKPiBJdCBpcyBub3QuIFRoZSBidWZmZXIgaXMgdXNlZCBmb3IgZGVjb21wcmVzc2lvbiBpbiB0
aGUgdHJ1bmNhdGlvbgo+IHBhdGgsIHNvIG5vbmUgb2YgdGhpcyBsb2dpYyBldmVuIG1hdHRlcnMu
IEV2ZW4gaWYgdGhlIHN1YnNlcXVlbnQKPiByZWNvbXByZXNzaW9uIG9mIHRoZSB0cnVuY2F0ZWQg
ZGF0YSBub2RlIGNvdWxkIHJlc3VsdCBpbiBleHBhbnNpb24KPiBiZXlvbmQgdGhlIHVuY29tcHJl
c3NlZCBzaXplIG9mIHRoZSBvcmlnaW5hbCBkYXRhICh3aGljaCBzZWVtcwo+IGltcG9zc2libGUg
dG8gbWUpLCBpbmNyZWFzaW5nIHRoZSBzaXplIG9mIHRoaXMgYnVmZmVyIHdvdWxkIG5vdCBoZWxw
Cj4gYXMgaXQgaXMgdGhlIGlucHV0IGJ1ZmZlciBmb3IgdGhlIGNvbXByZXNzaW9uIG5vdCB0aGUg
b3V0cHV0IGJ1ZmZlci4KPiAuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
