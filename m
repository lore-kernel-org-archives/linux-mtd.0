Return-Path: <SRS0=6BKG=HN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233ECC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 08:17:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DA5464DFF
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Feb 2021 08:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DA5464DFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U8+hk3ccDZeSahrd8Xbh5G7ZxyOwVkDrvzsp3YelqAs=; b=IYoQivXjAFf2GNYoBnRPwOICS
	ZsXjOnfR4lwR/RJnIO4IfOoEwYr3DDs1iI/C2eYnO3AQVKRHIhkZgtmi/KYDcdUywQ3WHoxc0SDp9
	AfXEy5SxM0Yv/OvCVwzS/b1LCMM5SiwehM8X44EGCBSGjaQE1Wv7GeDpumq02wdCcz5HAcM8vOVHB
	PS5PPBJB32EMZvABWr1zGtDBEP2Ui9pUEYcj/qdUv3c9jFjuBIrcib9PfwMDeJKVOlgDH1Mwykv5Q
	Fn0Eq1djFcgE2WTYVb01WfDooOXlHK/ynsmOh6/61HyajIct0+sYUIFYOJFwlXFH/6O4BMYu8x02m
	PpHApjNPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA792-0008Jc-Ec; Thu, 11 Feb 2021 08:16:12 +0000
Received: from mail-eopbgr80102.outbound.protection.outlook.com
 ([40.107.8.102] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA78y-0008Ia-Mg
 for linux-mtd@lists.infradead.org; Thu, 11 Feb 2021 08:16:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7f9m+dlb6V9QGScj84M/qefr7a77iRls7HXYyN7d5GrcZN9WSiqkHYwAZDocCz/DqO+0+Pd86ajPI0T+TWF///bHUBLbiOWD0RDKBm1L43qnhOEs08nWxdouudzmWAf6u5FB2mJEjasuksBJHgwUj9cS5cL7ye5QljnOwvSN3njRddLy/QzvxmWpJKIoyiQapW9+/odBu8Les+LCyR1FFuNwM6TbBzL3WJrJYurfjRzxR+wEwbo4zGVRc3n5C6VWShn/F9pNqjfX8veBG4TRJ3udJoFTd/WmLRuHM29/nHHEC9FeM/APN2MQufN5fpjH41GJEhQY7SN1wPOMiA4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1Hd6hbtEglc/2Nx0UcHAsi3IOe3xVbk/wBT3Cte+Mc=;
 b=m+3x14E1SowXT2K4fWtSJZkTJPnd35teeahMOSup7teIrOHC1Jlupxlxid5RWRHL1o4xRSpDnM7p8z/y6DySHI682fiT4MT0bLVRS1CrmHYUM2ZnHRXBaIpEm5ewHNt8Xi8YxA7I37fzH4abROiUgERPJ21hiROSme6PnMhhZ3mRn62exD6ZzYZ1lCW4DDTjJrJnw1xHaT7w9VuMx6qTSQSpAYwR8BLOplWW4ihpwpolh/RsfhRXUooyN3ClucHXaL2DCwglF6g27+bGW+jYYCjaBL0kPfLfIIDGYbl2jM2o/ePc7L4BERX9WylbCM3E8pjqZ0T+aQcNVZYqnhwwAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1Hd6hbtEglc/2Nx0UcHAsi3IOe3xVbk/wBT3Cte+Mc=;
 b=fxRQl1CROSOX2lEEdnvoaVxmVM9+/xoBjA3gE/5756OlPhD1kEwP4coDhcNLn/uRCVE2pQ2moCX5imas1jUBVdsriU9rivtLmwRlCG+ahy2sgGoWcC+6sS4TXLm3tbvuc4gE3PHCNtPSs6CXuUFhk80DuCp5fxJ8RrerRfxqVFk=
Authentication-Results: husqvarnagroup.com; dkim=none (message not signed)
 header.d=none;husqvarnagroup.com; dmarc=none action=none
 header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB3298.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Thu, 11 Feb
 2021 08:16:04 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bc4f:2b48:88cd:f90f]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::bc4f:2b48:88cd:f90f%7]) with mapi id 15.20.3825.030; Thu, 11 Feb 2021
 08:16:04 +0000
Subject: Re: [PATCH] mtd: nand: spi: Support GigaDevice GD5F1GQ5UExxG
To: Reto Schneider <code@reto-schneider.ch>, miquel.raynal@bootlin.com,
 richard@nod.at, sr@denx.de, linux-mtd@lists.infradead.org
References: <20210210170031.19753-1-code@reto-schneider.ch>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <c659059e-2990-3902-3553-85986ae9caf9@kontron.de>
Date: Thu, 11 Feb 2021 09:16:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210210170031.19753-1-code@reto-schneider.ch>
Content-Language: en-US
X-Originating-IP: [109.250.136.36]
X-ClientProxiedBy: AM5PR0301CA0004.eurprd03.prod.outlook.com
 (2603:10a6:206:14::17) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (109.250.136.36) by
 AM5PR0301CA0004.eurprd03.prod.outlook.com (2603:10a6:206:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 08:16:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51e2f651-4dd9-4d27-bfaf-08d8ce65467e
X-MS-TrafficTypeDiagnostic: AM0PR10MB3298:
X-Microsoft-Antispam-PRVS: <AM0PR10MB3298F670C6A76988C35B44E2E98C9@AM0PR10MB3298.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kgkCaju5Vu1dMN9MIHuCzMwMUzCPWdQpxHBUUcg++ozo14dRARVqcXkk3C/v2cAHhnUTTZzEsV7+4+v1kuCly+2xqH7I/CaY9U7mNKyNXjGXAYTTkf6CGzGzntdgi9kA3i3NqRjV/xl0EBguV37d9CwQ65Wt43CDcsX7dkIKr8sz4HuvUaiCKNqMP6GD8TcdogxVVhQPmt2Ri0F0D8/N2Ni5cTN661XGLEh4xwOir86ohhUvluomhEXHnJ7XqNeH0uhLJdwywHV52/Bh1KpbB9JjDvMPr7y61vm9O8OPM+ZdNDUV2HdzD9vjHIut8dmcKgGsjKwPI20u5mszu/o/xL3sxiZyhrTCIl1lZIOBvadqjb0tQq0aztwJaBI5ZtOyvGYZmWpC39e57Iqg9IMCRM83B75p3aYJYyJ525X+u9DVDMuzh/W0o1aww6nBXr36l7w5vH+LIvDD41RLLIO9VjNz0HK3r/xUtT/bOM0cCnmlTINTBrX3RnPKK9eqGDOX4u5AJdgfr3hj/7lvruPzhTxSfEobotNXNxNdf7TTd6PR2XZ2jMNQ0DgnS6JsDkA17/4zaZhtWLA1m5RUPjlzsayUxyxCQztpcAlfY5P6EBM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39850400004)(396003)(366004)(376002)(6486002)(31686004)(16576012)(44832011)(36756003)(478600001)(26005)(83380400001)(66946007)(53546011)(8936002)(2906002)(4326008)(16526019)(52116002)(956004)(66556008)(186003)(2616005)(86362001)(31696002)(5660300002)(316002)(66476007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TVdqaDhYUnJHN0VKN0dGN1c2Q3dPbEFkMTlVT3ExQVNSdlcwZWQ3a01uR2lX?=
 =?utf-8?B?NHVORjdoSEk3L2hSOWtuZDMvYVBMMnppTGNBd1FlRGFGTU1lQkowK1hyRENi?=
 =?utf-8?B?RldlTHMxQWNVVmUxYWl1OTQ0OHViMmoxTEtXbWNjL0pBWEltdFlmT2RzVVU1?=
 =?utf-8?B?ME5uZzN3RmZiNk5KRFBnUFBiZmEyZWxqVTVZaDNQMHRUcVpLbldqc1RRZllY?=
 =?utf-8?B?SERzUW0rV0x1OXQySnlJTmQrTTRxd3FZRTZhb2ZYVDMrSGZBRmFpUGh1MHJQ?=
 =?utf-8?B?anhyeW9tRERaMTBBdlYwV2FjMHhQblVEaXZrNzhTcmhlTkEva3RSTklKSnEz?=
 =?utf-8?B?T3lwWWRvY2lUbDBsN3doekl0L051ZUUxU2I4R1NCeEpKcmR4eUU5L2JMTjRh?=
 =?utf-8?B?MGRPVzIyYUhMSE1WOWRYTzBuVmhBSUx2TnhIanFXYmlaRUpwTHVMZFBkWDhW?=
 =?utf-8?B?M1ZIS2Ixb01iYUcxeXJlSXd1TkttNEw3L3lzMWQyNFlYbnRhc3VoNFI1RmZ1?=
 =?utf-8?B?RUpVSUxvQmlWa0JwdVZOY1ZBZnRtWVMweTRjcnBMUDM2ZTRUNi8ySUtJSmw1?=
 =?utf-8?B?Ny9SZTVjanhSOGFDSGhLdlNBb1lpdU5aTmQ5UmN3d0YwdVdqK01hbTVrRDE4?=
 =?utf-8?B?L0lMc1RCQ3lnbGFKcVNaRmxnMGdVaTFoUjcza0Rnb3FmK0ZMTnhkeVhHREhi?=
 =?utf-8?B?eHRxR2tIL3FWaXBaZnpiRFpYMmFNLzljRVFKQ2s0MVZhNmlzRHdYZHF4cFlJ?=
 =?utf-8?B?VVVUL3N1aTNRc3hrNkFDdmpXczQ2RjZVNkVTampuU1hqZzNac1kzYWRteU8z?=
 =?utf-8?B?Q0hrQzAyVVBVRTYwQVA2RVJ1Skhrd2ZsUlZKMzZKVHRqR3hRa21ZMjRwVTd5?=
 =?utf-8?B?NlVnMGwxN1d1NndGVENpcEFrWk5qeWhXUyttRytGTGJxbXU1WklOQmU5d1NV?=
 =?utf-8?B?L1lvdHdPWFpFdjdiMHo1ZE1pL0VEL2lxQVNNSCt2b2VZR0tvL21hRG81MGVz?=
 =?utf-8?B?MHIrUXd5RDVtd3pyZUNTNjdpSlB4cFFORVpVUWFtazRVcEVVL0dlUkN5cENK?=
 =?utf-8?B?VWc5Mk9kY0pZR1Q2WW16UUVsZktCZmFmdkNGYVFRZDRsSzdERXk1ekhseXha?=
 =?utf-8?B?RmZSZkdmeXhWeTRicWQrbFBoeFBBVHpSV2VkaDJMSlVGdHJtdDV2b2F5Qnlj?=
 =?utf-8?B?WExnTXo5d0ZBdU9aTVZsODVTbkc3QjdRNklvMmZqQTdwYjRQQkpSeW1nb05E?=
 =?utf-8?B?RUQzZ0pYOHlZY0lUaGVhcW9jTklGTVB4R2J1OVNWYW50UnQ4SmEwZlRUZHlH?=
 =?utf-8?B?aEZBVWt2MnZ5VFRPZWxsaVljVDhWanpqWnlsUllXSzVYOHY2NEd5cnZjQmxq?=
 =?utf-8?B?eVNaNGRlYzZTVVFLNUkvMXBEeVRQbXE2U0VoV0xCZ0lkWDBOaUxNcGJZWlg0?=
 =?utf-8?B?emdDK0d1OGZFMm5mRzBtSjdVam13ODNYaUdBNDNWaUpxNzAzUUllU1B4RVNZ?=
 =?utf-8?B?WFBkNzZWb3RCRVdtcUZPa1JaYUJmUlp0RWVCQkVyQnB1UUFxeFNSZEFhZ1pH?=
 =?utf-8?B?dzUyYUdHZUsxL2liZnFMMFZYNHR2S0RzOVlRSStlRi9WTVBvWjgzWFQ2SHo1?=
 =?utf-8?B?STgxSzlyOHJnRnRpTWlhb3B6SHZYSmRudmpYT1pGai80L1B5Q0dEaVdtVS83?=
 =?utf-8?B?emVyd2o5WGp3ZWc1Zms3d2lyM25XclJwM01WeDJRaXUrNlVUZithMzJDdVJq?=
 =?utf-8?Q?waJth9IQwxoAYAeq2gkGeIxi+yUAG1/r4nLD6+t?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e2f651-4dd9-4d27-bfaf-08d8ce65467e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:16:04.4864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IS6saJvIMmA0ZEYFAsmsP95/n9QOSespiUALoJ9iocoat14/LRULDreCmIvKo/itZ9C/hZgmW1FDkPeG70WsLvL5vuCg6b3JVzi02sWeG6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_031608_886815_4863CAF0 
X-CRM114-Status: GOOD (  29.77  )
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
Cc: Reto Schneider <reto.schneider@husqvarnagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10.02.21 18:00, Reto Schneider wrote:
> From: Reto Schneider <reto.schneider@husqvarnagroup.com>
> 
> The relevant changes to the already existing GD5F1GQ4UExxG support has
> been determined by consulting the GigaDevice product change notice
> AN-0392-10, version 1.0 from November 30, 2020.
> 
> As the overlaps are huge, variable names have been generalized
> accordingly.
> 
> Apart form the lowered ECC strength (4 instead of 8 bits per 512 bytes),

         ^ from

> the new device ID, and the extra quad IO dummy byte, no changes had to
> be taken into account.
> 
> New hardware features are not supported, namely:
>   - Power on reset
>   - Unique ID
>   - Double transfer rate (DTR)
>   - Parameter page
>   - Random data quad IO
> 
> The inverted semantic of the "driver strength" register bits, defaulting
> to 100% instead of 50% for the Q5 devices, got ignored as the driver has
> never touched them anyway.
> 
> The no longer supported "read from cache during block erase"
> functionality I do not know how to reflect.

I don't think the SPI NAND core allows reading the cache while erase is 
in progress anyway, so this should be fine.

> 
> Implementation has been tested on MediaTek MT7688 based GARDENA smart
> Gateways using both, GigaDevice GD5F1GQ5UEYIG and GD5F1GQ4UBYIG.
> 
> Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>

You should change the subject prefix of this patch to: "mtd: spinand: 
gigadevice:"

Apart from the typo and the subject:

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>   drivers/mtd/nand/spi/gigadevice.c | 69 +++++++++++++++++++++++++++----
>   1 file changed, 60 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
> index 33c67403c4aa..1dd1c5898093 100644
> --- a/drivers/mtd/nand/spi/gigadevice.c
> +++ b/drivers/mtd/nand/spi/gigadevice.c
> @@ -13,7 +13,10 @@
>   #define GD5FXGQ4XA_STATUS_ECC_1_7_BITFLIPS	(1 << 4)
>   #define GD5FXGQ4XA_STATUS_ECC_8_BITFLIPS	(3 << 4)
>   
> -#define GD5FXGQ4UEXXG_REG_STATUS2		0xf0
> +#define GD5FXGQ5XE_STATUS_ECC_1_4_BITFLIPS	(1 << 4)
> +#define GD5FXGQ5XE_STATUS_ECC_4_BITFLIPS	(3 << 4)
> +
> +#define GD5FXGQXXEXXG_REG_STATUS2		0xf0
>   
>   #define GD5FXGQ4UXFXXG_STATUS_ECC_MASK		(7 << 4)
>   #define GD5FXGQ4UXFXXG_STATUS_ECC_NO_BITFLIPS	(0 << 4)
> @@ -102,7 +105,7 @@ static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
>   	return -EINVAL;
>   }
>   
> -static int gd5fxgq4_variant2_ooblayout_ecc(struct mtd_info *mtd, int section,
> +static int gd5fxgqx_variant2_ooblayout_ecc(struct mtd_info *mtd, int section,
>   				       struct mtd_oob_region *region)
>   {
>   	if (section)
> @@ -114,7 +117,7 @@ static int gd5fxgq4_variant2_ooblayout_ecc(struct mtd_info *mtd, int section,
>   	return 0;
>   }
>   
> -static int gd5fxgq4_variant2_ooblayout_free(struct mtd_info *mtd, int section,
> +static int gd5fxgqx_variant2_ooblayout_free(struct mtd_info *mtd, int section,
>   					struct mtd_oob_region *region)
>   {
>   	if (section)
> @@ -127,9 +130,10 @@ static int gd5fxgq4_variant2_ooblayout_free(struct mtd_info *mtd, int section,
>   	return 0;
>   }
>   
> -static const struct mtd_ooblayout_ops gd5fxgq4_variant2_ooblayout = {
> -	.ecc = gd5fxgq4_variant2_ooblayout_ecc,
> -	.free = gd5fxgq4_variant2_ooblayout_free,
> +/* Valid for Q4/Q5 and Q6 (untested) devices */
> +static const struct mtd_ooblayout_ops gd5fxgqx_variant2_ooblayout = {
> +	.ecc = gd5fxgqx_variant2_ooblayout_ecc,
> +	.free = gd5fxgqx_variant2_ooblayout_free,
>   };
>   
>   static int gd5fxgq4xc_ooblayout_256_ecc(struct mtd_info *mtd, int section,
> @@ -165,7 +169,7 @@ static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
>   					u8 status)
>   {
>   	u8 status2;
> -	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQ4UEXXG_REG_STATUS2,
> +	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQXXEXXG_REG_STATUS2,
>   						      &status2);
>   	int ret;
>   
> @@ -203,6 +207,43 @@ static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
>   	return -EINVAL;
>   }
>   
> +static int gd5fxgq5xexxg_ecc_get_status(struct spinand_device *spinand,
> +					u8 status)
> +{
> +	u8 status2;
> +	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(GD5FXGQXXEXXG_REG_STATUS2,
> +						      &status2);
> +	int ret;
> +
> +	switch (status & STATUS_ECC_MASK) {
> +	case STATUS_ECC_NO_BITFLIPS:
> +		return 0;
> +
> +	case GD5FXGQ5XE_STATUS_ECC_1_4_BITFLIPS:
> +		/*
> +		 * Read status2 register to determine a more fine grained
> +		 * bit error status
> +		 */
> +		ret = spi_mem_exec_op(spinand->spimem, &op);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * 1 ... 4 bits are flipped (and corrected)
> +		 */
> +		/* bits sorted this way (1...0): ECCSE1, ECCSE0 */
> +		return ((status2 & STATUS_ECC_MASK) >> 4) + 1;
> +
> +	case STATUS_ECC_UNCOR_ERROR:
> +		return -EBADMSG;
> +
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>   static int gd5fxgq4ufxxg_ecc_get_status(struct spinand_device *spinand,
>   					u8 status)
>   {
> @@ -282,7 +323,7 @@ static const struct spinand_info gigadevice_spinand_table[] = {
>   					      &write_cache_variants,
>   					      &update_cache_variants),
>   		     SPINAND_HAS_QE_BIT,
> -		     SPINAND_ECCINFO(&gd5fxgq4_variant2_ooblayout,
> +		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
>   				     gd5fxgq4uexxg_ecc_get_status)),
>   	SPINAND_INFO("GD5F1GQ4UFxxG",
>   		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE, 0xb1, 0x48),
> @@ -292,8 +333,18 @@ static const struct spinand_info gigadevice_spinand_table[] = {
>   					      &write_cache_variants,
>   					      &update_cache_variants),
>   		     SPINAND_HAS_QE_BIT,
> -		     SPINAND_ECCINFO(&gd5fxgq4_variant2_ooblayout,
> +		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
>   				     gd5fxgq4ufxxg_ecc_get_status)),
> +	SPINAND_INFO("GD5F1GQ5UExxG",
> +		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x51),
> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
> +		     NAND_ECCREQ(4, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> +					      &write_cache_variants,
> +					      &update_cache_variants),
> +		     SPINAND_HAS_QE_BIT,
> +		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
> +				     gd5fxgq5xexxg_ecc_get_status)),
>   };
>   
>   static const struct spinand_manufacturer_ops gigadevice_spinand_manuf_ops = {
> 
> base-commit: 92bf22614b21a2706f4993b278017e437f7785b3
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
