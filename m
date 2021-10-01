Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8057C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 11:42:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E6F661A82
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 11:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E6F661A82
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mALsCJrpz09ws1fMzMPBHwUa81AHlyCGkx+m+1BBCY=; b=lxh+4nKA2enM0V
	zoNqdlpj3dDglvjPc18fS3FUv70ECuDjxxERrGWA0Yd7j+ZgXe3euHbsJOi+h738R5yUq+k5xlwC+
	vSCXE42fYpC/+3YVoQ4uKK55CB4yL2ts43GP47o7g09k9fsNDWMduVbgbrZEKs0BucyWNAqfPko8Q
	En5f6VV/VIJL1uhOzBV9v9yiDomz+v26VEkDg+egEHmzKXgLPPaF4BdAWCV72j8Gdjbx3NCGJ4sbg
	CAGB+mgMrpLODhLnfeHa6Os3d63pAQmSemLQQ2wNOXOFFo0EwXRDWhVsuPno1xuuBFWsSK0tawY+L
	U28AdHYwL/fIO6cNgRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWGv0-0000Lx-MO; Fri, 01 Oct 2021 11:41:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWGum-0000K7-9a; Fri, 01 Oct 2021 11:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633088480; x=1664624480;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0PAoynwJ2Vraby4j8D3wDt8Czck+wePRrt5oFV2co4c=;
 b=2giZhQR+1D/XEEAPRK8ocawKCoXt/uDp0mUny4c8seQNmaCbCt958GwG
 KaVaMK9JZkbSXkzIFyVPRVf+uf7pdjlyoYjmvkYuwEjZMt71G3KwBugxc
 BZMIolTo1lYoU70n8lGMERlHR+mZbYFk674FrTeIR4xBkuwpeU1XpANx7
 6/tswEi8H48Bhe0Rw/6qZgQSegoT+R1K9OdRyaJ8uyvUczdl0oDBP3gZM
 EvXUwvg94zU7HDb/LZQiPnKU7Wj5Fkrda15Kd0a6f9FiRfi8UmN/b9R2m
 HAJDCDIihyISt4CWWEs5QoguTN1wEf4MwMilh7fFbScG95WBwROrIkBae A==;
IronPort-SDR: kaKc4d1Oke5KWTmCcNU+zQq43FdwffFKzarS2GTrnxcmmzGoJDBR7PV3qj6ZNZV9QcaJDuNKHT
 hGVsXp6S+5053/xUXGN9ycAg9Xfu1DXchCrUVJkWxo7ddvjEGEcE8baEff1YLvWMqvbRUmE12t
 lLZfuIogQZb95aWCIoQGWqURy9fWsvNhBR19In3g+Um1MzLN0uxQ+gUOPOp6TQLqCqhQ5t+6lI
 TieKhOeWmSclKKRi0M402wvdV8rLmNQ7/tTdXRej9+eorVJ1zD8YYfPS0I7T/t6paa583WNNVO
 hr2Wt32+VnxEpXHD96JosigQ
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="138700884"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2021 04:41:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Oct 2021 04:41:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 1 Oct 2021 04:41:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kp/BOLNuMQ+FEymH7qKkbBMFyX3ZuTAumieKJyHAGiyJGu15pN/Xg1z3D8nslpngobOnQJ3iQM2JduFCfwmCALNBcwVdoVdUdjF0gfc8cLPmAdMo/+37YU8gvYnUkD1+5HesG9WBB4mdia21q6nWYO0WBdaVN9ksDkbdwJX3FA142IV6Pp1jX1Y+vCLQMEHdIxqVqwidcRihYpeKejSeXQ6i1Oa1tBuVnXgru8EVLshZZmbTgY3P3oUAcVvcYBzlsViI39zqRmq4EYd3z7Gf8+9fsHg3zhnxZ+VL2FGVc7H3aykndtC8ZxtRAct2tw1OPznbPww/TDyTaIObBy3PpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PAoynwJ2Vraby4j8D3wDt8Czck+wePRrt5oFV2co4c=;
 b=HR2YRBDFieZsqwTeCF/BDD0ITkyMMCwmCGazdHyWq61yiM3eauX60qwNvVUi2iDvGAKLbVkvv9ObP8HRyZCfZ964SH0VaOMEKtcmou6VWkOsl45PgXekAxAQwaNIwt+KeXx6ifiXnkb81wd97jLVTKy1vXGlgXyQhe7EneLX98uObEb9MFcbpKUqA6K9j/+vKIqNpbfNSxd50B/V2vZ9iixiLoisT2L8OGAzEP4vdnOGEiYGPwy77CUNQdXPxRKxUFjeNBOWd/45OVMHCTS8f+QWYFoHMDpFf3RLZcwyWzsX6YOEzm7FEYzViHyY0QAmzdwfezcyhLgICnsLx6JbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PAoynwJ2Vraby4j8D3wDt8Czck+wePRrt5oFV2co4c=;
 b=mp7ezIpXx1ECIbRReb8q5HMXQdNcQJfH43PCzERInUxjVjbXlCHvnNklCZ7+JYilNN8Hzewzl8TXzK8phyjlomovO3f3NHJjAKRzr4FLcsVzgAVOn2y3+RbNey+pxJ4x3FUYsrN5992vI306iwSy0eda7v9F3BAnX2sUulkwvzA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 1 Oct
 2021 11:40:57 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 11:40:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
CC: <macromorgan@hotmail.com>, <vigneshr@ti.com>, <jaimeliao@mxic.com.tw>,
 <richard@nod.at>, <esben@geanix.com>, <linux@rasmusvillemoes.dk>,
 <knaerzche@gmail.com>, <Nicolas.Ferre@microchip.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <code@reto-schneider.ch>, <miquel.raynal@bootlin.com>,
 <heiko.thiery@gmail.com>, <sr@denx.de>, <mail@david-bauer.net>,
 <zhengxunli@mxic.com.tw>
Subject: Re: [PATCH v2 09/35] mtd: spi-nor: atmel: Use flash late_init() for
 locking
Thread-Topic: [PATCH v2 09/35] mtd: spi-nor: atmel: Use flash late_init() for
 locking
Thread-Index: AQHXtrkyjZkdyFkpVkiMJJNJgflTGw==
Date: Fri, 1 Oct 2021 11:40:57 +0000
Message-ID: <88abe817-9d2f-35f6-746c-1640b166aab8@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-10-tudor.ambarus@microchip.com>
 <20210816190629.3kg4cbf5d7h7gyk5@ti.com>
 <a9d41aa96a8749b599d4479f18479c5d@walle.cc>
In-Reply-To: <a9d41aa96a8749b599d4479f18479c5d@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a6d20b8-4fd9-4754-abfc-08d984d0557b
x-ms-traffictypediagnostic: SA2PR11MB4907:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB4907D4C0E7C3CADAA4612CF8F0AB9@SA2PR11MB4907.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8v4uzEpaAxbV2avuHgx6EhomSwvqhsGzt7qQAKnjwNcDLDRV9H3LpzzJzO/Mn8xWXyVuu+CgDiXGlRo6DIMcOga1Wv4Z9WUpfutrarliVlexyuBQwXEUmNSDrkDK2KcpGXdyAyo27h3dYmlkPwgDnV3UvG0F9lZN8PsgVOvFXtGhSD1oPs6iHxo0pRUYMlPnBZBu7pUVepEgY+f3jJkVgYtlH+gmSs+IhDMG6SRxYa00vCyrEVEWR1/qXPnEIAdznLPg3IAd7kbCQBRuMwlYSI8kTbYT68uWcwoQ/OlUCVkRWlESsXU+UmGvAUvbC2hvgNgBIWyHBUzHogc76xMP+tWN9FuWLl/WfHJ/8U09CoEnwJGHH54XIm02A5pREee2WJU2+Zjgfwh/H0ILfPHfPPtuJbFiBBLLyknwXEcRXE1AAKfA9Bn7NoveQaV0x6/zoC/UMe4fIGQZeVUaCG3XbZRqfX3fUTH2VKOAxgmSm02LXlMkEYbGRKQl6vJM1GHtd2jTJyxztSbL3p2fLNBZz42qAORHdtqy9W+j64ppCHUEpxXmMms1ixNfG5GfMqmPZQHqFRgsVwd/4sBAzaPT32Kh5HS0dRYAozvmc3kQtIXuuZTN1WlgIAwCTCsR2So6Mhp3qXtUwoiNTedFl8D9iu/ljGgAGKIqmYl4a1KS+k56BXurILAZ7Gzzb6WbodgXpvz5GjtmfE3wlLfwNxs9lRFUohtNPN8o691F193CAJ0NPzFMm3vHls6tXFAemBw8TzDsP2P1E3+t28QjoYDBPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(83380400001)(6486002)(26005)(36756003)(2906002)(4326008)(86362001)(53546011)(6506007)(5660300002)(66476007)(66556008)(64756008)(54906003)(91956017)(8936002)(8676002)(76116006)(6512007)(71200400001)(31686004)(186003)(508600001)(2616005)(66446008)(66946007)(38070700005)(122000001)(38100700002)(316002)(110136005)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2VONHNGNlJaM0xQbDhwZ2JJazE5QkhOYzZLcWcxd050YzQzelFhZUdCbHd5?=
 =?utf-8?B?TWo1NlpaazJ5dlR5YzJTL2crT3NqUkFUR3JwelNEN0g3VTc4L1NTSFRVRTBE?=
 =?utf-8?B?UWdNVmo0NFRTekNEMyt1V0JsMklYR3B0WXFyRnNCcU9PbU4zQzlhdkNKZmtX?=
 =?utf-8?B?UHcreEZ2MHJ5alR2Z2J5V3kwTkFlWVhlSjdHV0JCeEthaExIV09YV3FWT25w?=
 =?utf-8?B?SksvNkZLdTdZV3VXVXVTM0Z5bkdqQzVDemNoU2xTK2pUU2YyUUxvRXFQUVV4?=
 =?utf-8?B?cGhab2greE1XN1V6dXVjTEdBTzNuUWxkTHZ3U3B3V0tvUGNlU3pyb3k4ZDN0?=
 =?utf-8?B?RkozZllqcDRFOFdSbnd1VkloLzcyZ1hzWG8rbUtLSmxiNXkzY1VkTG9zcW1z?=
 =?utf-8?B?aitlZk9HVjB6MVBuZGhVUmpxaXY1cVJLK2p6QzR4WnhYVEpJdVdNa2tueVJO?=
 =?utf-8?B?LzVFZ0pOWFpUSW90UXBYMXdWSE53dzNsQkd6T0ExZjBSUWUwTG45VENpN1Jz?=
 =?utf-8?B?ZFZUcWFQUDhmU1puQ2dGU1I1UytNcEJ6Ti9sM0J4dzBOaTN5c3hnMjlZWWE1?=
 =?utf-8?B?M29pVkJVSGU4S280Y2dTajR4eGJqQk91ejZNSjdlN3lPVS9leUd6R3pCb0NH?=
 =?utf-8?B?dmZaVmN3dU84LzlzZkRtMWIzTjU1bmlGRFh4VzdOSkJ2TnhLTCt1b3Q3VG16?=
 =?utf-8?B?VUJ3V0Q5MFl3Wkd3TTJEdlBFb3h0TEVUTmVHTHNBWS8yZUtlQUxWMndVeHc4?=
 =?utf-8?B?aHpxaUJ2Skp6RmVUV08zMXFTVStMUktnTGhDSi82UVo0SXlBRW1qbXJIWGJW?=
 =?utf-8?B?NEt0U2ZWN3UrYm1HelRLTjNKVnZXdGNkQm5ERW51M0p6T3dYbS9YdEduS2Mz?=
 =?utf-8?B?aFVLdWw1Q0lhVU1NNjdRZldPczZGdlZWeUphOFczL3I4emNrSS85UTl1WTZw?=
 =?utf-8?B?VVhOcUlqa005SlBSb3Y0Zms3NFEvYlhvQjk4em5sODRNK2ZwaDFvQmtlR0F3?=
 =?utf-8?B?MnY0c2lOK3JqREF5a2ZBS2xwTll3d01MY3BtNlc2RmdHZnRYZXlPVGdOY2lz?=
 =?utf-8?B?MDg4YzdKMzIyd0V2T0FMS092TmdaaGVyOFJhMmpISFBQa0FORlQ1U01wNlQ4?=
 =?utf-8?B?OCtxK2c2Vmh5bzFDc0JYSVNxNlNLZmFyZmhXNElCeGlTbzZaVi91c0lSd0ha?=
 =?utf-8?B?MzE0dHhWTURxT0psOEhTUTFncWk4eHpOT3hMUWkwZm5aa0dJVzNydUMraGVl?=
 =?utf-8?B?Smt4Ry8zUUZkOUhERFZnb2M5cDVicjFMdGdWL3FYV3NXWVpGQUpKRWd4TE9u?=
 =?utf-8?B?emU3VDJlMEJ1eUxzaXFNdmlSblpoN0QwQXBQcUFuWE1hQ1V0YjBDQ1BOTnNW?=
 =?utf-8?B?amM2TjdndHRkRmhnbENXTFZPcXU2SHZURXBTRzhwU3pWRTZWME1Pc2dlSkRT?=
 =?utf-8?B?Yi9lWklNS2JiRDlXdHo5M3BBRUIrcy81Tmg3UWh2VEgzaW1xUHJsTkxTbTNX?=
 =?utf-8?B?bjVjbTZ3SGxkRmt6cktKbDNBMm91L3FNamFFbnVLSlhtWTFZSHdVRDBnQUV4?=
 =?utf-8?B?bjVDdFN0TXRwb1B0aHZhR0NucnFYRUkyTEQ0YWtNMmJTdnpvVmhKVk4yMDli?=
 =?utf-8?B?U1hwdHp2V0NpTlpEbEpkd0JvQVNuNHZTcWJ3eDJzWGNreUJtbWhxNzZYS1Q2?=
 =?utf-8?B?S1N4VXdkcy94dzVNd0tlTHNxRTdHKzREU0VMSm9hQVlYQlVmQkZJTUhyRDBZ?=
 =?utf-8?Q?yG33MkrZ/Wtdn/TrXA=3D?=
Content-ID: <5D8535314AD3104785DE0BDA6A279CCE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6d20b8-4fd9-4754-abfc-08d984d0557b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 11:40:57.0723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qS0Paa8pbbcVjr0uASuLqT2DQICjdJxUYSGvEDTTe0LDFtU623ZFd+REFQlzhJXFdBQOk67rOgOPKdvMM+p5TjD/Fj5nTPEGCq4ETPWsNzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_044120_471917_F03E55E9 
X-CRM114-Status: GOOD (  18.86  )
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

T24gOS8xMC8yMSAxMjo0NCBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBbSAyMDIxLTA4LTE2IDIxOjA2LCBzY2hyaWVi
IFByYXR5dXNoIFlhZGF2Og0KPj4gT24gMjcvMDcvMjEgMDc6NTFBTSwgVHVkb3IgQW1iYXJ1cyB3
cm90ZToNCj4+PiBMb2NraW5nIGlzIG5vdCBkZXNjcmliZWQgaW4gSkVTRDIxNiBTRkRQIHN0YW5k
YXJkLCBwbGFjZSB0aGUgbG9ja2luZw0KPj4+IGluaXQgaW4gbGF0ZV9pbml0KCkuDQo+IA0KPiBC
dHcsIHdlIHNob3VsZCBkaWZmZXJlbnRpYXRlIGJldHdlZW4gdGhlIGJsb2NrIHByb3RlY3Rpb24N
Cj4gYml0cyBhbmQgaW5kaXZpZHVhbCBibG9jayBsb2NraW5nLiBBdCBsZWFzdCB0aGUgbGF0dGVy
IGlzIGRlc2NyaWJlZA0KPiBpbiB0aGUgU0ZEUCAoSSd2ZSBzZWVuIGl0IGluIHRoZSBYVFggU0ZE
UCwgaGF2ZW4ndCBjaGVja2VkIHRoZQ0KPiBzdGFuZGFyZCB5ZXQpLg0KDQp0aGF0J3MgcHJvYmFi
bHkgYSB2ZW5kb3Igc3BlY2lmaWMgdGFibGUsIG5vdCBzb21ldGhpbmcgc3RhbmRhcmRpemVkIGJ5
IFNGRFAuDQoNCj4gDQo+PiBZb3UgYXJlIGNoYW5pbmcgdGhlIG9yZGVyIG9mIHNldHRpbmcgdGhl
IGxvY2tpbmcgb3BzIGhlcmUuIEVhcmxpZXIsDQo+PiB0aGV5DQo+PiB3ZXJlIHNldCBiZWZvcmUg
d2UgcGFyc2VkIFNGRFAuIE5vdyB0aGV5IGFyZSBzZXQgYWZ0ZXIgd2UgcGFyc2UgU0ZEUC4NCj4+
IFRob3VnaCBJIGRvbid0IHNlZSBpdCBtYWtpbmcgbXVjaCBvZiBhIGRpZmZlcmVuY2UuDQoNClJp
Z2h0LCBhcyB0aGUgbG9ja2luZyBpcyBub3QgY292ZXJlZCBieSBTRkRQLCB3ZSBzaG91bGQgcGxh
Y2UgaXQgYWZ0ZXINCnBhcnNpbmcgU0ZEUC4NCg0KPj4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6
IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbWljcm9jaGlwLmNvbT4NCj4+PiAtLS0NCj4+
PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvYXRtZWwuYyB8IDMwICsrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPj4+IMKgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDE5IGRl
bGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXRt
ZWwuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXRtZWwuYw0KPj4+IGluZGV4IDFmZWE1Y2FiNDky
Yy4uYjkzN2VmNzM0ZTU1IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXRt
ZWwuYw0KPj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvYXRtZWwuYw0KPj4+IEBAIC00OCwx
NSArNDgsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2xvY2tpbmdfb3BzDQo+Pj4g
YXRtZWxfYXQyNWZzX2xvY2tpbmdfb3BzID0gew0KPj4+IMKgwqDCoMKgIC5pc19sb2NrZWQgPSBh
dG1lbF9hdDI1ZnNfaXNfbG9ja2VkLA0KPj4+IMKgfTsNCj4+Pg0KPj4+IC1zdGF0aWMgdm9pZCBh
dG1lbF9hdDI1ZnNfZGVmYXVsdF9pbml0KHN0cnVjdCBzcGlfbm9yICpub3IpDQo+Pj4gK3N0YXRp
YyB2b2lkIGF0bWVsX2F0MjVmc19sYXRlX2luaXQoc3RydWN0IHNwaV9ub3IgKm5vcikNCj4+PiDC
oHsNCj4+PiDCoMKgwqDCoCBub3ItPnBhcmFtcy0+bG9ja2luZ19vcHMgPSAmYXRtZWxfYXQyNWZz
X2xvY2tpbmdfb3BzOw0KPj4+IMKgfQ0KPj4+DQo+Pj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Bp
X25vcl9maXh1cHMgYXRtZWxfYXQyNWZzX2ZpeHVwcyA9IHsNCj4+PiAtwqDCoMKgIC5kZWZhdWx0
X2luaXQgPSBhdG1lbF9hdDI1ZnNfZGVmYXVsdF9pbml0LA0KPj4+IC19Ow0KPj4+IC0NCj4+PiDC
oC8qKg0KPj4+IMKgICogYXRtZWxfc2V0X2dsb2JhbF9wcm90ZWN0aW9uIC0gRG8gYSBHbG9iYWwg
UHJvdGVjdCBvciBVbnByb3RlY3QNCj4+PiBjb21tYW5kDQo+Pj4gwqAgKiBAbm9yOsKgwqDCoCBw
b2ludGVyIHRvICdzdHJ1Y3Qgc3BpX25vcicNCj4+PiBAQCAtMTQ2LDM0ICsxNDIsMzAgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2xvY2tpbmdfb3BzDQo+Pj4gYXRtZWxfZ2xvYmFsX3By
b3RlY3Rpb25fb3BzID0gew0KPj4+IMKgwqDCoMKgIC5pc19sb2NrZWQgPSBhdG1lbF9pc19nbG9i
YWxfcHJvdGVjdGVkLA0KPj4+IMKgfTsNCj4+Pg0KPj4+IC1zdGF0aWMgdm9pZCBhdG1lbF9nbG9i
YWxfcHJvdGVjdGlvbl9kZWZhdWx0X2luaXQoc3RydWN0IHNwaV9ub3IgKm5vcikNCj4+PiArc3Rh
dGljIHZvaWQgYXRtZWxfZ2xvYmFsX3Byb3RlY3Rpb25fbGF0ZV9pbml0KHN0cnVjdCBzcGlfbm9y
ICpub3IpDQo+Pj4gwqB7DQo+Pj4gwqDCoMKgwqAgbm9yLT5wYXJhbXMtPmxvY2tpbmdfb3BzID0g
JmF0bWVsX2dsb2JhbF9wcm90ZWN0aW9uX29wczsNCj4+PiDCoH0NCj4+Pg0KPj4+IC1zdGF0aWMg
Y29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXBzIGF0bWVsX2dsb2JhbF9wcm90ZWN0aW9uX2ZpeHVw
cyA9IHsNCj4+PiAtwqDCoMKgIC5kZWZhdWx0X2luaXQgPSBhdG1lbF9nbG9iYWxfcHJvdGVjdGlv
bl9kZWZhdWx0X2luaXQsDQo+Pj4gLX07DQo+Pj4gLQ0KPj4+IMKgc3RhdGljIGNvbnN0IHN0cnVj
dCBmbGFzaF9pbmZvIGF0bWVsX3BhcnRzW10gPSB7DQo+Pj4gwqDCoMKgwqAgLyogQXRtZWwgLS0g
c29tZSBhcmUgKGNvbmZ1c2luZ2x5KSBtYXJrZXRlZCBhcyAiRGF0YUZsYXNoIiAqLw0KPj4+IMKg
wqDCoMKgIHsgImF0MjVmczAxMCIswqAgSU5GTygweDFmNjYwMSwgMCwgMzIgKiAxMDI0LMKgwqAg
NCwgU0VDVF80SyB8DQo+Pj4gU1BJX05PUl9IQVNfTE9DSykNCj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAuZml4dXBzID0gJmF0bWVsX2F0MjVmc19maXh1cHMgfSwNCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAubGF0ZV9pbml0ID0gYXRtZWxfYXQyNWZzX2xhdGVfaW5pdCB9LA0KPj4+
IMKgwqDCoMKgIHsgImF0MjVmczA0MCIswqAgSU5GTygweDFmNjYwNCwgMCwgNjQgKiAxMDI0LMKg
wqAgOCwgU0VDVF80SyB8DQo+Pj4gU1BJX05PUl9IQVNfTE9DSykNCj4+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAuZml4dXBzID0gJmF0bWVsX2F0MjVmc19maXh1cHMgfSwNCj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAubGF0ZV9pbml0ID0gYXRtZWxfYXQyNWZzX2xhdGVfaW5pdCB9LA0K
Pj4+DQo+Pj4gwqDCoMKgwqAgeyAiYXQyNWRmMDQxYSIsIElORk8oMHgxZjQ0MDEsIDAsIDY0ICog
MTAyNCzCoMKgIDgsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgU0VDVF80SyB8IFNQSV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9SX1NXUF9JU19W
T0xBVElMRSkNCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmZp
eHVwcyA9ICZhdG1lbF9nbG9iYWxfcHJvdGVjdGlvbl9maXh1cHMgfSwNCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAubGF0ZV9pbml0ID0gYXRtZWxfZ2xvYmFsX3Byb3RlY3Rpb25fbGF0ZV9p
bml0IH0sDQo+Pg0KPj4gV29uJ3QgeW91IGJlIGJldHRlciBvZmYgc2V0dGluZyB0aGlzIGluIHRo
ZSBtYW51ZmFjdHVyZXIgbGF0ZV9pbml0KCk/DQo+PiBJdA0KPj4gc2VlbXMgY29tbW9uIGZvciBt
b3N0IGF0bWVsIGZsYXNoZXMuDQo+Pg0KPj4gT2YgY291cnNlLCB0aGlzIHdvdWxkIGNhdXNlIGEg
cHJvYmxlbSBmb3IgYXRtZWwgZmxhc2hlcyB0aGF0IGRvbid0IGhhdmUNCj4+IHRoaXMgYXQgYWxs
LCBzaW5jZSB3ZSB3b3VsZCBzZXQgbG9ja2luZyBmb3IgdGhvc2UgYXMgd2VsbC4gQnV0IEkgdGhp
bmsNCj4+IHdlIGNhbiBhdm9pZCB0aGF0IGJ5IGNoZWNraW5nIGZvciBTTk9SX0ZfSEFTX0xPQ0sg
aW4NCj4+IHNwaV9ub3JfcmVnaXN0ZXJfbG9ja2luZ19vcHMoKS4NCj4gDQo+ICsxDQo+IA0KDQp3
ZSBhbHNvIGhhdmUgdGhlIGF0bWVsX2F0MjVmc19sYXRlX2luaXQoKSBtZXRob2QuIHNldHRpbmcg
aXQgcGVyIG1hbnVmYWN0dXJlciB3aWxsIHJlc3VsdA0KaW4gc2V0dGluZyB0aGUgbWFudWZhY3R1
cmVyIGxvY2tpbmcgb3BzIGZvciBhdDI1ZnMgYXMgd2VsbCwgd2hpY2ggd2lsbCBiZSBvdmVyd3Jp
dHRlbiBieSB0aGUNCmF0MjVmcyBsb2NraW5nIG9wcy4gRm9yIHRob3NlIHRoYXQgZG9uJ3Qgc3Vw
cG9ydCBsb2NraW5nIGF0IGFsbCwgd2Ugc2hvdWxkIGNsZWFyIHRoZSBsb2NraW5nDQpvcHMgYXMg
eW91IHNhaWQuIFRoaXMgd2lsbCBtYWtlIHRoZSBjb2RlIGEgbGl0dGxlIGRpZmZpY3VsdCB0byBm
b2xsb3cgYW5kIHdlIHJldHVybiBhIGJpdA0KdG8gc3BhZ2hldHRpLiBkZWZpbmluZyBsYXRlX2lu
aXQoKSB0YWtlcyBvbmx5IGEgbGluZSBhbnl3YXkuIEkgd291bGQga2VlcCB0aGUgY29kZSBhcyBp
dCBpcw0KaWYgeW91IGRvbid0IG1pbmQuIFdlIGNhbiBhc2sgb3Vyc2VsdmVzIGFib3V0IHNjYWxh
YmlsaXR5IHdoZW4gd2UgaGF2ZSBsb3RzIG9mIGVudHJpZXMsDQp3ZSBjYW4gcmVldmFsdWF0ZSB0
aGlzIGluIHRoZSBmdXR1cmUuIFRlbGwgbWUgaWYgeW91IGhhdmUgc3Ryb25nIG9waW5pb25zIG9u
IHRoaXMuDQoNCkNoZWVycywNCnRhDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
