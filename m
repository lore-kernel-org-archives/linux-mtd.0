Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39161ECE57A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 13:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ncllb38+yJlRiHakI3htUNf5/H6v0ss1tFyWKuZ2H7c=; b=jhHZy09HBFx1cQ
	LydkmR+bpf0uHox3lsxKcR+LD9OWqysAJli7ZZ11OGeHJzGwFcRPkxWJ5L6LQ1+mXzf4iJT8Kzq3M
	RP+rpDiZN+uoKibVdWEHigiYHm1ES/lFupQaBPtfYDNqN1MPFNAdYvF7kHR2+1CsjivWlRiRcmirA
	zFKK4Eg/baInhHSlPE+eOERB9fSnFQAfNn1xFneBgseq0uP7YBjE+idtWwzvx0lcIQlk7ImrmI6Cp
	tDwyJ9citFhMZaxZvBCxhWekf3B9yz/93stEyEyKLLA2gjZ28spONJ9eUfQ3ZjXXVx48dEahnJ5Cq
	mGRjsHz8IA2CDt/gmWsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snekw-000000027q2-1FLj;
	Mon, 09 Sep 2024 13:48:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snek2-000000027dF-05WZ
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 13:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20E1A5C5957;
	Mon,  9 Sep 2024 13:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E88C4CEC5;
	Mon,  9 Sep 2024 13:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725889660;
	bh=ZGoU2kTAV4IE6TEddBrFeiotEx7bqq31YAXRA183Pp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bJ/RoyiUEbTffx3q685g32a2Xvf2JGZsqO5PGUN1h7VnC44/5TEcH2hoQBbiafyhf
	 IVSnnPg53KBhECV5ZqiJw2+Wx919hcly8fMBGfZsgzihr/JrzuBIVxJk0OC1QFbnxJ
	 dwwvZTrc3RwOubk/JuoOz7pSJVaMTxxfihJUw7p57AXScFq7OJHLIOhLT0CTu2F96X
	 iSDUMZAoUZNPaFVUiWJX6R5uYunyCAK1q1EGNIpvgWdhBfmXbPkmgsQik+s3fCWKaw
	 OPflEi79g6PGs6ia/P1ArFCk2GDZ/bjBzBf6RSiHfZO1FqnePJYC9RsVxKz8isVzBr
	 FtbaEtIQHRQGQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Jon Hunter
 <jonathanh@nvidia.com>
Subject: Re: [PATCH] mtd: spi-nor: fix flash probing
In-Reply-To: <20240909072854.812206-1-mwalle@kernel.org> (Michael Walle's
	message of "Mon, 9 Sep 2024 09:28:54 +0200")
References: <20240909072854.812206-1-mwalle@kernel.org>
Date: Mon, 09 Sep 2024 15:47:37 +0200
Message-ID: <mafs04j6pgcqu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_064742_147219_8A8089CD 
X-CRM114-Status: GOOD (  14.95  )
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

Hi Michael,

Thanks for the quick fix!

On Mon, Sep 09 2024, Michael Walle wrote:

> Fix flash probing by name. Flash entries without a name are allowed
> since commit 15eb8303bb42 ("mtd: spi-nor: mark the flash name as
> obsolete"). But it was just until recently that a flash entry without a
> name was actually introduced. This triggers a bug in the legacy probe by
> name path. Skip entries without a name to fix it.

We also use name in a couple other places:

1. spi_nor_get_flash_info() prints jinfo->name and info->name() in the
   dev_warn() call.

2. spi_nor_params_show() prints nor->info->name for the debugfs entry.

Since both of these are prints, it should probably be fine since they
should be converted to "(null)" instead. Still, something we should fix.
I don't think those are critical so those can be fixed as follow up
patches. I unfortunately am swamped and don't have the time to fix them
right now.

I also did a quick check to make sure we don't have other flashes
without a name.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Applied to spi-nor/next. Thanks!

>
> Fixes: 2095e7da8049 ("mtd: spi-nor: spansion: Add support for S28HS256T")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/r/66c8ebb0-1324-4ad9-9926-8d4eb7e1e63a@nvidia.com/
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
