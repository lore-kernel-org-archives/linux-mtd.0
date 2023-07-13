Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0614EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/SCP1h9t4PH5RW+DPsRq5KRsohN3RcH8B0jIt14AXI=; b=wZtrm+dSz6Q5I+
	73JoqIZ7xuJfeS59NvvQSlzlWUMUKByeSeURGHC4igPJ401/gCZpk5JH3XyIWrwkZVZJY78qGS7kz
	etlRY+eOZjGYnJJuf8wvN3zNmhM37gqX4mtL5XtwRCug9XzwkmKDBnSimiZYMghEb6crPacP2J1Pu
	G9Omv1l1w2T3k/jKYMkum+IcppgAANgjLtQPSmt2bZlbkrN2nwVZs+b1WnI/FsAiA7cAgZjm+LqUu
	LoniMj4JJmAvKWKHqWApHUJe8IZlUKmUvw7CDzoPiLMpcgk8GbCSLsFweISbdx7ttYvhHUllkJSNd
	9qNL1hZVM52V1O1e/y8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJs74-002VYm-2u;
	Thu, 13 Jul 2023 08:55:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJs72-002VXp-0p;
	Thu, 13 Jul 2023 08:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=E9q2SKNt2PhBmQJxTl3Ovldz3f96cAdwP/DWOmBPMQA=; b=ekELbaWDh7WvSj6SXIJ1vjL/Cu
	VwS0qBJwCXA6Gfq8udZIupIw7xYxRC2pZ7gbCNl6MHBcpDRZKPvovlSC+/GMSR5BUed+kDqjeDcfm
	O1KbkUzU122s+QTiBqFdorJ9tD2S5aYK5hptxxDIIKl0/oVatrlis0IMO87RTEsJGqivcfiqkLqBA
	fvh0qO6hL+vAr0AlllWDb2Mpe2Zqq+7YuScrt1Zhjrzs9VbljPPj6dBRX/fO90eXTnWb5Tthj+WCj
	lHa/VC/REV+H86NnwndRjJus43LQiFcgUjZAJu0S5mBfDNlWcdOywXOiZdbXipJXjCflgN4Ekbkl0
	IhgyX9ew==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDb-004Xo8-24;
	Thu, 13 Jul 2023 07:58:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B8AF2000C;
	Thu, 13 Jul 2023 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9q2SKNt2PhBmQJxTl3Ovldz3f96cAdwP/DWOmBPMQA=;
	b=IocbEYCQ3NmhSKcKpvl75FWn1Vfro53riOL8Pc/QTA14U411GxTT34cT+w2zf+xP/iBmCw
	u+x570VKhpqXC3Sjx90LMl+JYfirHXY/HGCJIlG1SQY6cVXJztoWlxJqyhYAwgxdcO631F
	Obule/bqODSEB5Xf9O2ax9kVOP7lwSqvYzEvBhWgzCO93GiWs+6Qfw/R5WvOPE152mQQCP
	v5hu8l4Apa6ia3vA4zEIy5kRciVOBB1IuJIDJHhw+g1ABHBNLsPJG86HKtuA4CaCuUNSTC
	WXw7gc/QBf2k/YqoxXe62wEXREMZ7hSJT7GjpJL+l09oW2OnxOpn5gEua6hOPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/18] mtd: rawnand: sunxi: Use devm_platform_get_and_ioremap_resource()
Date: Thu, 13 Jul 2023 09:58:25 +0200
Message-Id: <20230713075825.486421-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-1-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'81a16e154cc03e3ec76537694ab4afb8df3965eb'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_085832_355780_8C4D298E 
X-CRM114-Status: UNSURE (   5.20  )
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

On Fri, 2023-07-07 at 04:06:05 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
