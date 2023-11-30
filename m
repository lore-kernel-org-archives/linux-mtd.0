Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844E8C4167B
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEudbqRu6u8Wkd8odsY6SpgDayyQ4Y4rCR88SA24+Cs=; b=zd8V9HvKU+IurF
	wvzi/avJVCGgw5AxqLAfJs7ziYYZuyOvSuhodNxPQssN2LafGnsEPCfw0iPuH1M/kdFJg8FMg6yom
	Iu9/L3CtxN90AyxT6D2kPlBcZ3Bia58pTQHVp52S/SfUT6aBiStgr0mnMHf59JDFSdQtrcWW3OMua
	LZA7jvtyQTrx8MXuUi/LurNItWiUSrWYWW1U/n9Xpx6YOmwznNC1ZON1SqdUtuvRS2uNzUDIP9PL9
	7HQQfhd33EOBAoXOsKq8q5HLB1+hyhPuCPMslYKagtD6KWUzLQklRcEv6Z6cQW13Rix4kb3E4PEeD
	bZh6BdCVUy1TxV7jyVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8htb-00B5EM-1E;
	Thu, 30 Nov 2023 14:20:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8htY-00B5Dk-0Y
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 14:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C3C97B8433C;
	Thu, 30 Nov 2023 14:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17432C433C9;
	Thu, 30 Nov 2023 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701353998;
	bh=QDL1PaO7K7mLVf0K1HVNsqEPDe8kw6NvsEJ0X7bDfWk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=BgEI/lwgmmGylsQSkxMkaEcz8mgHCqZAyiAXQdIAxWOuxNTvOGSUdxji6Ca1Kbp+Z
	 UE+Z8gDb5OYXiuAjahCzQqyRBFcu+qcNVuWggjtQQqMrqoi8+6wLkGxuyCnhU8NymR
	 HRO3h8+HGOpLrHXxkJT3KixyVdVeEkRtFVbEUTsWcdZezKjYj1/Iz8OU5IO8k0RzxL
	 uaeHMlSsu7bqBZeQwlpAW8yo1lZb8zG7ompN79D9X9t2vp+wgF4WaRsgxLy17MkGfK
	 uMyQsPbsdR4NG6leef22iiWOBCiq/lilMIOZaBkC9o21ZL31B0diqWC3Ha8UDElujr
	 YsG0/1g7e0EGA==
From: Mark Brown <broonie@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Dhruva Gole <d-gole@ti.com>, linux-mtd@lists.infradead.org, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Mario Kicherer <dev@kicherer.org>, Chuanhong Guo <gch981213@gmail.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 AceLan Kao <acelan.kao@canonical.com>
In-Reply-To: <20231129064311.272422-1-acelan.kao@canonical.com>
References: <20231129064311.272422-1-acelan.kao@canonical.com>
Subject: Re: [PATCH v7 1/2] spi: Unify error codes by replacing -ENOTSUPP
 with -EOPNOTSUPP
Message-Id: <170135399481.77996.14013825490187287215.b4-ty@kernel.org>
Date: Thu, 30 Nov 2023 14:19:54 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-0438c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_062000_376080_1396EA93 
X-CRM114-Status: GOOD (  14.06  )
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

On Wed, 29 Nov 2023 14:43:10 +0800, AceLan Kao wrote:
> This commit updates the SPI subsystem, particularly affecting "SPI MEM"
> drivers and core parts, by replacing the -ENOTSUPP error code with
> -EOPNOTSUPP.
> 
> The key motivations for this change are as follows:
> 1. The spi-nor driver currently uses EOPNOTSUPP, whereas calls to spi-mem
> might return ENOTSUPP. This update aims to unify the error reporting
> within the SPI subsystem for clarity and consistency.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: Unify error codes by replacing -ENOTSUPP with -EOPNOTSUPP
      commit: cff49d58f57e5667c10a0db85d7461790bb85cf8
[2/2] mtd: spi-nor: Stop reporting warning message when soft reset is not suported
      commit: 7a030abc0185b30a3fd19a7431347c6f5a82c588

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
