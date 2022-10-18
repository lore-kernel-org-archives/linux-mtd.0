Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457C6C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eNuDLfZzpk3thXpVBRGEWzfYALmfgToTZc7C9y8Ook=; b=dXp9W0yPe2ITvt
	qiFE75rP4J7trOUIOnDP7yAjCjSze78OOG797cQWZhpuur0sZfgEEvmcKVS64iqydfD5PL+FIXLJI
	F+BXCn5i1WX6PEyvNB/z1uHBQT4KLeLUommZfKx4zod+J2Sg/sAYbxX2vknot6newK6vQq2atCrLy
	u4s32vashfq7DuS2wtNBuFxMsps8W98LceYbb3I4yEM0xdNftjmArFMLDIPnAV6pxk1jL1GfCXBg/
	Ls8Pi1p/uzW8knbGrCF2ONQI+mhCov0g310WAh+gYWsuLrD+O9L6hIKVwWMSwY9mi0CPIPwl8es8i
	urVjxyfVZ4yN9e4KviAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiWT-004gJp-AS; Tue, 18 Oct 2022 09:04:29 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiWI-004g5S-8b
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:04:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CED5C20011;
	Tue, 18 Oct 2022 09:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666083855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WrHoAtqBli7nGuNr8Qrgbh7E8H5z2878N2B7xjfksr4=;
	b=c22FApHUxGj2kff0fgpC8s7ZDRnAF97UAyVi5iPOrx9HoTCu9cKkNSmdOig9q0Gf7NWh1M
	Ddz190UeyKPF9XL9U2LpJL31oS2pY2aWxwWHFTr9RedkM6IM9VrPoO9oX1vRGyTGPpf25x
	OOYQZb3tCim2s36d6YNdm9U+Vq23fROWw8xxz8L1u0yWYYBoHu2CEPBnX4C7jssAp+Lu4w
	GSNWCLcIbhJR8KseoEhQNoK1b3lBqXaGvCXKlJpGbxAat+ThoKNdFQ92khxkARIdggQdZx
	pKzuTqp9jpCeiJ41U+whpP/bz/Yn58eRcqwB/Xvnivs4l8QLhfZe8QdY7QStOQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: mpc5121: Replace NO_IRQ by 0
Date: Tue, 18 Oct 2022 11:04:13 +0200
Message-Id: <20221018090413.466295-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4e3ca3e0077ea124ea210c312e6e620f0f9e8bca.1665034065.git.christophe.leroy@csgroup.eu>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3fea699cb2d6c8c47289b16500590630f507d8fd'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_020418_469614_745B3DE9 
X-CRM114-Status: UNSURE (   8.44  )
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

On Thu, 2022-10-06 at 05:29:12 UTC, Christophe Leroy wrote:
> NO_IRQ is used to check the return of irq_of_parse_and_map().
> 
> On some architecture NO_IRQ is 0, on other architectures it is -1.
> 
> irq_of_parse_and_map() returns 0 on error, independent of NO_IRQ.
> 
> So use 0 instead of using NO_IRQ.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
