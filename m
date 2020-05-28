Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D9AC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 10:47:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458F8207D3
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 10:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CP9n9yH7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VKqdkfJw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 458F8207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JD4y1/eAl3wHWScmxmIKFLzdEgL9H0HzF3JKxdJrfoM=; b=CP9n9yH7hlvkTM
	tlvYteVtmlc3CRjz2WX7HfvslQu5LGcIK8Zn2VEB4H23DGq0a7RePN5g32smlqyRjiEHiyTjlY2nl
	kMjtcN7QMu3lOxDE+TMlWxJy+CtV7T8i/p0B5zBF93fjQPF5/73i4bQla2ZNOR5amP2EG6xxrgxU9
	jtrur3sB3hJq/AL9H2s4c1iI0Exw4l+CDQKxT8FP5d1rlrGiBpMtSqbELcsLBy3+xB+I2e2XRRmC4
	rP/pigOwlts7V4SIQlpUomgJcOY/IYlsR4XRP++Z8Yo8cfo3fr9QVVk6EUfRTUlP78j+/RBAGrBSC
	q1gQ76A1NWyEH1N/oGrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeG3r-0004LQ-Tx; Thu, 28 May 2020 10:46:55 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeG3p-0004Kq-Cz
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 10:46:54 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04SAkhE8004770;
 Thu, 28 May 2020 05:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590662803;
 bh=ZPjFAkrhohtOWysHkDufv/up5EjeMBFf0vptLVKfvv8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=VKqdkfJw+vMDIUfjPknI8oiw+BLVIbXKLkbP+DA7UwJEC/5nb/94Nzj3gr79TdwLt
 JCvVPgveTO7cnAOc/iAaTJ+Kl0bjxb64nxUaL2+3PYNcUeGNlIZG80hOYEdFsVFWpm
 7iPQCeW2tkdgKFeI//rFS78DBr9F6Zv8pJtOlsCY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04SAkhP5115978
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 May 2020 05:46:43 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 May 2020 05:46:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 May 2020 05:46:43 -0500
Received: from [10.250.234.195] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04SAkcw4106483;
 Thu, 28 May 2020 05:46:39 -0500
Subject: Re: [PATCH 1/2] mtd: spi-nor: create/Export parameter softwareseq for
 intel-spi driver to user
To: Daniel Walker <danielwa@cisco.com>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20200518175930.10948-1-danielwa@cisco.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <589a2ef5-e086-766d-44b3-1d2b990f1f67@ti.com>
Date: Thu, 28 May 2020 16:16:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518175930.10948-1-danielwa@cisco.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_034653_519994_093A4712 
X-CRM114-Status: GOOD (  26.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Bobby Liu <bobbliu@cisco.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, xe-linux-external@cisco.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+Mika Westerberg original author of the driver

On 18/05/20 11:29 pm, Daniel Walker wrote:
> From: Bobby Liu <bobbliu@cisco.com>
> 
> How to use:
> append softwareseq=1 while probe the driver.
> example:
> modprobe intel-spi writeable=1 softwareseq=1
> it will let driver use software sequence to write register for opt=EN4B
> by default it's 0 if not specified, driver will do usual HW cycle
> 

Could some one from Intel please review this patch?

Regards
Vignesh

> Why this parameter is posted to user:
> Intel PCH provides two groups of registers for SPI flash operation,
> Hard Sequence registers and Software Sequence registers,
> corresponding to intel_spi_hw_cycle() and intel_spi_sw_cycle()
> respectively in driver code. But HW sequence register won't send EN4B
> opcode to SPI flash. BIOS code use SW register to send EN4B.
> 
> On some Cisco routers, two 32M SPI flashes, which require 4-byte address mode enabled,
> are physically connected to an FPGA, one flash is active and one is inactive.
> When we do BIOS upgrade, we need switch to the inactive one,
> but unfortunately, this one is still 3-byte address mode as default,
> after we do real-time switch, we need reload SPI driver to send EN4B code to
> enable 4-byte address mode.
> 
> Refering to our BIOS code, Software sequence register is processed
> while sending EN4B opcode. So here we use sw_cycle in driver for EN4B as well.
> 
> Why I don't just easily use software sequence for all:
> 1.It will impact all flash operation, include flash W/R, high risk
> 2.The only SPI type I can use is INTEL_SPI_BXT according to datasheet,
>   this will require using hw seq.
>   I tried to specify other SPI type, it couldn't work with Intel PCH.
>   If I force SW seq for all, during boot up, sw_cycle fails to read
>   vendor ID.
> 
> In conclusion, I only use SW cycle for EN4B opcode to minimize impact.
> It won't impact other users as well.
> 
> Why the default flash can work at 4-byte address mode:
> BIOS sets 4-byte address mode for the current active SPI flash with SW seq registers.
> So we don't need append softwareseq=1 for normal boot up script,
> it will only be used in BIOS upgrade script.
> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Bobby Liu <bobbliu@cisco.com>
> [ danielwa: edited the commit message a little. ]
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>  drivers/mtd/spi-nor/controllers/intel-spi.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
> index 61d2a0ad2131..e5a3d51a2e4d 100644
> --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
> +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
> @@ -163,6 +163,10 @@ static bool writeable;
>  module_param(writeable, bool, 0);
>  MODULE_PARM_DESC(writeable, "Enable write access to SPI flash chip (default=0)");
>  
> +static bool softwareseq;
> +module_param(softwareseq, bool, 0);
> +MODULE_PARM_DESC(softwareseq, "Use software sequence for register write (default=0)");
> +
>  static void intel_spi_dump_regs(struct intel_spi *ispi)
>  {
>  	u32 value;
> @@ -619,6 +623,18 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * Intel Skylake will not send EN4B to SPI flash if we use HW sequence
> +	 * Here export one interface "softwareseq" to OS,
> +	 * let driver user decide if use SW sequence or not
> +	 */
> +	if (opcode == SPINOR_OP_EN4B && softwareseq) {
> +	    dev_info(ispi->dev,
> +		"Write register opcode is SPINOR_OP_EN4B, do SW cycle\n");
> +	    return intel_spi_sw_cycle(ispi, opcode, len,
> +		OPTYPE_WRITE_NO_ADDR);
> +	}
> +
>  	if (ispi->swseq_reg)
>  		return intel_spi_sw_cycle(ispi, opcode, len,
>  					  OPTYPE_WRITE_NO_ADDR);
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
