Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BA5C282D0
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Mar 2025 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfA2SILlLFqAvSWPXLGMj5+u2akJIEBY1Q/UP58bA18=; b=fxEVUz/+SwcWj2
	061w6n3nfM27yy8hRJQeDydic8lRHgkVzRlyIn6+jToW2DTvTAnJbZaKuiuoqU9ATOf2S/u5bNj+Y
	5h16atWHKGLy1bbSRVcVWAbJSRfpTwBgAeIGdGzpCaf9XwCFohAA5hPdLcRt9W5BPBfNvREnEFY1V
	rNNLRQtGfPk6Pk8jjym5TdVoX59QMachnN8QFEF3nK3BUxs+MsNuRmNyx74c65+w6TqD5HWq1C3np
	rj4vg3U6KjzYSC+h1Oye73g2c+FlRrIo5Br95nH2q4MORtHF5jXtwCWNnU9jJnzzKcO1CE9jLRHhF
	xl3r8uasH+s5MY/J/dTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRWP-00000004ev8-1MGo;
	Tue, 04 Mar 2025 12:37:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRTW-00000004eQB-1Ek2
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Mar 2025 12:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=mYJAi0kYrMLUjJBGm4VE6H7PayAGf7k03sqfjorHfxc=; b=X0tIcZg3FxmNMcNFrdveYqi7ZC
	hL75PgMFZtuEzisb3gnEjXhjBnaovtHM82ypmPKe2oskgXXRZVTPx0H77GjXbIqxDXWoWy98H1loc
	eWLSy0/ISXtwSCgJl4YfT561qTeSbUKNvx0/7xtq3jvz8t4kMdGbei2vp0aIC04AUZiykxUpTO1NY
	JdHwxWTLuDZq3B3JL6WvzhKMkuZVHlLazt1YXGEfECKuGBm2gwB3gAQHEBXFfkwSHa09o6FFcRe96
	1giykUFrN8jFfsui1FSDgcOQ+s4bSdEWfgX4uIqW3qSm46vZPlArg6uHdG68K8K0VxDLEy7mYu2Z8
	spflWPow==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRTS-0000000027r-3T1p
	for linux-mtd@lists.infradead.org;
	Tue, 04 Mar 2025 12:34:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C60505C5C07;
	Tue,  4 Mar 2025 12:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4FCC4CEE5;
	Tue,  4 Mar 2025 12:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741091650;
	bh=7b5Aviksp18gj3Jq/M/ztXfxsWCEz69HfwGOfusOsCo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=rkL4x7tLqt7ImDjZfOPzjkOeP2FvDPrEC/cQJtAycV6AgYSj9SIblZCpQKL7EyxHV
	 XCFLRrSGQE8PQ9fOtV3z5M7ERYqhTOTxfvAn31fHV5pGYTx69lCwMMEJ0UsBr36pRW
	 ocvu3HQ++TOe97EWv46FpYD9sY/OTPTVtVMPLj+ChKoM3S//EcNse99Z5z48UUrUJP
	 w80gHguBe3dgtcjdRdd5VQJH8J9w1b7SRLwEV6cMAHmkIxbJVlmF73aQcXvl15CadY
	 dUOwxJQ8ox6Knc4+a/yaZ3ANo3xi//dCrB1iOtijWdHvCJTVk2X+gEmweouV/Hrv9d
	 34O28QthIyVMQ==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20250224111414.2809669-1-quic_mdalam@quicinc.com>
References: <20250224111414.2809669-1-quic_mdalam@quicinc.com>
Subject: Re: [PATCH v15 0/2] Add QPIC SPI NAND driver
Message-Id: <174109164799.27220.16782141488752139254.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 12:34:07 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_123415_123102_D623ACD3 
X-CRM114-Status: GOOD (  11.29  )
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

On Mon, 24 Feb 2025 16:44:12 +0530, Md Sadre Alam wrote:
> v15:
>  * Skipping the following patches
> 	Merged:-
> 		mtd: rawnand: qcom: cleanup qcom_nandc driver
> 		mtd: rawnand: qcom: Add qcom prefix to common api
> 		mtd: nand: Add qpic_common API file
> 		mtd: rawnand: qcom: use FIELD_PREP and GENMASK
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: dt-bindings: Introduce qcom,spi-qpic-snand
      commit: fd6bc2ba410bf7828dc2104bf78b51ccbb216c40
[2/2] spi: spi-qpic: add driver for QCOM SPI NAND flash Interface
      commit: 7304d1909080ef0c9da703500a97f46c98393fcd

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
