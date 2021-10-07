Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EF9C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:20:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BBFA6101E
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BBFA6101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FZiilR3FCWt4FJyv1/9xUiZHIwVCj6B993VsIMohltM=; b=o/UOyGieuUqPDeZi0DJBQBZfXw
	Kow5Wf+1DG0ra1jLYzzL6rsbY9LO1RHuWNuJMd0Ahbep3N62fdt7fkknktWXyrwf54wY2Jsxy613T
	TegJXH8dF3BAiQYF5aZcvvnkSiqkwJaAu0sU8qA8CSR46/JVp6trF0pni6y5mvNzV32Ghp9CwkF7B
	Apjwm0bnu57wDLvMW8mQFR2HBVHqfuXJ9A6Ov70edJL/3xRr/699qMbraHAXOW26NBnD5HpYVUDHq
	Oyfq954x3oBYmKs2hINbpJYoCKSn4vIesWfwkkFRssHqRV+gIX2JeRt/zJ6iWOy+ott3EfdM0nFwT
	D0z5YIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNhM-00GPLM-2P; Thu, 07 Oct 2021 07:20:12 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNhI-00GPKU-6W
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 07:20:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D7BC161B8F46;
 Thu,  7 Oct 2021 09:20:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id cjeblmnXiFUo; Thu,  7 Oct 2021 09:20:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 05E9C60F6B67;
 Thu,  7 Oct 2021 09:20:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NhK20gVrzUZ2; Thu,  7 Oct 2021 09:20:05 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id C5C1761B8F46;
 Thu,  7 Oct 2021 09:20:05 +0200 (CEST)
Date: Thu, 7 Oct 2021 09:20:05 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Message-ID: <1970203009.45154.1633591205445.JavaMail.zimbra@nod.at>
In-Reply-To: <837215091.45041.1633589943979.JavaMail.zimbra@nod.at>
References: <20211001192836.n6eek7rno7ewvmu7@lug-owl.de>
 <20211005144936.xnkzugjr3oygauei@lug-owl.de>
 <837215091.45041.1633589943979.JavaMail.zimbra@nod.at>
Subject: Re: PING: [PATCH] Don't overflow when writing a key
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF92 (Linux)/8.8.12_GA_3809)
Thread-Topic: PING: [PATCH] Don't overflow when writing a key
Thread-Index: +Bp2Zyfw65UU/scTJm1o0Kxf69rEaD/TBcbi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_002008_577784_96F11507 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogInJpY2hhcmQiIDxyaWNoYXJk
QG5vZC5hdD4KPiBBbjogIkphbi1CZW5lZGljdCBHbGF3IiA8amJnbGF3QGx1Zy1vd2wuZGU+Cj4g
Q0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJBcnRlbSBC
aXR5dXRza2l5IiA8YXJ0ZW0uYml0eXV0c2tpeUBsaW51eC5pbnRlbC5jb20+Cj4gR2VzZW5kZXQ6
IERvbm5lcnN0YWcsIDcuIE9rdG9iZXIgMjAyMSAwODo1OTowMwo+IEJldHJlZmY6IFJlOiBQSU5H
OiBbUEFUQ0hdIERvbid0IG92ZXJmbG93IHdoZW4gd3JpdGluZyBhIGtleQoKPiAtLS0tLSBVcnNw
csO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZvbjogIkphbi1CZW5lZGljdCBHbGF3IiA8amJnbGF3
QGx1Zy1vd2wuZGU+Cj4+IEFuOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVh
ZC5vcmc+Cj4+IENDOiAiQXJ0ZW0gQml0eXV0c2tpeSIgPGFydGVtLmJpdHl1dHNraXlAbGludXgu
aW50ZWwuY29tPiwgInJpY2hhcmQiCj4+IDxyaWNoYXJkQG5vZC5hdD4KPj4gR2VzZW5kZXQ6IERp
ZW5zdGFnLCA1LiBPa3RvYmVyIDIwMjEgMTY6NDk6MzYKPj4gQmV0cmVmZjogUElORzogW1BBVENI
XSBEb24ndCBvdmVyZmxvdyB3aGVuIHdyaXRpbmcgYSBrZXkKPiAKPj4gSGksCj4+IAo+PiBPbiBG
cmksIDIwMjEtMTAtMDEgMjE6Mjg6MzYgKzAyMDAsIEphbi1CZW5lZGljdCBHbGF3IDxqYmdsYXdA
bHVnLW93bC5kZT4gd3JvdGU6Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMva2V5LmggYi9mcy91
Ymlmcy9rZXkuaAo+Pj4gaW5kZXggODE0MmQ5ZDZmZTVkLi40MGVkY2NhN2JhNjIgMTAwNjQ0Cj4+
PiAtLS0gYS9mcy91Ymlmcy9rZXkuaAo+Pj4gKysrIGIvZnMvdWJpZnMva2V5LmgKPj4+IEBAIC00
MzYsNyArNDM2LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGtleV93cml0ZShjb25zdCBzdHJ1Y3Qg
dWJpZnNfaW5mbyAqYywKPj4+ICAKPj4+ICAJdC0+ajMyWzBdID0gY3B1X3RvX2xlMzIoZnJvbS0+
dTMyWzBdKTsKPj4+ICAJdC0+ajMyWzFdID0gY3B1X3RvX2xlMzIoZnJvbS0+dTMyWzFdKTsKPj4+
IC0JbWVtc2V0KHRvICsgOCwgMCwgVUJJRlNfTUFYX0tFWV9MRU4gLSA4KTsKPj4+ICsJbWVtc2V0
KHRvICsgOCwgMCwgVUJJRlNfU0tfTEVOIC0gOCk7Cj4+PiAgfQo+Pj4gIAo+Pj4gIC8qKgo+PiAK
Pj4gSSB3YW50ZWQgdG8gZ2l2ZSB0aGlzIGxpdHRsZSBwYXRjaCBhIHBpbmcgc2luY2UgdGhlcmUg
d2Fzbid0IGEgcmVwbHkKPiAKPiBJbiBNVEQncyBwYXRjaHdvcmsgaXQgaXMgbWFya2VkIGFzICJV
bmRlciByZXZpZXciLCBzbyBpdCBpcyBub3QgbG9zdC4KPiAKPj4gdW50aWwgbm93IGFuZCBJIHRo
aW5rIGl0IG1pZ2h0IGZpeCBhbiBvdmVyZmxvdy4KPiAKPiBZb3VyIGZpeCBsb29rcyBsZWdpdCBi
dXQgc2luY2UgSSdtIHRyYXZlbGluZyBJIG5lZWQgdG8gZ2l2ZSBpdCBhIGRlZXBlcgo+IHRob3Vn
aHQgd2hlbiBJJ20gYmFjayBob21lLgo+IEknbSBhIGxpdHRsZSBwdXp6bGVkIHdoeSBub2JvZHkg
bm90aWNlZCB0aGUgc3RhY2sgY29ycnVwdGlvbiBzbyBmYXIsCj4ga2V5X3dyaXRlKCkgaGFzIGJl
ZW4gZG9pbmcgc2luY2UgZXZlci4KClR5cGluZyB0aGF0IG1haWwgdHJpZ2dlcmVkIGFscmVhZHkg
YSBkZWVwZXIgdGhvdWdodC4gOi1ECgprZXlfd3JpdGUoKSB0YWtlcyBhIHViaWZzX2tleSBhcyBz
b3VyY2UgYW5kIHdyaXRlcyB0byBhIGJ1ZmZlci4KSXQgYXNzdW1lcyB0aGF0IHRoZSBwYXNzZWQg
dWJpZnNfa2V5IGlzIGluIHNpbXBsZSBrZXkgZm9ybWF0IChiZWluZyBVQklGU19TS19MRU4gbG9u
ZykKYW5kIGl0IGFzc3VtZXMgdGhlIGJ1ZmZlciBpcyBVQklGU19NQVhfS0VZX0xFTiBsb25nLgpT
bywgdGhlIGRlc3RpbmF0aW9uIGlzICpub3QqIGEgdW5pb24gdWJpZnNfa2V5IHN0cnVjdHVyZS4K
CldlIGhhdmUgdGhyZWUgY2FsbGVycyBvZiBrZXlfd3JpdGUoKSwgYWxsIGluIGpvdXJuYWwuYwoK
MS4gdWJpZnNfam5sX3dyaXRlX2RhdGEKa2V5X3dyaXRlKGMsIGtleSwgJmRhdGEtPmtleSk7Cgpk
YXRhIGlzIHN0cnVjdCB1Ymlmc19kYXRhX25vZGUgd2hlcmUga2V5IGlzIG9mIHNpemUgVUJJRlNf
TUFYX0tFWV9MRU4uCgoyLiB1Ymlmc19qbmxfdXBkYXRlCgpTYW1lIHdpdGggc3RydWN0IHViaWZz
X2RlbnRfbm9kZQoKMy4gdWJpZnNfam5sX2RlbGV0ZV94YXR0cgoKU2FtZSBhZ2Fpbi4KCkFsbCB0
aHJlZSBvYmplY3RzIGFyZSBzbGFiIGFsbG9jYXRlZCwgZGlkIHlvdSBjaGVjaywgaXMgdG9vIGZl
dyBtZW1vcnkgYWxsb2NhdGVkPwpJbiBvdGhlciB3b3JkcywgaG93IGRpZCB5b3UgY2FsY3VsYXRl
IHRoZSBzaXplIG9mIHRhcmdldCBidWZmZXI/CgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
