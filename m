Return-Path: <SRS0=4+4/=AA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409D1C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jun 2020 13:28:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1054D207FC
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jun 2020 13:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MYtZHTzi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPk1NJwh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1054D207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:
	References:In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6xcQ4hIuHNLPZekkhqPnaFeN/Pu3lWIYNkATsntXIk=; b=MYtZHTziwnUyen
	hmo+X3iz5KvBRYlRaBHWBJwIO8Rlk5W5DqqoJe27XLSJiae7VwT3doezJmAV9ZwD7IGeAYAbcC2wA
	OlsIIWIY0/OpMsgssOpv4VHris8toyns3qaQcb0DtHsta/uXLSNv37aO8eWi8RmRGqB5n6g6Xaqnz
	w20r+Ff+4XH1XnL8jyEh40egpZsvQqCCHJ9Oh0RcgfofsHtP6drradyvvAQhD63tn3P03ij2Y84IO
	8rMXlJ71afAIDfvuesSAm6Nrqk3W3uJkZNDSBEeraNlCN71lRQnfdOOxNpMFT/7FODBtJ3StoDz6u
	Fz7dsfMf8IHQjGoww88Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmH47-0005CH-Ko; Fri, 19 Jun 2020 13:28:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmH44-00058f-M0
 for linux-mtd@lists.infradead.org; Fri, 19 Jun 2020 13:28:18 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C55A62166E;
 Fri, 19 Jun 2020 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592573296;
 bh=Zlz05WKmcUJTYXlIz5yl2H2syQ5FgQ4vwLVGbolffuk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=KPk1NJwhF3h9BXiQXEbwEs/ZhjAPrfR3osy0dtW+Jpygxkl+kyMBz6EiRUiZ3IZuT
 KiwGpZBrx5Rp3NwBP6xwTrJJn311rfVhw0HcI/0hsnbUrh/WHeWs9w4/QFdmJFyVxW
 fhvT+vIF6jzKSqu5k6uW6u40NbS3zLc15j75Fms4=
Date: Fri, 19 Jun 2020 14:28:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
In-Reply-To: <20200526093604.11846-1-vigneshr@ti.com>
References: <20200526093604.11846-1-vigneshr@ti.com>
Subject: Re: [PATCH v2 0/6] mtd: spi-nor: Move cadence-qaudspi to spi-mem
 framework
Message-Id: <159257327821.5984.8587819746986520265.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_062816_752577_F2384310 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: marex@denx.de,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, dinguyen@kernel.org, linux-mtd@lists.infradead.org,
 Boris Brezillon <bbrezillon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 26 May 2020 15:05:58 +0530, Vignesh Raghavendra wrote:
> This series is a subset of "[PATCH v12 0/4] spi: cadence-quadspi: Add
> support for the Cadence QSPI controller" by Ramuthevar,Vadivel MuruganX
> <vadivel.muruganx.ramuthevar@linux.intel.com> that intended to move
> cadence-quadspi driver to spi-mem framework
> 
> Those patches were trying to accomplish too many things in a single set
> of patches and need to split into smaller patches. This is reduced
> version of above series.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/6] mtd: spi-nor: cadence-quadspi: Make driver independent of flash geometry
      commit: 834b4e8d344139ba64cda22099b2b2ef6c9a542d
[2/6] mtd: spi-nor: cadence-quadspi: Provide a way to disable DAC mode
      commit: a99705079a91e6373122bd0ca2fc129b688fc5b3
[3/6] mtd: spi-nor: cadence-quadspi: Don't initialize rx_dma_complete on failure
      commit: 48aae57f0f9f57797772bd462b4d64902b1b4ae1
[4/6] mtd: spi-nor: cadence-quadspi: Fix error path on failure to acquire reset lines
      commit: c61088d1f9932940af780b674f028140eda09a94
[5/6] mtd: spi-nor: Convert cadence-quadspi to use spi-mem framework
      commit: a314f6367787ee1d767df9a2120f17e4511144d0
[6/6] spi: Move cadence-quadspi driver to drivers/spi/
      commit: 31fb632b5d43ca16713095b3a4fe17e3d7331e28

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
