Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B152C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 21:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yh18C3s3zjFSUUHRr4K+xK3/DD7U0OxS4/OGc5JQgbU=; b=CFSy18tN2jqVdB
	HxAJOUO4tsn5bl2PbCvbe2eKy/WqshVEe3GDXWuNat9t9RU9Meyw0ENgfhaZBO3IENlH8GwO+L6i/
	ALuqWQD0Eos3vdBs1G+ju9zJ2bqfc0d8RiKc881YbnzHhm319vmpwkSsYRkFLN+6e4nAA2uIjti49
	8Ble9bTIcmAT5sXPpcZgcf76dj3W2xA61XXNUbwVDfvr+biX12gdlwcjLggF5hV7JM2JlVyH9pRoE
	bIZoUXcqqKtidvq4KExwHQv/j+obFFju5o/dQanDU9e66VM1iJsI1XS0SgJPpYoDWekeoNI737Yif
	eprTS/Ofs7OjMQwNcKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhI4i-00ATII-UG; Wed, 20 Apr 2022 21:41:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhI4W-00ATDd-IS
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 21:41:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C39B861972;
 Wed, 20 Apr 2022 21:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B471C385A8;
 Wed, 20 Apr 2022 21:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650490871;
 bh=ZJASXpwSw7EWB3yJ2BJMT6aN8Jg1dz8Snmgwr1sKRVs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FMvsoVGcPrcYM4OlyvF2c0VoWCVd9AMCEaR4+ir5agnFPA8LH1TFactw1hb1tDZhQ
 BWGY6vrEV1UGKr8rrUyWw6KUFA7eT2L075iXvOK+N6UM36KLAKwPZ/YmIEIPerQhcU
 DOHL+CUHBYHnIblLJaFBdgH5MZ2wxLYhI5jBkfo4lziTqNCwKX0w0Ipuuhlf90NbCv
 Z8wjjKaO2XolaUDzXRryJF0l4HWWjXXqbpl15rcR7CbsrXancSKeerCPeg/zrsNIWw
 8FmkyJh8EANOshDg9CFapWSmjYx5sxB/bnzd7jNzpeQO0jVtQShqRtbIVOWu5GeZmd
 XS0Ta2EuS5kYg==
From: Mark Brown <broonie@kernel.org>
To: mika.westerberg@linux.intel.com
Cc: michael@walle.cc, boris.brezillon@collabora.com,
 tudor.ambarus@microchip.com, hongli.li@intel.com, p.yadav@ti.com,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
In-Reply-To: <20220420104350.19510-1-mika.westerberg@linux.intel.com>
References: <20220420104350.19510-1-mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] spi: intel: Implement dirmap hooks
Message-Id: <165049086976.143449.15707260832201661600.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 22:41:09 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_144112_680403_608D8B32 
X-CRM114-Status: GOOD (  13.94  )
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

On Wed, 20 Apr 2022 13:43:50 +0300, Mika Westerberg wrote:
> Currently the driver goes over the supported opcodes list each time
> ->exec_op() is called and finds the suitable for the given operation.
> This consumes unnecessary amount of CPU cycles because the operation is
> always the same. For this reason populate dirmap hooks for the driver so
> that we cache the selected operation and then simply call it on each
> read/write.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: intel: Implement dirmap hooks
      commit: c2b5a40c9e50651a29ee9d110f7ebc41b8720efa

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
