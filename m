Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BA4C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vOhYm5jvj6mjgMUROvKuc4AXQgqu3y15IErAz02tac=; b=ARRyOeSERgdZjn
	zm3KS22IEsdoY9beo6MTVbsvEibu7Y2CDNqHf3ADPVGy9wVNleFbR82KQuYVU/cGLpMHIRKHedAro
	fLCe9fTqfqBrB46ODiO1/OJvhnlKeOUXCtskCrmsOuTg4tyfONQ7As8XLtL+SHCW0Ck7b9XMErBi8
	TyOyqL5Q2+LCtU82Z25MG4IQeoCg7g8hGnAMCGSEO1n1RFw2EZx2ifNYsdPi/PiVInZSH1N6ChiCF
	XuFNAOmkEYP6TmFfe/OhbtF1aTu78OSIeiU0NLLaVFCqB/CWhu6UuMFrHhpmPOW1Vkyn15SfI8GKz
	KxtfgL+lb1Lmuwv/6wgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDOTz-001TxK-LZ; Fri, 28 Jan 2022 10:27:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDOTp-001TuE-5N
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 10:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643365664; x=1674901664;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Qg8hjXfCkmxUky/m4Ugvk8bNlhtytnoLt38xW+H8Po4=;
 b=FBxSE2nMlVIxruSYB8X60bf5czmftFgimjD7XAiDeh8NkH6M+c858eP8
 DJDFRq39xx2rchy5yXJCej+xyzMYpO9zVfejhuFs1nhJJX9Bm5n4c8ToO
 Mw+Xu1vHkSyNwhPGi5/9vAC+wfoD2n7p54fgq3jHt7vYNweTiQCsmEMQj
 ek20tlDdP7k+SzAiFnPv+EqEqRXZ0tnc1coQKqIzogjclPc2vN4eGeUvB
 LXIMPZDM6HzF0itfQO83fiVMAWODxrYy4onIZ8VvJHUl/34K77HvRJjpu
 qiS3InC1ZPdx/3f4D8uBQHXkdpYomBNBeTfygZHyhVnxEWLC5NBQPNU3d A==;
IronPort-SDR: woDGlQvUkwn79C4kdD0vlkDhtWfmsIAm3BGS+Cv6Dt6qTWCJE9Mip0Mic4cImDaKMZw2pl8dyZ
 3qmneeExnqVlIVZdr/UbRcBVU4p0/2NI/dZ4mmk84CfKKCp94rEkTfws+b+ln0HRPQa0LuhKMq
 6A/1e6wiJDIbXhTCijYLPhUjGpYsXTi9xI0/JTYcAQVtS3qQTQGWbe01Sdid4/UrZgjQR/UoNW
 82hrnAyuamkoKiUD4Ec3cy0xB82aKtW2C69TYq7w1+j9K0u00y0kCjHIrk6wh+mozP6B8sHmpY
 nEAKD0aHSO03q8lZUc+ZztqJ
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="151765050"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jan 2022 03:27:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 28 Jan 2022 03:27:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 28 Jan 2022 03:27:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVdKYjdb1yu6dFTQYUqKj+f5Ue4X2uOUp0VkPSgltScUddjMYGR75S8vL3zyppcNx0z55xgOSZNZO6XcK0oRqMNKvLCfQOSZ+/3OYUa400ZlozHSP1SiT8L7Pq2eYnv5I/Ne2ruMfVMmxruCKp9SAKDIYPUP1udRZMz68I1RY18Y6Gd7mdwV0EWgSMlz0WwdzHQ3v/ud3Y8AyMKzAMPcW1sCF7TlGnn0ftjHhftx+k/URh5br6VVi58JG7IUY4m6CR3YV/Tyhkk1sxMCUKvxZtI1cwM+NV7rSnqzm4ATAcq3F1mRh225BfJZbP59xgL71WQQUDMHuKTotawC78x+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg8hjXfCkmxUky/m4Ugvk8bNlhtytnoLt38xW+H8Po4=;
 b=WGLeplTJalzPNEEVhAsTix/2xVJ7q7Jxl3hxntfWeOxas1/iSZEiBUw9HeG0GChYJQ5JOdAlIm8lNcqfuDtLBfLiVtE2rY2PEErILvOB+wsJKl3NNGwsWMRnWpbuA/5Z9VO5J6WWWGe8UvCQtUW87to5UwTpgIuoTPbVwxCaa0IAG4FPVAHHdyKbeH2cW0ktA/ETdrOFFiMwvbEsEGH8CULj40V9Ph8V9euPrh2967nO6nHyvh6OzM1IvioZVxRDzwA6A4zHMdtEtmH3QMEQBrbP2c0G3XPwr+9oX8Hn/zmqjA/E9UMv484kNkVb6NSQUbIFKfJyfFfvQc6NH6dTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg8hjXfCkmxUky/m4Ugvk8bNlhtytnoLt38xW+H8Po4=;
 b=UeAhGXcROysPk4r3ivrDmbc4M2wkSyGsUaA7RnOkZ4VH2IZW0D93lwxT2a2k2x366A8+Jm337DcO7DxP25imZL24ow0N/K7hsFsSx/OCuizmYUXhTMW1qH/S2BGUM/F8A2WW2XWOL0K9EAC+7PLE6kcsMiR6O8xfLThQWbiCQFU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5130.namprd11.prod.outlook.com (2603:10b6:806:11d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 28 Jan
 2022 10:27:32 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94%2]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 10:27:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v7 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v7 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHYFDGo/YwnKyic2kCfJQ8YUMHyDQ==
Date: Fri, 28 Jan 2022 10:27:32 +0000
Message-ID: <8244e2d8-9d45-79a0-e99b-584c033e194b@microchip.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <51eb0f45c2d03cc12ad5959410c88c69aa856df7.1626677855.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <51eb0f45c2d03cc12ad5959410c88c69aa856df7.1626677855.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e883dbc7-177c-4d39-ac5e-08d9e248cb57
x-ms-traffictypediagnostic: SA2PR11MB5130:EE_
x-microsoft-antispam-prvs: <SA2PR11MB513009E22E2F225D917A1F53F0229@SA2PR11MB5130.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Ja6hvHJTW8+nByx35RtSjuKrbY79u8ZXQ05RMhixaTrLZcQnCgaX4FkqEPq0UHVnlVD1N11YjXTnpnIG7FRBYB56UrrrkzdpVLYyGvawrzVymm9/VXLQ8aMtijsxtRWEz7B+DxYLlroMkqSqv9nU1nnfzDrpZ6X593v2LSKtqrqImnjWedJ/6sZdz2Jvvs+AhiEvNN3HoctOzUz4vvW4ej9+op24jCLs6Pvjb0a5mHlV6RfZfJOr4Yk3ZuLaSCfv+hz0AZ5llKmTEJU4+vllnTcRtRj668r1DAxwFlDeKIrALIHx3bgCxAU90d0fcY8LFLFG0w49izXu5bI57Si+vCnA178CHP5XESKxWPOZa/gTua/5w9wHBGKxxnd7PUrAVeO+EOvJiPs6doD/iIS/oIPTI4xdafGGcE1upuFWaxokszQY0P+6sPcd3J0KwmcwuwCtnJcadN05SlBd6a4KVb5p/VmX8e7WBqKzmnANmGAojjd8oOkgweUvNNMB++kFmKfQi1ZcDTta5mEeX1gBwP3aqYMfcY4D92iFvip45vqjqX5makuy62NfhoeLvlwSFHuc40AyY9PC5iIcNItrAUOJ/0Et8LpBF0ziZ531cWQXFbTNIpgGkPyyY1ouT5CCCc7nviKKu3EUA79PBClfwTUlvn3aXlzbVunSJ7hNeeb7cpCy8uzvcMU0h/sJE3PHckLonNznPfB72QpMnJSRw2g5k0FFmX4Z+rj5XdB5egAgfsLrVq1/JxYxNSbXZMUyemhi1ajAie2Tj4DbMVgVA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(91956017)(36756003)(8936002)(8676002)(76116006)(71200400001)(31696002)(26005)(38070700005)(6506007)(186003)(4326008)(508600001)(110136005)(6486002)(86362001)(54906003)(66556008)(66476007)(2616005)(66946007)(2906002)(316002)(66446008)(53546011)(64756008)(5660300002)(38100700002)(31686004)(122000001)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzVJSGdYZE5kRkxKa2w4STNtZzBBd1dsMVRYYjJ6UFZKRGJrSmVoeDEvUEhZ?=
 =?utf-8?B?Si9QVnRRc0J2RVJvZHhldk5xY0xrc1ZlUCt6djEvVDV3amZwcy9CZW9ETEll?=
 =?utf-8?B?NlY4bEV4aWt5czc3UiswYXJvQWhTSThYekhWdmszOVdNQjFtU3I1MkI4N0FM?=
 =?utf-8?B?VVlZM2lHTzE3cDU3Zk9OeWNlMk1YM2Fva25oWHVxWU5KNEUzR1Y1SE1VUWtG?=
 =?utf-8?B?ZmdDVERQZlNzVFQ5YXZKREVvUXhnSys5OVRhazFvZzFTU0lSdFE2M1B1MVZZ?=
 =?utf-8?B?TmFsM0FJWXF0K01KbXBDYlluTmk2WW5nQXdydzBYbjJiZHdmczUwSWMvRHBM?=
 =?utf-8?B?b0VaeE1iTklZTTh4Y0M5RHVOaDZmdnlJVkROQnZGWE5PZktacUJVKzRFTnhl?=
 =?utf-8?B?UUgyMlpoZUtNcWNRS1VjbTNjUUZmckMrTzZUeStoR2JZYkNWNitzUis0R0FI?=
 =?utf-8?B?NngwaEJpRUdTbkxraWp6OHlxU2dpeU5jaldjWk1iaG1JcGI5Q1FROGVhNS9G?=
 =?utf-8?B?UUJSUUJEOEFwb3JHMWhZdHNsdVZNMjR2aFJTbWRBWDMrMnJlVWZFRVJpaGw3?=
 =?utf-8?B?TGdhbnZRcG1MeEdKT0JqdEdacnpFU2g2RlpyWlVKUWd5VU9Edksvd3UycWNz?=
 =?utf-8?B?WFhpcGdhUTkvcEhVRnAvUHNvNGRzUkZkdHNkQVRHbEp2QzR1SmRJbG1iV2lL?=
 =?utf-8?B?RGVzTVRFWVJGM0FQaSt4RGVUT245NWtjcVVnc1NpZ0dvNnIrY3NSU0JDRzlh?=
 =?utf-8?B?L042UytMMy9mWmVQanRaa09IcDlIaU1Qb1piRCtpSWhwMUFOcTllQkUvVHho?=
 =?utf-8?B?Y3lkalFOWTBBNGw2YWxNMDRxbkQ3Q3IyTlcydnc3clZwVEFNbDNLY0tUSjJN?=
 =?utf-8?B?MFRkeVFSeWZFVTRkbUdNMDVzbk5QR0FpcW1LK2E0NVRKYURmVDdqaTBvZWt4?=
 =?utf-8?B?Z21vNC9qU3F2TERxUlhWV0JOREtWOVMraDYzT01EMldOelRqcVY3dHZHK1la?=
 =?utf-8?B?NllKQUxZZjMzWUp2ZzBjMkhKMnc3dHZ0Y05kaCtxVHE3NWtzN2QxVlVTR2Fq?=
 =?utf-8?B?UTUreGZTZ0ErVUxxTmlBQVNFQ1MxSSs2S1kwTDA3U01JMmZsSmFkQnBqVS9Y?=
 =?utf-8?B?eDFhaWNRNmZwZFJFVTRwdThncER0Y2taK200QS9sWkdKUDMxUkVFRlhtZ2FZ?=
 =?utf-8?B?dTczWndsTkJPR3F4QlBNbk5CbDFOZHdXbituWXRwYXlvZWRnNVk4WFpvWjF2?=
 =?utf-8?B?a3JmaklTNkZSWFJqM21qbEFYdTR4elJSaENJaXA3RnExRkw2Ry9Lbkt3a0FC?=
 =?utf-8?B?ajhWT3gxTm5HU1FFL1M1QWxtdVljd3NaRlhMZjJsOXF2WGoxMTZzbnY2bW52?=
 =?utf-8?B?NmhJdUo2anBKL1EwNDZHRnhoY003aDFmSTM0bWFaaGkrS2dhcktpYlZ2clBU?=
 =?utf-8?B?dEdkaGZweG8zSHpQbW5JQ2NVQzVVVTErd0Q5WmF5cjdYNnFoTytXdjdnRkJh?=
 =?utf-8?B?d1gxRVZRdG9YQ05SNHVIdU9OQUozdmI5QTNobGx0eUxDWkxNTjNnVUxIUlJY?=
 =?utf-8?B?Y29uODhUTHlNb3NzRVRGWUczSG9EVHg4RDQ5VzJRa3NSL1EwTk8rcmxNdDl2?=
 =?utf-8?B?UUNKLzlWeVlEdXNTVXFSVWpnaW03N3FFc2ZUNmJUZFJiRWgzOFg1WDd3YWJ0?=
 =?utf-8?B?blR3WXBuKzdFUmdWR3JWcW5pNXIyZDhxMUhHalhFVzJhL0NOT1BaUnF4cXBE?=
 =?utf-8?B?SkFFRGZFcVNXbW5VT25meU5veEI5VVZTR1dYc1pIajhXUHF2aG41MHBHTzBZ?=
 =?utf-8?B?Snp3VlZSbHRvSXU2eXltWXJ3eFVtZ2JhZzlvRlZIRDlVODZYcDRvQ2FWWVRq?=
 =?utf-8?B?cCtXT25hTGExN0V5UHgrMlhxRHE2b3Rsb0NCRG5KSHhaQWNCTXFlL1h4R2wy?=
 =?utf-8?B?VVY5Ykg5a2tSNU94UjBZenlncE92M1JTZDNBY3A0cjE5Z1c4REovd0REL1J3?=
 =?utf-8?B?V0t5ekVSS1lKcDJpbjlyWVB4SnlBbWl6SW8rdUJpbFRwWjBZbFhVOXpRaEZw?=
 =?utf-8?B?OGw3aEdITzNSQk1jM05sTVVOK1RDdGlkWUhGeThGblpRVGwvVGtZdUxPdXFN?=
 =?utf-8?B?UGg5Z3Q3a1RzYitCMlJtT052ekxIUkVzcExTU2NDNnpTRlpGT2tmMkcwRDIx?=
 =?utf-8?B?QmhBTzdDZTl3cU9ydzVVQ1RCdEg0b2drRjNtQ0tCRFY4Z3p6TXJnUVhEcE1x?=
 =?utf-8?B?clhOVStXYnRPWW5MZmhlVXllVGRBPT0=?=
Content-ID: <513D2D6F8D040841B2BD02F3524C34A5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e883dbc7-177c-4d39-ac5e-08d9e248cb57
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 10:27:32.6054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6uxwywXXI3YxK0IRHQQLFO57+FMqGdbnBDH4tZJ9OlgjRn5FgRba5c7Y+HYeqYTjnyfyG2ih0O4vH6cR+2zAeL9yHwLRcSxYPJuA5Mbg8lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_022745_378761_F6AE1FDA 
X-CRM114-Status: GOOD (  30.06  )
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

On 7/19/21 11:03, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
> 
> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
> uniform sector sizes are supported. This is due to missing or incorrect
> entries in SMPT. Fixup for other sector sizes configurations will be
> followed up as needed.
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v7:
>   - Add missing device info table in v6
> 
> Changes in v6:
>   - Remove 2Gb multi die pacakge support
> 
> Changes in v5:
>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
> 
> Changes in v4:
>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
> 
> Changes in v3:
>   - Remove S25HL256T and S25HS256T
>   - Add S25HL02GT and S25HS02GT
>   - Add support for multi-die package parts support
>   - Remove erase_map fix for top/split sector layout
>   - Set ECC data unit size (16B) to writesize
> 
>  drivers/mtd/spi-nor/spansion.c | 90 ++++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index ca50e77b4220..c7170477e706 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -220,6 +220,84 @@ static int spansion_quad_enable_volatile(struct spi_nor *nor, u8 reg_dummy)
>         return 0;
>  }
> 
> +static int s25hx_t_quad_enable(struct spi_nor *nor)
> +{
> +       int ret = spansion_quad_enable_volatile(nor, 0);
> +
> +       /* Reset WEL bit in any error cases */

the comment suggests an if (ret) then spi_nor_write_disable(nor);
Should you call write disable in all cases or just in case of errors?

> +       spi_nor_write_disable(nor);
> +
> +       return ret;
> +}
> +
> +static int
> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
> +                        const struct sfdp_parameter_header *bfpt_header,
> +                        const struct sfdp_bfpt *bfpt)
> +{
> +       int ret;
> +       u32 addr;
> +       u8 cfr3v;
> +
> +       ret = spi_nor_set_4byte_addr_mode(nor, true);

why don't you let the core handle this for you? Why do you call it here?
> +       if (ret)
> +               return ret;
> +       nor->addr_width = 4;

so SFDP gets the addr_width wrong?

> +
> +       /* Replace Quad Enable with volatile version */
> +       nor->params->quad_enable = s25hx_t_quad_enable;
> +
> +       /*
> +        * The page_size is set to 512B from BFPT, but it actually depends on
> +        * the configuration register. Look up the CFR3V and determine the
> +        * page_size.
> +        */
> +       ret = spansion_read_any_reg(nor, addr + SPINOR_REG_CYPRESS_CFR3V,
> +                                   nor->addr_width, 0, &cfr3v);
> +       if (ret)
> +               return ret;
> +
> +       if (!(cfr3v & SPINOR_REG_CYPRESS_CFR3V_PGSZ))
> +               nor->params->page_size = 256;
> +       else
> +               nor->params->page_size = 512;

isn't the else case already covered by BFPT?

> +
> +       return 0;
> +}
> +
> +void s25hx_t_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +       /* Fast Read 4B requires mode cycles */
> +       nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;

Is the BFPT wrong? Why do you update the num_mode_clocks here?
> +
> +       /* The writesize should be ECC data unit size */
> +       nor->params->writesize = 16;
> +
> +       /*
> +        * For the single-die package parts (512Mb and 1Gb), bottom 4KB and
> +        * uniform sector maps are correctly populated in the erase_map
> +        * structure. The table below shows all possible combinations of related
> +        * register bits and its availability in SMPT.
> +        *
> +        *   CFR3[3] | CFR1[6] | CFR1[2] | Sector Map | Available in SMPT?
> +        *  -------------------------------------------------------------------
> +        *      0    |    0    |    0    | Bottom     | YES
> +        *      0    |    0    |    1    | Top        | NO (decoded as Split)
> +        *      0    |    1    |    0    | Split      | NO
> +        *      0    |    1    |    1    | Split      | NO (decoded as Top)
> +        *      1    |    0    |    0    | Uniform    | YES
> +        *      1    |    0    |    1    | Uniform    | NO
> +        *      1    |    1    |    0    | Uniform    | NO
> +        *      1    |    1    |    1    | Uniform    | NO
> +        *  -------------------------------------------------------------------
> +        */

did you miss to update erases here?
> +}
> +
> +static struct spi_nor_fixups s25hx_t_fixups = {
> +       .post_bfpt = s25hx_t_post_bfpt_fixups,
> +       .post_sfdp = s25hx_t_post_sfdp_fixups
> +};
> +
>  /**
>   * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:               pointer to a 'struct spi_nor'
> @@ -468,6 +546,18 @@ static const struct flash_info spansion_parts[] = {
>         { "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>                              SPI_NOR_4B_OPCODES) },
> +       { "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256,
> +                            SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +         .fixups = &s25hx_t_fixups },
> +       { "s25hl01gt",  INFO6(0x342a1b, 0x0f0390, 256 * 1024, 512,
> +                            SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +         .fixups = &s25hx_t_fixups },
> +       { "s25hs512t",  INFO6(0x342b1a, 0x0f0390, 256 * 1024, 256,
> +                            SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +         .fixups = &s25hx_t_fixups },
> +       { "s25hs01gt",  INFO6(0x342b1b, 0x0f0390, 256 * 1024, 512,
> +                            SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> +         .fixups = &s25hx_t_fixups },
>         { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
>                               SPI_NOR_NO_ERASE) },
>         { "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
