Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72DAC982ED
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56Tnil5JqDaUHOcfI7nAt7GvdjD5aT9YjpM/i95e6wE=; b=om2VTrJ8jtu371
	aVvU6JbAmoHiOZyOEkSBM3a9zBE+IQbzTVWaqBKJV1BkDtaWTVjY2cwbLQfk1qNgH6A6o9gUptDDE
	XXQH9dTXMf921vUQdsoAR/+xP6p8cn7tBts1XVdb6c8VZmSA5ODaf7kdg4qcA+wgCG0JPC0FwlSfh
	tJK8lOaRUDx7sI4qKPcKmf0gYatnFnVC2jVotp0nr4TWUq6cq0W3VIkCboX/cUNEsG4TOQoqYNw8b
	9D2kt/m95oboedh//PO/ulqfaGAeD4eIZLgp8glmh7bGJ0dgLwIbHY/lezYCBjqZ4BC6TltUC8Sch
	h/68r9F9eHxTp2tHiGqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fiN-00000002ZXm-2bCK;
	Mon, 21 Sep 2026 15:13:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fiL-00000002ZXa-3RGh
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 15:13:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A96440046;
	Mon, 21 Sep 2026 15:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BD31F000FF;
	Mon, 21 Sep 2026 15:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790003633;
	bh=ZDRQ8N++1ApttUwT3N9xaoQfi3XlqZ/LvnDqiBydZrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cc1hCmak9MnLVSyItvdYF19QPrqsY4ZANqMEsli5mCF1D/wouBXlfbJBRLXgsMN8d
	 mXKE+hWDqXvxgduDPBHAvrEr1CCJFbKMIawi4wSxLtzF++qSLy33WQRglavpqQbv//
	 czTJZ/5PuwE3ky01ofsn2ZaO90ZGtm3d+pMYhbQ/vpX21wzQZ2H0mvVmP1fmdTSMCI
	 jOVRMTblUcTAD0KW6cRYiIVCratM1yr/zkPA27klgQySE0WtipE/kexJTaOb5s+LGP
	 /sboowP4V7r+J5d9lp0hx9NqWN7GtDKjLEXH4RU3B/ph+nwOvrTf1OhpW2OWz5h3Gy
	 AR9WQxLY2Ta3Q==
Date: Mon, 21 Sep 2026 17:13:50 +0200
From: krzk@kernel.org
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, stable@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: intel: fix OF node reference leak
Message-ID: <arFJrf7S7IvAR27Y@quoll>
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
