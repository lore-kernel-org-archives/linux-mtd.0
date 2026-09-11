Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C546C88E53
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 19:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOI8bGPz4amrX+EBQe4445CBIuKhH+r+9678pSWHxi4=; b=jGx2k+00byMdKo
	lbZbxgRvyKtZyUH53kC1Vn+KRyUQvWrJlVl10wovKL394vfT5w2KYIbORRJm+z9ArQV6o25tm3f2Y
	N69deCIkbOiJjWm1tvKkHk8hc11hvicnylgXn+WXWFpZHn8D8gaWjiWTND0YIg16OwYbV3NDTioeK
	uBoXEmTo/W9+pE1OI6A8n8j7oZwJezzVdjMOWHUXAL0w2JRjZ7NqRevXga0gCsYaPldvsZ8m+VDjw
	xb+3BNTtFcyXhjjq5Lb1CeoJFaMhuyWVTawcWIuARWEfThyj6W3YNS/1/SNsj0XscioGWFIA5tpEA
	h36ZR7j3sjPIfaoyf/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56dZ-0000000HViq-2wem;
	Fri, 11 Sep 2026 19:10:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56dY-0000000HVih-1S2N
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 19:10:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91F8460142;
	Fri, 11 Sep 2026 19:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990EE1F000FF;
	Fri, 11 Sep 2026 19:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789153811;
	bh=x8PF0Dw7B9WOGI0dgKC/lQ6SFx581HVewAv+WudZApk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZgfwXFn0n86BydycMzknxcPJhdXE8VTJA5js5hebUm8GFRpG7Z+JgIMKyUznMIkr0
	 42hSx1+db7cX6H/GFI23hksucKuXhCJF3qwqyqZW7l9xEJxRO+rrDBezl1ti8yLsM7
	 XRRWahOkZhpZbT7hDSXLvW2WzWO/rKJZs+3m0UC1BMnt02Jd2mwpGty4Z4Mak30Lft
	 fAwE8BwoFIqCz6XKMUlY7YnQ+fBIcJaapWbsDDhMjBWl7u94qKvs901ed85hrrS2ru
	 jyPCvlqOmgJxTrdjaBmp6E6OsoRLztzdgZTj4ZpuS+8+6mreUnlIP+OJDVDPU0Iowd
	 0cU1wtElUb90A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] spi: spi-qpic-snand: drop the redundant ECC
 context handling
To: md.alam@oss.qualcomm.com, broonie@kernel.org, "Johan Alvarado" <contact@c127.dev>
Cc: j4g8y7@gmail.com, quic_varada@quicinc.com, linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, miquel.raynal@bootlin.com, pengpeng@iscas.ac.cn, linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, linux-mtd@lists.infradead.org, konradybcio@kernel.org
In-Reply-To: <20260911184416.109790-3-contact@c127.dev>
References: <20260911184416.109790-1-contact@c127.dev>
 <20260911184416.109790-3-contact@c127.dev>
Date: Fri, 11 Sep 2026 19:10:10 +0000
Message-Id: <20260911191010.990EE1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIERldGVybWluaXN0aWMg
a2VybmVsIHBhbmljIGluIHFjb21fc3BpX2Jsb2NrX2VyYXNlKCkgd2hlbiB0aGUgaG9zdCBFQ0Mg
ZW5naW5lIGlzIGJ5cGFzc2VkIChlLmcuLCB2aWEgbm9uLU5BTkQgU1BJIG1lbW9yeSBkcml2ZXJz
IGxpa2Ugc3BpLW5vciwgb3IgT04tRElFL3NvZnR3YXJlIEVDQykuCi0tCgpjb21taXQgYTk3YTA3
MWQ3OTEyNWJiNWRiNGQ1NWM3ZDAzYTVmOTQ1ZmE5MmFlZgpBdXRob3I6IEpvaGFuIEFsdmFyYWRv
IDxjb250YWN0QGMxMjcuZGV2PgoKICAgIHNwaTogc3BpLXFwaWMtc25hbmQ6IGRyb3AgdGhlIHJl
ZHVuZGFudCBFQ0MgY29udGV4dCBoYW5kbGluZwogICAgCiAgICBxY29tX3NwaV9lY2NfaW5pdF9j
dHhfcGlwZWxpbmVkKCkgbm93IHB1Ymxpc2hlcyB0aGUgRUNDIGNvbnRleHQgdG8KICAgIHNuYW5k
Yy0+cXNwaS0+ZWNjLCBzbyB0aGUgYXNzaWdubWVudCBpbgogICAgcWNvbV9zcGlfZWNjX3ByZXBh
cmVfaW9fcmVxX3BpcGVsaW5lZCgpIHJlcGVhdHMgd2hhdCB0aGUgcG9pbnRlciBhbHJlYWR5CiAg
ICBob2xkcywgYW5kIHRoZSB6ZXJvZWQgc3RydWN0IHFwaWNfZWNjIHRoYXQgcWNvbV9zcGlfcHJv
YmUoKSBhbGxvY2F0ZXMgaXMKICAgIG5ldmVyIHJlYWQuCgo+IFRoZSBwb2ludGVyIGlzIG5vbi1O
VUxMIG9ubHkgYmV0d2VlbiBjb250ZXh0IGNyZWF0aW9uIGFuZCBkZXN0cnVjdGlvbiwKPiBhbmQg
ZXZlcnkgcmVhZGVyIHJ1bnMgaW5zaWRlIHRoYXQgd2luZG93LiBUaGUgb29ibGF5b3V0IGNhbGxi
YWNrcyBhcmUKPiBpbnN0YWxsZWQgYnkgaW5pdF9jdHguIFRoZSBwYWdlIHJlYWQsIHdyaXRlIGFu
ZCBwcm9ncmFtIGhlbHBlcnMgcnVuIG9ubHkKPiB3aGVuIHByZXBhcmVfaW9fcmVxIGhhcyBzZXQg
cGFnZV9ydyBvciBvb2JfcncuIHFjb21fc3BpX2Jsb2NrX2VyYXNlKCkKPiBydW5zIG9ubHkgd2hp
bGUgdGhlIG10ZCBpcyByZWdpc3RlcmVkLCB3aGljaCBoYXBwZW5zIGFmdGVyIGluaXRfY3R4IGFu
ZAo+IGVuZHMgYmVmb3JlIGNsZWFudXBfY3R4LgoKSXMgdGhpcyBhc3N1bXB0aW9uIGFjY3VyYXRl
IGZvciBhbGwgY29uZmlndXJhdGlvbnM/CgpJZiB0aGUgZGV2aWNlIHRyZWUgc3BlY2lmaWVzIE9O
LURJRSBvciBzb2Z0d2FyZSBFQ0MgKG5hbmQsZWNjLWVuZ2luZSA9CiJvbi1kaWUiKSwgb3IgaWYg
YSBub24tTkFORCBTUEkgbWVtb3J5IGRldmljZSAobGlrZSBzcGktbm9yKSBpcyBhdHRhY2hlZCB0
bwp0aGlzIGNvbnRyb2xsZXIsIHdvbid0IHRoZSBob3N0J3MgaW5pdF9jdHggYmUgYnlwYXNzZWQ/
Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jIGIvZHJpdmVycy9z
cGkvc3BpLXFwaWMtc25hbmQuYwo+IGluZGV4IDIwMDQ1ZDRhNDZmYWQuLjc2MGVlMWMyOTQwMmYg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYwo+ICsrKyBiL2RyaXZl
cnMvc3BpL3NwaS1xcGljLXNuYW5kLmMKWyAuLi4gXQo+IEBAIC0xNTg2LDE0ICsxNTg0LDkgQEAg
c3RhdGljIGludCBxY29tX3NwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+
ICAJc3RydWN0IHNwaV9jb250cm9sbGVyICpjdGxyOwo+ICAJc3RydWN0IHFjb21fbmFuZF9jb250
cm9sbGVyICpzbmFuZGM7Cj4gIAlzdHJ1Y3QgcXBpY19zcGlfbmFuZCAqcXNwaTsKPiAtCXN0cnVj
dCBxcGljX2VjYyAqZWNjOwo+ICAJc3RydWN0IHJlc291cmNlICpyZXM7Cj4gIAlpbnQgcmV0Owo+
ICAKPiAtCWVjYyA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZWNjKSwgR0ZQX0tFUk5FTCk7
Cj4gLQlpZiAoIWVjYykKPiAtCQlyZXR1cm4gLUVOT01FTTsKPiAtCgpbU2V2ZXJpdHk6IEhpZ2hd
CklmIGluaXRfY3R4IGlzIGJ5cGFzc2VkIGFzIGRlc2NyaWJlZCBhYm92ZSwgd2lsbCByZW1vdmlu
ZyB0aGlzIGFsbG9jYXRpb24KbGVhZCB0byBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBpbiBx
Y29tX3NwaV9ibG9ja19lcmFzZSgpPwoKSWYgc25hbmRjLT5xc3BpLT5lY2MgcmVtYWlucyBOVUxM
LCBhIHN0YW5kYXJkIGJsb2NrIGVyYXNlIG9wZXJhdGlvbgpkZWxlZ2F0ZWQgdGhyb3VnaCBxY29t
X3NwaV9leGVjX29wKCkgdG8gcWNvbV9zcGlfYmxvY2tfZXJhc2UoKSB3b3VsZCBhcHBlYXIKdG8g
ZGVyZWZlcmVuY2UgaXQ6Cgpkcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jOnFjb21fc3BpX2Js
b2NrX2VyYXNlKCkgewoJc3RydWN0IHFwaWNfZWNjICplY2NfY2ZnID0gc25hbmRjLT5xc3BpLT5l
Y2M7CgkuLi4KCXNuYW5kYy0+cmVncy0+Y2ZnMCA9IGNwdV90b19sZTMyKChlY2NfY2ZnLT5jZmcw
X3JhdyAmIH5DV19QRVJfUEFHRV9NQVNLKSB8CgkJCQkJIEZJRUxEX1BSRVAoQ1dfUEVSX1BBR0Vf
TUFTSywgMCkpOwp9Cgo+ICAJcXNwaSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqcXNwaSks
IEdGUF9LRVJORUwpOwo+ICAJaWYgKCFxc3BpKQo+ICAJCXJldHVybiAtRU5PTUVNOwoKLS0gClNh
c2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDkx
MTE4NDQxNi4xMDk3OTAtMS1jb250YWN0QGMxMjcuZGV2P3BhcnQ9MgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
