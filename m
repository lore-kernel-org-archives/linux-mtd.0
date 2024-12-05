Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B731E7716D
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wD0ZdcuTvAa1uhKzeqY0biA4P/joV0bOfi1neU/DqfM=; b=kkLbZNMeA9Y4Sv
	bYRouLDrOKVqh/BXhKRXxLEnjZExwGIEkEntXpNqyFK6YjjBRX9TZiEnUTNIG3mioPQLNLPcuRlCG
	5nr3JbQxBMh2MnbvpEm7Sfhlub7VsGWV7KfG3/NWwfL4Yn8LTsyfuJ/dBp0f6zutIZBNdraouOl/2
	fgfekzGusfGy1lOPSGAMyerVmS9FgeGpbYldRGJQeba/BVeY+BxdT1W/6dnV3TG+xqK37pZGBZL2j
	16WqTlweTtZtzpfjtK2h6KIzgzY1YHFEhm5+evZq1syGHxgFL2hvPLtnH36PHzoHaUqMJA8mUQWga
	uwuhaazJJ78eJxuxzfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVn-0000000FplL-3X5b;
	Thu, 05 Dec 2024 11:59:15 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ka-0000000FZw2-1Fwz
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 10:43:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2862DFF804;
	Thu,  5 Dec 2024 10:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m/neGO5Y8BfT1iCWWi0dB/xELDJS6gvdEM2M7lIFYIM=;
	b=adT0bqqf8s1X5wQYJ3GBojglkRsOD/HSIzN+k4zjZ9h5oFXPLlVrbVBze8/0U6iePLmass
	xCfOFyUr3V/Lt6u7UAsqi7h+KTkEmFGdxdxZkLQmE4+6nC9ThxIDHQERLE7GawyUGuxBOQ
	xhtdk18snDYDgnNG4frhUfepqqpP+LJNCHIYNj4r8Ukewer3a3ESC5djp/CCpQzzI3PRG3
	lbp1dtEQHdhtTu5eH110p9zfALvXAbRp/P0Qv/cqCJgzSdJgUql2Q3elMpqHgAd1OUWEk7
	Lo4LY1IkrluY3NFIrCz8LcgHzjysq0i9HEr+Iy6SD3ICynUIpnzOCxwIEhGEfQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bohdan Chubuk <chbgdn@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: add support for FORESEE F35SQA001G
Date: Thu,  5 Dec 2024 11:43:24 +0100
Message-ID: <173339519115.766262.10964911797107048383.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241110205048.1751377-1-chbgdn@gmail.com>
References: <20241110205048.1751377-1-chbgdn@gmail.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_024336_620110_DEF26FA8 
X-CRM114-Status: UNSURE (   7.40  )
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

T24gU3VuLCAxMCBOb3YgMjAyNCAyMjo1MDo0NyArMDIwMCwgQm9oZGFuIENodWJ1ayB3cm90ZToK
PiBBZGQgc3VwcG9ydCBmb3IgRk9SRVNFRSBGMzVTUUEwMDFHIFNQSSBOQU5ELgo+IAo+IFNpbWls
YXIgdG8gRjM1U1FBMDAyRywgYnV0IGRpZmZlcnMgaW4gY2FwYWNpdHkuCj4gRGF0YXNoZWV0Ogo+
ICAgLSAgaHR0cHM6Ly9jZG4ub3pkaXNhbi5jb20vRVRpY2FyZXRfRG9zeWEvNzA0Nzk1Xzg3MTQ5
NS5wZGYKPiAKPiBUZXN0ZWQgb24gWGlhb21pIEFYMzAwMFQgZmxhc2hlZCB3aXRoIE9wZW5XUlQu
Cj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHNw
aW5hbmQ6IGFkZCBzdXBwb3J0IGZvciBGT1JFU0VFIEYzNVNRQTAwMUcKClBhdGNoZShzKSB3aWxs
IGJlIGF2YWlsYWJsZSB3aXRoaW4gaG91cnMgb246Cm10ZC9saW51eC5naXQKCktpbmQgcmVnYXJk
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
