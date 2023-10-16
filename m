Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEB6CDB465
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5qfu2E2S8wU9uG05k+fTs45KkVBHK++9KTnqp6I6eg=; b=PbRdnLnc9HzkHa
	8v0ghBWYPEIQlw4VmQ+bMyPkxvbgxa1FoCZ3xFQfn1eRudUBekmGHF0MymZKN91BRAcl2wiDr17NX
	oYRhUnb1Xt3Al07/cASCE2KkpBDiV0WOQKrJJVZGhihPTBrUUAIf/SbFog32Q1cy1b9rKKzr68XtM
	RNLN+zZaWtte5DILmWxtgvoYe2Hzh3HsWGJhrT+GNwzqAX/Rq90SE7ik9MCjiRKhBBZ74eg1LyonH
	KarGgan+yiRSIsUEKG67ZxlPUL6RmC5yIVED11ZF55HAeplLQBDTopi5VVHABa73HiZjE4MgiGOlG
	H+l4MAUZMb+Y6dFragNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJsX-008zJG-11;
	Mon, 16 Oct 2023 09:27:13 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJsT-008zHn-15
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:27:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FEDD240012;
	Mon, 16 Oct 2023 09:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AnVL+zrDTr8QgteqkwzGAp+s0MFLelcomSpW2exEsdA=;
	b=MigWbuavOpPnKklMd+nDek00kQjQD4T+OPGYVxh0TG8mNbC6yPP0RjEwnIpU9C6K/RokMZ
	5cqAJlnwNAZo609xfxqRp2N+QLEnP0lOJ9NgkX2skwyGMpNUXkk3hTAtQXV7dRyBn0kXX/
	JwyZr2P7AS2Q00pGLo2wOF+btpzFvxCLjk6Od8JcYK6a3NWmkNFbNJyKTTNNDFZkIX9Km3
	VqkbmHYsdnMSZzJqZYg9NptHtJKi9BiN41E0mavBUVZl8i+BV8Src0c5zuWSbma9VWXtF8
	vNolmxwgPFqlrsTnsxsESi3LYVjXegp0PwgKMsT53wJA+uyC5dLrGh9Ol1NvdA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>,
	=?utf-8?q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>,
	=?utf-8?b?TcOl?= =?utf-8?b?bnMgUnVsbGfDpXJk?= <mans@mansr.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	JaimeLiao <jaimeliao.tw@gmail.com>
Cc: kernel@pengutronix.de,
	stable@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: Ensure the nand chip supports cached reads
Date: Mon, 16 Oct 2023 11:27:02 +0200
Message-Id: <20231016092702.288259-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922141717.35977-1-r.czerwinski@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f6ca3fb6978f94d95ee79f95085fc22e71ca17cc'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_022709_521034_C0AA05D5 
X-CRM114-Status: GOOD (  12.62  )
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

On Fri, 2023-09-22 at 14:17:16 UTC, Rouven Czerwinski wrote:
> Both the JEDEC and ONFI specification say that read cache sequential
> support is an optional command. This means that we not only need to
> check whether the individual controller supports the command, we also
> need to check the parameter pages for both ONFI and JEDEC NAND flashes
> before enabling sequential cache reads.
> 
> This fixes support for NAND flashes which don't support enabling cache
> reads, i.e. Samsung K9F4G08U0F or Toshiba TC58NVG0S3HTA00.
> 
> Sequential cache reads are now only available for ONFI and JEDEC
> devices, if individual vendors implement this, it needs to be enabled
> per vendor.
> 
> Tested on i.MX6Q with a Samsung NAND flash chip that doesn't support
> sequential reads.
> 
> Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
