Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E035EC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EkpPTJUrGsOUnG3pzDqKlcvSyMOfUQUCKGnONbUSmPw=; b=1XtmLuwhgqGAB+f9Q3NvbgnLlB
	+JL8VDZSNiElgueHOnKoSM/VS886F+lzdYkzWz20frtfQPBsH53GJ1YWgyASrfY1CmZoHXP2vRNuj
	4m9dgCYbVXCkfwRlbFp3L5Ztb6T+3JeNsx3WQF0i9Ig0e7di76nBTjIZvk+j4KWBxfbjNt4GW6X+B
	YyoJ7KjsrA6JmX7g0+JrdQta1i4tt+o5nnDs3PynuV0wVehskWHdV4c3L6utOZc3gvulUiRMQxXaX
	ZHSz84TA8pYCCENBld+1drsd3KIDOlA6kyPEr1E7C/Ryxl0VCnfNflRw+9zidJ84hVkvDNSuxu3RQ
	OVUPpxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olo11-006flX-C4; Fri, 21 Oct 2022 09:08:31 +0000
Received: from mail-co1nam11on2084.outbound.protection.outlook.com ([40.107.220.84] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olo0x-006fjb-Jp
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 09:08:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OW0DPQxIQU8IP8X1mGjx3ZsJkRrxzHcalxezkkFt3H3Zvo+6NoVOOYIs/b10F7rD4JrBBrq+XGqYQXctwjQJcTd6cSghbWLielSFV0edR/1V/xXavemaUvvj7grnFTq9Go3FHaT3XQcgHbfHE8TYkTqRP4PFQRWlWFc2o0aOu98PoL4K0uiwVCLOyulDVP0LEWSvxoa4t1ASl+RtEm0w7VRDyKWH7cm61sEOXZY0sDygXXdpuIw2612VuN1JGlWAUxKLN9I76HBjZE4YL789jFpgRzpNE5SXXOu/Nxz9yIR15EjdQy3fbYlHw51NSYvmvNRGPOwRFkKFGuxTii+Q0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3k4FC4tJYJ7Lzft75iYSUZSubYwrp9SzcCTYm8uutv8=;
 b=DQAC94U1nbtpTGobvOyRKD4vHM7qZo0InXbWB9Eym8mcGfq9Epz7ag2VPohE7z6dJEOHGqnIVkyGbCbv/lFTjayMw40gybpxvRx5VP2GfJQdTTtU03Q1GVujQ+9+0UHpmTgG7Pd/Xc3+JKJwiPitFPpZS8VHOJ2ysiM270930sfagRuQm/K6s55wkVrA6lRzszU7/AH7jtw+nJJ7z8S/tvI1GWF+7ClVe2ARDeO1BbLKSGE+Mbevf0hSj9qAvk0kfDAh8CigYL7djiCd/bVR2w1tREHm4HaJK2QgLZRaW1l1hCzTs/VQiXKTXTyGra5cv+JWjJXsJKAiVs9w7Hg82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3k4FC4tJYJ7Lzft75iYSUZSubYwrp9SzcCTYm8uutv8=;
 b=T0iSEHJe2B1Z4mCwh8GGbKOD2Ond3ygeQjm/DqIzOjS9kM4ZCKSxXeD0h/OJJ+fLjkTOgwJ9EP/ISZhBgG9545JSX1ZBdLqL+g75ZdOdcJsnuaranpkK2j7Wdn++cw1UpRDLSxedjheDsoI2Y9B4pigNgo2vQYrfniy5jjfnaYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB7356.namprd12.prod.outlook.com (2603:10b6:510:20f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 09:08:20 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 09:08:20 +0000
Message-ID: <78f84006-955f-6209-1cae-024e4f199b97@amd.com>
Date: Fri, 21 Oct 2022 05:08:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 00/11] fix memory leak while kset_register() fails
Content-Language: en-CA
To: Yang Yingliang <yangyingliang@huawei.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, rafael@kernel.org, somlo@cmu.edu,
 mst@redhat.com, jaegeuk@kernel.org, chao@kernel.org,
 hsiangkao@linux.alibaba.com, huangjianan@oppo.com, mark@fasheh.com,
 jlbec@evilplan.org, joseph.qi@linux.alibaba.com, akpm@linux-foundation.org,
 alexander.deucher@amd.com, richard@nod.at, liushixin2@huawei.com
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
 <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
 <Y1JZ9IUPL6jZIQ8E@kroah.com>
 <f1210e20-d167-26c4-7aba-490d8fb7241e@huawei.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <f1210e20-d167-26c4-7aba-490d8fb7241e@huawei.com>
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d61743-7a6a-40cc-4d66-08dab343cc51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	OWZfTnU9vpHZPckWRCiSry5n8OZPWtn1I/if5irOf7KjcbUxxoQcBU3mZYdWCmi2XlikT17oHZWq/IXoY+VEjfkqupSFvHTYa8Ui2wKiI1yBGeVpSxtznlG+rOq9UCdb7JHeMSSgfkOWhT1q0MKKddAmKagpcg6bqLQd4+BkA2tLjxrP65zNhWPFdgMLI4Z7GZ8zdGR1yArccvCLeOrE4ifF4f7kb3pEAdAGH3XZ+1eQ1w1My8E4B+m9GYH5SbCjSxwbwfoWxtOafnw62SQu5C0Z/LXPeuR+qDvoIu57bVprmb09NwdlxLUX5pE2h+KTyJjAbWgP+OF9gT1ZtoR8xdUW3xx013mQ58QtfVf+YRsM69sCZn9NUZ2bag1PN731JpPXUwSOZ9sh9aPgFchFkKWWoBj4PmIzT3jBJZAOKBsvjOmSMUXO0inr8LPAF2iBJJ2jumqRUqfDjSKITmyDCWNcZGcm6jKTGN6fAQho3JlxmZ7p/i+NQ/YNrlBWnLAk8vNPK40Z5tTo5WzdCYGsS/ECmFHyBjrEHTuH2wRKOneTQsx5W+I/szunq56iq/7xVf4BjvXaapdiuGPaZ2s8NxiJov0hgyXnYpujK5a5UKhaFlhGzvzsxy+feSDwG1PzWj6gBvtjhD+5dSOvfLCtgllsTxHQGeArjop36sLgNwV93P5NJ8CNeVePjoidHzNQWo022GpXbpZ5qdpW1k/KjYrIjSCErgIQ/JNCxJxvQI8NZaNqJxF/Lv2dIdVJsBeS6ZtIknYfYpEFQj7neXQrUGSG1Qj/Pa/MK7/ibOZfCfi6+titumFB6CUinl1m2PH4c38YqeGutZie0a/D+xnOxKOZLZYHY69ya5I7nLm87C5psgVRuKPJdySLWLGdNyDQ
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(186003)(38100700002)(2906002)(31686004)(4001150100001)(2616005)(478600001)(966005)(44832011)(45080400002)(6486002)(26005)(66476007)(66946007)(53546011)(31696002)(110136005)(36756003)(41300700001)(6512007)(7416002)(4326008)(66899015)(6666004)(8676002)(86362001)(8936002)(5660300002)(6506007)(66556008)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?aDlOdFhXcGY3MzN3OFQ4d3hqandIWVZXcGl6Q0xjeGlyUWhPV2U3SU1CTTY0?=
 =?utf-8?B?OS8veWFJaFZkRnZ2eVdNTDVlMzBJZWNVT2l6WWxDZ2tkd3ZTdkJodW16ZTRl?=
 =?utf-8?B?SGpMMGdCcmxnY3ZPakJxWkhjY1JhZUV6aU15SHRPMFZTbkxDZS8wWm9zM2lE?=
 =?utf-8?B?Wlh4ZmlXTDFqazZDTVRLTmJ3eWM2eUF5amE2amdJelY1QUg0R21JSFpUZ2Nr?=
 =?utf-8?B?SUh3WXNxUVYvanV6RFVxc29NL3BaRjI3b0Mxalp3K3loYVo4WVdYVzlra1Zw?=
 =?utf-8?B?U0VJUFl4NlZrUGlsT2tsZVZTUXEya0M5K0MxVTlqeDVXODMzdTlZZnpIcW11?=
 =?utf-8?B?Ukx5dHJzVGpJOVRDYzlMWlNVZUs0QkF5eksxT29ncWk3WnY1enpOVFQySldm?=
 =?utf-8?B?cFJESVVEZFF2aEtLTlZaVFQvRnNrWStMREx1Q2ZjSUk3Q2svTXdwVDR2Szlw?=
 =?utf-8?B?RFJWSjFvZUxRdFVabm54K0N6UVNCUEJURDJhY1pmUFRicmducnFyN3JLcGlN?=
 =?utf-8?B?QUZqL0JmT0toN2lSUXRCMzN4RklVWHEwQjYwY2pTQmkvWldMaFdKT1RhNktq?=
 =?utf-8?B?SElmQXBoSS9wNHpDRXJRVkNmMXlyVTJQUEh1S2QrdjlFeDR4MVMvbjhwcEZJ?=
 =?utf-8?B?OUlLa3JwenRib3c4d2JTSTBkTjRtTXp6TDNQajVOOWdWRlpXc0VjcktzUnhM?=
 =?utf-8?B?ZVpjU0RLUFdPSWpLb0RlS2drVGdNYzZKNGF3d0ZOeGFGeEhobHdXUXNiRC9V?=
 =?utf-8?B?MndjUWFXR2hEL2szVW5zMmxXcDBOb0puV3pDT1c4MTBZZFEwMmNHc2RjVlpo?=
 =?utf-8?B?QStIM21HcGVFVHpJK3pQeTFjS2NuMnN0SVFWeklXY1pWR1lmVUM4K3ZsaUFu?=
 =?utf-8?B?dm1OcVlTNDVqZm94NUxNSm9CdUlsQ2pWamNLcVZwWXdmSXd2YVllUlBiRjgx?=
 =?utf-8?B?MlQ2TjZNME51b0V5ZVMvdjFLcXF4RlNYRHpUaEdjQ0k5RUU3UjVFQU1sekFl?=
 =?utf-8?B?dnllVFIxYUd6Q21rdUhaL2QyNU5qelZrWmdKamdiZlhFbG50WGtSOE1qWGx5?=
 =?utf-8?B?WXRZVnR2bFkzd0t5R0NVejIyZXZUN0NHS1dWaDczWTVKb3ROb1lCb0tWSnFB?=
 =?utf-8?B?SCtwdytycFNlUFlMYTJQc2lNTGx0RnI3Y2d4dENpNnJFY01zMkY5K0pmdnM1?=
 =?utf-8?B?cXN0cWp2NG1JVER3ZXFjQ215cW9DTlprdEN5bjdPNUd1MTVFSFU0TitjeFJM?=
 =?utf-8?B?MmxIdnVrT0w2d0lzbVhoa01Tc3FNamZlTFRVaEhGbFdiRU1LRzBSSmlYTTFH?=
 =?utf-8?B?Q0pMekswQnJzVHNXS1VhYTN2UjdkeHdMQjJLbDRTT2FJWTFkMUd2ZHFXNFlh?=
 =?utf-8?B?ZldnOXp5L2lWN25yRzVHTFkvdmtDelA0ays5T21Bd3lCWEhzbmhuNDlJZUNv?=
 =?utf-8?B?NWhlalpINDJURTdSR042QmlkQ1lnOE43dS9DNGJiY2lTQytCbXJOT1paVlhC?=
 =?utf-8?B?YWlrRE0vSDg1TTZaQWFXVTZqSWd1NGpwZTh4R09SR1hyZVVpK0ppNTlkcmwx?=
 =?utf-8?B?dVMrQXB6WmJSWmZGd1g0ZGZHOHZleG9sUnFVQU5zTlZMRVB3UkJDVUduN0th?=
 =?utf-8?B?ZTZCMVgrZGtVMkV3VEs2QkpaSUFMYnY1SFJLMTVZbk1OcTBHUlJyNnFhRGZ5?=
 =?utf-8?B?Y2RGaGdHNHV5SWN0TnBwUTdZaGI5ZXRGTE53NUpxbDQ3SmxpU1EzdVFHZXRU?=
 =?utf-8?B?UlBzZ0NEQWlEbzVVVTUrVDBNdTk1ZEd6ZklVRFlkYkdjWThXbTBQbTJZcXdZ?=
 =?utf-8?B?MjRpNEw2L0NWSld6UWVMNVpMOEY0cG9KRGJGdEJyMDJIcmJOZWVoNHpqbGNR?=
 =?utf-8?B?emxSZlJheTRuQVRxU1UvNWJTR2x0bjNvZG1FWXYybmNudlZHT1pEbnlxc3Vr?=
 =?utf-8?B?MTNkNGJDQklaajZqNXFTaWtibFNmR1NnUHVSK2J4UmJMTWVjWll5Z2pZcjA0?=
 =?utf-8?B?NlBnM0NWT0NiaDdDOVFqeUM4anVTeEwwVHNWUzgyTmdlUXpvMm82S2doQ0o5?=
 =?utf-8?B?UWZtUWUzdDlrTzdBSXI0Y3dzaC9SL00vRGFDSFRlaXh6aWFuaURKU3IwZWRJ?=
 =?utf-8?Q?nK6taBg6naes88DWeBghz1N3d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d61743-7a6a-40cc-4d66-08dab343cc51
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 09:08:20.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VBa1B4Bj4Z68NUzB461Fb2bHNyGtg5ulOr3lz8kkziiFdMuIX+87UPO2ZVBsxxJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7356
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_020827_788019_58DD8D41 
X-CRM114-Status: GOOD (  24.92  )
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

T24gMjAyMi0xMC0yMSAwNDo1OSwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4gCj4gT24gMjAyMi8x
MC8yMSAxNjozNiwgR3JlZyBLSCB3cm90ZToKPj4gT24gRnJpLCBPY3QgMjEsIDIwMjIgYXQgMDQ6
MjQ6MjNQTSArMDgwMCwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+PiBPbiAyMDIyLzEwLzIxIDEz
OjM3LCBHcmVnIEtIIHdyb3RlOgo+Pj4+IE9uIEZyaSwgT2N0IDIxLCAyMDIyIGF0IDAxOjI5OjMx
QU0gLTA0MDAsIEx1YmVuIFR1aWtvdiB3cm90ZToKPj4+Pj4gT24gMjAyMi0xMC0yMCAyMjoyMCwg
WWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+Pj4+PiBUaGUgcHJldmlvdXMgZGlzY3Vzc2lvbiBsaW5r
Ogo+Pj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGbGttbCUyRjBkYjQ4NmViLTY5Mjct
OTI3ZS0zNjI5LTk1OGY4ZjIxMTE5NCU0MGh1YXdlaS5jb20lMkZUJTJGJmFtcDtkYXRhPTA1JTdD
MDElN0NsdWJlbi50dWlrb3YlNDBhbWQuY29tJTdDNzRhYTliNTcxOTJiNDA2ZWYyNzQwOGRhYjM0
MjlkYjQlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM4MDE5
Mzk1OTc5ODY4MTAzJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFp
TENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0Ml
N0MlN0MmYW1wO3NkYXRhPVJjSzA1Y1htMUo1JTJCdFljTE8yU01HN2s2c2pleW1RemRCek1DREpT
emZkRSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Pj4+PiBUaGUgdmVyeSBmaXJzdCBkaXNjdXNzaW9uIG9u
IHRoaXMgd2FzIGhlcmU6Cj4+Pj4+Cj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3Rl
Y3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnd3dy5zcGluaWNzLm5ldCUyRmxp
c3RzJTJGZHJpLWRldmVsJTJGbXNnMzY4MDc3Lmh0bWwmYW1wO2RhdGE9MDUlN0MwMSU3Q2x1YmVu
LnR1aWtvdiU0MGFtZC5jb20lN0M3NGFhOWI1NzE5MmI0MDZlZjI3NDA4ZGFiMzQyOWRiNCU3QzNk
ZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzgwMTkzOTU5Nzk4Njgx
MDMlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYy
bHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZhbXA7
c2RhdGE9c0haNmtmTEY4SHhyTlhWNiUyRlZqZ2RIJTJCbVFNNFQzWnYwVSUyRkF3ZGRUOTdjRSUz
RCZhbXA7cmVzZXJ2ZWQ9MAo+Pj4+Pgo+Pj4+PiBQbGVhc2UgdXNlIHRoaXMgbGluaywgYW5kIG5v
dCB0aGUgdGhhdCBvbmUgdXAgdGhlcmUgeW91IHdoaWNoIHF1b3RlZCBhYm92ZSwKPj4+Pj4gYW5k
IHdob3NlIGNvbW1pdCBkZXNjcmlwdGlvbiBpcyB0YWtlbiB2ZXJiYXRpbSBmcm9tIHRoZSB0aGlz
IGxpbmsuCj4+Pj4+Cj4+Pj4+PiBrc2V0X3JlZ2lzdGVyKCkgaXMgY3VycmVudGx5IHVzZWQgaW4g
c29tZSBwbGFjZXMgd2l0aG91dCBjYWxsaW5nCj4+Pj4+PiBrc2V0X3B1dCgpIGluIGVycm9yIHBh
dGgsIGJlY2F1c2UgdGhlIGNhbGxlcnMgdGhpbmsgaXQgc2hvdWxkIGJlCj4+Pj4+PiBrc2V0IGlu
dGVybmFsIHRoaW5nIHRvIGRvLCBidXQgdGhlIGRyaXZlciBjb3JlIGNhbiBub3Qga25vdyB3aGF0
Cj4+Pj4+PiBjYWxsZXIgZG9pbmcgd2l0aCB0aGF0IG1lbW9yeSBhdCB0aW1lcy4gVGhlIG1lbW9y
eSBjb3VsZCBiZSBmcmVlZAo+Pj4+Pj4gYm90aCBpbiBrc2V0X3B1dCgpIGFuZCBlcnJvciBwYXRo
IG9mIGNhbGxlciwgaWYgaXQgaXMgY2FsbGVkIGluCj4+Pj4+PiBrc2V0X3JlZ2lzdGVyKCkuCj4+
Pj4+IEFzIEkgZXhwbGFpbmVkIGluIHRoZSBsaW5rIGFib3ZlLCB0aGUgcmVhc29uIHRoZXJlJ3MK
Pj4+Pj4gYSBtZW1vcnkgbGVhayBpcyB0aGF0IG9uZSBjYW5ub3QgY2FsbCBrc2V0X3JlZ2lzdGVy
KCkgd2l0aG91dAo+Pj4+PiB0aGUga3NldC0+a29iai5uYW1lIGJlaW5nIHNldC0ta29ial9hZGRf
aW50ZXJuYWwoKSByZXR1cm5zIC1FSU5WQUwsCj4+Pj4+IGluIHRoaXMgY2FzZSwgaS5lLiBrc2V0
X3JlZ2lzdGVyKCkgZmFpbHMgd2l0aCAtRUlOVkFMLgo+Pj4+Pgo+Pj4+PiBUaHVzLCB0aGUgbW9z
dCBjb21tb24gdXNhZ2UgaXMgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4+Pj4KPj4+Pj4gCWtvYmpf
c2V0X25hbWUoJmtzZXQtPmtvYmosIGZvcm1hdCwgLi4uKTsKPj4+Pj4gCWtzZXQtPmtvYmoua3Nl
dCA9IHBhcmVudF9rc2V0Owo+Pj4+PiAJa3NldC0+a29iai5rdHlwZSA9IGt0eXBlOwo+Pj4+PiAJ
cmVzID0ga3NldF9yZWdpc3Rlcihrc2V0KTsKPj4+Pj4KPj4+Pj4gU28sIHdoYXQgaXMgYmVpbmcg
bGVha2VkLCBpcyB0aGUgbWVtb3J5IGFsbG9jYXRlZCBpbiBrb2JqX3NldF9uYW1lKCksCj4+Pj4+
IGJ5IHRoZSBjb21tb24gaWRpb20gc2hvd24gYWJvdmUuIFRoaXMgbmVlZHMgdG8gYmUgbWVudGlv
bmVkIGluCj4+Pj4+IHRoZSBkb2N1bWVudGF0aW9uLCBhdCBsZWFzdCwgaW4gY2FzZSwgaW4gdGhl
IGZ1dHVyZSB0aGlzIGlzIGFic29sdmVkCj4+Pj4+IGluIGtzZXRfcmVnaXN0ZXIoKSByZWRlc2ln
biwgZXRjLgo+Pj4+IEJhc2VkIG9uIHRoaXMsIGNhbiBrc2V0X3JlZ2lzdGVyKCkganVzdCBjbGVh
biB1cCBmcm9tIGl0c2VsZiB3aGVuIGFuCj4+Pj4gZXJyb3IgaGFwcGVucz8gIElkZWFsbHkgdGhh
dCB3b3VsZCBiZSB0aGUgY2FzZSwgYXMgdGhlIG9kZHMgb2YgYSBrc2V0Cj4+Pj4gYmVpbmcgZW1i
ZWRkZWQgaW4gYSBsYXJnZXIgc3RydWN0dXJlIGlzIHByb2JhYmx5IHNsaW0sIGJ1dCB3ZSB3b3Vs
ZCBoYXZlCj4+Pj4gdG8gc2VhcmNoIHRoZSB0cmVlIHRvIG1ha2Ugc3VyZS4KPj4+IEkgaGF2ZSBz
ZWFyY2ggdGhlIHdob2xlIHRyZWUsIHRoZSBrc2V0IHVzZWQgaW4gYnVzX3JlZ2lzdGVyKCkgLSBw
YXRjaCAjMywKPj4+IGtzZXRfY3JlYXRlX2FuZF9hZGQoKSAtIHBhdGNoICM0Cj4+PiBfX2NsYXNz
X3JlZ2lzdGVyKCkgLSBwYXRjaCAjNSzCoCBmd19jZmdfYnVpbGRfc3ltbGluaygpIC0gcGF0Y2gg
IzYgYW5kCj4+PiBhbWRncHVfZGlzY292ZXJ5LmMgLSBwYXRjaCAjMTAKPj4+IGlzIGVtYmVkZGVk
IGluIGEgbGFyZ2VyIHN0cnVjdHVyZS4gSW4gdGhlc2UgY2FzZXMsIHdlIGNhbiBub3QgY2FsbAo+
Pj4ga3NldF9wdXQoKSBpbiBlcnJvciBwYXRoIGluIGtzZXRfcmVnaXN0ZXIoKQo+PiBZZXMgeW91
IGNhbiBhcyB0aGUga29iamVjdCBpbiB0aGUga3NldCBzaG91bGQgTk9UIGJlIGNvbnRyb2xpbmcg
dGhlCj4+IGxpZmVzcGFuIG9mIHRob3NlIGxhcmdlciBvYmplY3RzLgo+Pgo+PiBJZiBpdCBpcywg
cGxlYXNlIHBvaW50IG91dCB0aGUgY2FsbCBjaGFpbiBoZXJlIGFzIEkgZG9uJ3QgdGhpbmsgdGhh
dAo+PiBzaG91bGQgYmUgcG9zc2libGUuCj4+Cj4+IE5vdGUgYWxsIG9mIHRoaXMgaXMgYSBtZXNz
IGJlY2F1c2UgdGhlIGtvYmplY3QgbmFtZSBzdHVmZiB3YXMgYWRkZWQgbXVjaAo+PiBsYXRlciwg
YWZ0ZXIgdGhlIGRyaXZlciBtb2RlbCBoYWQgYmVlbiBjcmVhdGVkIGFuZCBydW5uaW5nIGZvciBh
IHdoaWxlLgo+PiBXZSBtaXNzZWQgdGhpcyBlcnJvciBwYXRoIHdoZW4gYWRkaW5nIHRoZSBkeW5h
bWljIGtvYmplY3QgbmFtZSBsb2dpYywKPj4gdGhhbmsgZm9yIGxvb2tpbmcgaW50byB0aGlzLgo+
Pgo+PiBJZiB5b3UgY291bGQgdGVzdCB0aGUgcGF0Y2ggcG9zdGVkIHdpdGggeW91ciBlcnJvciBp
bmplY3Rpb24gc3lzdGVtcywKPj4gdGhhdCBjb3VsZCBtYWtlIHRoaXMgYWxsIG11Y2ggc2ltcGxl
ciB0byBzb2x2ZS4KPiAKPiBUaGUgcGF0Y2ggcG9zdGVkIGJ5IEx1YmVuIHdpbGwgY2F1c2UgZG91
YmxlIGZyZWUgaW4gc29tZSBjYXNlcy4KClllcywgSSBmaWd1cmVkIHRoaXMgb3V0IGluIHRoZSBv
dGhlciBlbWFpbCBhbmQgcG9zdGVkIHRoZSBzY2VuYXJpbyBHcmVnCndhcyBhc2tpbmcgYWJvdXQu
CgpCdXQgSSBiZWxpZXZlIHRoZSBxdWVzdGlvbiBzdGlsbCBzdGFuZHMgaWYgd2UgY2FuIGRvIGtz
ZXRfcHV0KCkKYWZ0ZXIgYSAqZmFpbGVkKiBrc2V0X3JlZ2lzdGVyKCksIG5hbWVseSBpZiBtb3Jl
IGlzIGJlaW5nIGRvbmUgdGhhbgpuZWNlc3NhcnksIHdoaWNoIGlzIGp1c3QgdG8gZnJlZSB0aGUg
bWVtb3J5IGFsbG9jYXRlZCBieQprb2JqZWN0X3NldF9uYW1lKCkuCgpSZWdhcmRzLApMdWJlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
