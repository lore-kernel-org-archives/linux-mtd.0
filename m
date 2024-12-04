Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DE9E7716D
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2024 10:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Cg3IrB+P39JDU360T+yIR3j96n4AApFtZN7jnysYdmU=; b=3T1+RTUGdqrMS7ronUDvasdqzh
	1ZBaSV5ZGGzFuqw0rF1kDsaGvyhZyOhdcP6OVYXJFOxZZ30n7VKiQCXYrKYLKDUQndPQ+bxDEbx8Q
	pKgWs9siatno9zYAbAyysxP2/9d5QR5Cl+2egdBWglT5+CUpo4yj1Zs1QnynbzKfQXLULCPZd+j9w
	++f6tsnARlAzDCLCNlXR2Gd/AfvJti60w3oymmh7cak2kAlKE5I9VCOJB4Qm5V/XqE8ZxyatIdBMa
	9geSZQQP0kO/XunMsmrNWhIiyvaZrEUSDb0HcjldaUcKnw4IRxiYp6YIF+YKyBr8gDBB0i9Q/NA+B
	c7uBXYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImQo-0000000CBHk-2tzs;
	Wed, 04 Dec 2024 10:16:30 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImQl-0000000CBGn-0kmo
	for linux-mtd@lists.infradead.org;
	Wed, 04 Dec 2024 10:16:29 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 397832BFA2A;
	Wed,  4 Dec 2024 11:16:24 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Uzn9N6zbpPUV; Wed,  4 Dec 2024 11:16:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D65F42E6140;
	Wed,  4 Dec 2024 11:16:23 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xc-aCKUjhrdj; Wed,  4 Dec 2024 11:16:23 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id B78752BFA2A;
	Wed,  4 Dec 2024 11:16:23 +0100 (CET)
Date: Wed, 4 Dec 2024 11:16:23 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1562063374.32195797.1733307383533.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOuPNLhZZ1rs3Hhuwh2b3HLaqrAVUY7YwviQVUXgVi6XTZxnMw@mail.gmail.com>
References: <CAOuPNLhxBBihr38p_XMQEgkiLFc+DPxkQf4oewF8U1+ihaFn-Q@mail.gmail.com> <CAOuPNLhhWzoBQH85zEd95LbONtrknq+b7tfcze50VPa9bEnXzw@mail.gmail.com> <87ldww4zrx.fsf@bootlin.com> <342000380.28770675.1733242094522.JavaMail.zimbra@nod.at> <CAOuPNLhZZ1rs3Hhuwh2b3HLaqrAVUY7YwviQVUXgVi6XTZxnMw@mail.gmail.com>
Subject: Re: Block based OTA update needs mtdblock
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Topic: Block based OTA update needs mtdblock
Thread-Index: UB2+P/e388gS0Z+vHPLuyTSHrFuNnw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_021627_355089_84FCECDB 
X-CRM114-Status: GOOD (  10.65  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlBpbnR1IEFnYXJ3YWwiIDxw
aW50dS5waW5nQGdtYWlsLmNvbT4KPj4gPj4gRGlkIGFueWJvZHkgdXNlZCBibG9jayBiYXNlZCBP
VEEgdXBkYXRlIE5BTkQgQS9CIHN5c3RlbSB3aXRob3V0IHVzaW5nCj4+ID4+IG10ZF9ibG9jayA/
Cj4+ID4KPj4gPiBOb3Qgb24gbXkgc2lkZSwgaXQgaXMgYWN0dWFsbHkgYSBnb29kIHF1ZXN0aW9u
LiBSaWNoYXJkLCBhbnkgaWRlYXM/Cj4+Cj4+IFdoYXQgYWJvdXQgdXNpbmcgdWJpdXBkYXRldm9s
Pwo+Pgo+IEFzIEkgZXhwbGFpbmVkIGFib3ZlLCB1Yml1cGRhdGV2b2wgYWN0dWFsbHkgcGVyZm9y
bXMgYSBmdWxsIHZvbHVtZQo+IHVwZGF0ZSwgcmlnaHQgPwo+IEkgdGhpbmsgdGhlIHBhcnRpYWwv
aW5jcmVtZW50YWwgdXBkYXRlIGlzIG5vdCBwb3NzaWJsZSB3aXRoIHRoaXMuIE9uY2UKPiB0aGUg
dXBkYXRlIGlzIHRyaWdnZXJlZCBpdCBzaG91bGQgZmluaXNoIGZ1bGx5Lgo+IEJ1dCBmb3IgT1RB
IHVwZGF0ZXMgKERlbHRhL0luY3JlbWVudGFsKSwgb25seSB0aGUgZGVsdGEgY2hhbmdlcyBjYW4K
PiBhbHNvIGJlIGFwcGxpZWQuCj4gUGxlYXNlIHJlZmVyIHRvIHRoaXMgWzFdIGFib3V0IHVwZGF0
ZXMgbWVjaGFuaXNtLgo+IFsxXSBodHRwczovL21lZGl1bS5jb20vQHlpZ2l0cGlyaWxkYWsvYW5k
cm9pZC1vdGEtdXBkYXRlLW1lY2hhbmlzbS1lY2M4ZjZmNjlmNzEKPiBbMl0KPiBodHRwczovL3Nv
dXJjZS5hbmRyb2lkLmNvbS9kb2NzL2NvcmUvb3RhL3Rvb2xzIzp+OnRleHQ9QW4lMjBpbmNyZW1l
bnRhbCUyMHVwZGF0ZSUyMGlzJTIwYW4sbmVlZCUyMHRvJTIwaW5jbHVkZSUyMHVuY2hhbmdlZCUy
MGZpbGVzLgo+IAo+IE9uIG91ciBOQU5EIHRhcmdldCB3ZSBzdXBwb3J0IE9UQSB1cGRhdGVzLCBp
bmNsdWRpbmcgaW5jcmVtZW50YWwgb3RhIHVwZGF0ZXMuCj4gQnV0IHdpdGhvdXQgbXRkYmxvY2sg
dGhlIGluY3JlbWVudGFsIE9UQSB1cGRhdGUgKG9uIEEvQiBzeXN0ZW0pIHdpbGwgbm90IHdvcmsu
Cj4gVGhpcyBpcyB0aGUgbWFpbiBpc3N1ZS4KPiBGb3IgZnVsbCB1cGRhdGVzIG9uIHViaSB2b2x1
bWVzIHdlIGFyZSBhbHJlYWR5IHVzaW5nIHRoZQo+ICJ1Yml1cGRhdGV2b2wiIG1lY2hhbmlzbS4K
CldlbGwsIGZvciBkeW5hbWljIHZvbHVtZXMgeW91IGNhbiB1c2UgdGhlIFVCSV9JT0NFQkNIIGlv
Y3RsIHRvIHJlcGxhY2UgTEVCcy4KU28sIGluY3JlbWVudGFsIHVwZGF0ZXMgYXJlIGRvYWJsZSB0
b28uCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
