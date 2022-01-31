Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34620C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 07:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFjtSnpFdJX+s3A4VG3t8AzTxnJYGHa6ywPM37LwXVQ=; b=KKYu5TTGZWIyI7
	M7jyVgIPP9nNW1KUsXxXp2WMvQE8IV+uTfzsRIAsqDVtPFjTY0NIW/xxFKCkw7QlvUaj7Zxak5ofd
	zdVFCHO9Q3h8wNwxWw+MUD7zZkQ7eVjlhBLyuTE6piY9Rpj3faj39J6JkYONlwthAduFwlvhd9jZN
	ClrNu6L78f1Lv+RglHO2SLvxNFxXn5qo1uW1yzjugTDXfSWU1hrfd8ssOT1xGuMOahfY4XUrCs/Ul
	w6dntO6v7dQD5CqT2qwwA/KFGU2/Z2Kkfsn2PrEHSa/JHEVJQ0v61zPX5vCVN3nFAARpvLIksT+vF
	RZAEdTs8N3/Swj2fqlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nERSK-008K5o-Sg; Mon, 31 Jan 2022 07:50:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nERSG-008K47-U4
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 07:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643615428; x=1675151428;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XUUk5Wh6mQt9X5lnSwReBgt6aEaVeFXePYOAMzWeysI=;
 b=nH4xE3x22jpp2CtF29ChVdKLqbHpKR1O6Tqa82u/4QNuoH6D5NxBSWSi
 4qPmEhMJ77wlWWUdHXql/X5i/DLSHO81t25WmO1BCN3Omn9Vk4TuawfYU
 fNtdKpsAqCRbcRRicbat5vubZbw4HPiDG30HDwUQqF9RgeoY+QIEVGCX5
 zlWbGCNA55R9QWmyN357aYxpv7x6WOpg0zNrVdod1O/TKwLlUAh7m7JAV
 NFYUfXJ2NwYwoT6+l4PDIJF5pB+/OXV1/xypRpBT5A0BqTiHc7bHmfaj8
 RYUZGhtxXZNHN1P0z4YR7TF4gRuG5IDHQbTM+SYjMQ8lthPOMc+j3lq26 w==;
IronPort-SDR: KNOqA7X/ZO4z7V1Vy4PQAKOMPFsmzSyHQrV1c2zS/Mis5YD4hzc27JLUO+3nXJ910ssrZtWObt
 PcYKO7XXK24+Fkxo865b4/orD+ToaUcx0HlgZNIpfNQf+QnGoKP4Q0YNm0oaCpr2Q/o2g7SvA7
 uIj/9kT82Ig8+lmYT2D4srzOODCgyRsEEHOD+J7SYmRdB0pkdTryjCk/TvBavhQOYuPiT3Pngr
 /Ll7JPYP5As05OZXLMAD7lUviY7v5oEO+OLTkYlTaH968aLBQ7deHGzOcA/FhpSa/w+1i/cqTP
 PPTDLYkmjdVI1XIiWdN/ZD16
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="84163786"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jan 2022 00:50:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 00:50:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 31 Jan 2022 00:50:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOWLHtuHSyHtrD/ZN2HQZjQF0vRr8fbjx/6D1E3lbCQxturQK/ICYpzOpc/T6nL4dy9R6DDzLf7t3MgoHbblt5TtixeAEdv0Ice4ArYh7aL2mHj6IIWns0yLjpvWUU/SPj0X9FQ9EBu8TbxiIdsng/Ab/VyCX2JHfphcxPjSvogKHGdTOWK7gM4RYpytU3b6mKI7beoI9BjhcsIUEI6icC8S4z4DxGvtDmj3ZnbDHwiKV0MocIV59WdXAW+WVxe3SJQEmbT6L6IAslf4fcHvi5M5URHQpaQlEm8U7/nKKMJ45CVDwc2mWUnT+uaKekEUW0tkzjC9e5KArcS4fJcAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUUk5Wh6mQt9X5lnSwReBgt6aEaVeFXePYOAMzWeysI=;
 b=Ayh4batNKuh6ya2RlWa67B93MeBHfOXNE5hAV71DaEawoyXl8EE67+DGV8b6Uu6rllgysVT38I5tFCzTrwt1b1l5+by1NBiw10ZQHjd8iSng1O8HzjRj5dE7znKVnlgxZ6GITkUFu2YJ0AGS8Kqj1lKMfO6V+Ks4No3GuG89DXS8aOis3OzMWhTV04BrlEgk3eR7PiN+wvCS9fSgNZ3wxgRhd7jWluLy60hwFhiU6wbx2NN0eF92w07pyMgK6Sm1sQ9vpLfutp/6AHW61NCg/KlHTI3sueXmsOJD4AbiLFGCiD1/cdk7n7m8G8E9wvltXmicjMLhooOIzbnHEGnIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUUk5Wh6mQt9X5lnSwReBgt6aEaVeFXePYOAMzWeysI=;
 b=IyZjhodLQzfXd2vhU6Z/tZsO6Saorkd1wLxhyz8wizVOEPcYVBBpiG8NlR477wqPgvICxVRoeBVzvW39SdDuyMjbbQXqU+iiIZBBH9sLuqFXASDmejvgAy/1HMQIaaKe6mSmJBpijY/mRoXPkKZePBXKv5CC4Jo5tfrgB/OYE1M=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Mon, 31 Jan
 2022 07:50:25 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94%2]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 07:50:24 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v7 1/3] mtd: spi-nor: spansion: Add support for Read/Write
 Any Register
Thread-Topic: [PATCH v7 1/3] mtd: spi-nor: spansion: Add support for
 Read/Write Any Register
Thread-Index: AQHYFCuR+A5oVBDUhUqz+UBnUsWCgA==
Date: Mon, 31 Jan 2022 07:50:24 +0000
Message-ID: <57909d3f-64fd-a9f3-ef13-55a5e571d853@microchip.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <07db2e3c5647d409941261d6fbeed81215dca16f.1626677855.git.Takahiro.Kuwano@infineon.com>
 <4800bc7e-6558-8707-7390-2b21618215c6@microchip.com>
 <20220128162056.vwxhlz5psdxzz3tf@ti.com>
In-Reply-To: <20220128162056.vwxhlz5psdxzz3tf@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a02876f-ec72-4d30-443d-08d9e48e5737
x-ms-traffictypediagnostic: MW5PR11MB5857:EE_
x-microsoft-antispam-prvs: <MW5PR11MB58574C7293C748D1D3415829F0259@MW5PR11MB5857.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7E9U1Kn4Ikq9/xPrkG/MXc7pzkt/fM2rVcr5s3LTtfg819ilN06EKt/HBiNGLkzuA19+Ujt+/E/0XBsjBzeeQTx92dIuvVeU6Wq9PaB9aNuV0Kwo9AGryQLvCki+fKhB1FsBFotm0HtDADdNGWl8GQtjlLlH/vrhZSbtweZkqj2P8A5Zf5gjvKiQFlsC/Tn1TcPNyLyTIqfVZShlWenPBxJ5aXk10VT5TCKXlUL2KPYZUFL4S+gc1fS+hrOym47YPy0ONmKBEnBkBxOH75o640Gpi4eBuT2+yBxewuAf2POi0axP0p64ZQT5VTHsng601PJLgSIUr3qe6UzhHLYjMPKf4UsKSFe6jQtKt6LGR7sM/0FSbRkI+OvHowz3i9hg0MEE6MlSp98AZ/A4i3lw5hTBldZLpVYt/ulX9nL37OC4cZIY/qmEr5FSN2ZazxaXhNUsbMvM8or6I3hII5jabs8BAGWeVRrvMkHpKBeFoXW0QEcuUa2DA3NxFMGt7x5oLJ6wIOSMr7xYgthEkTvJVnn9iCyWV2rlBjM7ty1S8YupnrVnx5/8tWGMDRdOX7KV/mIj+pc6yNK8Qo/fug+J+EdqScN1hQxcJBQgDcqrNdqba9SMhGmtAtSgNeoEldGazoX6MavGuqceWy27wldPTPyJyi48W+kNYoHav0YpWdw2G0yNc2xFRB3wSMqFBArfg7T+1mslu6VMBppmFvE+a2X5cYJyjbwpjzPWN7hEbHgsAsBLwUA6bPOg0//0SPJXAvBiLf+kGJNLZ8cplfmRhVrkZK453mDDEyWkVVpvOEz9EMshQA6qX8PdgtcHT6iQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(8676002)(76116006)(4326008)(66556008)(66476007)(64756008)(66446008)(8936002)(2906002)(36756003)(53546011)(71200400001)(6512007)(91956017)(38070700005)(2616005)(31696002)(54906003)(26005)(6486002)(508600001)(186003)(6916009)(6506007)(86362001)(316002)(31686004)(38100700002)(122000001)(5660300002)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXlxbE1kYUM4dml1Mnh5YWZ4cDFYNVMxekpXTDNWWVRqSWdwMFN3OHFsSW1J?=
 =?utf-8?B?aXVEaGhUenRDT2Y4Q241Zy92RVgvWjQyVHFmQ1dGSUtkTWtmWjVBWFQ3M2Vz?=
 =?utf-8?B?SlNSQnZBZG94N2JLZnZhejhwdUtuaTM0VWlhYVpNczlDQ2RGaDY3dFdtbi9H?=
 =?utf-8?B?N0kvdW81UjJic3Bla1hxN2RYVWIyc2luVjJrdzJkV2lVL3FCQ2JGK0FvTUVk?=
 =?utf-8?B?NmVoZzNQWnIvVFRuMEhHWllEazFrYTQvWmYyQk9PZUpVWXFJK0E4QUNxVGND?=
 =?utf-8?B?UGZFNmkwcTEyaTMyMzZ6Z0kxN2VvbGtzWEdvTUM3U0x2alR2N2dTM0srNjg0?=
 =?utf-8?B?bkJjNmc3TmhTanYya0cxYUhYUDhmUUdLU1NLaGFhZHQySjR1S0FzTVIvQjV3?=
 =?utf-8?B?S2ZKVWdSZi9CSjdUdzg1YjlmTHpweU1VcnVVSGthemwwR1o1c3RXTThacVRq?=
 =?utf-8?B?WnVDMDBEalhZMGtpMVRIVWI0UVM0ZkJhMld1R0F0cmFrN29uN2JCMFBLaGJW?=
 =?utf-8?B?RXZ5L3BDREJZM0xpekJ4ZUhSamJjUmMrNXJzdFNXQXJBdFNCUmE4S3VwSUll?=
 =?utf-8?B?bmNEV1V0d1huL2xMdHJaQ0hOWU1RTWV2MDZDMndGeVlRNTdJeHdxeFhXUWJx?=
 =?utf-8?B?WnpFVzYzQk5Qb1BtSVBsRUxnMUxLTm9kVjQvNUdQZkpXYm1qQW9GZzJqTkVK?=
 =?utf-8?B?MjFIOEM1RHVGd21tTEViNnVPb0Vqa0lOU2tEVVdTTFJQM1RYVWlRdXk0dFl1?=
 =?utf-8?B?TDFNVWRyVXRuTmlQc0JFRkVoRFVKRGp2NUNkWUdIRzV2N3dYSHR2TVFPMXRY?=
 =?utf-8?B?TTcrQkYxdDhqQXhwK2tsYTg3L0lsTVRvWk9SMUFoOERuUUNEQ3lGU1BDZXVG?=
 =?utf-8?B?cUpNanBWUjFuZTVPT0l1NC9rY084dVAxdU14UzFSejdtQXVPWUxrS2lTakJR?=
 =?utf-8?B?cHZpYjM4MlkyZkhkMllQWmhYZ1JQa3diNkpSMmRIcjRGUUNzYzlQV2kvZ0VY?=
 =?utf-8?B?WnA2RzcvSXR3c3NYbXpJRkVZRWxadTlRNlF6QWFvSXVLdXp2MXVoNEV3RXNh?=
 =?utf-8?B?N1FvTFJBU21yaW16SEhSdmZPbXFCVXR5SGJrMHgxelZxTTgzMFM5SjFTdFZG?=
 =?utf-8?B?ZlBBQmdvRkxpTlN1eEcyUXBCTTJxSm1WbUVzN3Q0WEh0dW4ycjVraURobUR5?=
 =?utf-8?B?MGpvdjdhMDlQaUxTUVBEUGgrdVVHN2hHbG1GbDB1UVZLeXVWaWdUeUNUUDJO?=
 =?utf-8?B?M0lCRm5QQzlCS2EzeVJPbC83MVZuZjhDdmJDMHhpQ05uVjVTRVV6K3kxS2NX?=
 =?utf-8?B?QnlEZ3dKc2pOV0swS2tmLzB3WkVEbXJvNFJKY09BL3p5Z3YvaW1pVVlJblVX?=
 =?utf-8?B?Z2YrVmp2ZjRLaXFFS2JjcFNab2J2U0ZPSGtMMGJXdTY1ejAwWHhJZHRiTWlH?=
 =?utf-8?B?SWtCTzI4MCs1SFlNM2pjNVpVTGUxWkNpT0t6Q25raHExVzFERmh1ZEJ1TGxh?=
 =?utf-8?B?Z2E3b0poakRuRG5VS3VOZjY1QVdSenliK25rbFBJK3BQQVZhNW0zRjFIUVJL?=
 =?utf-8?B?OXovUHRRWHgrelU1aTZQMFJudFM3U1VmN1JJM01sbjU3VmZteU82MzJXcWJG?=
 =?utf-8?B?Rzd5NFpSTHdpZHFpM0ludTJpc1c0SWJ4QkI3MnRKdVo1cXZGRGFvSXdsREZJ?=
 =?utf-8?B?SHZnV0NPTGpSaUlZdEx4M0poYzF0MFBoL3FoWHNNNVl4U1d3TnZXa20yU0Ey?=
 =?utf-8?B?TFBYYmFZWmZ4dGUyNU00WTd0NkZIa0wrRDFMZWFMalgrU0Rxby9abGdydE9B?=
 =?utf-8?B?Zm9BdHVuY1hTOXZxYUVqUno5TWRhTHN5QXBXOUV3QTJ6bldoUFMwZEMxK1E5?=
 =?utf-8?B?NS8yQWJQVkdNTXFWRSsvK1JRRTVYb0w5U2RZejZ3TFBXL2dHSWlibmRrY2x1?=
 =?utf-8?B?MHl3d3RuMVJXWDRYYkJMaHJBU2ltZzFPd2N1eGx1SjlqMER4cjdmMXRjUnJM?=
 =?utf-8?B?MlhNNkRBeWlhZ096dHU0a0tPN1A2a3NHQkt1b29SeU90aDlRMmFCTUNUZitE?=
 =?utf-8?B?bFloQWJBdzVkUjFUTlhZTHFadm84amlUaXN2emJEU0k4QW1BQTk1K0doaHVl?=
 =?utf-8?B?UzRhelh0OWNTYTBPY3VVdC9WU3hrWlluTFYrUGN5SU1yZnU3bG0rME5vN3hR?=
 =?utf-8?B?S2NQYnlyVm5UelVMNy9QcVlWbFMyUVgxbTNIRTdmYmdnWWVIck5aV25ZMTB0?=
 =?utf-8?B?MXNXZXNjVGx6MHdUNHc0UmxDL2VRPT0=?=
Content-ID: <21EC2D30ADC32D41BD3A3F2DB1732CE1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a02876f-ec72-4d30-443d-08d9e48e5737
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 07:50:24.8270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqO++2wsBKCDbAQe9XKMER7dpR0qjO90dcdvGqhcdpiT6IWmLdoMr9VMnJ4SPm9uKnvOe1UV8tg1o1N5uvTv2MTkbGofriGmz+tnFaeksBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_235029_139637_D0DF57EB 
X-CRM114-Status: GOOD (  15.63  )
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

On 1/28/22 18:20, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 28/01/22 09:43AM, Tudor.Ambarus@microchip.com wrote:
>> On 7/19/21 11:03, tkuw584924@gmail.com wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>
>>> Some of Spansion/Cypress chips support Read/Write Any Register commands.
>>> These commands are mainly used to write volatile registers.
>>>
>>> The Read Any Register instruction (65h) is followed by register address
>>> and dummy cycles, then the selected register byte is returned.
>>>
>>> The Write Any Register instruction (71h) is followed by register address
>>> and register byte to write.
>>>
>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>> ---
>>> Changes in v7:
>>>   - No change
>>>
>>> Changes in v6:
>>>   - Add helper functions for controller_ops
>>>   - Add 'reg_addr_width' parameter to spansion_read/write_any_reg()
>>>   - Remove spi_nor_write_enable() from spansion_write_any_reg() and modified
>>>     function header comment
>>>
>>> Changes in v5:
>>>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
>>>
>>> Changes in v4:
>>>   - Fix dummy cycle calculation in spansion_read_any_reg()
>>>   - Modify comment for spansion_write_any_reg()
>>>
>>> Changes in v3:
>>>   - Cleanup implementation
>>>
>>>  drivers/mtd/spi-nor/spansion.c | 142 +++++++++++++++++++++++++++++++++
>>>  1 file changed, 142 insertions(+)
>>>
>>> +/**
>>> + * spansion_read_any_reg() - Read Any Register.
>>> + * @nor:               pointer to a 'struct spi_nor'
>>> + * @reg_addr:          register address
>>> + * @reg_addr_width:    number of address bytes
>>> + * @reg_dummy:         number of dummy cycles for register read
>>> + * @reg_val:           pointer to a buffer where the register value is copied
>>> + *
>>> + * Return: 0 on success, -errno otherwise.
>>> + */
>>> +static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
>>> +                                u8 reg_addr_width, u8 reg_dummy, u8 *reg_val)
>>
>> how about making this a generic core method? I'm sure there are other SPI NOR
>> vendors that use registers indexed by address. How about introducing:
>>
>> struct spi_nor_reg {
>>       u32 addr;
>>       u8 addr_width;
>>       u8 dummy;
>>       u8 opcode;
>>       u8 val;
>> };
>>
>> and passing a pointer to this struct as argument.
> 
> Wouldn't it be simpler if they fill it in a struct spi_mem_op, and then
> just pass that in as a "template"?
> 
sure, sounds fine. I would like a generic method with less function parameters,
if possible. Let's see what Takahiro will propose.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
