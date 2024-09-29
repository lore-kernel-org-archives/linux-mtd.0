Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594F3CF6499
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2024 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rjszOoVnhhpoNXdyh0ynRWcGVwYjgClfeaUINi2oUJ8=; b=bIGt4oQaburGr+O/WAoMdEVbfQ
	wEMg7f4Bs6rvsK07YmIXZoHNgXZKAVSNjBcp8QCpEhU/jO6alyHqtqQRZT57AAaWcWkQb6Bkb8+jI
	DkTIxjurQEDCSAVxdtM3RRZ2pN0WzQAUoJvZUJnsoyNtNkXFIBroWM93HAr0kZbPsSoc6FLWwRGUd
	SIuu4/N1/heXbqWof9vXSGDpXjAHEgfQUyyXLuK4W1Lguhk6dKTmdGGRQHB/BXzBI3DoqEBiXom3F
	0axaJkSNc1V+u6ZXqC5VrkH3fk9kMMqkpkVc4BRmvSmOi0SG237sJOI7nt9u6voyJHGzJ2MNoqcSg
	SNRCQgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sut0D-0000000Ejt1-3fmB;
	Sun, 29 Sep 2024 12:26:17 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sut0A-0000000EjsC-1t9C
	for linux-mtd@lists.infradead.org;
	Sun, 29 Sep 2024 12:26:16 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5B7C064CD878;
	Sun, 29 Sep 2024 14:26:03 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id AVCXFA8yoKkP; Sun, 29 Sep 2024 14:26:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C8C2464CD88C;
	Sun, 29 Sep 2024 14:26:02 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 594Xe0yKtZV8; Sun, 29 Sep 2024 14:26:02 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 96B2164CD878;
	Sun, 29 Sep 2024 14:26:02 +0200 (CEST)
Date: Sun, 29 Sep 2024 14:26:02 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, robh <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	John Crispin <john@phrozen.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <251386789.117942.1727612762462.JavaMail.zimbra@nod.at>
In-Reply-To: <b43a7155f80995c3986893951c092291caf3a5f4.1727527457.git.daniel@makrotopia.org>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org> <b43a7155f80995c3986893951c092291caf3a5f4.1727527457.git.daniel@makrotopia.org>
Subject: Re: [PATCH RFC 2/2] mtd: ubi: add support for protecting critical
 volumes
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF130 (Linux)/8.8.12_GA_3809)
Thread-Topic: add support for protecting critical volumes
Thread-Index: FCmHecnztBfMlrKyZF8gLM/3GCQN9w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_052614_660560_C1E2AB56 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbmllbCBHb2xsZSIgPGRh
bmllbEBtYWtyb3RvcGlhLm9yZz4KPiBBbGxvdyB0aGUgYm9vdCBmaXJtd2FyZSB0byBkZWZpbmUg
dm9sdW1lcyB3aGljaCBhcmUgY3JpdGljYWwgZm9yIHRoZQo+IHN5c3RlbSB0byBib290LCBzdWNo
IGFzIHRoZSBib290bG9hZGVyIGl0c2VsZiBpZiBzdG9yZWQgaW5zaWRlIGEgVUJJCj4gdm9sdW1l
LiBQcm90ZWN0IGNyaXRpY2FsIHZvbHVtZXMgYnkgcHJldmVudGluZyB0aGUgdXNlciBmcm9tIHJl
bW92aW5nLAo+IHJlc2l6aW5nIG9yIHdyaXRpbmcgdG8gdGhlbSwgYW5kIGFsc28gcHJldmVudCB0
aGUgVUJJIGRldmljZSBmcm9tCj4gYmVpbmcgZGV0YWNoZWQgaWYgYSBjcml0aWNhbCB2b2x1bWUg
aXMgcHJlc2VudC4KCkkgYWdyZWUgd2l0aCB0aGUgZG91YnRzIHJhaXNlZCBpbiBwYXRjaCAxLzIs
IGlmIHVzZXJzcGFjZSBpcyBzbyBob3N0aWxlCnRvIGRlbGV0ZSBzeXN0ZW0gcGFydGl0aW9ucywg
dGhlcmUgaXMgbGl0dGxlIGhvcGUuCkJ1dCBJJ20gc3RpbGwgb3BlbiBmb3IgZGlzY3Vzc2lvbi4K
CldoYXQgSSB2ZXRvIGlzIHByZXZlbnRpbmcgZGV0YWNoLgpUaGlzIG1ha2VzIGEgY2xlYW4gdGVh
ciBkb3duIG9mIHRoZSBzeXN0ZW0gaW1wb3NzaWJsZS4KSXQgYmVjb21lcyBtb3JlIGFuZCBtb3Jl
IGNvbW1vbiB0aGF0IGFkdmFuY2VkIHVzZXJzcGFjZSBzaHV0cyBkb3duCmV2ZXJ5dGhpbmcgaXQg
c2V0dXAgZHVyaW5nIGJvb3QuIGUuZy4gd2hpbGUgcmVib290IHN3aXRjaGluZyBiYWNrCnRvIGFu
IGluaXRyYW1mcywgdW1vdW50aW5nIHJvb3QsIHNodXR0aW5nIGRvd24gYWxsIHN0b3JhZ2UsIGV0
Yy4uLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
