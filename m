Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E034CC0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 01:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE4AGyQm/QVMtln/70S6DupSrpQZA5IF7cZKvEXkipQ=; b=bUWgTh1XbzB/YznXX20A5cEQxP
	rYXqkL2ya2Q4umSq8JR8/NOKyaYVyPJAoLMu9sw98KoOTjCigycR4YxYLFwRJDEyX34rPguTTtiV6
	k8Hm+jHIxDhTakx9orK3LIOriDX8ZN9HTeRT0UGbx5KSAG61+oU5mnm81Roj2Ym9kCcSeV3TZGQNB
	2jwbMK2DPLqF3CbXBXGmYeXvr5PqY7j6U9KEXycprJPkT9nA+3Xyv9fKSS+diJUTylJiZV3utMF+F
	yat1FmX7DB8kraLfkxxJJcU4iSSGgPvutf5hkXNDa9r8TpXG0YT+HjVjOGHhfGjUWQkZQVN4k5DQG
	qu8NlU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMIOS-009Ri3-03;
	Thu, 20 Jul 2023 01:23:48 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMION-009Rg0-1T
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 01:23:45 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4R5vyn1WCBzLnrV;
	Thu, 20 Jul 2023 09:21:05 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 09:23:31 +0800
Subject: Re: [RFC PATCH 05/21] ubifs: Pass worst-case buffer size to
 compression routines
To: Ard Biesheuvel <ardb@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>, <linux-crypto@vger.kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>, Kees Cook <keescook@chromium.org>,
	Haren Myneni <haren@us.ibm.com>, Nick Terrell <terrelln@fb.com>, Minchan Kim
	<minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Jens
 Axboe <axboe@kernel.dk>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Richard Weinberger <richard@nod.at>, David Ahern <dsahern@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Steffen Klassert <steffen.klassert@secunet.com>,
	<linux-kernel@vger.kernel.org>, <linux-block@vger.kernel.org>,
	<qat-linux@intel.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-6-ardb@kernel.org>
 <20230718223813.GC1005@sol.localdomain>
 <CAMj1kXE1fND2h8ts6Xtfn19wkt=vAnj1TumxvoBCuEn7z3V4Aw@mail.gmail.com>
 <3330004f-acac-81b4-e382-a17221a0a128@huawei.com>
 <CAMj1kXGq=WiJXsQG6R0jEFYu_Mdom_KY+DE=NGqVSF6QmqhKeA@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4fc9930e-152b-1de1-9532-d1eefa6c277c@huawei.com>
Date: Thu, 20 Jul 2023 09:23:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGq=WiJXsQG6R0jEFYu_Mdom_KY+DE=NGqVSF6QmqhKeA@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_182343_824999_901438F6 
X-CRM114-Status: GOOD (  28.38  )
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

5ZyoIDIwMjMvNy8xOSAyMjozOCwgQXJkIEJpZXNoZXV2ZWwg5YaZ6YGTOgo+IE9uIFdlZCwgMTkg
SnVsIDIwMjMgYXQgMTY6MjMsIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+
IHdyb3RlOgo+Pgo+PiDlnKggMjAyMy83LzE5IDE2OjMzLCBBcmQgQmllc2hldXZlbCDlhpnpgZM6
Cj4+PiBPbiBXZWQsIDE5IEp1bCAyMDIzIGF0IDAwOjM4LCBFcmljIEJpZ2dlcnMgPGViaWdnZXJz
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgMDI6
NTg6MzFQTSArMDIwMCwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4+Pj4+IEN1cnJlbnRseSwgdGhl
IHViaWZzIGNvZGUgYWxsb2NhdGVzIGEgd29yc3QgY2FzZSBidWZmZXIgc2l6ZSB0bwo+Pj4+PiBy
ZWNvbXByZXNzIGEgZGF0YSBub2RlLCBidXQgZG9lcyBub3QgcGFzcyB0aGUgc2l6ZSBvZiB0aGF0
IGJ1ZmZlciB0byB0aGUKPj4+Pj4gY29tcHJlc3Npb24gY29kZS4gVGhpcyBtZWFucyB0aGF0IHRo
ZSBjb21wcmVzc2lvbiBjb2RlIHdpbGwgbmV2ZXIgdXNlCj4+Cj4+IEkgdGhpbmsgeW91IG1lYW4g
dGhlICdvdXRfbGVuJyB3aGljaCBkZXNjcmliZXMgdGhlIGxlbmdoIG9mICdidWYnIGlzCj4+IHBh
c3NlZCBpbnRvIHViaWZzX2RlY29tcHJlc3MsIHdoaWNoIGVmZmVjdHMgdGhlIHJlc3VsdCBvZgo+
PiBkZWNvbXByZXNzb3IoZWcuIGx6NCB1c2VzIGxlbmd0aCB0byBjYWxjdWxhdGUgdGhlIGJ1ZmZl
ciBlbmQgcG9zKS4KPj4gU28sIHdlIHNob3VsZCBwYXNzIHRoZSByZWFsIGxlbmdodGggb2YgJ2J1
ZicuCj4+Cj4gCj4gWWVzLCB0aGF0IGlzIHdoYXQgSSBtZWFudC4KPiAKPiBCdXQgRXJpYyBtYWtl
cyBhIGdvb2QgcG9pbnQsIGFuZCBsb29raW5nIGEgYml0IG1vcmUgY2xvc2VseSwgdGhlcmUgaXMK
PiByZWFsbHkgbm8gbmVlZCBmb3IgdGhlIG11bHRpcGxpY2F0aW9uIGhlcmU6IHdlIGtub3cgdGhl
IHNpemUgb2YgdGhlCj4gZGVjb21wcmVzc2VkIGRhdGEsIHNvIHdlIGRvbid0IG5lZWQgdGhlIGFk
ZGl0aW9uYWwgc3BhY2UuCj4gCgpSaWdodCwgd2UgZ2V0ICdvdXRfbGVuJyBmcm9tICdkbi0+c2l6
ZScgd2hpY2ggaXMgdGhlIGxlbmd0aCBvZiAKdW5jb21wcmVzc2VkIGRhdGEuIHViaWZzX2NvbXBy
ZXNzIG1ha2VzIHN1cmUgdGhlIGNvbXByZXNzZWQgbGVuZ3RoIGlzIApzbWFsbGVyIHRoYW4gb3Jp
Z2luYWwgbGVuZ3RoLgoKPiBJIGludGVuZCB0byBkcm9wIHRoaXMgcGF0Y2gsIGFuZCByZXBsYWNl
IGl0IHdpdGggdGhlIGZvbGxvd2luZzoKPiAKPiAtLS0tLS0tLS0tLS0tLS0tODwtLS0tLS0tLS0t
LS0tLQo+IAo+IEN1cnJlbnRseSwgd2hlbiB0cnVuY2F0aW5nIGEgZGF0YSBub2RlLCBhIGRlY29t
cHJlc3Npb24gYnVmZmVyIGlzCj4gYWxsb2NhdGVkIHRoYXQgaXMgdHdpY2UgdGhlIHNpemUgb2Yg
dGhlIGRhdGEgbm9kZSdzIHVuY29tcHJlc3NlZCBzaXplLgo+IEhvd2V2ZXIsIHRoZSBmYWN0IHRo
YXQgdGhpcyBzcGFjZSBpcyBhdmFpbGFibGUgaXMgbm90IGNvbW11bmljYXRlZCB0bwo+IHRoZSBj
b21wcmVzc2lvbiByb3V0aW5lcywgYXMgb3V0X2xlbiBpdHNlbGYgaXMgbm90IHVwZGF0ZWQuCj4g
Cj4gVGhlIGFkZGl0aW9uYWwgc3BhY2UgaXMgbm90IG5lZWRlZCBldmVuIGluIHRoZSB0aGVvcmV0
aWNhbCB3b3JzdCBjYXNlCj4gd2hlcmUgY29tcHJlc3Npb24gbWlnaHQgbGVhZCB0byBpbmFkdmVy
dGVudCBleHBhbnNpb246IGZpcnN0IG9mIGFsbCwKPiBpbmNyZWFzaW5nIHRoZSBzaXplIG9mIHRo
ZSBpbnB1dCBidWZmZXIgZG9lcyBub3QgaGVscCBtaXRpZ2F0ZSB0aGF0Cj4gaXNzdWUuIEFuZCBn
aXZlbiB0aGUgdHJ1bmNhdGlvbiBvZiB0aGUgZGF0YSBub2RlIGFuZCB0aGUgZmFjdCB0aGF0IHRo
ZQo+IG9yaWdpbmFsIGRhdGEgY29tcHJlc3NlZCB3ZWxsIGVub3VnaCB0byBwYXNzIHRoZSBVQklG
U19NSU5fQ09NUFJFU1NfRElGRgo+IHRlc3QsIHRoZXJlIGlzIG5vIHdheSBvbiB0aGlzIHBhcnRp
Y3VsYXIgY29kZSBwYXRoIHRoYXQgY29tcHJlc3Npb24KPiBjb3VsZCByZXN1bHQgaW4gZXhwYW5z
aW9uIGJleW9uZCB0aGUgb3JpZ2luYWwgZGVjb21wcmVzc2VkIHNpemUsIGFuZCBzbwo+IG5vIG1p
dGlnYXRpb24gaXMgbmVjZXNzYXJ5IHRvIGJlZ2luIHdpdGguCj4gCj4gU28gbGV0J3MganVzdCBk
cm9wIFdPUlNUX0NPTVBSX0ZBQ1RPUiBoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFyZCBCaWVz
aGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+Cj4gCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2pvdXJu
YWwuYyBiL2ZzL3ViaWZzL2pvdXJuYWwuYwo+IGluZGV4IGRjNTJhYzBmNGEzNDVmMzAuLjBiNTVj
YmZlMGMzMDUwNWUgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJpZnMvam91cm5hbC5jCj4gKysrIGIvZnMv
dWJpZnMvam91cm5hbC5jCj4gQEAgLTE0ODksNyArMTQ4OSw3IEBAIHN0YXRpYyBpbnQgdHJ1bmNh
dGVfZGF0YV9ub2RlKGNvbnN0IHN0cnVjdAo+IHViaWZzX2luZm8gKmMsIGNvbnN0IHN0cnVjdCBp
bm9kZSAqaW4KPiAgICAgICAgICBpbnQgZXJyLCBkbGVuLCBjb21wcl90eXBlLCBvdXRfbGVuLCBk
YXRhX3NpemU7Cj4gCj4gICAgICAgICAgb3V0X2xlbiA9IGxlMzJfdG9fY3B1KGRuLT5zaXplKTsK
PiAtICAgICAgIGJ1ZiA9IGttYWxsb2NfYXJyYXkob3V0X2xlbiwgV09SU1RfQ09NUFJfRkFDVE9S
LCBHRlBfTk9GUyk7Cj4gKyAgICAgICBidWYgPSBrbWFsbG9jKG91dF9sZW4sIEdGUF9OT0ZTKTsK
PiAgICAgICAgICBpZiAoIWJ1ZikKPiAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+
IC4KPiAKClRoaXMgdmVyc2lvbiBsb29rcyBiZXR0ZXIuCgpSZXZpZXdlZC1ieTogWmhpaGFvIENo
ZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
