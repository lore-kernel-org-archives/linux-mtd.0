Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCC7C38159
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Jan 2023 04:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niA3R/hhNffCjza0rEK2QMF6d1w6nghWgfHJcRz3J80=; b=EEV7BHVl3rt5WR
	iTDPw9NAOhpJ6XINF14O4hxlU+hhg792X4snjZxg8+7lm+9awx/mVFM4j+QdsE99KuBxDFSxccGiQ
	0u2904WuhrQfT+VzZevTj8W92gyR59OAwN7TVOz9BKNgQiw4GOgy9MlZKCx/5Rf0ukOdg/GwPAMBI
	xa6o1ehM7HKbyJgPVSgZKFZzX+yWDVxh0tGQnIZq/ZI8e/jd+ANh00jzvlSiJu+HOjzyqghcIBUCG
	Xm0HWBYZcQ6DJeCPYQxzZ7vEstKqVfAz78GuCpCkx8GMe419QKqrDb5pjPLJM+Dk7EG3MQXtQDHF5
	KUGZQc59/IN4sKeU31rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIj32-008LGG-NH; Fri, 20 Jan 2023 04:30:40 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIj2z-008LDI-0R
	for linux-mtd@lists.infradead.org; Fri, 20 Jan 2023 04:30:38 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30K4UDN0117944;
	Thu, 19 Jan 2023 22:30:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674189013;
	bh=iezSynNH5W1oFTWX7VE7fYRtxIVPYwi3S16nlZLNrIc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=p9/6wEPY16TKS1V4cFMywOK3klEnssGDfRunmqGvKUXBQImQaleB986h94DZ13CYR
	 h1PPsT1URYRc2/FZC2XEco1Q3APXhHjIdgKTtH0KU0Eor4JUlQ0XzTQL0U75bUz0FU
	 +WzvjJDPYc0FwFYXoY2WNHviv1DJvbdEkWXghdBM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30K4UDOE094394
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Jan 2023 22:30:13 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 19
 Jan 2023 22:30:13 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 19 Jan 2023 22:30:13 -0600
Received: from [10.24.69.26] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30K4UAwc026047;
	Thu, 19 Jan 2023 22:30:10 -0600
Message-ID: <6a5f3395-8f1f-5bc3-29ce-205686ff704a@ti.com>
Date: Fri, 20 Jan 2023 10:00:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mtd: spinand: macronix: use scratch buffer for DMA
 operation
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC: Mason Yang <masonccyang@mxic.com.tw>, Jianhui Zhao <zhaojh329@gmail.com>
References: <Y8i85zM0u4XdM46z@makrotopia.org>
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <Y8i85zM0u4XdM46z@makrotopia.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_203037_534146_A2F43CF3 
X-CRM114-Status: GOOD (  19.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Daniel,

On 19/01/23 09:15, Daniel Golle wrote:
> The mx35lf1ge4ab_get_eccsr() function uses an SPI DMA operation to
> read the eccsr, hence the buffer should not be on stack. Since commit
> 380583227c0c7f ("spi: spi-mem: Add extra sanity checks on the op param")
> the kernel emmits a warning and blocks such operations.

Good catch!

> 
> Use the scratch buffer to get eccsr instead of trying to directly read
> into a stack-allocated variable.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>

>   drivers/mtd/nand/spi/macronix.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
> index dce835132a1e2..722a9738ba370 100644
> --- a/drivers/mtd/nand/spi/macronix.c
> +++ b/drivers/mtd/nand/spi/macronix.c
> @@ -83,9 +83,10 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
>   		 * in order to avoid forcing the wear-leveling layer to move
>   		 * data around if it's not necessary.
>   		 */
> -		if (mx35lf1ge4ab_get_eccsr(spinand, &eccsr))
> +		if (mx35lf1ge4ab_get_eccsr(spinand, spinand->scratchbuf))
>   			return nanddev_get_ecc_conf(nand)->strength;
>   
> +		eccsr = *spinand->scratchbuf;
>   		if (WARN_ON(eccsr > nanddev_get_ecc_conf(nand)->strength ||
>   			    !eccsr))
>   			return nanddev_get_ecc_conf(nand)->strength;

-- 
Thanks and Regards,
Dhruva Gole

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
