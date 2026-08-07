Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6AFC5AC7A
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6WV2Btq8CaJ4tg6GbLaqdQAIU7TJ9CPbSjMriEkI70=; b=JwFjK3zewoiUgD
	5rp+6/g6v6OwsQX95BMFBA+wDAkE0Ey1nkYoe6GjvdS4MEcMlKyQt/9vh9L3DzuN0BE2dFixGE/gf
	9P/yjRu8arrZr4dIcyG7Hx3xqtNXk/ZNs64aCThk/e6r8PR+XenjK3Rx5jWGXaHr+jg9EuRMC7Gj5
	mmoQSDfLIXrC2Zg7atVNytxVvqVNumNiXp54BES/evMdf3q+maSN4bLk7hdVQaxtogqnZ/q3iVrhn
	37vKaXhEvXRQPFJpSvlPIhkMcxk/deo2rBZ6npl8/w8RRWtfXzL21gjAXHQ1l1b5NHjtzpGtAep8P
	9hlq4DoXdM/faicCMIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKyP-00000008BEj-3274;
	Fri, 07 Aug 2026 13:50:57 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKyL-00000008BD1-3Wuk
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 13:50:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CC0EE4E4113A;
	Fri,  7 Aug 2026 13:50:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F2AF603F0;
	Fri,  7 Aug 2026 13:50:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3410411C3792D;
	Fri,  7 Aug 2026 15:50:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786110645; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MghTY2uUYmWnXdLFdMwje8FbaW6rcXme06jOy4Jc9tk=;
	b=SSNZam8jBboxS+iOkaGHgKSks4KA6aIbV3qZLv9nV3TneNpyLn/Le56G3UihlNTBbudM06
	Q7ONQ9rcZXb3urfe7d3qAOUAwDett+o5yUADTGDwMzEtIj29InXEkS5JOfXlbbdXT6qpKD
	a+n6aHSBPsA+KP1T4I6PLtplsmu+M8S96DgKfjWmMbuGneUQqBwTGP+4RvNwF6NC70GN0H
	oZYTKOBAmWEjYC1fRCwmE6Nt+3BfZd8+f37QYrFUZB2agSDWJQq28KwGginByVT/1DmpWM
	/pSutwRIvE0nfqkfB+Fjjrv0AA311X2nGa5VcPxNkgUXjrmBIo853YpNzV1vyw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: richard@nod.at,  vigneshr@ti.com,  tudor.ambarus@linaro.org,
  s-k6@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  varadarajan.narayanan@oss.qualcomm.com
Subject: Re: [PATCH 2/2] mtd: spinand: winbond: add support for W25N01KW and
 W25N02LW
In-Reply-To: <20260807064339.1632249-3-md.alam@oss.qualcomm.com> (Md Sadre
	Alam's message of "Fri, 7 Aug 2026 12:13:39 +0530")
References: <20260807064339.1632249-1-md.alam@oss.qualcomm.com>
	<20260807064339.1632249-3-md.alam@oss.qualcomm.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 15:50:42 +0200
Message-ID: <875x1mca4t.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_065054_234942_C08B89F9 
X-CRM114-Status: UNSURE (   5.18  )
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

SGkgU2FkcmUsCgpPbiAwNy8wOC8yMDI2IGF0IDEyOjEzOjM5ICswNTMwLCBNZCBTYWRyZSBBbGFt
IDxtZC5hbGFtQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgoKPiBBZGQgc3VwcG9ydCBmb3IgdGhl
IFdpbmJvbmQgVzI1TjAxS1cgYW5kIFcyNU4wMkxXIFNQSS1OQU5ECj4gZGV2aWNlcy4KPgo+IFRo
ZSBXMjVOMDFLVyBzaGFyZXMgdGhlIHNhbWUgZ2VvbWV0cnksIE9PQiBsYXlvdXQsIGFuZCBFQ0MK
PiBzdGF0dXMgaGFuZGxpbmcgYXMgdGhlIGV4aXN0aW5nIFcyNU4wMUtWLCB3aGlsZSB0aGUgVzI1
TjAyTFcKPiBtYXRjaGVzIHRoZSBleGlzdGluZyBXMjVOMDJLVi9XMjVOMDJLVyBkZXZpY2VzIGFu
ZCByZXVzZXMKPiB0aGVpciBPT0IgbGF5b3V0IGFuZCBFQ0Mgc3RhdHVzIGNhbGxiYWNrLgo+Cj4g
U2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8bWQuYWxhbUBvc3MucXVhbGNvbW0uY29tPgo+
IC0tLQoKU2FzaGlrbyByYWlzZXMgYSBwb2ludDoKCi0gW01lZGl1bV0gVGhlIGRldmljZSBJRCBg
MHgxMiwgMHgyMmAgZm9yIFcyNU4wMkxXIGJyZWFrcyB0aGUKZXN0YWJsaXNoZWQgcGF0dGVybiBm
b3IgV2luYm9uZCAxLjhWIFNQSSBOQU5EIGRldmljZXMgYW5kIGlzIGhpZ2hseQpsaWtlbHkgYSB0
eXBvIGZvciBgMHhiMiwgMHgyMmAuCgpDYW4geW91IHBsZWFzZSBjaGVjaz8KClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
