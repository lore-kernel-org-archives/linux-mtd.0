Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB44C982DD
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2026 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VDn+5jpTRwwfidHzRCi0Id2zWj2HD08qCO5H7RPrKM=; b=nXCLWweFc47HgY
	trPe0KNLUUPxxbPWqjpnS5duioON+0FEtSHToMuH/UYHaUgZJIALdkCWbVO1+FuNcLTIchR9pvsKd
	jQtOffLJlBQI6UbvZaE+Cv9GEM0TRsywSPvAdFhmMFowIuGyscUpPJ9fze4yW9vdSBeIK/ghU1qLg
	sX/DUrw3NkMrNXLQv0ZUl+iqufdFXmktldM8pF0GjnpUrswFd+qayJtoYZH7mpZ0Po5anyuS1B1G/
	f5Fu+nhdpzNPm6Lbd/7SYAsNxNqpExpTvsOZH7ecgajmGXDbBjPbxe5edUFPGtZkBCedcrXvPHRr0
	W5vumyKO4sUCehqa2+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VU3-0000000E3Qr-3MFq;
	Fri, 18 Sep 2026 10:06:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VU2-0000000E3Oz-1FxT
	for linux-mtd@bombadil.infradead.org;
	Fri, 18 Sep 2026 10:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=MlGDhBlhOAtORhjjB55w+SGUPTYnaVLzbdP9oFaQszM=; b=BmEZWBDFesNFiaukR/jdy87qnT
	gzcDZePemjLihEBIFJi4DsiUZVBRhjdVFKycMnYIh2x91//Mlgz0xMuQggc2ealGYoFa53w7Eglcl
	GTs7z5TKpAPi3rDCG6XsGcfgAo567/qdxQc84y8f4e0JuAPJF7f27IGsP8CZ9lELCaTaKKHYwKfne
	lDp0vLDBvqFg/4tQEMaukYsM87WQej2KybrayfDDvqp7G+vKWMGEcwOwQ3ibU/50sZLwNjQBpQVWK
	b+V+XZPrTX1G+emLyY8NbjUzG2tITxQAeMbaLFVAxnqW7999uqnm6AnHX1q205ORw/2h6oR7x341f
	z2IXfFlA==;
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7VTz-00000009txi-05Er
	for linux-mtd@lists.infradead.org;
	Fri, 18 Sep 2026 10:06:17 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9e1ZC1002407;
	Fri, 18 Sep 2026 06:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=MlGDh
	BlhOAtORhjjB55w+SGUPTYnaVLzbdP9oFaQszM=; b=XS6NBiF0zBEiJXN4Ptjxg
	3fFtrsHwQ2sRe0USqugca0Teh3M/OzGQBG0WVP4dVz7vJ1FhC+r9KR4q9gGIPJ33
	/F7cnKaV5ICLYiCS8CFa2KOlIDoLI7OrrQVtjvQk6hSww+U/Kr1+talL7Jzix2nv
	FGJR+mpJ1d46CmwD7PE+6aWEREE78U/wF2Ez9GMZqiH557HYcTGzzDmLlmQUxGgs
	UNItEVluf/P8mwDOB6FDhhIs9CfTphC/Z9R1iA5DcZ9QWiSyyVt45AX/Zm5++v2n
	P0A8baIVHyolZ0xBQ2rqBD9AXbTHZ6qb0PbtD1jltP+T97smEKPaWsQZQfgMKI0m
	A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4grk0h4dge-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 06:05:57 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFKJx1Ahh3v0UX+XIcA9FDmsCCdzMi0P8gllr47ZCeIvFUUaV2NnP+sSaD0NLliDoKi3y3LzR1eZ4hPwZH2QrGVmeEkKDhmRRuK8ZkSdnn0EdMsI52nwKtteLlJkKrmWK1lorg3k5nDN7q8f9OlvoOrH6ZXuPpiyShqQCQ2gu/zx/2EHTSgM6Rm7v1sbCliHWLkfPK2iK5FjXSUjDdgolf8nJIiIypa1tIAn+sV5TPODR1Ckp0ATtoGBmDsKOxN43/Ye80ZdJJcxxoSV0uqjd+u7kKoxjWtZLLUiRnicQxa4UkpT3hioUlOvynIh76IM2RF9FnJZCGUKTA0LkhEKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlGDhBlhOAtORhjjB55w+SGUPTYnaVLzbdP9oFaQszM=;
 b=WD20FPm0rth6KQOeZvzFkrc5ciDMEFUNYxs9m8GVB5pZyd0R8cI/c3DgSq+iXQXK6gMUtowJa1tAdWy2bHvFq+9g1+NRhkyJw6m+I5tPc8sVx7CEGTWmy4tC24R07CX9DvMEcsuiVz8WXux8DzcwQxC7BsVicrQC4ttK3rI0ss56UNKTiSIETO27rvcleJ8r3pRVxlLXJw8lNw58Y1q6z8SaYezn/7gSbGApf2gANgv3dpw9m6uuRodvwSTWFaHkLBkVWC5gaL4P+QPQBoIq7wGdEOQIXWjK+A5sxgtw3rzF6MGvMTEoau7hWm1xUTkrqasxxPYQhZjOQ6YA8mVMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by IA3PR03MB8408.namprd03.prod.outlook.com (2603:10b6:208:546::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 10:05:55 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 10:05:55 +0000
Date: Fri, 18 Sep 2026 11:07:10 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <aq0MKTz6KIx8N7ZT@nsa>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
 <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
 <aqgRsP3cxzcLok5C@nsa>
 <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
 <aqpTO-5LTLtRXaY4@nsa>
 <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
Content-Disposition: inline
In-Reply-To: <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
X-ClientProxiedBy: MR1P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::14) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|IA3PR03MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 28294d9a-ef27-4ad5-e9fd-08df156c6d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|4143699003|56012099006|11063799006|5023799004|3023799007|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: z20O6K3exUZUR7wCVrdkTNFHjTPXsHZriDG4Ivn2NChzNju1yaDMagHbc1IQ02365RyqymIDlIkPyQqMxdSrieDctUUj5P3BDbigSmg4oJAONdnKbwRHpxiEtoPt2sf/IBAEUgpIUJKNnowyjytT6wD9IJDBsd5ZctFtvLKVZ5TmOWGaAjKaPI3eD/WxuwguaGl2lUoyK6WSafUep2jlHR7FfFqHmiVHnnE7uLNaGcaFZe4UToiETeouLjMJv5XIxbX9mBngGk4hXvC3c1Co2SL2I+rodS1f/78Y/zG4RFJKix45k3Ke0ZhZ3YaqGPD2jh35yOY0Bl/EsjIRCnrfHolTEYpuYdyos7gh640BYcbY80avzLP3QxIUZ2O0KFOHfXB1astMSvOI/JvduEc0a3NtZdZPM7mFm2EJ3rCXMFkS/+stk7h5i8YuxVLlxjYpZfpEOCZh8oJpgzeMs/hrCGhL/Ki2rJXITnZhWnP9ylVaqTEhRaNLDNHHA+9VPvWBxHK03SW5gxwD8zm+g07uEPoSEXOAg0bNNeLVk7mUHGWwaZgXDXgkUchWuhrMx6i1Gjceap0YtoJFvXtVLXyaYc0C59bEuxDBj+aPipraBXzt8y4XBxKQ1OzL+jSOstzDZ5F2iFnK+kvKKiuVh/sL4D3YMqyMwRSabZMsHjyxlDM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(56012099006)(11063799006)(5023799004)(3023799007)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVpUOUdqblpMTWNFTVEvcWpYdmRnbmxpMkhHZFUrL0cvSC91RTBYRFRQK1FL?=
 =?utf-8?B?UE92a0J5TVN4S3pMNnJNdVo2MWFCREFuLy9QekVrTkVvTk9JOXg3WnhwLzBI?=
 =?utf-8?B?Nm8xdm85YVo3SnV6Lzl4Y3hadEJGN3JQMzhNcCtwdUduTnI5QmtOTXFGb2ow?=
 =?utf-8?B?MHlLVmUxM0lvM09kWlV3WUQ0TURsSHVzVjVuaXlqYXFpZ0FZaTVlNjlCT0lq?=
 =?utf-8?B?UDk1TldSNlZOSUIzaFFEVFNGRXRpbGRJY0JjSzROalF4aVNFSGprblV5RGRr?=
 =?utf-8?B?WHVYbEtCaG4rVnpwU0dpdk5xVkpLSytEQmxtdk81bjVKQUp3b2FXcXVSLzUx?=
 =?utf-8?B?bFF5TldwdEVsbXVVU1NxVW9nSEc3RmVmUEZreDBJeHJRNldMdGRUbkJHZlpG?=
 =?utf-8?B?d1BvSUUrdGRRMXQzODRYK1JXaFhuM09ob2cxWWhlV1ozMUMxNm4rOVBMOFUr?=
 =?utf-8?B?OGk1MFlnY0J3bWg0MzNBUkI1U28zWVFWUURLdzlCNC93SWxWS2F5dGdvMStw?=
 =?utf-8?B?Qk5OUm1KbWVjVTdPRjF4QUxUVHBtV3liNGdpNGdvVWtnZkQwSU96OUpLOEx2?=
 =?utf-8?B?cDB1Qll4elRnQmZmNjZ6SUhCSW45L0FuNFRBcUVwZHgzYnF1NjZkcjIwSFcv?=
 =?utf-8?B?MmxqbXdIMDJ5TFZONytwUElaT1J0SkNPQVlCQlJHY0tJdVBiSkVWN1dvR0Vz?=
 =?utf-8?B?Q2ZRd095R0FDcUxEZUI4OXI0b0UwbWdrQ05IRFJnVmlJaGxZZGx2aHlFOSs0?=
 =?utf-8?B?NldMSmFiYWpYWFd6U0NYejNaejBubXNYM2FuSXhzL3JmZGhybS81SkRiMjZ5?=
 =?utf-8?B?UWhiOTBDTk1wL3FVb2FCV09YZTM3T0pCMnF0Y1hWalE1bWR6K1I1eDNkN2lo?=
 =?utf-8?B?VkdSenFFMkU1eDRzSHcyQWNHUnViMGcyRG5RTHpYdkp0TGh3bWI1R0xib2Ez?=
 =?utf-8?B?NDBBYVJKaVBVU3h2QWg1eUM1Zms3c2tIcGRiQnpyUW5RTUJhYkt1QjZuRUZU?=
 =?utf-8?B?cXBnZlU0OUluallhVXl5OU82b25aSlRqSlVUWHF5c1hqQVJUZFUzcFdGWHNS?=
 =?utf-8?B?S1ludS9NVjJ0ZDU3WU5UM1dqYTZmYThrU0ZYMWJGMktabzVyVXJrTHBrbGo0?=
 =?utf-8?B?cHVZL1pPRm9YbVBvNnRwTTVEOVhmaWFFUnRnaVJkMGhIK1ZZb1ZKMzBkUUZP?=
 =?utf-8?B?R29yOWpaNklXMGcxczQxSTREYnAzdHRkU1g0alRqWTJCaDVHcVl2YTRSRTlj?=
 =?utf-8?B?NWNDZDNsWEVpbVFxY1d2ZytjZFVpNnVOeFJFUEVweG5CWlphVXpqSTVQdDQx?=
 =?utf-8?B?eEFmTFUyeGw4d0hPNWt3ZTRNTC9IUGZQUFFRMkl5NWRIZ29Wd0k3R3EwOFMx?=
 =?utf-8?B?L28vYnllMUt4NUJNM25lYkU0SzNVMDJSWS96eDhYNXVvZFNYL28rQndUQ3Qv?=
 =?utf-8?B?U0dPeXJoMDhkQmVpSzJWczR6dVN6Tk5HdVlIVk9FUEI4allJZDV4YXBiKzZ2?=
 =?utf-8?B?VUU1T2Z1OFpvaU9OT1RCNWFrT1ZLVS85dzBGc01RY0tvRXVOSWxRMDFzdS84?=
 =?utf-8?B?SnExR0UvWkpoK0hHNzRyclNwQXNDVUduanVNbkd2Z0g2NXpCWjUxSkFjcjFh?=
 =?utf-8?B?dDBMUkp5OG52Tk5mbzExNnJTUzFQRGNjRTFlY05aYUxTbHVQb2lKMDI0L1Jl?=
 =?utf-8?B?SGkzdHVTNzhLaXZpQVh4Q3ZkWlNpNEs4ck1ZeXhEYk53UmNRSE1WSEJjYjc1?=
 =?utf-8?B?ai9GR3g3REpnQ29RSDh1M082b1BsZFU0eHpaNS9tcUdISXh6eXZPVkRKMnBr?=
 =?utf-8?B?Y012ODZvNTlMTGlPeVlzWVl6M3JRVDlSenBvZU5YdDRhZHRlUG5QYS9QcUo3?=
 =?utf-8?B?YWZvclN3MUtSVHpNRHRKUjJ3KzVPWjFka24zVnNObUhDL1BaNm4zNnJtQUtF?=
 =?utf-8?B?d3djYW8yam5ZNjBvRzhHV2s1Umt1RjZZeVgwZXk2T200WjRwYWpiMXp1RnVO?=
 =?utf-8?B?TVdNdjRYKzYveWl5cGZZNXV5Q2pnRCtYdVdEb3FaakUvVjU0L2RBcy9YSDNG?=
 =?utf-8?B?MS9TeDJsa0gvUmlTYkF6OVJpcmo1TXpwdjJDRWtFWTIraUR3NjNJRkhiQjJl?=
 =?utf-8?B?NkY0T256MGtPUkZldzMyZW83Y2xqOVVncHJtWFFHQ0VvUFVmN0xHRTJBYy9O?=
 =?utf-8?B?K1VCRTVaWHZDUW04OFd6aVV4Q1hLcEZ1Z094V3JMckJXWW5zb0kxRll5ZlNp?=
 =?utf-8?B?b3ZtQXlFdU5LMWhJLytjVy9kMHpySUJyWGRjVVJCa044c3RNSm9YV3JkWk9K?=
 =?utf-8?B?VmRnUktSczBNZHJmelZESFA3Y0hPdGxrRERwZy91NE8wUWFGRDVOQT09?=
X-Exchange-RoutingPolicyChecked: DNQfjypBlBXCsZlROpcJvfzluLvlnxN+Ap1XqHwDv8pNpCkkWgGc+cBgoLcJd2Yobyx0aKcMsW5xnuLtScr4dRUryrlkHeZZIlPOCva8IpRKLF+vXrIdi5k+80E4ECGdwH9332WH/Nqlf/aeVt9OACCHGDBKHJX4yZgBLwZRF79bX/b81KKD6SQ60WL098p5dSLXdDDkOP85I5zQeVX6wyWIaU4HxpskWzr8JhePZ4JwDNTex7pYZNcxNR1SDwdWoSj1urmfV8JiNzDG/135jE/qfs7OUWCjIz8xYpAO/5+aoTMYM/29Cf9ukX4P45MbzI2KBlQ36g5LTPQ0j8EdnQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28294d9a-ef27-4ad5-e9fd-08df156c6d99
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:05:55.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZ+jsiR71+okCdKtr8iBZToU6Kt1VwjKV46OJC5VbZNL5UaTJmFUN9ETKud4T8oGvRKdA1WznVRGjrdu7/citQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8408
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfXygOe73oXaL8j
 S8qONeoz6D4r7MxdLRifARi+VOuz+DT1nI10FMoxOwd74mTStiYr1vPCey6yNnFycotfu7gTEfX
 lWzT01zCXOuhs79FPtE+OzX1g5Cj+JjOHcUUabg154SlwxYbLxdG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfX38900YcKSfKB
 obg4i4ECgLqRfqE0IyjxvcMM+poSdfvsBUgf/EY5VxPlY9RUii3EwM2p0+gouxWLTjp9nBX49Y9
 FaU9r2kRSumgAwUwk7ub87r6lcDKZFuxr6yUxFoaBdXH3Vu+9kXb1Gj68P98jf/30GaAOVauitv
 VHl5HHetCWqHWU2dcrzUefXc9ewWgXRJle/7mgwzu93FVYRhKOqjAZQM/zI2FeDoTAcM/WXnzPn
 C1n+m5usgH1AyLZ6Fk0x85wDrzfSLhvZ+CFVaGUeynHYGv+UoX79FRMDi1Jbsr9c8dWFeD5UVrY
 nfwFhbz+F4pOVQjnUHh0pBCA9oAdvbL+MJu9u8zK/KB/ERbHpcTeTDS1mUDGQVzFsARXraF+wMm
 Z13tRzv3vSwgeNyo6X1ljO2B4eLtwkq0EMFDfMHcGSeX5ngPNV5wawGPo6fIUgQohPjEUOAZL+S
 HTg71OSPkS9gAEO5DYQ==
X-Proofpoint-GUID: QyVwrAAd1QlpJUzGXMiDNqSP4mu6RlgU
X-Proofpoint-ORIG-GUID: QyVwrAAd1QlpJUzGXMiDNqSP4mu6RlgU
X-Authority-Analysis: v=2.4 cv=IpqL47/g c=1 sm=1 tr=0 ts=6aad0d05 cx=c_pps
 a=CD2IJdD5qp8L8UJuiUkm2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22
 a=JfrnYn6hAAAA:8 a=4ovWLWta0zXe-DwPMw0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_110615_483030_FDB16EB4 
X-CRM114-Status: GOOD (  48.22  )
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

T24gRnJpLCBTZXAgMTgsIDIwMjYgYXQgMTE6MjU6NTRBTSArMDIwMCwgTWljaGFlbCBXYWxsZSB3
cm90ZToKPiBPbiBXZWQgU2VwIDE2LCAyMDI2IGF0IDEwOjQ0IEFNIENFU1QsIE51bm8gU8OhIHdy
b3RlOgo+ID4gT24gV2VkLCBTZXAgMTYsIDIwMjYgYXQgMDk6MTQ6NTJBTSArMDIwMCwgTWljaGFl
bCBXYWxsZSB3cm90ZToKPiA+PiBPbiBNb24gU2VwIDE0LCAyMDI2IGF0IDU6MzEgUE0gQ0VTVCwg
TnVubyBTw6Egd3JvdGU6Cj4gPj4gPiBPbiBNb24sIFNlcCAxNCwgMjAyNiBhdCAwNDowNDo0MFBN
ICswMjAwLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+ID4+ID4+IE9uIE1vbiBTZXAgMTQsIDIwMjYg
YXQgMzo0MiBQTSBDRVNULCBOdW5vIFPDoSB3cm90ZToKPiA+PiA+PiA+ICgqKTogSSBzaG91bGQg
bm90ZSB0aGF0IHRoZSBjb21tYW5kIGFjdHVhbGx5IGZhaWxlZCB3aXRoIC1FSU8gYnV0IGl0Cj4g
Pj4gPj4gPiBhY3R1YWxseSB1bmxvY2tlZCB0aGUgY2hpcCEgQW5kIHRoZSByZWFzb24gaXMgYmVj
YXVzZSB0aGUgZmxhc2ggYXMgdGhlIHNhbWUKPiA+PiA+PiA+IEZTUiByZWdpc3RlciB0aGFuIHRo
ZSBtaWNyb24tc3QgZmxhc2guIFNvIFdFTCBpcyBzZXQgdG8gMSBidXQgY2FuIG9ubHkKPiA+PiA+
PiA+IGJlIGNsZWFyZWQgd2hlbiBjbGVhcmluZyB0aGUgRlNSIHJlZ2lzdGVyLgo+ID4+ID4+IAo+
ID4+ID4+IFdoeSBkb2Vzbid0IHRoaXMgYWZmZWN0IG9ubHkgdGhlIGxvY2tpbmcgb3BlcmF0aW9u
PyBXRUwgcG9sbGluZyBpcwo+ID4+ID4+IHVzZWQgYWxzbyBkdXJpbmcgd3JpdGUgYW5kIGVyYXNl
Lgo+ID4+IAo+ID4+IFNvcnJ5IEkgbWVhbnQgV0lQLgo+ID4+IAo+ID4+ID4gTm90IHN1cmUgaWYg
SSBmdWxseSB1bmRlcnN0YW5kLiBCdXQgQUZBSUNULCB0aGUgcmVhc29uIHdoeSBlcmFzZSBhbmQK
PiA+PiA+IHdyaXRlIGlzIHNpbGVudCBpcyBiZWNhdXNlIHRoZSBkZWZhdWx0IHNwaV9ub3Jfc3Jf
cmVhZHkoKSBvbmx5IGxvb2tzIGF0Cj4gPj4gPiBTUl9XSVAgWzFdOgo+ID4+IAo+ID4+IFNvIHVz
dWFsbHksIHRoZSBXRUwgaXMgY2xlYXJlZCBhdXRvbWF0aWNhbGx5IGJ5IHdoYXRldmVyIG5lZWRz
IHRoZQo+ID4+IFdFTCBpbiB0aGUgZmlyc3QgcGxhY2UsIGkuZS4gcHJvZ3JhbSBvciBlcmFzZSwg
d3JpdGUgKHN0YXR1cykKPiA+PiByZWdpc3Rlci4gVGhhdCBzaG91bGQgYWxzbyBiZSB0aGUgY2Fz
ZSBmb3IgdGhpcyBmbGFzaC4KPiA+PiAKPiA+PiBOb3cgZm9yIHRoaXMgZmxhc2ggKGFzIHdlbGwg
YXMgdGhlIHN0L21pY3JvbiBvbmVzKSwgdGhlcmUgaXMgb25lCj4gPj4gcGVjdWxpYXJpdHkuIFdo
ZW5ldmVyIHRoZXJlIGlzIGFuIGVycm9yIGJpdCBzZXQgaW4gdGhlIEZTUiwgdGhlIFdFTAo+ID4+
IGNhbm5vdCBiZSBjbGVhcmVkIGJ5IGEgd3JpdGUgZGlzYWJsZSBjb21tYW5kLiBXaGljaCB3ZSBz
aG91bGRuJ3QKPiA+PiBuZWVkIGFueXdheSBiZWNhdXNlIGl0IHNob3VsZCBiZSBjbGVhcmVkIGF1
dG9tYXRpY2FsbHkgaWYgbm90aGluZwo+ID4+IGdvZXMgd3JvbmcuCj4gPj4gCj4gPj4gQWxzbyB0
aGUgd3JpdGUgc3RhdHVzIHJlZ2lzdGVyIHdvbid0IHNldCB0aGUgZXJyb3IgYml0cyBpZiBpIHJl
YWQKPiA+PiB0aGUgZGF0YXNoZWV0IGNvcnJlY3RseSBhbmQgaXQgd2lsbCBhbHdheXMgZGlzYWJs
ZSB0aGUgV0VMLCBzZWUKPiA+PiBUYWJsZSAyOSAoIldSSVRFIFJFR0lTVEVSIE9wZXJhdGlvbnMi
KSBpbiB0aGUgTVQzNVhVNTEyQUJBIGRhdGFzaGVldAo+ID4+IGFuZCBUYWJsZSA4LDggKCJXUklU
RSBSRUdJU1RFUiBPcGVyc3RhaW9ucyIpIGluIHRoZSBJUzI1V1gwMUcKPiA+PiBkYXRhc2hlZXQu
Cj4gPj4gCj4gPj4gPiBPVE9ILCBvbiB0aGUgdW5sb2NrIHBhdGggd2UgZG8gc3BpX25vcl93cml0
ZV9zcjFfYW5kX3NyMl9hbmRfY2hlY2soKSBhbmQKPiA+PiA+IGdpdmUgbm8gc3BlY2lhbCBoYW5k
bGluZyB0byBXRUwgc28gSSBpbWFnaW5lIHRoYXQgd2UgdHJ5IHRvIHNldCBpdCBhcyAwCj4gPj4g
PiBidXQgcmVhZCBpdCBhcyAxIChnaXZlbiB0aGF0IGl0IGNsZWFycyBvbmx5IHdpdGggRlNSKSBh
bmQgaGVuY2UgSSBnb3QKPiA+PiA+IHRoZSAtRUlPIGluIFsyXS4KPiA+PiAKPiA+PiBXZSBkbyBh
IFJNVywgc28gbXkgZ3Vlc3MgaXMgdGhhdCBpdCdzIHRoZSBvdGhlciB3YXkgYXJvdW5kLiBXZSBy
ZWFkCj4gPj4gaXQgYXMgMSwgYnV0IHRoZW4gYWZ0ZXIgd3JpdGluZyB0aGUgU1IsIGl0J3MgMCAo
c2VlIGFib3ZlKS4gVGhhdAo+ID4+IGFjdHVhbGx5IGFzc3VtZXMsIHRoYXQgaWYgdGhlIFdFTCBh
bmQgYW55IGVycm9yIGJpdCBpbiB0aGUgRlNSIGlzCj4gPj4gc2V0LCBhIHdyaXRlIHN0YXR1cyBy
ZWdpc3RlciB3aWxsIGNsZWFyIHRoZSBXRUwgYW55d2F5cy4gQ291bGQgeW91Cj4gPj4gZGVidWcg
dGhhdCBzbyB3ZSBhcmUgc3VyZSwgdGhpcyBpcyB3aGF0IGFjdHVhbGx5IGhhcHBlbnM/Cj4gPgo+
ID4gU3VyZSBJJ2xsIGRvIHNvbWUgZGVidWdnaW5nIG9uIHRoZSB1bmxvY2sgcGF0aC4gVGhlIERT
IHNlZW1zIGEgYml0Cj4gPiB1bmNsZWFyLiBJdCBhbHNvIHN0YXRlcyAoZm9yIHRoZSBXUklURSBE
SVNBQkxFKQo+ID4KPiA+ICIuLi5JbiBjYXNlIG9mIGEgcHJvdGVjdGlvbiBlcnJvciwgV1JJVEUg
RElTQUJMRSB3aWxsIG5vdAo+ID4gY2xlYXIgdGhlIGJpdC4gSW5zdGVhZCwgYSBDTEVBUiBGTEFH
IFNUQVRVUyBSRUdJU1RFUiBjb21tYW5kIG11c3QgYmUgaXNzdWVkIHRvCj4gPiBjbGVhciBib3Ro
IGZsYWdzLgo+ID4gIgo+IAo+IE5vdCBzdXJlLCB0aGlzIGNvbnRyYWRpY3RzIGVhY2ggb3RoZXIu
IEFzIEkgcmVhZCBpdDoKPiAKPiAgLSBXcml0ZSAoc3RhdHVzKSByZWdpc3RlciB3aWxsIGFsd2F5
cyBjbGVhciBhIFdFTCwgdGhlIG9ubHkgb3Blbgo+ICAgIHF1ZXN0aW9uIGlzLCBkb2VzIGl0IGFs
c28gY2xlYXIgaXQgaWYgdGhlIHByb3RlY3Rpb24gYml0IGluIHRoZQo+ICAgIEZTUiBpcyBzZXQK
PiAgLSBXcml0ZSBkaXNhYmxlIHdvbid0IGNsZWFyIHRoZSBXRUwgaWYgdGhlIHByb3RlY3Rpb24g
Yml0IGluIHRoZQo+ICAgIEZTUiBpcyBzZXQuCj4gCj4gPiBCdXQgdGhlIHRydXRoIGlzIHRoYXQg
dGhlIHNlY29uZCB1bmxvY2sgSSBkaWQgY2FtZSB3aXRob3V0IGFuIGVycm9yLgo+IAo+IFdoaWNo
IG1pZ2h0IGluZGljYXRlIHRoYXQgYSB3cml0ZSBzdGF0dXMgd2lsbCBjbGVhciB0aGUgV0VMIGFu
eXdheS4KPiBCdXQgdGhlbiBpdCBtaWdodCBhbHNvIGJlIGludGVyZXN0aW5nIHRvIHNlZSBpZiB0
aGUgUFJPVCBiaXQgaW4gRlNSCj4gaXMgc3RpbGwgc2V0LiBJT1csIGlmIGEgbmV3IHdyaXRlIGVu
YWJsZSBpcyBzZW50LCBhIHdyaXRlIGRpc2FibGUKPiBtaWdodCBmYWlsIGV2ZW4gaWYgdGhlcmUg
d2FzIG5vIGFjdHVhbCBlcnJvci4KPiAKPiA+Cj4gPj4gCj4gPj4gQnV0IHRoZSBxdWVzdGlvbiBp
cyB3aG8gaXMgc2V0dGluZyB0aGUgZXJyb3IgYml0IGluIHRoZSBmaXJzdCBwbGFjZS4KPiA+PiBB
bmQgSSBndWVzcyBpdCdzIHRoZSB0ZXN0aW5nIHNlcXVlbmNlIGZvciB0aGUgbG9ja2luZyB3aGVu
IHlvdSB0cnkKPiA+PiB0byB3cml0ZSB0byBhIGxvY2tlZCByYW5nZS4gU28geW91IGNvdWxkIGFs
c28gYWN0dWFsbHkgdGVzdCB0aGUKPiA+PiBsb2NraW5nL3VubG9ja2luZyB3aXRob3V0IHdyaXRp
bmcgYW55IGRhdGEgdG8gdGhlIGZsYXNoIGp1c3QgdG8gc2VlCj4gPj4gaWYgdGhhdCBpcyB0aGUg
Y2FzZS4KPiA+Cj4gPiBQcmV0dHkgc3VyZSB0aGUgYWJvdmUgaXMgdGhlIGNhc2UhIElmIHlvdSBs
b29rIGF0IG90aGVyIHRlc3RzIGFmdGVyCj4gPgo+ID4gIk9uY2Ugd2UgdHJ1c3QgdGhlIGRlYnVn
ZnMgb3V0cHV0IHdlIGNhbiB1c2UgaXQgdG8gdGVzdCB2YXJpb3VzCj4gPiBzaXR1YXRpb25zLiBD
aGVjayB0b3AgbG9ja2luZy91bmxvY2tpbmcgKGVuZCBvZiB0aGUgZGV2aWNlKToiCj4gPgo+ID4g
RXZlcnl0aGluZyB3b3JrZWQgbmljZWx5IGdpdmVuIHdlIHdlcmUganVzdCBkb2luZyBsb2NrL3Vu
bG9jay4gVGhlIERTIGlzCj4gPiBhbHNvIGNsZWFyIGFib3V0IHRoaXMgKHRhYmxlIDguMTEpOgo+
ID4KPiA+ICIuLi5XaGVuIGEgY29tbWFuZCBpcyBhcHBsaWVkIHRvIGEgcHJvdGVjdGVkIHNlY3Rv
ciwgdGhlIGNvbW1hbmQgaXMgbm90IGV4ZWN1dGVkLAo+ID4gdGhlIHdyaXRlIGVuYWJsZSBsYXRj
aCBiaXQgcmVtYWlucyBzZXQgdG8gMSwgYW5kIGZsYWcgc3RhdHVzIHJlZ2lzdGVyIGJpdHMgMSBh
bmQgNCBhcmUgc2V0LiAKPiA+IElmIHRoZSBvcGVyYXRpb24KPiA+ICIKPiAKPiBPay4KPiAKPiA+
IEkgYWxzbyBkaWQgdGVzdGVkIHdpdGggYmFzaWNhbGx5IHRoZSBzYW1lIGNvZGUgYXMgaW4gbWlj
cm9uLXN0IGFuZCB0aGVuCj4gPiBFUkFTRSBhbmQgUFJPR1JBTSBjb21tYW5kcyBqdXN0IHJldHVy
biAtRUlPLgo+IAo+IEJ1dCB0aGUgdW5sb2NraW5nIGRvZXMgbm90IHJldHVybiBFSU8gYW55bW9y
ZSB3aGVuIGl0J3MgZXhlY3V0ZWQKPiBzdWNjZXNzZnVsbHk/CgpVbmxvY2sgbmV2ZXIgcmV0dXJu
IEVJTyBiZWNhdXNlIHdlIGRvIG1pY3Jvbl9zdF9ub3JfY2xlYXJfZnNyKCkgZm9sbG93ZWQgYnkK
c3BpX25vcl93cml0ZV9kaXNhYmxlKCkgd2hpY2ggc2hvdWxkIGNsZWFyIFdFTi4gU28gdGhlIGVy
cm9yIGlzIHJlcG9ydGVkCm9uIHRoZSBjYWxsIGl0IHNob3VsZCBiZSByZXBvcnRlZCBJTU8uCgo+
IAo+ID4+ID4+ID4gQUZBSUNULCB3ZSBzaG91bGQgZG8gc29tZXRoaW5nIHNpbWlsYXIgYXMgbWlj
cm9uIHNvIHRoZSB3cml0aW5nIHRvIGFuCj4gPj4gPj4gPiBhY3R1YWwgcHJvdGVjdGVkIHJlZ2lv
biBmYWlscyByYXRoZXIgdGhhbiBiZWluZyBzaWxlbnRseSBkaXNjYXJkZWQgd2l0aAo+ID4+ID4+
ID4gdGhhdCBzdGF0dXMgYml0IHNldC4gVGhlIHF1ZXN0aW9uIHdvdWxkIGJlIGhvdyB0byBkbyBp
dD8gVGhlIGNvZGUgaXMKPiA+PiA+PiA+IHByZXR0eSBtdWNoIGlkZW50aWNhbCB0byBbMV0uIFRo
ZSBtYXNrcywgdGhlIG9wY29kZWQuLi4gU28gc2hvdWxkIHdlCj4gPj4gPj4gPiBzb21laG93IGhh
bmRsZSB0aGlzIGluIHRoZSBjb3JlIChieSBoYXZpbmcgc29tZSBjb21tb24gaGVscGVyKSB0aGF0
Cj4gPj4gPj4gPiBjb3VsZCBiZSBzZXQgaW4gLmxhdGVfaW5pdCgpIHVuZGVyIGEgY29tbW9uIE1G
Ul9GU1IgZmxhZz8gT3IganVzdCBrZWVwCj4gPj4gPj4gPiBib3RoIGltcGxlbWVudGF0aW9ucyBz
ZXBhcmF0ZSBmb3Igbm93Pwo+ID4+ID4+IAo+ID4+ID4+IEknZCBsaWtlIHRvIGtlZXAgdGhhdCBv
dXQgb2YgdGhlIGNvcmUuYywgYnV0IGFsc28gbGlrZSB0byBhdm9pZCBhbnkKPiA+PiA+PiBjb2Rl
IGR1cGxpY2F0aW9uIGVzcC4gYmVjYXVzZSB0aGVyZSBpcyBhbHJlYWR5IGhhbmRsaW5nIGZvciB0
aGUKPiA+PiA+PiBpbnRlbCBzcGkgY29udHJvbGxlciBpbiB0aGVyZS4gU28gbWF5YmUgbW92ZSBp
dCBpdCBpbnRvIGEgbmV3Cj4gPj4gPj4gY29tbW9uLmMuCj4gPj4gPgo+ID4+ID4gQWxzbyBkb24n
dCBsaWtlIHRoZSBkdXAgdGJoLiBDb3VsZCB0aGF0IGJlIGEgZm9sbG93IHVwIG9yIHNob3VsZCBp
dCBiZQo+ID4+ID4gdjMuIEZyb20gdGhlIHRvcCBvZiBteSBoZWFkIEkgY291bGQgdGhpbmsgb24g
YSBtZnJfY29tbW9uLmMga2luZCBvZiB0aGluZy4KPiA+PiA+IERvbid0IHRoaW5nIHRoaXMgRlNS
IHJlZ2lzdGVyIGlzIHN0YW5kYXJkPwo+ID4+IAo+ID4+IE5vdCByZWFsbHkuCj4gPj4gCj4gPj4g
QnV0IChhdCBsZWFzdCkgcGFydHMgb2YgdGhlIGRhdGFzaGVldHMgYXJlIGFjdHVhbGx5IGNvcGll
ZCB2ZXJiYXRpbQo+ID4+IGJldHdlZW4gbWljcm9uIGFuZCBpc3NpLCBJIHdvbmRlciBpZiB3ZSBz
aG91bGRuJ3QganVzdCBwdXQgdGhlIElTU0kKPiA+PiBwYXJ0IGluIG1pY3Jvbi1zdC5jLiAoWWVz
IHZlbmRvciB3aWxsIGJlIHdyb25nLCBidXQgSSBwbGFuIG9uCj4gPj4gZGVwcmVjYXRpbmcgdGhh
dCBzeXNmcyBwcm9wZXJ0eSBhbnl3YXkpLgo+ID4KPiA+IEFsc28gd29ya3MgZm9yIG1lLiBTYXkg
dGhlIHdvcmQgYW5kIEkgY2FuIHNlbmQgdjMgd2l0aCB0aGlzIGluCj4gPiBtaWNyb24tc3QuYy4K
PiAKPiBZZXMuIEJ1dCBhbHNvIHBsZWFzZSB2ZXJpZnkgdGhlIG91ciBndWVzc2VzIGFib3V0IHRo
ZSByb290IGNhdXNlIG9mCj4gdGhpcyBhbmQgd2hhdCdzIHRoZSBhY3R1YWwgYmVoYXZpb3Igb2Yg
dGhlIHdyaXRlIGRpc2FibGUuCj4gCgpPawoKLSBOdW5vIFPDoQoKPiAtbWljaGFlbAoKCgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
