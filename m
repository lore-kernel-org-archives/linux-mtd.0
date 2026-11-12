Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920F6606A335
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LcL3YvTM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=egNi3uiQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=lv+dFXAn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b7A5ndhl+MTs6KIgM4j9Gt4fSy4hXxzTNwtx3ExyLS4=; b=LcL3YvTMBaNRFeBdOSObxzDAAt
	Gna5JKYu7vLn9B76+9B0REAJDf2Z5IOvzeak+4RSUYMr976eep8MICU1IORa76gIeTd8J5jVOfM9A
	stubf4rl2/hrdT077jIm6apsD4GliJB6Bd/nw4kTscxhkE3itAGdiaxwXlat5BNSHOTmQmby+3zzC
	lyA4xcD/MHvACSjfZp4G+e+Sm0r4wsQUJ71DXqV2HJVskLAGcmxgbV7CYqa+vrfDTn7TXIwghFBx3
	admWWb9dDuuhPXHU9z91dd8akWPpzxdeAhETHr03jgQbfvnLNtWybDmZ7eXIGKlKBVwrewKGazSH7
	e5ra7YGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR6p-00000009NOl-2tsl;
	Thu, 12 Nov 2026 09:28:43 +0000
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR6m-00000009NN0-0pBf
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 09:28:42 +0000
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC73gg21449311;
	Thu, 12 Nov 2026 04:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=u0E7+FiUvfpHNMxHaARxFrJyPKhM2Z2KQHlziKL8viY=; b=egNi3ui
	Q2sYKF1xhZqphgST7jXYchmAhIl6w513W5Bthptm6MupKkXnG73HYPXcq+bWvnuP
	hVY7IZApal+9Imod9Vy1dKNB8kir++9rXQd4lrTLFvCXU09KQmb1wVMuijqr+V3u
	8pHWUX6cTHSqiVj086EHzknswg1Jg3ehP/zRG3BkwPn7bfA2fkDkeb3YCqkkFvin
	Z1x8AdCM2qf+UR2XFoAyIZU0+8I9QWzwBUiWmi1IS2Whf+eIeB+X0//c09wC/TAC
	3nLrQE0g1ZIWTC5Jdp4oCLkSsbQruJql6Vv3EMgB4yzNI5GSCzrGLB+wxhBQVoll
	hX2uxyssQQXLJjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=u0E7+
	FiUvfpHNMxHaARxFrJyPKhM2Z2KQHlziKL8viY=; b=lv+dFXAn72iDqWAuGJrcl
	b88CMQdnaz3Wv4B1+xJEOrQRY40CdO9t0b8j8Ma5z67FLyF87ccwu5pDSJuJYIf4
	PGTOCzLc2/qO+t0pWWChJBlnUacTyKDkfgiTCvh7C0IHarMdrlXsBHDhIPiR1pZQ
	aFLFfVQHbN+3AneHoCbCGsHdoIicTLgnlo/tPusbSsa0G+mBTIcOFqepZv2miwmq
	VQtKEcP8aut4GAlcZ1cZawkRtULbUg4SmJnMIIEF23i4CugbUd5csrFx53dIrHnZ
	Pn0BL0/fWneZOjOL4abbnkkaqlB6mxo2ydOBrqCOWs1/02VeWjsKS6veDm7mMGu7
	g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010001.outbound.protection.outlook.com [52.101.46.1])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hw5771ms1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Nov 2026 04:28:32 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARSlvHmJDgpW31kwNNWmWkElaeTw26okI87LM4obS+fITdQdCytgNLBtRUcmJpSVCJqJ3NW9eZwG5g0BbQnvHvA8ZAjsEu+QhvkQHHBSjioJNTLBj0Mrh7dX1aam3qIiEuiTfqodmhr5+sDMh4txUXsGutdhHnYX6BNLp/4HAjEbhrCc8TnoT9QF2qRBliibQjqYzyZAlDDsEHz3spocjd/iSd6Xf8XK95IBCqdAGMn2oO5/mNFlpFcnS5DH4HQ+ulK0eDpsnD6XtBc5tydmoPaSL6MV+vWg4zgUcO4hwRsOJ9fsoa33AJ0VuqL/Q5q7R9MZ1HV6VKErEcUSQz9QdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0E7+FiUvfpHNMxHaARxFrJyPKhM2Z2KQHlziKL8viY=;
 b=FB2vJjBESFzlWjTpWhoiCGDa3JDIzB0syT3WjB1aj3H9Me6yZUrQlUBXZN2lHvpy5sO7E9zg6Sk75f95ll+woqg+5CSvStpsuAJk7sV/IxQPIazi09UHIhldR0KIqXPumvOqsneYDpfq6+uXQzaq1Vfvhbtt1KY7RZ5tk3i3PaViouYiiMoX0mgaBI22YF0on1naOsaF/Ukf+e/nqaAiJHPMRhjvU3nOKOSfDB1UXcqaG1wQEMzjwYIAtYfsE6ZfDBm5Lupj2JwVh2TWEGNiu+9vifybGUsMOI2ecXSISVU2Eog4yycEC1uXM27VXcrUVmZrvTttD0FswS773/TCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from DS7PR03MB5464.namprd03.prod.outlook.com (2603:10b6:5:2cf::12)
 by CH5PR03MB7910.namprd03.prod.outlook.com (2603:10b6:610:212::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Thu, 12 Nov
 2026 09:28:29 +0000
Received: from DS7PR03MB5464.namprd03.prod.outlook.com
 ([fe80::61a6:72a5:5a14:4e4e]) by DS7PR03MB5464.namprd03.prod.outlook.com
 ([fe80::61a6:72a5:5a14:4e4e%5]) with mapi id 15.21.0592.012; Thu, 12 Nov 2026
 09:28:29 +0000
Date: Thu, 12 Nov 2026 09:29:43 +0000
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Takahiro.Kuwano@infineon.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH v4] mtd: spi-nor: micron-st: Add support for is25wx01g
Message-ID: <avWFGvcOQEkKv3wA@nsa>
References: <20261106-mtd-spi-nor-new-issi-chip-v4-1-7e2b6a361fe0@analog.com>
 <f3510faf94ae4f878a96d4382dfd3d35@infineon.com>
Content-Disposition: inline
In-Reply-To: <f3510faf94ae4f878a96d4382dfd3d35@infineon.com>
X-ClientProxiedBy: PAZP264CA0032.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:122::19) To DS7PR03MB5464.namprd03.prod.outlook.com
 (2603:10b6:5:2cf::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5464:EE_|CH5PR03MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de17abb-4d99-422b-9fe6-08df409f4f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003|261102123227099003|261009223027099003|261026121527099003|261022075727099003|261021121427099003|5023799004;
X-Microsoft-Antispam-Message-Info: tG2sY5+OFMgT5lrQV/VGqTj0CK2uJoG+t37HyetKVYuJUH430R9mV8iz8mWCgH55aZE58s5rMnuvTlFNDDljpKLsgKEl+wncH5wLF6c2vQEvfbLI2gmcLWppRrkCH32+hqCBh2PRqFSwF49CrVwH9Ikz9FHB7OzgC0dNqqv9Qhk2upCI6jc2dCIdS6VxFxRjetYHNUJvGCBZNjBdPDrzr+zGUBqSFYqDMhIQdiILlgGzJaMU/q0Nd5DOMlOvGvWuZVQRVMrer0fEq3RnINgcA9xxhR8n40mtUqHuTv+Sr2Kz3IEhskUVV6En8u6nI5fRctlpkurvNdCOW3d4Cub7Et/1ilZVNB9MfAfXPjYT5eTBVPnaPvM78ZAbzE3LWEfMtmEuQ2ejFQdvGwWtiaexmMr+S5rVQHmW4iR1SYb5HJnuDMUf+zDfTipfnHZTaMT19cDiXksj/JNa2OE0NuSTh8Av6FJ8kaVaeaxMqz3tBYysd3AoB+0HE2qBQ5oPC0AO7YF55jRPAZWOriQg0334jD3v3T0AmYV0tGlbm09towxGpcGfrNC/a7KcVof0StgNUYgQ9gDVvsdIs+LPjEuyrYFM0912jH4lgqsfAlc635Or8hgQvPgmsGN1wWLJVHEJLojoCAKmCIT0ZylQzI33ut5M01RmmDQk9IYCtM98tgM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5464.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003)(261102123227099003)(261009223027099003)(261026121527099003)(261022075727099003)(261021121427099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkU4Yk9qTHdGaUo5MlRQa1huRWk5M1NBMnVidlphQXhuOHdnMnlMTHlLWnd3?=
 =?utf-8?B?UTU5R0Q3UmFpRU13RXJwMFZyZ1AwS1NCVkpGL0ZEd3lTcFdkWlZlRjI5VXFv?=
 =?utf-8?B?Mk5GbWh6a2xXM2NBdFhUWTV5c2I5aW5aZ0ZWdHUycTRVOS9DTnBaV2h2bVRX?=
 =?utf-8?B?ZC9BVmZKQmNPbXFoNmZWdVRkc3hPRW1uNzB3enA5KzQ2RXkzYlFPTXRjT04w?=
 =?utf-8?B?RDc0ZEpGV1ZpR3htSExVb2ZuY3V6ZWZJU2pzdVVzeW40M2pLblN0TTV4aWNx?=
 =?utf-8?B?bUtzUHJOaFdxSGhCSFlhazNiUnk1YTdPaUs4YjRjQTNEOFgwTkpRRHdwY0ZQ?=
 =?utf-8?B?cmhyMENBcmx3UWlLRDNFdmJVRFJpeWdQM0QwNmZ0cEZyMHpxeGMzd1JGemN5?=
 =?utf-8?B?cE82WVBzU2txSEpmRkxLQ1RqUVk1TnJEdjNiU0xSZVZRb1RhNmw1dHM0TkRi?=
 =?utf-8?B?TDh1Ukl2OTR5SFdlRjVSVjVQem5RK1Q2dTlRbXVReHZiL3BJVGh6VmpvZ2FE?=
 =?utf-8?B?UVZ2a0lIOVRrVXdleHNrWWpiOEN0ZXBTY2JhUnFWTUwyQVB6cUN1aFVSdjd5?=
 =?utf-8?B?d1JlWUlRSTA1cDFRUElrYVkxd3NQc2JmNEIvV3ZHd2VvNmUzcnlJZjQ4dW9o?=
 =?utf-8?B?cERrbC9ZSjk0YnJnbjZvWlp2RE9URkRLUTM0ang2cU5nYVNJeXlCbDdJa3Jq?=
 =?utf-8?B?UnpxUDZoQ1ZMT1pkTGRLcWJFUXpuN2FWalpLc3JCQlF3L0VDQ1FFc2I3RjdJ?=
 =?utf-8?B?bkMzWDc5OFlEMnF6ZERSOTNHbTVsdkdnTWptcTAyQXh3cWJMTzdqOWNXQ1Va?=
 =?utf-8?B?eitCYWk5djdrVnh0ak9WaklvNGNCOExxSnJqNXdId0JtMm90elZOeG9tSCtK?=
 =?utf-8?B?SVcwQWpDeDhqOVhrZnhIUkEzckRsSThEa3FTMXFEQXBwQVU3RExPWmFqVHJF?=
 =?utf-8?B?b04rcGxYNTI1eEtLejVBd0hhbE9IQjEwanJYaHpCTFBQbFpZTHNVSWlwT1hj?=
 =?utf-8?B?bHhtSTVubGl3eFdSUlEvSnBtYW5iMnZwTnA5YUN0dkRPOHNFVUhZZEFuSm8r?=
 =?utf-8?B?WERwaFdXQ3ZBcTlJT0draXhseFFWTjVWaGlxc21Gd3YwMTBWeFVjNWk0M2xv?=
 =?utf-8?B?ZXRVSml6dndXdnJpcEJZYlZ6eW4vcVRrK0xjKzU3dVBPdmNUWE1LY211WGVa?=
 =?utf-8?B?M0k0Y0N3aUUrcER4SGxGb3dEbExpd1A4N0xtbFdTMkVDNzN4SjBjMi9kcjFx?=
 =?utf-8?B?ZXdTZWxJbEZrWkphTHN5M1R6d290Y1gvSjlNNWNvb0tzQ0lKc3dXNDhaMGgy?=
 =?utf-8?B?SjIrQXU4SklrTmpMUVVpNkNZNUtCU2xkWGM0SWo3cXZCaEJjSkFTc09nQmVp?=
 =?utf-8?B?NTBrbklVcE1sTlQ4TFQ4UUhKUElzVTFGN0xFTjN1d2RsTnlaQjJNUW5QMEho?=
 =?utf-8?B?WGJMYmRhSCtkQTVKejVLVmdtWCtxak13REkvNmd0SWRDK2lpL1IyRlFOUXdm?=
 =?utf-8?B?MHNrNVBDc3ZXdUFydGxQd1grWHBHcXVwWHdLT3ErYjhOVWZHS3BnaHhGWUI1?=
 =?utf-8?B?U3FMSVRRa0pDTkxXNVlCSEhFeCtWZnhnQndZTlk0WGYvczVDYk1ScmtFRmp2?=
 =?utf-8?B?S21oR0E3SGJDeXBRekZBNlY1M0pabjBQNE91SUkyWnUxN0lybE40YTB3cUlG?=
 =?utf-8?B?d05ROC9hcnU3SkNKV0dvbGhUbkMxcHhIajhHWHQrYkNFTFFrY1FNTVQ5bThC?=
 =?utf-8?B?cGtrZjh3aWovRnJVS3JmUUZNckRzbUZTQUhCc1IwVU83Uzh0YWM5UmNIVWR0?=
 =?utf-8?B?K0VCYWNBUi8xMmxsYXdQaklaK1k4NlczYnZ2UTBIeXJrK1J1TXJZYkJKaE5Q?=
 =?utf-8?B?V05vUExjdmhnQ3l1NFdqVDN1bkRwSnpHbWpneFJyVEtxekFyTXdEa2VJWjl6?=
 =?utf-8?B?V2FiV0RFeXNabUxLejdWcWRGd2g0UklkYVdtb2l5VFJqOC9XUnl0SGpkQ09z?=
 =?utf-8?B?eFZjL3o2QUt4ek54U28vdEl1Rlk0Y0JwZk1NZldqdTd3VUNMS2dER0VrNkVN?=
 =?utf-8?B?T0ZubUszY1dqSXQyNG1vNTJIOGlneG4xWU8ydlB3bm4rRDNIb3dkN2VyZDQx?=
 =?utf-8?B?K3VLWjZHUGcwQWsyM3FpaGNmNTJUZ2VJOFZjaTFmVVd3MTZSeDZ5SFdxODBO?=
 =?utf-8?B?a2FUWnR5VmhmT2R6YUt4c1ZqVnRNS1J0VCs0WXY2Y01YanV4QWpjVFFDc0Vn?=
 =?utf-8?B?WXA5S2pPcTdzY2krdWZKTTUvT3ZTUXdGRkRSMnIzTEM0ZFplR3YxbHRHVzk3?=
 =?utf-8?B?aW16dmZzM2FmSVF6M3c5Sm84ZWpIS3UvMGE3b0c5c3VXbzV1M0l4UT09?=
X-Exchange-RoutingPolicyChecked: 44R9QvW0RgD5uodrlubmwmZfVzVI5PILta4b7j1CXuroZGbhpx2Jmt0bbSDMYj6ckYVBkBs/xxeemfC+zFmdhIhFsHNoPodT1heg1zENbUKaRoyMWuFCECfy4Qs5tBQP4MM5gyPrgkmm4KL4XDQcF+oOq13a6omww/cFvjHtDpymI0zkh+X3MTFKk/pJ7uQ6aJp0cbmD9m8ZixFRpP7bYG9dEPozFzkeFqonOAlxWgr/ynFsT2FDGCA/9sxXQUqQj/2ee4wH7dpHcNsPgf0WqIwVev9uXruaOlUkWqR2buCNtbnK/v/Y16VzZkwlXcumFqWeJKuXcKdPUmAEE5NPyQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de17abb-4d99-422b-9fe6-08df409f4f9d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5464.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:28:29.2000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rylEZq+C63MVHNKTJeZZgCrtTu0qI3UMZC53xLtKS++UZGQ+ZNJHp+vkYJHzSYXWe6PMH/wVC2cyeybcd2B4lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7910
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX5Zvjol0Vv0R3
 Np239Ozl5GN/QPq/++MN2gOrdIUQ3uXwhjMxDurj2c6LPbciCAWQL3rfizqz8iWcgWcPAb3ipiO
 fFlT2ledzCU38Lj4OU9cN8jOIApDdv3AFCISpBvFEguDaPu1znubGQ7dQ9oBhFUIhm2G2Zq76wy
 4D382grzsW1ZyuVR8kzBk6SHN8Zx0j2aCj16m3BzuUMka378tOVVRwnAE8mYPfqElnwWvHvCn8Z
 ZVbu7WvEVmgLK5r24Ybnjl/RI47U93aOmSLAlbnqBX8ww8tXYoQzXpcn84O6dwTA2/O4gjoIP1/
 a6Kakk6Zg13kEZNV81JGLeqIz76tHYPdo3g+7W2AyprYn+6wQpo2NrYz0Ios3ZZrXsETQJsB6nE
 LAkAzArshD69SQe5HjxFRbph/QrmfP8vwxoOKJMeyBJcQ5XFJwkiSxfDjO7mKNMiwpN7XI9jv3Y
 Waj8D1DIm+ED+uM8lpQ==
X-Proofpoint-ORIG-GUID: 7P3bfbEjuOi9aDcZEN2uyC-oe6hWtbBU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX5H56d+fmXT+z
 tdBUJaN0yapVgIQEJaaLiSj7FOiFdnWmNScoWnD04sn0z+BUfn86y2YOYUe8Q1Fdbj0MZragN5U
 Mzi1P7Vx7G3qkfz4voMwEsv7Fx7IIIfKCLjKlOCEX3bq7T1xuOdm
X-Authority-Analysis: v=2.4 cv=Ta0DJhQh c=1 sm=1 tr=0 ts=6af586c0 cx=c_pps
 a=tLhGFq4bAmKo+yvJBjszOw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=bUQKSiCPAAAA:8 a=THZdv-SURlF36SFMsxIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-fHZXUhsFbuwFN3fwQAr:22
X-Proofpoint-GUID: 7P3bfbEjuOi9aDcZEN2uyC-oe6hWtbBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012840_416595_7F204D4A 
X-CRM114-Status: GOOD (  27.02  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTIsIDIwMjYgYXQgMDI6MjU6MThBTSArMDAwMCwgVGFrYWhpcm8uS3V3YW5v
QGluZmluZW9uLmNvbSB3cm90ZToKPiBIaSwKPiAKPiA+IEFkZCBzdXBwb3J0IGZvciB0aGUgSVNT
SSBJUzI1V1gwMUcsIGEgMSBHYml0ICgxMjggTWlCKSBvY3RhbCBOT1IgZmxhc2guCj4gPiBUaGUg
cGFydCBpcyBmdWxseSBkZXNjcmliZWQgYnkgU0ZEUCwgc28gb25seSB0aGUgZmxhc2ggSUQgYW5k
IHNtYWxsCj4gPiBwb3N0X2JmcHQgYW5kIHBvc3Rfc2ZkcCBmaXh1cHMgYXJlIG5lZWRlZC4KPiA+
IAo+ID4gV1JJVEUgU1RBVFVTIFJFR0lTVEVSICgwMWgpIHRha2VzIGEgc2luZ2xlIGRhdGEgYnl0
ZSBhbmQgb25seSBhZmZlY3RzCj4gPiBzdGF0dXMgcmVnaXN0ZXIgYml0cyA3OjIsIHNvIHRoZSBk
ZWZhdWx0IDE2LWJpdCBXcml0ZSBTdGF0dXMgYXNzdW1wdGlvbgo+ID4gZG9lcyBub3QgaG9sZC4g
Q2xlYXIgd3JpdGVfc3IxX2FuZF9zcjIgc28gdGhhdCB0aGUgc2luZ2xlIGJ5dGUgd3JpdGVfc3Ix
Cj4gPiBwYXRoIGlzIHRha2VuOyB3cml0ZV9zcjEgaXMgYWxyZWFkeSBzZXQgdG8gMDFoIGJ5IHRo
ZSBCRlBUIHBhcnNpbmcuCj4gPiAKPiA+IFRoZSBmbGFzaCBhbHNvIGhhcyBubyBTdGF0dXMgUmVn
aXN0ZXIgMi4gQ29uZmlndXJhdGlvbiByZWdpc3RlcnMgYXJlIHJlYWQKPiA+IHdpdGggQjVoLzg1
aCBhbmQgd3JpdHRlbiB3aXRoIEIxaC84MWgsIGFuZCB0aGUgMzVoIFJlYWQgQ29uZmlndXJhdGlv
bgo+ID4gUmVnaXN0ZXIgY29tbWFuZCBkb2VzIG5vdCBleGlzdCwgc28gY2xlYXIgcmVhZF9zcjIg
YXMgd2VsbC4KPiA+IAo+ID4gU29mdHdhcmUgd3JpdGUgcHJvdGVjdGlvbiBpcyBkb25lIHRocm91
Z2ggdGhlIGJsb2NrIHByb3RlY3QgYml0cyBpbiB0aGUKPiA+IHN0YXR1cyByZWdpc3RlcjogQlAw
LUJQMiBhdCBiaXRzIDQ6MiwgQlAzIGF0IGJpdCA2IGFuZCBhIFRvcC9Cb3R0b20gYml0IGF0Cj4g
PiBiaXQgNSwgd2hpY2ggaXMgZXhhY3RseSB3aGF0IFNQSV9OT1JfSEFTX0xPQ0ssIFNQSV9OT1Jf
NEJJVF9CUCwKPiA+IFNQSV9OT1JfQlAzX1NSX0JJVDYgYW5kIFNQSV9OT1JfSEFTX1RCIGRlc2Ny
aWJlLCBzbyBzZXQgdGhvc2UgZmxhZ3MgdG8gZ2V0Cj4gPiB0aGUgZ2VuZXJpYyBsb2NraW5nIHN1
cHBvcnQuCj4gPiAKPiA+IFRoZSBmbGFzaCBhbHNvIHN1cHBvcnRzIDhELThELThELCBidXQgdGhp
cyBjb3VsZCBub3QgYmUgdGVzdGVkLiBTaW5jZSB0aGUKPiA+IFNGRFAgaGFzIG5vIFNDQ1IgbWFw
LCB0aGUgY29yZSB3b3VsZCBzZWxlY3QgOEQtOEQtOEQgb24gYSBjYXBhYmxlCj4gPiBjb250cm9s
bGVyIGJ1dCBuZXZlciBzd2l0Y2ggdGhlIGZsYXNoIGludG8gaXQuIEhlbmNlLCBkcm9wIHRoZSA4
RC04RC04RAo+ID4gY2FwYWJpbGl0aWVzIGluIGEgcG9zdF9zZmRwIGZpeHVwIGZvciBub3cuCj4g
PiAKPiBUbyBmaXggbWlzc2luZyBTQ0NSIG1hcCwKPiAJLmZpeHVwX2ZsYWdzID0gU1BJX05PUl9J
T19NT0RFX0VOX1ZPTEFUSUxFCj4gaXMgbmVlZGVkLgoKTm8gc3VyZSBJJ20gZm9sbG93aW5nLi4u
IFlvdSBtZWFuIHRoYXQgSSBjb3VsZCBhbHJlYWR5IHNldCB0aGUgZmxhZwp0b2dldGhlciB3aXRo
IGlzMjV3eDAxZ19wb3N0X3NmZHBfZml4dXAoKT8gSSBjb3VsZCBkbyB0aGF0IGJ1dCB0aGUgb25s
eQphZHZhbnRhZ2Ugd291bGQgbGVzcyBjaGFuZ2VzIG9uIGEgZnV0dXJlIHBhdGNoIGVuYWJsaW5n
IGR0ci4KCj4gCj4gQ291bGQgeW91IGNoZWNrIGlmIGl0IHdvcmtzPwoKSSBjYW4ndCB0ZXN0IDhE
LThELThEIGZvciBub3cuLi4gVGhhdCBpcyB3aHkgSSBoYXZlIHRoZSBzZmRwX2ZpeHVwLgpQbGVh
c2UgbG9vayBhdCB0aGUgY29tbWVudCBpbiB0aGVyZSB3aGVyZSBJIGRvIHN0YXRlIHdlJ2xsIG5l
ZWQgdG8gc2V0CnRoZSBTUElfTk9SX0lPX01PREVfRU5fVk9MQVRJTEUgZm9yIGR0ciB0byB3b3Jr
LgoKLSBOdW5vIFPDoQoKPiAKPiBUaGFua3MsCj4gVGFrYWhpcm8KPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
