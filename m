Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2122C77B73
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Apr 2023 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7LXzz1RlnsCF+0zcXdeFLqLMyHQdq8Kq1XCJy9pMQY=; b=JlH/u8x568HE1g
	/5FNJX16ykXK3st396dBV4bMS7O713gIWrntjEAgElTd7GjBrXNVmc/bJBI3YS4JtTmOATmSqSj8i
	uQnOo5gam35uIJ8ez/lZI0RutcHz47cg5oiSbg03mQ/XNf6ffJ4qPB10anOhThJbVHip7r2jYWirB
	vpsO4UlsWRVEaOpj3X5ztf4itM/xQbmht+wbjoX11JemUteYDBgIh9UNn7yLngZu2VCdxwp6luG+k
	Cf/xhF3K95S6/zIfrKAm/6k7LzYo/82yolmheOTEIS4PSdEm6UeJkMW+aUQvMy9w6rGY8XPkyDKdA
	uoqTlG7IO/29sTQ5fmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppCni-006BGR-2w;
	Wed, 19 Apr 2023 18:45:06 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppCnf-006BEy-1b
	for linux-mtd@lists.infradead.org;
	Wed, 19 Apr 2023 18:45:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96DC11C0003;
	Wed, 19 Apr 2023 18:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681929896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGDYOuXKNzzro2xCjGL+wuO6vnd6Yvtt2DWXjbHV2nQ=;
	b=ne5e2pgJzkktJs/Md8pOYtu5PsZKWi+ePLWLxJtyk+IV5GoknKjDT/g2m8ExTK63hm4kcH
	QHm1XxhvFRsix/YlvVUfo2XBAtPIzzd6uUyh2H2gndB8rdgfnkNKOJ/C5qxThPxwoL5+xX
	VzffNix4zibVbzN38y6XHbCBLCGQsB/oomvXGB+uVOGr2u/B0y5ySORUDY99kMPPADgrqH
	TrH6Qk+8EIrTkl/cUUJC/VocBZ4yFB8lRkeazK3MkManlQpGuqRnSLAR2M+dmLv41ItWJw
	igdi66MxtMsS5sZsgIhaFTd1L9BzM+PIl5R2hPL5fgM57FhPKzgwIyWQxamQwQ==
Date: Wed, 19 Apr 2023 20:44:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 6.4
Message-ID: <20230419204454.00805f72@xps-13>
In-Reply-To: <294afd6f-9e3b-0bbb-dda0-ad8d8c02c3b1@linaro.org>
References: <294afd6f-9e3b-0bbb-dda0-ad8d8c02c3b1@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_114503_709999_B6F8C64F 
X-CRM114-Status: UNSURE (   6.74  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gRnJpLCAxNCBBcHIg
MjAyMyAxNTo1Njo1OSArMDEwMDoKCj4gSGVsbG8sCj4gCj4gVGhpcyBpcyB0aGUgU1BJIE5PUiBQ
UiBmb3IgNi40LgoKUHVsbGVkIGludG8gbXRkL25leHQsIHRoYW5rcyEKCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
