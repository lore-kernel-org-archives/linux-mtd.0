Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78047C4452D
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 07:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZC7mT7bKSCZYn8dobFaWnZ5byZzsW03Kepd/o6pQDc=; b=hYqUZjt6hnmXn2
	Ng5etIGJV2AoMfwwosikyki2DQn5AZqEyCAzauqAVI6y6ahjTaqwmmoO27UMC+PfCRI0YXU9HJWP3
	CrRY7Ykzh+MNcGFa1dK8fPcOP6skYAYEgX+LsrLaUGNFrys6NFXkZK3jY0r+Zle1iEKxaTjARmUD3
	JDiKc+CT4R5mYwIcTVpHi6S/NkUuSpvzYQxNGpw8PVMGyvxtGvndAYcV27WT/gxejbC1/TviYTAKR
	dCeAvBH2bqJMsl2xIWSv9AccUDlrFlx6Bp/IlHgRMFvvAG1zUOh3moVs7ZWp7FsX/sVcj0ChJH1Z7
	hXDDZbM2LpmFXBciGFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRT2-0000000B4aS-1lt4;
	Wed, 22 Jul 2026 07:34:12 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRSw-0000000B4Z8-3WKs
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 07:34:08 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7395612F;
	Wed, 22 Jul 2026 09:34:04 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 22 Jul 2026 09:34:04 +0200
Message-Id: <DK4XCMC44A8N.2K7FFXXSXO3I2@kernel.org>
Subject: Re: [PATCH RFC 0/3] mtd: spi-nor: allow multiple erase sizes on
 uniform flashes
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <mateusz.litwin@nokia.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260720-spi_nor_multisize_erase-v1-0-38d719bfe77b@nokia.com>
In-Reply-To: <20260720-spi_nor_multisize_erase-v1-0-38d719bfe77b@nokia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_003407_031405_9DC821B8 
X-CRM114-Status: GOOD (  32.57  )
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

Hi,

On Mon Jul 20, 2026 at 5:12 PM CEST, Mateusz Litwin via B4 Relay wrote:
> Most SPI NOR flashes advertise several erase sizes (e.g. 4 KiB, 32 KiB and
> 64 KiB) even when the erase map is uniform across the whole device.  The
> spi-nor driver currently collapses such flashes to a single erase size and
> uses only that size for every erase request.
>
> This is a problem on platforms that need a small exposed erasesize for
> partition alignment (for example u-boot-env, RouterBoot soft_config, or
> boot header partitions) while still wanting fast bulk erases.  Today the
> usual workaround is to enable MTD_SPI_NOR_USE_4K_SECTORS, which forces 4 KiB
> erases for the entire device and hurts erase performance on large regions.
>
> This series introduces MTD_SPI_NOR_MULTI_ERASE_SIZE.  When enabled, uniform
> flashes keep multiple erase sizes in the driver erase map and pick the
> largest suitable erase size for each step of an erase operation, similar to
> what non-uniform flashes already do.  Userspace still sees a single
> mtd->erasesize (4 KiB when MTD_SPI_NOR_USE_4K_SECTORS is also enabled), but
> large aligned portions of an erase request can use 32 KiB or 64 KiB erase
> commands internally.
>
> The series also converts all erase-type opcodes to their 4-byte-address
> variants on uniform flashes, so multi-size erases work correctly on devices
> larger than 16 MiB.
>
> This is an RFC series. Feedback is especially welcome on whether to merge
> patch 1 alone, patches 1+2, or the full series including the patch 3 PoC.
>
> The series is stacked so maintainers can choose how much to take:
>
>   - Patch 1 adds the Kconfig option, keeps multiple erase types in the
>     uniform region mask, and converts all erase-type opcodes for 4-byte
>     addressing.  On its own it routes multi-size uniform erases through
>     spi_nor_erase_multi_sectors().
>   - Patch 2 replaces that routing with a dedicated uniform erase flow
>     (spi_nor_erase_uniform()), reducing CPU and memory overhead.
>   - Patch 3 is a proof-of-concept optimization on top of patch 2: it
>     caches the largest uniform erase type per request to skip redundant
>     spi_nor_find_best_erase_type() calls in bulk-aligned regions.
>
> Patch 1 follows an OpenWrt pending patch already used in production:
>
> https://github.com/openwrt/openwrt/blob/main/target/linux/generic/pending-6.12/402-mtd-spi-nor-write-support-for-minor-aligned-partitions.patch
>
> MTD_SPI_NOR_MULTI_ERASE_SIZE defaults to N, so existing configurations are
> unaffected.

No, not a new Kconfig option. Integrate it into the core, adapt the
current erase handling.

Also, was this assisted by AI tooling?

> Tested: backported to a 6.6-based tree on Micron MT25QU02G with
> MTD_SPI_NOR_MULTI_ERASE_SIZE enabled and MTD_SPI_NOR_USE_4K_SECTORS

Why didn't you test this on the latest kernel?

> disabled (mtd->erasesize reports 64 KiB).  librsu erases the flash with

What is librsu?

-michael

> the MEMERASE ioctl on the MTD character device, issuing erase requests
> smaller than mtd->erasesize (e.g. a 32 KiB boot header region).
> mtd_erase() does not enforce erasesize alignment, so these requests reach
> the driver, where the previous uniform path rejected them; they now
> succeed through spi_nor_is_uniform_erasable() and the multi-size erase
> path.  Verified writes and erases on the 32 KiB region.
>
> A few implementation details are worth discussing:
>
> 1. The previous uniform erase path only required the length to be a
>    multiple of mtd->erasesize.  With MTD_SPI_NOR_MULTI_ERASE_SIZE enabled,
>    spi_nor_is_uniform_erasable() instead checks the address and length
>    against the smallest supported uniform erase size.  Requests aligned to
>    mtd->erasesize still pass (it is a multiple of that size), while
>    callers may now issue erases smaller than mtd->erasesize, as the tested
>    librsu path does.  Misaligned requests are rejected rather than
>    relying on undefined behavior; please report any regressions.
>
> 2. Patch 3 addresses per-step spi_nor_find_best_erase_type() overhead.
>    As a PoC it may be dropped, revised, or split out depending on
>    maintainer feedback.
>
> 3. Patch 3 calculates the largest erase size on every request.  This could
>    be done once at init.  The same applies to the smallest erase size used
>    for request validation.  Where to store that data is open for
>    discussion if such a change is needed.
>
> 4. spansion_nor_late_init() overrides nor->erase_opcode (and mtd->erasesize)
>    for flashes larger than 16 MiB.  With MTD_SPI_NOR_MULTI_ERASE_SIZE enabled,
>    spi_nor_erase_uniform() sets nor->erase_opcode before each erase, so the
>    late_init value is not used on the erase path.  If the SFDP table masks
>    unsupported erase types in 4-byte-address mode, this is not an issue;
>    otherwise late_init() or erase-type masking may need changes for
>    Cypress/Spansion parts.
>
> 5. Some flashes do not support every erase type with 4-byte-address opcodes.
>    Unsupported types are masked by clearing erase_type[].size, but the
>    corresponding erase_mask bit is not cleared.  Erases work correctly, but
>    debugfs can show a set bit in the sector-map erase mask for a type that is
>    not listed under "erase commands".  Fixing that is probably best done in
>    a separate patch.
>
> Signed-off-by: Mateusz Litwin <mateusz.litwin@nokia.com>
> ---
> Mateusz Litwin (3):
>       mtd: spi-nor: allow multiple erase sizes on uniform flash
>       mtd: spi-nor: add dedicated multi-size uniform erase path
>       mtd: spi-nor: skip erase type search in uniform bulk erase
>
>  drivers/mtd/spi-nor/Kconfig |  25 +++++
>  drivers/mtd/spi-nor/core.c  | 247 +++++++++++++++++++++++++++++++++-----------
>  2 files changed, 213 insertions(+), 59 deletions(-)
> ---
> base-commit: df415c5e1de0f1aeefacb4e6252ff98d38c04437
> change-id: 20260720-spi_nor_multisize_erase-d644cfd4a5fb
>
> Best regards,


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
