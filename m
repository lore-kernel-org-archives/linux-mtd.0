Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89E1C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 11:00:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9304F21915
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 11:00:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k5NJ/VmE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="arH6BGvv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9304F21915
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BenVX5f3TKmBPZdS5lDwzXu1TJL6DDHCHGgattkxYa0=; b=k5NJ/VmEKzfmEb
	9LfS7jyeFr9hXUY+qcqzHwZVh5tyRRU07Ym06YpMJ9GOlB0MfVzKDNT3G4bMRC4HNyNlXAw6sRvkq
	nibsSZUWhDJCRai9LpACBTKAVLqsSu3aMSJ/1Xd+fOWbZYrbIUJSq46KtHrm067JYybRCeSCrl0ui
	m25xo50LlxIQB4g0kg854TwtsrvKTBc/d4v2AAZZrzHsIHZlep5PkyUqlUfYu40wchV/+yWv8ouJE
	5lRzQ7MZfrJiyssubdUZu0t/hh+b+2zum0Wp0PlVpuwyljSDwrOnWEOLcRI/8zWbqRSq5bxZ490C7
	GoDAfA8ZL+i1M0tzSmXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6vRM-0005SL-OK; Thu, 21 Mar 2019 11:00:52 +0000
Received: from mail-eopbgr710084.outbound.protection.outlook.com
 ([40.107.71.84] helo=NAM05-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6vRJ-0005Rt-H4
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 11:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDQOrqmIVeRy8ffaF3u5fiRn6lFwAKlfhAKisLN/V6E=;
 b=arH6BGvvOOSE1oB00p1sRr3L0oMSAfN0ZcCdP+MwxuCQILAMZ/KWb/AqvJd0AwPBC1RYtb6y6xz6DeoPw4YUiSkok+PpKJwL2sOOJtG825sTCdwpzUGfULvnFflelldNFR2e6iDP7zFlRVAc90+jSvTSqCiNViiG9UGqhTwmFxQ=
Received: from MWHPR02MB2623.namprd02.prod.outlook.com (10.168.206.9) by
 MWHPR02MB2415.namprd02.prod.outlook.com (10.168.244.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.15; Thu, 21 Mar 2019 11:00:46 +0000
Received: from MWHPR02MB2623.namprd02.prod.outlook.com
 ([fe80::c89d:e485:cb5e:89cf]) by MWHPR02MB2623.namprd02.prod.outlook.com
 ([fe80::c89d:e485:cb5e:89cf%5]) with mapi id 15.20.1709.017; Thu, 21 Mar 2019
 11:00:46 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Subject: RE: [RFC PATCH 2/2] spi: spi-mem: Add support for Zynq QSPI controller
Thread-Topic: [RFC PATCH 2/2] spi: spi-mem: Add support for Zynq QSPI
 controller
Thread-Index: AQHUzzOoSBENcbUE5E66VjcEuxsjhqYU4aSAgAEjihA=
Date: Thu, 21 Mar 2019 11:00:45 +0000
Message-ID: <MWHPR02MB2623D0FAE20F2B16A34A26B5AF420@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1551337361-11665-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <be5f5974-2f8f-1d8d-6f93-4b975a8114b1@ti.com>
In-Reply-To: <be5f5974-2f8f-1d8d-6f93-4b975a8114b1@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea2b8cc5-8730-4de7-0ee7-08d6adec783b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR02MB2415; 
x-ms-traffictypediagnostic: MWHPR02MB2415:
x-microsoft-antispam-prvs: <MWHPR02MB241546B409C9C3ADD41FF8FAAF420@MWHPR02MB2415.namprd02.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(136003)(346002)(39860400002)(376002)(13464003)(51914003)(189003)(199004)(52536014)(8676002)(71200400001)(3846002)(2201001)(6116002)(105586002)(476003)(97736004)(53546011)(30864003)(486006)(53936002)(2906002)(55016002)(68736007)(71190400001)(11346002)(14454004)(86362001)(8936002)(5660300002)(6436002)(316002)(9686003)(54906003)(99286004)(6246003)(66066001)(305945005)(81166006)(478600001)(186003)(26005)(110136005)(7736002)(74316002)(229853002)(102836004)(76176011)(256004)(14444005)(81156014)(6506007)(2501003)(7696005)(446003)(7416002)(25786009)(4326008)(106356001)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2415;
 H:MWHPR02MB2623.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4cz4h1Zza5YP2fuByouCd0YEFBNFzRKBN+OIzAPlINQNkjyxwy/LkjYFCauby7BqyJgp63G8di3InG6TSU9BRCW66p8AdcOf4HP2so9VfdJ2tgii5ZJgwCqbnkjmqM9IYY1UnYaeKArocZbeIMZpm6cVa9avVaw6lIQjQQo21SEO/yNBWOtykcVRyzieGShR8fPGyD5+NH88HozgpZrhb1W0tPo4ChqaZbbGofGFfCOxcNNzCbi6IAC5ozyrot7N4hJmy48+b9ZLamxEYLwSR4wk1JVfMBZnfnkYuHuhI//g2gPGht/X5+nOhggpV4OnXn7NW2FxwX/DFnS+LCZQbRwPSPFUwi2gmflzkb30YDyfWKPmNf+8697c4W9oEnV6R+DBmh5y+FxVU4xftNzte9AOxEh6BSI9RWzkSZzWXek=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2b8cc5-8730-4de7-0ee7-08d6adec783b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 11:00:45.8645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2415
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_040049_631500_730D887C 
X-CRM114-Status: GOOD (  25.32  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 Michal Simek <michals@xilinx.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Vignesh,

Thanks for the review.

> -----Original Message-----
> From: linux-spi-owner@vger.kernel.org <linux-spi-owner@vger.kernel.org> On Behalf Of
> Vignesh Raghavendra
> Sent: Wednesday, March 20, 2019 10:42 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>; broonie@kernel.org;
> bbrezillon@kernel.org
> Cc: linux-spi@vger.kernel.org; dwmw2@infradead.org; marek.vasut@gmail.com;
> richard@nod.at; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Michal Simek
> <michals@xilinx.com>; nagasuresh12@gmail.com
> Subject: Re: [RFC PATCH 2/2] spi: spi-mem: Add support for Zynq QSPI controller
> 
> Hi,
> 
> Few more comments that I missed last time around.
> 
> On 28/02/19 12:32 PM, Naga Sureshkumar Relli wrote:
> > Add support for QSPI controller driver used by Xilinx Zynq SOC.
> >
> > Signed-off-by: Naga Sureshkumar Relli
> > <naga.sureshkumar.relli@xilinx.com>
> > ---
> >  drivers/spi/Kconfig         |   8 +
> >  drivers/spi/Makefile        |   1 +
> >  drivers/spi/spi-zynq-qspi.c | 780
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 789 insertions(+)
> >  create mode 100644 drivers/spi/spi-zynq-qspi.c
> >
> > diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig index
> > 9f89cb1..f12c880 100644
> > --- a/drivers/spi/Kconfig
> > +++ b/drivers/spi/Kconfig
> > @@ -816,6 +816,14 @@ config SPI_XTENSA_XTFPGA
> >  	  16 bit words in SPI mode 0, automatically asserting CS on transfer
> >  	  start and deasserting on end.
> >
> > +config SPI_ZYNQ_QSPI
> > +	tristate "Xilinx Zynq QSPI controller"
> > +	depends on ARCH_ZYNQ
> 
> Could you enable the driver for compile testing?
> From quick look this should enough:
Ok. I will update it in next version.
> 
> depends on ARCH_ZYNQ || COMPILE_TEST
> 
> > +	help
> > +	  This enables support for the Zynq Quad SPI controller
> > +	  in master mode.
> > +	  This controller only supports SPI memory interface.
> > +
> >  config SPI_ZYNQMP_GQSPI
> >  	tristate "Xilinx ZynqMP GQSPI controller"
> >  	depends on SPI_MASTER && HAS_DMA
> 
> [...]
> 
> > +/**
> > + * zynq_qspi_exec_mem_op() - Initiates the QSPI transfer
> > + * @mem: the SPI memory
> > + * @op: the memory operation to execute
> > + *
> > + * Executes a memory operation.
> > + *
> > + * This function first selects the chip and starts the memory operation.
> > + *
> > + * Return: 0 in case of success, a negative error code otherwise.
> > + */
> > +static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
> > +				 const struct spi_mem_op *op)
> > +{
> > +	struct zynq_qspi *xqspi = spi_controller_get_devdata(mem->spi->master);
> > +	int err = 0, i;
> > +	u8 *tmpbuf;
> > +
> > +	dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
> > +		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> > +		op->dummy.buswidth, op->data.buswidth);
> > +
> > +	zynq_qspi_chipselect(mem->spi, true);
> > +	zynq_qspi_config_op(xqspi, mem->spi);
> > +
> > +	if (op->cmd.opcode) {
> > +		reinit_completion(&xqspi->data_completion);
> > +		xqspi->txbuf = (u8 *)&op->cmd.opcode;
> > +		xqspi->rxbuf = NULL;
> > +		xqspi->tx_bytes = sizeof(op->cmd.opcode);
> > +		xqspi->rx_bytes = sizeof(op->cmd.opcode);
> > +		zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH, true);
> > +		zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,
> > +				ZYNQ_QSPI_IXR_RXTX_MASK);
> > +		if (!wait_for_completion_interruptible_timeout(&xqspi->data_completion,
> > +							       msecs_to_jiffies(1000))) {
> > +			err = -ETIMEDOUT;
> > +		}
> > +	}
> > +	zynq_qspi_config_op(xqspi, mem->spi);
> 
> Why is it required to call zynq_qspi_config_op() b/w every stage of single flash operation? Is
> it not enough to do once at the beginning?
Yes, we can do it once. 
I will update it.

> 
> > +	if (op->addr.nbytes) {
> > +		for (i = 0; i < op->addr.nbytes; i++) {
> > +			xqspi->txbuf[i] = op->addr.val >>
> > +					(8 * (op->addr.nbytes - i - 1));
> > +		}
> > +
> > +		reinit_completion(&xqspi->data_completion);
> > +		xqspi->rxbuf = NULL;
> > +		xqspi->tx_bytes = op->addr.nbytes;
> > +		xqspi->rx_bytes = op->addr.nbytes;
> > +		zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH, true);
> > +		zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,
> > +				ZYNQ_QSPI_IXR_RXTX_MASK);
> > +		if (!wait_for_completion_interruptible_timeout(&xqspi->data_completion,
> > +							       msecs_to_jiffies(1000))) {
> > +			err = -ETIMEDOUT;
> > +		}
> > +	}
> > +	zynq_qspi_config_op(xqspi, mem->spi);
> > +	if (op->dummy.nbytes) {
> > +		tmpbuf = kzalloc(op->dummy.nbytes, GFP_KERNEL);
> > +		memset(tmpbuf, 0xff, op->dummy.nbytes);
> > +		reinit_completion(&xqspi->data_completion);
> > +		xqspi->txbuf = tmpbuf;
> > +		xqspi->rxbuf = NULL;
> > +		xqspi->tx_bytes = op->dummy.nbytes;
> > +		xqspi->rx_bytes = op->dummy.nbytes;
> > +		zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH, true);
> > +		zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,
> > +				ZYNQ_QSPI_IXR_RXTX_MASK);
> > +		if (!wait_for_completion_interruptible_timeout(&xqspi->data_completion,
> > +							       msecs_to_jiffies(1000))) {
> > +			err = -ETIMEDOUT;
> > +		}
> > +		kfree(tmpbuf);
> > +	}
> > +	zynq_qspi_config_op(xqspi, mem->spi);
> > +	if (op->data.nbytes) {
> > +		reinit_completion(&xqspi->data_completion);
> > +		if (op->data.dir == SPI_MEM_DATA_OUT) {
> > +			xqspi->txbuf = (u8 *)op->data.buf.out;
> > +			xqspi->tx_bytes = op->data.nbytes;
> > +			xqspi->rxbuf = NULL;
> > +			xqspi->rx_bytes = op->data.nbytes;
> > +		} else {
> > +			xqspi->txbuf = NULL;
> > +			xqspi->rxbuf = (u8 *)op->data.buf.in;
> > +			xqspi->rx_bytes = op->data.nbytes;
> > +			xqspi->tx_bytes = op->data.nbytes;
> > +		}
> > +
> > +		zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH, true);
> > +		zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,
> > +				ZYNQ_QSPI_IXR_RXTX_MASK);
> > +		if (!wait_for_completion_interruptible_timeout(&xqspi->data_completion,
> > +							       msecs_to_jiffies(1000))) {
> > +			err = -ETIMEDOUT;
> > +		}
> > +	}
> > +	zynq_qspi_chipselect(mem->spi, false);
> > +
> > +	return err;
> > +}
> > +
> > +static const struct spi_controller_mem_ops zynq_qspi_mem_ops = {
> > +	.supports_op = zynq_qspi_supports_op,
> > +	.exec_op = zynq_qspi_exec_mem_op,
> > +};
> > +
> > +/**
> > + * zynq_qspi_probe - Probe method for the QSPI driver
> > + * @pdev:	Pointer to the platform_device structure
> > + *
> > + * This function initializes the driver data structures and the hardware.
> > + *
> > + * Return:	0 on success and error value on failure
> > + */
> > +static int zynq_qspi_probe(struct platform_device *pdev) {
> > +	int ret = 0;
> > +	struct spi_controller *ctlr;
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np = dev->of_node;
> > +	struct zynq_qspi *xqspi;
> > +	struct resource *res;
> > +	u32 num_cs;
> > +
> > +	ctlr = spi_alloc_master(&pdev->dev, sizeof(*xqspi));
> > +	if (!ctlr)
> > +		return -ENOMEM;
> > +
> > +	xqspi = spi_controller_get_devdata(ctlr);
> > +	xqspi->dev = dev;
> > +	platform_set_drvdata(pdev, xqspi);
> > +	ctlr->mem_ops = &zynq_qspi_mem_ops;
> 
> 
> ctlr->mem_ops is initialized twice. See below..
Ok. I will correct it.
> 
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	xqspi->regs = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(xqspi->regs)) {
> > +		ret = PTR_ERR(xqspi->regs);
> > +		goto remove_master;
> > +	}
> > +
> > +	xqspi->pclk = devm_clk_get(&pdev->dev, "pclk");
> > +	if (IS_ERR(xqspi->pclk)) {
> > +		dev_err(&pdev->dev, "pclk clock not found.\n");
> > +		ret = PTR_ERR(xqspi->pclk);
> > +		goto remove_master;
> > +	}
> > +
> > +	init_completion(&xqspi->data_completion);
> > +
> > +	xqspi->refclk = devm_clk_get(&pdev->dev, "ref_clk");
> > +	if (IS_ERR(xqspi->refclk)) {
> > +		dev_err(&pdev->dev, "ref_clk clock not found.\n");
> > +		ret = PTR_ERR(xqspi->refclk);
> > +		goto remove_master;
> > +	}
> > +
> > +	ret = clk_prepare_enable(xqspi->pclk);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Unable to enable APB clock.\n");
> > +		goto remove_master;
> > +	}
> > +
> > +	ret = clk_prepare_enable(xqspi->refclk);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Unable to enable device clock.\n");
> > +		goto clk_dis_pclk;
> > +	}
> > +
> > +	/* QSPI controller initializations */
> > +	zynq_qspi_init_hw(xqspi);
> > +
> > +	xqspi->irq = platform_get_irq(pdev, 0);
> > +	if (xqspi->irq <= 0) {
> > +		ret = -ENXIO;
> > +		dev_err(&pdev->dev, "irq resource not found\n");
> > +		goto remove_master;
> > +	}
> > +	ret = devm_request_irq(&pdev->dev, xqspi->irq, zynq_qspi_irq,
> > +			       0, pdev->name, xqspi);
> > +	if (ret != 0) {
> > +		ret = -ENXIO;
> > +		dev_err(&pdev->dev, "request_irq failed\n");
> > +		goto remove_master;
> > +	}
> > +
> > +	ret = of_property_read_u32(pdev->dev.of_node, "num-cs",
> > +				   &num_cs);
> > +	if (ret < 0)
> > +		ctlr->num_chipselect = ZYNQ_QSPI_DEFAULT_NUM_CS;
> > +	else
> > +		ctlr->num_chipselect = num_cs;
> > +	ctlr->mode_bits =  SPI_RX_DUAL | SPI_RX_QUAD |
> > +			    SPI_TX_DUAL | SPI_TX_QUAD;
> > +	ctlr->mem_ops = &zynq_qspi_mem_ops;
> 
> And here again...
Ok. will remove it from here.

Thanks,
Naga Sureshkumar Relli
> 
> > +	ctlr->setup = zynq_qspi_setup_op;
> > +	ctlr->max_speed_hz = clk_get_rate(xqspi->refclk) / 2;
> > +	ctlr->dev.of_node = np;
> > +	ret = spi_register_controller(ctlr);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "spi_register_master failed\n");
> > +		goto clk_dis_all;
> > +	}
> > +
> > +	return ret;
> > +
> > +clk_dis_all:
> > +	clk_disable_unprepare(xqspi->refclk);
> > +clk_dis_pclk:
> > +	clk_disable_unprepare(xqspi->pclk);
> > +remove_master:
> > +	spi_controller_put(ctlr);
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * zynq_qspi_remove - Remove method for the QSPI driver
> > + * @pdev:	Pointer to the platform_device structure
> > + *
> > + * This function is called if a device is physically removed from the
> > +system or
> > + * if the driver module is being unloaded. It frees all resources
> > +allocated to
> > + * the device.
> > + *
> > + * Return:	0 on success and error value on failure
> > + */
> > +static int zynq_qspi_remove(struct platform_device *pdev) {
> > +	struct zynq_qspi *xqspi = platform_get_drvdata(pdev);
> > +
> > +	zynq_qspi_write(xqspi, ZYNQ_QSPI_ENABLE_OFFSET, 0);
> > +
> > +	clk_disable_unprepare(xqspi->refclk);
> > +	clk_disable_unprepare(xqspi->pclk);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id zynq_qspi_of_match[] = {
> > +	{ .compatible = "xlnx,zynq-qspi-1.0", },
> > +	{ /* end of table */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, zynq_qspi_of_match);
> > +
> > +/*
> > + * zynq_qspi_driver - This structure defines the QSPI platform driver
> > +*/ static struct platform_driver zynq_qspi_driver = {
> > +	.probe = zynq_qspi_probe,
> > +	.remove = zynq_qspi_remove,
> > +	.driver = {
> > +		.name = "zynq-qspi",
> > +		.of_match_table = zynq_qspi_of_match,
> > +	},
> > +};
> > +
> > +module_platform_driver(zynq_qspi_driver);
> > +
> > +MODULE_AUTHOR("Xilinx, Inc.");
> > +MODULE_DESCRIPTION("Xilinx Zynq QSPI driver"); MODULE_LICENSE("GPL");
> >
> 
> --
> Regards
> Vignesh
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
