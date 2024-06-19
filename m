Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599DBC2BA1A
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2024 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y0FT+tAaVTSL/EevDyXQfRbuqMFL2SYx0y56IFs4AO4=; b=J2mgLyn2Da10Mn
	IRZziS4rVb1UV6tcB+uVEO7p8sRYAmdBKkTdJYyC2YofLxcpPCtwR2vmpP1o9r73SC/kx5OZqGQnF
	GE250OJT6xBM+cAtWCSBXarkNMSGibmSgqGklWXOYt/SidNwgZvK7TIdZtqS1yj410M/rrbHn6Xgg
	ZKS/dkpxsQVhCL0ygU7p8fWYYHHtBteIizHiTjR15Thy6h/z1mgTO1mhbUvksKN2G+XM9ETjjiTSq
	jWvm4Q2g6LbFCqVlLaywwjXJAP7iExZjcPoVegI9hJPaE2tPoX0GiCNhgGG9lgW/qYl4gkCgmhWWW
	Ay8HZdh1IY1Vy6xfqJBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJrFA-00000000V5F-03JJ;
	Wed, 19 Jun 2024 09:04:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJrF5-00000000V42-1UKF
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jun 2024 09:04:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILbD9W019492
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2024 09:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZH/2kXHJkzWe6kFMWOgam3
	t3XFLMd6SGpbfKkgnK0D4=; b=V1IUxp2wNxpH7fZWBdOIsm2b36cZT7qZTMTTCD
	dStPT1L9+nRaR5ZXpTlBRcrSjcS1HyExqbYECy1uO2pI4qd02y46HcCwxf+xk50c
	q7gyav2t7RcbHosH4ggmyQUV8oxljK0+uGGkBGx0NNev/DDactOgR8Eabp/1AIaI
	qN0/c/YiwqAEKo8sQkbKC6mYCANGYcUPzsRrsaAdhYiAfFf92ZFuYJRbIgEaTYaO
	f3WZqlDAwjAQzouS1S1KC1DCcY1X/RuaphomGsEuMuKucu3TD7PYeUV20j60iCzp
	bxHfm5/rmlHTANEbX19i17pif3DTjvSaoEqtf00PuXUTFLdA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujah95ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2024 09:04:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiyaqWmB+7RkLG6GihbOFle2YWLkeRKxukjPWGCpZHObVpd4BUTDcmrJ2vkJWROGry5nbyXler8DU7aBqVjERk1guoe5hTxL0OwBjGueKzr4FcT+SDSM9aUPbmve4Ym0/hVsFSXZOgVKgT0/tvGT4mYpJuteTf1ez9SFKprY4n+zKxkPB+KG51O2pRWbf0xcUoVOsqaMVF46Kq/D/+Vuj4OMjpoeCpPrOzHWGo2Mg+15+fyMGkO5mIxmWNwIbth+Y5HXWwoNpkEpSdO6l4jzO73Rt48XzG51cIl+sA4mxm9I22emArZI6k7PkE4NAkDCeShklixaPyx+Ko9hIj1Hqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZH/2kXHJkzWe6kFMWOgam3t3XFLMd6SGpbfKkgnK0D4=;
 b=GZuZ45ZXa5p7Yvkk2gXS7nfn0nRhcZX9k37fpigo2TtYQhMJsHwSAkeUlvu9XZ0Ptf4FP2CYTj4MyBoYCQmYZvwq0Yyp1ms9N6o13SyYaiRt78uiC9KixN+xFX5B165WXtUlOoElhmvpJxFl9jGheX0xPFzmrvfll7lqZYUVXzvvFbPwuQxgMBprLV4ZXuAxmUN9VsIHVjhVIXfW4wMNpIp3N3anjPeC6CFgOl3ZZLidMyLI3Suz4nrPLr7fRNk+MhUTvOtOIYAh2IcqEIq6E2jyhGLpuZp0O6wndb/rzC4Em+agBHoJc6TuWfEDuBS63MDksZt7rdN+h/7yDmnjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from PH7PR02MB8905.namprd02.prod.outlook.com (2603:10b6:510:1ff::19)
 by MW4PR02MB7220.namprd02.prod.outlook.com (2603:10b6:303:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 09:04:29 +0000
Received: from PH7PR02MB8905.namprd02.prod.outlook.com
 ([fe80::33fb:f285:cb3a:9553]) by PH7PR02MB8905.namprd02.prod.outlook.com
 ([fe80::33fb:f285:cb3a:9553%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 09:04:29 +0000
From: Mao Wang <maow@qti.qualcomm.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: df command still shows much space used after delete all files under
 ubifs
Thread-Topic: df command still shows much space used after delete all files
 under ubifs
Thread-Index: AdrCJ6cw3QgrnXN4Q8ulXKWwIbQjsg==
Date: Wed, 19 Jun 2024 09:04:29 +0000
Message-ID: <PH7PR02MB89057718886FE1F0C7C87DADE6CF2@PH7PR02MB8905.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR02MB8905:EE_|MW4PR02MB7220:EE_
x-ms-office365-filtering-correlation-id: 32e2502b-c182-4814-d46d-08dc903ed3dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|1800799021|376011|38070700015;
x-microsoft-antispam-message-info: =?us-ascii?Q?E2uE+OO7AQBF1614kGCnM5rrYIf78cEo+7mA3mw3sLpxcPVdDzY1TghGdwN/?=
 =?us-ascii?Q?E64mD1V1ni19zYFoKGuKwPSX+7vYvNvxRrPdNc1dRlvsa8oYmwhOGm7bOJAY?=
 =?us-ascii?Q?XFzfyN7IV0ROcZ4aeqZTvMLScSR8C308aGPLnz5xOuYsGZENSsXtUO4rDffR?=
 =?us-ascii?Q?uDa2qUI37FB45SRJo+bUfQ2mMiY05kDMkeWKSYmCs607rE9IhF6WIWxZ4aiD?=
 =?us-ascii?Q?hq1F34Cb1VSfjTnOWl+3FFOM7C3h10VICeGoa9FhPdQ4C8Kto/Q7GAIoLvT+?=
 =?us-ascii?Q?yzWOi//Ho7x7CtaJlXlnPvgyo4kZxiPIqnfQUn3SLLTx0ER7mPvxtmA1uc6U?=
 =?us-ascii?Q?8JFLMVtQmbawhAizsh5TQTJvw7y8MTuLQzDagGuur4krx2Kt2QCQW8jxisW2?=
 =?us-ascii?Q?1VNZsEkBYZJXQDveloV5AXTRgTzJROYRxrYQqPGl0OGFM0EA6SC0OO0Za7Yn?=
 =?us-ascii?Q?DQDEE7/1JWg0+hnT6V2KhW66bSjUWjRBxP7qpbZBJcTDcIL1XuSJHamFJmdF?=
 =?us-ascii?Q?YBFag3mQIl0K9P2PhQ3FNqigVLl4dtKpYp+DkKj/qWSXSMplwtXWweMIOA7x?=
 =?us-ascii?Q?/BgYJJj9fJLR7SyxLO2/huML1GOuyUBGShic01oyxR50ChNnaLd2z0nSHNHm?=
 =?us-ascii?Q?H8R03OOYDhdY+G7GafGWpDuXlSYkLNd99wMTMe/SJmQ2Uh7LeZYzAdjZvx0R?=
 =?us-ascii?Q?vFSqkxBlEZ15pz0eExjK/Eifh9PX9hodqvXHRElyFdCHndWIlqZ40hYURiFF?=
 =?us-ascii?Q?25q/gxkYSKES8KhY6i6E4ytyufEs7IO6Azu0tBO2oXxphA7aGxRVkNunR84r?=
 =?us-ascii?Q?F1k+2nnCXyJzzPYk6KvMy6GQYv20JZAzGgafPe/1AxjtTi9lDPqCkr/B+kVA?=
 =?us-ascii?Q?02bpVa9LN6EdRR/WeXXk8OzzDGqDbNwiGsReAQRqAWwWXdlyNuzZqBbYAG5D?=
 =?us-ascii?Q?1TjTHWHuWQapVHM2lHRX+0LcidYvFZ9PzuRcokxhjb4T7iNRWTvjSCjo30yz?=
 =?us-ascii?Q?rOD1+TDu08gYi692bXNbsaNxHVclAcCuiqoVypzj6r14A0iBjVs3FNIFw2E/?=
 =?us-ascii?Q?2RFK6SfbgsYeGr5MD8vOI6w1bmas/GtGrG0VCoK1pOGEaOgO7vHQQb9OS9fZ?=
 =?us-ascii?Q?/BxdJJWwfP60jgb85x8lPYK7q58keaYXwDt6UxaBRWQzPfO11bFJZuAxXQBy?=
 =?us-ascii?Q?eG4nEU7/UNMf21z6dYMW1hvGW/caUdgnypRGZT1tNWVDHM6SB1BvQ/mBlz5c?=
 =?us-ascii?Q?EjpzUNGoRvmse16ejVQR8l4lpysrp00YBXZFReVcUwwntF9zNqh0jUXvR8f4?=
 =?us-ascii?Q?y4Y75TYiDVV26yJh0wr6v/CNXU5Ce/itfAzs9F7WF+pPpddT4eY3MICgHIeX?=
 =?us-ascii?Q?2X9khq4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR02MB8905.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?56Eg5miDxYkhCKUqFoVgoJw1kKI/tSM0mMTPO6/yQ3x+iNZbeNCvW+nTOsk2?=
 =?us-ascii?Q?5UsiQeO7jwwXITNWZuptc/tvABsvYvCiv06TRQ+aVz/CbMexG9r9EbEywnOI?=
 =?us-ascii?Q?3URrkO/zgXaCnLvBVBgJtGiSwS0NdGl/lKK11kVF1Ie5J98HU7oVpYs5yZB3?=
 =?us-ascii?Q?yi+hFZqv0ttsJ9UeevFdMdCNXt9dWQ1HZhvXFG2HDUYO0/XJwiI3B5qhfh8c?=
 =?us-ascii?Q?tNi6XIRhNblLdLTVr+xlPcZujvU4wYngFepe/Td4Z0Wr9WDTFIAsnIfhx7aG?=
 =?us-ascii?Q?uxnIrlZ5pgnGWkdbx99kKyinyPONISv8I/DOyBJEdWuv6M/QDChGP3Gm7t5P?=
 =?us-ascii?Q?PkLhubqJEXrcZXm+bGQOx3h0I29YFrUEX6BRMte1DCLk0Gd5/FvslNiRc5HM?=
 =?us-ascii?Q?RYwH8p6lKVGYD+/xEfM0GmgcX4bXNmIyHAKC6VaDCwzmMamV+70sBvkfnIp1?=
 =?us-ascii?Q?PIGLLzpVxdhd60w6uB202pUuZtr5dDuOtPfA5hDzAIwgUUJXnUl3kuIivGTT?=
 =?us-ascii?Q?jWrJF9X0h1LQu5J2xMwTIQ/SPrhwb1m/lb7hHAQ6wKJEtM68KPP3BJjSKAtI?=
 =?us-ascii?Q?QKi6nGXXVxe3lLVE7qwd1RETODk3thuL35c6uAFdJ9npDIHsEOBuEpqlL3Ii?=
 =?us-ascii?Q?Gj+753p+MiNLNoTtyX+lkVhkkCiX3HyZEBUm3CJ3eHP+rGl0PzLG6dP7L3W9?=
 =?us-ascii?Q?+GxHqK2TE+Gl81w2172y9/kvoLk1JKOUBaxN378aDLL1AIcW0KHJ/NArrRMk?=
 =?us-ascii?Q?yM5DxxBS0gGZ5GRZ0L+XtV/vQrSwlJfUlmQHMcpqUplafXi+gUkG1egdI6ZQ?=
 =?us-ascii?Q?fdB5JG5dCpkHykMOh0UUYU3D+94/YUxUziHrQarkurmPDykukCqDFkA+QXGU?=
 =?us-ascii?Q?UGpaJt0/YUd2gNefnn8FBx5WFSGMMVdcn5BInUSA1gydnATGAd3dYgRV4GoR?=
 =?us-ascii?Q?TnRjNiES04xHl8o/DkpDi7Jf0YM2hcmkPaPvtEajVKNSLlgvGpuz2fiHq2MM?=
 =?us-ascii?Q?RgV4FTsw8CyvIe3DvMb6WaVi/UCOS2Uv+gZkI1IUj34Om9oYZ6pblrVzHL1D?=
 =?us-ascii?Q?2LYteHkkdiaFfo0TB37JkTMwDykW1XB0vMNZZwcw0YJJB5+3KmnNRyfcLN2d?=
 =?us-ascii?Q?/d3WcLKbMpXm459IR+fHLVLR6tLyRNOnWa/AKcfYUpcczbclMWT2oHx2b5qd?=
 =?us-ascii?Q?WznFYsMlrZgXy6wpwYiWrAYxLxlTr5zl8SVtYxrR6oMO/EayJdFyeRtAU0UK?=
 =?us-ascii?Q?1vodwvbinP1p0PpZc5WPdWFRO2p0fBmYDOrMNzZyczjVC/4csdOC0VqEP2CM?=
 =?us-ascii?Q?exCflhOuQuyt/d+HE37q09pKcSEZIIiTadR14Lh9h2jM9XmGWSDRKueSODs+?=
 =?us-ascii?Q?N5HhzyKlqsIRDW3votVCvuJCjizLZP9DwrpOsgfwv5Ak0MCMfdvevNnE47O7?=
 =?us-ascii?Q?NMnFKevtAT2I0bm3dwR7nY315kfyvw2XLwlY8MfgY+N5WR71UNPm9SnT/3TH?=
 =?us-ascii?Q?vYwDNDBGirIn5LQtPaUm1hZvkt6SmxGZdppQd8yWZvaK2lG0edYYsglQeLC1?=
 =?us-ascii?Q?puaWM43MdJ5Hygd0f0A=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JJ64y0eOOtnYdRC+fcTsAlgxolDdtGRQZ/LPRKDgZgj+Lr16ln1Vsat30vsAOw/3k3j6F3HtN1bMzvFuXvYSP7c2EMjRindu318LbaR14KQNRtkId5SYSu0fSueICgMgpfNKce1oaZsr3WU2dMTXRyIwu/YnavF52+azZzRDxPqhcHvYCzcObQDM5uNybOtE1VmAh5ux19/T0dYxoVZKY+bn35onBwB7i7U2kXiDr82zfDUfhX71Lk+xwtXAx2LdQ1aRnwC6ZBl7JD3aDqCqV3LQg2AIz4j5OgAkj3ALhT14YuKVKGJZs10udATSn05vqKCiU9nTFM5zrogqU3ObUDQhfHdInXah10/BiiOlA3fSh1yo2EICqA4iiB5zoZyHgyBs0TfXusHzXR+n60F48qoAiamQQrMW6l9jlfPxoMkcNfSkEJHABzfbDxumKQgVP/sEbVsbTl95wV+sLkmWHqC9llOA0sVrOGOtgrB87e7lWvOkr72ibIth10s5Wim87KnNGtjiIDSOjg9Oqj0rFJDiG/tp2KgMHSxqvNVVxS74VxO7YJix+EUMIxb/pCGxztJnMWkX/u7643Ljp2s83tWjiP/JfwKKGKqvjHV3IMlw4WnRU1FpFJzoU83AUqEH
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR02MB8905.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e2502b-c182-4814-d46d-08dc903ed3dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 09:04:29.6277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oWlHH3sCw9ndqTFkWD+pNTIrJlSuw1GQdwR+nBQshWTP32px9NgkkrjHXm4c0kb/HfuFOewTnyIXwmhm90hSJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7220
X-Proofpoint-ORIG-GUID: dHuTjALKhwZglZdseAhPRUk6JrvY1yqY
X-Proofpoint-GUID: dHuTjALKhwZglZdseAhPRUk6JrvY1yqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 clxscore=1011 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_020436_450319_D24461A5 
X-CRM114-Status: GOOD (  11.34  )
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

Hi, 

We are able to reproduce below issue stably based on kernel 4.14.

Issue description:
1.	Run a special auto. Test for 2~5 days(test step will be descried in details later). 
2.	Stop the test, delete all files under /userdata manually.
3.	Then use df command to check the free space of userdata, when issue reproduced, df result shows 15~70% space used(while according ls result, userdata is empty).

Auto test steps to reproduce the issue:
1.	After log in adb shell, sleep 30s.
2.	Touch one empty file into /userdata.
3.	If above empty file can be created successfully, then delete all files/dirs under /userdata.
4.	Adb push a big file(size less than free space of userdata) into /userdata.
5.	During file push, do SPO(unsafe power cut off directly). 
6.	Sleep 3s, power up the test board again, goto step 1 to repeat the test.

Now we observed that based on same above test case, such issue can't be reproduced on kernel 5.15.
So the purpose of sending this mail is, do you know some changes merged in kernel version bigger than 4.14 which may help to fix above issue? 

Thanks,
Mao

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
