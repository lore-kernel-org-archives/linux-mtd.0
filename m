Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4EBC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHKvcyTGlEU6F2Wxi2BEWuvc29ml8Q80udLYkxOzLGc=; b=k0qOoj6XHyQOQf
	vM8TmUcXRTGPC2QkllwWcP3vYMKl9889nSpAJql/Z8z8F4V36DOLkZv+qFzAvJ4nqnXAaJgNm4Q2l
	P51xHPHjulraTipiRfdwJq4KH7eHmSCaNuK1wLBkEqQwP8vcBcx3no3/R5WTCkib6UTx0ZnBJTpeO
	QHMJLNyWIKt7/rrl0I3TQQayMR6LVou2F3aKIz1nee2t+HZYlY+OmCZtCYi7Ix4EFfAYysH80wCJz
	sGUzgrb0tGKsoeWDFbKztXaJQ5KueVTuQEUWMZXA76UpiM1N2s416cp/lfwytfB1mvKKXY15QSzl/
	FxMyKoNKriGghpolaUMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJayy-00FKOI-S0; Mon, 14 Feb 2022 13:01:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJasT-00FHQS-I3
 for linux-mtd@lists.infradead.org; Mon, 14 Feb 2022 12:54:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ED908B80B77;
 Mon, 14 Feb 2022 12:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF1EC340E9;
 Mon, 14 Feb 2022 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644843286;
 bh=r7IKb+9DggDhLCpCMSDE8pe/YCI7ZnVvJgsKsInBzVw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mCVGimMag96xNclq+j7E0EsD4ZpiDxyO3y5NoNua3NiNEa+QrmFIGzcgzcKj9x12S
 775RaIrQN/aHejUFADEdR2SBysAJW5H10XNpr+hGflR3j9ZPjmQ/siQwE2MwMH4qDO
 6fZMib83HiI5Jxgp+CpWr7w+wf44UoTY8D2/m1LtiJ+mKV5qHPIFEzsteNWAyR1XOS
 A9YRvyU4GEmUDCRZ9yARV3tHO7D3ZM0oqYFYvK2CM5/xi50IjEp+y8DyRj6Wfvv++K
 brmPnfjgg1rxHtELt5q+qZBRDgxj/eClFlN+oxpiEoTVrfiqbGvfSt6RYBGgcwEmQj
 C8C0Yhtodp1Jg==
From: Mark Brown <broonie@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>, linux-scsi@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-crypto@vger.kernel.org,
 kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20220210204223.104181-1-Julia.Lawall@inria.fr>
References: <20220210204223.104181-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 0/9] use GFP_KERNEL
Message-Id: <164484328403.12994.4553763831627919088.b4-ty@kernel.org>
Date: Mon, 14 Feb 2022 12:54:44 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_045449_810584_08607860 
X-CRM114-Status: GOOD (  11.00  )
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

On Thu, 10 Feb 2022 21:42:14 +0100, Julia Lawall wrote:
> Platform_driver and pci_driver probe functions aren't called with
> locks held and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.
> 
> All changes have been compile-tested.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/9] ASoC: Intel: bytcr_wm5102: use GFP_KERNEL
      commit: 695c105933cfa04ccf84088342193ae43e37e0f5

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
