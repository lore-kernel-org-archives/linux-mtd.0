Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B369C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Nov 2022 16:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BRyEw8WK4BH0ILyW14+//aFXWw5bZ/GRIiUWJTQYn8=; b=IjdVZc+H/J/NhY
	IPdXu13/lqrAeKzPi9P6j07xxy8rlP6w+f2BAK1igkFLlAqBDi66NyK5+CVquNShURuuExo6cjYGs
	CB3Mrit5Y/Bs1jDljpQwaB/Ky6EKsTYwj/J0r5E1YI4XIkhbt3lU3Ixwq4umxlxFKfj9udnDo9aeJ
	XoItQq1Qjdsj+jG88tLwhhviTQzTV7xK3eAS/89lv+a47fL3uTkrLVuvE681yEfR0vf8HHNfAm1OW
	Fxhvi38VNx9LCjA6QiqpB6kVzGr5bePU0qJoUgUI9vYcq0A07+lZIrIRnatFgXK94RE5l+vmrN1x/
	ThXkttYsiBTwZ0wj2sNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owmwf-005XqI-Qs; Sun, 20 Nov 2022 16:13:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owmwd-005XpJ-FJ
	for linux-mtd@lists.infradead.org; Sun, 20 Nov 2022 16:13:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB22960C7B;
	Sun, 20 Nov 2022 16:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E9FC433C1;
	Sun, 20 Nov 2022 16:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668960800;
	bh=BWpyMd5k6GTUakBKuascporQKbrd/cda2JJRMOzPYcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EpbRYHs/TeAr8AqlLzs5/Cck9PI2aMMTcznutcfb+lbZob+p79m/9KOFNxPwQ7ipH
	 Zk/0tkRYuOjGJBW1Ityo1zGmYYPalqjoGpFx1et/PLcTBCHs3xG4dyADW5/RhsNzBi
	 0aslOD4q1DjdOGv+z4icRTm6yRqAS6B0sJzdLIwLPzfW2u31Ewk0NgF0SjwSKN/D+1
	 b3fPbu3bIrRNkSoQBi7PpxBfZrRO4k+Ob9ApTY0HSl9s1Sn4X5iL5j2N7Gn6DM9sOD
	 6LjtsoqbBOrf3bVCo99qFQnQDiQQqLcrkI/NoL0EfXKC+Wbbg3G35mKo0obIvNJO7B
	 I1iw3mk5O59XA==
Date: Sun, 20 Nov 2022 17:13:08 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/9] mtd: spi-nor: Add a macro to define more banks
Message-ID: <20221120161308.w7g53l5rdgfgaggo@yadavpratyush.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
 <20221110155513.819798-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110155513.819798-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_081323_570977_83E320DC 
X-CRM114-Status: GOOD (  14.64  )
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

On 10/11/22 04:55PM, Miquel Raynal wrote:
> Most of the chips on the market only feature a single bank. However, new
> chips may support more than a single bank, with the possibility to
> parallelize some operations. Let's introduce an INFOB() macro which also
> takes a n_bank parameter.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

> ---
>  drivers/mtd/spi-nor/core.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 8a067d56c995..044d49d749e0 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -553,6 +553,10 @@ struct flash_info {
>  	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
>  	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
>  
> +#define INFOB(_jedec_id, _ext_id, _sector_size, _n_sectors, _n_banks)	\
> +	SPI_NOR_ID((_jedec_id), (_ext_id)),				\
> +	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), (_n_banks)),
> +
>  #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors)		\
>  	SPI_NOR_ID6((_jedec_id), (_ext_id)),				\
>  	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
