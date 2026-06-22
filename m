Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F79CDB46F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jun 2026 17:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6x75hicT1VN6DcCn1jVdp2RuAAfcXn6X8/EhXs4Am4=; b=q+SzL/AXDhWWH6
	rAhM/lK7GSUpgEl644HpaYvQvP4chws0eXknE8wmv6/6wSLnod/x1glMgxUoIZdw9baj8N4qwqM+G
	5nFH9Rl6bX29lnZd0zGD9de9QGo86BCYKPdg+WJRVwkqRXIsNURCpN26s+9++s39UcuYwYkxhq5en
	ouiuvI9OuiD7YTpDnV+duNoP5gP/BdBH5+Ycva29HExqiJ4+J7d31CRZeDOhwsfuag37/5p6yy9Y/
	zCqOri7wMwWMwp/sh+tm4iZA6QF68DliSYtOlQkBPjdbqTRmQFdEvnXamONQH9hnMmyEs7mM6boH4
	MX1NCUr2U1KZKK6D7v5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbiB7-00000005Ey5-1Oya;
	Mon, 22 Jun 2026 17:11:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbiB4-00000005ExR-0YX5
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jun 2026 17:11:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D525A4E40110;
	Mon, 22 Jun 2026 17:11:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97034601BB;
	Mon, 22 Jun 2026 17:11:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3BBD106C8985;
	Mon, 22 Jun 2026 19:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782148271; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=udTrftYgU70f6ssJVopKHx4JxPNGXTrbdi0A2JgqHSg=;
	b=xDPen3V6VcxSbnYKi5N2dl5YBkn0e6b6hVX638BooXj9h6cMpp2Ghmz3zAL1uUO7R+mYlT
	l8d0mTrdtSkRdXoSTRXfjRZa1WJ7v9ZE0rkcRhe/r3WUOPLjqSV5nHJj+WhzThg+gFs5am
	CH90OgjK0HueBEWaYQfLqJDSImtFO3caA65uC7XtzXgNOPI0hBmVAcJyWYp40s3nfaNEAk
	YTmB9fs+Yair2dPVIzkl3gwpeHlXWm2FujIBvh95WWWEGLmy12Atg+jI1u/3dvxLqNwhmF
	bEPgeoYKSWW8jEOSd7w02Mz8pYzjyZ+ngdodnoIXx0Qh/7xyIyxbmNiWWgA8/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Santhosh Kumar K <s-k6@ti.com>,  broonie@kernel.org,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  richard@nod.at,
  vigneshr@ti.com,  pratyush@kernel.org,  mwalle@kernel.org,
  takahiro.kuwano@infineon.com,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  praneeth@ti.com,  u-kumar1@ti.com,
  a-dutta@ti.com
Subject: Re: [PATCH v4 02/16] spi: dt-bindings: add
 spi-phy-pattern-partition property
In-Reply-To: <20260622-jasmine-mandrill-of-emphasis-eebb4c@quoll> (Krzysztof
	Kozlowski's message of "Mon, 22 Jun 2026 11:17:47 +0200")
References: <20260618073725.84733-1-s-k6@ti.com>
	<20260618073725.84733-3-s-k6@ti.com>
	<20260622-jasmine-mandrill-of-emphasis-eebb4c@quoll>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 22 Jun 2026 19:11:06 +0200
Message-ID: <87zf0m5wlx.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_101118_343682_697AB2B0 
X-CRM114-Status: GOOD (  10.62  )
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

SGVsbG8sCgo+PiArICBzcGktcGh5LXBhdHRlcm4tcGFydGl0aW9uOgo+Cj4gSXMgdGhpcyBzcGVj
aWZpYyB0byBTUEktYmFzZWQgTVREL05BTkQgb3IgcmF0aGVyIGJyb2FkZXIgLSBzcGVjaWZpYyB0
bwo+IE1URC9OQU5EIG1lbW9yaWVzLCByZWdhcmRsZXNzIG9mIGludGVyZmFjZT8gRmVlbHMgbGlr
ZSB0aGUgc2Vjb25kLCB0aHVzCj4gbWF5YmUgc2hvdWxkIGJlIHBsYWNlZCBpbnRvIHRoZSBOQU5E
IGJpbmRpbmdzLgo+Cj4gSWYgdGhlIGZpcnN0LCB0aGVuIGluIGJlbG93IGRlc2NyaXB0aW9uOgo+
Cj4gcy9QSFkvU1BJIFBIWS8gdG8gYmUgY2xlYXIgdGhhdCB0aGlzIGlzIGFib3V0IFNQSSwgbm90
IHRoZSBtZW1vcnkKPiBpdHNlbGYuCgpBcyBmYXIgYXMgSSBrbm93LCB0aGVyZSBpcyBubyByYXcg
TkFORCBjb250cm9sbGVyIHdpdGggc3VjaApjYXBhYmlsaXR5LiBJbiB0aGUgcmF3L3BhcmFsbGVs
IE5BTkQgd29ybGQsIHRpbWluZ3MgYXJlIHdlbGwgZGVmaW5lZCBieQp0aGUgT05GSSBzcGVjaWZp
Y2F0aW9uLCBpdCBjb3ZlcnMgYm90aCB0aGUgYnVzIHRpbWluZ3MgYW5kIHRoZSBtaW5pbWFsCnJl
cXVpcmVtZW50cyBmb3IgdGhlIGNoaXBzLiBUaGVyZSBpcyBhIG1ldGhvZCB0byBxdWVyeSB3aGF0
ICJ0aW1pbmcgbW9kZSIKdGhlIE5BTkQgY2hpcCBzdXBwb3J0cywgYW5kIHRoZW4gd2UgdHVuZSB0
aGUgY29udHJvbGxlciByZWdpc3RlcnMgdG8gZml0CnRoZSBoaWdoZXN0IHN1cHBvcnRlZCB0aW1p
bmdzIChjYXBwZWQgYnkgcG9zc2libGUgY29udHJvbGxlciBsaW1pdHMpLgoKSW4gdGhlIFNQSSB3
b3JsZCBpdCBpcyBkaWZmZXJlbnQuIE5vIHNwZWNpZmljIHRpbWluZyBoYXMgZXZlciBiZWVuCmds
b2JhbGx5IGRlZmluZWQsIHNvIGV2ZXJ5IG1hbnVmYWN0dXJlciBoYXMgaXRzIG93biBjYXBhYmls
aXRpZXMgd2hpY2gKYXJlIG5vdCBkaXNjb3ZlcmFibGUgZHluYW1pY2FsbHkuIFRoZSByb3V0aW5n
IGFsc28gd2VpZ2h0cyBhIGxvdC4gSQp3b3VsZCBzYXkgdGhhdCB3ZSBjYW4gc2FmZWx5IGtlZXAg
dGhpcyBwcm9wZXJ0eSBTUEkgcmVsYXRlZCwgYmVjYXVzZSBpdAppcyBhYm91dCB0aGUgU1BJIGJ1
cyBiZWluZyB1c2VkIHdpdGggb3B0aW1pemVkIHRpbWluZ3MsIHJhdGhlciB0aGFuIHNvbWUKa2lu
ZCBvZiBtZW1vcnkgc3BlY2lmaWMgZmVhdHVyZS4KClRoZSByZWFzb24gd2h5IHdlIG5lZWQgYSBw
cm9wZXJ0eSBpbiB0aG9zZSBtZW1vcmllcyBmb3IgdGhlIGZlYXR1cmUgdG8Kd29yaywgaXMgYmVj
YXVzZSB3ZSBuZWVkIHRvIG1ha2UgZGF0YSB0cmFuc2ZlcnMgd2l0aCBhIGtub3duIHBhdHRlcm4s
CnRodXMgcmVxdWlyaW5nIHRvIHJlYWQgdGhlIHBhdHRlcm4gZnJvbSB0aGUgaW50ZXJuYWwgYXJy
YXkgc29tZWhvdy4KClRoZXJlZm9yZSwgd2Ugc2hhbGwgaW5kZWVkIGdvIGZvciB0aGUgcy9QSFkv
U1BJIFBIWS8gbmFtaW5nIGluZGVlZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
