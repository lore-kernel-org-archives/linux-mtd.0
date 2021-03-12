Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A434EC433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 15:01:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FE3664F77
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 15:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FE3664F77
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BoTF4pCGiBsqJOfLF97cBI7wz9yUlbizdCAdltpnLYI=; b=V4rxl9elrF6d0YUZbLomlChnt
	1/t2AiVhQARsJPUXiGoenQmcC2m8rcbEnCgH6YlYN4FZs82UmZv8/OpryLc04Lvhx+JZ6aRqIpbSx
	0DhGgSAlwbwOttb+ZnbF5B02bnRx4Z5hHWScMovm5LESRDqB7ccA+7uhYL8/AkgdDGpSDn4sllToS
	km6LwoYcDCbH/HJTyCww63ERPklagJSn7oEnUTHVF3oUzlkWtTkHP6vOYd46YUvYWLWK842xsDSLK
	fN7dKQL6yihQWiTh4VDDZPy4XHm0ruZD2EMqh8f/Is7lTZH99QJEsKq9AXu3xRj+83vyHzb6vcbj9
	LAeXYugBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjHB-00BidB-Py; Fri, 12 Mar 2021 15:00:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjGu-00BiYA-ST; Fri, 12 Mar 2021 15:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615561213; x=1647097213;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YANLuwanZePhdoCxZX7XBym7yrW9wdd0IiFbT7qkfpg=;
 b=sDuqm8SGmRogFfHzl1XLL303IRAj2nnY307XUi50PkKohgniDX1TKU5r
 n2tDXwmpWP6x6T/A0iLtSbvpvXQf37OXZ2JMSExoPDofLul3aBc1d3O1w
 0E2vf1eZ4KcSNikXU+/BWv2i9hQWSIeadwO2DjvuFn7uAkiC35ERgZHJ9
 ZkGLDRonoK6d9HAc4GYCsA7OGSaRfBe5TPwC3Nk2AABJXCDdi1ldQ9zgj
 Z6evIrtDOgWAVNKesQEsnWMCvAblEK2skJXcWOn60YrU0TUtZuJNB+Uwg
 vYG0CrAycLZ01P3ejI7it5fPaPKv5nHcc5cwQzTHbKy+nlR0MpsNFR5+R g==;
IronPort-SDR: CEQZ2lKte6LrEyLR2QOwUM89f/uvIDkiAD4qCdubxYT0zlbdwIUvq9FwJoQZuZLchofHikBCQR
 eHr3y8jIaaO8mOFxOlHeyTajw3Zh74Uw5R6ypIpWq6e1kDrocPdE3mTdamaRHhioixEynVf+75
 O5u3F00kuLqVIGiZw2tvwd5oMSUWCbUvakNM/LmMgOVlNj08eHU3X+UJeFFtbSmxk6EHnlCKR/
 /F9MUvmszGNYZORkHLbhMkbG8J3I0TJ00hn5qmwLkHBQqyEswovqbLPZrzpV5U18X7V2eGMWn/
 lz8=
X-IronPort-AV: E=Sophos;i="5.81,243,1610434800"; d="scan'208";a="109770226"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Mar 2021 08:00:10 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 12 Mar 2021 07:59:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Fri, 12 Mar 2021 07:59:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUFa9kRn3pYoXkqg4yjSHEv8NHeNX9spPd5TIfeX96fPqxCb+BCxHZ53PalxdAafE5qLlLuuCw2K46V3+vuMwmeyYqpBk22e3Fv6XsqrAFYez1kl2ETQE8B4bwI4IGgce6H7QJU7kBX0prNtCcxFB5oNb1DTx7sGRG5vhpyRBo9RuIGcEthhIb8Yxmet9MeDSNbFlDjo696dX43QndrPVmNr6LVG6HbCPfD69zNz/WGThDniaWU53Yh/fJOE5gDUKOAti8hpVhNEW/n0Wnl2kN4h8sA/5jSt0A3Sr1fPTRAo5w3BwQo5FbplUgGhpdHBLoqjsuC0OupW99XmQiycLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YANLuwanZePhdoCxZX7XBym7yrW9wdd0IiFbT7qkfpg=;
 b=GnLCnpOVpm/atAKeviqXdraQm8z8RSveNqJZF/80kgWiouWKEcEMuxZwL0Jd94m1BFP/7+a269IgH5TnG1iC7ZsAckt/gcRwG7s210P02Z5ihO8Q/A3jITn44PhPEUW3FAFXICcuTXmMCOedlxaP3rCvI+3qTbU68qW/4P2F3PUHpE43dEEcCek79wMNAKcpUZlK526Xa/pqUIuSotvHhONoEzLKXV/0/y8gx/hfRvViAIEDkjVJYuWGKlBxBFsX0XlMhL8gW7WSStOUhwy38WBtHofxDAo3EGgE07oYoikp4R2Mq3qQRgeBH6vdZx3I+PZEsswWGhmPtr6nym6uHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YANLuwanZePhdoCxZX7XBym7yrW9wdd0IiFbT7qkfpg=;
 b=mfoG8pku7xrr2PcYqatc5MB0eLgqa+7OuZSTkzkoYkF1RjXNGKK+2mwsPpd3+nzpBbawv26Nh4F9AY6zvnjeZwcUJveQ2vh1Len1h05O2VUWIJ0k4KPYjpBSVytP1h6OT4f2tLVeaoz+ao9TnT6srIAVtA4dpEWI/MqSzGTVX0Q=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 14:59:54 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 14:59:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
CC: <nm@ti.com>, <kristo@kernel.org>, <robh+dt@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <broonie@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 0/6] spi: Add OSPI PHY calibration support for
 spi-cadence-quadspi
Thread-Topic: [RFC PATCH 0/6] spi: Add OSPI PHY calibration support for
 spi-cadence-quadspi
Thread-Index: AQHXF1BboVlY5U/87kSEhShnaEXyTw==
Date: Fri, 12 Mar 2021 14:59:54 +0000
Message-ID: <23e0e98d-6acf-7755-98d0-0edb6708fa8d@microchip.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <b9450a151cce89cde47b4d6a76c74b32@walle.cc>
In-Reply-To: <b9450a151cce89cde47b4d6a76c74b32@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 130f1cb7-f675-4b64-cf2b-08d8e5677ef3
x-ms-traffictypediagnostic: SA2PR11MB5211:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB52117F0EBA545804D1CA6C77F06F9@SA2PR11MB5211.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wmJKbMuI5/5WRp1MFKP35sX6fbQyeJ0YL3xA/JZGbjeoOZTdSWPBuX1E4JZaPLwJF14Ktv9XboaAGzpgcI5BBBFxRmB/Q2uXsBSgns85NgMiLGCnQ0aPKQw5X8AtftJQq0HbjMX/jd6gEvbmPhz+L5ee1cF/zYlVmTBPHDl0m5EY0DXGyQmOvBTKYgzfj/UpodhVXEcq50ha7sDuzMyyAA7KEydYhoDpkZarjGbWyQDsgRN5U21Rl6hKOApVmEneuuMfsVSh4PXINeCqe2TXTUYcDnSihEkw93sXP9EXO46g8fzy/8CcpF59EsOcMnVhX/P4rkSn1YayfgerSqJnMEhMamv7N0GjMNr5hgGhghCQvm3OZw3HRImf7cIjw2/OOkO4dPK0A2pkHsK0+Zb0E+Zl6l3LPxhMMHyLXZj/G0HbjAKA5GIvlMo0QgCJRFHiQJj1Kj1GCdM+1HbcvEU+VcY4f/ocq7ayjPwrM4yvE6NeyBTq5OdI3ApMR65yHsYdj8gzI9gOfqfdXZMzX7nE3thw35oytdKAqjzNORJ3DiPqWnEEPAnLgfAg15CxcKtECBrjffOCjUoeEAIbPaY1gzXXX3COgmBCeLP9/tIxmBqzH7etqAteviVSuIdmdHHQ8rY06v73amYqyoiSLpvFew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(366004)(346002)(376002)(396003)(478600001)(186003)(6486002)(31686004)(53546011)(6506007)(5660300002)(2906002)(54906003)(66946007)(66446008)(64756008)(26005)(110136005)(66556008)(2616005)(66476007)(8676002)(86362001)(7416002)(8936002)(36756003)(316002)(91956017)(31696002)(76116006)(6512007)(71200400001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?a2MreldIT2ZlN0VESnBWS2k3cDFoR2RxSjNUNzBxZFYxSEJ3Z0c5c2QxSElZ?=
 =?utf-8?B?dUJPck8zVjNwMmNGajBtejRmVnhJZjhGMVR1MjRSb1J6T3dUNmNQK2xCbFVo?=
 =?utf-8?B?RDhxejBYck1LMTlUUnFoZmhidUxvcXo4NUI2dHcvVVJic0tsK29jMjZyWU1X?=
 =?utf-8?B?L2dINEJaM01qZUdQNjRNQjA3N29QUWNBWXJpaUFReEVRdG1Vakw3SkZNUmFq?=
 =?utf-8?B?WGJLMSt6TXE3Q1BiQkluSU9NNThoeXUyVUNJUFMxTkVyM0JFMmVsY21TVjNC?=
 =?utf-8?B?SlNodUhVaFBoTmVmbVRlQTZCSDY3cUlUSEZCK2F6M3RXanNkUE9uZEcrQ0tW?=
 =?utf-8?B?U1p4NHE3TTQ5ckJHaXV5ODNTajc0RFFKaEcvclphOGpaWGJrUmdXMG9FOFZQ?=
 =?utf-8?B?VDZRb0xpdDQ2Ym9kZytvaVdnRmxzQTNVcWxDYjh0VG5XMzNheGFOZDRaN05u?=
 =?utf-8?B?M0pKWDBTOHFVZ2RjejdvQzhwU3FqV05DdCtmemptaXhyNjNKMDh0djJuMi9X?=
 =?utf-8?B?ZnpSS21ad2lISmtPYWdvdytuQ2JnYi83ZWp1cGMyWGR6UllHUDhManlacXJ6?=
 =?utf-8?B?UU91WStnVXZlUVRuKzFkanFEYlB3SkJ6UVBIUFBMZ2VFT0lJYlFUS2l0RFlU?=
 =?utf-8?B?T3VNV21kTjV1TzVWNDZpQmRkOHI5QWEyb1pvV0F3RWZlQjkySE1NRURTcisv?=
 =?utf-8?B?eTl4S0h0M2I4N3J4VThWSEFGQnErbEpCcWQyckRzSDB0QVVMa0RGSFdjUUp0?=
 =?utf-8?B?WnA3aGcvWjhxZThxaHYwMUVINzJrdDdEVUJ0OUZyZWFYY21IMGQyeEw5TGxK?=
 =?utf-8?B?RHZEUGtyczkxOUpTckN6OHRLaTJKTERyWmhTMm9LZ0hvVWV0WUlLV0hvdkor?=
 =?utf-8?B?NW1WMVcraEZneWp1eHNPNlI4SGtQbDc4QXplOWNmdWp0OGo5MFR5c0prU2dC?=
 =?utf-8?B?NFFMZ2Yxckd3Skc5ak9Ib3MxNEgrMkpyZGhYbE40MmRVL0Z6a25wQzJpSms0?=
 =?utf-8?B?R3BSdzlKK0hnbW1YYUlWU1dNeXBCWFdBMTJzOVhrVWM1ZXR1RU1pOFJ4MVBa?=
 =?utf-8?B?WHhXTERuSnk2L2duaE9kdXpzeGJnVlhkOXErTmQzcEVDSHNZVTBNSGlmRnpL?=
 =?utf-8?B?Z2JnSFlUU0xBZEhOd1doQ01rZFVKa2lKZzViTWZDM1VwMHhoMW9WVUVnZDVD?=
 =?utf-8?B?cWN0N3pNS2F6UFR4THdleHpSZVowc1JOb013SFpaRDVYS2xnMUYzb2EzeCt3?=
 =?utf-8?B?T2R6dnMvUU5GUFlGcVRPOGlQTmhrTWFTd3d4bnVNV3FvUnVQd2JZelBnYmlm?=
 =?utf-8?B?YmlOTU5Xci9DNDhnajZFM2xMaEtBajh1RU83dldLWXRwOGtQdVRJTUJOZm5U?=
 =?utf-8?B?Qkt5WVN4NGU5cGlubWpqeHhjQ1RHK0lydFBGYTZmRjNCOUZmOVFva3hROWRa?=
 =?utf-8?B?QzhyOUlwQVg1OUw3V1UyRmUvR28zdDVLd2wraDJnNjRjRmttRmJrMVY5UjVE?=
 =?utf-8?B?dVdldEpmclBhSXVSTENvSGg1M2tjTDU0NGFZUTlReEdhZEVqQ05nNjRJY1Ev?=
 =?utf-8?B?Uk9uQkRTb1RpNWhLQ3M2UGJEL3FYd2x0ZVhRMnJvUExBQ3NrdUx0V1dyc0w3?=
 =?utf-8?B?L25zbDlpZGJIb3p0aFVRdkQzRFliYUxXZmV6OGpRS2orU3NybTFaNjkrODVJ?=
 =?utf-8?B?ZHQvanROcjVBMmtSR2J0MjQ4RFBxZCs1Y1pRYWhxVFN0Mm1XRXZ2UTBzRzVH?=
 =?utf-8?Q?M6ewN8xN4fk4G7NqSg=3D?=
Content-ID: <E015DD47C9431B47B20452A5485BE07C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130f1cb7-f675-4b64-cf2b-08d8e5677ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 14:59:54.6428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Bxwx+nXHU0LqBZjrPkDpXnvSQCFc5yY+rqv7zBQ6XhhR40yLnXNfcBRXdxF/UI1JssD/iE4U7Vmb1Pn43W3keEn1U8b1fRJv3VXqd2CgTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_150013_351915_D01CF75C 
X-CRM114-Status: GOOD (  18.04  )
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

On 3/12/21 3:32 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2021-03-11 20:12, schrieb Pratyush Yadav:
>> The main problem here is telling the controller where to find the
>> pattern and how to read it. This RFC uses nvmem cells which point to a
>> fixed partition containing the data to do the reads. It depends on [0]
>> and [1].
>>
>> The obvious problem with this is it won't work when the partitions are
>> defined via command line. I don't see any good way to add nvmem cells
>> to
>> command line partitions. I would like some help or ideas here. We don't
>> necessarily have to use nvmem either. Any way that can cleanly and
>> consistently let the controller find out where the pattern is stored is
>> good.
> 
> The NXP LS1028A SoC has a similar calibration (although there its done
> in hardware it seems) and there the datasheet mentions there are flash
> devices which supports a preamble before a read function. The preamble
> is then some kind of learning pattern. Did you see a flash which
> actually
> supports that in the wild? I can't find any publicly available

MX66LM1G45G is an example.

> datasheets> of 8bit I/O SPI NOR flashes
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
