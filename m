Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C0EE7C6FC
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Feb 2026 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+fWmPv+e7wn+YR0/nW2Q3avBJUNAnu4dtw7T88cPH0k=; b=WOBbpB8ybrShv0
	tyubt6jfc3XNBkYVIh2MAqWvsAftdHA5BqdEUo1290jzDgJyaltC8FivM3hkCJuHvBAZh73os2qia
	Sh8xkVNzCcc8UlgVCzdLUabMy9Cfxn+0ZJvyHgB9jqMM89HZh8SYlJM3kbWp0cYdypWdShaeG111q
	Qskmemh3+T7gKOdQ8ohLcHvp0V8tQZQYAdGGiisU9+s/4RrNQleGuNWYtBJ70RmdH/c8v+xYuKm0S
	ZHQB8vHE7LG8uDoh/QAVJi59O6+OhAaaG03oqvH3gkjkQcwufusWkXy0ZOiSp2xBQWUS8nVM4nJXu
	JnhG/zQHKjDWHz1wg6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmUFg-00000003PS2-3Zt4;
	Sun, 01 Feb 2026 10:00:20 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmUFd-00000003PRh-1wDk
	for linux-mtd@lists.infradead.org;
	Sun, 01 Feb 2026 10:00:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlBh7MHR4wr5X1Wl49ptWk+hV2noYwIRSwlwf+LIUxsUP34TIEp2/UC3RFzO2Km9JFUFkQSl4OUrtlAHUDeaCn86aeobZSTDsCgHPmsFZ4LLwB3bqRi/2CDYEqQ8GQ7uhkF6bLrJOOYepXdbUCjyNEQ6Z7ycuQb0R3GNZps8/PhjAylaXcE/zapaFLV+/YwCW1vtinI3Splmh9AYffPfJP8d+bb5Mc8e3t2aF7zzaZwYjkb3M+Ir/gkZSmSJq+ilQtFDC1lBEpVrduW7Idwa8QYnWgbEHEwsO2DU8z8proK7wC7qCgObbqp3SVYP89oUolTOE05asuZlSTeh8x5s/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehooxAoprSXeNqw78s0bcKggDE343aaJyhQWjuQWmJo=;
 b=eCFXG4DEI9eUdJq/JlVWd2Vfh49oyIvjDuA9PwCGest/Ep65mcRHsK5i/vh9CwJBD/726s48nSs1aMB6eGSj1QqjoYl8zEm4FESgkOXKbP+1WWw8G+hVsnOolTBMKRZ2sfJT5aKcpFkSXVMhSZR4VHDTdQXWCENgO1EdK0ZtSjQTsHWK0NcqvRrSc64aLUiPp8Ke8uku6zc1nbt3KdL2O7DUYv/pzYsk3fJBwE5NwJiY37MnbJA7annm7Lr84rm/74Ptk0Vu0LXsUyfhs5AldZQZd51RjxL2q99cysJCdug+YaaPpivcPpIrmY/fSY8IcsbocsDvK4tFhvwsdERXtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nod.at smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehooxAoprSXeNqw78s0bcKggDE343aaJyhQWjuQWmJo=;
 b=JgnmTRwdnEAUZgyz7451H6RKaRc7p5/pzPsQ9EYl0VujdU1LADEUZgJERftXRyD/iqCgFFFhYxA+QO2uLA8iQAwkXGHhlLV0vILlJ9jiqQeZ0EX1tphZpcnnTYKxgBy0ZteK6aKJqbTV7LGnOKs1BtgdEqbmKlI21AKG4cy8OrQ=
Received: from SN7PR04CA0153.namprd04.prod.outlook.com (2603:10b6:806:125::8)
 by CY8PR10MB7266.namprd10.prod.outlook.com (2603:10b6:930:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Sun, 1 Feb
 2026 10:00:11 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:125:cafe::f5) by SN7PR04CA0153.outlook.office365.com
 (2603:10b6:806:125::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Sun,
 1 Feb 2026 09:59:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Sun, 1 Feb 2026 10:00:08 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 1 Feb
 2026 04:00:06 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 1 Feb
 2026 04:00:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 1 Feb 2026 04:00:05 -0600
Received: from [10.249.142.58] ([10.249.142.58])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 611A02iG345347;
	Sun, 1 Feb 2026 04:00:03 -0600
Message-ID: <d7e637be-0489-44f0-b5ab-86eb55484fde@ti.com>
Date: Sun, 1 Feb 2026 15:29:59 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v1 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
To: Miquel Raynal <miquel.raynal@bootlin.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Richard
 Weinberger" <richard@nod.at>
References: <20260124005203.3167280-1-andriy.shevchenko@linux.intel.com>
 <aXQak2FKyQpdQW2M@smile.fi.intel.com> <87ldhgl1lg.fsf@bootlin.com>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <87ldhgl1lg.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|CY8PR10MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c91fc57-62e3-4eff-8ba3-08de6178aec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QitpSWhoRER4MHZpbnlZaVNVeGRHb3ZrRElUeTk0VUdtTTlRUUFTUFlDQlRW?=
 =?utf-8?B?LzZYWG0vaEFmT3RTVVl3b1RocnZZaExiTGVHOG1rUGRlRjhJa29ybWpuRXFV?=
 =?utf-8?B?bEFjbnRqNGNza0x2QnAwREhreFp5UjduRGJrL1Jmelh2TENRUmF6TjJGRkF3?=
 =?utf-8?B?WDFCWHNUZ1h0VEg0enQ4WVM3M2dzcFRjYlZ5b0VseUFQSDczdjFtWDlaQ25K?=
 =?utf-8?B?NGxlbUozT1lmT3ZXUUx6U09ibUtqdHZTcVpWRFlLL2c0am5uTTV1NTlqdEMy?=
 =?utf-8?B?Y29UVk1CaXY5Tnh4OEJsNlNFazkwMG5Tc3hnNTkrVmNyazNqaFFCRkhIU2li?=
 =?utf-8?B?NW40Nm9RUnE4ajJRODRrZjN2REFmTFNmRXVFRWJzNStTQk1CenNnam0rQ3p2?=
 =?utf-8?B?d3ZwdG9YTmFWNllUcEE2cFFvSXdIcHNVTEJyUUI4VlJhN2lFMVNYWGczOTVC?=
 =?utf-8?B?a0pHazFseWttbkN6bkdtanRFcExCd1FDZk1CQkJkQ1V2UllpVTF1NHBQK0pp?=
 =?utf-8?B?bWNzVzM3dms5aXZFUXp2eWlaTWV3UmszOWV0UGcvSWtaRHBpUkNUbXZqUlVR?=
 =?utf-8?B?c2p4UzFBeGJmYWtlQ01oVUNPWkMrczlFQnFHZ3IrY0dZNzZrZDhtTWwwdTJo?=
 =?utf-8?B?VzVnd05BRlI2UTVLTkFBNmh2Q01mRWYyakxXOVo4R0lrV3NtWnQrNzlZaGdK?=
 =?utf-8?B?KzFVeHZCa2FPb0grTnRmYW9nb2RwNDN6cC90SEJoNWxHUjFNTFZ6cGVkaVFl?=
 =?utf-8?B?eUE0VjV4OE0zL3NQSzZ6K3pPNXVPZllKY2QrOFEwVDdFWGs2UFhCYTVHMWk4?=
 =?utf-8?B?K3B6S0dZbkx0Rmw4UlBTV0VwV0hMeDFqU2R2eHllUmxvcHAxUVF6Z3VSOER2?=
 =?utf-8?B?eWt1dkt1bTFSL1NSbGxKOWVLRDhZU0FHQ1R4M1c4SzVYLzIxak5qT1V5bEdK?=
 =?utf-8?B?L0xhbEgra0NJZ1AybXRtdWJkckUyMlkvQU8xUVRSU2JGNW1GNVVwUTRZOE1n?=
 =?utf-8?B?eTFTZmJVVFE1eXBxVWg4Yk91NXpiSUM3K1B2Ry9UQXVXWWN0ZUFkZDVZN1lT?=
 =?utf-8?B?clR5M1NLL2ZTRGNNS0lLME5wT0RaSDdzZW14V1dGZjV6ajQydFppZ1pUSkFP?=
 =?utf-8?B?S0NiWGtlRWNqREphZVljL0tBVHY5NnRPdzFCcU5UaE9LNWVwc3dWaVRWZ2Va?=
 =?utf-8?B?UVBNdW9FS3VqN2hQWGorS2M1ZytoVzVBN0UwWUFoa0w1R21WU0phNUg0UDV3?=
 =?utf-8?B?MWIvVkcwVkJBTFdZd0wyYlZ3cHcwTUw1aStFdTJpNmhKYlhiZ09ZRzRFQ0pF?=
 =?utf-8?B?eWh1aStxcUE3NVpUSTVKY3NkY0IwdDE0MWJKblZBQ3AvczRqeFhtLzREYUZC?=
 =?utf-8?B?TjEydHdra1UxVitEeCtKU2NuRDQ2R1U4QWFXRXVvQjQ1RjJEY2o0NlpnbmRt?=
 =?utf-8?B?RUQ2Z1piWjgvVWx3ZXpmaDZkR1pXem42YjRnRk1ETlhjQUQ2b1dxNlhPekNt?=
 =?utf-8?B?TVhCMGc4eFNISGZERlRseGlick9GNHVORE9IM3Z2RUYyL0cvK3F4a1dwS0xp?=
 =?utf-8?B?TWhYV0krbGwvNDJhMUlCWmp3TkV6UHgzSjd4TXQzcS9Mc2haOHZJK0JldXl1?=
 =?utf-8?B?VjRSNHlGbkNsL1NLUk45Vk41WC9iVjl5a3o2bzdudjljWXgzSFZNb25IWkl5?=
 =?utf-8?B?Y3g2c216TFVhVWovNGxSOHN0eTZvQ2pUVU1HUFgyanYwcklyWXJ1T2Mxbk9a?=
 =?utf-8?B?WWxQVnVHZXg2R3dOZDhlNlk4UVNlMzN1Rk9sVzRLZWxHaU90R0hsTXk4OWZL?=
 =?utf-8?B?MzNpYzE1M1VhMWhoanNIemNLMUtDV1NXOWlKNVBYTm5rbnN5RnRJSDczUnhx?=
 =?utf-8?B?RGhxVTIwNmZ5azlaWms0U1YyVjFpTURmV3VybDN3clR1cVV6Q1ZCbEVvZHdX?=
 =?utf-8?B?dzgxSXJ4TW5La3IvTUhjdS92b1lncXF1dGlvYUZtL2tLNy9jYklIQS9nY1Bn?=
 =?utf-8?B?RWR3NS9WcjhGZG5GUlFhWFBZQ1FaMTAyQjFtWUNaYlM2OTd2S2VpTnJaR1BN?=
 =?utf-8?B?OGFoUnltdTkrUjNFelRwa3ZTUWdVL3FJMTFDUDQxVTlzcGMwdFl3djVDeDZj?=
 =?utf-8?B?bkJxVGdrRi9PMUgzakE4NUZhTGsyeGN1Ym54MkFXamhSek9zOW8vSGtNb2Jk?=
 =?utf-8?B?YU9ZbGV3VUFqcEl5ajFvalRmcGZabHB1UEx4TElUVlpYdnpZTGxFYkZIVFNv?=
 =?utf-8?B?TllsWFkvYjY5VHlZbGd1aTUwbWp3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p7ns4Q7ZXKsQxgXu55q+bArzVrE8RmIPqjGsYgMcO7DD8sRSKLtawH0sAC5Ju/NngZr871nb8gMLMgof3cA7zixrxLejC0LeCkU490OXrN+YEjIhk6fJhdDeCJb8pnBpsYQE2KBO2QJs9+5KutgW+40jYrm2ZxzMUDDueDTXCoFBklSucY1lO8wcVvP4jJJW/CJ4my2jr0Vi9q65qmsKDlgKtm1NI3l2rJQtgChDCYocqZyWZnbtrgQQdgZ+qmfmM3GLyJMYFXRP2lSuYKTVf7ahUWFzn4UkGcKJkAVSMqKkFXN4J3kihLOpg7lU+2pSOeytXv2hXYugvjnoIie/op9BeGxRWvBfoi3Tz5y4nPcYhVt47cKHeFzwRU8+PsnZSRPXcLot6528UuD/xwC0QnB5yUONFAZz9daZu5zVsLo7Pjgsc48aA6OjWI6YAXH4
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2026 10:00:08.8600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c91fc57-62e3-4eff-8ba3-08de6178aec5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_020017_718020_C7B4FF35 
X-CRM114-Status: GOOD (  11.10  )
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

Hi,

On 1/29/2026 11:53 PM, Miquel Raynal wrote:
> Hi Andy,
> 
>>> Fix this by factoring out do_write_buffer_locked().
>>
>> ...
>>
>>>  	XIP_INVAL_CACHED_RANGE(map, initial_adr, initial_len);
>>>  	ENABLE_VPP(map);
>>
>> It seems more logical to leave these two in the original call.
>>
>> ...
> 
> [...]
> 
>>> +	DISABLE_VPP(map);
>>
>> Otherwise this will seem dangling here.
>>
>>>  	put_chip(map, chip, cmd_adr);
>>>  	mutex_unlock(&chip->mutex);
>>>  	return ret;
>>
>> ...
>>
>> Another approach is to leave goto as is in the _locked() and move DISABLE_VPP()
>> there.
>>
>> Tell me what do you prefer?
> 
> While I also find more logical to keep the ENABLE_VPP/DISABLE_VPP
> together, I do not mind to see them in one side or the other. I would by
> default let them in the main caller and suffi the inner function with
> "_locked()" as you did, but I'm fine either ways.
> 

Keeping ENABLE_VPP/DISABLE_VPP together along with _locked() suffix for
inner function is cleaner to read.

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
