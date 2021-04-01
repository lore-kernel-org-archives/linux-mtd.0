Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3683DC43470
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 18:46:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5AF6606A5
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 18:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5AF6606A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:References:
	Cc:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zXxVt2agTMeBUo6gL/Et41KuO4+bKaZE8yxvb4UFzmY=; b=E+Z/TsnYHtP/LTdtJ6BQSneog
	D72kqZLJ7msiHOXkjALKzJimzAwrOnzivoKGuis3H8TAGAfUlkQbY3xUjaWYvCsRcUPo8UbuctzNo
	L7IjH52JrdUKvZUKqO2h0tyJsIyt3lFEZFfVPX6c0D32DKo9Mv9SHB/cwfLqINYPUbpHfoRp/CSNw
	zVilg0rL27D5igbv8t4Ox4GVcFEffXKjrLl0At65KB93hMvfXLYvq1MjchBxtDRKqA0SggbJyEbcZ
	678kck3acdxRmD7Ui/FwMk8GkEDkf5dLqOh7qrbljDk8NQwqRLBRsBHSVK8RyRj/KfEIAITyyP2df
	NNf7uoU8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS2JD-00Ajed-0s; Thu, 01 Apr 2021 18:44:47 +0000
Received: from mail-bn7nam10on2054.outbound.protection.outlook.com
 ([40.107.92.54] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS2J7-00AjdU-Qs
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 18:44:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2hMSuhAtRW6REkXhHeYccLAkjxI17jNCinSBM5a4IrPPigIx+bP08bNNe4fg72SaW6hGvSySdeI78SNSGP22i9n5px2nqfpij7ZaJTcPyf26sBnr7XYx08HJiSy2xhhJBxxrnzvmzPml5e1dny2tx3h6crr+cCE8owXB+Fz9h0Cd37CCEaw/NE7CYSSFOdV4o5HuWabmQkolU6MjJAGhHidTErPdwpSXofkwNka2VkPNliB+iFanoRQZMcT93oZdH4xoMzrptlzvUQBM9Ar4dODdkzFqzE4mue4kfX4pg0CApV+hQAhvNiGcM5F3Q3gNkQv1pfybN739EO16NnNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LxEOX+xV5YgzjKE1u6SMTsP+gJQeEyVuIRCz2KsZEI=;
 b=WRkNuxkUBsreyk30PXeoMFL43BtFsKSoIm2+zlRQbuVL8EwXqetrfSqYgKYFXQ3ZPihQhPR9VvkeLFtpmGQdDfojdhRJI6A2C5BnGNC/x0nDB6En1uYkLAzvIn4gkAWq+iffZn+8HIcRvWhSm02lSZo7UAHzllEq6+hgElAYgw3YqhdxXvl0xtKi3dm2N1OWIsGTfTAOSTnbwplzLPJuix0p4p+H9j7BQ9XUd9rRdr3hdpqrKhklFbhfERdBK/NluAb0zvj4BVIQ1KV0krX/ulLWouagg5ntVOt0uAXSp510NC27NvYp9Q0MvBURcteEIavdduqjkkyrS9UysEBaPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LxEOX+xV5YgzjKE1u6SMTsP+gJQeEyVuIRCz2KsZEI=;
 b=CJvU3wOgrF5h8OvKdeSDNSC4sVyECo4kHO1vx/AW2sPVrJOBn5UvN9lmJmKYMX+oPRAqxOK+RUUN7kpFWx3/T76LZV6zbJODWJvO4hTHGa9EBw2D+FD91woY/PO4aTpXgSKTvVAL5I/fjXrQDHqT3MWH8oS6qTZZqiJ9CSFQnCU=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 1 Apr
 2021 18:44:37 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d%2]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 18:44:36 +0000
From: "Yaliang.Wang" <Yaliang.Wang@windriver.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: uses CLSR command in
 S25FL{064|128|256}L chips
To: Pratyush Yadav <p.yadav@ti.com>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
References: <20210301142844.1089385-1-yaliang.wang@windriver.com>
 <20210301142844.1089385-2-yaliang.wang@windriver.com>
 <20210302111556.efrayf6h3u46j5t7@ti.com>
Message-ID: <019d5c84-cbda-41f9-f841-f0106e9e0ac7@windriver.com>
Date: Fri, 2 Apr 2021 02:44:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210302111556.efrayf6h3u46j5t7@ti.com>
Content-Language: en-US
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To SA0PR11MB4766.namprd11.prod.outlook.com
 (2603:10b6:806:92::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.176.190] (60.247.85.82) by
 HK2PR03CA0052.apcprd03.prod.outlook.com (2603:1096:202:17::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.8 via Frontend Transport; Thu, 1 Apr 2021 18:44:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02105599-7fec-4a45-db91-08d8f53e32e7
X-MS-TrafficTypeDiagnostic: SA2PR11MB4841:
X-Microsoft-Antispam-PRVS: <SA2PR11MB4841DBEA47EC0B238DB46DE79F7B9@SA2PR11MB4841.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ub56mwMeztCK6wb7naMk8VCS0tXDzWeuNokBQtl4GDFNC2qBTdTOHmgNPwtHGvpFmZka0Ad1OHPQpqvmuUOhzd1vB5hViARiuUQIcnAuUfCXkf60g23wD9fhvs+fSZWIPkygegMqIfH5g6qIpCy93EVHnDRGqan/3v7uvoz1jXkbcHwj7TkZhscDDbllKFDIE4saV1+sqLWWTz5ASRV4AcsdwhxSn0qVCs1MQnuNRdjztPjnWJK3QFl9bLPxS7i2EjaVqSFBamX/mCSr47Rz0CIG1zwr40ItF0/7RYufRuPbqQMBIGaXgVDTjMdg+RzkVAGWv8/jw0lJ7WWFeziQuwRm5l6LRFNgBuLjQH+QLgTvW5DFDwAjyXzkjHKw7qTh6p4/crUzDVs4UOmGLEMECOgH77UQ9LyMCDQMOcxilV+h4tX7n4Wlt8e2+cnsyGHu2Ynv4vYttrwhhZ8cAHxOcOCFgMw/iorwTql9utijoq95t28os/ZNNxe38Fz2rCuoGp97Ud10k3Fp9xldxU7oWEs5KRFm8DyLjiJP8nlfgsJyvFgrlZfl70zvugpFbv/90xxfRaou4y6ClkGcIvqIuXy+wYW/OLlCzRuqA/0B57DFoUmso2XOX7cXhcjhHf2seGztdxu7pJBVym0ZZC24svB8o1YrB92uC6AmVJ3zau82Drm1X2hk9YF65JqNJsPEEwoWUEDfI/rG6lAGoTuRZ7luWwR7q2Opt0PkfEkodLiD0K3aJChqlK+q+d5nhyxSUdURhx7On+gnbotsXn9vcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(366004)(396003)(376002)(346002)(38100700001)(66476007)(66946007)(66556008)(6706004)(6916009)(52116002)(16526019)(186003)(6666004)(31696002)(8676002)(6486002)(86362001)(36756003)(26005)(31686004)(478600001)(2616005)(956004)(5660300002)(16576012)(53546011)(316002)(4326008)(83380400001)(2906002)(8936002)(83133001)(78286007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djdqMjZUZHpmU3BLL3JRZzhkNUpuVzU4dlJNSDFia2Nwb1NzZCtiUUg3TDM0?=
 =?utf-8?B?UVBQQlhscWgyUnBCWm9UNzkvcmZOWnFxWEYxN0QvckUwWkkvZG5vUjJXOEhJ?=
 =?utf-8?B?dG5LR1BvMnZ5NVMrOW1ZbHdURW9sSjJKMTYzVExRWktIOHRNUHliMW5wRjh2?=
 =?utf-8?B?eVgxcXlUWHUxL0FnR3lDaUQ1djVVQ1JNZ2F0NWIxYjRacDlMUGlHYzY1cjFN?=
 =?utf-8?B?N1gwVDVhdmRPTUM5UTB1OFo5UGozTTJUWk5vK09zNHBDOE8xaGx5cU9uZGYv?=
 =?utf-8?B?Z2xtdzNHVktVWGdROERBV1FjK3BOcC9qQkJsZUMwaGdTNUdVTis3a3BuUEF6?=
 =?utf-8?B?N1M3eVV2UXNRVFpNUzZvWHRVVnE5UHFJMHF5TnlBVlNBTnN6MWUrYWk4cnAz?=
 =?utf-8?B?aHR2eGVmZmRvSU9NSys0U0wyaHJsZ3p5UmRNdGxjUy9KN0srMXZIT1ZQcDB6?=
 =?utf-8?B?VmtkMmYxNlF4d3lvM3dmVkVjUnBoRDdlZ2VhS05UeEkvRWdjRitFZHJCcDVl?=
 =?utf-8?B?STYxVXhVbTRNbnAwSElqSnRSQXRkM0dyZWRNMWVSQ09SRTE2QURhRUEvd2RC?=
 =?utf-8?B?UUhzbDA3V05mTWhsT0ZJRXVYOVZXUmRDWW9QcmN3enZVZXVjd0E3OWpzL013?=
 =?utf-8?B?RHJ0NkdIdGtxN3FQUTBiNTVpUVN3Zzh0YUx2WnJpOVU4aFFlOExZcHJYK0xG?=
 =?utf-8?B?V1NXalVzZktGZDBNVnJrUWZrMXhTSGh6dFRhNDJON1M1V2p6eVM5b2Y5aXZ3?=
 =?utf-8?B?ZHplVUF4OTViOWtldUhQMTlMOWx1MHVTSVBGYTdFRUI2QlBOMHVxN2pYRVpY?=
 =?utf-8?B?cUR2Rm1vSzVTeUdNeEduSVBqdDNHZEgramVJMG1UMzFWSWxCMFZtanpqWUtT?=
 =?utf-8?B?dFk2U2VNTHJCYnB0UWU2Y1RjMFJ5TU9qODA0Z1UyRU5JR0VMeDA1U3ZZWDg5?=
 =?utf-8?B?M1hjRkVVNkFYU2hKdktpSlBNYnB3bmJaNmRVS3YrSDdvNzk0a0huclpmeDNI?=
 =?utf-8?B?ekFYUVNHak83Vkt6YkFhLzlyU1Z1TEtxTm9tajBFeXcvSkZDNnQ1Ny9SNHdx?=
 =?utf-8?B?KzNrWDh4OFp2eGxaWEVnSTBQQVQyUmJvRjZ0U0hUSm9PNWhvL1E0ZjZuc0JX?=
 =?utf-8?B?Mm0yaUJ2OFlqV0NiSUd3dlB1SklEaWlyb0Z4cW9LWnBLaVNsV2l2QTdjcWg3?=
 =?utf-8?B?VlU5R0tjTDQ5Z3JUWjY4d1I5UmR5Qk5wMVA2SUhWbVRGeHpQMitjTkl1bmx2?=
 =?utf-8?B?bjMyR0tlQnBaRC96Q1EvczRaRFJSSGlQY0xvZGVXZDVqQndMdFhyNUh1dEJ1?=
 =?utf-8?B?TnNpM0RoSnlEcnpuMGpZU2NPc2xXcGtKNlQ2OG1lME9KNG1sK1B0cWZkb2pK?=
 =?utf-8?B?MXRnQ2p5cUtCQjIvY21rTC9iT0ViWVpYM291TDQ4a2gyZnNqUDM4b1UyVlMy?=
 =?utf-8?B?TlFsdjl2cDRTdDhRTGN5eXZ2bVZzVDZjYTlnWXlmU0FYaFY3dUtTeHg5d2x6?=
 =?utf-8?B?dXN6M0dxT001OHIxc0F2MVliTlpBVC8rRmhrRHo4Zk1SSTQwVWJPNnptM3dR?=
 =?utf-8?B?QnBRQUN4anRoSUtOai8xWHJaVDJFdDNFazNkdjZYOFdYU0pWYVBKOXpsRk5r?=
 =?utf-8?B?U2k2M0VjeWNKK0l6eXpIdE9nRTdYUFE5OFZCcUtGTXRQVEF0Q3lTeEJPK0gx?=
 =?utf-8?B?ZG5Kbml3VGp5Qnkvc0hVUjVUS3FaQlQySGxHUmx0Q005NGRYTEdPaUFjcFc4?=
 =?utf-8?Q?zU6m9cc53IOm4A3SzudnpQGGp3FHXALB1AWWmNh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02105599-7fec-4a45-db91-08d8f53e32e7
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 18:44:36.6367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkRkk7FEYGUUe8HBZJFiyGqq36DjHmV1PjvlyXR0VY3kQ2T+BQQjojN35j07ALJl4DRVIK+u5acMVQvnKnvjtSrGMLsm+ELx+ya+bud3uKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_194442_126731_9EA072FB 
X-CRM114-Status: GOOD (  34.58  )
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

Hi, Pratyush

Appreciate for your carefully review.

On 3/2/21 7:15 PM, Pratyush Yadav wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On 01/03/21 10:28PM,yaliang.wang@windriver.com  wrote:
>> From: Yaliang Wang<Yaliang.Wang@windriver.com>
>>
>> S25FL{064|128|256}L chips can't recover from errors when program error
>> or erase error occurs, P_ERR or E_ERR bit will be set to one, WIP bit
>> will remain set to one, A Clear Status Register command must be sent to
>> return the device to STANDBY state.
>>
>> First record of the can't recover error is in commit <c4b3eacc1dfe>
>> ("mtd: spi-nor: Recover from Spansion/Cypress errors"). The error has
>> been fixed by the commit, however, S25FL-L chips shifted P_ERR and E_ERR
>> bits from SR1 to SR2, which makes the previous fix no longer work.
>>
>> Signed-off-by: Yaliang Wang<Yaliang.Wang@windriver.com>
>> ---
>>   drivers/mtd/spi-nor/spansion.c | 96 ++++++++++++++++++++++++++++++++--
>>   1 file changed, 93 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 67619b64c148..4ed98cb969a5 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -19,7 +19,10 @@
>>   #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS  0
>>   #define SPINOR_OP_CYPRESS_RD_FAST            0xee
>>   #define SPINOR_OP_SPANSION_CLSR                      0x30
>> +#define SPINOR_OP_SPANSION_SR2                       0x07
>>
>> +#define S25FL_L_SR2_P_ERR BIT(5)
>> +#define S25FL_L_SR2_E_ERR BIT(6)
> Nitpick: Align the BIT() part with the lines above so it all looks nice.
>
>>   /**
>>    * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>>    * @nor:             pointer to a 'struct spi_nor'
>> @@ -203,6 +206,38 @@ static void spansion_clear_sr(struct spi_nor *nor)
>>                dev_dbg(nor->dev, "error %d clearing SR\n", ret);
>>   }
>>
>> +/**
>> + * spansion_read_sr2() - Read the Status Register 2 using the
>> + * SPINOR_OP_SPANSION_SR2 (07h) command.
>> + * @nor:     pointer to 'struct spi_nor'.
>> + * @sr2:     pointer to DMA-able buffer where the value of the
>> + *           Status Register 2 will be written.
>> + *
>> + * Return: 0 on success, -errno otherwise.
>> + */
>> +static int spansion_read_sr2(struct spi_nor *nor, u8 *sr2)
>> +{
>> +     int ret;
>> +
>> +     if (nor->spimem) {
>> +             struct spi_mem_op op =
>> +                     SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SPANSION_SR2, 1),
>> +                                SPI_MEM_OP_NO_ADDR,
>> +                                SPI_MEM_OP_NO_DUMMY,
>> +                                SPI_MEM_OP_DATA_IN(1, sr2, 1));
> The datasheet says that this command is not available in QPI mode. The
> flashes set SPI_NOR_QUAD_READ. So they will be put into QPI mode and
> will be unable to execute this, right? Why does this work then?
Didn't aware of that before, the correct opcode should be RDAR(0x65), 
will correct it in later patches.
>> +
>> +             ret = spi_mem_exec_op(nor->spimem, &op);
>> +     } else {
>> +             ret = nor->controller_ops->read_reg(nor, SPINOR_OP_SPANSION_SR2,
>> +                                                 sr2, 1);
>> +     }
>> +
>> +     if (ret)
>> +             dev_dbg(nor->dev, "error %d reading SR2\n", ret);
>> +
>> +     return ret;
>> +}
>> +
>>   /**
>>    * spansion_sr_ready() - Spansion specific method for querying the flash to
>>    * see if it is ready for new commands.
>> @@ -244,6 +279,55 @@ static int spansion_sr_ready(struct spi_nor *nor)
>>        return !(sr[0] & SR_WIP);
>>   }
>>
>> +/**
>> + * s25fl_l_sr_ready() - s25fl_l family specific method for querying the flash
>> + * to see if it is ready for new commands.
>> + * @nor:     pointer to 'struct spi_nor'.
>> + *
>> + * Return: 1 if ready, 0 if not ready, -errno on errors.
>> + */
>> +static int s25fl_l_sr_ready(struct spi_nor *nor)
>> +{
>> +     u8 *sr = nor->bouncebuf;
>> +     int ret;
>> +
>> +     ret = spi_nor_read_sr(nor, sr);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = spansion_read_sr2(nor, &sr[1]);
>> +     if (ret)
>> +             return ret;
> Since SR2 is only used when SNOR_F_USE_CLSR is set, only run
> spansion_read_sr2() when the flag is set to avoid running it for flashes
> that don't need it.
>
> On that note, since this function is called s25fl_l_sr_ready(), you
> already know this flash can use CLSR. So why even check for the flag at
> all?
You are right, the check can be eliminated.
>> +
>> +     if (nor->flags & SNOR_F_USE_CLSR &&
>> +                     sr[1] & (S25FL_L_SR2_E_ERR | S25FL_L_SR2_P_ERR)) {
> Align with open parenthesis.
>
>> +             if (sr[1] & S25FL_L_SR2_E_ERR)
>> +                     dev_err(nor->dev, "Erase Error occurred\n");
>> +             else
>> +                     dev_err(nor->dev, "Programming Error occurred\n");
>> +
>> +             spansion_clear_sr(nor);
>> +
>> +             /*
>> +              * WEL bit remains set to one when an erase or page program
>> +              * error occurs. Issue a Write Disable command to protect
>> +              * against inadvertent writes that can possibly corrupt the
>> +              * contents of the memory.
>> +              */
>> +             ret = spi_nor_write_disable(nor);
>> +             if (ret)
>> +                     return ret;
>> +
>> +             return -EIO;
>> +     }
>> +
>> +     return !(sr[0] & SR_WIP);
>> +}
>> +
>> +static struct spi_nor_fixups s25fl_l_fixups = {
>> +     .sr_ready = s25fl_l_sr_ready,
>> +};
>> +
>>   static int
>>   s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
>>                         const struct sfdp_parameter_header *bfpt_header,
>> @@ -331,13 +415,19 @@ static const struct flash_info spansion_parts[] = {
>>                             SECT_4K | SPI_NOR_DUAL_READ) },
>>        { "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128,
>>                             SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> -                          SPI_NOR_4B_OPCODES) },
>> +                          SPI_NOR_4B_OPCODES | USE_CLSR)
>> +             .fixups = &s25fl_l_fixups,
>> +     },
>>        { "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256,
>>                             SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> -                          SPI_NOR_4B_OPCODES) },
>> +                          SPI_NOR_4B_OPCODES | USE_CLSR)
>> +             .fixups = &s25fl_l_fixups,
>> +     },
>>        { "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
>>                             SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> -                          SPI_NOR_4B_OPCODES) },
>> +                          SPI_NOR_4B_OPCODES | USE_CLSR)
>> +             .fixups = &s25fl_l_fixups,
>> +     },
>>        { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
>>                              SPI_NOR_NO_ERASE) },
>>        { "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
Best Regards,
Yaliang

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
