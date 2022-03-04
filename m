Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E68C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 07:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23tjS4GmjaKgCAdPc4SbxoCwfW4Yq+kdcgt7DJYzOWc=; b=xhO75VSeE5+Hb0
	abpGFtuH2/fKJazhsjyeHyHjSYgxhwLwSPiN4KuDR4OkY8ttcqQN+Zvgtgn5ayyI2K4hYO6lRXi7X
	+fHEnDU6pjUZYoUtcAMva2eo3cD+ou+FNihwKjI/uAZdxxA0hnHLYiJpnKJb1yrLI67KQKqS4TUCg
	Wt6ybl2jWbUW8rNzZQ0spsscY+pSzC3jE68xDzEsJ6fDx/s4opKUwZM+rl5BrueuxA3kydjaQUR3G
	l95lNtWs8R9v5OSXPrnBZ/U1ghx02N9VJf56HHP4g4klptOk9qAfFluSHSFVLYl/hbpJJ6uKAJ4wA
	9VwlP/ceJFlocyDUanvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ29O-008kxA-UD; Fri, 04 Mar 2022 07:14:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ29L-008kw1-GU
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2022 07:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646378092; x=1677914092;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9IG6jhAZirHune+OrkR4glFVjKcrldoM6YWSGiQKUfI=;
 b=Y1m47OVXjnf6JjR1vGNdXSphNmXiuJCqER4/v6F05rLSEmgNCY4dMnRP
 UqgcwfVQD5FPAzIeXc2qNA5zRFEEKGVN/+k8FtVHyVrx4OXay+US4mqHB
 TqkM5q/ZrtZXv3TIXBmypVFOE+oKRIxh9Scz1OYPXpnokxbMWZOcQzqnR
 HfgT/wlKVMhMw1iBeNuImlWYNTrflogdNlSSp12uQSduVYAneYQ5hL/os
 jtxluAV+rFaJb3MU6zY/LTWKHq1vUd1lgvM1MsKumZVZY2kz7jvJgbVCv
 JNqxP4j6THKYD6rxIEAJ2olD0fNAtHiYvsWTtK/9AKxQOOqoV1VGihYeM w==;
X-IronPort-AV: E=Sophos;i="5.90,154,1643698800"; d="scan'208";a="148065389"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Mar 2022 00:14:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 00:14:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 4 Mar 2022 00:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZM6bKm4YCKL5fdMA3+/ly0u3fnq1cNmXD6wC2CpuTYuT8vGGJNlByPxvtFpHR+/VOIoBDxzWWICte0cvQuW6+IQ1gsdQGrO8Iy6PRAGB6Bso+QcCmXgDTgsaUckcahZf1po267PMJnn9Qf2SOdOpy8y1fvTORoI3wC/DSGlvUyUWhG6+jAcYzdl9ZOXDMmsBa3aLdD9TWl139xB0axNOIbk0sZJMxkBN3yJ0vHAuF7qi+WKOFWB9iWsBNLDwNSiaFh12Oj7oGqD65YxNVI2iJfIGmFrwGT1vp4yldIW9vm1RkncCzhFxr1XB+dHkV5CqUwunYOkmUSEloZ+yO2/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IG6jhAZirHune+OrkR4glFVjKcrldoM6YWSGiQKUfI=;
 b=G/pHt7jlaWO5wJ9t7w26XPiTbjLjVnOvV37SoXonxteCNMgBbJSiZ21uAG9s4VM3bfMADUsrV15r0sfwwoh9XR054+w/4yHIrdBHKXkJZ8XT7gYMjGIaLeg8XczI9/D8Gbs5U+SGyji7L2g6wphREkF+VPXtGTA16Dj0FAzX7NXkryFsmj6vPw6YOm211sKCZEFvwyY+CUEdx5MuKsI5MyI/VKwgd3R+F9gtjhKhp4miR/r+D3Fo1xsN+StkWw4txZqd9K/CDgwjp4gsNOh85Qa1mwMYJqnwIYwOx7VYD4baUbJ+iEeE5fqcYEI8lI16IVp6lJTVHaC89LuiLy8roQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IG6jhAZirHune+OrkR4glFVjKcrldoM6YWSGiQKUfI=;
 b=O1+Pt4EcfhL1/vRualGk4Ds4fF5sB0KwFFdGsr26IWn+xJ8hkVNntK12Pt7FLsfWGvF3LtrM3ajzzZhf2W5nk+M1MsVXzu+763FJ9EYBkH9vxZNoekZMysS6pJ6uXzI4YmIN3rLOOp53PnveGPtHMCbtZMjQbmE0duJpr4NmZig=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CY4PR11MB1703.namprd11.prod.outlook.com (2603:10b6:903:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 4 Mar
 2022 07:14:34 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 07:14:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <heiko.thiery@gmail.com>
Subject: Re: [PATCH RFC] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
Thread-Topic: [PATCH RFC] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
Thread-Index: AQHYL5d/jpcpB1/rxkG/T2FcgyF9AQ==
Date: Fri, 4 Mar 2022 07:14:34 +0000
Message-ID: <0d0e69dd-480f-4f15-2339-9cb71f0c698f@microchip.com>
References: <20220301124935.2893622-1-michael@walle.cc>
In-Reply-To: <20220301124935.2893622-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96ea0461-c3aa-46f3-ef2b-08d9fdaea2dc
x-ms-traffictypediagnostic: CY4PR11MB1703:EE_
x-microsoft-antispam-prvs: <CY4PR11MB1703E47903E92F838A18C708F0059@CY4PR11MB1703.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9qP6T768D10i0DCtjXRLeiref035PDIunpaowovpWVF0sU5X9Qppm0dZI8h6FllcT8IIFfgeV0rqk7YRUDD8zy3gA6AdFb8EE1ZLTRz90IVJp1Dsa7R8DiLRtPhAIbA1KqeJMJmcIHR5+ccJgWFJ04jyFC/OIA0+ohMcdQDWQHfkkZQHX8350H8N8VSTTc8J+CwB+tNU5CmNhPotdbnDic5OoPWyirFzyhgqR4GYJR+ioH4NkygCpS6ZMbJVCvT2t233zbafqhWJ/q3pA6RsHV2qXV7eF0bqJXzi43K2hxekeLkpTLTwAUw5ysoxwwl9xDfIuHartDpT7Bpma231/RQ7qR9IwDu1MHKP22LoioZkAckSV1JoA6tsrfzVM4uARt6rftE+2/wJetgkZ+xloUjj2uAZ9R051PXv3wU+vdCaRdXi2XpSl8sIRQhOGeqV+zgGwxrqPrI0fdyF5HcERduUIaZ1nweJurj1YjkVvZwv7RfoEdNhj5MKoLg9l08N5T7L7DNtEGToX/aLNCaq+ymUCYbIxU40TPLS6A7Vd0prE3fPam0z7ckaOIufL39+PjZYeeeDh1AD8Ydga5KsfH3ZwdqlqK3HGMEV+hA3IYE2XdSdxXalxdX9hkbhqHMoc3QbwqEffNwh7Gu2eq2ezlag4Rbm1/Ox08ZYmQCEN9zbvuZDjaqSnY3iNF9e9PMy09puyB5r3TuOQF0GLfe760TUe3nltTGAsJMIrO1PuXMjKwQJU4/TKoASvNQdXVn/GhAyhjxUoS+bcCiBaijQ9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(8936002)(64756008)(83380400001)(6512007)(4326008)(76116006)(66556008)(66946007)(66446008)(66476007)(2616005)(2906002)(86362001)(26005)(5660300002)(186003)(31686004)(38070700005)(31696002)(8676002)(36756003)(71200400001)(6486002)(508600001)(316002)(110136005)(54906003)(91956017)(122000001)(6506007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2ZBR2RtbWQzTEkrazJ1VFZUYldVWncwQmtHa05uNWZNZFN3U3BMSFk2UzRL?=
 =?utf-8?B?bDUyVW5rSmowWTIxWHloZnhnU1pONlNweFVZdVNaeVFDVFFkZ1lnTEZTVnhs?=
 =?utf-8?B?bzFqY0JuZE44ZlpnVTF6NCsrbzFCZk1TTFlHQUI5dFUwSERaYzVFU0s2UHZt?=
 =?utf-8?B?WlZhYXkxWkZ1dFQ4WXl5dnN1R0ZlWW90eWcvQUtoK1ZhZmFSUW5CRE9XMmhZ?=
 =?utf-8?B?UzExeHJxejhYVDBneGJ0L0ZaN2crRktINDZURGVqc0J4NWY3YncwTFo5NDFV?=
 =?utf-8?B?eXlTbkZUQ2RHazE1YUJZSGZBOGlCZHI5WUZVVWhGd3F2czVCc0xqL1ZxVWNh?=
 =?utf-8?B?Y0RGdVNiazc3OEcrZlJ2UzZQZGN3UW8yMjdET3hOSytWejZDbkx2NEdBOG9K?=
 =?utf-8?B?SEJUcm80bEhRallkZ04wb0JzVWRRZ2lnSU5pSXNxWUdpajRxemM2REhISHV6?=
 =?utf-8?B?eGVoRGJNeDF6aG54enFSVXpGUG91WHkxTVA1aUpjOFZDbWozaER5MG1HNWdM?=
 =?utf-8?B?RGhZMktvSWhVaXlqNnppRjFEdVZtYzNnRDlFdVdGSXpPZU0vWmU2MTBvRGEw?=
 =?utf-8?B?MGM5QVlpbThQdnVIQll1dWV4Szl3MzBoeEtobERFMWFUaHhWNzQ1dnJBaVZy?=
 =?utf-8?B?OWVvNDlqNXR5Rk9WUFRabHprU2hXY1lNSG9wZHY1cXlod2dmWnhua1ZLKzdm?=
 =?utf-8?B?M0pSZkZNSnNOZ0pNa29iZHNiMGowN3pmMUlJZ0hSYjlvT2pwOVlNV29FejhS?=
 =?utf-8?B?dG1KaUVROVRYNGJ0ejdoSjRIcUJVdzZibmNkNTMrMU9XOVhPNkhycDQwL0VC?=
 =?utf-8?B?ZFRRZVRTUTM4a2VxTFN2M3h6U0NvcUlCOTFNUHZrUG90cU03M05LYUN6T04r?=
 =?utf-8?B?UURNdys2WnBQSW5lS0FlcjdwTHRUQStvUzlzVTRib3piWklwTVFBU0RMRVk2?=
 =?utf-8?B?MGpDTjJoVW1UWndnNGFlWUdOcEZHYjFVc29Lb3J5WFhMdlVWaXpFMGFSQzE4?=
 =?utf-8?B?N05vaW92MEMvQmFrL2xhMFRNQlJKdFB5RVdFNHBYbDVQTlBxTVloRGpEVUpw?=
 =?utf-8?B?dkxQU2dRKytBajZZcEpNRzd4eEpXZ1haRHFDaE5sTlJ6bmlNQ0VNSElLWDNG?=
 =?utf-8?B?OWdRUlYzSzFXNi9PdW5ZaU9pSHdxLzhVOTdqYTFucUMzeSszRzJZcnR3Um42?=
 =?utf-8?B?T3ZPaVdwRG1zUysrUzJUS2IwRkZJMVJQay9tTGl5bnprTUZ0UkFyYWlHU05L?=
 =?utf-8?B?WG1HUE41TGJ3V0JFTC9FZXFFaU9zdlplTEttRmdSODhaWEg1bHk3aFRORVZH?=
 =?utf-8?B?KzEveTA2WkFVQWpKY09mSjNFcW5RRTFGR2crYTZJRFQxSXpRQnh2UGZjZHdX?=
 =?utf-8?B?V0QzYmRHb1RBTDk0Q0hpMERPWHJrc3NoRGRkK1czVHIyOEFjYjNWc1FFN1BI?=
 =?utf-8?B?enpaLzUxTWo0eThodEtyR0I3c3ZzRVpidXJieDFxeXNCdWVQMDhLMFMzbGpY?=
 =?utf-8?B?WjluUEZ2Zk81c3lscjRhYUUxbDZmMXdoeGhROHNzZmp3L2kxVWowV0xrc0d5?=
 =?utf-8?B?SEFTcERYSlVDUGNrZFJ0cHhsTHZTU3M5aHp5Zm9zODFhbWRIdzdmN29FSTV4?=
 =?utf-8?B?Nml2REFnSzBsd2xSRThuaUlrc1hKNXgrTzNIWEJPOTljRyt5TWNRa1dtZUlC?=
 =?utf-8?B?c0RsUUh3dTZxbUtlRlVVS0RXYkVTWHArNXB3Y05SdStaL2diWUJjZ3Y3TTVW?=
 =?utf-8?B?amUvV21PQUdWOUE1cHFJcHk4eWhIY04rVWE0bVpIWXRDSmhJcFd6N0l5WGsz?=
 =?utf-8?B?Y0kxS2NvdTNnNGYySDcyNy9YQjBlTUNLaW5OZHpLNHcvY0pjQjczOXVheE1r?=
 =?utf-8?B?VGFBbndSY3RmUzAzTVBLTUJDZGJNWFVEbDd0VGY3UVROald3SEorOENDOHJH?=
 =?utf-8?B?Sjg0VDVVdGlDSHZpcjlBUVpSdzJHeTNBS0xPMHZ1WVFxL29BSkc4NFhQV1VI?=
 =?utf-8?B?OWdHV3BXMnRMZ1Q0QWlhZFF3WWtYWkVMdUFPUCttSUdyeDd3TmUyNFpCM1Zo?=
 =?utf-8?B?dUZkZXFhbGF1T2drUWx1SU5aaEwrM0tGdnlNYmJyenI1WDNSeVl6akZpZmNC?=
 =?utf-8?B?T3dkdmZlc2RaMmFzNGYzQ3pHZjYxL05zakNtYWFVRFFWRGdYbGtLd05lU0xE?=
 =?utf-8?B?SGJ1azU4YjJ2YUViN2JvLzhXM1hscTBLQzU3Zjl0a1RjMDljdVFWTTQ1NjRU?=
 =?utf-8?B?aXcyaVBZYmtOdC9KbFJNcE41YzVnPT0=?=
Content-ID: <349EF893ED4E9A48AD66336EABFED80E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ea0461-c3aa-46f3-ef2b-08d9fdaea2dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 07:14:34.7535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DprROySMYqUVOkE0oqaTDgT3yx1k/rQcR+JRviqCezV3vmXmh6pAOrVTt0mB5qRgwM/0ieGfgf8JtEm5F7OgWzCWI4+yvDigS/qfjXTOiEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1703
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_231451_657982_1DCFF55F 
X-CRM114-Status: GOOD (  27.94  )
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

On 3/1/22 14:49, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> For flashes which use the first JESD216 revision, we don't know
> which enable method for quad mode we can use. The default one in
> spi_nor_init_default_params() is wrong for at least the Macronix
> MX25L12835F, thus clear the enable method. Flashes with such an
> SFDP revision will have to use a flash (and SFDP revision)
> specific fixup.

I expect this to break support for flashes that use the quad_enable
method selected in spi_nor_init_default_params() and define the first
JESD216 revision, but we should fix all sooner or later. I vote to queue
this in. Maybe you can update the commit message and explain why would some
flashes fail to enable quad mode, similar to what I did.

Cheers,
ta
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Please note, completely, untested. Heiko, could you test this without
> having the second series from Tudor applied? Then you should have at
> least a working flash without quad mode.
> 
>  drivers/mtd/spi-nor/sfdp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index a5211543d30d..c23e85274ff2 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -549,6 +549,14 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>         map->uniform_erase_type = map->uniform_region.offset &
>                                   SNOR_ERASE_TYPE_MASK;
> 
> +       /*
> +        * The first JESD216 revision doesn't specify a method to enable
> +        * quad mode. spi_nor_init_default_params() will set a legacy
> +        * default method to enable quad mode. We have to disable it
> +        * again.

and here to update the comment and explain that you expect these flashes to
set the quad enable method in a post_bfpt hook.

> +        */
> +       params->quad_enable = NULL;
> +
>         /* Stop here if not JESD216 rev A or later. */
>         if (bfpt_header->length == BFPT_DWORD_MAX_JESD216)
>                 return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
> @@ -562,7 +570,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>         /* Quad Enable Requirements. */
>         switch (bfpt.dwords[BFPT_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
>         case BFPT_DWORD15_QER_NONE:
> -               params->quad_enable = NULL;
>                 break;
> 
>         case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
