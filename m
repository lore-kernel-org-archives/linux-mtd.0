Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E02D73E83
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 19:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7f2h3rmbfE/SWVpiJNqxs7C4Sq+Ogqwhui94KYnNKg=; b=g0H7JY2Ox7hp99
	ywJc/yRdzXc0V1GhXZezkSH+5a9LJ9QT5NtSSQgiv/LaHeRG6GU9G/ejRAlTJpmUZeJwE/aYP1pNQ
	uqBvYXCAcqaXvFwZZWJnNPh1C9GqNevvvUVDaKjwn37lThMMMVqy2nZ6P3LritaQqxc+3ZsY/vgiC
	ljcHOrImtuMLaZ3xPNPo2eI8I2jzyFj7BmMK0nOPH2mrgMGs6wdqAJ6mNjPcR7z7q+awgyrVwikl5
	JZ82ClaLKhqpRqrgKILZMb3/XKvTF59rsl3WDpP4egXTL6a/8x1qAemxMxC0kV0dp5tnC2msVc0/e
	2pqgtc1rfXER3M4zh+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXRO-00000000Xvy-1122;
	Thu, 29 Jan 2026 19:12:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXRK-00000000XvA-3xup
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 19:12:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1DBAB1A2B15;
	Thu, 29 Jan 2026 19:12:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7C7C60746;
	Thu, 29 Jan 2026 19:12:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6701119A8864;
	Thu, 29 Jan 2026 20:12:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769713944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JEfCuGt2IzldVCn1qq+qbdKWYimxSC/xj+l8UxFFeFo=;
	b=R3EuvFG7IpMKA2uHQ8B01Yumhwa/EcyU4I1e8c9N7VXOwGrv5pV4znr7Ai03WwhF1ftxuy
	dOLTRUpRq+g9w2YDwE01ioaa0gZtsH98khFp6nkUO7WF340Pez8xAvPMXd2Df45AUJ4g2O
	Ztmlk2Dp18Qq51LJ160S4CUfFdQpBQZDEs7HVWa/3wdA5nDWcG6TsjZt5wpAbV9AG4xdE4
	B/PMn34zwokTVHIcbGt8GdcTeY57DyPTqf0f7/aVA6uHTAxv9MJAeVQJ/kwsyX4tJw90Ae
	OX7Ai6JGHt9FsfW0cJ1vMDtDlWDIMQO7Q0+5BuYOmND8ckyHffVLmT096VM3aw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Weigang He <geoffreyhe2@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260123052608.668207-1-geoffreyhe2@gmail.com>
References: <20260123052608.668207-1-geoffreyhe2@gmail.com>
Subject: Re: [PATCH] mtd: parsers: ofpart: fix OF node refcount leak in
 parse_fixed_partitions()
Message-Id: <176971394344.256159.5142804306791843218.b4-ty@bootlin.com>
Date: Thu, 29 Jan 2026 20:12:23 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_111227_114912_8ACAE1E7 
X-CRM114-Status: UNSURE (   8.06  )
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

T24gRnJpLCAyMyBKYW4gMjAyNiAwNToyNjowOCArMDAwMCwgV2VpZ2FuZyBIZSB3cm90ZToKPiBv
Zl9nZXRfY2hpbGRfYnlfbmFtZSgpIHJldHVybnMgYSBub2RlIHBvaW50ZXIgd2l0aCByZWZjb3Vu
dCBpbmNyZW1lbnRlZCwKPiB3aGljaCBtdXN0IGJlIHJlbGVhc2VkIHdpdGggb2Zfbm9kZV9wdXQo
KSB3aGVuIGRvbmUuIEhvd2V2ZXIsIGluCj4gcGFyc2VfZml4ZWRfcGFydGl0aW9ucygpLCB3aGVu
IGRlZGljYXRlZCBpcyB0cnVlIChpLmUuLCBhICJwYXJ0aXRpb25zIgo+IHN1Ym5vZGUgd2FzIGZv
dW5kKSwgdGhlIG9mcGFydF9ub2RlIG9idGFpbmVkIGZyb20gb2ZfZ2V0X2NoaWxkX2J5X25hbWUo
KQo+IGlzIG5ldmVyIHJlbGVhc2VkIG9uIGFueSBjb2RlIHBhdGguCj4gCj4gQWRkIG9mX25vZGVf
cHV0KG9mcGFydF9ub2RlKSBjYWxscyBvbiBhbGwgZXhpdCBwYXRocyB3aGVuIGRlZGljYXRlZCBp
cwo+IHRydWUgdG8gZml4IHRoZSByZWZlcmVuY2UgY291bnQgbGVhay4KPiAKPiBbLi4uXQoKQXBw
bGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBwYXJzZXJzOiBvZnBhcnQ6IGZp
eCBPRiBub2RlIHJlZmNvdW50IGxlYWsgaW4gcGFyc2VfZml4ZWRfcGFydGl0aW9ucygpCiAgICAg
IGNvbW1pdDogN2NjZTgxZGY3ZDI2ZDQ0MTIzYmQ3NjIwNzE1YzgzNDlkOTY3OTNkNwoKUGF0Y2hl
KHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0
IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVu
KS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
