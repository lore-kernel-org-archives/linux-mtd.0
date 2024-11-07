Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40835D35E5D
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 10:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siePs+MAWoHq0Mv0B1jV8IfJQ5rmSIrR1TGJfth4cQY=; b=nFp8yyJqjfKRYJlHkC7w+3/Jrc
	uNvtDDKo8kt7VQId9e9W1l4qll9x1hndjnUZSPJWWgrxSpXI5IIdrAJE1iEaFbe+9XZHcomIDeuss
	WUjD5l3j6j8VKKUVFuxXNsUtlO1VI9fuxg94uKfFP7gZNt3JKsch80aoAlJrb+yK0RMaECB97eanl
	eVnM3stgo434KuoDvLzmHxC2zY74ATivN7ZLnqvuiTWyHi45LqNRKOFecZjGaGa7ZLF3Lxbokugvp
	XoA8r2Z04fxLr7Gt95o5xbZP+jKnE93F4S5dGkJq/LFr5g5YtzjzZUFZmGq6Y2lye8HyMQZbWRBSr
	I1vhRXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zsB-00000006V7I-1d46;
	Thu, 07 Nov 2024 10:36:19 +0000
Received: from mail-vi1eur02on20605.outbound.protection.outlook.com ([2a01:111:f403:2607::605] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zkY-00000006TD2-0FPB
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 10:28:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cp6LTc1XSuqaRvhJsV1XLtFbSFbV4Js5hDpDRCsB5UvZkFGT/QW1E85PUGG4eltjXCw9aP3nomvyhracTWPv2l6chFn/JBPjDa39k8mmGIQHxzVf6DfeEX4LgNlVD9GsSjZXcjbrB2FA4ZzF/FzVWcLxw12J7dv3K2/yJ5LCgs0brBvyGBP7dNqrXHQvmPhvYjVEzAQrEOF6qhngK8KcRe/7EuGnPp9y7qq8fFYFbD4gDmLcQ0LnyaNwxAM3CPLG10nVaW+Du05gDa0jDCFFgISNPpHnzVxTyPN8n/dRorgzKhgD+thUiR77THXRguKhIlUQjsFO079j/yecinSukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbMtvmyI1K954U9GLaWYjIxQFIOGwk5MpbcDsaFNXoo=;
 b=ppjE/hy24PJ4pv4d0wbvFdwNYrP0N4QA9JIBkd2re4O+9ywmN1x1BMI4aiEyhIZxnhv0eDCfvk5fRlwgkUOhpUnrX4UQ5vaM1rKPQqP9au399hZ+qBVmRsx/0jCviBY4a3oBawXb2oLuuVA2zGJ7iir82ivAHWeLs4DGC+qDolv3NQucBdA0cqJ8meINIJA++VAMP5LY0g5DbKLaZc50MCjVYys616qSGadBRncJHpXlUrI36sNsNdMWZseGcuq3rcGByoePhP1V4rwxEl7pBOBt8lMJwx5e34Ko9mLys+aiOcnKq9hEsdWoZfsKKSXWyyyMZnFwrN7VQS7qjvgXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbMtvmyI1K954U9GLaWYjIxQFIOGwk5MpbcDsaFNXoo=;
 b=gMrIYGoga+gp+435qnbq3IJpCSCA4yVCBaYkWgSfENFq7RgtBu21PHsfGQVgzPSMRReO5qXifM8QUnONk/l7r9c3kPgZ0wJs00/AIpK9HFr51V/+/0rVNLfOmfa7/aGso6vOGy6oSoMzRM9RelzY8tMmJBItcT/KAF8tHE4GNbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com (2603:10a6:20b:5a4::17)
 by DBAPR02MB6438.eurprd02.prod.outlook.com (2603:10a6:10:17c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 10:28:19 +0000
Received: from AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1]) by AS8PR02MB9505.eurprd02.prod.outlook.com
 ([fe80::c7de:da66:ec01:1fc1%2]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 10:28:19 +0000
Message-ID: <d8891124-1391-5642-bfd6-3bfd4f636e2c@axis.com>
Date: Thu, 7 Nov 2024 11:28:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 02/10] ubi: Expose mean erase counter for fastmap in
 sysfs
To: Richard Weinberger <richard@nod.at>,
 Rickard X Andersson <rickard.andersson@axis.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 rickard314 andersson <rickard314.andersson@gmail.com>,
 kernel <kernel@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
 <20241011125904.2915983-2-rickard.andersson@axis.com>
 <2095423248.201132.1730924426363.JavaMail.zimbra@nod.at>
Content-Language: en-US
From: Rickard x Andersson <rickaran@axis.com>
In-Reply-To: <2095423248.201132.1730924426363.JavaMail.zimbra@nod.at>
X-ClientProxiedBy: MM0P280CA0054.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::24) To AS8PR02MB9505.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a4::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9505:EE_|DBAPR02MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 4155e5b6-2e84-4141-2813-08dcff16e60f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjdiemJkTmlqWmY1MTExbUxLWlQ1enJJTFpUbkR5Ukw1VTNxc3p6NUF6OGg3?=
 =?utf-8?B?S0NUU3VyNXpUTUU0SFRIZEljNi9LWWdNdFpGQ3JWUmtsNkQ2YnlFNC9CZXlq?=
 =?utf-8?B?SnNtMVNGaHhpSlFDbXk2VmNlV3dlUnVqZnYvU1F6V2hYMkJSYlc5aExYU1li?=
 =?utf-8?B?R0FVM3NneXR5YldSdDdDOExxWU5GTHlrU0ZtQnZyY1FUZGpNejhkRWZZZVNS?=
 =?utf-8?B?YTVlRTNXblVURVlQbzd2Q2hQQTB5SDFzSmQ5dmRUK0VnRk1Uck5jUzdUZEpJ?=
 =?utf-8?B?ZVRYcmh5N0dpOFdBa0ZvUEMrSXZ4Y01pOFZYbW14Vi9VNkhmL0M5dzhCbmZB?=
 =?utf-8?B?UEJYUlR0VFR1ZXEyclVUZFZMWUM3WjVGL2krVS91eHlISnVFTTdLdnRJcHZj?=
 =?utf-8?B?V0V0dzkwblZrRWFrdVZ4V1hnMWM3eEtIem1TSzdnallqMW5Ed0ZEYnNlU0Vr?=
 =?utf-8?B?RWxhWndNd2Q0TWZjSmVsZFFuaWNVcGVIakYrWFlUUDk3SnRoZmMwTE9lbFlR?=
 =?utf-8?B?Q0lhckhDTjNCYWVGejNMUVZmb1AyT0pCb0JSb1ROaXNnbEtudGpiTkFGb3Jv?=
 =?utf-8?B?cXhiMUl5bWxMTXozNFJwUk5jT050TVFYQUxEdVNvNGRRV3U0OFNKdE1zcTg5?=
 =?utf-8?B?Q2pzYjBaWXNSVnhlcjJOODY2V3hBL1Q3NlVxbzZpVWJiZkl1c0FHSjBjd2l5?=
 =?utf-8?B?eHVUQS8zN202SFNTTlZsTzkzQ0FjY3cvaEN3eE5QOHpnTUdxdkpVOTdNbXli?=
 =?utf-8?B?anR5eW9id2ZiQ1lsaHJMVk1uMjJ1bnR6L3p6M2JMMmZXa09kc0gvV0FueEQ4?=
 =?utf-8?B?akxkdmhlZHkybDg2NkRkMGpTeDBJZUFEZ1grMWlBRmJYK2VNZ2M0b2MreHYr?=
 =?utf-8?B?cFgzSFgyOU5IZWdRWDhPNlgwL1Yyc0dOUDkzenl0UlRGbWFYankzWS9hYUFq?=
 =?utf-8?B?ZE9pWnB0UDZDYkZBallGaDhISDYwbzhud1ZjT25TZTZTa2lqNVZvNGpqU0tI?=
 =?utf-8?B?SjBpeVI0UVVYWUZJT0w1V2VNVXhsdVZUOUxBRXF5d3REV2w0WXhKSmoyMmJw?=
 =?utf-8?B?aXVEVGVCc2pDdTdsK3lMdUhJR1F5c3IwT2dTejAyT3J3a0I1U2VGNFJjWVF2?=
 =?utf-8?B?eFFmR2lSb0VGV3NadWJGVkorTk42cC9PY2xrZTVXdDEwTktQN1pmbGh6bk10?=
 =?utf-8?B?MU5RYktqZlFEQzFEUXNGM1F0aFVBaWF6bVBLbGU2c21MOWJROW56LzJpQnR6?=
 =?utf-8?B?RmRJakFYbi9FdGdvditveDRKaDREZFgzV1JTbjJKMzJ2UmUrTmlQZmtSNHUv?=
 =?utf-8?B?RjlmNEVJc2N5OEZEemJWQXhIeUFhWThqSHpnbnlvUERVSG5BSnBoKzNhSGpK?=
 =?utf-8?B?OTU5ZHp1ZkVUYndmOHJFT1FMUTlyS3hCNGwwTXRscXd2Z0VqLzAzUkExN2JB?=
 =?utf-8?B?M0xXS2tYNUJRbEhkWVkyTldsKzNYTGNEd1VFUEIvNzhNY2RWVjNzelNNNHJE?=
 =?utf-8?B?dFJyNDdGcit0OHEyVG9LM2NRZWFSZ3ExbmtBczlpMElYbVYyV0lTazN6VGdl?=
 =?utf-8?B?UmtVakNMZHhuNFVRUXp3NXRsUzMrRFFqWnVoa0pMa2tKVy9taFNRVnliSUlu?=
 =?utf-8?B?TUMzNGdiVjZRc3NLZUMwT2k3aVRUUWJqa2MraTIyL3lyTzhFTVVtZCtXQ1Rx?=
 =?utf-8?B?YzM3L0xmSkRXNkl3UkZZWFJreHFiMlBxa1hycURMeEVGVXVJTWxkdlVDUmo3?=
 =?utf-8?Q?hTcX64KeCtsiRH0mAOnTaxNfFoP63IW9tbjzsg6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9505.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHBRN1hjZGYvQU83a0JxQ0Zzakl4ZVBOQWhnZjlNZk9ocitVUHhTWkp0MkhI?=
 =?utf-8?B?QVN5MHZDV0RMSkQ1QTA1VzN2Y0liTUM0cVRrU3RkdWpnci9jYlZzZ0UyMXdz?=
 =?utf-8?B?NTJzVU9ybUc0a2VuamQwTU1BSS81VjJNL1Q2TkpxZ3RiazBmT2daU2lyTXRS?=
 =?utf-8?B?UnJoWm5ZV29naXBvQisrNGs2R3Q4eHVwVGtJL0Z4TTEyQmpMa0R5RzFKbkxo?=
 =?utf-8?B?SmZXUlhManRKWTRoQXlvUWl3eS9WYmRsSVRtS3dRTzg5aTE1RktSVjVqZ2R2?=
 =?utf-8?B?Mm0yTmFTcFJWLzQvUyswQlZXOVc0WlNWQ2FOTTA0UVA2aHp0d0JFUE5kZmF2?=
 =?utf-8?B?MXpac2RLZTNVdjNNRlE2UitOVkwzWnhHdWczSmpPdnBrOHoyOUJoYWwwYXUr?=
 =?utf-8?B?V3lyalhjeU4zVGJVU0hTQVZwRE43MlkyY2lZTEJuN050Qkh4SHcxOVVKcGVh?=
 =?utf-8?B?Rkc4eGlzUXlYd1FOdzRmM3dtaGwwMnp0NFFwYnI5SEFvQ3dpemNzaGx0RXpT?=
 =?utf-8?B?U0MvZ0kxQlorTTdpTzZmRVpVRUFRWEhHMTdwYTdOZDJjcmYwRjJ3SDFjNDVm?=
 =?utf-8?B?SXNiRkJOSXpVemdBd2ZkZHBBODJNWnJNbjloK1NLV2Zhc2xnQ3crKzhWS2g2?=
 =?utf-8?B?eXA3ZzVGbE9qS3pRd3p2bXJncG04MFVPRnFaRTgxVlNjYTZ2Z2gzT09nS0RZ?=
 =?utf-8?B?UDNqNjhCZERONDhYMHF4bjBHVkFTemc2ZGpsdVVUdXV5K2hQSVlxQlBHOXFK?=
 =?utf-8?B?TGpOcjFUdXF5MCtFWk5LMTE3N3BBSjBvenArY0tVTUt3NFdZTlhaZ080NkVw?=
 =?utf-8?B?eHhneTZHeWZHQ0dvSzdOYU9OYTlBY2x3Zm1FRmNna2gxSkNaSGJnQm4xcEdM?=
 =?utf-8?B?Q2RmYWp2U0loMGpwWEVreUt5VEQ1MFI1eVBpMzY4ajN3eVpXYTl0dWxYTm9p?=
 =?utf-8?B?YmQ5YVRSSVIxd0pkZFFidUxyV3Q0enkrVzY4cTk1clo2L0s3VzdWRDlTK3d3?=
 =?utf-8?B?QlRZSytteFVzUmxJSTBRL1ZNN1JXWWNXOVBhVmlmVGZGL0RRK21wU0duZlI5?=
 =?utf-8?B?V1ArRDhYRW5jMU00a1pyN05RR1Q4bjNoUDZVMmFlTTNvd05La29WYTlsMkl1?=
 =?utf-8?B?WG5VYzY0ZWxZS1V0M3dyWi9mNHpnWWpRRHhPUnBxMTF1R2FtY3BXR3preVZ2?=
 =?utf-8?B?TTN0bDg0bFlQNDhieFNoejB6TEhtM0U1blZ3ajRWNUdwOVh5K2tDNWVqM3c0?=
 =?utf-8?B?UlUreWdWQ2V4Ymx1NlZMZnFJbGJzVTRxVTNlS085cHJVMmd4T0FGT1E3Ry9Q?=
 =?utf-8?B?L1drRk91VWRjTkFmSm1UbmtoaTExb0xBUE5wWlBmdHF6a0lQMWkyckpiQ2dC?=
 =?utf-8?B?enl1OXFFUjJaSi96RngwVXhrZEZTSXJnYjU2Nk1RQVA4ZlU4aWxhaitIQllY?=
 =?utf-8?B?dXlCeEV2VEJMUlFJcVh2K3hSelBvTS9lZWpDSE1zcjNqc0o0SktZWlN3Ykky?=
 =?utf-8?B?OVljYkkvWVd5MmFnNEpEQ3M4cU4vVENyVElYZjg2bDNyTkt5dzQ5aldxaEQ2?=
 =?utf-8?B?SE5pbnF5Wmk2MVQ5eWFGdUN6V0hueVZJRUtkSVpqWUZjTTkzUGxzSUgrSXhr?=
 =?utf-8?B?NmpQS2dvVjFIVDdldlRZZ1N2UVA0Wm13RWdSSkhFa3pHMUMwNnVneHlIZHdj?=
 =?utf-8?B?QzVMdDFKOWQ4LzhQM2tXelVDWmN4SzNrOWJIcmM2MW1yUUV2RU9PVlQrbFhV?=
 =?utf-8?B?WGFjYm82eGdacDBxRnNEaEtLMXJVMzJCcHZFRmFmRlgxa3RMUEFuYlJwdENk?=
 =?utf-8?B?NEU4RmR3L295L2J3M2RyNEErbldoaEQyeFFrbGxQSnhhRFNsMFhnUzUyV3pv?=
 =?utf-8?B?MjhTRXNBRC9RNkJiYk45NW41UFNtTm5xd1puaW9XelJoTURvaUNKZy80a041?=
 =?utf-8?B?QmZETnVWWHlZRmpQWXRkaXJyNXZUbzlaVUp0Q0hWSTM3MlZJM21XRTF1QytY?=
 =?utf-8?B?YkNHc0JBOHVTSlBFd2lXYWk4NG1Sblp0YzZDMmxwak1paTZUdXZibnBvK1Ur?=
 =?utf-8?B?bTRJdUpzaEdaSGxiUXI0Q3NCTnlrMTZiejNCMjBqNlI2bGI3Vk1IZlRpZk9k?=
 =?utf-8?Q?Hwms0x69MmdbwQIqeTSll+/Tt?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4155e5b6-2e84-4141-2813-08dcff16e60f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9505.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 10:28:19.7868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rS6/FBbkLiXflEoq00sk02M0kd/IK19D9bbfk957NdzWE22uHwT/x8WpbRR7uV7WfAvqTCYetnnw7pA0FAb8hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6438
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_022826_471306_FBE8161F 
X-CRM114-Status: GOOD (  14.70  )
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

On 11/6/24 21:20, Richard Weinberger wrote:

> 
> Do you really need distinct sysfs attributes for the fastmap and the
> non-fastmap case? Userspace does not care whether fastmap is used or
> not, all userspace is interested in is the mean erase counter value.
> 
> IMHO, the mean_ec attribute should combine the mean EC values from
> the fastmap and the data area.
> 
> Thanks,
> //richard

Hi and thanks for answering!

One of my devices have the following status:

/sys/class/ubi/ubi1 # cat max_ec_data
4672
/sys/class/ubi/ubi1 # cat mean_ec_fastmap
8869

If you combine the mean EC values you will not be able to tell that the 
fastmap area is much more worn down. For example the wear of your 
fastmap area could be on the verge of breaking the flash but that will 
not be seen on a mean value that includes both the fastmap and data area.

If fastmap is not enabled on your system then mean_ec_fastmap will not 
be visible in sysfs.

Thanks,
Rickard A.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
