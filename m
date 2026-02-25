Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE0FEFD23D
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Feb 2026 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stlU5b9ZzE4I1Yr+s7Vq1u9FQgBNNQFKtmIeOXH8pxg=; b=Q98xRCYFgIDzZcucJ4XGYVWQbt
	pw5PjbxthcD9DcnTwkh/FlUVWCGhpiQJLHeoSKhZeXWvaNcWf7TY5wlGBKPtMqEmcxw1tRN2n9dJK
	yT2Jiz4umnV2lRyzNq2YEBbUk3CYELJnhnpvhOpBy0hFVubqUFbCnnXGSq0ISqgu9qE/WNIdLa49r
	Qj2LIzng6shzxMF45L4SMBm5a4tSgHeYTbaaLMD15qxnGIMOFz+Mx1siLiGXiVObpDaq3P2WSJfMf
	ffwrBrNHNxS7wcOyysSJG4CoZ52lMIhVa30zlAPYV5j8TLXahp1m42LUG/JzztMUCkFxedROSEiQn
	7r4tlhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCA8-00000003msE-249o;
	Wed, 25 Feb 2026 10:30:36 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCA6-00000003mrc-1RwL
	for linux-mtd@lists.infradead.org;
	Wed, 25 Feb 2026 10:30:35 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9wZFX369440;
	Wed, 25 Feb 2026 10:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LbvAigtPVgpUKYth/lpL56qGGjx/iovFxiw7Kom+JLE=; b=
	a5JH3CuTEfReY8OXKgSOy2yfQUgcq2joC/CjP4kTWdPgWswmDJppUNnfpPjGg0zJ
	K2DQvDy5tMfNiMLWjlo/jzjYtflrKNfuHssnHSMO1opn9+S95XysdmPRn1JHAiL4
	DiACwTFIewLBz3wRrlxUHscYavY/JSkvHPaULR9Hk9g76ru6q+/9oRKBUZesvNl3
	mkRM9Jt2KBXrFYjaW++SC7+c6lvPQxA51D0Zr3sSAqvs2DXD/hbnrrlIJmXcq9q3
	dqvXMwq8kgU4rq4yS9hraBemgAdi23Dk33xoATR7V++dU2DMXeaHKv0RDPHgXRbA
	t1FfuT2+WSbRINQ4Xmb3Cw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cf4k5wth5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 10:30:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61PATlaa015809;
	Wed, 25 Feb 2026 10:30:19 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010046.outbound.protection.outlook.com [40.93.198.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cf35b5um4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Feb 2026 10:30:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDKS0TG6xd3OBoEhCwO2ZVEjLdv64mTbCjL7b/DQl9K3RRedXB968chtP9NgFhpb78MtO5PfMK8CORKEoxfk+cBP7a5uZXYjSjYAjbfcY+rxXexUOpCT9L6bD3D/QmlyIH8iBl5SR52j2+3b1c4ApOBKu1hrwETF/+dRhNPY2PtO24kjge9UONVFyG2bsW6OkZKlnMSIZ6zFALl4LzQ+VDBzm1mRzhligfWnR+ecWLcLCCVRE03bs48w99Bb4juCwIraUqKqaBm86GRMTj17SKgFcIKtE7fQF7ZgUyw4iA1vlHWdfxnMqu4uG1yaA+OgcT/QcG/D23ZKwTTYBeBLZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbvAigtPVgpUKYth/lpL56qGGjx/iovFxiw7Kom+JLE=;
 b=CJedSG31JZ4BJvBTPw7Gec9MBf/9GwO0tb6nEaYdDs+Zs8IACIim12gjKeIyS+5AMtTVDuabsgVcMOlamMXSev+9JAhmcGEZ/319d2CxJeeJtFKb4v77lpYFn0UTDUVke+ezrQoGDS0KF9e1rv34Oki89ActItK9nu4ITFJThMIFAU4fDo3ydL0nVk5/9wG0kdz+jfr4WFqIBHHnaSye+ceax22lyyL9xRPDqnw5uf+B+2l/lo0A0MO2MoUCvgcNN377PjRMhMG8UYD7nCIVOYPHf2GA0YJ+Pd5ezdRfCTKrqq3Mz9NwXmM0Wa6jw+iaYEk4efQhY4ItzwmegYyqJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbvAigtPVgpUKYth/lpL56qGGjx/iovFxiw7Kom+JLE=;
 b=WBOLkUyU5J48GCGx7RswLvvCg2ld8a2yY1gam3+CsAP892IECQf16FkzhrcZ5FIBhV3Wr7R1D0xJOyXssj6tsq96hOi5nipF0NkiOGu47VoyJJSIP28obN71lMbsD5Zj0+EyUej1CIuPa0y26mmKHKXqk//XTTJI+waWQo/KRYM=
Received: from BLAPR10MB5315.namprd10.prod.outlook.com (2603:10b6:208:324::8)
 by SJ2PR10MB7759.namprd10.prod.outlook.com (2603:10b6:a03:578::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 10:30:14 +0000
Received: from BLAPR10MB5315.namprd10.prod.outlook.com
 ([fe80::b110:3df0:e927:dd53]) by BLAPR10MB5315.namprd10.prod.outlook.com
 ([fe80::b110:3df0:e927:dd53%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:30:14 +0000
Message-ID: <0e75b0df-2134-4698-84bb-425b6ac80108@oracle.com>
Date: Wed, 25 Feb 2026 16:00:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: cadence: Fix error check for
 dma_alloc_coherent() in cadence_nand_init()
To: Chen Ni <nichen@iscas.ac.cn>, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, niravkumarlaxmidas.rabara@altera.com,
        piotrs@cadence.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260209075618.1683125-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20260209075618.1683125-1-nichen@iscas.ac.cn>
X-ClientProxiedBy: LO4P265CA0191.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::19) To BLAPR10MB5315.namprd10.prod.outlook.com
 (2603:10b6:208:324::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5315:EE_|SJ2PR10MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 01be1f1d-95d3-4b51-bafb-08de7458dc8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: /TU8DrSi74/st46FJzMz2s9U818LuH3CcE+RtWcp/b/NSe1AsgF6YPJypiKf29j9eEQ1DIb0f6Ipe1+dlbu3/wtojQxpPGGRTdj0e+eNTjMILfWogyL+0AHYcAzc3DISu/g4+fdai4Tt6QsvcW1AIqhusqRsklIhCLRhxQvznCdFYvkw9dvsCx/Why7yBt6M6CnBb5y6BXPEKhWHs0F+E74ADrNG40W1irF1ew81Rn6CMnO6RRCgBX4iM+6zN4K/AcNvk2g2eiOYxUqHfUiywzdxz1bleIkomx+rRakxzsn0VKL6IIfZbbmZmZF0gVurq/1cMLuujGmZX1eHc16xwoapIOqQfUp1rsc+JtL8zjlDT56Bh58GgqKq7x158cDBiCWMv1vcQjR2Sib3z3snWFn1QwO9/5i4DZ4GFZHpyANu5vxO3JY9oMuP9T8fOOScBK719MbQmiQzrs6L3V1bHI+Z4VbAzoo/xzNrbk2IuyqaaZXBxNNs2tKm/EPPP9Gr77VXu6/zIaVQv2fXG6FozsStrWeD5dWqnOYvmm6KwQPdlsbss3L4vDr5sei6wFelE1In9ZLBH40leUy1fZrLJsMvxUbkOSX8cOSMaKtnuSIdujkBAN0CxjUVK5llPKHZXG0+jhPWNy6upGNss904YsbzQNIdL/QxMJ9KZmQ/LRpLNubyqHi4coC5HJdaWzWCGB5ymfNvT7WHtrybilTYEW1g4mS+OetvLZjBzqsAwzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5315.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3pHNkxMSTZIREpKLzRMeVpUQWhFaWFUQmc3MUx4YjdBM0tqU3BvTVE3OVg1?=
 =?utf-8?B?SXJ2MmlaT29mdzVzbzZoblp6aXpURE1UbTF2VlJKTmhvcGd5bUFDaUZGK1Vy?=
 =?utf-8?B?MjhobW8yOUFHaDBPcXJkaGZ0MFNZNjNZZCtobWNIRUtmcWQvYnlQc1N3OG44?=
 =?utf-8?B?VEExUFB2UmNSRHVjOWxCakpXL1lJdEh0R0JKd3JwUGQ2cjZHbjY1cnYzY012?=
 =?utf-8?B?bzZkeExrT3FiOFR4RjdBWHV3NXE4NHo1T3BoNnU3QUFQL2xHRGkxbmorNEpu?=
 =?utf-8?B?aW5Idk1RdlZiM1RoZDVFckFlamtCQ3BqN3lOK1N6ZFVMSlhXNCtHZHRaaDBP?=
 =?utf-8?B?Uk5FemdMY0w2NndzYmNRSzVuUUhPbFBkUlk4Y08rejI1OGJVdWZna1J6blA5?=
 =?utf-8?B?YW9rM3ROZU5acXFnRmtieUlqU2RaZ1JRaVNIQ25BTTB6Skw2OVB0VXBSOUZF?=
 =?utf-8?B?dHg5eDJaOUR3Y25ORnQrNVhCZWIwYnVLcFJZekFKbHhQTHNyMElMekYrZGsv?=
 =?utf-8?B?cXdmak81cGdQb2ZmUlg4RGJLMEhNeS8rcVFqUmxXTGxiSzRIMVdjVEdmRndt?=
 =?utf-8?B?NGhtU1FDaVh0R1JYaUhidVo4STlVVVVTRi9jcUVNN2hXUnp3Y2dSQUhqaFZD?=
 =?utf-8?B?c3QwOTBuMzVMNFpLdDgxcU5JRmRPeGdkNG9STU50T0I2U0c1ZjE2YjFuK242?=
 =?utf-8?B?TE9sczZFamlsK0lwSnlaUkM4alFJZTVDaXJoeUxxdGpsWG1meGdXUFljcitT?=
 =?utf-8?B?ZTRHV3RYTXBIRUNKVzlEZXFVZlZEMVpSV0xqS2tNdlNHdUp2ZDhKMFR6YkZF?=
 =?utf-8?B?Q1czQk13N21UTnlyTktJSjRYM0o0ckhHSklmZ2JwRHZOYmpHaC9XNFMxaFlO?=
 =?utf-8?B?L3ozUE9YSHNRdXloaDRvODYwL0FpMGpwL3QrMkFlUWM3TnkweldWc1BOQ0ZY?=
 =?utf-8?B?VTNRc1RHc0p2S0Y4N2lpSEhGZ1kyU0diWGF5ZHdtVHBQMmFsTTBDOENSN295?=
 =?utf-8?B?cmxzV2FTSUNCenppQ09GTFliSnEzdVNrcjd2U3luQzB6T1BvSHNzQ3VLcHJ4?=
 =?utf-8?B?QzgvbjlTWmtBN0xNa0J0UzFSRGxWelNtWWYwZVozQW4vL29KR2M2aFdsQ3cv?=
 =?utf-8?B?VE5XcUtpS0NYRitGcUNsWDNYL2w2eGhUZWxIb1dZU2JmRE9adHR4TGs4UkVF?=
 =?utf-8?B?ZTl2QlpZNW9QNGVtd1JDUkZmeGxwMnJ2c05IVXdDVjJMR2ZwL3JMOEFaR0x0?=
 =?utf-8?B?eThIZUk2Szc5MStDbjZCNlRzM2tKdll4cEZUT29icU80dWV3UDBwLzR0Rnpq?=
 =?utf-8?B?N0x2Vk55Nk5LMFRmUlV6RFkrdTlZeVJUMENTMVo0RXUvRnNQZ2g5bWVFa1Zp?=
 =?utf-8?B?cHN3eGhkdkxBcUlOK0hBRTF4SlhDYndVRkxFOWExbjlMaVo1QjNuQ0hJWjc0?=
 =?utf-8?B?SjF1M1B6NUphUnhFMmdhNkV2UzRZQmdOT093d1JzWDRpN3RCNzdNN0hmc0lY?=
 =?utf-8?B?U2tRZ1Yzd0ZEa0JiR0srK3BYZlBrTWc5WE55R0podkFFL0xGSHF2S2NNcTlt?=
 =?utf-8?B?aTh5ZTF2eTU3VjFnMlhYMFBPNUZ0ZjAra2g1Rk8wZTh5OVBlTEZ3ZmlZNk1K?=
 =?utf-8?B?dHFlVHZ0bTh0Tk04RkczcmZlUWl5NUFFbWZWTlhkbTlnVlZQUXZXOWsxVnAr?=
 =?utf-8?B?UXZuL2M2TEtOWUtiWDhUODZoN0dXN2tmOWtycHRWUThkanNmak1Bd3NnaThK?=
 =?utf-8?B?QTlNRzQ3ek5VMzBwLzRmcitDSHBMMTJBYURhRWJSZk96dXlFdDl3S0FTRTlN?=
 =?utf-8?B?eFBhSjBGQjU4elo2M0xpeUwyZGZvb3NFc1dtVW9BWEgwZEtCUTRTTVRRV3Zy?=
 =?utf-8?B?MUErN3ZEK0hQQUhGV0JnWUdncUtyYm1icE1SbjRtVFA4UFAwY2RlTFlVdHhS?=
 =?utf-8?B?Qm9CQnpmN1BqY0ZXUkhsd3QxeDB6cEUycDZSMkFkUHYvYU5xV2ZQTXd1Uk42?=
 =?utf-8?B?N01qcElYS2JMc3UrVTU5TEhJS2U4V05OdTBRK29VSWJYb0V2L0ttdnYyZ016?=
 =?utf-8?B?YmZZRzU5STJLTUVEZ0h3VytBV2FacXlMUXNhdVZ3SDV3TjY0NUFVdG9BdmY5?=
 =?utf-8?B?NVdLdWErM3BSWWlsbWY3Y0RzMUJlR0RIaXF5SittdE04ZVUyQVhlNmRYd290?=
 =?utf-8?B?Z3krejBpd3BMQTlISnErNHNtckJUNmQ1QzBWdE80aCtLZ282c1dOaXUyRHV4?=
 =?utf-8?B?eW5oeTBkcVpSMDdwWGg4enlPejdFMXpiTW56VDYzVzkzdjNiZVg1eUZsVWx1?=
 =?utf-8?B?bjdNS3d5L25XU2l3ZEFISlF0RnJ2Z0VKanlHa2twRDBlc2dtbmJ1OC9zSWk4?=
 =?utf-8?Q?sp3gBGcyQFl2zI6M=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9w2zdDXzaUYE39vYZhX3ItEhIBoo4puWOy1vc6vC2DXMu912jdZ2v8pa7WWMwH9TQIykq/xSDJyjlyjrK2Hq4IlAE36M8SgnA0oMJAo96YOGyDhC4VvTEQoQp7eB2DohdXNRSodODsai8fKzilv4xZA3i/BawGBRbzBq80ZMKYMaM1LzHGHGOJRhe//OqtCWfBkT+8P0e5Ons403lLsu57opPyhEshepuzImnV6VBBq+EnGaiLRj3H6O5C+XB40iYrVP6IsHV6MfXoTgxhJEfeivH0YEaAj9Mhw0bqbXxWaRh8D1D6zLzJGkV1XQjTjmoBWBVZ35BWw4pNhGqsZKtKxnNViRUDSYStaTC2+j0vSYVPMWqUTPkVJ7aL5oPAduCjsBuC8qehRBNzqo4nyW4pZJJBqjyeMeq+RV/Ilf4iqJNkvZ/7mMfSD+wa5yZULM0yv97qZSfGYnD3J/eS7/Ig4ZWCKDolCkr33/IIMwJwjteDojzl+WGB2n33zi45Pzd1NWh+KLQJ5k//4uQq4jhSVOfeqibJQ2pmvDFRpalmY0NnfcHWpCB0h9cExaNFXYWRQnucHCRKgTwO5piHMA0DneFbt9GJAe0FG6lvpmd64=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01be1f1d-95d3-4b51-bafb-08de7458dc8e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5315.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:30:14.3976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLwjAugdO5ztbpI0d5Eij0E57MD5PZUHj6a+kDmMomUDE9T8dRIHxoKrr4M8GPvJ45umuUkF168lfEk7Nwb/VgWuxofIN/81EbmV7ZeJ6Lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7759
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602250102
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwMiBTYWx0ZWRfXwWY6QiKXBAGo
 +LjOMXR5gQPqA8ScPupiMwEMGV+R/Mk5Yi7OSghMXpjOCdOePr1C6AsJwwsOaznWN8Oi794/M9W
 u47KOKvfks5WMKdch1FkI1TW1yVKRxuZCcGiDtMy+zILrIynnbxwimI5Cm4f+LgMr9nYWplogod
 +oF66w4S06OKvyjFQMdIT79GNchSnZaphJBXYTI4NY/FX7oFpS/knBjqQV87mlPmqwK8VrO/Hti
 OI2x5fTTVh/HIQZJpQjYMKSKHoQxd0Qmd41vd03DqHNgDJl6hb7P7+yWiJUFs6TM9TYIg5DYj9b
 JwG2E9XeacnV0qRaCWZ5gvGnC825FfLZeVDHW8LlY9S5tUOu8vBmVIIaaLyQWl7EP0zJ6LRaMjs
 SwD4BWmazidYDLOfmi3txu7DlPKv4UMFZb8akWCbQBm9N794m7sWtgtaRqnyXxibobUawHVW4aj
 y9GohCnCv8oOVyJV+KQ==
X-Proofpoint-GUID: 8hkQ2GouO6clY6Jb0USDFFoNy81ieIzs
X-Authority-Analysis: v=2.4 cv=b9C/I9Gx c=1 sm=1 tr=0 ts=699ecf3c cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=btQg4UIJFkowHVzQ8ecA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 8hkQ2GouO6clY6Jb0USDFFoNy81ieIzs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_023034_402068_7E9461CC 
X-CRM114-Status: GOOD (  16.96  )
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



On 2/9/2026 1:26 PM, Chen Ni wrote:
> Fix wrong variable used for error checking after dma_alloc_coherent()
> call. The function checks cdns_ctrl->dma_cdma_desc instead of
> cdns_ctrl->cdma_desc, which could lead to incorrect error handling.
> 
> Fixes: ec4ba01e894d ("mtd: rawnand: Add new Cadence NAND driver to MTD subsystem")
> Signed-off-by: Chen Ni<nichen@iscas.ac.cn>
> ---
>   drivers/mtd/nand/raw/cadence-nand-controller.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
> index 99135ec23010..d53b35a8b3cb 100644
> --- a/drivers/mtd/nand/raw/cadence-nand-controller.c
> +++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
> @@ -3133,7 +3133,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
>   						  sizeof(*cdns_ctrl->cdma_desc),
>   						  &cdns_ctrl->dma_cdma_desc,
>   						  GFP_KERNEL);
> -	if (!cdns_ctrl->dma_cdma_desc)
> +	if (!cdns_ctrl->cdma_desc)
>   		return -ENOMEM;

LGTM,

Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Thanks,
Alok

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
