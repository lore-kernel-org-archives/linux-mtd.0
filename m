Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E181DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 07:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ud0Fjn9o5rKJlHl4QSS6VSAKuBb10unVUaFE5TTvA5w=; b=hdQgT3V1VIHeky
	RPm7doqsCMHzVBEBRsxITQfdwI6SOh2dzZD2GsISuHJCLSE+E0p8z8jcZyMFBXEFTB3HRlHjmKjmt
	Ug2RPxX6RB5OvXMV13FI/1hbuswMmo1SaKSFlwhREajTV1PSL3bpNRUtt+GsRTxZVPOYNe2ln0FZi
	cWZhq3Xg7mTfrDajYx5uq6N/iFa41Y//S1Wa1In1gjmOuMICDdzpDki9OVidGtvof/fcZs6lIOJBZ
	iBLQR9qnfnZCvBQNqoiY15+OwT44eecbSl0ICtaAv0I3/AZN1UZR3ktX8oQPGM3Lr2a5z+JFG16+2
	OtKnsesGhWrtp7/2mIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngiY7-0027G3-FS; Tue, 19 Apr 2022 07:45:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngiLw-0021MU-Rf
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 07:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650353568; x=1681889568;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PgNHd1vB1qYWGrFDfjFiu/2jhKFpN8qLR0vXzqGGfcQ=;
 b=rmqjEMfh9pul92qOGgMvm7y5/XquRxdbW6R6pCm1zGLjr+kYpnx7zcW/
 MpzQvLeiiSzHCt5l7XemOkUMKeFl9OdoMoclrD+xbdRWSQiapYwFi1PlY
 Md9yJhdy/OE/H3TuM31jP42vAzR9c7oa3xnh5dc6tl8egeQsE4zRpUMzu
 uo8IBoDKZ6OPa/ienKZy1duj2S8kWIRT8q9g6N6L8adLRb0Sgkj9BlTin
 UIFLCfLZWCaX3w8dzqmIuvnuFlImXA1p5DduIgYe++yWl6b9EPXjPkMtS
 p7PX6GYIDFn97m8fl5/vgQGoywYGCrT9dOUHliTMIK9Xt1wW1iZbu66Hu Q==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643698800"; d="scan'208";a="170060936"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Apr 2022 00:32:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Apr 2022 00:32:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 19 Apr 2022 00:32:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVy4o4vJnH927bew1NDWi1GBGIiaM0AcDh1/wRScpw/Dnuqzx9YzAfraKRkFlgSFK+P1NLZuxjXCkBDdFDAXb7TjKkD3jDfymRWoC/f+NavfIA4OHBYofNgenBEnp67/Qdz6cSD1Gt/KP+mjPtuz19mEvOHoJ1uGuf4J5wQwPE5k6S8yMYchnZEscNdAYEPD5WlZf4sw8Aiz+IEoPMkGzUHdjbML1Q/Dkgsgo0ix2IFuC9h09tQgSGtlBbeu+DR1hgefA2qpecJGhtJCykpzq0yznzl91sO6HbmFIKDDx+3A3WwYEDyGabw/Y1j0wWdAc8fhQ/m7Qd9MoIfvhNZEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgNHd1vB1qYWGrFDfjFiu/2jhKFpN8qLR0vXzqGGfcQ=;
 b=LkPzyG3LQqjXZy/LO4BVqJC15ylSvLgABkTF9UFBPUN0rET650Cb6iMt8Do+EU97i1aZmP4v3Hp2X/z5FCC6ovZsEhacXR7YJlm5+bhFwy9iBsKvm5W63/4xP8+NZqqoxCmqMn6Rb8OSzfFS5yG8pQtK8J/uz6eJ+0LoZGOUHnX7xveZxkfDhDffq9jZi2Uxe66+W5U/73uvoOISV8SGFK1FEnV/+dmNjn9es3myCr2rRGSNW9kszqyXdag7Ew9PLp380qCF7N+8WuHkS19iYYcahRgq/02PwIZ//yB3FanAoJhy5E+noX2ne6x/c5+KhK4/+TM9nnl+75ADJ53cWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgNHd1vB1qYWGrFDfjFiu/2jhKFpN8qLR0vXzqGGfcQ=;
 b=dBubCahwX50nzg0EQg35LE3N69v75tSYP112cMmAzrCdtHp4lkdncLkEbqdEeM96I9R3DB3Az91eWOxL811DwYPaRIX4b6Kv6UqMlofxY5cOJ/gsEFImB83sg69T/OacNFh6P5RJzQleO3d11ld5NS592cLA5Vw3TmDxUQcfu/E=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3358.namprd11.prod.outlook.com (2603:10b6:805:c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Tue, 19 Apr
 2022 07:32:37 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 07:32:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <quic_c_sbhanu@quicinc.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <quic_asutoshd@quicinc.com>,
 <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
 <quic_sartgarg@quicinc.com>, <quic_nitirawa@quicinc.com>,
 <quic_sayalil@quicinc.com>
Subject: Re: [PATCH V8] mtd: spi-nor: winbond: add support for W25Q512NW-IM
Thread-Topic: [PATCH V8] mtd: spi-nor: winbond: add support for W25Q512NW-IM
Thread-Index: AQHYU7+k1+QxrxVooEeFpVQoWpy1mA==
Date: Tue, 19 Apr 2022 07:32:36 +0000
Message-ID: <4324bf7f-e397-7510-96a2-5a309e30d76c@microchip.com>
References: <1648191975-1366-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <20220419042742.qqfj6wurpxxqhr6l@ti.com>
In-Reply-To: <20220419042742.qqfj6wurpxxqhr6l@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03d876a3-dfd7-45b3-fe6d-08da21d6c6e3
x-ms-traffictypediagnostic: SN6PR11MB3358:EE_
x-microsoft-antispam-prvs: <SN6PR11MB33584E0E0EB31873D98E6C40F0F29@SN6PR11MB3358.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PKBrH5KtDCiR8N56q24/RJKN56OcZ2kIg1C6L38sjwIr2ADQomr+5FuGQHA9vIZtaiokRysKbmQ1aJvdpijA/2/GRO+dojE00L8bqR7jd9aUc+VMv0kcbz5ZQHc2rod0wpSO86dER7NfDQ5GDqVnKnMtHgHL9muazv4nah1/xWNMnBjOvuMcy9MLIX+bM6kbO1ZGn51bA0+G94uXPqdROYOSzL1L0EO8C69/jbYJpaKj0+R9EpJKHUw5A84EKIof2aRM4PjR7lAFr/msOfphSto1guY3ZGU+RFb4K/BfEfrCZCB65nz/7SqwrvM8DS6jBq9f2aFVN7ds48FdRNq7SKY7RAyjGa7IenWl77LMx7fMNp7AK6XaFx5IwlLLyJMGzEzGNtjyAY/u9LAmhZRyf4/tVYM72QKQcJLK42OFB2qajmVyBPyEJ353BFvtnIRXzrqSbvE/2HRXjp1BfWq4MCTn3xvMqMndq/ViSoP8QFvNMpQnUf4UVGJ26HcI7LaRRr3l7HgbofQKvv8BYUOegNOqSkhF8OjOfspK4SYadmOZpsddxV/AY+vOuiUfC6ftq2Z4H+46nw7h5SU+DXjTdjLn9dx5aS3YvRrkzIBGuD0OkIuiCnfqy9bLv4iDhWA0u5sBF2rt+m4M+P7b/FV9iAGZ/NvjJotLIxBLu8wyMkPmiDl+4aOxPyAyEcUMhFsNMMg7h+XJCcu9eN2f+m4ESrRXuMxk78Anh/YCOa6LzfUN18IcFLvYGEhVY5bV9xAQLiNB/rKW05WVPn9Qj0Sqhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66446008)(8936002)(66946007)(66556008)(66476007)(64756008)(86362001)(31696002)(4326008)(186003)(54906003)(26005)(110136005)(7416002)(122000001)(38100700002)(83380400001)(6512007)(6506007)(8676002)(2906002)(38070700005)(2616005)(5660300002)(91956017)(76116006)(53546011)(316002)(71200400001)(508600001)(6486002)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wi9VZFE1L3RwSy9lSHhxMitiN2MrL0N1N2RZTC8ycVltYzh2QjlrVEgyTHJk?=
 =?utf-8?B?TkRuUjZ3alM1eGpjbnV1eEY5UVA3dEJpeXpKYUtQdUxnL0NCQThMSkNoQWNi?=
 =?utf-8?B?TWxkT1ZmWUlleTFXTmtocEtnTGlZQzZGZWJsd1VVNmd4aTgybTh2NUFTQU9y?=
 =?utf-8?B?ZGx5eGhaK3ltSE5HQVZ2QzBpS3ovZDhiNEwyK1Z6YS9GTW1lSnNFOEc3S0tR?=
 =?utf-8?B?bk9qU0pqc2hoWkxoT29URUZ3cytVTGhEOUhLdHc5SU5mb0swYThzekZBdEx1?=
 =?utf-8?B?V29nNDk4SDJON1RGempaMFhsQXQvNHdrS284eWUySG5LV1ZSRUdTemR3a2s2?=
 =?utf-8?B?bDUxV2FMenZVVlJiVCtvUzFWMlZVQW53d0pVYnBOaU9YNDluRkpoKzJzc0dQ?=
 =?utf-8?B?Tm54aHFEcGJGSy9QT0dKdStNaGhyWjYvTTZtNWtGRUliWk5lNXpKNDgzUUtr?=
 =?utf-8?B?emJFbmZnVjEzOUxiNVh0Z2tKNzhtVlNGQTRkSzB5b0dXalo4R3dkd2xQRTMr?=
 =?utf-8?B?Q0drNTFiZjA1UVZUbzhhRzNmSndFSHFoTmRkaEd3UzlYSURXNWlDK1VTeDd5?=
 =?utf-8?B?VDh0SkVkRlVqakVCQTBZUXN4VHlzMk9MYTVML1RHSFZma3VWcVMwYlVmcWY2?=
 =?utf-8?B?dUZNdzBEQklxa3dza0Q3NGN3bWpWVDlYTlh0akR2dUE2dkQ0OHlnL0tZaGpp?=
 =?utf-8?B?NTgwWUkvbjE1QW5xT2lzZ09DZmpuSkE1L2F3REFMNEtUVEw1eE0zWjNyMHBr?=
 =?utf-8?B?T0FNbVUyRWl5MkN0cW9EeUU2Z0ZrdmdUeW1McFlwblA1aHZJNDMzN01KUTdi?=
 =?utf-8?B?eE1jOUdieGI4ZGd4cEFSN0Y1V1Mrb1FGbndsSDArYjdLWVp3ejJlSHlKU1BP?=
 =?utf-8?B?QTRBTnpkUGlDV3g2UlBSSThBNUFLaWZoZXdqU2h4N0tXSlI3SU9lVjFnbkFk?=
 =?utf-8?B?Ky9ycnFNNCt3eEsvcGVpQlliendkcDBKWEVZN0FhL24zdm9kOW4wNGRQdnRV?=
 =?utf-8?B?eUtLSlNrZEI2VWhpWFY4WVdBSU11eGdySm9TMTlVTitmcUFES2R2WVJDTG80?=
 =?utf-8?B?ZktmdzRzNm13YWRVSkh3emhkWUtyb0h3dzN3THF5WkpObGNKMWdhWmFQSklE?=
 =?utf-8?B?Q3JVR2JHR05WdHAvZHhOU1JrNUgzVWNoRjdXdzVPdTRsZW5YN1hDUmVSMHh5?=
 =?utf-8?B?MGUzd2NKMzVFRHFXUTUxVUNqUEJ4MjdiWWZ6RWZVZFM5TCthcEYvZjZ4d2pn?=
 =?utf-8?B?Q0owRGZaUUlHRDdMVGlEVllCOE5NUDV1cWFoS29USjc4bDl4UEErRHd4OEhp?=
 =?utf-8?B?UzJCTUNFRFdqeGVaK1JvOGN2dzhIejFtaVFRTFFuTnBSeVZCVTRRNWJWNWxI?=
 =?utf-8?B?bGtWa2l5V0g1UmE2bDk3eHN5Z095MGxKTTFlL3N6WElCbW1WelVlK0p3VG0x?=
 =?utf-8?B?RmZ5eEZvWnU0MkQwVUEzc01rS2ZSTEg3eUkyVFh0bnpOQWdiNExvVHc0NE53?=
 =?utf-8?B?QURBZVJaM3U1UHEwMjV4ekRyU1A3WEpTNnBHcnF2R25tLzdISENDYnR6T0NP?=
 =?utf-8?B?Y3MzMUlmMDgrYnlyaGJZS0VGTkpBdGlQbno3cjB0VnhEM0FXS3hBT21TbTFX?=
 =?utf-8?B?NGIxc1djbVVmMmdVeGtaMkZEWVNZTFdJY1g2T0RZVXlEaUpwejdDVk5uUXc0?=
 =?utf-8?B?VElxUThXN25uZDUyYU84N0wzV1hCTXY2eFN1ODUxOXByd0hzdVB5Y0pvVjhi?=
 =?utf-8?B?M3p1cGZNVnM4dG5RK2lndkpPMFlYdWlKdWJKT255eUsvbEhUc0NWTTR4RXNE?=
 =?utf-8?B?K3QwbnBPU0RJd3MveEdsZUROTFdvQzZ3a3hIQXl0NUt1Y055eCtFUCs3aThC?=
 =?utf-8?B?L21KbXkxTEFHbUVWdnVjcUJwU3BDYnhCQU5SL1d0ckZpUWY2dnVuWkljWDRS?=
 =?utf-8?B?NkxwellEWUJKWUlpdnN0QUV0ZDFlVlVvREQ5WE5UODk0dkI4QXdNbk9XbTlF?=
 =?utf-8?B?QzFGRFQ1QmFRWU9xVUtxblJaeUszcUFpVFZ0ODNGdW14MFUzY0haR28xQUJX?=
 =?utf-8?B?LzlrdHNBNWZWdTk4aU1HRDEwcFVDcjB5WTBzclJOVnJvcXJhRmNTY2lwSlB6?=
 =?utf-8?B?dU9MWURGSmExanZmelR3djd0bCtoU1djV3g2SXIxcWdIZnF2bEMvcmFNck5i?=
 =?utf-8?B?UWswTUtndjROYTRxdDJjODdFaTNyZThnR29SWDlua1ZmS3VRRHJsWTNLbVdr?=
 =?utf-8?B?OHovUnhTcURPbnI3KzYzK2pha1BkZnV0NmJWbjhTVmZhSW1OMHNYWVlwWVNO?=
 =?utf-8?B?L3dOcVNpYzVBbnhCMHR1ZGoyUXBLWXdyNzN6U1hRblk3UFRrN3NHN1h5Sm52?=
 =?utf-8?Q?7i9iAFvttMvu/0MA=3D?=
Content-ID: <EE10777BC027384D8B1CDD2044B55DB7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d876a3-dfd7-45b3-fe6d-08da21d6c6e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 07:32:36.9425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ROKKzlJ6BzxSnyxZg8gZDA+o//OL/yTQVHeOjCU/iVc44Y6sGjnKXiKxKUiOTQ5MUjiZhS8YZ52jeBIadEvKVTgAwKtxHmyz5aFm7IS5n78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3358
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_003249_246272_8C327774 
X-CRM114-Status: GOOD (  16.96  )
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

On 4/19/22 07:27, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 25/03/22 12:36PM, Shaik Sajida Bhanu wrote:
>> Add support for winbond W25Q512NW-IM chip.
>>
>> Below are the tests done:
>>
>> 1. Verified flashing binary image on spi card using flashrom tool.
>> 2. Verified OTP support, below are the test results:
>>
>>  localhost / # cat
>>  /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
>>  spi16.0/spi-nor/jedec_id
>>  ef8020
>>
>>  localhost / # cat
>>  /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
>>  spi16.0/spi-nor/manufacturer
>>  winbond
>>
>>  localhost / # cat
>>  /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi16/
>>  spi16.0/spi-nor/partname
>>  w25q512nwm
>>
>>  localhost / # hexdump
>>  /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/sp
>>  i16/spi16.0/spi-nor/sfdp
>>  0000000 4653 5044 0106 ff01 0600 1001 0080 ff00
>>  0000010 0084 0201 00d0 ff00 ffff ffff ffff ffff
>>  0000020 6800 6c65 6f6c 7720 726f 646c ffff ffff
>>  0000030 ffff ffff ffff ffff ffff ffff ffff ffff
>>  *
>>  0000080 20e5 fffb ffff 1fff eb44 6b08 3b08 bb42
>>  0000090 fffe ffff ffff 0000 ffff eb40 200c 520f
>>  00000a0 d810 0000 0233 00a6 e781 d914 63e9 3376
>>  00000b0 757a 757a bdf7 5cd5 f719 ff5d 70e9 a5f9
>>  00000c0 ffff ffff ffff ffff ffff ffff ffff ffff
>>  00000d0 0aff fff0 ff21 ffdc
>>  00000d8
>>
>>  localhost / # md5sum
>>  /sys/bus/platform/devices/soc\@0/88dc000.spi/spi_master/spi
>>  16/spi16.0/spi-nor/sfdp
>>  106d89d6c049110bc94c01517cb4ce24
>>  /sys/bus/platform/devices/soc@0/88dc000.spi/
>>  spi_master/spi16/spi16.0/spi-nor/sfdp
>>
>> 3. Tested flash lock, below are the test results (looks like the lock is
>>  not working as expected, so when we do lock the whole card and tried to
>>  write, write was successful without any errors.)
> 
> What should we do with this then? Drop the locking support? Or is there
> something wrong/missing in SPI NOR core that needs to be fixed first so
> locking for this flash works?
> 

If the locking isn't working for this flash, please drop the locking flags
until you identify the problem and fix it.

>>
>>  localhost ~ # flash_lock -i /dev/mtd0
>>  Device: /dev/mtd0
>>  Start: 0
>>  Len: 0x4000000
>>  Lock status: locked
>>  Return code: 1
>>  localhost ~ # mtd_debug erase /dev/mtd0 0x400000 4096
>>  Erased 4096 bytes from address 0x00400000 in flash
>>  localhost ~ # mtd_debug read /dev/mtd0 0x400000 4096
>>  temp
>>  Copied 4096 bytes from address 0x00400000 in flash
>>  to temp
>>  localhost ~ # mtd_debug write /dev/mtd0 0x400000
>>  4096 temp
>>  Copied 4096 bytes from temp to address 0x00400000
>>  in flash
>>  localhost ~ # flash_lock -u /dev/mtd0
>>  localhost ~ # flash_lock -i /dev/mtd0
>>  Device: /dev/mtd0
>>  Start: 0
>>  Len: 0x4000000
>>  Lock status: unlocked
>>  Return code: 0
>>  localhost ~ # mtd_debug erase /dev/mtd0 0x400000 4096
>>  Erased 4096 bytes from address 0x00400000 in flash
>>  localhost ~ # mtd_debug read /dev/mtd0 0x400000
>>  4096 tempCopied 4096 bytes from address 0x00400000 in
>>  flash to temp
>>  localhost ~ # mtd_debug write /dev/mtd0 0x400000 4096 temp
>>  Copied 4096 bytes from temp to address 0x00400000 in flash
>>  localhost ~ #
>>
>> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>> Reviewed-by: Michael Walle <michael@walle.cc>
> [...]
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
