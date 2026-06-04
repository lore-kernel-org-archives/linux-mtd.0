Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5004CD6E6E
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jun 2026 12:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNg4qjBcGe8tHGsRMjyGNMfK83qLKfjKWqbznrUQYW4=; b=XIUBi77lP+JK+d
	SwqWROA6VPvD9UGZ/7iutTq7yVBYLUKrpKE8NIjADeTBgI8XrMvsgT/beTPHFuN8o+zVu/TQAlkzh
	3dbuttjolhlTsMiQtEffGlADR/c7Vtb3ydBN3jkHgjuMK7Nkvv1zp3T4XCAy62rTtjrHC6VRUG4bp
	9yno4BWiIGdRY10tTaGepDufDvyENZg/vT437q6cbNnMT2PXVY0EZ9VxOco6/W/klahJGXIzPaJCR
	dQfDtJyxQMZwYt5jFuC1AG5sE8beX/OWoL8oZhNLU60pP1Acbi2hCGKgBtElBzJuVaUS8zImPzTdh
	y4+0jmaU+A7z/1SUUyzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6uH-0000000GhYs-3P35;
	Thu, 04 Jun 2026 12:10:41 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6uF-0000000GhY7-33HL
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jun 2026 12:10:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKGihtrjODIfycndxBhncHQ6Dga7dTz9/2s6cZD173hhrjvfjxjsmNCW0HirhYjUWOtTrAqNCxkc4D9JUxslXZhhivTlGpmEgSiip4A3BWFv1ZmTMsD1FmmuYvHkFv2IjiuRqkNLQ4r63skAC/77RKsLB4G63sX2SybLr0bp42QwIA7GDcE+Ejw2eUDssdXiOCgwHitxrb4P/6geTjqjzVhY/kxYHeOFBaT+pALbpRqHhVE8aWIIq+2GDgkx2/4umuKVzbuJwrJVvArep+a/LQ1VcH0h7LuYcW+SUsP0UbE1y92QVXcyFOI/WiuWUBmMNQRaNADB9MFTXRaq6jEepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ym/Lmb5cj6OnhD24Ihvmdn9GKZdeLhXb689jIuXqNc=;
 b=lZfBJR+5uvHQm7YoAdcwNnNZXUvtr3WW4nR0T4SHTQg4zRVIvCG6rFqF/UICSd1yaSWwIX2dBGnmFnYGSj3Ku6GRgIJHNJuc+nfSPrvBqOqJrmPLac5fRrUkir/0B1PfC9+61lFYbVIgpF9bbqSCDCENW7oDzFO7bOeeUa/lvU6dLAmXBN1TTv0/WyhkjKZOSwh5h4MnSgo137CnUINiqihFmDjrUdPyxm3XmENDqK8kXgqu5V56Ui+tIax7vhsc8oRC5zB8xCD1JCMZTXjezjMRg+G3OaLmGkXDQj7BLoSWYWFBRKm+YR5MLM9DPWbiXhs5utDNJ6HGqOOiLVgAuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ym/Lmb5cj6OnhD24Ihvmdn9GKZdeLhXb689jIuXqNc=;
 b=oPtbSbhFA8N6GzDVHtojBnEetN2ElFfJTNNyHaIobCoCejysqYSnZxF0ulndewykGE1/aFfWQvHaQQQ3WI9ETCDf0mT1yVnDT66Os9bdqJ6ahuqgeBgp2eFe2whYAzF7UcRHsAACtbLaAwRpXJsQI+1veRydyoAer0L6l69jDHY=
Received: from DS0PR17CA0016.namprd17.prod.outlook.com (2603:10b6:8:191::7) by
 SN4PR10MB997921.namprd10.prod.outlook.com (2603:10b6:806:4fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 12:07:28 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:8:191:cafe::6e) by DS0PR17CA0016.outlook.office365.com
 (2603:10b6:8:191::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 12:07:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 12:07:27 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 07:07:26 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 07:07:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 4 Jun 2026 07:07:25 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 654C7KQR3330008;
	Thu, 4 Jun 2026 07:07:21 -0500
Message-ID: <ab32fe1b-850e-4dda-b87b-188f0b7edc85@ti.com>
Date: Thu, 4 Jun 2026 17:37:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY tuning
 pattern partition property
To: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <pratyush@kernel.org>,
	<takahiro.kuwano@infineon.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <praneeth@ti.com>, <u-kumar1@ti.com>,
	<a-dutta@ti.com>, <s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-3-s-k6@ti.com>
 <20260602164945.GA475455-robh@kernel.org> <87zf1by5oc.fsf@bootlin.com>
 <CAL_JsqJwxgcFOB=kE7bVQYDn740-w4RppMF5W-3Ne9=9qV9OrQ@mail.gmail.com>
 <DIZN96NYLDUJ.DS1LFFAS2JH9@kernel.org>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <DIZN96NYLDUJ.DS1LFFAS2JH9@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|SN4PR10MB997921:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a94cdf-fd6a-4c54-e74b-08dec231d8c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|82310400026|376014|36860700016|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: T7pYyw6E4XzJCPccTwxsmSqtoPSgOqf6SX5NAHFIhhF5exUJ0r4lG8jw17c61SBHPobdmSMROKfqbYgQFbFNlxAXJ6SAFzebV8DYo1bgKkIie88WZgFnnfFrCdHBAV4q7WS1pewAM+2GyaAfCbb4ar4cwGRJ4rVSr7kZ+8C3jWWvYxZRGPfCatiSZ2K4Xbz1Tvfr7y/KRdskVjM0s43ptjKDsH6dpVPx9GtjEINeUrCq61u9pYI6MTOy2ipLuvX3Lqswy4LvzbEaQplR7ieBFAYWyqyAQ0m7H6OFPIdcHL7NnQeqxYoVIwQl/g4VNX/tcKBMtbagrDbI2awdSyf0lHG8Juz+0Mby6JJGhbcn0t3XR+bsp/RZTuHt7aY+pANMYjI39PzvYp7xnTdakM5D0/Pvnwo9vGFatM9dHX2LYq35ffqEmrLI8JNapgEAjJBQeqbqyaZfwj1Lnihr61ewE5fMIRKnoFkP8507e/gVYEq9yfBR4aOPJ/L9/qWVzT6+JbUS/eFzICu1umDNa7DV/6elAWIqtPpS35BlZGnQyA8nUFlBg/6hJ6Jry/xAxKm94u722k/ywxl5Ruvs4IY8JxkKccAGaPgZaewlVIXZ8PGq/zuNnmMYX2b0lyC/iUl2t4ZYmY44DkWZuZS7h3K4FFVNB/YWJ8QXIgpEZQszFDc5/TA7MI9gP1b4xz87GE97Hvm/5t+wTZMtgk8RuUYWkiZishP4MRGvaPwZu+kkQY0=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(376014)(36860700016)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JrlMrq8vUu85A1k4Dan/mENMqiMKi0O3++VwX5XogNnek1bEyM/wS2L5WdSklTJbvyClklVYE/jPD3sRhE1mGKqS+aKYe9hBGYBpVYpVyJR1hxD79YIwqXDlIuNMReINeTKmynRIbjeHr85lmcSD08XWj6q1W8slSjcJxMSXuhidTNDx1rErQA3b0NLiZC0r2FmhmUEyIWtemnFqNeMQImkby5sYbrwIptS0jgiFSoO+rgtzjR5jff9FuauXNjzxAyXmErYV3oZmvV1uaDGLqatQk8Vx/HtBmfJUDb2cfba2bB3F28OhikkUvg9KCgZt8FVvBig78cawADFgnAT76GDcSuL2pgf+MgcuP8ekpvVP+R/4QbTWSZ3u6mDpUQg+Tfn2fNoQ6H3RsIy1kV13/5gNIwHUQoIXGxdOKEGC/zfy+iI8RU2AAMPJ1FGxYvDH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 12:07:27.8454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a94cdf-fd6a-4c54-e74b-08dec231d8c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB997921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_051039_771269_D83E5CD3 
X-CRM114-Status: GOOD (  10.75  )
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

Hello Michael,

On 04/06/26 00:30, Michael Walle wrote:
> On Wed Jun 3, 2026 at 7:38 PM CEST, Rob Herring wrote:
>> However, you already have to support using label, so anything else
>> is supporting a 2nd way whether it is compatible or a phandle
>> property. Is it really worth it here?
> 
> Do we? I don't think we have. That was among my very first feedback
> on this series. Don't use hardcoded partition names for this, but a
> phandle. A compatible sounds even better though.
> 
> Also, I don't undestand why this property has a cdns prefix. This
> can also be relevant for any other SPI controller.

Good point. The cdns, prefix is a mistake.

I agree that this is not Cadence-specific and should be described as a
generic SPI peripheral property. I'll rename it to
spi-phy-pattern-partition and move it under spi-peripheral-props in v4.

Thanks,
Santhosh.

> 
> -michael
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
