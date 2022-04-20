Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8BEC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 06:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86SoJS7EN2TzR6linzSpKh2nZpI0AA5//r65ea7fWdE=; b=dQqYAy0O/iehhm
	MFWJWaZNesEIij3X8p2pUrA1IXueksgqsNp5B4aujKz8l+jnqlA8q8JaIOeUJRmupX4WEPodAA8Tt
	DvgCYj11zs5T4nN2jcVcVelVlAjltmRpSdX9rV69qykPB+nsmDeKk0JwbS6YIakVGXa0m8Aa0zclC
	llDkJ8dHPLtUyYVYN74pX2EEkWIxSp0jS5AMwg3BKFzIukhNnjA/Wb3QJAwp9Z+kbW/aoVqN21RCD
	nbM7yzQnN/UdQvLEj2+fhi5f8iGX73HGvdoIal7C+wM2Yvo3PXX2SstqLf3elZSaaB1SsFS98cWRL
	ziBglX/Bt900BweQ1T3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh3Z2-007UuY-Ep; Wed, 20 Apr 2022 06:11:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh3Yx-007Utl-IE
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 06:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650435099; x=1681971099;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9ftwm2hSgorKgnjOTnbFOW/bs0fW1mNtwBTGUtuZ2ZI=;
 b=WwsWIhEHM7LJTeSa+6JJ/plblH99HLLt9O84vuaPyB7QTKypQRcQXzmH
 mqTi02Rh8bhkV9CniSTLzCWX08ilSoLi7HOd5h4gQj+IgDSsPWjgtGcXT
 Mvc4+f37lGz6R6GUL9mKZd6yf3ZcV3kkMwy6fv+YqtRWRnsn3gVQywexp
 f/r0qQeKVutB8V8G13WYSw0+nEv07OkALQxaWrMRmht9mlnthPLsYwvWO
 xCgQdlu5YU6eZLzLGo1isqNkh9UEzDypW9xpC9FNloUkzcQIi3vw7rkaH
 FXbKZGrxuui2SCxCynMC6F1wvSWRDPMoaW8iJ8Olj3FceOPuggbQ/SV2x g==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643698800"; d="scan'208";a="92907659"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Apr 2022 23:11:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Apr 2022 23:11:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 19 Apr 2022 23:11:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIpEHmlu3QVxd6Beb2tJFnJ4j+mTb1sLwo7NPpJKdToqiIIiqlicgSakRKux0DbK4mBfZK1F99U9z6xE+y7dE9WiUkxu5bpq5XkmKQhNSJdJznNP5I71xNZ86L+sZ5KdHzdozSG4mna2XII8pmyO01L4f/dLC/cdOYlfQ+8N8HLXtQDz2Kt/bO4hZQC1aXMGlU3UHIBxxYMfH8iJ9SOsXjbXo5La7m3W4E5Qf7rkqtMABqhHaDKtq+4H656lvIhu/veTxB+iorzjZl1lS7GSK6FX7/tdezRB6mGmBqnAl4SLFyV4oeL1UkAM7u2zSCq2TC65/Jtecd8Oua+rr2/jbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ftwm2hSgorKgnjOTnbFOW/bs0fW1mNtwBTGUtuZ2ZI=;
 b=GvLaayrP5/9+1LqpOXXSAEGR/LGH/oetfssFqVs1/09JQC2CBn82xV9J+2d1doqvdH15ammdPYaK6iCo6jIpYMnUeS1s3TRcKzEMb9c14GdMXqV4tnQk0KPgwSZrKSKVctSG4d/OYwkiXxcoqQKsWKZ1JihLhQhS1lpmTQB4wf9yWYKxhCfg+IeaXWjTpBnug1RgBzAzxv1FJ45KRRw8PiXdZ8JBikmLRSe112KPpWov+a5+fvGtuKkdT7ltebSmH7X9K46ofunY7bGEo2eWUaNySOs11M/eYyQoWJBhpMD2B1R+wBdl9F0X0NlszEJR60f26Vejp/HmNIkhon6aog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ftwm2hSgorKgnjOTnbFOW/bs0fW1mNtwBTGUtuZ2ZI=;
 b=nzptsk/ZU+z9KMWA88j+CLbzfBH3jYbkxPA0JjuIhoVN+yl2e2G5RTScP6A1QdGnslAAGbcF7/03oHHPjOsgAZiTMbWguEkJWN3z9qmHokEchsVOyv41RnwCPOyEaeCV4XzF/hpaNxZBcOAz8QzhISTXGRk/ZWldmpfHv1nnfK8=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CH0PR11MB5315.namprd11.prod.outlook.com (2603:10b6:610:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 06:11:24 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 06:11:23 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHYU9BgAvSIp+mmK0m8aBEYNky38g==
Date: Wed, 20 Apr 2022 06:11:23 +0000
Message-ID: <9220410a-f3bc-b2cf-8324-604ad5b3953e@microchip.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <ffd36e40c47dd74ac3a0cadf520f8fdd35add856.1650259501.git.Takahiro.Kuwano@infineon.com>
 <201f90e6-e03b-9469-f3bd-f1ae3b5737dd@microchip.com>
 <c8007288-00ef-bc3d-5337-8db710feee67@gmail.com>
In-Reply-To: <c8007288-00ef-bc3d-5337-8db710feee67@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 168b1a21-f4ef-4fdd-6630-08da2294989e
x-ms-traffictypediagnostic: CH0PR11MB5315:EE_
x-microsoft-antispam-prvs: <CH0PR11MB5315C70E6AA55C7FA1AE8B47F0F59@CH0PR11MB5315.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qhq6wlvgvroKqNFoW0VlYukexfUT+Ftgga7TJO6ZsqJdNrG16nSHxMRRd/ytjE8kggDUppyYgPn8bONrOqflQbZz9Ob2WA/hqUTjEyIz1ENWf0tggGyPofyemJ3PSlcxwk3JOQ0bPrX6N5riaFLkjF8zXd0sAFoTIQDn5t+5hzuKjjiuP2r+neGhuVvDKBpOQCqO98M2TSwx39PoPI/deQ5/K9OYclproPDDHBBPBiWAP3EnRhCxtw7xT84f6v38qhUsCjSNGfk+PGswsIE6XFQnignq/jYF6welhtqnhwTdhd/Q9wPhFRoTbY2wPGnKUzB8yybXBeMp3cmlpU6v2Z+iuACj70hrGoeKgs8cYGMw8uZ43OebBHL2h4w5GA6jYUmqG7aAcDUaU8m+cNmlDMqWNvzjIS1+adti14Efqn66jqpjosjZSicJHKpT+qBbPqIWRNUR5h9iO83i0tvgJDwYAeOEa9zj3CFhaU717Pa/9vrMpQ9pAi4VNLLs/I6KGPNzDK2qusd1vhGlv+t6R5s0asJw7Eh6Hw+ZQEVMyNxx5KTlgF0N6LnVhe/w08l9Tr9ETuevsLuJZ5PXKAJBr7YuEhfDRUZN2EEfSrZYFDYbztkRDfuLX8kMe1odl314BNlVdRE4Sg+KO2mH//1PMbFpABQi7twOW8eMKpTURfVzSeR+6WEVcgGS75PmpZw1SheA2XaTQB8HTwKCrURMZ/FSxJ40XEb1JbyBa0+CxUJQNTVkIEkeALwAtwqWaRx/7WoGUbc2hw5No1EFOr9/Qw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(5660300002)(110136005)(54906003)(91956017)(186003)(316002)(26005)(31696002)(66946007)(66556008)(66476007)(2616005)(64756008)(66446008)(76116006)(8676002)(4326008)(71200400001)(86362001)(83380400001)(36756003)(6512007)(31686004)(38100700002)(6486002)(122000001)(6506007)(508600001)(2906002)(53546011)(38070700005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjhCR2kycDltWE8yQkxsTktRTTdEWjRWZUNjV29qQ0NVRzlCdlpYQzhQN1M0?=
 =?utf-8?B?YUxYd0hkT2ptU0xSQUlxVWZ5bGhybEpuU3NOeFpGWWxjMDgvVnNaY09uOGdR?=
 =?utf-8?B?VHdpenFCZ2F3NHk0cnYxOVpRbmE2cCtHOHl6THkyeXlVbDhCVnVzakoyS0ds?=
 =?utf-8?B?d1p2UnkvakQ3NHVaYlZNc0pOYnZ3Z0RZNHRpNmU4YU5IRDlRTWEyWTZJYVJn?=
 =?utf-8?B?YzVKSElzUDROVnhURUtvRk5xQ1ZZQVNRUE4zM3NQbmRkeXIwZFA0dEJNT0V5?=
 =?utf-8?B?bnJUSHNycExzRkJuWEg5Y21aZWdQeWVrWGFsTzFUMEIvbDlEWDdoZ3U5R2NR?=
 =?utf-8?B?WG9RN0c3VC9ua3o1T014S2V2bkwvNkxFQmhrZXVQVUVKUHFpUHZKUjZqY0tt?=
 =?utf-8?B?RFVrWXppYlA3TzJVb1VUN1I1VXkxN0J3V0Y4TjV3V2t1cHQvb1dVNU5haHJ6?=
 =?utf-8?B?ZndOallSOU5iL01lVGtqM3o4QnlPOUd2NWZUQ1NGUGUzWmtSaGpGeHVKN0NH?=
 =?utf-8?B?TWJDUlNCV0hJSlJLTjRqSHBxdEpUUUVPNEVYYzhxdm1LcFkvaUVqTFBlRlM0?=
 =?utf-8?B?TnRkWTR2WTZGMk1haHNQY3BXQ1lKbFNFR3krdEkvbmxtUTBGaDhHN3dMQnJh?=
 =?utf-8?B?OHExMFViYnpvcEY4YUgzY29KUVhPbElheHR1cUJzdmJEVEFKUVFRL2pnczBJ?=
 =?utf-8?B?Z2c4TW9FS3paOHoxRzhxUUo1K0ozSkdndUhMSXlKdDY3OHIyL3VXUHcxa01y?=
 =?utf-8?B?NmUvcVV0UFQwamxFU1VJTW8xcTdtZlVhYWl0QUYyWGszT0ExNXdkMWxCQ1ZK?=
 =?utf-8?B?YlB1S1RTSnh2enphaE13V2NOWm92LzI4ZEsvamZ4SU0vU2RkMzBlSUN0M0JM?=
 =?utf-8?B?WWtpOWt5SithTXFCM2ZXVll0NTJqYVNaWW56U245UGJJSlRJQWlZcDdhR1BU?=
 =?utf-8?B?UjlVaTdncllmSGlvNk5QTk15Y3lTNlY4WTRPRlR2aktCUmV1d1Vab29SeU1I?=
 =?utf-8?B?NGZBNko0RU0rTUtUMXM4VUdhUkNaejRxVk9oY0Zobk4xNkErR1dIRVJ2elFL?=
 =?utf-8?B?LzlKQ2lxVUxOQmtCb3Q2Y1RtOGgzMXAxSkhtWkdxLzZvbGpJUGdUNmtmckpy?=
 =?utf-8?B?VXRtWXdSMVVCK3lMekxSNnJrVFBRdGowVVRhRFdhR0h4V3lSTmRCOFBSYnhF?=
 =?utf-8?B?STFoK1ZRVmtVOXl5c2hka1VHaHZqMWI1Q1FZcnVYWW1LRHhGeE4waVVTNlVz?=
 =?utf-8?B?Q1VYMWltVkxnZUNKS1lZbWF6S255REpSWE9DYnN2dGJtNFFZMzErc0pKZDQv?=
 =?utf-8?B?bDNaTzAwTUxzMFZFM2taMFlHMXNnckFYVGpUUXRySkZhb09COTlrWDFESERZ?=
 =?utf-8?B?UFF5SkFOTkRwaWFpTUNzZmZCb2xRSDlJaXRnd256c1V0dWg1Z3RTaHF0djhs?=
 =?utf-8?B?SVJ4OHBXY1IySlBNSEFmdXdIWlA2NUZFYTRJVDRtSnNGRVVjZWpEVUJMTHRS?=
 =?utf-8?B?eTZicWVmdGI1SVY3UzVjd09BMGlVRzdqVXo5YWE1ZmttdDhKQjhaazNITjJh?=
 =?utf-8?B?VzNPc0VkUzVycWlzaGtnR0JYK0FrSytGeHg2cHdncnhSNkpzOFV5QnkzOXdK?=
 =?utf-8?B?MU1VZ2REZTlvaGxSd3Y5ajhQblgvek4vWk9VbmV3Ym5qeHJadXNuUVpqamRi?=
 =?utf-8?B?L3hOWVcwVU9zMTZIa1pPejNzbVpxZlFxNVdMZjVpRTVmdkFYMU02YlI2dm5L?=
 =?utf-8?B?RmFaZnNUL2V6NVNRR0w5UysvTkR1cytyYk4yYnpGOXM4REVFcnBXdnFtNmZL?=
 =?utf-8?B?eDdwSHdZUU9ZYmt0amFNSWliWVA4QnRsVlRjTllxUkY1N3BKc2FFVVkvNXhW?=
 =?utf-8?B?Mmp6KzA2RDN6b0NLTDI2dTFEaE1oQ3phUU1zaGhDc3JpNFJjTmM0cC9GWDFx?=
 =?utf-8?B?K0Zvam9XZWxXVTJVcFZNdU9FYWZoUGhHT1hSNEQvUStMNEFudklGcE84MjV5?=
 =?utf-8?B?S2xBUkNvT0djZnoyUDA0THlUMkNkUXBpbTJuNHgzbko0ZGFiUHMwMDB5d0ZE?=
 =?utf-8?B?RGRTNGgvcTAwd1ovVDhiODlGak8wMzBpcXRzNUNjT1RwTW9hT1NYbldkajU2?=
 =?utf-8?B?ZjdUTEcwS1BhN2EwRGdYVkxpbTFmMjRmU3hreEZldEFBcHBpN3ZlSXlSY01N?=
 =?utf-8?B?U3BTOEhPUzFtb2F3Ull4ZEk0MHM4bm9KYlZIQS8yOHBOZTNMTHBPcjdmMzFn?=
 =?utf-8?B?eDdZa1RiOWdkbTlaajhIYm1HdSttOEdYeTVybGdIREdYQVZYSjRjMStMdm1E?=
 =?utf-8?B?RXRxamJ3elFsK21xQ1YwR0xTQmp4Vk5jaUNtQW44SkhNNGwvVHAyMFoxekY5?=
 =?utf-8?Q?WHHuvjgHlFHXDzZk=3D?=
Content-ID: <2E896158299AEA42B64396AD1BD84356@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 168b1a21-f4ef-4fdd-6630-08da2294989e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 06:11:23.7212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1k+pUihzrDJinL5C4Ip9+rix+g90PiXDqjwIsN2ptp5QnZe9ch9wLWtkaNsx3Fj0m9rYM2gNX+DuOIhlZ4twiz7Lwy/DOrw2Ak+k1KDzr+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_231139_764337_B591249C 
X-CRM114-Status: GOOD (  23.67  )
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

On 4/20/22 08:34, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> Thank you for your feedback.
> 
> On 4/19/2022 6:32 PM, Tudor.Ambarus@microchip.com wrote:
>> On 4/18/22 08:41, tkuw584924@gmail.com wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>
>>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
>>>
>>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>>> uniform sector sizes are supported. This is due to missing or incorrect
>>> entries in SMPT. Fixup for other sector sizes configurations will be
>>> followed up as needed.
>>>
>>> Tested on Xilinx Zynq-7000 FPGA board.
>>>
>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>> ---
>>> Changes in v11:
>>>   - Cleanup fixups based on other patches in this series
>>>
>>> Changes in v10:
>>>   - Cleanup fixups and ID table based on other patches in this series
>>>
>>> Changes in v9:
>>>   - Use late_init() hook to fix mode clocks and writesize
>>>   - Use PARSE_SFDP instead of NO_SFDP_FLAGS
>>>   - Use MFR_FLAGS for USE_CLSR
>>>   - Add comment block to explain about addr mode in post_bfpt_fixups()
>>>
>>> Changes in v8:
>>>   - Call write_disable in error case only
>>>   - Use spi_nor_read_reg() helper
>>>   - Use nor->bouncebuf instead of variable on stack
>>>   - Update ID table to use FLAGS macro
>>>
>>> Changes in v7:
>>>   - Add missing device info table in v6
>>>
>>> Changes in v6:
>>>   - Remove 2Gb multi die pacakge support
>>>
>>> Changes in v5:
>>>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
>>>
>>> Changes in v4:
>>>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>>>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
>>>
>>> Changes in v3:
>>>   - Remove S25HL256T and S25HS256T
>>>   - Add S25HL02GT and S25HS02GT
>>>   - Add support for multi-die package parts support
>>>   - Remove erase_map fix for top/split sector layout
>>>   - Set ECC data unit size (16B) to writesize
>>>
>>>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++++++++++++++++
>>>  1 file changed, 54 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>> index 493240ebfd70..dd37b829efbc 100644
>>> --- a/drivers/mtd/spi-nor/spansion.c
>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>> @@ -208,6 +208,44 @@ static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
>>>         return 0;
>>>  }
>>>
>>> +static int
>>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>>> +                        const struct sfdp_parameter_header *bfpt_header,
>>> +                        const struct sfdp_bfpt *bfpt)
>>> +{
>>> +       int ret;
>>> +
>>> +       /*
>>> +        * From BFPT, the nor->addr_width is set to 3. In Read Any Reg op, the
>>> +        * Flash takes 3-byte or 4-byte addr depending current addr mode. Since
>>> +        * Read Any Reg op is called in this hook and SMPT parse, we would sync
>>
>> Hi, Takahiro,
>>
>> I would like some details, please.
>> 1/ with "this hook" you refer to cypress_nor_set_page_size(). Why can't you use a
>> addr_width of value 3 when reading SPINOR_REG_CYPRESS_CFR3V?
>>
> If we are sure that the Flash is in 3-byte address mode, we can use the value 3
> for reading CFR3V. However, the Flash's address mode may be changed prior to
> Linux MTD probe in some use cases. Actually, in u-boot, it is set to 4-byte
> address mode. We need to set the Flash's address mode in known state and update

addr_width is set via CFR2Volatile, can we reset the flash at probe instead? Then
you'll be sure that the flash is in its default state.

> nor->addr_width accordingly. Due to SMPT issue below, value of 4 would be better
> choice.
> 
>> 2/ Where in SMPT parse? I looked through the code and couldn't find the Read Any
>> Reg op used. Why do you need an addr_width of value 4 in SMPT parse?
>>
> In the spi_nor_get_map_in_use(), the nor->read_opcode is set to 0x65 (=Read Any Reg).
> The spi_nor_smpt_addr_width() returns the value of the nor->addr_width due to

ok

> SMPT_CMD_ADDRESS_LEN_USE_CURRENT. The nor->addr_width is set to 4 in the
> spi_nor_parse_4bait() before SMPT parse. Therefore, the host issues Read Any Reg

if 4bait is parsed before SMPT and nor->addr_width is already set to 4 in parse_4bait,
then you don't have to do anything for SMPT, right?

> with 4-byte address. We need to set the Flash into 4-byte address mode in advance.
> 
>>
>>> +        * Flash's addr mode and nor->addr_width here.
>>> +        */
>>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
>>> +       if (ret)
>>> +               return ret;
>>> +       nor->addr_width = 4;
>>> +
>>> +       /* Replace Quad Enable with volatile version */
>>> +       nor->params->quad_enable = cypress_nor_quad_enable_volatile;
>>> +
>>> +       return cypress_nor_set_page_size(nor, nor->addr_width);
>>> +}
>>> +
>>> +void s25hx_t_late_init(struct spi_nor *nor)
>>> +{
>>> +       /* Fast Read 4B requires mode cycles */
>>> +       nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
>>
>> Isn't this info already handled in BFPT? What value of num_mode_clocks
>> do you obtain from BFPT for the non-4B opcode?
>>
> There is no parameter in BFPT that describes about Fast Read 1-1-1 op
> (as we can see 'struct sfdp_bfpt_read' in sfdp.c).
> The value of num_mode_clocks for Fast Read 1-1-1 is set to 0 in
> spi_nor_init_default_params().
> 

I see, thanks!
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
