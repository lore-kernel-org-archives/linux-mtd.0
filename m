Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3E6CA5FA5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2026 15:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXRBiUN177vZfHhszNJraP7p7y2cx/eqk2jEYlYpRRA=; b=FQTWlvx2913BEt
	cTOOFOaUmK8WABxfzUCPnXLVaoc6kn2XEJ0GoDvvGJBhHxh8vuVNhLZC5KftkaXes4FXqM4gQsSzE
	GYiI5zr7jZc7jSfwHLkTnLgTwPLYqmOBxi5J1hzu7wOTgWUaOw4C2sZuzc7l0fTJkl5/DhAVOQpUH
	wAIpH4Ye2vs3ipdU5lI8nVe9PeF5A658bSawyLGDuO0v3ADfgfwI1hxyg3W6SoL99YVAgXlAMCmlL
	RSsuQ9znQpD3hURjT2oQdo4mT7KZoSToYVv+EFXHaubKogKtYnj5E5G7IhgonPfo78wEm3rufamQC
	RxEKYyCMVHmLmAfjbM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCs8-00000000qfY-0LG5;
	Mon, 28 Sep 2026 15:02:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCs5-00000000qf6-3TCk
	for linux-mtd@bombadil.infradead.org;
	Mon, 28 Sep 2026 15:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=0lGQxA6NYdc5zwssYlNHjhLyf1bN1IurI5c1FPPL4/A=; b=SkuRezlICBQc3FdX5JHEGxdOuj
	6DUCpBhA3FBeXnRtZtLNAqCGglCKDxVgiSNZOO6r96Rhb2oSLf2T0m4jrsf3gEBlGPffSBnUBItHB
	sITb1kfOFQSMN6TFiA7oG7hTBkXEC1omPEngb2E1qSjbhZ+KSnEcVLtJXrYb3CS4yA3FX2fpTOtGP
	/U94lvtgNxumuwpj6ZOoFolWgrfwD7LzFmjJwEWgj+xu9Qo1TjAmYtJkfNp4C3fBm6vZynCyxyYAl
	r5NNln1IgJ83g9wTa0ezJYLhN+zpKPJT8fasJ56QMEsSnrisBjI/Vf8VQ74bFLchP3/BzZKddrsRu
	gXd62d7g==;
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBCs2-00000001bKN-1o1B
	for linux-mtd@lists.infradead.org;
	Mon, 28 Sep 2026 15:02:24 +0000
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEgtu4655702;
	Mon, 28 Sep 2026 11:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=0lGQx
	A6NYdc5zwssYlNHjhLyf1bN1IurI5c1FPPL4/A=; b=pihGPmkXrGlJNS3PVDDbu
	/HkvqL2SOX/Ipm2kjMQzhE+vmgoy+159Zg9nUTxPxlxb2u8nosuoIf5vXKGG1fuM
	Gw8mvSSda2lM+2OJW5vvBWAfp7Khyv7vd2ByCcwcppjJ57xyPJW+6ryZgDZ901jt
	Q4ZEVOkyTraSzr9OunbVVBQNLSyvEVPnicq9hZyT0SLN7YCLq6vjeoQDjonorieF
	+yFSdyrnlFh2Fu+AA7/fnRxQ0xVVrm0xUoSd5+t/FHmzKNcBxhwT4GsEqccyeLIc
	PIguWEwGr0vXI2VUnLgsbX3TApnV6dhUY3Qcmy60zW1jSeckYyHo7p61GOZHuCgN
	Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gysqr08pk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 11:02:11 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rudQBpYQS2x3YdZmavbHKvEb5D53yauXhWMSNcqARBvgr4UFUoGIXBrRMu3IilwSLyX2wKh9+4LuGulu6/DKj+dYCEUENP8p+Ymme36sv6ZB0AyMAAT/65CtAidUEWwidswMuqB6Xezr0cSWFo9y1DaHVoZzQJtzlKZVsGhTqaiYE2TNnKxc/CZcshUX7ECoIYC04EQoXoHNttPiSNqJefDvVpTv3Ob1zGNLvpEXAZB3P3uivyWvfmFzBAaSDgSt66eF6/N7meCH/aqonCJqbn9XYYgOmi7Ckx/qdOjCPLv2GpvjqPm5ChBXct43mRpwSoDlopDG6wYMILFXbsCQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lGQxA6NYdc5zwssYlNHjhLyf1bN1IurI5c1FPPL4/A=;
 b=xuKMo+C0Bpud5kQaL2V3u1eGHgX2P24bhxE7UEsP5G5DRpzCs7cPJxxh3PdoCp2qr6vOFsTOAwQaV2fr9O+Rx0NNgSpXBfBDVsbCZulWp/iLJCvOh7q6XONLGPw7i6fy/cQCHn9yknMzNRcmlTdN4phTZ04PlvAGHb1WyhFWxHk/EJKz7rM/SEnTZ/j+blihwvfAZq7F6afYNcFfj3YDwX8bZrtVjThL5oZ1MQd6KXkSJrevZSNTlpcmUfEw5SEtInjlicvYpdv8m/O79vJ+YXQ7MEq9ckZKDQENSKzA4osJ5c2Z8kXvg2n1KRJy9QTEMCXp5hSdUu9G/acNxZy+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by BL1PR03MB6151.namprd03.prod.outlook.com (2603:10b6:208:315::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 15:02:09 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 15:02:09 +0000
Date: Mon, 28 Sep 2026 16:03:27 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <arqBm7OpMHuVhzg0@nsa>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
 <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
 <aqgRsP3cxzcLok5C@nsa>
 <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
 <aqpTO-5LTLtRXaY4@nsa>
 <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
Content-Disposition: inline
In-Reply-To: <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
X-ClientProxiedBy: MR1P264CA0055.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::16) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|BL1PR03MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b11e3b-0116-4f07-3dc1-08df1d7177d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|3023799007|6133799003|10067099003|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bf45ua+3PdISIEgkqsiGprO73NIeVZEo5hDqJHroy3yNBotiTxBmmtR19qqmNNwmrWVjcLDsLNX49yOsN7OidIDwD6cCStVzuTvAgNnp8hLqxZQj5h5wRY3G4jpGtrqA2Px/5OHxKV8OY0z24aInFOQwSfQ/RU/cZJ/1RgGk9cE6yf9BuNv59SW7doBQX5+24MvklcAYhnGJzXqdcLxkZsv8AaIhaOgdkfmYcekLxLYfvgErtkHUD/573Cy6XcbX7ZHqJ7Mps7pP19gG08hGyN9oznh2WS96/pbmpdvim80OZ5dFOat1ZyMOzmU4wonllk3SfRbz6M7uz25CrHI3FsqXXEsTd8YHR5B38ShIH0XliXggLVM66h9Ti1y9IWXD3Hx+xYipKkrTKsE2ltgEQgB2sP9CMl3lFgwBsusgx9QCsKnTVxuanyqATvUmNWdXdnFZOd1KvJmRvNtbrYxWOkRZVgsUg217rPTbWSt+8wmzTN5Fz/XQwd7e0QAjtIplbtPJy8EPR3QyaBLyy8w44zccmWKbmOv4fbq97du8DUhQC/NGNRSc6UGslFw7BASNV86bKx5ERyyeg0YIxvXBDAQtxfYC0oZjsB/ajTXIB9uxU8Qrhmthy8nLDJ8OphnW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzVCVDlLckN6c1FDYjNITTlDNi96aERJbkMrbkRrVHd5MllQbTJZVnAwcHJo?=
 =?utf-8?B?VE5oZHVXSmF0YVg4MVozcm9ha0FFQmtvTkFzcGpVLzFhSms3SEVjdjR3ZzRp?=
 =?utf-8?B?WXNxUTdtT2N1K2lyeWZET1dHR29TTEpZaDBlSktRWnRRNGpDRklPd1diaXBz?=
 =?utf-8?B?NkxWWlpVT3U5dUEyVlZNdEZYY3F4cnN2RWNDejU3WFhFK2JtV2QxWWJIeHor?=
 =?utf-8?B?T1d1VHVrWFJGZjUyckNOSm1UZWg2L0JJZDN6ZEwxcmVxc2o4R05VRDYwc0xF?=
 =?utf-8?B?N1RETGZBNG1jVmJ5bzE0NjJFUDhkdDlXNyt0MlMvbjF4WGdzQ2Iyc1JoeDhQ?=
 =?utf-8?B?QmM2MGFZTFJvRkEvU0l4d3lGWkk0MlV2TlFpZzJVR1hUUGx4TzRQS1F6Ty8z?=
 =?utf-8?B?MTIyQzhoYnZsajNxZVIzaVh3YWlRbElROXZxck9aSzU2YWk1dnZSQ0xVVWYw?=
 =?utf-8?B?dFc1d3ZrN1ZEZEJkbWZROTBVSFRkK2lVZjlDQlg4UXBwSVM0K1Fsd1ZvT29j?=
 =?utf-8?B?cVU2bDRoVFhxcjV0ZU4reTdiVHR2YkZLaW1oSHQxMzNkL0orRDBlekRNbHVi?=
 =?utf-8?B?ek9EUzF2ZjVOZU5HeW1sR0FDNkdEdCtjNlYvK3FjK2JKbmR1clJvdGxMdW42?=
 =?utf-8?B?MFlWQ2FtbzgrMWdYSjlMeE5ablB1WWJWZ210Z25VMG4vNW92QzBhd3VuREkz?=
 =?utf-8?B?M0lTa0wwTm0zdmkxK0RsTmRPcUJaKzZ5akRMak1nUm9URGdNRWZjOW1DSGNK?=
 =?utf-8?B?TXJ6YXlOZjY5cXZySkpXYm1acFFLV1YvVVRBSjhleEpqeVVlNWpQOWs2a0ls?=
 =?utf-8?B?RGVFekxYdG8xS21nRmduRkpieE1FU0NjQzdjOG8zRGtUb2pZeUdKVVhzUDli?=
 =?utf-8?B?UVI5cUhORW5oU2swWE5sTmNRNzVGSExoQ0tZYnFudkFJTG5YY2w4amhONWJi?=
 =?utf-8?B?REFsZTNvclY4UDVjNVZTZjB3STdPNUdLak54Qitucm5VQUg2MzVUTlIxMWhw?=
 =?utf-8?B?T1IwUDJwdTNPVWtJUEx5ZkIrYlRraFBLWFc0blFRQmtZeUp4eTFLNjZ0ZXpW?=
 =?utf-8?B?UFRScW5uSnBwcHE0N1VRWTlzdXArdFJOMzZUOXl3M1piVmVSeG5HYnNRWHBT?=
 =?utf-8?B?MVN2bzZLb3g4cXBYVWRkcHp1RXpKaWZvbXlBeloyMkNYWnVaWUQzRDIwbzRZ?=
 =?utf-8?B?MkhsOW9HMEJETTBCbFQ5TXEvTGJQd1NWT3FiN3hoSWlpK0p2aDE5dE5XbVE4?=
 =?utf-8?B?N1grdzBOTXYzU1F4K0hScDRyQ1lBdC9HSWI5ZXJhbkxzeVNybEE2RCsxaExl?=
 =?utf-8?B?TVJEdnpnQnpVblFkK2ZCbVhoeGhpMEVRWTZrbFZiUXczMXhQSDVXNGtWNy8v?=
 =?utf-8?B?cHB2cC9TZTNjN0taVnVyUjRjOTNZMjhjRzFKRWpPOEw0YUhucE5PUFdSQnRF?=
 =?utf-8?B?ckVnTjFTbENrQXBTTW5mOWZ1ejdja0lYRlhyZlFNWHJUNEh4aDY3TFV2Ykoz?=
 =?utf-8?B?OXNYTk51dGRkSVE5YUF3VWpGenFnaXJYYjg5ZWdKYjFNY2pua256TCtrMlJI?=
 =?utf-8?B?ZFJXQUYwTjhqTUpTb2VCTTFLbE1hK25IK2s0MGYySGoyUHhnZGFvQitSOFRI?=
 =?utf-8?B?NitjUG9QK05LNGhBTXVmLzlxK0NmN003QTA2N3BjTmM1NVJ3YVFwRk9ZN1FI?=
 =?utf-8?B?dzdOVTRzMXo3Z3ZtdEZ1R25ZaCtUOHcxc25ORmFML1FBQXNoVTdsYzZIUVov?=
 =?utf-8?B?L05ZN1hUb25ZUEpLV2lJcWVKb0ErSmVqUDFOWlllQk9NdmdIdnBVNXZoK0F4?=
 =?utf-8?B?d285UHZTaGVya0hERGRsTnBDU1B1L09nUEd3Y0VOWFBNV0NOeEZUUmhubUxx?=
 =?utf-8?B?NFVTUGJsaHgvVDNDQXA5L3BmaklwaDZxRzNMbFVDTUpHQ0VKeHRKSE4yNzlT?=
 =?utf-8?B?UkJ0MTZ5SXQ2cWUxSEk4WWExVG1md01zQkFRTm1YSGQyY3dtdTRBb3pKNW5R?=
 =?utf-8?B?MFdXbnpTMDhPeFVWSmZuS3E0ZDNSU1FNMjZodUxkTGIzeCtOdXJYQk9zYlZZ?=
 =?utf-8?B?dVQxVjlJNlg2MzRWU0p3SUxqaERwbDM5aXo0NEE2d2dIMDVtM0puQnptTWtZ?=
 =?utf-8?B?Vk8wUmJpWHRPZzRpbWNtN3ZFTDNQNXRGd0VXaUVpOW9tMzJqbUpmQUlmNHA5?=
 =?utf-8?B?cERTVnRVMnY3bHBvK1V0UVkwZkhRdU0zaGJGUnBPb0ExMVdzd2NCQXNIazRO?=
 =?utf-8?B?NzM1NWh4OHVUWlJIM216VGN5OEVRU200MndyNlZFSjZDK1NaOEFLN2llNWc0?=
 =?utf-8?B?Q3ZVN3FZMHpMeXJhQ002RGtDYjN4WGZOMFR3eXVxUlFiN3pNNkorQT09?=
X-Exchange-RoutingPolicyChecked: c+wnDRbYPcNifo5nks26xLAYk1sfs6MzE4c97g7EbMb6QrzkXDyxAcxPuoBHXihurFKRUTzrjkTfvcLaLNCKN6HButRGmSMeosnkLZaRyrSoSm/zdAS+tOAflWza2da0796/ZO3pDGfnLu9qxK10WAIO0oohyHm1V/Q93Xr+q1jqJs7ZSUE5fOcPEIlzKR5Y5qoKinusT3+tTRvYo2caL6tlH8vsjcPFYuzqcQg1lDmzjYa3MFMxwHjxM8Zn5gYYj5bzLYxbf+0/MeIEDCLv7CZ3+foWZIJv4sBeoI9v9juYPcEk+H1g64XW7fs3SDUrB60m0qypeFeynZ1D+/GjKQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b11e3b-0116-4f07-3dc1-08df1d7177d9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 15:02:09.0572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZzPeUrgNS9nQQM12BDJVTM0z1LEZcVU3uNv/Ldv14klNKTo1ki+PWNnXiUBXxISl6Ki91xj0rRKPjg1WMHz/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6151
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX51bbdjeSY48E
 P/VQ49pxeYeXMgvEp3K1z3evshX8GX+CfofuIJ4x9o8GCQdexEMgDgSRVa6nPp2GtZFZ9efxzZU
 i3O9CfBVeeT/IDGeFYyDgpUy+CW5TJc1QP21X8X7/6B3G6m9IFWt
X-Authority-Analysis: v=2.4 cv=PdBqFShd c=1 sm=1 tr=0 ts=6aba8173 cx=c_pps
 a=E0F994Awt23I4DNeuEdoUA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=JfrnYn6hAAAA:8 a=4ovWLWta0zXe-DwPMw0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: pnVkjZEyzv5IYQQJJIbdETWoEhJlo41r
X-Proofpoint-ORIG-GUID: pnVkjZEyzv5IYQQJJIbdETWoEhJlo41r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX9v4JAy1Ca+ie
 kTOeRHvB8d7B/b5GXW6mcQiaVDzEPN3J09VA1LAs6Nw4W7/Q0Dr4NAbsQTEPMRmEHlw1L2gwOyi
 iPolXath6G2g+a9+GF+ainVUoONv+/k6HHiSKr9TinwYic7iiuhdZ2C1vYxYwX/2fzlKTfW61kg
 WT9K5uMfc/2MpxtrdHxPEIYD0g5WHemH2Ybjmg50tBM6v3G5iihf2zcjxK/AZD5ke2UZcmnh6bD
 ARwIs6EVux6guU+bGqInfpDx9kcB34WcHFjx55fIAvS4n3GNtexvivy369xITMkrvqq1z5yP5An
 F/x+xTyJ7+O/swdnzWKQwIhrrmeI1rg8foJQiVK9GWFh25UpSu58tDP5BtXev4Vw+tDeFQktdPM
 1zrU3FUXiGrLE2G4AP9qkMTd1bYiRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_160222_823166_06F1EA96 
X-CRM114-Status: GOOD (  51.03  )
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
ZSB3aGVuIGl0J3MgZXhlY3V0ZWQKPiBzdWNjZXNzZnVsbHk/Cj4gCj4gPj4gPj4gPiBBRkFJQ1Qs
IHdlIHNob3VsZCBkbyBzb21ldGhpbmcgc2ltaWxhciBhcyBtaWNyb24gc28gdGhlIHdyaXRpbmcg
dG8gYW4KPiA+PiA+PiA+IGFjdHVhbCBwcm90ZWN0ZWQgcmVnaW9uIGZhaWxzIHJhdGhlciB0aGFu
IGJlaW5nIHNpbGVudGx5IGRpc2NhcmRlZCB3aXRoCj4gPj4gPj4gPiB0aGF0IHN0YXR1cyBiaXQg
c2V0LiBUaGUgcXVlc3Rpb24gd291bGQgYmUgaG93IHRvIGRvIGl0PyBUaGUgY29kZSBpcwo+ID4+
ID4+ID4gcHJldHR5IG11Y2ggaWRlbnRpY2FsIHRvIFsxXS4gVGhlIG1hc2tzLCB0aGUgb3Bjb2Rl
ZC4uLiBTbyBzaG91bGQgd2UKPiA+PiA+PiA+IHNvbWVob3cgaGFuZGxlIHRoaXMgaW4gdGhlIGNv
cmUgKGJ5IGhhdmluZyBzb21lIGNvbW1vbiBoZWxwZXIpIHRoYXQKPiA+PiA+PiA+IGNvdWxkIGJl
IHNldCBpbiAubGF0ZV9pbml0KCkgdW5kZXIgYSBjb21tb24gTUZSX0ZTUiBmbGFnPyBPciBqdXN0
IGtlZXAKPiA+PiA+PiA+IGJvdGggaW1wbGVtZW50YXRpb25zIHNlcGFyYXRlIGZvciBub3c/Cj4g
Pj4gPj4gCj4gPj4gPj4gSSdkIGxpa2UgdG8ga2VlcCB0aGF0IG91dCBvZiB0aGUgY29yZS5jLCBi
dXQgYWxzbyBsaWtlIHRvIGF2b2lkIGFueQo+ID4+ID4+IGNvZGUgZHVwbGljYXRpb24gZXNwLiBi
ZWNhdXNlIHRoZXJlIGlzIGFscmVhZHkgaGFuZGxpbmcgZm9yIHRoZQo+ID4+ID4+IGludGVsIHNw
aSBjb250cm9sbGVyIGluIHRoZXJlLiBTbyBtYXliZSBtb3ZlIGl0IGl0IGludG8gYSBuZXcKPiA+
PiA+PiBjb21tb24uYy4KPiA+PiA+Cj4gPj4gPiBBbHNvIGRvbid0IGxpa2UgdGhlIGR1cCB0Ymgu
IENvdWxkIHRoYXQgYmUgYSBmb2xsb3cgdXAgb3Igc2hvdWxkIGl0IGJlCj4gPj4gPiB2My4gRnJv
bSB0aGUgdG9wIG9mIG15IGhlYWQgSSBjb3VsZCB0aGluayBvbiBhIG1mcl9jb21tb24uYyBraW5k
IG9mIHRoaW5nLgo+ID4+ID4gRG9uJ3QgdGhpbmcgdGhpcyBGU1IgcmVnaXN0ZXIgaXMgc3RhbmRh
cmQ/Cj4gPj4gCj4gPj4gTm90IHJlYWxseS4KPiA+PiAKPiA+PiBCdXQgKGF0IGxlYXN0KSBwYXJ0
cyBvZiB0aGUgZGF0YXNoZWV0cyBhcmUgYWN0dWFsbHkgY29waWVkIHZlcmJhdGltCj4gPj4gYmV0
d2VlbiBtaWNyb24gYW5kIGlzc2ksIEkgd29uZGVyIGlmIHdlIHNob3VsZG4ndCBqdXN0IHB1dCB0
aGUgSVNTSQo+ID4+IHBhcnQgaW4gbWljcm9uLXN0LmMuIChZZXMgdmVuZG9yIHdpbGwgYmUgd3Jv
bmcsIGJ1dCBJIHBsYW4gb24KPiA+PiBkZXByZWNhdGluZyB0aGF0IHN5c2ZzIHByb3BlcnR5IGFu
eXdheSkuCj4gPgo+ID4gQWxzbyB3b3JrcyBmb3IgbWUuIFNheSB0aGUgd29yZCBhbmQgSSBjYW4g
c2VuZCB2MyB3aXRoIHRoaXMgaW4KPiA+IG1pY3Jvbi1zdC5jLgo+IAo+IFllcy4gQnV0IGFsc28g
cGxlYXNlIHZlcmlmeSB0aGUgb3VyIGd1ZXNzZXMgYWJvdXQgdGhlIHJvb3QgY2F1c2Ugb2YKPiB0
aGlzIGFuZCB3aGF0J3MgdGhlIGFjdHVhbCBiZWhhdmlvciBvZiB0aGUgd3JpdGUgZGlzYWJsZS4K
ClBpbmdpbmcgdGhpcyBvbmUgOikuIEkgc2VudCB0aGUgZGVidWdnaW5nIHJlc3VsdHMgaW4gYW5v
dGhlciBtZXNzYWdlLgoKVGh4IQotIE51bm8gU8OhCgo+IAo+IC1taWNoYWVsCgoKCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
