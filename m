Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E7CC83030
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dtOPuh/a2j8bXniXgu+uR71VsHeOfkXNZjWCnNeXiU=; b=VOkDtZI5gxJabO
	Df9419qc1f6djVc80+oqNtohn5FPEdH3afBS+RHzy6j5ePhI1RgxyUAN6/19KsVwbEzsKkJO7GhUa
	C1V88v6BGw9x3vBCc4VYqjDnNfIV5SGkR7qkdglcnPt9n0HvHPr3ZHYahkF2Pq66oeuHa6vFgu1Iv
	3M1ai9N25WZ+OUPTiYv62HaFMNdtJEhKkIedD56S7cswrXMe5hIkXzl0D9XmLx6zbu4XkiBpFRzk6
	qvZWXbowTWHUlWdDvP13a/FQ9QRTe2Vgb+VHAUrzOqlNUyMcavhtYqKkVbpttCmONSLTgikJj7URA
	9zyE2d/9mLOeM3a7WEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzZ-0000000CTI0-13Hj;
	Thu, 03 Jul 2025 20:57:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLcj-0000000BmNd-0tVJ
	for linux-mtd@lists.infradead.org;
	Thu, 03 Jul 2025 15:13:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F8CB61446;
	Thu,  3 Jul 2025 15:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A21C4CEF2;
	Thu,  3 Jul 2025 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751555596;
	bh=8e5mj+lNVEPhzv6lVExpdk5WTdjfGcM+AvYmWCMOf/Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EvSYvhWQKzKV27w7+3Ixr/7N1sLHclKLx7rxFl8hztoEiB9UEDZXFfnyJy+Ax8yVX
	 zx2rVF3oiVJ11sWkrknBIDPtMOvdEYevge3k3Xw9LvmlBGD49uQ/qd1Ku7h+KaAYym
	 rMQobezhY8xiv75FaN+JJwjC7wDf4nfDQ8ffj058gv/v/TNmAZi7+YOdwxH2OgeYYN
	 /I8sANGHL9rrFBfVbHXazhJSJSk5EzYHeS0NBX3ZagEgZrSuAdV8PlmfqalqgOcCG6
	 aWFsMEISu55ziLVNqkUUO3FFzM2Nt2x5/z+AcOwZPkZ1e17zWeGk5H0i+SVtJ+nrT9
	 2Sp+Qzkye9+kw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org,  Jean-Marc Ranger
 <jmranger@hotmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix spi_nor_try_unlock_all()
In-Reply-To: <20250701140426.2355182-1-mwalle@kernel.org>
References: <20250701140426.2355182-1-mwalle@kernel.org>
Date: Thu, 03 Jul 2025 17:13:13 +0200
Message-ID: <mafs0bjq11f5i.fsf@kernel.org>
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

On Tue, Jul 01 2025, Michael Walle wrote:

> Commit ff67592cbdfc ("mtd: spi-nor: Introduce spi_nor_set_mtd_info()")
> moved all initialization of the mtd fields at the end of spi_nor_scan().
> Normally, the mtd info is only needed for the mtd ops on the device,
> with one exception: spi_nor_try_unlock_all(), which will also make use
> of the mtd->size parameter. With that commit, the size will always be
> zero because it is not initialized. Fix that by not using the size of
> the mtd_info struct, but use the size from struct spi_nor_flash_parameter.
>
> Fixes: ff67592cbdfc ("mtd: spi-nor: Introduce spi_nor_set_mtd_info()")
> Cc: stable@vger.kernel.org
> Reported-by: Jean-Marc Ranger <jmranger@hotmail.com>
> Closes: https://lore.kernel.org/all/DM6PR06MB561177323DC5207E34AF2A06C547A@DM6PR06MB5611.namprd06.prod.outlook.com/
> Tested-by: Jean-Marc Ranger <jmranger@hotmail.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

This patch hasn't had much time on the list but we are already at -rc4
and I want it to get some time in linux-next. If later reviews come in
and changes are needed, I can drop it and apply the new version. So
applied to spi-nor/next. Thanks!

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
