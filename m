Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE8AC87FD3
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Aug 2025 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ov2zIMJdZZKEsVgaVXYuy3wM+t56QCApPiH/P2G8XAE=; b=ZsFIogDdHRr8lC
	3qvMP6gLLQlIO2hDlF6x2l656XE2Gc7T1smSu5Jb2rk+HqHpq/CzJu6axCIThQKK4U4T17E/so/m9
	OT2bjoGOSZddM8It1OBgx18vl5fwavQIXm81K7M9ysQ7k3wn7CpqcUY8LqFeI0j2isPev+WMQ/k7q
	1FXi84/rkM3KBIN3+igY7Mwyw4jJiVtpOrkhqCef0fFEmad7S5MJaD+1kaG8W2gzWN2l91Bw7yabT
	eS88TNeWSLXvQMqmpUXZtf+UUBodWNw4RIiDfE7P624NvGQAtXWgBL2JDrle8/FCau5pWRUInpsH0
	e/Go4xkeEFtPewMyoBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdIr-0000000F9E5-0jnE;
	Wed, 06 Aug 2025 12:31:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdIn-0000000F9Cd-336F
	for linux-mtd@lists.infradead.org;
	Wed, 06 Aug 2025 12:31:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 714D0A55B2A;
	Wed,  6 Aug 2025 12:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A37C4CEE7;
	Wed,  6 Aug 2025 12:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754483488;
	bh=FFC9pRgQhsqnQb1w7Nn6I7yMkG5BPeWxZRIeBBGZbss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nT+TFjL0imbvqw8ZDDn6B7dvw7VmO4QUrzSzIARhcfN4tMuP1d4WM6Yc/yw1intKj
	 i3QKujIPfHnPiEYGeTO5wZueb4smIW3fWMKEOQ3pfkxbfcC7KRUEECwnuNYz5sMNpC
	 B7RcrcOX7A0PJJahUg/HhX2WcW7Cgr+9YDtWHy8tBQHiWFQT8O2+15QMxQY1+/F9Uo
	 2E/GuKZtIbO+Y7zOUtuvzV3z3UifAC7N+diOJsxrypVX7dN20IkQmQL5gtcTcuPJOT
	 KtAr4+ig2XvyGGjoVQgZGLpL34V/8n0MoLtLI4LS/pbSqn+7XHpwFIT/Hbx9q0KsYu
	 XnyL8CXFz+aCw==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
 linux-mtd@lists.infradead.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20250804095013.409700-1-miquel.raynal@bootlin.com>
References: <20250804095013.409700-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] spi: spi-mem: Add missing kdoc argument
Message-Id: <175448348502.51843.4178346530523985516.b4-ty@kernel.org>
Date: Wed, 06 Aug 2025 13:31:25 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_053129_832533_08FBE73C 
X-CRM114-Status: GOOD (  12.17  )
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

On Mon, 04 Aug 2025 11:50:13 +0200, Miquel Raynal wrote:
> The "*mem" pointer has been added without description, describe it in
> the kdoc comment in order to fix the following W=1 warning:
> 
> Warning: drivers/spi/spi-mem.c:594 function parameter 'mem' not
> described in 'spi_mem_calc_op_duration'
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mem: Add missing kdoc argument
      commit: 72332439e6b0a39e763d4604e71774ab83423275

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
