Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41347C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 12:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjOpKiy5v4SNZKtrA+FgmO0jzgs6SDrJ09wTjrCafrw=; b=ae948dD5xrD8rW
	RHKehaeAZaBjXNP7+ZfYWqrnaXHGxGAAS+JEcE/bJk6IiV5JKwXiRoeZCEiDxxjlx4CaUSDpnWkSW
	NYQrxa+Nmo+Gddlnt3H+XP1qX7uK16ND/+cJZNcjhMvFJszmiNWeOYFEFRT11ws2QnDodVWoZ7E/4
	D53d3KQxs/v1nPTQhrNshu7R8yVjGyIvPahWOpwwycNX+uxTt+QnvrjxjItq9uh3b4VNVh2PH909x
	ev+AV7klrx1WiRIFDeMRFPF9m4NSijAZkSPyCNcWlaeQe/74TZKzSQ8pGexV3m6NAJjYGUpxfS4y4
	r2o7c7OrtQEdUhlk6ATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt7He-00FbIn-Kn; Fri, 03 Dec 2021 12:03:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt7HZ-00FbGB-9k; Fri, 03 Dec 2021 12:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638532997; x=1670068997;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1RPnR/rXRutMGKEVJ7EPjHnkDflqeXHOSSahHV72W7A=;
 b=IUiWAavfLtkMNetc0TVFZrlhnX9HwIHFeQxdmS6IGttWs+HT5HyEvwS+
 olSFnwyw+R+jJaW3UkJBmZ6ZiclH4AVC5YM6DS9ZKDIk5krHyedRJ8Jsh
 C+0RoT2gkTYH5ws6Gt4JLgk26ofu8vFEbrReoEOdkBizWz7eJNol6+mSw
 fJvHZoCAnyR6Y4njTDxvyQfzPgvx+VPVoIAOFSNTpjEp1LGxggCQiMvom
 WwuEkmulRavhYUIcch1SXSv3pjV9Vwhk1Aa8jDmO6DhNWcrWRik4zV9h2
 /wyrLIkfUxmx0FhNQ4e9kFatJIfm1U+sQPP93wsCBNqdwU0Qb3NuKGL8V g==;
IronPort-SDR: 2AkERfoR/K2/jww7UR8t3fwjDl5ZZC/35cEB7uYRRQnImys93jyJ5HEVn0v/I2dmgnlhFcyV9c
 iE4fRxAR46edqn56v0LinZMWWOm4HGJyXNFnJG/C+5Q3zgRLvd73OsF1BO0YQ/+btXNspY4n6S
 NP/hKgsC2BLqmjPktdy4r3uXl23VR7s6xdK7kYlcnBNmgBFP9Vfn3Y9nofn2JZiTyDSviCPEyo
 OT92qSYjNA0/lZbDZWpSVg4lSJu6ZV3tUnv1bnGIX7T6NCXn3H+qc2ub4/lSsZ+DiRz6zEYrsg
 +1Ezs03FVNs5kLsQunOus8R6
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="141178973"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 05:03:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 05:03:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 05:03:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdx5LccVBtOC5WE5GV93n1rc9UDpIOncC3YfPWdbcO3NPg05xxa4NXrvF8htjiiq3oxtoVsBMDWbjd2Fh/ORC9WDnqsrr+gwJ4fWbFy3AEIuwDQ9XCw4O3MHWEbecMMG/ztu4AgEL5C4A29tm4+FYhXR5PqsenR6bogh20eQHu4XIo8d+s25CGhxNRAd0DWSY36YN35qrqiqRH91nLhjb3HpH2bsMi6Ob9tJm0+jIWUwVEaW4NS9ADd5M9MO6iyFiM0u9GFoTrwAmC8JnbGIjhGO/X1HaJLrEKcOWcNeIESVVaKMgKfrvd9YuJDZ7bL/H1AKbxU6nE2802MVF/tBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RPnR/rXRutMGKEVJ7EPjHnkDflqeXHOSSahHV72W7A=;
 b=kZqnSavGbsNZ1GY1VX+qxilcZgjmy/UV08oreFncfFfFynRfC3mVTwK22y2Hl1mP5yqQ2kU8ihUrYEyeMyPv5BWERzUU6Z56ub7c8iGiJ4NQt9NnFq7e2pQVCuIFwqJ1SLM6FXaDNtimQbKD457QUzTtPEsNZOmB6emjCzNV3Zn9t/U1Jo9vSameV/GHcyyesYOcyfF35sMKL3iDqncBrvQv/svly0odMLYtQ3Ph603Dj8V4bgfQe02B+wmHXHTHYyTBN0R1nkC7cNRWhlVWDWQOjMck7CtLuoq7wVh7GWxTjnC+WItP1EtOXmtxye0BH4O6viAJ0SMAQI+CZ68mBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RPnR/rXRutMGKEVJ7EPjHnkDflqeXHOSSahHV72W7A=;
 b=vYJT1t+VV5JCKeTuaUuigRWK/41CukKEEh0oonvek1aY5YA+BTEK8B4zz5utGm3pQIqGlXnIKppf8/jdOw3x4di4g9+ItzjfZGap5EDF9QgvgTNsv/mTPoz+FHlc5aTwc40xE17m48PKstUuHTSY9/9Y9tqGx4jeHTnj8PP5b64=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 3 Dec
 2021 12:03:10 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%6]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:03:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v4 01/13] mtd: spi-nor: core: Don't use mtd_info in the
 NOR's probe sequence of calls
Thread-Topic: [PATCH v4 01/13] mtd: spi-nor: core: Don't use mtd_info in the
 NOR's probe sequence of calls
Thread-Index: AQHX6D29aXo+WV8DY0O174ASu2d3tA==
Date: Fri, 3 Dec 2021 12:03:10 +0000
Message-ID: <944be3b4-2560-49f7-c574-a50f1cbf2b2d@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
 <20211122095020.393346-2-tudor.ambarus@microchip.com>
 <20211130095624.wrnn67ajd3egjpwo@ti.com>
In-Reply-To: <20211130095624.wrnn67ajd3egjpwo@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb94baeb-9c38-4d5d-5c8a-08d9b654e04b
x-ms-traffictypediagnostic: SA2PR11MB5211:
x-microsoft-antispam-prvs: <SA2PR11MB52111589F8A494F927B19391F06A9@SA2PR11MB5211.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j0oqsmc5GN5EeObbah5djR29Ccoa+Yzkkf1G8z9+sDs4tbfnrdMMO9lp25y57iqfTfxPm+iMxf/Oi8CmZ43vT3KHizYssB5Til0+EQ8b3DKmeIyMIXyJbC/Ts5H23TnINqnZrTgIKlaHsPC/Ex6szlrO9Q1dM+UHEN6gXO0+PovGBVWzsDb2wiTLBxLw2XiQwq6ZcwfsjecH0vGtTSXf+KwtE9T6XRoi6GEYLScLhuG+E0Q5fT51khFhjGSXnXzzcXvNO5MQcJifYxgH9spN7ZhOFusdmrNt+Z3L8BZvqIs5l6evLkXviJg0bYHluJS0zanh5UEuHuF4viKpaznFW6nWxiRpi8e7pHXlhOD8RtTq0e3zksUn7WGt58NFl5aZ2bc1oqvFz/y5fjsr18xPL7z0IW9qiXYFq9XerEunQdIiVFd30DGalm62ClHYa016oZmJyB6Yqt2t6JwBs89dev/4rV6yYbI/gJvS3g4+r+WxYafDZdIb4i9JM9b8/tlZ9BRdClhrfaXuZLJo6i/FnTrWShDJFwl/7zt6wngkWBKKejr0iyWWW3gxKsdqp9+oX0CP0oH3Q0rfRgXS9BzYq+259McMOAYdAK32cvhElknQlj+66gIMgjrOv3niGERNN2tHHZXDDRU57RvZLQJhdvo4UlGoBFAGLzkD51iwTCdJD4Kt4iynfrTrr1mealwN6DXSItJS/j7tyhldki27mZcb4MOI5opNVBiakfPtaOiRvTPUY/GvcKmGYa0Ex110s4oRBlFlBTzF2LgsNFR3sw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(53546011)(5660300002)(4326008)(8936002)(76116006)(6506007)(316002)(36756003)(71200400001)(122000001)(91956017)(38100700002)(7416002)(86362001)(26005)(6486002)(31696002)(54906003)(31686004)(83380400001)(66476007)(107886003)(66446008)(2906002)(8676002)(2616005)(508600001)(38070700005)(66556008)(64756008)(6512007)(186003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3l0Y0dhZTJ3ZkpGWmk0V2tEaGpIeThWclNiV3lhSHpYQklDRUp3VE03K004?=
 =?utf-8?B?M05XdXpzbWtuL3RndllNcHZQK2FSQzk3WHlGcWVOTXJEaDJucnZhbXY4SlVI?=
 =?utf-8?B?TUYxUkU1eEs3TWpYd0ZDemY1WmFSVFM4Yzgzd3BkMGcwaEpYNG1ZbW1hMVBi?=
 =?utf-8?B?WlZTbmlRNDRpZ1UwM1BBaXlkYUdCTHFSYkZvK1MxU3U2aGg3VjFuZFlFRDFF?=
 =?utf-8?B?dlBObXhFZGIyc3duMCt4OFhkNFFPOUNmbU5BM2NmVnBlb3BrdHlHaS9YUHVR?=
 =?utf-8?B?SDR4VVE4V3lWNWNqNjhBZms4OWo3YWNtTkh6cGhWaUljTjRXSnJFQXIzRSsr?=
 =?utf-8?B?dkFwKzloNEJFNnV2K0RjUWZvejF3dG5iME9iaFlxZXUySGhIbUJvUmYvUTVp?=
 =?utf-8?B?cDM5eXY2anZKby9EYWFpSWM4aFROZVdYTjJzV0p3VWNaQ1RKOEhGbFo4UzRa?=
 =?utf-8?B?a0hIWnJBbElHRU05azZKNk5nU1Y4cVAvUVMwVGZKbkJhbWhrWkNoSlFZR043?=
 =?utf-8?B?dysxMkxVd2pONW02eG1TaUhwWUtlamJqaURvQXp2WXJMNEt0cURFdDVrQm9n?=
 =?utf-8?B?ckpjZlUweTN1dXZqRFVvbWpFRHdpQnNaZTl6WWRxbzZVT0UwdGVmQkJETlds?=
 =?utf-8?B?VS9qSzNrOGd6TUxsNld1ZzE3ckE1OVd2N1grODRKQW5DNksxVHBkNVp5OUs3?=
 =?utf-8?B?WHduajBXV2xUeVFhNFJFUkh1ZzNvSk9GcGFNRkVLS2hkL3dtS3QzUXA1eTkz?=
 =?utf-8?B?N0xGTjZaamo1aXNUL0F3NXN2aHlzczFzMWRXcVVZT3hRWnY4YUlIaDNnUUd2?=
 =?utf-8?B?RkpiUkhEaE1VQWhTdDJFTmp6RWsvbjA4aXQ2bEFjaFd4ZFBBUmxHQVVsM05h?=
 =?utf-8?B?L3RkcEVQUWNGdW5XRExKcWVxU2laSHNTSGZJcVBGOVlQcnIvb0FUZGQzZkVj?=
 =?utf-8?B?ekQ3bWlKQXNIMXdpVGJTQlBGZDhERTlQeWpicHFZWGMvUmpkY0x5bUt4KzVu?=
 =?utf-8?B?bWR3a3FrS1g1SDVKZTNiU0NDb1pVODdXV3dGZDR4STlFRDFGRzVpWUdhbjUv?=
 =?utf-8?B?U2Y0NWMweVhTdXVjUGg4SHZiK1p2bm5EZWU4YzVQcnlZakFjSFdUQ2lQN21j?=
 =?utf-8?B?WUdkQkw1Q2FQMjlKRlJWSWtHbVNFZXo0cDg0Nlg2cEZxK3ZUTmYrNjNOcDRD?=
 =?utf-8?B?TTZIazVmS2E4OVBMSHU0NkJNY05leDBHSVdaVlJRc1ZQZFdBZ3I3NW04V3pp?=
 =?utf-8?B?RnByRVNpTFVXYzJuNUppSEprQ05CUzcrQlMwTytvbjJFY04xb2JCRVZUSE9H?=
 =?utf-8?B?OFFFWlVsMWJjNHU5K0VCbXB4MW5BMWMxT2dxbUJTeThoRHdtMW9QRzhaQlRx?=
 =?utf-8?B?Rkkya3RadkxObXFkdjZSSm9Mbjh2U1dVOWxzLzliYnFiL1VoTWs2a2o3VXRL?=
 =?utf-8?B?Q214R3BOYlYwUlRIbmt6S0pBWUw1dXduMFV5VzRPQjJuT05DUGZhdStlU0dh?=
 =?utf-8?B?OVVNQ1VMNWUwa1d1dFJ6MUtXQUc3K1B1Z0JSUzkvUXFGdTFZN05PeUpQM1o4?=
 =?utf-8?B?UjE0VFp1YXlRaFc4NUhpbFhFQzNkUlcxK0IzRzFQR1JxUHkybEticUJlZmVP?=
 =?utf-8?B?S1RjUGttWUMwZmVDUGlRMmxVaTY0M0VuT1EwSU4rTlJuU2VBRVUwU01RYlI3?=
 =?utf-8?B?RFVEZHFLMDh5dDBHY0NxQk8rbFVkTHlBazZ0TW91Q1JMNVZmRWZRWXRSc2py?=
 =?utf-8?B?M09YSG9DYU16eTNLUWFGTE1uUDM3TTAzaWNpQ09SOE9XVzN3a3g3QVRRc3Za?=
 =?utf-8?B?N0Y2YldObGhJUmdsa2VyZyszdnl2K3FCZUp4UUVzckw4R0xmU1QyL1BtYjJL?=
 =?utf-8?B?dU5NWmJRQklMbUtSQTV5cGg2ak1TelZQWEFGY0hONWplV3BJOFQ1aXFzN043?=
 =?utf-8?B?aGlNUWJobW5DUTIrZ0JsUnlrSDZoVkFJeDk5YStUSFNNRXUxai9VYjNMQU1V?=
 =?utf-8?B?MzcvNHFTUFZkQzl3Q0ttWE13WU01WUtFWk1wc3I1ZVZiUmFpdHVZbEw2RENN?=
 =?utf-8?B?WCttR093RTB0Ym4wRWxiNjhKRjZhMUp4U2lZclR5cUZuSWtrUFYvQ0IzVGhk?=
 =?utf-8?B?K0pLYnpoQmZueThQeS8zcXBDeUlnV3pqOEUxMW5hVEk5Nlk3SFRVV2Y0bytJ?=
 =?utf-8?B?OC9yejJuWE9Hcnp4dm4wYjNMSVVqUm5aQnBObkdHb3RCMnlWMlQ0R2lZMzk5?=
 =?utf-8?B?MGhQdnovMmpRSWtGdlh1RDQ1bG9RPT0=?=
Content-ID: <769D61B680F2C749B40AF6FB5EBF19E7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb94baeb-9c38-4d5d-5c8a-08d9b654e04b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2021 12:03:10.5213 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5gvg+L6YFbzNjo+2m2ZhpACUAXJYyIldktLJVk+VavWbybUCvct8hq5HSF1vuWZs1q9AlXteYXLVbsfqcJWWPRQYsTtkWX+oL5+gCDY83j0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_040317_594749_3D9C3C3F 
X-CRM114-Status: GOOD (  24.74  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/30/21 11:56 AM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 22/11/21 11:50AM, Tudor Ambarus wrote:
>> Use NOR parameters in the probe's sequence of calls, thus
>> nor->params->size instead of nor->mtd.size and let the mtd_info
>> fields be used by the mtd calls (mtd->_erase, mtd->_read, mtd->_write).
>> mtd_info fields should not be used during probe because we haven't
>> registered mtd yet.
> 
> These changes look good to me, but there is one thing this seems to be
> missing. In xlinx.c, I see that xilinx_setup() sets nor->mtd.size. I
> think it should be updated to set nor->params->size instead otherwise

thanks, you're correct. But I should better do it as a separate patch
that fixes:
Fixes: 641edddb4f43 ("mtd: spi-nor: Add s3an_post_sfdp_fixups()")
because mtd->size is overwritten in that patch with
mtd->size = params->size;
while it should have kept its s3an specific value.

Will respin the entire series with this change as the first patch.

> functions like spi_nor_set_addr_width() might end up using the wrong
> value.
> 
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
>> ---
>> v4: new patch
>>
>>  drivers/mtd/spi-nor/core.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 88dd0908d172..5b9c827d411c 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2115,7 +2115,7 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
>>        */
>>       op->addr.nbytes = 4;
>>       if (!spi_mem_supports_op(nor->spimem, op)) {
>> -             if (nor->mtd.size > SZ_16M)
>> +             if (nor->params->size > SZ_16M)
>>                       return -EOPNOTSUPP;
>>
>>               /* If flash size <= 16MB, 3 address bytes are sufficient */
>> @@ -3011,7 +3011,7 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>>               nor->addr_width = 3;
>>       }
>>
>> -     if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
>> +     if (nor->addr_width == 3 && nor->params->size > 0x1000000) {
>>               /* enable 4-byte addressing if the device exceeds 16MiB */
>>               nor->addr_width = 4;
>>       }
>> @@ -3245,7 +3245,7 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
>>                                     SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
>>                                     SPI_MEM_OP_DATA_IN(0, NULL, 0)),
>>               .offset = 0,
>> -             .length = nor->mtd.size,
>> +             .length = nor->params->size,
>>       };
>>       struct spi_mem_op *op = &info.op_tmpl;
>>
>> @@ -3276,7 +3276,7 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
>>                                     SPI_MEM_OP_NO_DUMMY,
>>                                     SPI_MEM_OP_DATA_OUT(0, NULL, 0)),
>>               .offset = 0,
>> -             .length = nor->mtd.size,
>> +             .length = nor->params->size,
>>       };
>>       struct spi_mem_op *op = &info.op_tmpl;
>>
>> --
>> 2.25.1
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
