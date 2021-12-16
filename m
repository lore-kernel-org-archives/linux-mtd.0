Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA56C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 20:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fPxurjltvKNaz3wraQZlLFg9q6wldEsHGjyoZMXtC0=; b=FB616A2lFVuAju
	IBaHrhNDoCdXrzjSK8RY1EB/6u7G8kFLktfg5Ggw4XPwyfbYd0I8trQuevCOVfKdAZw9+ln3dSWtF
	R54tMSSYaTe9+6DOkPF7oU7JYH5T2WYt09VG72e9AVuJSS000WrUtnoNtIcLKknvbXZ6fKSzg8j5f
	AMWv4me0V+0phKOBePj5R2a9yIXGqtvbE5CgXWzsvDy82x3+iL8qsX5t5i2RfIi05aano4dBrlvdI
	FYxWqM+QoqTcZjXpKjT/ZWAMkEAelv5v/Iv714ieZbjeXif6Q23VNnDCuQtPE1gjAdxzZuSTHBHse
	wzxbSxzicNMFsB9wAwbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxx0d-007RRC-17; Thu, 16 Dec 2021 20:05:47 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxx0a-007RQp-7B
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 20:05:46 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BGK5dVK057700;
 Thu, 16 Dec 2021 14:05:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1639685139;
 bh=wrQp1fnJ6mOn8LdRMHRJtFOxR0DVxqVmRrbvc0vm4Is=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ZYSxDOmA/sNo2/rutgMHvwkpgpu9M+mOGYySXrBZVXtqakaeKsedI+vFRPCmE/djC
 /YUpVYNBN2BvkWOldNXeYJvxDEuu54yAD/6Sy18rf1sbLzT5H3UE6kPDWZaFsD3Pzy
 IXLu5w3n6IZRe3exH6LaUrQPliV5P5gjqjPb4cgU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BGK5dZv113468
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 16 Dec 2021 14:05:39 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 16
 Dec 2021 14:05:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 16 Dec 2021 14:05:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BGK5cml118318;
 Thu, 16 Dec 2021 14:05:38 -0600
Date: Fri, 17 Dec 2021 01:35:37 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Alexander A Sverdlin <alexander.sverdlin@nokia.com>
CC: <linux-mtd@lists.infradead.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Michael Walle <michael@walle.cc>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Introduce erase_proto
Message-ID: <20211216200535.jikqd42nohr4477n@ti.com>
References: <20211209100813.61713-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209100813.61713-1-alexander.sverdlin@nokia.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_120544_527070_6E3E7939 
X-CRM114-Status: GOOD (  25.73  )
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

Hi Alexander,

On 09/12/21 11:08AM, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> I've been looking into non-working erase on mt25qu256a and pinpointed it to
> be write_proto 1-4-4 selected from SFDP while the chip only supports 1-1-0
> erase.
> 
> For now just introduce the separate protocol without functional change and
> leave the real fix for the following patch.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/spi-nor/core.c  | 9 ++++++---
>  include/linux/mtd/spi-nor.h | 4 +++-
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 2e21d5a..dcd02ea 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -177,7 +177,7 @@ static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
>  
>  static int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
>  {
> -	if (spi_nor_protocol_is_dtr(nor->write_proto))
> +	if (spi_nor_protocol_is_dtr(nor->erase_proto))
>  		return -EOPNOTSUPP;
>  
>  	return nor->controller_ops->erase(nor, offs);
> @@ -1186,7 +1186,7 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
>  				   SPI_MEM_OP_NO_DUMMY,
>  				   SPI_MEM_OP_NO_DATA);
>  
> -		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> +		spi_nor_spimem_setup_op(nor, &op, nor->erase_proto);
>  
>  		ret = spi_mem_exec_op(nor->spimem, &op);
>  	} else {
> @@ -1331,7 +1331,7 @@ int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  				   SPI_MEM_OP_NO_DUMMY,
>  				   SPI_MEM_OP_NO_DATA);
>  
> -		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> +		spi_nor_spimem_setup_op(nor, &op, nor->erase_proto);
>  
>  		return spi_mem_exec_op(nor->spimem, &op);
>  	} else if (nor->controller_ops->erase) {
> @@ -2727,6 +2727,9 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>  	 */
>  	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
>  		spi_nor_init_default_locking_ops(nor);
> +
> +	if (!nor->erase_proto)
> +		nor->erase_proto = nor->write_proto;

I get that you are trying to not break any existing flashes with this, 
but I don't quite like it. We should keep the same initialization flow 
with erase_proto as with write_proto, read_proto, etc. That is, 
initialize it to SNOR_PROTO_1_1_1 in spi_nor_scan() and then let the 
initialization procedure change it as needed.

The problem with this is of course that it could break some flashes by 
selecting the wrong erase. I would expect _most_ flashes to use 
erase_proto as 1-1-1 but I of course haven't went and looked at every 
single flash to point out the exceptions.

I would like to hear from others if they think it is okay to do this.

>  }
>  
>  /**

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
