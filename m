Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110BDC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 12:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTl85hD0dW4NHLFtWH3790ZdJrjHewLpglMWjT6k8oQ=; b=vqob6I58zpws32
	lVMhDJscaOPK1031P4N3HQcPvhI902ntyHyQqOzMlaAM/vmpfS9OgfYoYTEC2ExxaGQDzAEerbWrZ
	+Gs4ZDK56ZKCytgjBNNFQ48AbfV+fM8Kw74D1VNbbfv3eHuVomDbUayrQT8ylsbrlOqeW2Box/r25
	sYSuOxo/diJ95ce0EVzUqgsdI9eI71mu74un2qaz7GMpP9fLz/kiO0Hd+qhaXopsnsxxtF33izHfJ
	G/tTZ/vL2kbDqfaqiPwHuk7urhkuP1SIcx25wruUUceXhjFRL/HuSDF663WaPcC2pWho46R8yUF1u
	pSrOLL5WIYIa2WCsmgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPO6N-002cCW-6p; Wed, 02 Mar 2022 12:29:07 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPO6K-002cC9-9K
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2022 12:29:05 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 222CSp9w008259;
 Wed, 2 Mar 2022 06:28:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1646224131;
 bh=Bdd647K0ux5fTDFXZZlqZcIilgzfVjUNpmykTMnnPF0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=OwgKaxrqtjU56pmIsNKLYfToXQdM3fm4o3dSAckhnIKodKcxDcCOJoqw5PPy3wiYe
 mDT5qe88Y0WLmqkhc6FwGEuzbHIGoFZKdsTuv0KPFJnQJVdkBllUFa21DhYFDk4Djg
 6esHpfXj6kKyGWivOooajB9K0VtVJD9/xEaFIIj0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 222CSpKp030541
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Mar 2022 06:28:51 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Mar 2022 06:28:51 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Mar 2022 06:28:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 222CSome103846;
 Wed, 2 Mar 2022 06:28:50 -0600
Date: Wed, 2 Mar 2022 17:58:49 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 3/4] mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from
 BFPT
Message-ID: <20220302122849.2vo5nnbnxpfenwci@ti.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <20220218145900.1440045-4-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218145900.1440045-4-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_042904_429346_146909CD 
X-CRM114-Status: GOOD (  15.22  )
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

On 18/02/22 04:58PM, Tudor Ambarus wrote:
> Parse BFPT in order to retrieve the byte order in 8D-8D-8D mode.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> ---
>  drivers/mtd/spi-nor/sfdp.c | 3 +++
>  drivers/mtd/spi-nor/sfdp.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index a5211543d30d..551edbb039f0 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -633,6 +633,9 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  		return -EOPNOTSUPP;
>  	}
>  
> +	if (bfpt.dwords[BFPT_DWORD(18)] & BFPT_DWORD18_BYTE_ORDER_SWAPPED)
> +		nor->flags |= SNOR_F_DTR_BSWAP16;
> +
>  	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
>  }
>  
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index bbf80d2990ab..9a834ea31c16 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -97,6 +97,7 @@ struct sfdp_bfpt {
>  #define BFPT_DWORD18_CMD_EXT_INV		(0x1UL << 29) /* Invert */
>  #define BFPT_DWORD18_CMD_EXT_RES		(0x2UL << 29) /* Reserved */
>  #define BFPT_DWORD18_CMD_EXT_16B		(0x3UL << 29) /* 16-bit opcode */
> +#define BFPT_DWORD18_BYTE_ORDER_SWAPPED		BIT(31)
>  
>  struct sfdp_parameter_header {
>  	u8		id_lsb;
> -- 
> 2.25.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
