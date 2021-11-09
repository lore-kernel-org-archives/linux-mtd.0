Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87B9C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 10:24:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77752610FF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 10:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77752610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ua9tF9LJ/bRiHsfaxMndDSukn2M5bk4+I7yS0k7QEFU=; b=2SX7TVeH7/GMzh
	sEfXiHG96ksLnYjM7B73pnb2FNZixF3Zoye0E2LLpffBSc3Fg3Kdos+HDDFSXqotjL8TYoZhhSAPU
	IKIcrvI2nqw4KI0MMVswynvEeitKJn+sJ6C0URk4omXTpC7NsEnJlp8pQ4SJCU10YRWW9/JoMN0FD
	aa8CCbyY0geviPJh+xYpB+w5zwcSwLG9lI4w5d8le2gN+swTmMu4FozCGjs4gqPwJUaRvqWZ7sb64
	6XeahzpUzuxIi3z5d2BIAU6vfqBO8uIBlnLN+gJ7W7Uo6sVgiwozS19175ooJXWidxptLzFmPrqR3
	1MxSclg/NCPLNiHTBcSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkOIK-001Vp0-5I; Tue, 09 Nov 2021 10:24:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkOIG-001Vnc-8G; Tue, 09 Nov 2021 10:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636453435; x=1667989435;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sxtVJ0N9mCrcvBqL00Za+US5l7EoeUhQSNE2nqj6P6s=;
 b=lAah67Ajf9tRcb8kdj1A695KkiO33zRURK2cALVWSFCUmcyzE6ZC7CL7
 mNMSAq9HpBBJ4sgPc3pu4LuPmtZKE7T5WqoNv24hmFYSljwm/EC2tXaJC
 ah/DFW536peZVZ/b+y24hjeqG5xNRxVXwGt/4a6HlnSSgh0/WgEX8pfcl
 rGlGexksZyZBVdHwP4qfD/H4JHjXiQNkTsQL4IBlKgyvE7Dh+jKbOlj1v
 wX/KlBkA19fm5ho7J/ftnitnNh6jugkK/pfr43KD+ZEgPt9BhLJUZheoJ
 pnvuc6Ccz+shMBIGihNrpk6D7sZrIJNQG+j57hp8Jc0Sf4lm3PAvKTJu5 A==;
IronPort-SDR: jfiu4YAbeJtumU+iEbi6NP50XkoZwKOX8JEVvVFUCPDs4jX84E9QYMmKT3J/UQiuD+YaqrkSpq
 Wfxa57MlBSx3XXzvwSvcjrtap0Kb28BGDRDx16b1Vq1SXA1iGSc+jz9/Fu/NDnEug/aH2MPF46
 AQhiNwzYOxXMi7qUE0/pgQ8unTDzh5roq3GNiBK1Q+ezxDgx2fO6YoZ7eKPBuHrj7aaxBchvGg
 CAEnMRqhDnj88L20LiCGPGe9L+CFH4HRbAkgukr5n/fY2tOkuXCVmb2Z5mo4l90NrGeNX0OhvW
 GD1ZogUy3B3/qTC0ciKWdLDn
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800"; d="scan'208";a="135956517"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Nov 2021 03:23:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 9 Nov 2021 03:23:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 9 Nov 2021 03:23:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0KE7vnQMXHjj1mBXbPuwYKaqS2zNo5muPbsj/TJYT7y0kBiVrn/dQpmLSogew12wW5kQFExEQM0N7jPAvhMAgumI2VBy98gBbdkSp6wrzfcXT1BDLDE5y4lNy+k57z1xAg6yVQOnBEvipGLFi8BTbzEn7MabhsyYrofEmksFpc8hzR4B5p95XTbPUSz19O7YNrTWWlALPpGmtD3VSTanV3h2a/ypLMhUEU1ocClzEOcb8Igq62WeZmSKrQ8pkbx81PkDw6dEEHJ90rKSQlM6cOg3cebz0MHtPLGKPPfWmTx+rV9Hk3I+CDwWZere1iXVWVulCOFWC1sXWjqRG13Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxtVJ0N9mCrcvBqL00Za+US5l7EoeUhQSNE2nqj6P6s=;
 b=bBoOwp/eZIWLkpV4uUR2V7MUU3LpyZppWzLL2YG3GSdA8beZMnfjLR4qHiz2/peBn40IDEbTB5/3YVqteyT7h61rFKg+fjFmWfpdfzdI7ugzXEFD1PP5o8n0ZG6xd8Uy8wqoHDWRUmCo7MlNMx41pl+fnorTxJZWy1CtLyzPPxnCZgTJA1Oxo23IIYcjIGMi09lIbUtueBONsbRdGoLvZd2ifp2KCO/mzQLuPPRzozBTp2uHOORvw/tKFcD4vux5H86japU45talkTshKnvtIrkKsBpr3GTe5tC8XukX3tP1+C3TX2lCef6OqE03peToNVFpLoQVzvMqSsCg+K+4OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxtVJ0N9mCrcvBqL00Za+US5l7EoeUhQSNE2nqj6P6s=;
 b=almFco+0XzPhOIKpEL3gx+cVVBVpqLHP7nZekg+CJFmD0C7E3SlWH5cjpY+Ax/YJdIsB3zvyJK8beW+CKYWau+XCEc+6kATTXUBaUm/vtW2vd8SKrefujpAdZz2iYKK0UuH2riOhtReKdxzXF08uXOC0LgYYSKcXSJiN65QsBf8=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2735.namprd11.prod.outlook.com (2603:10b6:805:60::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 10:23:52 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%7]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 10:23:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 10/25] mtd: spi-nor: sst: Use manufacturer late_init()
 to set _write()
Thread-Topic: [PATCH v3 10/25] mtd: spi-nor: sst: Use manufacturer late_init()
 to set _write()
Thread-Index: AQHX1VOpShvUzigTrkqypVDVLupn26v6/SEA
Date: Tue, 9 Nov 2021 10:23:52 +0000
Message-ID: <92667fa1-f678-0687-6cd4-8ed6d487e8b3@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-11-tudor.ambarus@microchip.com>
 <6bd3505f4c87d6b1ceeaaf51e3dfcac8@walle.cc>
 <a82dddac-e258-c87b-be9d-73f1dd336051@microchip.com>
In-Reply-To: <a82dddac-e258-c87b-be9d-73f1dd336051@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b4c27c4-ae28-4841-838c-08d9a36b073b
x-ms-traffictypediagnostic: SN6PR11MB2735:
x-microsoft-antispam-prvs: <SN6PR11MB2735314E8288A89C637D323CF0929@SN6PR11MB2735.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:459;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9wPD3w/Gewu53WvVQHf7G9gSDHMkcCTGGMxH48V4cVFBMyj1aT0IxmVtlamBF67EXpiFbt1TqpUS2DEB2SLnBQEOLo1uLB8Gmdw6dHAvVDn9w+HS0fp5n0921wRzXx80PzWDTvFUg8+iCPyqP/15PXgRM0S1eoow8SY62VPuzVeaXnhOns/2mGcjr99OM5td5y3zZK8+H6RfLXvJMqoodsWoKo1DkLoiGIDCrHRTRvSPXBTdOybOhACIG3+uB6+D65C6XuCkWZ0SYjyl+XN2NgXraR7Wy80mzsvAbmziXBsubis5TXHfBdAR1Ej7m7/rh4XaJxEmn5+iPk+IhHoZfxS2SjS7Ozr0EXtpxyvlAdpZvvFOA/n3pSLkX/PDxXvIO4IiAHpGCOu/6CZ1DHqVvc/JqeWfbyy9JGB+aVkpmrmTdELkGuWwyfK6e8mAobM18JYFoCqceHLxe4CmUtJB7h4NR0uTC724k6CWTWcWgCT7qtmHtached0iDblES3vIPp8kgTAKh71lnTtIijNwRoQFB7DCBPoTlhMn10c9DO4X8BYDibSZ8wg75KEFZqO/2PixRmLmkI8kbaKaNOwCZnPNb/md5A5gQY4lMjO2V7lFPoXr6irMmd3wgPfLrQ7qhcSDYwLj3KeUIykvqGqmfkiNHALCICsUOuga8XNzdvcspfoxWI6M8pZ+4uDHI1NH+zF3p8TQ8xft2WYRMoALX1WKNY5DqYy5dfZ+O2lJWk1cHAjpLChaR6IShGOr/dNj29YQzZF7y9rCThDMitYxtg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(26005)(2616005)(186003)(53546011)(38070700005)(6506007)(76116006)(8676002)(66476007)(66446008)(66556008)(64756008)(66946007)(31686004)(5660300002)(4326008)(91956017)(6916009)(38100700002)(508600001)(107886003)(6512007)(2906002)(86362001)(8936002)(316002)(36756003)(54906003)(31696002)(7416002)(6486002)(4744005)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjFSWFhSY0s5czhrM3gxM2E1L2JHQ2pxKzgvZHVEY2g4NjIvNUt2WTVoc1Jl?=
 =?utf-8?B?MkFBREptZkp3YjZkZStWREFIRnBFR3pZbFNqeUNsQ0NOZXQ3aUN0VDJWaTc0?=
 =?utf-8?B?VmJ3aXJNR3dJNVVJOWlOaXJielptQlpPdU9aZitJNitObGhCcng0eklFRGpD?=
 =?utf-8?B?UXhxYzBvKzk2NlhRVDlQTXZnQ1BvVlV5SDRVcUl6QmRDWm1nU2J3dUJmMTFG?=
 =?utf-8?B?Qmk5RDFyTnp3NkpnR0dsVStqdmY3UXprUitpd3NNQmVTNFJuMUNPNWFYR1FL?=
 =?utf-8?B?cjVhdTFnWnhJd29sM0E5UjBla1IyOC9XOEVBSHhmdCthSys5SHZ2dkQrK2p3?=
 =?utf-8?B?OFVFNVhaU1FtdXlYVW5odmZHY0lqRDVFem1nN1BOSm5pVHBmSmladHlVRHc5?=
 =?utf-8?B?SDYvaVNVTHZiRWVuOWNFNXlENGJVOHd3cWlEcDE0aGVKNUkyaldIWXNTblNz?=
 =?utf-8?B?RmcrWWZncE1SNVUycXRzdFhzYThuQzUzUzZsZjh6YUVzNkorcjBRRHd4S1lu?=
 =?utf-8?B?MFkrK1lya0xwNUZiTTdNSWQybGpERzdkMG5RZzBkeDVlT2huVXF2dnhaUlMr?=
 =?utf-8?B?Qkp6WG91a1hISmM0RFpnbFl5MGFobDNlVERLbk1vbU5wZk1oME5JaGgrTDA0?=
 =?utf-8?B?UmpiM1pNdFdnZW45TENWMEVtNjM3aGFvZzZZS290bUVTK0xwSjQ5Wnp6cXc2?=
 =?utf-8?B?THR3WVB6aEFaenZmV1VNamZzaUJNT0RjTThvNmZwbGZBeHpLZzc0M0lVeERJ?=
 =?utf-8?B?RlFUeUFEVm9CeE9kdDNzblNVaFRyYUYvUjVrYzVnV0FqVC9aWWpzNmhkY1Fx?=
 =?utf-8?B?RzhzK1ljYmFrSjVyTFVCTkZsWHFDS21Ya1I5a2dqYnViUTFZUC9qUVNMbTRk?=
 =?utf-8?B?T1FpcXEvTStZdlhGUEp4WUJheDgxa0N6Skp4VTJ4dTZ0dFBKdmZtczZkekJ0?=
 =?utf-8?B?bXl4S2RMOVBKUTAveWR2dG42QStrNnUwaGdQS09uQzdsZElONmhmZGwxUFAx?=
 =?utf-8?B?R1ptdnU5WWVCbHpUdHEwY0hRaWpVdFJjZEhoU0NnRmIxTlBzcG5URk53dVhR?=
 =?utf-8?B?VjEyWUc4MzV5TkFzc2hnWWwwQTRCS213OWVDSFFWWHdodkdDQXlTc1laRjBS?=
 =?utf-8?B?ZzIxS1hUcmF5cjRBS3NXQzhTclJLbWgwMytKbmJKTjVSbzMvVFBONmsrVGJC?=
 =?utf-8?B?cFFuaEp0cURITG02bUkvamxYeCtTUzFnS3d6aURoaFptWmtrSGozbjBVNE5C?=
 =?utf-8?B?UUwydDNYV2NWbms4OE5yNTdBT2tWRVdzc3VQNlFoUkEvUUtRUUM0MnlLOWo4?=
 =?utf-8?B?b0xpYzFrK3Q1R1RaNjdnOUhXbWxJcnJFQmMwb09FbjJueGlBaUJuYWF0RC9k?=
 =?utf-8?B?anpVcDBocDNwdXJQaE9qenRMSERPUnMwa3kwcUVjWE5OU25tbEY5MEp1M00x?=
 =?utf-8?B?c0ZiazNtbEtrakZBd3Y3R1pNV3RrWEFSMWd0QmRxZ29BUTZaa084SXVXbG9w?=
 =?utf-8?B?NGluekZPdlp3SnRNU1pxVERCMTBDOXVHT3o4SWRpcG11SHY1dkkwWmJQWUYy?=
 =?utf-8?B?bHF2UW1SazF4T0Fxc2xPMUJ5dmM5dGJKcXc0a2JsRVA1OFJnWUJPeEtJekZ2?=
 =?utf-8?B?cUc5aGJPaEhYNlY2ZjdhbGZsYU55WVdmdFV4UGt0SUNIWVdONFVIUDBtMEFw?=
 =?utf-8?B?Yjg3MGNQajg5cTJDVEJ3REE2SGpHNU4rWTUvTlA0NTNlZTlLZmZ1QUVtKzhP?=
 =?utf-8?B?YVJpZEJscDRVN1hpUDZQN1RDNWd0QXBtM1RhVG82cCs4cW5mazhjeXEvaFFy?=
 =?utf-8?B?UTZyLzRjU2d2TENTak53eThMRzZXSnB3VUlMOTFiQ1hvVm9ZUGYrT2p4aVlv?=
 =?utf-8?B?UFlmcVJzSnFoY0IwZmxPNGVvdVRCRDA4c08wV2I3VmZ0bXhsSFF5ZlJQSDF5?=
 =?utf-8?B?d1RGaTBObEtnN0RNSTFQd3M1NzJUWm5FdU16OHdYSDRUSCtpaXdxZ3lnSkRl?=
 =?utf-8?B?aDBZMVFxWXpYS1I5UVUrUitaeDFFWEFFb0pyNEo3Y3NxUStCM1o5ampxcHV4?=
 =?utf-8?B?Yi9nRklvNnpOYlVRMzJrQUJQT2JjQmpMa3ordGFZQWhzZ2F5UWxwNTM3RlFw?=
 =?utf-8?B?OVFxRzV0U3lqdHEwMjFsSi9hYW1nL2QvTHNGV0F6WTNwd3MrS0RXVnp4SGd1?=
 =?utf-8?B?NUlXVExtR2ZNNHZRWEV4KzBjejZsYi9HeWE5eWFvUENaR3AyQnFkNmdFNHlu?=
 =?utf-8?B?MnRtQk9xNDY5Z3JFM29Gdk5ic2VRPT0=?=
Content-ID: <895A51893962A0419A670C9A87F12668@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4c27c4-ae28-4841-838c-08d9a36b073b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2021 10:23:52.7506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4DS3Ihlf8gnSKt06XmZP++B8kpmB4JeN+ljp5azlKHFChpCoUI2xDdgurWoJE55mGO2N44HDCyzTbYeOmzq77Boy/3UzKFLi72WhdmokP+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_022356_442203_CE809662 
X-CRM114-Status: GOOD (  13.30  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvOS8yMSAxMjoyMiBQTSwgVHVkb3IgQW1iYXJ1cyB3cm90ZToNCj4gT24gMTEvOS8yMSAx
MTo0NyBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToNCg0KY3V0DQoNCj4+PiAtc3RhdGljIHZvaWQg
c3N0X3Bvc3Rfc2ZkcF9maXh1cHMoc3RydWN0IHNwaV9ub3IgKm5vcikNCj4+PiArc3RhdGljIHZv
aWQgc3N0X2xhdGVfaW5pdChzdHJ1Y3Qgc3BpX25vciAqbm9yKQ0KPj4+IMKgew0KPj4+IMKgwqDC
oMKgwqAgaWYgKG5vci0+aW5mby0+ZmxhZ3MgJiBTU1RfV1JJVEUpDQo+Pg0KPj4gU1NUX1dSSVRF
IGlzIG9ubHkgdXNlZCBkdXJpbmcgdG8gc2V0IHRoaXMuIFNob3VsZG4ndCB0aGlzIGJlDQo+PiBh
IGZpeHVwIHBlciBmbGFzaCBzbyB3ZSBkb24ndCBuZWVkIHRoYXQgZmxhZy4NCj4gDQo+IFdlIHNo
b3VsZCBnZXQgcmlkIG9mIHRoZSBTU1RfV1JJVEUgaW5kZWVkLiBEbyB5b3Ugd2FudCBtZSB0byBo
YW5kbGUgdGhpcw0KPiBvciBkbyB5b3Ugd2FudCB0byB0YWtlIGNhcmUgb2YgaXQgeW91cnNlbGY/
DQo+IA0KDQpvaCwgSSBmb3Jnb3QsIEkgaGF2ZSBhbHJlYWR5IHRvb2sgY2FyZSBvZiBpdCwgY2hl
Y2s6DQpbUEFUQ0ggdjMgMTMvMjVdIG10ZDogc3BpLW5vcjogc3N0OiBHZXQgcmlkIG9mIFNTVF9X
UklURSBmbGFzaF9pbmZvIGZsYWcNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
