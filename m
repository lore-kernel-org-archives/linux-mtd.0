Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA081C4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 04:43:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 714D42184B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 04:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u4I3xfE2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ec2V3hEN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 714D42184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GbkxXGKqKTIBingQU6e4/K6mq9CZ4PuGLQxfrLzojI=; b=u4I3xfE2Vddkmg
	vXDYB4er9Up4ej/cr8g0i/0jiQJcaw/W+BgScHWgxOxryto1yC1XZ6/SPOgM6LW4akXl3E1QpI0M0
	2lptxyPmpyAQDBy4uNfFA7g5YfEJqLGcicZZCSMbEDUeEHoo4SmGs6q0q9xcdF/VB623rxOBo9WCf
	mISq0k/j4wMuJtWXaBd8iQtfFbGUusy2jknCldVP4lKPfxvcVl+efj1rrgg6GRLyKQ7bDs/BDgzZX
	Qa91WCGIeSgMkaSRE2qbc1TOG6hU1/Qw1NnOi3mMmkxhAOrVGcONK2IAGsAHfJ6sVdr0+JCCIeGyx
	LAZ/1S/uiCKe118YhrWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCGgu-0005pC-4t; Fri, 05 Apr 2019 04:43:00 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCGgr-0005or-4w
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 04:42:58 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x354gjqY054834;
 Thu, 4 Apr 2019 23:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1554439365;
 bh=FrOEIZruaUA+WUuGykmOzZJvsIbd8p65+rQQUO2qvLI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ec2V3hEN/pG98J/7yvYs0cN7xTeNu3hTzryAaysVhXypsYCwrEX4mpULLoMvRvKM2
 qviRzENcyqZUyfQHg/a+HxCjMXDU+tae0tjEwOh4cG0r8rCuyygjMcrC0ZkJZMlHj+
 oRvRI/pWRfFkpk1mQp/s+BJy6RuYhXWx9r+FVxxQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x354gjmj034331
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 4 Apr 2019 23:42:45 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 4 Apr
 2019 23:42:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 4 Apr 2019 23:42:44 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x354gewt052962;
 Thu, 4 Apr 2019 23:42:41 -0500
Subject: Re: [LINUX PATCH v2 3/3] spi: spi-mem: Add support for Zynq QSPI
 controller
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 <broonie@kernel.org>, <bbrezillon@kernel.org>
References: <1554105553-20207-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <c8f73eab-99eb-ddbc-9776-ea6b3a3ecf0f@ti.com>
Date: Fri, 5 Apr 2019 10:13:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554105553-20207-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_214257_294840_F255BFAB 
X-CRM114-Status: GOOD (  15.91  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, nagasuresh12@gmail.com,
 dwmw2@infradead.org, michal.simek@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 01/04/19 1:29 PM, Naga Sureshkumar Relli wrote:
> +/**
> + * zynq_qspi_config_op - Configure QSPI controller for specified transfer
> + * @xqspi:	Pointer to the zynq_qspi structure
> + * @qspi:	Pointer to the spi_device structure
> + *
> + * Sets the operational mode of QSPI controller for the next QSPI transfer and
> + * sets the requested clock frequency.
> + *
> + * Return:	0 on success and -EINVAL on invalid input parameter
> + *
> + * Note: If the requested frequency is not an exact match with what can be
> + * obtained using the prescalar value, the driver sets the clock frequency which
> + * is lower than the requested frequency (maximum lower) for the transfer. If
> + * the requested frequency is higher or lower than that is supported by the QSPI
> + * controller the driver will set the highest or lowest frequency supported by
> + * controller.
> + */
> +static int zynq_qspi_config_op(struct zynq_qspi *xqspi, struct spi_device *spi)
> +{
> +	u32 config_reg, baud_rate_val = 0;
> +
> +	/*
> +	 * Set the clock frequency
> +	 * The baud rate divisor is not a direct mapping to the value written
> +	 * into the configuration register (config_reg[5:3])
> +	 * i.e. 000 - divide by 2
> +	 *      001 - divide by 4
> +	 *      ----------------
> +	 *      111 - divide by 256
> +	 */
> +	while ((baud_rate_val < ZYNQ_QSPI_BAUD_DIV_MAX)  &&
> +	       (clk_get_rate(xqspi->refclk) / (2 << baud_rate_val)) >
> +		spi->max_speed_hz)
> +		baud_rate_val++;
> +

Instead use DIV_ROUND_UP, something like below should work(untested):

	unsigned long refclk_rate = clk_get_rate(xqspi->refclk);
	u32 baud_rate_val = DIV_ROUND_UP(refclk_rate, spi->max_speed_hz) - 1;

	if (baud_rate_val > ZYNQ_QSPI_BAUD_DIV_MAX)
		baud_rate_val = ZYNQ_QSPI_BAUD_DIV_MAX;

> +	config_reg = zynq_qspi_read(xqspi, ZYNQ_QSPI_CONFIG_OFFSET);
> +
> +	/* Set the QSPI clock phase and clock polarity */
> +	config_reg &= (~ZYNQ_QSPI_CONFIG_CPHA_MASK) &
> +		      (~ZYNQ_QSPI_CONFIG_CPOL_MASK);
> +	if (spi->mode & SPI_CPHA)
> +		config_reg |= ZYNQ_QSPI_CONFIG_CPHA_MASK;
> +	if (spi->mode & SPI_CPOL)
> +		config_reg |= ZYNQ_QSPI_CONFIG_CPOL_MASK;
> +
> +	config_reg &= ~ZYNQ_QSPI_CONFIG_BDRATE_MASK;
> +	config_reg |= (baud_rate_val << ZYNQ_QSPI_BAUD_DIV_SHIFT);
> +	zynq_qspi_write(xqspi, ZYNQ_QSPI_CONFIG_OFFSET, config_reg);
> +
> +	return 0;
> +}
> +

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
