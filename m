Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEB0D2E9FF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gjo7O78B5NeilmbFbaCtA1S5s/h/+iIyDTr/xYPGuQw=; b=AVMp5zkTat8/93
	pDvWbk3TNevQ7m4Z9aNf94vbGUZx1yPDgV4WzzNeGGMaaBdLEWZzvzeReaM3V6IgnMNfKFpn8h9Hd
	8FDV+VfOJ9Q4S8ONvH+Yq5Mmp/DY9xQtsi7ugMqIaAzWgQi8D46z3PQjabsxgJoRB99voMZR+Z/VM
	DspuhOJPtzrepn9WvvyiLWHl36TSoDNKnL1Wf0lQowlVtKYlJzjg6yWQgaLAU/ebCGZ1BV8qise+z
	TLx9VAATRi8LLb55NHPifTYZ6bnmNVWCfkEn7oDyGVAbJJYaCKtnsRho2C1IVurMocA4G8SHHL01g
	kaKZgN6Yi7hxx9SVNE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAV84-00000000GnJ-2oRV;
	Mon, 11 Nov 2024 14:10:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAUzb-00000000FEt-1NX2;
	Mon, 11 Nov 2024 14:02:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B62EEA41669;
	Mon, 11 Nov 2024 14:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8616C4CECF;
	Mon, 11 Nov 2024 14:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731333729;
	bh=sdI2GoFfHjss+k6nPzpItWxYvNsdy9CTWpBrfpUgQb0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YAthVMoFwipRt1rboQjLhlCNM0aWs9pTsKn0Rtgb+B3XZEpehyMV/ye50x2cRmTeM
	 EtKdAP99NBLxdBnIVBWFme2H8txgWVx4zKFLNHYxaV7qss4Z+T/UozSYqK7PaPXkj4
	 EbzwqW8w6t/CXyzTjY5F7pjkm+idiV9yYC4LFv3Zus7RsmlouZB7ziniWm2md88kbP
	 ZHUB8PQIM0BNBM8AygnNu0scWi+dekyROVDJUkttIeryRos55Ff6x5KthqCJxqVAI+
	 llDLrlGweSp/ZeGnBfyJxNoqnU+6QA+cgRwHSUikl4w4Mxrhq2e0b1dETqc4uAQWyi
	 uLI8YcKR/zOeQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peng.fan@oss.nxp.com,  m.felsch@pengutronix.de,  pratyush@kernel.org,
  mwalle@kernel.org,  miquel.raynal@bootlin.com,  richard@nod.at,
  vigneshr@ti.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  shawnguo@kernel.org,  s.hauer@pengutronix.de,
  kernel@pengutronix.de,  festevam@gmail.com,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  Peng Fan <peng.fan@nxp.com>
Subject: Re: [RESEND PATCH v4 2/2] mtd: spi-nor: support vcc-supply regulator
In-Reply-To: <20241029102238.44673-2-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Tue, 29 Oct 2024 10:22:38 +0000")
References: <20241029102238.44673-1-tudor.ambarus@linaro.org>
	<20241029102238.44673-2-tudor.ambarus@linaro.org>
Date: Mon, 11 Nov 2024 14:02:05 +0000
Message-ID: <mafs0zfm57tsy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_060211_448911_53DFF219 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
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

On Tue, Oct 29 2024, Tudor Ambarus wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> SPI NOR flashes needs power supply to work properly. The power supply
> maybe software controllable per board design. So add the support
> for an vcc-supply regulator.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> [ta: move devm_regulator_get_enable() to spi_nor_probe(). Add local dev
> variable to avoid dereferences.]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
