Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06178C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 07:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9SRgIsQ8VNYBfMtiKRCQaYKkozV5nS57l2tCGYEHRpE=; b=1hTlkXsvBA4bIe
	PsgcrKB45U/nGrU1kQwfwzu8njWC9H/w1Sc43I4lU73Hn81REyd/IgCbhrIxdp8pyp7g7SzHHkRIT
	N67ykTrCsQ+df5er6MBc3Z7ZK8oHaXXPfyjzSROJZSf/XvV161j2vm9XyTssEFcpQMSil9qM2zrPp
	2M+98ODjh2QxkHeymmBkxxUy57fvQD13jw8Jp0sCL7BjpC1zSRmrq0eUSj1GchQyvvmgs2klSrY6Z
	f3VFHDvi0v4Nghxwqu6YUWSRlReKrG4xJneBQV+idGr1UOwmyOSgNxRZffvxYMOB3CjNqXXo5x6EA
	bTaRrO3IrzP5bKkwbBjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkKeI-009uD5-AT; Fri, 29 Apr 2022 07:02:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkKeE-009uBH-Bm
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 07:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651215758; x=1682751758;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2HpLf809g8IE5FdF67YE9KFcG8GYhgisY1AmYFirft8=;
 b=lneGEM0KRHnTZKsz3MwZFMxG4eIwwlWZpN5xqzF7OzdyhgYsNslRIIWf
 soANcgBNo2m2bLr1Xxt5nAMG/TLjn4R9BpeXhE1x2FMBBj2bUU1pNJBqS
 MnwC2J/gRrPVC00GH137pV+f4wYwVbLsP0zRn5uwHX/JDG2zieNMQo/y9
 mzKiucmWtbwpXJCBmWwiF/1CVVn1BEYV1O+/d6DYHD0Srf2gEBY/23WoZ
 fYorQlAO+TBGa2MQa84EldTeIGKcMA4S6Gj5NdFfYCwPjT+hOHbcdYVpu
 VA6e6HkyeAb917/H+UuG57oGJDJizBN2+zEJeAwLHzx2zXYGp2YPFPyNa w==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="162178905"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Apr 2022 00:02:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 29 Apr 2022 00:02:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 29 Apr 2022 00:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiP6/FzfsA72j6vsvDUvxh3393JAGzHgku6pRSC4eHn3b9oEL3N3LB5hufRb/nKZQdHl0+ER7Aso9b+yKD6UQoUv2Lj058IOylKTxIATVV6nIF2uqM21dvZ132eIBECdSuE9aGKh3LY4buKCD3SEmMWXzQZWMML92OC0rPwVAfAvJL5pN1VhMfoqGzQXtQ4fn9XnakV7y1Szt5bVD0TpIIMeaF6YOA/JbIjVFH0j93NRjK4zmrddV/EgPSTXAytd99wVJiKRcy8oSfjbmQQ33LPsU5QUzwIiTiYhBkoBWU0gl08jAftVNzZiQKoFBHTaClGAGdTTlsYJUjngIxbBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HpLf809g8IE5FdF67YE9KFcG8GYhgisY1AmYFirft8=;
 b=m55Rh0OQolkJuCv4uqNwfHzzjLmCcqEO383POd46J5eWydzymEKYwcvJ629CtDa+mg2JhQovARbqbvQbFzTkAC5rc8r1awRI6Ur7dVXK/MGEoW9HC6/NYnN3l1Xgl0AuVaHZURsR0+Ysapme0J+VmiivVP1x3sjYSg/4rMgVBU9FUUFsnWePb6QItw51Zgs4wdxtDKN+WDuQnWwOMQvdVkmdUIpsKOc3BDbArWuTBWaZBx2VnMzeVJtve9wvzgsvA56i+TPzhzgAaDtd/Eqh8FRDZAZjPQnGe6aZh8ofqRc4yskFJOQMHFb93nOpc9rJlhebFKDpnsI57D4GStYRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HpLf809g8IE5FdF67YE9KFcG8GYhgisY1AmYFirft8=;
 b=G52AkNNOY/DBKD5A/+q1DCgcKt64FSniwrfZvdOvkXoXW4PAD1eU0/EgtgpOaA02ROYQ+rXaGpkSYqAiaEvbwAzRcWasXXvyRMG8VrjcTTN0//zhex6uZ2X/FJ5WZU5rK1VT2dyLcCney9SL6mVWQ4kvsNcI/0M+daY7Eh4wFHI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BYAPR11MB3414.namprd11.prod.outlook.com (2603:10b6:a03:85::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 07:02:28 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08%5]) with mapi id 15.20.5186.021; Fri, 29 Apr 2022
 07:02:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <cgel.zte@gmail.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chi.minghao@zte.com.cn>, <zealci@zte.com.cn>
Subject: Re: [PATCH] UBIFS: simplify the return expression of run_gc()
Thread-Topic: [PATCH] UBIFS: simplify the return expression of run_gc()
Thread-Index: AQHYW5cWZmJH0kYqVEGxvvS5h1q2WQ==
Date: Fri, 29 Apr 2022 07:02:28 +0000
Message-ID: <0de6c8c0-a936-7845-b4ce-51355661e736@microchip.com>
References: <20220429054556.3851784-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220429054556.3851784-1-chi.minghao@zte.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05dcecd5-5233-4d67-ea3c-08da29ae38dd
x-ms-traffictypediagnostic: BYAPR11MB3414:EE_
x-microsoft-antispam-prvs: <BYAPR11MB34144692B2ECA3DDB1FB4ABBF0FC9@BYAPR11MB3414.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /l/hJiB5IUWsfsVX3J8ODi/kqf0dKuvZtasGJ0/IV/zm7mktcy47Gf1IvWS2E1kSG1gnGqigeCOsW/cYfqkBnZXPMQdEpXAoDn1bxpTIuZkvKOmdQiqjTioXPUQRElkqNN8QDPGeTrqp6WfwVEdbd/4AnUFFRkOlEgCrugf1/0p5sJ7e/Ev+JVHVmM4at5KdfaEqid9RUXpo88cLNAELDX3lOEApMASDXFw+OEM/NKWOoswp/4Ma24mfQZZfmFPD7uqDlBxIR7iGz4gb0kGjaUP3cbjYd24NCNvuicqz1W3EuK4Fr9KqbmxyM94aVowtUJ8ryMqb4ZDsFCpqSgaPOWQ/IHKAfMdW9sEcL3fTgOpgLkLoYwcsfMpXt9+1f3nxRhECbVz+QwSuIoz85OJ/Z+TLF0vd6B3TXHzLMK/NmkPeCt16Vo1AoiZpWI47oAiff1FwjOGpWm+BohJb5Dh3pbgWq+3PHD2Wf8mSPBBdA6ysGthYD3SSzH69beWCTyOmNtHVzZKySzu6mcBPxCzSSuFC+SgX20+xv1kW4kLC5ej3nO1O8NuJ5dgN69hMMO1eLk5SLagx37GTrABWtXQ5kEVkUMIGo9BrwzkhuEmd3VVjb6RECdEh+W8a/iiGwHYkUmaUdk3auu4uoewIsySzs1ynX4YgllDsKx7PZfDdJ51eKSaV8Oue4CR78pKSy76AXqMmHHBXhiWJ2yeB0GHh37da3znY9OjJseNTz7iEuUCnbvAurv7Qgb27931XQPDmtfYNi3aKBqukSfDFU9MtmlVcRK3334z+BhlWwFF4XXaYYW8Km68WSz8J6BU88YiBUCMCDWpGuCjaCxETppy+MGmm+KxmzkFt4sIhM6duCWA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(53546011)(91956017)(31696002)(6486002)(110136005)(66476007)(66556008)(66946007)(966005)(38100700002)(31686004)(36756003)(316002)(54906003)(71200400001)(38070700005)(508600001)(6512007)(6506007)(122000001)(8936002)(8676002)(86362001)(83380400001)(5660300002)(4326008)(66446008)(64756008)(76116006)(186003)(26005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eERoSlRqcEN4OC9lbk1iTTZDYStCRlVhekRIOUhmci9rOFZPSUszTFVQS2dH?=
 =?utf-8?B?OTVhNlJnbXBWeFZPUFBXdndTUWs5ZmRzQnpnaWNKL2tPOUhZRUdqc2hDY3pj?=
 =?utf-8?B?YUZJaFYrcFMvU2hrY2swTEF1MGhkcU1JMzF4QWJzRTJXRlFDak5zVGkvL1lx?=
 =?utf-8?B?WGxFMDl0cVYyMVpDS0pVd2JRaFNmUllLVmdoUWxnaldnQlNLeTc1aGFDOG16?=
 =?utf-8?B?TWNvVHNnZlBHUk85bEVIZTFleDNRZ25HOXg2ZlVYSkJncnpWQnBRTjhsY0tH?=
 =?utf-8?B?Qmp2TmhFTDVvbzcvV0lnM2xtazlJOE92ZzFlMXJGYWxoRlJIN0xxVjVOOUkz?=
 =?utf-8?B?b2dnMUU0QnY4MHNNTkt3RnE4MnB4dkpId3N2eFdDcElpU1dZMGxYSWx5cVJZ?=
 =?utf-8?B?RHE1MzNZVmdQMmlZQnlodjh5anhaWXNodjRCZU91ejdURVBxTnBPUlpIeGx0?=
 =?utf-8?B?NFRPZnZqQVkrWFU0WFlJVytRNWJmMWR5Y1NJM2x2cVFtUUY4bCtSRkpOSmd3?=
 =?utf-8?B?SFl0R2d5ZlBXUnJyazhickYzYlVMMWZuK1ZSSjdZcm02V05RQkFHaUxIdmJN?=
 =?utf-8?B?VlREd3hvV09mbytHR0c2amIrUWwvODJ5UU9LODdGN0ljS1IweE9ueU12amYr?=
 =?utf-8?B?Vi9QRzhRL0gzZE9HTStvQTBBSGxpMnVEUlI5cFRQUmRIQkI0Ulc5eEdIbVhr?=
 =?utf-8?B?T3phcDlGaG1UbWluL2NrcTVBaC9oWGJnTDlDODQrQ2JvUVU4REFDenZtcnc3?=
 =?utf-8?B?bW1XcXFIeXFaQ2ZBc0dyQkVINzdraVBGNjJPSEdNOUNYdXpiYmJBMiszTmoy?=
 =?utf-8?B?bi9vWDNnVSsxdk03a2REcmZtQ1QwTnFYQ053bHd2WGhFNHVDVVIzdVlBbk9j?=
 =?utf-8?B?UTRjRHZ6c1RwMTFJQk94YUVNNnhzUi9uTmtYdWN0eVBPL0lFbFo0Sndscm9y?=
 =?utf-8?B?T3ZGSjZuMXVMTmw4YTY1RGp2cDJUOWM3Y2FpTk5BdUttV2ZlRUYwSjc1eGxn?=
 =?utf-8?B?MHJGM2dzMFI0VGJUQ0doak9pUGlOSEFINTB4SWhoVEpwZGFObVBIWDZnbk5G?=
 =?utf-8?B?a3NuWmdTSUxNOUZTVzZyalRGQzhINlFmSm1vZzNwVU9tVGlpVG9uRXZtR1FC?=
 =?utf-8?B?Ui9zWlVyNFJLWlp2NngwMVoyaCttYk0wcHgxNEo3V0V3ZEQ5Q1dwcTR3dkNF?=
 =?utf-8?B?eHIrQ1FjRVZNYWhPeHBzTWZFQmJUWmp1QWJGUDdHM2drdUxRR2hOTmp1YTlz?=
 =?utf-8?B?T3lhK255TEpjeWg5RFM4OTBTV09Td1NaMGU3ajl0cjEyd1BqMXFRSmtKM3pK?=
 =?utf-8?B?S2QzNGJtTzU1T0JSU01pT0RBS281cDdxME9GcTJ4Y0JpNlhISHNjSVlickF5?=
 =?utf-8?B?TUprd1dXNWhYREVoL1B0YUpaWDNDM1B4cXlJTlh4ZFN2TnNQc0RwTUYwT2Ri?=
 =?utf-8?B?WkM5a09OazBLWjJIMWZGaUkvVmtDTWFYYmIxclo1eXBmUnlPc0NXRktpZzlN?=
 =?utf-8?B?OVVvRE1ST2ZuQUtzVUNRYWRvdzVlQW5xbm14VWVJN1lncWh5TC9IMDc0cm45?=
 =?utf-8?B?MThqaVQyQzRYNlZHWUlQTTNVT0pnbkxGaTJpS0JIUHIveXJQVWpYRk5BN1E3?=
 =?utf-8?B?Y21sRVRicXJLYmRkQUs5NTdBQmg2VC92TGZaeUZ0a1hCd3JnYU9LdGdyV1dJ?=
 =?utf-8?B?eFRjTHFDem03Mlh0STZpMnhXdjBhdGgwdkhrNEZaUlJ4MUpsRlFQZCtvWTdV?=
 =?utf-8?B?TGZnSU5pNXNpbDFWcUxlK2xYa0dUY2NkaDVVeDR3QksxbW1UdUtBb3JkK040?=
 =?utf-8?B?eFBrZ0FkT2FuWVh0UEFqQ0src0JnQU9ndk1MY0NRSExueDArSCsrZFBXL0No?=
 =?utf-8?B?MU5FOUFqY3JMbzlHVDUrbHhncDRHVEFaTlkwUmprcStDcGxxd0JqZGVWdEQ4?=
 =?utf-8?B?VFpaWXRWb3c2d2lEdTJnNWFRdWc1YlJKcE9qL200ZkF5UmxYYi9Pd0h2TExv?=
 =?utf-8?B?TjV1aktmTkJ1djZ0bkQ2Mi9jQVZtazZxcFJvSEJWRE9iRmNCTU1Ra3BEemsw?=
 =?utf-8?B?V1QxQUFRblREekZXdnJSdTU3U3N3amF4dFVVMmVWQ2RINXdielN4cjc2aUlV?=
 =?utf-8?B?R2lSTUhyRVJ4TVg4bVQxTC9JUll2OXl1TXg0ZUI2cmlBQXRWTUhnN3hpZjl6?=
 =?utf-8?B?blVxRTcybzR5ZngzUGZrOEsxY2hxbXZGd3E5cUU1TDQ0Y2tkSWhKZ2hsZlVX?=
 =?utf-8?B?dGtLWDhEbVB6MVBrZzdWNkI3MWo2V0YydW1ZVi92bkIxcDdpeHpjNE1DTGE1?=
 =?utf-8?B?OHRxaUhBZHE2Y0VkWElpMW1sdjlMOUM0aEEvcjZVU0dvZG5lTnl1L29SdTJx?=
 =?utf-8?Q?RIUAabjXzpS4Jpzs=3D?=
Content-ID: <A3A42502DEE8C647B6FA6F74B4D8A8E5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05dcecd5-5233-4d67-ea3c-08da29ae38dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 07:02:28.1306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3BqBciWLe6oxr/cInRnfhQs/IgLc0U6DK/1rc1BRs83DLQ2QPvk+Ez/hh3R38prUmu6bh6yepedIWiSoBhXw9S3gNxVDqK15x75UWywecJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_000238_681347_65AAAC1C 
X-CRM114-Status: GOOD (  18.56  )
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

On 4/29/22 08:45, cgel.zte@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Simplify the return expression.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  fs/ubifs/budget.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
> index c0b84e960b20..e8b9b756f0ac 100644
> --- a/fs/ubifs/budget.c
> +++ b/fs/ubifs/budget.c
> @@ -65,7 +65,7 @@ static void shrink_liability(struct ubifs_info *c, int nr_to_write)
>   */
>  static int run_gc(struct ubifs_info *c)
>  {
> -       int err, lnum;
> +       int lnum;
> 
>         /* Make some free space by garbage-collecting dirty space */
>         down_read(&c->commit_sem);
> @@ -76,10 +76,7 @@ static int run_gc(struct ubifs_info *c)
> 
>         /* GC freed one LEB, return it to lprops */
>         dbg_budg("GC freed LEB %d", lnum);
> -       err = ubifs_return_leb(c, lnum);
> -       if (err)
> -               return err;
> -       return 0;
> +       return ubifs_return_leb(c, lnum);
>  }
> 
>  /**
> --
> 2.25.1
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
