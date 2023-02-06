Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125CDC05027
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Feb 2023 11:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lG8teZ8lY8QK2QUYEKr2qv2d2FfDtu+FBqaqrKzc0wc=; b=CxnabEjlUyIX1F
	uzLUH3yvqAJLW+6yyfGYqmYb0QQ1ggoPifmIjdPxdsvhpMOaDfPnIemX9Ka2TY2FgpbNrTl/b2g/4
	bKnfViBS+DsVTKqc9oMFSz9AFJNCr+XFxfZ82kBR4T3GWW4yCD0YCTcoNPIjrwSz6vj4VVPUSfC8j
	plreWmfVysL3K0fc7bTikNnavD30zsSnNX1hOXnmFFsTIsLwrua+E1kT5YraL6szYAeth0YX22J6k
	bAcLjGhP9Q/JX2ZpUjg1BDZRY3iueiQ/juSCXWUhMG7tvIAIDRm2IDiJCeiCZlneFcnce5R+W/THI
	wWuRKxEEasV4YHbVbFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP05f-008MTd-R9; Mon, 06 Feb 2023 11:55:19 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP05b-008MS8-JU
	for linux-mtd@lists.infradead.org; Mon, 06 Feb 2023 11:55:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C03C4100005;
	Mon,  6 Feb 2023 11:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675684512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8gnPeSjG46ZaonWh4ua3aNp/YsEFy/Rz2huL2R4ulmw=;
	b=n/mznknxjkkrmhofdNZjKEHMSbsP02BmMAsVz+39kUN+Wqdgm7a0esmrPV2HMMQDH50abk
	AaaMdIJT6INDugmtnW+YFvHmHXoTtJIlX935jyeygRU41y8qaLEPM1VjQasuIDhQ4+1kTV
	4ySvNYI+VKdEKtMPjQxd2o2abXQjvczvjrJof6VodDPJc1cKcv+s4mgbNqaBzH8U1xtRXF
	abkEYp1osmOnyimSqA84RvLr1SLcMnAxVqC6XPfh1MLaVItjHrxzUkBgZzjvEoOxqsTNpc
	Q9vnot5eRnBCcQdQK2S2muy3Y+ckhiRE4zvl1zoDG5PJhjpHdMwANMnArya2sw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	u-boot@lists.denx.de,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4] mtd: parsers: ofpart: add workaround for #size-cells 0
Date: Mon,  6 Feb 2023 12:55:10 +0100
Message-Id: <20230206115510.560773-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124104444.330913-1-francesco@dolcini.it>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'84549c816dc317f012798e706e58669b3b013604'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_035515_962138_FC7BE2E5 
X-CRM114-Status: GOOD (  10.76  )
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

On Tue, 2023-01-24 at 10:44:44 UTC, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add a mechanism to handle the case in which partitions are present as
> direct child of the nand controller node and #size-cells is set to <0>.
> 
> This could happen if the nand-controller node in the DTS is supposed to
> have #size-cells set to 0, but for some historical reason/bug it was set
> to 1 in the past, and the firmware (e.g. U-Boot) is adding the partition
> as direct children of the nand-controller defaulting to #size-cells
> being to 1.
> 
> This prevents a real boot failure on colibri-imx7 that happened during v6.1
> development cycles.
> 
> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
> Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
