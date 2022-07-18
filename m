Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB5BCCA482
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4BhRCFMPM3JbMLiFgUJ/PHQu5snZ/HVP8x12qgDlo4=; b=dFhwBq1cOEp5cR
	Jos9TN4Pwszz6qg2hNuC2dKsX3LjBUcFZ1TfQObIXIFpZFC/FOP+jW/WqKf8QNj4SE8BrA5w2S8CZ
	wmVOVnIPeAp2jN8/DquDlDTDYjUy7XA8W/gCiJxjFSnO34ruabkojiKXpBGRArjjgBa714P/VJlbB
	P9OBnWIvB3lcEhhE39KzjYCqln1enNL5n5Z/pohcLI3+j3HpUjOGev+9g0ZbRNOv0aum7BnWxdNE4
	O8bgEwH7PmbZVbtuMefypbIEW3B93yXr3RSzvtdQezC2uVjAWK6zPLsI9qbGTEzFbDz7Aco5y2ZX6
	WsLOFiruptem1x2uc5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDU4g-00GvuO-J6; Mon, 18 Jul 2022 16:58:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDU4d-00Gvs4-8F
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2022 16:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658163502; x=1689699502;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RCwbr2BbQokkWDr4KHfYnxB2vrL1wsEIixFC8E9p7vY=;
  b=W7I16tfA9JeJDUQKVBj0TR1YIZlEV1lGXCdSUllpqVb5waHXaDYf7moo
   K3WiihtC792ArZIQYBkaZLJRrqyZONEGvDG9L+DspH4XFeGS3CPdCUI3l
   rDZk3OqaEHYWGA7atokW9FmqITt8lP6wXFsPGYQLwS5BLswsffNHibrYr
   yAcxFroj5ju7SqL+M9fnwhrJwRG28Q/gHc1jFfITC5X8Btt6SGJHi/P1J
   5GNzi23z1pHwVnicMU4B7dlcIk9iINIciq5YHiVx2NlwNP5zbwJr18N+4
   ZihGKGv/LkNcqTjjE3M2jKVrgRvoMqtMuDr5fwl5GSZVYh6wbNfsXqh05
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="168350937"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jul 2022 09:58:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Jul 2022 09:58:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 18 Jul 2022 09:58:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgQctPSqOZK6rr2+gJJNShHaKAvYcbHkv+1wUeYcDTZr/Uy+i6KBj5eOBoZcIbgSyeLfvbwe0CRa8UQtTLcFeoTYzmNnNKLUJvQVrQt1y+yI0qekA5ghcpbfiCy/3cdE9pQhu+ByJ3O8fH5Dq6TIPyzKftj5cr014gBESQ9KRgEmvMc+vkYAt+ctgadOB1PJGd9CybKtxC15r1EBD82r/UvzXwys0QXLPHiCCeELtIrLvg8Rr16tDdxl/y7U2F5frhCvUfL1pLMcbwxtxKxu45FgrXm9lOmftmISnzNX7xICSfF7aUJ+t9xrVEKmchPvE+GWGIb4DiByR0KC5sdfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCwbr2BbQokkWDr4KHfYnxB2vrL1wsEIixFC8E9p7vY=;
 b=ANv4WI5ZCOuC2o0Dn7tt1TaSWfULm3eXdVH2VDW7NQSZvRd8X9u7RHVmMhftv+4y4ZAcXuJ+FXCJ5z0t/hPPyy75omPxRmZd9Frp2BpY9jHMRGyLdU3d8aAnSldGI//K4SV5hgaiQXpkCJF3Z7IMDJh/ccDkoU2oJYohZdJE4oW/M4Mn2h35T/wJ6aZnOFYl487Zfo2C9CjE/ZLYsR45MeROeIyVxAvPCh3DIla8IkJmeNUuACtjvYuID5tEqrsvWEGa4WJrd6EPLmzjJc9ImRsf2kJG2o8X014fss3oL5nqPPIiV7FU45Osd+kIBRWbq5xquxWdpasL+qso+HqGhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCwbr2BbQokkWDr4KHfYnxB2vrL1wsEIixFC8E9p7vY=;
 b=LA8bH0gYE8HlSJzM/Gi2flKoHE2QXcvTB3Ll7tq3TvCaYFz9L/Zzl47T33BptGs/WTeQ7id2ncNgDmXSFr6D3+vpDO2mybC5vgnV+A+qm7HK1D/UifE74GZ81GGnkX6hdpGRxPV/D7vTgsD5BIl1LMw72jhYt32o0AWD4xbk8xs=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 SN6PR11MB3373.namprd11.prod.outlook.com (2603:10b6:805:c6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.23; Mon, 18 Jul 2022 16:58:09 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 16:58:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sudip.mukherjee@sifive.com>, <p.yadav@ti.com>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <greentime.hu@sifive.com>, <jude.onyenegecha@sifive.com>,
	<william.salmon@sifive.com>, <adnan.chowdhury@sifive.com>,
	<ben.dooks@sifive.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] mtd: spi-nor: extend no_sfdp_flags to use u16
Thread-Topic: [PATCH 1/3] mtd: spi-nor: extend no_sfdp_flags to use u16
Thread-Index: AQHYmsePzRkwROJ3Fkqot+zf8xcldA==
Date: Mon, 18 Jul 2022 16:58:09 +0000
Message-ID: <d3903d95-d76f-b9cd-b927-d175afab31a7@microchip.com>
References: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
 <20220712163823.428126-2-sudip.mukherjee@sifive.com>
In-Reply-To: <20220712163823.428126-2-sudip.mukherjee@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1731c295-5359-4b33-4689-08da68deb190
x-ms-traffictypediagnostic: SN6PR11MB3373:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AhZyw0FVnRqiV3SVJG8bECZV+H6DpKJoGD7Z+NSpeiXrrvyGIsFUcoPanNccQ4kQmHFt8UXzjyAWTylJFsq1ALOPjDFklK64GVwaZ/dqfru7WxAJAePugR5LTWBL6VS4Rc5bzUDbKuArQCd++vR1/0fw2Di6ckplhsiMCYw6Cfrve3EIxTKoYHyPd0etfs0CnFQo1T2OjM1fwsKkUmKKywNotHPG1MzIotouln7RmimeThE9ugVINAwrUnA0z53ObCeQ39UiRM3ilHTXG/YNgAmPQJ86GRXYB64d6ib3mQhwCuP3wKbTHKkgmyA4Cj/glNMV5MnACwprZKWJjdR08UfCliluYJSB9/2iykBj7x5VzhdgArdGhgz/IcelvoI874mF300NjpF9oG7ziR9iJXISIs1yQGjOPc0kzSTDlbSX7zJ3NO/iSZXuU+eOOpyOz3wycgY9p1lW/ceiBmrPKHacYnfNpkvlcRGgWgeHoEtuefIzd2C9noNxUst4UycqshEyPltBti/+yQXaFhg193qzcpnPNvS3qkql0StroNcew2ZCahpdkjtHjdXCHnPd7XV6ASldk4cmMKMHLuLjyfHjBtAPnrPY3SnOhycIHywEMRMHnmGTLPEPHBOFo33Jwd6k9qOKu89mXqWtI0EbWL6dgNyj+xvbieW1PiAb9Kg764N+Ov4EZkubqMs+GFG/7MORcQDffHu8nwNhNNNvQ0PadQtByLKICmA/IjHb+6D0We2fYbqy0CZICDZIspaWptPa8ddBWn5GGUeIehAfhkfBAxDkW0ar9RdiCkgxBeKCXRHaCEH4hUFEgAlOVYcfPzXyL7SCflRz58QyyJcEqN0Z8A6v1SIPdEgWnHFen+Q9TJ6nypD8gwTDHfTDbPDH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(376002)(396003)(366004)(39860400002)(122000001)(31686004)(36756003)(316002)(38070700005)(83380400001)(186003)(38100700002)(478600001)(66946007)(7416002)(5660300002)(4326008)(76116006)(91956017)(2616005)(71200400001)(66556008)(66476007)(2906002)(41300700001)(66446008)(64756008)(8676002)(6512007)(26005)(966005)(6486002)(6506007)(86362001)(31696002)(53546011)(54906003)(8936002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2tmSitMMTZLMms3b3NMOGtMbUw4WFdCRkRlVFNMOUxUS1Z5aFoyUVdCbzN6?=
 =?utf-8?B?cjVWVk1aYktneFlMVVZvMGtWY3dKeW1OYXpOM3pHMjdQcUJnSmtlZEFJZ1Zi?=
 =?utf-8?B?M0l1QnlXbUdjR0VxUU5EZmJDWHQ4cmtUN0FnaTd2NGdOU3p3MTJkbHNqb3g0?=
 =?utf-8?B?QTBTdENuQ0xCUVBBbndnOVpZRlI4RWlDVGo2bGp5emQ2ak85Tjk3SjV0WFhs?=
 =?utf-8?B?YUlrVFNEVDdVVHgvanFsd2dWeHA5WURGQzRQUjlsd3dONEpzQ21vUmQ1cFRu?=
 =?utf-8?B?dWVKNXRTZFRYazlFS2VUeEFjUkxWVjc2eXRYbDA3NUxyWkJvUjgvM3VqRlM2?=
 =?utf-8?B?NUFhRElybVZDbTk2eUQ5b2xrS3RTZG1LV1NKM3lOc0tJR3NrQXdweVhLL2lT?=
 =?utf-8?B?RW1zY2xiQzVkckorcXVqVWphMnZWSUttcnRJNit5UHJrZURHYXFzTDUzbTFx?=
 =?utf-8?B?bHFTOFZheEJmSW9LL1dBS3JkaFJqV2N1dVdVdHFTNHZTSVcvQXBmdFhvZTVR?=
 =?utf-8?B?VjhuMHFJc0pRS25VaDJSZTB2a3p1eVNhK2EwQWZsTldPMU5pYnVaUm5zN29Y?=
 =?utf-8?B?VTk3N0JMaTBvaldSMkxKVS9lNnJnT1hzWmtKay9sRXVKRU1IS2ZSaWZyTFcw?=
 =?utf-8?B?Z3dSRWppckZIZm1BNStRL0xDNmVhemtWZElZY29DbGVIb3krdnZTZUx4Zmdp?=
 =?utf-8?B?ZnZ2SGlBRHI3b3huek1GUEo5L3pvNHA1QnRUQ0RhbHFCdTFpWFQ2Qk9XVkdn?=
 =?utf-8?B?R0kvcngwTXJDdms1Qy8zclBEV0V4U0ttdHNrNWVackFSbWdTVUgrSm5VVkhz?=
 =?utf-8?B?TTZkd2d2UFMrT1F3M3Q5dFI2Y0g3T3BxVGl2K3U2NDVDWS9lY0VYdmJLTkJC?=
 =?utf-8?B?b09ONzR6VXlIbUJiVFMrMlFPU1V0UmxRckpGaVMxbmtEUloyWTJvQ04xaStB?=
 =?utf-8?B?a0VoQXFFd3ViTk9PdlY5eGEvcWVyTE5DcWcxT3pvbkVEOHNUKytRTCsrTno3?=
 =?utf-8?B?clMwN1JKVzNQUldQMzJNWmgrRFRZMGtWc2prQkM4Wm5uVmFXT1I5cXc5UmFV?=
 =?utf-8?B?ZXppVUxKbHZPZDF4T1FKU0tNemtGbTkxbnFUejJ4K3VtSEIwY1pxRE1jeDJ4?=
 =?utf-8?B?MTRSWitEY0pVV3ZCaStNWHNrdmgvS1lPbEJqL2RjKy96RTlKN0ZnNjkxSVhI?=
 =?utf-8?B?ai9Xemp3dDgweU00ZklaNEZET2FYbURMTzFxNHREMlA2cDFMNlpNUE1yS2ti?=
 =?utf-8?B?NUtOcUhCODZhbDFwSzF6bk16elVrc0ZjaEhMY3B5dlVub2RNREZVbHp1MzY0?=
 =?utf-8?B?TmxOZ1J6KzYrQ0N5TFBtWGVhTm9uc04zWHM4aDJ4ZVc3YWRhYWE5alVGZTJE?=
 =?utf-8?B?cGVTZ1FKTGtBdDNTVVpydXZaRU1DS2ZCTEJjb2hVMVZGTkpxMzNIU09ULzc4?=
 =?utf-8?B?TDhDK1RreTF5QjJENjBwbTgyL2Z3RnMwQkJGSW8wRUtLekY0cExybWg5b2U1?=
 =?utf-8?B?Q2tiMkZIaG1iWTQrd1F3S3JlaXdCMzlqd2JnRDVHU041ZVlSMllycXVpTnVO?=
 =?utf-8?B?NnozVzBQMG9KODBSVTJ0M2hFLzFweGgvdHJOWVlmVHJrZWRHL1dDNlpzZ3RN?=
 =?utf-8?B?WGVlUUJzZ3k4bWk0Sy9FYzlXNlVGcWppQkJxemUzeHIzZ0tycVdTVVc5YWhn?=
 =?utf-8?B?ZUlqNEdNMUZYUXZ6WlIzVGVtSUhKTVU1ZHJINVczUGpvdXdtWDlpby9PUlB0?=
 =?utf-8?B?QXllVTlLUU9pL1g1bTFKZ2FqV3FHZ3UzeXJleXFvM2ZkUkdaeWQ2Q3VNSHV5?=
 =?utf-8?B?emhQZDNxWVp0SHhqeUdDWHYrUkJmYkpVbnRkVHhJZUNGUktOaVVHSU5hK1Iz?=
 =?utf-8?B?LzlSM1dqTUh1STZZdnlxamVrSmRFUnNTMFhKSUF0OFJTcEwzbkgrTWxsZFV2?=
 =?utf-8?B?VGpyVVluUmw5ODlra2NZYTFQQVhNZmFWU001NG9BLzVmczNrekUveWlUMEFV?=
 =?utf-8?B?MlN3UHRVVzZsb1BJS251Qk5MbUlielhwdjBzTWkzd3R6aCtHMHFpRjY5TDEv?=
 =?utf-8?B?eTV2WTBCRkFPblg3TmNLTmFwaFFlWkhNQXFKc05pRnF1UzZ0RDNKSE83dGFC?=
 =?utf-8?B?aER4Rk1KOC9ScFcwYUpmcWFVdXR1WC9PUXVWRWJLMk5xOCtYSGtlTGd0U2tE?=
 =?utf-8?B?d2c9PQ==?=
Content-ID: <567D5518990BBF4390B58FE18B1107CE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1731c295-5359-4b33-4689-08da68deb190
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 16:58:09.6771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qbriJ79xkkUs1B/C7xCAaNi9VQZukmiKIFanbXJuSxdIUNEUfVyyM0rlv78AvRL0uMyCnrSZHd3D5rC9bn7VG96ie/Drcw2MfWpYE3KyzVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3373
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_095823_382605_3F44A7F1 
X-CRM114-Status: GOOD (  19.38  )
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

On 7/12/22 19:38, Sudip Mukherjee wrote:
> [You don't often get email from sudip.mukherjee@sifive.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Currently no_sfdp_flags is u8 and all the bits have been used. Extend
> it to use u16 so that we can add more support.
> 
> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  drivers/mtd/spi-nor/core.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ce5d69317d46c..e5f7691c5bd40 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2335,7 +2335,7 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
>  {
>         struct spi_nor_flash_parameter *params = nor->params;
>         struct spi_nor_erase_map *map = &params->erase_map;
> -       const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
> +       const u16 no_sfdp_flags = nor->info->no_sfdp_flags;
>         u8 i, erase_mask;
> 
>         if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 61886868cd022..58fbedc94080f 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -501,7 +501,7 @@ struct flash_info {
>  #define NO_CHIP_ERASE                  BIT(7)
>  #define SPI_NOR_NO_FR                  BIT(8)
> 
> -       u8 no_sfdp_flags;
> +       u16 no_sfdp_flags;

>  #define SPI_NOR_SKIP_SFDP              BIT(0)
>  #define SECT_4K                                BIT(1)
>  #define SPI_NOR_DUAL_READ              BIT(3)
> --
> 2.30.2
> 

you can extend this when introducing a new flag, if needed.
No need for a dedicated patch just for this.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
