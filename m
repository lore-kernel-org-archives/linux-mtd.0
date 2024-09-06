Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D704DCE7B1D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12ix0zhNYTth7Uu1/ysmXhat7qlQ7ALS9l8t2sKvC2c=; b=Tup792z7MgjeUc
	Teat2aQGCy8/NJrsStei67mTwowOELLdg8aBNsk25k+A6LqjXE4qR/lPCaeIy+s/MlpJ4++sF5tMr
	k6AmUOUrGvOJBjWBsKXk7SEmHlg5keWk5LvO/eIbUhqbfTnpqj/U9vWZWBONzS4cp3zYXbKEohBiB
	xR9ZEPKfNNxfT4++hFqnAsJJm7Orh4m7EFUjWSBYe8aHhsYKgBvy1ULjMJDQnQf2cx2cdDoiC2Ahb
	YH8ICiDekhKDMDOxMBlmfOtA+Zb3zyYb4+ny7ISI2xuORVGPtbAmONnEStm1pPP5iOT80qRmFTT9Y
	ldlpZIJTh0xXFc7mCuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaY9-0000000CgEm-2Vt9;
	Fri, 06 Sep 2024 15:07:01 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaUO-0000000Cen7-3alg
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:03:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC59CC0007;
	Fri,  6 Sep 2024 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uSV5AYk7ZDvJog7/9nUDdJPZNhOvyenbw6+BpIum59Q=;
	b=PjrBDIK1j53dxsKkhKbF+hwlBjPXtgMSxzIPiVZo38j3tOSxgAC9XihKh5kLxvWUj/5BlS
	BpdAt1+9P82Y5XWF/feeLgn/3jF8idGTUOa2jR0bAO58MMZIVaY0x6XebrhUGYXvw40bDh
	R5MKno7/cZhgfAsFRzSfshivtd923+VTZLHmlbrWoi2NTFPW0u1lBcH0+zTIk2N7Akrvcu
	q7qYZ8xjz7KC384qfUbfPcfl3Q2guTaGFlEp8XzEME3jApsEVZo9NrD3eUKkoSP7BC/DJI
	TtcQBoLsIDcuFF0zOG9Y0uDzs6biRPc5BeBAxndjMQKW7Q12pbW4C35M774+1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 4/9] mtd: spi-nand: Add continuous read support
Date: Fri,  6 Sep 2024 17:03:06 +0200
Message-ID: <20240906150306.734381-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-5-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'631cfdd0520d19b7f4fc13b834fd9c8b46c6dbac'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080309_337932_E609352A 
X-CRM114-Status: GOOD (  22.84  )
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

On Mon, 2024-08-26 at 10:14:07 UTC, Miquel Raynal wrote:
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
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
