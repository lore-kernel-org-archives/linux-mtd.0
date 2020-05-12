Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B35CC54E8B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:16:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CF8C20675
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I+/1WpbB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CF8C20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rs222BdwPsKWstcn/cZ95y11LW9BDm54jJhrGfwOik=; b=I+/1WpbBovfJq8
	cxrjDVGjcCBJmoSG/1g3FKKmP4qWQHGr61DTyO42bl+bGFuVGXpg2GEKKj0bQPVkmGvl/3cEpokoc
	FliH7zHdxIhoxnWd7F0Z1/zm4D61MzcT4cAPR1Lp5Cyyv1WwQaE1y9USEI11Lq1e6vWvYOJ/lJHRl
	Utrc9/est7xHtCbl+hvSwobm7Rz1CuX0r9fNmtY1SHHjlwTFfnYTcArGyCfKiadpofBS5Y+CUtc6y
	ML0RtUxG92av/67S3ggrphYgTjq2QLRPkMFa01zZpRD0gh3mb1ATi3WB3o69Udc+qI3wp1eRYZFVw
	UGyNqWKlUHpOdrEeV+PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYP9h-0002bM-KH; Tue, 12 May 2020 07:16:45 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYP9e-0002aU-C8
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 07:16:43 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2B8632000C;
 Tue, 12 May 2020 07:16:38 +0000 (UTC)
Date: Tue, 12 May 2020 09:16:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: brcmnand: correctly verify erased pages
Message-ID: <20200512091637.198dd0c2@xps13>
In-Reply-To: <20200512065111.716801-1-noltari@gmail.com>
References: <20200505082055.2843847-1-noltari@gmail.com>
 <20200512065111.716801-1-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_001642_548619_7FDBF5C4 
X-CRM114-Status: GOOD (  17.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, kdasu.kdev@gmail.com, richard@nod.at,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, computersforpeace@gmail.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgw4FsdmFybywKCsOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+
IHdyb3RlIG9uIFR1ZSwgMTIgTWF5IDIwMjAKMDg6NTE6MTEgKzAyMDA6Cgo+IFRoZSBjdXJyZW50
IGNvZGUgY2hlY2tzIHRoYXQgdGhlIHdob2xlIE9PQiBhcmVhIGlzIGVyYXNlZC4KPiBUaGlzIGlz
IGEgcHJvYmxlbSB3aGVuIEpGRlMyIGNsZWFubWFya2VycyBhcmUgYWRkZWQgdG8gdGhlIE9PQiwg
c2luY2UgaXQgd2lsbAo+IGZhaWwgZHVlIHRvIHRoZSB1c2FibGUgT09CIGJ5dGVzIG5vdCBiZWlu
ZyAweGZmLgo+IENvcnJlY3QgdGhpcyBieSBvbmx5IGNoZWNraW5nIHRoYXQgZGF0YSBhbmQgRUND
IGJ5dGVzIGFyZW4ndCAweGZmLgo+IAo+IEZpeGVzOiAwMmI4OGVlYTlmOWMgKCJtdGQ6IGJyY21u
YW5kOiBBZGQgY2hlY2sgZm9yIGVyYXNlZCBwYWdlIGJpdGZsaXBzIikKPiBTaWduZWQtb2ZmLWJ5
OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+IC0tLQo+ICB2
MzogRml4IGNvbW1pdCBsb2cgYW5kIG1lcmdlIG5hbmRfY2hlY2tfZXJhc2VkX2VjY19jaHVuayBj
YWxscy4KPiAgdjI6IEFkZCBGaXhlcyB0YWcKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJj
bW5hbmQvYnJjbW5hbmQuYyB8IDE5ICsrKysrKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gaW5kZXggZTRlM2NlZWFjMzhmLi44MGZlMDFmMDM1
MTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiBAQCAt
MjAxOCw4ICsyMDE4LDkgQEAgc3RhdGljIGludCBicmNtbmFuZF9yZWFkX2J5X3BpbyhzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgc3RhdGljIGludCBicmNt
c3RiX25hbmRfdmVyaWZ5X2VyYXNlZF9wYWdlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAo+ICAJCSAg
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdm9pZCAqYnVmLCB1NjQgYWRkcikKPiAgewo+ICsJc3Ry
dWN0IG10ZF9vb2JfcmVnaW9uIG9vYmVjYzsKPiAgCWludCBpLCBzYXM7Cj4gLQl2b2lkICpvb2Ig
PSBjaGlwLT5vb2JfcG9pOwo+ICsJdm9pZCAqb29iOwo+ICAJaW50IGJpdGZsaXBzID0gMDsKPiAg
CWludCBwYWdlID0gYWRkciA+PiBjaGlwLT5wYWdlX3NoaWZ0Owo+ICAJaW50IHJldDsKPiBAQCAt
MjAzNSwxMSArMjAzNiwxOSBAQCBzdGF0aWMgaW50IGJyY21zdGJfbmFuZF92ZXJpZnlfZXJhc2Vk
X3BhZ2Uoc3RydWN0IG10ZF9pbmZvICptdGQsCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7
Cj4gIAo+IC0JZm9yIChpID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrLCBvb2IgKz0gc2Fz
KSB7Cj4gKwlmb3IgKGkgPSAwOyBpIDwgY2hpcC0+ZWNjLnN0ZXBzOyBpKyspIHsKPiAgCQllY2Nf
Y2h1bmsgPSBidWYgKyBjaGlwLT5lY2Muc2l6ZSAqIGk7Cj4gLQkJcmV0ID0gbmFuZF9jaGVja19l
cmFzZWRfZWNjX2NodW5rKGVjY19jaHVuaywKPiAtCQkJCQkJICBjaGlwLT5lY2Muc2l6ZSwKPiAt
CQkJCQkJICBvb2IsIHNhcywgTlVMTCwgMCwKPiArCj4gKwkJaWYgKG10ZC0+b29ibGF5b3V0LT5l
Y2MobXRkLCBpLCAmb29iZWNjKSkgewoKUGxlYXNlIHVzZSB0aGUgbXRkY29yZS5jJ3MgaGVscGVy
cwoobXRkX29vYmxheW91dF9zZXQvZ2V0X2RhdGEvZnJlZS9lY2MvYnl0ZXMpLgoKQWxzbywgd2hh
dCBhcmUgeW91IHRyeWluZyB0byBkaXNjcmltaW5hdGUgd2l0aCB0aGUgcmV0dXJuIGNvZGUgb2Yg
dGhlCmZ1bmN0aW9uPyBTaG91bGRuJ3QgdGhpcyBmdW5jdGlvbiAiYWx3YXlzIiB3b3JrPwoKPiAr
CQkJb29iID0gTlVMTDsKPiArCQkJb29iZWNjLmxlbmd0aCA9IDA7Cj4gKwkJfSBlbHNlIHsKPiAr
CQkJb29iID0gY2hpcC0+b29iX3BvaSArIG9vYmVjYy5vZmZzZXQ7Cj4gKwkJfQo+ICsKPiArCQly
ZXQgPSBuYW5kX2NoZWNrX2VyYXNlZF9lY2NfY2h1bmsoZWNjX2NodW5rLCBjaGlwLT5lY2Muc2l6
ZSwKPiArCQkJCQkJICBvb2IsIG9vYmVjYy5sZW5ndGgsCj4gKwkJCQkJCSAgTlVMTCwgMCwKPiAg
CQkJCQkJICBjaGlwLT5lY2Muc3RyZW5ndGgpOwoKQXMgSSB0b2xkIHlvdSwgdGhpcyBoZWxwZXIg
dGFrZXMgIm1haWQgZGF0YSIgdGhlbiAic3BhcmUgYXJlYSIgdGhlbgoiZWNjIGJ5dGVzIi4gVGhl
IG5hbWVzIGFyZSBwcmV0dHkgaW1wb3J0YW50IGhlcmUgYXMgeW91IHdhbnQgdG8gYXZvaWQKY2hl
Y2tpbmcgdGhlIHNwYXJlIE9PQiBieXRlcyBvbiBwdXJwb3NlLCBzbyBtYXliZSB5b3UgY291bGQg
aGF2ZSBtb3JlCm1lYW5pbmdmdWwgbmFtZXMgYW5kIGNhbGwgImVjYyIgaW5zdGVhZCBvZiAib29i
IiB0aGUgZWNjIHJlZ2lvbj8KIAo+ICAJCWlmIChyZXQgPCAwKQo+ICAJCQlyZXR1cm4gcmV0OwoK
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
