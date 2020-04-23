Return-Path: <SRS0=a0wE=6H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA87C54FD0
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Apr 2020 15:35:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F14D2075A
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Apr 2020 15:35:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8mJmCTg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Arreyk1t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F14D2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:
	References:In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwkwSYEvxnu4YX+iTSivUSU+cAMPePJ6Y1gQU1CjYBo=; b=I8mJmCTgZl8Vb9
	p9B/0DQOBb0rkwl2jJBZ28e8inb7531s13i9XQEnlk1RpXEt9lDLGSjzYGtkBZ6fJ7rinVwWvT0FD
	epfIGdCrAanL7+T+xQnC8k9+647tqO+N+Xmwzwgod8wgHVJMQq206xC1heVA2eOPsT3K4/JJs/kbi
	96FCsaoCytCoNWcIAB+7K7kXWrUVjUp7BbhT3uB9lKe2xUZQndhA5mbNTcImVyzt6Gr3RfGF2qPSb
	7d6B1JnQpOvrq/UtzXEaZch6T9EIm50ULExN8hu4/j3+VKtwmH7q6TMV0oIP8yDcXGdLe6742xBxR
	KRWTONxhQGFSthWzH4xA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRdt5-000288-V3; Thu, 23 Apr 2020 15:35:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRdt3-00026y-30
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2020 15:35:38 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA91920767;
 Thu, 23 Apr 2020 15:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587656136;
 bh=ZXsmhC1kCxLDQflOaCytnmzs8ahECJZVXNH4EJLbqws=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Arreyk1tf1E51/09x0x5bLKIf5iB7lkPyPRClZmKtHr1x+2nngah+r2Zk5EJUX7YP
 KrQq3bqbsQaGYu1tngrQr1D7DBVxm16U5DTLhC6YDcuiIdAvAsHe2fQsbZjXjXH6pU
 ap4gB46Wx8mZdX35bcj6GDyBRwI+XeoDTltNLkRk=
Date: Thu, 23 Apr 2020 16:35:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Boris Brezillon <bbrezillon@kernel.org>
In-Reply-To: <20200416101418.14379-1-geert+renesas@glider.be>
References: <20200416101418.14379-1-geert+renesas@glider.be>
Subject: Re: [PATCH] spi: spi-mem: Fix Dual/Quad modes on Octal-capable devices
Message-Id: <158765613372.1156.6140454895577267978.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_083537_148111_3BE6B5EA 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 16 Apr 2020 12:14:18 +0200, Geert Uytterhoeven wrote:
> Currently buswidths 2 and 4 are rejected for a device that advertises
> Octal capabilities.  Allow these buswidths, just like is done for
> buswidth 2 and Quad-capable devices.
> 
> Fixes: b12a084c8729ef42 ("spi: spi-mem: add support for octal mode I/O data transfer")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.8

Thanks!

[1/1] spi: spi-mem: Fix Dual/Quad modes on Octal-capable devices
      commit: 80300a7d5f2d7178335652f41d2e55ba898b4ec1

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
