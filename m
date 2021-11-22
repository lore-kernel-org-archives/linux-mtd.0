Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF158C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 07:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	From:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKRq9cqDyNhw0AzqA2d3Few5IRjWL3hkdYK3lVfeDBM=; b=1uhVLYWluNuRuh
	iEBUpMVcOoC8KSo+SFGpNeM37hgT3p7jtLMidcmTeUtbK+mr9lP1O2Mz2vjowHg17Pk0/G9SWVpNb
	ETaZRz4YT5c+Lrfq5PyzkhWexLNZc62MkiaJqgpo7k6cMvYVVKffu8TgpvmZV26zzAHn/3Ajv9b6t
	v+D/g04BZvpabiVV1DO/XoI5LUycKAuwkHZgBtR+ZYJhnw2GauidAu5jCFoCm62k9KxIyzY3hK9K1
	qdtEdk09CTMEArNoWhBr2GxW2ZIcZEp1M8zjO63cedUBuGaa5DDPblaoYv0JtNFMEOZJw3UZ1CVOs
	+g6fVOIsKQ4Nw1wN4bcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp3Q5-00F2pE-UG; Mon, 22 Nov 2021 07:07:18 +0000
Received: from mail-vi1eur05on2111.outbound.protection.outlook.com
 ([40.107.21.111] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp3Q3-00F2nK-8c
 for linux-mtd@lists.infradead.org; Mon, 22 Nov 2021 07:07:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScekTNleOnJcESw+vyL0mCC7cDxk9sZ7MNXVHWmTXkRD/KIWN4dcyfYufpVeFjoZsCYyH8bJwKXBMiI3imEFZu4Jqn8hWnbGCKyP1w297A0EX+fU/GUiFrRXtr1UOUO/DwSBBsX0BELvaYe4CWUidu7GuRC52qYmBilfjB9PyIzg/r0u11+mN8gM0qbALSz1tm6iA1gQlg08eHM5UfJnUse65p+3+olfh1ZoepiZJ4iiKD/yW/QfDp6e/vTpUSr7mMP4zGEmnrazlCn+e+BwoU59axb9O86qWnxkU8gIarPsto0McLnAsEt9SnqNG/NvLmkipEz2I8YvlqWELtoiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXBHtlWd3iMMVVoyidzwf3rTgMpSJukEFZHADZmP72g=;
 b=TK1/+c+DvD+B2KYF7ANxViUpy/iKPkE4hkFmCQwp01NSYFlq6kr3/NzXdmqzEJGE/V3XR/LXNEv8KXHe2MzS/wLZD2e3O4YYLiYZYJ474NK85PiLoOr7G7zR2Pw80navi2IiYowtafI6YfTyeZfe/+JEtYx+vzrT27JuLT/BP+dNK7r0okIV3maWqjESCpPofbLVfZW/PMEMuyhI2FL6JKyfax/Sfhy0wQXOmMqYIcpeP6oa4LYX1vu6BY72wOMc6Uneq+ilyAbr3VmwlKyRexBLtUVTN6wBa0mBDURi+NFrBvC3CvbIPcs3Ui0a+bXiteAGPO/OMIwL+Ni4NkDuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXBHtlWd3iMMVVoyidzwf3rTgMpSJukEFZHADZmP72g=;
 b=AD32lbjdfZHk7Yn3DEL+/G836foBMxAMAcb6kvn69EDpUYvNnclNUmaDfsUKhcgdP8xpRzs3UGKOZmdOC6iCwEWUovDiNrlU5gIC6TlR5W+MVIhE4PsTZ/LXsBt2rYUQ+nHEowj52pYetejlkO3RDkyMdm7vu18DcWQ72rgPntY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com (2603:10a6:208:6e::15)
 by AM4PR07MB3092.eurprd07.prod.outlook.com (2603:10a6:205:7::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.14; Mon, 22 Nov
 2021 07:07:09 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::555c:9e12:7c:f52f]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::555c:9e12:7c:f52f%7]) with mapi id 15.20.4734.017; Mon, 22 Nov 2021
 07:07:09 +0000
Message-ID: <1e133bc6-5edb-c4ce-ad44-3de77048acf2@nokia.com>
Date: Mon, 22 Nov 2021 08:06:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] mtd: spi-nor: mt25qu: Ignore 6th ID byte
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
References: <20211119080402.20262-1-alexander.sverdlin@nokia.com>
 <9a158e2ef6635212c1e353590e3b773b@walle.cc>
In-Reply-To: <9a158e2ef6635212c1e353590e3b773b@walle.cc>
X-ClientProxiedBy: MAXPR0101CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::28) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
Received: from [0.0.0.0] (131.228.32.166) by
 MAXPR0101CA0042.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Mon, 22 Nov 2021 07:07:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 629a0ef2-2d8b-4c36-721e-08d9ad86b31e
X-MS-TrafficTypeDiagnostic: AM4PR07MB3092:
X-Microsoft-Antispam-PRVS: <AM4PR07MB30927F36CAF0D17387AFF81F889F9@AM4PR07MB3092.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1wD31QxT4PzOD/bWStBYRBdYoNAVUhrDXYOxmKxpOUOHX71BfujmE5Ro/KdsRaqccgqeMS7+UKqSwNVyTA5cyGl9VY4rX5rSx7IIcRXzAS8VHo8ZlO9SnK8UwI8q+yA7A4JDveFVLDdeBKlczi6MR8dYht0RxmdIDnrRH2lFQaKZSeTJcmutJR/VKRAkX1DoujWhL5023pEh6MUul6C/iEg2zDoQE3HHqRK49tpNGBDc7NMDoGQlLNW1zyToTeBSYf8fJ4v5cm7m1xInvobr+2K2ol+lc5xSP1Iw754Mts1//LbYZKeJFNKzjiWp85WDWfhoZqdYJYKyT5B43YGbo1Mz7be8Sb9D8/t9VIrVzZBYWpi4dHptcob7oepsRvKhHYYsZFOd//S17WHJ0fJcxFtt1SClzLfmfDzKT7VdxD6aHt3l0/IVsRb78kzgXzguFqgDInxzTShoGOtPXcCbyqwdd3ERrM2W8+A2bI8Zb2n3VsEscUlF8fhP6PdJDwtASQ5SGNAt76sFCHFOcUvpxEvvaIJ1hXV4hvYQ+HrJgZIOO8sgJhV4iPskvmg2fqqg5UFiN2VpGM69q+yaJTs7bYVoIFpD8vPvCmCbzcYTlTQjOoXr33yUP4UhbsA9oFHB6ggko5N8ayqpFzGNcn7u+9I1gjBYze+mGFIRPsJO+5a7jB4sGl3wvMs/EZL1FrOqMVnD3/y5g6ITibF/dK9a2dKQjKClzv6/sLxemtZFXCfAeOw/4jbmu/5081QplYrfrDcruvZ0jr0Kk00qBbApCJvb5axSR6Ofp/sVAAT625172PPHP4Kf0krMRwpJ9UtIlrbY/NNajuauS8zBf7Yf/e5btsHBnIeWdbOKmqq+fqXC9w9zfxGXh1Q6LPJEwX1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR07MB4531.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(36756003)(38100700002)(316002)(8936002)(53546011)(966005)(38350700002)(508600001)(16576012)(31696002)(956004)(26005)(6666004)(52116002)(6916009)(83380400001)(2906002)(6706004)(66556008)(5660300002)(44832011)(2616005)(66476007)(66946007)(82960400001)(86362001)(186003)(4326008)(31686004)(54906003)(6486002)(78286007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0lqVjNYYm14SnR4bFlTOTNwRytsNFN2dDNLYTFRdTNqRlZsNGFuMTRPMXVq?=
 =?utf-8?B?OXpLMkVCMjQ4WktRMkZpWmtCcDJaZXd2OWZ4OEhOUTZydCtXMGo0dk9tcVBE?=
 =?utf-8?B?Z21Sb1hnVHhGVWduUUVMQjhqZEZlbWczUTZCYUtJWVY0RDI4ZHBXTytsQlR1?=
 =?utf-8?B?NklONDVIbVlUeUhpNDBna3RuR0F1SEF0UUVBeFNTSEppYTlBUHJZUE81QnNY?=
 =?utf-8?B?NUkrOE5XeXlaeWFwSldsSStnV2twSnFGQ2RTU095dUt4eE4zN214TXFqRmhy?=
 =?utf-8?B?RmFZTGhIMkQ5dzRFNVBweEpQNFNCYzV6b0xXd3hHMTFuVFJnRzhieWpleGwy?=
 =?utf-8?B?bkNwSEZpdWpzaXZYSjVkaVF1S2VIN0FUZnlGS3lLRHVvNXVwUWR6bThzcCty?=
 =?utf-8?B?U3VqWDh5UnlwNHlqclpqdzZwcVlJTENUb0FOT2ExZmI1LzA3cnNUYWZHZXVN?=
 =?utf-8?B?emJVTEdKcnkxeVFxdkhDQkhYS09EcXl4WDBqbDQ0bHlFZzlFejdjdjlWNnA3?=
 =?utf-8?B?OU5QVENET0pySE1hd2JlMTh3bUxERzZCbThpT3Q5QWJ4Z2cxU3UybDlIbkcr?=
 =?utf-8?B?NEtxZjRzT0hlMldVMWlYd081SU1GVDNFQ1lmR3VkalYvVHVOakZDUng5bVk5?=
 =?utf-8?B?azdkQVJ0aHBYL3dpNzBiaXExblBucGF3S0VKOWh3LzJlWExjTTc5T0pwOWta?=
 =?utf-8?B?VXJ3L2ROdnNKTEQxUG1xaFBIbkF2aFhZckYyNkxoNHlTQnVMZHV1dG5YMXJi?=
 =?utf-8?B?b0h0RDAwUXl5TGVEZ0hqenp3a3Y2dUZyUlp3RlVoOC9YVml5TUZZYVV3RzZX?=
 =?utf-8?B?MThxR0I3Q3FCOTZGQmgxRzNNcFVLb0RYRkdYWDBCOXJ4YWNudjc5WldhejFL?=
 =?utf-8?B?ckZYUHhMK3Y5VlRxbk0zOW13cVRTWFFZZGtsL0JPdGF0eDVMZitVcWp2RHp4?=
 =?utf-8?B?bjVFdzNDcmxBTWtZVnFrNjZaTlR4dWdqcms4dDNnMW9hNE9OS0VvOHRkYmVJ?=
 =?utf-8?B?L0I2RTJLcjYveVZOVThrTS9XN0dmOXNRcThrQ0pQSFFwek5LL2xGK3JETlNt?=
 =?utf-8?B?NWVLZExrWEN3ZFBFY1FRMGNOcHJJWUovMmVlK0FQM09BeE1uL0p6RlVVajJL?=
 =?utf-8?B?anhrTzZNSjZSb3pYWXZwc1RtWTVDUjYvNmRGblNpUzlUdE5nZ3ZYNXFSazhZ?=
 =?utf-8?B?MkJJaTN0cVpKZGFiclFKcVhreFNjeFJxRTlJNkw4VGVmakIwcU5nZUVjeFlZ?=
 =?utf-8?B?VDBrQnNpdjZ3aDg2M0ozRjIrbEgySW42ZjRtTG1zOEY4Zy9FRWJ0dkdNd3hE?=
 =?utf-8?B?bzFFVWh4aU5hQUZaOGhTWjlheHBDdGxOZEkrc0IxSTI4dkRFaTdYKzFtSnNQ?=
 =?utf-8?B?RVdrWHBmenlIWjNmOUthM1FmUmh2cEdETENtVmgxMlNqR1hFenV4MDhVdWhN?=
 =?utf-8?B?WUZ6VjdGV1czZ1ZmcTRNU1g2YmpFOVpXS2U4b0w2YUtmbUx5dnR2UmU3eE1S?=
 =?utf-8?B?cU1rY2IxRG93QStGNVlXeHN6VkxTVkdpM2c1UmpUY3dpM3Vtb1pMcFR5ZURW?=
 =?utf-8?B?Q3M1WUJjV3BKY3dSbW1XWU41UnhjU2lqdmNxSTEra2djSk5NOWFqMk1UblJ5?=
 =?utf-8?B?cU43ajNqQmF0RmJ5MHc0b3JqQ1VJTTJWd1pjNHpUNDBWMjZMMi9ncU5rbzlu?=
 =?utf-8?B?ZzF6OWdYY1dvUGU0WTd5WnNJWjljeTBQalFDOXNnV09acFF1dmM0bTdtTURR?=
 =?utf-8?B?YU55WWN6ZWlwTnNhd2NNUGhpeXJ4ZVRpWExZYURSMkRVeU45WnRreW0yUHJS?=
 =?utf-8?B?TWRYSlZqMkNiakRlRUkwS25PVCtxYlpNb0JpU08yTTNTcUtVemEyVDhnMDl0?=
 =?utf-8?B?QVMyQzFSMzJWNUxBaHBQY2FxT2lvd1NNVTlPV0F3OWEzb0wxWCtpMTZSQ3dK?=
 =?utf-8?B?SkhwUjZ3cUVrV3phdkZ4Yzlad29HWVVLS0d4TG1pcHRaUE5yOHBoV0JRVkl6?=
 =?utf-8?B?ZDk4VFVIdkFpdTRkTmdaTFNmM1VLK1c4Y1NOT1d0b1J3SCtCc3RLakhOaWt2?=
 =?utf-8?B?NVRpbis3Q0tJU29iOXRiaDVtalhZRmk4bitSNmVXK3ZGZXorZEd2cEVWaFNm?=
 =?utf-8?B?Z1pkaFBsWVNXaU5zTzlrMmZva01yN1htRVF2ZGlhdFpYQytoU0xEWkYzTDNo?=
 =?utf-8?B?c29SMVBHenc4eDZqSm03Q2FPTTlKR0t0U09nTkZGMGw1bW9GRGxEbFQrWnRX?=
 =?utf-8?Q?7cKogPpvA4O4T8vO27XD7OovLw8oAZeUnZdKKnHhd0=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629a0ef2-2d8b-4c36-721e-08d9ad86b31e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 07:07:09.4904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vq4ZeznAeXMXYfPyE6gZuTDvHftAIUi7UtdmWu0Dnc8Y0c4W7UthVG/CteSn9B5GbZump2WqrVc0v4fbXRT7UdVkVy06SMEIipOKtR/PIzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR07MB3092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_230715_338398_A242F529 
X-CRM114-Status: GOOD (  16.85  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkhCgpPbiAxOS8xMS8yMDIxIDIyOjE5LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBJZ25vcmUg
NnRoIElEIGJ5dGUsIHNlY3VyZSB2ZXJzaW9uIG9mIG10MjVxdTI1NmEgaGFzIDB4NzMgYXMgNnRo
IGJ5dGUuCj4gCj4gV2hhdCBpcyB0aGUgc2VjdXJlIHZlcnNpb24/IFdoYXQgaXMgdGhlIGRpZmZl
cmVuY2U/IERvIHlvdSBoYXZlIHNvbWUKPiBsaW5rcyB0byBkYXRhc2hlZXRzIGZvciBib3RoPwoK
Rm9yIGluc3RhbmNlOgpodHRwczovL3d3dy5taWNyb24uY29tL3Byb2R1Y3RzL25vci1mbGFzaC9z
ZXJpYWwtbm9yLWZsYXNoL3BhcnQtY2F0YWxvZy9tdDI1cXUyNTZhYmExZXc3LTBzaXQKaHR0cHM6
Ly9tZWRpYS13d3cubWljcm9uLmNvbS8tL21lZGlhL2NsaWVudC9nbG9iYWwvZG9jdW1lbnRzL3By
b2R1Y3RzL2RhdGEtc2hlZXQvbm9yLWZsYXNoL3NlcmlhbC1ub3IvbXQyNXEvZGllLXJldi1hL210
MjVxX3FsanNfdV8yNTZfYWJhXzAucGRmP3Jldj01OTQwNzkyMzRjMWI0OTY0OTZiMDYyYzIxY2Ux
NjJkNgoKaHR0cHM6Ly93d3cubWljcm9uLmNvbS9wcm9kdWN0cy9ub3ItZmxhc2gvc2VyaWFsLW5v
ci1mbGFzaC9wYXJ0LWNhdGFsb2cvbXQyNXF1MjU2YWJhOGUxMi0xc2l0Cmh0dHBzOi8vbWVkaWEt
d3d3Lm1pY3Jvbi5jb20vLS9tZWRpYS9jbGllbnQvZ2xvYmFsL2RvY3VtZW50cy9wcm9kdWN0cy9k
YXRhLXNoZWV0L25vci1mbGFzaC9zZXJpYWwtbm9yL210MjVxL2RpZS1yZXYtYS9tdDI1cV9xbGpz
X3VfMjU2X2FiYV8wLnBkZj9yZXY9NTk0MDc5MjM0YzFiNDk2NDk2YjA2MmMyMWNlMTYyZDYKCkJ1
dCB0aGUgZGlmZmVyZW5jZXMgYXJlIGluICJNVDI1USBTZWN1cml0eSBBZGRlbmR1bSI6CiJUaGUg
YWRkaXRpb25hbCBwcm90ZWN0aW9uIGZlYXR1cmVzIGF2YWlsYWJsZSBvbiB0aGUgc2VjdXJlIE1U
MjVRIGRldmljZSBpbmNsdWRlIGEKbG9jayBzdGF0dXMgcmVnaXN0ZXIgYml0LCB0b3AvYm90dG9t
IGJsb2NrIGFkZHJlc3MgcHJvdGVjdGlvbiBsb2NrLCB2b2xhdGlsZQpjb25maWd1cmF0aW9uIGxv
Y2sgcmVnaXN0ZXIgYXQgcG93ZXIgdXAsIHByb3RlY3Rpb24gbWFuYWdlbWVudCByZWdpc3RlciBs
b2NrLAphbmQgYSBub252b2xhdGlsZSBjb25maWd1cmF0aW9uIGxvY2sgcmVnaXN0ZXIuIgpUaGlz
IGlzIG9ubHkgYXZhaWxhYmxlIHVuZGVyIE5EQSBmcm9tIE1pY3Jvbi4KCkhvd2V2ZXIgYXMgbG9u
ZyBhcyBvbmUgZG9lc24ndCB1c2UgdGhlc2Ugc2VjdXJpdHkgZmVhdHVyZXMsIGl0IGFwcGVhcnMg
Y29tcGF0aWJsZSB3aXRoCm5vbi1zZWN1cmUgdmVyc2lvbi4gVGhhdCdzIHdoeSBqdXN0IGlnbm9y
aW5nIHRoZSBub24tc3RhbmRhcmQgY29uZmlndXJhdGlvbiBhbGxvd3MKdG8gc3VwcG9ydCBpdC4K
IAo+IEFsc28gcGxlYXNlIHByb3ZpZGUgdGhlIFNGRFAgZGF0YSBmb3IgdGhpcyBmbGFzaCwgc2Vl
IFsxXS4KCnNmZHA6CjUzNDY0NDUwMDYwMTAxZmYwMDA2MDExMDMwMDAwMGZmODQwMDAxMDI4MDAw
MDBmZmZmZmZmZmZmZmZmZgpmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZlNTIw
ZmJmZmZmZmZmZjBmMjllYjI3NmIKMjczYjI3YmJmZmZmZmZmZmZmZmYyN2JiZmZmZjI5ZWIwYzIw
MTBkODBmNTIwMDAwMjQ0YTk5MDA4YjhlCjAzZDRhYzAxMjczODdhNzU3YTc1ZmJiZGQ1NWM0YTBm
ODJmZjgxYmQzZDM2ZmZmZmZmZmZmZmZmZmZmZgpmZmZmZmZmZmZmZmZmZmZmZmZlN2ZmZmYyMWRj
ZmZmZgoKbWQ1c3VtOgo1ZWE3MzgyMTZmNjhjOWY5ODk4N2JiMzcyNTY5OWEzMgoKamVkZWNfaWQ6
CjIwYmIxOTEwNDQKCnBhcnRuYW1lOgptdDI1cXUyNTZhCgptYW51ZmFjdHVyZXI6CnN0CgooQnV0
IGxhc3QgMyBkbyBub3QgbWFrZSBzZW5zZSB0byBtZSwgYXMgdGhleSBjb21lIGZyb20gdGhlIHRh
YmxlIEkgbW9kaWZ5LApub3QgZnJvbSB0aGUgY2hpcCBpdHNlbGYpLiBGdXJ0aGVyLCBJIGRvbid0
IGhhdmUgNTEyTWJpdCBjaGlwIHRvIHByb3ZpZGUKU0ZEUCBmb3IgaXQuCgo+IFsxXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvNzAzOGYwMzdkZTNlMjI0MDE2ZDI2OTMyNDUxNzQw
MGRAd2FsbGUuY2MvCj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8
YWxleGFuZGVyLnN2ZXJkbGluQG5va2lhLmNvbT4KPj4gLS0tCj4+IMKgZHJpdmVycy9tdGQvc3Bp
LW5vci9taWNyb24tc3QuYyB8IDEyICsrKysrKy0tLS0tLQo+PiDCoDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9zcGktbm9yL21pY3Jvbi1zdC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3Qu
Ywo+PiBpbmRleCBmM2QxOWI3Li41MDlhNzMyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL21pY3Jvbi1zdC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0
LmMKPj4gQEAgLTE1NSw5ICsxNTUsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8g
c3RfcGFydHNbXSA9IHsKPj4gwqDCoMKgwqAgeyAibjI1cTI1NmEiLMKgwqDCoCBJTkZPKDB4MjBi
YTE5LCAwLCA2NCAqIDEwMjQswqAgNTEyLCBTRUNUXzRLIHwKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFVTRV9GU1IgfCBTUElfTk9SX0RVQUxfUkVBRCB8Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElfTk9SX1FVQURfUkVBRCkgfSwKPj4g
LcKgwqDCoCB7ICJtdDI1cXUyNTZhIizCoCBJTkZPNigweDIwYmIxOSwgMHgxMDQ0MDAsIDY0ICog
MTAyNCzCoCA1MTIsCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0VD
VF80SyB8IFVTRV9GU1IgfCBTUElfTk9SX0RVQUxfUkVBRCB8Cj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgU1BJX05PUl9RVUFEX1JFQUQgfCBTUElfTk9SXzRCX09QQ09E
RVMpIH0sCj4+ICvCoMKgwqAgeyAibXQyNXF1MjU2YSIswqAgSU5GTygweDIwYmIxOSwgMHgxMDQ0
LCA2NCAqIDEwMjQswqAgNTEyLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBTRUNUXzRLIHwgVVNFX0ZTUiB8IFNQSV9OT1JfRFVBTF9SRUFEIHwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1BJX05PUl9RVUFEX1JFQUQgfCBTUElfTk9SXzRCX09Q
Q09ERVMpIH0sCj4+IMKgwqDCoMKgIHsgIm4yNXEyNTZheDEiLMKgIElORk8oMHgyMGJiMTksIDAs
IDY0ICogMTAyNCzCoCA1MTIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBTRUNUXzRLIHwgVVNFX0ZTUiB8IFNQSV9OT1JfUVVBRF9SRUFEKSB9LAo+PiDCoMKgwqDCoCB7
ICJtdDI1cWw1MTJhIizCoCBJTkZPNigweDIwYmEyMCwgMHgxMDQ0MDAsIDY0ICogMTAyNCwgMTAy
NCwKPj4gQEAgLTE2Nyw5ICsxNjcsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8g
c3RfcGFydHNbXSA9IHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNF
Q1RfNEsgfCBVU0VfRlNSIHwgU1BJX05PUl9RVUFEX1JFQUQgfAo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFTX1RCIHwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNQSV9OT1JfNEJJVF9CUCB8
IFNQSV9OT1JfQlAzX1NSX0JJVDYpIH0sCj4+IC3CoMKgwqAgeyAibXQyNXF1NTEyYSIswqAgSU5G
TzYoMHgyMGJiMjAsIDB4MTA0NDAwLCA2NCAqIDEwMjQsIDEwMjQsCj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU0VDVF80SyB8IFVTRV9GU1IgfCBTUElfTk9SX0RVQUxf
UkVBRCB8Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1BJX05PUl9R
VUFEX1JFQUQgfCBTUElfTk9SXzRCX09QQ09ERVMpIH0sCj4+ICvCoMKgwqAgeyAibXQyNXF1NTEy
YSIswqAgSU5GTygweDIwYmIyMCwgMHgxMDQ0LCA2NCAqIDEwMjQsIDEwMjQsCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNFQ1RfNEsgfCBVU0VfRlNSIHwgU1BJX05PUl9E
VUFMX1JFQUQgfAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElfTk9S
X1FVQURfUkVBRCB8IFNQSV9OT1JfNEJfT1BDT0RFUykgfSwKPj4gwqDCoMKgwqAgeyAibjI1cTUx
MmEiLMKgwqDCoCBJTkZPKDB4MjBiYjIwLCAwLCA2NCAqIDEwMjQsIDEwMjQsCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTRUNUXzRLIHwgVVNFX0ZTUiB8IFNQSV9OT1Jf
UVVBRF9SRUFEIHwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNQSV9O
T1JfSEFTX0xPQ0sgfCBTUElfTk9SX0hBU19UQiB8CgotLSAKQmVzdCByZWdhcmRzLApBbGV4YW5k
ZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
