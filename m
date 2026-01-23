Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0A8D7236A
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jan 2026 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7Rd8kP84IqR3VnZy3VSD69yF40f/s0Nz0rwdf+smXw=; b=KNoh/a4LBLZRf0UiEwOHx4Yn8f
	1MO32lKtD8Ej4TYEQ3dYEmq0p3qBOHreW1yV9TUoukAgYvf9t5walmzUnhCpCvEWeRcQL1sLnVQRc
	nX+/IskxOX9lqwcbT5NvThakwe4oGYNcndDz8CMQG+1xujGGYbUbtubOa5uVJmwkrJKLD7YDCN86S
	ju6cNXHqHS2IWYkpUn7RS2dYmFnK0ab9MY01aBhiUBZcyPWfAzaBQm5hoOz4oBEF4BuLlt6KXQzqg
	Q5edhfMKo1fLSpD3WG8TLRxYKg1XtXKhbF0F0uubmq46tDFd6eunJ0D4/s8Mi5SI8Reojv1KjDmYC
	laqP/adw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDsA-00000008dM5-3UAx;
	Fri, 23 Jan 2026 09:54:34 +0000
Received: from mail-westcentralusazon11013023.outbound.protection.outlook.com ([40.93.201.23] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDs2-00000008dI7-2ohj
	for linux-mtd@lists.infradead.org;
	Fri, 23 Jan 2026 09:54:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhpArSoBWzpzVA/FnyfCUdOIuXJI2ZhBZqSM0QWTvyMwg0TgaScOk6VK36d4QCNekDjoARXOd5RIzUS3VgHnW/30v7bW721sEpRdHQ8tBDgSXSQZFUiDg+iH4O1nplWd4hAVFgmy1pFNNEOspUM/+0W3e0DBfaVBoccK6FqRS53gYI9dSVzzJ9VPu7zZdYVjg9d/tv30BaaCSB5ha07R5stcO7uwwfYzudeXgb7GsE+PgZZOQH7hHCaOcEZZsP8wDgP0t2Ec2yfmlVm7fcXE7RpFNuCYWOpDfcr6ghzvCRa4z6mLVkllUUEkbjqpU0LctjoNPT/Z/5SdLhDbSfMBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zImFMykdf2tUjrsAG6bKZqeETM2gMl+FCC7LKj+mNsM=;
 b=qFuo18xMaG7rqv2qRMxQ367BfuafioT4EO7d+ZpKV9E6WH71yfcPVQrAzQaN2IihomNwgQDYG7VmfmQXkFf0SG0J3QRDbSou+3YCXdXsJNhvpnHau2fU1oHsZ2ArTSzAvZqB64anW+HYidvpySBH+7Cawaj3dq6qPC7d6OUHjH0yw5I+qUuefCG6eVkWLKPBfOZh3RIJJ4TfpMThLFHRFBuhMbrQvZ+CklnKPjqsXiDb3kXtqdlhJVTGIyn+DLwcTv0UxAo0bD1zfti57yp+29HtYMZ+DqZvkJLjHQgfZNpdl2jun5CInqS1wULYMz4AV5J7jNdxLIUBVnWIrlzLQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zImFMykdf2tUjrsAG6bKZqeETM2gMl+FCC7LKj+mNsM=;
 b=HN4wYqOnlRk1S/2HWrHj+d78QiDFZRH9ICKENtwY4i/ETxjF6niEA5wAX5zSW+C9VDXkmjqpAlzdspyd8WRKmTfMuPCW94S1HI5WjKHEwOG6XJb0iHuNiZDePGR4J/VMXTBiJGL9ZqlLXucMfYOHuCHxyTzHEYied2qUtdXIlw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CY5PR12MB6551.namprd12.prod.outlook.com (2603:10b6:930:41::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 23 Jan
 2026 09:54:20 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 09:54:20 +0000
Message-ID: <201afe7b-1fe8-4bf8-93ba-4810f26ceb6b@amd.com>
Date: Fri, 23 Jan 2026 10:54:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: rawnand: pl353: Fix software ECC support
To: andrea.scian@dave.eu, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260121-pl353-soft-ecc-support-v1-0-00ad8e160d83@dave.eu>
 <20260121-pl353-soft-ecc-support-v1-1-00ad8e160d83@dave.eu>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260121-pl353-soft-ecc-support-v1-1-00ad8e160d83@dave.eu>
X-ClientProxiedBy: VI1PR07CA0152.eurprd07.prod.outlook.com
 (2603:10a6:802:16::39) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CY5PR12MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ae9c83-a261-4030-c707-08de5a65611c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmJNTjdSc3lKd2JwVU9Uc1g5ZU9TV1RhWE12VUlJK0dwbDlialdYOHRVQ2t3?=
 =?utf-8?B?VmFEdHNKekRXVXZWR1JVL0M3TW0zRkZsK1NkWC8zOHF2ak9TeEp2N0RIVXZ5?=
 =?utf-8?B?QWloUFpVczNNYTZkZGd0UzgzK1ZHdjIvRW5Jb3pZRENxZFNINXNyWHN6Mmtk?=
 =?utf-8?B?TEdRTFhkNlROVi9zOHE2dTZnZWVZbXRyRis2NWErdFZKVjAwL2pVZ1VLVGd6?=
 =?utf-8?B?ZFFPUE9nSWZ3akVoTGtlS052Ty9vSFhUV2FjT3kvb3BmbU1tTGdlTXNVUnlT?=
 =?utf-8?B?Qk00bGNBRHVMeTQzZ3AvNzZOQVI4THJLV0wrcnJOMVJMblF1SWlvYUI0Yi9G?=
 =?utf-8?B?dk1mSVl2ZXNBWWxsZ01EOWNNL3ptSjY1anJYbmhyaXI3M2x1TkNBVE5oYnlm?=
 =?utf-8?B?NVZ2akt3UzRVQklUekNJTitXV0JkVFNMNHFPc3Y1elZieTVESVNFWkM3cFJ6?=
 =?utf-8?B?S1E0MkFGckRMTDhXUjA3VVFxSFl3TWRxSkV3dFdIL2RCYUdnYlRxZnc2SzJL?=
 =?utf-8?B?bVU0OTVxWTN6NFpnTVRXSitKTDZXQk5PNERaRXNPRGc4c1Vqa2wyVWlsVnBk?=
 =?utf-8?B?TnVQVk54d1c5RUgzWGYvWExXQUhMNTk5VFZCeDRIT0g1WlhqV0MxMnhuVXYw?=
 =?utf-8?B?QlRJWnBQek5sanRKMTMwN2s3eExrT29STVFBdTI2c0x3M1I2b1lnZEdXODg5?=
 =?utf-8?B?dkE5WTVONW1IVVBiUU5JNUhrNFRqeG5LU05yeG5XZ2E2dXM2ZVVkM3JMVERW?=
 =?utf-8?B?UCtIV3REa0pndStISTlhYnJHZ3A1RmZiNUhGM3gzTlFGRDhsZm1KQU5HWk9i?=
 =?utf-8?B?YUVSYzl5ckhTQkM2NkQ5b1FoclNjWm1sOTAwQlpLdkZJSGlES3BlaSs0MUhp?=
 =?utf-8?B?dWVtWm1Dc1ZmenFVWlVyOCs4U0daaHlSdVZhWlV5ejNGNExRVHp4STk0YUR4?=
 =?utf-8?B?OWhTVUh0RmRUMitDOThWV1l6UmpXdWNvQkdLTUs3NW16cGhzdE9vZGxUSVEy?=
 =?utf-8?B?b0hRNWRrRERESkxKUmR0eVo1MVhWZWQ0V1BjSTkveUNlVy9veDkxaTFQRldr?=
 =?utf-8?B?Y29wSWJpbFgwZjNIT3ZCc0IyZ0l3SG56K2FJS0I5YU4rZ3ZMSHk5dVlkREJn?=
 =?utf-8?B?WWtsQ2crVE5aN1lieE45S2h2aXYreXBwdEFzczJ1UlpONkp1MVRFVkJFZzlv?=
 =?utf-8?B?NzE4UDdSMzEvcmMyOWN5aTNLS3pQSjdOQndxVDh3bU9XWlFFbHdCZUNzeUtx?=
 =?utf-8?B?VGF1OS83ZVhFcDZzaysrUlBXZ2RBb2h3UDYxbVVNKzA3TFNJSWFkbllkUW9n?=
 =?utf-8?B?T21GL2lYR091U0pySmVEd1FqUFp5ZlhGM0lhY2pwa1B6WWNFUStadVZUdWVM?=
 =?utf-8?B?aHRTazhBRytWSWJKMi9xL09Yc3B1alNRQmp2bXhKTGhCaGxneHhMd29nemMv?=
 =?utf-8?B?SnVnMGROdzU5OTN4Q0tpMng5dVJVUDh1TkNRbWJERzhnbnl6S2cxakJUQXZF?=
 =?utf-8?B?Tk16cTZLRnAzM1FFMzdIbmRUT3EzbHJoREV5NGMzM1lYZ3pEZkdvSjRKTXEw?=
 =?utf-8?B?UWhFVEhRbzgwZkhNdjV2b0hVRGJ3ZSt2WkE5OW5uSEt4SmphdkJPUGk3VUZB?=
 =?utf-8?B?c3BRN0pOMG5FS3l2eVA3VFJMZmxOVFhjL2pTN3V5ak1ZNThXbVFOS3NsZ0Qw?=
 =?utf-8?B?aEZkMU5EYitHeUxkVHhTdGdURmZ6Wnc4ZzNCYVJhYW1VR2Rtay91OExYdXdN?=
 =?utf-8?B?TktsYXUvNVpHdU9ieTlQRmRGUDRwUUNtRnlSVzJwYnF3bm5zek1KaHBtUjRq?=
 =?utf-8?B?UUwvVzRwdEtSL2p5UHNpcDM4ZkhTWXAwVm5kOUdlSDI3THJIUEhIbEFZTG9l?=
 =?utf-8?B?TXdtNzJlT3oycjFWQWhKWUgzTFB0cHNSb3hnNjBZMk93MGJmSFVkcVlHSWhJ?=
 =?utf-8?B?ZDlLUzl0ZTAxbTNVVkthbnFlRXF6RGx3eUJ2THRrSUU4K2VPcy9nV2VURUZJ?=
 =?utf-8?B?STV3eGdsMHRLc2xJYVBjc3V2SlZIZjkvMGhOejY1TDVVeGtVc3pjZDVEQUp0?=
 =?utf-8?B?UjlBK0V4eSt6THNMUzA5ei9vK0RDeW5yVjlEQzdGRDBYTnNQNEhuc1l2SHF5?=
 =?utf-8?Q?dLEU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjEvZWlFWEl2QUtyMG1DWEQwVy9mbmQxZnBLVmNsY1lVUE5CRzZtY2VsNTRh?=
 =?utf-8?B?b0RMUjhRSG1qdWpld1dpODZubEkxNmlMVXNaV1ZUcVRBS0JoVUtqMTYrTVha?=
 =?utf-8?B?R3pTeEhoQWFCTmlXbDFIMGovVkRsdjBqei9DMjdpSUF4aHZGRE5RdnhPWERB?=
 =?utf-8?B?aTFzYXNRWVBUMnpSVVJkSXVQdVBES3hTZ1QvME5NTWdWVzBvMEtZMHM4ZWhF?=
 =?utf-8?B?QnhGTnNaN2tnamo4ZlJvODNqcEZhaWlVazRjc3BmazlEU0ZjaDVvTG1aNW8w?=
 =?utf-8?B?THo2ODJMcDB0dkdRU2JCc3FvL0NzSVY2eXFLaEdNV1lLVGZqL2hYMEhSNk1W?=
 =?utf-8?B?WDFiSVpuU0NGNmNJR0lFR21DZVZMbnpXUEJIYzVMd3hzbEUzL1F3cllNK002?=
 =?utf-8?B?amxEbG4ydkhnaTlBOXNGMUg4QW0yOGQ5TGt3NUhkbmRkWFM1cGpOMlErVTQz?=
 =?utf-8?B?YSs2V3BCaDJ1WmlHcllMV0VQMllvUWtISnJyVkl5M29SUjdCbkpmb25pY0RJ?=
 =?utf-8?B?QkpzTFZWVmJWdW1oVFJRd1h1TXpEQWQ3alVZMjBBVENNSU95WmxIaTRhUUhw?=
 =?utf-8?B?Q0J2bDIyaS8rVUZ4bmFoUkkraUVtQnFLTU91alVjQzJQdWFVenJ6OEFFRFNZ?=
 =?utf-8?B?bkdVRHBHR3NMRFVGYlkvcC96OCtsS2NjTzFMV3FrQTgrcEEzSWZnTjArWitB?=
 =?utf-8?B?am01N3VjQkI0NGk1L3BJM2ZFSkp1b3hhOUhxQkloNk56Z1V3TDdYMVRqVDhY?=
 =?utf-8?B?Zm83WitVa3F4MHlKOGk2ZmFDZVZBRHZOWnlUM2hQMUVIQlpNSFlhcW1LVHRW?=
 =?utf-8?B?R2wxUmU0aG1jNG56Qk5oalRCTnc0cnRZWnNnVkEyYjBzT3lKSkRrMGY5dTFX?=
 =?utf-8?B?SmUrTERjUVNJZEtjeUlpZEZSMEZiZW9WY0NESjdjVTE0ZEtrTVNUSlhhRFc0?=
 =?utf-8?B?Ujg2Z3FvRGtLNmo4TTRSSlhlbFFNcm5Tb0pHZ1M3RlJBbUtVMTNxcTI2S3ZC?=
 =?utf-8?B?Ymh4eFhXaTZBTXppRDZHeEZaVVQ5aVE4eHJ1azJLQkJnRGdVZHM1TnlaMWJo?=
 =?utf-8?B?cDZERzBCV2Q4eTdoWm9XeUg4L2lBTHlYdmd0anhabmFUdlBpVS9mOEszVGRT?=
 =?utf-8?B?ZXRFZldpNjJMdGtXUWt4ck1GOWlvV0tLbldwZVIvMFlrU2F6NFN2TmxrMlNu?=
 =?utf-8?B?MjVKMTFHYm9jYzc0THhiQ1NFa0lvc0VPMTRTM1FFdUdtdVRLMFJQcVUrT1R5?=
 =?utf-8?B?T0NXSFB4aEhYRU9TN0svUEJNUUdGN3hVQ3RwaWRpaDFoVXNyZEZZQTFxaDZo?=
 =?utf-8?B?QzQ4c1p0ZXBCN0VBL3ZpSnJKUG0xdUpBdmljMHRqa3hNUUxDc25DUzdMTFkx?=
 =?utf-8?B?bGc5aHZBd0dWUkhLaG15Z0E2MTdUSGx1TkZxbXp4RjBxL3hYTDBQd0prTTk2?=
 =?utf-8?B?UlVHWkVQTHFsMm5oTVgxSDBHK2swZDBMeXVFd2IzVjBPSWJCQnZzNTh1TDhG?=
 =?utf-8?B?TlFOdUNWeExNVE50VVVnRTZJVEswMkpHdk9MOHJiTmZsTm4yUDNCSk5zbFBS?=
 =?utf-8?B?cm5HUUlyeEJnOUd0N0l6bkpxbjBkZDZSejR5WDdSWVowWGFJdDBlbWxqQmNa?=
 =?utf-8?B?MTVURTBPb29TTGNQdzdNSmlBZ2JkMHdJdUN2SVJGWmZSWTBORk9GQitxbS9F?=
 =?utf-8?B?SEFMV1N4Qko4VXpRYzZSek9lM01LV3ZTdGo3clpqUmNPdVpjZlhGYkx6YjlQ?=
 =?utf-8?B?REYyeXhyOWtIMTMyWk9hY2Z3dkdhOTFEOHptcWo0MTBWV3Y1N0UzdmZoTkY2?=
 =?utf-8?B?NlJqMXRxZ241SjBIVjZGSWIwUzIvbmd6NmNEQ1M5eU9tdGtFZ3poZ1E1RjZE?=
 =?utf-8?B?Njd5Q1VSYjl5WXhBQ1B0WDdSWEVad3UwdjlkQktMSXJqN243ZTg1UUxlSmZB?=
 =?utf-8?B?cThTblg4WXpNdmFZcTAyb0lxSlFrNXUwWkptSUJrd2M5ODZ6cjJPMGdjSFNC?=
 =?utf-8?B?eTFuMEk3Q2VDVW5EWU44OGFLdEpmZURRNWtJK3RLUnhEbkZwWEtVZUc5NVZT?=
 =?utf-8?B?bE9xVTVVaTdHYUFIYTFVVDBxMk8wQWpsVCtRczNuTi9CQ2lGSjNkSEZlQmFt?=
 =?utf-8?B?bkRicms0aDQ2V25PMlVnN1FGNHJrbzdRcy9oM3BDZWtyb2ZlcDBkcXQzdk80?=
 =?utf-8?B?OW5ZL3REbWtwZ0JWeDVtbm9HMVVVSExIYmt0SnNsSGQrTDYzYTRLMjdxVHZa?=
 =?utf-8?B?Y1M2RGllSGhQYkhUejQrOU40eHpHbjVhYzFqbTRRRkdBd1djc2RuaWJyN0d0?=
 =?utf-8?B?SS9NN0JQendNdmpUMkk3QTNBUFBlNTRhSnVvYnNlUnNlRnBxc283Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ae9c83-a261-4030-c707-08de5a65611c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:54:20.3319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5Rxb3pQNzZ4oI+Ozkt/vOqgrfJVRYXBEi1xgXnxGwG9MqS7qFoMdp8i9tJozpxP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_015430_520236_85B5AE87 
X-CRM114-Status: GOOD (  13.26  )
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

+Amit,

On 1/21/26 16:51, Andrea Scian via B4 Relay wrote:
> From: Andrea Scian <andrea.scian@dave.eu>
> 
> We need to set another couple of fields in ecc structure to allow
> choosing SW ECC instead of HW one, otherwise write operation fail.
> 
> Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
> ---
>   drivers/mtd/nand/raw/pl35x-nand-controller.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
> index 11bd90e3f18cb..fcb62b9ec947b 100644
> --- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
> +++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
> @@ -976,6 +976,8 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
>   		fallthrough;
>   	case NAND_ECC_ENGINE_TYPE_NONE:
>   	case NAND_ECC_ENGINE_TYPE_SOFT:
> +		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
> +		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
>   		break;
>   	case NAND_ECC_ENGINE_TYPE_ON_HOST:
>   		ret = pl35x_nand_init_hw_ecc_controller(nfc, chip);
> 

Amit: Can you please test this and review it?

Thanks,
Michal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
