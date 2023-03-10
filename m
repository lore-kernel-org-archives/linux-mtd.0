Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6E9C6FD1C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piBNE4CNZnto7vT98+LVt4DBrMZ6F0GLPD97+Mqnvo8=; b=Va1fQQE+1eiispcBfh52Xclxjh
	bPjkAyxjpBs5o3snOirkH7RMLjqpT2T1WtKJcTt6Ha+tVto+zTcwOYrCZ+0AVpSBMJgvZSQ6Py4FJ
	Qxx8wBHWOiTvDK67RdKKmA83w/LkfA6n36w2Tyx1HtmQaKGTvBZ7vs3Acp5/frLtXewz2Iu4F4lLk
	Ssvl49zy5vRdvUdEzzyW4k5tIsrponXRPqYNWeIVyZwgXkjjn6hfw9ZYP2o5hJzD16tIZs0KtAJli
	0ZE/GoiFMwIeJHBV03c/2oPk5z5IvGCpRFJ9DDnT8qqFAE2fyujlDal4giJA3lgPJXuDxaN1UPxKM
	C4/rDq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXzJ-00DcIi-Fw; Fri, 10 Mar 2023 08:20:29 +0000
Received: from outbound-ip23a.ess.barracuda.com ([209.222.82.205])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXzC-00DcGC-T4
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2023 08:20:26 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168]) by mx-outbound-ea46-244.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 10 Mar 2023 08:20:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMtET7YRXDyKqTDjaPYl1ms7KJhCrrrHFcdEPyygaexNviVW+qL+0UDDjVQ5rfEQ1QHWLfMgRgLimc4cNuuA+9AOtDgLW+ctr/5dSPUyRrASoNF03L6XpRiabsvz3OeTmIVi+kpmGNYCmsLt7y8Q7uKgob61Oz9Nuxcp5i4csHDsTyMs+PH/B8CeDOdy8D7MHgZ1J/7PPk/jjpoKEOHa6gyHrhVjvxtXy6lvFWM1pq4wF9IYqNkFiHZQscUcM6FVI/3o+ftFzWpxXe4n79UKaqAoJIdJkWBY7mDrKE1bwV+IbINUw+4KRqggBqHbGTMfAQwzKX1JZNugJwWrZAqT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDP3+S7gohDEKcsA7Tj4tXMyuN8meHSKPmVeluwsoCM=;
 b=Iivvp+n+hg7k+NPo9gg8jbx2AnSKYT/nR6Xxx5Y0B2R1JgB4W9tsqLhxOgXKp0XGMW8yB8lg6yAf+bgXdZaLvPIKs8FhwzcUcKQcth+RsnWIxnRjRsdnF23rfKueAHsXBCaKeOOvRQewUQJzMbibxaM2t1k9cDpNExjAE+s4EHZwo1xDZQ0Pg43DrKgX/g5EGrPWt1OZMbCd0tRkykm11q/2mgVQHlzIO7C7ilHanmqn7FleWSnk3t3HZU56hqyNNFopI1bwWyBpH6ZuCijwLuXUB/CN4nqR0tH+AbW38OV31hisoihw+fgeXQKycDVkP+lf+x1Hd5RotOai8T94Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDP3+S7gohDEKcsA7Tj4tXMyuN8meHSKPmVeluwsoCM=;
 b=ujD2cSXLghxuVTGixOYLLrZQFQQGM3sYk2qWZG6OJsPhXE/2guDwKHMi0V0Ss5q6fhtIakFI0ihWHmcU846CKGQ64joTgRMiCFtiXU8+rNRxUujN99Q8gNrhwk51s8JcPBMwXQOgeWsVnYJg8LYTFH1CZR4qlk/qRCEL0IAg9IuJ2MHPzBiFhnM8RCrJHuvnGJhxWN7QHxlyuny1ph8rt/RsIQAeenLCEARQti8SVTcnBCorgicQPikJCxzIgn4jozN6k93IFL8rIObABaH9OMZ+CzYxvbEMI8ZZqMOL733w+dJe7S3oVVsQVt01SxvMRDc36s2DvEMR7gUDyQW4nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by DS0PR10MB7175.namprd10.prod.outlook.com (2603:10b6:8:dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 08:20:17 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124%2]) with mapi id 15.20.6178.020; Fri, 10 Mar 2023
 08:20:17 +0000
Message-ID: <7e792a4e-923c-ae25-e405-f3c0a569cdb3@digi.com>
Date: Fri, 10 Mar 2023 09:20:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5] mtd: rawnand: hynix: fix up bit 0 of sdr_timing_mode
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: herve.codina@bootlin.com, linux-mtd@lists.infradead.org, sashal@kernel.org
References: <20230310080609.1930869-1-hector.palacios@digi.com>
 <20230310091055.21296243@xps-13>
From: Hector Palacios <hector.palacios@digi.com>
Organization: Digi
In-Reply-To: <20230310091055.21296243@xps-13>
X-ClientProxiedBy: VI1PR08CA0261.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::34) To BY5PR10MB4370.namprd10.prod.outlook.com
 (2603:10b6:a03:20b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4370:EE_|DS0PR10MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b843eab-39a1-4b05-2e68-08db214047c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	r6dF2eO4N3cGTOxkJ6nBJ1uxFDnn00ba3UL9HZw3dl8k2PSHLZo+CYPt8rorzriySV9WB+McVjELs1wAsBjULokHmEY5DfQgPAoNcrRKpEQDvjKCUjNAHpZV3pC91sIymAEqSdBQhH9a09P3KFtsAZySTH5YbDvwld9DY02yXVNXKsIvglv07A/cix8KprnZDT+m98cUoNKfw28kbRO2kn7tcOezDILQpR5/+G6CkF9iIc88ujCRH/Y4ThE3iFRT7uFfHYEAumh2ODgNFqG2R9rOdHClCUBiiLLv6rfWD+6JnROIBJTWfL02WY5f2Zg97ef+h+rQzY13l2++OnKFFllMkLv7U1mzWLTMghuWgMQ0mVTDRLxPTjXAK0odusTbG56lQa6tDBqnIV0BDvsZ8IK1rpIzH0gw2+eGBKNONnejfID42QPw8/Jsg97srw/L+nDDZHbd0T15OF8c/y0z2TEuQ7lp1KIErBXZI4NWz6ak8KKFGqdZKRhs+cRMdCWq9WQ4RxgALSNnS00cHRKFVMzkOBkCKWRg5EXVEMUI4GoY6NdrmgWo/eK4BES4KfVG47WwBgtYn3tMFCa/rMHGdbN/t8/Kjgt62M0qAxvFJJg4eCFpO2vTVlRp7TdeBUMToRQtQo9a9K5p2KlM8ZQLjKZ/LaA2nH+X9auc2bZs+AIyAMUg+PpsqiLpsgUWP5QOw30WRfyA1yxxJiItaqkcmZzYoKDntpPZZilL44+ELuU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(451199018)(186003)(38100700002)(66476007)(5660300002)(8676002)(36916002)(66946007)(66556008)(6916009)(966005)(6486002)(31696002)(4326008)(8936002)(316002)(86362001)(478600001)(53546011)(41300700001)(6512007)(26005)(6506007)(36756003)(6666004)(2906002)(31686004)(66574015)(83380400001)(2616005)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Yjl3eW53RlhIcFN4YzdleGkwUTB4RFlmVUxGSWM3S0Z2dURxeDA0MlZRRG9l?=
 =?utf-8?B?bEtLTjhNb0JPd1I2SWl2dmR6RnBwcEsxNzJ6bVRabmtVQ2tmZVhpSDRvNzBn?=
 =?utf-8?B?VE1UbWRVaDNFckRaSXVuNFRaalVTbVIvT0hab1dhNUZqSVhUejJnTXR1Z0xT?=
 =?utf-8?B?d3hrL1l3Q0Y4Q0MrNE1JMk1MTHk1Z0ZJeUFGeTFUOTNiUXB0WTBxUEQ0TU5W?=
 =?utf-8?B?N05GUTJvWHJQbFZPeDJ2aDYyRkl1VkpyMjdLeTBYVHJ1eWhNanUvaFZlenNZ?=
 =?utf-8?B?LzZNQ1U0akpDODY1MXkxcWtBbnFOMk1mZ2xvdFRwNDEyUHNLbCsrTDAzTjRk?=
 =?utf-8?B?cENNTnFNZnJJaGZwV2NqSzd0Qlh1S3VSOGtQYm4zd2RLeGVmdFhiWktJYlFq?=
 =?utf-8?B?empQbldvd1lvMlk3WCtRUWtxZk5FcEdVSDNzZXRsbk82ckJ3eXpEZXlGZk03?=
 =?utf-8?B?MUdETFM0WGNuSG9KNW0vU1pVSEtTYVVrbU1lcFRvUkRncGpKVUtENm04anpT?=
 =?utf-8?B?Z3d5MVIrS0hsTTNWZWsrVFpsc01WOHZ6SlZ0RjVhajFvVlNUSlY5Z3V5b3dG?=
 =?utf-8?B?em5xUUxyaHRiUnluZW44cmRjTVdibmt5dG5zZk1VdXk0YzRoUWNBQ2VUUXFT?=
 =?utf-8?B?bDNyczRVUjhuOURITXIrTW9nOHljWjUwdk5tMmcvMitqSzUralJNWmhhRHNs?=
 =?utf-8?B?VnNUTHBMb1c2YzRHSmhpNVEzajJLSW5uK0kvQk1VQ2ppbXU3SGxXbWFMdWlF?=
 =?utf-8?B?N0tSQWp4Nlp4alhkaS94RDREOUd4NDlCam9IZ0VGRlZvQXcybGx2T0pQNkZP?=
 =?utf-8?B?L0xrSjJ3OC9rbC9pVkF2RUpXUS85WlRLbjBPWFpadU94eGJPdFlOSGc2R2tX?=
 =?utf-8?B?THVEUVh3WGlFZ1lySExQS2RlTFVzN0NMYzM1OVI3OU05VzdDVVdIZUdIYmZo?=
 =?utf-8?B?YW1PdjgwaFFjdXNLa0ViMUtNZW1pQnlDOHYyMk1zUmpJRHZ0YjdPM0NCZ0VQ?=
 =?utf-8?B?aEVSM3BsejFOSTljMlRIN2YzMXY2ZlprMXVhL1ZmbVVsOWtFTzQ4RFVma21H?=
 =?utf-8?B?c2diYk05eUZEMm5KSHRnR0s4RER6YW9NbmMydi9ERDNYUFgzZGp2OElpVVM1?=
 =?utf-8?B?Zk9UWVQ0ZWsrb01iUmszWTNaWVlHakE3dlZIZ1I4Y0lwOG55QUhOUHY1dnJ1?=
 =?utf-8?B?bFFJWXMwbVc0RnBiVzRvOEdGN2hYUElCQUU1MWw3eSt2bGg1ak13Tjc1MGdu?=
 =?utf-8?B?OTBKR1pDc0Q2NjFJUENyMHMzQVl5cW1ZVzZRSGlYRU5PZXRyNnRlbGJDalBO?=
 =?utf-8?B?SFYvWVlkWUhWTGR1MHVRRHJqeTFrL01KdnhWNXBJaDUrSzRmVDdsT3lNQWFE?=
 =?utf-8?B?SFNJTm9MQ0d2SWJITWZTcS9NNVg4bWNMcUN6cTM0c200dWRBWC9aQXRxclJP?=
 =?utf-8?B?dFc0YVpMOUxQaGVtL2lSR2ZXY1ZIQzFkQTVSM3Z5b0wxRm8rZm9CWmljTFZS?=
 =?utf-8?B?V0lYMGJsTFVkMnc4OGtRbWpEekpzTGo3U3hTWHdpd3lra3J6UDZQNHluYlFU?=
 =?utf-8?B?b1FkNkVpRDJPYXl1dnZTb1l0a08wczN3bmNBQ2l4K1A0ZG9lY2xGQmVWY0dL?=
 =?utf-8?B?UGMvTlVyZHVXaTVXSUJFQzhmdUc4OVBBeTRzYkZyYjlOQTNMWExaUmhqS1hQ?=
 =?utf-8?B?cWQrOFJWUnZCUE9OZVljYWdVeFk1aGtFRlBLZThWSzliWDZWRnJjZGlZejV2?=
 =?utf-8?B?dTJ1SUFlY2hIRGFxL1RJQ2hIWllJbTNUM1B5aTNlbUZWbDZvQ1BVVm4yRzhq?=
 =?utf-8?B?V2hpMlpOTXVEVXl0azJpb2Zhdy9xd1RZWWpwWFUrWVROZzZXQXhFTHdoRCtL?=
 =?utf-8?B?eENRNmljUUJ3cG5jTnlIeVNVZC9keTVSSzNTZGJtMUZTYnBZcDZqcFI3czJZ?=
 =?utf-8?B?eTV1QXpHQUxWRnlpZW9tUmZVeHc3RXBpR2MxNUJDQUd3V2JFS3dEeE5QczB5?=
 =?utf-8?B?TzJrVGNOemdubHBLZlVLMEZBajRndm14ajFicHFpL3ZyZE5meDV5dHBvNjMz?=
 =?utf-8?B?dWVGWUJvdHFPY0RiT04vWmg3bU5WMDNIM01ITStUbE1tVlRxeDVaQ1JBVHA2?=
 =?utf-8?Q?9DChngW1IYqQJZkfr4gRma4s6?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b843eab-39a1-4b05-2e68-08db214047c6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 08:20:17.1351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/EIa/Xc8YMdg3lgXkYQ0aijfoaHhcuPj1buIWDqyHwIrgLq5/hqpFXeCnu12jh/IpOqdOsEjBkVnlwufT+uiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7175
X-BESS-ID: 1678436419-112020-26514-90692-1
X-BESS-VER: 2019.3_20230310.0009
X-BESS-Apparent-Source-IP: 104.47.58.168
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVsbGlkZAVgZQ0CDJKDHNIiUtyS
	QtzdTSwMwoNTk10STNMi3J0DA1KdFMqTYWAHct2FxBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246691 [from 
	cloudscan16-67.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_002023_089656_C73CFF53 
X-CRM114-Status: GOOD (  26.96  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdcOobCwKCk9uIDMvMTAvMjMgMDk6MTAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gW0VY
VEVSTkFMIEUtTUFJTF0gV2FybmluZyEgVGhpcyBlbWFpbCBvcmlnaW5hdGVkIG91dHNpZGUgb2Yg
dGhlIG9yZ2FuaXphdGlvbiEgRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBz
YWZlLgo+IAo+IAo+IAo+IEhpIEhlY3RvciwKPiAKPiBoZWN0b3IucGFsYWNpb3NAZGlnaS5jb20g
d3JvdGUgb24gRnJpLCAxMCBNYXIgMjAyMyAwOTowNjowOSArMDEwMDoKPiAKPj4gQWNjb3JkaW5n
IHRvIHRoZSBPTkZJIHNwZWNpZmljYXRpb24sIGJpdCAwIG9mICdTRFIgdGltaW5nIG1vZGUgc3Vw
cG9ydCcKPj4gKGJ5dGVzIDEyOS0xMzApICJzaGFsbCBiZSAxIi4gVGhhdCBtZWFucyB0aGUgTkFO
RCBzdXBwb3J0cyBhdCBsZWFzdAo+PiB0aW1pbmcgbW9kZSAwLgo+Pgo+PiBOQU5EIGNoaXAgSHlu
aXggSDI3VTRHOEYyR0RBLUJJIChhdCBsZWFzdCkgaXMgcmVhZGluZyBhIDAgb24gdGhpcyBmaWVs
ZAo+PiB3aGljaCBtYWtlcyBuYW5kX2Nob29zZV9iZXN0X3Nkcl90aW1pbmdzKCkgcmV0dXJuIHdp
dGggZXJyb3IgYW5kIHRoZQo+PiBwcm9iZSBmdW5jdGlvbiB0byBldmVudHVhbGx5IGZhaWwuCj4+
Cj4+IEdpdmVuIHRoYXQgc2RyX3RpbWluZ19tb2RlcyBiaXQgMCBtdXN0IGJlIDEgYnkgc3BlY2lm
aWNhdGlvbiwgZm9yY2UKPj4gaXQgaW4gY2FzZSB0aGUgTkFORCByZXBvcnRzIGl0IGlzIG5vdCBz
ZXQuIFRoaXMgaXMgYSBzYWZlIGFzc3VtcHRpb24KPj4gYmVjYXVzZSB0aGUgbW9kZSAwIGlzIHRo
ZSBtaW5pbXVtIChzYWZlcikgc2V0IG9mIHRpbWluZ3MgdGhhdCB0aGUKPj4gTkFORCBjYW4gd29y
ayB3aXRoLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIZWN0b3IgUGFsYWNpb3MgPGhlY3Rvci5wYWxh
Y2lvc0BkaWdpLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KPiAKPiBBY3R1YWxseSB5b3Ugc2hvdWxkIG5vdCBhZGQgbXkgU2ln
bmVkLW9mZi1ieSBsaWtlIHRoYXQuIEkgd2lsbCBhZGQgaXQKPiB3aGVuIEkgdGFrZSB5b3VyIHBh
dGNoLgo+IAo+IEluIG9yZGVyIHRvIGNyZWRpdCBtZSAoYW5kIHRoYXQgaXMgdmVyeSBraW5kIHRv
IHlvdSkgeW91IGNvdWxkIGhhdmUKPiBpbnN0ZWFkIHVzZWQgU3VnZ2VzdGVkLWJ5LiBJZiBJIGhh
ZCBkb25lIG1vcmUgdGhhbiBqdXN0IHN1Z2dlc3RpbmcKPiBzb21ldGhpbmcsIGFub3RoZXIgc29s
dXRpb24gY291bGQgaGF2ZSBiZWVuIHRvIGFkZCBhIENvLWRldmVsb3BlZC1ieQo+IHRhZyAoYW5k
IHRoaXMgdGltZSwgbXkgU2lnbmVkLW9mZi1ieSB3b3VsZCBoYXZlIGJlZW4gcmVxdWlyZWQpLgo+
IAo+IEFueXdheSwgbm8gbmVlZCB0byByZXNlbmQsIEknbGwgZml4IGl0IHVwIHdoZW4gYXBwbHlp
bmcuCgpPaCwgc29ycnksIEkgdGhpbmsgSSBpdGVyYXRlZCBvdmVyIHRoZSBwYXRjaCBpbiBuYW5k
LW5leHQgdGhhdCBhbHJlYWR5IApjYXJyaWVkIHlvdXIgc2lnbmF0dXJlLgpUaGFua3MgZm9yIGFs
bCB0aGUgZXhwbGFuYXRpb25zIGFuZCBwYXRpZW5jZSEKCj4gCj4+IExpbms6IGh0dHBzOi8vbGlu
a3Byb3RlY3QuY3VkYXN2Yy5jb20vdXJsP2E9aHR0cHMlM2ElMmYlMmZsb3JlLmtlcm5lbC5vcmcl
MmZsaW51eC1tdGQlMmYyMDIzMDIyMzE2NTEwNC41MjU4NTItMS1oZWN0b3IucGFsYWNpb3MlNDBk
aWdpLmNvbSZjPUUsMSx3c3ZqdnFvMWp0MDI5SDVaZkhHeTI2eWtHckNMNmZVa1BpQnRuUGlCc0RN
XzZySnJwWDh0MThORTM4ZlExcFZmVzc1UGRkVXVOODBQWnBZMUVLRGJpRUFlVWtzUkhGX1B2Tm1C
TXkxdElpYllXZXkxJnR5cG89MQo+PiAtLS0KPj4gdjU6Cj4+ICAgIFNpbXBsaWZ5IGJpdHdpc2Ug
b3BlcmF0aW9uLgo+PiB2NDoKPj4gICAgRml4IGJpdHdpc2Ugb3BlcmF0aW9uIG9uIF9fbGUxNiB0
eXBlLCBwZXIgc3BhcnNlIHdhcm5pbmcuCj4+IHYzOgo+PiAgICBGb3JjaWJseSBzZXQgYml0IDAu
Cj4+IHYyOgo+PiAgICBNb3ZlIHBhdGNoIHRvIEh5bml4IHNwZWNpZmljIGZpeHVwIGhvb2suCj4+
ICAgIFVzZSBCSVQoMCkgbWFjcm8uCj4+IHYxOgo+PiAgICBJbXBsZW1lbnQgZ2VuZXJpYyBwYXRj
aCBpbiBuYW5kX2Jhc2UuYy4KPj4KPj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2h5bml4
LmMgfCAxMyArKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaHluaXguYyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaHluaXguYwo+PiBpbmRleCAwZDRkNGJiZmRlY2Uu
LjM5MDc2NzM1YTNmYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9o
eW5peC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfaHluaXguYwo+PiBAQCAt
NzI4LDggKzcyOCwyMSBAQCBzdGF0aWMgaW50IGh5bml4X25hbmRfaW5pdChzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwKQo+PiAgICAgICAgcmV0dXJuIHJldDsKPj4gICB9Cj4+Cj4+ICtzdGF0aWMgdm9p
ZCBoeW5peF9maXh1cF9vbmZpX3BhcmFtX3BhZ2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbmFuZF9vbmZpX3Bh
cmFtcyAqcCkKPj4gK3sKPj4gKyAgICAgLyoKPj4gKyAgICAgICogQ2VydGFpbiBjaGlwcyBtaWdo
dCByZXBvcnQgYSAwIG9uIHNkcl90aW1pbmdfbW9kZSBmaWVsZAo+PiArICAgICAgKiAoYnl0ZXMg
MTI5LTEzMCkuIFRoaXMgaGFzIGJlZW4gc2VlbiBvbiBIMjdVNEc4RjJHREEtQkkuCj4+ICsgICAg
ICAqIEFjY29yZGluZyB0byBPTkZJIHNwZWNpZmljYXRpb24sIGJpdCAwIG9mIHRoaXMgZmllbGQg
InNoYWxsIGJlIDEiLgo+PiArICAgICAgKiBGb3JjaWJseSBzZXQgdGhpcyBiaXQuCj4+ICsgICAg
ICAqLwo+PiArICAgICBwLT5zZHJfdGltaW5nX21vZGVzIHw9IGNwdV90b19sZTE2KEJJVCgwKSk7
Cj4+ICt9Cj4+ICsKPj4gICBjb25zdCBzdHJ1Y3QgbmFuZF9tYW51ZmFjdHVyZXJfb3BzIGh5bml4
X25hbmRfbWFudWZfb3BzID0gewo+PiAgICAgICAgLmRldGVjdCA9IGh5bml4X25hbmRfZGVjb2Rl
X2lkLAo+PiAgICAgICAgLmluaXQgPSBoeW5peF9uYW5kX2luaXQsCj4+ICAgICAgICAuY2xlYW51
cCA9IGh5bml4X25hbmRfY2xlYW51cCwKPj4gKyAgICAgLmZpeHVwX29uZmlfcGFyYW1fcGFnZSA9
IGh5bml4X2ZpeHVwX29uZmlfcGFyYW1fcGFnZSwKPj4gICB9Owo+IAo+IAo+IFRoYW5rcywKPiBN
aXF1w6hsCi0tIApIw6ljdG9yIFBhbGFjaW9zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
