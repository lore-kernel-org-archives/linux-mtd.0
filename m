Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8906EC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mnk2Y/e1JFSEaX4DOuN4rKI9hfbzZSj48RStg/O/iK4=; b=JBKxTcQhWknWQS
	X3XzthqFlMMMXx8UYhRDxOWttp+ALw+AlvvDn3vT2cWuttWvZRuCHMu9dil81oAt8tQ/2jzR+DyJB
	KxJRzSMRs4ATtTIBbNsCkLIehcHzN3dygNL8W68pfoqhoFhX3WShiuVJK9rCxpURhueTURXEwxOZn
	Fy0bxNKj6hRCLDKWPWtxAwENGqxS8/1DfXE+krD2yMhGuaS++Si91d7KLjTXJm7sZoywSMV8ASfGz
	R2SoXbHxRkJ2/EeUhigfbKIZiXQnUAPAOjcKE9QL5qzd2yCVbnWtdXjwUqimStRBJi+B0fEG9wN55
	fWoPhQ9A0ybV32l/06+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQP-001gxJ-Fr; Tue, 20 Sep 2022 08:16:13 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQ7-001gpt-9G
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:16:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6623B1C000F;
	Tue, 20 Sep 2022 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0bZ/4ub62GqpgWbwegoDb5Vo3VrGav4tMuzZ44pe6tM=;
	b=BgB9C/LSPzzzishEokbHUGFSlXDbeh+mEAFBADS19MhM+0dG37H/D0RxGjbzShZQroPcFw
	MAZjU5+DVYmcGiXX4c3UCGtO6UgClhiCZ/2CyNL2rUygRPmGhQMcCk2hUi9YpaeuRmeXdv
	2D1xa0eTfPLE0oAJSEIw+z5kE8Njk5VyMdEXy5Jw+5utfdy7SI5QF/3xbeZuV/DGcSj5oO
	3uuJL2muhLARpDv+65r5+BKQm+KlZACUaJ0gjBMNKX/iGOggetYY46P2mqL82uFctqXvLB
	MtrGjtUO9S4DNu5qcS2Mu2EliEX32QJqSKu3VDFXEgRDRoFqgWMmdze988H3Vg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: bbt: Use the bitmap API to allocate bitmaps
Date: Tue, 20 Sep 2022 10:15:51 +0200
Message-Id: <20220920081551.598096-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b18c2b6711b8930f0dfb8318b5d19ef6e41f0f9a.1656864573.git.christophe.jaillet@wanadoo.fr>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'054c6b58fc6ca7321dc53d7b64f8422919355cd9'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011602_927014_7FC92C47 
X-CRM114-Status: UNSURE (   6.25  )
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

On Sun, 2022-07-03 at 16:09:45 UTC, Christophe JAILLET wrote:
> Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.
> 
> It is less verbose and it improves the semantic.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
