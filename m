Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA71C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 12:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHQTlsBFUEdTbLEYF8nIi4oEeNVoNtRMfYyOgh7zgog=; b=glxAFaDnAL/enh
	N/Np/iZ0hPMMk90gmulonxg25acZQsfhAIDr78LEVaMnHrfZv/zPLvuySfKCf4V4XWfXweUChy1nT
	9sDschQWhPPU2/C8dBzZGgZLNxw4KyOcaifpnYmG3EO2Rq5QuJxo1FFr/aAsbZgbHjM/9YUIc6RZ3
	/B6gSJW32XJcqqnxpThj/EqESFb57Gv9BFZp99ki2DrpzM89pe4G7mhun77zfBW6OnwLwtSxVy1tu
	q9FNXOtakH09hzeDxPaE0tu7iZdRIB52E/kVfhIiYT3D97fXGwtI7tISyBpPVS/St5q0pnvff3T6a
	kkBh7aebuSHndMIs6eEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJxMK-002jVq-2g; Tue, 15 Feb 2022 12:55:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJxMH-002jU1-8o
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 12:55:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BE8F6CE1F1C;
 Tue, 15 Feb 2022 12:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010A4C340ED;
 Tue, 15 Feb 2022 12:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644929701;
 bh=/K/C5MmofYFveDTJql+hvt9kSya/8PLf1e+nz7pSBUE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=R7hIu3rkp7t8TBP1x4dbEH8eEWmADb0fTkAU6r0rvRlsLFoI666arD9towYOQ02da
 66hkTPGC/n0wXBl6SXtj9n/3p74uv3bzdKG/k+vOMh/BYyBZZOfrXUq5UFEdZ5hNNW
 hxqjiTKreZfcfyP198q4JRJ/LMCEdydDQj6GKrO6LGlmOtBZZE+tXGkWE+oNW2X80i
 /pw3rlc3YC0DAdynZGhWuqvEHyjsAZK8apGrEOCp+1hst88lm9HvreRH8vfmhvS9OL
 jolouQSrjjvix1KZUQb6favfRoMCDFA2XqOQ06ysQbRioXhvEj2dSmBIfYf1xv7eOl
 /IBrE2nSO5/cQ==
From: Mark Brown <broonie@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Pratyush Yadav <p.yadav@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-mtd@lists.infradead.org, Michael Walle <michael@walle.cc>,
 Mauro Lima <mauro.lima@eclypsium.com>,
 Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Lee Jones <lee.jones@linaro.org>, linux-spi@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Jonathan Corbet <corbet@lwn.net>
In-Reply-To: <20220209122706.42439-1-mika.westerberg@linux.intel.com>
References: <20220209122706.42439-1-mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v6 0/3] mtd: spi-nor / spi / MFD: Convert intel-spi to SPI
 MEM
Message-Id: <164492969770.14011.5135767095761454169.b4-ty@kernel.org>
Date: Tue, 15 Feb 2022 12:54:57 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_045505_531547_B762AFB5 
X-CRM114-Status: GOOD (  16.32  )
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

On Wed, 9 Feb 2022 15:27:03 +0300, Mika Westerberg wrote:
> Based on discussion on the patch I sent some time ago here:
> 
>   http://lists.infradead.org/pipermail/linux-mtd/2021-June/086867.html
> 
> it turns out that the preferred way to deal with the SPI flash controller
> drivers is through SPI MEM which is part of Linux SPI subsystem.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] mtd: spi-nor: intel-spi: Disable write protection only if asked
      commit: cd149eff8d2201a63c074a6d9d03e52926aa535d
[2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
      commit: e23e5a05d1fd9479586c40ffbcc056b3e34ef816
[3/3] Documentation / MTD: Rename the intel-spi driver
      commit: 4ab13489735d9b5b6e91634eab83922914a3310c

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
