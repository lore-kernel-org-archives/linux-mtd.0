Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37F9CD4F3C
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2026 03:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kl6wSuxn8/CoH47OinUGeXhVw/QQmeB3oKHvmIvl6IY=; b=ltFONTDEX7O2L+
	Xvz1UYT+XznQcxm/t7h1PdKX8UzcPPjp7e6rJ4MxopB+0XuW2r49BlKeYANqF60FJRsLuKxZqLE8l
	VnYNGZiskzEk4CULizZihSC0swmLCYCDKJTodRHHaY9xbOe14QhCpdjkjkWThV1U6LcJbhmZqt/oa
	AZ2zkmM11ESS5tlFVeXyg7mbd83FPCq7HxpNxMawl/Gr4eIU6CdfF26Cios/lq7sggVvy8afzX0qz
	2Hz0LXmmGX2wbSgQFJ4cBR3JrZYQ/4BCekRUz94oKlFruYiMb1xfm6hp4bnovRmtiZqcw5ccuMEk3
	nobb9lSQb4Du552WTUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPB2m-0000000HYx2-2MsJ;
	Tue, 19 May 2026 03:22:56 +0000
Received: from mx0a-009ae801.pphosted.com ([208.56.8.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPB2h-0000000HYwJ-3Vg1
	for linux-mtd@lists.infradead.org;
	Tue, 19 May 2026 03:22:53 +0000
Received: from pps.filterd (m0495959.ppops.net [127.0.0.1])
	by mx0a-009ae801.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J0kqpH236754;
	Tue, 19 May 2026 11:22:18 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=11242025; bh=mmhBbcj/YBhuDcqDmRosyyi
	xmu4WzUlpk/ZpvHqlJeo=; b=FeVZDMMRATmOe0IfA5Mc7yYNgRDIi5HFNAgLKcm
	sv97EFi1hlYClsp/P2cK/n1wdJAf/8JZHxVV8OkRFU6E7qI/i3fzTirGe3PM0isl
	0J+AIhJUkbixLYHET8UjiQS0lQikzv8NWxOL7/QsXWAoVK2TemlmeownHWBM08wu
	aCA6yP+4hcR317ZrfL6KOb3MbIQl0zxiKbduHMYFYm/h3CQAUSpatZ9+uwcvh5He
	1N1epzgKudqBXvT6wrHyLFShcIBIVO3Rwc5vjcyoXFsg2jIUS02TmiQZ3xWyAP1p
	vosly9zplZqhZXZJFJxwhYoY3mGslmqoUIR/DIoKf1x5Now==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020113.outbound.protection.outlook.com [52.101.56.113])
	by mx0a-009ae801.pphosted.com (PPS) with ESMTPS id 4e6ynr1bjf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 11:22:18 +0800 (WST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+n38+xOaRxZV6ivJ1KTpsMWetJ6CYPF2X9YSqcBEj/ZXTrKcD2jgezgFGGs75nCLVYCGY6ytAZJxi/76OMKnuPQMUDbCPJ9XbLINOoq5XAHwJnuPsi1vUfu9DsnVPQ2qEmYsgyiDWfgZyuoARaUFQVPKl19K7SfU71UqekeJs4xVebcWiGRHPJ3TSUK6OrGVCyHsLAkqyc7Rd/SejK5fdL9foaMsUtiwyhixa12QASQHDHFqI7mQH+L3BTrjZONwf8xUjge6TM99TS+zi5QKe4Tq+df/6TXwejPzrkxfLshT3HT8i15goriV4EBnP1CngbpOy065SfOeh7bHHsWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmhBbcj/YBhuDcqDmRosyyixmu4WzUlpk/ZpvHqlJeo=;
 b=QQH+0ghQYZL23oYUtInLwr4o1lnhI7Wsy3AdFqXbRS9Sehktyam/rXwRtQ932qmeMpggMAv+MrJ/nD95iMwPZsiIW9jk3s+rZX4s2ExV+eUysE52m9NL7FbhnlwGcVZ/nM3552zk4wxlcpR7KY8rzhd+b6eHwLqjNU4fQUzU5fhf8ys8ZpcVtYSuyiwh0UgIbACWWqFdSgqKDpBDQvSAVP8mj69nDYNoARNBkYjdqOqYj03AIK9CY1TyJd6IzTMkj1LUZPFSpy/R1OB0QkMMdXsycDxFOS4JaZ2bzBYy6+SknwP6KwF6tSAo2CpGeOaeGSO6y4uD21VIsf0xWFcSvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=issi.com; dmarc=pass action=none header.from=issi.com;
 dkim=pass header.d=issi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmhBbcj/YBhuDcqDmRosyyixmu4WzUlpk/ZpvHqlJeo=;
 b=e9Z1tb5Vo2qtMrIWKeMb9a3ewcj9NGh7LxTuB9CqAtNGiIdMdKrB4nN51J/1F+yx+9c+JKE3D8hniZ75fnBPoIkroXdzUc3DzrOQrhQtvPzcPwi5H8ABkVupTI84uM2/1y0hwce679Gs7bxowuOvnNmqG9K4bXZlS6K6N7Qu7VU=
Received: from LV8PR19MB8597.namprd19.prod.outlook.com (2603:10b6:408:25c::15)
 by PH3PPF2ABBD2300.namprd19.prod.outlook.com (2603:10b6:518:1::c0e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Tue, 19 May
 2026 03:22:14 +0000
Received: from LV8PR19MB8597.namprd19.prod.outlook.com
 ([fe80::d035:5ff:4546:5713]) by LV8PR19MB8597.namprd19.prod.outlook.com
 ([fe80::d035:5ff:4546:5713%3]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 03:22:14 +0000
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
   devices.
Thread-Topic: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
   devices.
Thread-Index: AQHc5z4ih76YMhojC0OHfiGv+wM8/Q==
Date: Tue, 19 May 2026 03:22:14 +0000
Message-ID: <LV8PR19MB85975F9583F7CF7616D5FF27B6002@LV8PR19MB8597.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR19MB8597:EE_|PH3PPF2ABBD2300:EE_
x-ms-office365-filtering-correlation-id: c24a8622-9c6c-4b8a-97d0-08deb555d2b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|13003099007|56012099003|18002099003;
x-microsoft-antispam-message-info: VJaJ2xHLDXigcdAoLsCzaOcVXhDZMpp/yyBshHpvzAKSTz8wRTsgo+IYV84KoHotcx3pUdULiHp37aBHxY89HZ4rNJ7z+Zz8xo2oLijME3jP/xTi0OrngwEz3eg4uiMPaz0c3MB/J8Eme6HVF/8v2lS7M/Oe2lDrB63R7Eys6DcmbRtlgbR/7Ee7djyX2LRWahxs+xrXvUc9LFba2794Gy8ByunKRVZ1bg233MD+49nnUIe5VIfysSTw95reUvV3LAm82jjImgPpcN751t/Sjr4wORteIrep15C7aP/cOCZyY1WjmjzlI448qIaXw4O26PgpLOexOt5/RnbDCYxrChcWmwYH2OK+3uDSU0D6WUHhHDTMJhIbGF+Hnz7s2cqL6jbyCyNp613M46jKCJhyNeMlgFElBadl1bjjV0EeRcCkmfE1KUVUHhSGDvDCnD/km9A/K7lw0Z/rWCU6/UcmKMn64YNHIfEXEN0IDx6uJ1ky63tX5xFoaju6tuajPTQE5V9s2MaCpLvkBat0g/Ia9WlyVZvNEHUnss6WgZqptbiJ8cenFqncY7DnIVSV+zULsPLY1VXTMaWZ21R2LZ0SRImsVHveJ7bf5GpbxGUPpAnLACdZOe/wQG/3IicDEpbckheLz/QE1js2aJc76wo0hquLZZ5CbJ8SBRuYQw5TVISk4JZmUCqYR1wk01y7TH+EiQeZGtiHzP03rmzbSsWguA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR19MB8597.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lWq7OLh1/h8/LbEPZUdaIUULtiTYAIbb44FbUQ+wHr+YYPM5VDrvGborKT?=
 =?iso-8859-1?Q?m3TGwO9mMMOjUb3dwd+EDdKlcpD4Tea2f9TpJbY8Aj/ZX8RMPC2uChMg6P?=
 =?iso-8859-1?Q?Fem75BhkvIsZyU3qkM7njsjIWgDdY9GOTZaiCGsR8Zm7l/6+QlGa0sHNyG?=
 =?iso-8859-1?Q?Pw00h9Tp9bpFWbFbMovr0M4uyZhW09BRzpG+IdtCDfMve+qdWiweYhc/fB?=
 =?iso-8859-1?Q?hMPJrXFt+bIU6rdrtM8Kqkyr7we9TKQWf30rng+xCejNP42puR/cK6Dn4B?=
 =?iso-8859-1?Q?3RHdwEE/iF8l7lYmT0hX1zedRwKqTFwl+n/CKMBlcJrLVALX2MY8WpcNAR?=
 =?iso-8859-1?Q?y6/K+3Z5qEsrIjbwRPWo4KUI20EVTA55yeB+ec5i7SLHXk5BnpmRxeOVUs?=
 =?iso-8859-1?Q?ddSti+XPFbh/N12Rta5Dm3ruCiy3JO7i+25+jDoOcAUjhGjxtsS12vTdNM?=
 =?iso-8859-1?Q?6xBYWCYwckhBOP959Ct8uJ+bCVG3kQ0R0MJ/KJUdZLfKfe0BKOu8dql8ko?=
 =?iso-8859-1?Q?eleFsSEr3NxlfVlePGiZEvbp3L7q463UKfWp6MTiZrEifP+k167sYYzHT+?=
 =?iso-8859-1?Q?xrNoBmeh0v6RN7hlOFV6CDiGyMNrISe6FxawWA3tnmMJO69q4mBeE2qG87?=
 =?iso-8859-1?Q?bcwnUwm3sZjJ4vDFmj+NNH7YaMCTviemDEK3TZlX2X4/e3YUzemJKRRNWu?=
 =?iso-8859-1?Q?mTdGE8274mK5NuEbvgcELA0FmcIrEJRXMmkK8e1x1NiUe2kIN3eFhxFpTO?=
 =?iso-8859-1?Q?jWmKJskwITl8Gy+0VUEch90LE2AXc9LBeBAdfTjbsmv8NLaWauj7g2iyI2?=
 =?iso-8859-1?Q?qJ4CRn/ukGKj6d+RN/HZKjSbtIOMlCYZK9rAHfZa4OMj2GNW5gJPqEINrt?=
 =?iso-8859-1?Q?HDMxEUWwyCpZDD8xP3mItK4yS0MbirME2dBmbf2vT51iJJlfq9Z3l9+ATi?=
 =?iso-8859-1?Q?rhHn0vaLroXVZQyErIFeE/oB817E7xF+AK0H5ULtTMyXfksL67a3+Drr5/?=
 =?iso-8859-1?Q?sKT7PgRCv4yiI0jGF3pCN1j1slk9geahZBgDidu80carFHoTKN9Q3ybDDu?=
 =?iso-8859-1?Q?XhV1LXoul+eqmVB+poEIbTTUgxkXU1OyXbkfo4ThE5gkszN8e/vquI8E0o?=
 =?iso-8859-1?Q?oRxbTCej1zbKptyJ3UYy76KtIAWuATOJC1vUI7Rjzi4MinVNfAXcwq9197?=
 =?iso-8859-1?Q?eVSlSB4Rq0KafYiJdWs0ODXSazWRtxFm25Wb4bQ09SLCkYLDA4oVndqOf7?=
 =?iso-8859-1?Q?dFOWJhU9mp+23EVLvNzC65HUCissEVBGd4dDg2+AuXfbTbcaVT1uwJODVx?=
 =?iso-8859-1?Q?d39UZ7KtTIC1iRl6duBsqYk4ID5TfSvQnajZY+PU/RRRtNWmc2gCTkDC8Q?=
 =?iso-8859-1?Q?R5QOLBvxk3vRwQ9Y95XIWW05aA6R4WYBNclcglnVrPjZH0vFYwRzmAkId3?=
 =?iso-8859-1?Q?NZ/tai0zwelcUb08e/WIsUgct8ZfENcYkaIhAQce+5N1KxDLN5vsNtV4sv?=
 =?iso-8859-1?Q?Z657QDx+b1Tt5T2DeTOkJUVYsqAdh/geqqSH61hyIlQ8OcrocOfx8cDkvY?=
 =?iso-8859-1?Q?hq9tOFY5vVTUjjllzAWRf4iCw2oKf9I8RITAiuwHD/QUKpc29yQyN5+jqH?=
 =?iso-8859-1?Q?w235BYsU2zO3lsN/MkXwQcMW9xLCGvCHnQ8wIYj40LeCV/P5ec61bo2Qxn?=
 =?iso-8859-1?Q?2TRt1DMwNjSe++rkFZC8N6ifcNpd9HM3sve2R8s4nu8zIKwjle1tdKDIbC?=
 =?iso-8859-1?Q?UZWQRZWJCYdsfTvsgQUPDQT+w=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jqQUoE28a5PQfu33DDYs14OamgcDmKB38kiAS1wFoDQVVfNZInHOD+Bfhl81ZGxxd49kAgJxmXyzWFBlFGPn8DmZ34QGU/uGOCLFymV3remtiT4+9pKqIoUTYfr03tdVS5sBqK6COZOWxjInyfPnKf+gt4+7Oih5po11rOkftWgJdWMMfwpsOJ4FfC66JGzsV2t3mu5TRaral6pKUGXaHtLHOhmavAz8k8z9PYRjnUk16jN6ixKXRbOsbwvvd0hsHXkEIMQ+wvTFGtA9pX9pnqp4qPMPgK+z5HO2aFy5jhgTl12iG73cnQB9YX4IV/hycMMfHE2cNrSuhEYtlFifvQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OPbVZI1wQyngDsqe0oGaK/ud77LSElMedos1Cc4Us59OxSInPXR/pxCszUufCkGpXWk4RU07GdEhuUNeOLyHNgWycYPqWeJTsA6lJBCNasTUdIDTMQwAxaqSh3wcGlxYVsr28nwGZrj0bJCHZ+MYmHwwe1ew7zlLZuoHyvO3UeiZgjBvVVdNCOUpPOrLvlblBIh0ffVJpf+QDm3D4mKFvlXqXtfAJA27wJvQmz5yii5CEaCmzAmsd1IjV7PYP0gY2RzGZhd6ompyQMHkY0i7TXfRjRwc/W+Bd+VX2LSHYuEsdpvEQbrvINV6CdxYIZ99BrvwPEDHeQCa55OBkQSJBMPKhJvwba33fTiPWY+bwV24NnW4UGD7UFV29Le4WpvqHoeOB0T0i8aYech5k9FxU/R/gMsV21gt7GFO8SGmf9ZCpgq1NF85pJVhAcnqoebD+9ve6J+yXvFqTNs4Bk8DAdQ/79cM9Wj6py/8WcBJ3DZbBjDVBlJxKRV/eFyHP5CdOK7NoxbrILAmqsyDSRTeC7QHCz9mlu9IjHKbS0iXr85y/SdXDiPivN97PvsioK3NMul4Ey7YIMED5ReS2cOOhEWqCk5akVyh9oesjLBZQGomt4sF9Z1EyMYhkvLym150
X-OriginatorOrg: issi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR19MB8597.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24a8622-9c6c-4b8a-97d0-08deb555d2b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 03:22:14.4849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6af618fc-4f7d-45f1-a2f2-8c59a26d2c10
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LaC28PW6qC6b3JA0OSYJ+ZsqwGf/iWSAPgZ+LNjrfbjXObuV1iM6vxuTIa1iZLRg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2ABBD2300
X-Proofpoint-ORIG-GUID: nBGl12YaAldZPdy22pcp2cFOlVIaV4dK
X-Authority-Analysis: v=2.4 cv=M8997Sws c=1 sm=1 tr=0 ts=6a0bd76a cx=c_pps
 a=gm+t6+/57aVGIJ5RQ2SxIg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=ozMtBe7fU4EA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yOHNzV93IasTtWdH6Nhn:22 a=vXxuYqdcOO96AszD6dbd:22 a=DUnRZS7UAAAA:8
 a=psuadeYQkFtU_rZ7NxMA:9 a=wPNLvfGTeEIA:10 a=cDzw7mrAGmWHSR5u0tpu:22
X-Proofpoint-GUID: nBGl12YaAldZPdy22pcp2cFOlVIaV4dK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDAzMCBTYWx0ZWRfXzGw/1OBKMOHm
 RYk2l3MOGIgLg6JpNnuH5EbmXSqv7oHcTK8tNBuq2rOJjebG0p0ofDSbQ6ctW79BPd4ybUAj+L/
 j0NkytLpinmaNzxGxAv2SFZO+D9CPa3PSTySUKsA6Ym7edRNIJJ+tgfJTc5LTXYyHShG003kDZt
 g+EzOfNU5/s0S2cujqDsCG+3X22oEQNBKC7SoKIOFu0FlDIy+jJ0nWi15xfdwTnM02XNubRjr20
 R3u5rxrt6/xEJ1JCrCSOaolF97x+y9BRgtBsLvnA5KPMgNAvZT32zTzFbyb4id/gXM8+Bf3xofE
 WzQorakzJeVliUK0gC3SAvf7N/RNaw1llBz+sbkakG9FC+XTUzj81MPE7iSEC4N4JPaCZwfE9CW
 v7cnKYlz8sPHuOh//wiOrOfK8z3/Ff0HZiVXe0uPKkAX8+HDn7M06rBVTud/jrXCqk+TMJab3QS
 ihyN6P7FF8G7Vth/NAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_202251_901176_D028F0AB 
X-CRM114-Status: GOOD (  11.20  )
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
 devices.

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
 drivers/mtd/spi-nor/issi.c | 322 +++++++++++++++++++++++++++++++++++++
 1 file changed, 322 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/issi.c

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
new file mode 100644
index 000000000000..13c06d207864
--- /dev/null
+++ b/drivers/mtd/spi-nor/issi.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+#define SPINOR_OP_IS_DTR_RD    0xfd    /* Fast Read opcode in DTR mode */
+#define SPINOR_OP_IS_RD_ANY_REG        0x85    /* Read volatile register */
+#define SPINOR_OP_IS_WR_ANY_REG        0x81    /* Write volatile register */
+#define SPINOR_REG_IS_CFR0V    0x00    /* For setting octal DTR mode */
+#define SPINOR_REG_IS_CFR1V    0x01    /* For setting dummy cycles */
+#define SPINOR_IS_OCT_DTR      0xe7    /* Enable Octal DTR. */
+#define SPINOR_IS_EXSPI                0xff    /* Enable Extended SPI (default) */
+
+static int spi_nor_issi_phy_enable(struct spi_nor *nor)
+{
+       struct spi_mem_op op;
+       u8 *buf = nor->bouncebuf;
+       int ret;
+
+       ret = spi_nor_write_enable(nor);
+       if (ret)
+               goto ret;
+
+       buf[0] = SPINOR_IS_EXSPI;
+
+       op = (struct spi_mem_op)
+               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+                          SPI_MEM_OP_ADDR(4, SPINOR_REG_IS_CFR0V, 1),
+                          SPI_MEM_OP_NO_DUMMY,
+                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+       spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_1_1_1);
+
+       ret = spi_mem_exec_op(nor->spimem, &op);
+       if (ret)
+               goto ret;
+
+       nor->spimem->spi->controller->flags |= SPI_CONTROLLER_SDR_PHY;
+       /* Read flash ID to make sure the switch was successful. */
+       op = (struct spi_mem_op)
+               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+                          SPI_MEM_OP_NO_ADDR,
+                          SPI_MEM_OP_DUMMY(0, 1),
+                          SPI_MEM_OP_DATA_IN(nor->info->id->len, buf, 1));
+
+       spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_1_1_1);
+
+       ret = spi_mem_exec_op(nor->spimem, &op);
+       if (ret)
+               goto ret;
+
+       if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
+               goto ret;
+
+       return 0;
+ret:
+       nor->spimem->spi->controller->flags &= ~SPI_CONTROLLER_SDR_PHY;
+       return 0;
+}
+static int spi_nor_issi_octal_dtr_enable(struct spi_nor *nor, bool enable)
+{
+       struct spi_mem_op op;
+       u8 *buf = nor->bouncebuf;
+       int ret;
+
+       if (enable) {
+               /* Use 20 dummy cycles for memory array reads. */
+               ret = spi_nor_write_enable(nor);
+               if (ret)
+                       return ret;
+
+               *buf = 20;
+               op = (struct spi_mem_op)
+                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+                                  SPI_MEM_OP_ADDR(3, SPINOR_REG_IS_CFR1V, 1),
+                                  SPI_MEM_OP_NO_DUMMY,
+                                  SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+               ret = spi_mem_exec_op(nor->spimem, &op);
+               if (ret)
+                       return ret;
+
+               ret = spi_nor_wait_till_ready(nor);
+               if (ret)
+                       return ret;
+       }
+
+       ret = spi_nor_write_enable(nor);
+       if (ret)
+               return ret;
+
+       if (enable)
+               *buf = SPINOR_IS_OCT_DTR;
+       else
+               *buf = SPINOR_IS_EXSPI;
+
+       op = (struct spi_mem_op)
+               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
+                          SPI_MEM_OP_ADDR(enable ? 3 : 4,
+                                          SPINOR_REG_IS_CFR0V, 1),
+                          SPI_MEM_OP_NO_DUMMY,
+                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
+
+       if (!enable)
+               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+       ret = spi_mem_exec_op(nor->spimem, &op);
+       if (ret)
+               return ret;
+
+       if ((nor->flags & SNOR_F_HAS_STACKED) && nor->spimem->spi->cs_index_mask == 1)
+               return 0;
+
+       /* Read flash ID to make sure the switch was successful. */
+       op = (struct spi_mem_op)
+               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+                          SPI_MEM_OP_NO_ADDR,
+                          SPI_MEM_OP_DUMMY(enable ? 8 : 0, 1),
+                          SPI_MEM_OP_DATA_IN(round_up(nor->info->id->len, 2),
+                                             buf, 1));
+
+       if (enable)
+               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+       ret = spi_mem_exec_op(nor->spimem, &op);
+       if (ret)
+               return ret;
+
+       if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
+               return -EINVAL;
+
+       return 0;
+}
+
+static int is25wx256_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
+{
+       int ret;
+
+       ret = spi_nor_write_enable(nor);
+       if (ret)
+               return ret;
+
+       ret = spi_nor_set_4byte_addr_mode(nor, enable);
+       if (ret)
+               return ret;
+
+       return spi_nor_write_disable(nor);
+}
+
+static void is25wx256_default_init(struct spi_nor *nor)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+       params->set_octal_dtr = spi_nor_issi_octal_dtr_enable;
+       params->set_4byte_addr_mode = is25wx256_set_4byte_addr_mode;
+       params->phy_enable = spi_nor_issi_phy_enable;
+}
+
+static int is25wx256_post_sfdp_fixup(struct spi_nor *nor)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+       /* Set the Fast Read settings. */
+       params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
+       spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
+                                 0, 20, SPINOR_OP_IS_DTR_RD,
+                                 SNOR_PROTO_8_8_8_DTR);
+
+       nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
+       params->rdsr_dummy = 8;
+       params->rdsr_addr_nbytes = 0;
+
+       /*
+        * The BFPT quad enable field is set to a reserved value so the quad
+        * enable function is ignored by spi_nor_parse_bfpt(). Make sure we
+        * disable it.
+        */
+       params->quad_enable = NULL;
+
+       return 0;
+}
+
+static struct spi_nor_fixups is25wx256_fixups = {
+       .default_init = is25wx256_default_init,
+       .post_sfdp = is25wx256_post_sfdp_fixup,
+};
+
+static int
+is25lp256_post_bfpt_fixups(struct spi_nor *nor,
+                          const struct sfdp_parameter_header *bfpt_header,
+                          const struct sfdp_bfpt *bfpt)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+       /*
+        * IS25LP256 supports 4B opcodes, but the BFPT advertises
+        * BFPT_DWORD1_ADDRESS_BYTES_3_ONLY.
+        * Overwrite the number of address bytes advertised by the BFPT.
+        */
+       if ((bfpt->dwords[SFDP_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
+               BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
+               params->addr_nbytes = 4;
+
+       return 0;
+}
+
+static const struct spi_nor_fixups is25lp256_fixups = {
+       .post_bfpt = is25lp256_post_bfpt_fixups,
+};
+
+static int pm25lv_nor_late_init(struct spi_nor *nor)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+       struct spi_nor_erase_map *map = &params->erase_map;
+       int i;
+
+       /* The PM25LV series has a different 4k sector erase opcode */
+       for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++)
+               if (map->erase_type[i].size == 4096)
+                       map->erase_type[i].opcode = SPINOR_OP_BE_4K_PMC;
+
+       return 0;
+}
+
+static const struct spi_nor_fixups pm25lv_nor_fixups = {
+       .late_init = pm25lv_nor_late_init,
+};
+
+static const struct flash_info issi_nor_parts[] = {
+       /* ISSI */
+       {
+               .id = SNOR_ID(0x9d, 0x5b, 0x19),
+               .name = "is25wx256",
+               .size = SZ_256M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_BP3_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+                          SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+               .fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+               .mfr_flags = USE_FSR,
+               .fixups = &is25wx256_fixups,
+       }, {
+               .id = SNOR_ID(0x9d, 0x5a, 0x19),
+               .name = "is25lx256",
+               .size = SZ_256M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_BP3_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+                          SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+               .fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+               .mfr_flags = USE_FSR,
+               .fixups = &is25wx256_fixups,
+       }, {
+               .id = SNOR_ID(0x9d, 0x5b, 0x1a),
+               .name = "is25wx512m",
+               .size = SZ_512M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_BP3_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+                          SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+               .fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+               .mfr_flags = USE_FSR,
+               .fixups = &is25wx256_fixups,
+       }, {
+	       .id = SNOR_ID(0x9d, 0x5a, 0x1a),
+	       .name = "is25lx512m",
+               .size = SZ_512M,
+               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+                               SPI_NOR_BP3_SR_BIT6,
+               .no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_READ |
+                          SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+               .fixup_flags = SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
+               .mfr_flags = USE_FSR,
+               .fixups = &is25wx256_fixups,
+       }, {
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
+       }, {
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
+       }
+};
+
+static void issi_nor_default_init(struct spi_nor *nor)
+{
+       struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+       nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+       params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+}
+
+static const struct spi_nor_fixups issi_fixups = {
+       .default_init = issi_nor_default_init,
+};
+
+const struct spi_nor_manufacturer spi_nor_issi = {
+       .name = "issi",
+       .parts = issi_nor_parts,
+       .nparts = ARRAY_SIZE(issi_nor_parts),
+       .fixups = &issi_fixups,
+};
-- 
2.43.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
