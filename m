Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57F1C982FF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2026 13:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bOWqJ9nTPFj9DcciyqrAKRclBHFJkAcOV8b83CDtQc=; b=M3AtHHZaroEN8r
	2tcRha+Bum1CxuTwoAIRMsdDuY0kjDYg0KRvjAD9y9ypcZJuvXWxprvlu9j44RR7TIYdn9Aebql4/
	8JvQwbLcIZpTL9DW7mPiYXdvvQupg9e8R++SpDzU7O6HadLjwDjwYdQcFaJl7rpumC07iySCb0V+D
	xAa1jFTn1tOaJHqhf4wLzkR5A+H+w0hJKqXo0MFHLk6B1tRi6BdF+cisS2vxQ3Un3/Lmo1Zf/Tz1m
	L/wkiiOCaoUtK11fio8vrHqdxX0mou4YFMufycTP7WPKBCfSVHJBS9ZNHQPN1xjRUWZGlwUUDssYf
	62HYigUipcTcqzRuGMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90M1-00000005UHG-3awl;
	Tue, 22 Sep 2026 13:16:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90M0-00000005UGQ-2i32
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=RGg0wf4I7ORu3eddFmFaGeQS3WdRUs2HVlRmx/5h1GM=; b=q7OPqtBOFf4A3Z+z40f1JpchMo
	dTAUWqyKEe+GRM2C+hUSk3KYLGXbPzAwJ3KFbU42E5KRjixWUMvPC/IcqLorOEmNUvcLKPW6xzyQG
	VJvVyqs3oKFynY6vTL/0d65q+xY9Bdx/XToyD2bhu/SQR4lHvX/qQOY91vZxqclO7oQNfQfq1xLWV
	lR9g9ZYssqO49sB5qTiyv3zaQ3TS1yrNksPpMhgXb5t0fJvPNT/bfmIGANxUZlXWwovy27D1LHv4W
	PaHtXCpxErZckjGf4+583dM2+SsrerujxPajC8AXmImFbuSW8X6u+HbfbghBUHTgHcwwcjaFqrIXb
	aYKI1D+Q==;
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90Lw-0000000Dbx0-44zQ
	for linux-mtd@lists.infradead.org;
	Tue, 22 Sep 2026 13:16:11 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MC6nbD3070418;
	Tue, 22 Sep 2026 09:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=RGg0w
	f4I7ORu3eddFmFaGeQS3WdRUs2HVlRmx/5h1GM=; b=qBGfObhLdtt2EKOhNzoRB
	GKHJR647iflNCVJ6g8wA7mKE1461IaxiUvO5q1BDqYB7+wT4zE60cz+EFWVVELIq
	4hUylAou4kNui2P2y/pICoowLVR/Sm8R+eCMuQsdsKOi89mwXPQIGz4Mfr3HUv16
	6p7EBgd2OHvyWpWdQR1/WV/gfAx1Ehi4G9OgZff8U6o+KrQIktsqt/tp1QVnfdd7
	IOPQZSD8FJOVZlCKFNTQm+9E0OsjbVPJFSIsjHinsgOK1jNErmozZHX7XyrDIe3w
	hTd/CIG3MS1ORQ3N+0pfF/r1TC+UR9z2n+Ffj6v3jnnkQtJly947ESEfquKv5gL3
	A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013059.outbound.protection.outlook.com [40.93.201.59])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gusd2ra09-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 09:15:47 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvKDXTSDsBFKtpbMTLEFu9yRHu3hL20NzXtFpOHFRYEEFnvJUg1H+oPGv3GfPPsTqf7j8L65HxZXM/rL6vHDsA17Se/+80DkRxr6F1p3dPx53/6qai0HHQE/d2MGxjup0rllYYijJPEMXMGVuQXnZdliOF/SIvoyDjI8c6n4ZA+QvBPlKhx7uT/oZr4lxfQdDi6Nq963pYXUCaohWMTVhK/RBO3yXtEjifmZadE+oc/UFW3f2EN5Njud2VZ4u5MLhUFoOwG5Lehwd41f3lDuxHYP/KRQSD1N2JqEasfOOOMbzshhat+cSqsj51jlQORkbclSlkGVWaeMa3PYxEiR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGg0wf4I7ORu3eddFmFaGeQS3WdRUs2HVlRmx/5h1GM=;
 b=n0qdCGz6wgldSxQ3/whcc4+XILD0BDrNpxQJBT1a7uUcHMjhSnA+RobujR+NF6eeXsqCn/JjxwZTH3oAXu8t0AnIc61fLNOQE3nul7GK5e8V9y0w/dhh4j6Qne3jTZrtjWK3YiRKbbN2To6W7HXR82+CE6KfLaCamEl89bBDuUvhVKQ7a4q/uKGC8AsNGyDXIEUMit3bxhX5T5to1rM9kmOsviXo1mIko5jTbjnWNytBIoxL6TmfkDMyRDiZUP/q2hLNcyXiU3SxTSYwry95E5y0lSeGBs+VvbjmGBiLXeaFzK43K3/sFk5JWP0QRgFa9kgXQX8zLOO1KcIgUFVpCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by EAYPR03MB989252.namprd03.prod.outlook.com (2603:10b6:303:2c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 13:15:45 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 13:15:44 +0000
Date: Tue, 22 Sep 2026 14:16:53 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <arJ9bO6O5laKQpZN@nsa>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
 <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
 <aqgRsP3cxzcLok5C@nsa>
 <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
 <aqpTO-5LTLtRXaY4@nsa>
 <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
 <aq0MKTz6KIx8N7ZT@nsa>
Content-Disposition: inline
In-Reply-To: <aq0MKTz6KIx8N7ZT@nsa>
X-ClientProxiedBy: MR1P264CA0195.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::7) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|EAYPR03MB989252:EE_
X-MS-Office365-Filtering-Correlation-Id: 21043e84-5c3b-46c8-4cce-08df18ab9baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|13003099007|3023799007|6133799003|10067099003|5023799004|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wjnW5MBC1uCYL/nhYJq8wt63GLygrEi9E3U9v45WFQMa9UFI8Cbr1c3IHEM/oDnpStcYV5VtMvvVDHW6Usag8+ehGntamgwH89FdqoxdXjliSiP1kAjRCNKLNviMA1pZPef0jfmPZap0G2DLoNkaKZk/bE4O7lzWgRELgxyVrKy+2yHbxIZeyiMppGPzTIP6di2o3pNOYKO0ZNHuDxlRVWsB9MyoyogmLCINBOxdq0ffhxj69odxftYtBRDGskJnbyZkLLnqCImJ0QWiihjBQ2O7QSh1zafPmregHR0cQ6Dhf5PjgPopuu6eDgts6ntE2C4sSEZJm2UnGh2RN/Vok5KxGvVnADiuyd2CfBqNSX7mmvsmuNgLGHI6U10W2HPFrdZVuEX5t/isFQuutHVZUOVf1ZJYm2BnLGQAFeKDwiYqK3yr00qC7aRQuwheE5nlKFomchp45FOn/jyKLiX/lzMuuwNFgE/q5SD/RB7G/q2tTN8rV0q118Mkg5k1sRaejRFEv/DrLzO7M+tqHMjB6p8lrLQcqvkgfdS9uSHRx5ilQp5Xe4QhPoYmkYVPesWSrLLqMCQ83HT6zNH7pSfhb43W8BLFuKbSgZJ2CLinjUU2PJguBVYszs6Qf/sclypsUYNWTU2fcCLuHb1HiHPjTQo+M6IDkfbvg2badQx7hnY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(13003099007)(3023799007)(6133799003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzZWTzZtY0pZeWtQd3RKTVA2RmN1Z3ZLM3ZocHhKb2ZzeUNkNndJMnR3MEZx?=
 =?utf-8?B?a3lMaktsdit4Q05yU2RmZGNnSFhDM3RPcFdQL0JScFJiTVRYbzhkL2pBeW1W?=
 =?utf-8?B?K3g5ZGxRTEpFUmZwakVtOWhSRFRuN2NYbktwdDlseTJjNEJ2S1VnSytVdkpx?=
 =?utf-8?B?bDI1Qkg5bkV6ZDdwc2oyUFQ4MFpvR0NBNnNpbHdnbk9rWkZVazFFL2h4dUZ3?=
 =?utf-8?B?SExyS2ptQUNPdVgzWHFYYzE5aFJUL2J3S1dKbVFKY2xNYTNjVk1TK1cwa3F1?=
 =?utf-8?B?dEx2eWJJSDRtQkVNOEdTT29vcXpNejhiencrMXhGRk94MU15U3BOeDJpQzRy?=
 =?utf-8?B?UEdBY2ZidkNmRlpwMytadjU0NXRsaUZOOGtBdndOM04yUHN0NGFkTVBhZHBM?=
 =?utf-8?B?TVpXRzVVOFFTeG8xTlFZanRlR1JHZnl5YWdHcUNSY1B0dERxSFh1RGppeHJ3?=
 =?utf-8?B?Vld6RmVnZnVnUW0xYWtMcnhXbFNuS2pjbTRMR1I0YjRxdWNaODZhcDV4dmZa?=
 =?utf-8?B?eTdnc3g1V0NCeGllQWdwOEx6UWJhQVVnbWt1R1lJN1REUzllVmdFN1lneGpy?=
 =?utf-8?B?SGlMNGlSdi9Qb1pSUkw4MzFaV2diUHNDRVVKODZGRGw0YXEzQ3MxMDBVQVZl?=
 =?utf-8?B?bGZDR20xNUVNQU1BQlFLU2Y2OSsxQ2RnQ1dnRDV4aXhza1UrTy9OMFRDRUJz?=
 =?utf-8?B?MUExVFVKemZXRnN4RWQ1TTA4Q0Q4NWRYVnd2N0RVWThPWWMyZ3FuTSt5R093?=
 =?utf-8?B?RXNUd0JIK2pIMFMyaFlmbW93TzRXQXhFakpHT2plTjVPaVROOC9hSGpPS0lW?=
 =?utf-8?B?Mlg2RWNrZHNCWS9WVGgrWUM1RmNmZzc5YVZnOURCQlVyNnVjMTdsTWpNb29G?=
 =?utf-8?B?NUYwV29HNzFuM3k5OVVqT1Q3NzE0b0IydjB4a3FXN2dORFZ4Y1NvM0F3QTRo?=
 =?utf-8?B?M1ZhUW9ZRDM5L1N5WnNEMzRrOHByMFNCeTZiY29PZ05uTDY0Rzl1N3gwc1Yw?=
 =?utf-8?B?NGRRa2dvMWhHYkxKamI0MklSSE5BZnVEaDA2YnFsSC8zakZOWVQ3YkRSanBM?=
 =?utf-8?B?TzRzanRlVVAwMEJ0ZkhuZTBtNWdtOFh0MFlkVHFwYjFXTTB3Z2NGWTlMZGY5?=
 =?utf-8?B?bXgrTHhEbHJocUtjNE1iOS8wRnBiUi9qVERxVWZrVzk3eTE5REhsOWFHUFdi?=
 =?utf-8?B?MndMYnhOK0xUNXVwZHFSem9YOEV2aFhoQ1VVblByS21jR0ZHanJLUjFYUFF3?=
 =?utf-8?B?cUxqa00xQngvNlo5ajF3TTdjalRCa3duUEJ5ZEh6cnFyOHIrUVJldzY3VUdN?=
 =?utf-8?B?aE92NE92dEJEY3REUjFsaEMweVNBa3ZIQi9jZGJaV0NWTzg3TEFWUkVwUnRv?=
 =?utf-8?B?WjZUb29GQlMrRXR3UkZ6cmx0clAvWUFFL0dFa1BDSi94aVp2bFR6eUtpbG5x?=
 =?utf-8?B?N2J3akFDNmJQQzBtRmFiSmUvYjI1RTZUN0VMenNJLzVRRjNaTGpnUzJTNm5T?=
 =?utf-8?B?RklNZ2xESlNZNTQzL20xMmpCbmk1K1ZjcUM2cXREK3o4c0V2WEVabHA4SGRJ?=
 =?utf-8?B?SVpSdld3VS9JL3lkNmRGcWJXOUY2dWtaVjM0cDRjNmMvYVRXQ3JxM3NSVmJX?=
 =?utf-8?B?UEo2Z3BWK2R1bzVRM3prUDlGVHg4em82SDRNME9uQ1hLNkNQNEhqTkNxS1o3?=
 =?utf-8?B?djlMeVZCbFpxbnZvTWlBdWl0cmZ0VGQ5ZFdsZmZKZ1MzTzZoK1FTN0psM1BF?=
 =?utf-8?B?OUhnOUkrZDRFNGhibEdaalpQYk1Sa2hvMmN3WFlJdWcvVEROdjRycHc1aVZp?=
 =?utf-8?B?MXVPSEJKNjRUTkdzcUl2ZExNbHN3Rk84cVRnSXo1T2JWTlhsblgvcFhvWGN2?=
 =?utf-8?B?WERaam8vY1lZeWdGR0hrZHBmU3MvaElZcDB1dUdHZEwwWHA4dmdaWVh1QXJZ?=
 =?utf-8?B?NGlOR0poN2xxaml0NW4yKzFpbUFrVW5YeUNwZ09xRjdabldDQll1TnJFeEtF?=
 =?utf-8?B?YUtMOU0wWU8zQVd1blN1dXVJYjZubzZTUWxDVzNSUkNmTm43ZXN0M1F4SGxu?=
 =?utf-8?B?ZFh6ajQrclh2M1ZCVzMxelNJRFlsTVRNU1FDa1hoK3FldVNwM1dTMTV4SWE2?=
 =?utf-8?B?a2ZYYkpCTm5Rb2tIMnBhRnFBWTB2bzJqTHdvTjZPMzZWV3B1MnZ6N3BwQjBE?=
 =?utf-8?B?eXY0Tkd2OUg4QW9RVmpsZm9FTFBSYUllcW1OQ1RKWGpYQkZvK085bXFncDZU?=
 =?utf-8?B?blB1dVZ1OVo5R21ZamZmK1hKakIzVnNHMG5xMEdhZlBIZ3VoWkswaE03VUVP?=
 =?utf-8?B?ZVdRbGJXOXdremF3bHIydmw1VDNrUS9DcndVN3NDbDRZdkVqbUljZz09?=
X-Exchange-RoutingPolicyChecked: znscMXxZbkSinXlyemQiMJc/zzhSPc0SliNo2eXZAT2RR5Qk9VYzZcv4BZ9Tz+pQJfLPWpiO8zcAgesNVi2gtrOVNf3lL/Oa9QT1cQAyU01QJCx65/DDXHdS85KZPhs2JyGX6n5/OQpVp/lHwYCUFfmE6N1RCInkEp2mQDdCWIcLj2Ob3sfyMk6hT9yMlpogty9RFxZYtTBAQOyJKRpPxdyvHImu479prk8t3CItN/uZ5xv83gCAq5efGziYBTSd+yoNhiuvHZa8utEaOVTXNNij3NWThIYRQ54UATdMrf2coNCBjQO2AtbyX5i9ehdPbv8YsOA0zetJ4oDebamI+Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21043e84-5c3b-46c8-4cce-08df18ab9baa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 13:15:44.3073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4JBCTBu0VinCV55T1LCD57Ipp6EwWjgw8sjZElcCUj4uI4iAh5IOjUlahuIovQE+kkTlUYxh1uzPVEFQ6JarA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB989252
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE5MiBTYWx0ZWRfX6JSfQaHfRPcx
 sK4XB8LskBvOkh1KNeaB0jA9x6ci9Sxb7DRDyTgyrHoitHw7QUinUu/R4WqvdaKO8FarIEddBxT
 9Jh3XGFO/8sHT0AXFT6WjotSFtYpoHzoE1aIbhWWX9o1q0zHSTJSu5SLODvTkXeim6rCqy0YKDK
 tb7Y5AziTXRlCej/zZOXe6SPaCbPZn0AWe72OaMIHoAFwUD5klfqyvivno/uvl1lLrYAESJISnV
 Qmi9IS2BA7bgZExGF7ASFg1Gy/8aBF4ii0TSidkpZlH6HaCnrYEP+3sgTSJNi2mo2f3/U2aMFWi
 SgeHHzXhPRqCX80aC1kogz5yJNzQkJzkludz9Bn+++qbxD0+wusytPNBsIdGZ2so+qKCCpncI6b
 lQKtLLbDcCcIoQa4UTD1RHTm77QOUXpXDIR5wT/lOYjwkVrpdh6lxEzlXUMdsmCo+QOrM1hxNFJ
 V06L0uBt+QFi7QwHxbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE5MiBTYWx0ZWRfX3qedUrxIaOOC
 +AlZh2gW1IDmRSce9g1m8pYZZ+V59SihXvWcfHHKUPO5V01G+pfnG68VVijzLTfhWkmX9agBzCj
 nSy6NiREPvAMUUxv9eh+idEhhPsxL+TKN4w3/StoxKzB8qCXv0HQ
X-Proofpoint-ORIG-GUID: wXSZpm7BtiWAr7zYedwQKqj6fUjrrk5n
X-Proofpoint-GUID: wXSZpm7BtiWAr7zYedwQKqj6fUjrrk5n
X-Authority-Analysis: v=2.4 cv=adH0Dhot c=1 sm=1 tr=0 ts=6ab27f83 cx=c_pps
 a=sTSJOlcUIwiiAZkT7IHz4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=JfrnYn6hAAAA:8 a=ndfAsE3V-q_wF2UIvHQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_141609_408765_8E2EF841 
X-CRM114-Status: GOOD (  50.15  )
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

T24gRnJpLCBTZXAgMTgsIDIwMjYgYXQgMTE6MDc6MTBBTSArMDEwMCwgTnVubyBTw6Egd3JvdGU6
Cj4gT24gRnJpLCBTZXAgMTgsIDIwMjYgYXQgMTE6MjU6NTRBTSArMDIwMCwgTWljaGFlbCBXYWxs
ZSB3cm90ZToKPiA+IE9uIFdlZCBTZXAgMTYsIDIwMjYgYXQgMTA6NDQgQU0gQ0VTVCwgTnVubyBT
w6Egd3JvdGU6Cj4gPiA+IE9uIFdlZCwgU2VwIDE2LCAyMDI2IGF0IDA5OjE0OjUyQU0gKzAyMDAs
IE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gPiA+PiBPbiBNb24gU2VwIDE0LCAyMDI2IGF0IDU6MzEg
UE0gQ0VTVCwgTnVubyBTw6Egd3JvdGU6Cj4gPiA+PiA+IE9uIE1vbiwgU2VwIDE0LCAyMDI2IGF0
IDA0OjA0OjQwUE0gKzAyMDAsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gPiA+PiA+PiBPbiBNb24g
U2VwIDE0LCAyMDI2IGF0IDM6NDIgUE0gQ0VTVCwgTnVubyBTw6Egd3JvdGU6Cj4gPiA+PiA+PiA+
ICgqKTogSSBzaG91bGQgbm90ZSB0aGF0IHRoZSBjb21tYW5kIGFjdHVhbGx5IGZhaWxlZCB3aXRo
IC1FSU8gYnV0IGl0Cj4gPiA+PiA+PiA+IGFjdHVhbGx5IHVubG9ja2VkIHRoZSBjaGlwISBBbmQg
dGhlIHJlYXNvbiBpcyBiZWNhdXNlIHRoZSBmbGFzaCBhcyB0aGUgc2FtZQo+ID4gPj4gPj4gPiBG
U1IgcmVnaXN0ZXIgdGhhbiB0aGUgbWljcm9uLXN0IGZsYXNoLiBTbyBXRUwgaXMgc2V0IHRvIDEg
YnV0IGNhbiBvbmx5Cj4gPiA+PiA+PiA+IGJlIGNsZWFyZWQgd2hlbiBjbGVhcmluZyB0aGUgRlNS
IHJlZ2lzdGVyLgo+ID4gPj4gPj4gCj4gPiA+PiA+PiBXaHkgZG9lc24ndCB0aGlzIGFmZmVjdCBv
bmx5IHRoZSBsb2NraW5nIG9wZXJhdGlvbj8gV0VMIHBvbGxpbmcgaXMKPiA+ID4+ID4+IHVzZWQg
YWxzbyBkdXJpbmcgd3JpdGUgYW5kIGVyYXNlLgo+ID4gPj4gCj4gPiA+PiBTb3JyeSBJIG1lYW50
IFdJUC4KPiA+ID4+IAo+ID4gPj4gPiBOb3Qgc3VyZSBpZiBJIGZ1bGx5IHVuZGVyc3RhbmQuIEJ1
dCBBRkFJQ1QsIHRoZSByZWFzb24gd2h5IGVyYXNlIGFuZAo+ID4gPj4gPiB3cml0ZSBpcyBzaWxl
bnQgaXMgYmVjYXVzZSB0aGUgZGVmYXVsdCBzcGlfbm9yX3NyX3JlYWR5KCkgb25seSBsb29rcyBh
dAo+ID4gPj4gPiBTUl9XSVAgWzFdOgo+ID4gPj4gCj4gPiA+PiBTbyB1c3VhbGx5LCB0aGUgV0VM
IGlzIGNsZWFyZWQgYXV0b21hdGljYWxseSBieSB3aGF0ZXZlciBuZWVkcyB0aGUKPiA+ID4+IFdF
TCBpbiB0aGUgZmlyc3QgcGxhY2UsIGkuZS4gcHJvZ3JhbSBvciBlcmFzZSwgd3JpdGUgKHN0YXR1
cykKPiA+ID4+IHJlZ2lzdGVyLiBUaGF0IHNob3VsZCBhbHNvIGJlIHRoZSBjYXNlIGZvciB0aGlz
IGZsYXNoLgo+ID4gPj4gCj4gPiA+PiBOb3cgZm9yIHRoaXMgZmxhc2ggKGFzIHdlbGwgYXMgdGhl
IHN0L21pY3JvbiBvbmVzKSwgdGhlcmUgaXMgb25lCj4gPiA+PiBwZWN1bGlhcml0eS4gV2hlbmV2
ZXIgdGhlcmUgaXMgYW4gZXJyb3IgYml0IHNldCBpbiB0aGUgRlNSLCB0aGUgV0VMCj4gPiA+PiBj
YW5ub3QgYmUgY2xlYXJlZCBieSBhIHdyaXRlIGRpc2FibGUgY29tbWFuZC4gV2hpY2ggd2Ugc2hv
dWxkbid0Cj4gPiA+PiBuZWVkIGFueXdheSBiZWNhdXNlIGl0IHNob3VsZCBiZSBjbGVhcmVkIGF1
dG9tYXRpY2FsbHkgaWYgbm90aGluZwo+ID4gPj4gZ29lcyB3cm9uZy4KPiA+ID4+IAo+ID4gPj4g
QWxzbyB0aGUgd3JpdGUgc3RhdHVzIHJlZ2lzdGVyIHdvbid0IHNldCB0aGUgZXJyb3IgYml0cyBp
ZiBpIHJlYWQKPiA+ID4+IHRoZSBkYXRhc2hlZXQgY29ycmVjdGx5IGFuZCBpdCB3aWxsIGFsd2F5
cyBkaXNhYmxlIHRoZSBXRUwsIHNlZQo+ID4gPj4gVGFibGUgMjkgKCJXUklURSBSRUdJU1RFUiBP
cGVyYXRpb25zIikgaW4gdGhlIE1UMzVYVTUxMkFCQSBkYXRhc2hlZXQKPiA+ID4+IGFuZCBUYWJs
ZSA4LDggKCJXUklURSBSRUdJU1RFUiBPcGVyc3RhaW9ucyIpIGluIHRoZSBJUzI1V1gwMUcKPiA+
ID4+IGRhdGFzaGVldC4KPiA+ID4+IAo+ID4gPj4gPiBPVE9ILCBvbiB0aGUgdW5sb2NrIHBhdGgg
d2UgZG8gc3BpX25vcl93cml0ZV9zcjFfYW5kX3NyMl9hbmRfY2hlY2soKSBhbmQKPiA+ID4+ID4g
Z2l2ZSBubyBzcGVjaWFsIGhhbmRsaW5nIHRvIFdFTCBzbyBJIGltYWdpbmUgdGhhdCB3ZSB0cnkg
dG8gc2V0IGl0IGFzIDAKPiA+ID4+ID4gYnV0IHJlYWQgaXQgYXMgMSAoZ2l2ZW4gdGhhdCBpdCBj
bGVhcnMgb25seSB3aXRoIEZTUikgYW5kIGhlbmNlIEkgZ290Cj4gPiA+PiA+IHRoZSAtRUlPIGlu
IFsyXS4KPiA+ID4+IAo+ID4gPj4gV2UgZG8gYSBSTVcsIHNvIG15IGd1ZXNzIGlzIHRoYXQgaXQn
cyB0aGUgb3RoZXIgd2F5IGFyb3VuZC4gV2UgcmVhZAo+ID4gPj4gaXQgYXMgMSwgYnV0IHRoZW4g
YWZ0ZXIgd3JpdGluZyB0aGUgU1IsIGl0J3MgMCAoc2VlIGFib3ZlKS4gVGhhdAo+ID4gPj4gYWN0
dWFsbHkgYXNzdW1lcywgdGhhdCBpZiB0aGUgV0VMIGFuZCBhbnkgZXJyb3IgYml0IGluIHRoZSBG
U1IgaXMKPiA+ID4+IHNldCwgYSB3cml0ZSBzdGF0dXMgcmVnaXN0ZXIgd2lsbCBjbGVhciB0aGUg
V0VMIGFueXdheXMuIENvdWxkIHlvdQo+ID4gPj4gZGVidWcgdGhhdCBzbyB3ZSBhcmUgc3VyZSwg
dGhpcyBpcyB3aGF0IGFjdHVhbGx5IGhhcHBlbnM/Cj4gPiA+Cj4gPiA+IFN1cmUgSSdsbCBkbyBz
b21lIGRlYnVnZ2luZyBvbiB0aGUgdW5sb2NrIHBhdGguIFRoZSBEUyBzZWVtcyBhIGJpdAo+ID4g
PiB1bmNsZWFyLiBJdCBhbHNvIHN0YXRlcyAoZm9yIHRoZSBXUklURSBESVNBQkxFKQo+ID4gPgo+
ID4gPiAiLi4uSW4gY2FzZSBvZiBhIHByb3RlY3Rpb24gZXJyb3IsIFdSSVRFIERJU0FCTEUgd2ls
bCBub3QKPiA+ID4gY2xlYXIgdGhlIGJpdC4gSW5zdGVhZCwgYSBDTEVBUiBGTEFHIFNUQVRVUyBS
RUdJU1RFUiBjb21tYW5kIG11c3QgYmUgaXNzdWVkIHRvCj4gPiA+IGNsZWFyIGJvdGggZmxhZ3Mu
Cj4gPiA+ICIKPiA+IAo+ID4gTm90IHN1cmUsIHRoaXMgY29udHJhZGljdHMgZWFjaCBvdGhlci4g
QXMgSSByZWFkIGl0Ogo+ID4gCj4gPiAgLSBXcml0ZSAoc3RhdHVzKSByZWdpc3RlciB3aWxsIGFs
d2F5cyBjbGVhciBhIFdFTCwgdGhlIG9ubHkgb3Blbgo+ID4gICAgcXVlc3Rpb24gaXMsIGRvZXMg
aXQgYWxzbyBjbGVhciBpdCBpZiB0aGUgcHJvdGVjdGlvbiBiaXQgaW4gdGhlCj4gPiAgICBGU1Ig
aXMgc2V0Cj4gPiAgLSBXcml0ZSBkaXNhYmxlIHdvbid0IGNsZWFyIHRoZSBXRUwgaWYgdGhlIHBy
b3RlY3Rpb24gYml0IGluIHRoZQo+ID4gICAgRlNSIGlzIHNldC4KPiA+IAo+ID4gPiBCdXQgdGhl
IHRydXRoIGlzIHRoYXQgdGhlIHNlY29uZCB1bmxvY2sgSSBkaWQgY2FtZSB3aXRob3V0IGFuIGVy
cm9yLgo+ID4gCj4gPiBXaGljaCBtaWdodCBpbmRpY2F0ZSB0aGF0IGEgd3JpdGUgc3RhdHVzIHdp
bGwgY2xlYXIgdGhlIFdFTCBhbnl3YXkuCj4gPiBCdXQgdGhlbiBpdCBtaWdodCBhbHNvIGJlIGlu
dGVyZXN0aW5nIHRvIHNlZSBpZiB0aGUgUFJPVCBiaXQgaW4gRlNSCj4gPiBpcyBzdGlsbCBzZXQu
IElPVywgaWYgYSBuZXcgd3JpdGUgZW5hYmxlIGlzIHNlbnQsIGEgd3JpdGUgZGlzYWJsZQo+ID4g
bWlnaHQgZmFpbCBldmVuIGlmIHRoZXJlIHdhcyBubyBhY3R1YWwgZXJyb3IuCj4gPiAKPiA+ID4K
PiA+ID4+IAo+ID4gPj4gQnV0IHRoZSBxdWVzdGlvbiBpcyB3aG8gaXMgc2V0dGluZyB0aGUgZXJy
b3IgYml0IGluIHRoZSBmaXJzdCBwbGFjZS4KPiA+ID4+IEFuZCBJIGd1ZXNzIGl0J3MgdGhlIHRl
c3Rpbmcgc2VxdWVuY2UgZm9yIHRoZSBsb2NraW5nIHdoZW4geW91IHRyeQo+ID4gPj4gdG8gd3Jp
dGUgdG8gYSBsb2NrZWQgcmFuZ2UuIFNvIHlvdSBjb3VsZCBhbHNvIGFjdHVhbGx5IHRlc3QgdGhl
Cj4gPiA+PiBsb2NraW5nL3VubG9ja2luZyB3aXRob3V0IHdyaXRpbmcgYW55IGRhdGEgdG8gdGhl
IGZsYXNoIGp1c3QgdG8gc2VlCj4gPiA+PiBpZiB0aGF0IGlzIHRoZSBjYXNlLgo+ID4gPgo+ID4g
PiBQcmV0dHkgc3VyZSB0aGUgYWJvdmUgaXMgdGhlIGNhc2UhIElmIHlvdSBsb29rIGF0IG90aGVy
IHRlc3RzIGFmdGVyCj4gPiA+Cj4gPiA+ICJPbmNlIHdlIHRydXN0IHRoZSBkZWJ1Z2ZzIG91dHB1
dCB3ZSBjYW4gdXNlIGl0IHRvIHRlc3QgdmFyaW91cwo+ID4gPiBzaXR1YXRpb25zLiBDaGVjayB0
b3AgbG9ja2luZy91bmxvY2tpbmcgKGVuZCBvZiB0aGUgZGV2aWNlKToiCj4gPiA+Cj4gPiA+IEV2
ZXJ5dGhpbmcgd29ya2VkIG5pY2VseSBnaXZlbiB3ZSB3ZXJlIGp1c3QgZG9pbmcgbG9jay91bmxv
Y2suIFRoZSBEUyBpcwo+ID4gPiBhbHNvIGNsZWFyIGFib3V0IHRoaXMgKHRhYmxlIDguMTEpOgo+
ID4gPgo+ID4gPiAiLi4uV2hlbiBhIGNvbW1hbmQgaXMgYXBwbGllZCB0byBhIHByb3RlY3RlZCBz
ZWN0b3IsIHRoZSBjb21tYW5kIGlzIG5vdCBleGVjdXRlZCwKPiA+ID4gdGhlIHdyaXRlIGVuYWJs
ZSBsYXRjaCBiaXQgcmVtYWlucyBzZXQgdG8gMSwgYW5kIGZsYWcgc3RhdHVzIHJlZ2lzdGVyIGJp
dHMgMSBhbmQgNCBhcmUgc2V0LiAKPiA+ID4gSWYgdGhlIG9wZXJhdGlvbgo+ID4gPiAiCj4gPiAK
PiA+IE9rLgo+ID4gCj4gPiA+IEkgYWxzbyBkaWQgdGVzdGVkIHdpdGggYmFzaWNhbGx5IHRoZSBz
YW1lIGNvZGUgYXMgaW4gbWljcm9uLXN0IGFuZCB0aGVuCj4gPiA+IEVSQVNFIGFuZCBQUk9HUkFN
IGNvbW1hbmRzIGp1c3QgcmV0dXJuIC1FSU8uCj4gPiAKPiA+IEJ1dCB0aGUgdW5sb2NraW5nIGRv
ZXMgbm90IHJldHVybiBFSU8gYW55bW9yZSB3aGVuIGl0J3MgZXhlY3V0ZWQKPiA+IHN1Y2Nlc3Nm
dWxseT8KPiAKPiBVbmxvY2sgbmV2ZXIgcmV0dXJuIEVJTyBiZWNhdXNlIHdlIGRvIG1pY3Jvbl9z
dF9ub3JfY2xlYXJfZnNyKCkgZm9sbG93ZWQgYnkKPiBzcGlfbm9yX3dyaXRlX2Rpc2FibGUoKSB3
aGljaCBzaG91bGQgY2xlYXIgV0VOLiBTbyB0aGUgZXJyb3IgaXMgcmVwb3J0ZWQKPiBvbiB0aGUg
Y2FsbCBpdCBzaG91bGQgYmUgcmVwb3J0ZWQgSU1PLgo+IAo+ID4gCj4gPiA+PiA+PiA+IEFGQUlD
VCwgd2Ugc2hvdWxkIGRvIHNvbWV0aGluZyBzaW1pbGFyIGFzIG1pY3JvbiBzbyB0aGUgd3JpdGlu
ZyB0byBhbgo+ID4gPj4gPj4gPiBhY3R1YWwgcHJvdGVjdGVkIHJlZ2lvbiBmYWlscyByYXRoZXIg
dGhhbiBiZWluZyBzaWxlbnRseSBkaXNjYXJkZWQgd2l0aAo+ID4gPj4gPj4gPiB0aGF0IHN0YXR1
cyBiaXQgc2V0LiBUaGUgcXVlc3Rpb24gd291bGQgYmUgaG93IHRvIGRvIGl0PyBUaGUgY29kZSBp
cwo+ID4gPj4gPj4gPiBwcmV0dHkgbXVjaCBpZGVudGljYWwgdG8gWzFdLiBUaGUgbWFza3MsIHRo
ZSBvcGNvZGVkLi4uIFNvIHNob3VsZCB3ZQo+ID4gPj4gPj4gPiBzb21laG93IGhhbmRsZSB0aGlz
IGluIHRoZSBjb3JlIChieSBoYXZpbmcgc29tZSBjb21tb24gaGVscGVyKSB0aGF0Cj4gPiA+PiA+
PiA+IGNvdWxkIGJlIHNldCBpbiAubGF0ZV9pbml0KCkgdW5kZXIgYSBjb21tb24gTUZSX0ZTUiBm
bGFnPyBPciBqdXN0IGtlZXAKPiA+ID4+ID4+ID4gYm90aCBpbXBsZW1lbnRhdGlvbnMgc2VwYXJh
dGUgZm9yIG5vdz8KPiA+ID4+ID4+IAo+ID4gPj4gPj4gSSdkIGxpa2UgdG8ga2VlcCB0aGF0IG91
dCBvZiB0aGUgY29yZS5jLCBidXQgYWxzbyBsaWtlIHRvIGF2b2lkIGFueQo+ID4gPj4gPj4gY29k
ZSBkdXBsaWNhdGlvbiBlc3AuIGJlY2F1c2UgdGhlcmUgaXMgYWxyZWFkeSBoYW5kbGluZyBmb3Ig
dGhlCj4gPiA+PiA+PiBpbnRlbCBzcGkgY29udHJvbGxlciBpbiB0aGVyZS4gU28gbWF5YmUgbW92
ZSBpdCBpdCBpbnRvIGEgbmV3Cj4gPiA+PiA+PiBjb21tb24uYy4KPiA+ID4+ID4KPiA+ID4+ID4g
QWxzbyBkb24ndCBsaWtlIHRoZSBkdXAgdGJoLiBDb3VsZCB0aGF0IGJlIGEgZm9sbG93IHVwIG9y
IHNob3VsZCBpdCBiZQo+ID4gPj4gPiB2My4gRnJvbSB0aGUgdG9wIG9mIG15IGhlYWQgSSBjb3Vs
ZCB0aGluayBvbiBhIG1mcl9jb21tb24uYyBraW5kIG9mIHRoaW5nLgo+ID4gPj4gPiBEb24ndCB0
aGluZyB0aGlzIEZTUiByZWdpc3RlciBpcyBzdGFuZGFyZD8KPiA+ID4+IAo+ID4gPj4gTm90IHJl
YWxseS4KPiA+ID4+IAo+ID4gPj4gQnV0IChhdCBsZWFzdCkgcGFydHMgb2YgdGhlIGRhdGFzaGVl
dHMgYXJlIGFjdHVhbGx5IGNvcGllZCB2ZXJiYXRpbQo+ID4gPj4gYmV0d2VlbiBtaWNyb24gYW5k
IGlzc2ksIEkgd29uZGVyIGlmIHdlIHNob3VsZG4ndCBqdXN0IHB1dCB0aGUgSVNTSQo+ID4gPj4g
cGFydCBpbiBtaWNyb24tc3QuYy4gKFllcyB2ZW5kb3Igd2lsbCBiZSB3cm9uZywgYnV0IEkgcGxh
biBvbgo+ID4gPj4gZGVwcmVjYXRpbmcgdGhhdCBzeXNmcyBwcm9wZXJ0eSBhbnl3YXkpLgo+ID4g
Pgo+ID4gPiBBbHNvIHdvcmtzIGZvciBtZS4gU2F5IHRoZSB3b3JkIGFuZCBJIGNhbiBzZW5kIHYz
IHdpdGggdGhpcyBpbgo+ID4gPiBtaWNyb24tc3QuYy4KPiA+IAo+ID4gWWVzLiBCdXQgYWxzbyBw
bGVhc2UgdmVyaWZ5IHRoZSBvdXIgZ3Vlc3NlcyBhYm91dCB0aGUgcm9vdCBjYXVzZSBvZgo+ID4g
dGhpcyBhbmQgd2hhdCdzIHRoZSBhY3R1YWwgYmVoYXZpb3Igb2YgdGhlIHdyaXRlIGRpc2FibGUu
Cj4gPiAKPiAKPiBPawoKQWxyaWdodCEgSSBmaW5hbGx5IGdvdCB0aGUgdGltZSB0byBzb21lIHRl
c3RzIGFuZCB0aGUgdW5sb2NrIGVycm9yIGlzCmFjdHVhbGx5IGFzIHlvdSBleHBlY3RlZDoKCmZs
YXNoX2xvY2sgLWwgL2Rldi9tdGQ0CmRkIGlmPS9kZXYvdXJhbmRvbSBvZj0uL3NwaV90ZXN0MiBi
cz0xTSBjb3VudD0yCm10ZF9kZWJ1ZyB3cml0ZSAvZGV2L210ZDQgMCAyMDk3MTUyIHNwaV90ZXN0
MgpmbGFzaF9sb2NrIC11IC9kZXYvbXRkNApbIDMxNDcuNDY0NjkwXSBzcGktbm9yIHNwaTYuMDog
U1I6IDB4NWUgLT4gMHgwMgpbIDMxNDcuNDY5Njk5XSBzcGktbm9yIHNwaTYuMDogU1IxOiByZWFk
IGJhY2sgdGVzdCAoMHgwMCAhPSAweDAyKQpmbGFzaF9sb2NrOiBlcnJvciE6IGNvdWxkIG5vdCB1
bmxvY2sgZGV2aWNlOiAvZGV2L210ZDQKCiAgICAgICAgICAgIGVycm9yIDUgKElucHV0L291dHB1
dCBlcnJvcikKClNvIHllYWgsIHRoZSB3cml0ZSBlbmFibGUgaXMgbGVmdCBhcyAxIGFuZCB3ZSB0
cnkgdG8gd3JpdGUgaXQgYnV0IHJlYWQKYmFjayAwIChzbyB3cml0ZV9zdGF0dXMgZG9lcyBjbGVh
bnMgaXQpLgoKVGhlIGJlbG93IGxvZ3MgYWxzbyByZXBseSB0byB5b3VyIEZTUiBiaXRzIHF1ZXN0
aW9uOgoKWyAgMTU1LjczNzI1MF0gc3BpLW5vciBzcGk2LjA6IFJlYWRpbmcgRlNSICgweDkyKSBi
ZWZvcmUgd3JpdGUgU1IKWyAgMTU1LjczODM4NV0gc3BpLW5vciBzcGk2LjA6IFJlYWRpbmcgRlNS
ICgweDkyKSBhZnRlciB3cml0ZSBTUgoKTm93LCBvbmUgaW50ZXJlc3RpbmcgdGhpbmcgSSBmb3Vu
ZCBpcyB0aGF0IHRoZSBkYXRhc2hlZXQgaXMgbm90IHZlcnkKYWNjdXJhdGUgYmVjYXVzZSB0aGUg
YmVsb3cgdGVzdCBwYXNzZXMganVzdCBmaW5lOgoKZmxhc2hfbG9jayAtbCAvZGV2L210ZDQKbXRk
X2RlYnVnIGVyYXNlIC9kZXYvbXRkNCAwIDIwOTcxNTIKZmxhc2hfbG9jayAtdSAvZGV2L210ZDQK
CkRlYnVnZ2luZyB0aGUgYWJvdmUgSSBmb3VuZCBvdXQgdGhhdCB3cml0ZSBkaXNhYmxlIGFjdHVh
bGx5IGNsZWFycyB0aGUKd3JpdGUgZW5hYmxlIGJpdC4gQW5kIGdpdmVuIHRoYXQgc3BpX25vcl9l
cmFzZSgpIGNhbGxzCnNwaV9ub3Jfd3JpdGVfZGlzYWJsZSgpIHdlIGRvIG5vdCBzZWUgLUVJTyBp
biB1bmxvY2suCgpBcyBmb3IgRlNSLCB0aGV5IHJlbWFpbiBzZXQgdW50aWwgd2UgY2xlYXIgdGhl
bS4KClNvLCB3aGF0IHdvdWxkIGJlIHlvdXIgcHJlZmVyZW5jZT8gU29tZSBjb21tb24uYyAob3Ig
bWZyX2NvbW1vbi5jKSB3aXRoCnRoZSBpc3NpL21pY3JvbiBzaGFyZWQgY29kZSBvciBzaG91bGQg
SSBqdXN0IG1vdmUgdGhlIG5ldyBpc3NpIHBhcnQgdG8KbWljcm9uLXN0LmMgYW5kIHVzZSB0aGUg
Y29kZSBhbHJlYWR5IHRoZXJlPwoKLSBOdW5vIFPDoQoKPiAKPiAtIE51bm8gU8OhCj4gCj4gPiAt
bWljaGFlbAo+IAo+IAo+IAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
PiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
