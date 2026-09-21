Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA88EC982ED
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4J6tA7k6EPYvZ3WSqIStqPpHojRjBZSfk6in/c7xhso=; b=Mf2PiBVjTD20Pg
	j5f36ZL3udyZZHasj+HjE6Jk1UNpWd8RO/jP1FNq2jy/DamNIFVKHiXABP4ighOlSriAw2Bs943O7
	yvMy7hWvhyUzNEM+mmH7evupRef27f5fCRShvpUYBiLW8VP4pP2LbcvJyDIYZXykY94vT5CyPgoD2
	S85jM6tuWdHWmADz5z3U6MOmLbHIxVmI2fRvsCJSkkJBdcV1sehaQ+a3fDcWZ3VclDQ+/o1krh/Au
	gkVrAXVlXjBvvFPMW4Tr2Nnc84JvuhxYB+bzjocTrL3LiGMxiBxUltm1IyCTtGQAprx+x7u3zxyh3
	qE+/LspH0atnRddhziOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fmB-00000002a76-1yn8;
	Mon, 21 Sep 2026 15:17:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fmA-00000002a6q-3Adi;
	Mon, 21 Sep 2026 15:17:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38DA641A0A;
	Mon, 21 Sep 2026 15:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204551F000FF;
	Mon, 21 Sep 2026 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003870;
	bh=FZeopfMMZGjaWtQq8rssdR4HwEQQbLQYNh1E8IOw0DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FvsSq7bGpr+WQkIRqKbIFqhznCehDavMsy+xrRUogym6mY3wQDOFmTHYiBDR5utUy
	 xXnFOx0VI7OXvgUC4z2/HHL/SEm6ko7DVLbT+YWQ1jydr5XkbvhZI45RuAkLLNnxhd
	 N+A0c7UsjQhvT2to6O5OzXKZDEmjTWodrS8LweVr6zuveCd+qWq2MyQqbecvRFnYtO
	 jf06uhx5elUfYm7NkEy6yNp/gyfuP85YU6do3J+txWMitujkhsoByVbFO6oji5QpNk
	 Z/OSu5MZCfcv0CKizE1chWr9RjK8uNUA4aBue93UMThW1qFJQDzxRsB34Of1JxSXYw
	 ouyM6iHUmQJBw==
Date: Mon, 21 Sep 2026 17:17:46 +0200
From: krzk@kernel.org
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: richard@nod.at, alexandre.belloni@bootlin.com, 
	linux-mtd@lists.infradead.org, vigneshr@ti.com, bbrezillon@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	nicolas.ferre@microchip.com, stable@vger.kernel.org, miquel.raynal@bootlin.com, 
	claudiu.beznea@tuxon.dev
Subject: Re: [PATCH] mtd: rawnand: atmel: Fix HSMC clock leak in legacy
 controller init
Message-ID: <arFKmdQULrC47WYe@quoll>
References: <20260917102804.2146887-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917102804.2146887-1-vulab@iscas.ac.cn>
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


On Thu, 17 Sep 2026 10:28:04 +0000, Wentao Liang wrote:
> atmel_hsmc_nand_controller_legacy_init() takes a reference to the
> HSMC clock with of_clk_get() and enables it, but the error paths
> that follow only release the device node, so both the reference and
> the enable are leaked whenever the controller cannot be fully
> initialized.  The probe fails in that case and never reaches
> atmel_hsmc_nand_controller_remove(), which is where the clock is
> normally disabled and put.
> 
> Add an err_disable_clk path that disables and releases the clock
> before jumping to the existing out path.
> 
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 25 +++++++++++++-------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 


You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem, how to document usage of LLM and how what you should not
do if this was posted in a good faith.

Best regards,
Krzysztof




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
