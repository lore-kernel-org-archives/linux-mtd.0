Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618B6E677EB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Dec 2025 15:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=129jpDgRWU2ZJfw8nCih+9Q7iyxmwI/+wc2NXqAxUtw=; b=q083a/wIfrW6HC
	XBsrH/bW9E/IOZWeK6UPy5zCytzg81bcYH7LsVQZtrcbkm6B2p8IKpjrCHISWXZpwo9azfpMt8ySf
	v1NHdhju899nlcJURty/O2jFFzgP/2BAfI+wJQZZ1rsP07zvjuSbVzd01oQTEKaFvM5wgZ1aQ9MDS
	GbXdHycxjdl/82ki1hTnqDzJiKSJZo2IlcMWym03+OsOCCSuaAterh1fzsItkCxB8iFwVSQ/W/OAy
	Iogi4mC/XLmQjB1nnHxwhlg+HaufkwrSfuk19iYpPhkkZ7jHgE7CQGtRmI/LVdBdlVctbdXW+T+An
	tIJKPO48QrY4x3clZCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXi0j-0000000Dvs1-3Ffy;
	Mon, 22 Dec 2025 15:39:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXi0g-0000000Dvrt-1xY2
	for linux-mtd@lists.infradead.org;
	Mon, 22 Dec 2025 15:39:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8917E6001D;
	Mon, 22 Dec 2025 15:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B28C4CEF1;
	Mon, 22 Dec 2025 15:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766417984;
	bh=/V5uTkOThZLY7I30BoPQTRuIgxnr/DGzQyp/Dlcr4so=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QmYV56Du/16g5xUSf47U7QaqsJjAZ2u7QwuZVCJx9Nk5SQJ4u8m6YQzb4cyZQclbu
	 G0mVSmXctlI5ZUm+KoCQ7KDpoVi7R7CfcpqKoOQc2WcPlbgxSckbmDE98j/+YY3Kka
	 HPTZ3RuKE1dLljNhkawAHEqdjAt59GHgySCDrlgwE69TAPjDjYUZ6BuvyCpqQVrt5m
	 2ZzjDFCUbQf2ovaD1WeEPwmKxa8Njn7zNq5mB6YX/aGxHhapu2KcS1cpHqH91U/RIZ
	 o+ETH/Xdrx4Q39/fVmHCzgPtvO6uJ3wmMGL3eu68rmkQkNJaBAtV6IbpOEc8cFxP62
	 WmwQnOEATKJiw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  han.xu@nxp.com,  imx@lists.linux.dev
Subject: Re: [PATCH v2] mtd: spi-nor: micron-st: add SNOR_CMD_PP_8_8_8_DTR
 sfdp fixup for mt35xu512aba
In-Reply-To: <20251215-nor-v2-1-e75c0451e597@nxp.com> (Haibo Chen's message of
	"Mon, 15 Dec 2025 18:04:36 +0800")
References: <20251215-nor-v2-1-e75c0451e597@nxp.com>
Date: Tue, 23 Dec 2025 00:39:37 +0900
Message-ID: <86fr92cypy.fsf@kernel.org>
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

On Mon, Dec 15 2025, Haibo Chen wrote:

> Find two batches mt35xu512aba has different SFDP but with same
> jedec ID. The batch which use the new version of SFDP contain
> all the necessary information to support OCT DTR mode. The batch
> with old version do not contain the OCT DTR command information,
> but in fact it did support OCT DTR mode.
>
> Current mt35xu512aba_post_sfdp_fixup() add some setting including
> SNOR_CMD_READ_8_8_8_DTR, but still lack SNOR_CMD_PP_8_8_8_DTR. Meet
> issue on the batch mt35xu512aba with old SFDP version. Because no
> SNOR_CMD_PP_8_8_8_DTR, micron_st_nor_octal_dtr_en() will not be
> called, then use SNOR_CMD_READ_8_8_8_DTR will meet issue.
>
> Fixes: 44dd635cd632 ("mtd: spi-nor: micron-st: use SFDP of mt35xu512aba")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
> Changes in v2:
> - add 8D pp command in post sfdp fix up for the chip with old SFDP
> - Link to v1: https://lore.kernel.org/r/20251212-nor-v1-1-20a5a381979c@nxp.com
> ---
[...]
> ---
>  drivers/mtd/spi-nor/micron-st.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 88033384a71e5d19f5a26ca91f56a49e3017183a..5797bb748be696b340ff1398155f5ac8b1f74055 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -167,6 +167,10 @@ static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
>  				  0, 20, SPINOR_OP_MT_DTR_RD,
>  				  SNOR_PROTO_8_8_8_DTR);
>  

Please also add a comment here explaining why this fixup is needed, as
Michael suggested in v1. Probably a shorter version of the explanation
in the commit message.

With that, feel free to add:

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

> +	nor->params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
> +	spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
> +				SPINOR_OP_PP_4B, SNOR_PROTO_8_8_8_DTR);
> +
>  	nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
>  	nor->params->rdsr_dummy = 8;
>  	nor->params->rdsr_addr_nbytes = 0;
>
> ---
> base-commit: 4a5663c04bb679631985a15efab774da58c37815
> change-id: 20251212-nor-2f37cf12eeca
>
> Best regards,

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
