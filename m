Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40027C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jul 2022 14:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Dw+p6QQIZ1obggYrYOBZg2w7bZz3BacooL83nIgCE3o=; b=uJjzSoONZR3aOJAXWd9+OsOq8v
	3Ay93GUszJ6y31RnnhXkTSUjvd1VYQuOn7XZcBjmK1VexO4r2mSZ+m0axfvXFRSAwwgH2A+/dtTzX
	GRBSe+cqaSNG918pM4/hpylddbDBNqDqzc/dAA6Llck4EtjtXw1Mn7s+Ysmr3TT7zp5MmTgJiRffd
	RrZtpygS60QBxZNFPTwsAb01ajHbLeCoMHI6lBjvW9Bfadg5WD71IOkBjgaFyxbdSq3bOqT75FbBl
	othTi5WBThN0qCBkQRO4dgMROuydI92mqueE57qzAujIa+mSwb9dthIa20nlottkJ5giF8Wn+U4xl
	LK4ccGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFzPa-00DW0c-Im; Mon, 25 Jul 2022 14:50:22 +0000
Received: from mail-eopbgr60121.outbound.protection.outlook.com ([40.107.6.121] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFzPV-00DTvD-Oa
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2022 14:50:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ga2flau38Fcjj3TdkyttHA+K0Dft/N1P4J9rzfksAV7kfqkNkQcErjRolLB2s5BmPrrOaiT8sv1Z6ZbYwD1eJswpL84K++63Ele3Wqds7Rbs7/awOB+3rYS8Uzg1PR2sHCuudygMDDBZwsjuMhQ5cpB+6YKDFi6jFWZy4wXFXo9bSzFkKBKNIHPWjc2Skeh+9XfeL6dQuzQVXC8+7xASCxTMCxP0cbt5LoosFGpAKM3pShYh0/1nBgMLWftHwz0I7h5r7iBOWqoioXLjR27bHujIsj7VEAX8UiqCx8gxphmQtH8vhm6aIYh8eqVzQBDjYwGsU9/0GEVRhncLmjz07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yW5rTe+hcitXKrPyJF1UX+dvJpkB6eSTjWt6lDoFggc=;
 b=GpAiEQRyNtt86abTGLjBzgVohpBGXc/xj2vsDkQa+sehfLoIjRYlmwPnp/89YRUDS8cVT5VJ4RuMu3b8u9+Fkfl4Cx3eBxKUjz4JF1jDXkZHTm6tGIRbmzBq+7lj5tKsKuC/ILv8UntVLb0PDF6D8DDNIrnogTplTsKEkq4FI06K+Tjjh76w51T2VJktsql3WexR/8CJdaTOnU2reH1t6CNlkNmkzOmavXQBFtEErd/jmuQ/7jAqWJNBoa9ceaJgAaywP4DePILvqiCmyrtULIL+3aznLK9G0ZVHpsq+Znz5z/S/B6ENAS+kZHZL8dYZrWnMG9cSxaBzdIs33+cKcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yW5rTe+hcitXKrPyJF1UX+dvJpkB6eSTjWt6lDoFggc=;
 b=NTBdH/wwBmWCUxzInd3aJKc7CW3Z5UrfePtzeeBca3V5VkurnZ7/+NLj4EdZ1na0rHzH8Q4sro7ITyO5GvSI/n+JD356fzofcbHkzgq0gXkHZat3UeYcq11N/3KHhDKNQ8EvuP6AnD3zbjL3sf7jeikS1PVH5U9CgBnJRYlFsOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AS4PR07MB8658.eurprd07.prod.outlook.com (2603:10a6:20b:4cd::12)
 by DBBPR07MB7563.eurprd07.prod.outlook.com (2603:10a6:10:1e3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.1; Mon, 25 Jul
 2022 14:50:09 +0000
Received: from AS4PR07MB8658.eurprd07.prod.outlook.com
 ([fe80::d58d:e18d:afdb:35b8]) by AS4PR07MB8658.eurprd07.prod.outlook.com
 ([fe80::d58d:e18d:afdb:35b8%7]) with mapi id 15.20.5482.001; Mon, 25 Jul 2022
 14:50:09 +0000
Message-ID: <aaa5992d-e48a-3f0c-b3c3-639d7cc41161@nokia.com>
Date: Mon, 25 Jul 2022 16:50:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: mtd: spi-nor: fix spi_nor_spimem_setup_op() call in
 spi_nor_erase_{sector,chip}()
Content-Language: en-US
To: patrice.chotard@foss.st.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, inux-kernel@vger.kernel.org
Cc: christophe.kerello@foss.st.com
References: <20220629133013.3382393-1-patrice.chotard@foss.st.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
In-Reply-To: <20220629133013.3382393-1-patrice.chotard@foss.st.com>
X-ClientProxiedBy: AS8PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::10) To AS4PR07MB8658.eurprd07.prod.outlook.com
 (2603:10a6:20b:4cd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d93d7b5-2105-475f-c49d-08da6e4cf857
X-MS-TrafficTypeDiagnostic: DBBPR07MB7563:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HCbH1rFzSWPQPGGDMP4/3prK8D4Hoyrp+cTwQuS8CqJvYG0cXnxIx1Vhy+w52fEy2gLy5VSXOpcmD1gVct0trkXcIjZJExw55myDU1YWCHuQRgQ5syWuGAqZ6VC3UgXBB7trw6dhzTsvQ0cEz0srQvUBdDDNyumvleR1YMEOwxuaFlEn9UOMMCsjxN6cfmr8YiO2JTzd+chcAgiNiEf6czKDk3pWrjGF3v7Salea7DF4z4eFrEYea0UtW3ANgPqbCoESavcbpVfKKLXi/O+nlpybwGlZt/AhVY3VMQoTHDHJbo3W4mAtY6cXGT0NGl2lJZer1RhbaI3Qq4JDZJ4j0nx4/KJUezV0UuzihTB1RSG3wXgMJiNQrh4f/vb+KVsQ+pAgBp640fh7xBcTD/9HyDtB3OB1THrxVf4wS/eNsaET/hDC6wGX9OR/d0Ktq9JEi/vnJ12p1+ZNa0+2K412PQLmrm+2u5HsjIrxmRJd1DF7HhZDJjSjPLmnuBbIGmcsOXsFxflF0we9x+MXFORAAoLTgsfX0dE+RPmrXxQUil9ZMqQ20C3fQst2lswvQIovprCr+txQxwVGEmBWTVPg7vFKk26jC+EzChERhIMQY/JKZvbnvWeLgt7Tq+ZvYfGRo33EJg5Lezh0nnXiU4n33MbeBWqL8In/RBm01FqeI4MV4ieTd/ekhIu4zTp4OFScCp7Joj3AVvPY20KVn3QaiPOZTRWb0qWkePXFOPhRBjwNicxqqdU9vGd0deCbfuYvNtqoKdK4Z9+IVh0pMLaDbNutwVXC7MaLrEygfXuMiRqwf1DtC3+RP4sTZShQG8R5ZovyOA3XX7g9pjt8gyXTyA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR07MB8658.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(6506007)(86362001)(8936002)(6512007)(5660300002)(26005)(478600001)(6486002)(6666004)(2616005)(186003)(83380400001)(2906002)(44832011)(31696002)(53546011)(31686004)(82960400001)(41300700001)(110136005)(316002)(36756003)(66556008)(66476007)(66946007)(4326008)(38100700002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?VHVNbDNZSUdqdGZ6TlgvWWI2aENqakp2RFQ0aTlyMk1ORkpKb2oza0diNXVv?=
 =?utf-8?B?a3FBcjN6a3cxL1J4VWNJTXF5bmhyRk9NM2lHd3I5OW14SWhtcUhhZk84bS9a?=
 =?utf-8?B?T1pBYktMUE1jVHJuaU0xa0pSa2tCZ0FmVmdGQWFjUmZnYU9uY0RwcWJFR0R4?=
 =?utf-8?B?dDlVcGRmMWlLV3dnYy96S1VoWmhTZGdVZmZuTDJhZEdYRmVKL2kwcXgwZWdk?=
 =?utf-8?B?NFN0bm1uVWtLbHVCckpCUW04VVhGNzQwbGdwSlJGOFpBZk9LQlN5WFJEdzg3?=
 =?utf-8?B?MUsvVmVtRmpaTjFrM05pL3NwYXFDOFV3MWhXdFVVT1pNdCtHd28zL0xXMEt4?=
 =?utf-8?B?ekcvenFaMDVtSE9tRk0vSFowVno1Si9BVXhydXlBdWZzTCtlZXI1d1VHcnhz?=
 =?utf-8?B?QU1yZDh6NGxNamUzOFNORXV1V0MwaHdscjR2REI0Qm9PVE5rL1dGSXNCV0JB?=
 =?utf-8?B?TThmc1YyMUpKS2FXYkNERkZaOURxRE5URlY2ZFZ0cVVYY1V3eFo1dDRyYWJQ?=
 =?utf-8?B?ZzRQVDM1b25XMld1UEpmWDhobTRnMEMyR2Z0S2hBVnUzcGhWK1VtWTJld1BR?=
 =?utf-8?B?SzlDbTk4cjhsdXlXZkdlVEZsZFZxdCt3UTZudDIxTmRzV0gzZ0RHSXNmTFZL?=
 =?utf-8?B?ZVlBM0ljenA4aWphOFBPaEdNUDg2ZnFnN3BzN21UalRtekpSRjhwSG5KVDk1?=
 =?utf-8?B?Z0NBa1FjOVZBRCszS2VwSXM4TG4vbm1KeU5WZUJLWWpYdU5aWjNZVkxRRndo?=
 =?utf-8?B?cVFnQzhyRWFnanlFYWdSbzBqUWQvVmJZREZ6SDUwam1wR2RlVUdWVXFXcE5t?=
 =?utf-8?B?bVoyc3M2dGJuV2lIT0tRTUtCNUsvTGdMN1FzYVRjNlliaGZiN0x2YVJkeFln?=
 =?utf-8?B?RXAxMXdMQXpPTTIwNUlZRk1DTUtxZExNL1MyQ0dtamNTTWYrM3RFVWJPaGho?=
 =?utf-8?B?aUROaGJpQ1cvMUNLc2RJR1ozczhqL0VablNqb09lMW4xSlhrT1JWbmRHVTBs?=
 =?utf-8?B?UjhPUk5oZXdmZUpOUGc5bW1MRWdnS0w0U2p0NWVQalJJT0JyUjMyV1E5Q3ln?=
 =?utf-8?B?bzA4RUZ5ZFJxNksyZ1ppU1FUMWl6dHVkYWloZ3d4U01KTEU0Y2p3bFZ4anJ3?=
 =?utf-8?B?WW5DSE9FR1FETmN3SWxWMVVYTW1CRzh2ZUt6NUxDcSs0MEJwaXhyemxIcm80?=
 =?utf-8?B?Mk0xTC9nY1l3SUsyZ3lqdkJHL0I5Y3NVejd4clRVTHY3NCtXNVkyYWcva29a?=
 =?utf-8?B?ZkVQNHBEcVhxSUNxRkdCeWQrYlhrN3pWZWhZYzJsWUY0TGJPZ1BKK1NHRFJJ?=
 =?utf-8?B?MnU5bWtSb2tieXlwUVdDYjdLQTBxU1Vqem1vR0dxT3pkNTBBSmx4R3RWL1Jh?=
 =?utf-8?B?Z0oyWFN4UUEwcm5tZHpBcUtRWnM0M0RHWjZORG9HckN3U2tsT1dmeGYyQVY2?=
 =?utf-8?B?VjFkTFRaZURyaEV1MWhWWVZOS2JRd01nWFQwMnpTYnJHNEJtaytRbGZFNmx6?=
 =?utf-8?B?cTVJUXUrTURVdllueUN5Y0pNMEJjMmZqRnpYS0F3c0pSbGxGNjBkMXZLZmk1?=
 =?utf-8?B?Y2tuOUU2VHRmYWRYMGJJSVJSVTh5WXA2WE85amE5SERlTWdmSnBRYU9aaU1q?=
 =?utf-8?B?Y2NCR2w3elR6cDlIUVh6bFdWdHdlZzJ4QmRBb2RlNXVrUlp5eFBkYjQ2aU9H?=
 =?utf-8?B?Yml0UkFyTlRmcU9hVlN5aWFpOWttaTVVQ3Jubk9HSTFPYmlIa0Q4YjJZb2dP?=
 =?utf-8?B?Q0kxUGFYMzFxczBDdDkvbkhHejF0eVVVOHYrQk5heXJxdmpoVU9QNUZ3b0Yz?=
 =?utf-8?B?TFEwQlBBNlVyN2o0dytkM0Y3Y09Eb1RxTkp4blBFWVZXUDg1WEt5WEMwL25a?=
 =?utf-8?B?cmdheGwydnloM0k5THdCRmJEOVlUWWtMZXV0UzhJNDBUVTdiSjdwbUplNUly?=
 =?utf-8?B?MGNpclFjZUR5K1QrS0EzcUhsclpNMHQvaXdFQVJYSEw5Ylkwd1ByeW8xVlBK?=
 =?utf-8?B?cEpOMUFDRkhNdTN3cTFjWHJveEpia3ByTTlSUE52SVlaVHpLcE5yTlR4REth?=
 =?utf-8?B?Z1YrR3NOV3dPUURGNTUrMUVrUVBCclVUbW93cEd3NWlsQmVPU2V1SmJCVjgx?=
 =?utf-8?B?VHNQUW15dTBVcEt6TnRXQnAwSVVqQjloQVV5SzZjcm82RkdqcU5GaStRbUNp?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d93d7b5-2105-475f-c49d-08da6e4cf857
X-MS-Exchange-CrossTenant-AuthSource: AS4PR07MB8658.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 14:50:09.1136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZ7tEwLrySiYjqM06+cpXpMVGWDMqq6AmPUsaVQ1XTaJkmEupskUJ7XXELR/37CZsthjPq3N/T7dtM3rq2bw02GJbV+61rE8SE/DTUdj12I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_075018_109193_4728C5F1 
X-CRM114-Status: GOOD (  18.76  )
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

Hello Patrice,

thanks for the patch!
It fixes mt25qu256a erase in my tests.

On 29/06/2022 15:30, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> For erase operations, reg_proto must be used as indicated in
> struct spi_nor description in spi-nor.h.
> 
> This issue was found when DT property spi-tx-bus-width is set to 4.
> In this case the spi_mem_op->addr.buswidth is set to 4 for erase command
> which is not correct.
> 
> Tested on stm32mp157c-ev1 board with mx66l51235f spi-nor.
> 
> Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Tested-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

> ---
>  drivers/mtd/spi-nor/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 502967c76c5f..61027330848f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -972,7 +972,7 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
>  	if (nor->spimem) {
>  		struct spi_mem_op op = SPI_NOR_CHIP_ERASE_OP;
>  
> -		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>  
>  		ret = spi_mem_exec_op(nor->spimem, &op);
>  	} else {
> @@ -1115,7 +1115,7 @@ int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  			SPI_NOR_SECTOR_ERASE_OP(nor->erase_opcode,
>  						nor->addr_width, addr);
>  
> -		spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
> +		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
>  
>  		return spi_mem_exec_op(nor->spimem, &op);
>  	} else if (nor->controller_ops->erase) {

-- 
Best regards,
Alexander Sverdlin.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
