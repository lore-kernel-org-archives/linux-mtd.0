Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982FCC433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Feb 2022 07:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPqRMtx/3LkKvAI8CB0sSqoz62Z8MGlmJcm1zwCL4Bk=; b=zC8ixSyk7G1Ljq
	iTENMKmZ49ijZUbzCLbAP/huKFEHKBuE1Rl9Re6jYrb/SPQBq/neHh8qyyN2bigjrD3T73rJxNNIh
	kdt3rcmnwVyeGiu6h4rJ1S7aYJsaGEyt3EA4Kxu9vE42Ate8tx266xgQVEnKjN34U4uqSB/pOj/6V
	wh21GPAZgr49ZL4owc4tGTXaAbvYCbVpF10yB6nDFi/5sZ+VCL9kIBUun3X+78PzWJl/4g+5+/7XP
	HQCXqMXubnc3+Beg0d1YIeuebSDIzp4jkrRbzOFV9uPmEURW+KLyDMOU8sGF0gH6gp+2qVqimTHFQ
	eUi0OaCiylx56kZlsmig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEnjg-00BMuW-R2; Tue, 01 Feb 2022 07:37:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEnjU-00BMs6-Pe
 for linux-mtd@lists.infradead.org; Tue, 01 Feb 2022 07:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643701064; x=1675237064;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yHuC4/oh/hnVc4xNPX4U5Ksd2vI21rErFCRNLSkRpnQ=;
 b=GCSMMRp/aFiV+O7A+q+ZAJF6Sr9SmUdlC88uREKIdLEuKVNB6mbwkQPo
 SnYipCglJ9imXycQkczUe85MKiIsbPf2ThSGgOWg1Qr7Ab0F4KAO6hJcE
 rDRQ8jffmuGVjb4JHdrDN5eFOsuU7QtZTFNdxDJwmp3w4FB4gNbiI5cl7
 E6vhDS4JYGZSOCVP2On7EILlOvDzux2sQ2fFnebprvWVbLROeiBqdu9tT
 v9fqPMSEoxYj7hRCErvr4k2yvRj+kRUOlVqWovJAuc39KPLKowOxrUYZh
 vp3jjmQxESOORPoAG5Z3I5eT0UCKO+3yv5rHoQMmVdhVdFMIuZtiDivV7 A==;
IronPort-SDR: tezcss+BW8NWWgbFZcgWwNSPVXnjpa8Z+UDL6+u8CDZGh2GBNjSV0Y/DtaBPuHUB3sYdL1evvP
 fBca7KDsJyZHC/NUbNen/Y4tLf3G+AM+hAH+tJRPfxcTM5JDF1uDPR4eqbj8xR4JHlHL2m8keT
 fbCKhEDbn+F8nlOXhfuW4AasUZjfwj+BXjHrMptHlR7vMU8dczMLAOTUYVYI1xLmj8HXWce6PZ
 QRuCem9Zzf5vdeghTkcDwjiyMdcg8WDZ7Js9gb0LSrWBdfV+drQ5FLsTZiAmwxcLbXysTya94Y
 Dfw/l6Vbd8rPatkFTk+2oV1A
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="152072504"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Feb 2022 00:37:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Feb 2022 00:37:42 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 1 Feb 2022 00:37:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzr1wicl5aR0roYHPaY5b5dnjm/kSaLRpLppVGj0z2f66hd8HyEYGGKXol7QU8i+XgLpPpr91KdelLEJ3aNsD8F8eCnm+OChrX96I4hT//QCtfmtRVcpA+fGEDCevKJK//Nd4vQABYVNzC+jtxebmdS1N9SO+xE5o2RCsklxLi839gaN6ihTvCPvE7B+QjpbA0im+vh9bhAjkjExfr269/D99LJ2KNi51+/X281oWKRzHEnieSYEyz1kTDFwE6VBJ+lL0/aJvjDkytBZk4p6VZ9HZhWEk6RYBZlh/Z3ikpbRsV4iNfNy7BMtGaEnOLnlAHUwyXGVz6gPQCqLR0rDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHuC4/oh/hnVc4xNPX4U5Ksd2vI21rErFCRNLSkRpnQ=;
 b=f0rHjCvSVBXnGOorUGv8h67bQHehqlErfAFsHQZa3TC+e36SJcAxMVIr6OlkKwNHL8Xbzq0wd3Il/WlfMgK8j8NSR2PBN2uGN7+SV3YpKL1FQMobKhLgViRNRD/dzkrWKuWXBQisXrdtL7gTCtWqiRkTOHGhQ2zCw5EkVTm+bSoXGXq5ISQst3ECr6j4uvMTE0T8NvxCgyVVj0a/UYiBhmBauCTLFYuTxRXuZwnWtYR7DtqWx6TP5P0nWsJjz3TSDYhBNT30tVI5MChHVNlATetIh9+T51nK7Kw06gXIW4/cYdMf9BSrE4FgBOqviIV7OX41kcwSJVUJITrz7gvzVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHuC4/oh/hnVc4xNPX4U5Ksd2vI21rErFCRNLSkRpnQ=;
 b=Z4doO6foQZC6dBqwV66J3ZRyg/cRVeZATUVPj6Z2MNPIbJuVnGKakeVp/gVeu9sNS/n1N6AdPwbqOVEbNPaaOhh9YQOpKFy4roGKIuZctWWO1w3J4JdX6Kxj/ePbsKepmqZ02lbmlEFY/mibyX+NgpB6M4nSn6CkFcScROA0leU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM8PR11MB5669.namprd11.prod.outlook.com (2603:10b6:8:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 07:37:37 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dd70:c5d5:fa3:7d94%2]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 07:37:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>,
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v7 1/3] mtd: spi-nor: spansion: Add support for Read/Write
 Any Register
Thread-Topic: [PATCH v7 1/3] mtd: spi-nor: spansion: Add support for
 Read/Write Any Register
Thread-Index: AQHYFCuR+A5oVBDUhUqz+UBnUsWCgA==
Date: Tue, 1 Feb 2022 07:37:37 +0000
Message-ID: <9acd8baf-9dba-40ac-992d-2f5cf62203b8@microchip.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
 <07db2e3c5647d409941261d6fbeed81215dca16f.1626677855.git.Takahiro.Kuwano@infineon.com>
 <4800bc7e-6558-8707-7390-2b21618215c6@microchip.com>
 <20220128162056.vwxhlz5psdxzz3tf@ti.com>
 <57909d3f-64fd-a9f3-ef13-55a5e571d853@microchip.com>
 <a3ee02b7-370a-db90-bc1d-49c988cf21d3@gmail.com>
In-Reply-To: <a3ee02b7-370a-db90-bc1d-49c988cf21d3@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 613110d1-6372-414f-64f2-08d9e555b831
x-ms-traffictypediagnostic: DM8PR11MB5669:EE_
x-microsoft-antispam-prvs: <DM8PR11MB5669635A2C461D61DAA3043FF0269@DM8PR11MB5669.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bG1Lsha3/mwvbMECR9AnDip5iGpIXIJ5AUGPup6JvfQmX7LMDdADuKfezqzGGrtN20Bkv4hLMLNL7pNIUg01pvmboGyLnYI2f2TgNMe1bJkrCaC9lf0TrO/ev8H3ahEfEV3NebE0hMwKMtwWTCeCVoMpTtjK6bKLlqkLVuh6GY5dO+pIA1AzasrC6SYxR+dU27zZcv3ss2JLqPiAC/vtNK9kYQHDlIO3rvt3QO3sp6fBWWkBh6cY3/Uc6U1cN9NhBSR0opxjAhaz7JNX7wDvOyxQ7BWGfs/v57iueDSysIlYNCA3PAlUZydWncrbH0bS5nLYWOaD0EFLXcVnvh8q5QM0qB78d2f1lhT5GAfykG2A0Kns0j+7znUcWd/5bQ/1vX14VtuvECm2xEB23u8oDkS0C/1UUHMwjtqJjNcH3w/zG/IGrUBIi6az9iAOBbUmZ/RGqvj3BQ725qPz4EXmzM+A3rGl4KpUS35hnedtXrQBb4AzNxVeaYeKbbsSG6BLsJas+czRRm8u6JAegX37BKleiKfsQDgZCVywXtBqhk9qmpLqt0Xo84mEtWD+lhuEX1vDvY2BAyy/PyhE/JrwahKUMpdqcR3XJLk2kxp642aDYlTFKPkILZu4ueJt3AkvvcJMzCowzvXYYXnZcLENyvzWZq/OPnnPUTGYTdkkSGVqRucROdrF+VDWcSyWJbrL3L6a7bUwHLfXfH3tL7bWgyi0omkbEW+dReBplBq36NMRQ1rCU8vOSbA4aLsgiU/NFpQiARUgOTicgOXKK2C8gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(5660300002)(66476007)(26005)(31696002)(508600001)(38070700005)(66946007)(66556008)(86362001)(122000001)(186003)(8676002)(8936002)(6486002)(36756003)(6506007)(6512007)(66446008)(64756008)(53546011)(2616005)(38100700002)(110136005)(54906003)(71200400001)(31686004)(91956017)(2906002)(316002)(76116006)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1JCT2tXWmJpdmF3cWsyZEZUMUVManVtR0w0ZEVjQlVHeFVDVkRXUlI2cVQ2?=
 =?utf-8?B?bjFHUEZkbkNkWE9VdXVCTXlNWjZObkludFBzSXhVdUhTN3U4Qyt2Uk9lNlVp?=
 =?utf-8?B?ZFB3QzdzTExvVWtVbTJ4MlpLSUpNdE10UEw5RVF0NUtvM21NbnJVbkRoSFdM?=
 =?utf-8?B?SVFBY2lsS1JJK3c1Q3lXSTlZdFFJQTNGclZZV0NmODRrUHJrZmdxV0pvZ3d2?=
 =?utf-8?B?dFFvT1Y2UE50NTZKNkZBc1Z2T0VYR010VEgxdCt6R1Brc21QKzcrNzdrbDEx?=
 =?utf-8?B?TXBpdzRSa25GakR0dXl6WUVOK0NiWklueHlzYXE5NVVjOXVLRjhQSjhwZWJS?=
 =?utf-8?B?VkpKdi9FbWNsQmFlRHdyZksyRmZyU3JtM2pZRm9nSmFHV1NmTm5OMmowUlVC?=
 =?utf-8?B?WElSdXFJMXZoeHg4MWZoSDRiclpUaUFwaG8zcHRUQUNWVzJXWFRWd0ZUQU9n?=
 =?utf-8?B?SXZKa3pERW9rYjI2b2xDNS95M04weHR3UW5xN21JVmRPMk1rVEUxNFhlSGcx?=
 =?utf-8?B?OVliNzNScldSc1N6ejVIMzRzTmpCWXB5UnFnTFEwTERiVWMzY1RwdzR2K0ZP?=
 =?utf-8?B?VUZJbitVNEZPZVZRc1FpTGI0OVIycFZhRm44ZFNvRWtYcFpyU2VyTEVCcExD?=
 =?utf-8?B?M2FLcVNodXZlb0xGcnBsaHQ1T2R6eWxXT25CdlMvUVhzUWk2OFYvYnVGd01Z?=
 =?utf-8?B?UnpZV1lacFlXRlBpNHo4Sk0vZEVabEVGOGQ4Zi8rTlhwTTVVWkNNS0tkRUI4?=
 =?utf-8?B?TUlsRlhRSm4rdGVBSUJNYXhSZVoyZ3ZxREN6TjFJU0J5TDdwTjBRM3FUbnNF?=
 =?utf-8?B?K3g0RURhYjdEbEtpOUpWbHRHamg1elU5SmplU0hTd2JxODBQNGtRQXJNZGVw?=
 =?utf-8?B?OVFqcVBST1dLNmxRd29yQThERHRMYmVScjVzVkEwdFpsSStIbVRKLzBHZ1Bs?=
 =?utf-8?B?M1R0WWk1QkJaT2FocWNwTlRUUE8yUHVaZlpPOUZzdlBISDE0WWVWa1BCUEJH?=
 =?utf-8?B?ak1vVFppemtvaUpwOVd3Y1ppV2FSNCtibHJpZ1c4c3F0TGhjZGxUWmd2VVpr?=
 =?utf-8?B?UHIyZE5HQzJibG5xYnJqNmdYWldGUVhxeWdyOXNVR243Vk9YNHJ2R2FPakQ4?=
 =?utf-8?B?K0FTTUJHK0RldXRGREhwWVQyRGpkUTY2SkhDTVdtbkxSbnI2TDBrZHpQVmFr?=
 =?utf-8?B?cEtURkZ3U2JYVExETzRnSnBiam1EU1BEVlV1RVR0SW1HbVRyTEVxTEFxT3c2?=
 =?utf-8?B?M0U4QVNydXNxbmduMlJCYjZ2QTN6d2p6UVBMcmM1eXpSZkFIL3hkeG05QkxZ?=
 =?utf-8?B?K2hKQXhaVzk4YXpmRmlHdzRBWU0wcVg1a3Y1Q2ZqUHErOFBxa1ZscDhxN2Qw?=
 =?utf-8?B?Q05aWEZUTEFvc2JBZXdmOVN5TGtRUXdZazQ4a2NsY0dmYXVYeHNXcnNDQXFn?=
 =?utf-8?B?WjlsNTlzcnB0Ymc0L3NaRUo2OWYzQXZScW51cjl2clVtSllYM213S2pua1Zo?=
 =?utf-8?B?TDhqejJvUktUSk5ZTjFOVk1CUnFnL3F3czQ5SmpMTkZsb3krQXl4QzVLcGxY?=
 =?utf-8?B?bXlpRWJkNzBWMCtpRWRkMFF6R2dEcHQwUGh1MWttZnM4QlhqM3JFc3JEQ0NI?=
 =?utf-8?B?U3h1dVMwNFNYSlRjRWttRitkN3FoMm5QT2J0QlV1Vk5pVytmVlczdnJXSnRp?=
 =?utf-8?B?T2tWU1NIenpLdkFQNGdOMmlyRWJrTG5zS29SVXkzRXBMa09HNEdKTXNQSzdt?=
 =?utf-8?B?U2RIcnZQdEt5eVEvK3pmanQ5UGZhZ29zMHRCaFpUWGtRZ09BemlaY1FkaHdm?=
 =?utf-8?B?djVlUGlhbGxQQm1wM3QvQnFUK25HelRMWUtJQTRxM1RweHlTSEJ6SUdBMWJ5?=
 =?utf-8?B?eDJZL09BcVNyUnc0NGJhRWhyaGlWYjFoOUxhMCtFdzFVOVc0UDBZb3U2TXRW?=
 =?utf-8?B?OW9NbGttcnR0TVdCTTBDcjRWazNMMXJMR2RrMDhwSUhjM3V3cU9mcS9NQThr?=
 =?utf-8?B?Ym1rRVVieVoxeWVKOVBFeWZjMFV3UFZMSlVRLzl3Rmtwc0JyamtjbkJPWnBE?=
 =?utf-8?B?dzdIVm5XV3F3RnM1MGJTd0hEUXp5UFNSSjB1bTZWSGRBVU4xbHBXQVY0UFJW?=
 =?utf-8?B?ODkwSndINXdwR0pDZlhMalBLK3FsOHlpUUY0NENFREVOcFFOcTBtRUZkQ3Yv?=
 =?utf-8?B?clN3bEN1WHBDR3NDUGhlYk96YWhoOW5zS0UxaVROazcyNFozakhrTy8rMEFX?=
 =?utf-8?B?T2hLSFNBeXZaZG80OFk5b09ZMFl3PT0=?=
Content-ID: <829800F00A36B54B94AC07518076A2DD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613110d1-6372-414f-64f2-08d9e555b831
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 07:37:37.4236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IBZI0TRr4FSZfU3X0mxYlzO4fIHlUQq2ovq++sDKfWRszPUV1XZVxbpBaJGMheZX0e8acylGxlejhQ7UdyhjjSBKMRYkwu6KbpCwC0pMXFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5669
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_233744_972201_D1D55CB1 
X-CRM114-Status: GOOD (  15.21  )
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

On 1/31/22 13:10, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 1/31/2022 4:50 PM, Tudor.Ambarus@microchip.com wrote:
>> On 1/28/22 18:20, Pratyush Yadav wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 28/01/22 09:43AM, Tudor.Ambarus@microchip.com wrote:
>>>> On 7/19/21 11:03, tkuw584924@gmail.com wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>
>>>>> Some of Spansion/Cypress chips support Read/Write Any Register commands.
>>>>> These commands are mainly used to write volatile registers.
>>>>>
>>>>> The Read Any Register instruction (65h) is followed by register address
>>>>> and dummy cycles, then the selected register byte is returned.
>>>>>
>>>>> The Write Any Register instruction (71h) is followed by register address
>>>>> and register byte to write.
>>>>>
>>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>> ---
>>>>> Changes in v7:
>>>>>   - No change
>>>>>
>>>>> Changes in v6:
>>>>>   - Add helper functions for controller_ops
>>>>>   - Add 'reg_addr_width' parameter to spansion_read/write_any_reg()
>>>>>   - Remove spi_nor_write_enable() from spansion_write_any_reg() and modified
>>>>>     function header comment
>>>>>
>>>>> Changes in v5:
>>>>>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
>>>>>
>>>>> Changes in v4:
>>>>>   - Fix dummy cycle calculation in spansion_read_any_reg()
>>>>>   - Modify comment for spansion_write_any_reg()
>>>>>
>>>>> Changes in v3:
>>>>>   - Cleanup implementation
>>>>>
>>>>>  drivers/mtd/spi-nor/spansion.c | 142 +++++++++++++++++++++++++++++++++
>>>>>  1 file changed, 142 insertions(+)
>>>>>
>>>>> +/**
>>>>> + * spansion_read_any_reg() - Read Any Register.
>>>>> + * @nor:               pointer to a 'struct spi_nor'
>>>>> + * @reg_addr:          register address
>>>>> + * @reg_addr_width:    number of address bytes
>>>>> + * @reg_dummy:         number of dummy cycles for register read
>>>>> + * @reg_val:           pointer to a buffer where the register value is copied
>>>>> + *
>>>>> + * Return: 0 on success, -errno otherwise.
>>>>> + */
>>>>> +static int spansion_read_any_reg(struct spi_nor *nor, u32 reg_addr,
>>>>> +                                u8 reg_addr_width, u8 reg_dummy, u8 *reg_val)
>>>>
>>>> how about making this a generic core method? I'm sure there are other SPI NOR
>>>> vendors that use registers indexed by address. How about introducing:
>>>>
>>>> struct spi_nor_reg {
>>>>       u32 addr;
>>>>       u8 addr_width;
>>>>       u8 dummy;
>>>>       u8 opcode;
>>>>       u8 val;
>>>> };
>>>>
>>>> and passing a pointer to this struct as argument.
>>>
>>> Wouldn't it be simpler if they fill it in a struct spi_mem_op, and then
>>> just pass that in as a "template"?
>>>
>> sure, sounds fine. I would like a generic method with less function parameters,
>> if possible. Let's see what Takahiro will propose.
> 
> So, I would propose...
> In core, spi_nor_spimem_{read,write}_reg(struct spi_nor *, struct spi_mem_op *)
> that calls spi_nor_spimem_setup() and spi_mem_exec_op().
> In vendor specific, spi_mem_op is filled and passed to the core method.
> 

how about the following?

static ssize_t spi_nor_spimem_read_reg(struct spi_nor *nor, struct spi_mem_op *op)                    
{                                                                                  
        bool usebouncebuf;                                                      
        ssize_t nbytes;                                                         
        int error;                                                              
                                                                                
        spi_nor_spimem_setup_op(nor, &op, nor->read_proto);                     
                                                                                
        /* convert the dummy cycles to the number of bytes */                   
        op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;            
        if (spi_nor_protocol_is_dtr(nor->read_proto))                           
                op.dummy.nbytes *= 2;                                           
                                                                                
        usebouncebuf = spi_nor_spimem_bounce(nor, &op);                         
                                                                                                                                          
        ret = spi_nor_spimem_exec_op(nor, &op);                       
        if (ret)                                                      
               return ret;                                           
        nbytes = op.data.nbytes;                                                                                                
                                                                               
        if (usebouncebuf && nbytes > 0)                                         
                memcpy(buf, op.data.buf.in, nbytes);                            
                                                                                
        return nbytes;                                                          
}  

ssize_t spi_nor_read_reg(struct spi_nor *nor, struct spi_mem_op *op)
{                                                                               
        if (nor->spimem)                                                        
                return spi_nor_spimem_read_reg(nor, from, len, buf);           
                                                                                
        return -EOPNOTSUPP;                  
} 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
