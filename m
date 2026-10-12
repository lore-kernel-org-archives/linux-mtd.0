Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9118CA9ED0
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oio+lLqHfd/x4AIPYfKc/JBnInl8l6O0o+gfU6gf6GI=; b=MqbU+BsTAtdE7S
	8IYtppqPDGxnEIWibrBBfoqppLzYqm/8mdXVq8ezQtVIPlovhSwvWqoZtxQ5nLxpovUInSlGiMaj2
	Rvgf00ftuINeY00HEUlIgOPUrhrG8GGZB+IOSVQEPSouDNzFQadXwOf5ZqmQRTVJrddZAcf9GgLh1
	46rLt1UnFbrgR42C5LcN4pLupXlfLSeG4URYanP2gCRp5pymdV/a9fXXQ5abbJ8bFgJbFqrbOMZgt
	Krt/eMRiP12YPtNFIZvPkoRuQiqWgx0miJ5msGMF3sgJ5q9MAhjmwUNrX4HQguMA2J61L6hlfPitg
	FS5dqEHlyvCu2nzY67Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKeC-0000000BDGP-2nIM;
	Mon, 12 Oct 2026 18:21:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKe6-0000000BDCG-0HfE
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 18:21:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7CA2D1A11E9;
	Mon, 12 Oct 2026 18:21:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5157A601A6;
	Mon, 12 Oct 2026 18:21:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 668D111D70C57;
	Mon, 12 Oct 2026 20:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791829263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RtoBieVdgz46Yu4sNoTwlnltzC8ycX7TlJ8qkNidGU0=;
	b=2I9hvHzO1QsGxWc9vfKn5l4iBIEX7BtmEGBNLcO3r9sB8KMcSJqxk9p+IEAyYFkWX4R9Zv
	W0rui9Qs69LkLuvzf2ZPQ97QGru4+HHQXjKYgYOiI030OfXEGsxjldZxKcorUCaMRh9u8h
	6k0EELqgbePlNjg8jOvJjBxGrddvSBIKNSHZXf9xF7IBJyfnyQaMWkrchexIvUHv9tZ/ms
	0PsAnZNEKvrbNTW29ugjbDTr1Pa4B2PW3Gm2HfHWg6oZE+cgJRgV2/j11dGDHEwrNcd4S8
	KXzdS5Bob8LJ12W4JlbFYkgtH5syT/Z2Kj8LpJkfkflUUys/D48Pq5XCbntWRw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: devicetree@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260926014802.87255-1-rosenp@gmail.com>
References: <20260926014802.87255-1-rosenp@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: mtd: convert IBM NDFC binding to YAML
Message-Id: <179182926132.590599.17670038456038372637.b4-ty@bootlin.com>
Date: Mon, 12 Oct 2026 20:21:01 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_112110_307477_43BC2666 
X-CRM114-Status: UNSURE (   6.99  )
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

T24gRnJpLCAyNSBTZXAgMjAyNiAxODo0ODowMiAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
VGhlIE5ERkMgTkFORCBmbGFzaCBjb250cm9sbGVyIHdhcyBvbmx5IGRlc2NyaWJlZCBpbiBhIGxl
Z2FjeSB0ZXh0IGZpbGUsCj4gc28gZHRic19jaGVjayByZXBvcnRlZCAiZmFpbGVkIHRvIG1hdGNo
IGFueSBzY2hlbWEgd2l0aCBjb21wYXRpYmxlOgo+IFsnaWJtLG5kZmMnXSIgZm9yIHRoZSBuZGZj
IG5vZGVzIG9mIHRoZSBibHVlc3RvbmUsIGNhbnlvbmxhbmRzLCBlaWdlciwKPiBnbGFjaWVyLCBz
ZXF1b2lhIGFuZCB3YXJwIGRldmljZSB0cmVlcy4KPiAKPiBDb252ZXJ0IHRoZSBiaW5kaW5nIHRv
IHRoZSBZQU1MIGZvcm1hdCBzbyB0aG9zZSBub2RlcyBtYXRjaCB0aGUgZ2VuZXJpYwo+IG5hbmQt
Y29udHJvbGxlci1sZWdhY3kgc2NoZW1hLiAgRGVzY3JpYmUgdGhlIG5vZGUncyByZWcsIGNjciBh
bmQKPiBiYW5rLXNldHRpbmdzIHByb3BlcnRpZXMsIGFsb25nIHdpdGggaXRzICJuYW5kIiBjaGlw
IG5vZGUgd2hpY2ggY2Fycmllcwo+IHRoZSBsZWdhY3kgcGFydGl0aW9uIGxheW91dC4KPiAKPiBb
Li4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIGR0LWJpbmRpbmdzOiBt
dGQ6IGNvbnZlcnQgSUJNIE5ERkMgYmluZGluZyB0byBZQU1MCiAgICAgIGNvbW1pdDogMGQxNjQ0
NTY2YTFjYWFmNzFjOGJmMmE2Njg5MTc2ZTYxNzQ5YTg1ZgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBh
dmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBS
IChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJk
cywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
