Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA599C61DA2
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0uyYV+yIjCcOOGcVUrrAkwkSST3XV1cjI4flrNhf6w=; b=SvznoOrGwoYIm8
	6/71+x+DzF3IYHUjqXSoV/w/iYHw4l4C3wYIIk8FOTD2Wa2U8IvC32Vwx2riKoOg1W3wz/AQYicMg
	vrHZ4d6/A40V1/xf5FlR+N2mOM5LZEGBQ1/OSWy4NuWTgI6pC7F7wIMsa4M9oV9PKjkIttnlWLe1a
	BTbPBz97EYFlCqlWmxOJkmDKnul7cpw2k4D6Wquyf8j7ZyBZVXhl+j/ShwRU+DKqiPJf69RTvpnXF
	pfklv6Opg7UTv9rK3jsZyVX8/R99tMm0rXkFRK+qc3UxhhQBhnxrABRCiJQjGqS846zPYzhh9Rb43
	seFWBhhFS6yGxhVo0wJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK0RQ-000nQu-L1; Mon, 23 Jan 2023 17:17:08 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK0RM-000nNk-Jx; Mon, 23 Jan 2023 17:17:06 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30NEJOGm009639;
	Mon, 23 Jan 2023 18:16:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=R1aMUGjTbxhxY6hkyKRGBk4zxbzWjzxiNcedON6udFo=;
 b=Zm5ggXoNZruq7Bb3b8N1qmVGlQxdkRIHa80INaPpZBBpXyjLW8eCZLOi26l5A6+RB5/w
 Z+PZ3/cL4Va46yqtmJi5PORwYTY46FioxWKylbeuPxm436newkRnSC7hmZnYsKWHL2Kb
 E8O4kMxS5/CdwDsQ4mM0v4xIMFleF1b25tB/cNt2YL3f/fwzgGAIWdrLxxMD8SuKdWQu
 cPFgMv67SOjqXrPKNSoqvl1+YjTlQbFYmJvNya7GzzdG/j6Oyh9icv6JPWXR/j9Hrm2V
 cNegJauCMm20Z1Gl+nUL+NtrY2i2G1zVxWNtOmY+nTZipz1phWQlTPi0LXd8tXF5+ztP QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n89epk4d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jan 2023 18:16:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 733D910002A;
	Mon, 23 Jan 2023 18:16:37 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89E49228A2B;
	Mon, 23 Jan 2023 18:16:37 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 23 Jan
 2023 18:16:34 +0100
Message-ID: <e068c541-b492-a513-6212-fd698e4fc9c4@foss.st.com>
Date: Mon, 23 Jan 2023 18:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, <broonie@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
        <pratyush@kernel.org>, <sanju.mehta@amd.com>,
        <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>, <kdasu.kdev@gmail.com>,
        <f.fainelli@gmail.com>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <eajames@linux.ibm.com>, <olteanv@gmail.com>, <han.xu@nxp.com>,
        <john.garry@huawei.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <narmstrong@baylibre.com>,
        <khilman@baylibre.com>, <matthias.bgg@gmail.com>, <haibo.chen@nxp.com>,
        <linus.walleij@linaro.org>, <daniel@zonque.org>,
        <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>, <heiko@sntech.de>,
        <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
        <masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
        <rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <alex.aring@gmail.com>,
        <stefan@datenfreihafen.org>, <kvalo@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <skomatineni@nvidia.com>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <j.neuschaefer@gmx.net>,
        <vireshk@kernel.org>, <rmfrfs@gmail.com>, <johan@kernel.org>,
        <elder@kernel.org>, <gregkh@linuxfoundation.org>
CC: <git@amd.com>, <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <joel@jms.id.au>, <andrew@aj.id.au>, <radu_nicolae.pirea@upb.ro>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@microchip.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <fancer.lancer@gmail.com>,
        <kernel@pengutronix.de>, <festevam@gmail.com>, <linux-imx@nxp.com>,
        <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
        <avifishman70@gmail.com>, <tmaimon77@gmail.com>,
        <tali.perry1@gmail.com>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <yogeshgaur.83@gmail.com>,
        <konrad.dybcio@somainline.org>, <alim.akhtar@samsung.com>,
        <ldewangan@nvidia.com>, <michal.simek@amd.com>,
        <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-wpan@vger.kernel.org>,
        <libertas-dev@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <lars@metafoo.de>,
        <Michael.Hennerich@analog.com>, <linux-iio@vger.kernel.org>,
        <michael@walle.cc>, <palmer@dabbelt.com>,
        <linux-riscv@lists.infradead.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <greybus-dev@lists.linaro.org>,
        <linux-staging@lists.linux.dev>, <amitrkcian2002@gmail.com>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_091705_156013_08D9365B 
X-CRM114-Status: GOOD (  20.56  )
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

Hi Amit

On 1/19/23 19:53, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---

[...]

>  drivers/spi/spi-stm32-qspi.c      | 12 ++++++------

[...]

> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
> index 9131660c1afb..b9e61372dcfb 100644
> --- a/drivers/spi/spi-stm32-qspi.c
> +++ b/drivers/spi/spi-stm32-qspi.c
> @@ -359,7 +359,7 @@ static int stm32_qspi_get_mode(u8 buswidth)
>  static int stm32_qspi_send(struct spi_device *spi, const struct spi_mem_op *op)
>  {
>  	struct stm32_qspi *qspi = spi_controller_get_devdata(spi->master);
> -	struct stm32_qspi_flash *flash = &qspi->flash[spi->chip_select];
> +	struct stm32_qspi_flash *flash = &qspi->flash[spi_get_chipselect(spi, 0)];
>  	u32 ccr, cr;
>  	int timeout, err = 0, err_poll_status = 0;
>  
> @@ -564,7 +564,7 @@ static int stm32_qspi_transfer_one_message(struct spi_controller *ctrl,
>  	struct spi_mem_op op;
>  	int ret = 0;
>  
> -	if (!spi->cs_gpiod)
> +	if (!spi_get_csgpiod(spi, 0))
>  		return -EOPNOTSUPP;
>  
>  	ret = pm_runtime_resume_and_get(qspi->dev);
> @@ -573,7 +573,7 @@ static int stm32_qspi_transfer_one_message(struct spi_controller *ctrl,
>  
>  	mutex_lock(&qspi->lock);
>  
> -	gpiod_set_value_cansleep(spi->cs_gpiod, true);
> +	gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), true);
>  
>  	list_for_each_entry(transfer, &msg->transfers, transfer_list) {
>  		u8 dummy_bytes = 0;
> @@ -626,7 +626,7 @@ static int stm32_qspi_transfer_one_message(struct spi_controller *ctrl,
>  	}
>  
>  end_of_transfer:
> -	gpiod_set_value_cansleep(spi->cs_gpiod, false);
> +	gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), false);
>  
>  	mutex_unlock(&qspi->lock);
>  
> @@ -669,8 +669,8 @@ static int stm32_qspi_setup(struct spi_device *spi)
>  
>  	presc = DIV_ROUND_UP(qspi->clk_rate, spi->max_speed_hz) - 1;
>  
> -	flash = &qspi->flash[spi->chip_select];
> -	flash->cs = spi->chip_select;
> +	flash = &qspi->flash[spi_get_chipselect(spi, 0)];
> +	flash->cs = spi_get_chipselect(spi, 0);
>  	flash->presc = presc;
>  
>  	mutex_lock(&qspi->lock);

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
