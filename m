Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EB2E83067
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Feb 2026 09:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yekVHjFO7LWKFT0b4SswkVnaFz0MabG4145aBaGDb+E=; b=2N95qiG6DpPhzZ
	bnbtCGaYxh9QWLRJ8H4Z03HL6PxdorIBhNl0dTDUduCKjNOfOygiYi9nrJVo4Gmwm9F3obgHbeW4q
	uLAxQWVhQe3ZtM361MgsrFiY8QON2N4J4SJG3YLy3UEAAhw+USouranwTF9iYooVJa9Xcgjv/mOF/
	FPMKbxgF6kY+xWUEssRy5Tf4oSDYNh9a4vqPooVfGdq0DYWfBAzFDisiGok6LkYBHO9lrKtzuyI1o
	s3tmmc8IbOX/He7FnRZbmCD0tV5nO1lQGi3hj1DwXhWFJ5zqvYdp3dLJfkOMc2+FsueNpBOvt6SqN
	3nrS7wwGacD09UNUwZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCSq-00000006MGc-1Baj;
	Tue, 03 Feb 2026 09:12:52 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnCSn-00000006MFf-25EN
	for linux-mtd@lists.infradead.org;
	Tue, 03 Feb 2026 09:12:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7DXWqEJBETV31ZJENBGKriRynfTrzwwDh81WSicbdhcDehe3M2YTVoAPe1j/n5UIbC2QMTIcxiQRxOhzF1PjTRGXzQiPK7agpvBFKfhyWlzWcCexEE6fnUYzfEhmYvqGuPO1tiQzD/NTplfeqAoaDJUVM07ZjkshvsJ7IOYm/Ic08thlmWgQd/GhYqdQI5x1FHnHI4DpwS6PxEXHlCqjTrg4mRCpEQOwYjQMwBA2bSuqMTSSlCQEEMWNClQD2vTjNrcfPQVgjuPRz83rl+mH2bNyQwy6OkK93Hm6CNj8+j2vNALWSxPLIEPabNJ00UagLpfC5gmM4UwFJE97ayoEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpzMF4ZCCsg7si7IOq1NaofnYi517pqrN+JAPZY5K80=;
 b=Q0yqQlQvTL214NRiOWILVjHpFGTcO9/W4enlS1kJmJVOzWdsA9bXEoGf78mERtKc7NJLZA1DsG40+Oh0rdFMmnKQhL00O/rxisBbFgUM37S8EoceQzicdmQkUJTTpWCbMlmSLHMDmPoPlQr/45QEeKio4EWvjHZET+qt84pIp5iu7ffsrwWvpG+K8FN9MuAT/7KKQWCAwXy1fT+FmslNe0zyggcfo6A5Y1O4P1Ajm094GBn6jSJ1CuH/PjWC/G8sVK4Irwtr2WsyVqAOlMIaBWGDqtIHmGmNi+J1Wh5le1nqmLyyt+xhfo327JQTVKlDmwoerBr1dlwE66wK2gt97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpzMF4ZCCsg7si7IOq1NaofnYi517pqrN+JAPZY5K80=;
 b=w5Ol8UE88vQj4cUzR3xnX1oguW4X9oCbwtc1wH4thEt88M032aDIzLN0UC9Ukew+/5ZLDjs1GARiVB8tOS41gZdCX5W5/hK2joXDLj+nxHS51J7XnX64aaugIh+/9IRkK02JuKDHpNp1upz8ea6E40tbR92ctt9+tWrZRmspppGR48+Zh48aZjnfeoNJJ4MBaZc8/CsG4qFPdogzuLVz9H2C5SguTxpU0geiugstPJ65+P3o9JRMGw8lA79CBpQoWmDNZP7hXTjC34x8YhJ8wacFAuYbrhxl1dH+0S0RBxwcDw5CuEqK5Ut+gIKERhEBEXZnDR9FBFpycLOQ3/o9jQ==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by PAXPR06MB8423.eurprd06.prod.outlook.com (2603:10a6:102:22e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 09:12:43 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 09:12:43 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: RE: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Topic: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Index: AdyRCkfQa4Zi0XkcSIOaDwEHvEKqQgAfkK0AANfexzA=
Date: Tue, 3 Feb 2026 09:12:42 +0000
Message-ID: <DB9PR06MB78490A50AB800FB36AEF5E74C29BA@DB9PR06MB7849.eurprd06.prod.outlook.com>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <356439c2-5289-57d2-52d4-8b436252a630@huawei.com>
In-Reply-To: <356439c2-5289-57d2-52d4-8b436252a630@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-processedbytemplafy: true
x-templafyemailsigvstoversion: 9.26.0.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|PAXPR06MB8423:EE_
x-ms-office365-filtering-correlation-id: 685c96ab-32da-4581-cba6-08de6304634f
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RktTa1drUTRxZTNQRkxMeEV1WDhlV1RvdFczM1ZoVmlLaU1YeGF0dzZ0OXdU?=
 =?utf-8?B?dHRpbytad2dRTGpRWi9yTFZNMnVJbFpMbHEweHovcFV0dDV4d2I1S0dIeXBn?=
 =?utf-8?B?NzVMT2tiL3FSb1hXdVVwS3hkb09YazNBdTNaYU0xSEJnKytuZ1oyRXd0WFZJ?=
 =?utf-8?B?eTdwc1M1aFhsT1RJS2hsWEdCYzErWWZMYmhCVGVXTk4zTVZJTFBhOEpTd2VC?=
 =?utf-8?B?OEF6UXRNWnJkMnZIYUwvRmFWZGE0dkJTS1V6bGJ2bTE4S1duUmlOcXR5ZnFS?=
 =?utf-8?B?UmtUSFNkYmJHQThmVGJiYXpGdEg4RlBxaStUR1k2NGJPVEREVXUzUUFHWHRE?=
 =?utf-8?B?Z0tDZGxBbytkdXI5Z3ltb0kwQWlrKy9XbUxRTUttd2g4Slp4M25KaVR1MXhP?=
 =?utf-8?B?Tyt3OE55MDUySHQyNXZHQ0ozbFc2YmxFZTBGemNheGRjVlNZZDJMR0kyMXVO?=
 =?utf-8?B?RTdJTy9lUTBHd2pOZ1A1ZlVIWG5zYWFHSEEvZ1ByNHZrR2NhbWxlUHNiTUV3?=
 =?utf-8?B?OG9DMGpndGMzVkwrWnhHdWtMRXR1U2xHUk56UTNRMlhhZXlxbVVwM0diTXp0?=
 =?utf-8?B?UUMwNjJpTEFIMTlyaEE2cVZRcnFadm1udE9NYytVWjJSK3gyZVFjMVgvZHJC?=
 =?utf-8?B?cnBHOTJwM2hRZXhncXc4TkJxaEFRUkM4ZmtKcnBOellmZHRKNENMUXNmR1NF?=
 =?utf-8?B?SXZPL1N6SDR6RXhlS3BsWTZic21YNm9CQmdZOUxRb29oSzYvR20yRHRaREE1?=
 =?utf-8?B?K3QwQ1ZGeUYvWGlMWSsvVUV5VTY1cVdjRzU3eTkyU2QxbjZESmhJSzhnY0FB?=
 =?utf-8?B?TkxGZE9EckpJajRHQXZwbTllK0FCS252NStMdlkraWpmV00wSTVQU3M4Z0Ev?=
 =?utf-8?B?dnlsQkxwVzNkWTFHbUh0UWRJQzR0SWZaVVVaQ2liYVdIUnhBL2lUNkdyZmtF?=
 =?utf-8?B?UkFwUnRheTdzOEtVWHRnWU5hSGtLaFBjMlBoWU8vcHl6RHZnWHY3UGtaUW5u?=
 =?utf-8?B?ZEc3cklpLzRSYTNTYmsvSHRaN0dOWmFSMjVEL3IrVDRnNmxBc2RvMzRBNHpJ?=
 =?utf-8?B?NDA4Q2JXc01CNHY1R0hSeDFpenArb0NRZElQblAwdUxQZnd4VDNTLy9nWGVD?=
 =?utf-8?B?TjB5YkdPaU40WFQzY0VGZFVPMnZHWXJwWFJlRlNOWkZIcU50Y0pCWkRqKy9I?=
 =?utf-8?B?R2s0Y2hyZ0JrbzRUajJuQjk4eFk2TGUzY2hScUFZcDg0aDNWeW5wdVphb0hy?=
 =?utf-8?B?a1RlR3hUUXNCM0J3dmdnMlJjN1FmQ21tSGVaN2NncDczbUlFOVRlRmNxS056?=
 =?utf-8?B?TUNjVUt4U1lLclA0NjJNc3l0aUdvQkNManFXaXhCSEs2TEtVc0NTcjJYbkdm?=
 =?utf-8?B?TVpnWXZLQnZLaklQUFN5TiswUXcwMU5ZL2l0WVhNU1oxUDROVDFTbDBEZTZt?=
 =?utf-8?B?NUQ5bXJUYUV4T0dXY3ZnZmFxQjIyT1M0cHI2dmNqQXlKUWZ1VnRKbGZrODcz?=
 =?utf-8?B?NWRFWEZ2WXZiSGhIdDZIVkc4MXNWMHJDOGxJcG5yUFZDWURDOXYwUXNXb0xs?=
 =?utf-8?B?MG1rdTVMOUR3bjRTbmpPcWRJR1ZNZ1FTbHNVZDRVdnp0MlZNNHliUVh6N1kz?=
 =?utf-8?B?R3BneEhqTXY1QzEwYmVLaWJIUCtabGZ5ME1FekN2VE93MXV5MEwzU2ZsMkdH?=
 =?utf-8?B?WEJCTFJhOEZOVkpodVY1ejRRTENzUTB4UmFka2lmWE9yaXkwVUh2N09FUTVt?=
 =?utf-8?B?MDVBMTlTU2NVeVBCVlBndEh0dmZyMTYySDNIVVRLeHNVMXJtWDAvUUZqTi83?=
 =?utf-8?B?RmVNaWRNVGRaVHU4QXZ3dTZneGdKY2xOY3A0SjJaVUJwRHFJN0VRNXVKNUVZ?=
 =?utf-8?B?WFl6Vkl2dEt6TmpLRnYvdnREYVNOODRpUU9zcXYyeXlYcjJvdldUT1Rud1ly?=
 =?utf-8?B?dDQwNXAxMXdFa2RtMFF4a0JvVFNYeXdFay9KeGwxcHgyVmM1eTFaMm10M09H?=
 =?utf-8?B?YUxIMGVxZm0vVHViMDhEZTlSL1lKTzVQSUIxZWVVM3ZtbUZpeDJaQ2NpbTBi?=
 =?utf-8?B?ZXFMZENIZkdXOS90cEVLUkZpTjNqQWhlVTJVby9HNDhvKzBKWDNBUmFkN1Zt?=
 =?utf-8?B?QkhFN292RG5jelpQQjdNeUFRUkMrMmZhN3RSYjJDMEhlUjVtdC8zZDBNOFFl?=
 =?utf-8?Q?54tI13Xv+bmJSyGeGq1ISFg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjFGZmp0cXJRZG1rbGpTZjNYZnorVDJVeDNPcWFrVGxuYkR3dDhKT2h2Umd1?=
 =?utf-8?B?aTNLK1M4OUQxVG11czdhaDZiVll2UG1DRnNCRFVvZTZ1UHNkVXdVemsvbjNH?=
 =?utf-8?B?ZVR2ZXZOSHdVdXNiNGNnZjBQRzlaUTd5Q1psa3FURWI3OXBxR0tQUGE5NVFD?=
 =?utf-8?B?ZFBHd01MQkVMTkFpNkxZamRzcVMyYkFycFZ6OEtjUGxDU2ExWVBKdThJOWtr?=
 =?utf-8?B?Nnc4aERBaEcxbUVZUExOS1NMb3hyR01mbWg2a2h1NFNramdMWisvQVIzRU96?=
 =?utf-8?B?YlUrUGl2RTRZRzluU2dBL3ZvTG4vQURhdDc1b0hOSUw2Mk1WWWVFRmZiV1BN?=
 =?utf-8?B?dDBIWlB0OXpjVmgwY3oxQkc1Y2R4eGVERi9XOFpKcWxRUjkwOVEybUJpb05m?=
 =?utf-8?B?VjNOKzlybkRBcUw3RzVVbFBuZWJoZEhsOTVIR2hPVlpFNWJKbFdZd3ZrNmND?=
 =?utf-8?B?d1BCc0JsZWFtdjBOUVlzREkvTFJsZUxwaHlmK0NDY1Rld3pWbHREZEVjWUFC?=
 =?utf-8?B?R2hYYk0wSDlHK00vbitIcXJyREtMOHdWMHlpUG5TbTlPWWJlWTdkbXpVV0Iz?=
 =?utf-8?B?Vjdwbjh4T2hKZXIvQ3NhbzBYR2R1dTZkZmlaNGdSa0Z6ekFDL3ludUtsR2Z5?=
 =?utf-8?B?a2dIelRMWXRIMUNsVWN0Yk5GUkFLYkMvMi8wVjNUZENsQkVnWlhSY0ZvdVVJ?=
 =?utf-8?B?Q0YwNjFuSy9SSHZhNHVsdXpTRzhZZFBjbmtmKzBtMzZjeHZnQlRXdDJ3MzB5?=
 =?utf-8?B?MStiS1ViSmZjSHpndjZBM2FMMVRkWFhvaTVadndxL2gwS2tiLzBHdUtXNTY2?=
 =?utf-8?B?aEJRNnpKcURuMkVMNUs5MmtlYVNqTUdzMWg2cWdKS05uRytMaDh1dzZ6UEow?=
 =?utf-8?B?bkpIeC9sRTdLK0o4RDducWY2ZFdWYUV2L1FVMEJUUWZaRHVYd1lKa0pJRGJE?=
 =?utf-8?B?eTlzaFo3eGxMYmdHN01nNmk3ZHZoTmpYUi84M2txY2FHNHZUVHA0d2FmWkI0?=
 =?utf-8?B?RUpSbFBXSURZUE1UTlU0c3djdTNIN1J0RHZwR0N2cWNoSU5XYTk3bytWK0NK?=
 =?utf-8?B?T2hJUmlNSFlFWGxJMi9EWGVwWWluTndoRlVSSGFQSTRBbVp3clFsUTBwdHNT?=
 =?utf-8?B?c08wNXJXMDFnVHFxb3pJRlBQYSs2QTd6TGZOSm90KzVONm9WQkRzclRsRG9D?=
 =?utf-8?B?c3JQR0d3dG1qM014OXVNMEl2dW5VK3hYNU50ZWFneXdxUWEyOVV1YVlLR21n?=
 =?utf-8?B?MjNQSU9yVDBGUWZleS9mMDR5aTRzRHhvekJDWWNpbmU4RE1sMlZML3c5ZFlI?=
 =?utf-8?B?WDdMMnFmMjcvUkx2MXFFcjdtb1Z5YlJISXBHNkdIaUZQUjNoWml6dW1rZVJR?=
 =?utf-8?B?RERtQVJZY0J6QTAvU0FJOURBcG1rVzVqS0hpZDJzbXRQVXpDVWw3NGxUeHRI?=
 =?utf-8?B?ZytwSXViei9uSGVQbnlwd0lEeVJFb3RoV00xYmtsUHhQWURVOXltMjNicVM4?=
 =?utf-8?B?bzlGQWhEdFVyZmxKQkh0ZW5jNzZweFJGNEJETVFKbCtxYWhZRUpXTVVDUVZD?=
 =?utf-8?B?K1BHTXBxVmZrL2dMM1o4ZGM3RXlHWk91RDFnUklFejNNVmxuYVdwRlAwYmRX?=
 =?utf-8?B?MFNra0x6YStlekhpb2s2Sjc5anhUOGxNUkhlYXREV2ZnSVdVTzUrL0Z3YlBK?=
 =?utf-8?B?WldOdDBKTTlnVm1qK1ZmcXd6NE9CcytPWlJsNGhOUHpDSkZBT0JCdU9ILzRp?=
 =?utf-8?B?aVNTWUF4SWxoNHYzc0tvSitNSGlPS2dDdjlCWCs2OWVsTEVDS3NvV1BueDky?=
 =?utf-8?B?MzE5a015KzI0TWZRcFNEWkQxUmpRaGtRbXA2OGloeUIvODM0QktObmZRZWcv?=
 =?utf-8?B?S0tyckZUT3o2cXE4SUplL0pZV3gxbHVNL3hLQW43T1dWWlpvOEdDZGxCakRp?=
 =?utf-8?B?bVlGY0JDZEZ5YkVITjZQeTFjZmVKaEFRNHE1SEYrVTdtMytVYjk1Rm02UDYv?=
 =?utf-8?B?NlhUcUZRRGE0N0h0NVdTZFdqM1ZWUG5Qc0dSOC93SXFZdEQ1ZnRPT0tGWmwr?=
 =?utf-8?B?RkZBL21XRlRpYndWT3lSdVFIdktnanZuSStDOUU0eTB4cERvZmhKOHQ5WWtO?=
 =?utf-8?B?di95NEM2NVR6NzFwSkRQbmxCdUhGZVBGRFpYMDY1VGIrSmtXRDlTdHpMMm53?=
 =?utf-8?B?WU9zSGgvVzFYYklGb0JRd1JzWUxPQzhLdjZGYU1SYmgzVFo4c2NIdjN4NmF4?=
 =?utf-8?B?NDNjVkR6bmozcFpwNFcyKzllRHNTSFllUE9NT3Q3S2ZsUTVRNnkyMEw4VjlX?=
 =?utf-8?B?OC9jWEVEN3lrVHpTOGZ5eUswb3dRL0R4czhtWlU4bWVwTy9FZE5SbGs3d0Uy?=
 =?utf-8?Q?gyIvmCX+LPGOMX2Cz1kdDirsekURfvlEDFZ1m?=
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7849.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685c96ab-32da-4581-cba6-08de6304634f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 09:12:42.9843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fMPBGMg5L6tiPaq8DCs9BS47KHnyDSKP1XhVj1/xJl5xEZ0H9eBH5YCYdzEXh7BSUyRhCj7geiwGDefW23Qxkaw6GGjOwqwOHTk7bzQddNffnqMv77AOEejxaSKf6NG6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8423
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_011249_551023_FFCD0E0C 
X-CRM114-Status: GOOD (  14.65  )
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

>Hi,
>What is the type of volume ubi1:0, ro or rw?

root@kmcent2:~# ubinfo -d 1 -N cfg
Volume ID:   0 (on ubi1)
Type:        dynamic
Alignment:   1
Size:        1058 LEBs (134340608 bytes, 128.1 MiB)
State:       OK
Name:        cfg
Character device major/minor: 246:1

>You could dump the mtd image for 'ubi1' by the command 'dd if=/dev/mtd10
>of=mtd_image bs=1M', and send the file 'mtd_image' to us by email, maybe
>we could get more information from the image.

I started some consultation with the cybersecurity department. Unfortunately,
the nand image contains our full application software and third parties'
proprietary software so it might not be possible.

Are there any analysis tools you'd recommend looking into?

>BTW, are there any abnormal history logs about ubi1 before the error message?

Not really, in the application where the error happens, with kernel 6.12,
everything looks good until the panic happens.

We also have "known-good stable application" that boots when no other
application exists (here I refer to kernel + rootfs as application), which
runs kernel 4.14.20 and there I see this (before 6.12.x has ever ran on the
board):

UBIFS: parse sync
UBIFS (ubi1:0): background thread "ubifs_bgt1_0" started, PID 106
UBIFS (ubi1:0): recovery needed
UBIFS (ubi1:0): recovery completed
UBIFS (ubi1:0): UBIFS: mounted UBI device 1, volume 0, name "cfg"
UBIFS (ubi1:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes:
2048 bytes/2048 bytes
UBIFS (ubi1:0): FS size: 132943872 bytes (126 MiB, 1047 LEBs), journal size
6602752 bytes (6 MiB, 52 LEBs)
UBIFS (ubi1:0): reserved for root: 4952683 bytes (4836 KiB)
UBIFS (ubi1:0): media format: w5/r0 (latest is w5/r0), UUID
DC7EC969-1F4D-4669-9D31-16C57EAB96DA, small LPT model

The part where it says recovery needed/completed looks strange but it does not
complain about any errors anyway.

>Try following commands?
>nanddump -n -o -f flash_image /dev/mtdX
>nandwrite -o -n /dev/mtdY flash_image

This results in a flooding of ECC errors like this one:
ubi1 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB
29:0, read 64 bytes

I have to erase the nand from u-boot to recover it.
NAND chips on both boards are the same, from boot logs:
nand: device found, Manufacturer ID: 0x01, Chip ID: 0xac
nand: AMD/Spansion S34MS04G2
nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 128
Bad block table found at page 262080, version 0x01
Bad block table found at page 262016, version 0x01

Best regards,
Tomas Alvarez Vanoli
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
