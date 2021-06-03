Return-Path: <SRS0=SghU=K5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5388C47082
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 18:43:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A051613EE
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jun 2021 18:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A051613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQJBfX0ymOx8Frlw2jnNcQTBYmnQH8C1M2FW73JEI7k=; b=CL1FkNJ7KC7l87
	UcbngDnaDKnWfJszOOh3gU4dUuLYzzl7tnCLbSkWZu//idFLay/GtweHWlEnpF4PbnaPJkHDoGsR3
	l3t/BTPi3k6Q55xgvJgohZYw8bA11BXNOmU6Hm7qOYwVvy16gWzlmdhvB93a8cBdvL+lbYb60nw9n
	QZ9ZAqQMhFWgkXsVe5tiA24MzP4XaMWPWfNMj1xUzciRdO71Olbop0GeQvIx3wZkLOBdjQVpkCOHN
	lUTaBkXE1kkKtfN0U0xWDVWTuh+fY11TmKCyzgMQiz3z2c4hPEugEckdPAZ85aOwqigb35HYh0s3d
	Z42m0lpKMS5KpJJr3jZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1losIZ-00AEME-0k; Thu, 03 Jun 2021 18:42:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1losIK-00AEHp-Rt; Thu, 03 Jun 2021 18:42:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07DA5613EE;
 Thu,  3 Jun 2021 18:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622745736;
 bh=WQrPHRQ4Uy6mv7zGw5EJ9wsQksZq35+9fQzYLsvFDgg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e1XTFevauO+76U45l2+gkVxOyE8b+lA2ZEG8V1VwuxLFozPpkdsltBw1qcnFjAa1e
 wQCDGKOq7A4slp3QfctGw+BtbnHJQ8Zt/OQtLNvLTMBUKf+D5VcSdmgo+uj3nqUKFu
 mtiKfwRoDljhf1UoAIZN0F0cA4ehR2K4VvAXd7PJXP3l3ETy9+SYIfd2Em2DCtIHU5
 bfEsyYei9fe7c8ckUkMZQSXsFg+XukcLIFyj1K74uBQXdwUtvkp2tEgs/nFtNEQGTc
 68oIJq2uFpnlgjM4/x80vHZMoDxsDGchA4javhUp0yRGrHyXrohc0lrLEpvy2h8IrV
 C+VC2hnmQi7Aw==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 patrice.chotard@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
	christophe.kerello@foss.st.com
Subject: Re: [PATCH v5 0/3] MTD: spinand: Add spi_mem_poll_status() support
Date: Thu,  3 Jun 2021 19:41:44 +0100
Message-Id: <162274571326.15050.6494166618231849468.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518162754.15940-1-patrice.chotard@foss.st.com>
References: <20210518162754.15940-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_114216_940469_7C9BD21B 
X-CRM114-Status: GOOD (  13.39  )
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

On Tue, 18 May 2021 18:27:51 +0200, patrice.chotard@foss.st.com wrote:
> This series adds support for the spi_mem_poll_status() spinand
> interface.
> Some QSPI controllers allows to poll automatically memory
> status during operations (erase, read or write). This allows to
> offload the CPU for this task.
> STM32 QSPI is supporting this feature, driver update are also
> part of this series.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: spi-mem: add automatic poll status functions
      commit: c955a0cc8a286e5da1ebb88c19201e9bab8c2422
[2/3] mtd: spinand: use the spi-mem poll status APIs
      commit: 8941cd8d295e40f8ea1c0a5045d6d068b8e33eec
[3/3] spi: stm32-qspi: add automatic poll status feature
      commit: 86d1c6bbae32122c5f703b2d8acccf5d4258f2bb

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
