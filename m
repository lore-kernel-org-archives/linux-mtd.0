Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB601C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 09:53:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83F9561181
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 09:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83F9561181
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDgaUDRFsLRHS97oZtvqXA4+H0dWYYPFYyNrTXepw98=; b=lbQ1nzSenlG8E6
	NarGxstKZqfoPaByh78xiwmwco7Q+y3RRKD96pgcA4/ojpkSDpRnXC5sZsHhvDKLuO2/XKc1yYBBn
	O3umIeDoqk7BeCdV2qJNjjuqRBjvcxwF4ufUg1EvJKmUdeiEbVCEqcBU3UzN09fbSwAjQLbEKdcPc
	h7hgVECC0ku+oB3MqsbeQVUKF99RuMKJq0/3gMxfpn3IES1mKbGbMN1IB5+laSgzncf0LzHKHMKs7
	eFH7x2y8YR1G9LEcMvv0n5wMfu0NQA742+vzunZNAclQV7p2ZgQ7uRVhPU0j/gdGuy018jxDQJNJj
	sPuWQ099oc3SQ2Skx/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXKea-005qzj-Jd; Mon, 04 Oct 2021 09:53:00 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXKeX-005qyF-P0
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 09:52:59 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1949qh0B024577;
 Mon, 4 Oct 2021 04:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633341163;
 bh=5WdsnwlwsYMdLy7scJT5t5Q2/ywa6whHTtDTXygqv70=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=CoOXluL2bBEaFxCI+mx1VupjyQw4FA7xBhB7k0y5je+7tSqvzdA7ZVd843Wvqfc5C
 q6/3X9RtWdGebsMaDy+RempjKf56Wwx+k837/o0wUHUb0N+T3WdEBf70WdI4PRnzHK
 mglFvgrq2vfGkRKZ3I5o6D5aSwrGgv0Y45RuetOA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1949qgup030894
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 4 Oct 2021 04:52:42 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 4
 Oct 2021 04:52:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 4 Oct 2021 04:52:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1949qfR0038100;
 Mon, 4 Oct 2021 04:52:42 -0500
Date: Mon, 4 Oct 2021 15:22:41 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>
Subject: Re: [PATCH 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <20211004095239.dyowgkyq5lnfdag2@ti.com>
References: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
 <20210930100719.2176-3-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930100719.2176-3-mika.westerberg@linux.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_025257_990585_8D231F13 
X-CRM114-Status: GOOD (  26.83  )
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

On 30/09/21 01:07PM, Mika Westerberg wrote:
> The preferred way to implement SPI-NOR controller drivers is through SPI
> subsubsystem utilizing the SPI MEM core functions. This converts the
> Intel SPI flash controller driver over the SPI MEM by moving the driver
> from SPI-NOR subsystem to SPI subsystem and in one go make it use the
> SPI MEM functions. The driver name will be changed from intel-spi to
> spi-intel to match the convention used in the SPI subsystem.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/controllers/Kconfig       |  36 ---
>  drivers/mtd/spi-nor/controllers/Makefile      |   3 -
>  drivers/mtd/spi-nor/controllers/intel-spi.h   |  21 --
>  drivers/spi/Kconfig                           |  38 +++
>  drivers/spi/Makefile                          |   3 +
>  .../intel-spi-pci.c => spi/spi-intel-pci.c}   |  20 +-
>  .../spi-intel-platform.c}                     |  21 +-
>  .../intel-spi.c => spi/spi-intel.c}           | 300 +++++++++++-------
>  drivers/spi/spi-intel.h                       |  19 ++
>  include/linux/mfd/lpc_ich.h                   |   2 +-
>  .../x86/{intel-spi.h => spi-intel.h}          |   6 +-
>  11 files changed, 252 insertions(+), 217 deletions(-)
>  delete mode 100644 drivers/mtd/spi-nor/controllers/intel-spi.h
>  rename drivers/{mtd/spi-nor/controllers/intel-spi-pci.c => spi/spi-intel-pci.c} (86%)
>  rename drivers/{mtd/spi-nor/controllers/intel-spi-platform.c => spi/spi-intel-platform.c} (65%)
>  rename drivers/{mtd/spi-nor/controllers/intel-spi.c => spi/spi-intel.c} (80%)
>  create mode 100644 drivers/spi/spi-intel.h
>  rename include/linux/platform_data/x86/{intel-spi.h => spi-intel.h} (89%)
> 
[...]
> +static bool intel_spi_supports_mem_op(struct spi_mem *mem,
> +				      const struct spi_mem_op *op)
> +{
> +	struct intel_spi *ispi = spi_master_get_devdata(mem->spi->master);
>  
> -			offs += erase_size;
> -			len -= erase_size;
> +	if (op->cmd.dtr)
> +		return false;
> +
> +	if (ispi->swseq_reg && ispi->locked) {
> +		int i;
> +
> +		for (i = 0; i < ARRAY_SIZE(ispi->opcodes); i++) {
> +			if (ispi->opcodes[i] == op->cmd.opcode)
> +				return true;
>  		}
>  
> -		return 0;
> +		return false;
>  	}
>  
> -	/* Not needed with HW sequencer erase, make sure it is cleared */
> -	ispi->atomic_preopcode = 0;
> +	switch (op->cmd.opcode) {
> +	case SPINOR_OP_RDID:
> +	case SPINOR_OP_RDSR:
> +	case SPINOR_OP_WRSR:
> +		return true;
>  
> -	while (len > 0) {
> -		writel(offs, ispi->base + FADDR);
> +	case SPINOR_OP_READ:
> +	case SPINOR_OP_READ_FAST:
> +	case SPINOR_OP_READ_4B:
> +	case SPINOR_OP_READ_FAST_4B:
> +		return true;

I think the checks need to be stricter here. For example, I don't see 
you pass in protocol width (dual, quad, octal, etc.) to intel_spi_read() 
so I assume it can only do a certain protocol. You need to make sure 
that other protocols are rejected here.

Similarly, you also don't pass in dummy cycles to intel_spi_read(), so I 
assume it can only do a fix number of dummy cycles. Need to make sure 
you reject unsupported ones. Same for other opcodes/cases.

>  
> -		val = readl(ispi->base + HSFSTS_CTL);
> -		val &= ~(HSFSTS_CTL_FDBC_MASK | HSFSTS_CTL_FCYCLE_MASK);
> -		val |= HSFSTS_CTL_AEL | HSFSTS_CTL_FCERR | HSFSTS_CTL_FDONE;
> -		val |= cmd;
> -		val |= HSFSTS_CTL_FGO;
> -		writel(val, ispi->base + HSFSTS_CTL);
> +	case SPINOR_OP_PP:
> +	case SPINOR_OP_PP_4B:
> +	case SPINOR_OP_WREN:
> +	case SPINOR_OP_WRDI:
> +		return true;
>  
> -		ret = intel_spi_wait_hw_busy(ispi);
> -		if (ret)
> -			return ret;
> +	case SPINOR_OP_SE:
> +	case SPINOR_OP_SE_4B:
> +		return ispi->erase_64k;
>  
> -		status = readl(ispi->base + HSFSTS_CTL);
> -		if (status & HSFSTS_CTL_FCERR)
> -			return -EIO;
> -		else if (status & HSFSTS_CTL_AEL)
> -			return -EACCES;
> +	case SPINOR_OP_BE_4K:
> +	case SPINOR_OP_BE_4K_4B:
> +		return true;
> +	}
> +
> +	return false;
> +}
>  
> -		offs += erase_size;
> -		len -= erase_size;
> +static int intel_spi_exec_mem_op(struct spi_mem *mem, const struct spi_mem_op *op)
> +{
> +	struct intel_spi *ispi = spi_master_get_devdata(mem->spi->master);
> +	size_t nbytes = op->data.nbytes;
> +	u8 opcode = op->cmd.opcode;
> +
> +	if (op->addr.nbytes) {
> +		if  (op->data.dir == SPI_MEM_DATA_IN)
> +			return intel_spi_read(ispi, op->addr.val, nbytes,
> +					      op->data.buf.in);
> +		else if (op->data.dir == SPI_MEM_DATA_OUT)
> +			return intel_spi_write(ispi, op->addr.val, nbytes,
> +					       op->data.buf.out);
> +		else if (op->data.dir == SPI_MEM_NO_DATA)
> +			return intel_spi_erase(ispi, opcode, op->addr.val);
> +	} else {
> +		if  (op->data.dir == SPI_MEM_DATA_IN)
> +			return intel_spi_read_reg(ispi, opcode, op->data.buf.in,
> +						  nbytes);
> +		else if (op->data.dir == SPI_MEM_DATA_OUT)
> +			return intel_spi_write_reg(ispi, opcode, op->data.buf.out,
> +						   nbytes);
> +		else if (op->data.dir == SPI_MEM_NO_DATA)
> +			return intel_spi_write_reg(ispi, opcode, NULL, 0);
>  	}
>  
> -	return 0;
> +	return -EINVAL;
> +}
> +
[...]

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
