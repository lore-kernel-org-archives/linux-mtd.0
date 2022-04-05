Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752DEC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYi1KwYoKVFOOovtHyN3j+PSMVLJa1pFTDcJvp731ts=; b=xxWwo2L0+9Ffbj
	zGm8kj2osMQYSydZIcW/PR4yCukZHpHwmd4YaYCC1WBwOQd/w+y6NiQ73HlkWk8oukhRm0HIXGpDr
	bfG/oPY0uf/74zQEazNFErC86/KNolFm6ZNc9tIDEp7DE2byMIOy86PwDV1+qFuO2mNb8KbebaHbw
	6pJC4sRMP2E3jtAKOqmIIQsfpmpGjHVmWL/O9j13zE3APqtVATW255ddGoA5c7LmRCzsqM6n8nP3e
	x2AWzLTwMVyJvWseFUq5Aig/KE01sCueUfdWqjqzZfGZsFKdqU5807gAr1LTNQV8/1H5wKwQv3oUJ
	e++NJ6TqRqGF3HaOEFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbfYR-000QhX-Od; Tue, 05 Apr 2022 09:32:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbfXy-000QMe-Jc
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2022 09:32:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 376B661654;
 Tue,  5 Apr 2022 09:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88018C385A2;
 Tue,  5 Apr 2022 09:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151141;
 bh=VRTf+8SLE8ZMTKojd3EASetnluqVW687H4SXF0zsW2E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JGtBZ/oDh86pEqP+OmDia+U3LygBe08H1yRMKvoSoDISAgKGXy9tazlTO7w983gk8
 tRYxp5nx+OL45gpWUhCLHHHVZcisMk6kb9WrRhpJPki1J88iS4hLxtKUjHiSVklUSh
 Rb15NCy14wT1yiNxK3cKubuuTUB7A/+rav0vyE0QxGG8ryr7l0xzlR0s2ZBfeR3lsg
 LqpAthEpMyNIaQN8XWNaJGEkWFRZOZhezzEgkukHfO8jnH4i2YwJr0RzgPmYIO6+MJ
 Nd644F067ZxZDUOCGMdwXw9YKd2rYSWqDl23K4eVZwjZo1wB+cY1qcI29ZP4LaZwE0
 H+hZtYTka4yUg==
From: Mark Brown <broonie@kernel.org>
To: vigneshr@ti.com, richard@nod.at, wsa+renesas@sang-engineering.com,
 geert+renesas@glider.be, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, miquel.raynal@bootlin.com,
 krzk@kernel.org
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <d196bb5849843993557a9b10f3bd28a752e5e8e0.1648562287.git.geert+renesas@glider.be>
References: <d196bb5849843993557a9b10f3bd28a752e5e8e0.1648562287.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH 1/2] mtd: hyperbus: rpc-if: Fix RPM imbalance in
 probe error path
Message-Id: <164915113927.276894.7805335417707613893.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:32:19 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_023222_768182_5DBFF9EC 
X-CRM114-Status: GOOD (  11.64  )
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

On Tue, 29 Mar 2022 16:00:38 +0200, Geert Uytterhoeven wrote:
> If rpcif_hw_init() fails, Runtime PM is left enabled.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/2] spi: rpc-if: Fix RPM imbalance in probe error path
      commit: 2f8cf5f642e80f8b6b0e660a9c86924a1f41cd80

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
