Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A482EF4EAE
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2026 06:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:CC:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUmn+rrEGmp4r2hdyhCFxyv9/BBa8GRPGbkn+4XYzjs=; b=FrzHN7Cp7L6Bqr
	0IuYnqduzWMODtPwTqB7eRmBPTipQmmrudYg5GrskI+xfnif7eGYnk7do2cMyQa1mE5Gim/t/tehC
	r9B60wKRZwm/r7dHOmGAud8I2x67k1bRXNeV4Pz458WC5mQoOpRf4zW+IRXau0A4KL1bGO4VO0EUN
	u+IowS2wT6nLof7ytwaMeSlXcl8pbNcAJnH2eaqS03z2t5L7IX0umvbCt4jtBikk9w1+sMcfZQoWs
	Hs23BZ493BQ8eGtlhc6Tag58mrKGRfNBNOn3QbA1G8d/+Ri1IIF8FdPrfwgnDF/rGDxN5fRqa+QRi
	e7fXk33pX27B90uv4RdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9dgz-00000004reS-17f3;
	Mon, 06 Apr 2026 06:44:13 +0000
Received: from mail-eastusazon11012047.outbound.protection.outlook.com ([52.101.53.47] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9dgw-00000004re6-3ioV
	for linux-mtd@lists.infradead.org;
	Mon, 06 Apr 2026 06:44:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwVHDwYcTyZkljaO1G2z5xmmfSmyjc1tVZrxupPj0InpkYqWQ4tvfzkxnSE58SnX4tfNbQ5G9kZPDhGtQo9UzyJ1pHRYpZ9o+ko1M4DykWY89bu9NPXEpJcbwA8xh/vpj0uISV2HQKxk0PlsPowbQG0uXJM41Hsfdw0QaWcG367Qo7W1j1X+aE5+tWlGYT3/xCHhR3rzt85B3JCag/swr2Eq+ybEQAvP8mOQvF1cPftv6IHGH9hmq153//53EQhQOnxM0UvWZx2Qe+EcUvddhOL2BICouuhVm8dco8ObNR6Qkek6OL/X0TzpkxR8Jg4hLyzyQzm6G3kMd1uIB6xZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOPaoJuUaPfu6hGOWg+Xsn1PZm671AYbxECEAGO/3u0=;
 b=Hsl0DbwFPs1BBooH50av+Dk9v/p1zlMhgEUSdm3R/A65iKb83ljp9Ujf6OwMVmBo7g+17mOOAGbaUyRXe1bQE7VT2pEYM+1AxyiCZBSvuIa1NgWR/n0TYUejCm26O1ttYwSY+MscCP187xL+AocyB+tQRxZnYR+niIzYLpoaU2u1lgpktpyFOX5clfH3lG4MY2CksCMalchbooPv6iD6fEmlMwqoMFWJOBxHGLRnuOoHsaYmqTPiS+t2NnDuiY+UqLt/Q66m3zBzeffmeSXkqb1E/aTXchlHnhTE1bGzpG3NMwJHZDdK1/hK5xewK9LBL/ckZCGnm5ez5WxJqsG/zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOPaoJuUaPfu6hGOWg+Xsn1PZm671AYbxECEAGO/3u0=;
 b=Md4qnJN9MpXCDVTNRanW+84KuvTjnG3mbsLkzgdYgWhFeUNQj5xSU4e7TKxHwgZfBlyMIAJQpw4C5SsUOHumdd/1Sg40THtC2/wOFcydFWYF4xF/gaOx+T7cKOmRVl0jCtyXf1UnNT1uvyIq0w0FQJ/23pX1a/psCVb9tM/0LWc=
Received: from PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::6)
 by MN6PR10MB8093.namprd10.prod.outlook.com (2603:10b6:208:4f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 06:44:05 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::67) by PH5P220CA0008.outlook.office365.com
 (2603:10b6:510:34a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Mon,
 6 Apr 2026 06:44:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 6 Apr 2026 06:44:02 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 01:44:02 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 01:44:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Apr 2026 01:44:02 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6366i0nj255392;
	Mon, 6 Apr 2026 01:44:00 -0500
Message-ID: <94610ba0-a1d3-4996-879c-0c05e24ba489@ti.com>
Date: Mon, 6 Apr 2026 12:13:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arm allmodconfig
To: Andrew Morton <akpm@linux-foundation.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>
References: <20260405143513.268f59ae31ab905630d5fbc8@linux-foundation.org>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
CC: MTD Maling List <linux-mtd@lists.infradead.org>
In-Reply-To: <20260405143513.268f59ae31ab905630d5fbc8@linux-foundation.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|MN6PR10MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a129b8a-8f70-4d29-3ac1-08de93a7e421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0DLsr7H5/bnof9qBvP1lqARylCFrEquWQoEeDkvckD4xoTsyHcRHYsLaIkBPNaex3GhEXj42gHlk6rKVk2Agpe8Rz2Zy7BThqMjETcMhMhHHCEucAet7RQHyOW6gTSQIv6YU6AVJ++o9Zz/FSknFzd65X3kP7yiHgMpwtwpdg2A+s+8a+nG7ISF71NCejUAtfmUQ9sxsxy0hVAsmokOpC5FxFVP/96XIGhDoRjB7jJrUv6yxVYZgp1LIuHvb2SUZWrHbxsZj1mBh0sPYN4ScWmZ4Z1XHtesNj/wQrP9IDzto4Jm/9eJEACKadmWQVFy0/VJOZhrL5q8GNMrWavuJ4Y7WvK6KUaWZKU0FH1SL2/XcGYl0ECWd0+MbB7nIFaH34HNCZVly4JhRcyM2oDfAP0Fm6usOtQ5V28InwtBEmg2xuWHy17V3GYGjN7rDIIfdIQvT+OuXGbVaindYMRO5mMHKDKecOQHscbTq4KaQV3f54jZOWyV3WZslniI4zkAeBlijAcLNGYfwhwxep67s73+jsqM3flfkAvLztEpIIMqTTtdtsDAQ15hsnPF9sYmYKvGZ1EGVbFB+zdftAEmnATr4sAWFCy8zq9hcrWhx9/0qxrwEZNtbL+blOlvvBIP9JzkX/+XRtxc4rL3hdPvffpqed1NlRGYGs9G6mj0Bd9NXcIVNRT+kkM0Df25eFp6rnLzm3xqauhLXCpj/nuJ+u1Jb0gBVDN/uFLbJwjKFwwZzLfzUdCCLA2xaFy5Nvy/x3jvSiHhwUu4Kag2ab2r7Vw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +nEeMEUJeFsznMr9+FMl03YBbpSHg9NVzOUyn6h6gSiDZBDZbfM1LBhTEXmpcHGkJSq5QpZlPtOY7tCnnxw0FfQ9jr653xvC1NwzmfKQE3u/wWNm5w7Yc+Y7rZehRRXCJ8KogTymRgb35A3h2DW4ozv4Aa2+ii3q7qozrvPHm0unydPIca+HBYZRi/nBWJ/tSejhlVouKRh8WeNQ8EvbkwwjzV8BtiVpzpRI2XJLz0K4nd0LJ6W7jBDx2S3evCm/XtE/HvF9Re0JkiFEjlrl/61dW1JK7BSt9RPdyDvXRGB56op7atV1DXrTyw1/RgO9oiSrdfomfmwFcOzkntTtJ/3yYdl+YiQ/PVyydj6mWXeZDdycEvI3aeUhZ5mnI0WVYnSv4XQ+g4R19VEqUpa1Llgne5WlIRvB7gjDMYRU8rqzGR2xZvah9a3XDDvBcWSK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 06:44:02.8583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a129b8a-8f70-4d29-3ac1-08de93a7e421
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_234410_986847_198CB6A6 
X-CRM114-Status: UNSURE (   9.77  )
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

Hi Andrew,

+ linux-mtd, Andy

On 06/04/26 03:05, Andrew Morton wrote:
> 
> current mm.git, ARCH=arm, gcc-15.2.0
> 
> drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> drivers/mtd/chips/cfi_cmdset_0001.c:1883:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> 
> Am I doing something wrong (or unconventional) here?
> 

Thanks for the report. Adding Andy  who had attempted to fix this [1]

make allmodconfig ARCH=arm  actually sets CONFIG_FRAME_WARN=2048. But, I 
can see the warning when I change it to 1280 manually (bit strange as I 
expected 1280 to be default based on definition in lib/Kconfig.debug)

I am not seeing any recent code change to this file in at least 6 weeks 
(the changes are still minor code cleanup and nothing before that for 2 
years). I can only assume newer gcc is exposing something here?


Andy,

Wondering if you plan to work on your patches further, anytime soon?

[1] https://lore.kernel.org/linux-mtd/20260225162406.3815267-1-andriy.shevchenko@linux.intel.com/

> Thanks.

-- 
Regards
Vignesh
https://ti.com/opensource


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
