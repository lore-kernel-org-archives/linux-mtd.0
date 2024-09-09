Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F9ECE7AB0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTA+jSbuRDjGYqKxCiBQ9VsJnXIZ4B9XNX42lzqhxvs=; b=gRgYGAuqc/Xdmh
	ANs8vBdqHJlQI6xZKNf7gFxnHHr23usxrtfkX70XVhTJ12OiO2WF2e8cBTqPJ79dSwIt5BKtEmvEw
	80eylACX1yVKyZnu8gb2aPjGX1esVU/V+KE9nqc3ZdZc1tURdP9dT25wNlEEj0QnftfK/klhQJEKx
	cNTaROEbWrJOMapsJS85ZTkW0vioQHP56gNDPTzZGHGB0ZjJtqGwl2ZOcZWAvI8523tpwEUe9qe4f
	B753/8/fjoPDrspCxpr2NMEwiXZkyLK2mXpybAaWFE95wyraSuxnPPQJZvVhr0pyxekkA6wFW6hVR
	IjoViIsil6M2PvohQQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZD3-00000000v0g-26me;
	Mon, 09 Sep 2024 07:53:17 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZCi-00000000ut3-25Ci
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:52:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63215E0002;
	Mon,  9 Sep 2024 07:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725868370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mlxlmUquTmFkGQqdmXvdPV3nUNa9fBi5zLHacZJ5o/8=;
	b=jz/w9S0UQaB4D8O0Wr59wr3duykztU3f2WTxMBQ0sM6bQJT53Rb9IgVadC5YSYXscBy1iJ
	tEkekPl2LG5xUJBLtFZSXyCfk9iK/++xGGAkvZMyrt4R9M7OMfD5C+glg5gWPiOxRpw2cJ
	2pGMOK1eHHLY0aX6D+DxTA4khYh+i9eLwXdk2tsKH5aK9fpxsYmO4qp4sg/KXDkxZ4wNFn
	8hEYruSZU1HrWuwKoqUv7ONkscsX3IgrQGnp4+wKaPmBEedzSKcMFvGBP1yVDOou37RK8w
	mK9ZHGa3sy5pTppMsbiGKqLbA+Fg5SzaM/yWl9ItW8DtAMmT9mE+vcEoc5RHBQ==
Date: Mon, 9 Sep 2024 09:52:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Jon Hunter
 <jonathanh@nvidia.com>
Subject: Re: [PATCH] mtd: spi-nor: fix flash probing
Message-ID: <20240909095247.48358afa@xps-13>
In-Reply-To: <ad9ee29c-b96a-4861-a7cd-b8649a3d1f3a@linaro.org>
References: <20240909072854.812206-1-mwalle@kernel.org>
	<ad9ee29c-b96a-4861-a7cd-b8649a3d1f3a@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005256_697283_0F665ECC 
X-CRM114-Status: GOOD (  12.81  )
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

SGV5LAoKdHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnIHdyb3RlIG9uIE1vbiwgOSBTZXAgMjAyNCAw
ODozNToyMyArMDEwMDoKCj4gT24gOS85LzI0IDg6MjggQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6
Cj4gPiBGaXggZmxhc2ggcHJvYmluZyBieSBuYW1lLiBGbGFzaCBlbnRyaWVzIHdpdGhvdXQgYSBu
YW1lIGFyZSBhbGxvd2VkCj4gPiBzaW5jZSBjb21taXQgMTVlYjgzMDNiYjQyICgibXRkOiBzcGkt
bm9yOiBtYXJrIHRoZSBmbGFzaCBuYW1lIGFzCj4gPiBvYnNvbGV0ZSIpLiBCdXQgaXQgd2FzIGp1
c3QgdW50aWwgcmVjZW50bHkgdGhhdCBhIGZsYXNoIGVudHJ5IHdpdGhvdXQgYQo+ID4gbmFtZSB3
YXMgYWN0dWFsbHkgaW50cm9kdWNlZC4gVGhpcyB0cmlnZ2VycyBhIGJ1ZyBpbiB0aGUgbGVnYWN5
IHByb2JlIGJ5Cj4gPiBuYW1lIHBhdGguIFNraXAgZW50cmllcyB3aXRob3V0IGEgbmFtZSB0byBm
aXggaXQuCj4gPiAKPiA+IEZpeGVzOiAyMDk1ZTdkYTgwNDkgKCJtdGQ6IHNwaS1ub3I6IHNwYW5z
aW9uOiBBZGQgc3VwcG9ydCBmb3IgUzI4SFMyNTZUIikKPiA+IFJlcG9ydGVkLWJ5OiBKb24gSHVu
dGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KPiA+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci82NmM4ZWJiMC0xMzI0LTRhZDktOTkyNi04ZDRlYjdlMWU2M2FAbnZpZGlhLmNvbS8K
PiA+IFRlc3RlZC1ieTogSm9uIEh1bnRlciA8am9uYXRoYW5oQG52aWRpYS5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2VybmVsLm9yZz4gIAo+IAo+IFJldmll
d2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+CgpUaGlzIHBh
dGNoIHdpbGwgb25seSBhcHBseSBvbiB0b3Agb2Ygc3BpLW5vci9uZXh0LiBJdCB3b3VsZCBzcGVu
ZCBtb3JlCnRpbWUgaW4gLW5leHQgaWYgb25lIG9mIHlvdSBhcHBsaWVkIGl0IHRvIHRoaXMgYnJh
bmNoIGJlZm9yZSBzZW5kaW5nCnRoZSBNUj8KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
