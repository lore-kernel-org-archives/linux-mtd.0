Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DD9CA5FA5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2026 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxLGXVyeTsHcNtRUKZwa40sfKPQnZOfeKRZKb+is09Y=; b=B8Ck8jcUeaFCu8
	6XNNMoZcjj+DatW6HSYG10Fem8lZ6dsYWUF+RUqGFJZWW4auTg7VeNnPKpbqkzI2tgGQs4lGh757E
	FovxTtCqjly0vYvcyQXGdhIQELeeM44IhcjWmWKLHYMZml7bGK1h/xYNtrDNTVWsAC13ofAiRi8ID
	sOdouRTfnQ/nBe8yOEKv8oLysWBe++Yj1rlDpRwo1YY1KxzM0dSDMW3nwB03E5j8Bz+4WFuXUXoue
	A7N6GrR4NtVO3O2L8WhTUaBzkR43MqzwAt5hgKeGHQ9V+CqFufZ7PE0RYto9/5XipwYR3BjUCn9/8
	LB1LOB2o027uMtoqUncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBChg-00000000p23-1ilw;
	Mon, 28 Sep 2026 14:51:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBChd-00000000p1Y-3Lan
	for linux-mtd@bombadil.infradead.org;
	Mon, 28 Sep 2026 14:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FyexpH87LgklUhqlR9v+v+IvjXLmick6WliVpt2wPHY=; b=B7j417b/uECBAAdML13wUfjWzT
	zRV8F2zXyiZ1SGzLvnuoeq4Q5DBydm60XqKqpsZYF7NBoWhJiFX/ct/RlSlshdfmHa3x4DKpPuiKm
	y45mBC082MdNn4IvJq3kPDFIip5JxOHJ3lOsEnL6prBM0EVqovlKREojh0gHCtSvwlYd2ZSC886cL
	j6hhhICHD6Tcfad80OJ3RLmFd+8/XLquoL+I9JGYsG+sfXgBMYcdReubWAHE4GqnYPgoIPIGuZa0c
	pNpjPb9OkjelTjp5oRvej0y1PmV7tk9ybGqYh2RkFEKr0QhIULIzbYBdUh+DiafpVxhpOABt1EZyA
	r5bGAw6g==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBChZ-00000001aem-3VwQ
	for linux-mtd@lists.infradead.org;
	Mon, 28 Sep 2026 14:51:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B04FE1A1038;
	Mon, 28 Sep 2026 14:51:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8279A601BD;
	Mon, 28 Sep 2026 14:51:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BF8A103290CC;
	Mon, 28 Sep 2026 16:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790607087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FyexpH87LgklUhqlR9v+v+IvjXLmick6WliVpt2wPHY=;
	b=uCwQKrcF+jYXLjOWljmksk2AEK2VxbDoTqeI7cbS/XkcxeHqVornX6+RwcYcRhTp3ijaiW
	2AVzquiHnmoxvG4j4d72N9/7iVNOemKMbqHbIgtSBr16STKO93JzyKhQJJUt7U7ZrCPILN
	84dpJx8l4tfRpqCUp054DICPOmmNrG/+iZDADPF1nIvah00iClkHqocDBqliNP3Od8ypW/
	WDJuYQATI4YiRnpGeL9Z0q1E84KdT/cd++Gpb+ZQkvNQR3rPmC4yBsIEQ5ZmFwJHf75HTG
	9i2GKymL5HlyGSu60rDj5wkROdxAkP32FB7v50T13ZscW881ApWYH8pqwKgVPQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Michael Walle <mwalle@kernel.org>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Steam Lin <STLin2@winbond.com>,  Santhosh Kumar K
 <s-k6@ti.com>
Subject: Re: [PATCH 0/4] spi: spi-mem/mtd: spinand: Prevent SPI NAND
 continuous reads on am65/am62
In-Reply-To: <878qa7dzke.fsf@bootlin.com> (Miquel Raynal's message of "Tue, 28
	Apr 2026 14:44:33 +0200")
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
	<878qa7dzke.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 28 Sep 2026 16:51:21 +0200
Message-ID: <87mrt177km.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_155134_015535_F4323F66 
X-CRM114-Status: GOOD (  14.94  )
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

SGVsbG8gTWFyaywKCk9uIDI4LzA0LzIwMjYgYXQgMTQ6NDQ6MzMgKzAyLCBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gT24gMjYvMDMvMjAyNiBhdCAx
Nzo0NzoxNCArMDEsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdy
b3RlOgo+Cj4+IFRJIGVycmF0YSBpMjM1MSBleHBsYWlucyB0aGVyZSBpcyBhIHByb2JsZW0gd2l0
aCBDUyBoYW5kbGluZywgU1BJIE5PUgo+PiBhcmUgaW1tdW5lIHRvIHRoZSBwcm9ibGVtLCBidXQg
dGhlIENTIGJlaW5nIGRlYXNzZXJ0ZWQgc3B1cmlvdXNseSB3aGVuCj4+IHRoZXJlIGlzIERNQSBh
cmJpdHJhdGlvbiBvbiBsb25nIGFjY2Vzc2VzIChldmVyeSAxMDIzIGJ5dGVzKSwgU1BJIE5BTkQK
Pj4gY29udGludW91cyByZWFkcyBjYW5ub3QgYmUgbGV2ZXJhZ2VkLgo+Pgo+PiBMaW5rOiBodHRw
czovL3d3dy50aS5jb20vbGl0L2VyL3Nwcno1NDRjL3Nwcno1NDRjLnBkZgo+Pgo+PiBJIGNyZWF0
ZWQgYSAyLXBhZ2UgcmVhZCBzZXR1cCBmb3IgdGVzdGluZyBhbGwgdmFyaWFudHMgYXZhaWxhYmxl
IG9uIGEKPj4gVzM1TiBjaGlwIHdpcmVkIHRvIHRoaXMgY29udHJvbGxlci4gSSByZWxpYWJseSBv
YnNlcnZlZCBhbGwgdmFyaWFudHMgdG8KPj4gYWx3YXlzIChpbiBteSB0ZXN0cykgcmVwb3J0IGNv
cnJlY3QgZGF0YSwgZXhjZXB0IHRoZSA4RC04RC04RAo+PiB2YXJpYW50ICp3aGVuIHNldHRpbmcg
YW4gZXh0ZW5kZWQgbnVtYmVyIG9mIGR1bW15IGN5Y2xlcyogKD49IDEyLCBzbyAyNAo+PiBkdW1t
eSBieXRlcykuIEluIHRoaXMgY2FzZSwgSSBnb3QgdGhlIGZpcnN0IDYxNDQgYnl0ZXMgY29ycmVj
dCAob3Zlcgo+PiA4MTkyKSwgdGhlIHJlc3QgYmVpbmcgZnVsbCBvZiBvbmVzICgweEZGKSwgaW5k
aWNhdGluZyB0aGUgQ1MgaGFzIGxpa2VseQo+PiBiZWVuIGRlYXNzZXJ0ZWQgdGhlcmUuIFRoaXMg
aXMgbm90IGV4YWN0bHkgNiB4IDEwMjMgYnl0ZXMgKD8pLCBidXQKPj4gY2xvc2UuCj4+Cj4+IFRo
aXMgc2VyaWVzIHNoYWxsIGJlIGFwcGxpZWQgb24gdG9wIG9mIHRoZSBTUEkgTkFORCBjb250aW51
b3VzIHJlYWQKPj4gc2VyaWVzIHRoYXQgSSBhbSBhbHNvIGNhcnJ5aW5nLCBidXQgaWRlYWxseSBu
b3QgdG9vIGZhciBpbiB0aGUgZnV0dXJlCj4+IGJlY2F1c2UgdGhlcmUgYXJlIFdpbmJvbmQgKGNv
bnRpbnVvdXMgcmVhZCBjYXBhYmxlKSBOQU5EIGNoaXBzIG1vdW50ZWQKPj4gb24gVEkgcGxhdGZv
cm1zIEFNNjIgYmFzZWQgd2hpY2ggY291bGQgbWFrZSB1c2Ugb2YgdGhhdCBuZXcgZmVhdHVyZSBh
bmQKPj4gZXhwb3NlIHRoZSBpc3N1ZSBkZXNjcmliZWQgYWJvdmUuCj4KPiBBcHBsaWVkIHRvIG5h
bmQvbmV4dCAoZXhjZXB0IHRoZSBzcGkgcGF0Y2gpLgoKSXQgc2VlbXMgbGlrZSB0aGUgc3BpIGJp
dHMgaGF2ZSBub3QgYmVlbiBhcHBsaWVkLCBjYW4geW91IGNoZWNrIGlmIHlvdQpjYW4gc3RpbGwg
YXBwbHkgdGhlbT8gV2l0aG91dCB0aGVzZSwgcGVvcGxlIHVzaW5nIHRoaXMgY29udHJvbGxlciB3
aXRoCmNvbnRpbnVvdXMgcmVhZCBjYXBhYmxlIGRldmljZXMgbWF5IG9ic2VydmUgc3B1cmlvdXMg
aXNzdWVzIGhhcmQgdG8KZGVidWcgKGR1ZSB0byB0aGUgQ1MgcG9zc2libHkgbm90IGJlaW5nIGtl
cHQgYXNzZXJ0ZWQgZHVyaW5nIGxvbmcgcmVhZHMsCmxlYWRpbmcgdG8gdGhlIGNvbnRpbnVvdXMg
cmVhZCBiZWluZyBjYW5jZWxsZWQgYnkgdGhlIFNQSSBOQU5EKS4KClRoYW5rcywKTWlxdcOobAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
