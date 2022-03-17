Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98587C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 13:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=p9hLXVrpxcDbCZK+ka8y9haj6VeTYeODHe4YfBXnhDg=; b=Vrizw+KzRphfsZhAxZ6y/LK9Z2
	7K8BKGJacENrPzs0fzlQQv5+kZy8e3QNNOyVyLQfKcBv3RpbSQTtUqutEAlrrNaGm63rY21DNf/1u
	nmGnNsjhIkiOUW9FJleVDuk1qCft4SZoKNOUMWrc30tkF3bT+WxDPVTsQhIJ/m/f5PqJlGAZkgTj4
	w1BvW+QnZj2qrwJ1DZyn02U7m5Rlkx9wg7ymnxcoBRhBIShPgyMGW3x4RUWnQa3yZorLdFhmeWe6n
	jJNNJ2p3XXMTWXEirbvuZ8uOZwlnDZl98wkCAUtVnxQZNvi7TZNFe2uuMN8ULfj5MN4RedgfI055e
	m8BdlgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUq7p-00GFbr-8C; Thu, 17 Mar 2022 13:25:09 +0000
Received: from mail-am5eur02on0714.outbound.protection.outlook.com
 ([2a01:111:f400:fe07::714]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUq7l-00GFZp-LX
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 13:25:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7R1Bxz6P+21C8LvNzQjdj8gdLJceWv5uLOHdxwPQQPsDaU/x+Co1PUUdYOQKN6jMZ+sg5Rj0mBZc7wlB/MaqHckKHdRxir0BdBLd2+UtgAyeWMsmWyoTqV+izCyFc3ljLSL3ba6Tf9l1r0VrwtI9UMUQt0rBPwBVkPDr8aXoEEtDy1VSyW1q9/a4GRViN8Xhudzr7Qjk7VJym72j18uYG0xQ3RW6ZhIJrguJ2VQ0i6Kq/ajMLDTirjz+KPJ3UzuDhEaNhWOr0AcX4Cjhap9aeLugQKIbT9L2yX+CNX6fN/Fgd+FV9ww0YkrtzdarZFPyZTwHIn0jEPrWcOVWnm7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bc46R0B/BJDuX61y4lE4YEQFrpZ0LzFgyEjPS1KKRiI=;
 b=RsbP9ryIOBFn+Eh/YRRGrepwe35e/yE+EJFYxV+0LZsiuZw2+rj+i9FUAqwv9QgTC2FGwO2ZiKkOlN8dTtdG/rGgWusy5Oy8XXktQ/0py8CCuI5beI++k1un0kZDqHOc4gS1z8cDN5ftn08UaRqTbkpufP/9mJBYPcV60houKQw3S4C8Vi+dfHWgiGF+906+STul1Aizs56DYhDDx53CAsHPRSNU0hmOvLHxEeq26FH4CTn6qfn7c7gXluDJDh/FE6HZRdohkp8SXjgjhTtfApmQo2wcn/e/Jitn3kERFqeqBchw/nACwudDAKZFO8KcSt9EX0zWeqYgllLNefqUqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bc46R0B/BJDuX61y4lE4YEQFrpZ0LzFgyEjPS1KKRiI=;
 b=DuzS+ClMleQrWv6eZpbggTjfYcpZX1GKkiLL7cxNml9hXwHF879IfbU/6rh19FWV8T1EzzB+S1WSpMGAAhxg0fvo5aII/xAbILOcYMTENqSt2/VduxwPLMsUD8NgJw8nVAEme2KJGjNptvlDVJECiMii1x0/BFKyZ+sPfFASWMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM6PR10MB2968.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:d6::31)
 by AM0PR10MB3043.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:161::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Thu, 17 Mar
 2022 13:25:00 +0000
Received: from AM6PR10MB2968.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a42d:4509:43b0:a366]) by AM6PR10MB2968.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a42d:4509:43b0:a366%5]) with mapi id 15.20.5061.028; Thu, 17 Mar 2022
 13:25:00 +0000
Message-ID: <05831c2f-668f-1386-2ba6-4ce623b50d49@kontron.de>
Date: Thu, 17 Mar 2022 14:24:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [EXT] [PATCH] mtd: mxs_nand: default to legacy bch and rename to
 modern bch option
Content-Language: en-US
To: Stefano Babic <sbabic@denx.de>, Sean Nyekjaer <sean@geanix.com>
Cc: peng.fan@nxp.com, ye.li@nxp.com, alice.guo@nxp.com, sjg@chromium.org,
 seanga2@gmail.com, u-boot@lists.denx.de, miquel.raynal@bootlin.com,
 linux-mtd <linux-mtd@lists.infradead.org>, "han.xu" <han.xu@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Tim Harvey <tharvey@gateworks.com>,
 dl-uboot-imx <uboot-imx@nxp.com>
References: <20210510100043.449294-1-sean@geanix.com>
 <20210511024926.t6kunesknbwe7k2x@umbrella>
 <a33cac1f-7988-08ea-7d9d-c9b76b80cc3e@geanix.com>
 <20210513200242.fxvfvwgua35hbqvr@umbrella>
 <edd64777-ff6a-82fd-63bb-7b2f31f63f44@geanix.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <edd64777-ff6a-82fd-63bb-7b2f31f63f44@geanix.com>
X-ClientProxiedBy: AM0PR10CA0082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::35) To AM6PR10MB2968.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:d6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bbb4401-9a40-4de8-c9c3-08da0819896b
X-MS-TrafficTypeDiagnostic: AM0PR10MB3043:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB30438C0AE8524AFF0BFC490EE9129@AM0PR10MB3043.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k9SC4/99WFg+QQlA6ruvcKFrhTqEi9CQAsAhR0vEwQpC3NxH6m88CgIMiLbzbSyuBCghkic8QVYUb/lki4nmGkjjK358mKSCBcVoJLe/llHw45uLX+Wi6dH1SHoth9RKzwd8rmOcAB0Jo+bUFzqClHl1y+WMqdzwy5PrAr+dFCiyZEd9t+Wmt7ly+85NH+79V8LEYLuLl1W/teiQVBHjZ54DnV7xQyCciMAsaVo6Ur4uBDYvDKH7ZnldXc9VQNmMHAQj6togN78amgacSpubLYjw7YxE0/vwooyrE5gEy56fL8C+Ow5u9xEZpqxsgYpZ8juAewuXib4lVYde1ae3ykU+dR3e9jRKEFAXKQLWd/Oj8XwkxfeZXht9dKMSJw2Ca7SrQJXNESZ97+zI08kQPmTZZwxbVj4oY6/x2vSSFcp1psOzgTIOMA5EEX8fCvi2L0n4Gm/WT4ynw9IAjve12vFpUlfA3EnmirOLrEFlTNHgJMAeMKqS8dF15MXSdcxpuWPgDX67ODtMFhZMDaVNMQ1VDSvDJQW0ZrTocmOG2/O6uocRcF08NwrugZNQLe4+S/QTUv6Y5bz2swmgHpE3vkHUPN6I11L7CifFwDIRiDX1RFA8D8f6UqeJ2hrpbY1AFs3zOQZWvOqWzJhaUnwQYm0GLWAPCdckwjMYTZAkq8ihH7HJfx/nP+ptw3y5AvIwZkV+HJYo2LXQ+JkyCwkLvhC4MVqIDdPULJA3zC7xyWf2ur1eYvQ5gBzkemfq1MhzAOQ/jYZar24+6jEfmpeWnLEQwB/MvnhftA39pSeiU/v/r5ZWVzAhcrTC4pRZQwUV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR10MB2968.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(5660300002)(4326008)(8676002)(86362001)(6486002)(2616005)(66476007)(66556008)(31686004)(66946007)(7416002)(36756003)(8936002)(966005)(83380400001)(44832011)(186003)(26005)(45080400002)(38100700002)(6506007)(508600001)(6512007)(2906002)(110136005)(54906003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFNWZHArTEhrQ2N4bEZ6ZVRMcjBpNTF0QWQzeUhFSHI0VXdIeU0wVUFGVlRv?=
 =?utf-8?B?MXV2VDVUY056VE16ai82ekN5em9QR1pIR1RjcXRHbWlSRkprNVJqNU4vR3F6?=
 =?utf-8?B?dXg4TVFMNk9kem5OL3dGbFpUQUllM0JFc29BUGtTcVBWZEUrWXYrZVhFOU0y?=
 =?utf-8?B?T29mUHk2RU15NFZNUTB1KzRjbTVtWlVqeTdZQVJOOHIxdnJpVHg2aGhoNkRs?=
 =?utf-8?B?VUJlNkhjZmVlb0hOd2VZOW12Mm9oWVl0MjlSQmJpcUNCQ0ttVVlnKzFGU0Jv?=
 =?utf-8?B?dGFkdC84UGtqQmxxQ01NbGtXbDFRZFFQczR4OHpCdmM4bW9sRkxxSzhUOHdU?=
 =?utf-8?B?WmhkNHhLV0ZwN3lRYkpGNkpVdkZURFFXWkhPbWxkczhTdThPSG1OQU9zSnQ2?=
 =?utf-8?B?VkdDaUh0VnczQkIwc3F2WDVkU3hRMWR0YmlEWWRYcEYwb1hYQ0R3UVFnNGJy?=
 =?utf-8?B?WVlqSk1QQkhVTGs4YmE0WkhOUW9BdWhJWlR4NGtCR0FVSm1mbTlLR0pLbDd2?=
 =?utf-8?B?U08rT2lDV3FXcmlIMGc0WGNwb1lTWlg4UGRQMkhWb0tycGN6UXVZNVMvZkpN?=
 =?utf-8?B?bnUra2hRcE1tSGw4TVkxc0FiVnIxTHRWUWNBdXpSclhYUXNnci9WYWM4Yjdq?=
 =?utf-8?B?MlFpeXBvMHlNeVgzRGJNcHZyYVk4cThnVWkyQktuWVJzLzFsRy9YQjVRWXlT?=
 =?utf-8?B?b2hCcmZaSnpLdjZ0R0o4OHlKYmgzcFd0TU5iVEhjcTA2M1htK0trQSs2YXcy?=
 =?utf-8?B?eEF3ZGZudWtTangvUFhBZDJZNzluWmhlMUVaU0NyQVdkcHJLbWU4VnJmMTg0?=
 =?utf-8?B?NkpBRVE5a0JOendsTHczcE8zMU9VdHlTMDZPdWJRb1MrK1lYNlR3LytPV29V?=
 =?utf-8?B?Skg0Wkt5czVhZmZ1cEZSK2FROXJ1UU5Ca2QzamRBVmFkMHNrZWZEQW0zQlgz?=
 =?utf-8?B?UkNHMjBZNFRvZkIzZTlENTEzSlB1b2xXcWYyNmVLSDNxekh1WFFoOEVPdUdI?=
 =?utf-8?B?Z3ZqWk9heE8wY1lxNGpObWtMSXl5bzhLQjh4Nkh5d2laZVMvaDFaMmVHclVl?=
 =?utf-8?B?YVFmRHo3SlhCdlZQVmJhMjhvanlYSFpZUC9QTlZoUitQb1dMZG56eVNXQ1R6?=
 =?utf-8?B?RlRqQWxJc0NqbkpydSs0SzRqdmxmdVBwODJ3UWxuRjRrd2s3ZnkzTWRvakhG?=
 =?utf-8?B?MlBDUHVGZmZsRDNBaGk0ZjVCQ3dxUGVyYzNIcVVha3Y2Zk1tZ29hN0xuanVX?=
 =?utf-8?B?V0lhYUZCQjZOOUJUWm1qaEswOHlXR0hRdy9QeGwyRmphM1lzQW5Ja1owMDA0?=
 =?utf-8?B?a1RDOEQ0aElKN281Ukc0dGVLd1N2QW82ZUZMaUphTlF4NGhPM2g3eStpM1dv?=
 =?utf-8?B?TUwzZDh6L2ZFUW84OWVWNFZ4ekpyZ1FocFgyeVo1ZzZLV2YxclFYR0F2VW14?=
 =?utf-8?B?UUdyM0lKM2pMakxabEFPTW1OTVZId2NRMU1IRDVnc0J5K3pEZTc0V0VBUGN1?=
 =?utf-8?B?Y0ZoOU10cGxIS1hSa1dRaGJDVC85bVM3MnRqYXlEbE1kRjVldGVaVjhHQW5u?=
 =?utf-8?B?dy9IQzZZa1JOUzBhOEVyUEEydzlOa1ZoOFdBbGw1bVFGS05Ud3FKZG55eU5r?=
 =?utf-8?B?Tk5IYkJucENWdmZwMkwzUVdJZ01sMDlXRlg5czVoVHJDZlZMSHM2SGI0WlJC?=
 =?utf-8?B?cGVmSlMwQ3h2dHN6THpYUWNtNWIyckh5U1Y1aGtObnNQRlg1dU9GZm9aZlY3?=
 =?utf-8?B?dkxTZDdhQjVvL1pMcldtUURmaUUrM0I4OVY0MG5qQzhzdUsraC90NVZyaXFn?=
 =?utf-8?B?MU1GVHZ4ZmVYQlE2T3VDR0pDbVVlYlBka1N4VEdzRFc1OXJLdkdWbkRnQkR3?=
 =?utf-8?B?OVBZZ0QyeGo4RHJQSGg4OTNUSmlBVDhUMEZKcGd2bjBYaUpHZHBSaGs5cmlv?=
 =?utf-8?B?MStsUjFOWDU1dFErYWxKU3BBVzZ1VFFYSGZLazFlbFB3dWJwam5URm9RZTNu?=
 =?utf-8?B?VmN3cFZlQzNnPT0=?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbb4401-9a40-4de8-c9c3-08da0819896b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB2968.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 13:25:00.0499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Mo/ptBtrDjAFIr6j6ng3D4XNuZtktDW18+/BTyxdLGhi4Ct3yfSFkp6XAEkopH9RrqCVbrk4J5ZQ+53C4uOpgZVus7A8dfhJXzcLfh+f7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_062505_790042_A920C64E 
X-CRM114-Status: GOOD (  23.03  )
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

Hi Stefano,

this old patch was delegated to you in patchwork. If you're not the
correct maintainer to address, please let me know. As the NAND layer
seems to be unmaintained at the moment, I'm not sure whom to ask.

This patch fixes a regression that was introduced by 616f03dabacb ("
mtd: gpmi: change the BCH layout setting for large oob NAND") which
alters the BCH layout in a way that doesn't match with the
implementation in the Linux kernel.

This causes failures when loading an UBI image in U-Boot that was
flashed by Linux or vice versa (see [1]).

There has been an approach to fix this through an optional devicetree
property in 51cdf83eea ("mtd: gpmi: provide the option to use legacy bch
geometry"), but this is not acceptable. The "legacy" BCH layout
compatible with Linux should be used by default.

The approach to upstream the "new" layout to the kernel [2] seems to be
stalled and even if it would succeed, it would break systems that use an
old U-Boot and a new kernel, which is again not really acceptable in my
opinion.

For the reasons above I would like to ask U-Boot maintainers to pick up
this patch.

Thanks
Frieder

[1] https://lists.denx.de/pipermail/u-boot/2022-March/477828.html
[2]
https://patchwork.ozlabs.org/project/linux-mtd/patch/20210522205136.19465-2-han.xu@nxp.com/

Am 20.05.21 um 11:09 schrieb Sean Nyekjaer:
> On 13/05/2021 22.02, han.xu wrote:
>> On 21/05/11 07:08AM, Sean Nyekjaer wrote:
>>> Caution: EXT Email
>>>
>>> On 11/05/2021 04.49, han.xu wrote:
>>>> On 21/05/10 12:00PM, Sean Nyekjaer wrote:
>>>>> Caution: EXT Email
>>>>>
>>>>> Linux kernel defaults to use legacy bch setting, this was creating a
>>>>> mismatch between U-boot and Linux default settings.
>>>> Kernel uses the NAND chip specified minimum ecc strength and steps by default
>>>> not the legacy bch setting, unless users enable it in DT file.
>>>>
>>>
>>> Hi,
>>>
>>> Adding, mtd-list and Miquel
>>>
>>> With u-boot dtb:
>>> &gpmi {
>>>         pinctrl-names = "default";
>>>         pinctrl-0 = <&pinctrl_gpmi_nand1>;
>>>         compatible = "fsl,imx7d-gpmi-nand";
>>>         nand-on-flash-bbt;
>>>         status = "okay";
>>> };
>>>
>>> With linux dtb (mainline 5.10):
>>> &gpmi {
>>>         pinctrl-names = "default";
>>>         pinctrl-0 = <&pinctrl_gpmi_nand1>;
>>>         nand-on-flash-bbt;
>>>         status = "okay";
>>> };
>>>
>>> U-boot prior to commit 51cdf83eea selected 18 bit ECC, after that commit it selects 8 bits.
>>> With legacy option it selects 18.
>>> Linux is selecting 18 bits ;) So now we have a mismatch.
>>>
>>> I have been searching for the legacy option in the mainline kernel can't find it ;)
>>> Please show me where it is (is it in the NXP fork?)
>>
>> You are right, it's only fixed in NXP fork, with kernel driver modification. We
>> prefer the current u-boot bch geometry, so I will send out a kernel patch to
>> make them align.
>>
> Any progress on this?
> 
> I see your patch in:
> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsource.codeaurora.org%2Fexternal%2Fimx%2Flinux-imx%2Fcommit%2Fdrivers%2Fmtd%2Fnand%2Fraw%2Fgpmi-nand%3Fh%3Dimx_5.4.70_2.3.0%26id%3Dae980dccc6189956fab047958ad0a70ec4951439&amp;data=04%7C01%7Cfrieder.schrempf%40kontron.de%7C275b7f11361e4fd3eb7e08d91b6f0e45%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637570986066857865%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=L4xAN9HDl68dmA%2FX6nnP%2Buqh6CUKTQZJeFWja5EvmPI%3D&amp;reserved=0
> 
> But I can't find the option for selecting legacy mode in the devicetree...
> 
> /Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
