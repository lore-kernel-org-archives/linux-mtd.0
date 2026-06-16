Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0DDCD98DA
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2026 00:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NCEzxSrD0BacbGU/5GZLQYulR1maOsJOPiteaLcTpjo=; b=xEdjtLixh8BWPs
	dAReIohDC5V32051HRdmHQ6H+RD2QNengxz/aQXtjCncUXv0iY2w2fokyI3CMFdsJOeany4r38opl
	gnfdza98F5j0snaWxQXfYaPiyIafJu4dTJCubg/5NKlEK/cghkG5DHkN6whDI71m8pdURbiGjwfSG
	f52wCiE3hpSErhM8X8e1X7r0/JfR9EHa8qDAzbsLltO0i92KjhOHvN0zaZjnEdSTLqn1GFox59Qy7
	E3cR/RaRBalzrvJF1f66h/TrN4kiAxKxDvb5s92Q1pQyfk/OpZJaoz10VVG73fXrrb3+9Po3+esSG
	3s3iEgHFSsCjwxUVuwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZI7f-0000000F2XS-3js8;
	Tue, 16 Jun 2026 00:57:47 +0000
Received: from mx0a-009ae801.pphosted.com ([208.56.8.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZI7d-0000000F2Wi-1tS5
	for linux-mtd@lists.infradead.org;
	Tue, 16 Jun 2026 00:57:47 +0000
Received: from pps.filterd (m0495959.ppops.net [127.0.0.1])
	by mx0a-009ae801.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0RVR63719687;
	Tue, 16 Jun 2026 08:57:14 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=11242025; bh=aZeK9QuHztDF+XTqJEHkgTe
	mnNHWp8vOMbUDmfMGlro=; b=I4iwQ2xt1/4zihIexf/A5SNdh3jObl4prtmabSz
	TLgXafmXNm8ZIqMI7m61ulqp/vRkqLPCMFfzMI3tOWwtq420VePUAvol8D+IcTqF
	NTw/HtqdmiI7TLFDxYRRHVE5F99fQVXN53yN0tZAMY/GPcsahcBXMY9tGRPh7vHa
	poHxlPqsY/JaKAVrPNwo1uI1E6+5FeZ+4TdtwRvfCue9lImcU5RYEJ1CBrGXXda+
	v6Pvs34egerN6Emwit//Q3v/GcCfKq7ZjrGyCujrPP0AKTTNRD5DqEznEBvkeCcf
	B49Irn5s7/vowaeZWpDzlek3Bx2ZOQsCkO+UK+Ret0+TdvQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022121.outbound.protection.outlook.com [40.107.209.121])
	by mx0a-009ae801.pphosted.com (PPS) with ESMTPS id 4ese9q19g7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 08:57:14 +0800 (WST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOM7Dwtshqb4fRp3wlKL/W0Pl85yKLnFnk1du2p72T0qu2M33vsTqj91W3z3UswF1k9GpQokC7Mlk6bzahcMu1G0IS6I8+JwYAgj7I9wileSTTUgIMPOtpgq5lbRZrbHdNuSs7FID1TsY0Lgx7R5peGJgOWB8A4OVz6cTmowHDGvNjTLPR8vZKTofblfE66WIreCFuuNzLu2bfterhLgsJKGq3vyRh7jyPulcVgvQBy/0l7bLMFs0ERTHtOTJLxP7mS8n0bBvrXqAOB7C9vAX/JMBY/4uafv/NMKNLClfh9iLR3heX/w+qBSO6wePbEGPXNjARhLezmtNAtn7Q+CZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZeK9QuHztDF+XTqJEHkgTemnNHWp8vOMbUDmfMGlro=;
 b=bFu5qFcooXH9Mnp0jPTTO/mc6BfNCpShOdDHXoVZEbX1n0kllpmQEQd9zLNMFj7dSSsw4eJKTpIYrEWMLk+mUFr5t1vSLKfTNyPbiIP8D5pxa1c8/sK9bTMXe6QFn0Qo99DeoMoCpuuwUZ19krZ8eYVKLeWQbdwIA/c6oJH3XcpvNiXl5kVgK4HLrd5dzp1uT3bmXBsTqKsfQ/GdNa2kNupWhbO/XmXOF66RYIOzKgE7D48ZM1JWO8k1ovm6vi14YI4mC0ru446/2lWS1ygfRIxLAoc/inrWR3qPGOnseqI6zqBZAhzHblQ5rPjtLEPKkj6AK2sC7opxnEosd6LgCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=issi.com; dmarc=pass action=none header.from=issi.com;
 dkim=pass header.d=issi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=issi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZeK9QuHztDF+XTqJEHkgTemnNHWp8vOMbUDmfMGlro=;
 b=yC2Jv0sut6hTi6VLbY7ARfsDA+4ES+iff/qhrypTV7uUz1xNlJlIUGiraCP9qihXTDTtnX//HIJsazSbUn073ybg9FvfJGqo38v39zigtVcADMnAXDt3+hJbB88iek4NhFlEHZ+wWyMmWsgC5mX/iwncPUgY4im/chIuv3+bTWw=
Received: from LV8PR19MB8597.namprd19.prod.outlook.com (2603:10b6:408:25c::15)
 by DM6PR19MB3961.namprd19.prod.outlook.com (2603:10b6:5:240::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 00:57:12 +0000
Received: from LV8PR19MB8597.namprd19.prod.outlook.com
 ([fe80::d035:5ff:4546:5713]) by LV8PR19MB8597.namprd19.prod.outlook.com
 ([fe80::d035:5ff:4546:5713%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 00:57:11 +0000
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
 devices. (QSPI 2026)
Thread-Topic: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
 devices. (QSPI 2026)
Thread-Index: AQHc/SqMgoG1lROqPkWxx9Iganm8LA==
Date: Tue, 16 Jun 2026 00:57:11 +0000
Message-ID: <LV8PR19MB859774B7DC38FD61F20E0F63B6E52@LV8PR19MB8597.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV8PR19MB8597:EE_|DM6PR19MB3961:EE_
x-ms-office365-filtering-correlation-id: 11bcd041-94c0-4d88-75fd-08decb4232f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|13003099007|18002099003|38070700021;
x-microsoft-antispam-message-info: 40U5yZCWYURJYV3oFonk/CWzK+w/e1aUQcSVDxG8iPP7rC4bMrp3kyFPdEqG8E6dNXG2y1vbCSwy1ABeQwkvVDg29sknd+UXtjGSnpP/+4q3InUYlDjlgSXfRXEXh3qDcSNBKxOAsoMzaFZu1kF7gVbGhMzufH5yPXdNnj3IkjAQVL/rcZVEF5/S5xs5ZGqOHb2LHEN1EX7RfCcCj6MEgLYMxar8O+RwU8UiY2RB7MqA4hz5wVF/M7PBP3+7u/eKlVfHDUT7yt2+9tUY225PV15jR7DPPTLGOXdj6gsMosDlUShxJKIGi/eHETsUC4aTIIMfPNwwh1gGO3dv+6ZV/x1MoCJMbTf6+8wGyjdhRYRinaboepYU+3czYZ68iXQWy4BG57uTspGz+lfHa1XN+923MxrNQ02pG+gIl6U6CqNgvL/hlGDEIw8Nwol4WgF19d81jxjlX+Z8lRq7JL51Fq62pxknCaQDER0u2IT+sFD1T/znMsBIJyRBIDZ3EOtsqbJpEiXkAmgH+pROxrZeynRv2LfD9wVboHWFKLFQvXuRBcteFAwqyYNdUXnn8FS85cIJgtYAP/mcZ0pB8LFKQ+bnnJJNSxttiXUhf+NwEGkk8wiyXaWl1O/tmU7pFF7ZM06kjILcOEX7eSGlRif0ryI4tK7SkaA6HOu/IKYDMC91OXTNCx3CrP9p1P3mgxDwlF4C2shDjXrX8PxwdchmCQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR19MB8597.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(13003099007)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HWN3k4Cj4wovV2b0QOqvWmud08gJKJHzbrwO6vb1NqTsuXmiAmP3H29SS3?=
 =?iso-8859-1?Q?iSc9MZ+5BSJvRlGy1SUAp7lplKf5wbljeMCW51lVXGF+HdbzHASUDWpFoR?=
 =?iso-8859-1?Q?G5dCPSD87GO4TzkMQ+DMO6y1j1k2Gn50naFECzdRBjUeVTEzoo7Hu0k13s?=
 =?iso-8859-1?Q?vCWwRZuO0KEL4MJNupxHh/zceZEvOvDh+4v6I3ICS9FEVCsQ3Gz4twsMB+?=
 =?iso-8859-1?Q?OsiPmSrr0/oPqcmf2Xkb61rVLlo6sNHXmNxmG/kPTBxhyHSgvW/gBLmmzc?=
 =?iso-8859-1?Q?/tFHrtgIgLxv3MhxKsA8xMEoORziN2K9LVky4IJxCNIImtujt9VTtcuFAk?=
 =?iso-8859-1?Q?GtMAyLIyaFKt6kwb5GIze41ir+pdgvKoyG3/6NJctL3WVieU3oQ0m+9w4v?=
 =?iso-8859-1?Q?YudC61xwH5USyHonXADiodSHwPuS1YsUcF47jVDk0yfp5Vf2kFGstQSAdZ?=
 =?iso-8859-1?Q?YjERX3VcgtANGMotSsqL6STmshHVzhEFQ7hBUIngidcFwOYzSxxlsXnzO+?=
 =?iso-8859-1?Q?XsFBinw5KbHQNswarMHaECBdxPFWvJ6eRILO8lZQe33tK57Hnoo2ItfTPf?=
 =?iso-8859-1?Q?0n2UxoGIE0EqA1tnpaEiH271+Ewthzm8PteiTxX2/DeR1tPjqFHTN1EJFB?=
 =?iso-8859-1?Q?T8unXnfdb/oOrxqFJbm/f+XQGd1EeZBe3j9s9mTYXVslacQnuBE1CPCki9?=
 =?iso-8859-1?Q?mAy91iBYe+9eDr4s8ECRg8Obdb7CxDtSIMan25UndhpGH5UYOrzBZNcrY2?=
 =?iso-8859-1?Q?ncqPOyJZlaGCQf8EIDYZAOexv4p8Ry5PNKUp6TnYVpmheubDaRO1RF6hC7?=
 =?iso-8859-1?Q?cQHeTc4r6xoP9peqsS7xVszO41F64uzW9+OjnJS5VdWT4Xvv0LFAIfOQOV?=
 =?iso-8859-1?Q?jo3wWCXuW8VQXrdPQLXDIk3+Lnb1A4d5wLlr92MVJaebmYHrOugEp0ajx4?=
 =?iso-8859-1?Q?fdnbcklcgit/s8j3MTcDzzplo8StoMN/Xarkz5/ZGoHt1hdFWYeqXv6T7O?=
 =?iso-8859-1?Q?Ob98EMpaLaQd4Qd6jlRZCNOxtN5Hp32Pct7xACHkh2jlDzC1pVvIUA56q0?=
 =?iso-8859-1?Q?+x87a4lb/8QzUdCC6jSBUzHydOarAq4MxsOMU80o1anOKlbBV9NUFydfZU?=
 =?iso-8859-1?Q?ADJye8A9CwSQ8YiJqUEsIzIcK9APeU8bY08HAhfCf9J2aN8dCGLAL3LgWu?=
 =?iso-8859-1?Q?uE1EAwzgj5jYmi4RpQ6UNds6LT2hvTOHnO5sLqU0hWFN9i2esR+ck/kVM3?=
 =?iso-8859-1?Q?qVgA5JCC6W856bWaIAdLjP3qk9WNtDeqQqCR4CtrVqTD68KLE7DVJU9RPU?=
 =?iso-8859-1?Q?nZSCdADONSqiJisKaYbyT6CvOCRYnilqL6qRJebuD/e5J3YtYDZCQ9YwLA?=
 =?iso-8859-1?Q?WN8mcqzZHNqB8KlgNUtUMM/iBB5T/Tbnh3j5JLxgCT5QKYYr/+4kG3NbC9?=
 =?iso-8859-1?Q?gi1uHUg89bXpN74IVOqJy/+f6D9FdKHaJTKx5Bj5hVJuzQuc0SjKfQG7+a?=
 =?iso-8859-1?Q?6Qct2y6Uw+SUGprp8pUFD0B/CP6Mklmw3WqP/YVJQt69MYvwOBSPRnUByb?=
 =?iso-8859-1?Q?6LKLXzdDiyOG5sryEuYPoAc+HjppyDoJaxeMefIXl/6iT8mdM4xNjsfOaw?=
 =?iso-8859-1?Q?0RrOm6CkPmyD57TpZvxd4G69JEJcidaa3KPEFDa90RmITAVYv26gJVPBT8?=
 =?iso-8859-1?Q?wiBokV5NlNuEdjB5syEl1f+w73ZZQH/1VCRGiogFGK5BVuaMNfVa9T4bB2?=
 =?iso-8859-1?Q?3TmoiCkErkLX0IX/OfuMxmqd4=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CywXUh7hEUTQTeie8QJb3c+ty2nqiV17evmnN2nhIgJjVQMzhXgSrAcROi6tGjf2Pmff7BkYDEQ1CwQkjaFJK4CiUAbfSGPHdPZpJQoQDAZzdlCxXQOccfrl8wD0BRgpMWQ7y/BOvf941wczLUdjTDanz7+kobbda2IiaQ+kJrL0UC7Mzwbc4dc8+KUDPoMXVfc80EaaORObjyu1lbi4/PNdmVkXo3WSDuR89/z2Ws9t93MBoVGqHIRm/IwABi1kfgTQMHIgG3JtYW5lXOnKaMjfo+qUc0NllPvzwwyLvGVVjp1/iLZCQewWVegCblsrAHPv2LJH4Y6BXNvKWem9FA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: W16dkz61J2MwofJzv1zTbpmnEwRITPKYrb2abQWek/PyRObfJ4eWO3orLcgxsIpTK1HZdC3oz4ZRIyDEX4Wb1diwbqorEXMpwjYrQmZByTUZ79Lx0q+2SDaybRtWIaD+gN6QF69h9dLKCB4otKaIo+57/OuafXDWrz8Zr87JftvPondaI3OD9cqlMVpSuFldrJQbJkL93e79YfjaDSxqv0WiYDvljQq7w2x19GIOFyRe/sB1TC1stkWrcwJrBp60En4zFbLR4fH9BT6zAmN6dWeewEZmNv3GOjbesSAZhrcd2WYFtzfolvIkZns0g3h2aDpLuhKso6WmSJy5G9nG1YARBsmaLoAOBXbV0905urixd8RiZ8i/55jV+qORGkr3KapOVsabAJLm27MbejgzempAxajGvPVsNyrD8A3KlPJcfw2VIaXkhK+dSowlw30vVxW306VH0CnhduKa8zHteM7scHrpSxahTLfJLuLyC5iKNzhF+VbdagGqI42w3u4QkMe2QDBmtSF4tx9XL0+yP6BhcRqRASDY1GMSTABpvseq95qg9iDpVqVlc0cW/O/Q/y722OSLsN43u0SFAC15LxXjN5t+BTpxb0RKKTOD/L3Ge9tUq3b8Z25NmI8zDvpo
X-OriginatorOrg: issi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV8PR19MB8597.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bcd041-94c0-4d88-75fd-08decb4232f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 00:57:11.5657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6af618fc-4f7d-45f1-a2f2-8c59a26d2c10
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RYvC3RNFHE3NEI/JglhQn8CRGqSAFM5ofdg/9jqVgzmsZLvHCpDjrdHlUGTAz7vm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3961
X-Authority-Analysis: v=2.4 cv=Q57iJY2a c=1 sm=1 tr=0 ts=6a309f6a cx=c_pps
 a=lgq80kZn4F/3L5fHRNAplQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=ozMtBe7fU4EA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yOHNzV93IasTtWdH6Nhn:22 a=vXxuYqdcOO96AszD6dbd:22 a=DUnRZS7UAAAA:8
 a=-oL4l1WM4B0EDLcbjnkA:9 a=wPNLvfGTeEIA:10 a=cDzw7mrAGmWHSR5u0tpu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfXzr43fDGjgAUd
 lNsXj5hq/C2fXjwZYLuTWFaRWxPE1rZoDlEI/yHCYjwynGpDPevLqLt5hSG808iBIszBtcstGQQ
 xjGGnKWVNAiiviDbxB6A8S3RqkC48gfXJ0AUqNXCEoOLYlaFC4JtCQ0Zljt9e56KuNRZIoOcyt+
 L0RTZbgsgcAM5ZrlErTuU/QH1ILf3uqSZJYKRbc96gbpGp20uGKUdwIm1f5Agz9tJ+oiYZqfQ28
 3Y6JHWX7uHacdc+QjtsgTLQsH2J46nNq7JgAN3Ad2KF4XP9Me5wyyCKVIuFs38oBDiY/PkAb6W9
 tnT3KOujc+yKUTD8eOSizS7F+/wbU+PiUZuAuNMsn9+baLT86Jl7Ia6vkCEUBfHtdKL5UR5rCNq
 asvUyEnQ3cz57hGN4+jYr7gCUC+1D/k2txWR/XimKj4Qa6Ln0UnnCVAYLNBbQ/PH0N+vSJ+XKIu
 O0RtMGvz3TECiMUvSTA==
X-Proofpoint-ORIG-GUID: WgIJu4Su4zi0kHdk9QyK20w7xh1Sb0X7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwNiBTYWx0ZWRfX687ZBn76gutY
 GbPv7My5dfYspa4p/SDVxOEcauV3dF0xBzAxfmRh1f3ly68ynxJS4RfzKSKhcNVtCG3ry/T4gcA
 UQBV57Q+EjOJ9GxLPOEpBc1auE8ESp4=
X-Proofpoint-GUID: WgIJu4Su4zi0kHdk9QyK20w7xh1Sb0X7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_175745_513916_0A1FC4F9 
X-CRM114-Status: UNSURE (   7.81  )
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
 devices. (QSPI 2026)

These parts previously not yet supported.
With these entries, Linux software can match the device by JEDEC ID
and use the existing ISSI SPI-NOR device handling.

Newly added devices include:
 - IS25LP010E   (JEDEC 0x9d4011)
    https://www.issi.com/WW/pdf/25LP-WP040E-020E-010E-512E-025E.pdf
  - IS25LP020E   (JEDEC 0x9d4012)
    https://www.issi.com/WW/pdf/25LP-WP040E-020E-010E-512E-025E.pdf
  - IS25LP040E   (JEDEC 0x9d4013)
    https://www.issi.com/WW/pdf/25LP-WP040E-020E-010E-512E-025E.pdf
  - IS25WP020E   (JEDEC 0x9d7012)
    https://www.issi.com/WW/pdf/25LP-WP040E-020E-010E-512E-025E.pdf
  - IS25WP040E   (JEDEC 0x9d7013)
    https://www.issi.com/WW/pdf/25LP-WP040E-020E-010E-512E-025E.pdf
  - IS25WJ032F  (JEDEC 0x9d7016)
    https://www.issi.com/WW/pdf/25WJ032F.pdf
  - IS25WJ064F  (JEDEC 0x9d7117)
    https://www.issi.com/WW/pdf/25WJ064F.pdf
  - IS25WJ128F   (JEDEC 0x9d7118)
    https://www.issi.com/WW/pdf/25WJ128F.pdf
  - IS25LP512MJ  (JEDEC 0x9d6020)
    https://www.issi.com/WW/pdf/25LP-WP512MJ.pdf
  - IS25WP512MJ  (JEDEC 0x9d7020)
    https://www.issi.com/WW/pdf/25LP-WP512MJ.pdf
  - IS25LP01GJ   (JEDEC 0x9d6021)
    https://www.issi.com/WW/pdf/25LP-WP01GJ.pdf
  - IS25LP01GG   (JEDEC 0x9d6021)
    https://www.issi.com/WW/pdf/25LP-WP01GG.pdf
  - IS25WP01GJ   (JEDEC 0x9d7021)
    https://www.issi.com/WW/pdf/25LP-WP01GJ.pdf
  - IS25WP01GG   (JEDEC 0x9d7021)
    https://www.issi.com/WW/pdf/25LP-WP01GG.pdf
  - IS25LP02GJ   (JEDEC 0x9d6022)
    https://www.issi.com/WW/pdf/25LP-WP02GJ.pdf
  - IS25WP02GJ   (JEDEC 0x9d7022)
    https://www.issi.com/WW/pdf/25LP-WP02GJ.pdf
  - IS25LP02GG   (JEDEC 0x9d6022)
    https://www.issi.com/WW/pdf/25LP-WP02GG.pdf
  - IS25WP02GG   (JEDEC 0x9d7022)
    https://www.issi.com/WW/pdf/25LP-WP02GG.pdf

Signed-off-by: Jeffrey Y <jeyu@issi.com>
---
 drivers/mtd/spi-nor/issi.c | 138 +++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 18d9a00aa22e..a39c254a8a76 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -126,6 +126,144 @@ static const struct flash_info issi_nor_parts[] = {
 		.flags = SPI_NOR_QUAD_PP,
 		.fixups = &is25lp256_fixups,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x40, 0x11),
+		.name = "is25lp010e",
+		.size = SZ_1M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x40, 0x12),
+		.name = "is25lp020e",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x40, 0x13),
+		.name = "is25lp040e",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x12),
+		.name = "is25wp020e",
+		.size = SZ_2M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x13),
+		.name = "is25wp040e",
+		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x16),
+		.name = "is25wj032f",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x71, 0x17),
+		.name = "is25wj064f",
+		.size = SZ_64,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x71, 0x18),
+		.name = "is25wj128f",
+		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x20),
+		.name = "is25lp512mj",
+		.size = SZ_512M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x20),
+		.name = "is25wp512mj",
+		.size = SZ_512M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x21),
+		.name = "is25lp01gj",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x21),
+		.name = "is25lp01gg",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x21),
+		.name = "is25wp01gj",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x21),
+		.name = "is25wp01gg",
+		.size = SZ_1G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x22),
+		.name = "is25lp02gj",
+		.size = SZ_2G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x22),
+		.name = "is25wp02gj",
+		.size = SZ_2G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0x9d, 0x60, 0x22),
+		.name = "is25lp02gg",
+		.size = SZ_2G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+				SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+	}, {
+		.id = SNOR_ID(0x9d, 0x70, 0x22),
+		.name = "is25wp02gg",
+		.size = SZ_2G,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+					SPI_NOR_TB_SR_BIT6,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
 	}
 };
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
