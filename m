Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6D1C04A6A
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 07:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nIitOw/dJ+Lm9EFv1gmWawBdbZg7kc28tAEoZ0bLig=; b=sXSX5FZansnaht
	RYwpxeA8YRn7BazDuajd3uwYQKSCPx1b6x+TuXb1kGl1j71STLgsDjw0F7JzNjgVC1PCxFT0W2upu
	wZXNYHjRL3uBqqejyMBXjapwhaYTbsy9vu0t0h/NIIJsb6chKGB7Nsg4CvaI31Fx6vsTcDTnLjh+J
	HiBUg9nhmX69vS/6sgsht9BsgnSSpaj+hQZPtGQMKsQVgccOVeFaSI+2xlR9VJWq6uYvbiYW2G/0Z
	w5Xl/E5i1OtGxQ37cZVWV4tjTXcoJEEd6HASnjTgIf9ACPQYMN8siZvC+spOEliSYp3RPB3WevGnO
	5rbM/5IBcJbteXhdfeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoqs-00BjRS-06;
	Fri, 04 Aug 2023 07:03:58 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoqn-00BjON-1K;
	Fri, 04 Aug 2023 07:03:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D8401BF205;
	Fri,  4 Aug 2023 07:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691132629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wk03lam4qH2i+elB/+7qAyZXQUznTdgvFAjapntLgd4=;
	b=LpWxS4IR+Y/d4gnyYRmXXF6NPbFwA5x8KRlx0fhs6C54QcW1a7D4aEk2am748E4RetdATg
	NVe/Aq1Y/nySecyhfiDuK7aU6eFnXAfcIJoHo/f9jx4RmdJ1Q2wROVaEo0xshUjX9M+E+R
	1YHi6Be1FHalvrmUakSsKnDL9HG2Nh8toTwUyoGw0jdi1E51BuRecko/Ah64WNoOd2g4oO
	G3QyZJecm/8vNzDZLFlcv/3kdT/HZxWOcmdIcYWlp5eDsPyqb+b1JsBDFLeE1R+naLj3L1
	szjYqrdRuBMq43c2gnfyhqCAZVCqhCysfZqcaEJ0KCcXBeoKBU2LooLts5eBRA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	anand.gore@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	computersforpeace@gmail.com,
	florian.fainelli@broadcom.com,
	kamal.dasu@broadcom.com,
	kursad.oney@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	rafal@milecki.pl,
	richard@nod.at,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	vigneshr@ti.com,
	william.zhang@broadcom.com
Subject: Re: [PATCH -next v2] mtd: rawnand: brcmnand: Use devm_platform_ioremap_resource_byname()
Date: Fri,  4 Aug 2023 09:03:46 +0200
Message-Id: <20230804070346.370960-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802013500.1030853-1-lizetao1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'31cbe3a7e217ba8ec482ae821092e57d96275d5b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_000353_584543_540116F2 
X-CRM114-Status: UNSURE (   5.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2023-08-02 at 01:35:00 UTC, Li Zetao wrote:
> Convert platform_get_resource_byname() + devm_ioremap_resource() to a
> single call to devm_platform_ioremap_resource_byname(), as this is
> exactly what this function does.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
