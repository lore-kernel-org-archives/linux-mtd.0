Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF3AD3B7DD
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Dec 2025 07:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxZuQYN9qyirQ29dddolX/B2WyfLZnHZrB/DR6FSOYo=; b=0x9/HeeJeaQfER
	oEFKVqt2C0yJOachqVm6iN9+4oPQGmcmKRyG6FwtI5q/uTtuvaiORn4dN/otkW3pjWiwOyo/oAf6s
	uemd0Uz69J4atn+YGJfbAavWml94dJidJww6zQhHH0ujNspza00NZq05XAI2zoTuNnlFh0pN3ENa9
	IMrUKMkopOv59xDY90csWfQkHg1Skxhuy6e4BvOBQBiQkRcCFTaXhUIG2Ug2qOSv1b4J0U+qiiv6V
	CX1o26sSvamcRb54ncAYBAJzMtFc1ew6Abj5+xXKNGVNaR5T578XXMspUxIBKarOHGfADy3AEMR7A
	qm2ddtr3uug3ckCAqgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSW3F-0000000Cmyb-2y0Y;
	Mon, 08 Dec 2025 07:52:57 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSW3C-0000000CmyA-24uQ
	for linux-mtd@lists.infradead.org;
	Mon, 08 Dec 2025 07:52:56 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B85h6SH799804;
	Sun, 7 Dec 2025 23:52:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NFI0rB1rpvEtPXJscoiMwfis7KkKFKBV/YUahyJYYzk=; b=
	hOXLCNfcaWDFeEpibYegEfNXEBM3KBbPK6cax24SdWfr9u9nUtsFcHSU7F3INU0t
	sFuIQnGuf7jEbCUBLIyA7+YJNLp0LmXgLnuf9gSvKgZ0lX1T1r6FHuaClwNMi0Xo
	hPG1kpBR8ZURHA1b01aEqggw+v581LsK4AAebnNC3AfW8kwidiTOQxrj0HiZ8Aon
	EeT693uCebSKyqt8e/4TFKW/FumKXonFHffrdo+LelVE9AECQb6r97SyUSGnKGAl
	6g5fpaPzvM7nh3YK748DLk1QJ0CFi5jmBqmKjMoS15g1DXTwZ763arM784H9ocqv
	1GrJ2Zi5oMGh8Cq8cMsyHQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avmvh947s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 07 Dec 2025 23:52:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3VLgrC8/hKF6VKhu1RJpEDw6lJps788lfLCh2LNFK3fOqug8XeQ0oniQVqyTx/AqPcKFf1W4ESdXTy/gkcnI+u2SK6Zuxw3YnMHAQg5s6mX4OgSf4fMZeqgy9vUnTrS/hnZkRetxkyteacCJg1uvxkONQckgp0Byd1v3rII+3kRBDlP4CxRLlzF2oJNsmMP2CpkqIg861XAsrfsiw9BPpjnOgbTyMM0V/Z/gITRiCsn+FeiLLcnhM1pd/2DByVLoDx/2hrW64eqgVAxs15qBvlY9dhZ5o1/10VxYhmiEwiBeqG7hJKQLuCNqp3VX0oCEgEZDHIC0y3F2CemXdWZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFI0rB1rpvEtPXJscoiMwfis7KkKFKBV/YUahyJYYzk=;
 b=DoUvqwfndag/uIV4JMb9sKvSMDP+w6DeRS22F+pYJKePf/RhFK6wwXxf/sQjWd+2E4yWkEjqfH9n9K8xyvW4ill2dNjcSevIVVJaECC0K+HyV3ie/9gPcJg+jgQPsE/VYIPHCQp/vWYzr0lYx8lGmPNsiTEuNr9XYXfLxWPbva9htPTwlrMMnhcHMjRclIAorSwDjbwpWM47m+kvDceDKBZBiBBdFuBYxO5VYq15sr8SmHToDWEtA8nziNiwpapl9Y9c04YT1UDUSloqO7aQo6j3ECflVrdTP41x1pSggmAGSru5DR11zrerwciPmWVjeSkH67VKbTboYXihG8A67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by PH8PR11MB7072.namprd11.prod.outlook.com (2603:10b6:510:214::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 07:52:32 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%2]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:52:32 +0000
From: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>
To: Pratyush Yadav <pratyush@kernel.org>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        Tudor
 Ambarus <tudor.ambarus@linaro.org>,
        Michael Walle <michael@walle.cc>
Subject: Re: [BUG] MTD: refcount underflow/use-after-free during rapid SPI NOR
 unbind/bind cycles
Thread-Topic: [BUG] MTD: refcount underflow/use-after-free during rapid SPI
 NOR unbind/bind cycles
Thread-Index: AQHcYAo7WMRG+ACdGEuvkywC/Sj/ArUSwDZMgACdJySABBF+fQ==
Date: Mon, 8 Dec 2025 07:52:32 +0000
Message-ID: <CO6PR11MB55862D21BC0ACDA495BD2559CDA2A@CO6PR11MB5586.namprd11.prod.outlook.com>
References: <CO6PR11MB5586C35409D4E416C4AE79DFCDDCA@CO6PR11MB5586.namprd11.prod.outlook.com>
	<87bjkd8hl8.fsf@bootlin.com> <86h5u4rfhw.fsf@kernel.org>
In-Reply-To: <86h5u4rfhw.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-12-08T07:52:31.734Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5586:EE_|PH8PR11MB7072:EE_
x-ms-office365-filtering-correlation-id: aec765e5-5552-46b9-0e97-08de362ebe60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7053199007;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?g2/zp2hwiYRtcYzV8/rS+WVtcBa/Fr72CviLV++77aOBUUK/VY8FJ3nur+?=
 =?iso-8859-1?Q?BJX7+oe37RbqqpnuJYOw4eJeF4A1ZqEP/BjQ2+fdFSyvRezd0Tt88e5rm2?=
 =?iso-8859-1?Q?EoBHI68mkdpUN3ie4oJ4RLjpWYDN2V0C0RrfAYxbF0smLHSwO35IlFujLZ?=
 =?iso-8859-1?Q?8vHV1qhm2ABQpMrnJ+wlH9wHOdahTd8l91DkXgPDVIh+YN0OFVX9b5hGdt?=
 =?iso-8859-1?Q?h0tiCOh0g2iR9CwqKenAR9xMk5nOHS515tp2uaPtmYyr9np9qs0htccSR6?=
 =?iso-8859-1?Q?TjwJDitQz7AQQ8DgHWaXP7zqsHk2B4I40eWFKodw65Kks/TIN5Od3G9EvG?=
 =?iso-8859-1?Q?uQpyheA5fBD0dyVpLW/Dbk2rlaGAywMsjqKHaWXoYfnHJWu0weIyAkgmfO?=
 =?iso-8859-1?Q?1P+QsApvRD+5bA+LqJqimW5xWrahWTcaDJBOqmBn3knhFVppF0b+c6qTZ0?=
 =?iso-8859-1?Q?VBPq25i80ACXiuiV37P3+FtHY46ZDPnXIGoTzDBFDiiF/chHA7yaeewfgF?=
 =?iso-8859-1?Q?bFU5xvrJ4oqvqpFqZ+idG5TaB+KFggw9PpgvK8MffX16bFH4DeBts5AwEk?=
 =?iso-8859-1?Q?AIBoIvngu7Y3ROEf+ZiwuROkFRKSJUYAnZq5EOqtcnkav70RvzTKX0OTRe?=
 =?iso-8859-1?Q?d2nmSu748adBG5+ayP1KRckxBKjj8RKhdN3yy84mdN6G+tF3eXXaco5VrH?=
 =?iso-8859-1?Q?5xlKzExPakOXh9PxhfEiztoeaYHGEmXfLIreZ2NSXl11vK9HoN0nhSKMSh?=
 =?iso-8859-1?Q?T8POvdGIgz5zdDd4Wp60aYOmm0uFNb16pto+QRXiSBxC67sx0K9aXip6L7?=
 =?iso-8859-1?Q?eTfrBwdfTmwSM/BhsSy4VhrxF8vVIPujHkfei9zDqqgxgCQ8aCi/nlRtub?=
 =?iso-8859-1?Q?IiwIbY1oPwecL3h3fX43BrXQjIe5oh3O/Cqiy3MQUJb/rfWEWkQATlneeV?=
 =?iso-8859-1?Q?ubhpUtpX7n5uweG4UlEWFPucVCf+eWAJliJECxDo/OCSSevYJiaMJzIl2i?=
 =?iso-8859-1?Q?wyr9q91K8/g+l71IdsScqTqgDipSJnJp2wUmyrXX0A52MSewxNvBg0nLUE?=
 =?iso-8859-1?Q?qpW7kpUPE7mODDO6qphUdvSn3QAB4XdVXRZn2RqMhJGmJ1jwDBaMSJ3tFf?=
 =?iso-8859-1?Q?Zucaj/KHqIgWajJ2W/12DRvwVaxJZNZZF8UOOhLQ2lXYAg6vUv9p0h74qb?=
 =?iso-8859-1?Q?JigrK9jAJJyIJpnR8oFtnxd5NFl+5CY5AzkTu2ip5Q0W74gLxA2MoO7Bpi?=
 =?iso-8859-1?Q?O9luuZS94kSKAeNrbCe0Cz7FzC2+l7n3hqfbIQvuaY1HpTbrm+S2MZdBN3?=
 =?iso-8859-1?Q?4LwPluX7Y4dFmy+0uL0MxDHzlj8s/ElK8hO4WH0Re1eNWn/mkNINNyV9RV?=
 =?iso-8859-1?Q?U49BZZr3ZEAFwTYlpvcq5ADM8foGuJwbA/1NeGqZofql0CdeUg5ErUGO0Q?=
 =?iso-8859-1?Q?qhk0uLxfwUKtdVD1nKPqZy+znUpn/KLkEP0WI62ZvGQf5Y2rh34jS6y7yT?=
 =?iso-8859-1?Q?gtCG2L96umAie5ykFOypSzwo5Hd1wih/iEP2fd77/LMQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZoNIQTxde7/fIlozlvWKnDz07ptC7UAh/m3YNeeXLiX/qfYD5fBGQLZmyj?=
 =?iso-8859-1?Q?2FggemivIqy79w81ilzT5456/8FX7Ji0fZXQqBZNP6mh52sCJtZz2vQZ8t?=
 =?iso-8859-1?Q?3wqhJBw8dHyO8KKgLFU7rwEZ7di4BXBqQm7CrOUgb6JsXalk2Zt4a5PGBT?=
 =?iso-8859-1?Q?uF5z+VQUaDlRwGurj5ot1+TxMCD9VxjUkb/y9bKWeL4oRNkRtVjB6vSCRx?=
 =?iso-8859-1?Q?900ZINCR8soi0aWNneL42HJsDrCd5aPo6/MLRFpKOgPTfzyL+w5ZkhxZCC?=
 =?iso-8859-1?Q?uMmxj5KVWAkso9Qr50wDAe9a9R+iS6WZlE3dlPnmy1jktsj5473jKh0WJC?=
 =?iso-8859-1?Q?q1EbDCJOg7UaEF7e+I4c/YgHM/9TGCnHYTh7Whcxf8FCvMfgVFw4OrdK/Y?=
 =?iso-8859-1?Q?68YEG3/5D7PFFRBNpspTqq4qbyDPn8tfHiE3hKUD/Uetl4r3yKEyIno2qz?=
 =?iso-8859-1?Q?Tc9v4r55oa6yf2Zjjiqg+Xug7BNUyflEyRdzTzlM1XDq1CF2xHmh7Xyf2H?=
 =?iso-8859-1?Q?0p28bUVh8eJR5/UFwwKlVrYQ7cIEKlnagRCOMysTPrBpX7wOGxln0+MdZT?=
 =?iso-8859-1?Q?NdB4V2pdlPePCKAVDweDVaeVC/+wtzAevIB7b9YxduFFzVkIk5EEtgDXFx?=
 =?iso-8859-1?Q?w4jh5QaAkMP5GUCCg73WTxDEtVtRqU9HR4aPTKYvdYkP4Jsqg5+DLcM0qv?=
 =?iso-8859-1?Q?t52YworLgS+faIQIlUyL6PVj0HemfLwhQU94uRuZb0T7mGLzxSwIwtjpa+?=
 =?iso-8859-1?Q?UGrCh2EVLil0+GFDT24qAUti7iEuDLmVEulUl8CfpKuXBjdHqz6N9FPmkA?=
 =?iso-8859-1?Q?/9pYKvlasUOCiRj78swWK00/ilJfvmafKtU/CXIScN9R5j7qzWFKTZ5oJX?=
 =?iso-8859-1?Q?DOKIkVH6iU6F4OVCPiqXLR+RCwvOpuWqT872xWly5LZEDIl/P8b+U2qqXh?=
 =?iso-8859-1?Q?NRooHQ69nPlChZOBZUp/4aY0DTd3lm6c3fiY1hmKVu8gQ6T+xi/RwrN0HD?=
 =?iso-8859-1?Q?/hBPTj4X7jdTZYi+rNMkDPxt0Q2/e8NbXgW2jXmBdJayQuf2tFYjpOHpPV?=
 =?iso-8859-1?Q?rqOX+T//YmLNJaj+tZRRNgUqp59VQzrm9gC0HSXHbWsH1L42yGvGe0sw9v?=
 =?iso-8859-1?Q?lt5MWvxZpQKmV4LUKJOrnxO4G+6oRugvafzdrPcWq5RIKpJu3HZSYDgScL?=
 =?iso-8859-1?Q?ywv3MUlPwvjLsCLRZLgacSGG7l8LR6yNn8VoFbZN7QGwFc+Om/EhttF2Vl?=
 =?iso-8859-1?Q?9eaERU4XsEIdtFof1Ekh7BeIqfDvxmpXD63k/jDkP/ZeS41oYB+8TgfEEe?=
 =?iso-8859-1?Q?MA3NPKWdGvh7W+7WYy8mLviWlMLq3YVXo6rm6YpbWBKhz2Ol0fne4XjT7G?=
 =?iso-8859-1?Q?fDfj6pr3GOkLcDpFnh/ZLr0AXPjE+5w8AiNfSvoaPyYFHqjj5jovwX/UKM?=
 =?iso-8859-1?Q?9MQNMnBJ8B76b9ThSCDQgQ0Ggx05FAJ/M7Rj3M0Kq33vf8PgCaKKvfq/x7?=
 =?iso-8859-1?Q?xxyuZzbPzyoHnaUO6010qH72TatPyea2mmM//SnPuSwzP5PHRKaYIbRPnV?=
 =?iso-8859-1?Q?eMCgygUGy8cVcwfNQFGVZ4GQ3L+IuuCBqRk9xKMyHpRWgup4wMZUIM88lp?=
 =?iso-8859-1?Q?71ImgnyW8FlkbmawgqkgdfyEG3Q6V0Dz3x?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec765e5-5552-46b9-0e97-08de362ebe60
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2025 07:52:32.2854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PfG97GBLiLPuoezFj+Y3moIZtYMu9lRDD+VcZjkBfg4ddTBm0T55uo0ZLj6dFgnr865iJnVTKxS+K/4ivcyW+am2Hz2mgs9qbwX+Qda2eLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7072
X-Proofpoint-ORIG-GUID: JOaK0Q5iSRAbbQiNw2jPmutnTeQU8RQH
X-Authority-Analysis: v=2.4 cv=be9mkePB c=1 sm=1 tr=0 ts=693683c2 cx=c_pps
 a=6XSCBLYFY2RPGp+89yprvQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=sozttTNsAAAA:8 a=JfrnYn6hAAAA:8 a=t7CeM3EgAAAA:8 a=UBFVfQAFWYhimOpKR3UA:9
 a=wPNLvfGTeEIA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JOaK0Q5iSRAbbQiNw2jPmutnTeQU8RQH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA2NSBTYWx0ZWRfX8JZ4j9LgqwDS
 XqbIu/vlnraj/VVafpxlSUuLjC5+SkTWSL35JPLiWW98hTucdmGFQtNwRtSgj7xEjDka8964FOZ
 xqlTIZWFEAVrVMQjUUGu8bCN746u4PSm2nYztsy6OohaUWGP9dknhViUNvVOHkK+NSrFuCidwi4
 ezdBVv4ovASCzRRMfBfak4HzRGdtKBd83gVuAF4tzOYK/k8Zv3TueYMzWEbayskAUClSYry3ZcV
 9QB2yJ9tIfrUWRBfwAsn3GH/kZICVL+Wj3BLRSVFWEXTF+qRWjHCNxONcsMQQ3Vynuw3b1AdhhF
 vGw2hbm7w732uRag0fyz86iH0ei+8aCfZNd3r8VjJxTQTsvDuPnLwoWUKVl9bl9pRZpeFwofU0m
 Ky570jL+IpzEuWZDnZNIVpuk4KwmBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_235254_597305_2757EAD8 
X-CRM114-Status: GOOD (  17.72  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

got it. Thanks for your detail.

________________________________________
From: Pratyush Yadav <pratyush@kernel.org>
Sent: Saturday, December 6, 2025 1:43 AM
To: Miquel Raynal
Cc: He, Guocai (CN); richard@nod.at; vigneshr@ti.com; linux-mtd@lists.infra=
dead.org; Tudor Ambarus; Michael Walle; Pratyush Yadav
Subject: Re: [BUG] MTD: refcount underflow/use-after-free during rapid SPI =
NOR unbind/bind cycles

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Fri, Dec 05 2025, Miquel Raynal wrote:

> Hello,
>
> On 28/11/2025 at 02:24:11 GMT, "He, Guocai (CN)" <Guocai.He.CN@windriver.=
com> wrote:
>
>> Hi MTD maintainers,
>>
>> I'm reporting a kernel bug in the MTD subsystem that causes a refcount
>> underflow and use-after-free warning during rapid SPI NOR driver
>> unbind/bind operations.
>
> Adding all SPI NOR gurus in the Cc list.

Sounds a bit similar to something we got reports for earlier as well [0]
(though this one could be a similar but different bug). IIRC there was
another patch/thread for it but I can't seem to find it.

I think we should do some sort of locking or ref counting to make sure
no operations are in progress during the driver bind or unbind. I never
got around to poking into it too deeply, and I am not sure I can find
time for it in the near future either.

This is something we should fix, but I am not too worried about it since
I don't think anyone should be rapidly binding and unbinding the driver
in any real workload.

[0] https://lore.kernel.org/linux-mtd/20250325133954.3699535-1-liwei.song.l=
song@gmail.com/T/#u

>
> Thanks,
> Miqu=E8l
>
>> ## Environment
>> - Kernel version: 6.6.116-yocto-standard #1  (6.12 have the same issue)
>> - Architecture: SoCFPGA Stratix 10 SoCDK (ARM64  have the same issue)
>> - Device: SPI NOR flash (mt25qu02g, 262144 Kbytes)
>> - SPI controller: ff8d2000.spi.0
>>
>> ## Reproduction Steps
>> 1. In one SSH session, run continuous unbind/bind:
>>    ```bash
>>    while :; do
>>        echo spi0.0 >/sys/bus/spi/devices/spi0.0/driver/unbind
>>        echo spi0.0 >/sys/bus/spi/drivers/spi-nor/bind
>>    done
>>    ```
>>
>> 2. In another SSH session, continuously read MTD info:
>>    ```bash
>>    while :; do cat /proc/mtd; done
>>    ```
>>
>> 3. After running for some time, the following call trace appears:
>>
>> ## Call Trace
>> ```
>> Deleting MTD partitions on "ff8d2000.spi.0":
>> Deleting u-boot MTD partition
>> ------------[ cut here ]------------
>> refcount_t: underflow; use-after-free.
>> WARNING: CPU: 2 PID: 921 at /lib/refcount.c:28 refcount_warn_saturate+0x=
f4/0x148
>> Modules linked in: sch_fq_codel openvswitch nsh nf_conncount nf_nat fuse=
 nfnetlink
>> CPU: 2 PID: 921 Comm: sh Not tainted 6.6.116-yocto-standard #1
>> Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
>> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>> pc : refcount_warn_saturate+0xf4/0x148
>> lr : refcount_warn_saturate+0xf4/0x148
>> sp : ffff8000829abaf0
>>
>> Call trace:
>>  refcount_warn_saturate+0xf4/0x148
>>  del_mtd_device+0x118/0x140
>>  __del_mtd_partitions+0x94/0xf8
>>  del_mtd_partitions+0x50/0x80
>>  mtd_device_unregister+0x50/0x90
>>  spi_nor_remove+0x2c/0x48
>>  spi_mem_remove+0x28/0x40
>>  spi_remove+0x38/0x60
>>  device_remove+0x54/0x90
>>  device_release_driver_internal+0x1d4/0x238
>>  device_driver_detach+0x20/0x38
>>  unbind_store+0xbc/0xc8
>>  drv_attr_store+0x2c/0x48
>>  sysfs_kf_write+0x4c/0x68
>>  kernfs_fop_write_iter+0x138/0x1f0
>>  vfs_write+0x1b8/0x2e0
>>  ksys_write+0x7c/0x120
>>  __arm64_sys_write+0x24/0x38
>>  invoke_syscall+0x5c/0x138
>>  el0_svc_common.constprop.0+0x48/0xf0
>>  do_el0_svc+0x24/0x38
>> do_el0_svc+0x24/0x38
>>  el0_svc+0x38/0x108
>>  el0t_64_sync_handler+0x120/0x130
>>  el0t_64_sync+0x190/0x198
>> ```
>>
>> ## Analysis
>> This appears to be a race condition? :
>> 1. The unbind operation triggers MTD partition deletion via del_mtd_devi=
ce()
>> 2. Simultaneously, another process reading /proc/mtd holds references to=
 the MTD device
>> 3. The reference count goes negative, indicating the device was freed wh=
ile still being accessed
>>
>> ## Additional Information
>> - The issue is reproducible with the above test case
>>
>> Please let me know if you need any additional information or testing.
>>
>> Best regards,
>> Guocai He

--
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
