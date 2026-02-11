Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D17ECD6C1
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Feb 2026 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OYuX71S0KnyXE34D0xw20++5/CCfHGE7ochAZix9ZLo=; b=U6N23By3dkdqgR
	oW/kCH+58kJ9cy7VEhpwFiY9TmXsLkdEWZgQPArfwRhODuUIcZQDz7g7urWcT5HXKAdVs253Tcvqf
	QO2ZtpIHzQScctKXcWjXg+HJZAGRct+k9wuMyBLpNOWenVkT8eCdYp0DVuW6uJFzYWE6h5IqJzV/o
	p1+P8fCPD/VTTzG66Howw+OGGsyPAguZoK5Ek46i3rUsOBkPy19/JOD1GHbI5lYp2ejfDQ449LwG8
	UQWbPxQJUV/ofA8xmEJ0/tdwcr5hVzjmmUpmOvcQpYFBWXes0UXmIRDWC7zgdbuiw2y7rY35gt/UZ
	IWNuCKL4wj0LXftwr6Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDRD-00000000rQM-3Ij6;
	Wed, 11 Feb 2026 16:51:39 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDRB-00000000rPy-2CcC
	for linux-mtd@lists.infradead.org;
	Wed, 11 Feb 2026 16:51:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfKkjdE1cfLWwAHtfOnPvPGVBKypUDjF+puhL5elGx/i6QUEeJVHZivNJ1QKY4gDkkP8r5FVUArYywCAKZUU5ImpUTK9yVbhjW6xkpsvQAWTnbrpwC74WQWUQZbwlyyviczH/u1u4hAKWvuC+WL4xZHRjwjRwnTJNZRPlOWcBfm+VqfT+vSA4Gh1BOWpgTdQVVtfLpydkdld7MBhwfeSz+nXw1tUr9AqlGkpcFV77TG1vDnxEAyocEELJhdBJQIvTsLqmSlZz/QeCINgtL2JUCVcVLyvHOcBxSK8OZzS3hRgJadfwsaAvqBXV0Ps6cUMxlA662IHwOKSHN8oNPu7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAC2EfUfRoiISkthTs7EFt0BMSKploOmXXssbVjTdEk=;
 b=YWXvOIegVthk6kCepf1URxClJEsW70V1tSIMKs/b5T8/R4R81rUoKqGYsosJe3/O1MWTQN8J7dRoAVVjH0Gpv4iIcWNzL9L6Eop3id+7agD7hFoa3SUMA3P2bTgmOkfF6lAMwPhnbtuQAoizNLmvfTGoSzHP4Ne3Szi9vEyt6TRNoVTkE7/9gMGkPyHUvqo4XEWTXy4nIyysxXn/HvsEtQw6udXiZIkT/mGJs0fy9PN2q8q64uIQiSCWAO89kT67lwAyPq+NGnYkvYS/iNwKASlhVAQMj0NuXF9na8e9i9yfr6dRTPbb2EItLyxwauPrHeLlIk/pz1fXRl+IGBcb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAC2EfUfRoiISkthTs7EFt0BMSKploOmXXssbVjTdEk=;
 b=2x7doOokXJ83Kbv9B50GuMshG3pz/rd5lyugyrgsziNeOj6jNvWTDsN69ejarulX7hFP8Toy+hjck1UNAdmv/R3SpM32MAQdbPybvNx6WoQNA5lU0BGKhYr0Yn5xoNOY82sw4Yw8PJXhFPvCQlFPXdJFOqyR+wVOC79FijzsVVnY41T47kx3c9OBQZkfxhCsWBkDx+D1cWt4Vbj4uZMEf4LXbWRJoEk5yiyNRDCgR8onY2nqVZ18VwbJvpXdSVh8cYxgRubQr5vKUKOJ8G3klBtxJ8V/3ltnYDztY3sya9wdE4HxaMG0wuSS/i0hIqAvJHnw9L0vG97pSM3zEZMHCQ==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by DU0PR06MB8549.eurprd06.prod.outlook.com (2603:10a6:10:358::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 11 Feb
 2026 16:51:31 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab%5]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 16:51:31 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Topic: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Index: AdyRCkfQa4Zi0XkcSIOaDwEHvEKqQgAfkK0AANfexzAAKpBxgAASt8aTABoBiQAAHEXIlAAWQcWAAB0NmY8AFokAgAB/U8m+ABbb5YAAHUm/jwAeEzQAAAAbHwAAFGe7lA==
Date: Wed, 11 Feb 2026 16:51:31 +0000
Message-ID: <DB9PR06MB7849403569974A214C101D77C263A@DB9PR06MB7849.eurprd06.prod.outlook.com>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <356439c2-5289-57d2-52d4-8b436252a630@huawei.com>
 <DB9PR06MB78490A50AB800FB36AEF5E74C29BA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <b93ff0e5-79ad-ff73-bdb3-e7e7d5c35256@huawei.com>
 <DB9PR06MB78498340513D9788FC7576FDC298A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d0eb0572-e383-466e-7b4f-97e4a853b7c5@huawei.com>
 <DB9PR06MB7849BCA2FA49A7AEE3D03104C299A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <2e8dee20-842e-e946-87a0-9ff0190600ab@huawei.com>
 <DB9PR06MB7849E51C72D54F8109C55714C266A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <581cbf94-a48b-3670-27bf-3ecca07ddcb8@huawei.com>
 <DB9PR06MB78496EADCD11536AA66C22CFC265A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <8f65d531-b752-b058-4163-09a66fd9a7a1@huawei.com>
 <DB9PR06MB78496CB06BF8E60582CF40F7C262A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <abfe8c37-11ea-a76d-5aea-014b39fcdf2e@huawei.com>
 <d5c8fe2d-2b78-3459-d176-da15ae24d1ab@huawei.com>
In-Reply-To: <d5c8fe2d-2b78-3459-d176-da15ae24d1ab@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|DU0PR06MB8549:EE_
x-ms-office365-filtering-correlation-id: 8099b67d-8584-494d-1daf-08de698dce9b
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?m7UYFGbOPGoNQZl+LkzzTyGiVawZrpZlgptuJlFVdWVM7PBtZcCXVXG6ds?=
 =?iso-8859-1?Q?+kQIgsoy7kEcS/7Y2gHhpQA82KVfximnq8fIrVUQDxmEgUA3bQTxQxd5Hi?=
 =?iso-8859-1?Q?EC4FKDI7APzeqo72od8Xm1yPrcOd9V/asJmW28GLnQiDAnvphYTB+OuUIf?=
 =?iso-8859-1?Q?kLivCc4w49W1DMIVEsRCAY6F7hg28mjQ6KjSOu0N0gqf7HHWVDSvEAjZ3x?=
 =?iso-8859-1?Q?+EwkyjciYmU1ewoTjKD/SzviKdoUWALMygVizdnvK/K3403pGh1dl8q3mx?=
 =?iso-8859-1?Q?HIE5WCGCzPp+x7YOp1FUQ+FgMjwaJ/sSNRslWQjuIF/fix8MpeKmHYyEw1?=
 =?iso-8859-1?Q?tteHIPQXxnV/xIpofxeGjSj7tWS+tcoVYikOQ6SjbVfrE5NhN3yKNC4mJd?=
 =?iso-8859-1?Q?p4ctvfSLpXcigrhgjE1i5hQeAvQb+DcC1HQS4W14Dfw8NmnIxhqQJw+lQr?=
 =?iso-8859-1?Q?aBxdh34LL7hw7b/Tg1oZ2/lV0EeUO0ur57oNUxdEBW50S4EclxJ17IXbfR?=
 =?iso-8859-1?Q?LcrHQSiuQGcKY3RjPcfFLR6a4tJOWFk4yoUysmol8utr/KCgCFpxvEKjdL?=
 =?iso-8859-1?Q?GyP1gvQUaIWn1rAPPdDbXEybjpXXcIjwfH9Il9yjaCo3uIexBgBDCJBg3o?=
 =?iso-8859-1?Q?F1V67tWJPexEPcQVYWrqp/yCh79WohmHOG1L7CkV7X3FapuQ59aleFmmAa?=
 =?iso-8859-1?Q?x/1/bCh9wMxq0Bn5+HcPoGATYWJBXPgiMN042VT9UxqIiwNMSvj1BS8ROm?=
 =?iso-8859-1?Q?yP8oiCCRD4fyRHETaPKzi5hqZFeKMUL2Xc4RVoNw2iio1rM+omrIaSo6Kf?=
 =?iso-8859-1?Q?DhYY96p3qmB+hujSbcJMhasMtQ2Jy+VrZkvPnukCdCCtOdgx4+k61M1R1q?=
 =?iso-8859-1?Q?diMB851t6hM2woZK+K6Lx8n2ffBRfNx3qH/aLbf1qQvt+QJj/Il/obhPTt?=
 =?iso-8859-1?Q?4q3wq3iv0KHkmz+1U6BYayhJJ7bfG/C3IYy02mkL9YuqN2gT+UUR55p09h?=
 =?iso-8859-1?Q?SklG+LrjYYtjTccwGq5nWQPSFU59bYLTBXL4VKFzcETRFRiNFRrWchfxiu?=
 =?iso-8859-1?Q?0mtN1SdHmLvTb96uO8jUf6qrkIBpjyNgltXs4rg/CcpsXgcqx8Zri8UU5F?=
 =?iso-8859-1?Q?Ig4jN46mK57hPHk0tDIoFXa91V+1eKjU7tYCEpKHVVL1U4LuU45jZkWXpB?=
 =?iso-8859-1?Q?qqCpF7ZAIm0kPNbb5IZOJpj92KJQxXi3yfpU3zuNtYiYkbQUZpJrc3IHaZ?=
 =?iso-8859-1?Q?8/ILp8RyEzu9Td9+MZG77XN+MKnzkTR7OUWms3XStbjPeGo0eAh/1eQbGB?=
 =?iso-8859-1?Q?B07nBWl+CjyLOSETb347HLsaXaVrcns0XuY4KatSJCVGGwSEe0kvOjBGsa?=
 =?iso-8859-1?Q?yUAQ7VuC5j4UqJ3iNVRLDeXTjPBWQ3hZZMI+SuL/xOHi1XYl4y149rR971?=
 =?iso-8859-1?Q?AdnQrB6mGEx5HfpVTCRhOKSHVE2tHAQxgigKwYDLdjUcVFD3LP/Zyod3RX?=
 =?iso-8859-1?Q?uBVBVQZ9lKzUIFZn50RbTY5fKeEsiodzssC3xk05vzplSGPVd7voBEcRbF?=
 =?iso-8859-1?Q?laWOnSu6LgKut9fjqit3fWnn1t8Z+YlHtsFSOIze5lfHd9jenVG7HJw+z9?=
 =?iso-8859-1?Q?lHbWKICYNuJAIlqBn2LZqboNdLZDTlQL3vtGUNjbeieIjQt2P+2kEWA5TE?=
 =?iso-8859-1?Q?NNu7MD2wpUua4lI+//Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jsUoSRu9RWVRXxUAHF9nNklHskSOc1pyeYQzbTMe8203xFfMB9wGEAye6L?=
 =?iso-8859-1?Q?gn0lWPVpqHR3EW2Y+Sdeu0dUZd0gPfk0Hb9RTAuST92bsOEzAUzjjuptMx?=
 =?iso-8859-1?Q?GNHA/AmTjEdJpLzDqsFm6eUf88PzQszI8SfYhB9rzoCCeKZSyxmZE3m2UA?=
 =?iso-8859-1?Q?xr70TxKp1j2rlFC9avSsUsYCRUKkzskUz8clQUN5L2R+a2d5BtKPcpWtOk?=
 =?iso-8859-1?Q?besEjfJ+rpK+WfUeXvwa0nfS7T32aomN3MxTlsQtACUeBcsueI1SS+ZMBc?=
 =?iso-8859-1?Q?bDTheWzAd1yjKbqitJ34l3hXIOcHiN7EdmBP7ni+amq0r3k8d7kIpMlbYC?=
 =?iso-8859-1?Q?vCbu/T5Cqx2PsU3qh1tAfVORvbDkz15M2v4ZNHV2aO/y/xorSNrAieXCku?=
 =?iso-8859-1?Q?rdwCPAgTu6AIcqZUu3+17vPNCkD45KIRcLiLxNohBs9WBDMU29Xv6vaw7h?=
 =?iso-8859-1?Q?kv6QEk7MsQauxR5VXdW1Z16TFkpIn82/sPdVpgdUAUW5G70CG3uD/MVoSU?=
 =?iso-8859-1?Q?doWyzAyPTY1/mG7U/Dw71LSpfaWk6DDMvcDVObvqTgWKSew9D3evdWXp5b?=
 =?iso-8859-1?Q?+Xevy3ZhHMhnL66oEar1p2XO/ydMzasXTGS0zTYPy3YiMrDX9+wymm6oid?=
 =?iso-8859-1?Q?ey+2v8MelXsK7q6rXWgoT6IKaWbQWsUa4URoLiLWxswjShrYDbvBNqRnXG?=
 =?iso-8859-1?Q?eyjtR/myddQQRyKPamiZIrPbXIs2NGXdBT/sODw6uMjlVv8ufuxvLQsyQ6?=
 =?iso-8859-1?Q?TWi/Mv+mfdE5nV91TZAcAZaCFj65FQcIU7f209xPSCn9drMppSg3UE4a3S?=
 =?iso-8859-1?Q?lLxyVwI5Lv4uE56oSmqC0Qg/IH276mKCcpHClh6/sudcyry8TeQrzLGPl6?=
 =?iso-8859-1?Q?y7Us6CJf1wkEFHmKzAgeqdtvdt0ga3+rEOR9tW3J8FLaOMPBXXnTSkobwg?=
 =?iso-8859-1?Q?S+sqyeycV6jI3SMTRUEDnr6OG79d3QEyVrtRWHqcLaPWnx7zEyxMgpOZtu?=
 =?iso-8859-1?Q?1xc2OKeHRvo6NqQvPnmOgXRUSmVaAlDp8HsB57I4yQh5aysIV9isNXN+32?=
 =?iso-8859-1?Q?KctfOmzjeHa+eYmgnhScAk16FwKAKftINESyqH9n5j+VHhzVRvUhVzXon8?=
 =?iso-8859-1?Q?u8xWIuAkby7tuKLxL2704WgEUWFMpH1j6F4EvIvqEpiXC5aXbB1yDpQrbV?=
 =?iso-8859-1?Q?wG5pNwm4ZdVDnaXV4IJ+lANT+OF2yGucQDZ2UGt7mW6byWv0XQtWPzIYN8?=
 =?iso-8859-1?Q?gGjtXKCKD6wgTIIN+vEjP8p1TAJvEBDYmn9MezgrBWGWoY9hXxxHDDsJTg?=
 =?iso-8859-1?Q?eRPa/520b6mHflSOaNi9IeiYOXqjTcdP1zCGs9zLlKlPjH8vW0mjVW9o1j?=
 =?iso-8859-1?Q?AULI94QHgwovNkik87AxNNch8uDUKZH8h9kH6mECh00mXSpeZdyFQ910Md?=
 =?iso-8859-1?Q?c10LNfF8rjjaBOTHUOqpcIXpIraXA5yYz3by0FGlt2L/Za9hxmNDu999Ly?=
 =?iso-8859-1?Q?KDcMwxhn1Xy8rhq0hg9o1QZc8h2CqJEhciHxJldfl086Iw1YEg5Lz8Lx78?=
 =?iso-8859-1?Q?PJQQOkFvxJV/QjqaQ1/2zdhYNCnQjT8l6B7RgccvFHhWHenEmJ9bHqkFak?=
 =?iso-8859-1?Q?vE0b/ugkTi9Fgsc5iKN0i/JehCFOJKqa4AMhddWj5HRSzim+hjggXfiYxV?=
 =?iso-8859-1?Q?9IzpltsYVUz2Ojt4RuHt1DO2sQ8t5t1pFJa/xVIdQb08Kp/PkP/VsSvRDc?=
 =?iso-8859-1?Q?JQRtQeVCjCV8p6+6Kf0hh0Miy7XkZmpJriyk9VQRClB+zK3k4J35Rn1Pkk?=
 =?iso-8859-1?Q?VqrUDD5Qjj7Gvt+mmWQQhZZL5tcM1dNhQUa2XyRrnWncDq5pk7oG?=
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7849.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8099b67d-8584-494d-1daf-08de698dce9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 16:51:31.0293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BZXQVGjPs30dd2iwAvfGT+Zw158kAHtzfWsZOEhSmgUHdFHhXET488PFrsHSussS/8fzu4pRYc2nH3W5z1OtMp/4xZlLwu/XK4Y8dk26Kckk9oNY9xACkkwsF/gU/I+r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR06MB8549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_085137_601421_E6CA6176 
X-CRM114-Status: UNSURE (   6.41  )
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

> What does 'application' mean?
I meant just completely changing the kernel and rootfs that is there as a backup
image and using a more recent kernel.

>
> Apply following patch in 6.12:
> [...]

Unfortunately on my system this just gets stuck, because the only way
write_orph_node gets called is through do_commit calling
ubifs_orphan_end_commit, but that path is never executed (except when mounting).

I tried mounting with and without sync, same results.

Best Regards,
Tomas
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
