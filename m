Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1920FC4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Dec 2022 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1Ydgpkogq02T9k+0gzi5HG8MjafZzt04DJAjbIjpBc=; b=uADRMkXlnYnjAl
	YwJmDDHQWbiXmtZtkMTlZPiCHkz58HD0UFxi735UIxiDOfiofq9Szx/VQLf9Bo4kHhob3AK0+H/KB
	4tzgSRaxNdjrapWlWWhZGl40CuMwOrvHkWeqQbZXWjcO7IWkgEggO9tUesOC0zpy7fnOfxF9Bv68I
	zpSWFdx7njTc8fuH0SbHAik5NV4TRhhxqCXoYy+WT7D4N6NRk4l140hhG4yrDgKMGi1XQjeCN7NbE
	5lRcA1YXb2wdhWxIZXUocRrufiAbFyMaSrhFSlXIZLYaFhtq7U9sEIZZneXfHO9sZOJwVfpFcAsxE
	NXcaKn2jG4Z0GG7JtUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBEsE-0099Z0-VP; Fri, 30 Dec 2022 12:52:35 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBElD-0094wH-GY
	for linux-mtd@lists.infradead.org; Fri, 30 Dec 2022 12:45:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9D898FF806;
	Fri, 30 Dec 2022 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672404310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HLWw/hSJZJa/2KIWUjKLrI7JPtEFnluoknqg1vyqjA=;
	b=jE7MjJnAU4ROFgwsh44z0DnELsemJx4w2jKwXVuv+9yJCrKLmREXc4XFqCjc+zI3D0qVoy
	7OHnC5wgVpjOV0ES9l6wWoi88LUGEl176C+zBYQWIGqkZeSN9vopP6W8gDzL3A83jn9dwp
	RN6FbQuyyCvgzNE8tLv3hITUQuunmzuGLvCcyr/8ap1k12c4RF7W0BdNa3w1YR+F63F+Ov
	3W3rBOdI6tl1pa1xlpKBFK1QzyI3KxBdFdfsEeoALdc8I6K5KSyxCfjMp+4D1tOd8vLpNb
	uCD4tOS0T6Zt9y8sLYRLu8im1AOKdg3N7Kojqt6MO5P7RrqVyBv+gxlG6k6+Rg==
Date: Fri, 30 Dec 2022 13:45:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: rawnand: hynix: Add support for
 H27UCG8T2FTR-BC MLC NAND
Message-ID: <20221230134507.719edeae@xps-13>
In-Reply-To: <20221229190906.6467-2-samuel@sholland.org>
References: <20221229190906.6467-1-samuel@sholland.org>
	<20221229190906.6467-2-samuel@sholland.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_044519_791530_148B83B1 
X-CRM114-Status: GOOD (  16.48  )
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

SGkgU2FtdWVsLAoKc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZSBvbiBUaHUsIDI5IERlYyAyMDIy
IDEzOjA5OjAzIC0wNjAwOgoKPiBIMjdVQ0c4VDJGVFItQkMgaXMgc2ltaWxhciB0byB0aGUgYWxy
ZWFkeS1zdXBwb3J0ZWQgSDI3VUNHOFQyRVRSLUJDLCBidXQKPiByZXBvcnRzIGEgZGlmZmVyZW50
IElELgoKQ2FuIHlvdSBwcm92aWRlIGEgZGF0YXNoZWV0IGZvciB0aGlzIHBhcnQ/IEkgYW0gc3Vy
cHJpc2VkIGJ5IHRoZSBwYWdlCnNpemUuIEluIGdlbmVyYWwgYW55d2F5LCBpdCdzIGJlc3QgdG8g
cHJvdmlkZSBhIGxpbmsgd2hlbiBhZGRpbmcKc3VwcG9ydCBmb3IgYSBuZXcgY29tcG9uZW50LgoK
QWxzbywgZm9yIHlvdXIgdHdvIHNlcmllcywgbm8gbmVlZCB0byByZXNlbmQgdGhpcyB0aW1lLCBi
dXQgcGxlYXNlIHVzZQpnaXQtZm9ybWF0LXBhdGNoIGFuZCBnaXQtc2VuZC1lbWFpbCB0byBjcmVh
dGUgeW91ciBzZXJpZXMsIHNvIHRoYXQgYWxsCnRoZSBwYXRjaGVzIGFyZSBhbnN3ZXJzIG9mIHRo
ZSBjb3ZlciBsZXR0ZXIuIEl0IGhlbHBzIGtlZXBpbmcgYWxsCnBhdGNoZXMgYW5kIGFuc3dlcnMg
aW4gdGhlIHNlcmllcyBwYWNrZWQgdG9nZXRoZXIuCgpUaGFua3MhCk1pcXXDqGwKCj4gU2lnbmVk
LW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+Cj4gLS0tCj4gCj4g
IGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaHluaXguYyB8IDQgKysrKwo+ICBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9uYW5kX2lkcy5jICAgfCA0ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9o
eW5peC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9oeW5peC5jCj4gaW5kZXggMGQ0ZDRi
YmZkZWNlLi44MzZmMTUyNjEyYWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bmFuZF9oeW5peC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9oeW5peC5jCj4g
QEAgLTcyMSw2ICs3MjEsMTAgQEAgc3RhdGljIGludCBoeW5peF9uYW5kX2luaXQoc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCkKPiAgCQkgICAgIHNpemVvZigiSDI3VUNHOFQyRVRSLUJDIikgLSAxKSkK
PiAgCQloMjd1Y2c4dDJldHJiY19pbml0KGNoaXApOwo+ICAKPiArCWlmICghc3RybmNtcCgiSDI3
VUNHOFQyRlRSLUJDIiwgY2hpcC0+cGFyYW1ldGVycy5tb2RlbCwKPiArCQkgICAgIHNpemVvZigi
SDI3VUNHOFQyRlRSLUJDIikgLSAxKSkKPiArCQloMjd1Y2c4dDJldHJiY19pbml0KGNoaXApOwo+
ICsKPiAgCXJldCA9IGh5bml4X25hbmRfcnJfaW5pdChjaGlwKTsKPiAgCWlmIChyZXQpCj4gIAkJ
aHluaXhfbmFuZF9jbGVhbnVwKGNoaXApOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX2lkcy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9pZHMuYwo+IGluZGV4
IGRhY2M1NTI5YjNkZi4uMTY3MTgzY2NiOWU5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfaWRzLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2lkcy5j
Cj4gQEAgLTU1LDYgKzU1LDEwIEBAIHN0cnVjdCBuYW5kX2ZsYXNoX2RldiBuYW5kX2ZsYXNoX2lk
c1tdID0gewo+ICAJCXsgLmlkID0gezB4YWQsIDB4ZGUsIDB4MTQsIDB4YTcsIDB4NDIsIDB4NGF9
IH0sCj4gIAkJICBTWl8xNkssIFNaXzhLLCBTWl80TSwgTkFORF9ORUVEX1NDUkFNQkxJTkcsIDYs
IDE2NjQsCj4gIAkJICBOQU5EX0VDQ19JTkZPKDQwLCBTWl8xSykgfSwKPiArCXsiSDI3VUNHOFQy
RlRSLUJDIDY0RyAzLjNWIDgtYml0IiwKPiArCQl7IC5pZCA9IHsweGFkLCAweGRlLCAweDE0LCAw
eGFiLCAweDQyLCAweDRhfSB9LAo+ICsJCSAgU1pfMTZLLCBTWl84SywgU1pfNE0sIE5BTkRfTkVF
RF9TQ1JBTUJMSU5HLCA2LCAxNjY0LAo+ICsJCSAgTkFORF9FQ0NfSU5GTyg0MCwgU1pfMUspIH0s
Cj4gIAl7IlRINThOVkcyUzNIQkFJNCA0RyAzLjNWIDgtYml0IiwKPiAgCQl7IC5pZCA9IHsweDk4
LCAweGRjLCAweDkxLCAweDE1LCAweDc2fSB9LAo+ICAJCSAgU1pfMkssIFNaXzUxMiwgU1pfMTI4
SywgMCwgNSwgMTI4LCBOQU5EX0VDQ19JTkZPKDgsIFNaXzUxMikgfSwKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
