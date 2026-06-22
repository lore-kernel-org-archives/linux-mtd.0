Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52A2CDB46F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jun 2026 21:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LSGuBlucNdaZek2Tzt1FhtK9+gyJwuRsoaW021p3oBE=; b=pyjbigpO1ZHj7j
	5+GFDVNEwKJfXpVBjkHXGOqiQG2TzuYeZ5zfvkHxwP+2+NOAAlgyJCKa7kAcmxqjN4MRXPwcf0aeD
	pN2Aa0YqQjVbfrlNqsxOagXIdeDmtdwr420yZeYYdR5Z8Utc1SsZdD+sGFYiVywr/aRY9rOm2JQwD
	g/gBcVhA/Nfc8bZg7+1h42KpLakggYg3K/fpEmN0bREj1sugbZnGRkAx/fE3XPBblj7FHHLUJI4+A
	ocot557/ugJ2whw2AJAuT915tuvyvLONHerTqmf87SPiAghkg2FqT74WANcXZBZ6rHG2rJc28UIfV
	I9KCmgAkQQS3+6qGSf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbmc9-00000005Q9s-0kRN;
	Mon, 22 Jun 2026 21:55:33 +0000
Received: from mx0b-009ae801.pphosted.com ([208.56.12.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbmc5-00000005Q9U-3qLF
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jun 2026 21:55:32 +0000
Received: from pps.filterd (m0495960.ppops.net [127.0.0.1])
	by mx0b-009ae801.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MLUxwP3437740;
	Tue, 23 Jun 2026 05:55:04 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=11242025; bh=NInmYpf+QE9SUeyW8unyThL
	1/tRBW6NyWna2DjQVKu0=; b=JHw3mOHzaYHx0YHsatzxXMsP/B+7GYiISDq3cmw
	TYenDJhmIIb7f2WLdxuImPPusRxUMHP9m5TgcQF8t6dBQGI8ZAaeln6wb7jSkJDf
	mswAvMhqdgFbQG/OVKulmQXA/eX8aGxT/hdonRMNC6G0IRWt/XVc3KOnnlEa3EIr
	2C1Hf5BooHAwGGRK4OXAocS4/dSjBqA1s2eHjgc30PmLeuySSuax9cf/ecsBFADb
	I54XXmGJD2vW+5vD/ERu2Ls21P8FNn07gKFw2KxGCcY1FBfcHJtQLG4SWRrXPawr
	UKTnojZKDHrmvcOfpEEfeFl1Ahqq0GwbOGNBS8ZtEtUg6Lw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020121.outbound.protection.outlook.com [52.101.61.121])
	by mx0b-009ae801.pphosted.com (PPS) with ESMTPS id 4ewxpq9enh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 05:55:04 +0800 (WST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcNIXAOw02hEp4xKB7lLqsWBpdDb8n5K/C8oqCxRj5PRHcRaE/sGqC0AZLQZYNurUZq5y68XprySTbyxprLGj3DR2nbF4qfnWLUdKoedOctAy7Xb59fkPmRd9wzdwdCc/uTT3uXZqoafgJfke5O78UgpPXGd2hzMK2P4VXQ6cBnHBBnGMPEHwPPGQaAezlHP5et1usXLPrFC5va94aIgpWuxiXT55sUA21qdGEBWzsPgXq5nP/+W0B9g4XZFCLvdC+QYFAoZeoTdFtP5YrZLXEj0H2sWqEwGJCylTyiQz+WE49RGB6OkTJrgbfe1v7iNZAp9BazfUgF04sd6kYcP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NInmYpf+QE9SUeyW8unyThL1/tRBW6NyWna2DjQVKu0=;
 b=dG0VxoTwHGCm49SUfCSa+udY78c2UbmVgCC7ez/24oU+a3ALZV/uI85437Yks9Aw4vkiEdG0+yTmzRzxlU1U6m3TAoX2bJHSXnpBMMLJ+pbZmKfm9WCkIuKGC31cfXzJIJllfK6OKnLkNmXqGTmsEKqz9oYquahPzqvIz2eoGilsaHhyWsp2Def8FY1znXTJ4ljAgGwrpx4eByaIRnHLArqACD7b9tJqEidI1kysE+shdNI0bzv42OkW3yFF+FSnX3JWfJqYcIiCMxEtJbLFvE63/X1W1GqOX4LFdHycPtkoNY3vizeNlX/mL0zD2+Izy1DBujSyyuGuggmilTWeyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=issi.com; dmarc=pass action=none header.from=issi.com;
 dkim=pass header.d=issi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NInmYpf+QE9SUeyW8unyThL1/tRBW6NyWna2DjQVKu0=;
 b=ykTgLBsq5Bh7gZUNSN3dB80gLp4sWO3+wGb+AYETkrFDj1bD15IZ8S08VPFYuw7Yp+LrX6I19OLaePx8yq9EJ9kt0pn4gPpNQDGzQqFdXKwY/LjjTVTibOwpzSZ+2OqONp3LsqP9S8DsTGd8w9CTu3KbunLvJRMPc8S+aRUbIS0=
Received: from LV8PR19MB8597.namprd19.prod.outlook.com (2603:10b6:408:25c::15)
 by PH0PR19MB5623.namprd19.prod.outlook.com (2603:10b6:510:144::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 21:55:00 +0000
Received: from LV8PR19MB8597.namprd19.prod.outlook.com
 ([fe80::d035:5ff:4546:5713]) by LV8PR19MB8597.namprd19.prod.outlook.com
 ([fe80::d035:5ff:4546:5713%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 21:55:00 +0000
From: Jeffrey Yu <jeyu@issi.com>
To: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
        "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>,
        "computersforpeace@gmail.com"
	<computersforpeace@gmail.com>,
        "bbrezillon@kernel.org"
	<bbrezillon@kernel.org>,
        "richard@nod.at" <richard@nod.at>,
        open list
	<linux-kernel@vger.kernel.org>,
        "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
   devices. Additionally added several structs to support ISSI octal flash
  functionality. (Octal SPI 2026 revised)
Thread-Topic: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
   devices. Additionally added several structs to support ISSI octal flash
  functionality. (Octal SPI 2026 revised)
Thread-Index: AQHdAo9F61f0sglIgEOSBYmaNytNMg==
Date: Mon, 22 Jun 2026 21:55:00 +0000
Message-ID: <LV8PR19MB85976C665A59A0DEBAF4F285B6EF2@LV8PR19MB8597.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR19MB8597:EE_|PH0PR19MB5623:EE_
x-ms-office365-filtering-correlation-id: 6c14740d-fab9-41f0-af99-08ded0a8e855
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|18002099003|13003099007|56012099006;
x-microsoft-antispam-message-info: GrBl+EUv7P6FgKfmH9E+W40S4itmNOAxjsUFUxMD53A+9MhSRhROFCkhTP5mU1fmgpGB5BpJx9tt4NuJ0iyewDT8NgQYCdyDtyNoHqA3NfXAN2BfqS2Eyi3+zlqkDuK9AbaLn1RAT7REEEJWkgO2J/e+yamGBs0CRz+WHlQF/FroqeSOQGK2K2Fpl2GJVd1yAf2tPN14WV5YsyfnGj4JcU9fZw+7bClT5fgewY8AwZWPM6JWl0YZyNg3o3+Mm3uLuZ2K6i1AFL5fYsDlFBIa5FVGDxMtWQ7l0TWEyRVr/t9ZaqSYI3/6Xhy4whxmQLtUfIVQONZvK5fP00u8mCV6g2a3UxGabB8fwp5FhUM+FGDHy+kxJUnKbelE3Tjsf8P7NVyDkX3gmamveg/subGJ54wNOCW6kFNUT7H2XgXNiYMKRezWDkXGEVy2PjB84dzHChXpyxauZpKqCdyRmMwfx0w1xjJtZ84Vymw13wO49Sx17mN9C7UQUw6V25M2Ah+j2R9/zjRR6Rf5KVBNi0SogeDlmqA+SzsooDTDvFl1S0/TTGqTrAhcfGQH4BrtbGuIfCMkumzI+0UL1pYNCR4M4T3xGg7EXb5pXFUUBxB6fYqH4phxdkpkEDeU7HfErKXIaHy90IlyHvm4t7pD2LxPxZkcYKbURGh+vnuxK0coqeONnolzsHjhfFdnUHB1407tYMHLfsw8QKAtSSq7k5rfX+GQt5ZhNnJjFW3WvEIVUn4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR19MB8597.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(18002099003)(13003099007)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lfORmBbXZQnT3Jy48qftHkNfakvqiQV4gm3+cS72CWbwpJf/qFxUmbqx+h?=
 =?iso-8859-1?Q?0XwQFHERqSEXnMxkM7prumL6r+Enz8i9gvPtOcTlOYr+GeGhpUUcxrYS1f?=
 =?iso-8859-1?Q?BxEQZ4LauN6+X/aZE6sp8eDaXOLZfG+VtYRX1a+iDkS7cuS0RmDhYTHBTp?=
 =?iso-8859-1?Q?FqO3JvK6smqMcjNTNVFLNyQMIJJ/OtKjaaZiljM5Bw/HAwGZ6Wzwq1DZpz?=
 =?iso-8859-1?Q?XDMxdPLjIOagvtnCuKpEEVqaqpg75qwmuqLuOILBsreMdQiCbVwCyQz5PM?=
 =?iso-8859-1?Q?o871YeK47aLarHXNUlm4svIjoWwM8LE3WUFbF++KKClF8Yd2/LYJGXVILv?=
 =?iso-8859-1?Q?3aX7Z0KABB96tOK8xywI3U0ElNt/kSnmTYeJL8rMVwEetFgWy3sCU3/TDX?=
 =?iso-8859-1?Q?heReKAlZz3XAzcfNP5OFW37nKqOw89LhOBTF4GuG7xiK3OTX89622nSw8d?=
 =?iso-8859-1?Q?bd6p3fpPX3nOqc/PvJvRpf9jgZeV9l2wYeCLEYH7zV7u92sdgDcKMLO+jD?=
 =?iso-8859-1?Q?al9lIFKmvJVN+d/WLOzhVrAEquRXR1vwuqJgvRHCdfQGc4jrxZQZRJKdb1?=
 =?iso-8859-1?Q?Ng59DHfh+Ks0/6NoabmOBshapmtdvFxFKANJAzgv+Cji2izzz1LCinkjZ8?=
 =?iso-8859-1?Q?7Ga/aHtbU2aRvwYTX+oMu9Uk8TJL3JhbrBvvtaKPV1ubdyiKoAtrYR+okW?=
 =?iso-8859-1?Q?gQXfO6Cry3pkMhfYem7tvmDGJRSapC2kBHNs6IQi0aO0tEhQXMfS6TXQPV?=
 =?iso-8859-1?Q?DGdAP2Jkug71M6wdHxDX9B3SdOGaEXc9Wxnv5lKVSHUQqgiTMmZ3RO4uz8?=
 =?iso-8859-1?Q?lXk1w1sFagEvPrz9Sp52IG1zboFCYd5IQaxaUhcrphfZrPcg28R/ifcNLG?=
 =?iso-8859-1?Q?6IIsHk/i/QuFAONlu5SAbo6UfH0Q+RPbepV+PAUvc8H+iTOWzRMmtlX6rk?=
 =?iso-8859-1?Q?AGE7AR5Ut0yRWB87podhSa0sZ35d76sK6GqHt6lS/b+MmPUSRk4pHU0vOq?=
 =?iso-8859-1?Q?Q0swvxKgK1pQAMmHEJ4em9B2hLK4pwC0yOtjz24jyWQD950NLEx0Yf8jkc?=
 =?iso-8859-1?Q?O3EBjrpRGJUnpx3wPHGz9YRSclvy57uBvU8keyl425h1kURSCm/z0SF4GK?=
 =?iso-8859-1?Q?gRT9GPhluvKqgS+Ojpevy/OYIGNVLll05ChFx6/EjUSvUrljRr2YMhrdab?=
 =?iso-8859-1?Q?EsO77xPucJLn4VrwUxnSA9ZcG1D6YioFcQVicZVWSQ/PKAYOCdFH3EX7fW?=
 =?iso-8859-1?Q?kJJnW4rE9X9I3i6BcTRYGXnTP+LusGnMwL4OHRe6rQIAM9JrxNOCVpgCVf?=
 =?iso-8859-1?Q?BYwkvdFRw66xnSo76jDf944J3HEcvN/tVl4b7D+AaWvA3Xs+VnlwRD/HMF?=
 =?iso-8859-1?Q?9GeG/qBSFOgjbheQDZfazaTT/ue4ZM443USBL1Nu1ixrjxFGnVJEi1T2I0?=
 =?iso-8859-1?Q?aCT7JK0oq4VebXguvtQLAJCPzuAHIIl8lZrja/w/mpyvHN95ynl2zaalbW?=
 =?iso-8859-1?Q?3F/p/Uj/3JbSGDnKOw96sDfMX6p08en4BoDafu+5Oc2BJVOp0XTSy7XWQV?=
 =?iso-8859-1?Q?rlpLwH3NKIbAk7DpGS51WOcUTgkcldyQ8d2aD2u8bnA6Qodg0jkaJW1I9s?=
 =?iso-8859-1?Q?78dghipBp8iJ9azBPW9JP28ZCX5dFpznWDaoenoOLzhVqlCYJIoXoQujDc?=
 =?iso-8859-1?Q?kPYDJziMDu9yCgoUrjGYbq92QVzilfMDNwAKVRch58ZhMiWrxcpnf4LcMw?=
 =?iso-8859-1?Q?M5X3FtlxFcTLjQx5N9t9wIHFs=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: S7KEUKSXW4eMk4o0nrgFDf42gGiaVQclCGeIY6eCVSRR5jRgcJ55bHvQcqOPWLEuzgk2MEBqKa+hyxG04zjlmNT5sVZpCGI8ChF9GuCsKOedaJLLclXDs/jADlJp3ejJyY18nkLItKq6uQmFGlWEJ3uYC55w4mEfa3SEPs1LdwynDHQzcW6pqcy5t0pNXTb86fmDBbxa5eCF3PZQ670izZQ50TEufZDLaRcWXCgXL77diBn93sE4+cuQNmy4K/IMOXdKCcXi4wex4namm9vxMmMElwjrd3zdFSb1AzQQwrRPUVVeUQaiYQxHYm6GZKseCpwLEOah3nl/OhwLouAyHw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: eRXn2/aftgCr3lghSEOplVXE7iosPLex1DDUC2IZYLInrpcm3ZzVvIFapoL+2sI30BgDqVIW0AWYLA0kdH0opxx7SkhIC/mjuNDAwMQWB58cfC7d8MMsP7Nl4WldKFkRJyrzNlO5pIexSqf7BRIfywmbQZrVfWVI6MfonA3U/7dRjvxPll3SPwXY2sGTXOAJSoDJ2NdzsCbAeuw6qltIuuX6fq8ov6G31irvCgEpaJp+anYx0BSbQtSyBvdVyn5ZYJoKitZ6yJcj32/TutR1xPC4ZQoEORRlXFiSqsaa0zkhLAszupFZWw/aCZWflUSOEdWgBMBGDcaMceklNVSdFS2AL8fWGAqZGtlU68G8ZcKj2tSdrS1PZyi/zhfDOEEuAXRC8MSIU8SMXQS5i22dr6ImSOeectZ9Djz9bHPUXIYvR9vMPl5iDesoyCqSSCTRkwtijSzmLcmZhLmzut93xD9LFdGpymimmC2ba2hYmADTWDNjF3Qaa7mCCibE+F2Gs3veFBqNQIntI8Bjc5eFwdMgmL0qvUDpWsLWdqErCM3B4+5jZIty+prlbyjU0qzfcnT5h3CCYfWoKWiAEfsoELNnfGM0EQaPhLhE/EKV7f467TkZJ5cY4u+7RxNGlXf4
X-OriginatorOrg: issi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR19MB8597.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c14740d-fab9-41f0-af99-08ded0a8e855
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 21:55:00.3724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6af618fc-4f7d-45f1-a2f2-8c59a26d2c10
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8SzHEUy1OabPqUlQpls/ElQxVHcdFwnZgNPbs6Rx/Qoibdg+kj6kPRkm9lUQ6nV5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5623
X-Proofpoint-ORIG-GUID: UswWvJiPMolEES2EgZlkQL4juoMuhOLQ
X-Authority-Analysis: v=2.4 cv=Z5nc2nRA c=1 sm=1 tr=0 ts=6a39af38 cx=c_pps
 a=gVSWREVB2+MMVoEXIx77hw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=ozMtBe7fU4EA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yOHNzV93IasTtWdH6Nhn:22 a=US3Q6AVWkkt9IXfmMOXc:22 a=DUnRZS7UAAAA:8
 a=crEHfChw6muAfOTDsdoA:9 a=wPNLvfGTeEIA:10 a=cDzw7mrAGmWHSR5u0tpu:22
X-Proofpoint-GUID: UswWvJiPMolEES2EgZlkQL4juoMuhOLQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIxMSBTYWx0ZWRfX4xGaPxJ6vo1a
 ye0PIhBBvhIOuD1tJvFXuy+lsntF1NfCmMMP4w1UnFzFMyHrBYIvaI7ciOvNCDckyL824+DMVLd
 emVmjKF7wTk1b7XF2tku3uZL32HfXj3aB9qOkWkiLXxXxWaAAOJLtNqR7kgZiLYLWiNKLhn3MIF
 M8KuGAtWfqE9ZGgQHqdmryFOBXjna87XjfvvJ3BPOumE9/FxOdnjF/FKOwqe040PSGw19U30oyK
 ltBNzUnwoSRIAYsCxUUoBZVfeM0UwCUlQB5jVKWJ7JEoTAIopoVGj1amZp4BCUaGPhXi69obb3Y
 +Mq2unj9W2Peofui7mC98wddILlxhjI+uMVONimB6U7hni2qbm3nvnlUu/7xbf2o9Vvd0oI6IQY
 biJaneU9VMNa2LsMtLfuGzdHVfxmz8zHEorUeElAoXCqKlLBBmnLnJK3L1beonLbl0LezM1TI8W
 JAQaFP2T2DX92Sa14CQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIxMSBTYWx0ZWRfX2U/MB9XQjzEM
 AoPYNh8DGBG3u+0mySUI2HkBRLMJ9SmbMm5sp5OjT+g+NVG7udJzJoSUP48JEmiCYDsQKul2259
 S+BBzWjvkmy6rJ6L/QSezugVt6rW4Hk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_145531_044354_8E5BBA05 
X-CRM114-Status: UNSURE (   9.60  )
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

Add JEDEC ID table entries for additional ISSI SPI-NOR 
 devices. Additionally added several structs to support ISSI octal flash
 functionality. (Octal SPI 2026 revised)

These parts previously not yet supported.
With these entries, Linux software can match the device by JEDEC ID
and use the existing ISSI SPI-NOR device handling.

Newly added devices include:
  - IS25WX256  (JEDEC 0x9d5b19)
    https://www.issi.com/WW/pdf/25LX-WX256-128.pdf
  - IS25LX256  (JEDEC 0x9d5a19)
    https://www.issi.com/WW/pdf/25LX-WX256-128.pdf
  - IS25WX512M   (JEDEC 0x9d5b1a)
    https://www.issi.com/WW/pdf/25LX-WX512M.pdf
  - IS25LX512M   (JEDEC 0x9d5a1a)
    https://www.issi.com/WW/pdf/25LX-WX512M.pdf
  - IS25WX01G   (JEDEC 0x9d5b1b)
    https://www.issi.com/WW/pdf/25LX-WX01G.pdf
  - IS25LX01G   (JEDEC 0x9d5a1b)
    https://www.issi.com/WW/pdf/25LX-WX01G.pdf

Signed-off-by: Jeffrey Y <jeyu@issi.com>
---
 drivers/mtd/spi-nor/issi.c | 242 +++++++++++++++++++++++++++++++++++++
 1 file changed, 242 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 18d9a00aa22e..61597e9e962c 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -8,6 +8,182 @@
 
 #include "core.h"
 
+
+static int spi_nor_issi_phy_enable(struct spi_nor *nor)
+{
+		struct spi_mem_op op;
+		u8 *buf = nor->bouncebuf;
+		int ret;
+
+		ret = spi_nor_write_enable(nor);
+		if (ret)
+			goto ret;
+
+		buf[0] = SPINOR_IS_EXSPI;
+
+		op = (struct spi_mem_op)
+				SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+				SPI_MEM_OP_ADDR(4, SPINOR_REG_IS_CFR0V, 1),
+				SPI_MEM_OP_NO_DUMMY,
+				SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_1_1_1);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+		if (ret)
+			goto ret;
+
+		nor->spimem->spi->controller->flags |= SPI_CONTROLLER_SDR_PHY;
+		/* Read flash ID to make sure the switch was successful. */
+		op = (struct spi_mem_op)
+				SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+						SPI_MEM_OP_NO_ADDR,
+						SPI_MEM_OP_DUMMY(0, 1),
+						SPI_MEM_OP_DATA_IN(nor->info->id->len, buf, 1));
+
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_1_1_1);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+		if (ret)
+			goto ret;
+
+		if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
+			goto ret;
+
+		return 0;
+ret:
+		nor->spimem->spi->controller->flags &= ~SPI_CONTROLLER_SDR_PHY;
+		return 0;
+}
+
+static int spi_nor_issi_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+		struct spi_mem_op op;
+		u8 *buf = nor->bouncebuf;
+		int ret;
+
+		if (enable) {
+			/* Use 20 dummy cycles for memory array reads. */
+			ret = spi_nor_write_enable(nor);
+			if (ret)
+				return ret;
+
+			*buf = 20;
+			op = (struct spi_mem_op)
+				SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+					SPI_MEM_OP_ADDR(3, SPINOR_REG_IS_CFR1V, 1),
+					SPI_MEM_OP_NO_DUMMY,
+					SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+			ret = spi_mem_exec_op(nor->spimem, &op);
+			if (ret)
+				return ret;
+
+			ret = spi_nor_wait_till_ready(nor);
+			if (ret)
+				return ret;
+		}
+
+		ret = spi_nor_write_enable(nor);
+		if (ret)
+			return ret;
+
+		if (enable)
+			*buf = SPINOR_IS_OCT_DTR;
+		else
+			*buf = SPINOR_IS_EXSPI;
+
+		op = (struct spi_mem_op)
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+					SPI_MEM_OP_ADDR(enable ? 3 : 4,
+							SPINOR_REG_IS_CFR0V, 1),
+					SPI_MEM_OP_NO_DUMMY,
+					SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+		if (!enable)
+			spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+		if (ret)
+			return ret;
+
+		if ((nor->flags & SNOR_F_HAS_STACKED) && nor->spimem->spi->cs_index_mask == 1)
+			return 0;
+
+		/* Read flash ID to make sure the switch was successful. */
+		op = (struct spi_mem_op)
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+					SPI_MEM_OP_NO_ADDR,
+					SPI_MEM_OP_DUMMY(enable ? 8 : 0, 1),
+					SPI_MEM_OP_DATA_IN(round_up(nor->info->id->len, 2),
+									buf, 1));
+
+		if (enable)
+			spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+		if (ret)
+			return ret;
+
+		if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
+			return -EINVAL;
+
+		return 0;
+}
+
+static int is25wx256_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+{
+		int ret;
+
+		ret = spi_nor_write_enable(nor);
+		if (ret)
+			return ret;
+
+		ret = spi_nor_set_4byte_addr_mode(nor, enable);
+		if (ret)
+			return ret;
+
+		return spi_nor_write_disable(nor);
+}
+
+static void is25wx256_default_init(struct spi_nor *nor)
+{
+		struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+		params->set_octal_dtr = spi_nor_issi_octal_dtr_enable;
+		params->set_4byte_addr_mode = is25wx256_set_4byte_addr_mode;
+		params->phy_enable = spi_nor_issi_phy_enable;
+}
+
+static int is25wx256_post_sfdp_fixup(struct spi_nor *nor)
+{
+		struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+		/* Set the Fast Read settings. */
+		params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
+		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
+								0, 20, SPINOR_OP_IS_DTR_RD,
+								SNOR_PROTO_8_8_8_DTR);
+
+		nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
+		params->rdsr_dummy = 8;
+		params->rdsr_addr_nbytes = 0;
+
+		/*
+		 * The BFPT quad enable field is set to a reserved value so the quad
+		 * enable function is ignored by spi_nor_parse_bfpt(). Make sure we
+		 * disable it.
+		 */
+		params->quad_enable = NULL;
+
+		return 0;
+}
+
+static struct spi_nor_fixups is25wx256_fixups = {
+		.default_init = is25wx256_default_init,
+		.post_sfdp = is25wx256_post_sfdp_fixup,
+};
+
 static int
 is25lp256_post_bfpt_fixups(struct spi_nor *nor,
 			   const struct sfdp_parameter_header *bfpt_header,
@@ -126,6 +302,72 @@ static const struct flash_info issi_nor_parts[] = {
 		.flags = SPI_NOR_QUAD_PP,
 		.fixups = &is25lp256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x5b, 0x19),
+		.name = "is25wx256",
+		.size = SZ_256M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+				SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+		.mfr_flags = USE_FSR,
+		.fixups = &is25wx256_fixups,
+	}, {
+		.id = SNOR_ID(0x9d, 0x5a, 0x19),
+		.name = "is25lx256",
+		.size = SZ_256M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+				SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+		.mfr_flags = USE_FSR,
+		.fixups = &is25wx256_fixups,
+	}, {
+		.id = SNOR_ID(0x9d, 0x5b, 0x1a),
+		.name = "is25wx512m",
+		.size = SZ_512M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+				SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+		.mfr_flags = USE_FSR,
+		.fixups = &is25wx256_fixups,
+	}, {
+		.id = SNOR_ID(0x9d, 0x5a, 0x1a),
+		.name = "is25lx512m",
+		.size = SZ_512M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+				SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+				.mfr_flags = USE_FSR,
+				.fixups = &is25wx256_fixups,
+	}, {
+		.id = SNOR_ID(0x9d, 0x5b, 0x1b),
+		.name = "is25wx01g",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+				SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+		.mfr_flags = USE_FSR,
+		.fixups = &is25wx256_fixups,
+	}, {
+		.id = SNOR_ID(0x9d, 0x5a, 0x1b),
+		.name = "is25lx01g",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+			SPI_NOR_BP3_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+				SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+		.fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+		.mfr_flags = USE_FSR,
+		.fixups = &is25wx256_fixups,
 	}
 };
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
