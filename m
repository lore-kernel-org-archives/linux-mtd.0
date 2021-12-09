Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5C3C433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 16:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzxC3gBOO28wxK40OaUb1fQsB+3pbPS24FZqvAZHbs0=; b=ofLoLq7qD0PI9f
	jqSbf+04ZOqJFWtWanLg5UVZvwCWKOflz2U5KpUepRdNCP9OtAolIGiiYNB/mgsbtu2bp8m2Fjt8Z
	aBb+e7mpbUS4sFiSXZp9RcLHUBVGYkmD0FAH5R7j5fOXcRYr99BH5KA0H0aQUadsVtnIPToyFjObu
	dY16GMvHMzLG85HZu1BsxATVlqSaILwLxC2kR4Gy/vz2gqN/0spEgaw+gL0ly8HbuoRSTYa8EFCrE
	vRzJ4Pijhb7BlhkA94UE5zp32GLCyfVyXbum5wWyDD1b1rIPzqS5RyXVkO2WmZXe/FO36nA0ItkaC
	GYEIrEu4tyiEPuO/XzUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvMct-00GlhO-9q; Thu, 09 Dec 2021 16:50:35 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvMcd-00Glap-Qv
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 16:50:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id EF45424000B;
 Thu,  9 Dec 2021 16:50:14 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin Ian King <colin.i.king@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: onenand: remove redundant variable ooblen
Date: Thu,  9 Dec 2021 17:50:14 +0100
Message-Id: <20211209165014.528564-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211205230729.79337-1-colin.i.king@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'df87a1efb8372bc119abb5757a458d688ae2d580'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_085020_051175_6CE70468 
X-CRM114-Status: UNSURE (   6.79  )
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

On Sun, 2021-12-05 at 23:07:29 UTC, Colin Ian King wrote:
> Variable ooblen is being initialized with a value that is never read.
> The variable is never used after this, so it is redundant and can be
> removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
