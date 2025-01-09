Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67887E77197
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2025 10:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjpwyg3SauL79qTGw6+cO3zZtnKPTzE0iRs1Y81czLQ=; b=BO6ZvSQZmNrlrp
	e51sIWB4twVWFSrC7Kt0ZQyU+g5M5yTv5zLJN6jCreqrFF6MjSDnkmHran49J1Ql+cVw88cxD2g/h
	Ch7+FrwRaZEGIA0WgwHhnVT+GHkTJUxcBdqx3ypWR7AqfKK3PgqBMAg4WMv7umQMrpscctgszhXiG
	yLG6X477jYBhMYeVNf5l2nrUs/9vrVCpT/yi8v66pgPaxuFbYKzW1cU2sALmKISZnyNRg51nxyix/
	kQepGXwKyJg4LseWBYmlzKoCVnxD+MiZowlRj1jGp6tjcZAUxOXAWG4E1zjbt0Bw7Eij+zEdH0ImS
	l9fYJ36Q0nI1xNwp1dLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpWf-0000000BTFD-2FWD;
	Thu, 09 Jan 2025 10:12:29 +0000
Received: from mail-bn8nam04on2061c.outbound.protection.outlook.com ([2a01:111:f403:2408::61c] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpWb-0000000BTER-0NrV
	for linux-mtd@lists.infradead.org;
	Thu, 09 Jan 2025 10:12:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yn8w3wCv9EhVZnHU66jc4G5ucn4qJKjF04bB1TrPgmWxZal1fWey7VR5eZTqnD/bJ5vvyHYkFon1Z5SsE35LinJ22LnE27PmXhh4fA77S2HC4VD8kaG885m2ZiUNEshesP2LjAkIMFMKtBDWeLg2nWYhp+9dljeEuCFtiG0wV+gsyDmlsI7EnMNZqWiFEpSwSoC/9a2FhCdWq2OXmZBE7+5FCa9PvX3u2pRoGIfCjSV6gBsmnVLFGoWdruurwUKDereo6eq8W3147QuCbBV3aZdPPWzECIJkZVPewW6ohGiwT2+ClQDs9Zvf99rMeT0TLMdS6TnMSFXXUi79Wl3ZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwrO9u5CmY67lkJoBubEXOWheM9IESpxyOUo+eL53os=;
 b=CvzdqN/TepqH8qPKr3caqk9oRx2GILnDtlTq+R0rttHLTeHsILHtCQlAmBmftN4nXbo80kR/FZULhR+ELxAcPhpIqEsyTo9nadlpmJwLgAShdXaaLynMseUMMxyyoDWV7IKUkVOvb/EeEnCld0/v0y/aowPCUSVSXqGhztWtzPZ/ehlWvlAs4evtQe2sK/S6PV7MbTUcdt4fDSmr4u/xoj4ls4g02+SNbFiJWQkUVNKz4Jte4yoes6J5PewFM6/APCEIntY3jXv/mi3rR5y6oZcZYAh11uBS46zJVqlBpJxEwyMbE7wf3P8q2qcVGA+NjAsHKXndVrLe8UAP4ULKsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwrO9u5CmY67lkJoBubEXOWheM9IESpxyOUo+eL53os=;
 b=dx8Q/Bwqe+9t1oluolaLKyOcljIwP3o8ubK0qZclFown2YpmvJMSOMAcaIC7W2NV26ZWPRl9O43SSgPo5KhXhW/RRkXx0jLQitOp8GzQBPLFamCMBSmX3wfX4Rl0oTFHveFktNevVkIV7Rb4396SjobLXywQ4fjmh2CNP9JUJJ3g7rpA5rVrEFAixlfGL05gxh1yWyozAjhIGNJeJJJzKsxsXvtpT+hR9s40SlyHHfoPIQs4cdBidaEufFrcGK3TzZIhgAg53saGGr4aEQ0+aOkdImR7WjoYh0rq1fv4dO4BadFVa5H/uDm4oO7X2TqcvxqREpQXBuOCRtrea+rS3g==
Received: from BN7PR10MB2610.namprd10.prod.outlook.com (2603:10b6:406:c0::30)
 by CH0PR10MB4890.namprd10.prod.outlook.com (2603:10b6:610:c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 10:12:16 +0000
Received: from BN7PR10MB2610.namprd10.prod.outlook.com
 ([fe80::c5b0:801a:5214:f38b]) by BN7PR10MB2610.namprd10.prod.outlook.com
 ([fe80::c5b0:801a:5214:f38b%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 10:12:16 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "chengzhihao1@huawei.com" <chengzhihao1@huawei.com>, "pchelkin@ispras.ru"
	<pchelkin@ispras.ru>, "richard@nod.at" <richard@nod.at>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "yang.tao172@zte.com.cn"
	<yang.tao172@zte.com.cn>, "lu.zhongjun@zte.com.cn" <lu.zhongjun@zte.com.cn>,
	"wang.yong12@zte.com.cn" <wang.yong12@zte.com.cn>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 1/2] jffs2: initialize filesystem-private inode info in
 ->alloc_inode callback
Thread-Topic: [PATCH 1/2] jffs2: initialize filesystem-private inode info in
 ->alloc_inode callback
Thread-Index: AQHbOSDW2WKmxrrjS0S2QDHBQjrZnLMOi6YA
Date: Thu, 9 Jan 2025 10:12:16 +0000
Message-ID: <77684009a0a2c527168df4c40077e51a69773ee4.camel@infinera.com>
References: <20241117184412.366672-1-pchelkin@ispras.ru>
	 <20241117184412.366672-2-pchelkin@ispras.ru>
In-Reply-To: <20241117184412.366672-2-pchelkin@ispras.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR10MB2610:EE_|CH0PR10MB4890:EE_
x-ms-office365-filtering-correlation-id: abe9d2cb-f7dc-4437-2c8b-08dd309617fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cGlpL2g2WHJVb2ZoQ1phNncrQnFHWUdnaUtwd212ZWVhdUZPWGZRMkp0OTN1?=
 =?utf-8?B?ME1LWWtpNnJjclUvWTc5TTZTY2hxWDRXbXdsUlRTaFE3TVdlVjNZcUJRdDRP?=
 =?utf-8?B?cDBXbXdkVHNKL3RtL3YwMkN1Vi9VZDlxNG9lNXRaRm9HTWJkNmtmQ0pYeUZ0?=
 =?utf-8?B?eVV4bDdTczFnTWZjWTdrVjZjNFgzWUxqVnBHc2tqcU5aT2VoeVJkUXY1cHUz?=
 =?utf-8?B?QlZpV3RIZFBxUitCOGxmRE5kTGFuano2ZW0waWtpS25ucnFXc21uM1lsME5l?=
 =?utf-8?B?TWVFMXI3OFRDRXh5UFVIM2ZkY3hFTURkRkpBdDA0Q09mV3hPUzY5RXRtMlcx?=
 =?utf-8?B?TFlmRW9jRXNLelFrYVlKWlpSOUFibjdvb1NoNWVTbFpzTnY5azV6T3JoR0Rs?=
 =?utf-8?B?T05iZjN0elUyS0FXN0FaUURuR2RsV1p2OE5NdjQ3K3pUeWYwcjZSakxlUmhT?=
 =?utf-8?B?S3gxYnEvK2NBcGY3b2JXQ1o2cGxCWUZ3Y1lkSnVqVGNtaTcwWS8wSmNFcWJy?=
 =?utf-8?B?Y2pZeXIyQW5mN0NUNmlNYmJEcG5VNllTVU5oeHZ1WS9vZW5pNDFsL2pHdnFU?=
 =?utf-8?B?UWtIYVo2K0JJa1c0bER5a2Q5R01sQ3pXdjQ2NGh5N0FKL2ZLZ21RUjFZd1BH?=
 =?utf-8?B?SzhHRUZyc2xjK2pmeEtDeGk4b0R3Nk51RkRHSktIYkZpQ3FiY3FINVJmQ1Rl?=
 =?utf-8?B?bVJsMUZjQkdrQ3gyaGZieEpScEpsVktsaGVWNm80Uk8wWjAxRUsxeitNNjRw?=
 =?utf-8?B?TmgvenFGaXlkb1FPSjhSVFpMT282aEpmWG9xeFpyRTJONWFyZE52N2k3SkNG?=
 =?utf-8?B?ek5qc1JQTjZWVUE0WENkUlB1V1MzUlRnTFBCcXh2M1UrcFJybjdkOUR2bzlh?=
 =?utf-8?B?OU9Odlk0aDdpc0ZhUU5MNnhCKzM0Z0JvSEZFcFFNZXhhOThUVGRPaEFWMXJB?=
 =?utf-8?B?TXNUenY1ZzkzVUdTZ1BzaDBkLytHN3g4SXpiU0NLbnp0ajlHNnlVaC9DOFg2?=
 =?utf-8?B?aVV3MFhxL09idkRwMnhoN0JaM0hUWlkxUkVEWlludWxRZ2NNM3RKMjh0Uk0r?=
 =?utf-8?B?alloWHc2dWhlbStiTUhWUEFSVnM1Qlc5TDMvVGk1RGZaK09CRk5JUTB5MENO?=
 =?utf-8?B?bEZLV2lZQUkxWnZGQzdZWEh2WjVUVmpZeGllbmM3aWJMMHl0cFh2Wk9tNmVX?=
 =?utf-8?B?MXl0dnMxcXM1d1hsVlR6ZkpRakt2TG9lOFg5UUdHRWpMQ081N2lMR2JCR3M2?=
 =?utf-8?B?eFJLRGQxbzg3WTgycENFVWRBaXdGMmYvWWtQQzBPeHpPRFd6Mm1MK3FNTlQz?=
 =?utf-8?B?c291MkRsRjN4anE4S2dyZk9zUTY0UzRHVzVVQ2FlRk02clMrMUU0cnFLVHNT?=
 =?utf-8?B?TWd4aXhYaEZ2QTZReU1mZGVLMi82aFJkYTZ4S2ZwVXZ3Rkx1c0VMSksvYnJS?=
 =?utf-8?B?NGxLbW4zZkNuTGliR0dBWEdFektWZjM0SzRxdnFMQ2VwU0VVZENCK2J2UXhp?=
 =?utf-8?B?b3VkTEZvWXpSSTZ0QzVFZEY3allyVXlaRS8rM3BRenhSeEtjVEhCb0VLSktU?=
 =?utf-8?B?eGExTFZEcXA2Y285ZXZBbUFmWlRvTThxSzB2RENGMEd6NnVldnd2Qnd4azF4?=
 =?utf-8?B?MUNWd2NVWXpLa3NuUXZ3U3BSdG5GSjlrL3pCMjU5czdRUkNWUjIzeDIrNUlP?=
 =?utf-8?B?WlRuWlNMRUFCVXFrcEFKUXVUdzcwbU1mMlJlNmpPRmp6Z2xMSW5qL3MvNmpr?=
 =?utf-8?B?czZtWW91Z1V6ejIvODVVQk90cEhQUExIVWIxTUZXWG9abEhvbkVNSDZCclFo?=
 =?utf-8?B?eGt5eit0SkRMSUVVWU84VGI5SUppU0ZxK1Jaem9HUEFvbUtDQmVFV2RmV1FD?=
 =?utf-8?B?Ym1NNXVuaTFhc0xET3pKVDd5TDZqR0N0RUdIOVcyRWlwTVltYWFTb1d1bHRK?=
 =?utf-8?Q?ntujn3sQi5cyb8o28uDdL+VRUXJkZARY?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR10MB2610.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VittK1RycmFoNTVMaHJiUmg1M2Z1Ny9QdVd4TkNQVTBKVW1LMWpYUUdmTk5I?=
 =?utf-8?B?UGlRQlFZMnh6N2ZhcXFaeWIvRUNDaDFPdU5ZeVZqK25Nb0g3TzZpTU1WVldz?=
 =?utf-8?B?OFlQSlNMWTFpcUk2N3RqUFFMZ0NqajZJaXJyN2tjSm9pTzJ2ZXpyZGFOYzJ0?=
 =?utf-8?B?eWRrVEhPL2dSSUY4bFNDQUM2NFdCOHM4dnZoRzRtei9JTHI5OGFtNUJRTDlv?=
 =?utf-8?B?dmRtN0RLeWNBVUZ0Z3BwRzJWTllBcTExV2tzNllEUTNsb1ZSODY0WmdiWldR?=
 =?utf-8?B?VWJqczZHeVZmc0tEaWdmL2Y5VDZnRUpUWUU2clFuRzFMNWc1ajJnL3NEYWlw?=
 =?utf-8?B?TlhhbVRSRmVFZzFmc3JHZXJNOG5RRHFKRHEwekJWYjhTbHFhRWNXcWFxa2c5?=
 =?utf-8?B?OE1PUWx6NGU5MWx0MHRzUFo1WS84RXNqaytjOFkrQ0dHc2lvOU12Q3ZQbUkr?=
 =?utf-8?B?RktHYUJzajRudnliSmVqVGpxdFJPTlM2RHVkLzhmNEJaakRReFdWRDZGbGZH?=
 =?utf-8?B?d1JsM2pKYzUzTTcyWUVBREMrTkJybnJPelArcFd4SEJYek1URERXaGI4T3ow?=
 =?utf-8?B?R3IrZmhxbzV4cllGV0R2cDNMNTFyTGRGbmptZVVsQUdkeTlGcTZJbTlWcm5t?=
 =?utf-8?B?ZU00TmcxeW4wRHljZWhkL2d1ZjNMeVFUQTZhUlRPYjJGTkhhZ29MamJVZnEz?=
 =?utf-8?B?VXpDdHFBem1IZk1HaEY3WldCT3A2Um4rWU8vdmYvMVJYT1laVG9EcVk4YVJ1?=
 =?utf-8?B?akp5VFJ3alAxaE5PcW9DU2dLUXVZT2xQdWtZSWdPd2dWbkloR0dQWEJ0djEy?=
 =?utf-8?B?cHBndEhMenM5NFR1S3hJMEorVVhBUmxiSXVZNXZVclZyYVlnTVVxTzFQSlBw?=
 =?utf-8?B?ZjdQeWsvYnJyb0VQT1V1VXhRZjdEem5Nc3d5cjhXYTNyMkNkTmtSOXNiUXZK?=
 =?utf-8?B?UCtRbXBuT3I4UkZCeFp6QjNKZUlEeDdIeTB3clFBc3NJNW9EOCtDbDJOVG4y?=
 =?utf-8?B?QmlscGlVTU1qZHMyZnFPalZFeE04RGtTWUFnUGhrSkR4c21KY2M2Q3phUjdB?=
 =?utf-8?B?MTJQeGx0YVIrdEJsdDh3OEF6SWh5Tk1Nbkh2RzJRZ3dDSCthYmhaaGhLVy9j?=
 =?utf-8?B?ZHlyU1J2cG5jWHZXbDh2WEVFazJHTkorb0E5UUE0ckdDVUNVQStqY3lHRERi?=
 =?utf-8?B?NzVXNGVVWWJGNHZ4T1J3ZlpCdVlpVVFUV2VkdzNQdlZTdFl1K0NBYkU2MmFY?=
 =?utf-8?B?S3puUG1xQzkvak1CaFJCWHo3SVREZEViQVRiaGg4TTl2ZUZnT0Q4VjF6U2dS?=
 =?utf-8?B?ZllXQWlUdmJycHM1OE44engvNkdXb0dsc1F3bmR6ZmdiY2p4RjlOSk1HVTZn?=
 =?utf-8?B?bXp6akM0UittMTBobzVqTlhFWjV5NUdJWWJHRUZLU2cwOUZlaDRvSFBYVDJz?=
 =?utf-8?B?ZVFUakZML2FmYlJCbERiM1NVOFhWY3FmcVovbndNK1JoOGNqSXZXbHJjRGR1?=
 =?utf-8?B?YmhGbDJESXdBc2QxRkU1TlMzenFHL3NLc2JyM0R4a09LcGpCZkl1cnJLcCs5?=
 =?utf-8?B?ZDd0RnNCVWhIWEQwVlAxV2MwV3R2ZHRFckY0Zzk4SzVoY1FMQzF2b2Q3ZU5h?=
 =?utf-8?B?d1g0WTM1WDFFS09VYzBXbjVySHlzYTNraXV0WWtoejF2cHlKMzAwT0c3SzJi?=
 =?utf-8?B?emFoWlpTNnZOQmdNK1Y0azR2cFJhc21NbnFRUEJVM1BNaFk0ZFNFeUxJNENU?=
 =?utf-8?B?Q3VzL3B4OURCb0hXeDlNVXNuVmlIZlNLUmVJMnQvaTVGUFErbmxOM0VoR2Rt?=
 =?utf-8?B?QjVaN0FwSlZKV0pld3c0QWNTeGJPVDYzTUNxWDBMY2hpdjViRnZxRi9HeS9i?=
 =?utf-8?B?WmRzSXNVdEhaMEJKYmtOZkFYN0tSYWdxN2wwdSt6TTJSditUa0NhYUthVWg4?=
 =?utf-8?B?SytISmpQUE9lbEgvR3NXQ0QwYlhzUWwyQ0tpOGtFQUZvdENyWEFFZEtzS0Vh?=
 =?utf-8?B?RGFjT3VPbnZNdlVFQW40ckZ5RjR3d0hBOWcyV0RhbGNFb1FGbTFSUlpyRDNv?=
 =?utf-8?B?cXR0RDFmSnBXM0dwNlFmRUw2Y04rVXZBVGlUbEpSZDJVd2VVT3pWc0xoOTM3?=
 =?utf-8?Q?2jAifVpFeHb1u9ELuS4csI5aO?=
Content-ID: <4E1D2BADCFC4ED489E7E944AB93090AA@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR10MB2610.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe9d2cb-f7dc-4437-2c8b-08dd309617fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 10:12:16.2015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LxTGCxYmvbo5VB4QPHLSfkvkVjOEJ0exnDE8Hue31IdbGsq7+vDsyrGXCbYKXAh+9rG8KPzYmfJSL5ODudN5Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4890
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_021225_181391_8963A1FA 
X-CRM114-Status: GOOD (  28.26  )
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

On Sun, 2024-11-17 at 21:44 +0300, Fedor Pchelkin wrote:
> The symlink body (->target) should be freed at the same time as the inode
> itself per commit 4fdcfab5b553 ("jffs2: fix use-after-free on symlink
> traversal"). It is a filesystem-specific field but there exist several
> error paths during generic inode allocation when ->free_inode(), namely
> jffs2_free_inode(), is called with still uninitialized private info.
> 
> The calltrace looks like:
>  alloc_inode
>   inode_init_always // fails
>    i_callback
>     free_inode
>     jffs2_free_inode // touches uninit ->target field
> 
> Commit af9a8730ddb6 ("jffs2: Fix potential illegal address access in
> jffs2_free_inode") approached the observed problem but fixed it only
> partially. Our local Syzkaller instance is still hitting these kinds of
> failures.
> 
> The thing is that jffs2_i_init_once(), where the initialization of
> f->target has been moved, is called once per slab allocation so it won't
> be called for the object structure possibly retrieved later from the slab
> cache for reuse.
> 
> The practice followed by many other filesystems is to initialize
> filesystem-private inode contents in the corresponding ->alloc_inode()
> callbacks. This also allows to drop initialization from jffs2_iget() and
> jffs2_new_inode() as ->alloc_inode() is called in those places.
> 
> Found by Linux Verification Center (linuxtesting.org) with Syzkaller.
> 
> Fixes: 4fdcfab5b553 ("jffs2: fix use-after-free on symlink traversal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---
>  fs/jffs2/fs.c    | 2 --
>  fs/jffs2/super.c | 3 ++-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
> index d175cccb7c55..85c4b273918f 100644
> --- a/fs/jffs2/fs.c
> +++ b/fs/jffs2/fs.c
> @@ -271,7 +271,6 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
>  	f = JFFS2_INODE_INFO(inode);
>  	c = JFFS2_SB_INFO(inode->i_sb);
>  
> -	jffs2_init_inode_info(f);
>  	mutex_lock(&f->sem);
>  
>  	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
> @@ -439,7 +438,6 @@ struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_r
>  		return ERR_PTR(-ENOMEM);
>  
>  	f = JFFS2_INODE_INFO(inode);
> -	jffs2_init_inode_info(f);
>  	mutex_lock(&f->sem);
>  
>  	memset(ri, 0, sizeof(*ri));
> diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> index 4545f885c41e..b56ff63357f3 100644
> --- a/fs/jffs2/super.c
> +++ b/fs/jffs2/super.c
> @@ -42,6 +42,8 @@ static struct inode *jffs2_alloc_inode(struct super_block *sb)
>  	f = alloc_inode_sb(sb, jffs2_inode_cachep, GFP_KERNEL);
>  	if (!f)
>  		return NULL;
> +
> +	jffs2_init_inode_info(f);
>  	return &f->vfs_inode;
>  }
>  
> @@ -58,7 +60,6 @@ static void jffs2_i_init_once(void *foo)
>  	struct jffs2_inode_info *f = foo;
>  
>  	mutex_init(&f->sem);
> -	f->target = NULL;
>  	inode_init_once(&f->vfs_inode);
>  }
>  

Has this one been lost?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
