Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05EFC531C7
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RwZgcKvulpmFcSCNIiqP+FdGr1baSHMbxjfwcNB2fQg=; b=XG9M5+bxZo1zD0JJxjABBSrJ6g
	nf2r9U1I/l4woukPCGKyX/GO45fFMZddhPICUKTOUaf3eGY4zYxmxxx1ou5DmAeHNOe/yA1+sCfGU
	+ISOofPVzirrdXl7O1IXioQ0FUqmMjLLH3M4t8eOhGjYvPRKKTjij8/wCiiMonj2q5YCiI9y67Ajz
	7XBXpI8jODL61kNcUUGxeAVMLIvz1WOpA9pNnTHBr6SL8rjmLLn72A499JjgY62WnJbA5FRuFOGx4
	9q6sZ/Eeuv8Nz48JuaimI9F1fCkHPQOdu+mmDTt44z0ZuCilTnELUOOvkp5K85e7jx7gwPECEItC6
	zsZVKHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpiZ-0000000DqRJ-1nPc;
	Thu, 23 Jul 2026 09:27:51 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpiW-0000000DqQp-2KTN
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 09:27:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 80FB02698C0;
	Thu, 23 Jul 2026 11:27:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id LIOUXZx6FAXc; Thu, 23 Jul 2026 11:27:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1CEF52698C1;
	Thu, 23 Jul 2026 11:27:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0LIGdiuIBVLA; Thu, 23 Jul 2026 11:27:45 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id F083D2698C0;
	Thu, 23 Jul 2026 11:27:44 +0200 (CEST)
Date: Thu, 23 Jul 2026 11:27:44 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <669411046.7135.1784798864843.JavaMail.zimbra@nod.at>
In-Reply-To: <20260723091728.1075673-1-thomas.petazzoni@bootlin.com>
References: <20260723091728.1075673-1-thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH mtd-www] doc/ubi.xml: clarify from the start that block
 device on UBI is read-only
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF152 (Linux)/8.8.12_GA_3809)
Thread-Topic: doc/ubi.xml: clarify from the start that block device on UBI is read-only
Thread-Index: R8a0wUbSLcZ7n6yRa41LV+eSKMhNuA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_022748_746773_8FA55E63 
X-CRM114-Status: UNSURE (   6.05  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlRob21hcyBQZXRhenpvbmki
IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IEluIHRoZSBpbnRyb2R1Y3Rpb24sIHRo
ZSBzZW50ZW5jZSB0aGF0IGludHJvZHVjZXMgdWJpYmxvY2sgbWlnaHQgbGV0Cj4gb25lIHRoaW5r
IHRoYXQgYW55IHJlYWQvd3JpdGUgYmxvY2sgZmlsZXN5c3RlbSBjYW4gYmUgdXNlZCBvbiB0b3Ag
b2YKPiBVQkksIHdoaWNoIGlzIHdyb25nLiBTbyBjbGFyaWZ5IGZyb20gdGhlIHN0YXJ0IHRoYXQg
dGhpcyBpcyByZWFkLW9ubHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KClRoZSBmaXJzdCBkcmFmdHMgb2YgdWJpYmxv
Y2sgaGF2ZSBiZWVuIHJlYWQvd3JpdGUsIG1heWJlIHRoYXQncyBhIGxlZnQgb3Zlci4KCkFja2Vk
LWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgoKVGhhbmtzLAovL3JpY2hh
cmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
