Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4058BC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2/GrcjWv3Q5o4f2K1rEcAna+2aQu6VZDdSUWoB2pWk=; b=2XTzij2T5ILwAV
	5dPi26vMg2GZGMp10hVytWmAcPv0T+QeW+POdbYqxtseNeIU8a2J9nRa2GmcxwCsBgq65UIKg4TUi
	Fi9PKm10dKx9K2f4cDuOP1Duj+WRcrDA2a5SDJdragcZUSTK4gJnaIkQ8pAAC3c5SQLgzvzEiPLOx
	/jYdfiYSWeXiYdCISio9ymj22/n0sNbB2t8PYBtGlcNpAOfuch9TQ5iWa+s58wEuEtbDMJxZGStKq
	E8Bo54hzBck5LsR0XAoJD5gO80orYupOHeb27OvCya7R4fv4/FWwPxZA3CFbE9F5cH/uDOhRnyKoj
	ZvHkfbAj9CjJD401OIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2UM-006Kb6-0s;
	Wed, 19 Jul 2023 08:24:50 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2UH-006KVn-0j
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 08:24:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 124F1E0002;
	Wed, 19 Jul 2023 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689755081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsnpzyS72dIuy3FSCQ5K5izLCdVfWbKWTbB/+AN5rrU=;
	b=jzwqRz2IF+NuGGWLP3Np2+tR7UMt+htdi3mSC8hfZaGVQ4VVZsHjpLZYLe+iGpw3f7MAqB
	3wQducze/UQZJEbKZxpjp7R2Va4vHYCBW4oBcOD6/MdIGQ4gh2MDihMfkuLds+5SrX3AHz
	k33RKiUw9Da2RRKzDG7d+CsiKlH0p1q5cpVPj+Fayksnfy2y5MVI4oe44eUQ6ujoXgYfnY
	GLuusF6BbuBjD4nq98NqU2QVHFBmUmzggwiUqviHBcd+BeRj4rawuBpdCb0Qy4HqiWP8xz
	eiyNzbZQPUYOHdjG76Ntr2QPHNfRsQuAReYkCq3pS0bCAtI9OoLWeE1vIg8wMQ==
Date: Wed, 19 Jul 2023 10:24:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kamal.dasu@broadcom.com>, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: propagate init error
 -EPROBE_DEFER up
Message-ID: <20230719102438.73f8f353@xps-13>
In-Reply-To: <20230718163331.9116-1-zajec5@gmail.com>
References: <20230718163331.9116-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_012445_424904_D500FEEA 
X-CRM114-Status: GOOD (  14.37  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDE4IEp1bCAyMDIzIDE4
OjMzOjMxICswMjAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gTVREIHN1YnN5c3RlbSBtYXkgcmV0dXJuIC1FUFJPQkVfREVGRVIgaWYgc29tZXRoaW5n
IGlzbid0IHJlYWR5IHlldC4KPiBJdCdzIGltcG9ydGFudCB0byBwYXNzIHRoYXQgZXJyb3IgdXAg
c28gZGV2aWNlIHdpbGwgZ2V0IHByb2JlZCBsYXRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZh
xYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQv
cmF3L2JyY21uYW5kL2JyY21uYW5kLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQv
YnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiBp
bmRleCAzOTY2MWUyM2Q3ZDQuLmNjYTJiMTUzYWUyNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+IEBAIC0zMjQ1LDYgKzMyNDUsOCBAQCBpbnQgYnJjbW5h
bmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgc3RydWN0IGJyY21uYW5kX3Nv
YyAqc29jKQo+ICAKPiAgCQkJcmV0ID0gYnJjbW5hbmRfaW5pdF9jcyhob3N0LCBOVUxMKTsKPiAg
CQkJaWYgKHJldCkgewo+ICsJCQkJaWYgKHJldCA9PSAtRVBST0JFX0RFRkVSKQo+ICsJCQkJCWdv
dG8gZXJyOwoKRG9uJ3Qgd2UgbmVlZCBhbiBvZl9ub2RlX3B1dChjaGlsZCkgaGVyZT8KCj4gIAkJ
CQlkZXZtX2tmcmVlKGRldiwgaG9zdCk7Cj4gIAkJCQljb250aW51ZTsgLyogVHJ5IGFsbCBjaGlw
LXNlbGVjdHMgKi8KPiAgCQkJfQoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
