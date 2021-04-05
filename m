Return-Path: <SRS0=p7/t=JC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0FCC433ED
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 19:17:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDA60613A3
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 19:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDA60613A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eacrzLHeFcA/Y8CCURyzx8x6wF6tgMRakHm+JTBYzzE=; b=TqlrSEkom0PSGnVnv0dH3GeIq
	GwMHzn7Txi3b81TkdMYA7v76UVzsNj8PedA7UdAQz0806IYC2JqBx8FCbzbT3QSTMNQ1twLqvfF3S
	9tX+SfmVq3Ugsh7TLxUsQ7l1ElFNeIk+gTywAnijep7rxd7GQJqfwDEHHfrrjKqyLUt1XzsQcl/Xa
	zsMm+8VdEcXVkd66zLqSepCGfdcf4S3O+aANJyk+mQsH5bYAhPx8z80DiZkO1qTtZkm+hkQ5pB2eq
	jllYy/eFrfyZ1kCTG47XkabUuaGbzRs+Tkt9cyIt7wZDl/QeMedOrVBnmBRRz69iBBv4t8HY0dkZ7
	496tLnBUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTUi1-000Rgw-8y; Mon, 05 Apr 2021 19:16:25 +0000
Received: from mail-bn8nam12olkn2022.outbound.protection.outlook.com
 ([40.92.21.22] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTUhu-000Rfn-QL
 for linux-mtd@lists.infradead.org; Mon, 05 Apr 2021 19:16:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpYy6GE2lCDO8NiuWBbu1ILL9Gm6AxIjBnKae9fBanGkbah7+71tI4mWmXZrXcXw7c2QqVko01z+W4AAoju0fvKh/DwCzCFguv7g+VQBAFuio8r/5nVUOpsoaLQ3ZBA93Vqfmxvfy5j4V7Rmfh74c+n2ThT3C+VVB8MRWR2v+C3BkHpQmrlLFRE3nGZai8hm4d5rlN0pG/YBINcxnjzZnZ8b7py0o6os5kH25SottIQo2nOvOjwEm7ClRHqLlkjq0LvYU1De5REHQpMNMRJUXMvfQ/XkCKS4XqpqbQNk3ftIKSCJQFf6cQB0s9LFBSaejAXDHefzwJTYrmNwBdDKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avinanGCMxZEMIGHcPloJrwJH4dYp3yQGegF/co5oqw=;
 b=GRynFIAPJtO/EFOr4+MLDR1TGbeJTfSHaybzuZ6HVsrKvhCkbQcD40Wa8g9Zm43P54yXsadWwcuJ2hY0ks44Hb75LdPmXvuPToFstFYiFzFYGclYIe3FBxAWL7Fs4tWGPs0M6ZEsmIBwQYvIGHF6aZ9u6Yj97Lu3GmvMl5d2lsPelquvhMIjJO4wHtawMKUMR7ONUYBtsvPpCXzGuiB2uroU8d0x6JhGZkMmBNjlodNo5mivVTDU567X2wHPCSj+NiHSpSzWJzdC3/5ak8FmBzSpduPhqO9Zc09x/KFti5siX8HStrH2YNBLKm3H2IkkIcOFjTgl725rbxh0qcZWQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avinanGCMxZEMIGHcPloJrwJH4dYp3yQGegF/co5oqw=;
 b=Yi00FENRzMRkfdAW4c9/x+LJUcuuQL2ER6nmk1XTrwjA/L52ywAP2qs0/6ksh+OS91VrobWB4AMe/Z4aGqtutJXoSaMovbORqJmZXSRaN21QpmSBkj33GjgIwk3fGtur41aA20h8zhg6LtaZiZYGYdYjjOquSxlld2GWH5iovonojF+zCI33BUnJpRBcScBzluEeCJmR1JxQuNmebaWzv8AuTZFRrymC63gxq7Oxe4uCciTYPyJcK3+xvGgiPNF6Al6vVMqZoJOPYcu52+vcMS2PRSOVn4iOaHzM7LO57+AlDe7kOm6drM0t2r5ErVcxmdQQAJlIkV9Tn92zAfaNNw==
Received: from DM6NAM12FT034.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc64::4c) by
 DM6NAM12HT166.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc64::372)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8; Mon, 5 Apr
 2021 19:16:13 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc64::42) by DM6NAM12FT034.mail.protection.outlook.com
 (2a01:111:e400:fc64::63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8 via Frontend
 Transport; Mon, 5 Apr 2021 19:16:13 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D74E9AA1F8A6F910923262E544DCD1613940BA143034C1036DC5B498CFE303AB;
 UpperCasedChecksum:7FE98B05444A7396F51E96478591FCE8FB39DC80C0273ED23D8BCBFA475C52D4;
 SizeAsReceived:7592; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc38:a692:c2c8:f63e%7]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 19:16:13 +0000
Date: Mon, 5 Apr 2021 14:16:11 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, andreas@rammhold.de,
 figgyc@figgyc.uk, richard@nod.at, miquel.raynal@bootlin.com
Subject: Re: [PATCH] mtd: spi-nor: XTX: Add support for XTX XT25F128B
Message-ID: <SN6PR06MB5342947DCCA76AB0F4EF27BBA5779@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <SN6PR06MB5342C82F372F37FB8E21B327A57A9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <9930cb45-cd30-9cc5-c099-7cc547ec60d5@microchip.com>
Content-Disposition: inline
In-Reply-To: <9930cb45-cd30-9cc5-c099-7cc547ec60d5@microchip.com>
X-TMN: [Od2GOb1EnjOTBWNKjk0rL96slXRL86G6]
X-ClientProxiedBy: SN4PR0501CA0130.namprd05.prod.outlook.com
 (2603:10b6:803:42::47) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210405191611.GA28119@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0501CA0130.namprd05.prod.outlook.com (2603:10b6:803:42::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8 via Frontend
 Transport; Mon, 5 Apr 2021 19:16:12 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: c977fc53-3282-4299-c80d-08d8f86746b6
X-MS-TrafficTypeDiagnostic: DM6NAM12HT166:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AFmR8Z5HXNE8F1iwfnFOx6MF+fkd2ZUnhhvX1Odfi5y6cSwWi1y7O9ul0eRJoSW3HE9t79yLLT0B4Be46HUOPRhQXx1spTkmWAPN3fU+z+DQyG2gHcqWmGPq4FDpG0oxPva2YSwRPxuZzgQjw0rGU7vEJygcqjrdVtvh42XWU6UL8rj2dacRwwRVpCqxc/dE1ui9deewckD8KwHpSmPd3/g/vXWYIsu1uA8+qfvLL1+Hc+m966J3wJ75XxAYEkVoIGNZR3iPEZb3vjdem2lTKI1LCKqcpSnn+ebpxF+S5ZFBP1co+C3113PNBWMhgVkiPwM8B+gdTOtfQURRi3eSbjYB10jsU1vnlJXImHwecLtTzIQZj7zBNboD93mLhKfed+egCwcWlO6btW2m9KNN/Ky1oq/lAEP0kOLtIX7yKZk=
X-MS-Exchange-AntiSpam-MessageData: AcLeQfLte6ynVFs++Co3EJyHGSLBC7+dkkaR+42246prmKg43frCAtLsoU4mkLWT9H8gHBOC9xL1Tnfi9vjGjSdtxe94jxW4MxLRDehvj7UD3F6DV+lonPN2e6nnWvz8NJwCZgXuDGMzfWPBcg1idA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c977fc53-3282-4299-c80d-08d8f86746b6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2021 19:16:13.3233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM12FT034.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM12HT166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_201619_131423_68040794 
X-CRM114-Status: GOOD (  31.60  )
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

On Mon, Apr 05, 2021 at 08:52:11AM +0000, Tudor.Ambarus@microchip.com wrote:
> Hi,
> 
> On 4/2/21 11:15 PM, Chris Morgan wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Add support for a new vendor (XTX) along with a new chip from the
> > vendor (XT25F128B). This chip is used in the Odroid Go Advance,
> > and has been tested extensively using the spi-gpio driver, as it
> > is connected to a serial flash controller that is not currently
> > supported (but the pins can be repurposed to GPIO). Read, write, and
> > erase all work as expected.
> > 
> > Datasheet can be found here:
> > https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdatasheet.lcsc.com%2Fszlcsc%2F2005251034_XTX-XT25F128BSSIGT_C558844.pdf&amp;data=04%7C01%7C%7Cf7133c0ccefc4898050e08d8f8101c7d%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637532095378348815%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=SgseEt9ZbY%2BIaZdMyKLTAh3rnD5zrVqJYV3d0jAt6qM%3D&amp;reserved=0
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> 
> Chris, we're trying to figure out how to deal with the continuation codes.
> Discussions on going at:
> https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2021%2F2%2F7%2F223&amp;data=04%7C01%7C%7Cf7133c0ccefc4898050e08d8f8101c7d%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637532095378353805%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=UJW6JeEVwwzttJ7CfhAOqGAzV%2FPyBJf%2FjWYvw6%2BUwuk%3D&amp;reserved=0
> https://na01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fkernel%2Fmsg3808260.html&amp;data=04%7C01%7C%7Cf7133c0ccefc4898050e08d8f8101c7d%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637532095378353805%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=wyMehux468x49Nb%2FhypiKif9rztptk9CJuRWmBzZ0Og%3D&amp;reserved=0

Thanks, this helps.  For what it's worth, I ran the same command (spincl) on
my Raspberry pi against this chip and came up with the following:

spincl -ib -m0 -c0 -s0 -p0 6 0x90
0x00 0x00 0x00 0x00 0x0b 0x17

spincl -ib -m0 -c0 -s0 -p0 4 0x9F
0x00 0x0b 0x40 0x18

Doesn't look like this one uses continuation codes either, sadly.
Let me know what information I can provide to help with the
continuation codes for these seemingly non-conformant chips.

> 
> > ---
> >  drivers/mtd/spi-nor/Makefile |  1 +
> >  drivers/mtd/spi-nor/core.c   |  1 +
> >  drivers/mtd/spi-nor/core.h   |  1 +
> >  drivers/mtd/spi-nor/xtx.c    | 24 ++++++++++++++++++++++++
> >  4 files changed, 27 insertions(+)
> >  create mode 100644 drivers/mtd/spi-nor/xtx.c
> > 
> > diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> > index 653923896205..3f7a52d7fa0b 100644
> > --- a/drivers/mtd/spi-nor/Makefile
> > +++ b/drivers/mtd/spi-nor/Makefile
> > @@ -17,6 +17,7 @@ spi-nor-objs                  += sst.o
> >  spi-nor-objs                   += winbond.o
> >  spi-nor-objs                   += xilinx.o
> >  spi-nor-objs                   += xmc.o
> > +spi-nor-objs                   += xtx.o
> >  obj-$(CONFIG_MTD_SPI_NOR)      += spi-nor.o
> > 
> >  obj-$(CONFIG_MTD_SPI_NOR)      += controllers/
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 0522304f52fa..9a89ec473e4b 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2215,6 +2215,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
> >         &spi_nor_winbond,
> >         &spi_nor_xilinx,
> >         &spi_nor_xmc,
> > +       &spi_nor_xtx,
> >  };
> > 
> >  static const struct flash_info *
> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index 4a3f7f150b5d..ee0e45eaffcd 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -425,6 +425,7 @@ extern const struct spi_nor_manufacturer spi_nor_sst;
> >  extern const struct spi_nor_manufacturer spi_nor_winbond;
> >  extern const struct spi_nor_manufacturer spi_nor_xilinx;
> >  extern const struct spi_nor_manufacturer spi_nor_xmc;
> > +extern const struct spi_nor_manufacturer spi_nor_xtx;
> > 
> >  void spi_nor_spimem_setup_op(const struct spi_nor *nor,
> >                              struct spi_mem_op *op,
> > diff --git a/drivers/mtd/spi-nor/xtx.c b/drivers/mtd/spi-nor/xtx.c
> > new file mode 100644
> > index 000000000000..4eec737e94c7
> > --- /dev/null
> > +++ b/drivers/mtd/spi-nor/xtx.c
> > @@ -0,0 +1,24 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2021, Chris Morgan <macromorgan@hotmail.com>
> > + * Based on XMC SPI NOR module
> > + * Copyright (C) 2005, Intec Automation Inc.
> > + * Copyright (C) 2014, Freescale Semiconductor, Inc.
> > + */
> > +
> > +#include <linux/mtd/spi-nor.h>
> > +
> > +#include "core.h"
> > +
> > +static const struct flash_info xtx_parts[] = {
> > +       /* XTX (XTX Technology Limited) */
> > +       { "XT25F128B", INFO(0x0b4018, 0, 64 * 1024, 256,
> > +                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> > +                            SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> > +};
> > +
> > +const struct spi_nor_manufacturer spi_nor_xtx = {
> > +       .name = "xtx",
> > +       .parts = xtx_parts,
> > +       .nparts = ARRAY_SIZE(xtx_parts),
> > +};
> > --
> > 2.25.1
> > 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
