Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B4FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 03:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EfiF3nlT5d/uq3YK24Of4fg/34ro5kCAcrI0UX6VOw=; b=fEsdM8vuhFiROX
	YQnv5bdsNX8ER8AdUKmipM8xyxR3PG6hF7zhtddDaPXsxIkJSWi4qf2ll0IrTnnii4VouJ3/fXWdH
	SaggYc9UvM/y3bP0SURv2ATbdCpPHPKMoXl8Nh3S8MD+WkKnkIXXdB5vWzvNR4xveoaFmHYUsFBg2
	4h9Hd9OtnaY2BQVBkWXiT3HIq6f1Zp2VgjW3J+vwsQrhCF3sgz4UuTKTNRx/lr+AnWqDPmkm2Z1zD
	THvPpWgPtkOCKa8fiZeLUXjK9SIOx+T0H4YkqNcXY4LAeZfGnw37tVV3jrBZOzGDDcQlnxlQOUZiF
	ZKabOPplMjS4C9SKfmqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI037-002Pka-0g; Thu, 10 Feb 2022 03:23:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI033-002PjK-6i
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 03:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644463388; x=1675999388;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=E0G1CpK+4eqnRYuSNXMsB5walBx8JIflCWZsHQQDVos=;
 b=uTrA94nAMZu9c4lNWQhkNDFdZx8psKFKFpOtd/iaSMChVgGrnBLqnQ0/
 quyeOLZ3TtwYB8/cqsRMRP/9IFMmd5Lx5heW+JLGpDQpw1UZSaLRCjMLu
 WxUZo488a0aErsybFgGKm78un42P5PZnAFLa2hehgzQAOU5u8SdDFx+8/
 Bk06D/REzwguKN+OBSjrlCV/E9i/un8ioZrucjkP2sVKZ4i1BaXBg7AF+
 98dTplMUm0XWAko3IrRU4pbX9gZG7Ddnpiam5hOlNh6XPHIszJ8K4AXx1
 p3/TnQgpe2K6g4J0GfgqIA9r0z3er1kJhS5ixiMU4J7jcQmN0wCYKqQny g==;
IronPort-SDR: 1Qsq8pcOeehGNk0CZHNssd76xfjs1uwaeambn6gPcs5J75icvtBOinjS9sLFxfdXS4X1jsqT7f
 IC32ndYMlX3ROe8MPzVjycmbglVp3nh4tU0DWsfnxu4ZYk6/i3nZYg+kSRZrIkikd9yR0G0a2P
 uapVckEAWAcVs0EgogU2/thfKbriO1CvY21HqIKyEzwYPnaGZ2h6H1ApR8SCa9pmWC7vziJ72K
 Ca4H7ZhMXJ2q5c3PtEvN4cGlISQqrgGq17oMZKwHYe2yf5v82qouoxz+1A59pg8UpyA5ExpAq2
 byZYWMCdXR/HYLPyTXUW+lVj
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="85253516"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 20:23:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 20:23:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 20:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4BVTKSxRaA/mXHSMwyVnfP4kFwrHeXfmd+PS8TOtddOxaDhkTxcgCp/F28vHeefSSDqADY6NlDoNqLJsry4Z0/iiPEXcuwiMm9/Mso33UtWrSAHUq/DHzDOSJXOmGl4gMJ1NijUbLl/im8IyLuGc9s06YJmy/achGIonp1EG+CMotFq3KVuowHo3AfTeEqqcgIfa+qrTXMuS7rYWc2Zv18wun6sioE7Jh8r+8t/y1avKQmOr0TxveEqzbM5kHd0OYAFkLnbnmEws8vsNHYr4BPjszB/aBDuvfZVgaMdIa9jZIhuD1XzLjyK+3ei2zsz5jg7Rg+ZqEjnlanelFwrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0G1CpK+4eqnRYuSNXMsB5walBx8JIflCWZsHQQDVos=;
 b=bGlvg/hEUQzCaFwI3czP2C1/LNbUVK3hbSUtYI8vlRFQfdCPq4GivSZOVslKeghtmlHNcpsSzulH4X2wdrHbE0xRXQSWJ9maNkNZpSCw81RcB+wJRUpfUa+jWkjJjhhYu/oTU8qK4yRFtqTdDLf7/tVGVZVOeyIyN9hGMams3Vm/9kKLFyBu+QtAJC3lLifqf5vGgzH6EXB1bKGqshPYefzqijv4YBDfGveEEaNhLFNCgpvZXH9l3h7rgELKW7/pcMHhFbiUwZnZd7fcjI23Dbr4b1S+BIER6nvCQKLqfb5w71W7IiTJmVO0j3NnCVJmnCc51fDjUXdcvonxlcekyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0G1CpK+4eqnRYuSNXMsB5walBx8JIflCWZsHQQDVos=;
 b=k92xVWNlZ1I1CP/UYYPrebUofVovFJYc4VSzCNRrxUNQOfPEPYZgvaCoFOaImSJTwK2JnhUtEmrp4GFeHZ2/J0y1zHfAt17u3+2EaVm3P504uWOYM6YGK0plE//lecLuFZEMvVjJIQBIz8QGTtcJJ9aY/+qkfMaRCH9FIwEFjkc=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM6PR11MB4315.namprd11.prod.outlook.com (2603:10b6:5:201::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 03:23:02 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 03:23:02 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 09/14] mtd: spi-nor: micron-st: fix micron_st prefix
Thread-Topic: [PATCH v1 09/14] mtd: spi-nor: micron-st: fix micron_st prefix
Thread-Index: AQHYHi2C39iYsoYWv0SEThxRHGhL9w==
Date: Thu, 10 Feb 2022 03:23:02 +0000
Message-ID: <5519abc7-c3a6-fbf6-12ff-bbcb239d0c5e@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-10-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-10-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27d64eb1-b9be-4abf-1a14-08d9ec44a53e
x-ms-traffictypediagnostic: DM6PR11MB4315:EE_
x-microsoft-antispam-prvs: <DM6PR11MB43151D5312E921CCF5058C48F02F9@DM6PR11MB4315.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8QLf2QVgGTYV1YjZehfYv/BnNBkJ6c/Cy8BEEL85BJjhfcqq0v+15veSRprk0qDnbtn4N536hw43y7vGOJCHh3HQhCeCOjuH9t1TnhBqjOA8Gc4I2/SFO64Ppdh6+d++zvFY7OqTCoV5hWWav0um01WNaPEBQ8jfcpjuCxkftDZb6BH/9gz+ANBjVLoOM7WkYrvzSGOLqxnJXOVT6rxCmizPX32VaqKKz0/jEcq6KQF2IEct1i6WmsYNyDSUYA5O8zXF36nuU8m8hFKB7I0G4KpTcfaTQMgSEJt4Cd26/OfGFZaArfd5l64P7mbmrva+WKFRavf9up9DnO+xFL1GaKBPXgLDBaSi9/QexnozQIEBICP5bkTdcOgEJeKZC2Ip3UbFutbHyC6f+jFmmpKG5DDiL7kAhe0LSN0w9n3jRRz4AqjUHGzhRns0dG53oPLNNNViezWVx21yruiVM3407vhgpMWMYWfMia2mBSXc50n4J5pNNqzPWtnuMIWWVGuClgqgoaSAC8MaEISN8EWAJ2621xxclsNFsVTMWII8iFC92apMVcN1OzgWnXvhjvq0kKJoBpgqOBPWZRXYMj53qL22hjkJlf9jFhdgG4s8OgwjD2PZ3hw6NFYgR2C2GIs2e40VHsMQ/TxQEDXncKrZ8btVZw18Tvzr2wbivyd4P5C/xkoKGG2cWgGUhrFVTGu96T1M7S2y5IgaQmlu4kiSSykvmRZZk95XHL13Nz1Spf7biCBOJsVLSD9N0EwWUWLOLY+p1nvt/CL/O+gAFP7yMQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(8676002)(31696002)(4326008)(38070700005)(36756003)(71200400001)(508600001)(2906002)(8936002)(66556008)(66476007)(66446008)(64756008)(186003)(2616005)(26005)(6506007)(66946007)(76116006)(86362001)(31686004)(6486002)(54906003)(5660300002)(110136005)(6512007)(83380400001)(53546011)(316002)(122000001)(91956017)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czNyRnhSOG5saG10RHpKb3pFSGxGc09zUlpLTVorczkvN2pjRWgrMmZRRUt4?=
 =?utf-8?B?SW9JeEV2MUZMQSs2cWdHMWFpSXk5ZXE5bHVZdG9tWmNHakpsMXlQRThLZWpa?=
 =?utf-8?B?dFBTOU1YUDcxMm5Yc3llVzB4TTRFSnlSRDU1RHFWSkRLVlpINTN5aHJUOHBq?=
 =?utf-8?B?bjljN25IM1IxUlk0V2J3RklNMzgxQmZDVkRuK0FYRnFpTmRtUHpVRTRIRUIx?=
 =?utf-8?B?M2Y2L2REQ3FYZTB2OXVMTldOcEtMKy9tN2VyaStRS2F2WkhQOHhKOUtpK0Qw?=
 =?utf-8?B?TXYvc0s3U3g5UlZhQS85QnNKVG1qc0l6WWkyUmNYR2ovWGdrVnhEVDFaOFNr?=
 =?utf-8?B?VFlaWnZ0cUlNUzFOeVNTeVBGb2VqcEVkUHF2NDBZWGgxYm1pNzVHNDJCdENm?=
 =?utf-8?B?eG45dVVlUGtwZGhjSEo2UVlLNE41dG4vZy9udVBwaWgraDhDK0ZLb1Q0WndI?=
 =?utf-8?B?b3R1eUh3TVB1VDk4MWVIekljV1RSQllVQzU0cTBibUxyVUVCejJ1SFAzMWxZ?=
 =?utf-8?B?UUY4dUd0enlKSWlvNFltQ0JUUVM0ZWFiYmduZVVkdjEzNVZuVGRhMnA1a2JU?=
 =?utf-8?B?dnRWY3JmL2haUUx1QjZCQVZuSzhPYnZ2WVpSUHZoRnB0bFdrcUg3QUt0Mis5?=
 =?utf-8?B?NUIvcW9kTTc2eE04YVJwOTRVMnhjRDdSS1hza1FIV09ucWJHeC9QRjBpelpN?=
 =?utf-8?B?VSt6bWFYR01ZSllPaFJSbXEvcFhmTHhaRFMzWjcyOVE4eXNMQ3FmWm56TEZZ?=
 =?utf-8?B?UmpyaFBnUSs1eTVoY2hjQ056WVE3bFRjTGlQMk56M3pNdDRZcjdKclhXbm9s?=
 =?utf-8?B?SVdoMXNuTHdlK21BR2plbTZrWXdOUzNWaTJZcUdyVWVJUHRMWUNZRFBQK3l4?=
 =?utf-8?B?ZlFqNDRPOEk0dlNSMkJ5YmZtZUtZVWhOcWNXUHFqUVFmSWFPeGVxMTFiQU00?=
 =?utf-8?B?emlOcThDRUhldTNmZ3dvbFVtaHk0QlpYUnNKbHFJL0VyWFZodVk2UjM3Vkpk?=
 =?utf-8?B?SEpZS3RNNWhSajAzMGtNMG1zdW9DSnNjcVp1S2JXMWpad21YL2NCd1hGenJw?=
 =?utf-8?B?amtlTk0wb1l6ditvSXBvTmFlcWpZTlhadU9WQ1NmZll0ZGFTK3JDczlIVE5t?=
 =?utf-8?B?WFlYK1lNbkdZMzE2U0tTQUl5SldRR1hDa3J0OWZCdlNKNmFMRVhZUlhVYmJR?=
 =?utf-8?B?OEFGVDdJaStYamVFeUhFekl0anlnRlFRbWNCNWM4OEw0Smw0OHRTSENJNmlh?=
 =?utf-8?B?TldwOXZLNXk0dTFZQ0tPSWh3ZEtod2R1bFg3VUhjc2Nnbm5BVUVNRnlPVnJ2?=
 =?utf-8?B?Vy9QWjczcmlQSURLWWN0Tm5tVThjQmFiWVdsMEhBYzVWcG1Ya1VKck1NYytj?=
 =?utf-8?B?MkpVQnZqeDlPbHR6WExPNG0xSFkyaHVrMDUzMEJHYVJUVHJ1bUhZRWxMT0w1?=
 =?utf-8?B?YU02Zk1KaWg3bXdweXFFR1ZVVWlYRW83TXZ3S0V2QkNXODVBaDFmUFdvMWVD?=
 =?utf-8?B?M09ueTRtMVVwY2lQUWQ2MTVKOVkzUnZuOThwaEc2UXR2dzRyOEc4VDdxd1A4?=
 =?utf-8?B?U3RLaDdTRzIrQlVlYjJDWXFoMUl5NzNmUDFhN2haYzVUSlhocnFDMmN3UThw?=
 =?utf-8?B?Z1g2TmlyZmxJcFZUdEduQTM2SFo5N2VsbStDN2hkVlMyR3FnckluUkJZNU1V?=
 =?utf-8?B?aUxuWHhHQkJudU1nQmYzd01GS0VJdVB5MGIzYXZWRk1ReGl0VWhZbjN6T2FW?=
 =?utf-8?B?QlhkUUFDQ1JTWlhydnllMWtDMVcxemdRRlgrMlJtZjBhY1NsSnRienRqcyt2?=
 =?utf-8?B?enNjWCs5aVJrWlVYS0lMZVl4dVlqRUNtL04wT05IWVQxTFR6OVl2TjhweVVq?=
 =?utf-8?B?OWRKa1FZZDVuMjBWMEhjemphTllySjhsZzB0dXlsVUVMK2hyMFpXVEY3V1dL?=
 =?utf-8?B?OXRMUWoydjdmcUpKMTR6T1hma2RiRUpzTHBiTUxYMVQ1dVBhSGNHWjI5YlN2?=
 =?utf-8?B?aFE5VnN1dVZ6WThqZ2NUSjczbTN3WTAzSncyb0trbDFwM0RJU2RnRnE4SGFz?=
 =?utf-8?B?Tm0zZ3Jrc0RHN2VuZjg5aC94Y2J4ZThaNmJxdUdZb2JYeG90NmlvNWNmenlw?=
 =?utf-8?B?R0ZqRFVsczhHWnR0ck9JaC9BVEs1OHovV1RtVGNLbG9pRmt6dllLdFZBRHV1?=
 =?utf-8?B?cUZJemk2WkhaWnhZUWt6cVFBQlZmN0R1MVViNWozY21uVW9peGQ5TGs5bHdx?=
 =?utf-8?B?R0VvNzlPSjN0ZXh3RkpoRDFiYjJBPT0=?=
Content-ID: <6F6EA965CA56874789800C15B6EA9BA6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d64eb1-b9be-4abf-1a14-08d9ec44a53e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 03:23:02.3252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0KdXbAL3G1ZhjmvPzVWKcOIwaD23NG2NBW3uBhzRbIXX6nbOQ+0DzIP2FMnq/2AEf2k4kZzvVzDSQmTJ6DmyCtrcVzdau0z6fY84aDeI/sY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_192309_358812_8D2A4638 
X-CRM114-Status: GOOD (  18.51  )
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
> The usual prefix is micron_st, so use that instead of st_micron.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/micron-st.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 33531c101ccb..ca368b48bcb0 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -284,7 +284,7 @@ static const struct flash_info st_parts[] = {
>  };
> 
>  /**
> - * st_micron_set_4byte_addr_mode() - Set 4-byte address mode for ST and Micron
> + * micron_st_set_4byte_addr_mode() - Set 4-byte address mode for ST and Micron
>   * flashes.
>   * @nor:       pointer to 'struct spi_nor'.
>   * @enable:    true to enter the 4-byte address mode, false to exit the 4-byte
> @@ -292,7 +292,7 @@ static const struct flash_info st_parts[] = {
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int st_micron_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
> +static int micron_st_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>  {
>         int ret;
> 
> @@ -430,7 +430,7 @@ static void micron_st_default_init(struct spi_nor *nor)
>         nor->flags |= SNOR_F_HAS_LOCK;
>         nor->flags &= ~SNOR_F_HAS_16BIT_SR;
>         nor->params->quad_enable = NULL;
> -       nor->params->set_4byte_addr_mode = st_micron_set_4byte_addr_mode;
> +       nor->params->set_4byte_addr_mode = micron_st_set_4byte_addr_mode;
> 
>         if (nor->info->mfr_flags & USE_FSR)
>                 nor->params->ready = spi_nor_fsr_ready;
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
