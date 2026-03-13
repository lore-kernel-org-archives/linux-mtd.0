Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B48105F798
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ye4uTYS7DCpX1cfLK+cC87qyMyONa9xHDTByWvIYrlg=; b=GScIn3AoPajJE6
	o7+I4IyCOqAhNDSNaNVD7EWvvYaC6ZinzjDYE8MMNYR5G6v08Ws2afk+lWZZFpEP70TMa5grJVUJs
	i8xHMWtxh4ZM10qmthoMK+PcAKuIFxAIxroymS76+iqIThARtuBYH/tYqOs39KuupFNigFDu5Fn73
	wyJOHiBc3DRYxqx9jlFiWnUmgqkCUY3DXWKK1d6x4pAzeypcT+Yt9XUCEtT0WDuEQOPuVgQye+tIK
	hI0gPJ4I4Ua2C9e14Hbgx2lcImaflqa1QoT19OPQXx75RkcM8BbOiTosV+XlpnoxeVHcXI1QOnNru
	bib69nICBWRS4TxLUCrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Jb-0000000HZLL-40Z7;
	Fri, 13 Mar 2026 11:04:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10Ja-0000000HZKt-2UaR
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 11:04:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B569560130;
	Fri, 13 Mar 2026 11:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EC0C19421;
	Fri, 13 Mar 2026 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773399861;
	bh=aDY7aDvju9S0EycKm7uyON4BJEJMwtI97NvuRv3BhK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tdaxiyrtxhzO4ftXor8cTENoD/FIZTK68iKKFalpNdkeHI1FSjWQgh1SPwgua8p7D
	 rPdyXyu30pSK1YBAFK8tE9J0oIRLBQNZhAbJ0f1zcb5fAIBMFrpGHHmKs2pYmP/l/e
	 B4GRER4/pwo1Lt5EW52R33Qqx2RkQEkoEXB9TAHSxdfMLnu0XOYlEdKGUUpt3Elv4D
	 zPb15B3TEiD161LQ9MBn6bZ8FHWfB/8VvX31WVREFID/zrIR4kC74emWcKY53UD6z/
	 r6LzM2sR7qPMjm7XfzBfFYVhVHcYV73HtFXdAYLWQTVC7hUlcAJLgMTMFboYxDlttC
	 OkF+sTFjUHrkA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,  han.xu@nxp.com
Subject: Re: [PATCH v3] mtd: spi-nor: micron-st: add SNOR_CMD_PP_8_8_8_DTR
 sfdp fixup for mt35xu512aba
In-Reply-To: <20251223-nor-v3-1-09e26797a8b5@nxp.com> (Haibo Chen's message of
	"Tue, 23 Dec 2025 11:01:02 +0800")
References: <20251223-nor-v3-1-09e26797a8b5@nxp.com>
Date: Fri, 13 Mar 2026 11:04:17 +0000
Message-ID: <2vxz8qbwf0su.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Tue, Dec 23 2025, Haibo Chen wrote:

> Find two batches mt35xu512aba has different SFDP but with same
> jedec ID. The batch which use the new version of SFDP contain
> all the necessary information to support OCT DTR mode. The batch
> with old version do not contain the OCT DTR command information,
> but in fact it did support OCT DTR mode.
>
> Current mt35xu512aba_post_sfdp_fixup() add some setting including
> SNOR_CMD_READ_8_8_8_DTR, but still lack SNOR_CMD_PP_8_8_8_DTR. Meet
> issue on the batch mt35xu512aba with old SFDP version. Because no
> SNOR_CMD_PP_8_8_8_DTR, micron_st_nor_octal_dtr_en() will not be
> called, then use SNOR_CMD_READ_8_8_8_DTR will meet issue.
>
> Fixes: 44dd635cd632 ("mtd: spi-nor: micron-st: use SFDP of mt35xu512aba")
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied to spi-nor/next. Thanks!

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
