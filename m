Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B186D132D3
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2024 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6mHV4738yB6BUZHmeXjAYPpaiPgovQYfrX0NBiBjW0=; b=hKjJUC4wqQwU+E
	Z0UOZe5uJgnRzK2xnbK6nIx4bQoi/iGzxta3aVNeC5pjncREerNHUzy5w2uLOXMqaZpW/fq6mEjWn
	Bb7cm4T+AiL4awdgCPCqxB4TZ/lzf0OYKPm+2aoMxZcQvvjk8BhuQyLOEXDZCeQ5Uy9CrWnI8ghIW
	uQiOwDRUwSYRsePS9L8xxDYo42rs6dK5JwU1bJiSkfi+hK8x5LtntZAuzYCPXO5/i7XHvV2M/OSma
	/oBuH1xxE8cUMiX2DQWDfS1P60eL/E4gK1KAAgKNNUnUa8nuvdsIB8VcGdoOga7YLhKImmq+PMvae
	lHNBB/lo/NfllyB11JXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yAH-0000000E41Y-45io;
	Mon, 04 Nov 2024 14:34:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xjP-0000000DzL3-3l0b
	for linux-mtd@lists.infradead.org;
	Mon, 04 Nov 2024 14:07:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 54DC65C560E;
	Mon,  4 Nov 2024 14:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEABC4CECE;
	Mon,  4 Nov 2024 14:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730729218;
	bh=cHw5WjtOXh0me9VqJiV7HdyADOxP6s53il3edf42Mt4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kcTn19QoOZ8N3noXn3Xf0+pBYAE6lsela1cTKFNWrGKTQSmpsaMtschIea2WiPnae
	 I/OGGgjNCHCzRKy07B42miiBULfDs+10DVGDdPNwbzX8pn98sFBLxAAIlslDj6rkhW
	 8ZGtT3CBKixMm7gWTz6betED4jmRhn3PZxfN2IohbPyqJLUIpvPS+p5X4ITIBrkC2j
	 THEZtvjHDOsXVpTH9Sn8M+UIwEpLZUGHCtL+R4KDHdyDLjGiGG7l9DUfitoegWuX7A
	 w1pLAGLE6LRDl/7V1zEpJL4IUnYENCQyCJ/gU7r1TKh6wtUy//tiWx2ivMf3UXzhkc
	 aI08pXU+9iC2w==
From: Mark Brown <broonie@kernel.org>
To: miquel.raynal@bootlin.com, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241030194920.3202282-1-chris.packham@alliedtelesis.co.nz>
References: <94ffb58b-3242-4ab4-b09a-686116ced781@alliedtelesis.co.nz>
 <20241030194920.3202282-1-chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2] spi: spi-mem: rtl-snand: Correctly handle DMA
 transfers
Message-Id: <173072921657.32316.5006858752359296486.b4-ty@kernel.org>
Date: Mon, 04 Nov 2024 14:06:56 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-9b746
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_060700_013259_E3F84281 
X-CRM114-Status: GOOD (  10.67  )
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

On Thu, 31 Oct 2024 08:49:20 +1300, Chris Packham wrote:
> The RTL9300 has some limitations on the maximum DMA transfers possible.
> For reads this is 2080 bytes (520*4) for writes this is 520 bytes. Deal
> with this by splitting transfers into appropriately sized parts.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mem: rtl-snand: Correctly handle DMA transfers
      commit: 25d284715845a465a1a3693a09cf8b6ab8bd9caf

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
