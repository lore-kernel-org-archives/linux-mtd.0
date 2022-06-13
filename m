Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4F6C43334
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jun 2022 06:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxLcEVKUyPgpp1D0U8x62d9avn2q1cG51SbmUbtKjHQ=; b=ZD01X8xoeWQsTI
	xY/PuJTea3IaakpS773Eu8+yYDzd+EgkEQWdwAhPgLj1zLRk4YLysPZkPb+JZVlx0HRd1EyIWuOdZ
	i4zDMiVEsRAH0SmpcwzZuEdKy8TjdEcxOd+Sd8GaYlHiHJov+Td1DN2X+G/JmQPnwPSotAjVCYAB5
	YOcTG1qmCXCFqlxH3q1pKr742VCHK3EDJvsHqnpqvi61XlCehBFonxjIKjX6nLZ4Ge1NU8A6rdbwc
	9SpVhQ5/j3J5YWMJNXm5XGGEjDeDyA7h9v1YYsnATMIO4oAukGqPtMb5HMFdBdlac7iqlYXbg2hYL
	1oOLswThQVtrNfFmlMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0dPZ-001cwU-E7; Mon, 13 Jun 2022 06:18:53 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0dPU-001cue-01
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2022 06:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655101127; x=1686637127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RI6qAwFkvyfDJbNSty7ikmbQQ/e8na613HjB1kmUOqU=;
  b=WDUcbI/f4Wgg30ls1P3w9dDKAxnlGJS+opAF2P8DPqGR2KHX+M8Ppw1O
   VytTeCR2M2JZqA4VIQ0wqClQkZOg9GE+UaiajFI6eXbjEdWVd3zSoVRcL
   l8wQk6GpVEXVU8dQIPFG5XNxifUR9/Z9RzrylA3ALDAF2ghcceAiMUUSV
   wSJMF2IVgr/zoWTSLx+mElKhOURBXC9HjoBz/qb2jHAa7xemIDcQHz6q1
   t6Anr9/bQK5/GGEgz55S9uTkUc3Ti2dtAFUUvlzEwKgb+/vS87G0AGbNQ
   lFnWwKyHusfu7f7OwhG6jwjRJCY5tEF/hg+ZUOWiTU3Ww0ug1nEU7xYG/
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="364508179"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="364508179"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2022 23:18:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="673098050"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2022 23:18:34 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 13 Jun 2022 09:18:31 +0300
Date: Mon, 13 Jun 2022 09:18:31 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Oleksandr Ocheretnyi <oocheret@cisco.com>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, p.yadav@ti.com,
	michael@walle.cc, richard@nod.at, vigneshr@ti.com,
	broonie@kernel.org, linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org, mauro.lima@eclypsium.com,
	lee.jones@linaro.org, linux-kernel@vger.kernel.org,
	xe-linux-external@cisco.com
Subject: Re: [PATCH] mtd: spi-nor: handle unsupported FSR opcodes properly
Message-ID: <YqbWt9f3of+7Z76e@lahna>
References: <YmZUCIE/ND82BlNh@lahna>
 <20220610191548.3626218-1-oocheret@cisco.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610191548.3626218-1-oocheret@cisco.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_231848_091605_2649892C 
X-CRM114-Status: GOOD (  24.36  )
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

On Fri, Jun 10, 2022 at 12:15:48PM -0700, Oleksandr Ocheretnyi wrote:
> Commit 094d3b9 ("mtd: spi-nor: Add USE_FSR flag for n25q* entries")
> and following one 8f93826 ("mtd: spi-nor: micron-st: convert USE_FSR
> to a manufacturer flag") enables SPINOR_OP_RDFSR opcode handling ability,
> however some controller drivers still cannot handle it properly in
> the micron_st_nor_ready() call what breaks some mtd callbacks with
> next error logs:
> 
> mtdblock: erase of region [address1, size1] on "BIOS" failed
> mtdblock: erase of region [address2, size2] on "BIOS" failed
> 
> Just skip subsequent processing of the SPINOR_OP_RDFSR opcode's results
> because of -ENOTSUPP return value of the micron_st_nor_read_fsr()
> if there is no proper handling of that opcode as it's been before
> commit 094d3b9 ("mtd: spi-nor: Add USE_FSR flag for n25q* entries")
> 
> Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>

I sent similar patch some time ago here:

https://lore.kernel.org/linux-mtd/20220506105158.43613-1-mika.westerberg@linux.intel.com/#t

but so far it has not been picked up by the maintainers. I'm fine if we
go with your patch instead, just one minor comment:

> ---
>  drivers/mtd/spi-nor/micron-st.c | 6 +++++-
>  drivers/spi/spi-intel.c         | 3 ++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index a96f74e0f568..507e675d81e0 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -399,8 +399,12 @@ static int micron_st_nor_ready(struct spi_nor *nor)
>  		return sr_ready;
>  
>  	ret = micron_st_nor_read_fsr(nor, nor->bouncebuf);
> -	if (ret)
> +	if (ret < 0) {
> +		/* Check if read FSR is supported. If not, skip it. */
> +		if (ret == -ENOTSUPP)
> +			return sr_ready;
>  		return ret;
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

I don't think this is necessary because we already return -EOPNOTSUPP in
intel_spi_exec_mem_op() so we can just check that one in
micron_st_nor_ready().

With that changed feel free to add my,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
