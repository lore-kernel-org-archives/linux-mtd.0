Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E920ECA0FFF
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3hcjKnWhPdRK3CMVe+xSV6axb4yVrHE6tVnAUE1DqU=; b=lUqdEVF+Ga19y6
	M+prpeCwTsUvEiNTKkU8ct6IEtx5yr11f/FEAAufbCu7IuTPqTlvKZmLnS3Agh9EOFSB1jNIZSjGm
	eSOyAf3o3z1POkq90B0aIOiE2LtUl+YjXCMdxXbFCW7TbA5TJJl8KRHUS+g2nLzPDU1uDnLZ/5muf
	iN8p6A3cqmTvOmuZR8x61YcxGQV2n1P54xr2cphurXT1ixfcv2bEMVVeSjw7i61gkSMSwylwKyRyE
	UykXhuLQZ+3JdalSNsw05zx4tu3EktLJ/l/CHewHfdqbDzmAmg+mL0hxnv7cyM1ZV6G9Dmby5O8ZQ
	DytHSC25EtNKQMq47dIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6Ae-0000000CzPn-2HWA;
	Mon, 01 Sep 2025 15:10:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3fN-0000000CTFl-04vV
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:29:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C1BAD4E40C66;
	Mon,  1 Sep 2025 12:29:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9524660699;
	Mon,  1 Sep 2025 12:29:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDE6B1C22D5F0;
	Mon,  1 Sep 2025 14:29:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=b5dX9UoBbxev9aaHEY9TfqgQYiczy1eLN+APvPcn4go=;
	b=jNBVc2JjX2nONGCForZYed73fEntZDDaaveghRpy68HctZphQwN2+ejwn9TaUDJwF2cHku
	BodA4L5vPGA0QjNY5YxIKNnIcszDAV17SgIIpL1DMrbEuWMpQdGTnDTF/VpZbmdVuA9Ago
	omS/3BaNjxBDo4gCNp7SjlsmXuGVEQRBMnKImiUYwKngf2XhmXGpnox3NQgNXp0ar6p/VW
	ggSw4ivEVoqQAHRD1HzZEviqCtMtpiLsUASnRjk3uYh7/JVt7cTO3p+8zc9TxmV3BcAWtv
	UWRbwh6gdYlZHNq7t6hRpJen9zTeU3/cNSfk90MOkZrniMoE7Yb5hHlqAps5yA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250730135934.1712198-1-arnd@kernel.org>
References: <20250730135934.1712198-1-arnd@kernel.org>
Subject: Re: [PATCH] mtd: map: add back asm/barrier.h inclusion
Message-Id: <175672978089.48892.5892042326459406309.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:29:40 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052945_232885_FFE0194C 
X-CRM114-Status: UNSURE (   6.76  )
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

T24gV2VkLCAzMCBKdWwgMjAyNSAxNTo1OToyNCArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToK
PiBUaGUgbWIoKSBtYWNybyBpcyB1c2VkIGluIHRoaXMgaGVhZGVyOgo+IAo+IEluIGZpbGUgaW5j
bHVkZWQgZnJvbSBpbmNsdWRlL2xpbnV4L210ZC9xaW5mby5oOjUsCj4gICAgICAgICAgICAgICAg
ICBmcm9tIGluY2x1ZGUvbGludXgvbXRkL3Bmb3cuaDo4LAo+ICAgICAgICAgICAgICAgICAgZnJv
bSBkcml2ZXJzL210ZC9scGRkci9scGRkcl9jbWRzLmM6MTQ6Cj4gaW5jbHVkZS9saW51eC9tdGQv
bWFwLmg6IEluIGZ1bmN0aW9uICdpbmxpbmVfbWFwX3dyaXRlJzoKPiBpbmNsdWRlL2xpbnV4L210
ZC9tYXAuaDo0Mjg6OTogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICdt
YicgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gCj4gWy4uLl0KCkFwcGxpZWQg
dG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogbWFwOiBhZGQgYmFjayBhc20vYmFycmll
ci5oIGluY2x1c2lvbgogICAgICBjb21taXQ6IDY1MzhkMDM5YzUyNDMwNGEwMGI4ZmFjNjUxOTgy
ZmRmMWZlMjRjYzMKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5n
aXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2Jv
dCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
