Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00F9C5479D
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 11:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtDbEs4hDkhp2ZEICbosJ+nSEP91qEOK+PUKotlfjmo=; b=ecYgs1QS5HZ7tf
	2XiJc+gBshIZbQNd59rMQqUx3tnRijRRP9d7cll6qurLJ7poQ2kHsOymwImQxZV1S2o2/4rmUjYS5
	UTXELmx37MWxw1hjdWwfZCkMsomf0yCfY2+99QvmvNNl6OSQQQmW46jKITkNsNfvWTLfqeIL3apVy
	py+pQk0z+dR8YmRHKex/jto974lISFIuywhg5v7Us6hlg+31LjTm8dyN3wPMIbhFuX+8DXqVhLDo+
	+D9PMPfuwTdteykX5eM7z2vo3b/vBaGQH0Iz3Jp5ME8rJ86oDfheH0HNEoqvl0oxYOetPTfaXp28F
	raTfMckAIqqRmzHUv7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIwS-00AmXK-QH; Mon, 02 Jan 2023 11:25:21 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIrk-00AjaO-To; Mon, 02 Jan 2023 11:20:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 00283100008;
	Mon,  2 Jan 2023 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672658426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dYSHMB3px/jIzZ5HFen7sFam2xnxq7pikzKYVodSq3I=;
	b=arMLhacMCERN07gJ4h8Jn5h+tcPOuaa42Z5egJCgu6quaZjj0eCSo+R41K9GO8dNjRdmA5
	64GjjjbRnK+MMNs/+1PpFzTZA4Wdw9M7KiIxOop7LXlQVzRQdvnrweeu6Iq8lCyMTY0QYx
	OfT6LtFt7D9BtOvqXK63VVrnzwjBeqf4N1J+fMGvb3DdYjgUDrGu61EZ/raHERXv711C4l
	j2Y9ivSMFXbmbvJ0gOgCjmLk9jrvutwaV/bKNOulRONkyxntqNaQimAU7M9cYqoDYquJGw
	0e0bdmShLnRUpB1oTxXinNfhlW65902JWaAIlTq1XbmJGpuDgY1ryBWadgGs7w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/7] mtd: rawnand: sunxi: Clean up chips after failed init
Date: Mon,  2 Jan 2023 12:20:24 +0100
Message-Id: <20230102112024.250862-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229181526.53766-2-samuel@sholland.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6d7fea226b238b95d69faba49b8faf73d6e8c469'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_032029_141234_F6048E5F 
X-CRM114-Status: UNSURE (   7.04  )
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

On Thu, 2022-12-29 at 18:15:20 UTC, Samuel Holland wrote:
> If a chip fails to initialize, we need to clean up any chips that were
> already initialized/registered.
> 
> Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
