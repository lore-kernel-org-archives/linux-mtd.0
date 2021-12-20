Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1862C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Tc7UTFTeCMqAwfvZQxy3DeEhlxQevfhQaUaqhV13sk=; b=eEFaSl84vBPu1V
	MJF41g3bAULcS6hp//p1dtg2oGygAbrFPvKPuSFGMtCP1yXNS/vxHRzD9KSFoDg1c0vmLFb2TQJKF
	gUCblaHFRJD8alAr6b01Q98SvVfAEYJT0iI1g2Zapd1EufTs9CGPAJqlSHVCHZyKv8IVySRiMMQlD
	60TcaQaa4/HB8/VaVdpvOB+Yd2O2Gr8XSuvBlxE23kfcRrY4hbl14K+F52NlW6f3hrU0PI1pX2m0o
	Cir6x7W+OciE4cy2tyojHSH0PXakXzBcXL096tgompJ8rcrsrOTl+Dc541rEMrEw4JUSer0pZRJpZ
	tnxnM5u0LKHmhBO3jgaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzIdC-002WMf-KR; Mon, 20 Dec 2021 13:23:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzId9-002WKx-Fi
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 13:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640006587; x=1671542587;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KV9UyJWGvTeGp8WSlFAg4k0LolWd6DahPykGswiywog=;
 b=zbESpQ+ds/QuzrLvD1K9k4gGFfRaPcrHqSZNW5WELKvPfOmtxopK1Jjr
 AFxhrc6jMqVn1V5Y1QuQke7Z98Z4tjS7K4w/o2RWWTxIRHcHImqo6XXfC
 WJJBAJ+RztNaPp67pUibF6KGMB1oexaoF2Gfn4WEkN3UqLTdTjtOs5KNF
 xGEU1F2iqcekehtzUlHIsjLRS9M9x9QJvG8C9fIM3BF5kmqe0W5Jn0qB/
 9WjVhZ45eybpJ9KP/2hx+t+hM9ophQUzrLD8pv7Jgw3ZNWits5TNNbksO
 1Qwq1ANbIFksMplruKIKAq0uaydUeWXC4Vy8Cc+hpFc6PFh2YoYbYO51R A==;
IronPort-SDR: /hr+1eik5yALDQ5R2PiUwyC8k6QVWrjTJbNAk9zzrm2JaWW/hDlDenYhG4axgGmIQv+W6hXN4R
 4lLT8WO4zYHlw0o7IRLSnAQGEPParvfaPPaxIwxc8in8xvmYIRp99X6vypUVyZkahmtoC9Cm2p
 42rhUsW7H5mwxnTrxLvxjlUQjiAq1XOJqG1EZ8LtMOiGNiR0hFYQ2psF5JUPpa2SBLBgY3v0Ly
 4/m3SR6raqXZC3PoNTnCAHW4fQPJJRu4QC5auHR0eq2Ch9Xs704MT55chrV5aY4/AjMgf8bLaQ
 s2gxpDG11/xPFqMbP/SqTiqX
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="156102752"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Dec 2021 06:23:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Dec 2021 06:23:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 20 Dec 2021 06:23:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oN+UIlehER2HfDeyAMPOx5PDbJbsv2IYSriZWC6BTo2g0wh1OWSqKnbw29TFFvOoa1hCQGf/d0d59RXNm7aQTGbEm6BXRPg1NYJPeiiUm4c8n6Cw/BaIpwIPO9xbwr+hxEg9wCY5N7NH+04GI+UC2OnYGZ3BK5yX2ru/BnGgMGcmfmaz55N1PpCCLb1mi/6PS6qpytDV5gouO7YRRT5yWHbGmqh0kJLQot/TMfSTapjzfREz+6lfN55MMZnbmwxFoc1ZWalcfT6DWXbmq2FjAu1rdd/isv1rY7QLRhn6BrOdlhztcyzmTvQlnDprgcpzuPfwA1Ji5A0sh1M0UGsxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KV9UyJWGvTeGp8WSlFAg4k0LolWd6DahPykGswiywog=;
 b=O8GcGDa43CO09RBYWLL35pBN5sGCjsujQttHixlaUhdk8sFNUoyshj+YItIVno+0Be1kXQ3TmnzS0ea9cgmaum8SxZTuOABOVki2YMxQvmeYO1m5viFI0pyxNEecFOtEtIkH30tTyeQZubUGqf13jzTaQOPHvulZx3brHyLZZDjUhhlJByyWTn4OMvyeBZrQz/lLWga953eXNPnyceUA6hXg1OvbMSd5Br1ALzzCwycQVD3Yqe3fvRjjD3zjXcG1KyaoUgFt8TQ83Es7SWSSKVbuWfde5+hI2SJtEMl1rS+9Tbwyq0oQign2Ltv1MZPKtbGZAjgUpuAbIctlEyO1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KV9UyJWGvTeGp8WSlFAg4k0LolWd6DahPykGswiywog=;
 b=fCruElRrDDTbpjYJVXAwZXD56saWm2bHrq4Y9AOSNfDHhSjL7mffJ3aBi6giMNoEOfPvwyFSOV4yYVbHjMk46+cR0tDnTjLNvqS0TqNOrmVApaYy6/8AHpfJfypKnIl1n0ep5kOAqsYbbViNWFwByDxzUeHz5u0u6+DTOKVga+k=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3104.namprd11.prod.outlook.com (2603:10b6:805:cc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 13:23:00 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 13:23:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <zhuohao@chromium.org>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: core: Remove partid and partname debugfs files
Thread-Topic: [PATCH 2/2] mtd: core: Remove partid and partname debugfs files
Thread-Index: AQHX9aS1k6kqqdQxpESqT7d3Zxxaog==
Date: Mon, 20 Dec 2021 13:23:00 +0000
Message-ID: <25999218-8985-03fc-c53d-21bd2a25d365@microchip.com>
References: <20211217122636.474976-1-tudor.ambarus@microchip.com>
 <20211217122636.474976-3-tudor.ambarus@microchip.com>
 <20211220130743.jil62qbyb5lgds6p@ti.com>
In-Reply-To: <20211220130743.jil62qbyb5lgds6p@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43f3d2b8-bb33-4ad5-d460-08d9c3bbd81b
x-ms-traffictypediagnostic: SN6PR11MB3104:EE_
x-microsoft-antispam-prvs: <SN6PR11MB3104B33A08F29B6DF0FEBCA6F07B9@SN6PR11MB3104.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0f9rIXbsv8O9IlFWgYJ6qSuRCh7Th60Eqj6IspmFVgD2n4zdgdSC3bo8HEBeQyUBJFTFz4E79ECVR1Xr2fIt6iQN8xQ5S4a2w5M6FNLqEghJcS0HDH9nSxUlCAl3C4Jku4J/uPUovuFb+WJ/kgxUeym9YGrT139VZpEIqxK5N0/UGeSntOpZ+pfde/5wDnYvuARqnsYObL2x1EbAgJ9Mae3JHY8MYwmJdtdwAaACYyIgB182Ir5a/1pafZ6DWXFnGe7OiwKi9o99gBpNDAvvw0/QYLpt2GWa0Jm0etYnnwL5qOGbQfMb3FFpYzKELkeLPZMhpX81mg9buwHre/+U2YcDmTGtsATZK2lLZqLHQk6/kG3zgIeQaTaZ0ozMDf7rYP9HU5lKC9z05LNLKIPbr4QHDk08BFQXiq3QoyT2MwbHO+QvI2byvaa1kDN5JGAtiaJuD8DJ3YSTQknLJCuyK7yw4OLEciaFqBIBGA2Nfbu3tfDkEBUKqoaAC6DYYJC2tUL5LIcjRO1+8AhzKVI/ogC7y8pIHwhwYT+K5EXQCz9qC/qQdKC6dPepaKCpM1MnGRZaMx6GaZm0IHXrPLMdd2q4vF2atAo14c5Iz2uXSAetV+aWhZTbbomZAQdaM/8pFm+xTf3jRgnu2jlTzDjgENOpmXB49KdHsy/kmkYElKEMDWiN11q+wlYhd3ZCmDlqkBD2fU365nVoi9P4melx64zVmkqzXUyY97Lsu+qnBALgAllATywVjue6NvqfMhadOvx+oCo8XXW+br8FbIJOvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(122000001)(83380400001)(8936002)(31696002)(316002)(6486002)(53546011)(5660300002)(6916009)(38100700002)(2616005)(186003)(8676002)(508600001)(4326008)(38070700005)(26005)(36756003)(31686004)(6512007)(6506007)(91956017)(54906003)(76116006)(2906002)(66946007)(66476007)(66446008)(64756008)(86362001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ykt0dTlQNDVWREJQZzQvOUM4SWh1S2NuTTUxY3prcWkvWW54LzBOam53a2Iw?=
 =?utf-8?B?OE9iVUlyZ0VBTm1NNDB1MzBsRUluUlJaY1BEK2JsTDBTL2p1NUVIL0hpZkgv?=
 =?utf-8?B?MjYrWVVPUUIyUStZek9pc3ozT0NITXQrZzhxakZ1NVdzdkhvWk1DQlJnNG9r?=
 =?utf-8?B?eW9PS3JKTFBxWVQyT3lpTjhjNGVHUXJWRGZzWW9GOW1CMG9PMjFpNGlPS3Fp?=
 =?utf-8?B?ZEhyb083ekQzQzFtbWpRT0M1UGNPdXhETUJUR0pPY0kyN21IczFEeG9zdUpC?=
 =?utf-8?B?WWRueFVKcVFIQzVpU2NqQ3JDR0FHclR4cUs3Wmhlbk80aHNrWHRXNkxvSGYz?=
 =?utf-8?B?UlBUcjFoUGdjK2M1WWxOVUdPbmd5TCtzaTRuRDBucjhCRHJxcFhiS1V1dnhE?=
 =?utf-8?B?aC9KZ3dGZzFhK1dHL3N5UXV4aE56ODJzMjNzZjZPVnJaUEhTL2hVVGV3bUgw?=
 =?utf-8?B?VzVGenB4VVhJL0hLeWdNUmhlVnk1c0lybnFXMnN3ank1bzBRMFkwbzAvUjA0?=
 =?utf-8?B?NTRVN0phYndSb2JSUjVaaUNyeTV3WE50ak5XenMycXFCWXdxZDdBSUZnQkRq?=
 =?utf-8?B?ZGxTcjlxV01jUjR2RUlpRnVESEVBMTFUcDRhRDkzZTJHUk1rMlFDZlNlS2t6?=
 =?utf-8?B?MHJ4NWJOdmZoSGZTZDNtbGFnWWFUaHRYdjV2eEVoVCtDVDd2ZzZ0NFVHaVBH?=
 =?utf-8?B?VlRYeXlPTjUwT0R3eGhYTkFBZlZ6b0dvMWpYR1Q0ZTVURDBXUU9mYjRKaGV0?=
 =?utf-8?B?VVlCN0hzZnJiOUtwWGZiVE5ZclVObFdDR082MTdQcmliNmQxVThNUFJhYVBT?=
 =?utf-8?B?Yk4zVGk2TXhhUGx4TlNTMzdwM3hMNjZuaExJTkZzZTd1TWVQSWJMbFowblNT?=
 =?utf-8?B?TzFUK3UrS1RpRFdWTmZwTXJjVXRzTHpRYTA5RkJXNEloaDBURFNEUk4yTkRw?=
 =?utf-8?B?SnA1T1RPRWFCMGlvc043c1VlSXFqWXF4M2ljVGxqa0FMZHVkSW93K09JdzFt?=
 =?utf-8?B?OEp6QXc3WDZHR0ZnNkxZOEhuREx5cWo2WmpqcGpDVUFYYnI1SEtCc0s2L1RP?=
 =?utf-8?B?SmlaM0J4VjFlNU9McUFaaVFwb3JkY1dDR2M3QjFXUlkvQUJVRW9MRUhhdURm?=
 =?utf-8?B?ZTc4SjZMN1lkb2p0MDZXMmVjT3UxVEJLNWRrUXhsNzUxZ3EyNzNzWEpRWm16?=
 =?utf-8?B?QmZuaWdzd212eGFUODhGMEM1a1YvMUo5STQ4Nis3d09INEY5aExKNFp6azF5?=
 =?utf-8?B?OCtVWmRLSXVKRUFKZjRJY2t6cW80UjZBSmRocWpOV0ZGNktoQWQ5ZTZCaDNF?=
 =?utf-8?B?bGhLYTZSVFdkcVVhc3VqVDhqQnVmclcvdHRzS1B1ekNja25BM3ZDbVJCK0ZF?=
 =?utf-8?B?b3htRlpZT1FJRGVHbkJqUUNoWURDR2JOcEFVam5tTGREY0NwQzNxemcwT2x5?=
 =?utf-8?B?NUpKbDNnYlBIK1V0ZFJJYkZ2UmJNK0hyOTlLc0VjbzQwQm1kdzdVc1A4T0gx?=
 =?utf-8?B?Y1VqT0EwcG5Bb3ZYVUpMekhJMzZYSTFDREpsbVhENU5LMWFoY0RIWGFURHFt?=
 =?utf-8?B?TXF2S2VSRVlabXJCcnpKdzhXZnQ0NjVVMzFaMHlseE9NcC91ZDlCYTZOcENv?=
 =?utf-8?B?MEltK0tiOWxyRWNtNkxXVnY3cWxFUUZhaVJWczMvcG9kb2VvemQ4MUFhWjdL?=
 =?utf-8?B?bjFVanB5bStkemZDZFdYQWtDOEVaaVZVeVFuZS9qUCtVZFRzZVFsSlRXRnBs?=
 =?utf-8?B?Ti9YeDdsUzRLYk5KRnFKUDJKN05nTWl3Z2Ywa3ltOTdqWE1vdlVQZ3RoYWI3?=
 =?utf-8?B?NVJNbnZSR3JlTk53c1FTYVdaV2R2LytyMkV3MkVncExrSGdZd2FORGJJNFQx?=
 =?utf-8?B?N0RQY3BYUXR4aEdGYSs5TlZXSk9DeVd6WGUvdkZ3WXRaY2ZBUXhjL2psRExZ?=
 =?utf-8?B?TVdoV0pUM0dha0xHTWs2ZWkxSUZjZGZiNEtIeHgxcU9IbHEvOGxxc2xyYlpR?=
 =?utf-8?B?K0NNUS91cDNFdEQ5TnJQcGl6MmFEK2VGbHdjS0N5Qi8vUVA2L0xpYkx2OXFj?=
 =?utf-8?B?ZHoxdlgrN2pUK3drYVJyRlVIQkV6NjBQUjJLaDY3akFkT2dlQjZMK2d6VGhH?=
 =?utf-8?B?OHo4VFIzbHF3YUZJOUt6U3hBc3hJV1kxcGhDQzZkSmdtTU9pRHFRRjFEMDlN?=
 =?utf-8?B?QWg2b1ZpUWNKdnBZTmNIbUZzamNwQkQyMW5naEk2OXdVMWc4eEFrbmpPT3Fq?=
 =?utf-8?B?ektVekNvV25hSTdvanNYY3lwck1RPT0=?=
Content-ID: <3CA07E9FC629EE4A91F72212317EBCA9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f3d2b8-bb33-4ad5-d460-08d9c3bbd81b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 13:23:00.1061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xbca9dex3e8kWOcwPsLE9lfJHV2mHRLwYqO3eULBibCj3SdS8nOapDoaeYS1pb4ae8tMLSAGM9ka6DpnI5VgUzZp1j3YiAjo7IySd9FK7zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_052307_642791_224E7AE1 
X-CRM114-Status: GOOD (  18.41  )
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

On 12/20/21 3:07 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 17/12/21 02:26PM, Tudor Ambarus wrote:
>> partid and partname debugfs file are no longer used in mtd, remove

s/file/files

>> dead code.
> 
> Hmm, spi-nor was the only user? Quick grepping does confirm that.

Yes.

> 
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/mtdcore.c   | 35 +----------------------------------
>>  include/linux/mtd/mtd.h |  3 ---
>>  2 files changed, 1 insertion(+), 37 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 9186268d361b..1977755fc955 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -336,49 +336,16 @@ static const struct device_type mtd_devtype = {
>>       .release        = mtd_release,
>>  };
>>
>> -static int mtd_partid_debug_show(struct seq_file *s, void *p)
>> -{
>> -     struct mtd_info *mtd = s->private;
>> -
>> -     seq_printf(s, "%s\n", mtd->dbg.partid);
>> -
>> -     return 0;
>> -}
>> -
>> -DEFINE_SHOW_ATTRIBUTE(mtd_partid_debug);
>> -
>> -static int mtd_partname_debug_show(struct seq_file *s, void *p)
>> -{
>> -     struct mtd_info *mtd = s->private;
>> -
>> -     seq_printf(s, "%s\n", mtd->dbg.partname);
>> -
>> -     return 0;
>> -}
>> -
>> -DEFINE_SHOW_ATTRIBUTE(mtd_partname_debug);
>> -
>>  static struct dentry *dfs_dir_mtd;
>>
>>  static void mtd_debugfs_populate(struct mtd_info *mtd)
>>  {
>> -     struct mtd_info *master = mtd_get_master(mtd);
>>       struct device *dev = &mtd->dev;
>> -     struct dentry *root;
>>
>>       if (IS_ERR_OR_NULL(dfs_dir_mtd))
>>               return;
>>
>> -     root = debugfs_create_dir(dev_name(dev), dfs_dir_mtd);
>> -     mtd->dbg.dfs_dir = root;
>> -
>> -     if (master->dbg.partid)
>> -             debugfs_create_file("partid", 0400, root, master,
>> -                                 &mtd_partid_debug_fops);
>> -
>> -     if (master->dbg.partname)
>> -             debugfs_create_file("partname", 0400, root, master,
>> -                                 &mtd_partname_debug_fops);
>> +     mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(dev), dfs_dir_mtd);
> 
> What is the point of having creating the directory if there is not going
> to be anything in it at all? I think we should drop the entire thing if
There will be files in it: mtdswap_stats, nandsim_wear_report, docg3 files.

$ git grep dbg.dfs_dir drivers/mtd/
drivers/mtd/devices/docg3.c:    struct dentry *root = floor->dbg.dfs_dir;
drivers/mtd/mtdcore.c:  mtd->dbg.dfs_dir = root;
drivers/mtd/mtdcore.c:          debugfs_remove_recursive(mtd->dbg.dfs_dir);
drivers/mtd/mtdswap.c:  struct dentry *root = d->mtd->dbg.dfs_dir;
drivers/mtd/nand/raw/nandsim.c: struct dentry *root = nsmtd->dbg.dfs_dir;
drivers/mtd/ubi/debug.c:                debugfs_remove_recursive(ubi->dbg.dfs_dir);
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
