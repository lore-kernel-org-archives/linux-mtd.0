Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE1FC61DA4
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Feb 2023 09:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/P+KUbOtO9GtXA39Ojuoe0kz8XbHEqxxDLtHSllO2U=; b=x3tzei2hOh4cpj5Z+v5eLpjoSc
	SjyO3tFDyr70MRoRav4CvMuJ7q/3ZQH03U/GG6p7Erw4Idjzfnwm9vXmlaXa5K2SkHImfr7T4uENP
	QKk8u4JqdpiesAbP9ZCClxP7O9UBLH0Bvnt50x6kZlRsAAPTo2TapRk9rvJQTfT6LBKPSsL90lUf9
	uLETE29ys3cFyV7xK8bSoCc+FXNM526HuPIQ4VG9I//mEBdVLbFnWqbsojpF/danTWfQGTew0j+xe
	DzzWDxZpyTGbfjnHWRJKZ96iwno4KUFzMxra9aKnVz0EDWLnqepJR45sGlhEXZImMYrggz6P2+DG6
	DwyMMO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7uQ-00FhjV-8m; Thu, 23 Feb 2023 09:29:02 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7uG-00FhgM-SB
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2023 09:28:54 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31N9SlYX113352
	for <linux-mtd@lists.infradead.org>; Thu, 23 Feb 2023 03:28:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677144527;
	bh=b6kO0FfQ7eB2ONyZ3pFEFu3MUKrth4LsOXLfk4WVgsc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=tFJu/Sd2/ETyOIF0nn2HPRDZOnPVkh6WJCpfefESINvF5bP/MsORg7QeI1Am/OBZ0
	 j2F57H+rX3YIw7+xQ0EUySa6McmU+O0+RR4hDYEJvKoW0mgDO+OKfAuAVNO7w6opX2
	 7LPajFg4twXEnOh+uAX+fEmzxXLlwA870s+HWSgk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31N9SlDT120976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Thu, 23 Feb 2023 03:28:47 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 23
 Feb 2023 03:28:47 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 23 Feb 2023 03:28:47 -0600
Received: from [10.24.69.26] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31N9SkJH056453
	for <linux-mtd@lists.infradead.org>; Thu, 23 Feb 2023 03:28:46 -0600
Message-ID: <7459aaf2-b14f-f537-a2ed-2f5ac63d16d9@ti.com>
Date: Thu, 23 Feb 2023 14:58:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/8] mtd: spi-nor: core: Introduce number of dice and
 volatile register offset params
Content-Language: en-US
To: <linux-mtd@lists.infradead.org>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
 <97e4456016d31567649e2a99d6d4daff7ed90e4a.1675835253.git.Takahiro.Kuwano@infineon.com>
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <97e4456016d31567649e2a99d6d4daff7ed90e4a.1675835253.git.Takahiro.Kuwano@infineon.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_012853_143056_BBA39113 
X-CRM114-Status: GOOD (  20.11  )
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



On 08/02/23 11:23, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> In use of mult-chip devices, we need to access registers in each die for

s/mult-/multi-

> configuration and status check. The number of dice in the device and
> volatile register offset for each die are essential to iterate register

s/offset/offsets for each die

> access ops.
> 
> The number of dice must be initialized as 1 and may be updated through
> SFDP parse.
> 
> The volatile register offset table is dinamically allocated based on

s/dinamically/dynamically

> the number of dice then filled with offset values collected from SFDP.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
>   drivers/mtd/spi-nor/core.c | 1 +
>   drivers/mtd/spi-nor/core.h | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index b500655f7937..f18be6283740 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2576,6 +2576,7 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
>   	params->writesize = 1;
>   	params->size = (u64)info->sector_size * info->n_sectors;
>   	params->page_size = info->page_size;
> +	params->num_of_dice = 1;
>   
>   	if (!(info->flags & SPI_NOR_NO_FR)) {
>   		/* Default to Fast Read for DT and non-DT platform devices. */
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index f6d012e1f681..c876ece62f13 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -349,6 +349,8 @@ struct spi_nor_otp {
>    *			in octal DTR mode.
>    * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
>    *			command in octal DTR mode.
> + * @num_of_dice:	number of dice in the flash memory.
> + * @vreg_offset:	volatile register offset for each die.
>    * @hwcaps:		describes the read and page program hardware
>    *			capabilities.
>    * @reads:		read capabilities ordered by priority: the higher index
> @@ -381,6 +383,8 @@ struct spi_nor_flash_parameter {
>   	u8				addr_mode_nbytes;
>   	u8				rdsr_dummy;
>   	u8				rdsr_addr_nbytes;
> +	u8				num_of_dice;
> +	u32				*vreg_offset;
>   
>   	struct spi_nor_hwcaps		hwcaps;
>   	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];

-- 
Thanks and Regards,
Dhruva Gole

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
