Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFF8C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Mar 2023 17:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+P/QL5F9UMrvHfU+LO4BijdAx7cULS6t2tI1Z2PCf0=; b=GDe4LSY1xJgrS5
	iTMm/xlwzK/umQ/0Ap4sPcRqOkQLWSst2rFHxQBbTgUS2qG/oy31cExhQFwFCdfxC30HK7lgLUs1O
	Y2KZrG1M/NVAew80wnDkMvrlkBKSFBYAyb0o3SLdJCNkE/MwltfcR5ohYPkhshximWUw3cw6K9G/I
	aLpbmH8iPq8rC1W29dnQ2ZLfuRyz0ILicfv1+rfgEWfQMqFuyjo3vP2ylJ0rLIfTDf4sRpDzstI1E
	GUcLtY97p0XHAZknaS7oAgqd/+ogSs5fwtsiXAnjpBMEfzbstXn9W8xRzyLAXsfCIeJymu8BYWVhi
	sfOGFWwa9jBNrFYvowfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pblXe-006vho-Cq; Mon, 13 Mar 2023 17:00:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pblMn-006rbU-JD; Mon, 13 Mar 2023 16:49:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D7852B811A0;
	Mon, 13 Mar 2023 16:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD418C433EF;
	Mon, 13 Mar 2023 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678726182;
	bh=8KYXMoHAD5Z4NBIseAq6bsT/0yPZHnSTiR9g+F3H6mQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a2JoV3Ky1b2rAYHvjxOxSJk1TNI3heElPwvSF5YrOvneNeV0VdzwNhQXiUrffvmto
	 JA7P0WeiStnDt/6J8n1J9O5jnVgObXfH8lS4KXLMLBqO4DJUKBDJIvP6ivTa/Y09Sn
	 HR1pOKRuwrPDI/baAtt5wUZ6Gocqmmqr2buMgjA/aCshs3yaJSkT/BdMx60/VeJQN4
	 dkvphu6x3RN4fI6sEcajBAho9BdeW92stv1wsZ7bHVNaqIqINFZydvDFvpdEiWiF0m
	 eG/X/a/XjC1FXr2cscVZU8Cm2pQpTkDOWTAiQQum9/Cqx4Qc/c+wOmHVG5htVbTJPc
	 eI6rbG1xa4RhQ==
From: Mark Brown <broonie@kernel.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 jic23@kernel.org, pratyush@kernel.org, Sanju.Mehta@amd.com, 
 chin-ting_kuo@aspeedtech.com, clg@kaod.org, kdasu.kdev@gmail.com, 
 f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, 
 eajames@linux.ibm.com, olteanv@gmail.com, han.xu@nxp.com, 
 john.garry@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 khilman@baylibre.com, matthias.bgg@gmail.com, haibo.chen@nxp.com, 
 linus.walleij@linaro.org, daniel@zonque.org, haojian.zhuang@gmail.com, 
 robert.jarzmik@free.fr, agross@kernel.org, heiko@sntech.de, 
 krzysztof.kozlowski@linaro.org, andi@etezian.org, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com, 
 samuel@sholland.org, masahisa.kojima@linaro.org, jaswinder.singh@linaro.org, 
 rostedt@goodmis.org, mingo@redhat.com, l.stelmach@samsung.com, 
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
 pabeni@redhat.com, alex.aring@gmail.com, stefan@datenfreihafen.org, 
 kvalo@kernel.org, james.schulman@cirrus.com, david.rhodes@cirrus.com, 
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com, perex@perex.cz, 
 tiwai@suse.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
 mpe@ellerman.id.au, oss@buserror.net, windhl@126.com, 
 yangyingliang@huawei.com, william.zhang@broadcom.com, 
 kursad.oney@broadcom.com, jonas.gorski@gmail.com, anand.gore@broadcom.com, 
 rafal@milecki.pl, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com, 
 fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com, 
 linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
 venture@google.com, yuenn@google.com, benjaminfair@google.com, 
 yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org, 
 alim.akhtar@samsung.com, ldewangan@nvidia.com, thierry.reding@gmail.com, 
 jonathanh@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org, 
 linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org, 
 lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, 
 michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org, 
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 linuxppc-dev@lists.ozlabs.org, amitrkcian2002@gmail.com
In-Reply-To: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
References: <20230306172109.595464-1-amit.kumar-mahapatra@amd.com>
Subject: Re: (subset) [PATCH V5 00/15] spi: Add support for
 stacked/parallel memories
Message-Id: <167872615942.75015.12960472969249845825.b4-ty@kernel.org>
Date: Mon, 13 Mar 2023 16:49:19 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-bd1bf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_094946_042225_6E79C08E 
X-CRM114-Status: GOOD (  14.02  )
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

On Mon, 06 Mar 2023 22:50:54 +0530, Amit Kumar Mahapatra wrote:
> This patch is in the continuation to the discussions which happened on
> 'commit f89504300e94 ("spi: Stacked/parallel memories bindings")' for
> adding dt-binding support for stacked/parallel memories.
> 
> This patch series updated the spi-nor, spi core and the spi drivers
> to add stacked and parallel memories support.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[01/15] spi: Replace all spi->chip_select and spi->cs_gpiod references with function call
        commit: 9e264f3f85a56cc109cc2d6010a48aa89d5c1ff1

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
