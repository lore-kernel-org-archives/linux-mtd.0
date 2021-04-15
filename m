Return-Path: <SRS0=g3N+=JM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7292BC433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 10:06:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD36B61029
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 10:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD36B61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Qbt6vsWan78QgZ9hatcLEE4nMB+WyZ0Hd5293AdWlM=; b=T0atDudx9u20pW2MDRRruHPkU
	RSF62VocziTEQq/0MuK5QYTKrqNyE5bYKPv6L+ijTNbFu+80fVa1OstfSF2Z1EyPBL9tvdCTkGjeU
	Yz1EWsZ9BpxZiDBrxN4jELKa0IVaqFJd5w6qsvLF4GBg/BHO+sQ0OHG26Ne9+ubaIYe9RpJa0vx96
	YZnozWRU34m5O42fEWXN58pAKVT0fn8WY7Bo2pfrbN7g4sU9Oit341imwZr72kHG+WVQ4F6cW17Dy
	8M4dxzIFlnEtTEU3WNWqRnEpROITgWtqP8uJbDD8ZHK/G0zo6Ukl02M1eI1vwDittb8n4irKpbm4t
	uG7PraVZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWysX-00FeQ9-Lp; Thu, 15 Apr 2021 10:05:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWysU-00FePn-1O
 for linux-mtd@desiato.infradead.org; Thu, 15 Apr 2021 10:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Description;
 bh=xykcbZf88LnM/rmno8d3bmSLuhAYkV0gZTYuOr41FLU=; b=N7RUY5zk3pnFLA+uFAjQOt01Kg
 PUlBfXr85/oMLJLixWwjyeTMzditdO8Y+1D8h+/JqQ45sTOQFBJn4o9ZwAZKHxdv9YK3+d7+O5gor
 LylaNHrqeOf8xbwKzjmJoT9DBRXpt8iKGY9HRHqnlZVyuMQKWvVK3G8iLproLRBEdOoyXZDEYK9F0
 jjaZa3ZSRz/yp49XiS9muL1Lj4daMNqb1VIuZj1SpmszCqLJb6D36oE4d5TzED0VYMVfPcs/a9Y7t
 oOLbYTcV/defOehzjwkQn1Nwml+ENKiI3X6ncCTVQxzLGBxfEC+nR9Z6f/GpnTn3DC81O1C2VzfwM
 piumQrJw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWysR-008SFN-6e
 for linux-mtd@lists.infradead.org; Thu, 15 Apr 2021 10:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1618481134; x=1650017134;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=xykcbZf88LnM/rmno8d3bmSLuhAYkV0gZTYuOr41FLU=;
 b=AEb6C+m+ghyiWvQ4P5I3GxZo6RpAckCxe56vNx19SvrNXrYG3mz7Af4b
 tTf0+K8wf1M6NCqNHeNSPOliuxEBYra/I9imgvIMM/8NC9FzoT4JvrVD4
 0EohAS55idlOnCF/FaQb0kHU9FyI+SBrGYOtPme3NAaee/tTgFT/BdjwW
 xSJCMz18f3hxvkQ3SajtCrrhRN6vDj5EryJ2otgS/Q17HXzhd8DIB0Eem
 ZokMgZXmN8wPJbIg7GTz0yPMjkd0g1xKSVtVzs/FAKvpwKBaXiojcVrwa
 bc0B7zGp5dLzyb7EvDi9UXySee4TWfIobCPZGIH+Dv40yrYOy5f9Dzaa+ Q==;
IronPort-SDR: 5bwXnLLQYT5s/++WWwI4paZTM3AOVyVWzujoMMRy7ySAJSEjR3evkBDwTMDDnSgtldUQIJVLMx
 BbnUQvgnkXyPEN3Pb3fkUlPSsIiWXSLoA7bLPJLnKZnT9hPzZIb6+p/IH4DIPisKi0DtUisywz
 PdIThUo1HrD4LJVj7g/pEK3b5T/JNQo/l3n1ozbGHB+cLcX/O/dhHsruuG8MJvCAHWBWXGhVA4
 ryHq+wGu7NqMhBSdADLZL6NXKq01RpRb0XtbpgzW7xXVlum6FAsG73F75BitUfi78v91n4S5Gj
 y54=
X-IronPort-AV: E=Sophos;i="5.82,223,1613458800"; d="scan'208";a="117115524"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2021 03:05:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 15 Apr 2021 03:05:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Thu, 15 Apr 2021 03:05:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTkudPo3J3dRYH5zU8oZlF+Kkvhi+RV8WD04D/mf9l6FzMboKRI459GBQJZPEd7yABV8mKqCH1kYHE0nGAQKXYQ9KqOYtKl+KX3v/O/TMrdjPRqGAOLFdwKfs3CBA6VwUYIkPDj0s2G1fjMjoNLgOQjplqMp4DWUBg/UBf+xf4yhVOtWKDnNI1SH9hVq4RNgkM6b+n4MFr/mctFUJOMDUEZ1AZHZIXhr9vZgr5WlIHuxBumob46spT2AQ2BLqNIYZFr5TH5hmPEiLjzRuRn3bcvc0nOS+jqYtnD2QKliaUI46ffK1t7FpOdJ04Gc4amA3Qfx/hJxI67DwQ0Blty+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xykcbZf88LnM/rmno8d3bmSLuhAYkV0gZTYuOr41FLU=;
 b=RBp5ajdVcQsZGvc1zVCB+DJnKHVCPTjaltt8piW/nvJ86Qstz5HWaKpBUcY8cdvNR7njag6OWRZ5wGQ7vvBCM6Xmx07SggE9NecpM13U4ZWYiyLtya2rvcoFsrWmpWhvbaQfyqZA0WtV+86I8t0F/72ZueFEALigo0qdLlDzoRDu8+uhphyUzNAeOYSSqHhauuNm/pidEDUXF0bpORMt31PqzKtlqdIwkdw0BHPwnRvMUXsJDB+Yz/I0R0VTq0NXUlFDJQSPfbekgXI6b6PlU73ULvFnS3gBW/cuKaEmNmR6RLgqWU7NCObu2JZ13vtFNcOSt2f3ExWyUs6aS9rZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xykcbZf88LnM/rmno8d3bmSLuhAYkV0gZTYuOr41FLU=;
 b=avpOGjlnro2m5DHCnLxt2bZz166sccuR3QjNld295ETNVeYujt7ETpJ+7Dhr8RNC/TyxZ32qdvfu61ytJTmHFW/tVSZH8YHsjmfkf/NJmEdNraWYZ5G89+UKXqJ8hvedBcGXY7WhJMUak+3TJzf+E3JfsKXsIi4sL8Vc9pEg6Cw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2941.namprd11.prod.outlook.com (2603:10b6:805:dc::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 10:05:30 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 10:05:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sr@denx.de>, <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>
Subject: Re: MT25Q Advanced Sector Protection support
Thread-Topic: MT25Q Advanced Sector Protection support
Thread-Index: AQHXMdtPCUvJuRIbpk+8HakBSSVVoQ==
Date: Thu, 15 Apr 2021 10:05:30 +0000
Message-ID: <f589a60d-0443-7268-8919-b5740178dbfb@microchip.com>
References: <f59dc821-22fe-27cf-b93d-147709d64983@denx.de>
 <72427f10-4a3a-a0a4-f429-6638f9d428d0@microchip.com>
 <4d74e69e-270b-9ef8-71fe-11538e8f72a2@denx.de>
In-Reply-To: <4d74e69e-270b-9ef8-71fe-11538e8f72a2@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c348db7-f6eb-43a1-0cd4-08d8fff6001f
x-ms-traffictypediagnostic: SN6PR11MB2941:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2941A0600A0BAE751BB34CFBF04D9@SN6PR11MB2941.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uq2DtdKSYFDTBpZOJWpxON8W9Pgetcp8o3pq7z5svD5Ftr0TbGjHocweVDGnHoMjMfPENO2Xd7LexNlhmpB/ibaZPE9npbJck6R4CUaMXHCEDveKd+Z2dQeOax2rqUmTWkP2QeecYHY5kp/jAHV/oDN2DN4jdgnwDJaSUOx53/tQ/LbR8tgB/PMtB8dzf5B1p/Fz+6EzKp4vlMAuNDnT5Bo5fjSkoBiu371gIenAUu3VMydeBGvJbzvz2wkYQrYXhbuAONiAgMg6cYHAFbUp091KVGZVTNdVqVBEw9amMxgerQJ6dLjpJSfuaey/5n61xUvpvXu6orMr4YAhv4hrQrZBpqD3CFX8yezZxE7RxVio8oN4N+1FfHhRCe6/71GSXXuQ35AReClXlKTcw1VJFx02j+yPwh8n4T07iBpxx8duBKqMvxTNl+zL8KJfNIIvGGEzRscpFkK0LjF2E/dwaJS6fMrlR1Nrzpd9f6r2oz7cuDVW4J/mZPjZwVFJkbyp3RndglwVpxRykcyxcxxlaaO2d0w97OOYNY2xMsZi6fuy6IqAKNcFLjcJAL3kNsWSWnsENTQZTnX+i1QGaWE8zLYSO/6zbuNBsoFmHuhIFEuIzUsGavzbC3g5jrEUf0Y7Df867jhmm4j8IPhcaF5A1LbXYDxb7vHU5hhW6vZa8Qvp6g4N+0gXZNlimKuIuByf81wH+P3JuYrWlT4IRK0mK0E0Xh9GjT6gOHURqlUF3gsNEqGjXWUTTwdcJgUHwHHfNfoX5iM0jbHmrEgl/5/zAw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(396003)(39860400002)(346002)(376002)(6486002)(86362001)(110136005)(966005)(38100700002)(6512007)(64756008)(66476007)(66556008)(66446008)(2616005)(2906002)(8936002)(316002)(122000001)(8676002)(5660300002)(31696002)(83380400001)(31686004)(6506007)(66946007)(71200400001)(478600001)(186003)(76116006)(36756003)(91956017)(26005)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bktqbUtzNEFUcEFjZjdOZTFsa1ZsdWJpbzR0N2EvRFBrd2lRYWQra2IrNEI2?=
 =?utf-8?B?RmVpS0tpeVdwS2ZiY2Nyb2sySVJmaWVRd0tBOHM2YlNCTFJFQjZ4bko3NG8z?=
 =?utf-8?B?a1ZpbU1YY202SDE4OEpHMFA4NWNDOURyaDI0MHAyZDNNNHZNd253Z3lBeWlT?=
 =?utf-8?B?dWVIRmpHTnJQWmpleiswRFZyZCtmMmdVeW5aR01uNFpLeXFWd1ZVaTZXUzBU?=
 =?utf-8?B?cXZPQ09ielBPdExtNWpIM3NmQmFEUFFwVml4amFyUFZ0R3pmRjZUR2JFNTFY?=
 =?utf-8?B?UXhnUWdkeFF4c2oyVXQ2Sks3RjlUOWNOUjQrWFF4MlJOR1ROOHRGK3J2WEpD?=
 =?utf-8?B?eDRDWnZ0ZnlRbHZsRXlpNGg4ZG82OSsxWjI5UlhUQ29td3RRV1FvcEVMeWZS?=
 =?utf-8?B?ci9mSHdvY1lCMStwaVRucnEvTG9oREY2cHovazNNVWNZeExKUlVlL0dsU3hX?=
 =?utf-8?B?clpJelFkNUNYV1RURk1vdklpNlovMTQxVmNPQ3prUlkvMm9Ea1AwdWZJWi9m?=
 =?utf-8?B?bTFkeWdvaXlqaWJYUDVLMUo5a0lhUHJkTkhnY2hDYjJ3clZiR0xkMXN3aE9w?=
 =?utf-8?B?eWhkRzFwMFFTWFlKbHlzZXFOeCsyYzl0Sm1JY2RvenFuKys2TDZyakJzcks5?=
 =?utf-8?B?ODltZEErajNrY1NXZnpQdEo0WURIRm90eFJwcEZvRzVXZXIxZDF1Z2xOVEl6?=
 =?utf-8?B?dU5WZFhtVjU2ZXdKbENqRG1CVjRGNjFQbUUxWEhxeWIwOGxEZWhKZk80WDJR?=
 =?utf-8?B?ZDgyK0p1cTJHSXYwZnJIdjBoSGh5elNyOUVBRGN2ZlZQUmlhSFh3SEVxMUwr?=
 =?utf-8?B?TkM2Y1ZwS2hZUkVKWmJUUCtVRTdHTGVLNnNkUXJtVURiazlRNFFKbFpMWEEz?=
 =?utf-8?B?d01PZkZlTzFxRkdpTGVPMDlSKzdnbURGMlhHb0VhQTNleDN4UUZzNUlLT2Rk?=
 =?utf-8?B?cFZ4TDJoY251MFYrTUt5ZlJaRm5QMDVMYUJzY1lSQWM2TjlXK3B6QlNibFR1?=
 =?utf-8?B?UUw3alo0VFBBZC9abWNKMWp1clRBTEZGS24razdNUXZ5TzMvdk9VUk10bGx3?=
 =?utf-8?B?Z2ZmYjVNVk5VOGN6UExaMXBTNzdqak5hVDJDVUZEci9HZDIrTW5reDRSWEF2?=
 =?utf-8?B?MDU2a1lxblVHNUcveUVvOWk5MDQ2YlZVWG5GYlN3SVArMzBHOGdybjlYVFZJ?=
 =?utf-8?B?cU1FQk1Wa0JpblMvT3puVEFoM0UxQjZVUXJwaXY1MGRqaGhmRzM0UWQ1aFVt?=
 =?utf-8?B?eTBwZXRaU2hDTXBFQWxpNEE2Q1RrQjFwTmZKV2Y5K3dock4yb3QzdDFVbkNE?=
 =?utf-8?B?aWkrNndtMXNqRDU4OXpjZnpuUlpqQWE5NG02ayttdEs4OE91SkIyUXpCcGxm?=
 =?utf-8?B?YkpGOWZBUXVTUG5LV1hOdjlJUnVEams4QWtkeGc0eGZ0K2Q5Q1F5UWlTQkdw?=
 =?utf-8?B?TVk3WEdid1dCWFIxNWpFakJXNnJmV09UYmJsM1lib1g1YlFWSnpOVUZRTDlV?=
 =?utf-8?B?aXlIa2V1dnpnWHUxdGhkVHlpb2I5L0JrK29rUFBEdUk4b0xlTGZ6OUM5eVZF?=
 =?utf-8?B?eE1MYjJHY1AvdVFNd3ZKT2wyYnQvTjZ6T1Z6VUVXdmE3aGxpelczUzVGaXYx?=
 =?utf-8?B?RVExTWpMcEZlS1pvZUFIblV4QWdFZVRQVnhhRjB6UFZueUJPSmxodlJiOFY1?=
 =?utf-8?B?Qk9BbitQdVd5VUp4Ylh6d3hyUTg1QzRXckljTGY4bHVFeExzZmdDTXYzbGdm?=
 =?utf-8?Q?BELb1V2LYfa5xnW2ew=3D?=
Content-ID: <1725ABB707001641BCBDB3F608135E14@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c348db7-f6eb-43a1-0cd4-08d8fff6001f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 10:05:30.1310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UFd4AM6lOYO4xyW2nmzP9kbAgshnRsnMr0CjURoH01zFNMM1uO7QfQbsjcMRyApzbhxX0musQvfhbnODxNPa5KOTuXw6tHm9c7ABtplHpdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_030535_304105_B6573887 
X-CRM114-Status: GOOD (  22.45  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNC8xNS8yMSAxMjo0NCBQTSwgU3RlZmFuIFJvZXNlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIFR1ZG9yLA0KPiANCj4gT24gMTUuMDQuMjEg
MTE6NDAsIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IE9uIDQvMTUvMjEg
MTI6MjAgUE0sIFN0ZWZhbiBSb2VzZSB3cm90ZToNCj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250
ZW50IGlzIHNhZmUNCj4+Pg0KPj4+IEhpLA0KPj4NCj4+IEhpLA0KPj4NCj4+Pg0KPj4+IEknbSBy
aWdodCBub3cgd29ya2luZyBvbiBhIGJvYXJkIGVxdWlwcGVkIHdpdGggYW4gTVQyNVFVMTI4QUJB
MUVTRS4NCj4+PiBBbmQgYWZ0ZXIgZG9pbmcgc29tZSBpbnRlbnNpdmUgUVNQSSBOT1IgdGVzdHMs
IG9uZSBzZWN0b3IgKGF0IDB4NDAwMDApDQo+Pj4gc2VlbXMgdG8gYmUgcGVybWFuZW50bHkgbG9j
a2VkLiBUaGUgbm9ybWFsIHVubG9ja2luZyBkb2VzIG5vdCBzZWVtIHRvDQo+Pj4gaGVscDoNCj4+
Pg0KPj4+ICMgZmxhc2hfZXJhc2VhbGwgLXUgL2Rldi9tdGQwDQo+Pg0KPj4gaGF2ZSB5b3UgdHJp
ZWQgdG8gdW5sb2NrIGl0IGJlZm9yZSBlcmFzaW5nPyBZb3UgY2FuIHVzZSBmbGFzaF91bmxvY2su
DQo+IA0KPiBJSVVUQywgdGhlICItdSIgcGFyYW1ldGVyIGluIGVyYXNlYWxsIHNob3VsZCBwcm92
aWRlIHRoaXMgdW5sb2NraW5nIGFzDQoNCm9oIHllcywgSSAgbWlzc2VkIHRoYXQuDQoNCj4gd2Vs
bC4gQnV0IGhleSwgSSBhbHNvIHRyaWVkICJmbGFzaF91bmxvY2siIHdpdGhvdXQgYW55IHN1Y2Nl
c3MuIEkgYXNzdW1lDQo+IHRoYXQgdGhpcyBjb21tYW5kIHVubG9ja3MgYWxsIHNlY3RvcnMgaW4g
dGhlIE1URCBkZXZpY2UgYXV0b21hdGljYWxseS4NCg0KeWVzLCB0aGlzIGlzIHdoYXQgSSB3b3Vs
ZCBleHBlY3QuDQoNCj4gDQo+Pj4gZmxhc2hfZXJhc2VhbGwgaGFzIGJlZW4gcmVwbGFjZWQgYnkg
YGZsYXNoX2VyYXNlIDxtdGRkZXY+IDAgMGA7IHBsZWFzZQ0KPj4+IHVzZSBpdA0KPj4+IEVyYXNp
bmcgNjQgS2lieXRlIEAgNDAwMDAgLS0gMjIgJSBjb21wbGV0ZSBsaWJtdGQ6IGVycm9yITogTUVN
RVJBU0U2NA0KPj4+IGlvY3RsIGZhaWxlZCBmb3IgZXJhc2VibG9jayA0IChtdGQwKQ0KPj4+IMKg
wqDCoMKgwqDCoMKgwqAgZXJyb3IgNSAoSW5wdXQvb3V0cHV0IGVycm9yKQ0KPj4+IGZsYXNoX2Vy
YXNlOiBlcnJvciE6IC9kZXYvbXRkMDogTVREIEVyYXNlIGZhaWx1cmUNCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBlcnJvciA1IChJbnB1dC9vdXRwdXQgZXJyb3IpDQo+Pj4gRXJhc2lu
ZyA2NCBLaWJ5dGUgQCAxMTAwMDAgLS0gMTAwICUgY29tcGxldGUNCj4+Pg0KPj4+IE15IGJlc3Qg
Z3Vlc3MgcmlnaHQgbm93IGlzIHRoYXQgc29tZWhvdyB0aGUgbm9udm9sYXRpbGUgbG9ja2luZyB2
aWEgdGhlDQo+Pj4gYWR2YW5jZWQgc2VjdG9yIHByb3RlY3Rpb24gaXMgYWN0aXZlIGFuZCBsb2Nr
aW5nIHRoaXMgc2VjdG9yLg0KPj4+DQo+Pj4gRG9lcyBhbnlvbmUgaGF2ZSBzb21lIGlkZWFzIG9u
IGhvdyB0byBjb250aW51ZSBoZXJlPyBJcyB0aGVyZSBzb21lDQo+Pg0KPj4gSWYgaXQncyBpbmRl
ZWQgYWJvdXQgdGhlIGluZGl2aWR1YWwgYmxvY2sgcHJvdGVjdGlvbiwgeW91J2xsIGhhdmUgdG8N
Cj4+IHJlYWQgdGhlIHJlZ2lzdGVyIHRoYXQgZGVzY3JpYmVzIHdoaWNoIHJlZ2lzdGVycyBhcmUg
bG9ja2VkLg0KPiANCj4gWWVzLCBJJ20gZGlnZ2luZyBpbnRvIGl0IHJpZ2h0IG5vdy4gOykNCj4g
DQo+Pj4gb25nb2luZyB3b3JrIHRvIHN1cHBvcnQgdGhlIE1pY3JvbiBhZHZhbmNlZCBzZWN0b3Ig
cHJvdGVjdGlvbiBpbiBMaW51eD8NCj4+DQo+PiBJJ20gYWRkaW5nIHN1cHBvcnQgZm9yIGluZGl2
aWR1YWwgYmxvY2sgcHJvdGVjdGlvbiBvbiBzc3QyNiBmbGFzaGVzLA0KPj4gd2hpY2ggc2hvdWxk
IGJlIHNpbWlsYXIuDQo+IA0KPiBEbyB5b3UgYnkgYW55IGNoYW5jZSBoYXZlIGEgV0lQIHZlcnNp
b24gdG8gc2hhcmUsIHNvIHRoYXQgSSBjb3VsZCBiYXNlDQo+IG15IHdvcmsgb24gdGhpcz8NCg0K
VGhlIHNzdDI2IGluZGl2aWR1YWwgYmxvY2sgcHJvdGVjdGlvbiBpcyB2ZW5kb3Igc3BlY2lmaWMs
IGhhcyBzb21lIHJlYWQgYW5kDQp3cml0ZSBsb2NraW5nIGZlYXR1cmVzLCB0aGUgaW5kaXZpZHVh
bCBibG9jayBwcm90ZWN0aW9uIGlzIGRpc2NvdmVyZWQgYnkNCnBhcnNpbmcgYSB2ZW5kb3Igc3Bl
Y2lmaWMgdGFibGUsIGV0Yy4gTXkgaW1wbGVtZW50YXRpb24gd2lsbCByZXNpZGUgaW4gc3N0LmMu
DQoNCllvdSBoYXZlIHRvIGNoZWNrIGlmIHRoZSBJbmRpdmlkdWFsIEJsb2NrIFByb3RlY3Rpb24g
c2NoZW1lIHN1cHBvcnRlZCBieQ0KbWljcm9uIGlzIHVzZWQgYnkgb3RoZXIgdmVuZG9ycyBhcyB3
ZWxsLCBhbmQgaWYgeWVzLCB0aGUgY29kZSBzaG91bGQNCnJlc2lkZSBpbiBzd3AuYy4gU2ltaWxh
ciBmbGFzaCBzdXBwb3J0LCBidXQgZGlmZmVyZW50IGltcGxlbWVudGF0aW9ucy4NCkkgaGF2ZSAy
IHBhdGNoZXMgYXQ6DQoNClRvIGh0dHBzOi8vZ2l0aHViLmNvbS9hbWJhcnVzL2xpbnV4LTBkYXku
Z2l0DQogKiBbbmV3IGJyYW5jaF0gICAgICAgICAgICAgICAgc3BpLW5vci9uZXh0LXNzdDI2LWxv
Y2tpbmcgLT4gc3BpLW5vci9uZXh0LXNzdDI2LWxvY2tpbmcNCg0KQ2hlZXJzLA0KdGENCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
