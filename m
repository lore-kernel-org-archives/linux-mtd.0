Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318A5C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 19:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBGf4iy3t10IxFQcKCYXG0wFTYLWgorAvCyZa6+b6pc=; b=sKhKvLjDCnzrNc
	qOd+ltGEJU0ih5s+r/YBZZrBAM4LAFsBKVkXXlzXh7f4mZaSJordSprTuODXcHAJAH5Eg/NE+cYGK
	u2nY0TtlxdKKxJej8rhAk3NJdGKUym9sINtPr5O7rHL3AWIs9wb9v372PiTEJ2x45mtanlMz6kxOj
	n3dZyVR7dd4rnzfjRn1EjtyHx6C6Z3EteNsWDKoRG9QxSkQsQbq48IcK2uXRAI7krogLl8t7CRUgz
	ssqUuTKNsL7D+Pn5JJ0exFiG+CxpQv/HB3rsa1+BdOOlGoLXGEIaPl/1iKN4pAtAhKKlsAaEcriss
	j/oj44fOnLBI2jKv3PiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzO2X-0040KR-7g; Mon, 20 Dec 2021 19:09:41 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzNvi-003y2U-1R
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 19:02:39 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BKJ2Vj2025580;
 Mon, 20 Dec 2021 13:02:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640026951;
 bh=C6Putjc76a73Bvho+VgAgzsKc6LMAMneY1xU02Zh4AQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=N2D+dIU0js6Hh5NyZouJQ9n50hPXhtoJFtYQAQU4f6hysdh9GG+XAj+cmZUQYgXh+
 zkg7GePYuT8qYw0PBoP9lDvpkkF2LLshq9+Epc9eZRu3Im+k9jT+QT9QzS81pZN+Be
 TieUZHFc//c0ME3j9Mhd8myeOhwo0Z/UOCES9ZHk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BKJ2VN4118115
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Dec 2021 13:02:31 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Dec 2021 13:02:30 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Dec 2021 13:02:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BKJ2Thp044388;
 Mon, 20 Dec 2021 13:02:30 -0600
Date: Tue, 21 Dec 2021 00:32:29 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 07/14] spi: spi-mem: Add an ecc_en parameter to the
 spi_mem_op structure
Message-ID: <20211220190227.oqvpcfrro32ic32b@ti.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
 <20211217161654.367782-8-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217161654.367782-8-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_110238_210595_1DE79C25 
X-CRM114-Status: GOOD (  21.84  )
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

On 17/12/21 05:16PM, Miquel Raynal wrote:
> Soon the SPI-NAND core will need a way to request a SPI controller to
> enable ECC support for a given operation. This is because of the
> pipelined integration of certain ECC engines, which are directly managed
> by the SPI controller itself.
> 
> Introduce a spi_mem_op additional field for this purpose: ecc_en.
> 
> So far this field is left unset and checked to be false by all
> the SPI controller drivers in their ->supports_op() hook, as they all
> call spi_mem_default_supports_op().
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/spi/spi-mem.c       | 5 +++++
>  include/linux/spi/spi-mem.h | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index cfe1c99db5f3..94758e7e747d 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -178,6 +178,11 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
>  			return false;
>  	}
>  
> +	if (op->ecc_en) {
> +		if (!spi_mem_controller_is_capable(ctlr, ecc))
> +			return false;
> +	}
> +
>  	return spi_mem_check_buswidth(mem, op);
>  }
>  EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index d7787c8f3746..e9238a858109 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -94,6 +94,7 @@ enum spi_mem_data_dir {
>   *		 operation does not involve transferring data
>   * @data.buf.in: input buffer (must be DMA-able)
>   * @data.buf.out: output buffer (must be DMA-able)
> + * @ecc_en: error correction is required
>   */
>  struct spi_mem_op {
>  	struct {
> @@ -126,6 +127,8 @@ struct spi_mem_op {
>  			const void *out;
>  		} buf;
>  	} data;
> +
> +	bool ecc_en;

ECC should only concern the data phase right? Would it make more sense 
to move this field under data?

Anyway, I don't know much about NAND or ECC so either way,

Acked-by: Pratyush Yadav <p.yadav@ti.com>

>  };
>  
>  #define SPI_MEM_OP(__cmd, __addr, __dummy, __data)		\
> @@ -223,9 +226,11 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
>  /**
>   * struct spi_controller_mem_caps - SPI memory controller capabilities
>   * @dtr: Supports DTR operations
> + * @ecc: Supports operations with error correction
>   */
>  struct spi_controller_mem_caps {
>  	bool dtr;
> +	bool ecc;
>  };
>  
>  #define spi_mem_controller_is_capable(ctlr, cap)		\
> -- 
> 2.27.0
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
