Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EC3CCF9E3
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Nov 2025 08:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yH2/MWhjwEoCYdKCOm6lc2cfNx12PJn+lSZs10RbfY=; b=ygCFiWFzQfp7Q5
	pPouTUqAGa3sYRgsl2m4UrTdjR4W6EL+WvL+bgjWSspNKC0JesvUd2UH/9v6DXvBMdUybFgG/l26V
	5wqv/tcLsoyLltAFX5QqQn61NB2uNCrgDzPBIYVEHdmT6wWGmdAW8wWnpn4oeTgA6den1EKQR0iUl
	5gixLzFFoyrDk0K7jDSgIRgiNQxrgmARnRWcBZFW5JVZ3AVueYXbb8N4GphMIxSUyBvSLRWWprrA3
	t/ZMXaMkH8zleCbklyW1uQq8wC4qEByZjxMXWOP7vBuQO8pAgD0jcXOwtHbxD6VkVCDGicIBV5AsJ
	O+QCF99Os8015yFWoasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCpQ-0000000BTlh-0QzF;
	Tue, 04 Nov 2025 08:55:48 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCpM-0000000BTkY-1cOt;
	Tue, 04 Nov 2025 08:55:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F2BE14E414F0;
	Tue,  4 Nov 2025 08:55:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5D55606EF;
	Tue,  4 Nov 2025 08:55:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A65510B500FA;
	Tue,  4 Nov 2025 09:55:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762246541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mlAWkou6qZ3iOsHzXkX7xAGUG1QWZHnc2ewaAAkiHd4=;
	b=JqkqNBwRvXd/ssVGhp0S30K9fd4c6b+SIUnBcnbJ+229G0I00kLcS98UsyPT70CvczET+t
	fQ9I/rc8rCXAPvQ9A/6O82gimsSd4v0jJPO+UdBiYWQW16c/CWiwo8w9zSXZDdjenRRSaM
	yBHBmdcjVPHvWYEEicvsojfJeJo5z3q8czHQjJRV+kOjCNQmsqNLdftJ31Y+zDIM9F8Ae2
	Z1fhue6QSkHmpipjZC6gRNbm4zHC5kpSI74ZX2s5BDDGZLMMHGEcJ0z2gQTF809QdnmkPj
	7imYvsHSiu/thPGFQFS6fZX2dT4Ac5ewpOC5he4Ke1k4OLKy1l2z2sT768PFYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: richard@nod.at,  vigneshr@ti.com,  vz@mleia.com,
  piotr.wojtaszczyk@timesys.com,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: lpc32xx_slc: fix GPIO descriptor leak
In-Reply-To: <20251104014042.1389-1-vulab@iscas.ac.cn> (Haotian Zhang's
	message of "Tue, 4 Nov 2025 09:40:42 +0800")
References: <20251028094747.1089-1-vulab@iscas.ac.cn>
	<20251104014042.1389-1-vulab@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 04 Nov 2025 09:55:37 +0100
Message-ID: <87v7jq9nxy.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_005544_585212_8C3FCDF1 
X-CRM114-Status: UNSURE (   9.31  )
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

SGksCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9scGMzMnh4X3NsYy5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbHBjMzJ4eF9zbGMuYwo+IGluZGV4IGI1NGQ3NjU0N2ZmYi4u
M2NhMzBlN2RjZTMzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2xwYzMyeHhf
c2xjLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9scGMzMnh4X3NsYy5jCj4gQEAgLTg1
NCw3ICs4NTQsNyBAQCBzdGF0aWMgaW50IGxwYzMyeHhfbmFuZF9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICAJfQo+ICAKPiAgCS8qIFN0YXJ0IHdpdGggV1AgZGlzYWJsZWQs
IGlmIGF2YWlsYWJsZSAqLwo+IC0JaG9zdC0+d3BfZ3BpbyA9IGdwaW9kX2dldF9vcHRpb25hbCgm
cGRldi0+ZGV2LCBOVUxMLCBHUElPRF9PVVRfTE9XKTsKPiArCWhvc3QtPndwX2dwaW8gPSBkZXZt
X2dwaW9kX2dldF9vcHRpb25hbCgmcGRldi0+ZGV2LCBOVUxMLAo+ICAJR1BJT0RfT1VUX0xPVyk7
CgpQbGVhc2Ugc2VuZCBhbiB1cGRhdGUgb24gdG9wIHRoZSBwcmV2aW91cyBwYXRjaCB3aGljaCBJ
IGFscmVhZHkgYXBwbGllZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
