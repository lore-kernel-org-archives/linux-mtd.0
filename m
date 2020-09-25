Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D066C4727F
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 20:44:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E9B520838
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 20:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3QPg0p3P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPHFzjT/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E9B520838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WA7azPcwtCOAgYstN8s6XUrfYSzbVj18pmRs7Wr8PV4=; b=3QPg0p3PUmF0X7SIlaVV6uIoFU
	JM7UGWT+9I3DWD0vxjRiO14Geq3icHKCJOfEJxsheOu+T+UdMgABOUaWYYyFwBEtYCPPoev2+knNd
	FrRTekQS6yb0g1L6PksDUK4F6w8dwg5+h5CgT0gqyoPFjCNAVjTBguUC1JmczncqNe217gtvK/j9K
	8kozL4WG0mOT1AFNLuA+uCZU7YPiCWrodxPsSZnTUKVOCT9/9sGZMx8shLg5ZM5sE5t5ped1mF1qJ
	NISC2+ed8WZ3OV7rRr28fXwzpmVnDpYDR4zxzLLKogSBxP1EINcgOdKWD361T/40s9LV6uc5gvP8F
	ieEvgbCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLuYe-0007Hj-Ew; Fri, 25 Sep 2020 20:43:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLuYa-0007Gk-7N
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 20:43:05 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08C892086A;
 Fri, 25 Sep 2020 20:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601066583;
 bh=xf6ysVOG2uVTAcryG8bfT29KwpI5ya8L2UosHuVYtBQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=EPHFzjT/2BkLbqF6RwI8IWvPzyWepx9xJvpGtf3UuswRKHQ/EIyNEhmucPB07JFk5
 c3hz5tlFhS0Besb9P4smZ0womnRXZuK9svCcuZc2VpB3+Lj+wOVc5fJn+yjObvAWlX
 IcaxKhAAJTd2uWJogP3cDqlZvkb4/nygZbs3PXrU=
Date: Fri, 25 Sep 2020 21:42:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Yicong Yang <yangyicong@hisilicon.com>, john.garry@huawei.com
In-Reply-To: <1600950270-52536-1-git-send-email-yangyicong@hisilicon.com>
References: <1600950270-52536-1-git-send-email-yangyicong@hisilicon.com>
Subject: Re: [PATCH 0/4] Add IRQ mode support for hisi-sfc-v3xx driver and
 some cleanups
Message-Id: <160106652820.3325.14809043608395665853.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_164304_386606_ADC825CF 
X-CRM114-Status: GOOD (  15.84  )
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
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 tudor.ambarus@microchip.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 24 Sep 2020 20:24:26 +0800, Yicong Yang wrote:
> This series mainly add the IRQ mode support for hisi-sfc-v3xx driver, and some
> cleanups for the preparation of the IRQ mode.
> After this patch, the device can work in IRQ mode, or if firmware doesn't
> declare irq support it will fall back to Poll mode.
> 
> Patch 1-2 refactor the .exec_op() path to make it simpler and clearer.
> Patch 3 factor the definition of the interrupt bits.
> Patch 4 add the IRQ support of the driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] spi: hisi-sfc-v3xx: factor out IO modes configuration
      commit: 2c8af6a59744b242a193118c799a45621476f8ed
[2/4] spi: hisi-sfc-v3xx: factor out bus config and transfer functions
      commit: f6d2737720d6f6e5f4825b7203ad8b5cfcf9906c
[3/4] spi: hisi-sfc-v3xx: factor out the bit definition of interrupt register
      commit: aac6edff843871d7d732a6aa6f495b9eb1dea83a
[4/4] spi: hisi-sfc-v3xx: add support for IRQ mode
      commit: b1dd565124bea0f3ecde87336b48c5d0e98cd5bc

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
