Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2A5606A319
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hqQsuTM/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ONl86gl0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D14sfHJtyq+vZKhMTXb3xbSmDQwOfRASyuzH/ymS97M=; b=hqQsuTM/TbDxiXIOLMQdFMpX4+
	L0nFJkQYDuYI2EJgSgi7HH/tMKGMADI+f74riKszt2nQU5ahWPL7EvnPYWcQRnzS5qK/0kYpcndOZ
	uxjavA28SMGhJAy9k6s3kwBY75ZnSPhGaAJtRjXYndJX5nonReqkTxlOBG027d5UXpHbJNsZVFVuX
	LU//MdLgCxJGnLZG91DpwOx11YpoAGlsdrehb2jotcreFHoGaLiyVw17NB2jKhdk+59YhiA7juFOy
	RSa1KPpZRYt6sELjBAjzvhD+Hu+tOxeiaNXvqTfUKzUrdYYIzFrBwe+qANF6G6hPIwL+6uAa8wVZ/
	Npm0MKog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqII-0000000DxGD-2RCf;
	Thu, 22 Oct 2026 10:45:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqIG-0000000DxFq-2EdP
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 10:45:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9A3D04E4125B;
	Thu, 22 Oct 2026 10:45:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67EB460360;
	Thu, 22 Oct 2026 10:45:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE36910328E44;
	Thu, 22 Oct 2026 12:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792665905; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=dCrqHqvHupUGX9Yb0K8VNQTC2XGQqllo1XVHZ6S5VJU=;
	b=ONl86gl0EqNN7/oWlBAo2Q48bwtbfFr8LrXVh74yH/RgfWgm6cQfOWRRu/zzZOoyPmBxCo
	w7tdSMwRh1wXWyE6P4gTbV1e7qTwIAcy6WFYcKYRIluCJcI7CUtiX4LH7s8xo1IkuMkcyb
	10JI26l2sVA49wX6Hcw7V4c2mUNOPsJ5ooN92frULR5ErhU4PZ4hicKOunWIPlVApR/OU2
	6oWGTb7GKXT7RGNQeP839zonHGpwxujfkJ7C2Tjq99tyz8RRaqdJ/aKEftIioHHglYY/Tl
	b9JdFn5fyUY2BObOjH5w4VhGE2hDgYlCpmPr9o0xfp9hGxzqXCO8tbJktVTomg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 2/4] mtd: spi-nor: Support mixed 1S-xD-xD DTR
 protocols in spi_nor_spimem_setup_op()
In-Reply-To: <20261022102614.75696-3-changhuang.liang@starfivetech.com>
	(Changhuang Liang's message of "Thu, 22 Oct 2026 03:26:12 -0700")
References: <20261022102614.75696-1-changhuang.liang@starfivetech.com>
	<20261022102614.75696-3-changhuang.liang@starfivetech.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 22 Oct 2026 12:45:03 +0200
Message-ID: <875wyuqaj4.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_034508_722642_81A079C6 
X-CRM114-Status: GOOD (  23.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/10/2026 at 03:26:12 -07, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

> Currently spi_nor_spimem_setup_op() sets all four phases (cmd, addr,
> dummy, data) to DTR whenever spi_nor_protocol_is_dtr(proto) is true.
> This is too coarse: the 1S-xD-xD DTR protocols (1_1_1_DTR, 1_2_2_DTR,
> 1_4_4_DTR, 1_8_8_DTR) send the command phase in STR on a single line,
> and only the address, dummy and data phases in DTR. SPIMEM supports
> such mixed DTR modes.
>
> Split the handling:
>
>   - For SNOR_PROTO_8_8_8_DTR, keep the existing behavior: set all
>     phases to DTR and use a 2-byte opcode (opcode + extension).
>
>   - For the other DTR protocols, set the command phase to STR and only
>     the address, dummy and data phases to DTR. Double op->dummy.nbytes
>     since DTR transfers 2 bytes per clock cycle, matching how the dummy
>     cycle count is specified for these protocols.
>
> No in-tree flash currently declares SNOR_HWCAPS_READ_1_x_x_DTR, so
> this is not a bug fix but preparation for enabling these protocols.
> A follow-up patch will enable 1S-4D-4D for the MX66L1G45G. The
> 8D-8D-8D path is unchanged.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/mtd/spi-nor/core.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 90524c58602e..43e506e728ab 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -97,13 +97,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>  	if (op->data.nbytes)
>  		op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
>  
> -	if (spi_nor_protocol_is_dtr(proto)) {
> -		/*
> -		 * SPIMEM supports mixed DTR modes, but right now we can only
> -		 * have all phases either DTR or STR. IOW, SPIMEM can have
> -		 * something like 4S-4D-4D, but SPI NOR can't. So, set all 4
> -		 * phases to either DTR or STR.
> -		 */
> +	if (proto == SNOR_PROTO_8_8_8_DTR) {
>  		op->cmd.dtr = true;
>  		op->addr.dtr = true;
>  		op->dummy.dtr = true;
> @@ -115,6 +109,19 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>  		ext = spi_nor_get_cmd_ext(nor, op);
>  		op->cmd.opcode = (op->cmd.opcode << 8) | ext;
>  		op->cmd.nbytes = 2;
> +	} else if (spi_nor_protocol_is_dtr(proto)) {
> +		/*
> +		 * 1S-xD-xD protocols: the opcode is sent in STR on a single
> +		 * line, only the address, dummy and data phases are DTR. The
> +		 * opcode stays 1 byte (no command extension).
> +		 */
> +		op->cmd.dtr = false;
> +		op->addr.dtr = true;
> +		op->dummy.dtr = true;
> +		op->data.dtr = true;

Still to coarse IMHO.

What about xS-xS-xD?

As mentioned in the spi controller patch you must make sure these are
refused if they are not supported by your controller because SPI NAND at
least allow them (and I believe SPI NOR might as well)?.

> +
> +		/* 2 bytes per clock cycle in DTR mode. */
> +		op->dummy.nbytes *= 2;
>  	}
>  
>  	if (proto == SNOR_PROTO_8_8_8_DTR && params->flags & SNOR_F_SWAP16)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
