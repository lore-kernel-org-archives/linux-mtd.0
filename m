Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC06C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 11:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk2jxKOfTCs7q4bdHvB/SpOZM+ZdQKbdnmPLsbz9uxU=; b=H56QRC1cm9OCyAZk3+8nI7P01X
	H3GMTJ7mhVtHEDUrujLliIXcVUYjAG3Vy8AXkPLSrAfHQz3ZqHA13roK+oRdMYTNAzJv/SJm1NoDo
	7kM469mxTKOnBGjEYi+umlFoivWrKPazlCQ6ZtThRBLIVMPcSIMkhxKqru2lBkoi3w2wGB0t4D//2
	FXjvnKFMHT+ulnEuR1SqxGRs/emLXSQ7Dgh/srrWrsWftDwGZcA4OQUq51GNSY0PbpPj1avEolK5J
	fPXskj4hs0Kyw8GLa2ilVZSfL1KdiVUgO0xOA5zxctXTP6tr9iP+f6JlAI4nQXD+cUZogwpu/wggn
	IqOhJ+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms1H6-004rMA-3G; Tue, 30 Nov 2021 11:26:16 +0000
Received: from mail-bn8nam11on2075.outbound.protection.outlook.com
 ([40.107.236.75] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms1H3-004rLH-EQ
 for linux-mtd@lists.infradead.org; Tue, 30 Nov 2021 11:26:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrEonCKcwtgHsX/FZTLhjKSis0bnVexIgv0o9eVRLBwlDoso28wt7uYQUHCvgQNuDpXdBQKOEiULRWfFiQ6DSzLIZsCto/fQ/gLu/Zvne0Y1vI/W1bGYzc4BgPprWWc+fg8gtau1COH3Tx2GKsObYl+Rgyhx0WFwZfrGuJXgTM9O1Y2Ra7vbB3MZJ9rX9sHcvfSyNW0vSJu4WJDdT++TwveFIKUWY1jr5Fya9kbAT5FGKcCoIZQi1hgTHD6/edcQbIboN7Un5gTkT/V2TNsGJGFI6d3I1svW6pSeRs5Gy4ZiOcATFrL8cEDirYbJ/pNm3dYOaAPj13dGebdvF7apWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axI6ltolPD44VaHPccfZvXpd9TEdhwvpHdS4J9WBDy0=;
 b=WK/QW9IWVswE2DBHr3BOM+de+Fr9g5jYCPe5f1jDKu0WC/tHEnlJQc/ltLVnpI9LOkkB2fA5g4Ot5EKquzXh/qZBVhlcUBxql4SOBJftVi0qGLDE3GhkBNHfCujRC11iYF1lCRMZoRdgJjpe24O9h7Kihusz8vrriMxcn67qzAWypby0OgOCeM0+791WL5GewDG3wlUv4RjMirdSUl8lgH+7QVDEO7rFCiHd2mqahaeeIRc7l6wFjpcVV6SkEEndp0sltL09hKimkz0xQC2ra7TtZ4Hc+2Pk9pNSJYEG2QxylF3WhZda5ipBvHmeSv6leVHPB9s/XfPhtN4JSYG4bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axI6ltolPD44VaHPccfZvXpd9TEdhwvpHdS4J9WBDy0=;
 b=NMXXhoaFgXw3kEsLjoCCMthJq6k35CJKngEPBUagfhm/4YThz9uHosWfFf7qV8v7riKm0/mPm4hnWEuEtQsrEMw3lNHhbmJlqymZtqX5uzKxGuL/l9NjkS43rU1hWqo+419oNJvHl/0FDnp58SypPEtxYKezLlkPexdWq/wfPH3L/kMGzOR2XFM/logrETtcFZpRMkFxaMEveLnYWibH5DTlld24MBylpJiH7TlxiDrABkjxP8BoCyX/Lih8PsnWaFBYVCcq3FJF8xUvZVsV7ODIBIirVAdY1hOM1Up8kxeNaev9U+r6+Om5IN6wnbfv7BcxTUoI5XOoPL0tJxD/ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CO6PR12MB5393.namprd12.prod.outlook.com (2603:10b6:5:356::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11; Tue, 30 Nov 2021 11:26:10 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ecac:528f:e36c:39d0%4]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 11:26:10 +0000
Subject: Re: [PATCH] mtd: dataflash: Add device-tree SPI IDs
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
References: <20211119183316.1329089-1-miquel.raynal@bootlin.com>
 <a799095a-e046-ae56-c2db-f527e199b5fb@nvidia.com>
 <20211130121110.6026f788@xps13>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <71994534-1c56-f5b4-c054-f643c409d131@nvidia.com>
Date: Tue, 30 Nov 2021 11:26:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211130121110.6026f788@xps13>
Content-Language: en-US
X-ClientProxiedBy: VI1PR0701CA0051.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::13) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
Received: from [10.26.49.14] (195.110.77.193) by
 VI1PR0701CA0051.eurprd07.prod.outlook.com (2603:10a6:800:5f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.7 via Frontend
 Transport; Tue, 30 Nov 2021 11:26:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9beae1d-7cc2-4904-fd4d-08d9b3f43587
X-MS-TrafficTypeDiagnostic: CO6PR12MB5393:
X-Microsoft-Antispam-PRVS: <CO6PR12MB539373CB345B56114E8895C1D9679@CO6PR12MB5393.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XaJetvj5P3tDtFb83nmP0O7XBh6Fd2qZLz4t7Iihrcm18MUW1cfzveef6LHwi4oX7tUTm2yGSL4UCxezHN9dd900L5lqy8eX+XhdcVU06RBYXwfEMJLyVKGTEB894qrw+Qi7M0Bovt6we3PpqiOvSHOZo3dHvii5Y9Pw1RUXQ5kVNDDGpvYRvC2FtlbYzE7HP0rGcf36LxSG9GQPaGZbuFuyHQGcGsgnc2zVGjas0ggg0s0OfnJPnhXjDwAAZ+aPja4Po1+ToGSsjUNnm+xeNoejcOngMcibjmo/cYKZUzIdgXbcyp35gMFgYyOkGX1IwU41QSLIB47KRC6PBuHwKvodrXO7m7UXXn6v1WM+eLtsO6o6C+2AsCi4r8HQuMmNXvpZWxB6IjzGld8kVVmOpQ0NhIot9c1aIt7YR3TZjovYOKVYssdlM81+y247HKiDNpxLYSkdMN/3uckD/dN20YpXbEPTNcL7guW0my8Xy6ulI2w9BcOR0RvHgpJzbUFAOI8RI5SwT1fNi9arkBccIOCdJqoZ0SX+3ZjK9S4fgK0P9UqOD+7rg9dJ+pzAtQuaTRZ9w9YLdwulZMGzrfQh5Hyehm/eAlGbwhLafbGWJs2rvl9WRp48XMsI1teO6i4AaotZRMwNOYHzMNBHMD47HdQb8OM9QRghdBOrHxtZyTglF0ILMUaikpllWvfxzUGvGjXNSFoYBr/HcOHRmHfUqVmhRt4mArzYpjOxx47Ed4gC+BLhR0Ul4OZjpAUrAHT+EdwsPr6Ht01+WdpH6FenYFLm9EnA7kRci0J6dy5g6ghe015gstAR2tH/mut1Pxve
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(508600001)(966005)(6486002)(4326008)(66556008)(36756003)(83380400001)(6916009)(8936002)(8676002)(66476007)(66946007)(31696002)(6666004)(2616005)(38100700002)(5660300002)(2906002)(53546011)(186003)(16576012)(956004)(31686004)(316002)(26005)(55236004)(54906003)(4001150100001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHhsTzY3M3lVQXZkaGdHNE5rUjVTZWMxWWFxanVJV0xYN2VIOWxkMis2ZldH?=
 =?utf-8?B?RGIzaUpISjlUYXFqZDcrU083YnhtTUVEK3poQ05NQ1lOL3BXV09mVUJ2Vk5G?=
 =?utf-8?B?dGJOUmx3c1hBcGcxMWJsK0hsenp0cExQNWlYUVJwNGk1OGYraHFERHJod2Nr?=
 =?utf-8?B?bEdDYlFrSFlmUVZxUHhhaEVHajloLzE2c3VUVENFTWRORHpZR003ZnZKaUZG?=
 =?utf-8?B?MTNqTnVzK2VCZGFTWUt5SkFhSVRRVFJiek1jT3NiQlFzOGl3Y2h0U1ZPUVRS?=
 =?utf-8?B?N2svWlJPSjRubHhmQm9lNU9DUkFoVjZCN05QWFl4U0pWanF6b2pmaWp1aW5r?=
 =?utf-8?B?OVk3SlI2WWhzTXYvSzRIbGU3T25RYlhkdkxFUWNMRVNzKzFOVzBvM3RsWXR4?=
 =?utf-8?B?aWNMWjN5Y2VqbnFKOE5QdGI5TksyS2RxN0N5MmlmOUVRM3lvSlRBT0czTEtD?=
 =?utf-8?B?VkNyUGxCV3hyQTkrWExId2IrVWpTV2x1UjYyVERIajhOdkJ6MmU5bU1RVGFy?=
 =?utf-8?B?RGN1R0xSR1g4cUxGbVpTMGM5RkJxV2RncDdoTTNSL1o5MGVMRE13bjVZaEhZ?=
 =?utf-8?B?WE9QWXFTdmErOEJYM2RiT0RDYkw2NTJvQ0k1cDZlQlRtZFNVQ3V1UHA1aWhD?=
 =?utf-8?B?OHdYY21nVHI2SG1zNHppNnBpU0xIN2JnTjM2T2hJTUVEWm52K3JFd0V2MTFH?=
 =?utf-8?B?SUo2M0UveGh3UzRZdml2cmQvVzQ5MTNlcndpbEszekVmeFRwTGJVZlFkSHhU?=
 =?utf-8?B?eGNHTm55QmxGY3NYREpQK3JUckxCSHJpMG5HVmlWVGtTUU82OWFzZ2Jrb2l4?=
 =?utf-8?B?WFM0a0lxeWdSenhKbVhVSjNWNzZ5Q0hJamE1MThGRVljZXJGN1YrOTNpWlVD?=
 =?utf-8?B?R0N1V1dSaDQ5VW9WZlIzTkJ0ZWd2TDJMZGh6ckhjbWNabHVxMEcyODE4SmZ2?=
 =?utf-8?B?djhpbjRoUmNrYzJTbHhiVmZXcDFwVEtTZ0tIMTAwdTV4NFIvQXhBMUd1M2pR?=
 =?utf-8?B?SllNNkp3STdlZTNJYmJxcWdMSVZzUWtkTGQzVEN0N3NJblVQR2pMbDZCS0ZP?=
 =?utf-8?B?MDk2aHFiV2J5YkM4UFZoRk9WcmhxS0tlYnBrSjAwK3pJQVhuZTNCTHp3a3px?=
 =?utf-8?B?ak1jNFY1SU1kY0lUTi90Vkp6Y09WS1lnV1VPM1VZNWFrZDg3K01VRHA5akVM?=
 =?utf-8?B?VTV6K1Y1NzUwemVwaU52TDNRTG1ISDhOQzBkc25QazljU0pYQXdiOGtSTEdY?=
 =?utf-8?B?MkpFL0xBbktRNS9LcUJaWVhyTGdJWGVoOTVCWTRvSU5RaitxTUhGVkplSmgx?=
 =?utf-8?B?RVRYSWRQbnp5ZUhMTXZzYWtNMWFtMktVL2xWbjdMU2dJNGNJWGhmYVJPbHBn?=
 =?utf-8?B?YlE2bmswM1pTOGRIMXJNVnk3Z3RUbWZuNnNsZEZYZDE0U0JWU28vZHBDY0pu?=
 =?utf-8?B?ZUptSUxpNm05bFZhQUYrYXVDa3pHVkRiRUdkSlBKTGFoWDk4OHY1bUhKNjJV?=
 =?utf-8?B?THByUlRDRXA0dlEzSnNCMXVLcEhDMXc0dWJjdUZKWGVWekpjc3lBUlk4czMy?=
 =?utf-8?B?VlBDSC9lNmNybXdaZFY5Yjg5Nlk5c0trYU5JZDM4ZUlRbW9jMnlWYnRIRDh2?=
 =?utf-8?B?c1d5cnA1WUJJd0FNelQvei8xN091VVRhV2JUaWNiS0QwTEJJK1poT3N3WlFU?=
 =?utf-8?B?WHk0bzRPN3IyeU5nVDM4S0NnVzVJNldlK1U3S2kyM0cyd3l6S1lUMjVXU2d6?=
 =?utf-8?B?S3ZFbXdlN09jbGxOWUZpRElkTlpYUmJwUXFFS1ZhVjdldTRVKzRCYVlrOVhP?=
 =?utf-8?B?aGZCaGE4UHlKV2dPUGx4R1h1RkphWTREVUtSNW9oSHMvZndmRWh0NHh1Tzls?=
 =?utf-8?B?WGpsclZVMlM2b3RkcCtYMjE4ZFJxQ1VjeEd1OGhiYVA1aWlxTVN3dzBTN2RX?=
 =?utf-8?B?ektrdC9wanBPb3dYTWhET1JZYk4va3U4YmIxanBiczVJRUF3L0p3L1QrMERC?=
 =?utf-8?B?YW85Zkh4L1pXNTVuL3dMODlpU1QyK01LMHV0MmJxY3FPV2JMdTJwMW9KMXhZ?=
 =?utf-8?B?c3gwVVg2cmZPcXNmdmE0bXdnTytoTEJYZzd0dHRsTEFCU3gvQTBBMDBTU2Vq?=
 =?utf-8?B?Qmw1bDdQYTBpeGFtMTJ0Y1dadkRkb1JjdFRSRm0zejlKdnZNUzJCWktweUFO?=
 =?utf-8?Q?v/cG61q/6SqyjMqscmUVxlU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9beae1d-7cc2-4904-fd4d-08d9b3f43587
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 11:26:10.3452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yh1uRafywuOpzy+3M+7VGUlLRN0rA2/ORT1cCB071j2YVz0mPq21KqpoCeHt1rP3a/2TdT99EsOXTbSmN0YixA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5393
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_032613_521008_91776169 
X-CRM114-Status: GOOD (  17.05  )
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


On 30/11/2021 11:11, Miquel Raynal wrote:
> Hi Jon,
> 
> jonathanh@nvidia.com wrote on Tue, 30 Nov 2021 08:53:08 +0000:
> 
>> Hi Miquel,
>>
>> On 19/11/2021 18:33, Miquel Raynal wrote:
>>> On Mon, 2021-11-15 at 11:36:55 UTC, Jon Hunter wrote:
>>>> Commit 5fa6863ba692 ("spi: Check we have a spi_device_id for each DT
>>>> compatible") added a test to check that every SPI driver has a
>>>> spi_device_id for each DT compatiable string defined by the driver
>>>> and warns if the spi_device_id is missing. The spi_device_ids are
>>>> missing for the dataflash driver and the following warnings are now
>>>> seen.
>>>>
>>>>    WARNING KERN SPI driver mtd_dataflash has no spi_device_id for atmel,at45
>>>>    WARNING KERN SPI driver mtd_dataflash has no spi_device_id for atmel,dataflash
>>>>
>>>> Fix this by adding the necessary spi_device_ids.
>>>>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>
>>> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.
>>
>>
>> Please can you submit as a fix for v5.16? The commit that introduced this is already in the mainline.
> 
> Yes of course. Can you resubmit with a Fixes tag?


Thanks. I have sent a V2. I used the same Fixes tag that Mark has used 
in similar changes for consistency.

Jon

-- 
nvpublic

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
