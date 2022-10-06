Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFA7C433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5MvVS/xintYV+Kql+Y9Ge6d7O7KDe0sj7tC4u2th8Y=; b=BilEzgLOb8bCse
	6+NmoF4A7Z8rerP1QvsVAkvZkYzsXLGxIBwMFEFIUHVgH/xwV2r1eqtU0oBoOAKmAX6x9zE78xS2F
	24CkmrchRenQiMw8xOJXRCAbs6b7+E4qvJ3W/soqKbfs4zi9/5mwwVoYT6FY36ncwJn+LvQFpPw1p
	klM98bohlt9OAn0IjZ9MMWUta7vd5Dd2lESSxxEC9VvJ9B6SGtyKd0rQheB7ItU5Yu8NlWYIX7lRd
	SAzCWSGhhiqvCmTxjmUy7WqFDlzZV7fW4WuO5jYBT7D59l+cyJWUa1ni/vQWm0hhQvSQYt3eEKzn7
	rh8OFyiFJRxmFk68kuBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMyp-0011FD-DW; Thu, 06 Oct 2022 09:15:47 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMyl-0011C9-1e
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 09:15:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 346BB240002;
	Thu,  6 Oct 2022 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665047737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=APsvoPiMqcgjCyLTp/wGIQOIyM81IZBQevZbMqq+Di8=;
	b=IQIM17DyCVjN4QeDnWr1ZxFxkJhFQggIouff0aDO/EKaVmhpD0ELpPj1L/dRkNSEOJtrzJ
	A1U1zEXCTv9nQkQj65UmYWrRj/IxOX1aNGsondJ+NW79i8ItHiqBh/3uEn77zJwrphIms7
	Xf+yK1jVNA+BQztZI56f7fmqUJFKdkgKRY7yQnpDcsJRNrPM7Hvcwf3pE8yrTkDrwYkC1Q
	k+lALc+pTtYYjrPsNFDFRkoYy57YVLXMBQaOJ28pxPJlD2KKKQRmhQF+mo7qP7bubh7K/V
	WttSbm4vEzwCO6iFyVEexQdEZwUixv+hCBL4SjKFIMYnA1FFKm/RK9/wKAfLZw==
Date: Thu, 6 Oct 2022 11:15:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Deming Wang <wangdeming@inspur.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: Delete commented printk and add some space for
 required
Message-ID: <20221006111536.2c285116@xps-13>
In-Reply-To: <20221006090419.1635-1-wangdeming@inspur.com>
References: <20221006090419.1635-1-wangdeming@inspur.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_021543_522688_B5191CA3 
X-CRM114-Status: GOOD (  17.37  )
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

SGkgRGVtaW5nLAoKd2FuZ2RlbWluZ0BpbnNwdXIuY29tIHdyb3RlIG9uIFRodSwgNiBPY3QgMjAy
MiAwNTowNDoxOSAtMDQwMDoKCj4gRGVsZXRlIGNvbW1lbnRlZCBwcmludGsgZm9yIE5GVExfZmlu
ZHdyaXRldW5pdCBhbmQKPiAKPiBORlRMX21ha2VmcmVlYmxvY2suIEFkZCByZXF1aXJlZCBzcGFj
ZSBmb3IgdGhlIHZhcmlhYmxlIGJsb2Nrb2ZzCgpJIHdvdWxkIHJhdGhlciBub3QgZGVsZXRlIHRo
ZXNlIGNvbW1lbnRzIGJlY2F1c2UgdGhleSBhcmUgdmVyeSBvbGQgYW5kCkkgYmVsaWV2ZSB3ZXJl
IGRlYnVnZ2luZyBsaW5lcyBpbiB0aGUgcGFzdC4gSSBob3BlIHdlIHdpbGwgbmV2ZXIgaGF2ZQp0
byBkaWcgaW50byB0aGlzIGRyaXZlciBhbnltb3JlIGJ1dCBpZiB3ZSBoYXZlIHRvLCBJIHdvdWxk
IHN1Z2dlc3QgdG8KdXNlIGRlYnVnIHByaW50aydzIGluc3RlYWQuCgpBbHNvLCBpZiB5b3Ugd2Fu
dCB0byBjbGVhbiB1cCBhIGJpdCB0aGUgZHJpdmVyLCB5b3UgY2FuIGdvIGEgbGl0dGxlIGJpdApm
dXJ0aGVyIGFuZCBhZGRyZXNzIGVnLiBhbGwgd2hpdGVzcGFjZSBpc3N1ZXMuCgo+IFNpZ25lZC1v
ZmYtYnk6IERlbWluZyBXYW5nIDx3YW5nZGVtaW5nQGluc3B1ci5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvbXRkL25mdGxjb3JlLmMgfCA5ICstLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25m
dGxjb3JlLmMgYi9kcml2ZXJzL210ZC9uZnRsY29yZS5jCj4gaW5kZXggNjRkMzE5ZTk1OWIyLi5l
M2MxN2VkNGMyMTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmZ0bGNvcmUuYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL25mdGxjb3JlLmMKPiBAQCAtNDg2LDcgKzQ4Niw2IEBAIHN0YXRpYyB1MTYg
TkZUTF9tYWtlZnJlZWJsb2NrKCBzdHJ1Y3QgTkZUTHJlY29yZCAqbmZ0bCAsIHVuc2lnbmVkIHBl
bmRpbmdibG9jaykKPiAgCj4gIAkJd2hpbGUgKEVVTiA8PSBuZnRsLT5sYXN0RVVOKSB7Cj4gIAkJ
CXRoaXNsZW4rKzsKPiAtCQkJLy9wcmludGsoIlZVQyAlZCByZWFjaGVzIGxlbiAlZCB3aXRoIEVV
TiAlZFxuIiwgY2hhaW4sIHRoaXNsZW4sIEVVTik7Cj4gIAkJCUVVTiA9IG5mdGwtPlJlcGxVbml0
VGFibGVbRVVOXSAmIDB4N2ZmZjsKPiAgCQkJaWYgKHRoaXNsZW4gPiAweGZmMDApIHsKPiAgCQkJ
CXByaW50aygiRW5kbGVzcyBsb29wIGluIFZpcnR1YWwgQ2hhaW4gJWQ6IFVuaXQgJXhcbiIsCj4g
QEAgLTUwMSw3ICs1MDAsNiBAQCBzdGF0aWMgdTE2IE5GVExfbWFrZWZyZWVibG9jayggc3RydWN0
IE5GVExyZWNvcmQgKm5mdGwgLCB1bnNpZ25lZCBwZW5kaW5nYmxvY2spCj4gIAkJfQo+ICAKPiAg
CQlpZiAodGhpc2xlbiA+IENoYWluTGVuZ3RoKSB7Cj4gLQkJCS8vcHJpbnRrKCJOZXcgbG9uZ2Vz
dCBjaGFpbiBpcyAlZCB3aXRoIGxlbmd0aCAlZFxuIiwgY2hhaW4sIHRoaXNsZW4pOwo+ICAJCQlD
aGFpbkxlbmd0aCA9IHRoaXNsZW47Cj4gIAkJCUxvbmdlc3RDaGFpbiA9IGNoYWluOwo+ICAJCX0K
PiBAQCAtNTI1LDcgKzUyMyw3IEBAIHN0YXRpYyBpbmxpbmUgdTE2IE5GVExfZmluZHdyaXRldW5p
dChzdHJ1Y3QgTkZUTHJlY29yZCAqbmZ0bCwgdW5zaWduZWQgYmxvY2spCj4gIAl1MTYgdGhpc1ZV
QyA9IGJsb2NrIC8gKG5mdGwtPkVyYXNlU2l6ZSAvIDUxMik7Cj4gIAlzdHJ1Y3QgbXRkX2luZm8g
Km10ZCA9IG5mdGwtPm1iZC5tdGQ7Cj4gIAl1bnNpZ25lZCBpbnQgd3JpdGVFVU47Cj4gLQl1bnNp
Z25lZCBsb25nIGJsb2Nrb2ZzID0gKGJsb2NrICogNTEyKSAmIChuZnRsLT5FcmFzZVNpemUgLTEp
Owo+ICsJdW5zaWduZWQgbG9uZyBibG9ja29mcyA9IChibG9jayAqIDUxMikgJiAobmZ0bC0+RXJh
c2VTaXplIC0gMSk7Cj4gIAlzaXplX3QgcmV0bGVuOwo+ICAJaW50IHNpbGx5LCBzaWxseTIgPSAz
Owo+ICAJc3RydWN0IG5mdGxfb29iIG9vYjsKPiBAQCAtNTkyLDEwICs1OTAsNiBAQCBzdGF0aWMg
aW5saW5lIHUxNiBORlRMX2ZpbmR3cml0ZXVuaXQoc3RydWN0IE5GVExyZWNvcmQgKm5mdGwsIHVu
c2lnbmVkIGJsb2NrKQo+ICAJCQkgICBhIGNoYWluIHRvIG1ha2Ugcm9vbS4KPiAgCQkJKi8KPiAg
Cj4gLQkJCS8qIEZpcnN0IHJlbWVtYmVyIHRoZSBzdGFydCBvZiB0aGlzIGNoYWluICovCj4gLQkJ
CS8vdTE2IHN0YXJ0RVVOID0gbmZ0bC0+RVVOdGFibGVbdGhpc1ZVQ107Cj4gLQo+IC0JCQkvL3By
aW50aygiV3JpdGUgdG8gVmlydHVhbFVuaXRDaGFpbiAlZCwgY2FsbGluZyBtYWtlZnJlZWJsb2Nr
KClcbiIsIHRoaXNWVUMpOwo+ICAJCQl3cml0ZUVVTiA9IE5GVExfbWFrZWZyZWVibG9jayhuZnRs
LCBCTE9DS19OSUwpOwo+ICAKPiAgCQkJaWYgKHdyaXRlRVVOID09IEJMT0NLX05JTCkgewo+IEBA
IC02MTgsNyArNjEyLDYgQEAgc3RhdGljIGlubGluZSB1MTYgTkZUTF9maW5kd3JpdGV1bml0KHN0
cnVjdCBORlRMcmVjb3JkICpuZnRsLCB1bnNpZ25lZCBibG9jaykKPiAgCQkJCXByaW50ayhLRVJO
X1dBUk5JTkcgIkNhbm5vdCBtYWtlIGZyZWUgc3BhY2UuXG4iKTsKPiAgCQkJCXJldHVybiBCTE9D
S19OSUw7Cj4gIAkJCX0KPiAtCQkJLy9wcmludGsoIlJlc3RhcnRpbmcgc2NhblxuIik7Cj4gIAkJ
CWNvbnRpbnVlOwo+ICAJCX0KPiAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
