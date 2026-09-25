Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45485C98321
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mk42uyHEUuqfSQhYkgnREBgz5PEuGhB1Xvz2yOZ/j5w=; b=aVNdfwg7NxxUCi
	wzo2w133jSH8dLd0UglrQDuKz63UiMFKNYrVWsqsYc4MeqGIWrysVjVfddcgiSO9ylK0YsXavaeng
	vEJFZwLIte4k6vZS3zx86wFKBkaISYRdO5uzJsQu53soXeeMM8Rr8qd+kUqBiLSNFxvwne7a+73V6
	D5CTmyp1y4OjmZY+yfOBlfVO9GNU4D0vQ4+9rU3Z2X3QDxYlI+iTBXn4+agTFDRJ1AVnSLF+JIVIn
	DNq06mqMDdidn/EyTIVLkcf1nBlXmNGRkHUxp9LFcQ0LdUw6EQDpDxc6dETcTz2JKwxKME/WL94xB
	N3H8FY4BFS+5QwziCQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6un-0000000DZjQ-48A8;
	Fri, 25 Sep 2026 14:28:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6uk-0000000DZib-32xx
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 14:28:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B371C1A0FF7;
	Fri, 25 Sep 2026 14:28:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 864C76073B;
	Fri, 25 Sep 2026 14:28:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96832102F1E07;
	Fri, 25 Sep 2026 16:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/Szyux9DyHheIDnsjqi+HSqLOWfZhUZQhMC3M9IhzG4=;
	b=at6GKfc491Zf19q6ai9lcmvvmxHpbTSOHcrdNW201op1kfQgITsZemaHFXgjhN76jIQIqW
	lWIX3wxP+QjVHWJhniuDn29jP61lV5PO2bbaKU5Zvh2grnjjnPobEOE22MSJfcu573AJOq
	jvNzBzzVHJaZ/ECjTT5WZVFJuiOH7bRpD1L6OGh5DXcnepL88dEbNf4/dw3yTV0wHuk13l
	9ltCc1ewLGtPWJq13NMawijCavACFXqHPgNwmhW7O03ghnY09mJ3ITL3zmAhuS7KICTMvW
	TAsMBJtG1wPtpGoyIROmApgY5A1M5cxTVrsCpk4TamX98E5kKNo2UhzxQftUHA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Myeonghun Pak <mhun512@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260915010647.54099-1-mhun512@gmail.com>
References: <20260915010647.54099-1-mhun512@gmail.com>
Subject: Re: [PATCH] mtd: maps: pci: balance PCI enable on cleanup
Message-Id: <179034650740.1166139.2004199297491159166.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:28:27 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072838_904521_C3E417DF 
X-CRM114-Status: UNSURE (   6.30  )
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

T24gTW9uLCAxNCBTZXAgMjAyNiAyMTowNjo0NyAtMDQwMCwgTXllb25naHVuIFBhayB3cm90ZToK
PiBtdGRfcGNpX3Byb2JlKCkgbGVhdmVzIHRoZSBQQ0kgZGV2aWNlIGVuYWJsZWQgb24gbGF0ZXIg
cHJvYmUgZmFpbHVyZSBhbmQKPiBtdGRfcGNpX3JlbW92ZSgpIGRvZXMgbm90IGRpc2FibGUgaXQg
ZWl0aGVyLiBVc2UgcGNpbV9lbmFibGVfZGV2aWNlKCkgdG8KPiByZWxlYXNlIHRoZSBlbmFibGUg
cmVmZXJlbmNlIGFmdGVyIHRoZSBleGlzdGluZyBtYXAgYW5kIHJlZ2lvbiBjbGVhbnVwLgo+IAo+
IFRoZSBpbWJhbGFuY2UgaXMgYWxyZWFkeSBwcmVzZW50IGluIHRoZSBpbml0aWFsIEdpdCBpbXBv
cnQuCj4gCj4gVGhpcyBpc3N1ZSB3YXMgaWRlbnRpZmllZCBkdXJpbmcgb3VyIG9uZ29pbmcgc3Rh
dGljLWFuYWx5c2lzIHJlc2VhcmNoCj4gd2hpbGUgcmV2aWV3aW5nIGtlcm5lbCBjb2RlLgo+IAo+
IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IG1hcHM6IHBj
aTogYmFsYW5jZSBQQ0kgZW5hYmxlIG9uIGNsZWFudXAKICAgICAgY29tbWl0OiAzYmUxNmU1ZDQ5
OTBiZjk2MzA5YWM1YmEzNWNiMzY5YzYwMTViY2U3CgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWls
YWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHBy
b3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApN
aXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
