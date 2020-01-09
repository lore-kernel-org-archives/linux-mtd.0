Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D30C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:54:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF8E206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 15:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="auTqujv+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAF8E206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ut/opNATk1MvKvwsR7MK4gO+f7ff/6VvGOQR4Q8XiFo=; b=auTqujv+Pnj2XovURLVFVFT9Q
	pSuaJsNIZY0o46EHd/4TXTMHvHIz5NFD495XJ6ZFkNsRKeKyaCp3tyUgtfIWyVsIX3Tfhq57QlnLo
	MT+Gvg3APZOjrBaE5b6pymoLxrMlsL02030BYI2Vr289b/Em9KZviigdoZXjrNMJqySb/rDGtLbUc
	Vd04HT+KdQ+0enDXnLjFSr07PGPAz21lrxI3BMZOpEEui5aHtogGaQHlZyD/UHG1F3kX01mQ/+G7w
	OeW/OoLMnUBJ7EwVBJfle3cVB3x3GEcxPQgpSOkIhS0ANyULtsfv04tU93OYVZp9O4zNeH9Hp10mw
	81TSmRzyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipa8U-0008TB-Eo; Thu, 09 Jan 2020 15:54:14 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipa8Q-0008HB-5B
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 15:54:12 +0000
Received: from lhreml707-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id EAEA9FEA2FA6E372B4D1;
 Thu,  9 Jan 2020 15:54:02 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml707-cah.china.huawei.com (10.201.108.48) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 9 Jan 2020 15:54:02 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 9 Jan 2020
 15:54:02 +0000
From: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
To: <broonie@kernel.org>, <marek.vasut@gmail.com>,
 <tudor.ambarus@microchip.com>
References: <1575900490-74467-1-git-send-email-john.garry@huawei.com>
 <1575900490-74467-3-git-send-email-john.garry@huawei.com>
Message-ID: <0dc5cb2e-b765-9e13-b05e-9e3c835c5985@huawei.com>
Date: Thu, 9 Jan 2020 15:54:00 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1575900490-74467-3-git-send-email-john.garry@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml729-chm.china.huawei.com (10.201.108.80) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_075410_375814_AB09C03C 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: chenxiang66@hisilicon.com, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com, fengsheng5@huawei.com, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, xuejiancheng@hisilicon.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 09/12/2019 14:08, John Garry wrote:
> +	if (ret)
> +		return ret;
> +
> +	if (op->data.dir == SPI_MEM_DATA_IN)
> +		hisi_sfc_v3xx_read_databuf(host, op->data.buf.in, len);
> +
> +	return 0;
> +}
> +
> +static int hisi_sfc_v3xx_exec_op(struct spi_mem *mem,
> +				 const struct spi_mem_op *op)
> +{
> +	struct hisi_sfc_v3xx_host *host;
> +	struct spi_device *spi = mem->spi;
> +	u8 chip_select = spi->chip_select;
> +
> +	host = spi_controller_get_devdata(spi->master);
> +
> +	return hisi_sfc_v3xx_generic_exec_op(host, op, chip_select);
> +}
> +
> +static const struct spi_controller_mem_ops hisi_sfc_v3xx_mem_ops = {
> +	.adjust_op_size = hisi_sfc_v3xx_adjust_op_size,
> +	.exec_op = hisi_sfc_v3xx_exec_op,
> +};
> +
> +static int hisi_sfc_v3xx_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct hisi_sfc_v3xx_host *host;
> +	struct spi_controller *ctlr;
> +	u32 version;
> +	int ret;
> +
> +	ctlr = spi_alloc_master(&pdev->dev, sizeof(*host));
> +	if (!ctlr)
> +		return -ENOMEM;
> +


Hi Mark,

> +	ctlr->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD |
> +			  SPI_TX_DUAL | SPI_TX_QUAD;

I have an issue with dual/quad support. I naively thought that setting 
these bits would give me the highest protocol available.

However, now I notice that spi_device.mode needs to be set for supported 
protocols for the slave - I'm using the generic spi mem ops to check if 
protocols are supported based on this value.

 From checking acpi_spi_add_resource() or anywhere else, I cannot see 
how SPI_RX_DUAL or the others are set for spi_device.mode. What am I 
missing? Are these just not supported yet for ACPI? Or should the 
spi-nor code not be relying on this since we should be able to get this 
info from the SPI NOR part?

Cheers,
John

> +
> +	host = spi_controller_get_devdata(ctlr);
> +	host->dev = dev;
> +
> +	platform_set_drvdata(pdev, host);
> +
> +	host->regbase = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(host->regbase)) {
> +		ret = PTR_ERR(host->regbase);
> +		goto err_put_master;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
