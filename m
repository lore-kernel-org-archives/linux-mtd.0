Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6D7C76194
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 11:19:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E110C2238C
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 11:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n5RmXwgE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="fb5wrvyM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E110C2238C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZFrATKDiFz+aJ65INhQvQS2uJdBs7MswOODU2/TWm8=; b=n5RmXwgEtJe0d9
	94dccDfmJyNbzN2fggA3+skNGcYsk4GJungmIiE9/LWr8/gBJfqXLX53TbXRmDyScU3+22MVzQDZu
	hWyVh78AecQ2qWEKmFm04soPsuEL3DhbkLVb/yXPbuZQZtVtZOkFHOxlvJbOHNmVGBDvfYUxayPhv
	fGF0DkHexNdIpG14tuGh97VZ/dR/aZrdN6qHk2v1on9zS1PyD5wYN94tNsjdhxwMheoMZqtJrE/EX
	hlCI2MQaFWHOAJ3bJpVk1rAD3Ba50g6YLNUoE+/BeScfv6Dnt93Y1JX4YZtAVGpyTDXUOR8IJZC6+
	BPdW/MlUUvcEgyqkE9nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqbmK-0005Z4-Mm; Thu, 25 Jul 2019 11:19:20 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqbmF-0005Y5-85
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 11:19:19 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: ydMyd3nq0ExI/3JyqEi7wS30eamcrZ/vXJDKTzkbUUzRQWYrtDpZABem5vHQSwZdDtnATZlyJP
 zS9lM/zF+tyzAR4U62L1IjxroAojlAzMTojdhrkovvDTqWgVqAksVhiuXikT2/UgYqn9f3qWy5
 h1GAPvOwQLNbnOpkOmMf3RP7PXAAb9jf1abWKu31Tz4G5/PY//92HZIOtAbinl4s2xR5RBjuKd
 8T6CpfUus4vsf2Q0l30fyel0qnrT6TuEOCfDpxpsrmjLygmSexptgsgCv2hVpaFKgyzsSk8Jbv
 lOw=
X-IronPort-AV: E=Sophos;i="5.64,306,1559545200"; d="scan'208";a="42713119"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jul 2019 04:19:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 25 Jul 2019 04:19:10 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 25 Jul 2019 04:19:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9kidZorT62VL6rG5/wTF+0FU4mkboamK5+OCGPF4dvaAL2qFSlldnuekg3l7y9Y7nQR/b/TgzMtdObD0aOFA1Ou0Ng0K/Rs6rTkmUnujF9vaYqVxh+QnHaBO15tGVLnoPDkLXm2YZpO+EXZ8B38RQvPorO/VFxpSfd2Cn0mMQxDekBj9pB5TS+NacAZf64mCtAZRTb/s+z9HVRHJtzO3J6ASdVQb+YhCQfIxHB06kAy8j5o2Wj2blPn6U1XDu85nudJ2TxpCE8mpewhVQzyIzPPHqHzcmzD4yJiP/JkVlyzPBsndW29jLyiTxnN/GwFeBenOINxPNT4LiEcj8ALZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6tOZlBYG4oOeUTsNQF4vAThfJX9/5zAiWLPZbSAJBQ=;
 b=GHDjD3kBHTzl4Oms01t0ckFlsPU20uzvdDzvY2HHQ1Gj7lbt9g4Sf3Z2hTidYzhy26C3jWKyRN3/05s0hKUyV8RuHlK6byJ4prj8izVkAyAT6DwYwyZ/irjPv1vXmRBpK3SBOopZuNtGhZMMmFQbVhjdZ3o3Nv4zgb55Zcas6ln3qaBI1/N0wd8G39/kyTVXeLFYohAOKVqLuK4qPiNRroSheZoGFxBPzM/iXDbyTQOt1EKXsEi95VkLDjZuff1Zn9+PYBu7iNErrODfTj/sx0vA3Il75VJBsRpqMLqKf+C6upxA9UpyqWXvOq9D/4HhoZvvMN8Yo0PfC22Q+cwu0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6tOZlBYG4oOeUTsNQF4vAThfJX9/5zAiWLPZbSAJBQ=;
 b=fb5wrvyM92SlJz6FbGTBM+R/KIRkOCBhfJOiKhLgXNppMeFMQlSdaZcU4ksxa9m/k31gj+wEEVIVqJ1h5h73vVS95iQuSRxInFIVr898Rp4S0y6dMP4BVuZljeauWSXg24+LkfIYNjjwmqlydkDs5UgZcVi2+1PU7EZtjrvAaq0=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1476.namprd11.prod.outlook.com (10.172.21.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 11:19:06 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::3161:92ff:d26c:8b66]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::3161:92ff:d26c:8b66%7]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 11:19:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <marek.vasut@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Topic: [PATCH v2 1/2] mtd: spi-nor: Move m25p80 code in spi-nor.c
Thread-Index: AQHVPtFNjfEG9DN44ESnRp+H/g0b8qbbN92A
Date: Thu, 25 Jul 2019 11:19:06 +0000
Message-ID: <f6410e21-18c3-9733-4ea5-13eb26ad6169@microchip.com>
References: <20190720080023.5279-1-vigneshr@ti.com>
 <20190720080023.5279-2-vigneshr@ti.com>
In-Reply-To: <20190720080023.5279-2-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0101CA0072.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:1f::40) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28a55b2c-1178-4834-9b1d-08d710f1e806
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR11MB1476; 
x-ms-traffictypediagnostic: BN6PR11MB1476:
x-microsoft-antispam-prvs: <BN6PR11MB1476C34ADB1FC179511FF89FF0C10@BN6PR11MB1476.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(366004)(136003)(346002)(199004)(189003)(36756003)(52116002)(99286004)(66946007)(478600001)(476003)(54906003)(26005)(446003)(11346002)(25786009)(102836004)(66446008)(66556008)(316002)(186003)(6506007)(386003)(53546011)(64756008)(76176011)(31686004)(66476007)(110136005)(486006)(305945005)(53936002)(6436002)(8676002)(2906002)(81166006)(6512007)(6116002)(2616005)(31696002)(6246003)(6486002)(81156014)(86362001)(68736007)(66066001)(5660300002)(71190400001)(7736002)(71200400001)(256004)(229853002)(4326008)(14454004)(3846002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1476;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AmXq7LjMzOBIg4A8/U2luqNo8fXXM6/Q44w1gkMgKanRYpsumeIdTzbIaKt0h5PF0VUAhgLrwYVpycd8OLyN3VMwGG0o5Hf0V0uGHfNOCumRcxq76eywG3HDydP2oWTjm5GD+1wzRwqISiSpqaW+ubrZ+vJSohPnXB1fLJ9vMC/dZiq9RahNXdfaC8nPa/T8GHHGWn777yGixDnwXVLlqmlKU2NoiVyVvMmJYHRCT/xonMfH/mvB83nXzz++4eMuujB0Nta8fs1HaLZNGJrVt3zZSO0gLqj+Iqi5KBhqGjP1B/FYshtmIOWIncui8aX37Vu365yyX2FmT2U9dLrTZnDMg8fP01i8qkzI77jwFxXQCFC8i4tK2J+CCi/X0VSVz11Rcjb8EtT69+v0gd9xKtASmlMZfmQNIbA9j9wdGGI=
Content-ID: <3ABA233EBFAA224387104153690F9F67@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a55b2c-1178-4834-9b1d-08d710f1e806
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 11:19:06.4303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1476
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_041915_395473_ED1ACFE9 
X-CRM114-Status: GOOD (  19.50  )
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
Cc: marek.vasut@gmail.com, yogeshnarayan.gaur@nxp.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

All,

I want this in 5.4, please review/test the soonest.

On 07/20/2019 11:00 AM, Vignesh Raghavendra wrote:

> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 03cc788511d5..f428a6d4022b 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -19,6 +19,7 @@
>  
>  #include <linux/mtd/mtd.h>
>  #include <linux/of_platform.h>
> +#include <linux/sched/task_stack.h>
>  #include <linux/spi/flash.h>
>  #include <linux/mtd/spi-nor.h>
>  
> @@ -288,6 +289,232 @@ struct flash_info {
>  
>  #define JEDEC_MFR(info)	((info)->id[0])
>  
> +/**
> + * spi_nor_exec_op() - helper function to read/write flash registers

the function name can easily get confused with spi_mem_exec_op(). How about
renaming it to spi_nor_spimem_xfer_reg(), it will be in concordance with
spi_nor_spimem_xfer_data().

> + * @nor:        pointer to 'struct spi_nor'
> + * @op:         pointer to 'struct spi_mem_op' template for transfer
> + * @addr:       pointer to offset within flash
> + * @buf:        pointer to data buffer into which data is read/written
> + *              into

                   ^ drop second into

> + * @len:        length of the transfer
> + *
> + * Return: 0 on success, non-zero otherwise

                            ^ s/non-zero/-errno?

> + */
> +static int spi_nor_exec_op(struct spi_nor *nor, struct spi_mem_op *op,
> +			   u64 *addr, void *buf, size_t len)
> +{
> +	int ret;
> +	bool usebouncebuf = false;

I don't think we need a bounce buffer for regs. What is the maximum size that we
read/write regs, SPI_NOR_MAX_CMD_SIZE(8)?

In spi-nor.c the maximum length that we pass to nor->read_reg()/write_reg() is
SPI_NOR_MAX_ID_LEN(6).

I can provide a patch to always use nor->cmd_buf when reading/writing regs so
you respin the series on top of it, if you feel the same.

With nor->cmd_buf this function will be reduced to the following:

static int spi_nor_spimem_xfer_reg(struct spi_nor *nor, struct spi_mem_op *op)
{
	if (!op || (op->data.nbytes && !nor->cmd_buf))
		return -EINVAL;

	return spi_mem_exec_op(nor->spimem, op);
}

spi_nor_exec_op() always received a NULL addr, let's get rid of it. We won't
need buf anymore and you can retrieve the length from op->data.nbytes. Now that
we trimmed the arguments, I think I would get rid of the
spi_nor_data/nodata_op() wrappers and use spi_nor_spimem_xfer_reg() directly.

> +
> +	if (!op || (len && !buf))
> +		return -EINVAL;
> +
> +	if (op->addr.nbytes && addr)
> +		op->addr.val = *addr;
> +
> +	op->data.nbytes = len;
> +
> +	if (object_is_on_stack(buf) || !virt_addr_valid(buf))
> +		usebouncebuf = true;
> +	if (len && usebouncebuf) {
> +		if (len > nor->bouncebuf_size)
> +			return -ENOTSUPP;
> +
> +		if (op->data.dir == SPI_MEM_DATA_IN) {
> +			op->data.buf.in = nor->bouncebuf;
> +		} else {
> +			op->data.buf.out = nor->bouncebuf;
> +			memcpy(nor->bouncebuf, buf, len);
> +		}
> +	} else {
> +		op->data.buf.out = buf;
> +	}
> +
> +	ret = spi_mem_exec_op(nor->spimem, op);
> +	if (ret)
> +		return ret;
> +
> +	if (usebouncebuf && len && op->data.dir == SPI_MEM_DATA_IN)
> +		memcpy(buf, nor->bouncebuf, len);
> +
> +	return 0;
> +}

cut

> +
> +/**
> + * spi_nor_spimem_xfer_data() - helper function to read/write data to
> + *                              flash's memory region
> + * @nor:        pointer to 'struct spi_nor'
> + * @op:         pointer to 'struct spi_mem_op' template for transfer
> + * @proto:      protocol to be used for transfer
> + *
> + * Return: number of bytes transferred on success, -errno otherwise
> + */
> +static ssize_t spi_nor_spimem_xfer_data(struct spi_nor *nor,
> +					struct spi_mem_op *op,
> +					enum spi_nor_protocol proto)
> +{
> +	bool usebouncebuf = false;

declare bool at the end to avoid stack padding.

> +	void *rdbuf = NULL;
> +	const void *buf;

you can get rid of rdbuf and buf if you pass buf as argument.

> +	int ret;
> +
> +	/* get transfer protocols. */
> +	op->cmd.buswidth = spi_nor_get_protocol_inst_nbits(proto);
> +	op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> +	op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
> +
> +	if (op->data.dir == SPI_MEM_DATA_IN)
> +		buf = op->data.buf.in;
> +	else
> +		buf = op->data.buf.out;
> +
> +	if (object_is_on_stack(buf) || !virt_addr_valid(buf))
> +		usebouncebuf = true;
> +
> +	if (usebouncebuf) {
> +		if (op->data.nbytes > nor->bouncebuf_size)
> +			op->data.nbytes = nor->bouncebuf_size;
> +
> +		if (op->data.dir == SPI_MEM_DATA_IN) {
> +			rdbuf = op->data.buf.in;
> +			op->data.buf.in = nor->bouncebuf;
> +		} else {
> +			op->data.buf.out = nor->bouncebuf;
> +			memcpy(nor->bouncebuf, buf,
> +			       op->data.nbytes);
> +		}
> +	}
> +
> +	ret = spi_mem_adjust_op_size(nor->spimem, op);
> +	if (ret)
> +		return ret;
> +
> +	ret = spi_mem_exec_op(nor->spimem, op);
> +	if (ret)
> +		return ret;
> +
> +	if (usebouncebuf && op->data.dir == SPI_MEM_DATA_IN)
> +		memcpy(rdbuf, nor->bouncebuf, op->data.nbytes);
> +
> +	return op->data.nbytes;
> +}
> +
> +/**
> + * spi_nor_spimem_read_data() - read data from flash's memory region via
> + *                              spi-mem
> + * @nor:        pointer to 'struct spi_nor'
> + * @ofs:        offset to read from
> + * @len:        number of bytes to read
> + * @buf:        pointer to dst buffer
> + *
> + * Return: number of bytes read successfully, -errno otherwise
> + */
> +static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t ofs,

s/ofs/from? both flash and buf may have offsets, "from" better indicates that
the offset is associated with the flash.

> +					size_t len, u8 *buf)
> +{
> +	struct spi_mem_op op =
> +		SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 1),
> +			   SPI_MEM_OP_ADDR(nor->addr_width, ofs, 1),
> +			   SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
> +			   SPI_MEM_OP_DATA_IN(len, buf, 1));
> +
> +	op.dummy.buswidth = spi_nor_get_protocol_addr_nbits(nor->read_proto);
> +
> +	/* convert the dummy cycles to the number of bytes */
> +	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> +
> +	return spi_nor_spimem_xfer_data(nor, &op, nor->read_proto);

stop passing nor->read_proto and do all buswidth initialization here. This way
we'll keep the inits all gathered together, and will have the xfer() that will
do just the transfer (with bouncebuffer if needed). Function that does a single
thing.

> +}

cut

> @@ -459,7 +749,6 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
>  		struct spi_nor_erase_map *map = &nor->erase_map;
>  		struct spi_nor_erase_type *erase;
>  		int i;
> -

keep the blank line

cut

> @@ -1406,7 +1807,18 @@ static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
>  
>  	write_enable(nor);
>  
> -	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_OUT(0, NULL, 1));

nbytes is 2.

> +
> +		ret = spi_nor_data_op(nor, &op, sr_cr, 2);
> +	} else {
> +		ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
> +	}

cut

> @@ -1626,8 +2068,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>  		return ret;
>  	}
>  
> -	/* Read back and check it. */

don't drop the comment

> -	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, &sr2, 1);
> +	ret = spi_nor_read_sr2(nor, &sr2);
>  	if (!(ret > 0 && (sr2 & SR2_QUAD_EN_BIT7))) {
>  		dev_err(nor->dev, "SR2 Quad bit not set\n");
>  		return -EINVAL;
> @@ -2180,7 +2621,18 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>  	u8			id[SPI_NOR_MAX_ID_LEN];
>  	const struct flash_info	*info;
>  
> -	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
> +	if (nor->spimem) {
> +		struct spi_mem_op op =
> +			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
> +				   SPI_MEM_OP_NO_ADDR,
> +				   SPI_MEM_OP_NO_DUMMY,
> +				   SPI_MEM_OP_DATA_IN(0, NULL, 1));

nbytes is SPI_NOR_MAX_ID_LEN and not 1.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
