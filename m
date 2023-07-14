Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D66EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jul 2023 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sp+ptsWiB0bo5+wyZHtLQftJQ/I/jNJ/pPssv1tkk0I=; b=OaBn8M5/1Z3FPE
	ZQjYR2jM8/XLQ4J0kI4kqXHkuLmbs+d/YVlQqW7OcPrWZHo0SHbC+VAgKQiL7OhbOEr+nBAbmnvD4
	sZ+SRMwQqxlsaPwlHAKNpt6V0CDR6wvnU3S0674nuuc0SuE+5KpW9VciCL+79dVyXLFM5IGYMeFbN
	R4i588wnlwykJSoKje5O9ZBfc0LWcNRyE3QTAnDTHtuRUJ4b3I1E5smL2dZzBmngQHKjv8UC0B/NE
	8UvUqnczF16fdq6pGzh7cd8nfNZqKx+11/fpwvRMzz5V3XOnS6JmEqhyXgeJeoKJLvpQey+lJhYNH
	SrDhESQBl53Ds4mzsCjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKhH-006WXI-24;
	Fri, 14 Jul 2023 15:27:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKhF-006WWe-1A
	for linux-mtd@lists.infradead.org;
	Fri, 14 Jul 2023 15:27:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 19C4061D27;
	Fri, 14 Jul 2023 15:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D23C433C8;
	Fri, 14 Jul 2023 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689348423;
	bh=PohzP/6CVU4qNJVwu6BvOLEqRA2FFMRHS3Zp9exoByM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OhA04VnYAHHzDnAUPRYio1BpG+t//WZ4aMT8Qd3OiH5CSCVekX2n3WtS7C9uiVpEm
	 Jew0J4wPPuGepXSSRePuXzOTJ7XkYuNtG/WbgXQyopAeD1tn176mXAi6MwdsiIrl+r
	 saiqL3DsS2MzU8iyojy5d3YoKE68eUcfLXdictmno4CYzLMePdSpswZcZQNZBXTAYq
	 6UXzGxny7gtAIoejg7H58nGBGsqV8fjLSVeSAoA4qI1/GQG7mP9AM+/c0m+rwsFwph
	 suUkpxHL//2GFW845r0r/lRZ1BJrJq2knHCVlRollJkJRAnX6rY+3Tm6HurG1nATOb
	 EX0bHw0RciyQg==
Date: Fri, 14 Jul 2023 08:27:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 12/18] mtd: nand: omap: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230714152701.GA1300718@dev-arch.thelio-3990X>
References: <20230707040622.78174-12-frank.li@vivo.com>
 <20230713075751.486075-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230713075751.486075-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_082705_460138_58AB98C6 
X-CRM114-Status: GOOD (  12.70  )
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

On Thu, Jul 13, 2023 at 09:57:51AM +0200, Miquel Raynal wrote:
> On Fri, 2023-07-07 at 04:06:16 UTC, Yangtao Li wrote:
> > Convert platform_get_resource(), devm_ioremap_resource() to a single
> > call to devm_platform_get_and_ioremap_resource(), as this is exactly
> > what this function does.
> > 
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> 
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Please apply the updated version at [1], the current version is
obviously not correct, as clang points out in next-20230714:

  drivers/mtd/nand/onenand/onenand_omap2.c:470:2: warning: variable 'c' is uninitialized when used here [-Wuninitialized]
    470 |         c->onenand.base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
        |         ^
  drivers/mtd/nand/onenand/onenand_omap2.c:465:25: note: initialize the variable 'c' to silence this warning
    465 |         struct omap2_onenand *c;
        |                                ^
        |                                 = NULL
  1 warning generated.

KernelCI also reported this at [2]. I apologize if this has already been
reported or fixed locally, I did not see your branch updated.

[1]: https://lore.kernel.org/20230713104422.29222-1-frank.li@vivo.com/
[2]: https://lore.kernel.org/64b137dc.170a0220.b8a13.feee@mx.google.com/

Cheers,
Nathan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
