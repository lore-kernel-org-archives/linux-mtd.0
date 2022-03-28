Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E95EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 05:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QeQJHndn5eYGIWRsXpyVsn9hOutDAFeY78t3wL8wdSQ=; b=HWhqPIlT8GSmlF
	jCfGEJj7Esp7jDMcUtzRabupQ8WxjblPYPOCkZf9K3BvJVm3UHRZdzgr2R8Whg+8VEAhqw15jQpq4
	Rif4/Kpl1YTKFRllXpg8ZWwHHz6PdZ4P7fyy28Wvm7Ogk6yB4lEWHhREb1kF03bC8ZncqcRsREW14
	3YiXLGMGmJdwAk2cVRoEAL70e1xLGxJ7B6oMteZQ5AF73jC49whLlpU1CZePMZpspqUescvWRq8Sp
	M6cxlA7JBs04g6jqwJRy5XTM8dR04WCjzgP1FJBeFKepj7wDx/18r6j4xf0EnW1OZNM1y/nrceZST
	wGXTjWjqXeMGTFgh5nmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYiP1-007NEC-9c; Mon, 28 Mar 2022 05:58:55 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYiOy-007NDP-5Y; Mon, 28 Mar 2022 05:58:53 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22S5waqR101777;
 Mon, 28 Mar 2022 00:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648447116;
 bh=euNlWAypupzll6zTo6HeCm5If8Iz+1ErlvmrRLwWpiA=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=go1XAFxTtnSKiPog5qs7z5iCoQOdI8omvrHINTV1ixIfMv6a9wCw0pLS82ihGQCuU
 OpvZDijxpfC7LYD+P1pCg9OZ+6w93q7vuyUVsNehq7FDQ/pRDj4IImoU9l6sLVBfLf
 aU69lpXzB8P3xNB3wAXSYZHwkP2IUWKdvNNO512M=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22S5waAJ107661
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 28 Mar 2022 00:58:36 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 28
 Mar 2022 00:58:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 28 Mar 2022 00:58:36 -0500
Received: from [172.24.222.171] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22S5wU3l106927;
 Mon, 28 Mar 2022 00:58:31 -0500
Message-ID: <9a20ed24-be9d-bbec-19da-56c0ff68cbda@ti.com>
Date: Mon, 28 Mar 2022 11:28:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] mtd: spi-nor: fix minmax.cocci warnings
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>, <kbuild-all@lists.01.org>,
 <linux-arm-kernel@lists.infradead.org>, Amit Kumar Mahapatra
 <amit.kumar-mahapatra@xilinx.com>, Michal Simek <monstr@monstr.eu>, Tudor
 Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <alpine.DEB.2.22.394.2203260929310.3141@hadrien>
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <alpine.DEB.2.22.394.2203260929310.3141@hadrien>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_225852_360339_1A603D17 
X-CRM114-Status: GOOD (  13.95  )
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

Hi.

On 26/03/22 2:00 pm, Julia Lawall wrote:
> From: kernel test robot <lkp@intel.com>
> 
> Use min to simplify the code.
> 
> Generated by: scripts/coccinelle/misc/minmax.cocci
> 
> Fixes: 2747bc2106aa ("mtd: spi-nor: Add dual parallel and stacked mode support")
> CC: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Julia Lawall <julia.lawall@inria.fr>
> ---
> 
> tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
> head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
> commit: 2747bc2106aa429773d9a932c799aa6229595148 [840/1029] mtd: spi-nor: Add dual parallel and stacked mode support
> :::::: branch date: 34 hours ago
> :::::: commit date: 8 weeks ago
> 
>  drivers/mtd/spi-nor/core.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2034,10 +2034,7 @@ static int spi_nor_read(struct mtd_info
>  						(offset << nor->shift);
>  			}
>  		}
> -		if (len < rem_bank_len)
> -			read_len = len;
> -		else
> -			read_len = rem_bank_len;
> +		read_len = min(len, rem_bank_len);

This chunk does not exist in mainline. Seems like xlnx local changes.

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
