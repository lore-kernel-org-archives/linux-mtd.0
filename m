Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3372BC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfH5bDNOTsobh/f88ov9fFGlqSnbKPZH1JJxwITpXtk=; b=yJN3q7bJb6NbgV
	pbX9hKjEsnP8q+N45P/BTIWsmmLvpeUb0H5vrP8BD6NnHw9m+YZ2BFsrICFrbD/JeKhdRAm4/WnFv
	QF3SRmxh/GdcRu0ukOKRf9H/rwVXlTAOtaEPV74C8NNv8hymYf6KawkTXCXfOfoftHw6zs2EOlVWK
	BsIXn0sGPLGs+DLzrSRDz18nQVsfzWZ8C5aZg5KvwvvobeX0CVCvLu+I8QqRJw04tn52WXf3i4zgL
	jxJHH5Q3CEMjCifq4DVeCp297WURYSECKvfL969DVZdHuPYjoUnMd4KiSVelpSx1MnpqSPrJT+ZlH
	UnzYtTwwC+HhvyTecYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngit0-002D3B-TM; Tue, 19 Apr 2022 08:06:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngisw-002D2d-Nz
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 08:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650355615; x=1681891615;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RXU9dfVn3+oJOp1M0tPyIXprnoSGKAZPw/FnrZmERnQ=;
 b=cEnVflWv+d0FW5MSLDieERp3k0SbjbuNFaCKIgWVsGk3LV7TH71tWCR1
 2aJ27NXjB4xJVvTHIsADD+rbOoNVK1ydu2btgYQCvHUq5/LTq8lX7S+Kp
 dkPr6GvxE5g0/+VQL3Bw0V1c7ADrEJ1ktH9fVyfAbGaNfyap+tymZFg+F
 WtkJdg6Ptol+klYmH9iGHFRRIAn1fs+v/DZ2DBg5gGFT035kCuP2GiBdL
 VR2pDx199FklHfXWbpwg/ILBePYcrI81pNrzb8HoQadoxW0sj6Ev7riWK
 CmWArWfeJouQg13vfFfIWG51JgQ4gJMJShLIcKmEgtjTmoTN9FKJuQpjU g==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643698800"; d="scan'208";a="153036071"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Apr 2022 01:06:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Apr 2022 01:06:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 19 Apr 2022 01:06:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvHBE+QAL1xb1rP12YN52fZaOaD/JUq/6pXJMKdULj9npuT+qd9xhEmX0stxnYyEiVVV4oyAvccd9JxlTboR/pZ29Bpxxz/Lray3dkcvCx0iNxKVdMB70awzeLzyWZxZmdtsl7YNPhUU77YLd7hQzsLZvKWoTlfLS+fti0XT6b1AwCJTivUY9P4aP1rlbIA9M1w1Zc0yaFPS3OKEbAZdhtOou2OoKUbeLi8iL4tn7fuRx5OCMWQMBgzy4NaXiFZwMlrKOaN37byEC0MITQf5mOMt3taKVhAh/wsAJrnrUg8iD6Lt215Q6ZvdpGvPpJ3373vuGfmmmVgeXopfhiy3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXU9dfVn3+oJOp1M0tPyIXprnoSGKAZPw/FnrZmERnQ=;
 b=V8yewVdcDwERnrgrTm+9XZZqyRWdkDfNzS2T6aRZKQNAYfvoJDkgT7b2nUVscpMh96suryNTdyRQbAoFaBAd64h8jP0YBr0tMrab3Q0o+CQp0nvd229mxbAJDnc8Qwqr5xViGrN6VwZJupJD17C7ux29fAbZzVkLEJkT4S5ShGMSnC8eyflwiIpU604RvtIzPzBEhJ4s7fNhFQsO6cwIDhbmF8D2JnWUpFKi5F35MDX8RKb99NTrfnSDD/v6rQG4ua9WFK6xBgfr6vwKN+GbDdUgmmPoKiWpdb7gawbTTNAHvIpdLTFYU1FKbpzWyntuGx8ylQtyWamg4PjYNExs6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXU9dfVn3+oJOp1M0tPyIXprnoSGKAZPw/FnrZmERnQ=;
 b=uG3voVcKLed1dYTkL8SQ9D4UVGOzEto3BG4TRhkSEN8gUQzvycn2s9chMalIRHqV2tFfc99p07/j6f08PZ0yXQU8uOlLOkgm+PdfjRIuuKFekp1xLSRCb0xNHAONGMOm34AruN4HI0nrDO5QYd7gPCGzub0/D6r9w4TFKAWylvI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MWHPR11MB0048.namprd11.prod.outlook.com (2603:10b6:301:6a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 08:06:47 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 08:06:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v11 2/3] mtd: spi-nor: spansion: Add local function to
 discover page size
Thread-Topic: [PATCH v11 2/3] mtd: spi-nor: spansion: Add local function to
 discover page size
Thread-Index: AQHYU8Rq/t8Fe+/NqUmrDkCqqUqK0g==
Date: Tue, 19 Apr 2022 08:06:47 +0000
Message-ID: <3fbf1d6d-918b-2ebf-ee7d-6e09cc0eac74@microchip.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <7695c40251f2fa13f42259ca28150d41b72e7cf0.1650259501.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <7695c40251f2fa13f42259ca28150d41b72e7cf0.1650259501.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1118b9d3-6bef-4161-56a9-08da21db8d2a
x-ms-traffictypediagnostic: MWHPR11MB0048:EE_
x-microsoft-antispam-prvs: <MWHPR11MB0048A2EA26498E9F92A2A397F0F29@MWHPR11MB0048.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JN1NXN5/nwfVJu4hQoOD17TZEW5MvVw2ggW2sUtu3L91U3+aIMGaKW/kTBAtJprSo0t+6WuOlZTcyD0L3uOGOJyxLo2vdvCFEYGFMxeVjDdwrmVPInqQJlUDwEMhr7HEWfG4OfViUJtuJNaAkuN9JhntPQ/RMacEp8pZDWS6D9/6Z2MgUiAy0rkpA82a/9WsKJyZstef6QCLE9f2frynlbyJ9MHscNC3SmzPgRI0ggffCnVzVKe8/cMymTXgp9KzwgxeBNy7MZ8A08rcXFjfEYg8W8psCNZggEpqoG4xz/FeDzNKwDvMbdeXrwDdjMW4o+6GyE96Z9j0D9zhywGvAjYMLvzKotMrxqp3z/ACgm9cSBitUg0NhxJ/EMKuhQQCbfpbAwJbT3syi1shuzY89UDr2ymRNpY0mjQyGkOowvjvDJB5BNpTrVYTAp6KEVRU/4v+uxanAOlqLCOXo65QhbcDuivQDqkO1vAcc7ByV0G4u9BZyU8WdZlVksNtBadSiQW2b+ZdcdvG5GMADVfPyF/8FK5s9wpNdsnaE2pX8AjleGYWx3p1DBM1/bH5C1knuCs8a9Y8SvHOjwMUVjG+evpOV7gibr52jOJZp0QGKvuEwl0F2Mi5/sp19y5BwyONwuCUI2TJyRtsxe1rxJLA0K7cCs+dY2klyIZHDz1tcdm1qjZS/KGUczbvH4eNHSiw46KD8qCyYlZzlPpW3R8AJiS5iNhFCzLCO1CnWmifCmdmYpW0lA6DilXOaFWWy0bU+Aq1O3tHA2Ycei0/jxadzLa0OQGrCj5vAetwf25qw4hUzRg27nQSa1vEuJc2OK4Yb0YruU+SVZ7PcrVcNW7Q+i6Dcilh4QNnXGlw0fdoIuw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(86362001)(66446008)(66946007)(31696002)(5660300002)(8936002)(54906003)(66476007)(66556008)(31686004)(38100700002)(316002)(122000001)(91956017)(4326008)(8676002)(26005)(186003)(110136005)(71200400001)(76116006)(508600001)(2616005)(38070700005)(2906002)(83380400001)(966005)(36756003)(6486002)(53546011)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2hvMWV6VnVXVXR2QVdGbWQ4cFZ6M1RRenBhVjZHN3RMZ0RvYWNodnFiRE1a?=
 =?utf-8?B?RWZYNkgyL3BwYWVYSlJPeW5acmp3Mll6K3hMdmw0dTM5dkdmanVVNFpXdkJD?=
 =?utf-8?B?QTJkOE9vd2ZjL2pZT3AzVk5wRUlrdndzL2RhaWkyMFQvd0NqcDBMOVZobjE5?=
 =?utf-8?B?RWNxTC96MlV3N05VTitvZXNWSWVCWTdubVdlZGlmc1pDSUt4cHBDakx0bEtM?=
 =?utf-8?B?RzB2cVpvM09EdHlKV21JLzBFemhLbDcwYWJDaHZJUTdoNWRkMFpMUmpPUVBT?=
 =?utf-8?B?ZEVVS3ptYm4yd1ozN0xLQ0hFcHRpTjdUc0xnN3hBMkFZYjY1Tmh0cDREcGZH?=
 =?utf-8?B?Ui9rSGMrYWo1TGdIdGVZY0JpRVE4OThVSmhram1OUm5nQ1JyLzdLRWc4RkRY?=
 =?utf-8?B?MTZ0Nm5SU2xPdjQzdWg4MUdERHdVV1FGNzVIazZSS3pXR3BFcUN0NGd4QU9s?=
 =?utf-8?B?TGtCbm5mSGlHT2YzQXE2c2RFVUtIbWxJb09NQ1JFbzZoNk9sQUVHL2RmNWhH?=
 =?utf-8?B?amR0TU90SGlWdE1qQzc4SjZjS3A5Skh4SU5ZTXZaaS9XMnJFdHViY3JZVUhh?=
 =?utf-8?B?QjVxK0JObGRaTkpLQk1KWXN4bG1KSWpHT0JUd2E1Z3JRSDVONWFPMy9YN2I1?=
 =?utf-8?B?R1h1K0xSVmFvYk1rNEhwK3BTb3hhQUZ5K0RBNkRPTm56amREbVRCdlVpN09T?=
 =?utf-8?B?Q28wUUR4dFFwaXdxSlJUY08yYTAvV3lWNTFmS0tKVmgwcWZuVWprb1ZOTHlX?=
 =?utf-8?B?NG9FbDlFVzhMU21OQUdMci83Z3RLVVFqemZkemErL2FSQ1lXOEErdURsYlMz?=
 =?utf-8?B?ZGlhSXQrR0RWSStubi9DOU9SS0FDc2pzM1VSVUV6a0tEbGJuZTBVcGlOUmN2?=
 =?utf-8?B?MUNZNVY1dngwMXZja1FQVWhQcnY1ZWJ5VnpRLzJGTEFXK2MzOCsyYmpiSm92?=
 =?utf-8?B?dEVPcGRYR01MR3NuUEFhRXQ4c1VMSTlQaXQzRzVYMkIxb1RMZEFOQ1cyMjVI?=
 =?utf-8?B?M05SSmxYMlhqcFZTTitaWE85TmNkUWUrNzdEblR2WXI4bjZMMnNSRWNDdkp4?=
 =?utf-8?B?UmUyNHpEQi9ZaWlQSVRwMlp6RHJ6K1JFTURwaytDNkhFNmxSTFBlUThXenhS?=
 =?utf-8?B?djliNzVjK2dDR0dKdytCOTZPUDI2a3NGVm1UeEh5OG8wbWlUaWRoNG1yTDJr?=
 =?utf-8?B?Sm9IUm95T1g4RklJb3JUazl0VWNaYndlN2dJbmhxZFdJb0tOQVc1cjY1SVlm?=
 =?utf-8?B?RmgwSWdOUmFDeWdvcGJBRGNCQVVRVHZ3akIxaG5xbkN3d2NjZkJ0eEtLVElz?=
 =?utf-8?B?cWg3UXpuSko4SWpZWVBhZGhmK3VSZXEvcWxBZVRJSVBRVHFHKzFMdmpSMEZC?=
 =?utf-8?B?NElsZ0ptQklteHhKcjNFb2ZGcHByanFORG5NY050LzdFSlRVVjBqME1aNFBD?=
 =?utf-8?B?QnVuelJ5UGFPRERpUEU5aklOVHNWRGJWKy9UVmF4alNQVW1xSlBVS2pwV2V6?=
 =?utf-8?B?cVdPdFVTQW0zQ3FBRURGZ09zbUtaYkhuR0hCanYvRFNuRVZRUjgxNXN4NEdH?=
 =?utf-8?B?QkMweW5wbk9WLzBJbFhvV0ZxcFBiTkwvUEZha1QvalVJZ1FiU2prTHIrRFZi?=
 =?utf-8?B?U1Y1c1BiQ1ZXLzdURnFKSWxkWE9uRWs2UUlGdkpjOWtRUy8zeDc1RGlqWUFD?=
 =?utf-8?B?dWxFdEJFRnMveTAwa2lPamx1WkU5dGVoVUpsR0tyTUZ2cDBxMGxkandLR1Jm?=
 =?utf-8?B?NzV6ZDF4RXlaNXBNZmM5QkgxbG5EVFZBRDR2alRqb0ZWQ08vR2xHbDJCb2FB?=
 =?utf-8?B?cE82R2kvWEZ0TGVTYkc0eW41SC9KRThUL0I3dzg4TkVPYk1WeHp2NEkxdGlo?=
 =?utf-8?B?L3J1cy9zbEhMM0hJN1h5ZWZOUFp4YVlTVVlZa3A4SU9md0hIQlhUUXdZQmxw?=
 =?utf-8?B?T2RmYmFYbVBVOHZQNHRaQlE2bmQvOGdwN0JyWW9ISVFDTy9WbXZVcTRsMWhU?=
 =?utf-8?B?andHOW5PakR3U2pHK2Q0VkE0Szl0RVo3MU1yYTl6NlZmQ2x6bFlUcmpFd2ZJ?=
 =?utf-8?B?UzQvWnVCbTg4MndoWitnNGtyUnd3a3p5SDA2Um9DNlBsWXlkQkd3Njh4Slp5?=
 =?utf-8?B?OHRQYVZ0NmpzTDcreDFKcEc3OXpqV3QrKzBjc2hmRUd3Z3NoS0dqOElWN2tG?=
 =?utf-8?B?dmdJYjRUcnQxZ2ZTOEZCaUlwdlVUM3BmSFJKUTF5NTlJcEE2QWtZb01lM004?=
 =?utf-8?B?ZzlIUE1WOHFCM1dicXNNTVNHZnl5dGpDSHVMTW4vMW5iVVFWaW5rV094S2pD?=
 =?utf-8?B?eEJnZXUrTis4dU8rTW51VU9WaFJRbHFQTzhDNW1yRVlZbzlnZkVpYUtDT1hs?=
 =?utf-8?Q?wb7lFDFlgM6HRv14=3D?=
Content-ID: <67775F639E50DF4AA2FC019039B9A65D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1118b9d3-6bef-4161-56a9-08da21db8d2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 08:06:47.5950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0I/jSMczHDntf692CihLjnLE2Bmvu2CMZCHVkG3kZDsPzipjgi93vWJ9TctaNDrtA2t7RMQF+dAXZeDO3sHGkAho7fStIbI/NLOmg6U1KhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_010654_917449_1E75FD63 
X-CRM114-Status: GOOD (  27.89  )
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

On 4/18/22 08:41, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The page size check in s28hs512t fixup can be used for s25hs/hl-t as well.
> Move that to a newly created local function.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v11:
>   - Rebase on top of Tudor's series
>     https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
>   - Add addr_width param
> 
>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 6bcd25180af4..493240ebfd70 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -177,6 +177,37 @@ static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>         return 0;
>  }
> 
> +/**
> + * cypress_nor_set_page_size() - Set page size which corresponds to the flash
> + *                               configuration.
> + * @nor:       pointer to a 'struct spi_nor'
> + * @addr_width:        address width used in Read Any Register op
> + *
> + * The BFPT table advertises a 512B or 256B page size depending on part but the
> + * page size is actually configurable (with the default being 256B). Read from
> + * CFR3V[4] and set the correct size.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
> +{
> +       struct spi_mem_op op =
> +               CYPRESS_NOR_RD_ANY_REG_OP(addr_width, SPINOR_REG_CYPRESS_CFR3V,
> +                                         nor->bouncebuf);
> +       int ret;
> +
> +       ret = spi_nor_read_reg(nor, &op, nor->reg_proto);
> +       if (ret)
> +               return ret;
> +
> +       if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
> +               nor->params->page_size = 512;
> +       else
> +               nor->params->page_size = 256;
> +
> +       return 0;
> +}
> +
>  /**
>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:               pointer to a 'struct spi_nor'
> @@ -231,28 +262,7 @@ static int s28hs512t_post_bfpt_fixup(struct spi_nor *nor,
>                                      const struct sfdp_parameter_header *bfpt_header,
>                                      const struct sfdp_bfpt *bfpt)
>  {
> -       /*
> -        * The BFPT table advertises a 512B page size but the page size is
> -        * actually configurable (with the default being 256B). Read from
> -        * CFR3V[4] and set the correct size.
> -        */
> -       struct spi_mem_op op =
> -               CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR3V,
> -                                         nor->bouncebuf);
> -       int ret;
> -
> -       spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> -
> -       ret = spi_mem_exec_op(nor->spimem, &op);
> -       if (ret)
> -               return ret;
> -
> -       if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR3V_PGSZ)
> -               nor->params->page_size = 512;
> -       else
> -               nor->params->page_size = 256;
> -
> -       return 0;
> +       return cypress_nor_set_page_size(nor, 3);

not related to this patch, but can we use nor->add_width instead of 3?

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

>  }
> 
>  static const struct spi_nor_fixups s28hs512t_fixups = {
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
