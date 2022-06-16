Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455F2C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 12:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mozK1oEEmZCjCfQMnvDkUpT8OYNCKjrtelopjkX8DfE=; b=gfFphpr6ccBckr
	rkKmrx15cCAZQJ3sGlTk3UWKL7T4VGr9QMya7N01aZaabaDPSLnUjyozg0070aOctTTzNYIbV18ye
	9mrBgIlpLLvm/6+7U/Zx9eYH5N2GHqP0t65I4ye0pTcg1cwU3r/aoVG0t9bhP1OL/gYRgluck6oR7
	jnn1GXv2/q2nBehflFCAtmk8fmOlaW2tCuKPbPu5KUPb1hEXZjfzJQ3xa3wfJLEIpzkQodGgY9Amm
	9VHq/Q92Bqx7thJt3vtpVd10FnqK98/DuxWgECpnI/fC/o18RruXPKINFbrzulKNCeDDV32KGjUjU
	wy6RvMu6cOmLZW5y43wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ohD-002Iuv-3C; Thu, 16 Jun 2022 12:33:59 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oh9-002Itc-M7
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 12:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655382835; x=1686918835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UEAtVi5CbjSvC5o9X0UlIfBwcav5LyW1HQ2wFacU4jg=;
  b=GfumOoD/6IkBFcf+jpTRFNAx5MzbC6jf/G8N9lcpRXHJLji/u3VCkq0C
   Hgrd/mWudf9o6G7h6qlq0BRzK4S9PXDaXf0GjRqXBgPMNCg2D06QSHIvl
   /nph1B7FLolPnbQg9kh87GN7FU+OkkTCbgDExOnjSsRii/89JLCIeAkGn
   f03cCnYFk9SxunOpI0EUEPXUzB6/2DRj9YjeNpkXdic3FQRFauIFAagIP
   Egb9oUTXsaQs2LOekQbQEwSnvuprz2oKNtJy7RHkS4mi7NckHtUEts4Uh
   4FAFc0jizdMdM81XpUMyRrP9bYtUD4iZp+8dyIDA9q3SLn1uktujVoH74
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="340892566"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; 
   d="scan'208";a="340892566"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 05:33:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; 
   d="scan'208";a="674999504"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 05:33:34 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 16 Jun 2022 15:33:31 +0300
Date: Thu, 16 Jun 2022 15:33:31 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Oleksandr Ocheretnyi <oocheret@cisco.com>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, p.yadav@ti.com,
	michael@walle.cc, richard@nod.at, vigneshr@ti.com,
	broonie@kernel.org, linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org, mauro.lima@eclypsium.com,
	lee.jones@linaro.org, linux-kernel@vger.kernel.org,
	xe-linux-external@cisco.com
Subject: Re: [PATCH v2] mtd: spi-nor: handle unsupported FSR opcodes properly
Message-ID: <YqsjGx54+Gd8Aws/@lahna>
References: <YqsHcL5NPcZ4De77@lahna>
 <20220616121446.293408-1-oocheret@cisco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220616121446.293408-1-oocheret@cisco.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_053355_804187_EEE21FA6 
X-CRM114-Status: GOOD (  27.50  )
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

On Thu, Jun 16, 2022 at 05:14:45AM -0700, Oleksandr Ocheretnyi wrote:
> Originally commit 094d3b9 ("mtd: spi-nor: Add USE_FSR flag for n25q*
> entries") and following one 8f93826 ("mtd: spi-nor: micron-st: convert
> USE_FSR to a manufacturer flag") enabled SPINOR_OP_RDFSR opcode handling
> ability, however some controller drivers still cannot handle it properly
> in the micron_st_nor_ready() call what breaks some mtd callbacks with
> next error logs:
> 
> mtdblock: erase of region [address1, size1] on "BIOS" failed
> mtdblock: erase of region [address2, size2] on "BIOS" failed
> 
> The Intel SPI controller does not support low level operations, like
> reading the flag status register (FSR). It only exposes a set of high
> level operations for software to use. For this reason check the return
> value of micron_st_nor_read_fsr() and if the operation was not
> supported, use the status register value only. This allows the chip to
> work even when attached to Intel SPI controller (there are such systems
> out there).
> 
> Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
> Link: https://lore.kernel.org/lkml/YmZUCIE%2FND82BlNh@lahna/
> ---
>  PATCH v2 updates PATCH v1 taking into account changes from
>  https://lore.kernel.org/linux-mtd/20220506105158.43613-1-mika.westerberg@linux.intel.com
>  to check -EOPNOTSUPP value from micron_st_nor_read_fsr() as well.
> 
>  drivers/mtd/spi-nor/micron-st.c | 12 ++++++++++--
>  drivers/spi/spi-intel.c         |  3 ++-
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index a96f74e0f568..fd52e8feea44 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -399,8 +399,16 @@ static int micron_st_nor_ready(struct spi_nor *nor)
>  		return sr_ready;
>  
>  	ret = micron_st_nor_read_fsr(nor, nor->bouncebuf);
> -	if (ret)
> -		return ret;
> +	if (ret < 0) {
> +		/*
> +		 * Some controllers, such as Intel SPI, do not support low
> +		 * level operations such as reading the flag status
> +		 * register. They only expose small amount of high level
> +		 * operations to the software. If this is the case we use
> +		 * only the status register value.
> +		 */
> +		return (ret == -ENOTSUPP || ret == -EOPNOTSUPP) ? sr_ready : ret;

The -EOPNOTSUPP here is not needed as you change the Intel SPI driver in
the below.

> +	}
>  
>  	if (nor->bouncebuf[0] & (FSR_E_ERR | FSR_P_ERR)) {
>  		if (nor->bouncebuf[0] & FSR_E_ERR)
> diff --git a/drivers/spi/spi-intel.c b/drivers/spi/spi-intel.c
> index 50f42983b950..f0313a718d1b 100644
> --- a/drivers/spi/spi-intel.c
> +++ b/drivers/spi/spi-intel.c
> @@ -352,7 +352,8 @@ static int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, size_t len)
>  		val |= HSFSTS_CTL_FCYCLE_RDSR;
>  		break;
>  	default:
> -		return -EINVAL;
> +		dev_dbg(ispi->dev, "%#x not supported\n", opcode);
> +		return -ENOTSUPP;
>  	}
>  
>  	if (len > INTEL_SPI_FIFO_SZ)
> -- 
> 2.27.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
