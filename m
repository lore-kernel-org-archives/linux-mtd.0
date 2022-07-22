Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8814FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 06:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SISREhGUfYc+JPCcZaG26uPxVF2ICla/lBksAKQg0ng=; b=IdtcDER6uyOeLH
	DiqrpPd2fSXjga+SXcldRLF73J3hVLwn8eoOHoBu+mF2NL3A9eW8TQYe/Wm262OdbWkVgjma0MBcT
	LwjkK2IIA0taiVYhX97nlpfTVSumpBdm0cqZ9o7c5fLH4uOywMPOIpotalZnJeutHKwLfdy0j0BlE
	BJ3rbKJOBd9T/+VGJbwkv5NoBk5JdJym2s2brle0juBwGBgnp6r4vV044JP6Svxm1xl53nyi2YJXn
	RS3oYa+Lhol2LUZ8Gb6nmqBEy9Euj+DFNgfCj2TqmzhD3/OTeVocZvIQA61ORPJyt0DIjZGYFKir8
	zhx5nL9tLhUPPVRhArJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oElpd-000GTK-ED; Fri, 22 Jul 2022 06:08:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oElpZ-000GRn-De
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 06:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658470089; x=1690006089;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Eex6tB4Vqxnl433A/Qlcl0wRY/C1FaszwxZvS5R9Dn0=;
  b=ZC6KYYRvrUAT5Rz17hZ8IB9w+Gq6Wamr7OQMdE21umdhMQGurxJ00ZPC
   MzaX15YYQ0g804kAR5wA7NMHwvl4dWQ6a/t/l747g58oHAQnWbEMN8thH
   /2ndnT6kLZnhNAQPyBXMPi4MHua8GPTvH8w2ldxdb1nDi8zRipT089oP8
   OiXPh2cYflhHevIFuSEO8sLHZuYFLFkHqSPxwPKOlRKzigU1BAnhsH9A/
   4C8W8tBAOlW7l2SqgdgHP4soFHEBc0Zq2XKOX5THxZWyv5VCkqiihim7U
   1EH8jH9QqvBH3z24ICHnQGsCC7b6xH9wbDby8fw1YnTZTiQVX3fGW/MUI
   A==;
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="105652615"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 23:08:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 23:08:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Jul 2022 23:08:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEP1jY4CCz9WGlEPgiEgp9XJfEeH/DlUU1ZvQX5LjTTknisWOMH6B9mR7nJXkHy2XZUPsvARvgpTIAn9BLDln0PdfCZmQa5/c0cmcw1T5p8En2/UTESVMJaefYozEgvPHPBl/gZpF2+ID3FRt/i/rQvKrCj/afBtq33wowGqFS65S3bXQjYpO3zR335JkwM6xUbwv3uZ2rjw1HgqS6i6EJ9KIsnqsVUWPfnyFSjqXWaTEgj2WYmh1Bj1QFcSyA1G/D9MXkHQ7laQe5IxS3dQKDDMmfoMDiVH2wAmXlbJdhwSf/HawLq+jmO7IqbkR6nEjmLNgdnDbP/Z4JFHhcMHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eex6tB4Vqxnl433A/Qlcl0wRY/C1FaszwxZvS5R9Dn0=;
 b=L00jP9STIMUNqhnGN0uPmvfkEghdcANiFxU8qd26o9HWCMsghWrld1plx1BOcnTYCNNcnDh8BAPzoWRs5cKjLfhja9JD+vTCn71gSnVs3Iyxfds+aVETShikojcen+r3/xxpizosPL76yParCbdDjGB54kwBVx38C//FwvdRDFDXOyomtkcxgLiu+obMvem40DgEMsajGEUGyeNdnxCW+qamq68WJjm9W8yG140hXPU8rp4OzX7clH7A83wTcAAaiv+7DMU2Ionft8tjELw2EKjgID6I0Gppa8XIANL4e4feaPFbjcPO41lv7I4pfCFJB7IJMeIBYv5yqKeM5Afv+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eex6tB4Vqxnl433A/Qlcl0wRY/C1FaszwxZvS5R9Dn0=;
 b=JxlC6S3lfU3lw6BCqs15lOqBam+L66MJLLogdB+oxImRGyNMvj3f5NhX8d1Bmaq0bPbjC8CX8kcKmNjP3XHjdFu0sun0ElrFwnEq6iSl3IIuGpaci+w6l3vYkpJ9aAC9BDmvkj1uUEyINfOyl6tzLxdPunloDl2vyVjq62VbpEY=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 CY4PR11MB1319.namprd11.prod.outlook.com (2603:10b6:903:2e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.19; Fri, 22 Jul 2022 06:08:00 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 06:08:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <p.yadav@ti.com>,
	<Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Topic: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Index: AQHYnRvdTEt+bD16DUaYd/6imLQaPw==
Date: Fri, 22 Jul 2022 06:08:00 +0000
Message-ID: <7a9a6f4d-37f2-68b4-2770-bff0c09de742@microchip.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
 <c42d5930-73cd-6dbe-f650-db72f35188a5@microchip.com>
 <a035a1a3-0d82-48ab-5d09-1d5164999890@gmail.com>
 <98fa98f2-055c-2338-6790-de99670e20ff@microchip.com>
 <2912f41b-5966-b08d-0b52-97eba3a809bc@gmail.com>
 <774d237f-e5cb-f46f-91ee-ae3a55dcc969@microchip.com>
 <36924e69-318a-8955-bbc8-86356c53bc42@gmail.com>
In-Reply-To: <36924e69-318a-8955-bbc8-86356c53bc42@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 765ceda9-3574-4180-375c-08da6ba887d1
x-ms-traffictypediagnostic: CY4PR11MB1319:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G+5zsHX4bpzZ/PnxjOzJcPWLkzEpMDl8MOevjFeZKXip3dkniPNFOEVP1OMSyDg19bih3dqR34PS2QJLh81ayFT8zO/Vbl1qwS8xO5ahkInODTRPJ9XnM5PgH0Gdh3bhrXcM3brZclHe8Eknn4fcPqszDZzhdqjoe4soVWIXBhSTvjNzF02JKIaeeB25z9CSVMxUznl9iIHep5FKMd4V2m93hoc3Xgw3z78usDmMsHd7CaJ7v7XAoMuqiVofuUe8YhQqrQ1r39yUVuqxU+N8t73mDY1aae10Zvp3zb5PCXBiPZHEvQYdunBdfEzPCXktxAcI5AMJya1t9mbwHGItKxsHRc97qhd4tvihnDPIO8w3TLY65FjYyh3REqFDBKEb2nOvmatUTjaW8bSP0Jf48w7Gy7/U0mEEciVMq//ymSkV3BXkykIiVpvauvK4ubnWRlW/owlxawBFEm2KoqAvE+yMiH/4e7T1WV96ofnJUNlAxo2aTIMvIx+uOz/ROKMwF66mFmY8/6RHbUR9C9Rs2Ld4PxQ+vdqBFSJ/7bmh0U9zmljGF3jUEfDCW92RXm63yNXdB9Mpz5One+mFnG4Le5OeFCfpyrqugQmCUbzE3623DjlmsxiTrrspF1MT3umrugPr7cu4bPgzkQToHk65Gmnve1oK892UCWejkbwSkm924pfcc9+rCDv8Wsw34nYg0mO8C9ZhQgNSuChhBMYzIroumARTnFYRc22RH6WPfyiCYoCj6+fmnqwdEgsMQNpU2GkF2Y/PBQj62OW4ley+w6khicNpaHd0k4ZmPHJUm91kyfrq5ltTKt267LovmAS9v62GoNn+XnL+wZ64uHjVvtcuUBTmvItmJw4f6gpRNwddx149vIf2TAWlI1ld4WCd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(396003)(366004)(346002)(316002)(2616005)(2906002)(110136005)(38100700002)(186003)(36756003)(31686004)(71200400001)(31696002)(6506007)(38070700005)(86362001)(5660300002)(76116006)(4326008)(8676002)(66446008)(66556008)(66946007)(8936002)(53546011)(66476007)(64756008)(41300700001)(26005)(91956017)(54906003)(478600001)(122000001)(6512007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHdzWkdpN0hGb0hCUjFpblQxdGZhQUZINjdKV2JFc1lRaHpJNHM5SHJQT2Jv?=
 =?utf-8?B?YXg4QkJCN29ZeUtCRG5RL0Fha25GYzJRdW9aalVlaTg2NFRmVkpVYVlSYmRD?=
 =?utf-8?B?T3F6VTBVbDZ3eXJSbTMvb0p0VnY4cENXU2RZZGN2dTMvRjkrL2xvd0hTVlJJ?=
 =?utf-8?B?a3ZMSk4zcHgySi9PcExiVkZ1UElFYlBmaUtwSG5aS3BvZUsxU0hmNkppZ2Jx?=
 =?utf-8?B?TFdaelV4VDBMMXloYkdNZUNKY0s5V2dnOUtSNktpdnhLK1dPb3ZNZ0hOd3Ez?=
 =?utf-8?B?NDNsZ3haRHNMSHdSWmtHNk5hVEZQNU5qcDMyUnJuOGpPOURWVlhRamZnQjlP?=
 =?utf-8?B?UytkNW1aNytqVjZkUndtQ1JYWFNNYU96ZU1rWGk4eWVaVUVXYmlwL2VybEtK?=
 =?utf-8?B?bUEyWDRKSGoyL2YwNnkxaE5VZkswUVh4MmxHUHdnMjZqMmE5UTZ2TFd1Y2NV?=
 =?utf-8?B?Q2tYY2xpRlRRekE5WXI2cDE5MWV5VUpHY3puYitJRjNtazh1SDBTUVZzVFlo?=
 =?utf-8?B?ejltd0crWXJtb0F6bXRac2pwTUYxWHE3WUxNaGk1RkxvbTgrV25BZiszQ0lm?=
 =?utf-8?B?eGdyQVZ3T3hOM0tVNTdNZTJNRmwvdDZiaEdhdVYyekJKc2Vzbmt0Z2tJRkxr?=
 =?utf-8?B?THdUaFdjNmE5aGE2UlhVN2pvVkFLSkRVMVMwZnpxWGMzc1I3MDhUZEh1YXFJ?=
 =?utf-8?B?TE1OVEpHdTdhWE9GNHlJMjZ3cjcxQTBQU01HbjViSjFTNjdhYlZvb0ZramNm?=
 =?utf-8?B?SkI0VFZqdDA3MFBDUkRnTUdsbjVNWFBSQVY4dWttOVRGQnZOUE5qQU5sdGpa?=
 =?utf-8?B?M0JmbFRGekJvZXNWb3BRV1hlaFFHaGdUNFRad3dPdjN2ekY3ajFHeCtTcmJU?=
 =?utf-8?B?SGg1QU5JNWJ2RE1oOERCN2JtS1VVQmZJTCtyZTFUaE9wVkFEa3c5RmFZempt?=
 =?utf-8?B?aXlmdy9qS3gxWmQzQ0JjdHRGZTlsUFM3NnlmVm1sL2hlQUhnRWZwS2V2T21X?=
 =?utf-8?B?WDBNVXp2VmhlMUxnQTJFYUNtZmxYOFQ5RUJSTDcwMG0rcCtiRStGajBMODlG?=
 =?utf-8?B?aXY5VFM0b2VWY25HTEZ3RDlkRW9hcWpsMmVRay82SkRWY0JRTmFUVGZzay9I?=
 =?utf-8?B?ZjROWUtFK2lrZ3NIZHZlR0JTWk5manVPYTB6WWFJN0pqTWZ0dDRQOVg2YURz?=
 =?utf-8?B?MlhOS1EyUjhpc3pYT1lKUjhPSHlKQUEyenk0d0xRL1pHbzc1SU5wZHk5MFc3?=
 =?utf-8?B?RmtZdjNiNzZCNURxdkhydGRncU95MkQwTlU5VGZCSHlHYUpqWXhLamQyaWVr?=
 =?utf-8?B?RE1aNVNRQXBLTHNKQXExZXN6dGtpayt6MnBpTmVsOXNtUUw0NjlPZ3R0SXBU?=
 =?utf-8?B?eUE3dlVXRDFxVU4wYjZQeENDRjZCd0FualdjZDhOQzFSTGdGT08weE1JK3Ev?=
 =?utf-8?B?UkRLTEFPdDhvTkxEUEEvTkg1MGY5TWhHb2dmdjRXUzdVaEhKeUZxK0x0djdY?=
 =?utf-8?B?TG1ydnJ0UXd5NThRUnQ3emlxUmVITkt2azJjVVhhTWVuNzNzaXRQTXpCVE96?=
 =?utf-8?B?ZWFUeGlsNVpmaTd2NGFDUmZYRzdIRzFhc3JXRU55c3FjeTBvZ2cwU3g3bW1l?=
 =?utf-8?B?UVErc05oRXVJOWJ0UHN6aXh2S1JVZlhWY3ZTMzN4N3Y5ZzJXZWg5U3FlRUdW?=
 =?utf-8?B?OTZFNHREc21OcTBGTUFlbk1rUEZZYk4xNVV3aDk5VGNEbzIrZjYwSGk5ckxX?=
 =?utf-8?B?U1F6czdhQ0dsNytjUXc5VXNXaWNXL1BkQmpmYllyQkRrLzZBbWhvekt5dHhy?=
 =?utf-8?B?eXdoV3ZETzcycUNNRlNLV3dxajRCZVZjRWlpdzQxQW5HbmtEVFc2NzlYSytz?=
 =?utf-8?B?SlVLbFA1c1ZaZEdTbEY1MUhiVEFxNzB0QU9EbzY1STdNQSszS1lHZ3prTTA1?=
 =?utf-8?B?aHNHeWZJKzRpdkt3MVEzc09lbHhNNFNpL1FlcThnQnErL0lBZnBMQzdoc3lL?=
 =?utf-8?B?MlN6UGZLUThnMGl2a20wZTZTWGtiaFJMQ3pDVHg3eWRnRWY5TU0vZmJVanh4?=
 =?utf-8?B?TFlDUGdDcGhCK3ZRdHgzWmUyeHdNWlJRcjhKNWZqZWU2dnVQTFQ4V002dUtC?=
 =?utf-8?B?NEo4YVpjYkxnSlYxSmlJRExwLzdrTS9jT0l4emJ6Z0FKcUZiTDVqcFdKMktu?=
 =?utf-8?B?UHc9PQ==?=
Content-ID: <E1647C7680ABAD4DB13F439BF4B26D96@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765ceda9-3574-4180-375c-08da6ba887d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 06:08:00.3190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJppsu9ZrqoSg31lsXFdN8H9PyT2behK9r2Teq+koYi8Fqa2yB/e8jzY8qCV64s2HQ3iFuUu/Y2BO+XenrIQDOHhlz3IVAOB23EkEYpLCow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1319
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_230809_825524_8644C42E 
X-CRM114-Status: GOOD (  18.32  )
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

On 7/22/22 08:11, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 7/22/2022 2:06 PM, Tudor.Ambarus@microchip.com wrote:
>> On 7/22/22 07:46, Takahiro Kuwano wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 7/22/2022 1:20 PM, Tudor.Ambarus@microchip.com wrote:
>>>> On 7/22/22 07:00, Takahiro Kuwano wrote:
>>>>
>>>> Good morning, Takahiro!
>>>>
>>> Good morning, Tudor!
>>>
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> On 7/22/2022 1:06 AM, Tudor.Ambarus@microchip.com wrote:
>>>>>> On 5/23/22 10:49, Michael Walle wrote:
>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>
>>>>>>> Am 2022-05-14 05:51, schrieb Takahiro Kuwano:
>>>>>>>> On 5/13/2022 6:40 PM, Michael Walle wrote:
>>>>>>>>> [btw the subject still has the old name of the addr_width]
>>>>>>>>>
>>>>>>>> Yes, it must be fixed in next rev.
>>>>>>>>
>>>>>>>>> Am 2022-05-13 03:26, schrieb Takahiro Kuwano:
>>>>>>>>>> On 5/13/2022 7:14 AM, Michael Walle wrote:
>>>>>>>>>>> Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
>>>>>>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>>>>>>
>>>>>>>>>>>> In 4BAIT parse, keep nor->params->addr_width because it may be used
>>>>>>>>>>>> as
>>>>>>>>>>>> current address mode in SMPT parse later on.
>>>>>>>>>>>
>>>>>>>>>>> Mh I'm not sure this is needed at all.
>>>>>>>>>>>
>>>>>>>>>>> SFDP spec says
>>>>>>>>>>>   Variable address length (the current setting of the address
>>>>>>>>>>>   length mode defines the address length)
>>>>>>>>>>>
>>>>>>>>>>> and
>>>>>>>>>>>   When the length is defined as variable, the software or hardware
>>>>>>>>>>>   controlling the memory is aware of the address length mode last
>>>>>>>>>>>   set in the memory device and this same length of address.
>>>>>>>>>>>
>>>>>>>>>>> We don't set any address mode until all the SFDP parsing is
>>>>>>>>>>> over. Therefore we should always be in 3 byte mode, no?
>>>>>>>>>>>
>>>>>>>>>> Actually there are some devices that have variable address length but
>>>>>>>>>> 4 byte mode by default (I will work on those devices after this
>>>>>>>>>> series
>>>>>>>>>> is settled). To support such case, I prefer to use
>>>>>>>>>> params->addr_nbytes
>>>>>>>>>> as current address mode so that I can fix it in post_bfpt_fixup()
>>>>>>>>>> hook.
>>>>>>>>>
>>>>>>>>> Are there public datasheets available? So these devices have a 3 byte
>>>>>>>> I will send datasheets to you in another email. At this point, only
>>>>>>>> summary datasheet is available in website.
>>>>>>>>
>>>>>>>>> and a 4 byte mode, but after reset, they are in the 4 byte mode? Looks
>>>>>>>> Yes.
>>>>>>>>
>>>>>>>>> like it should be fixed in a different way. I'm not sure the "current
>>>>>>>>> mode" handling is correct.
>>>>>>>>>
>>>>>>>> Yes, we may want to introduce a new flag like SPI_NOR_4BAM_DEFAULT and
>>>>>>>> check
>>>>>>>> the flag in BFPT parse. Once I send another series, please review.
>>>>>>>>
>>>>>>>>> We need to differentiate between the mode the flash currently is using
>>>>>>>>> (nor->addr_nbytes) and the mode parsed by SFDP (params->addr_nbytes).
>>>>>>>>>
>>>>>>>> The flash's address mode affects the address length of Non-4B opcodes,
>>>>>>>> including read/write any register ops used in SMPT parse and Infineon
>>>>>>>> (spansion) specific hooks.
>>>>>>>>
>>>>>>>> The 4B opcodes always take address length of 4 regardless of flash's
>>>>>>>> address mode. In these Infineon chips, 4B opcodes for read/program/
>>>>>>>> erase are available and 4BAIT advertises them. We don't have to enter
>>>>>>>> 4 byte address mode for read/program/erase.
>>>>>>>
>>>>>>> btw. this is a pity. you are using the stateless 4b opcodes but
>>>>>>> then you don't provide stateless opcodes for the read any register
>>>>>>> op :/
>>>>>>>
>>>>>>>> So, I think we need to differentiate between address length for
>>>>>>>> read/program/erase and flash's default address mode.
>>>>>>>
>>>>>>> Or we keep them in sync. E.g. switch to 4bytes mode if we are
>>>>>>> using the 4 byte. Granted, that sounds like a hack :)
>>>>>>>
>>>>>>>> Obviously we are using nor->addr_nbytes as address length for read/
>>>>>>>> program/erase and should keep this usage.
>>>>>>>
>>>>>>> Yes, I wasn't aware that we actually two different runtime
>>>>>>> parameters:
>>>>>>>  - the read/program/erase address width, also used with the
>>>>>>>    4b opcodes
>>>>>>>  - internal mode 3b/4b. Up until now, this wasn't an issue
>>>>>>>    because either the mode was switched or the 4b opcodes
>>>>>>>    were used. So this was mutually exclusive. Now we have
>>>>>>>    flashes which uses 4b opcodes _and_ we need the state
>>>>>>>    of the internal mode.
>>>>>>>
>>>>>>> I can't think of a good solution for now. Need to think
>>>>>>> more about this, but I'm pretty busy at the moment.
>>>>>>> What I think is clear is that we need two different modes
>>>>>>> here in the spi_nor struct. nor->addr_nbytes for the
>>>>>>> read/program/erase opcodes and nor->address_mode or similar
>>>>>>> which tracks the SPI flash's internal address mode.
>>>>>>
>>>>>> Hi, Takahiro,
>>>>>>
>>>>>> Can we determine the flash's internal address mode by querying
>>>>>> the flash at run-time? Is this possible on Semper flashes?
>>>>>>
>>>>> CFR2V[7] has current address mode, but to read that, we need to
>>>>> issue Read Any Register which address length relies on current
>>>>> address mode. Chicken-and-egg...
>>>>>
>>>>
>>>> I see. What happens if we issue the Read Any Register command with
>>>> the wrong address internal mode? Will I read just 0xff?
>>>> For example try reading CFR2V[7] using addr_nbytes of value 3, and
>>>> if it fails, to read it again but this time using addr_nbytes of
>>>> value 4.
>>>>
>>> It's undetermined. In case we issue Read Any Register with 3B address,
>>> the host controller outputs 4 bytes (opcode + address) then inputs
>>> 1 byte. If the device is in 4B address mode at this time, the host
>>> controller inputs the 1 byte while device is still waits for LSB of
>>> address so IO is not driven by device.
>>>
>>
>> So if the IO lines are floating, we'll "read" whatever is indicated
>> by the IOs at that specific moment of time, right?
>>
> Yes, right.
> 
>> If so, we're forced to statically specify the default internal address
>> mode.
>>
> Yes.
OK, let me scratch something.

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
