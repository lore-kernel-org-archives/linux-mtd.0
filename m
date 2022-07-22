Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4E7C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 04:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qEZpbm64F5kop5aapzWpPpcVj81prs1MTK1vvnG30bQ=; b=RgnU4k9gKUckJk
	Xi5Tg0cx2uoXhDUSYhOm3ZLuxsuR6IuuGLaqqUGVa047Tn76oGXISxHxoLeKpIylm6AKYTeuJcFER
	4WvXedBizuYiz6V0nxoarHwI5ahL5rzdhBzFetdxVdkOzjVW0o/m+9DE22FY7wQpVUHgM5SRGN7tV
	C3fBLJxvx6yNa4mQomo4DAQO5WFYWEX/8hZkx2S58rEtDFY8FojJIG1ocZF1GZPky/zhSyDvVJQEZ
	RTOqT/AL4QiVv0W3UunyW0/6RmafxcorDlF1MJ70exLLixaIYAIoaImKedG2Pd+N3O4QdGXwTr4HT
	HnvlyD/ua7eZr+LsJjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEk9J-00HS3f-5Q; Fri, 22 Jul 2022 04:20:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEk9E-00HS2J-Id
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 04:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658463620; x=1689999620;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EjwKlhmW7m1NTpheMh4HnfzkpJNIEIR2sb7qSZI/Hdo=;
  b=UqGDCZA58936+SBP8+BZFRAXt2lnMQAVgFwKN8EYgwNkzqvaKIwjaKqy
   iS/YYs+7BsQH9tcLdU2ZITnK60SoO1eEMkdtbsaBRi2fhPiWhkfguP0Td
   hkErbFASHQUYbpTaRSd55URUHmxRl95gVlLx8J38YQnfynVe9Qn7HcGJj
   2lA7mKGTmjIZc6ebjEKTQr7/YwsWGXhwpiNrBcCorDX+gzU+29ih8EcJt
   xVsa82lw8hxWxEQt1ufkNxAUOekKs67ULwL2iY+kIx27rmhtKXCkemN8a
   8KsN/QreDkZknGOqtZN6YTR//hD81IVpzjI00QEE6XVSFdg0lpzsrKXlY
   w==;
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="173166517"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 21:20:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 21:20:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Jul 2022 21:20:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODq6fTh7gO7B4Ms2Z6duN0hpdb6RLPLzxIw3BuN/Qano3EgOVPkPdqH9CxdXOvc5D9i8ZWWrn5dmAU4unWxKB9RAbe4WqUlIgBLn5dNaopd73PSQ7YEJb9s9RFp3ywJdlxDkGmD7KA46taPqIaMmqy0rA4pTz6dhvnL+eXRUERabd96T/dKv61CBfmLnsgNrg27p0rooZH7tWU+xUhWZQdgbcJKGjPCpzda0wEQPr6QBBs746/sLobQ8zPaYxKyXHqqPZ0gCDovp7jnfHjg0KClxWqMPaTk/r7hC/Lj4UJ2TpwYKSFKyRVAYjQlLNqHzwrA8QpjxXrQpRRovOXXvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjwKlhmW7m1NTpheMh4HnfzkpJNIEIR2sb7qSZI/Hdo=;
 b=n0VPSCz8vDjEqWCLz0dEKDqHXW2kZdn3pi5Q0zARprR2J3BhZ0tNu6O0z/tn5UeF7lVBx0rRWTqKzY9PehhWvRvxolJOuuBbRmKMiZd3qov5Mo/lJMHjN0SkNZI/dBhKSaC2LF3YQcR8prL9hRW6SYOGk9ciV2NyQ1q15ip2cY9GsCPd1hm524o6vRV+XmDIooVORFqou9wqH9/N3evTC+0442keqbF/N7XGUWKiJJYjXJ0nTwAR69JBO21A3j9wudHFpRzIzVQU8jL16y9RLgBsyCeL+NqiB/DcbcntlEIZsvpKqnxQ/icvbpvg1Ah2YXYXAlr0rksxCNZatvvOHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjwKlhmW7m1NTpheMh4HnfzkpJNIEIR2sb7qSZI/Hdo=;
 b=K6cwRaCrCBNbenKSvtH+cArSWe7UuI6YJJ/ZmYS2zxUBciK1THHmBkPmesTjue0416ol79F6Psi7I7BJP4ixrMhBJ9/o/IjCMgPs3KQMOBwUfL6tjYZSp9IKekbWMWcOvubldwkWB18FAxOp6/b5L1l000B48QwlI87plYlY/d4=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 SA0PR11MB4573.namprd11.prod.outlook.com (2603:10b6:806:98::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.18; Fri, 22 Jul 2022 04:20:11 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Fri, 22 Jul 2022
 04:20:11 +0000
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
Date: Fri, 22 Jul 2022 04:20:11 +0000
Message-ID: <98fa98f2-055c-2338-6790-de99670e20ff@microchip.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
 <c42d5930-73cd-6dbe-f650-db72f35188a5@microchip.com>
 <a035a1a3-0d82-48ab-5d09-1d5164999890@gmail.com>
In-Reply-To: <a035a1a3-0d82-48ab-5d09-1d5164999890@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53551bc7-f5d3-4b80-1ae8-08da6b9977e4
x-ms-traffictypediagnostic: SA0PR11MB4573:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CPQOtHn4MCsDJhIOIQtU+HSqAexXEuUmFIfC8WxMMMga66wOfhUK48sOvr2HcQf85NiEGm6oNv2GSosTTKKBxBvW6uqFheXc/4NIZNrUfn1YeHiK9MMmuzGLTKoSNmATpSi5YWi3Lo+7AWlWIwpWDK3A1zmfScwNHHfbL8ry0pTVcKGGPRMALP5Dxj0q+medCLyb6RdasrjhwUGqSVKS9/SqSU+hUXbfIncLgusUcF51ywrihCIKSl8y70LBa0kFIIG0z9cRvMWOmba7ipyu74/l4ePn9TDR1bLr27Il2OxpT4LkUHWejqZHrUa0+J6DC9zniaqnAEkowN2zx83jfqF7wZTBHZt2Az90ZqtpW2bW26r/eRORCdZOx0nUGvx4Xt7ZzCCLamKZAHAXTvIaLAd+3jbo+oDe1HeXcMfERXbegcp74bOng/6lwoKE88lktgYfzNw+//ahq235o377a6hdJksqSIwGi4kMv6nXIsxXgedArrRFCeWuh34MVaBnFxjpNtcRghyInJoCwmVIcrt8imJGaXoAhYDGmdYuAM7QX7+wVpE2AigSbFNEuYNvvH4MYw34D/QHbkDOSSmedbmM60ydr+iaRUVNg9WIdXSaW1AoFHiIZv7hLqMhzO/ffprdTOtNMW5TnWPC7ld3g8dgED+CooAJuSGs2Edf06Dxc8bfB38LMN0irRX5EiFYDR2CKjdf+5SdBUYA6MYxZ2dZTbmzHtHiGGTZc115ahroZ3eBqDsjcuLEHYx8kmP8s6fdPauC3tyXclMk9J2ENzgrD8NVrt5DLVYr0rpxMr38N2ip9D6eoZPP9khu3jZqVcYs3vwgXBhcXxbtZGITOlUlW21JZar/jZg80XeW51qq0fIwJHedZ2Tsy2wni2FX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(366004)(346002)(136003)(376002)(6486002)(71200400001)(31696002)(38100700002)(122000001)(86362001)(38070700005)(36756003)(26005)(478600001)(6512007)(6506007)(41300700001)(53546011)(316002)(110136005)(31686004)(54906003)(2616005)(186003)(66946007)(76116006)(64756008)(8676002)(5660300002)(91956017)(66476007)(66556008)(4326008)(8936002)(66446008)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEw5QURUMW1oY21OWnl5eWI1azMxcVM1V2NPVk5EKzgyVHBsTnJ6YzZiUVZv?=
 =?utf-8?B?UU5iVURRQ3dpYW1oN0xtVHRIMVE5Vkw5bFZyamhDSTlHbkRUcGdCTWdsak1J?=
 =?utf-8?B?RnFVbzVIc29SNm5SR2o4T1U1T1RGa2U2SmpVKzI0ek4zYUJVR2FkaWl5TVNY?=
 =?utf-8?B?UmpYY3hCMG5Qb1ZQSjkrSE13WWR6dmRWSTdPeXI5ZVkxTkZLMGtoZjErbU9I?=
 =?utf-8?B?TWl1NkdlVzRwZFdwK01oV3llZUdZaHhWdjEyU3VqaGRqY0ZkbjF2bzhyVWxY?=
 =?utf-8?B?NnRLM1JTcExnUllRVGZlOEVvU3pxSjR6RzUrUHVJaTdQamZVMkZkbk5VL3RJ?=
 =?utf-8?B?RW5SdmdXTnJzWW1Sd1F3UnBoNGJPRXNIYTVOdENQUHdhUUZ2UHphbDQ2eDdC?=
 =?utf-8?B?SzJMSUNXdlljL0tVZFRCbnZKb3ZiU1RWWWFpeHUySC9GcjYyQ3U1QXp2aGpC?=
 =?utf-8?B?Yi80RWxVeEhHZW0rMHVwQ0hYWmk0U3RmMGVtbWxYcTl3UFpUeGxkeHNGL0E0?=
 =?utf-8?B?WkM4RXMvd2ZHSTZsdUlCaHBtdFJIdHgvNjZMSmFjZnJISmVySTVObTVlS2Fv?=
 =?utf-8?B?dFh3MFAzTWh0Ym9yUFQ5cjcxN2xCNmk1N1pKVUtIM2RMSitwVGt6Yy84THZS?=
 =?utf-8?B?cCtSdGlOWFZUTnRXb05vVWNqTFBzRWVCSXZsK1JJZ1J0R0g0QVdFTXYvZVgz?=
 =?utf-8?B?dndoNVpMWkQ2eFBVMGN3WVVnSytLWEhlZ25RdVFqV2V4eEpoR1ZCbURrWEwv?=
 =?utf-8?B?YTRNV1ZUT3FFOWxpN000WW1Pb3VUQWJqa3c5M1BEUmQxODBqSEE4aGxsMEMr?=
 =?utf-8?B?RERwU3I3aGViN3VVdVhybXIrMDA0dTFRMUtNeSs2QzViY3BETkdtQ3dHb2lV?=
 =?utf-8?B?eXJEZlFVdCtTT0tqQktXakZjLzIxeHp4QjN5QTFPMTJyQXZoNjlIZllmQVdZ?=
 =?utf-8?B?dUtPU0I5SlVLcysweWZ6ekdleHhabTYzRzNHZzhnMEFjeEx3YTA0OHpBMVNG?=
 =?utf-8?B?bDJOMVdvdjZLWmxzQnR5aVpDYnZsV01RZzlqdlp2dVRJZFV1TlRhRlpmVEVY?=
 =?utf-8?B?ejNsWUNOQ2dsdmZjVUlDaDF0blNXVWlXemJQUHpaVFJib0hJd1RXdWJKMVFa?=
 =?utf-8?B?MUl1STZXci96clF3WnNNVWFuTXRVdVk0ckNDWk8zVWZkd3VFM0tqQmtZN2ZU?=
 =?utf-8?B?WGlIcjBhcytqT2ZZeTNpbHZqS0JxTSsvNzZhdWg2VFk2Zmt6WnZMY3FkZGV5?=
 =?utf-8?B?TTFyZ0JpempYNk9uaUdkZW5CeXltUE1HRDZjZk5LVlkzanhUY2hIcGlPUm1l?=
 =?utf-8?B?V2VPQUY3M3Y4Rm43STVoVy8rQnBTNFcweDNJU2Q0M1QxZGFScy8zR25WODJM?=
 =?utf-8?B?UjlQUCt5eUFsRmtLYkxwV0JBaitEd3lSV1FiaXl0aXNzRFRyK1NYZ0F6NXRD?=
 =?utf-8?B?VHltTWxVNFJBb001cHRxN2V4OElLM0VGYlpPelU0NlZhWS9EVDVzMnIydWFi?=
 =?utf-8?B?N1VQazJWbEdKOFh3VmdxNExzZmtrUnc2cW1wTjB1SVZvMENLMXB4RW9BQ29l?=
 =?utf-8?B?czNCb05OYjVkMDk0QlJWY0dXVnV1dUkwanRpWllYZlE0THNQd2V1cGMyMGp0?=
 =?utf-8?B?Q1RDeWRVaytBUDVhcnErUkxvL3RkVjgreU5ET1dvTlhwUWxaQ3o4YzFKQzdk?=
 =?utf-8?B?TklHbmpGY25aVU9yZ1MzcGFHTytUb2tEb21LaUVYNm03cWxLMU9OLzh6OVRp?=
 =?utf-8?B?MW5VajFKR01EK1BSQ2hjdzc2b1l3N3lZV1lqMDFpRXl6ZzRMaGQxYjNTRUtB?=
 =?utf-8?B?VjJLOW9CRVRnY092eWl4ZVpaRjRERXdPemlGRURKREw3Vno4dHBjOTlMZUxO?=
 =?utf-8?B?RXI0M1NvM24renhqZ21KN3YvUkQ3bkR3TmxPZHh2MzlxOTRkUlpiaUE4YW9n?=
 =?utf-8?B?SS8vbUtLMGtrQVR2MURBaHZWS3pWcW5Ed3JOUGhFK0laNzBzK25ER2UyZGVn?=
 =?utf-8?B?NzAwbzluNjJtOElsaUtlZ2pXNEhBQm9BNnloM0VZQW85TW1GVWZrK2J1Y3VE?=
 =?utf-8?B?alFjTHovcWsyZWc0RjQ0Q2hOYkE4bUhyc293d0JVcy9OYmZPWkpmampTQzRu?=
 =?utf-8?B?NmVYdG5hbHZEMXZmdkNwQ1VKVm50d0hCMURWUlRHeEt2b3o2d0paWmgxVWgz?=
 =?utf-8?B?NEE9PQ==?=
Content-ID: <81336AAF4407B042B475B132AE1562FB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53551bc7-f5d3-4b80-1ae8-08da6b9977e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 04:20:11.1327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shPToEZRbLNdD6SGxH4ArMmDnnZg5kQsPEIqsFyISnDU1EP2xNIvLi+ecMLburGp+OYXfG3xhIRFsJSPrU5Fd1Rbft4lzPACRx9Jm+90tYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_212020_913881_F5D66EE0 
X-CRM114-Status: GOOD (  20.79  )
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

On 7/22/22 07:00, Takahiro Kuwano wrote:

Good morning, Takahiro!

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 7/22/2022 1:06 AM, Tudor.Ambarus@microchip.com wrote:
>> On 5/23/22 10:49, Michael Walle wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Am 2022-05-14 05:51, schrieb Takahiro Kuwano:
>>>> On 5/13/2022 6:40 PM, Michael Walle wrote:
>>>>> [btw the subject still has the old name of the addr_width]
>>>>>
>>>> Yes, it must be fixed in next rev.
>>>>
>>>>> Am 2022-05-13 03:26, schrieb Takahiro Kuwano:
>>>>>> On 5/13/2022 7:14 AM, Michael Walle wrote:
>>>>>>> Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
>>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>>
>>>>>>>> In 4BAIT parse, keep nor->params->addr_width because it may be used
>>>>>>>> as
>>>>>>>> current address mode in SMPT parse later on.
>>>>>>>
>>>>>>> Mh I'm not sure this is needed at all.
>>>>>>>
>>>>>>> SFDP spec says
>>>>>>>   Variable address length (the current setting of the address
>>>>>>>   length mode defines the address length)
>>>>>>>
>>>>>>> and
>>>>>>>   When the length is defined as variable, the software or hardware
>>>>>>>   controlling the memory is aware of the address length mode last
>>>>>>>   set in the memory device and this same length of address.
>>>>>>>
>>>>>>> We don't set any address mode until all the SFDP parsing is
>>>>>>> over. Therefore we should always be in 3 byte mode, no?
>>>>>>>
>>>>>> Actually there are some devices that have variable address length but
>>>>>> 4 byte mode by default (I will work on those devices after this
>>>>>> series
>>>>>> is settled). To support such case, I prefer to use
>>>>>> params->addr_nbytes
>>>>>> as current address mode so that I can fix it in post_bfpt_fixup()
>>>>>> hook.
>>>>>
>>>>> Are there public datasheets available? So these devices have a 3 byte
>>>> I will send datasheets to you in another email. At this point, only
>>>> summary datasheet is available in website.
>>>>
>>>>> and a 4 byte mode, but after reset, they are in the 4 byte mode? Looks
>>>> Yes.
>>>>
>>>>> like it should be fixed in a different way. I'm not sure the "current
>>>>> mode" handling is correct.
>>>>>
>>>> Yes, we may want to introduce a new flag like SPI_NOR_4BAM_DEFAULT and
>>>> check
>>>> the flag in BFPT parse. Once I send another series, please review.
>>>>
>>>>> We need to differentiate between the mode the flash currently is using
>>>>> (nor->addr_nbytes) and the mode parsed by SFDP (params->addr_nbytes).
>>>>>
>>>> The flash's address mode affects the address length of Non-4B opcodes,
>>>> including read/write any register ops used in SMPT parse and Infineon
>>>> (spansion) specific hooks.
>>>>
>>>> The 4B opcodes always take address length of 4 regardless of flash's
>>>> address mode. In these Infineon chips, 4B opcodes for read/program/
>>>> erase are available and 4BAIT advertises them. We don't have to enter
>>>> 4 byte address mode for read/program/erase.
>>>
>>> btw. this is a pity. you are using the stateless 4b opcodes but
>>> then you don't provide stateless opcodes for the read any register
>>> op :/
>>>
>>>> So, I think we need to differentiate between address length for
>>>> read/program/erase and flash's default address mode.
>>>
>>> Or we keep them in sync. E.g. switch to 4bytes mode if we are
>>> using the 4 byte. Granted, that sounds like a hack :)
>>>
>>>> Obviously we are using nor->addr_nbytes as address length for read/
>>>> program/erase and should keep this usage.
>>>
>>> Yes, I wasn't aware that we actually two different runtime
>>> parameters:
>>>  - the read/program/erase address width, also used with the
>>>    4b opcodes
>>>  - internal mode 3b/4b. Up until now, this wasn't an issue
>>>    because either the mode was switched or the 4b opcodes
>>>    were used. So this was mutually exclusive. Now we have
>>>    flashes which uses 4b opcodes _and_ we need the state
>>>    of the internal mode.
>>>
>>> I can't think of a good solution for now. Need to think
>>> more about this, but I'm pretty busy at the moment.
>>> What I think is clear is that we need two different modes
>>> here in the spi_nor struct. nor->addr_nbytes for the
>>> read/program/erase opcodes and nor->address_mode or similar
>>> which tracks the SPI flash's internal address mode.
>>
>> Hi, Takahiro,
>>
>> Can we determine the flash's internal address mode by querying
>> the flash at run-time? Is this possible on Semper flashes?
>>
> CFR2V[7] has current address mode, but to read that, we need to
> issue Read Any Register which address length relies on current
> address mode. Chicken-and-egg...
> 

I see. What happens if we issue the Read Any Register command with
the wrong address internal mode? Will I read just 0xff?
For example try reading CFR2V[7] using addr_nbytes of value 3, and
if it fails, to read it again but this time using addr_nbytes of
value 4.

Cheers,
ta


>> To extend the idea, when the flash supports BFPT and defines
>> BFPT_DWORD1_ADDRESS_BYTES_3_ONLY or BFPT_DWORD1_ADDRESS_BYTES_4_ONLY
>> the things are clear, addr_nbytes is fixed.
>> If the flash does not define BFPT or uses
>> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4, then we could determine the addr
>> mode by querying the flash.
>>
>>>
>>>> For flash's default address mode, my preference is to use
>>>> params->addr_nbytes, but I should rename it to something like
>>>> params->def_addr_nbytes and rework spi_nor_set_addr_nbytes().
>>>
>>> IMHO params should only be used to store the parsed (or
>>> hardcoded) parameters.
>>
>> yep, I share Michael's opinion.
>>
>> Cheers,
>> ta
>>
>>>
>>> -michael
>>>
>>>>  static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
>>>>  {
>>>>       if (nor->flags & SNOR_F_HAS_4BAIT) {
>>>>               nor->addr_nbytes = 4;
>>>>       } else if (nor->params->def_addr_nbytes) {
>>>>               nor->addr_nbytes = nor->params->def_addr_nbytes;
>>>>
>>>>> At some point, the mode is switched and nor->addr_nbytes becomes
>>>>> params->addr_nbytes. It seems in your case nor->addr_nbytes should
>>>>> be 4 right from the beginning. Which also means nor->addr_nbytes
>>>>> should be 3 for the other cases (and probably not 0).
>>>>>
>>>> With param->def_addr_nbytes, I think we can keep nor->addr_nbytes = 0
>>>> during SFDP parse.
>>>>
>>>> Thanks,
>>>> Takahiro
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
