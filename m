Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C68C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 03:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LD3uiL3IgPgspw6q2EOpz1uzrTXT1WTwMRm2bOXpLo=; b=oOyR7zHDxz1T/F
	WRTFDB0O9RWQdc616sXQUf7q8+bWurux7YNPMCGh2Vux8IkT7wGcaDCGaI5X3rv0w7WeUdoLDD1i8
	baP7cpCQRIP/GoJehyyCm876CDCZVAfknrAwD+CLiAAtwc2CEv1U8g/qaX0EnpX+xebJD0sWRbbXF
	tcQs2Gyk4H9QMAoISIIN0QgDSiX09zidWN9tn2yWmzedQLwYPSLIpEudfXgNZTMBcVTd4hexnV/2t
	Nux7YSNwD0MFvyEzW8/RHxsOzBqjRCX5SMdDNde8A1YVgOB3ew4HUYb7syce16ZJ4a/qgqwsubZA4
	kPWu1HocKfiEEMdn4kQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI0Hg-002RzP-B4; Thu, 10 Feb 2022 03:38:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI0HF-002Rw4-3M
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 03:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644464268; x=1676000268;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=tmg907uKVTDxYxmcjC2VIUAywu4r9E6Z4yJPuTDH9qU=;
 b=saSbUdYAJQI/y2HizvrgaKWhJmhcfxqA8ERPi4LPUF4lbaSyTvHW8CHm
 dRsAdnYMmknrrlMLq6sK58OpUb6B3p9qyPxkMrhMTluB4p6ZiI+571bPY
 lsmC0cuFr/FWC8f/PPtVH49dHhtWlZL1ScJ96R4EjV+TZX1YB/wXkTf65
 KyjpG5FcBE4sg71mJMESz6x8Agk4ZtAuWM2Ch/uC4f7jZBm9eWjJf+bQj
 y+FZdMJSI9hEVCBYMZiw1fXGOAEHA7sr5fsIs6WLhqEf7RUs/ZdJeqVMb
 az5je4Aldebnm0AbkgVV8W5QxghWKkNDiRTURBJl9SXGBn17kiU5Zualx A==;
IronPort-SDR: 03V70gZLt5gex3LLJKVRwhU4AURshNX1ojkCc8rSCg5FVrls1veiVA/A8/KfEYD4vZnOtEpr4p
 lbN6w1hdRSTimjih5BUY8so+kqujypGEkTxQ3WtEEbYSOnEI3vkwQm0Q3S5u27rrTdKmcAmLAt
 CPT9zdNH8U0ZbVJb4XBion6hQXDUkv59q7KXmMO3pHnKClvG/Hc713BBL8oFKO/BmfddHtkjeg
 kXbanluHausJid8p5JzXkBuyfOzK9RlIujhThHx+GPVforNtz+kqHRCw6a1vVCZiUrZbU10eUe
 7ns8HKABREOY4IqEP91RHQAH
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="161730862"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 20:37:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 20:37:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 20:37:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMfNfJ1c6YJedcDePk2PctMkaQvfq7+2FpJDm7KQTt8bVIhh/GWs3GNw9iTIrrpH7d/+raQzNYFzrl2/BrlCM3ib1y5luTqDRuG+i4ySbSIas/jC/T2eVC4gB3NOhYw/IKpZCFbgkfADJ1UNLSrtBhBqRcErgFZFFTwoM8JrOTLGAjfECB2uVs6Xz0hzhD2Tv3/eP0I17VfpU1i+qIdTpOb+NsE/FnIqnznlqRRL4RFLbxShzCq8nM0dev2wtQ3x7Nec9Y/SQlj47c3j5r7RrTrBkNtNGjcH26KUj5yMUE3EHbb50oBqoaaek93hdn0E1rWpdrOdbdyVLt0NZS8qww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmg907uKVTDxYxmcjC2VIUAywu4r9E6Z4yJPuTDH9qU=;
 b=AFXu+qaMLDr9Zup2FTwTVLvBGnvS3Oo4ZARNxC+EYoelHA+YZHE0YMGmyDCFMq4Yehi/xY/9UB/GHMzLf2mJ0D7Pw4Frabsz2fFotzyGjfnU/6Ljj/C1VCbFjEIZxDJepL7XTVuSnq27yhJx2V6dECKcjruk7gr5gM+fut0AlQvzpWpAHEvfSFCgaEzeQjzMjZDjW5HeGdGx94aMSGvOSJQJA84Y64i4tuK7Yo5IX8urVArUAWbF7gqG3MEyK2HQwk5rONfpS8Jn1Bg/NednJqSL5kZdJdy1UzZdYMtuBaiCPCSg1hmRrjRJ75DS+oAw2YbPuSQO1J1AhfDD0ifGDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmg907uKVTDxYxmcjC2VIUAywu4r9E6Z4yJPuTDH9qU=;
 b=esMM/HveBTmOS9BZWoIfXFHVITJLr2xyMd7n8joQUS27uigTYscJt4donoHdgfjuBdaKg5Pqgkl4KjzKWHhLpGYFRTfP7s9/Sm3Ote8JtFvHfke8FWIZaN4L4rsd9/NROsomcnkRjpYaOJPwpmTZR0s71b9d18mRi0pQrbmqK0M=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BY5PR11MB4069.namprd11.prod.outlook.com (2603:10b6:a03:191::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Thu, 10 Feb
 2022 03:37:45 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 03:37:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 08/14] mtd: spi-nor: micron-st: convert USE_FSR to a
 manufacturer flag
Thread-Topic: [PATCH v1 08/14] mtd: spi-nor: micron-st: convert USE_FSR to a
 manufacturer flag
Thread-Index: AQHYHi+Q6/H1PjKw5kWgl8HsyPc6SQ==
Date: Thu, 10 Feb 2022 03:37:45 +0000
Message-ID: <0eee21f3-8c03-3d82-dc5f-6d9d6fc7fc45@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-9-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-9-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71f8316c-dc31-48b7-cd32-08d9ec46b373
x-ms-traffictypediagnostic: BY5PR11MB4069:EE_
x-microsoft-antispam-prvs: <BY5PR11MB406998144B5B62DEBF151F95F02F9@BY5PR11MB4069.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dnWPywrIu4tWNuRbDijRJ3C/nlINnNbqDD9ohInBm02kdJcQflLfB66UaZTkL+0Dt+m8OfuhLMjiKt5TLFYe2gz+MRv5GuieDa39VYNaQk2BXNjJVpRyPWtWYOlVvNPQt9e8ce301mHJYFJuUBIVbUqYqer5udz291kHeZwKCKaKU753gN3F309johMbFjLboK3L7fUZVfrpJCf1tbt34i0WAE3WV3KTXzkdc9Rs3f4yI/nCkPR55GoVS36IrGaWJZwryWk1b6F8tCLDVdGee5N3xNOSDG7e4WZG8QpeW9Bwd1oqNE8EBrXayseKBjPNBdE4su2kmanxO+IGTamKTlxCMFm6Mkkr7DuA2dpLv266SfyFkJ7ebH3xfM4Zx3s044PzEd/ukDNsqVle+51NkWUDlaisRfor34Wbv1gngS2qlj95zJYjxX5zMI0etTSLoXTJc2g64E/k7lKFXNVYdH5XOQTB0bfDxItuAoyek8du8zNKKGqukxYq6NVSBYntywUgu9V9k9JvYtIL5d2c7XTL887LqkoV9Fx94R/W6Fxb46LJWqnr6DYolFDDPsnPP75oLCzERetBm/z8n35a8XwRRBb5gv0DJn+VTsji53f5cLXvGUJlGO8MoluAswlP4Qnuk/99Wz13bBOAFbS2lbG5qz/RwqqPdpoEgHgJA4naXOqbZDSizq6TGlT2O8s9DmjZ8mjVY+dpsTdKdN7+cKOophmDQHola1RXs4aHsugJV5WdUIKRqimbv+WLn0JDbYPBF73FzrYgplaJKfmZDA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(38100700002)(31686004)(6512007)(6506007)(83380400001)(2616005)(5660300002)(71200400001)(2906002)(54906003)(26005)(53546011)(186003)(316002)(4326008)(31696002)(8936002)(86362001)(508600001)(38070700005)(76116006)(66476007)(66556008)(64756008)(110136005)(66946007)(8676002)(91956017)(66446008)(6486002)(122000001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aERDZUpxTSsyQjRDeDRmRDlRZU9WZ21GNVd0REtJTzNRdkdudWhoRzhVZlU1?=
 =?utf-8?B?cm5KazdGY0IxRDA3eUY4OVJWYjdJZjlvRGpQRFFUVlRuMnNaMGJXaEZrUWVW?=
 =?utf-8?B?Z2FHcHJ6ckRYeWpqdHVtQUphai90ZWI3MFRaaXdtZ2t2L3hsNW9HeWtuWkFP?=
 =?utf-8?B?R2pEVGZUcDdFdy9jcnRSVkVvRnR6LzlCcE9mQTUyTzNFaVpxVzhUV3oyOUZP?=
 =?utf-8?B?NUYvR2FMZTJEck5xV2tYV0ZRTmFCdHdPaFdyNXJSYUFiUmdNY1g0aHA5bVRF?=
 =?utf-8?B?WmlPaU5NQ0VvaUhCbWtiNjVMZ0I1Nm84anhLL2JkSVVHTldoSWZCdE1xeUFp?=
 =?utf-8?B?ZkdZaUhvRWZaQ213SDNNWm5IYUtyUFFtc29BMGxlRi92dHpXek5naWdRbWti?=
 =?utf-8?B?cTJoc3E4TG9iODRaandrVlIrbCtmeUFxQU04WW1OU2k2eW12YWh1SHBDRWhq?=
 =?utf-8?B?ZTVyYk5XWVpmaVlic3BOSk5Rc0dZU3Z6b3haSDdGT0ZBK1ptVVg1ODJ1bytv?=
 =?utf-8?B?SzZoMUhxTWx5SHNRa3JhUUI5RlhpRTNLM1R6ZWJXcXRvVGV2UytpQmNldkV0?=
 =?utf-8?B?ZWJvVW5SOGRaWnZQazdHL2ZIbUxXKzR6T1NjbDZTRVRwWmkvazlEZzBRTkhM?=
 =?utf-8?B?MWVPV0ExOHhHMzFONnpYQ0JSZS9vUjlwNGozY0ZSMGtDNkl1TU5WWTVTMENv?=
 =?utf-8?B?RzI4SWpKYytTK2tRaWJMS3dyV2xWTGhFVVZnVzFUS1IzQzc3eEN0QnNrRHh6?=
 =?utf-8?B?NGM2TDQzRkZ6bVY0VDJaYmV2RVAwTVhMSENqMi9NUDFReDllRDJaTS91SWlI?=
 =?utf-8?B?SFl0dDVqb1VRQ2pyNFJMYUJlVFJrV0FuUURmcGlmWDRCU3RaY2NkWnhicHAx?=
 =?utf-8?B?ZjJ6UU5hQ2VQMkpINzZmaFo3cEpBV3R4U2FiMWp0K0o0RkQxaC8weGZoc1NN?=
 =?utf-8?B?SWpQbnJzT2VWMlBJRDdqWXY0ZmUxWmZFUU1Nb3JDNlpER1VpbFB2NnEzd0lB?=
 =?utf-8?B?eldFRU9rc0VFNXFrajNIVktheDhDWnF2RThTUHZtem9VQVYvWWhIZEFPL2dv?=
 =?utf-8?B?VVM1VzhMdTZIZnhLOWthTFFla3BXQlduZWhndElUb0ZDa3JhSmx0VnpoQkw0?=
 =?utf-8?B?b0s5OTB5eXVXcHE1cC9ZWG5kaVpnUXBYc1pPWXIwZHR4cU93WG5lbXNaMTNq?=
 =?utf-8?B?eFV0ektoc2RMalhiaE1oOW0yZEU5VkswdmhjTHE2QURhdUhCNkM4NU5pUndP?=
 =?utf-8?B?Y3FQa0g0c2ZRdTg2TXMvWEFuYjA4cFhaSzBGZnhBbWJFVERnYU94T0hFb1Q0?=
 =?utf-8?B?UkcvQjNSbFo0RnF3eXpkQWNWMnIzWmY3OU43eFN6WkV3N2cybllJU04zZzZ6?=
 =?utf-8?B?cklCRFZmT1Z3YlFRVVdrbnlzQVdRdVllNE1uRnVjNmx0Qm9kUmhTNDBPMkRT?=
 =?utf-8?B?cXNkSC9HeGNzaEZ4end2OWo0UXZGYzJqdlJJcjF5bGxZbUFKc3l5QzZoSTAr?=
 =?utf-8?B?czNEaTBLYUpYRnVHVnFTanRsbGFSaEZBaVJGRlRnUWdOME9JMitvMnhielNN?=
 =?utf-8?B?ek9HOXNqZW1TVVFlU0I2OWdRNkQ3LzlKaHU2eUszNWNybFBVVnVEUk9QUE5s?=
 =?utf-8?B?QkF2UTAwak5WeCtOcnFxdlBCRXpab1I0ZXplYzVEZS8wVXhEWHVHVU96NHZ1?=
 =?utf-8?B?ZFIwN0RxNVRsakNSUWgwQ0FnWHc3cDdOekJQanNuRHFJdUwwRCtWMDJ6Mlg2?=
 =?utf-8?B?Y2NRU01USldEMDhUREJRMkhaVGRqbUVYbVVpZ3JJQjgzbjVEVllncW91WVI1?=
 =?utf-8?B?WHp1cGJaS2FMVEEwc2Z5RXBZb05YK0V6c2ZjOE04SXkyUThCZlBpK1h4S21r?=
 =?utf-8?B?YzFWd3VveWFDMDBJK3hXSm00S25zcTBQU2ZtNjRhdW1lcW9UcnBFMUlOWnRG?=
 =?utf-8?B?QVFjSmVIcGxvaTZ3OW1zV0NGcWRHTVEzbTllbUNxZ2I4Q2c3ekV0dzM2SWpj?=
 =?utf-8?B?a0RmVENEbWthSVR5ckJiUmduZVYvNkZVR1Vsak9ycWl2anAvd2Y5TzVVOVk0?=
 =?utf-8?B?eEl6L2tXeG5IZnU3MVlSallCS0FGVllLTEZrRGN0UWVaVWp2Tm81dTMwMDJF?=
 =?utf-8?B?aDVZMWRFd3d3dzdCZ2hnYlcvRXlpbnVoOHdSaWxrVlR1RzVvbGJ1TEZzV1ZE?=
 =?utf-8?B?N0hVUmFybmtLcmZScE1LYUNtTjd6ak5wTUYzczIwUnBNNnlZMlhqdm9Xd2J2?=
 =?utf-8?B?a1M0a3V3OHFhSi96cnZlNUxjWXpBPT0=?=
Content-ID: <C7D3C16CA0AEB04C9213E3F9F960F685@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f8316c-dc31-48b7-cd32-08d9ec46b373
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 03:37:45.1118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ba24TpFN7AALGt0EiGFCVG8DLxtcRxy2hlUWfPjEotWkxlz+C2EZR5hqZPZhL5ghGH8hnXyZbDt54BnPNWRt1pFXGXJxfReAuEy61rhlPiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_193749_210893_BE1BC380 
X-CRM114-Status: GOOD (  23.13  )
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

On 2/2/22 16:58, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Now that all functions using that flag are local to the micron module,
> we can convert the flag to a manufacturer one.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c      |  3 --
>  drivers/mtd/spi-nor/core.h      |  3 --
>  drivers/mtd/spi-nor/micron-st.c | 92 +++++++++++++++++++++------------
>  3 files changed, 59 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e9d9880149d2..be65aaa954ca 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2499,9 +2499,6 @@ static void spi_nor_init_flags(struct spi_nor *nor)
> 
>         if (flags & USE_CLSR)
>                 nor->flags |= SNOR_F_USE_CLSR;
> -
> -       if (flags & USE_FSR)
> -               nor->flags |= SNOR_F_USE_FSR;
>  }
> 
>  /**
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index fabc01ae9a81..a02bf54289fb 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -12,7 +12,6 @@
>  #define SPI_NOR_MAX_ID_LEN     6
> 
>  enum spi_nor_option_flags {
> -       SNOR_F_USE_FSR          = BIT(0),
>         SNOR_F_HAS_SR_TB        = BIT(1),
>         SNOR_F_NO_OP_CHIP_ERASE = BIT(2),
>         SNOR_F_USE_CLSR         = BIT(4),
> @@ -349,7 +348,6 @@ struct spi_nor_fixups {
>   *   NO_CHIP_ERASE:           chip does not support chip erase.
>   *   SPI_NOR_NO_FR:           can't do fastread.
>   *   USE_CLSR:                use CLSR command.
> - *   USE_FSR:                 use flag status register
>   *
>   * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
>   *                  Used when SFDP tables are not defined in the flash. These
> @@ -401,7 +399,6 @@ struct flash_info {
>  #define NO_CHIP_ERASE                  BIT(7)
>  #define SPI_NOR_NO_FR                  BIT(8)
>  #define USE_CLSR                       BIT(9)
> -#define USE_FSR                                BIT(10)
> 
>         u8 no_sfdp_flags;
>  #define SPI_NOR_SKIP_SFDP              BIT(0)
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index c66580e8aa00..33531c101ccb 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -8,6 +8,8 @@
> 
>  #include "core.h"
> 
> +#define USE_FSR                BIT(0)

please add a description and inform the reader that this is a manufacturer specific
flash_info flag.
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> +
>  #define SPINOR_OP_RDFSR                0x70    /* Read flag status register */
>  #define SPINOR_OP_CLFSR                0x50    /* Clear flag status register */
>  #define SPINOR_OP_MT_DTR_RD    0xfd    /* Fast Read opcode in DTR mode */
> @@ -140,15 +142,17 @@ static const struct spi_nor_fixups mt35xu512aba_fixups = {
> 
>  static const struct flash_info micron_parts[] = {
>         { "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512)
> -               FLAGS(USE_FSR)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ |
>                            SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP)
>                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE)
> -               .fixups = &mt35xu512aba_fixups},
> +               MFR_FLAGS(USE_FSR)
> +               .fixups = &mt35xu512aba_fixups
> +       },
>         { "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048)
> -               FLAGS(USE_FSR)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ)
> -               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +               FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> +               MFR_FLAGS(USE_FSR)
> +       },
>  };
> 
>  static const struct flash_info st_parts[] = {
> @@ -164,57 +168,79 @@ static const struct flash_info st_parts[] = {
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
>         { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256)
>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
> -                     SPI_NOR_BP3_SR_BIT6 | USE_FSR)
> -               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
> +                     SPI_NOR_BP3_SR_BIT6)
> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256)
>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
> -                     SPI_NOR_BP3_SR_BIT6 | USE_FSR)
> -               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
> +                     SPI_NOR_BP3_SR_BIT6)
> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512)
> -               FLAGS(USE_FSR)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> -               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +               FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512)
> -               FLAGS(USE_FSR)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> -                             SPI_NOR_QUAD_READ) },
> +                             SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512)
> -               FLAGS(USE_FSR)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> -               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +               FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512)
> -               FLAGS(USE_FSR)
> -               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024)
> -               FLAGS(USE_FSR)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> -               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +               FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024)
>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
> -                     SPI_NOR_BP3_SR_BIT6 | USE_FSR)
> -               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
> +                     SPI_NOR_BP3_SR_BIT6)
> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024)
> -               FLAGS(USE_FSR)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> -               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +               FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024)
>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
> -                     SPI_NOR_BP3_SR_BIT6 | USE_FSR)
> -               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
> +                     SPI_NOR_BP3_SR_BIT6)
> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048)
>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
> -                     SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE | USE_FSR)
> -               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
> +                     SPI_NOR_BP3_SR_BIT6 | NO_CHIP_ERASE)
> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048)
> -               FLAGS(NO_CHIP_ERASE | USE_FSR)
> -               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
> +               FLAGS(NO_CHIP_ERASE)
> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096)
> -               FLAGS(NO_CHIP_ERASE | USE_FSR)
> -               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
> +               FLAGS(NO_CHIP_ERASE)
> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_FSR)
> +       },
>         { "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096)
> -               FLAGS(NO_CHIP_ERASE | USE_FSR)
> +               FLAGS(NO_CHIP_ERASE)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> -                             SPI_NOR_QUAD_READ) },
> +                             SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_FSR)
> +       },
> 
>         { "m25p05",  INFO(0x202010,  0,  32 * 1024,   2) },
>         { "m25p10",  INFO(0x202011,  0,  32 * 1024,   4) },
> @@ -406,7 +432,7 @@ static void micron_st_default_init(struct spi_nor *nor)
>         nor->params->quad_enable = NULL;
>         nor->params->set_4byte_addr_mode = st_micron_set_4byte_addr_mode;
> 
> -       if (nor->flags & SNOR_F_USE_FSR)
> +       if (nor->info->mfr_flags & USE_FSR)
>                 nor->params->ready = spi_nor_fsr_ready;
>  }
> 
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
