Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC851C87FCB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Aug 2025 15:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDTsmSewJQT8gc5XPGgq36XX34zhXvskm4xhL15eTlU=; b=0nN6WS0iNSynyN
	ezFbHlxoNrT6w+vI2BDlAhmKuJDtRSqjC7fQsXjb9pwZRwh9T5XeVy4WrOgn6gTxwxuwjwW0vKIYD
	5hMrEsbtL41Vj0veScD6x98vxZ5oV9kOrOg9XajPEvoUu4YW7yud57omdI0TrlWfOzdmWXc0ghCW9
	MX1ksMwPME7Nf6Q7KV+xFruo4hlVbdOKJG7P3VWfMXPaRk6wVy9YbnbE7l9Vwdtpin1SSgFWIprsP
	yjBjRfVWDpyQSGgBmaH2NC0b/ISrQr1ehIrl+zLzo00NzT2Mub4K+SxRK/07w66Ai6IkG0OBu+mV2
	F4fUu+S5YcDjg2kZ2w7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixCT-0000000Apo9-1Akh;
	Mon, 04 Aug 2025 15:34:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwRj-0000000AhmA-0v0u
	for linux-mtd@lists.infradead.org;
	Mon, 04 Aug 2025 14:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC2F15C626F;
	Mon,  4 Aug 2025 14:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6182C4CEE7;
	Mon,  4 Aug 2025 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754318750;
	bh=dwEq30ziGgIruEqeTWeroZquDpTLXH1I7TzORUqkt7U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GPA1wPSsoFmg+e6fCSviUUN8pYv9XYYDESDtHvhEeBwH5gbCFBKnUXMPOxTz7ld+1
	 /GEQVdHCx80Df/27K820seo/rCvb0GdpXAw5aQd+HetwW1P9je1cxbdE9pcgqEEynY
	 314Du2BFQeESZJjVo59QLXUi4LMGAayh+FePje2fRHd98M+bSKyoAnEyjsiJscJImT
	 b9aPVvStc9fDdj/QuK6p+GlDNwcSxys98aSTUEODg/Spk4bLs9mHUrhOzIGAwLjW/E
	 9/61wPygIYBZgENVa23I3p3PyTsU/yzgGwKimxZHHDnGrcI6jRGL0VboXQKI/eqtAg
	 jOo4CuQvOPm8A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>,  <linux-spi@vger.kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] spi: spi-mem: Add missing kdoc argument
In-Reply-To: <20250804095013.409700-1-miquel.raynal@bootlin.com>
References: <20250804095013.409700-1-miquel.raynal@bootlin.com>
Date: Mon, 04 Aug 2025 16:45:47 +0200
Message-ID: <mafs0ms8fcfhg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_074551_296303_A187919B 
X-CRM114-Status: GOOD (  17.53  )
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

On Mon, Aug 04 2025, Miquel Raynal wrote:

> The "*mem" pointer has been added without description, describe it in
> the kdoc comment in order to fix the following W=1 warning:

Hmm, this warning does not show up for me with W=1, but does with W=2. I
am running:

   make drivers/spi/spi-mem.o LLVM=1 ARCH=arm W=1

Am I doing something wrong? I usually test with W=1 for SPI NOR patches
to make sure no new warnings are added.

Anyway,

Acked-by: Pratyush Yadav <pratyush@kernel.org>

>
> Warning: drivers/spi/spi-mem.c:594 function parameter 'mem' not
> described in 'spi_mem_calc_op_duration'
>
> Fixes: a11a51896572 ("spi: spi-mem: Take into account the actual maximum frequency")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507310409.fnuQ21qb-lkp@intel.com/
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-mem.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index d3b7e857b377..841b0995c8ea 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -577,6 +577,7 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_freq);
>   * spi_mem_calc_op_duration() - Derives the theoretical length (in ns) of an
>   *			        operation. This helps finding the best variant
>   *			        among a list of possible choices.
> + * @mem: the SPI memory
>   * @op: the operation to benchmark
>   *
>   * Some chips have per-op frequency limitations, PCBs usually have their own

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
