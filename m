Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A7BC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 16:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ErGsVxSgEtjJxMuTsL7IRkfBJBbnvp+EHP+43kpAYno=; b=KiKk3Um5p/gd/4
	1+blY3T58cRDD0qQMGjwr6YKkXrqqa5MFqEz0oQhwzqYqfiSensikz5yKwtZaI5zqmi04se2c2I/w
	MBer/pqaOJPWhujij29n42EuhDhFBaQfAAnZaLshcutRdmbPkpD/jr3LzCRrHc7UztEV9MpsdZZ0D
	HknAoUa5vxBlUqYdNzXkfsxsyizRGg4wYEPbP80Pmfb5w2v5Hrz+su5NVAneuhiTwMNOY4dxZgDsz
	IIFkuZt8Qk0WgnYak7UWLF7Xm/dL5aFzZ7F/i0AWiASmufPB55iS/7S0bSPuBuW1PeOCK62DuCFUn
	w4ndkE4PZ6nIXbERz9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTn6w-005uGn-WE; Mon, 14 Mar 2022 15:59:55 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTn6j-005uBy-AR
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2022 15:59:42 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 384F510000A;
 Mon, 14 Mar 2022 15:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647273579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JwmrT3N51UDTQkNWAqjGH3nBXGvEDGlQeAp5osaeVWQ=;
 b=V4xzRvvcGOB5PuDXj1eyj1s05tnQqZIpJ5D7ScqLr1ew6OoCwNNjk/PrkR41+Rj7NzEmWF
 lJ+OFE4E2N3Q1ITLXeM9PEnhJ6pnun0YoXQtx/bJ9aGOaafqNQUCv1tV6LZAu8BZOOaFsD
 0pAugptAbHv+4bBZ9RJp4ki6rgLqpmLvIweIpZ3fpuvgQiGdftKg2C5mln9FFhhBj5s0le
 1R4XYg2NkIPhxLOtyz6QAeJPHcxSkzb/nFtIaLs5FResPZQqRemi2Co2EWPmVjpwquK9Ku
 otEui5sspGBtCYGf3pEE9K4mlnzEgZWnAOms6RpZr2Mf8yKP8NfwtVjcpI6L0Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: hyperbus: HBMC_AM654 should depend on ARCH_K3
Date: Mon, 14 Mar 2022 16:59:38 +0100
Message-Id: <20220314155938.77206-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <9fd6b975adba710158f28aa603cf87a6d189a418.1646655894.git.geert+renesas@glider.be>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'572ff6514b7d7179bc2c227c5ce1483f664564e5'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_085941_515730_1BDEDAF2 
X-CRM114-Status: UNSURE (   8.02  )
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

On Mon, 2022-03-07 at 12:27:02 UTC, Geert Uytterhoeven wrote:
> The AM65x HyperBus controller is only present on Texas Instruments AM65x
> SoCs.  Hence add a dependency on ARCH_K3, to prevent asking the user
> about this driver when configuring a kernel without support for the
> Texas Instruments Inc. K3 multicore SoC architecture.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
