Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD74C4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Subject:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IzIe5BAx2C8i5xuPZywgsGkh1UIBU+hT9s1oyN18Tn0=; b=MWXVY1Wgy8502a
	0OSfDlB+8mvfs45Ofj8+FEc3t9fKe9wIiaaDTk+rnRlclCFUxGVzSUd3R++7ycOWWn0/buHkcPtnj
	S2kQGJFpL46EYAwNXH6KrItNNVBL6j9vRIIakU96hqks3PjTS2spvMRNJgmLth+k2xiC7iJWyixHB
	v26o7wGPocPiwYZ99SEgd48YPITdkxaokpjjZ/OwmnDx33D+ujWxoygAIIw4MvxlpyOgRDLDyyAsv
	Mrb9O6/ptECsph8J10ZIsEFfI9eSVF2PcCTV8gmVryHXv/tsPdzEyR7ASixnWwCsBKNb75m+JbT6g
	GKswms1UZcnwwUkra/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Fui-007SpZ-0q;
	Wed, 29 Nov 2023 08:27:20 +0000
Received: from mail-tycjpn01on20700.outbound.protection.outlook.com ([2a01:111:f403:2019::700] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Fuf-007SoW-2G
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 08:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOmb/xfbhNl7ezMaNHZWeiH4f94AflVeODDm1gjsiKbN97NCwlZOFBckaMYqcmuSKKGGRP7StOX5fL5R+u+iY/v6A50p3og74YCtlOrCjQnGEAOoIsPma6zGJlKRTPebqbDzWl8wglfIkUHWbjfgydmfMZSdORPRLNcK6BGq5TujE+R6702aYrPi5zYA2ea+nLAjQeX1vG/QPZh9uYZMGjSOXU3hAU6WYq+46GISNDVbJD/FrIGhgouQsUT44mCHe91F9nxDoUFla54mrEkO+jfNNAiCfk637Mj2rfLxV67iW38XgvGRUm0LLEbI2pkAzZL/vR9oifIWDTyZ/e/oPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O16o+YjqhUr6OrBpnlYbSV+AOkZWeg9fDhJPS/vR+OU=;
 b=ELS2a1AGliOQ6VA7mWmZSihgL0JG4a6A7sgI5V27mGyKwpFI/s9Ts4FHQxhHUJt1PxOKrB9BHn8Nfv4immOYGAwvohOwjq8K0T7+YkjTS5E1p43bjDh9wnLOHCj6jN3T6IWLRhLfTpXqoyPMalfFKciGK4LlOTdQEEEOz0M4pk7uPjnggWRwGtrKwj1Ir7lFvmrJu/Wd+VzgGmVXcBhlCYyK+w34Kn28MFhEdFFi6HM3u4PA56ato+PhJxmsP12uiSjh2z41PaRiA6Igh/JNGAbP7JgP9OyLeqP6dNhM1HtwFDn5LCchPBu7MSJNiUz+IzZhs4bj/Ako+uAPBvxa2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineo.co.jp;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O16o+YjqhUr6OrBpnlYbSV+AOkZWeg9fDhJPS/vR+OU=;
 b=hrD926ENEsxKQrJZCbEwiAelUeXQ4YtI2VjNXHQvn9AuK8VIsU6nPQJZgcwCbsuusaTjeaaOvF9xHDkzRhLcZkZ4ZhVj25sXAOZA7k47W/bIqYgHCC5wnI/eJuLZ05zPIJwPGmfhDDpK49lhddAh2VrDE5aVwh892L1MlDiFUTjtt2il987foxAPWXMFxi4qU7lOIwe8uUXk5r+oIXrMHbGPbX0lJlvr78fnypmgBqxpSU8q9VV9bir8UkWMslEMfAHdldvdmgVcvMARPI4dPo0d8QUGw+BRxxfW4zw2PNj3lBvQxhiCmQODQ77LpUuOUOFWHdUw3vi4dKpMsomkMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from OS3PR01MB8115.jpnprd01.prod.outlook.com (2603:1096:604:171::9)
 by TY3PR01MB11722.jpnprd01.prod.outlook.com (2603:1096:400:3dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Wed, 29 Nov
 2023 08:27:01 +0000
Received: from OS3PR01MB8115.jpnprd01.prod.outlook.com
 ([fe80::9538:79a:d7:b2a8]) by OS3PR01MB8115.jpnprd01.prod.outlook.com
 ([fe80::9538:79a:d7:b2a8%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 08:27:01 +0000
Message-ID: <70a28293-82db-41d3-871d-2624f1705c63@lineo.co.jp>
Date: Wed, 29 Nov 2023 17:26:59 +0900
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Yuta Hayama <hayama@lineo.co.jp>
Subject: [PATCH 4.19] mtd: rawnand: brcmnand: Fix ecc chunk calculation for
 erased page bitfips
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Cc: Claire Lin <claire.lin@broadcom.com>, Ray Jui <ray.jui@broadcom.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Yuta Hayama <hayama@lineo.co.jp>
X-ClientProxiedBy: TYCP286CA0190.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::10) To OS3PR01MB8115.jpnprd01.prod.outlook.com
 (2603:1096:604:171::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8115:EE_|TY3PR01MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb548ee-186a-409b-add8-08dbf0b4f58f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zd7rfGhKi3FAolhRLRTxxNt9ue2hx0optqBJTLj/ZVYolGPW7JwG6r8c9IOAJKuZ1uOVxqh0jZliqfNCpvOsC9d5WaL4aZm9JRxGY8YPBSiIMwlvjaBNupsN5vZ0A+3Oe43bwHbvO483NnX2qn7lT99BO9OGC0M+sBM3E9IfdZUTY4Q7UUVTOX75+9Zz1u9mR4L6uLVoGjgUKXL358ZNPWHGZsFCXi7aMM7ShXpLAfNYWLCAThB3ANt7ge1/lAL67yaEPXIaqKOzbXaV1O9OYiZTw7b0F8PMreG9IwZPAsRxoBJpHOJx10XGuF1x1BIsYDw2zDgKtNWtOWHASB24NjJ+U1nbqXkXvDBgzt4JSzTMdk9MFY0vC116V9WDIkNuIpxp4t5oqYmfPEt0dGsj1KzOM3Xp/L8kMRiSKvESUnQ3bcOJYipBdMbCloxwbL6euA7hgNBHLXT0B4KGvL9i9PaXXV+C278ezt4hX3aKi2c6bfi+EpBM2G4h1n2zhiwiAHVq+VQo6cRUmTayOTu0RY3zpP6EPc65UanVm7qtrdNhTvTjxJrxLSLxVNrAUjNZSxSvfCJN6i7qf0Oky4gSpFJQ7f2qpnK8KgqS7d2Rn9UeigjiWLKxhQ8pFQr3t3OdFAEA1MltcJY6wGDfdhL+Fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8115.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(376002)(136003)(39840400004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(31686004)(478600001)(26005)(2616005)(6506007)(6512007)(38100700002)(31696002)(36756003)(66556008)(83380400001)(2906002)(4326008)(54906003)(41300700001)(86362001)(5660300002)(107886003)(110136005)(8676002)(316002)(66946007)(66476007)(6486002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWR3U1RqM1gxMkdRMkM5cGxNay8wWkYyUHBjSTNrT0tYWUVMVFdMNlBJWkpP?=
 =?utf-8?B?ZVhxenVuaVFEVGFGUG52RkRBNDZHaUNjOEsrNjhrWjNnUXhxU2x6UXFPSG9w?=
 =?utf-8?B?OWdMMGViM0V3ZWFtNmluSUh5S1BWVGdKOC83T3hMT1lzdEJxUkdLZkVTUm1a?=
 =?utf-8?B?dUFGKzBZV3hBSURNcG9WMlZTWTh5UUtDUzdpQlZlNGdSQVRkU2x1RnVkUkdQ?=
 =?utf-8?B?aHlDcG9qVWpyRWJWZWdqK0U0WnF0dk40aHBFS3lSdzNFVEFsdDNTc0RQSEYw?=
 =?utf-8?B?Uy9FYjVWNFBkRkUrMThYdi9ibGlwdTkvNDQwcjI3Zkx4cTF0cmE2cXlHVnhm?=
 =?utf-8?B?bzhCU2VRTHBIa0hyWmZhWHBsaGlVTTlkZXBoREFTaWpnSTIzTHlUVERYL3h5?=
 =?utf-8?B?bVRYNFZIanpuUElQc1RKMXFBUzdxU3pIQ255UnNCcHRXZHRieVNXc0ljaC9O?=
 =?utf-8?B?T3M5N1RZSWxJWlNJb3JvSER2Y1pUVUxOYVYzQ3NtRE9iam9zRGVGa0NvKy9k?=
 =?utf-8?B?M2JIY1VUcDd3dnhpK01NWmFBYlhzazg1WDVDSXBraFNaVTEwYlYxZldlSHNW?=
 =?utf-8?B?NlBWUXZ0V28xU0h0RzcvWU1WZUJhNFBDakFVOEx6Y0E2THYzbm1VQWFZS3lM?=
 =?utf-8?B?TkR0RXhhR2hzUXNxanpEbTYveGVHSXllSC80UE1tTVRwWDhrZ3FYeWdmNTBi?=
 =?utf-8?B?VkQ4Ry91b1FlVk5SbHlHeUJsOEFGVEtIeXFyMkczbzlrSXI4RVRaOWpQTGZK?=
 =?utf-8?B?NzJRbTVCR1lDa0QvN2d2RW5MK3A4Rm4wQlpCbHphUlhhOG0yOGI4d1FlZmNo?=
 =?utf-8?B?QkY5WFJBNGNXSmVyN25YTzFISXZadm9oSlI4eHQ2L3p3KzBoWUN0ZE42NEJo?=
 =?utf-8?B?blF0Q1Q0bGRoejJJS3B4SmRFMUxJTVE0S1dyS00yYTBZZUQ5SVNiVStEQzgy?=
 =?utf-8?B?OXZSUVFvMzNtYS8zaUxINzBYU1J2REl6eVBlOTZaSVVpM1JKZEV1UmhWcDMx?=
 =?utf-8?B?NHZxbVFwV1hTUWxhaW96ME1IbE1KUzlZU09SSm5PVUdZbFBXUGdyejVOdEp5?=
 =?utf-8?B?K1d5SmJicjdPTDFhRzY0WHlRZThoMGJZeFBYdFZRaHpGQ2tBcndkbndpQWRN?=
 =?utf-8?B?TjBUVklzN3pOeHN3Y0dVTTY3QmJPUDV6L1lxeGxySmVmSit0RjVDOXlSSkx1?=
 =?utf-8?B?ZW9HQVYzb3YxWEw1dk9sb2E2NmRDNGl3TXlHUExlTWV3blZORHhqeUZSeWFN?=
 =?utf-8?B?Y0tmZDhUbzg2MG1xN2JJTGZ4V3BsRXlKNjc0WWdBSmNuZXdTbEpOSVRFcWZL?=
 =?utf-8?B?L3p3Rm04bnR1TUJHa2ZrcVJvZUJsRGhoR2xPaDdLcGRNd1YvSVNpbjlVNzk1?=
 =?utf-8?B?NVA4b1QxZUtYTk8wT1gwV2ZGaDMxOWthZ3RvdmQ1Zk51d3V4eUwzb093bCsz?=
 =?utf-8?B?YVZRa2ZFazhIRDE4VmdSWlBzUmVONkZ0NzVYVkx6SjRRVWFOSk1rNW9VT1Fu?=
 =?utf-8?B?MDdjY3VxRjhqMnppS2VEOE0wemVNOUl3elhiV1FWZk96Y3pDQkVUZk5mU09n?=
 =?utf-8?B?aCt6MGMwbGFNQkNDNHVLN1REMkIxeGlITmtoZlp3TTExeE9BOTVVWCtrcDFk?=
 =?utf-8?B?NFBXY3pvdGUxeXV0R0tJM3c1TUVNSjFqYVE0czg2M0owalliK29nTXhrQ1hZ?=
 =?utf-8?B?YUZKdGVCU284STFqczg5TFQyT0FBZjRvMGhMR2JHWG9Gd0hvZjliWjlWcGFR?=
 =?utf-8?B?dWRDODVLbjZlQncwWGM2blpJdDBkM3YyN1hTdllCZ3FMeVU1WmgxK09oajgv?=
 =?utf-8?B?RWo1SmhEZVFJTFYzZUJ2WmplbHo5bmNKaWRRaFVNZy92Qnk4dnp1RDMyVVJz?=
 =?utf-8?B?cExXb3FDVDRwOWlKWXNUNzRkTkVZcTVrc05Oa2hlWTgyeGoyeWppR0xhdjlX?=
 =?utf-8?B?WWRPaDZvZ1VSNWNCd3dMTDFsRkxqQVZzMHZxYS8rVzhuWUl0TEtSWE1nRXEx?=
 =?utf-8?B?QXlNVnBaYllrQmVyL1dQc2gyZlVZVTVXRTFEcTNXaWp0STNmZWliV0pKUHFO?=
 =?utf-8?B?Rnp5cEU2WmhOOElEMGZzSzA4UFZlTktkQVlzQnZFTjJHcW1QcVAvcWI0QmJG?=
 =?utf-8?Q?6rDWPCA+tnn/9K/U0dUyvFpa5?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb548ee-186a-409b-add8-08dbf0b4f58f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8115.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 08:27:01.1866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBUdyVsYd6iFYQ940tUV4lOFHQ3j8vxSP84Yx+DEb1brtvYDcS7JSO56iELd8fLeJNYQRpzKoWcuO8QCmmeG0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11722
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_002717_960051_D4724904 
X-CRM114-Status: GOOD (  14.02  )
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

From: Claire Lin <claire.lin@broadcom.com>

commit 7f852cc1579297fd763789f8cd370639d0c654b6 upstream.

In brcmstb_nand_verify_erased_page(), the ECC chunk pointer calculation
while correcting erased page bitflips is wrong, fix it.

Fixes: 02b88eea9f9c ("mtd: brcmnand: Add check for erased page bitflips")
Signed-off-by: Claire Lin <claire.lin@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
---
After applying e44b9a9c1357 ("mtd: nand: brcmnand: Zero bitflip is not an
error"), the return value 0 of brcmstb_nand_verify_erased_page() is
*correctly* interpreted as "no bit flips, no errors". However, that
function still has the issue that it may incorrectly return 0 for a page
that contains bitflips. Without this patch, the data buffer of the erased
page could be passed to a upper layer (e.g. UBIFS) without bitflips being
detected and corrected.

In active stable, 4.14.y and 4.19.y seem to have a same issue.

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 0e14892ff926..dc7650ae0464 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1753,6 +1753,7 @@ static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
 	int bitflips = 0;
 	int page = addr >> chip->page_shift;
 	int ret;
+	void *ecc_chunk;
 
 	if (!buf) {
 		buf = chip->data_buf;
@@ -1768,7 +1769,9 @@ static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
 		return ret;
 
 	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
-		ret = nand_check_erased_ecc_chunk(buf, chip->ecc.size,
+		ecc_chunk = buf + chip->ecc.size * i;
+		ret = nand_check_erased_ecc_chunk(ecc_chunk,
+						  chip->ecc.size,
 						  oob, sas, NULL, 0,
 						  chip->ecc.strength);
 		if (ret < 0)
-- 
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
