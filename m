Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F167CCD343F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/GRuJj6HmD5HTIbEnpsdaqPh67dQSfEx9hl12rmydU=; b=VrN9kboed73gAo
	Jnvp0jczTZfTZABnYjoDulzNa02l/tvHHIZRHfzE76ePYxLo4KG7CQlQUndiBegkpxfrdo1rukIKb
	j41YjuLcxmRxf6Lb9kGQqbrzmV4vulTMC+LTuzHVnK3y8V9x5zfRvWsfNh6tK0Cc/ti9oj4X9dLrS
	sLjfIFxR60D2aTxVcqN6tkHpZNd66ObjxiunkeA7HFLZk+fOOw65ISXF7UMvqetOb3GMv4Q+nyrDY
	K723iYRkvKZYzIKJB4/K/Jalzudcjq8JjvLf/Ya6tE2nJqLoyLDqb8gxwHwezqV7bX7hsnhQT04Ew
	x9+mOppcVjycxgPpe8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHsn-0000000GgnK-3FDr;
	Tue, 05 May 2026 15:40:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHsl-0000000GgmY-3OFx
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 15:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70B9540DE9;
	Tue,  5 May 2026 15:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15BAC2BD04;
	Tue,  5 May 2026 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995623;
	bh=049qJAgxHgN7rjuqk0ssOpe8JOJ4sYqPMqmLvTrcURA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eXHG/2X8k3o03NZxsIJjI388gsoNF56px4sHtOhl/I9OeCXbfh0QUr/eCL+r/vZF0
	 ulBEyh4btxyEusuJ2NwDWHa5He+24I6TTyJdnJ7R8H/8igz4sSP3KUfxEZfChZhtkA
	 RSn6jASEUBBBl4OUbF7royOrK3DY1aC7/+e9ILKE9HrG9ipae4Ea+1M3kdDOZLeu1/
	 3usxfK9IFZ7+dkr5+CCUH7m+fQiQZUWYcHYnmdJwxGOrpSb2Y5BYIspyX3Q052iTF1
	 DVkf6lR9tOtGNqstb0nQvoUT7XuA16VPHe4mV4BByWe97yWMbR1jjqmP6OsC55tDyY
	 8N2/r2cBVnXrg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Sean Anderson
 <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 07/27] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-7-833dab5e7288@bootlin.com>
	(Miquel Raynal's message of "Fri, 03 Apr 2026 18:09:25 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-7-833dab5e7288@bootlin.com>
Date: Tue, 05 May 2026 17:40:18 +0200
Message-ID: <2vxzfr4527bx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_084023_863783_86E944A5 
X-CRM114-Status: GOOD (  17.91  )
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

On Fri, Apr 03 2026, Miquel Raynal wrote:

> Add comments about how these requests are actually handled in the SPI
> NOR core. Their behaviour was not entirely clear to me at first, and
> explaining them in plain English sounds the way to go.
>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/swp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 1d50db1ef1a0..64a917543928 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -346,6 +346,14 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
>  	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf[0]);
>  }
>  
> +/*
> + * These ioctls behave according to the following rules:
> + * ->lock(): Never locks more than what is requested, ie. may lock less
> + * ->unlock(): Never unlocks more than what is requested, ie. may unlock less
> + * -is_locked(): Checks if the region is *fully* locked, returns false otherwise.
> + *               This feeback may be misleading because users may get an "unlocked"
> + *               status even though a subpart of the region is effectively locked.
> + */

We already have some text where struct spi_nor_locking_ops is defined.
Can we move this information there?

>  static const struct spi_nor_locking_ops spi_nor_sr_locking_ops = {
>  	.lock = spi_nor_sr_lock,
>  	.unlock = spi_nor_sr_unlock,

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
