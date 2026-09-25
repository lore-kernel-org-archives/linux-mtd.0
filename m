Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E611C9830D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8ice/FRePvemnMkUvbtMoXy656Vn0KMsExhrx6/Mbc=; b=GkxD5I/6Bh4faSQ8bM1Y9CTj8l
	ahCKG4Now0LXoPDANMBTBDgEcy+u9Pt/NQgUz4gD1ezR2zylHBHvpqqLVB9YmhoWuHY1AR6AxJyXy
	aB45WUwyhPDhvpC/yzzw4MR51PUlC/RF8MLFGJAb6heij6hefhLFOSQuNhHSxqSuKwRo6ycRmwW/Z
	BRH3bprwhoNdZTnjAVCLaU86QIpdDxHNHK/DtG3StVhCeB1VfMVv4TW6rX37QcWXx0dZ9MNMjKOBN
	TWfXghj1JEJf6vtagaCTSNIdpGJbvnAtfVaRA5rzFhjFbAamLDQFS9rXa0ft7C3ClfnRkAhMmZ6lA
	l0Ul72zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5Vw-0000000DNnz-0loy;
	Fri, 25 Sep 2026 12:58:56 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5Vt-0000000DNmj-18y8
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 12:58:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ffrbzfxfl99RzvTuV8QvFSVTzx4CT3RX2hlgkQ92/RHq0fvBK9SrQE5OZb9PlmGeveoY/Hlw7RJVLH1Yl5xH9jkDB3Iwv3Uq5WOhGardVSYAp96BxRtcm/AOhZpmQ7pZLDockESjK2EApc9HeIKurqjU39UZKUpCB/p1NsU7kwXDhD5X/3hEmLPcIaKJyM0jcqHcksubJQcyJD1xD8Cphcfc5RhVsvZbbuvStcBpwWnnP8G/YhhYwutiI3K/3HXzTTEGWYaVqvnrU6q30y8Bvt3zieoHYQojtUBl71ky+zATVgOu8wI592cWbbSy6t4PAb2/QxaBqLk1qGtXEI3tGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5w8H2IdJhJ6OlGhf9FlaOPBZcGRpjrul4XDhtM3B+8=;
 b=icgb+gu5v8v8x4ycWiqQAqWjWQQzxtpH5ffKUm08h/UHlBo2JjxiTwgB73MivjAfWyvKw0lKyoPbe+LcEO+ryGIkb8bg17Q8NPMJT8L7l857i2GPV/C/OmQV0rZvGZPNKI3nfAVIpQ/jicvsaPDYZuSchGAXwWVGUuVNcLB8uZTmvLmTiPktw9yjIj4AINIQSb7QlXKwpdTCsQstXqb2UJoviB6ACKRo/TSvLDojvFbzlVpmI2dY1m0cT6AYaAHp4TTITTxhv7vlMVy69WLbskFiB4AiKlUvbpxRVu/YP7wpNJyJbqwJGWrRZmEdaIJrbWZerLpG2tVMDgVar4XAHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5w8H2IdJhJ6OlGhf9FlaOPBZcGRpjrul4XDhtM3B+8=;
 b=mds7frq3qyuY7Qq8oIiH1TqC0fPCGUUL4FP1FF1l3OGQgX7+Pf72qkmX6qRLoCrir1AAd2zSqWULSwdzy1vvvW6X5W5FlgjIQkIQDsftWpXF11uTEx7tx3Rd3unf4oLHcTdoeat/Y3NEX7mrQK5sqzSv7FUy43Vnh97O/YO9Kf0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH0PR12MB8127.namprd12.prod.outlook.com (2603:10b6:510:292::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 12:58:47 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 12:58:46 +0000
Message-ID: <a40e0664-f6bf-4e08-9649-2f8676b6c1ba@amd.com>
Date: Fri, 25 Sep 2026 14:58:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mtd: arasan: Add ZynqMP props
To: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922183138.290114-1-robh@kernel.org>
 <877bk9n122.fsf@bootlin.com> <20260925122003.GD677989-robh@kernel.org>
 <87wls9jxw7.fsf@bootlin.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <87wls9jxw7.fsf@bootlin.com>
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:254::29) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH0PR12MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ed906a-359f-4960-4af3-08df1b04bc91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 3KyDc6FgwD8r++w8dWY3fUZ9PoEySJNjVlqtRZBcFd/PgkZf9jAITRnwQybV+A+oWSMo9V328uajEKS9nNN5d6VBfyDBbLmI/bu35KpOnhX2kUizbk4GS5IwnVJrMtsfqZ+yWX451jXisxQ+uU2oq3hDDFADJOkI6ZgzGS3yig+KtXeuzMAxFPjayOP0kl4LtZSBj7GynIDpijEPq9pLVQFhP6/DUlYyv9/JqtKUeHSDgBjX71ioP65cfA40jEPvwp2JwzuVBbZS1HDLojOueNbs3aS4uteIjVCA6ZPhefdhHPOT7QfMQltQnc6Ad6QLWdUlWIyplKR5FRyYxrajn77YwxQKSIBPHN19LN3TcM3xsRfO/3sOMvWZ7gj1942nfjscNvA5M5fY3TC3RkE5jC/gO/3FMaiou3FE7eEJJyAb50tc0O6pPokm/TQu4o2XgxSJXI+QwUauOg1AMeBWFgwxs/+pAo6Gn7Tg1uyEV/psqu1/i6Jk6C43b956gJpT8U9cPFf9N+1ffGSwZeNjm85x/YyaZ8q+zGG/ktXOggiPe+35V+rsIiYW3DJvi2+R2W4gTxBI2nyKaXQjLC9SA7tKPSJ92PnF+ndyobBA4x3cCet/BjcyyolIEsGGuLB1noMYYTspZ4tgHMboIreUlUJZK8p1xFR9GUF8vDSsIkM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clFtaG8wRnRSOU1PWTlBSm45eXBmUlpJa25TcXVYNjlvQTEzZ0MwRVBxNkdv?=
 =?utf-8?B?Mkd4eUw1SDhuTlZwc0RoN01KT2ZqNEUrQXBveHZlWG5RQlNTWTlMNmlrQWxx?=
 =?utf-8?B?b0kvU3loQm9GRkU5SDc1QlZSNjhIcnozUjhaUHhVSnB2Znh0b1JtbW9uTjNv?=
 =?utf-8?B?QS9idlN0c3hsRUNyRTVjUW13Ti81NlBnNXB0TU40bmJmL2JlRDZBWDZEWFc2?=
 =?utf-8?B?RWx2SG9HbmFqaHZLYUkvWTF5Qk5WdGdWSk1BbHQ2eU1HYTBpR2ZaVEd0bDc1?=
 =?utf-8?B?ODlKS3JvREdSVDFFWHl1bXhiYUhYdGY0eThWZXNvT0x0Ym9zbWRKR1VBd1lx?=
 =?utf-8?B?bWhXWCtRUVMxU0o4MnlvRkFaeUUvM0RYTUc5U01nWjdGM05JeGtKRUdqNVpk?=
 =?utf-8?B?RlgzRjVseldTcGQrY3AvUGJRaVdTSG54UWxleWJKRXZWdm93R0grcXNVV0lv?=
 =?utf-8?B?NUxTZmRDL01sQk54bDF6SC9QYWJ2dXJUNTRia0xGYWt6QWJ5TVorcjZYNmUv?=
 =?utf-8?B?bm0yMUZTRWUyZ3ZPYUxlc0dNTTNVeWdrZ1NkdkpvcTRKT2tzMEVIZ09EN0c2?=
 =?utf-8?B?dGtxcm9lNkpZWEpUVTdQQ0VzNmQybDIvSXJRaHZwZmRqYzRiYzZPSWcyLy85?=
 =?utf-8?B?VXZXYkMza1B2UTJxRVd6RTZqNHNFN0pGbm9CUnhVVWNnbmJmbzc0dDJvTUR2?=
 =?utf-8?B?REFoSTBzb2szNXNHR2pIak9weGZvWVJGdWljSkZ5b3FwM2JkaGhnSXJzZG5G?=
 =?utf-8?B?NEZxMFFGRWVUQXc1MDQ0N2NMMWoyZkVDek9ibEhBZzlHVC9xSFhGTEhyRmJI?=
 =?utf-8?B?Ui9qdXkweERLRWxocXJyUWpQb0twVjRnRzFrck9HVXFneUxHTEU4RldYcmRn?=
 =?utf-8?B?WSsxRmhsOTIvTm5KMy9wNlAwTmF5RGIwYjZtM0k4UmxwREpEMFBRUXFmVDlK?=
 =?utf-8?B?K3gxY3lPZUphSE9yRmtDRC9TZHk5S3k4ZEltRks4V1hZOEF1MGZHSjZFYlIy?=
 =?utf-8?B?S3B4VHpQUEVNeXFjY0pUa0V5WXFEQy8xR1ZPN3BiZW9zNW9VeUpQZ0hnSUl6?=
 =?utf-8?B?MXV0VERVYXNhMHdlSGU5Tjl2Tlg4U0Y0YTVqV0NHQ3l4M29JRWtGYjZSai8r?=
 =?utf-8?B?NE5uS0NpMXJxNXZEaG9KaFB6enpXUGsrU21Pa1ZCaEFNY3Z2YUF1bU5uUnNS?=
 =?utf-8?B?SFFOcWdCcTl1Z3pzd0hHVTNLbXE3NUNkNHhvKy9VSkNZTGhPY2MzVG5xNXl2?=
 =?utf-8?B?QU9rNzhDVWpkNkszbHVvMnYrQ3lHRG1EblB0N0UzaS9MK0tyaElQYTVkTGVZ?=
 =?utf-8?B?WHFZeDNKUVZmaUw2U3JhMWcyTXB6aGx6b2ZPZitIR09Ua055dlNPV25tZEI1?=
 =?utf-8?B?eFdQd3ZHbDdtWHJVT3VBbVNTa3ZyaEVVY3NjUXVNZC9aUmVFL2lWY1UxVkVG?=
 =?utf-8?B?RytHZ3JGRTlrRFkzVHVVeEcvU0w0blVLVzIzSGZhNWR6RzREeHcrU3hyMC93?=
 =?utf-8?B?RXdMOUZ4UHAxdzdBWE9hcDFXUEZYTjZiSDZJalVYYyt6VFdmdTZ4UUlRdDF3?=
 =?utf-8?B?Zlp2eXpac05Fa2JNbUpXcmE3ZlErL3N3TE8rY1JGR3VOdGtRajBHZy9DTWU2?=
 =?utf-8?B?OWxoWkNocHJMbExXZldoN0tua2o4OVV4bnpXaEczcU55emdEdXkyOEtVV29l?=
 =?utf-8?B?R0Z6Y3VSMkZOYmNMVkorZlBCd1J5ZnRLMWJtM295bWJZK3RXbGxEc2JVOXdk?=
 =?utf-8?B?R29LUnVFUUpXRk9mTVd6SFVpTS9sUEUrWGxFRG85Y3Fob2haZEZWZm04bExQ?=
 =?utf-8?B?WE13dElCUC9WZkc2VXpPOFdqcXpJOTNobU1UZlVTUS8rTlR6VHJ5dmt5YXU0?=
 =?utf-8?B?T3pFUXJoYm9qMXdDaDh4QXhtU05VZm9Kbi9ZV3JZTHZvbkNSUFpFeFlwVFV1?=
 =?utf-8?B?Y3RxMUVxdkR2NUY4NEpzd21OTHJvbnlhRlN1R1YzdEJPYXhSL2VET1dYMmlt?=
 =?utf-8?B?VWlBS3M0YUFwa1g1cTFsblNRRTBMaTdjcTFRdld4amxSc1prWld4UmJEZXU1?=
 =?utf-8?B?K2Qwc2I0TlBTRjFGN1FkaDhOYldmeHUzYVYwRlZLR1NnYllsMDRheGYyT3Q5?=
 =?utf-8?B?M0hXeHZzSVVZSjRWY3R4eUc0Z0tYSzRrSFhhV1VlWjZycnZJZHIrWkZnR1Rx?=
 =?utf-8?B?ejBGMnpQWm44T2tMSW0xeHIvZlRiZDdRUzdSWUFMV1diZzZDL3BvOTZpOEtQ?=
 =?utf-8?B?Q1gvWGxMT1oxR0VCQzJqWVo1eDhWeDljcUkwSEVkN2xiazBVNGIzakVwYlRk?=
 =?utf-8?B?RjhCd2U2UEVKbXJiZFNmamVuUjVuUklXNDhPNGZSbkFTeFJDOUdadz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ed906a-359f-4960-4af3-08df1b04bc91
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 12:58:46.8701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9NleycZoFGEfWrx3IIPKQ1ioztlHnS55YJ4KMFhlqR3IhY0mh7lQ4mjjQXHEDQa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_055853_469824_41A7F488 
X-CRM114-Status: GOOD (  19.24  )
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



On 9/25/26 14:52, Miquel Raynal wrote:
> On 25/09/2026 at 07:20:03 -05, Rob Herring <robh@kernel.org> wrote:
> 
>> On Fri, Sep 25, 2026 at 11:16:21AM +0200, Miquel Raynal wrote:
>>> Hi Rob,
>>>
>>>> +  num-cs:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    minimum: 1
>>>> +    maximum: 2
>>>
>>> I am not sure I get what is the purpose of this property. It looks like
>>> a downstream property resurfacing. We expect one DT subnode per chip, so
>>> I don't see the need for num-cs, we just need to count the children
>>> nodes. For me, the correct fix is to drop num-cs from the upstream DT.
>>> The only real use for it would be if the hardware could be synthesized
>>> differently, with a single CS instead of 2, but I don't think it's the
>>> case here.
>>
>> Indeed.
>>
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>
>>> This one, even though we don't actively use it in Linux, it may serve a
>>> real purpose.
>>
>> The driver core takes care of 'power-domains', so how is it not used?
> 
> Yes, it is probably useful. I am pretty sure I did not use that property
> when I tested the driver, but the controller was either already set up
> by the Bootloader or in a domain enabled by another device. In both
> cases, it is worth adding.

It shouldn't be a problem to list it. We have never used it but obviously there 
is power domain.

Thanks,
Michal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
