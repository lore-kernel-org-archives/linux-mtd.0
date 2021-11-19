Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BB0C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:54:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC80611C7
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CC80611C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRCzMBcRgWpdWz0dWPqqtvQPsLBRtONGj5yB/stt/ag=; b=jsz5o26BzNVApZ
	bb62r03WBEbqyeXneMvJds/oMTXutrLTYUg/KGWu9HiQZOX+Jg+gF79V+fuu38KGsCswDtX43FBuN
	6ralEE+Z+HaTv6jvdjEYV9MHXck3+EUc7+YYm9srKZhiKKKzBJRipPgzxwoI+FpSJE+L6QY0faPhr
	b7/wtOfWNcOY946jYze05tgvGziubPajTHWJvCTBNxSr0/t5C8YDJFAwaos6ALmp63FRswdIOnHCB
	TZvTDNF4urfWlIb6aEHcZxC8BgeZkCXrk2FVqSOZnZ3Jz0UNME+xAx0LCbVIwi52aTb4BnBZOrObo
	StNFcUgjIJZ/czZWKuCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo91f-00BMaZ-C8; Fri, 19 Nov 2021 18:54:19 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8rP-00BKRE-Cw
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:43:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id F37EE40002;
 Fri, 19 Nov 2021 18:43:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Eggers <ceggers@arri.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Stefan Riedmueller <S.Riedmueller@phytec.de>, Han Xu <han.xu@nxp.com>,
 Greg Ungerer <gerg@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Christian Hemp <C.Hemp@phytec.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Stefan Riedmueller" <s.riedmueller@phytec.de>, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] gpmi-nand: Add ERR007117 protection for
 nfc_apply_timings
Date: Fri, 19 Nov 2021 19:43:39 +0100
Message-Id: <20211119184339.1404232-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211102202022.15551-2-ceggers@arri.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f53d4c109a666bf1a4883b45d546fba079258717'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_104343_608595_D795D143 
X-CRM114-Status: GOOD (  11.83  )
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

On Tue, 2021-11-02 at 20:20:22 UTC, Christian Eggers wrote:
> gpmi_io clock needs to be gated off when changing the parent/dividers of
> enfc_clk_root (i.MX6Q/i.MX6UL) respectively qspi2_clk_root (i.MX6SX).
> Otherwise this rate change can lead to an unresponsive GPMI core which
> results in DMA timeouts and failed driver probe:
> 
> [    4.072318] gpmi-nand 112000.gpmi-nand: DMA timeout, last DMA
> ...
> [    4.370355] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -110
> ...
> [    4.375988] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> [    4.381524] gpmi-nand 112000.gpmi-nand: Error in ECC-based read: -22
> [    4.387988] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> [    4.393535] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> ...
> 
> Other than stated in i.MX 6 erratum ERR007117, it should be sufficient
> to gate only gpmi_io because all other bch/nand clocks are derived from
> different clock roots.
> 
> The i.MX6 reference manuals state that changing clock muxers can cause
> glitches but are silent about changing dividers. But tests showed that
> these glitches can definitely happen on i.MX6ULL. For i.MX7D/8MM in turn,
> the manual guarantees that no glitches can happen when changing
> dividers.
> 
> Co-developed-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> Cc: stable@vger.kernel.org
> Acked-by: Han Xu <han.xu@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
