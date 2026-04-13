Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD4BEBFD0F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 08:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMUwfDOAkZnk4cmGl9LPaFvBrZkdKi8ZFWU+dz82RjY=; b=xEBzpUNV+VoET4
	M02GHS94V60va8oec5vjTxYIPywvGaBb4BZRZ0ew7+SYsZzAnJy2riFhyw9Q/v0shhZIMXynqJIWh
	oZWIuKbNhSPVlZS51O2NKnAc79ZxnmNUw14eWxixSotA4ZGoXoHt213TBySSyXKGFcQUXI0PmB4yc
	Qa8pB7Yy9R9XzLg9OsvvzwLgeFXSEDhyhaoXQN1/pQLRLaOq/jH4T2DwRSXZJZvphlDJictgwg5co
	kH8Zxk2Zhkh+hAtT9mH3PGppPO2GzNYCi+AUh4mq0FF3SgDXzUmkbTbb6Jtg9q4DtpNnLaCtfOqnA
	a55kzuIJpVIr3CtHsWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCPA-0000000FEt6-1bjA;
	Mon, 13 Apr 2026 08:12:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCP6-0000000FEsC-21tD
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 08:12:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 980541A3261;
	Mon, 13 Apr 2026 08:12:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 674F65FFB9;
	Mon, 13 Apr 2026 08:12:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18E8B104501E1;
	Mon, 13 Apr 2026 10:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776067933; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xlQtUgRvCdGzSpIpobD+wGe1i3MkCxAfdWBh+KMd8Xc=;
	b=lQfk6T5AYzgo9MX66zvt/YI5O0ASiMvpjEGLfABg7HNL2Puv2/5MtAnbG0pI7oadppAd1/
	nfDCjjV/O7EIc86MEnRUE2y/3B7RC/gUCamg2KW5avqLhDZmIjtGHt+OeOCH5tt4uJMcqg
	m//FBKvp4mGCSCRmTRM354qm3nzeOCCRkvDYmAMf+VMSkLgrfNDR4tvGipM+/r/MUoFKau
	K99Imv9+y8gNz3FW/plLPI321ZB9PKuMNeAmAl0mmyJVPR5CAyqaxymbnQ/Uq3mgHj/r/L
	3vYMzhV2yYW+Y6LlfKq82Vj9BdMPCozluRlMC6W555mBQiLYlnlyeLrSo+iwmg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: bbt: clamp GENMASK high bit to word boundary
In-Reply-To: <2a62dc1a58f2f8467d95444fa4b37a0af27aeb45.1775951973.git.daniel@makrotopia.org>
	(Daniel Golle's message of "Sun, 12 Apr 2026 01:05:23 +0100")
References: <2a62dc1a58f2f8467d95444fa4b37a0af27aeb45.1775951973.git.daniel@makrotopia.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 13 Apr 2026 10:12:10 +0200
Message-ID: <871pgjnusl.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_011220_679404_06E6935F 
X-CRM114-Status: GOOD (  11.16  )
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

SGkgRGFuaWVsLAoKT24gMTIvMDQvMjAyNiBhdCAwMTowNToyMyArMDEsIERhbmllbCBHb2xsZSA8
ZGFuaWVsQG1ha3JvdG9waWEub3JnPiB3cm90ZToKCj4gV2hlbiBhIEJCVCBlbnRyeSBzdHJhZGRs
ZXMgYW4gdW5zaWduZWQgbG9uZyBib3VuZGFyeSwgdGhlIEdFTk1BU0sgaW4KPiBuYW5kZGV2X2Ji
dF9zZXRfYmxvY2tfc3RhdHVzKCkgY2FuIHBvdGVudGlhbGx5IG92ZXJmbG93IGJlY2F1c2UKPiBv
ZmZzICsgYml0c19wZXJfYmxvY2sgLSAxIGNhbiB0aGVvcmV0aWNhbGx5IGV4Y2VlZCBCSVRTX1BF
Ul9MT05HIC0gMS4KPiBDbGFtcCB0aGUgaGlnaCBiaXQgc28gb25seSBiaXRzIHdpdGhpbiB0aGUg
Y3VycmVudCB3b3JkIGFyZSBtYXNrZWQuCj4gVGhlIGNyb3NzLXdvcmQgcG9ydGlvbiBpcyBhbHJl
YWR5IGhhbmRsZWQgYnkgdGhlIHBvc1sxXSBibG9jayBiZWxvdy4KPgo+IERpc2NvdmVyZWQgYnkg
VUJTQU46IHNoaWZ0LW91dC1vZi1ib3VuZHMgaW4KPiBkcml2ZXJzL210ZC9uYW5kL2JidC5jOjEx
NjoxMwo+IHNoaWZ0IGV4cG9uZW50IDE4NDQ2NzQ0MDczNzA5NTUxNjE0IGlzIHRvbyBsYXJnZSBm
b3IgNjQtYml0IHR5cGUKPiAnbG9uZyB1bnNpZ25lZCBpbnQnCgpIb3cgbGlrZWx5IGlzIHRoYXQ/
IEl0IGRvZXNuJ3QgbWF0dGVyIGhvdyBtYW55IGJpdHMgeW91IHVzZSBwZXIgYmxvY2tzCih0b2Rh
eSBpcyAyKSwgaXQgd291bGQgcmVxdWlyZSBhIE5BTkQgY2hpcCB0aGF0IGNvdmVycyBhbiBlbnRp
cmUgY291bnRyeQp0byByZWFjaCB0aGF0IG51bWJlciBvZiBibG9ja3MuIElmIGFuIGF0dGFja2Vy
IHBsYXlzIHdpdGggdGhhdCB2YWx1ZSwKZG9lcyBpdCByZWFsbHkgbWF0dGVyPyBBcGFydCBmcm9t
IHdyaXRpbmcgb3V0IG9mIGJvdW5kcyAtd2hpY2ggaXMKcGh5c2ljYWxseSBpbXBvc3NpYmxlLCB3
ZSBhcmUgbm90IHRhbGtpbmcgYWJvdXQgdmlydHVhbCBtZW1vcnkgaGVyZS0gYW5kCmdldCBhbiBl
cnJvciBsYXRlciBvbiwgSSBkbyBub3Qgc2VlIGEgZ29vZCByZWFzb24gZm9yIHRoaXMuCgpIb25l
c3RseSwgSSBmaW5kIHRoZSBmaW5hbCByZXN1bHQgbXVjaCBsZXNzIHJlYWRhYmxlIHRoYW4gYmVm
b3JlIGZvciBubwpvYnZpb3VzIGFkZGVkIHZhbHVlIElNTy4gQnV0IG1heWJlIEkgYW0gbG9va2lu
ZyBhdCB0aGlzIHRoZSB3cm9uZyB3YXk/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
