Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E06BC624D3
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zc4aMh/KMZleF+5OVABaZXi/sJ+1DI0A1iZxs13Wo38=; b=dULCLGXppGXB5q
	gR0hOrMt5dY/gPqocJPcbZqcsdo4gsZeyT/UJ4Y5+rTPzWiqLMOugxL/XomMIAOLVUvCOIBilshzf
	rdwDVXQUTy4bzT4B2uXdK0JLaUSHkLJBeWrCKUKvk5J5PPTmuNmoV2p5mOjEsPzGvPgbxwnx71wOZ
	gjnHxuqGRmmDZ2mAsU8RmXZYJ9TYtZEbY3/ysxdXMPRsHSNhVJgOe5V+l2nZ1yGllg3vBYDcblW83
	tIMPXcT0ov8KPGAhNWbo2gZIApKu3Mw3AgpCMJ27FigSZ6wwX2dnGeYcNX0zcYENB9K7SU8Gg3kOT
	RLKzT46ihtkVum5jxJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2V7V-00000002Q6I-2BFp;
	Fri, 04 Sep 2026 14:42:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2V7S-00000002Q5C-1Jg6;
	Fri, 04 Sep 2026 14:42:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4DD134E414FE;
	Fri,  4 Sep 2026 14:42:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D39F6057F;
	Fri,  4 Sep 2026 14:42:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B48F11C7ADF4;
	Fri,  4 Sep 2026 16:42:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788532934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q4Kqmm3PYSPz3CtKuYBs2ctj9qsb5M0Rg3AohwR0sUo=;
	b=TU6DGzitYMj6dcYt7KxlJB+5/13t4QDtzUUyJZzTZrVda7JiTrx+TThy+oCxzh1l8k4ube
	qRcAS2JMtG4Ct9CvEGiGjXFl7mBP26Pyble1JOHgSvT1sWBUOIHwwcbmgDxUxDFnIRSEQM
	9QkWUN9JWtWVXisBvpRZVu5QpOBOPW2wb6L6hclQik+A+lst2csMJMH4OLR+wLTSHxc3ot
	khfqe4ftDs9mMqzn1QDfAyOBWObzWVoCCwrh59/HAOafZE8vqN+xOuUngJGJi8lf2yNFo4
	wNZ4V5voeVB2ZMN0ikD8FDDDwthMwNophBDst+deZu268hiVdqxkOvgYPcyBAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
In-Reply-To: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
	(James Hilliard's message of "Mon, 10 Aug 2026 17:04:50 -0600")
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
	<20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 16:42:09 +0200
Message-ID: <87se3p13jy.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_074218_512835_7EC4B7C4 
X-CRM114-Status: GOOD (  11.54  )
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

T24gMTAvMDgvMjAyNiBhdCAxNzowNDo1MCAtMDYsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gVGhlIGNvbnRyb2xsZXIgcmFuZG9taXplciBjb3Zl
cnMgdGhlIGJhZCBibG9jayBtYXJrZXIgYWxvbmcgd2l0aCB0aGUKPiByZXN0IG9mIHRoZSBPT0Ig
ZGF0YS4gVGhlIGRyaXZlciBjdXJyZW50bHkgY29tcGVuc2F0ZXMgdGhlIG1hcmtlciBieXRlcwo+
IGJlZm9yZSB3cml0ZXMgYW5kIGFmdGVyIHJlYWRzIHNvIHRoYXQgdGhleSByZW1haW4gcGxhaW4g
b24gZmxhc2guCj4KPiBBbGx3aW5uZXIgTkFORCBmaXJtd2FyZSBpbnN0ZWFkIHN0b3JlcyB0aGUg
bWFya2VyIHRocm91Z2ggdGhlCj4gcmFuZG9taXplci4gTWVkaWEgdXNpbmcgdGhhdCBmb3JtYXQg
YXBwZWFycyB0byBjb250YWluIGJhZCBibG9ja3MgdW5sZXNzCj4gdGhlIHJhbmRvbWl6ZXIgaXMg
ZW5hYmxlZCB3aGlsZSByZWFkaW5nIHRoZSBtYXJrZXIuCj4KPiBIb25vciB0aGUgYWxsd2lubmVy
LHJhbmRvbWl6ZWQtb29iIHByb3BlcnR5IGJ5IHVuY29uZGl0aW9uYWxseSBlbmFibGluZwo+IHBh
Z2Ugc2NyYW1ibGluZyBhbmQgbGVhdmluZyB0aGUgbWFya2VyIGluIHRoZSByYW5kb21pemVyIGRh
dGEgc3RyZWFtLgo+IEtlZXAgdGhlIGV4aXN0aW5nIHBsYWluIG1hcmtlciBiZWhhdmlvciB3aGVu
IHRoZSBwcm9wZXJ0eSBpcyBhYnNlbnQuCj4gVGhpcyBjaGFuZ2VzIG1hcmtlciBoYW5kbGluZyBv
biBhbGwgc3VwcG9ydGVkIGNvbnRyb2xsZXJzOyB0aGUgSDYvSDYxNgo+IHByb3RlY3RlZCB1c2Vy
LWRhdGEgcGxhY2VtZW50IGlzIGhhbmRsZWQgc2VwYXJhdGVseS4KCkJ1dCBJIHRoaW5rIHRoZSBy
ZWFzb24gd2h5IHRoaXMgaGFzIG5ldmVyIGJlZW4gZG9uZSBpcyBiZWNhdXNlIGl0IGp1c3QKYnJl
YWtzIHJhdyBhY2Nlc3NlcywgaW5jbHVkaW5nIHRoZSBCQlQgcmVhZHMuIEkgZG9uJ3QgdGhpbmsg
dGhpcyBpcwpoYW5kbGVkLCBpcyBpdD8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
