Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342BCC3A5A6
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 07:13:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A484205C9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 07:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CBQHohE+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="B7HB8HTB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A484205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=z975NCnEtlRdyAG2RE9s2NgINalltk1b9pJux9QxVxY=; b=CBQHohE+z50Qwc3XiUIEjxftBN
	Pgh0aF3A75DGFB97HtUVakTysl7RV5xE5zqzxbc10Ml4BKRQAjBNAmUBuWyoAXAq7OP0+KzjQp1Yy
	JzVTvkubtdyWFeZ32RR6NVdUi607y5hpbdXB27zNUn2qMlwQD1CLGfrA2iRNRvSwoopDCILXS/0R0
	CFTfKAs6WaY1EQ2y87ySnllxOEdot5puAMzyzAjlEIcVAdrqQaB9JBHJamvxLF+9Y6Zb11lkpu+2Z
	0SEbgNS8t0Bbk3plflUVMwqBO+xZHm9W8V0gWEuOxT4Cd0XfSksae9K6KDJocOmdRehxvg40m4jyC
	jueGb6Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2VfC-0002ND-5F; Tue, 27 Aug 2019 07:13:10 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Vf9-0002Mh-5l
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 07:13:08 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R7D0kq131025;
 Tue, 27 Aug 2019 02:13:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566889980;
 bh=Qz1caDsmTLrcgY1LRoE54Osz0mu6gtZdadLVqIgskSo=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=B7HB8HTBua5z0KnMw9zNx6j9kSItbx5sZCqo1X8Fwsr4UyxzDWxGv7NlFsrfSB1sb
 Oqxxg1/AOu0yXCs6k6/nBJhhKjvf49y6kwp+Hkdim9aE9Nx6frza6vYjo86gzb+CDc
 JMrgxOdPdE4WyUGowJy0+A49YLpo9auoD+pKRo8s=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R7D0O6007391
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 02:13:00 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 02:13:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 02:13:00 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R7Cu87034505;
 Tue, 27 Aug 2019 02:12:57 -0500
Subject: Re: [RESEND PATCH v3 13/20] mtd: spi-nor: Add a ->convert_addr()
 method
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-14-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <b6db18f9-3eb9-6bd6-8a9a-3b7320c48739@ti.com>
Date: Tue, 27 Aug 2019 12:43:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826120821.16351-14-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_001307_304577_7870EC87 
X-CRM114-Status: GOOD (  24.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 26/08/19 5:38 PM, Tudor.Ambarus@microchip.com wrote:
> From: Boris Brezillon <boris.brezillon@bootlin.com>
> 
> In order to separate manufacturer quirks from the core we need to get
> rid of all the manufacturer specific flags, like the
> SNOR_F_S3AN_ADDR_DEFAULT one.
> 
> This can easily be replaced by a ->convert_addr() hook, which when
> implemented will provide the core with an easy way to convert an
> absolute address into something the flash understands.
> 
> Right now the only user are the S3AN chips, but other manufacturers
> can implement it if needed.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

> v3: no changes, rebase on previous commits
> 
>  drivers/mtd/spi-nor/spi-nor.c | 24 ++++++++++++++----------
>  include/linux/mtd/spi-nor.h   | 17 ++++++++++-------
>  2 files changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index c862a59ce9df..b96a7066a36c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -899,10 +899,9 @@ static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
>   * Addr can safely be unsigned int, the biggest S3AN device is smaller than
>   * 4 MiB.
>   */
> -static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
> +static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
>  {
> -	unsigned int offset;
> -	unsigned int page;
> +	u32 offset, page;
>  
>  	offset = addr % nor->page_size;
>  	page = addr / nor->page_size;
> @@ -911,6 +910,14 @@ static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
>  	return page | offset;
>  }
>  
> +static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
> +{
> +	if (!nor->params.convert_addr)
> +		return addr;
> +
> +	return nor->params.convert_addr(nor, addr);
> +}
> +
>  /*
>   * Initiate the erasure of a single sector
>   */
> @@ -918,8 +925,7 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  {
>  	int i;
>  
> -	if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
> -		addr = spi_nor_s3an_addr_convert(nor, addr);
> +	addr = spi_nor_convert_addr(nor, addr);
>  
>  	if (nor->erase)
>  		return nor->erase(nor, addr);
> @@ -2535,8 +2541,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	while (len) {
>  		loff_t addr = from;
>  
> -		if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
> -			addr = spi_nor_s3an_addr_convert(nor, addr);
> +		addr = spi_nor_convert_addr(nor, addr);
>  
>  		ret = spi_nor_read_data(nor, addr, len, buf);
>  		if (ret == 0) {
> @@ -2680,8 +2685,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  		page_remain = min_t(size_t,
>  				    nor->page_size - page_offset, len - i);
>  
> -		if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
> -			addr = spi_nor_s3an_addr_convert(nor, addr);
> +		addr = spi_nor_convert_addr(nor, addr);
>  
>  		write_enable(nor);
>  		ret = spi_nor_write_data(nor, addr, page_remain, buf + i);
> @@ -2748,7 +2752,7 @@ static int s3an_nor_scan(struct spi_nor *nor)
>  		nor->mtd.erasesize = 8 * nor->page_size;
>  	} else {
>  		/* Flash in Default addressing mode */
> -		nor->flags |= SNOR_F_S3AN_ADDR_DEFAULT;
> +		nor->params.convert_addr = s3an_convert_addr;
>  	}
>  
>  	return 0;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index ea3bcac54dc2..35aad92a4ff8 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -237,13 +237,12 @@ enum spi_nor_option_flags {
>  	SNOR_F_USE_FSR		= BIT(0),
>  	SNOR_F_HAS_SR_TB	= BIT(1),
>  	SNOR_F_NO_OP_CHIP_ERASE	= BIT(2),
> -	SNOR_F_S3AN_ADDR_DEFAULT = BIT(3),
> -	SNOR_F_READY_XSR_RDY	= BIT(4),
> -	SNOR_F_USE_CLSR		= BIT(5),
> -	SNOR_F_BROKEN_RESET	= BIT(6),
> -	SNOR_F_4B_OPCODES	= BIT(7),
> -	SNOR_F_HAS_4BAIT	= BIT(8),
> -	SNOR_F_HAS_LOCK		= BIT(9),
> +	SNOR_F_READY_XSR_RDY	= BIT(3),
> +	SNOR_F_USE_CLSR		= BIT(4),
> +	SNOR_F_BROKEN_RESET	= BIT(5),
> +	SNOR_F_4B_OPCODES	= BIT(6),
> +	SNOR_F_HAS_4BAIT	= BIT(7),
> +	SNOR_F_HAS_LOCK		= BIT(8),
>  };
>  
>  /**
> @@ -496,6 +495,9 @@ struct spi_nor_locking_ops {
>   *                      Table.
>   * @quad_enable:	enables SPI NOR quad mode.
>   * @set_4byte:		puts the SPI NOR in 4 byte addressing mode.
> + * @convert_addr:	converts an absolute address into something the flash
> + *                      will understand. Particularly useful when pagesize is
> + *                      not a power-of-2.
>   * @locking_ops:	SPI NOR locking methods.
>   */
>  struct spi_nor_flash_parameter {
> @@ -510,6 +512,7 @@ struct spi_nor_flash_parameter {
>  
>  	int (*quad_enable)(struct spi_nor *nor);
>  	int (*set_4byte)(struct spi_nor *nor, bool enable);
> +	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
>  
>  	const struct spi_nor_locking_ops *locking_ops;
>  };
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
