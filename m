Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650DCC79F8C
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 07:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oEt1DctY5Qw9dPBWzGr+dHYBHCWdeuWWcqYK5H1JEKA=; b=hvaoKKLX/qPQIv
	1aFBYy2U2Nsn4ynDSvQt4N25uSPXuXHd5sZrTLNBwauUoByRg7BIUArtHymyGyNZJQFHP/0xC+f7X
	rvKsiVAKKqaneyOZ25fguQJQVT+MnUOLrdhgOUwe0C3inN3OsS6bPfEoxRymgeNogUsG04xQdpTqD
	mAJLcY87nyG4NBZiTvTnG02ejC+Rq6RnOUklk7dk2XJ9WqCZ7V98kKs60brB+l9CxzCyp0RszKp/g
	lKIhj82PT1Pesya/dcNce3JwCIuZ89SFYM6EcWULKFqDT3UXPpzehSNEw0ZAYels3xpNRvoFnNXr5
	fhsIBgFl9wjpy5OG2ntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D9S-0000000B2U8-1lCX;
	Wed, 09 Sep 2026 07:55:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D9L-0000000B2T1-2blT
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 07:55:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 271121A1A73;
	Wed,  9 Sep 2026 07:55:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7F1260448;
	Wed,  9 Sep 2026 07:55:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E59911C7AF61;
	Wed,  9 Sep 2026 09:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788940517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=flG4RjL+uIFYiYsr5qUG4/1bgE5w16n8plol/VAROVk=;
	b=sUy8RLpJcYuax4ObN3RW54k3M/E6bQilqOSpE3nsPQ0hrw3kBcYFu7O9yribE3NPiLLY1Q
	Q3FVcwPsJAz0MP6k1vwrGCDxfxg3OWNIf3x6Dzhr/5JBOqDHXIs4cJ6W5Poikw5rqVBusK
	2AQzj6WYbXHoPua00VewQNjD/ELzy7SF7oAIMo/QE3B9qFy+wGQv6aXcSsd5JqSlfck8m+
	QEyR3sxTaoH0K0w38tpQWaEpz08EgypajjYWzy9P+iUKsLfbfffpTwhXnpsN1SIJw5DJgz
	U9vne6cUxUMwJCql1qpMWrQHAA/CM51WYDjHTWBreyEi4FYA9OdxBP00PlYkSQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260908060327.42775-1-rosenp@gmail.com>
References: <20260908060327.42775-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] mtd: rawnand: fsl_ifc: use
 devm_platform_get_and_ioremap_resource
Message-Id: <178894051597.2042218.12032619584274014703.b4-ty@bootlin.com>
Date: Wed, 09 Sep 2026 09:55:15 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_005523_682277_70E4D137 
X-CRM114-Status: UNSURE (   5.83  )
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

T24gTW9uLCAwNyBTZXAgMjAyNiAyMzowMzoyNyAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
UmVwbGFjZSB0aGUgbWFudWFsIG9mX2FkZHJlc3NfdG9fcmVzb3VyY2UoKSwgaW9yZW1hcCgpLCBh
bmQgaW91bm1hcCgpCj4gaW4gdGhlIHByb2JlL3JlbW92ZSBwYXRocyB3aXRoIGRldm1fcGxhdGZv
cm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKCkKPiBzbyB0aGUgcmVzb3VyY2UgaXMgbWFuYWdl
ZCBhbmQgcmVsZWFzZWQgYXV0b21hdGljYWxseSBvbiBwcm9iZSBmYWlsdXJlCj4gYW5kIGRyaXZl
ciByZW1vdmFsLgo+IAo+IAoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10
ZDogcmF3bmFuZDogZnNsX2lmYzogdXNlIGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jl
c291cmNlCiAgICAgIGNvbW1pdDogMmI3ZTE2ZDU2NWFmMmI0NzE1MjkwZDlkZTUxMzE4N2E3Mzc0
YjJlZAoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQg
d2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBs
YWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
