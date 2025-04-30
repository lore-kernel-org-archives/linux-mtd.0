Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACBEC3ABAA
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Apr 2025 22:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0t9yy2vOov+5VhF9Gh93MCNzBRg3Z4Lvv55c7TBgVMo=; b=37PY9FckoJV3Pd
	nvmn37WQaL/7TVux+LsrBG1LaHsGg9gbXpZLqUPgihZATJTIJos/3i+Isc9U+hNPYtKHLuS2UbjSQ
	hxG29GNG4BrJ9dsNXtJqrIdZBZ+/uFzYQznHW48GMOZc0JKZwL2Sz73twjSWwezwo2YmM/40lRuH6
	dC6uavHeY3no8Ct/0K34xuK2Iej9xkYxgGHPBL02n8Pk27b13e1NPC5FbS9XuFfr5t8IGeuCyoDW+
	WMrKDdwrFfBzhR2Ut+qfQdgAA9GBaaEERd8s0uAhu2+v5YGlfKYyiGuYgxKTb7q0yA6EiN1/Hzqa9
	rgJCqzhq/kfXZfgxVjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAGHn-0000000ECMR-0qiB;
	Wed, 30 Apr 2025 22:52:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAGHk-0000000ECL4-1aGJ
	for linux-mtd@lists.infradead.org;
	Wed, 30 Apr 2025 22:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A1925C3EFB;
	Wed, 30 Apr 2025 22:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DC9C4CEE9;
	Wed, 30 Apr 2025 22:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746053530;
	bh=VTTdecSWqZkIwO84VU3RpF9g0JpkxMMekW8Vy/pnaEo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lTJO18YAIi3d0IroYi+EBORuVl7CoLb7ElhpSraEB6Wkwqt4Qd2VQsBZdEbkBT5Hk
	 gVxx0mVwUzHTYKgYJCma3P1qB6POfhPEGY4aZQaZINUxl5G8K0O8QlZpmA88nzC4Ph
	 wOnXsjHPeoCsJ8ZJ0FuDfRRZu+k7t81ddBMdNPHASY4WKo66GrOukFYfCeVXIBcWM+
	 gN/R3G9WWayuAowhazXT8lhihsmb65nxqTOBMZMWpq0rCsecOfGTc8BeL6GyTW5gCd
	 TnXxU6UZTLlH9F4gBGxLubX9tMxj8tIWLwSIOKVOpcJxceItntCivN8x8BQ3CmRTw7
	 YsYSLTC5Ext7Q==
From: Mark Brown <broonie@kernel.org>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250428-qpic-snand-readloc2-fix-v1-1-50ce0877ff72@gmail.com>
References: <20250428-qpic-snand-readloc2-fix-v1-1-50ce0877ff72@gmail.com>
Subject: Re: [PATCH] spi: spi-qpic-snand: fix NAND_READ_LOCATION_2 register
 handling
Message-Id: <174605352845.3987999.9189042209512194365.b4-ty@kernel.org>
Date: Thu, 01 May 2025 07:52:08 +0900
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_155212_475496_B22B31D5 
X-CRM114-Status: GOOD (  10.04  )
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

On Mon, 28 Apr 2025 09:30:55 +0200, Gabor Juhos wrote:
> The precomputed value for the NAND_READ_LOCATION_2 register should be
> stored in 'snandc->regs->read_location2'.
> 
> Fix the qcom_spi_set_read_loc_first() function accordingly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-qpic-snand: fix NAND_READ_LOCATION_2 register handling
      commit: 36fd6275818e93d5bc44140d546bf2a45e88feee

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
