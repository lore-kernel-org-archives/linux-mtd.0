Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259D0C6FA82
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Sep 2022 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MaRrSGpVxZ6quR8WtYhN4oJZ9YyjK/8sAN2u1Y0Cga0=; b=4xp+hw6fczNq9u
	UEr+lWEr5W7vXinGlzo0v9+Ms/fIEXetmmVBjAbLZHVAkx60+ps1lg+L7kn1473ogq7gZGoS0EZN0
	qmxXjm4EEMIq1sHk+2G9wmDdxX6+FE9jK17MKUXf5W4c97JcWjGc6JDMLRboLh+wtamrZ475PkYnC
	c6wiFxGx0fDS/X1cJknv3rHb7GPtaa8vErQi/iNxqc0B7fIlSbQjbQ001MIOI1bG1ihh1mfmRFruE
	WW+JtHqeZqnmLnOqwrnjomP5dNpmhWaWWqEVyt2w1cvnDvavwdYCbG47q1R895fqhgXD7o+wz9S9F
	icANcC6WU+nGF6+xTaKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX2dC-00BJAn-Vi; Sat, 10 Sep 2022 15:42:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX2d1-00BJ8N-9l; Sat, 10 Sep 2022 15:42:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A84B1B8006F;
	Sat, 10 Sep 2022 15:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F99C433C1;
	Sat, 10 Sep 2022 15:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662824560;
	bh=luECLScAoXW4trye3u3QR5BAVG50o9WKq4LURxl0cWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OglzfM37e36vzr8RIz38aKNhfmFgibKtibSrXPxPXQxdygFx+atkOZh3JNt71PUY6
	 2S0Eip2IqnsZuGY7oggCvdwm42lV9aRNn7Dn9nUzGuh/E4BcZYjwkAAn+a+jtNxp+8
	 FOXE46EQA4dSN2Km2LXB6ukzhgc7QWaVgmbUb4i2klVbVrzmJNvLapw+jTc4WgP8Sn
	 gT6sTIx/QE1RnpSC++ABbUzSwSDvU1GBgjd7UB997SV46FyILWCbmjKFFIh1JSPvq0
	 8RJ0TU+fU8kaAQVZSguBGoaIlIokY7BL2FEZpfhephsISRy9GGuv5q5iKanIgYycUH
	 ILd1FW78uL9qw==
From: Mark Brown <broonie@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>, kever.yang@rock-chips.com
Cc: linux@roeck-us.net, vigneshr@ti.com, sjg@chromium.org, miquel.raynal@bootlin.com, gregkh@linuxfoundation.org,
 linux-pwm@vger.kernel.org, richard@nod.at, heiko@sntech.de, robh+dt@kernel.org, jamie@jamieiles.com,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org, philipp.tomsich@vrull.eu, ulf.hansson@linaro.org,
 linux-kernel@vger.kernel.org, wim@linux-watchdog.org, thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
 vkoul@kernel.org, zhangqing@rock-chips.com, linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, kishon@ti.com, linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org
In-Reply-To: <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
References: <20220909212543.17428-1-jbx6244@gmail.com> <4f283231-2ed4-202b-0c23-157bce0841ee@gmail.com>
Subject: Re: (subset) [PATCH v1 01/11] dt-bindings: serial: rockchip: add rockchip,rk3128-uart
Message-Id: <166282455399.474671.11726724099870642599.b4-ty@kernel.org>
Date: Sat, 10 Sep 2022 16:42:33 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_084243_513714_74D5A4FD 
X-CRM114-Status: GOOD (  10.03  )
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

On Sat, 10 Sep 2022 00:01:28 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-uart compatible string.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[05/11] dt-bindings: spi: rockchip: add rockchip,rk3128-spi
        commit: 14c3ffd7947ef3623682148be07b9c0bb8737f37

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
