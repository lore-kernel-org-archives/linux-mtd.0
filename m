Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CF0C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 13:26:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E839610EA
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 13:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E839610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ikcNtTgloeyJFaxXwsoAAetZjEvfiiMdAl0ZquoYzQ=; b=TwXg5IHhX70QBn
	hhbkyZ8DuqBRLt9QXbJpW+f3IwemxuTdOS+KRwtoWZT5e3t5gGC73UDsVxd+Z7uxwJPdB1+WrURaL
	+2Qazjm4svLRoowpljo2bCeoy3Z/uwu7H4c5l9LE55/HUjnoc2Gfd0qL7LqDC5/h5MUYo3RbDYtk9
	XsJXnW7/vDlBBvL0Qhfd0Hdz9+0zgBusEiTADlsyRMLjI9HARiNQXKPbWpze2/Dr9Q9RZUJh7W5mv
	eA18aKUN2dnAmv9VgNqEnDQijDlT5LwzknsLras02fNOA9Q9HyUQr2fDPKzhit5Gae95CkCpK12jz
	mzIxhSRMz2W+9dns0UWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mduYj-00B5tn-U2; Fri, 22 Oct 2021 13:26:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mduYd-00B5sZ-9a; Fri, 22 Oct 2021 13:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634909163; x=1666445163;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7OjJ8UZkg1WO5Fn1XaEtBAS0xjtDCRHc72BgWpuBOuM=;
 b=CqSISHirpTR00ZUfFtNhaHQfx52dhx6CmjRgy/0aC3SwL7mD0NgmHkH6
 xEQTE9N/PqWRPPLK8etuustNR5VkvEqh0KCIdFZZi3t0SkRcuvR65CL5K
 7cfE55NUP37ztW9qYIzbHu5U7c+rXDuNqwuwUoabCWweUcL9sdbaLqCKQ
 hSTZU6vvs+DTxhcRV0y5UFWmCmhWN7CfkDFSXbulikx+VXADogQfGgc/0
 ZBP8pxg/SJsU0KzX5pmYeljk3b0MinG9BF98lr1EHWRZN0SSba1n7WbKP
 S6Ky1fO6MVkzRF6StyOC6AfyJnp7MVY1Zu1kzdJDrWVhxvGsZblxa4bE8 Q==;
IronPort-SDR: FmQAzyxBtx4TEdtKYqEuM6SpeEQl91YhlpupalJ+SE1V3+njfBzh8fheVc533tjMbIk3ONqOjq
 YNfT108zH3svKn3k1rqGVWWtQiJ/2KjWKWUGxJS4F3y0Zbsl00sSdBJUgqEoVTwcq2Sx325d3o
 CZ0AW51PVGLYubqwuDhRBc3bP9bM8r9J0mDsaxzC1wALG7rTrRZtqIFVr7LsGR0Iw3aK4vqrPH
 YkAOZPv4Zl3vObUizjiObYldPtwwYPLKauvwvlKsYE7veGX2wuagUiYTx7Lsh+zGwTZFqCAu90
 uAZp0Ko+/sP7ne503MiMX+31
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="73962774"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Oct 2021 06:26:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 06:26:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 06:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inxafFsT9i/3CzACpX1RjUNW9c9kvihdjto44ej1PMKtH6/cs+2QY/iX+ocrECMFAmQ+h1mNCYUzH0hLr0YnWBE5N0j48VqLuOzBDNpnXb4GtuP/ju6woWY4y3lh8iwrBrPw+6F9LIU26DZSIVWokKL55z5hdFvqNWmNZguT6FDz/B69r7L9Z6CfxdlyrWTCeDGKIlseZt4UBYKnnzAcAREvvcSWlsg4Hvh5BMqWhliAvuH5EZCVCJl57OJYTw4uZ05QRVPE6ZVYKIDYbHdZDUSCSA1JeR4saW63aIgXIkHTqSxKU7tr4eV7/2EMdNB26LeNpmAhbxKODFs2hg1liQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OjJ8UZkg1WO5Fn1XaEtBAS0xjtDCRHc72BgWpuBOuM=;
 b=l27TxjZ1uWWsv5DJbgbmd1NU5I9XBsOiX/pcSi/IijKrZYRQKitKx5uwO5bSZcWdXCnNnjfRnk6d9+0TvnWxMiF5OT90TEHLYJ2L1IpmdHZUaeJvDGZFsORZVDG0w+GA8RotjetwN2liN7mIQI+50nXJfY4mTzGGayRImnCJihnNJvQzE9aH6ydBiHTP2RQg43TqYTLEkFmLiKGFtQg2tYvfB+/C2DdW+jxWlwD1+YPxpF6CHPE8ltEvKmmDDoKxf5GDEhQ1vZaJtqVqL3V+wxWoXC/CtCMxiyrtf0A1Ck7juPB1FWHJrvyQH5RygvPah493UAJu6HD+syYhnPqAWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OjJ8UZkg1WO5Fn1XaEtBAS0xjtDCRHc72BgWpuBOuM=;
 b=mbluhHVi62JaPegRyIhSPL9MGTFRU0sJkndivPjkbHH+m7wgYbNAymiiHzpnSC4MW7aceLI+7Gyi9E5Z9MtJsl+sxDHPT65Oe9gUaYaixPfdf+PgcWR6kXfZ9Vsc1/QlmbgdkdQFSRuQUWa6kJ0WrD9rnuptWdhQ6xlPxsz3xuo=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5145.namprd11.prod.outlook.com (2603:10b6:806:113::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 13:25:57 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%6]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 13:25:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
Thread-Topic: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
Thread-Index: AQHXx0I6UHICDZIL9kqtt57ceHbdbw==
Date: Fri, 22 Oct 2021 13:25:56 +0000
Message-ID: <9bf93cbf-fc57-54ae-2439-45e4d75dc0b7@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-18-tudor.ambarus@microchip.com>
 <20210817102429.kmhuef5hxumllxjj@ti.com>
 <4af8b3edebbe398dff1f8ef0bb98f2bc@walle.cc>
 <20211022121010.mzul7qsxi6s4ru2w@ti.com>
 <eed6741d-cbb2-4f67-2780-6ba107eec0f8@microchip.com>
 <5a1497c9b2f07b2e6b91deb8ef17646f@walle.cc>
In-Reply-To: <5a1497c9b2f07b2e6b91deb8ef17646f@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba381da2-8a90-4b74-087a-08d9955f7b28
x-ms-traffictypediagnostic: SA2PR11MB5145:
x-microsoft-antispam-prvs: <SA2PR11MB5145541B5341AD5EB70BA8CBF0809@SA2PR11MB5145.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5bIkuKhJDBYUYaR9R7cw+yXDYVJbVTigjYoA7jXn+EXLKUV5xvRifCrOtYqN0Gpzl9edPHpzcp8wg/eYjZ0BINU3IDwYOuGYDZ0suc/Lx37L07XQVo//9W1nJdG/1CaQwNm/MJUhhpiX5QmYSCs1ZK9Okt9Sdw0nfPqWNjrjdeykD/bcgAIowx/Tchs7dnza7PCIxfgVO8h71ZiTqa8yMgKW38wCL29ouo02oHb92s6lPG6LOr42tTTKYH9NFnFhe2yRUdwhiU5ZL6RA2rdhwBT0xJHHM68ZIOYIbCOeMZqjeH9sECqXQg+5PIjnG9Kftq06bQYeUrAtsPgi+X+7U8ISDPLSqYq2LnTOjSg/IApJHHxANmizZTL5jchtuRWmGTj2C2C3w2qmFinGtzTLUUOAlwuC9OisG5xJ6/1fYxrfIpD+96E/ZU8e6AfMqa8RbDFro0qpGkKml8sdZEiYPSh81UTIyG564aFlvDXQiq17boG68gSUe9t9cgSK5cJsTe9fuUQ7PDAPOf7VGEXtf/NygRYLn/bVkwpX2ldxPEcSxgYT/3Wgohv9j8AogiXvKvUnTQ3DLIdSHZbXDinJbguxauPkCUlVrmxqs+vmLJWT6Go2jR6Am/4vx/94LgPnxa799ZCkfv+7rrVNof5mIOGMRv6pU8BqyFc5XmkxeWhGaWEQ0Y9vFxMj9s5htpu4mnqqLOhWjSRKFsV5kqnAbjPCI7qqQ+Z5FzLSogWpTUp0X5J3jlZ6xCkN1VTu6tA3yvg8yZGewlJau6StYCyAfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(86362001)(31696002)(6506007)(508600001)(38100700002)(71200400001)(6916009)(8676002)(26005)(186003)(53546011)(2616005)(4001150100001)(7416002)(66556008)(2906002)(66446008)(64756008)(66476007)(76116006)(66946007)(8936002)(4326008)(107886003)(6486002)(5660300002)(6512007)(316002)(38070700005)(122000001)(83380400001)(54906003)(31686004)(91956017)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnF6ZWEvOUxLSENOTmJzdzV4S3dYMWxiNHlKL0t0a1dwL0RiM0JMU3hlMG8x?=
 =?utf-8?B?WXJ2eG5ONXBqZXpRc2RwMUhUTXFkL2NqVlVzQ09TN0lxL2xBQ0IyajlKb05Z?=
 =?utf-8?B?aFJLdUtKNXlwTllieEZUSm8wdXJ5aTluWG8rdjhrRUZzZDlMR2ZzcU1uK0Ny?=
 =?utf-8?B?c3hjcG15aTVkTlVvOVcxSDIwTEpWRzJZMmVzRUd5SEVOWDBBZHpSeFJFS0ZB?=
 =?utf-8?B?MmFvaFl0RDVqQkdWbU13aFRNOG1nQVpkaHJlZ09MZzNqbmJHOTNiRlRuNXBr?=
 =?utf-8?B?S1dmeGxic3Q1YW5yUlZGa1FPQ3U0cnM0cU02elZnWEFTTy9qMGFaRzNCeHM0?=
 =?utf-8?B?WWQvZCtuK2VGeDdLamEvdXI4Y2grOTRRaVJ4MkxVd1laQWI5N3ZBUVg1dU50?=
 =?utf-8?B?QTZ1djQ0K0x1ZXg5bXdXUXU1Q09nUUZNZ2svUzZCTUZ2bXVOaUhxbEF0Z2hC?=
 =?utf-8?B?SjdUQ0svRFpQYkdibGI0RG5QWEgyYVZyczlMWmpCNS93ZDJUa0M4WWIzb3Y0?=
 =?utf-8?B?VVlmVVdpeXAyT3JDbmgrOXlhd2NVcmRhTzdQKzhaT0dVbUhDUmFDcEkwdjNR?=
 =?utf-8?B?QVN0WEs5K1k3akR2dnZuUHJWRnpYZjRkWWdrQjBTT2R1NXZLMTVXcXdKcmtD?=
 =?utf-8?B?YlBQL2kvMkc0SHNzczA1WmdKaHd4SkhSMGcwWERYcmNIRkRZMVJUL1dDWkF4?=
 =?utf-8?B?MHFZaUZqRm9QNHAwNkNhTVRXb1lKdWkvTDVpS3FPZ3V0SlZNVzkvcDBKSGcx?=
 =?utf-8?B?elpjQTFaZ1A0TmVhVmVsODFjcmRwWUQ3NXpKMFdtRTVwT0lJNWt1ZFhkQURJ?=
 =?utf-8?B?cEtRc1piNUJnc3JWT3RPQldvTXk5RWl2NlByR2JUalBVYVFTd3ZIVkwrSCtU?=
 =?utf-8?B?UllRSll6aHNiTk9vN21tcGN6a1RuSXI0aEdEd2tJOVQxTXdaNmZqUXNVR0NI?=
 =?utf-8?B?djJaSDlYV1JGVFhXVDFmRERRNXNmcXFrT0p2Q1RvRXRDOWt2YUc5cDkvUTZk?=
 =?utf-8?B?eGNsbytRZDE0NE5qUG9PT2ZPeUNxK1piSUdYcVhTZU1pbG43S0VGUms0eHR1?=
 =?utf-8?B?R1k1V1BGWU9CM1g4YTdKWWNJRDZUZ1VjZ1NZalUvVVhNcHVhWEZBK3RQSjYy?=
 =?utf-8?B?OTdnQlpBUVMxSkJsWnVHc3owVW1ZcU14LzNJMkg0VDlOd0ZMNWJiZGIrWjcx?=
 =?utf-8?B?dHBwM3VQVUx4R0dnQ0Y0c0QxV0xSSFFqUjNmU3JKdW1lTy8xT2ZxRzlWcU9D?=
 =?utf-8?B?N0J1Q3BOd3ZONGJEd1BJT245dm10amo1MUVBN2RJb0RWenFpUGZMQXlXVHZZ?=
 =?utf-8?B?cmJXL1Q5R01QNThaak5JSU1vUm05Wk0rbW5uU2VaQmdZTFc1WHo2V09XbEUx?=
 =?utf-8?B?c21Jbm0zNktRYkxLbzNLclBZTE1RYjBtRzRJdUNXL0Y1bWVGczNNNTNDdEZN?=
 =?utf-8?B?MFdQQ0MwWXJLZURwYXROSm8zYWpXK3ZZMENYTkw4T0R6OXVmU1hXUDVPa2RQ?=
 =?utf-8?B?a09maGNLTXgzMlpSdHZRSXlSVHpGdWlwN2dmd01uMmhpOGgvbEJ5amlvVHY2?=
 =?utf-8?B?dWoxQ1dmc2ZIcmVXUU0xUnBwdTd6bUdweFVVRmZRTy80azI2QnhkYjdUMW5k?=
 =?utf-8?B?dXJHVitIT0tObHlNQkNGVEQ0U1dpWGhTQXNmYXlPcTZZaW91cXlnV3NENGl0?=
 =?utf-8?B?cHlSYTErSEVVYmZjbnh6aEpQdVBJSng3Q0dFZVpXRHlGTjlXTmVvOEJIc0pE?=
 =?utf-8?B?NSt0NGVLNGlaQ1RML0lOd2xsa0JOZ1ZRNmJ1M0Z2c01YSlF5S3haUkp4NHVs?=
 =?utf-8?B?bmJ5RWNyUUdaSU9yeG9nc0laN1ZxUkMyT3o5UkVTVE5MbFJGRWwrZ21Yck1l?=
 =?utf-8?B?Y2NiSnBRbUZ1NFB3ekxUU09FK0RIZGxtTVp1MkU4YXhVcU9mYnJ3dkNMdkM5?=
 =?utf-8?Q?o8f8kSTA4fN6TAUi9jp2nz2l8Axdp1tA?=
Content-ID: <9B2BA5A02D0361408E241E3C6A915B95@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba381da2-8a90-4b74-087a-08d9955f7b28
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 13:25:56.9402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_062603_448625_BBB40FBC 
X-CRM114-Status: GOOD (  23.72  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/22/21 3:59 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2021-10-22 14:42, schrieb Tudor.Ambarus@microchip.com:
>> On 10/22/21 3:10 PM, Pratyush Yadav wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>> On 22/10/21 01:21PM, Michael Walle wrote:
>>>> Am 2021-08-17 12:24, schrieb Pratyush Yadav:
>>>>> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>>>>>> Used to initialize the NOR flags for settings that are not defined
>>>>>> in the JESD216 SFDP standard, thus can not be retrieved when
>>>>>> parsing
>>>>>> SFDP. No functional change.
>>>>>
>>>>> I am worried if the order in which these flags are set can cause
>>>>> some
>>>>> subtle bugs.
>>>>>
>>>>> I can see one instance of it with SNOR_F_HAS_LOCK.
>>>>> spi_nor_late_init_params() checks for SNOR_F_HAS_LOCK and if there
>>>>> are
>>>>> no locking ops specified, it sets the default locking ops. This
>>>>> works
>>>>> fine before this patch because the flag is set before the function
>>>>> is
>>>>> called. But now, the flag will be set _after_ the function is
>>>>> called,
>>>>> and so you will never be able to set the default flags.
>>>>
>>>> Maybe we should just forbid to look at the SNOR_F_ flags in these
>>>> functions. Instead the information could also be deduced by looking
>>>> at
>>>> the SPI_NOR_ flags.
>>
>> not true.
> 
> I guess you mean that some init flash init functions might set it, too.
> Right? IMHO this goes into the spaghetti code direction again.
> spi_nor_late_init_params() must not look at the SNOR_F_ flags. There
> are too much inter-function dependencies and it is really hard to
> follow the call chain.

I don't think I understand what you are referring to. The flash_info flags
are used just to set their SNOR_F correspondents. Take SNOR_F_4B_OPCODES for
example. A flash that can't discover 4b opcodes support when parsing SFDP,
will set the SPI_NOR_4B_OPCODES flash_info flag. Flashes that can discover it,
will ignore/not set the SPI_NOR_4B_OPCODES flag, and let the SFDP do its thing:
the SFDP code will set the SNOR_F_4B_OPCODES flag. The only flags that are used
across the SPI NOR core are the nor->flags (SNOR_F).
> 
> The locking ops should also go into the (static) flash init which only
> depends on the SPI_NOR_ flags. If SNOR_F_HAS_LOCK will be added at

we don't have to specify the locking methods, we have generic ones. A single
flag is enough.

> in an init function, then this code should also take care of setting

what init function? We're just setting some flags.

> the correct locking ops. Maybe both can be set together with a helper.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
