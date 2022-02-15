Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D51C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 19:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5FtNU+8bgAVnpL3K0JB4fLidH9Wak2NHx82VOe3h3A=; b=y2t+u+a7VRMb3j
	4Ckz+1ZWJRbyYjs3/cvhT0IsBC0OYAoLW+YfOKtn8KEtrQumGUSP5PO/ZEb+XYCdnHdiqLyRaDvE4
	sO69iBs1leBCtxlgu90h/58TasM5GV0rjA2PbWICI9I/HedlwnRhYmxDCHaVhw7mnHFLVic3SYmgG
	e1azrasBCAuq+zlGkiHFreaFVprhq68eL6nmnr2OeSCGxn5SecJ8Wmgm3WURbzh1DvLTQmabTQrvu
	i9+JvJCM7idmgovB97ftzBZZDZMN0FokGX2u27nSCgwtylpA0TBAnNsRb3HsenF6mmi3OlzkYixdT
	LMg2H/6dwHP7p3S+t8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK387-004DCM-5X; Tue, 15 Feb 2022 19:04:51 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK384-004DBY-1d
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 19:04:49 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21FJ4hL8050006;
 Tue, 15 Feb 2022 13:04:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644951883;
 bh=e9QGUJwqOEL4b6TS0m6Ew3y92faJf7vP7fE+12uFZkU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=V0Y7Jnu2yS/6Evb941SNISkfhE16A5JFL6UiFkwRMaHdR7GIWdXzm2xxtfD7xuRvc
 c/5aRQY6WN4ZtbrH9XOZPRO7U2RWuvxjh3KD5eaYP5xIS86QzCkx49yZfHSm4Jq6fy
 n8AlhlwiUgm5cfLsBCYi6WQmo1tXejs1wybF7oD4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21FJ4hu3029144
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Feb 2022 13:04:43 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Feb 2022 13:04:43 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Feb 2022 13:04:43 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21FJ4gkd076015;
 Tue, 15 Feb 2022 13:04:43 -0600
Date: Wed, 16 Feb 2022 00:34:42 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
Message-ID: <20220215190442.yid52fab32sjyd6n@ti.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-6-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202145853.4187726-6-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_110448_210831_B5009C94 
X-CRM114-Status: GOOD (  15.93  )
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

On 02/02/22 03:58PM, Michael Walle wrote:
> Drop the generic spi_nor prefix for all the xilinx functions.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/xilinx.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
> index a865dadc2e5d..3e85530df1e4 100644
> --- a/drivers/mtd/spi-nor/xilinx.c
> +++ b/drivers/mtd/spi-nor/xilinx.c
> @@ -8,9 +8,9 @@
>  
>  #include "core.h"
>  
> -#define SPINOR_OP_XSE		0x50	/* Sector erase */
> -#define SPINOR_OP_XPP		0x82	/* Page program */
> -#define SPINOR_OP_XRDSR		0xd7	/* Read status register */
> +#define XILINX_OP_SE		0x50	/* Sector erase */
> +#define XILINX_OP_PP		0x82	/* Page program */
> +#define XILINX_OP_RDSR		0xd7	/* Read status register */
>  
>  #define XSR_PAGESIZE		BIT(0)	/* Page size in Po2 or Linear */
>  #define XSR_RDY			BIT(7)	/* Ready */
> @@ -60,20 +60,20 @@ static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
>  }
>  
>  /**
> - * spi_nor_xread_sr() - Read the Status Register on S3AN flashes.
> + * xilinx_read_sr() - Read the Status Register on S3AN flashes.
>   * @nor:	pointer to 'struct spi_nor'.
>   * @sr:		pointer to a DMA-able buffer where the value of the
>   *              Status Register will be written.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
> +static int xilinx_read_sr(struct spi_nor *nor, u8 *sr)

Great minds think alike huh ;-)

But I agree with Tudor. vendor_nor_* or spi_nor_vendor_* would be 
better. I don't have much preference for any though. Please also 
remember to update the name in the doc comment, as the kernel test robot 
has already pointed out for this patch.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
