Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCE5C531F9
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2026 09:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3jBxjSLBdBj9ZW97ECghoM5R+2ka2vbqw+JBJ/6H1I8=; b=4W2p0H1NKEvELOW6IinC39Omoq
	YQ54zAjzg012vLxzMvecNIbzTT6ZT6OJiJ6Uj2LEfU1Xz1ZTFsAIol7WxdFIR5sPv45BWMKTXURks
	HSvyroN/zU3gFGQ6Cv/n47RzkGs2VxL5tJJvuSFr7amWvTgkScNx4DmEiFrcyl+rC+nXZJUyttt2T
	xVYKdZO+OFzthkDsXkJEoi/QzT4s1dAHnqAPsT3OOHQD5Ps5CP86EWEFXfxMa8KvnZc8uabRom2P+
	K2nFqKUu/vX2E2HNQEAjupLjG2XSVauWxCpM1XPNf4918SId7cUadsXGTd4vEb6r7nE9BsEOgITUT
	8BJmRkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBzP-0000000FwMM-37hf;
	Fri, 24 Jul 2026 09:14:43 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBzL-0000000FwJy-2Rn3
	for linux-mtd@lists.infradead.org;
	Fri, 24 Jul 2026 09:14:41 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 27EDD2698C0;
	Fri, 24 Jul 2026 11:14:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id g_ZBn1QBkE1U; Fri, 24 Jul 2026 11:14:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 933E02698C1;
	Fri, 24 Jul 2026 11:14:27 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dwFqY_7lNOrD; Fri, 24 Jul 2026 11:14:27 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6D6092698C0;
	Fri, 24 Jul 2026 11:14:27 +0200 (CEST)
Date: Fri, 24 Jul 2026 11:14:27 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Ibrahim Hashimov <security@auditcode.ai>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	stable <stable@vger.kernel.org>
Message-ID: <699752101.3017.1784884467138.JavaMail.zimbra@nod.at>
In-Reply-To: <20260724074327.73582-1-security@auditcode.ai>
References: <20260724074327.73582-1-security@auditcode.ai>
Subject: Re: [PATCH] ubifs: fix out-of-bounds read in signature length check
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF152 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: fix out-of-bounds read in signature length check
Thread-Index: nlmEpwFRuXKq6ooMPkH0R8BSJLkErw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_021439_767248_47B559AA 
X-CRM114-Status: GOOD (  13.38  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIklicmFoaW0gSGFzaGltb3Yi
IDxzZWN1cml0eUBhdWRpdGNvZGUuYWk+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+
Cj4gQ0M6ICJjaGVuZ3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4sICJTYXNjaGEg
SGF1ZXIiIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiwgImxpbnV4LW10ZCIKPiA8bGludXgtbXRk
QGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZz4sICJzdGFibGUiIDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+IEdlc2VuZGV0
OiBGcmVpdGFnLCAyNC4gSnVsaSAyMDI2IDA5OjQzOjI3Cj4gQmV0cmVmZjogW1BBVENIXSB1Ymlm
czogZml4IG91dC1vZi1ib3VuZHMgcmVhZCBpbiBzaWduYXR1cmUgbGVuZ3RoIGNoZWNrCgo+IHVi
aWZzX3NiX3ZlcmlmeV9zaWduYXR1cmUoKSBib3VuZHMgdGhlIG9uLWRpc2sgdWJpZnNfc2lnX25v
ZGUtPmxlbiBmaWVsZAo+IGJlZm9yZSBoYW5kaW5nIHRoZSBzaWduYXR1cmUgcGF5bG9hZCB0byB2
ZXJpZnlfcGtjczdfc2lnbmF0dXJlKCksIGJ1dCB0aGUKPiBjaGVjayBoYXMgdGhlIHdyb25nIHNp
Z246Cj4gCj4JaWYgKGxlMzJfdG9fY3B1KHNpZ25vZGUtPmxlbikgPiBzbm9kLT5sZW4gKyBzaXpl
b2Yoc3RydWN0IHViaWZzX3NpZ19ub2RlKSkKPiAKPiBUaGUgc2lnbmF0dXJlIGJ5dGVzIHN0YXJ0
IHNpemVvZihzdHJ1Y3QgdWJpZnNfc2lnX25vZGUpIChVQklGU19TSUdfTk9ERV9TWiwKPiA2NCBi
eXRlcykgaW50byB0aGUgbm9kZSwgc28gdGhlIHBheWxvYWQgaXMgYXQgbW9zdAo+IAo+CXNub2Qt
PmxlbiAtIHNpemVvZihzdHJ1Y3QgdWJpZnNfc2lnX25vZGUpCj4gCj4gYnl0ZXMgbG9uZy4gQWRk
aW5nIHRoZSBoZWFkZXIgc2l6ZSBpbnN0ZWFkIG9mIHN1YnRyYWN0aW5nIGl0IGFjY2VwdHMgYQo+
IGRlY2xhcmVkIGxlbmd0aCB1cCB0byAyICogVUJJRlNfU0lHX05PREVfU1ogbGFyZ2VyIHRoYW4g
dGhlIG5vZGUgYWN0dWFsbHkKPiBob2xkcyAtLSBwYXN0IHRoZSBlbmQgb2YgYy0+c2J1Ziwgd2hp
Y2ggaXMgdm1hbGxvYyhjLT5sZWJfc2l6ZSkuCj4gdmVyaWZ5X3BrY3M3X3NpZ25hdHVyZSgpIC0+
IHBrY3M3X3BhcnNlX21lc3NhZ2UoKSAtPiBhc24xX2Jlcl9kZWNvZGVyKCkKPiBpcyB0aGVuIGhh
bmRlZCB0aGF0IGluZmxhdGVkIGxlbmd0aCBhbmQgcmVhZHMgYmV5b25kIHRoZSBhbGxvY2F0aW9u
IHdoaWxlCj4gd2Fsa2luZyB0aGUgREVSIGhlYWRlcnMuIFRoZSBub2RlIGxlbmd0aCBjb21lcyBz
dHJhaWdodCBmcm9tIHRoZSBtb3VudGVkCj4gaW1hZ2UsIHNvIGEgY3JhZnRlZCBzaWduZWQgVUJJ
RlMgaW1hZ2UgcmVhY2hlcyB0aGlzIHZpYQo+IHViaWZzX3JlYWRfc3VwZXJibG9jaygpIGJlZm9y
ZSB0aGUgc2lnbmF0dXJlIGlzIGNyeXB0b2dyYXBoaWNhbGx5IGNoZWNrZWQuCj4gCj4gc25vZC0+
bGVuIGlzIGd1YXJhbnRlZWQgdG8gYmUgPj0gVUJJRlNfU0lHX05PREVfU1ogYnkgdGhlIG5vZGUg
c2Nhbm5lcgo+IChjLT5yYW5nZXNbVUJJRlNfU0lHX05PREVdLm1pbl9sZW4gPT0gVUJJRlNfU0lH
X05PREVfU1opLCBzbyB0aGUgY29ycmVjdGVkCj4gc3VidHJhY3Rpb24gY2Fubm90IHVuZGVyZmxv
dy4gTGVnaXRpbWF0ZWx5IHNpZ25lZCBpbWFnZXMgYXJlIHVuYWZmZWN0ZWQ6IGEKPiBjb3JyZWN0
IHN1cGVyYmxvY2sgbmV2ZXIgZGVjbGFyZXMgYSBzaWduYXR1cmUgbG9uZ2VyIHRoYW4gdGhlIG5v
ZGUgaXQgaXMKPiBlbWJlZGRlZCBpbi4KPiAKPiBGaXhlczogODE3YWEwOTQ4NDJkICgidWJpZnM6
IHN1cHBvcnQgb2ZmbGluZSBzaWduZWQgaW1hZ2VzIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwo+IFNpZ25lZC1vZmYtYnk6IElicmFoaW0gSGFzaGltb3YgPHNlY3VyaXR5QGF1ZGl0Y29k
ZS5haT4KPiBBc3Npc3RlZC1ieTogQXVkaXRDb2RlLUFJOjIwMjYuMDcKPiAtLS0KPiBmcy91Ymlm
cy9hdXRoLmMgfCAyICstCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpSZXZpZXdlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4K
ClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
