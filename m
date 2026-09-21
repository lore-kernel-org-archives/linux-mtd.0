Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B388C982E6
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56Tnil5JqDaUHOcfI7nAt7GvdjD5aT9YjpM/i95e6wE=; b=hSYpVopLvfjnde
	UMR8tHpwU/ZqPrgciXrwgWu3/dk56KwIPiSMe/9gDRKhRw2CnAfeca/C0uPx7Mk53t0nWpAhsGfSh
	Mf1oituUjoZncYBkjqVhw564udbKOI9tK4ffrh/iP0vWU5uKT2+Jm4X3fRfa0AWCCu3246/ZmgqpQ
	oYxR2QgBLtRli3ihpNORP7rs3sTKe1FBKX3qXpOx1ynlI7WDjksNc6q2r5+KiYMS9lmxDRfXo6hri
	YWVK+J1IwBqxySkXLwb58JWh1Nq1UZJa6zz7N2Nbg8TTvzVnvJwnLpFvmFfWEjEebktXpW6oA+5ai
	9XYktpXN9VaJ0LHgHkDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ffo-00000002Z6J-1raM;
	Mon, 21 Sep 2026 15:11:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ffn-00000002Z5y-0Qkg
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 15:11:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D8888405F5;
	Mon, 21 Sep 2026 15:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048B71F000FF;
	Mon, 21 Sep 2026 15:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003474;
	bh=ZDRQ8N++1ApttUwT3N9xaoQfi3XlqZ/LvnDqiBydZrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L5gmCXegQUbpWwF/iOX7v/aMDnaqKZK/MMBosvdkNVGreWB98Pw5TVQjXjCJt76TQ
	 BxGbp4OV5E0MOYWajMj/Lc4LAyv6CKFGPQK470CRf+2PTEY16nCux2ZBXxf13oyaMB
	 ppvHyB+ugBCaM3PGxX3yQ5bVcQ7OkbCHZkat+YBrE8296bZL4aj6sql/0/aUNB1V5k
	 TOIiLp8Udn5BwbyPscjSEYmqdaGNC9mgsVc7efJhVeCSebcCur37ICYcO5rNpCmRPX
	 elxckYSupWrqDy96pCRpL5eRAqE/wN3ADr5v98Wz7867oWk/kjv4rI2zmLzhzUWbyo
	 hx6hVKU5Nbcjw==
Date: Mon, 21 Sep 2026 17:11:11 +0200
From: krzk@kernel.org
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: rawnand: intel: fix OF node reference leak
Message-ID: <arFJDKtpHSmxkhVG@quoll>
References: <20260915163407.2487869-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260915163407.2487869-1-lgs201920130244@gmail.com>
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


On Wed, 16 Sep 2026 00:34:07 +0800, Guangshuo Li wrote:
> ebu_nand_probe() gets a reference to the NAND chip node with
> of_get_next_child(). The probe failure paths release the reference with
> of_node_put(), but the successful probe path keeps it for the lifetime
> of the device and ebu_nand_remove() never drops it.
> 
> As a result, each bind/unbind cycle leaks a reference to the NAND chip
> device node.
> 
> Drop the reference in ebu_nand_remove() after the NAND teardown using
> the flash node stored in the NAND chip.
> 
> This issue was found by manual code inspection.
> 
> Fixes: bfc618fcc3f1 ("mtd: rawnand: intel: Read the chip-select line from the correct OF node")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/mtd/nand/raw/intel-nand-controller.c | 2 ++
>  1 file changed, 2 insertions(+)
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
