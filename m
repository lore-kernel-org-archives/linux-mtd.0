Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678DBC79FB7
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 02:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8/ZbXcihydKzDMYQNUGbAEkFaTZNk95p2Vqalt7TSQo=; b=VsP/JXDKe72DoD
	5mIe59l9eBtoiEv+8xrwucES5VW3OOEP7AyVqcI8a+8NxG5mx9sk6nGYY4Q6ynq44raYZPgzN424G
	mzoB7HEwYC32WuNonAsmy8d1uRrnejVrOwobWLqV9MOPw1dAltXBmCGheR4SQHGnUmLZcZZ1xWHTj
	3n3qWH2SDHz1+HSw9KPzuNy9rE7SedXWrglAn5kNwYX6g/pBZGo55dFMjE8WThgH9mCbuVVqSMDLs
	1e6WhEGeV1SbjpezQPJDK2n2qWkg4IOAIA8d0vn09oewtopL+Dj4zpVintL5Awk/XknwexXo/UxC3
	JBiXROlkPuLMPC4u7scg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4UH9-0000000DETf-3HM1;
	Thu, 10 Sep 2026 02:12:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4UH8-0000000DETI-3L7f
	for linux-mtd@bombadil.infradead.org;
	Thu, 10 Sep 2026 02:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yyK4wlQwe09SITpFrWIGcbFXS/j69YYjzzAywZpktTs=; b=OOmez/EOZrnqgDJ5dvIeP/0Bow
	VZFIpMI9Josd0up1bBYFM8JW0ZxbkI1Z0sR6PYJStjR84jthuhJxBBx0tcoiU+19yK+sniVOExfTC
	S5Qi39vPnJAfva79XPz8YZmz3onrl71YJYHEzT4AOg68nvap3mxpDxVLs+897MbwYHO+9RdqP0TZ0
	WnTPXN1V7ioxZWlVeQA6dhlOaVr1HWAfYHi05I+O/F0io5ih2TrlpTvZhaEApr8VyPP+JZcCtF29m
	xi8IcQZ9z83ffEVKRTVoObET2H6C3X0SuM/Cdc/NOy2PwV+Dm24CrnnrMlVvkUYkv4t6DuZYOGm78
	MzcvRpFQ==;
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4UH5-00000001uF8-3gbo
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 02:12:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcZ3EDe4p0rNJK6Nl4/HStl3Z0OOkXwtKygS0YFz7+sx1DKMDxnBRdH2kaYAqOgDfQdQLFLgpaIlHQMz37IftpuW/HMSrDjUK1EM/w5FVda4Gi2APFFVYvewhsDGRl2zNNHbyhDXVEbad/0dkTzffifnF5k1fpwwPRgrPiTqTaM1xGCmAjzVM4B87sL+YKHVBVgh0Hq2yvUWZFlRxhH65ymcuai0XMG1TSX9jkip8b62BXzv1tHQqICQzACNAVAXWMQGikvd1mVGYgQ++DKsNCqZY8XAzXiaCZt7Amq8atew9RmxvogEUDd/B2YtKOtA9EPvu+AhnU5NJXWuO/Tkew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyK4wlQwe09SITpFrWIGcbFXS/j69YYjzzAywZpktTs=;
 b=q4IOfAXxAK5OcxFxt+9VSTCqZrgLM9ErJcVHEeCIpzPT/TWhbWx5YRgAsPGtqPq3WgqBsPy5gVf+1UjNMYllj7j1agH8jM6oDEyxG5hfOjW8t9dsyTxdMp7pckdS+DQs5tpgsKoqi6cipPaODIgBNNp7JoR8mA3ieaKHtDC9UWd0V34QPbEfR99wtbZD1eiWznyEZPdDByX5hnbbPCUIGcdBhQLVLzBcyhTUWpOkLHoxAzWY/DBxnqP8/63OYFxkDc6qYlbu8mGaIFWyoA5RpTpKM4eVvZQEcYTEYePLfp534eN/tD4yq4nDrxJoDZ3cMssx46M5QCc8BS/fE7t64w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyK4wlQwe09SITpFrWIGcbFXS/j69YYjzzAywZpktTs=;
 b=ohW90PuXUnbGoeVTmRiKhvkIez0nMLPWLf4QvG0aRyY4csKPy9VucI//6+9U/lyPhmaJxoDPQlbhVefb8OMLP8cyBuW/pfzxb/6KwhbtwYV+MuB+kwte0StHvvuNZdaYEeNtpwz9F86bNV+A07/Iji2mRXsKVz5CWhx6kuhKM7YPbiAnA3CTIuKUto+5jCSufd31evyFeKFF4ofPv5x1ii6x/HlhQqAR1iLfcHWFKAjavhIllOIDGKGb8d6a2I6oltLuSL61F2YMlqjMLh4/xhEZ5ypxKhBX+ISI03+EJuWAbT8EaMhzQNsszrhwY/HncMdqny/TiD6lyu15tS5wtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH2PR12MB4183.namprd12.prod.outlook.com (2603:10b6:610:7a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 02:12:16 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 02:12:16 +0000
Date: Wed, 09 Sep 2026 22:12:15 -0400
Message-Id: <DLB9TGGY2VXO.OBBZC2WW5EHA@nvidia.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, "Ilya Dryomov"
 <idryomov@gmail.com>, "Alex Markuze" <amarkuze@redhat.com>, "Viacheslav
 Dubeyko" <slava@dubeyko.com>, "Trond Myklebust" <trondmy@kernel.org>, "Anna
 Schumaker" <anna@kernel.org>, "Richard Weinberger" <richard@nod.at>,
 "Zhihao Cheng" <chengzhihao1@huawei.com>, <ceph-devel@vger.kernel.org>,
 <linux-nfs@vger.kernel.org>, <linux-mtd@lists.infradead.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, "Andrew Morton" <akpm@linux-foundation.org>, "Muchun
 Song" <muchun.song@linux.dev>, "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, "Vlastimil Babka" <vbabka@kernel.org>, "Mike
 Rapoport" <rppt@kernel.org>, "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>, "Nico Pache" <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry
 Song" <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama
 Arif" <usama.arif@linux.dev>, "Gregory Price" <gourry@gourry.net>, "Ying
 Huang" <ying.huang@linux.alibaba.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Johannes Weiner" <hannes@cmpxchg.org>, "Qi Zheng"
 <qi.zheng@linux.dev>, "Shakeel Butt" <shakeel.butt@linux.dev>, "Kairui
 Song" <kasong@tencent.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v3 13/14] treewide: adjust comments on PagePrivate and
 PG_private
X-Mailer: aerc 0.22.0
References: <20260907-remove-pg_private-v3-0-6ae22f9d9272@nvidia.com>
 <20260907-remove-pg_private-v3-13-6ae22f9d9272@nvidia.com>
 <54a48bae-aa0e-4833-91a2-5b5908356255@kernel.org>
In-Reply-To: <54a48bae-aa0e-4833-91a2-5b5908356255@kernel.org>
X-ClientProxiedBy: BL1PR13CA0327.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::32) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH2PR12MB4183:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d0a63ec-d13f-4d89-4ad5-08df0ee0ef4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: a9mMbP+tNzNQSDQh5XvLFHJiSXepgnScIrvJaOUBRPYRPrqIyVTib+5JDnir+xIOKp43+noT6VCzNgMaIRSlXFl+WdAR9W74uh5ETH1g7YTtwUeX97Jm9odk3zSHtCqmhF9ppTviGWeUA65KEALtUuCFntXKa+qt7aAQYnJWLA+tp0MDIsHT5oETQHHMtJHhFVCQCVUnVw+4uYTqgNcdrpTzcyjNmdAGynvdQAP+w8Rl02+pW5w3gPCqdfXIbi3RQOqNaYTm1yrG2U8peSxKqK5D2isAZL6duL6Cqpel2Sg3b3Gt4K/PtCWEZLfT4fnwj/R+3fE/OzIa7V3DCTmhwfDZoRwns03swQWMA5XIdT8pupNSUS5ENRpn9S5vMwVhe0c4hfZx0WcUUhtatpAK4RpDWE6q/9/vCL+2GNvMJnYAGwFlqVhEv+rW3/41/4tyvehrb/el2gHElj70ITngLvNCaRhMxDf/k8CWLwqEgTdTN+t78xq2Brm5lURfOKtC74mQvW/QfBj3g50SDTZJRpmmb9THQQRIDyjqSAJYmx7B2iQ58X/deJC8MPYBrNYX83VTEuaeHHwG1XQTbG/pl/tr/xRrZD9uQslJOtbnaqJJJM1t/7ddGAXWjjgguiQ6vVvBpxzzv6uYQvYcSFBMAqIhxL1qM5nNYXwy1uPHizFPXRWjVkgr6wb823R9p0es+TKrfH+cUz/IkfC4xXYV/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlUwQVhwMTJNdWtFeXFVMk9QQ2VRSU1pbmhTa3BwVjFyc0xwQWw2ZGkvSDZF?=
 =?utf-8?B?Uk9IaUpDWE9XQXF3L2l3NGZqYXhURDFCWmNCTDlTRlRCYVplcGVxcVB0b2hk?=
 =?utf-8?B?NmRMQlBKZDZBUStjdDlDMktRL1QyQmRnU3I0ZWRsMnBCV1hKL3BKRG14MHNh?=
 =?utf-8?B?ME9KL1gvbDJ2RlZsVDd1NGZPWUJtNjB3RXk2U2xhOEx0aHcxdlBHSytZYkNk?=
 =?utf-8?B?Yk5nUUMvY3hTK3YrcXdxMmNhb2dMZlN6R0oxdWJyaHhqdWVyaDIvTjJGYzJv?=
 =?utf-8?B?Z3pFNjdIVTJ0OGJrRnQwZG81SW5Yb1ZJUndhTFhUZXBKQmVxWFdHVWJiVDRp?=
 =?utf-8?B?ZjExTVF2d0xIN3JkV1BTUVFCV2VaTUZCa2Y3dk5QVVh2WjJaejYyaGlZdVJU?=
 =?utf-8?B?OVFLamI4b0k0VkNUaWNxalVveC9kN2dqc3d2MW1FMzFlSEN4NmdwcFFWZ1NH?=
 =?utf-8?B?OW9JZzc0U1FPenZlZTZ0SkVDMERPZGZOWnBRSjZRK1REMzlqK0Q2d01iVEJv?=
 =?utf-8?B?cHBhZFRaTElhSVdITmFkTFhlN3dyeUdEV1dFTWVEVU96SVIvVUJ5STlHWTlY?=
 =?utf-8?B?VVZRRVd3NUV2MzlQM2QxdUJ1Z0l5emhXV3kxWGVqQU92WDNlMFl0bUpuWk50?=
 =?utf-8?B?RDhvZ2pxTWt1VkVPL0I2NHBvay9HZU8yVUhsTDNEd24yTUxVSGwzVlVxd2FR?=
 =?utf-8?B?elBYWWJ6Y3FMeFNReWFiZHYxTmRTV3NlZ1lwbUQvUDJScjd2RXplbFJzMlM5?=
 =?utf-8?B?MGF3THN0UU5QWEJhdG53MTY4T2pEQ2tnZFRjT3RnK0xLRUtqdWxNb3g5NGRV?=
 =?utf-8?B?VnVheGxtMWhLYXJNRzZNck5wREttQWdiSWUveUhyTm4wdnBETFdkaTcyVjE1?=
 =?utf-8?B?bFd6RytPaDJvdjRLSTRSSVlwUXJCNjljMXJ2cllCODlnNmJ1TGJORkFzSW8r?=
 =?utf-8?B?V2RtV3MyZ1BIcnMxMG1oUzlXUlBid1RSWGlHaml4RmdWeUVPWkczMzdsYiti?=
 =?utf-8?B?YktZdEtnaTdiWWNQWU1pYjMvRm90Ym05UThVcnp2UEFIYUlXaU9VbnAxNFRQ?=
 =?utf-8?B?aEFhQWY4Q1lsZ2FyeEIwWWNoMURKaXdIUHpNRXAzSjFXWjBNNEtSS1JWeFJi?=
 =?utf-8?B?M2twTEprcWJxTTAzNmRydGo0dmlPS2FnYWFRRTFZWGVvaEdxbElkaDR0YXdy?=
 =?utf-8?B?MktSNm44cy9XeUVGdmpxOHRVSVExeU9xbzhtUktzQ1NueGl3SXp5WEZWVEtv?=
 =?utf-8?B?eG8wYlhhQW5XZzROaWMvOWhVWFkrMjZxSGhMS1VweExTaTk3dTZvRFI1UDNL?=
 =?utf-8?B?YVVYVjdVRHJxWmFBVUNZRlRjOGlNV0NTaEpDK2J1NWtwSit5WmxyWjM1dk9t?=
 =?utf-8?B?ODdRK3l6RlMvQmxyei9Rd1VUMGVKZWZwQ3R5ZlNxeUhMdTI4UjJ2SHUvSk0x?=
 =?utf-8?B?UEx5RVpVN0JuRHBCdlk1RHRwbUR2ZGlzYVo5T25sSTVPUlpEZ29mOGpYM0VP?=
 =?utf-8?B?TEtCbFdtTlZObkQxOHpaNDJhcmkzUkNOM1UzaDJHSGd1VlNRclVQbCtlam9k?=
 =?utf-8?B?d01EWVA3TUoyK3VWVjdBUlVWTndQUW03ZXYxYUU4M0xxczkwZzVKbXp2d3lP?=
 =?utf-8?B?aGUzNFdnVHpJd3FPNEV0VW9ucjVGL0VBVHFSYUg4bXFGKytDUGhmcnRNbTlC?=
 =?utf-8?B?OHB1TnFnMUo4dVgzSlRISGxpN3ZJckoyZzU2cFRib2ZHTVFrQVZoQk44a2pS?=
 =?utf-8?B?V2Q5blM3TXl1dVBVSFNIOW1QbXFjZWhmME9TeHlPbXpyT2t4VTk3NWJKekEz?=
 =?utf-8?B?Yk1KQkFQL2h2em9ZZS9YT3JZOURlUWtqYXZSVTUzODMvVmZPMHBBMHlEZUtr?=
 =?utf-8?B?RU1abTdoVUgyZkx6VmxUcTBYOCtkVlVqVU5palY0eVNsYUc5OWIzRmptWnBh?=
 =?utf-8?B?UlNTMHJ3c0g4ekVQNkoweTdKR0J3UjlNYUtlKzAyclVXMVhrOUZncVNxc1FX?=
 =?utf-8?B?MitYdjlPVlFWRGRkSEhEZ29IcHhqbTN1VHJEOTBYTUVEaityeGFRM2FhYWhR?=
 =?utf-8?B?K205Qk4vWm5scDRFN0JqUVZlMytiUVl6L2w2NE1QYVZwQkV0SXl6OFNXMHc2?=
 =?utf-8?B?RkpFYkpVaHZhUXNmRC9LdERqTjdyWHRDSm85OVFGTkZWWnYrckg3Z1JPQUZN?=
 =?utf-8?B?MUt1UXBwS2Z5K1Q1Tm45YUtsVDUwTk8vb1JSeGlaMFVRVnNKZjIzcSt4QmlI?=
 =?utf-8?B?V05vYXJBanlFaFhUa1F5UlJrckxYR0tUQ2FXTTlLdGpYb2xVSWhVN1VvZUNF?=
 =?utf-8?Q?89ZXKRbSlixj7Mhy3I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d0a63ec-d13f-4d89-4ad5-08df0ee0ef4d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 02:12:16.1977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qo5gWPo2di48TXSgXP7CqDR0gX+PhhUjjNTFXUrZZknl/la8jD+OfD8qwDw6iAUd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_031228_060112_CCA29F0F 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

On Wed Sep 9, 2026 at 10:27 AM EDT, David Hildenbrand (Arm) wrote:
> On 9/8/26 04:56, Zi Yan wrote:
>> PG_private is going to be deleted. Adjust related comments to refer to
>> page/folio->private instead.
>
> Thinking again, I think this is misleading.
>
> PG_private is defectively already unused for all of these cases, no? In that

Right.

> case it's rather a documentation fix. (could some of that go into patches that
> convert away from PagePrivate, like in the previous patch?)

Will rephase the message and fold comments in previous patches if
possible.



-- 
Best Regards,
Yan, Zi


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
