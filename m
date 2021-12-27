Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BF2C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1G30g5cjLfGohCTl0bwvgU2XMIIVLj51+DJYHlz/7U=; b=bIY4bVKZ6FOmdb
	ggLotwehAp4HXacQTCVbJtDIJnZ0E7It0PZD/dZEhS6bxohSM4dQXgQieAoRaNg24HkbxpwZQNi9A
	3NqAK3TR89Rkld5fNSlT8WPDy/MEgJm8FRnuI575l76AWJOgwkgzG+GQnwQT3ebzB0XepANLr550l
	MEc5cWP+i/JiIZiAWc3FvF0t1kJNzGdvHfUfEnx+01SG9hM+LBFzd25CYBpUyzOQ7kR/eNLJMwxJT
	jrht7B3KlG4lEt9sumQqEOeLXmD8fn7KQbZMNvDZ6kg5TV4qiLwXFoSoxu8GEPqoxJi/8Zxj2pyPI
	lGG2uh4S3qrpImaPP7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1ltQ-00GPOR-5o; Mon, 27 Dec 2021 09:02:08 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1ltM-00GPMC-Se
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 09:02:06 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BR91sTG070872;
 Mon, 27 Dec 2021 03:01:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640595714;
 bh=EPaFMRenw90ORhu3akBUpRn776wRoahCOByuKbvuLiQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=VMrHmVioFd0tO1vp7RBkswqdDwu0vcb81ngHLmE82BZDElIzf0osZQptOritMJ/yl
 JAdiT5ggU4nKdvSKYmgfMunsLZZoxq0W23Bc4w5WxHA/Zos/4qc8R3cdUln02Axgnr
 tfp1mJfWbviGMphCYF9GyJe+Z3d4XTK2KymFIn48=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BR91rl1010132
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 Dec 2021 03:01:53 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 27
 Dec 2021 03:01:53 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 27 Dec 2021 03:01:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BR91qSt053303;
 Mon, 27 Dec 2021 03:01:53 -0600
Date: Mon, 27 Dec 2021 14:31:51 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Potin Lai <potin.lai@quantatw.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Patrick
 Williams <patrick@stwcx.xyz>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] mtd: spi-nor: winbond: Add support for w25q01jv-iq
Message-ID: <20211227090149.k53bhq3h3giuz2h2@ti.com>
References: <20211224104522.24615-1-potin.lai@quantatw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211224104522.24615-1-potin.lai@quantatw.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_010205_099501_49B1BE89 
X-CRM114-Status: GOOD (  14.72  )
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

On 24/12/21 06:45PM, Potin Lai wrote:
> Add support for winbond w25q01jv-iq chip
> 
> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index c783ab4ba1e4..a2a72d05fc28 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -104,6 +104,8 @@ static const struct flash_info winbond_parts[] = {
>  			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
>  	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "w25q01jv-iq", INFO(0xef4021, 0, 64 * 1024, 2048,
> +				SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

We recently reworked how flags are set. Please use the new flags 
variants. See [0] If the flash supports SFDP then we prefer you only set 
the PARSE_SFDP flag. See [1].

You also need to show the dumps of the SFDP and other flash parameters. 
See [2].

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=spi-nor/next&id=ec1c0e996035c8f93eca7bb64ccf0411b57fddea
[1] https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=spi-nor/next&id=1c513c986b0a4c7151cb4571e568136f16c9dc58
[2] https://patchwork.ozlabs.org/project/linux-mtd/patch/20211209190436.401946-2-tudor.ambarus@microchip.com/

>  };
>  
>  /**
> -- 
> 2.17.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
