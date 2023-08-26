Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD02CC83F11
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Aug 2023 13:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A1GywAvTLp3DWlqSZ82f9vg72IxV3mEYiPbmI6HaJ7k=; b=Qjq5iH9J9mA2E8A01JYn3/moRQ
	LRhtAHtgyNbpIhLgHKs2/Rgl/i58zCzAHN3k9l71sEkHvYuFDk7wNyj/oVnML2PmRjzDfhTghUFcG
	EzSfFiBSWeLmSeO0sIUd6Gr05rRU4KPNDDVJv54L2g0atDM5dDMF6q5cJkhh9s/LSMQrHt3FL9HGX
	73yuiVVXfle06uc/iEf4WufifAqJ897tctoT+9PYS/vLRKcQjU24i2BKNKwXP3+CUoOCw+SgkP+nU
	I+bGSDBuRFFPwnmjrq5YIIlRA7Jtvp84GRnsICGXbpz5wU+KrxtWDKZjoRhSOSbEFoT60YNEGgJa6
	g1o7gyCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZtQd-006wSU-1J;
	Sat, 26 Aug 2023 13:34:15 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZtQY-006wSB-3A
	for linux-mtd@lists.infradead.org;
	Sat, 26 Aug 2023 13:34:12 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37QDLjU6016460;
	Sat, 26 Aug 2023 06:34:02 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3sqgwk8576-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Aug 2023 06:34:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyNuwPJ8iNJHNHup1RDiPJ1wRMfDjwh8aIwLxilFMpx+zIw8Hz1TvyLmcRoWjomNXgfkarpWZbahA0lXgMaQT+xfMNkIZ1quIgIKXk7G5yibnsK2kPr0RZhMDV8H0wL2Y2TVvkp0eA+89Gdw4NXkxkzDIFHnjUMk2D5yoT3/IRAQA6zgL3QFXRaL/Fpq2pLdW9sr9jPQBChKf8hoOjS/HojZzKhO/oZh/E8agi7nw/GZWO79/KdSIs1XlA+d0m9+Nm5ZGWxZuc1Hr+dV05ga4skNQUZR1MDInyNEfg1PNvKpserKgpLbcgGAW5nmughzB4jfbajJxnkKZiOv9xb/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M02UY8+f4wnDfWvQO4u/VaNEnNLFwP6b4tfLSQ7UjsM=;
 b=XJtpgUKRe6HF7xc0sgqrF+JpHjg23MtzMiFHRih5S3EWuLqctX1iMkQZ6YLX3/JUdhw6iSdzuo2QpzV3KmRf/x0+6EZZDhwIwAFnrMWL+uXEqy+aLbpbvAFFBUbvZOfQRpqdlBz30r1wqTlsQaqBZ3gaOidM+3lziUWm14asvYj8D2sNpxcn3vbLgRbgx/q9nhNRpjixOFNOdgE/48pkdf3mv/pgIDbJJstS+k0M0ZApWc/+1O99hfmknCcukuchkC0ozEX8wO+wX8PTHQMg+1TQvzcIPbCzNVblEjK+XhO9f6JqbNTmWd2y1QAZPz5ysVg8IZAgmYynwKMC48c0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M02UY8+f4wnDfWvQO4u/VaNEnNLFwP6b4tfLSQ7UjsM=;
 b=blLuAjW+k0iy2xQkuy4gyK8I2O2k1knKjRIP9gfuByY+6h8PkSUO8lLEHfmfYefAA5svd7N0ppdRcLHmAdV4Hi4dS/b5LFoq/zQ5mnDz2vUEEfgSgCWliBAm3D5W4z7WetCEwmqaXvIazBsiF0Hv1huSUDlTO82ijGlXoVpMSMU=
Received: from CO6PR18MB4451.namprd18.prod.outlook.com (2603:10b6:303:138::12)
 by SA1PR18MB5690.namprd18.prod.outlook.com (2603:10b6:806:3a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Sat, 26 Aug
 2023 13:33:58 +0000
Received: from CO6PR18MB4451.namprd18.prod.outlook.com
 ([fe80::662:efb1:8152:2052]) by CO6PR18MB4451.namprd18.prod.outlook.com
 ([fe80::662:efb1:8152:2052%4]) with mapi id 15.20.6699.034; Sat, 26 Aug 2023
 13:33:58 +0000
Message-ID: <6aa27627-2e1a-6fb2-caa8-843a3e97b2de@marvell.com>
Date: Sat, 26 Aug 2023 06:33:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] mtd: rawnand: marvell: Ensure program page operations
 are successful
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
        linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org,
        Aviram Dali <aviramd@marvell.com>
References: <20230717194221.229778-1-miquel.raynal@bootlin.com>
From: Ravi Minnikanti <rminnikanti@marvell.com>
In-Reply-To: <20230717194221.229778-1-miquel.raynal@bootlin.com>
X-ClientProxiedBy: BYAPR11CA0051.namprd11.prod.outlook.com
 (2603:10b6:a03:80::28) To CO6PR18MB4451.namprd18.prod.outlook.com
 (2603:10b6:303:138::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4451:EE_|SA1PR18MB5690:EE_
X-MS-Office365-Filtering-Correlation-Id: b028076f-245d-44bf-7a91-08dba63919d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 09PBPc0k38oCGme0xMoPvqOvL1vMip0mBSkepdIRTq9pPcacx56pbPTSYt5J34ZfXyJzsCvNgnBFnC/Ew9FokNsqPzei+lrQmuHmSoNpD24i+GPg5835rslqXC1bd2WXU/EgD1FM0WEDbwvBPl0Sur205nDQuYrRgqBRn5G2h3xJTvuCKMOaCyXwhpRHwZDGHqWR6TRo+LDc2trK/mdNcQowEwblj4KAtZ1rUETCifnrnhjO5lLBtV9SJ/SDNFRTJjBS2s7w0cqa3qU09P//Xl9xzo07qEMDNIZgRZ313Ch79xy4FcSqJ+3tQy19zidkZ2gczMqZcd2FAtPPHLsfis1rrw1VtlCfEF57eM3jiWOMnswj/hW5vsjGMf9dZ6dtgJ8ud1NCR8w55NFkAczDJ/jgWyNyTRx6VeFq1PK94xW3ItVOTXxvxntl75eG7bym7Mu3/QC6ePGtBKxMlN+kukaxG6qRjdecfZAz6Xq+Lcb71BSpDYDSGC+pMzRHrEExZcGmQ1qxSFtW6+5P4xTDXF4X1U7bmpxO8XLOov0dhtKEPNRZoRIjY0ZZj19oVOR4JvHKGfTxlcm7D0t+aBvEk8PiAjpMyBqfsv1aIgRWN6gYDbLHQpdY+ZupfsN5IjhHt6F6WME5j2oRMAQeb8DIAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4451.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(346002)(366004)(376002)(136003)(451199024)(186009)(1800799009)(83380400001)(478600001)(26005)(31686004)(66574015)(2616005)(6486002)(6512007)(107886003)(66899024)(53546011)(6506007)(6666004)(31696002)(86362001)(5660300002)(2906002)(316002)(38100700002)(66946007)(66556008)(66476007)(54906003)(41300700001)(36756003)(110136005)(4326008)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWNxSEhManYxZFBGZDlnRjNvRndFVlpDWjZGRjVmRVJ2YzNJVVBTODZsTjA0?=
 =?utf-8?B?Z0x6bWNjWjBpcFZGdm54MVRqOE1TdTNsN3poalY0YjVSSnEvYVk3V252RitO?=
 =?utf-8?B?RTNqcFFMVyt6ZWJCb2Y2YTFSaGtCNVF0QndzNWpkcFZBNy82YVhrRUdpR1JB?=
 =?utf-8?B?eWlVb2NTQTB5V1RrcWRod01odUJJMjhLSlNWNngzRzgyaVJMY3dtS1ZFb2xS?=
 =?utf-8?B?TmRWU1I2NjI2Mk55TDdnQ010SzMvUVJLcUdHSWd5WGdBTFhiY0lNZFlMTjJQ?=
 =?utf-8?B?NnFocXdsM2dEcnRWc1A2ZkRGc3dKUGpPZHJVYituTUFrUGFmUWVEQmJieGV0?=
 =?utf-8?B?eStEWmRKeHJxMm0wSUxvQzMzb1Q2amw2SFhVVUxZeEx4TmxTaGpwdFIrS3Jn?=
 =?utf-8?B?U1dkeURUUTF5V2dIYmdLNndQNDNyNzFLVEtVRzlnSjlnalM2SWtFdzFYQlJG?=
 =?utf-8?B?dFlXSDFWVHlIekR3UmF3NDZFVG1GSWdBRlJLMDZCYXo3VFo5OUlMaGFRMnBZ?=
 =?utf-8?B?N3hHNXg2MjRFMjRJNmxROGV6YkxYMzc1MDFPdTJaLzluTFV1YlVsc2l6R2U2?=
 =?utf-8?B?VVlKUVFFS0hWTXlCUCtEN0RuZUo1M1VrN3RPNHN1a2t3ZDFOVXh5VitkNUpv?=
 =?utf-8?B?RElSYUNiUHc0Tmw0czdBVXRKcUY1VDc2eVlJaEk5Sjh4azF1T2VuVGJ2eDdJ?=
 =?utf-8?B?UTNBNTdXTDQ4Nmd3ODJvcWlhOTg3NmZGNmsxN0dNS3I4dkVGaG9GMGdJNVhS?=
 =?utf-8?B?NllSQmFVb3hxNEgvTTE4Mkl3bTVYN0IyeFA5L2FXVU42MmdoVUo3RnAvVDJR?=
 =?utf-8?B?VWJ3R25UdWRsRytJV3VaMUFONGszdXpRZEY3Y1ZGTXdXU2ZCeHFIMGZmcjh4?=
 =?utf-8?B?ODdYY1NYdG5QVGZlc2p0UEQvT25sWHNSK3FENFNBTHp0a0paYTF3bFY2aUhU?=
 =?utf-8?B?MVBoWVo5VHZPL09aQTJKMFVuTU5ZMnlWZmlpaVd2TVpDU3greXhFbU95QkF1?=
 =?utf-8?B?Q1J4WEk0VHQvM2RLYzhRUGpNb2FIYWFTbDlrd0g2eFh3bHN2SmhPcTJMZURV?=
 =?utf-8?B?N09ldzQwdk80QzFkVnRudGRBUW96TUdxNzRFUXVuYnpsbElCOWxESG4wZGVC?=
 =?utf-8?B?ME9LR05LaHNpektobm55QmNZeWYxb09uVWlJazVrRTJLRXpTd0RidmhVVEpt?=
 =?utf-8?B?cWpCc2d4NEFyamhLaXR1anhSTy9YODV6Ymk3M1o1TXEzRTFJcmJzZG5MZDdT?=
 =?utf-8?B?WVBNZVRSQUU4cEhKVXA3S3AvcGFNN1hHcmpZTG9WNmVLdG8rUm5HY1hoQm9a?=
 =?utf-8?B?TUdsZHg4UWFCWS9ucnZ4VjE2cU9QOVovYjE5c3EvdS9UbXVsMHFmS3FMRW00?=
 =?utf-8?B?VjQyYWlvSk45SHRzQ05YL1E0Y2didVFRQWE4aHZTU0gwTGc1UWkydUdPeGhV?=
 =?utf-8?B?cUdXR25jUG53VENMOG9iaUdydVhaTXUyV211OWtrdDR1SzVzVEZpWWcxbGVP?=
 =?utf-8?B?dDIwNnRlRkdxOEYyZy9ZU2crYTB6US9GZ2IwRDdSNExUMGxvb0JkbnJta21L?=
 =?utf-8?B?VXRGdGV4NDRGY1p6dU5idFhMaGxINmxMMitXREtlQXRoS1l5S3ZFaGpUL3Yr?=
 =?utf-8?B?Rlo5QURsUFpRWUJMSFFhZFYvQm4zL3ZXdS9FZmcyWU5qcDVGUm1jb0FWU3hH?=
 =?utf-8?B?dzgrQyt0UlNaR1k5YVV2WE5qR05yTFVkOUYvMmpLVDVvTlhmMUxreHc5RDRJ?=
 =?utf-8?B?dzdnWTZXTE4xZEttZGt0dmswZGlPKzBoNXdnc20zR3k5bWJXVHJsYlJNUzEz?=
 =?utf-8?B?d3hnK1kvWmR4NVhIdnRRR2h4NS9qRm9QcGhYUkU2V0s2RmwvU3BIbndoYXdK?=
 =?utf-8?B?RENLUEFvY0Znd0pQb2FVd29ycmhhSDNlbmJ0Z1dKZnRmTFJTZHlyajFSNit1?=
 =?utf-8?B?VFBuM3FuRzRzNTdHbHpQUzFyLzR0TmRZVWdaZWxkWWFZYkR5OUVYMTlka2FN?=
 =?utf-8?B?ckM1TE1UbWIvSVdpMWxkdThaekwySzdIci9QOStQZmR0RURKK0pUR0Rwc3Zm?=
 =?utf-8?B?STdwSnZ6V2ZKcUpsMW9YalBySERjcWo3aUtCa09YM05BUm0xMy84R0ZiNFBH?=
 =?utf-8?B?Y2xVY1Fta2Eycm85Ykdhck1scnU2WjVoKzNKU3FFMmtPOHQ0YkhyREhqdFhR?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b028076f-245d-44bf-7a91-08dba63919d6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4451.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2023 13:33:58.2138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5a0hm+iTZ3m6oC1V+kFN2AtvWor2P3QFro1d0+pWQJXF4sGphm/jgUiSar2iPWSOh+j4i0r5hzmFzda4RFrtsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB5690
X-Proofpoint-GUID: MXghaSJV-d6atdF4U9ZkqM0VA3jqKg7q
X-Proofpoint-ORIG-GUID: MXghaSJV-d6atdF4U9ZkqM0VA3jqKg7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-26_10,2023-08-25_01,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_063411_207970_79C57B6A 
X-CRM114-Status: GOOD (  29.31  )
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

T24gNy8xNy8yMyAxMjo0MiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBUaGUgTkFORCBjb3JlIGNv
bXBsaWVzIHdpdGggdGhlIE9ORkkgc3BlY2lmaWNhdGlvbiwgd2hpY2ggaXRzZWxmCj4gbWVudGlv
bnMgdGhhdCBhZnRlciBhbnkgcHJvZ3JhbSBvciBlcmFzZSBvcGVyYXRpb24sIGEgc3RhdHVzIGNo
ZWNrCj4gc2hvdWxkIGJlIHBlcmZvcm1lZCB0byBzZWUgd2hldGhlciB0aGUgb3BlcmF0aW9uIHdh
cyBmaW5pc2hlZCAqYW5kKgo+IHN1Y2Nlc3NmdWwuCj4gCj4gVGhlIE5BTkQgY29yZSBvZmZlcnMg
aGVscGVycyB0byBmaW5pc2ggYSBwYWdlIHdyaXRlIChzZW5kaW5nIHRoZQo+ICJQQUdFIFBST0ci
IGNvbW1hbmQsIHdhaXRpbmcgZm9yIHRoZSBOQU5EIGNoaXAgdG8gYmUgcmVhZHkgYWdhaW4sIGFu
ZAo+IGNoZWNraW5nIHRoZSBvcGVyYXRpb24gc3RhdHVzKS4gQnV0IGluIHNvbWUgY2FzZXMsIGFk
dmFuY2VkIGNvbnRyb2xsZXIKPiBkcml2ZXJzIG1pZ2h0IHdhbnQgdG8gb3B0aW1pemUgdGhpcyBh
bmQgY3JhZnQgdGhlaXIgb3duIHBhZ2Ugd3JpdGUKPiBoZWxwZXIgdG8gbGV2ZXJhZ2UgYWRkaXRp
b25hbCBoYXJkd2FyZSBjYXBhYmlsaXRpZXMsIHRodXMgbm90IGFsd2F5cwo+IHVzaW5nIHRoZSBj
b3JlIGZhY2lsaXRpZXMuCj4gCj4gU29tZSBkcml2ZXJzLCBsaWtlIHRoaXMgb25lLCBkbyBub3Qg
dXNlIHRoZSBjb3JlIGhlbHBlciB0byBmaW5pc2ggYSBwYWdlCj4gd3JpdGUgYmVjYXVzZSB0aGUg
ZmluYWwgY3ljbGVzIGFyZSBhdXRvbWF0aWNhbGx5IG1hbmFnZWQgYnkgdGhlCj4gaGFyZHdhcmUu
IEluIHRoaXMgY2FzZSwgdGhlIGFkZGl0aW9uYWwgY2FyZSBtdXN0IGJlIHRha2VuIHRvIG1hbnVh
bGx5Cj4gcGVyZm9ybSB0aGUgZmluYWwgc3RhdHVzIGNoZWNrLgo+IAo+IExldCdzIHJlYWQgdGhl
IE5BTkQgY2hpcCBzdGF0dXMgYXQgdGhlIGVuZCBvZiB0aGUgcGFnZSB3cml0ZSBoZWxwZXIgYW5k
Cj4gcmV0dXJuIC1FSU8gdXBvbiBlcnJvci4KPiAKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zwo+IEZpeGVzOiAwMmYyNmVjZjhjNzcgKCJtdGQ6IG5hbmQ6IGFkZCByZXdvcmtlZCBNYXJ2ZWxs
IE5BTkQgY29udHJvbGxlciBkcml2ZXIiKQo+IFJlcG9ydGVkLWJ5OiBBdmlyYW0gRGFsaSA8YXZp
cmFtZEBtYXJ2ZWxsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPgo+IAo+IC0tLQo+IAo+IEhlbGxvIEF2aXJhbSwKPiAKPiBJIGhh
dmUgbm90IHRlc3RlZCB0aGlzLCBidXQgYmFzZWQgb24geW91ciByZXBvcnQgSSBiZWxpZXZlIHRo
ZSBzdGF0dXMKPiBjaGVjayBpcyBpbmRlZWQgbWlzc2luZyBoZXJlIGFuZCBjb3VsZCBzb21ldGlt
ZXMgbGVhZCB0byB1bm5vdGljZWQKPiBwYXJ0aWFsIHdyaXRlcy4KPiAKPiBQbGVhc2UgdGVzdCBv
biB5b3VyIHNpZGUgYW5kIHJlcGx5IHdpdGggeW91ciBUZXN0ZWQtYnkgaWYgeW91IHZhbGlkYXRl
Cj4gdGhlIGNoYW5nZS4KPiAKPiBBbnkgYmFja3BvcnQgb24ga2VybmVscyBwcmVkYXRpbmcgdjQu
MTcgd2lsbCBsaWtlbHkgZmFpbCBiZWNhdXNlIG9mIGEKPiBmb2xkZXIgcmVuYW1lLCBzbyB5b3Ug
d2lsbCBoYXZlIHRvIGRvIHRoZSBiYWNrcG9ydCBtYW51YWxseSBpZiBuZWVkZWQuCj4gCj4gVGhh
bmtzLAo+IE1pcXXDqGwKPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5k
LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFu
ZC5jCj4gaW5kZXggMzBjMTVlNGUxY2MwLi41NzY0NDEwOTUwMTIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9tYXJ2ZWxsX25hbmQuYwo+IEBAIC0xMTYyLDYgKzExNjIsNyBAQCBzdGF0aWMgaW50IG1h
cnZlbGxfbmZjX2h3X2VjY19obWdfZG9fd3JpdGVfcGFnZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlw
LAo+ICAJCS5uZGNiWzJdID0gTkRDQjJfQUREUjVfUEFHRShwYWdlKSwKPiAgCX07Cj4gIAl1bnNp
Z25lZCBpbnQgb29iX2J5dGVzID0gbHQtPnNwYXJlX2J5dGVzICsgKHJhdyA/IGx0LT5lY2NfYnl0
ZXMgOiAwKTsKPiArCXU4IHN0YXR1czsKPiAgCWludCByZXQ7Cj4gIAo+ICAJLyogTkZDdjIgbmVl
ZHMgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgb3BlcmF0aW9uIGJlaW5nIGV4ZWN1dGVkICov
Cj4gQEAgLTExOTUsNyArMTE5NiwxOCBAQCBzdGF0aWMgaW50IG1hcnZlbGxfbmZjX2h3X2VjY19o
bWdfZG9fd3JpdGVfcGFnZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ICAKPiAgCXJldCA9IG1h
cnZlbGxfbmZjX3dhaXRfb3AoY2hpcCwKPiAgCQkJCSAgUFNFQ19UT19NU0VDKHNkci0+dFBST0df
bWF4KSk7Cj4gLQlyZXR1cm4gcmV0Owo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsK
PiArCS8qIENoZWNrIHdyaXRlIHN0YXR1cyBvbiB0aGUgY2hpcCBzaWRlICovCj4gKwlyZXQgPSBu
YW5kX3N0YXR1c19vcChjaGlwLCAmc3RhdHVzKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJl
dDsKPiArCj4gKwlpZiAoc3RhdHVzICYgTkFORF9TVEFUVVNfRkFJTCkKPiArCQlyZXR1cm4gLUVJ
TzsKPiArCj4gKwlyZXR1cm4gMDsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBtYXJ2ZWxsX25mY19o
d19lY2NfaG1nX3dyaXRlX3BhZ2VfcmF3KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gQEAgLTE2
MjQsNiArMTYzNiw3IEBAIHN0YXRpYyBpbnQgbWFydmVsbF9uZmNfaHdfZWNjX2JjaF93cml0ZV9w
YWdlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIAlpbnQgZGF0YV9sZW4gPSBsdC0+ZGF0YV9i
eXRlczsKPiAgCWludCBzcGFyZV9sZW4gPSBsdC0+c3BhcmVfYnl0ZXM7Cj4gIAlpbnQgY2h1bmss
IHJldDsKPiArCXU4IHN0YXR1czsKPiAgCj4gIAltYXJ2ZWxsX25mY19zZWxlY3RfdGFyZ2V0KGNo
aXAsIGNoaXAtPmN1cl9jcyk7Cj4gIAo+IEBAIC0xNjYwLDYgKzE2NzMsMTQgQEAgc3RhdGljIGlu
dCBtYXJ2ZWxsX25mY19od19lY2NfYmNoX3dyaXRlX3BhZ2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hp
cCwKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gKwkvKiBDaGVjayB3cml0ZSBz
dGF0dXMgb24gdGhlIGNoaXAgc2lkZSAqLwo+ICsJcmV0ID0gbmFuZF9zdGF0dXNfb3AoY2hpcCwg
JnN0YXR1cyk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJaWYgKHN0YXR1
cyAmIE5BTkRfU1RBVFVTX0ZBSUwpCj4gKwkJcmV0dXJuIC1FSU87Cj4gKwo+ICAJcmV0dXJuIDA7
Cj4gIH0KPiAgCgpQYXRjaCB3b3JraW5nIGFzIGV4cGVjdGVkLiBUZXN0ZWQgb24gMyBkaWZmZXJl
bnQgTkFORCBjaGlwcy4KClRlc3RlZC1ieTogUmF2aSBDaGFuZHJhIE1pbm5pa2FudGkgPHJtaW5u
aWthbnRpQG1hcnZlbGwuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
