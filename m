Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8B0CCA470
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Oct 2025 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCYNIQKXQbPgxMiDoDgw20nHmqfYkKy9fL/OMv/ZwhY=; b=uZ/y4Xmo+CczF5
	g0bIHmxzcq49cnhKuvV7EN8AptR3BfVNxK2/pP72KkZ9iw4XddofTuhz3FbrAeG5pn/zyA+FVxR1e
	ifo9cxqsuE42mxbtTtciD7PxfG/WUvRmFUIGJ6DDu9m0CrZGqa47wndAq3kecMykOsfGudshvHDk8
	VWtRuPNP+w1TxLk0mJYyaQ4X0CHpZiIUmfF+ESIcofRQ3HVl6zJgwifYtNPiNMqR1Qq//bv/KvLZG
	hGyWpr5rvSDN1lBVCnc0vmuvj6ADurSG7KVagGtf2dimMeq40yKh/Vf1Ay5xt28XUMDVUs2eSc1ER
	7Cf5Tx6VhlUAy8fgsaHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67X8-000000022hu-3KAt;
	Tue, 07 Oct 2025 13:15:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67X7-000000022hZ-0F0g
	for linux-mtd@lists.infradead.org;
	Tue, 07 Oct 2025 13:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 617B261253;
	Tue,  7 Oct 2025 13:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C175BC4CEF1;
	Tue,  7 Oct 2025 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759842912;
	bh=EqKw66Y+OkmjBtMmmweWlpeBccSxmjMZ3RwUW5S5fbg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nXe+CRfutLD+QDcbN8smikpxLCcGjxIp65qqxNzbOJ4agn93Ry+CFbBLjI/JOsTzl
	 ZFBgOroqW0LfnFeKMOQXsFSqcC4DWGfCLN3i12ZizuhWxnE+8Uy0KA/0l2I/YOmEUu
	 rT3N+VWoNPR+aVkNoV5lrOCEi6K/uu1LRx+RZKx1Eiw7snQvdVnmuXLg+fxguRJUX2
	 jnNHRT/BH2notgREqt7XteEuYBYMJlJ+mHQpgYxuyV6SD23lVPdgSBOvXcPfuLsf59
	 RkNyc/lpRGu13hAVgHxitDGN67mPhYpTjruFilzPnNiDmsvIgVDd3Do37dScBX1wo0
	 zZxRKucoSibfQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  linux-kernel@vger.kernel.org,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
In-Reply-To: <20251006223409.3475001-1-sean.anderson@linux.dev> (Sean
	Anderson's message of "Mon, 6 Oct 2025 18:34:09 -0400")
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
Date: Tue, 07 Oct 2025 15:15:09 +0200
Message-ID: <mafs0ecreontu.fsf@kernel.org>
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

On Mon, Oct 06 2025, Sean Anderson wrote:

> The datasheet for n25q00a shows that the status register has the same
> layout as for n25q00, so use the same flags to enable locking support.
> These flags should have been added back in commit 150ccc181588 ("mtd:
> spi-nor: Enable locking for n25q128a11"), but they were removed by the
> maintainer...

This makes it sound like the maintainer did something wrong, which is
not true. Tudor had a good reason for removing them. Jungseung did not
have the flash at hand and Tudor didn't want to apply patches that
weren't tested. Both were in agreement for removing the n25q00a changes.

If you are going to mention that commit, then mention the full context,
and then also mention what has changed since that makes it possible to
add those changes back in. Having tested them on the real hardware for
example.

>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> Tested with a mt25qu01gbbb, which shares the same flash ID.

Ughh, is this another case of flash ID reuse? Do mt25qu and n25q00a
flashes behave exactly the same and only have two names? If not, then
how do you know if n25q00a will also work with these changes?

>
>  drivers/mtd/spi-nor/micron-st.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 187239ccd549..17c7d6322508 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -486,6 +486,8 @@ static const struct flash_info st_nor_parts[] = {
>  		.id = SNOR_ID(0x20, 0xbb, 0x21),
>  		.name = "n25q00a",
>  		.size = SZ_128M,
> +		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
> +			 SPI_NOR_BP3_SR_BIT6,
>  		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
>  		.mfr_flags = USE_FSR,
>  		.fixups = &n25q00_fixups,

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
