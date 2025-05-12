Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B018EC3ABBC
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 09:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gx75c6Mey4mS5hSAuRhzg8GMNsJ6DoI0tZwzgGP2wt8=; b=wQsG7sxmgsUPw/
	W7dzapu1PRblzrjDgJIw/H0tvQ51pefCZP+uH5EQVSDcMhbnEbEj4EmfuIXV+m8LRf4Hq72uTVt/x
	PoiUuvKLVwto1sq0uBnczqwUPvV1gDjTQ9GT9cqCJN75PKJASFPxztym6W/4f7VdPCVcjWN5n9TpO
	8s/ZckaEcAMIDH5ZIfbrNgQOVT6jPfisyQ6E3MOw9OLt1r1VQexzqxCzo+uoqSr5Tb7dVM8LN4eHt
	bzfIOKF4/BBXIGRlsHC6RPuoyF/qZZ8c2znV3KLgeYxlQhLgRu3gWqxGLQJ6+6H6e7fZt3V0To/Gh
	QElY2Hkz9KFSLQb86t0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPMv-00000008u7Q-3JsI;
	Mon, 12 May 2025 09:22:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPKt-00000008tta-2PEB;
	Mon, 12 May 2025 09:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 20404A4C92C;
	Mon, 12 May 2025 09:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FEDC4CEE7;
	Mon, 12 May 2025 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747041633;
	bh=iXPNXOwECHF6vzmv4N3t7dpHwXal1mkPGC6CEteuntI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nDUqrjR+3krhDJ5Ew/pgFcib4HULQgxv4dAlZInqyhQuuxUJBdkpuer4jT/99Wvms
	 KeN2hLfi7CWsgMmXuelniYaUvQ7HplFyye9CGeYTj1qjgNT/cqDlI6U6tAu1gyPNlj
	 r2aToEYKw/cggt+4zhuutClE+6TGoIzC/gLHwEixB+1tZI9dUXg1311tkCB3/6rsVH
	 pU3MsCb6MIoOlbkCRtLrIgZMF6hSJsTLeig1rwVD2mICsjQSBHRcovAXvoG5EHnE7S
	 bSiuynmX3XWP6EFYx0fne0Kq79PAsIOGGaOnd0If2dxi9cRv5xnIcl/hYjFlsUJ78o
	 4hTU5HRjTENXg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Krzysztof
 Kozlowski <krzk@kernel.org>,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add a driver for the VIA/WonderMedia
 serial flash controller
In-Reply-To: <20250510-wmt-sflash-v1-2-02a1ac6adf12@gmail.com>
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
	<20250510-wmt-sflash-v1-2-02a1ac6adf12@gmail.com>
Date: Mon, 12 May 2025 09:20:30 +0000
Message-ID: <mafs01psu89sx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_022035_673901_358317D7 
X-CRM114-Status: GOOD (  19.30  )
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

Hi Alexey,

On Sat, May 10 2025, Alexey Charkov wrote:

> The controller is tailored to SPI NOR flash memory and abstracts away all
> SPI communications behind a small set of MMIO registers and a physical
> memory mapping of the actual chip contents.
>
> It doesn't expose chip probing functions beyond reading the ID though, so
> use lower level chip opcodes via the "programmable command mode" of the
> controller and the kernel's SPI NOR framework to avoid hard-coding chip
> parameters for each ID the way the vendor kernel does it.
>
> Currently tested on a WonderMedia WM8950 SoC with a Macronix MX25L4005A
> flash chip (APC Rock board), but should work on all VIA/WonderMedia SoCs
>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  MAINTAINERS                                  |   1 +
>  drivers/mtd/spi-nor/controllers/Kconfig      |  14 +
>  drivers/mtd/spi-nor/controllers/Makefile     |   1 +
>  drivers/mtd/spi-nor/controllers/wmt-sflash.c | 525 +++++++++++++++++++++++++++

Drivers in drivers/mtd/spi-nor/controllers/ are deprecated, and we want
to eventually get rid of the API. The expected way is for drivers to use
SPI MEM (drivers/spi/spi-mem.c). SPI MEM drivers are usually more
general and not tailored specifically to SPI NOR flashes, so it might be
a bit tricky to write drivers for specialized hardware with it. But I
think the drivers/spi/spi-intel.c driver is written for similar kind of
hardware so it should be possible.
>
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
