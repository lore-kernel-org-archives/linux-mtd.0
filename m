Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968E1C54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 10:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZpfrYYgG4KqQzCZm50kmyeHqtRxyHJ6D/SNyhozkG0=; b=UgL+rEwAOtDky5
	Wyk29rr/alMPbeFy4XbuNeYz5m5z7gAbqpk0F8eX1ssqKfVty4UCs47l+QfokfMLnJ/8o6jTPj3TH
	5dtySRHCFR+4ztR1X5aubJ1j5Iao67SjFZnVNg3Rzah9d5ni9CZLEbNtyMFSxXIWm5OvZjGYaPcbh
	5dGfaJd49ypMmX8heb00nEm10RQWzr7huFoCSGNvuorweqaBrU1CtBhSSKZcHPTGvkHwmGhkYZiDy
	WbROtdVFZX980aEYVKUB5ShO4pLicIOGhaBiN6FmnhNhz6SPuG64UukUb2G5bVZdTUOdKq84Svent
	CHy87RLgvjf56qiTtFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohQ9-0000000Ghdg-2FQw;
	Mon, 25 Mar 2024 10:19:13 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohPz-0000000GhVY-3ANW
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 10:19:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96B1CE0006;
	Mon, 25 Mar 2024 10:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711361941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M4tr6jXQo2B5No46bghO0NGB40nWqUW2K62Prsk80Uc=;
	b=Q0MxbHtRzFK0Vmp7ppEFvERfQdOZ8doOZ6S3NyLVl6rwts7McABZG1LMlkuSiblr/bRn/W
	it9JeXBTJvCCAsbz6dDCekCNDi8nH70IhYtbJuHvaO61XvsTb0n4Gcz8bEDTPTNc4DrCj5
	GdE/YxF9s0sMLMXyNBZHfbOO9T386cWwiyb/G2eCGVus2m72BQdeSCD0Hbqu04tZMjicXq
	wl8WTt/0cz1i41rpAk2pY3zwA+RZNuc2ESCkcps1/KbIz61fcPOX4s12wRn17NbWq0v4km
	N8dUfn97crR51GZubWU5F/JuLPItzJUn/gAnzvbm/16qNOu2okkp6g52OAxhYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxim Korotkov <korotkov.maxim.s@gmail.com>,
	Boris Brezillon <bbrezillon@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Hector Palacios <hector.palacios@digi.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] mtd: rawnand: hynix: fixed typo
Date: Mon, 25 Mar 2024 11:18:59 +0100
Message-Id: <20240325101900.262562-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313102721.1991299-1-korotkov.maxim.s@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'626ae9c828be56c5854296d44bec19a23627fe91'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_031904_132113_CB20B243 
X-CRM114-Status: UNSURE (   9.14  )
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

On Wed, 2024-03-13 at 10:27:20 UTC, Maxim Korotkov wrote:
> The function hynix_nand_rr_init() should probably return an error code.
> Judging by the usage, it seems that the return code is passed up 
> the call stack.
> Right now, it always returns 0 and the function hynix_nand_cleanup()
> in hynix_nand_init() has never been called.
> 
> Found by RASU JSC and Linux Verification Center (linuxtesting.org)
> 
> Fixes: 626994e07480 ("mtd: nand: hynix: Add read-retry support for 1x nm MLC NANDs")
> 
> Signed-off-by: Maxim Korotkov <korotkov.maxim.s@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
