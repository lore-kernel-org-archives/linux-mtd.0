Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84663C3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 14:38:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 568E82067B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 14:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P2WKfrSw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oop+2cl0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 568E82067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=at1PsbcdY+kdRuIc8pdR8UOEO29iXDv0P81gWU85yQo=; b=P2WKfrSwetP0bc
	6paL784+XqXs8DxAJ5Vof8CShZEzp5d0v2WE65AbVUHAv1Sj+qi4zuw2n8Glq5/y1aWT46MVQnAtr
	M3qi23jZWAOOQmKNZE7so4RpjF7KztXeThiUOEH675JKRTGXZJ1T4ybDSbRpoYiBiWmoW4qZ0HG+q
	rj3A6k2qz4hkVs1cU/37wwmtt92nwtdRopp/FnflI+P2a30vY/S7rEzSwRXI9iDWDyU1bZ1R1agyy
	t6CrQ/LBFbLfkL0dqI2kG8HKMb9UvkYL8mtOXN2/Y6I+kAEx0g8aDIb0TYKpPdMr/2VH31CTzEC0h
	K8jteT6MQBNVoeoQJVtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAxZM-000894-0U; Thu, 19 Sep 2019 14:38:04 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAxZJ-00087d-Cw; Thu, 19 Sep 2019 14:38:02 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JEbetv115088;
 Thu, 19 Sep 2019 09:37:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1568903860;
 bh=MF3qsuF4n+o3m2uSbnHwtbN88u+xehQfFPTradyvPmM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=oop+2cl0Z5hydQEOc7aJzKOUC8+y7z7JdhpUZQ48FCxXjOkcMZ1L5BFe22g4abjTm
 aGkkCdJjvzrRTBkmVIECVwkY1WTc1zljyPyknqsjQzIVpNZ3t864me2KvRHSmox9Uz
 lMXRFJyZDKSGM4Eh+6J7GPgsT5E2l92r0G3JPUxA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JEbd4H073219
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Sep 2019 09:37:40 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 09:37:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 09:37:39 -0500
Received: from [10.250.132.15] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JEbYUO049208;
 Thu, 19 Sep 2019 09:37:35 -0500
Subject: Re: [PATCH 00/23] mtd: spi-nor: Quad Enable and (un)lock methods
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
References: <20190917155426.7432-1-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <920a9946-af0d-1190-d59c-0b4acee71931@ti.com>
Date: Thu, 19 Sep 2019 20:07:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917155426.7432-1-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_073801_514940_FBA29499 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux-mediatek@lists.infradead.org,
 joel@jms.id.au, matthias.bgg@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 17-Sep-19 9:24 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
[...]
> Tudor Ambarus (23):
>   mtd: spi-nor: hisi-sfc: Drop nor->erase NULL assignment
>   mtd: spi-nor: Introduce 'struct spi_nor_controller_ops'
>   mtd: spi-nor: cadence-quadspi: Fix cqspi_command_read() definition
>   mtd: spi-nor: Rename nor->params to nor->flash
>   mtd: spi-nor: Rework read_sr()
>   mtd: spi-nor: Rework read_fsr()
>   mtd: spi-nor: Rework read_cr()
>   mtd: spi-nor: Rework write_enable/disable()
>   mtd: spi-nor: Fix retlen handling in sst_write()
>   mtd: spi-nor: Rework write_sr()
>   mtd: spi-nor: Rework spi_nor_read/write_sr2()
>   mtd: spi-nor: Report error in spi_nor_xread_sr()
>   mtd: spi-nor: Void return type for spi_nor_clear_sr/fsr()
>   mtd: spi-nor: Drop duplicated new line
>   mtd: spi-nor: Drop spansion_quad_enable()
>   mtd: spi-nor: Fix errno on quad_enable methods
>   mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()
>   mtd: spi-nor: Rework macronix_quad_enable()
>   mtd: spi-nor: Rework spansion(_no)_read_cr_quad_enable()
>   mtd: spi-nor: Update sr2_bit7_quad_enable()
>   mtd: spi-nor: Rework the disabling of block write protection
>   mtd: spi-nor: Add Global Block Unlock support
>   mtd: spi-nor: Unlock global block protection on sst26vf064b

With whole series applied, I see:

drivers/mtd/spi-nor/spi-nor.c:520: warning: Function parameter or member 'cr' not described in 'spi_nor_read_cr'
drivers/mtd/spi-nor/spi-nor.c:520: warning: Excess function parameter 'fsr' description in 'spi_nor_read_cr'
drivers/mtd/spi-nor/spi-nor.c:742: warning: Function parameter or member 'len' not described in 'spi_nor_write_sr'
drivers/mtd/spi-nor/spi-nor.c:889: warning: Function parameter or member 'status_new' not described in 'spi_nor_write_sr1_and_check'
drivers/mtd/spi-nor/spi-nor.c:889: warning: Function parameter or member 'mask' not described in 'spi_nor_write_sr1_and_check'
drivers/mtd/spi-nor/spi-nor.c:923: warning: Function parameter or member 'status_new' not described in 'spi_nor_write_16bit_sr_and_check'
drivers/mtd/spi-nor/spi-nor.c:923: warning: Function parameter or member 'mask' not described in 'spi_nor_write_16bit_sr_and_check'
drivers/mtd/spi-nor/spi-nor.c:997: warning: Function parameter or member 'status_new' not described in 'spi_nor_write_sr_and_check'
drivers/mtd/spi-nor/spi-nor.c:997: warning: Function parameter or member 'mask' not described in 'spi_nor_write_sr_and_check'

Could you please fix up docs next time around?

Regards
Vignesh
> 
>  drivers/mtd/spi-nor/aspeed-smc.c      |   23 +-
>  drivers/mtd/spi-nor/cadence-quadspi.c |   54 +-
>  drivers/mtd/spi-nor/hisi-sfc.c        |   23 +-
>  drivers/mtd/spi-nor/intel-spi.c       |   24 +-
>  drivers/mtd/spi-nor/mtk-quadspi.c     |   25 +-
>  drivers/mtd/spi-nor/nxp-spifi.c       |   23 +-
>  drivers/mtd/spi-nor/spi-nor.c         | 1697 ++++++++++++++++++---------------
>  include/linux/mtd/spi-nor.h           |   75 +-
>  8 files changed, 1050 insertions(+), 894 deletions(-)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
