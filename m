Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E323CD4857
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Sep 2024 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkzAWhX5AhhogvFkkXXeZ/i9wOwX0I4xnVdBGQynGJQ=; b=ezhpUnF9MMMNt3
	pklpt3AK5njFAGe4WBaISWiTyI9t5CHKjIjUESIoPk1ZjQlOcIAMLFxFiGo9+eDHKlDLe1hOWzPDK
	NEmQXamLUPbZDzRRd/RhUxpLQDBWanjLadnxqZ7t4e8AcE2lGkmVGrcvZK2fQ9uDXiLNJwcxtvGej
	BNn6UgeUU8TXmp6xKzsBdkAkCoZiJCQ4XriqtQpOcowrJWBK8fH8WBFopJKPa/cptQUC9EgxJY8LC
	qwvwq7ub/k5QYjfNV5Q7gWC3kuAJUgSCa1vkqHwdUEpGZk3LapQNIksrAn/hQZBZKidns6xqqvwpr
	Ehcxh82OIQavO0KDKnZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slry6-0000000513k-0XG9;
	Wed, 04 Sep 2024 15:30:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slqvE-00000004lpS-3KsU
	for linux-mtd@lists.infradead.org;
	Wed, 04 Sep 2024 14:23:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 961A85C5720;
	Wed,  4 Sep 2024 14:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7041FC4CECC;
	Wed,  4 Sep 2024 14:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725459827;
	bh=7n7oB0oC6DyYikJgctwQKx7I8FtPigswiIGTeGe/TqM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eqOPBwXNFTqYFgoHLTCukpnBaBhXSA6ZM1Wuk1NomB+zltbNPYvMF8A2EpjKBrlxJ
	 +2Yri/9RnrELSt2ASxxVZkVraBVvuCx1NGg3VHOA2ENsrFuPUHwbRrD6l5lMdvojc3
	 lfyJtpN0hNkJdfKMsUzZHYJAaugB+fCJbcU28AMBjkFP2zQC5+9QbnZt1gnFC8seQq
	 K3fg2xHWX8nGyQ0TS6mwKAPkqtwePh/YRaNGnBwXDkyLc03xYHvUcS5hShzEbeaW1D
	 nl3o+lXWB6kEGLzDHXpfkIsflr8IaFnn3MkFLwPGJAplMvEr9zLdlVVp7pN7Si4w5a
	 tWk4UeQ8Coi8A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Julien Su <juliensu@mxic.com.tw>,
  Alvin Zhou <alvinzhou@mxic.com.tw>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 4/9] mtd: spi-nand: Add continuous read support
In-Reply-To: <20240826101412.20644-5-miquel.raynal@bootlin.com> (Miquel
	Raynal's message of "Mon, 26 Aug 2024 12:14:07 +0200")
References: <20240826101412.20644-1-miquel.raynal@bootlin.com>
	<20240826101412.20644-5-miquel.raynal@bootlin.com>
Date: Wed, 04 Sep 2024 16:23:45 +0200
Message-ID: <mafs0r09zh4zy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_072349_012065_02CE5817 
X-CRM114-Status: GOOD (  23.91  )
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

On Mon, Aug 26 2024, Miquel Raynal wrote:

> A regular page read consist in:
> - Asking one page of content from the NAND array to be loaded in the
>   chip's SRAM,
> - Waiting for the operation to be done,
> - Retrieving the data (I/O phase) from the chip's SRAM.
>
> When reading several sequential pages, the above operation is repeated
> over and over. There is however a way to optimize these accesses, by
> enabling continuous reads. The feature requires the NAND chip to have a
> second internal SRAM area plus a bit of additional internal logic to
> trigger another internal transfer between the NAND array and the second
> SRAM area while the I/O phase is ongoing. Once the first I/O phase is
> done, the host can continue reading more data, continuously, as the chip
> will automatically switch to the second SRAM content (which has already
> been loaded) and in turns trigger the next load into the first SRAM area
> again.
>
> From an instruction perspective, the command op-codes are different, but
> the same cycles are required. The only difference is that after a
> continuous read (which is stopped by a CS deassert), the host must
> observe a delay of tRST. However, because there is no guarantee in Linux
> regarding the actual state of the CS pin after a transfer (in order to
> speed-up the next transfer if targeting the same device), it was
> necessary to manually end the continuous read with a configuration
> register write operation.
>
> Continuous reads have two main drawbacks:
> * They only work on full pages (column address ignored)
> * Only the main data area is pulled, out-of-band bytes are not
>   accessible. Said otherwise, the feature can only be useful with on-die
>   ECC engines.
>
> Performance wise, measures have been performed on a Zynq platform using
> Macronix SPI-NAND controller with a Macronix chip (based on the
> flash_speed tool modified for testing sequential reads):
> - 1-1-1 mode: performances improved from +3% (2-pages) up to +10% after
>               a dozen pages.
> - 1-1-4 mode: performances improved from +15% (2-pages) up to +40% after
>               a dozen pages.
>
> This series is based on a previous work from Macronix engineer Jaime
> Liao.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
