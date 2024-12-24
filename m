Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD81AE77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 21:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFtII2xYXzcMMuLtVh2ssONJWBaNrHWUV4TJ51gpHbI=; b=OidsblgSjQfjcO
	Hm9yFu+ajEMm1QeEOklQpQzx5aCo6vHmZVlLys4WwSioXRkpDnDWu5IqP2nJOHgY6rHmS4YESg5Qn
	4MZZh8gmlrzfGCuME/jQUvi+NJQl5XjFSs29ChXE0DLM7SYTOgf9i8GU14mtPKvwTPb2U3RWcxD1K
	R3Xx6RA7Ocr+5+KxHLrWsedmE5USLCKfeOiMd/eby1UbxO5Y7IitSx+oSRMYPAyQ/yzUeJ9DijF4E
	sM7EHEjN3dGD9SUvpjU0B1NPV+s/035gc60wJz0oLab4SHj7XAlVQK//j9gG5pG0rs4IojSycsl8t
	S4VG2xCutEJzJvcWRvIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQCGS-0000000CowN-1RJ9;
	Tue, 24 Dec 2024 21:16:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQCGQ-0000000Covq-0GG3
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 21:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B9725C2762;
	Tue, 24 Dec 2024 21:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14CAC4CED0;
	Tue, 24 Dec 2024 21:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735074985;
	bh=L2JByK6inq58n4uMOzJQeQNnCaqlaKZXlFW0qT18JTE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BIH3tfOSL+euDCtQltL+r8JAWkgdrTF/KxtG3MhShSFLnGbBNtAJ2s8LEt1CqCPSm
	 sDuvBCkZHu4aocOWRAK0BVHIjSD29l92qrf2pJwgEa0wjMzYwfVEfuii5lIP9F0nAe
	 aMcfRWg9daadSyzyF/OX8wKd6rsdzgyQ2+aBkUzbEAvpxXrLSbVXqf5SIRnrxilQ+x
	 BImBINhJcWqhMiwP4VUNpU8AXvs/xNI6P2HUY8Rdnc2xOF0NuMlc5piypbkEetko/+
	 LhqmkUP9iviiYNGjS3f8g3AKqpc5pQZBM0jmKsOtnarcEawyrSe651xK7GUZTLIiSy
	 pEPXF8GvyGB7w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: winbond: Add support for w25q02jv
In-Reply-To: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-2-f7c4dff66182@bootlin.com>
	(Miquel Raynal's message of "Tue, 24 Dec 2024 17:47:42 +0100")
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
	<20241224-winbond-6-12-rc1-nor-volatile-bit-v1-2-f7c4dff66182@bootlin.com>
Date: Tue, 24 Dec 2024 21:16:22 +0000
Message-ID: <mafs0v7v87peh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_131626_145852_CFDD65F3 
X-CRM114-Status: GOOD (  11.98  )
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

On Tue, Dec 24 2024, Miquel Raynal wrote:

> Add support for Winbond w25q02jv spi-nor chip which shares most of
> w25q01jv's specificities as, this time, the chip is made of 4 different
> dies.
>
> Link: https://www.winbond.com/resource-files/W25Q02JV_DTR%20RevD%2007092024%20Plus.pdf
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
[...]
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 4691e7a27ba1d70c75932c4e6b60fe36102138be..888367a8ee9967b5d7c7886dd2c6a1024f659609 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -253,6 +253,11 @@ static const struct flash_info winbond_nor_parts[] = {
>  	}, {
>  		.id = SNOR_ID(0xef, 0x70, 0x19),
>  		.name = "w25q256jvm",
> +	}, {
> +		.id = SNOR_ID(0xef, 0x70, 0x22),
> +		.name = "w25q02jv",
> +		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,

Same comments as previous patch about name and no_sfdp_flags.

> +		.fixups = &w25q0xjv_fixups,
>  	}, {
>  		.id = SNOR_ID(0xef, 0x71, 0x19),
>  		.name = "w25m512jv",

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
