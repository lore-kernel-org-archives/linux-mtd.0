Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A540C43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 11:02:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F5620851
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 11:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qimhstpM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="HLqxmyYK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F5620851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnEQ8GW/RmXuNz0RnyIqVzdAgm8C6Zwm2aWl6DjVH+Y=; b=qimhstpMF8OkxY
	T1GDtpkJQMkBhl3TuC3qeVWrzW+hqND7IDm8Vwvdxi3EMnEIk4IovRC2x27+xoGK2YbNXhnJfnp5b
	dfbT+uoUkfcV5aU+TQbHLmHU7qMxSPLeTuq7rptRCdcYturb4ceO9YZtvJohHC/nYgrJ0k2N23Fp7
	CT9NtdNhn0BRNvfzBIo6j0mnhZCC+3GhyyS+nEBYJU9I2jFdmiHz4KCDImRCKFFUPTlnh0UiKSa+f
	w7PvQtFLGeUp7qAZFTXsE/KuXVfcnaKmlDqStEeD2EWlJXMBfxtE8dmWbmSoxwz8XhJbJsbV7p962
	ZAG/m7V7I78WSVN8OU0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzfw8-0007rd-4o; Fri, 01 Mar 2019 11:02:40 +0000
Received: from mail-eopbgr800079.outbound.protection.outlook.com
 ([40.107.80.79] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzfw3-0007qa-FS
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2019 11:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYAplsS1jN2KrpjmGMvN2CAiAkrrCeGvjEwbUwTwz1c=;
 b=HLqxmyYK/jMO40lt1WsnLiVb7iKH8aPJSLH9PTB/Hs7HeG1EDInIZS1Vux5TwNRTa99t2HK7dQ4N57D8dyTmrZvrUQnMRGUtFZMs9KUuEdIfxITocaN2g82bk1rTXpI8HzxZ9iOaJyuTS+WDKuim4m8BIKEOUICnopnIEj2Ir60=
Received: from MWHPR02MB2623.namprd02.prod.outlook.com (10.168.206.9) by
 MWHPR02MB2813.namprd02.prod.outlook.com (10.175.50.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.16; Fri, 1 Mar 2019 11:02:30 +0000
Received: from MWHPR02MB2623.namprd02.prod.outlook.com
 ([fe80::c89d:e485:cb5e:89cf]) by MWHPR02MB2623.namprd02.prod.outlook.com
 ([fe80::c89d:e485:cb5e:89cf%5]) with mapi id 15.20.1665.015; Fri, 1 Mar 2019
 11:02:30 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Subject: RE: [RFC PATCH 2/2] spi: spi-mem: Add support for Zynq QSPI controller
Thread-Topic: [RFC PATCH 2/2] spi: spi-mem: Add support for Zynq QSPI
 controller
Thread-Index: AQHUzzOoSBENcbUE5E66VjcEuxsjhqX2j+qAgAAInUA=
Date: Fri, 1 Mar 2019 11:02:30 +0000
Message-ID: <MWHPR02MB262310CF8152AE170FE7443CAF760@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1551337361-11665-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <48dafcc4-1b9d-9ce2-9228-78e73252781f@ti.com>
In-Reply-To: <48dafcc4-1b9d-9ce2-9228-78e73252781f@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-originating-ip: [149.199.50.132]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0f60658-ddec-4ac1-7364-08d69e356654
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR02MB2813; 
x-ms-traffictypediagnostic: MWHPR02MB2813:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtNV0hQUjAyTUIyODEzOzIzOnJya01UdkQvZm9Td1J3cTg4OTZ1d1llWVdp?=
 =?utf-8?B?QmlZbCs1U0tTMmhnL3NsR09vM2RlV2tmQmZQL2s5UFVqSmZZWXRFcFZIZWZ6?=
 =?utf-8?B?NFBSR0RHbUVTY2xrWGREQ0U2ekNpU0tTelhYd2VGVlppamMrYXJCOWtGcTg3?=
 =?utf-8?B?Yjd1dW93YkpNNnFoRzBxQ2pZclMvbTJleWp2bEJWZytJbUViWnpGcXNZWlZG?=
 =?utf-8?B?QnZUNlRKdERIemR2MVZ6RmFSV04xYWZKL0VmVVJoaS90Q3pUcTZOdTF3UHJY?=
 =?utf-8?B?TUovL3E0WGtaTWUvY25lNm1KQ1JuWW1zdWJLVXpIMmdHcjAyL0xlUzBNdFZP?=
 =?utf-8?B?dkdaY3JBb2s5dXVTSklocEx0aG9tRmNrOXFWZkhhVDlSOUw5OFZNMCtHTDFE?=
 =?utf-8?B?Q2N2OU5ja2Z4OUVhNjc4SXBxcWh6VzYwUytrZVVvTlFxTjFHM2ZYcE9mN0JI?=
 =?utf-8?B?ZnM3QitJSjVOSnN3SzBsTHRUSkpuMkl6VlVCZEhHQ3FCaWs2RW5Ib3VwTWlW?=
 =?utf-8?B?dDdlWmpzSDJmL2grQmFTVE5uTzVYQ0ppcTAzSlpCcXdPU0praVA2VFplTFV3?=
 =?utf-8?B?OHlGbElwcTNibnNITjcxRE9YbS8rYTZwSkxmUEx6VzlPczVBNStYd3Q2Sjd3?=
 =?utf-8?B?b3BTRzNqdnVEL3R0TXVJNWJEN2MxOWtPU1lxSFo1dWZ5T0x0WEFFZHp2YUdQ?=
 =?utf-8?B?YlF1UndzSi9uSEVjQ3FOM2c5MUxEU0ltcVZmam1NSHFKeTVyRnNiendhSTNE?=
 =?utf-8?B?NEhCOVVQWHkreEgzeC9COHphZXI4dEVKYmdLYTA0S1FpaXllSUplY0lqUlB6?=
 =?utf-8?B?QWlpWHpVek1weVYxZ1laeEpRTkk4RW9wSjNJdG1QWC9VWDZwMXNxU1lZNFkv?=
 =?utf-8?B?WHUveFZhTzBBR0ZBRGJ2ejZXd2RSeExvSm4zQlRvNGt5QllxeEZUZlAzZ3Nt?=
 =?utf-8?B?WUI1NWVvaGIxQkNkUjN6QW1QQnhtRWZQYTkvT1dGYnFLSnRmMk4xNDlqUlpN?=
 =?utf-8?B?KzBiV0VvYTR6UC9NK2srQmlMVFMvTTVxNUx4d0ZXQ1ZXYTI0TlA2VDFsRUVO?=
 =?utf-8?B?bmlhQzFxNjArNGNiZkR5R0EwUHVpUzI3SUdSOVRlUkl4ZDNHRHpuWHB4QjZi?=
 =?utf-8?B?S2VwVjI4ZDdnYWpOUzFMVU1YdFU3YWJyODRKUVFKZU05OVB0cEtwR1R3M3du?=
 =?utf-8?B?cmM2MG83NEI4bXNxZUI3YXY1SCtrY2VEdVBLL0RmcVYvRnZ3S2s3NE8wOTY3?=
 =?utf-8?B?dFVzQmtTTzNoUUlVSnh1SlhCRzgrWVBKcll5a1JTamczVFJiYytTNGZYUmFr?=
 =?utf-8?B?am1Lb3ZsYnk3S2RVb3BzRTFiSUlWaitZZzkzSHFxMjc2TytkSm1XalJsYnJW?=
 =?utf-8?B?V25MenFRbElsSy9WU09lSFpibVNFWHFSbFBiYVJMQzlyc0dLdG0rWlF4NW50?=
 =?utf-8?B?eVNvN0JvWlA3ZHNkY2NOcmN2L25JekpBeDlSNkZVckZCRWdJMkxzUHo1NWFr?=
 =?utf-8?B?NCtqNHFTdTJXbUpEUUR5VXYyOEVDZTJqdkRTOVdFMTgxZnJaVW90b0o3VERi?=
 =?utf-8?B?dmJOb2hIYU1EdElrQ0tLa2ZidXdUVGRrcG5iSmFUMzQ0aFVFOWJidkhoVThi?=
 =?utf-8?B?SDZ1Q3E2RnZsTVhsS0liVTFEWktORDVOY3pDR01uRlJlQ2gwQmNrcGlReEkr?=
 =?utf-8?B?dXNNVUZFdG1ucm5BSVJFamN0NXBMZS85czhaNnE0V0l3bGFiQm0va1VraHZm?=
 =?utf-8?B?NC9kdWxNNHV0WFI2MlhzSDNST0hiOTlxSTAyaEdpcGZxQ053aEV1NjVFZjhB?=
 =?utf-8?B?SUppQVhMcDJ2YmlDNjJxM2poS0dRME1HbGZNTmx5ZEZkRVp0cXl0TnRJK2lS?=
 =?utf-8?B?bDdGYjJnaytwdlQ0bUhYdVpLYzI0Q1p0SU5qZ0VNa1ZnQUN3dkg0NzZTejNt?=
 =?utf-8?Q?FDgQZQwEp1muidJQ91cAhY5yKroXLM=3D?=
x-microsoft-antispam-prvs: <MWHPR02MB2813A495C5BA8A9B59E77C43AF760@MWHPR02MB2813.namprd02.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(376002)(39860400002)(136003)(366004)(51914003)(13464003)(189003)(199004)(6506007)(30864003)(53546011)(2201001)(229853002)(105586002)(106356001)(102836004)(86362001)(33656002)(25786009)(11346002)(305945005)(7736002)(256004)(446003)(5660300002)(71190400001)(71200400001)(316002)(14444005)(74316002)(54906003)(110136005)(52536013)(3846002)(6116002)(68736007)(2501003)(55016002)(186003)(6436002)(2906002)(478600001)(99286004)(81166006)(97736004)(8676002)(66066001)(81156014)(14454004)(26005)(53936002)(8936002)(6246003)(7416002)(53946003)(4326008)(76176011)(9686003)(7696005)(486006)(476003)(579004)(559001)(569006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2813;
 H:MWHPR02MB2623.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uMxyrc3QLZLHYKQgc8SSXroJnPmeABBqhsmO4HGJUytPJSiJ/19n8reoHH5um+Hn2lyvQvN9FryrwV2dunoXNLcFH/2yAwqmeYwIx1yqu0LYyGtGJinixM/uZI8dkPnoKV4TqMLkJoMYzdsjwtHoGKlHr6VyxVP8TrqzWLLMpD3aoGK3J5v0aiSl+kd5jn1s10m1KhgkKSuaBC5G+zek7todooKwpVe3rmpvU2RbL2wXGnvRLEGIdnJbYCpHLYr0KmRCqAzPmNMPZHU4AOoinoEsHkK7yFts4D0l8kqAgdPStq0nBadmH83gtEZ+lJCPYNfKuBT4GWysXCEX/HJlMP0wRGxXzpEeoh4l9znITPSAH6+BVQrNnvkM+BraPqcc2X2cfXj3902mnRuGie5osbzRb3xeNL8jkIWG9ByTcv4=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f60658-ddec-4ac1-7364-08d69e356654
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 11:02:30.4007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_030235_628365_A12ED48A 
X-CRM114-Status: GOOD (  18.19  )
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
> From: Vignesh Raghavendra <vigneshr@ti.com>
> Sent: Friday, March 1, 2019 3:42 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>; broonie@kernel.org;
> bbrezillon@kernel.org
> Cc: linux-spi@vger.kernel.org; dwmw2@infradead.org; marek.vasut@gmail.com;
> richard@nod.at; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Michal Simek
> <michals@xilinx.com>; nagasuresh12@gmail.com
> Subject: Re: [RFC PATCH 2/2] spi: spi-mem: Add support for Zynq QSPI controller
> 
> 
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
> > +	help
> > +	  This enables support for the Zynq Quad SPI controller
> > +	  in master mode.
> > +	  This controller only supports SPI memory interface.
> > +
> >  config SPI_ZYNQMP_GQSPI
> >  	tristate "Xilinx ZynqMP GQSPI controller"
> >  	depends on SPI_MASTER && HAS_DMA
> > diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile index
> > f296270..565db4d 100644
> > --- a/drivers/spi/Makefile
> > +++ b/drivers/spi/Makefile
> > @@ -115,6 +115,7 @@ obj-$(CONFIG_SPI_XCOMM)		+= spi-xcomm.o
> >  obj-$(CONFIG_SPI_XILINX)		+= spi-xilinx.o
> >  obj-$(CONFIG_SPI_XLP)			+= spi-xlp.o
> >  obj-$(CONFIG_SPI_XTENSA_XTFPGA)		+= spi-xtensa-xtfpga.o
> > +obj-$(CONFIG_SPI_ZYNQ_QSPI)		+= spi-zynq-qspi.o
> >  obj-$(CONFIG_SPI_ZYNQMP_GQSPI)		+= spi-zynqmp-gqspi.o
> >
> >  # SPI slave protocol handlers
> > diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
> > new file mode 100644 index 0000000..87c9ec2
> > --- /dev/null
> > +++ b/drivers/spi/spi-zynq-qspi.c
> > @@ -0,0 +1,780 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (C) 2019 Xilinx, Inc.
> > + *
> > + * Author: Naga Sureshkumar Relli <nagasure@xilinx.com>  */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/spi/spi.h>
> > +#include <linux/workqueue.h>
> > +#include <linux/spi/spi-mem.h>
> > +
> > +/* Register offset definitions */
> > +#define ZYNQ_QSPI_CONFIG_OFFSET		0x00 /* Configuration  Register, RW
> */
> > +#define ZYNQ_QSPI_STATUS_OFFSET		0x04 /* Interrupt Status Register, RO
> */
> > +#define ZYNQ_QSPI_IEN_OFFSET		0x08 /* Interrupt Enable Register,
> WO */
> > +#define ZYNQ_QSPI_IDIS_OFFSET		0x0C /* Interrupt Disable Reg, WO
> */
> > +#define ZYNQ_QSPI_IMASK_OFFSET		0x10 /* Interrupt Enabled Mask
> Reg,RO */
> > +#define ZYNQ_QSPI_ENABLE_OFFSET		0x14 /* Enable/Disable Register, RW
> */
> > +#define ZYNQ_QSPI_DELAY_OFFSET		0x18 /* Delay Register, RW */
> > +#define ZYNQ_QSPI_TXD_00_00_OFFSET	0x1C /* Transmit 4-byte inst, WO */
> > +#define ZYNQ_QSPI_TXD_00_01_OFFSET	0x80 /* Transmit 1-byte inst, WO */
> > +#define ZYNQ_QSPI_TXD_00_10_OFFSET	0x84 /* Transmit 2-byte inst, WO */
> > +#define ZYNQ_QSPI_TXD_00_11_OFFSET	0x88 /* Transmit 3-byte inst, WO */
> > +#define ZYNQ_QSPI_RXD_OFFSET		0x20 /* Data Receive Register, RO */
> > +#define ZYNQ_QSPI_SIC_OFFSET		0x24 /* Slave Idle Count Register,
> RW */
> > +#define ZYNQ_QSPI_TX_THRESH_OFFSET	0x28 /* TX FIFO Watermark Reg,
> RW */
> > +#define ZYNQ_QSPI_RX_THRESH_OFFSET	0x2C /* RX FIFO Watermark Reg,
> RW */
> > +#define ZYNQ_QSPI_GPIO_OFFSET		0x30 /* GPIO Register, RW */
> > +#define ZYNQ_QSPI_LINEAR_CFG_OFFSET	0xA0 /* Linear Adapter Config Ref,
> RW */
> > +#define ZYNQ_QSPI_MOD_ID_OFFSET		0xFC /* Module ID Register, RO */
> > +
> > +/*
> > + * QSPI Configuration Register bit Masks
> > + *
> > + * This register contains various control bits that effect the
> > +operation
> > + * of the QSPI controller
> > + */
> > +#define ZYNQ_QSPI_CONFIG_IFMODE_MASK	0x80000000 /* Flash Memory
> Interface */
> > +#define ZYNQ_QSPI_CONFIG_MANSRT_MASK	0x00010000 /* Manual TX
> Start */
> > +#define ZYNQ_QSPI_CONFIG_MANSRTEN_MASK	0x00008000 /* Enable
> Manual TX Mode */
> > +#define ZYNQ_QSPI_CONFIG_SSFORCE_MASK	0x00004000 /* Manual Chip
> Select */
> > +#define ZYNQ_QSPI_CONFIG_BDRATE_MASK	0x00000038 /* Baud Rate Divisor
> Mask */
> > +#define ZYNQ_QSPI_CONFIG_CPHA_MASK	0x00000004 /* Clock Phase Control
> */
> > +#define ZYNQ_QSPI_CONFIG_CPOL_MASK	0x00000002 /* Clock Polarity Control
> */
> > +#define ZYNQ_QSPI_CONFIG_SSCTRL_MASK	0x00000400 /* Slave Select Mask */
> > +#define ZYNQ_QSPI_CONFIG_FWIDTH_MASK	0x000000C0 /* FIFO width
> */
> > +#define ZYNQ_QSPI_CONFIG_MSTREN_MASK	0x00000001 /* Master Mode
> */
> > +
> 
> Convert to GENMASK() and BIT() macros
Ok, I will update it.
> 
> > +/*
> > + * QSPI Configuration Register - Baud rate and slave select
> > + *
> > + * These are the values used in the calculation of baud rate divisor
> > +and
> > + * setting the slave select.
> > + */
> > +#define ZYNQ_QSPI_BAUD_DIV_MAX		7 /* Baud rate divisor maximum */
> > +#define ZYNQ_QSPI_BAUD_DIV_SHIFT	3 /* Baud rate divisor shift in CR */
> > +#define ZYNQ_QSPI_SS_SHIFT		10 /* Slave Select field shift in CR */
> > +
> > +/*
> > + * QSPI Interrupt Registers bit Masks
> > + *
> > + * All the four interrupt registers (Status/Mask/Enable/Disable) have
> > +the same
> > + * bit definitions.
> > + */
> > +#define ZYNQ_QSPI_IXR_RX_OVERFLOW_MASK	0x00000001 /* QSPI RX
> FIFO Overflow */
> > +#define ZYNQ_QSPI_IXR_TXNFULL_MASK	0x00000004 /* QSPI TX FIFO
> Overflow */
> > +#define ZYNQ_QSPI_IXR_TXFULL_MASK	0x00000008 /* QSPI TX FIFO is full
> */
> > +#define ZYNQ_QSPI_IXR_RXNEMTY_MASK	0x00000010 /* QSPI RX FIFO Not
> Empty */
> > +#define ZYNQ_QSPI_IXR_RXF_FULL_MASK	0x00000020 /* QSPI RX FIFO is full
> */
> > +#define ZYNQ_QSPI_IXR_TXF_UNDRFLOW_MASK	0x00000040 /* QSPI TX
> FIFO Underflow */
> > +#define ZYNQ_QSPI_IXR_ALL_MASK
> 	(ZYNQ_QSPI_IXR_RX_OVERFLOW_MASK | \
> > +					ZYNQ_QSPI_IXR_TXNFULL_MASK | \
> > +					ZYNQ_QSPI_IXR_TXFULL_MASK | \
> > +					ZYNQ_QSPI_IXR_RXNEMTY_MASK | \
> > +					ZYNQ_QSPI_IXR_RXF_FULL_MASK | \
> > +					ZYNQ_QSPI_IXR_TXF_UNDRFLOW_MASK)
> > +#define ZYNQ_QSPI_IXR_RXTX_MASK
> 	(ZYNQ_QSPI_IXR_TXNFULL_MASK | \
> > +					ZYNQ_QSPI_IXR_RXNEMTY_MASK)
> > +
> 
> Convert to GENMASK() and BIT() macros
Ok, will change it.
> 
> > +/*
> > + * QSPI Enable Register bit Masks
> > + *
> > + * This register is used to enable or disable the QSPI controller  */
> > +#define ZYNQ_QSPI_ENABLE_ENABLE_MASK	0x00000001 /* QSPI Enable
> Bit Mask */
> > +
> > +/*
> > + * QSPI Linear Configuration Register
> > + *
> > + * It is named Linear Configuration but it controls other modes when
> > +not in
> > + * linear mode also.
> > + */
> > +#define ZYNQ_QSPI_LCFG_TWO_MEM_MASK	0x40000000 /* LQSPI Two
> memories Mask */
> > +#define ZYNQ_QSPI_LCFG_SEP_BUS_MASK	0x20000000 /* LQSPI Separate bus
> Mask */
> > +#define ZYNQ_QSPI_LCFG_U_PAGE_MASK	0x10000000 /* LQSPI Upper Page
> Mask */
> > +
> 
> Convert to GENMASK() and BIT() macros
Ok, will change it
> 
> > +#define ZYNQ_QSPI_LCFG_DUMMY_SHIFT	8
> > +
> > +#define ZYNQ_QSPI_FAST_READ_QOUT_CODE	0x6B /* read instruction code
> */
> > +#define ZYNQ_QSPI_FIFO_DEPTH		63 /* FIFO depth in words */
> > +#define ZYNQ_QSPI_RX_THRESHOLD		32 /* Rx FIFO threshold level */
> > +#define ZYNQ_QSPI_TX_THRESHOLD		1 /* Tx FIFO threshold level */
> > +
> > +/*
> > + * The modebits configurable by the driver to make the SPI support
> > +different
> > + * data formats
> > + */
> > +#define MODEBITS			(SPI_CPOL | SPI_CPHA)
> > +
> 
> Rename as ZYNQ_QSPI_MODEBITS to avoid namespace conflicts
Ok, will update.
> 
> > +/* Default number of chip selects */
> > +#define ZYNQ_QSPI_DEFAULT_NUM_CS	1
> > +
> > +/**
> > + * struct zynq_qspi - Defines qspi driver instance
> > + * @regs:		Virtual address of the QSPI controller registers
> > + * @refclk:		Pointer to the peripheral clock
> > + * @pclk:		Pointer to the APB clock
> > + * @irq:		IRQ number
> > + * @txbuf:		Pointer to the TX buffer
> > + * @rxbuf:		Pointer to the RX buffer
> > + * @tx_bytes:		Number of bytes left to transfer
> > + * @rx_bytes:		Number of bytes left to receive
> > + * @data_completion:	completion structure
> > + */
> > +struct zynq_qspi {
> > +	struct device *dev;
> > +	void __iomem *regs;
> > +	struct clk *refclk;
> > +	struct clk *pclk;
> > +	int irq;
> > +	u8 *txbuf;
> > +	u8 *rxbuf;
> > +	int tx_bytes;
> > +	int rx_bytes;
> > +	struct completion data_completion;
> > +};
> > +
> > +/*
> > + * Inline functions for the QSPI controller read/write  */ static
> > +inline u32 zynq_qspi_read(struct zynq_qspi *xqspi, u32 offset) {
> > +	return readl_relaxed(xqspi->regs + offset); }
> > +
> > +static inline void zynq_qspi_write(struct zynq_qspi *xqspi, u32 offset,
> > +				   u32 val)
> > +{
> > +	writel_relaxed(val, xqspi->regs + offset); }
> > +
> > +/**
> > + * zynq_qspi_init_hw - Initialize the hardware
> > + * @xqspi:	Pointer to the zynq_qspi structure
> > + *
> > + * The default settings of the QSPI controller's configurable
> > +parameters on
> > + * reset are
> > + *	- Master mode
> > + *	- Baud rate divisor is set to 2
> > + *	- Tx threshold set to 1l Rx threshold set to 32
> > + *	- Flash memory interface mode enabled
> > + *	- Size of the word to be transferred as 8 bit
> > + * This function performs the following actions
> > + *	- Disable and clear all the interrupts
> > + *	- Enable manual slave select
> > + *	- Enable manual start
> > + *	- Deselect all the chip select lines
> > + *	- Set the size of the word to be transferred as 32 bit
> > + *	- Set the little endian mode of TX FIFO and
> > + *	- Enable the QSPI controller
> > + */
> > +static void zynq_qspi_init_hw(struct zynq_qspi *xqspi) {
> > +	u32 config_reg;
> > +
> > +	zynq_qspi_write(xqspi, ZYNQ_QSPI_ENABLE_OFFSET, 0);
> > +	zynq_qspi_write(xqspi, ZYNQ_QSPI_IDIS_OFFSET,
> > +ZYNQ_QSPI_IXR_ALL_MASK);
> > +
> > +	/* Disable linear mode as the boot loader may have used it */
> > +	zynq_qspi_write(xqspi, ZYNQ_QSPI_LINEAR_CFG_OFFSET, 0);
> > +
> > +	/* Clear the RX FIFO */
> > +	while (zynq_qspi_read(xqspi, ZYNQ_QSPI_STATUS_OFFSET) &
> > +			      ZYNQ_QSPI_IXR_RXNEMTY_MASK)
> > +		zynq_qspi_read(xqspi, ZYNQ_QSPI_RXD_OFFSET);
> > +
> > +	zynq_qspi_write(xqspi, ZYNQ_QSPI_STATUS_OFFSET,
> ZYNQ_QSPI_IXR_ALL_MASK);
> > +	config_reg = zynq_qspi_read(xqspi, ZYNQ_QSPI_CONFIG_OFFSET);
> > +	config_reg &= ~(ZYNQ_QSPI_CONFIG_MSTREN_MASK |
> > +			ZYNQ_QSPI_CONFIG_CPOL_MASK |
> > +			ZYNQ_QSPI_CONFIG_CPHA_MASK |
> > +			ZYNQ_QSPI_CONFIG_BDRATE_MASK |
> > +			ZYNQ_QSPI_CONFIG_SSFORCE_MASK |
> > +			ZYNQ_QSPI_CONFIG_MANSRTEN_MASK |
> > +			ZYNQ_QSPI_CONFIG_MANSRT_MASK);
> > +	config_reg |= (ZYNQ_QSPI_CONFIG_MSTREN_MASK |
> > +		       ZYNQ_QSPI_CONFIG_SSFORCE_MASK |
> > +		       ZYNQ_QSPI_CONFIG_FWIDTH_MASK |
> > +		       ZYNQ_QSPI_CONFIG_IFMODE_MASK);
> > +	zynq_qspi_write(xqspi, ZYNQ_QSPI_CONFIG_OFFSET, config_reg);
> > +
> > +	zynq_qspi_write(xqspi, ZYNQ_QSPI_RX_THRESH_OFFSET,
> > +			ZYNQ_QSPI_RX_THRESHOLD);
> > +	zynq_qspi_write(xqspi, ZYNQ_QSPI_TX_THRESH_OFFSET,
> > +			ZYNQ_QSPI_TX_THRESHOLD);
> > +
> > +	zynq_qspi_write(xqspi, ZYNQ_QSPI_ENABLE_OFFSET,
> > +			ZYNQ_QSPI_ENABLE_ENABLE_MASK);
> > +}
> > +
> > +static int zynq_qspi_check_buswidth(u8 width) {
> > +	switch (width) {
> > +	case 1:
> > +	case 2:
> > +	case 4:
> > +		return 0;
> > +	}
> > +
> > +	return -ENOTSUPP;
> > +}
> > +
> > +static bool zynq_qspi_supports_op(struct spi_mem *mem,
> > +				  const struct spi_mem_op *op)
> > +{
> > +	int ret;
> > +
> > +	ret = zynq_qspi_check_buswidth(op->cmd.buswidth);
> > +
> > +	if (op->addr.nbytes)
> > +		ret |= zynq_qspi_check_buswidth(op->addr.buswidth);
> > +
> > +	if (op->dummy.nbytes)
> > +		ret |= zynq_qspi_check_buswidth(op->dummy.buswidth);
> > +
> > +	if (op->data.nbytes)
> > +		ret |= zynq_qspi_check_buswidth(op->data.buswidth);
> > +
> > +	if (ret)
> > +		return false;
> > +
> 
> spi_mem_default_supports_op() already has this code.
> Could you change, spi_mem_supports_op() to call
> spi_mem_default_supports_op() first before controller specific
> ->supports_op()? So that, above code can be dropped.
Ok, I will update it.
> 
> > +	/*
> > +	 * The number of address bytes should be equal to or less than 3 bytes.
> > +	 */
> > +	if (op->addr.nbytes > 3)
> > +		return false;
> > +
> 
> Hmm, how does the driver handle flash devices >16MB in size? Not supported?
Zynq QSPI controller doesn't support 4 byte addressing.
So to support > 16MB size, we have to use EAR(extended address register).
As it is initial version of driver, I haven't added this code. This needs to be added in spi-nor.c.
Previously I have sent an RFC patch to support all these.
But Boris suggested to upstream the basic one first under spi-mem frame work.
Not only this support, there are other features like dual parallel and dual stacked.
All these features require additional support from spi-nor framework.
We have another QSPI controller on ZynqMP SOC, which is also similar(but it supports 4Byte addressing).
So by consolidating all these, I sent this patch.

Please let me know your suggestion on this.
> 
> > +	return true;
> > +}
> > +
> > +/**
> > + * zynq_qspi_rxfifo_op - Read 1..4 bytes from RxFIFO to RX buffer
> > + * @xqspi:	Pointer to the zynq_qspi structure
> > + * @size:	Number of bytes to be read (1..4)
> > + */
> > +static void zynq_qspi_rxfifo_op(struct zynq_qspi *xqspi, unsigned int
> > +size) {
> > +	u32 data;
> > +
> > +	data = zynq_qspi_read(xqspi, ZYNQ_QSPI_RXD_OFFSET);
> > +
> > +	if (xqspi->rxbuf) {
> > +		memcpy(xqspi->rxbuf, ((u8 *)&data) + 4 - size, size);
> > +		xqspi->rxbuf += size;
> > +	}
> > +
> > +	xqspi->rx_bytes -= size;
> > +	if (xqspi->rx_bytes < 0)
> > +		xqspi->rx_bytes = 0;
> > +}
> > +
> > +/**
> > + * zynq_qspi_txfifo_op - Write 1..4 bytes from TX buffer to TxFIFO
> > + * @xqspi:	Pointer to the zynq_qspi structure
> > + * @size:	Number of bytes to be written (1..4)
> > + */
> > +static void zynq_qspi_txfifo_op(struct zynq_qspi *xqspi, unsigned int
> > +size) {
> > +	static const unsigned int offset[4] = {
> > +		ZYNQ_QSPI_TXD_00_01_OFFSET, ZYNQ_QSPI_TXD_00_10_OFFSET,
> > +		ZYNQ_QSPI_TXD_00_11_OFFSET, ZYNQ_QSPI_TXD_00_00_OFFSET
> };
> > +	u32 data;
> > +
> > +	if (xqspi->txbuf) {
> > +		data = 0xffffffff;
> > +		memcpy(&data, xqspi->txbuf, size);
> > +		xqspi->txbuf += size;
> > +	} else {
> > +		data = 0;
> > +	}
> > +
> > +	xqspi->tx_bytes -= size;
> > +	zynq_qspi_write(xqspi, offset[size - 1], data); }
> > +
> > +/**
> > + * zynq_qspi_chipselect - Select or deselect the chip select line
> > + * @spi:	Pointer to the spi_device structure
> > + * @assert:	1 for select or 0 for deselect the chip select line
> > + */
> > +static void zynq_qspi_chipselect(struct spi_device *spi, bool assert)
> > +{
> > +	struct spi_controller *ctrl = spi->master;
> > +	struct zynq_qspi *xqspi = spi_controller_get_devdata(ctrl);
> > +	u32 config_reg;
> > +
> > +	config_reg = zynq_qspi_read(xqspi, ZYNQ_QSPI_CONFIG_OFFSET);
> > +	if (assert) {
> > +		/* Select the slave */
> > +		config_reg &= ~ZYNQ_QSPI_CONFIG_SSCTRL_MASK;
> > +		config_reg |= (((~(BIT(spi->chip_select))) <<
> > +				ZYNQ_QSPI_SS_SHIFT) &
> > +				ZYNQ_QSPI_CONFIG_SSCTRL_MASK);
> > +	} else {
> > +		config_reg |= ZYNQ_QSPI_CONFIG_SSCTRL_MASK;
> > +	}
> > +
> > +	zynq_qspi_write(xqspi, ZYNQ_QSPI_CONFIG_OFFSET, config_reg); }
> > +
> > +/**
> > + * zynq_qspi_config_op - Configure QSPI controller for specified transfer
> > + * @xqspi:	Pointer to the zynq_qspi structure
> > + * @qspi:	Pointer to the spi_device structure
> > + *
> > + * Sets the operational mode of QSPI controller for the next QSPI
> > +transfer and
> > + * sets the requested clock frequency.
> > + *
> > + * Return:	0 on success and -EINVAL on invalid input parameter
> > + *
> > + * Note: If the requested frequency is not an exact match with what
> > +can be
> > + * obtained using the prescalar value, the driver sets the clock
> > +frequency which
> > + * is lower than the requested frequency (maximum lower) for the
> > +transfer. If
> > + * the requested frequency is higher or lower than that is supported
> > +by the QSPI
> > + * controller the driver will set the highest or lowest frequency
> > +supported by
> > + * controller.
> > + */
> > +static int zynq_qspi_config_op(struct zynq_qspi *xqspi, struct
> > +spi_device *spi) {
> > +	u32 config_reg, baud_rate_val = 0;
> > +
> > +	/* Set the clock frequency */
> > +	while ((baud_rate_val < ZYNQ_QSPI_BAUD_DIV_MAX)  &&
> > +	       (clk_get_rate(xqspi->refclk) / (2 << baud_rate_val)) >
> > +		spi->max_speed_hz)
> > +		baud_rate_val++;
> 
> This can be simplified by using DIV_ROUND_UP() to find baud_rate_val
Yes, I will modify it.

Thanks,
Naga Sureshkumar Relli
> 
> 
> 
> Regards
> Vignesh
> 
> > +	config_reg = zynq_qspi_read(xqspi, ZYNQ_QSPI_CONFIG_OFFSET);
> > +
> > +	/* Set the QSPI clock phase and clock polarity */
> > +	config_reg &= (~ZYNQ_QSPI_CONFIG_CPHA_MASK) &
> > +		      (~ZYNQ_QSPI_CONFIG_CPOL_MASK);
> > +	if (spi->mode & SPI_CPHA)
> > +		config_reg |= ZYNQ_QSPI_CONFIG_CPHA_MASK;
> > +	if (spi->mode & SPI_CPOL)
> > +		config_reg |= ZYNQ_QSPI_CONFIG_CPOL_MASK;
> > +
> > +	config_reg &= ~ZYNQ_QSPI_CONFIG_BDRATE_MASK;
> > +	config_reg |= (baud_rate_val << ZYNQ_QSPI_BAUD_DIV_SHIFT);
> > +	zynq_qspi_write(xqspi, ZYNQ_QSPI_CONFIG_OFFSET, config_reg);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * zynq_qspi_setup - Configure the QSPI controller
> > + * @spi:	Pointer to the spi_device structure
> > + *
> > + * Sets the operational mode of QSPI controller for the next QSPI
> > +transfer, baud
> > + * rate and divisor value to setup the requested qspi clock.
> > + *
> > + * Return:	0 on success and error value on failure
> > + */
> > +static int zynq_qspi_setup_op(struct spi_device *spi) {
> > +	struct spi_controller *ctrl = spi->master;
> > +	struct zynq_qspi *qspi = spi_controller_get_devdata(ctrl);
> > +
> > +	if (ctrl->busy)
> > +		return -EBUSY;
> > +
> > +	clk_enable(qspi->refclk);
> > +	clk_enable(qspi->pclk);
> > +	zynq_qspi_write(qspi, ZYNQ_QSPI_ENABLE_OFFSET,
> > +			ZYNQ_QSPI_ENABLE_ENABLE_MASK);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * zynq_qspi_write_op - Fills the TX FIFO with as many bytes as possible
> > + * @xqspi:	Pointer to the zynq_qspi structure
> > + * @txcount:	Maximum number of words to write
> > + * @txempty:	Indicates that TxFIFO is empty
> > + */
> > +static void zynq_qspi_write_op(struct zynq_qspi *xqspi, int txcount,
> > +			       bool txempty)
> > +{
> > +	int count, len, k;
> > +
> > +	len = xqspi->tx_bytes;
> > +	if (len && len < 4) {
> > +		/*
> > +		 * We must empty the TxFIFO between accesses to TXD0,
> > +		 * TXD1, TXD2, TXD3.
> > +		 */
> > +		if (txempty)
> > +			zynq_qspi_txfifo_op(xqspi, len);
> > +
> > +		return;
> > +	}
> > +
> > +	count = len / 4;
> > +	if (count > txcount)
> > +		count = txcount;
> > +
> > +	if (xqspi->txbuf) {
> > +		writesl(xqspi->regs + ZYNQ_QSPI_TXD_00_00_OFFSET,
> > +			xqspi->txbuf, count);
> > +		xqspi->txbuf += count * 4;
> > +	} else {
> > +		for (k = 0; k < count; k++)
> > +			writel_relaxed(0, xqspi->regs +
> > +					  ZYNQ_QSPI_TXD_00_00_OFFSET);
> > +	}
> > +
> > +	xqspi->tx_bytes -= count * 4;
> > +}
> > +
> > +/**
> > + * zynq_qspi_read_op - Drains the RX FIFO by as many bytes as possible
> > + * @xqspi:	Pointer to the zynq_qspi structure
> > + * @rxcount:	Maximum number of words to read
> > + */
> > +static void zynq_qspi_read_op(struct zynq_qspi *xqspi, int rxcount) {
> > +	int count, len, k;
> > +
> > +	len = xqspi->rx_bytes - xqspi->tx_bytes;
> > +	count = len / 4;
> > +	if (count > rxcount)
> > +		count = rxcount;
> > +	if (xqspi->rxbuf) {
> > +		readsl(xqspi->regs + ZYNQ_QSPI_RXD_OFFSET,
> > +		       xqspi->rxbuf, count);
> > +		xqspi->rxbuf += count * 4;
> > +	} else {
> > +		for (k = 0; k < count; k++)
> > +			readl_relaxed(xqspi->regs + ZYNQ_QSPI_RXD_OFFSET);
> > +	}
> > +	xqspi->rx_bytes -= count * 4;
> > +	len -= count * 4;
> > +
> > +	if (len && len < 4 && count < rxcount)
> > +		zynq_qspi_rxfifo_op(xqspi, len);
> > +}
> > +
> > +/**
> > + * zynq_qspi_irq - Interrupt service routine of the QSPI controller
> > + * @irq:	IRQ number
> > + * @dev_id:	Pointer to the xqspi structure
> > + *
> > + * This function handles TX empty only.
> > + * On TX empty interrupt this function reads the received data from
> > +RX FIFO and
> > + * fills the TX FIFO if there is any data remaining to be transferred.
> > + *
> > + * Return:	IRQ_HANDLED when interrupt is handled; IRQ_NONE otherwise.
> > + */
> > +static irqreturn_t zynq_qspi_irq(int irq, void *dev_id) {
> > +	u32 intr_status;
> > +	bool txempty;
> > +	struct zynq_qspi *xqspi = (struct zynq_qspi *)dev_id;
> > +
> > +	intr_status = zynq_qspi_read(xqspi, ZYNQ_QSPI_STATUS_OFFSET);
> > +	zynq_qspi_write(xqspi, ZYNQ_QSPI_STATUS_OFFSET, intr_status);
> > +
> > +	if ((intr_status & ZYNQ_QSPI_IXR_TXNFULL_MASK) ||
> > +	    (intr_status & ZYNQ_QSPI_IXR_RXNEMTY_MASK)) {
> > +		/*
> > +		 * This bit is set when Tx FIFO has < THRESHOLD entries.
> > +		 * We have the THRESHOLD value set to 1,
> > +		 * so this bit indicates Tx FIFO is empty.
> > +		 */
> > +		txempty = !!(intr_status & ZYNQ_QSPI_IXR_TXNFULL_MASK);
> > +		/* Read out the data from the RX FIFO */
> > +		zynq_qspi_read_op(xqspi, ZYNQ_QSPI_RX_THRESHOLD);
> > +		if (xqspi->tx_bytes) {
> > +			/* There is more data to send */
> > +			zynq_qspi_write_op(xqspi, ZYNQ_QSPI_RX_THRESHOLD,
> > +					   txempty);
> > +		} else {
> > +			/*
> > +			 * If transfer and receive is completed then only send
> > +			 * complete signal.
> > +			 */
> > +			if (!xqspi->rx_bytes) {
> > +				zynq_qspi_write(xqspi,
> > +						ZYNQ_QSPI_IDIS_OFFSET,
> > +						ZYNQ_QSPI_IXR_RXTX_MASK);
> > +				complete(&xqspi->data_completion);
> > +			}
> > +		}
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	return IRQ_NONE;
> > +}
> > +
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

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
