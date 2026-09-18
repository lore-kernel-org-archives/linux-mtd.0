Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3644AC982DA
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2026 10:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjqhTVmV+drYNTBDewm8nm3gvFpby8c/+NxLtedmBfQ=; b=JSYfe/LBbGKzit
	pW1siAgNANb/h2KxA2u3IRC34Cp0qQbOLTbUvKQhQ7ocfhZ2Nt3UVY62doTLIWe7UTYyAOdrjbIAP
	auepo0x0+P74cSH1kd30ny0CQsm2Zs6KX8vQrum6XKjQT2EQeS07vphNrOJXZ+tq0sUykCAawc6IE
	TsLCp7QjK/BhfUsfJGD6/jcVolYQXCdGQ4D9u+h3ofZ8gA1jsBJgWO+PT6eCTM7zZ0HYCXqj5F5Sc
	rkS1efO0TtjuLUdeaJZvneivQ3DzV48frmevtEtNA6mBM/C+JUPt7bGmrktwavxd4tqt58yzjbFdX
	RKrWXkwleSz1ufEWv2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Vht-0000000E5HW-0E49;
	Fri, 18 Sep 2026 10:20:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Vhp-0000000E5HB-0HPB
	for linux-mtd@lists.infradead.org;
	Fri, 18 Sep 2026 10:20:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 980ABC58473;
	Fri, 18 Sep 2026 10:21:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF20060649;
	Fri, 18 Sep 2026 10:20:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7080510328E23;
	Fri, 18 Sep 2026 12:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789726825; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kiw4bCS/DNtngvJd66jWQP93qmw5mpVLvSTlaaIsy8A=;
	b=yQZSF1rG6LcE7VpbJdxCwtQbJiaKwsLUM5zU/maPYUE+wNqqAZWpBAbLTrUGCCpXOQihBf
	JI7jRlWIXq0u3XFFEzaJisos6I+9xzBQrJKfkE6GOFBg0v3nR7rZ/k10a7FQjWRHFp5lPi
	ilFD8yBh1WwgG05rdeCnQG2irjjIX7KV6oFFWyL2EQ+jFFNVSd3Ocmckf9raA9yFNeX47j
	sZ+2qA7qU00SNVRqnD1Wsws5sq2NMuUNWY4omqJnLDy6oh1Or12BIqQ+rQJZ0YeURSKfQ+
	CW7djiReD4lIisphXrX4O7rM4MC+HbmFb6brQqkl4oogOxO5rBhRkIEvfY6x5g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 16/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxPW-Q/N parts
In-Reply-To: <DLIBQKG04DIF.1FKAYOEZH6ZU0@kernel.org> (Michael Walle's message
	of "Fri, 18 Sep 2026 11:11:10 +0200")
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
	<20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-16-c1b20c39dd1f@bootlin.com>
	<DLIBQKG04DIF.1FKAYOEZH6ZU0@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 18 Sep 2026 12:20:20 +0200
Message-ID: <8733v6hndn.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_032033_310168_D7778368 
X-CRM114-Status: UNSURE (   8.15  )
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

Cj4+ICtzdGF0aWMgYm9vbCB3aW5ib25kX3B3X3dpdGhfZWNjX21hdGNoKGNvbnN0IHN0cnVjdCBz
cGlfbm9yICpub3IpCj4+ICt7Cj4+ICsJY29uc3Qgc3RydWN0IHNwaV9ub3JfaWQgKmlkID0gbm9y
LT5pbmZvLT5pZDsKPj4gKwo+PiArCWlmICghd2luYm9uZF9wd19tYXRjaChub3IpKQo+PiArCQly
ZXR1cm4gZmFsc2U7Cj4+ICsKPj4gKwkvKiBXMjVRMzNQVyBjaGlwcyAoaWRbMl0gPT0gMHgxNikg
ZG8gbm90IGhhdmUgYnVpbHQtaW4gRUNDIHN1cHBvcnQgKi8KPgo+IFRoZSBjb21taXQgbWVzc2Fn
ZSBtZW50aW9ucyBFQ0MgaXMgYXZhaWxhYmxlIGZvciA+PSAzMk1iaXQuIERvZXNuJ3QKPiBhbGln
biB3aXRoIHRoaXMgY29tbWVudC4gQWxzbyBhYm91dCB0aGUgOE1CaXQgYW5kIDE2TWJpdCBvbmVz
PwoKWW91J3JlIHJpZ2h0LCB0aGVyZSBhcmUgOCBhbmQgMTZNYiBjaGlwcyB3aGljaCBJIGhhdmVu
J3QgaW4gaGFuZHMgYW5kCnRoZXJlZm9yZSBmb3Jnb3QgYWJvdXQuIFRoZSByZXR1cm4gbGluZSBi
ZWxvdyBpcyBjb3JyZWN0LgoKPiAiVzI1UXh4UFcgY2hpcHMgc21hbGxlciB0aGFuIDMyTUJpdCBk
b2Vzbid0IHByb3ZpZGUgYnVpbHQtaW4gRUNDCj4gc3VwcG9ydCI/CgozMk1iIGNoaXBzIGRvIG5v
dCBoYXZlIEVDQyBjYXBhYmlsaXR5IGVpdGhlciwgc28gbWF5YmU6CgovKiBXMjVReHhQVyBkZW5z
aXRpZXMgPD0gMzIgTWJpdCAoaWRbMl0gPD0gMHgxNikgZG8gbm90IGhhdmUgYnVpbHQtaW4gRUND
IHN1cHBvcnQgKi8KCj4gSWYgeW91IGxpa2UgSSBjb3VsZCByZXdyaXRlIGl0IGFzIEknbGwgYXBw
bHkgaXQuIFRoZSByZXN0IG9mIHRoaXMKPiBzZXJpZXMgbG9va3MgZ29vZC4KClllcywgdGhhbmsg
eW91IQoKPgo+PiArCXJldHVybiBpZC0+bGVuID09IDMgJiYgaWQtPmJ5dGVzWzJdID49IDB4MTc7
Cj4KPiBUaGVuIHRoaXMgbWFrZXMgbW9yZSBzZW5zZS4KPgo+IC1taWNoYWVsCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
