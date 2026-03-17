Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28674F3382A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9srZMTRjFEKOl4ZHoOgW01H9dY/AIl4eobVt0EZdWc=; b=xFHXhoNz+R+NSE
	7T1Steb0gEDRpTsYdRKT2MWeA+ExqF6ytZ8oHrAK9ywqIdZ5+hPdA1+44KXLGjCvF8c24g3kECtWw
	gMl8aiU8YrsngHhe8RgE3UBAB7HUy6e8H4LokswRFrs9dsqjYjz8nOVhCdsms6NGT07Y7DtjVgzRs
	7aXK5IB577HhBMMylO4u2ihPctPDbH0rXQ48lHdxbfZFE+rEkK3jC4YViAxqu27z9bxgwF0rYwUtf
	LVyyXiQhvA5MQOQoVzhi7Yn7GBGYiAzTIoIJ3dEeJ5w3f7S++keFA3DK92jsOR1TEO4alGJEyK7VR
	tEB6v+pAPd7BxSTrbceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QoD-00000005tlk-358F;
	Tue, 17 Mar 2026 09:33:53 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2QoA-00000005tkC-0cou
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 09:33:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C18E24E42629;
	Tue, 17 Mar 2026 09:33:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F7295FC9A;
	Tue, 17 Mar 2026 09:33:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD3F810450443;
	Tue, 17 Mar 2026 10:33:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773740025; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZH2Xz8ShbrJwPAntCFRQ4Yi2mvxVhWbaPLwCb64VsEE=;
	b=V4GSA3zuzKFVa9iObHPB6hI9VaYSqiyEmM2svhkMTmUT0pv+/8d11nB5Hsz0+Ry5oY2jJu
	EZz9YgqK+I5OD6O9+GjXBIuiVC8aH2zZCJ359/1br9p4AoLPqsKzoWyw8yfehUf3JWWSMe
	3+Ok6enp32jL0HRoIDCJcPDZDJGqD6rghLZoy0F1/9YqzKO6QEt9K35zqWVZ809lGlMyWU
	HH5/d2LwNDoNsHwLK8AZlBs3a1lNWYS1cOD+oGlWeCKgOCDZhxKvfrtpEvfGTc+ljYC64G
	9tscOTPAkPgZCn7HrulvR2JdpmSHXdeesQkbUwg/tg7Gf/19DIC72zKXAgDNSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Jakub Czapiga
 <czapiga@google.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Rename spi_nor_spimem_check_op()
In-Reply-To: <230c1e00-25c2-44f7-afa5-a8ccbcf145db@linaro.org> (Tudor
	Ambarus's message of "Tue, 10 Mar 2026 11:54:03 +0200")
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
	<20260108121430.1096844-2-miquel.raynal@bootlin.com>
	<230c1e00-25c2-44f7-afa5-a8ccbcf145db@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 17 Mar 2026 10:33:43 +0100
Message-ID: <87ms06er60.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_023350_392965_9AB1D8EE 
X-CRM114-Status: UNSURE (   7.64  )
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

Cj4+IC1zdGF0aWMgaW50IHNwaV9ub3Jfc3BpbWVtX2NoZWNrX29wKHN0cnVjdCBzcGlfbm9yICpu
b3IsCj4+IC0JCQkJICAgc3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+PiArc3RhdGljIGludCBzcGlf
bm9yX3NwaW1lbV9jaGVja19wYWdlX29wKHN0cnVjdCBzcGlfbm9yICpub3IsCj4+ICsJCQkJCXN0
cnVjdCBzcGlfbWVtX29wICpvcCkKPgo+IHBhZ2UgaXMgYSBiaXQgbWlzbGVhZGluZyBhcyBpdCBj
YW4gaW5kaWNhdGUgaXQncyB1c2VkIGp1c3QgZm9yIHBhZ2UKPiBwcm9ncmFtcy4gV2UgbmVlZCB0
byBmb2N1cyBvbiBvcGVyYXRpb25zIHRoYXQgbmVlZCBhZGRyZXNzIGJ5dGVzLAo+IHJlYWRzLCBw
cCwgcGFnZSBzY3J1YiwgZXJhc2UsIHdyaXRlL3JlYWQgYW55IHJlZ2lzdGVyLCBldGMuCgpUaGlz
IGhlbHBlciBpcyBvbmx5IHVzZWQgZm9yIHJlYWRzIGFuZCBwYWdlIHByb2dyYW1zLiBUaGUgcG9p
bnQgaXMKdG8gbm90IHVzZSBpdCB3aGVuIHJlYWRpbmcvd3JpdGluZyByZWdpc3RlcnMuCgpXaGF0
IGFib3V0IHNwaV9ub3Jfc3BpbWVtX2NoZWNrX2lvX29wKCkgPyBvciBfaW9yd19vcCgpID8KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
