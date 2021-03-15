Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C28FC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 10:57:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2FA864E6B
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 10:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2FA864E6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QH29gMkJFjuoeZj93+nRuXMfhRCyR9xzqylCtU5VMk0=; b=VfksMGcPfsXQeSuDcJR1v7lKJ
	O+PTwD7TaoZfuNN+3RY+EVJyEiXlU9KbibCBpUsxbnCrdV4BPvD+2v+Sm3mKLO1eP6bKenjqCYyVd
	nEhiJiEb5tuf6RiYzaYwDqX4hUnxwj23ndYkmN+h2T6OctRF/iX08cAXWjzSAzuNvjLLfw9JXrNFW
	tw0gaqSAUUobUERzzqjp/yB6dHLt7vZekuScAMBq3PobXswjEFAHJBGiRVB+pPHMF6cJTyAyD/aO7
	HaqliLfaH3wFSYwJ0W4iBOufye9+91gcKZIwNnSsNwhLF92HbDt4FN4bQ9idWmiu6Oh2yaRdWgxSv
	F3U/LfEew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLktq-00FaZ1-Kg; Mon, 15 Mar 2021 10:56:38 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLkrf-00Fa0H-Oz
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 10:54:37 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12FAsFup028687;
 Mon, 15 Mar 2021 05:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615805655;
 bh=CpwvkC5nI/Q7xPSqukG1rRjwb0LQAcDOHy43No6JdFY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=jaspQrbb0VxjITlSmDUkUUSU9sDuUdhGy/TugeA1o076o23FIHKKWl7aWRpapNHTm
 jSfbG4+NBz4M9slPj9pzHOfetDJoxsYxapSuwbhF7xYIbyWMM0y4CNT4U5F7rzegjj
 9igYvseh5vyn1gInLOrl2t060RuYgHDRVnCS6V4Y=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12FAsFaj061704
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Mar 2021 05:54:15 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 Mar 2021 05:54:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 15 Mar 2021 05:54:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12FAsEVs127082;
 Mon, 15 Mar 2021 05:54:15 -0500
Date: Mon, 15 Mar 2021 16:24:13 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Yaliang.Wang@windriver.com>, <Bacem.Daassi@infineon.com>, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 2/6] mtd: spi-nor: core: Expose spi_nor_clear_sr() to
 manufacturer drivers
Message-ID: <20210315105411.quo3vk73imudqy7k@ti.com>
References: <cover.1615523176.git.Takahiro.Kuwano@infineon.com>
 <aab1376d1da139c8e347bb40e6561ec3b7359dbc.1615523176.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aab1376d1da139c8e347bb40e6561ec3b7359dbc.1615523176.git.Takahiro.Kuwano@infineon.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_105433_968224_A01FFD4E 
X-CRM114-Status: GOOD (  16.09  )
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

On 12/03/21 06:42PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> spi_nor_clear_sr() needs to be called from manufacturer drivers that
> implement the ->ready() hook.

I would expect flashes that need a custom method to read sr would also 
need a custom one to clear it. But maybe that is not the case.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v3:
>   - New in v3
>   
>  drivers/mtd/spi-nor/core.c | 2 +-
>  drivers/mtd/spi-nor/core.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index c8a7f246ab7d..3ca199bb83e3 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -653,7 +653,7 @@ static int spi_nor_xsr_ready(struct spi_nor *nor)
>   * spi_nor_clear_sr() - Clear the Status Register.
>   * @nor:	pointer to 'struct spi_nor'.
>   */
> -static void spi_nor_clear_sr(struct spi_nor *nor)
> +void spi_nor_clear_sr(struct spi_nor *nor)
>  {
>  	int ret;
>  
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4d06c27630fe..596480aef924 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -447,6 +447,7 @@ int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
>  int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
>  int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
>  
> +void spi_nor_clear_sr(struct spi_nor *nor);
>  int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
>  ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
>  			  u8 *buf);
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
