Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C77C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 07:37:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB8F6513A
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 07:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECB8F6513A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ji33jCxPiVAe7wYCAGev413026JeV1HF4p5ObiMRbPc=; b=ccw0tBe2w1Jl1j3dtW8hSntVH
	mGCpqwt13SKIXdsQfQiPv3rmcKBl53oOF799LUDuj7rwaP5wiJsV4OMYvZtdAuyORxgvy1mroSJpo
	DhlboW3TVtqXXObO1OPhBSmAhK1A/HZeu/mgRtYBvlUxaZXrQncXFCqCPuoIxkuMrzjsN+ONmCTgV
	gw5vGQlxqklO1dY96ZSSJv05jjg2/FVE/OapkK6XH1uxF5rq0nMweih/MZtkpPSWugUsS3wxOb7LC
	na03i5wjYAWJ6I9W4sz9k1dbvNEsNs6iZnKQ6a8HSjmS4D9kZ9YxVQJq01ouE1g7DwuNBfr9tNlh7
	W7XkCdyog==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJAR0-00FkW6-QF; Mon, 08 Mar 2021 07:36:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJAQo-00FkOr-N5
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 07:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615188958; x=1646724958;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qyLupUXhqYPRpfjj3oGQG5cZ7l+plANOuh3eVJUyxQ4=;
 b=jRgu2PG5lulpSHJL5Ha7o/hu8NbmE/VxzxuPbEBK4uMOrCUxyBIYfoHN
 MngSHVdhQiHpa5/WnxFOVaf0qnc5/NHfMkXAeF422XaEkJER1Kxzn4cwb
 6o/aEhW0e9D2Lnj3BPBzgq6cFKHZNj8EPqWxruhUDZHUgg2c4iPrjwFFx
 2WW6fTBxn15RyCH7EJxjYGhQzKQWtvfnHFiiXjw0eT42asjM1mP98Jo5S
 CzoWtsEV1Lr8/KUvrQ8PkbU+SUfZmL5hGBk0T1DZuSrY5gc4mgN3Ebea2
 iIp9x8ObEXoC1hBvnmWkAwm2kze4qL8wEYllcSyeWdPlhujn150qNGihU g==;
IronPort-SDR: 4W/a8IbvfB95XgjP1Q0rccAb8KiaFEea1gahiQqeCcyQdkBWY/WyPVW2b9/TTlLDY1dDokc3Z6
 8LRbg2iBMGn7U83vA7d/R9NKbGOT4znUj8lGBKvkclUtcSlCwxnpRNI4IMk650QyX9epNnYa/K
 JbIYpsjbYyz06IWOX93v+g6zNzhM9wbZs0WROuv82iShUqNqzBs9JRrfRdrBwoIiYZW6HCODor
 9N+a1IYS7Ewc61JDjSQ+Hhe/zqrsme3FiMDiBshvq2k5Kh0gG5Hho2b6msTbhZDux8I80+Tdxy
 lW8=
X-IronPort-AV: E=Sophos;i="5.81,231,1610434800"; d="scan'208";a="112319002"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Mar 2021 00:35:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 8 Mar 2021 00:35:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Mon, 8 Mar 2021 00:35:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTh/A6KbQRowP9h6QhCZVM0hzY23YGLtEnv06tBW4MsOQkPcMlv5BRxgZeMmXYwtawjKWpsw+ZMaiNR8A3j3c3Te8VQnjlAfkGXKhHxeX+1ksH7vGsIi944ycmTeM969CnzGogM6qkYoft93WcHVbGKpwhSD32xEOJbXNZZFSg4ENeXCim7SXfIBluLO3dCCbZc627botjGBR4Z7MrDnSPsIKCe0rlFX0nX650DAybzue+NTLKuzOCEKM5PF/GuN/Aa9wmHRYiWVvs+xqEltMJxcbDoOtiD8eJEuktaj+FPACy+DXWfRmMxspaJW5ui9suL+dTZQjKw/gDCwQEj4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyLupUXhqYPRpfjj3oGQG5cZ7l+plANOuh3eVJUyxQ4=;
 b=mIqOgKubnCMjp0fuBdwABkysY63WFv5jzun57J9f3XwTpRc+HRcPQt8DYPxQqcOyqt5JShQVVqKw+ty2rSM/1n0sglZW9kYzpKrDHL957Axu+DgzR8wrBgV+XibJtSDOvo7COZmMVEcZaSR8JetcpyV7V7UwiAoMsddoPFaup5iHwFQJrbdGchTLmGGNIsvm7hXtxojMWXEC+xyF+P8zMQw3V90UPwFtOL0Xm2RHKiYcSlN8rS106g5W50iYoy7S4+6K7lUHd8m8d2cM5u6wIuzS+aQPOQZ/WSVCj8TM0xk8hYGJk5beMZmChzOmDzyQ6WEPeu9UaOLdQD7C+QaRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyLupUXhqYPRpfjj3oGQG5cZ7l+plANOuh3eVJUyxQ4=;
 b=Xvt46NiiP7Fp548BtABF3XmETilN6QO8ywXb+z+LFfwcInT/C2X/ZMvFMfuldw1NAa7hvvl/BbxcUtdV2P/7rg53KYYbBiuY/et2v/kcGlpWNBFmZpRy8LV9bsTMaZwu7dmhaCcQtgDgSkTs8RLyDv1yPIzQuc3hjPHhqrsIKsw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Mon, 8 Mar
 2021 07:35:53 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 07:35:53 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <yaliang.wang@windriver.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: core: move Spansion SR ready codes out
 of core
Thread-Topic: [PATCH 1/2] mtd: spi-nor: core: move Spansion SR ready codes out
 of core
Thread-Index: AQHXE+2p+kmTz0C+wkShiCUl//GWUA==
Date: Mon, 8 Mar 2021 07:35:53 +0000
Message-ID: <968a4761-78e1-d0d7-69a8-988867eca91a@microchip.com>
References: <20210301142844.1089385-1-yaliang.wang@windriver.com>
 <20210301190829.foqbaroznavsf7ka@ti.com>
In-Reply-To: <20210301190829.foqbaroznavsf7ka@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8271ff92-dfd3-44ce-0aa1-08d8e204ce14
x-ms-traffictypediagnostic: SA2PR11MB5097:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB50971DD8175116C51170D296F0939@SA2PR11MB5097.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mst0yrClFWsT2Ur6SjoTSNMnqy4QRMAxwg+1XnIbafXJ2X9PoGZQEW2UDI0TjckhS4lyctgM3iOuPjI7uVa6VdOvwCeBsreXjCeDzc9wl+Cb5R3k5rvaZdsFg0STZaWdbln0bjARYP9W3s0a0HA2hHec63m4OmCrRbGLv6TUYjLgkTg6BqMTQch51VZP46jVDQsUG731K8pYH6EZTeWvEZy4kSZRakw4Rzd+RBRL9bvmyw5t1QqJ7N+pwkhh1XMAjKyS4VzgmE4DmF0M7aQvqTWV3zLHnx/QmIw5fNAO9glQGudLvHTuqtCtTzEGP4zu0ek8D/F0E6spEENlFWKhUPghHBB7NtmB/saaKAZnuwsGCAIyGeBHboKZixhPD4ViTmyTP5k77pqxJYLImtduI66HXDXWqBbruvRn/Ug53LRh3CVBQ6HNRtDwdOagEaM5d9DcvzijwOtRqjaWjIbFx2F24CV0BJbsUtq8MDD4TDQfJ4amkhjlOfZzCZPyQlNojrfsrnIE2KArcY8pIPs2T5+jgQmxX1Dd27t41HFYSYZlPPFnxfMVlsKi5Kii9Wt1WLyGnu/bSDRED7uDP/ljaI4JX0BAcbHEsMEPLLGPaIs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(366004)(39860400002)(396003)(66446008)(66946007)(64756008)(86362001)(66556008)(66476007)(76116006)(54906003)(91956017)(478600001)(316002)(8936002)(5660300002)(4326008)(110136005)(31686004)(186003)(8676002)(26005)(6506007)(6512007)(31696002)(53546011)(36756003)(2616005)(6486002)(2906002)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NmtXZ1VoZ0ptcGhhVytCZ2xHaEt0N3JraXpKZ29ETE92Y0xUNldtQ3U5bkRa?=
 =?utf-8?B?c09wemN0c0wrMzF2U2Z0QW9MY2NYSjZ0emN0ZUp0TVdTdnFFeW9KNzVMSVZY?=
 =?utf-8?B?Mm43UGFlUGtoM05MTy9CTWpGS1plLzZzZlJBbExFVVRnODMzbS9zRlVWK0xQ?=
 =?utf-8?B?WFB0ZXFvQjNFWDlPMUhYb3AvSHhKWWFGczNIemFCMCtJZi90dHRNZlMrY0No?=
 =?utf-8?B?YnZkUHh6K2c1UjZJZVFlMlZGeW81RFdCMmlLZjRGZWJsYkV6NVFwQ0tiNk1z?=
 =?utf-8?B?emNYYjBJd2FyOER0YUY1UkUvdDhzNDdWVUxuUzBjVTNNZ3A0elArbUkza0J4?=
 =?utf-8?B?YkZ6bFo4eFNKMUFFUlZneTQxWSt4MTkydUtGejRQdlRtc1dXSlJEQUZHOTU5?=
 =?utf-8?B?blhXUEY4OFNZQnZaUUkxRnZyYmJqYUVKWXJWZmVEQkRCRk1rRXZvNkVWV2dU?=
 =?utf-8?B?eTFOekFlcWpNTVRoTlhycFVFcXA5VXhPMHNYeTIrb3hoNGFscDM3dkUyY3gx?=
 =?utf-8?B?RXNQZ3grU21FMEVvYVkya2lKODhrQTNaK0w2dU1kYjVNY0x5dlQ0RFRqeFZk?=
 =?utf-8?B?bjFIMVFxTDh3dE9hWkFBdUlLSEcrNFVET3VXNEczTGlWMDZaMDBIUzdTc0h1?=
 =?utf-8?B?cC9WNDcvUEticGY2UkpnSDE0SlF4MVV3K2l6WlZoNTI3QmZjVkNUZkxjbFFP?=
 =?utf-8?B?c0pkY0ZReXFzL1B5eTVMd1NnbUZpbmJMNzdscmFFdkxhNEt1Vk1EeFlSQ3N6?=
 =?utf-8?B?dmxJOU1qb1YwZ2xOZnJyUUJ5YWdVUG1nMUxNdFFibzNldldKWHdjNExtYmJU?=
 =?utf-8?B?ZkVBWTYvK0NHeDRVZzltT0pja3BBa1pZOTgxNFk5SHdFRHRwdHVlZnQxaFF2?=
 =?utf-8?B?VmxzZDYvb3pOb1Vxc2M0Tkp2eURGS09jeXZOTnVWTDlzdU1RUjU1aVhmT2lF?=
 =?utf-8?B?bDZYME5IanZoT2txek80SVQ0Y2YxWkZWRXFOVDRLdlBvWGhjeEJOdG01VzVO?=
 =?utf-8?B?SHBud0gveEpYWmwrcmxNZnF0a3FTRDFqZXpwT09BZzFaSmhxYnliSW4zMnhu?=
 =?utf-8?B?VnczMHB5b2lCaExFM1Y5aW42NXI1a3NNSGpweXhjZzdHSmJrM082dWFTQUpJ?=
 =?utf-8?B?VkdNT0dVc2lYaTlIQTBLeWM4R0lFeGxsU3FxNXRqNHFaRkM0aURuaG5DbmFU?=
 =?utf-8?B?MjNFd3R1c1VJeDdKUmRnYUlST09KZ3ZycHJzY1lNRit1aWMzMWhUZVhhZkR2?=
 =?utf-8?B?N3VXYXl0cDZjYk0rYzZiejUwckt1bUhNUUZZZkhPalBkMHg3RFFOU00vUlIv?=
 =?utf-8?B?ZGR2Nm5qRTVXWVh4aWF6dkxHWUllVUJENFAzY1FlamtyejFwaDYzSDRiVmFt?=
 =?utf-8?B?elM2UXh5aDgvbHV4dThkZFJjZHV6d1c0WFAwOHNaajJ2N1NTNFpsRTI1c1hs?=
 =?utf-8?B?d0p3UGFQSEc4bEZqZk5EaHBGRy9ORWdkbmFmVlVRTVJzVTlDU2F3U3R5eUl0?=
 =?utf-8?B?QTV3cC9MNmM0OExGZWRSYlE0dCtSZGxmOVNLT2pjUmVoMGt1eVFXNHNCVmdY?=
 =?utf-8?B?M3FTY2dEMWxqeURkejVSalV3bmtDMFZlS24xR3B4Z0xva3NDSGZNeTZVNXFo?=
 =?utf-8?B?MEFqbHkwbEE4MFdCeGNPUHNTemhuWWh3WDVXZHZPc3hpRDJGSytFQzdVdjJH?=
 =?utf-8?B?cVpsZDZSZG1XTzFYSEliSHM3TFpxZ3FBWGZYaDNHcnRlR3J4YjE4bkdLbUNs?=
 =?utf-8?Q?LWLV4dOG5Q23+ax2eU=3D?=
Content-ID: <22038D7A6764D04885DA78B95665FE45@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8271ff92-dfd3-44ce-0aa1-08d8e204ce14
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2021 07:35:53.7115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7r5ylP7dGpTzbtzFzVmkFRUXD5kjWIWOEBSnIx0mFPbm8p3Z2XE5urb5hNzg25hG74hcEgmcBOAAjL0Qeql6x4dZ53iSuKLO4IUuS8gl8m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_073600_017319_6A586864 
X-CRM114-Status: GOOD (  16.60  )
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

On 3/1/21 9:08 PM, Pratyush Yadav wrote:
>> +     if (nor->manufacturer && nor->manufacturer->fixups &&
>> +         nor->manufacturer->fixups->sr_ready)
>> +             return nor->manufacturer->fixups->sr_ready(nor);
> I don't think nor->info->fixups is the correct place for this hook.
> Those should be about fixing up incorrect or missing information about
> the flash. It should instead be placed in nor->params.
> 

Pratyush is right.

> This eliminates the need for the call to
> nor->manufacturer->fixups->sr_ready. Now you can simply call
> nor->params->sr_ready(). The fixup hooks will take care of populating it
> with the correct function based on the flash or manufacturer.
> 

For operations that require a different sequence of opcodes issued,
or different checks needed, I would use something like from below.

struct spi_nor_ops {
	int (*ready)(struct spi_nor *nor);
};

struct spi_nor_flash_parameter {
	...
	struct spi_nor_erase_map        erase_map;
	struct spi_nor_ops		ops;
	...
};

You'll have to get rid of the SNOR_F_USE_FSR, SNOR_F_READY_XSR_RDY and
SNOR_F_USE_CLSR. You'll init the default spi_nor_ready() in
spi_nor_info_init_params(), and you will overwrite it for the 3 cases
from above in the manufacturer or flash default_init() hook.
You'll then use across the core nor->params->ops.ready().

Not related to your patch, but related with the overall architecture:
there is another case, where the just the opcode differs, where manufacturers
use different hex opcodes for the same command (ex. some manufacturers use 0x35
for reading CR, others use 0x15). That will require a struct spi_nor_opcodes.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
