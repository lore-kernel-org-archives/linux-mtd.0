Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070CDC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 06:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0uXlqkUlQfmYGyIZscpri+WM2hfXKt8mgxcVEdXt1U=; b=g/ZuQG6PbgQM5S
	qFMwlpf0CZvc8z4loBtQwefizLVyV05NWcW7QZ/Tc+M/FQmtJTQU3Dhhv6O+cr+sI3tG3+L3RrXP+
	qX0En6STmdZw4a8EQjR9zt0ZZ2VSx/JFF0NhzMP/ZV2NAUnYdmuckclE2T+Y9ETiFqaD2J72UgyFS
	5xfR/ULqYq28od7T89aX0eLVQ5gzsIiQ5+zguC6ANdZWxmHwKeXBC5PvtyeO569j2EoBjqdlfI7pz
	9rRwP2x5Br5zKm5f3GmPRsKwl40gOAhoBoSHiJ3fofESKRW8tvdXrvgAnkmHML7TtjMU5coTbyavV
	jtiLQ7ChrwhrCOK0d1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkKC9-009kUl-UH; Fri, 29 Apr 2022 06:33:37 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkKC6-009kT7-VB
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 06:33:36 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23T6XV4m082949;
 Fri, 29 Apr 2022 01:33:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1651214011;
 bh=ovBtKTK28LF3o0UgNCz17ia+PKYdR2hkUVcRMNywmYg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=S1z2tcvsrQ12bqxuieEwUInpBxyQk7auVFYxy468M10jZYySXA6k6eIKb9z0MpbUl
 iqjl1XMQsfidoNjlBtp72V6vA7mK71c3MLdEcy4R/lSHrEXXsOAn/Im1O1ADanCfg4
 rGbn/g/lYpcvDE+XQgfG5l+ghH803K1oUUgKI24k=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23T6XVm9093038
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 29 Apr 2022 01:33:31 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 29
 Apr 2022 01:33:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 29 Apr 2022 01:33:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23T6XTnt102494;
 Fri, 29 Apr 2022 01:33:30 -0500
Date: Fri, 29 Apr 2022 12:03:29 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Pascal Fabreges <pascal.fabreges@nokia.com>
CC: <linux-mtd@lists.infradead.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <wladislav.wiebe@nokia.com>,
 <alexander.sverdlin@nokia.com>, <agathe.porte@nokia.com>,
 <matthias.robert@nokia.com>
Subject: Re: [PATCH] spi-nor: fix spi_nor_probe
Message-ID: <20220429063329.ipza6wbijtiqfolu@ti.com>
References: <20220425135805.32-1-pascal.fabreges@nokia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220425135805.32-1-pascal.fabreges@nokia.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_233335_124516_72FD92DD 
X-CRM114-Status: GOOD (  21.26  )
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

Hi Pascal,

Thanks for the patch.

Please use the prefix "mtd: spi-nor: core: " for your patch subject. You 
can run git log on a particular file or subsystem to see what prefixes 
they use.

Also please send the patch to _all_ maintainers for the subsystem using 
scripts/get_maintainer.pl.

Anyway, see my review below.

On 25/04/22 01:58PM, Pascal Fabreges wrote:
> In rare cases, 7 on 5000 power off/on, the spi-nor driver is probed
> too soon.
> The controller is not in "running" mode.
> 
> The spi-nor driver take the hand before the end of the
> spi_start_queue procedure which set the running mode to true after
> the spi_init_queue (Initialize and start queue).
> 
> kernel: spi_master spi0: spi_init_queue: ctlr->running = false
> kernel: device: 'spi0.1': device_add
> kernel: bus: 'spi': add device spi0.1
> kernel: bus: 'spi': driver_probe_device: matched device spi0.1 with driver spi-nor
> kernel: bus: 'spi': really_probe: probing driver spi-nor with device spi0.1
> kernel: spi-nor spi0.1: no pinctrl handle
> kernel: spi-nor spi0.1: spi_nor_probe: Caller name: really_probe+0x2b3/0x3e0
> kernel: spi-nor spi0.1: spi_nor_probe: Call spi_nor_scan
> kernel: spi_master spi0: spi_mem_exec_op: Caller name: spi_nor_read_id+0x89/0x190
> kernel: spi-nor spi0.1: spi_sync: Caller name: spi_mem_exec_op+0x2f5/0x460
> kernel: spi-nor spi0.1: __spi_sync:  call __spi_queued_transfer
> kernel: spi-nor spi0.1: __spi_queued_transfer: return -ESHUTDOWN
> kernel: spi-nor spi0.1: error -108 reading JEDEC ID  00 00 00 00 00 00
> kernel: spi-nor: probe of spi0.1 failed with error -108
> 
> Signed-off-by: Pascal Fabreges <pascal.fabreges@nokia.com>
> ---
>  drivers/mtd/spi-nor/core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e6b8b19a68ee..dd82f42c29db 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3618,6 +3618,9 @@ static int spi_nor_probe(struct spi_mem *spimem)
>  	char *flash_name;
>  	int ret;
>  
> +	if (!spi->controller->running)
> +		return -EPROBE_DEFER;
> +

This is not the correct place to do this. SPI or SPI MEM should be 
checking this, and they should not call the peripheral (SPI NOR, SPI 
NAND, etc.) probe at all unless the controller is ready.

>  	nor = devm_kzalloc(&spi->dev, sizeof(*nor), GFP_KERNEL);
>  	if (!nor)
>  		return -ENOMEM;

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
