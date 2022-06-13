Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0368ACCA47C
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jun 2022 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rk1095jg+I8uq5VOzMSoKgEpVZfpB7ZpcDSHDcXnQZk=; b=m90O7VW5/r7W87
	HTVWCDOpEgYy2dA4xB/VkHSfNkGLs5naM5H44kPFdA/g/KKAiqFpnc4PSbdTlad8wQFhQyPLu4dZu
	Z9i4jWkpbVty94M0CSTBKF8mPypf3eYZD7CLMmnhrzav8eszYFSPjVOptUCZjWUi/KxkC7cKRnJhc
	QnGkV8ORCoKDeWVM834T4FneMFvK/csPq2B/p+iMHO4ab+DcXCog7f13U9v9VIhi0G8O9gkII5V+h
	wztH2t80vaFAQ2pZg4HBT4JTo6Z7jvhnPuEHUFtRRCUrP86/fDAqz75S0pU5Ltz7lUzeGDr2lHPML
	9QaC9bXtLtE3s2cHKxZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kjO-0045sF-KO; Mon, 13 Jun 2022 14:07:50 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kjL-0045na-CB
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2022 14:07:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 156C6C000A;
	Mon, 13 Jun 2022 14:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655129261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YDHwrfjPiDwXZ1gI1j2yd0eJAASsdMDGuK7XWL7EtpA=;
	b=jFf+k4HI7xQ1XpTu7OiMsh7Y9rF55nJZinRiazNxBjbSQ+3Mz9rbIOB+UM4qOG+U4vvpcX
	jHLrZewJ/j5lrSw4xovmKjpnUpRN8Ps8sKljTqwNUtL8s+CtHUa5Qqx/AM551lluGN1JB5
	+obzBzlW6gqrnRGXSz1vGuq47VZIVJ/+Fy4Cxcxtc7eR8Sqn93ZidVLLCa/QqXT7SSvWG1
	4S+ceC1uDThFzSFhK5uiUOqDPWLlc6+64S3fk5e3yfsySHXEQhUO4AQhHTVqS2ZUGADTAe
	acK7Kfw7yFUSl2pE2PkuTp+E60zRrh0DKWu0wL6clCuQHG8A1PeTpaO9GqHlLg==
Date: Mon, 13 Jun 2022 16:07:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 kernel@pengutronix.de
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix setting busy timeout setting
Message-ID: <20220613160738.1b833bac@xps-13>
In-Reply-To: <20220613113030.1622723-1-s.hauer@pengutronix.de>
References: <20220613113030.1622723-1-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_070747_611445_85888CDC 
X-CRM114-Status: GOOD (  19.03  )
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

SGkgU2FzY2hhLAoKcy5oYXVlckBwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBNb24sIDEzIEp1biAy
MDIyIDEzOjMwOjMwICswMjAwOgoKPiBUaGUgREVWSUNFX0JVU1lfVElNRU9VVCB2YWx1ZSBpcyBk
ZXNjcmliZWQgaW4gdGhlIFJlZmVyZW5jZSBNYW51YWwgYXM6Cj4gCj4gfCBUaW1lb3V0IHdhaXRp
bmcgZm9yIE5BTkQgUmVhZHkvQnVzeSBvciBBVEEgSVJRLiBVc2VkIGluIFdBSVRfRk9SX1JFQURZ
Cj4gfCBtb2RlLiBUaGlzIHZhbHVlIGlzIHRoZSBudW1iZXIgb2YgR1BNSV9DTEsgY3ljbGVzIG11
bHRpcGxpZWQgYnkgNDA5Ni4KPiAKPiBTbyBpbnN0ZWFkIG9mIG11bHRpcGx5aW5nIHRoZSB2YWx1
ZSBpbiBjeWNsZXMgd2l0aCA0MDk2LCB3ZSBoYXZlIHRvCj4gZGl2aWRlIGl0IGJ5IHRoYXQgdmFs
dWUuIFVzZSBESVZfUk9VTkRfVVAgdG8gbWFrZSBzdXJlIHdlIGFyZSBvbiB0aGUKPiBzYWZlIHNp
ZGUsIGVzcGVjaWFsbHkgd2hlbiB0aGUgY2FsY3VsYXRlZCB2YWx1ZSBpbiBjeWNsZXMgaXMgc21h
bGxlcgo+IHRoYW4gNDA5NiBhcyB0eXBpY2FsbHkgdGhlIGNhc2UuCj4gCj4gVGhpcyBidWcgbGlr
ZWx5IG5ldmVyIHRyaWdnZXJlZCBiZWNhdXNlIGFueSB0aW1lb3V0ICE9IDAgdXN1YWxseSB3aWxs
Cj4gZG8uIEluIG15IGNhc2UgdGhlIGJ1c3kgdGltZW91dCBpbiBjeWNsZXMgd2FzIG9yaWdpbmFs
bHkgY2FsY3VsYXRlZCBhcwo+IDI0MDgsIHdoaWNoIG11bHRpcGxpZWQgd2l0aCA0MDk2IGlzIDB4
OTY4MDAwLiBUaGUgbG93ZXIgMTYgYml0cyB3ZXJlCj4gdGFrZW4gZm9yIHRoZSAxNiBiaXQgd2lk
ZSByZWdpc3RlciBmaWVsZCwgc28gdGhlIHJlZ2lzdGVyIHZhbHVlIHdhcwo+IDB4ODAwMC4gV2l0
aCAyOTcwYmY1YTMyZjAgKCJtdGQ6IHJhd25hbmQ6IGdwbWk6IGZpeCBjb250cm9sbGVyIHRpbWlu
Z3MKPiBzZXR0aW5nIikgaG93ZXZlciB0aGUgdmFsdWUgaW4gY3ljbGVzIGJlY2FtZSAyMzg0LCB3
aGljaCBtdWx0aXBsaWVkCj4gd2l0aCA0MDk2IGlzIDB4OTUwMDAwLiBUaGUgbG93ZXIgMTYgYml0
IGFyZSAweDAgbm93IHJlc3VsdGluZyBpbiBhbgo+IGludGVybWVkaWF0ZSB0aW1lb3V0IHdoZW4g
cmVhZGluZyBmcm9tIE5BTkQuCj4gCj4gRml4ZXM6IGIxMjA2MTIyMDY5YWEgKCJtdGQ6IHJhd25h
bmQ6IGdwbWk6IHVzZSBjb3JlIHRpbWluZ3MgaW5zdGVhZCBvZiBhbiBlbXBpcmljYWwgZGVyaXZh
dGlvbiIpCj4gU2lnbmVkLW9mZi1ieTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4
LmRlPgoKU2hvdWxkbid0IHdlIGFkZCBhIENjOiBzdGFibGUgaGVyZT8KCj4gLS0tCj4gIGRyaXZl
cnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuYwo+IGluZGV4IDBiNjhkMDU4NDZlMTguLjg4OWU0
MDMyOTk1NjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dw
bWktbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFu
ZC5jCj4gQEAgLTg5MCw3ICs4OTAsNyBAQCBzdGF0aWMgaW50IGdwbWlfbmZjX2NvbXB1dGVfdGlt
aW5ncyhzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMsCj4gIAlody0+dGltaW5nMCA9IEJGX0dQ
TUlfVElNSU5HMF9BRERSRVNTX1NFVFVQKGFkZHJfc2V0dXBfY3ljbGVzKSB8Cj4gIAkJICAgICAg
QkZfR1BNSV9USU1JTkcwX0RBVEFfSE9MRChkYXRhX2hvbGRfY3ljbGVzKSB8Cj4gIAkJICAgICAg
QkZfR1BNSV9USU1JTkcwX0RBVEFfU0VUVVAoZGF0YV9zZXR1cF9jeWNsZXMpOwo+IC0JaHctPnRp
bWluZzEgPSBCRl9HUE1JX1RJTUlORzFfQlVTWV9USU1FT1VUKGJ1c3lfdGltZW91dF9jeWNsZXMg
KiA0MDk2KTsKPiArCWh3LT50aW1pbmcxID0gQkZfR1BNSV9USU1JTkcxX0JVU1lfVElNRU9VVChE
SVZfUk9VTkRfVVAoYnVzeV90aW1lb3V0X2N5Y2xlcywgNDA5NikpOwo+ICAKPiAgCS8qCj4gIAkg
KiBEZXJpdmUgTkZDIGlkZWFsIGRlbGF5IGZyb20gezN9OgoKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
