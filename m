Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB262C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 03:19:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CAE4611EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 03:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CAE4611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ja2Toa3Y0p8yxiotEBiHnMp9gZMFwu9STGxUXz8pmO8=; b=4t6zKNEzGED/Ui
	NS7+sd5oD1o50ypwH9X4ZBTymmc6Wchp9RJxddJQb8euRRKHumGyF4W5f3nH206d/OI1F8fEkF/lX
	RuTkbO2NcWjf4eKmsnSF2kSSyJ9Y7FBGq0f2LlTzNFn9iG1fLGMa+wDlJX84jDAuNpGbGmqNi7XAs
	tAT+OsDyorTbGbjNfUJ1tUZ0pQ7M7vWWyaXvy2gmaCbSwBe1JsiT4Q8MRM3iPflr6PkPnFBa4XWYT
	CBk+VZujmNyuWNDyQ16rA+RJ0yE/XZzHDqJw1lksNQcWQ3VJL2n2ZSwwN8gfc0/4uHQeDobJ17lzD
	9FgMQw/U9nFuSmj2Hmyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXEUb-004xDq-Ux; Mon, 04 Oct 2021 03:18:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXEUW-004xD9-3G; Mon, 04 Oct 2021 03:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633317492; x=1664853492;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UtM0zppbE08tp7W9sZbZZt48W7ZiyCAMNLPko1rU4PY=;
 b=HNj0aq7Z0WaP5ruihOwrqG42C41iByZYPHAI6EiDqbeXKq5Vf/9yVJgh
 MKJUFY3YjXTOrKWCihBcDUPlAigVwLHqsrjQs4Ut11Eoh0qeY+cCk8gAF
 alpjVKYSJWQIF+MAVcw8CjcgUhqMj0Vf0s+0oCJusxvC3yNk5JVQHQnux
 ef339fBpfcgd6LDSpyqMgJ1DZfucyavQ2C7CHXDpB3NFNgJAJhgMuc4xd
 N9uQK9UyJRoRI6vU83syoJj8YNMSchOeizCvBmpUeL1FYG/Wd4MGHHEot
 czLhSycLv52MQBKP0TRRz/luD1pJgsq6t3cuQZs/QVHy0qg1z4r8Ujyy8 A==;
IronPort-SDR: 92zD8bc3xR8r9KOO7UfvcFnZpw04wrvwGG9TJ3nSDoTkfJmKuT0Xgz2PLsKMGnozSs7JFBwEAE
 M3tjPTMwAEdTBcezSugdEWcXsVHOYn2Yw3PZZaRFHGj7diILFlkS1fSrTRZjeixuRgTVkMq+w3
 wSFZxlPM1XHQcjPwwrRdMIjeIBP4WBgYzkhH3djKnS2xOSitcAnQe6nd8b3BPt/4gTCDEjpHKf
 GpZGnzWZ1ouaPFCMIzzCvAy+bQ0xzyr1k+4sm5POt3P0BM9mFDNVf+Md5oVMamhy44oII9Ejpj
 X+Ws/oqqRO+UF1CZOn6gVdD4
X-IronPort-AV: E=Sophos;i="5.85,344,1624345200"; d="scan'208";a="71566047"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Oct 2021 20:18:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 3 Oct 2021 20:18:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Sun, 3 Oct 2021 20:18:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhzkFR+ENLCSH72bobmqgYoE3fTMrwcr3Pw5whefvk7W/AutD9Qs6wZqQlKTjKI4SUnrSUr8NNBXzJppTouw3EwTK1LCtjBCjPK/8pL3tvG2BzVNX1uMIxSSrh12dgsW4pKBiW/UZFXimuWV3lEw3t3bAMitJD9yN7HdBk8hV97o+HuS3dTwtx6+69lFBPnOOtk5Y25t2qiPpHlEppRjp50uFOELrzSQM+3PbIC+Q4yztnSCJ+C30VNZ8TL0uexk4iSMKdiLzoWI47AWPj4ROvqcoGVnOPFl2P16jWaP+zilson9yE9fEw0oQvEaFvRLilzf398izoRKtnHH7Akxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtM0zppbE08tp7W9sZbZZt48W7ZiyCAMNLPko1rU4PY=;
 b=GMd0W4cfRd/Abk1dzNYaE9+85wUc0sDgYZSsxn4FVpDrq+E7+Xl3lPMPoPxjfv4puzCrLB9o+Fpm/GEhlHJvn9QHKwPT/2jz1saTa+uk6OTILLx8C4EwDMbzbdUSKwuahZBsZdecrt8S/hZlJZ8+SBGcLx+CzkZxXFtuiqEuGCJry1Ey/LeGOF3L8inMBM7NPpOMgUDIg253F7om9JCZaVUhCOgdLeQyEftPvR7m1yxJ4c8msrxQXE89HgNFryo7vu3rytYUZ0mE12FEcqHrIhu97ThZbrS+UIhdDG/mEMOglM8W0OvXOKHjRZBaN48cS9WfpCwSoHX7Pz6KePb6LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtM0zppbE08tp7W9sZbZZt48W7ZiyCAMNLPko1rU4PY=;
 b=WdYRUHhQYs0C/eSssbBaP+aFpSltKYFGi8QK7v+7DTslNm78gfG6wssnN3DYC4kmMm980/HzCQO6cNTEgyfvu3aQXwrAUAh6iux0Mrjv1t/q3Z1aFTlsjlEA204RWSN0bN77jSzT4PtVR+Lws5TF0qWatxBLGsLnXdvUKOjFCjI=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2736.namprd11.prod.outlook.com (2603:10b6:805:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 03:18:05 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 03:18:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 18/35] mtd: spi-nor: Get rid of SPI_NOR_4B_OPCODES flag
Thread-Topic: [PATCH v2 18/35] mtd: spi-nor: Get rid of SPI_NOR_4B_OPCODES flag
Thread-Index: AQHXuM5x3Sn1HTf2W0qinCbUxi2img==
Date: Mon, 4 Oct 2021 03:18:04 +0000
Message-ID: <d7d7b602-0c42-dc14-71f5-9b89303a0941@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-19-tudor.ambarus@microchip.com>
 <20210817121626.5vcwuluheqfqrqc3@ti.com>
In-Reply-To: <20210817121626.5vcwuluheqfqrqc3@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd2f00be-13f9-4123-b380-08d986e594bc
x-ms-traffictypediagnostic: SN6PR11MB2736:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2736F12BE5284496F473C57DF0AE9@SN6PR11MB2736.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wY3CvapPhWIGnuiGUhjCccHH/ymIv2HWyjNd3riomQV8yPVYitroaegSlVw1Ac0IglFy3rPRPg80GC5IJTObTqdI8pk7L2YtOv6q4lGCtzJdMV3eXv6bfCZkzdR+7mtKzkcsHOuCDGgqW4abeTdqt8VRsUjZKoynLNs4wW/ug7hn/ycnosD5IXp/+uN6+9cBdyWzgqWZ9bV4UChYc9HdY0pjSRTu8haB4IRhMc/jONio1v/8QULlkjCt7S2Q8/MlrIJYGVfMyI5uqyRgRK0pZvLF/HQU1DFikXC7vanso68HdviZCB7nK2b0qBxGPLUZOpYRL2sAlu3vDcrWJH9jr9n1rNpEVEF+qDOP32vvdKgFqWkH93IienY3HnGYe/AH4PAcHwtx8ROMDO8TrMLFm4efn5SXAjRuNzPHVpCeBhND2Z2IpZyiqLFPTEWjoDa/0fIn8/ntwuRIf3RMW+C7FbyjRwh3uQYyq4A306J1MD31xgXTFuQUUaWQ+6s0Et52CE7RCGgw2eA3vlDqAYs4j3nc4OESFIrQDbfO6NCSq0oUmrIeWH+DeZvcOiRYDJLetcStcOWf47XA6bkJJNGX/m4UGK/T0SxO1+GJbkw+NoT0VVS/Z469Rq8j2pVWflcKeU+I1SJlMkT6WjEV4BurW8y6DH8fHSorygnXjNBnm75hBKctyNOYmXX8mZtH9w1H0tAc+iuSzg9FF1r4rsRNSiu8bqTICz8PHYWpp3Vc02G5/ZXNeJg/U0kEs/P/ARq/4czywpHCrNLlDQsQ+MPgHl8PX34yGKHYIUepNLEPhTw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(186003)(38100700002)(64756008)(83380400001)(26005)(2616005)(7416002)(6506007)(6512007)(30864003)(66446008)(31686004)(2906002)(71200400001)(53546011)(8936002)(54906003)(4326008)(86362001)(107886003)(66946007)(508600001)(316002)(66556008)(31696002)(6916009)(36756003)(66476007)(38070700005)(76116006)(91956017)(5660300002)(8676002)(6486002)(26583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHVtR2RpeUtJR051ZEJoeEZXQXdJUldQYWlRT0pTbzl5Z2VDOUowT0RWaXRo?=
 =?utf-8?B?N3dOd3B2bFpwOCtQT0lNYVRpbTNYb1RRTGEzMTZCTU5jVVhOOEhKUVlTUTlK?=
 =?utf-8?B?NTZSdkwyQkg1ZVNlc3ZoSkM2SlVhaThaMjFWZ1lvbU9mYlJVQW1KOXFQUVlM?=
 =?utf-8?B?UTZpVHRpZWtwT1VoeE9JTFZwcnlwdHowZ2pjbFZUNkpaNUkvZnJBM3hZUFhR?=
 =?utf-8?B?UHB1ZFh3WTBMNjRjQi9DeWdvR0g5N1BDbE10TkttQmRkOWg2dW9MNHNWSWQ5?=
 =?utf-8?B?WWhsaHJGa3ZaNHpWQU1EbTZPVFkyZ1g4TkRCMGFWb0NKaFlWbW14Z09BOWRX?=
 =?utf-8?B?NFBjUVZaUUJ6cVlWd2JSVEMwa1AxMVFRZERFd3pIMXBTN2VnNXdXSURwbjFW?=
 =?utf-8?B?NnByL3kveSt2MDhwNndpano5VXdRWEpML2ZjU0g2cmpXZjlxY3ZDS0FQQ2Ra?=
 =?utf-8?B?cHkvemVrWDNIRWJPZVNCa2tQM0JnbW11ZHVwSGl1TENaZ21JVXUzK3h4dDlQ?=
 =?utf-8?B?MjBUMkc4ZVlRRk1NVWNQVUtJaFJqOUd2ZnFtY2Fpa3ZINnlSUXQzdGM4c25o?=
 =?utf-8?B?U2JWM0x0UzNBMTlzazFrU2RZZ1JSbW9lblZMRkJpRzZ4bE4zQ2MrZUNVcnh4?=
 =?utf-8?B?YjVOMS9JRDVhUnBoMFJkTEg5N2FTNlJOMWYzYmR3bGgrMldMdmxDNnQrdzk0?=
 =?utf-8?B?cTJIOFNXV1JvZ0c3ZXhpaXBNVnBSMWRxVnVDME04cHJvNWlleEo5bWxuMEdV?=
 =?utf-8?B?TkF5QjRCa0VoeEtGQXlNb2xYdXNrdmd1WVIxMm5JdHJENDEyTHlMT21nMVRz?=
 =?utf-8?B?bEJnSjFkZVluS3VwSks5bmtENk5sRjR1WGFBUllqc0g2T20vL0hMeW54U3FB?=
 =?utf-8?B?bGJlUlA3UHc5Z1VKVEF3QXdyZW5CQVBDbis0M24vOFAzQ1pRUlhxcFBHVEN5?=
 =?utf-8?B?SENQMnlKalRHR25VczE1NVd6NVllRDQ1Y3RWaTlmQjdjbThaSk1vQUY5OUc0?=
 =?utf-8?B?bXgybUZpZTI2YmJFU2J2NFkzc25PY0JCMHhHODcvWjlKdFd5a2tCWDVQb1lx?=
 =?utf-8?B?eGg0TTAySmQ3SXBkMUlYbWRIZVE2NU8yQ3dnV0lZVU5wQXFiK0Y0S2Y4cU1m?=
 =?utf-8?B?bUxZbDQ5NmlWb0pjZGVoUW5oT3FKVU9oOUJ1amNNL2Y1eGtHdTNtLzRHeXgy?=
 =?utf-8?B?TGJvT0VhWTlSTWlRRmVKS2NPWkI3UVFYYWZWUHBEcFFUNEpScGsxVWNLaW5x?=
 =?utf-8?B?dGRDeDM0R3FnK1RTUEhXZUNVMUJXRzNSb2VEUUxyeHNQTHN5V241a1U0Y3lK?=
 =?utf-8?B?eUJMWGRuYll1UEFoVnFkd2FUWGxRS2k0QzdNbjM3TEVseURocTNQMHByRjFW?=
 =?utf-8?B?TEUxZ09qVjE5ZzRZQW8rd3pwcHQwUXlHelVTbk13RHhSMDhXa0tzVFlybVYr?=
 =?utf-8?B?RUEzNmJacGExdlpuR0hhbDJIY2NlWTEvalRiek9CdGs5eFpOL2tNanRZSS95?=
 =?utf-8?B?bE9NY2lsOXlCb1FoU3AxZVZrUHRSemxYUTI3eE9ENk1FYmV5MExLSE9yWHVB?=
 =?utf-8?B?K09MeE5ERHMwZlV5bCsyUUUxUEdUWFJGaEFXUkIzN1dCY1Y2akxWOXNJMkVW?=
 =?utf-8?B?c3IyRGxBd2tYcUlSb3VheEloNmY5MUc2bEhndWorYmxNNE02OTBUU2RsaC9O?=
 =?utf-8?B?a3M2WGJBZ2dGTldTU21nTFRMU3NxcUhDTVJqT21qVDlGeWJDelJBT2hkNnI0?=
 =?utf-8?Q?/U/96D06mdh6tms0vI=3D?=
Content-ID: <556F48C781E15A46A3B4ED66F15E8534@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2f00be-13f9-4123-b380-08d986e594bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 03:18:04.9110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O5/nTiQ34pQXJsOaKDPSaOsiRAZRhqC/tTOwyj/ys7/K+B7V6ZrA94Ni5rfjdBOFnrnXCeScJqDeaDKGTn39pQQs3xbjQ3Uuxlq5OyKHjyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2736
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_201812_428173_62236680 
X-CRM114-Status: GOOD (  19.02  )
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
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 8/17/21 3:16 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>> Get rid of flash_info flags that indicate settings which can be
>> discovered when parsing SFDP. It will be clearer who sets what,
>> and we'll restrict the flash settings that a developer can choose to
>> only settings that are not SFDP discoverable.
>>
>> Whether a flash supports 4byte opcodes or not, is discoverable when
>> parsing the optional 4-byte address instruction table. Flashes that
>> do not support the 4bait SFDP table should set the SNOR_F_4B_OPCODES
>> flag in the late_init() call. Flashes that define the 4bait SFDP table
>> but gets it wrong, should set the flag in a post_sfdp fixup hook.
> 
> I like the idea, not so much the execution. More on this below.
> 
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c       |  3 ---
>>  drivers/mtd/spi-nor/core.h       | 32 ++++++++++++++++----------------
>>  drivers/mtd/spi-nor/gigadevice.c |  7 ++++---
>>  drivers/mtd/spi-nor/issi.c       | 12 ++++++------
>>  drivers/mtd/spi-nor/macronix.c   | 18 ++++++++++--------
>>  drivers/mtd/spi-nor/micron-st.c  | 22 +++++++++++++---------
>>  drivers/mtd/spi-nor/spansion.c   | 12 ++++++------
>>  7 files changed, 55 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 6a8617346764..240d5c31af88 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3204,9 +3204,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>       if (ret)
>>               return ret;
>>
>> -     if (info->flags & SPI_NOR_4B_OPCODES)
>> -             nor->flags |= SNOR_F_4B_OPCODES;
>> -
>>       if (info->flags & SPI_NOR_IO_MODE_EN_VOLATILE)
>>               nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
>>
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 625f4eed75f1..dfdc51a26cad 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -348,40 +348,36 @@ struct flash_info {
>>                                        * S3AN flashes have specific opcode to
>>                                        * read the status register.
>>                                        */
>> -#define SPI_NOR_4B_OPCODES   BIT(11) /*
>> -                                      * Use dedicated 4byte address op codes
>> -                                      * to support memory size above 128Mib.
>> -                                      */
>> -#define NO_CHIP_ERASE                BIT(12) /* Chip does not support chip erase */
>> -#define SPI_NOR_SKIP_SFDP    BIT(13) /* Skip parsing of SFDP tables */
>> -#define USE_CLSR             BIT(14) /* use CLSR command */
>> -#define SPI_NOR_OCTAL_READ   BIT(15) /* Flash supports Octal Read */
>> -#define SPI_NOR_TB_SR_BIT6   BIT(16) /*
>> +#define NO_CHIP_ERASE                BIT(11) /* Chip does not support chip erase */
>> +#define SPI_NOR_SKIP_SFDP    BIT(12) /* Skip parsing of SFDP tables */
>> +#define USE_CLSR             BIT(13) /* use CLSR command */
>> +#define SPI_NOR_OCTAL_READ   BIT(14) /* Flash supports Octal Read */
>> +#define SPI_NOR_TB_SR_BIT6   BIT(15) /*
>>                                        * Top/Bottom (TB) is bit 6 of
>>                                        * status register. Must be used with
>>                                        * SPI_NOR_HAS_TB.
>>                                        */
>> -#define SPI_NOR_4BIT_BP              BIT(17) /*
>> +#define SPI_NOR_4BIT_BP              BIT(16) /*
>>                                        * Flash SR has 4 bit fields (BP0-3)
>>                                        * for block protection.
>>                                        */
>> -#define SPI_NOR_BP3_SR_BIT6  BIT(18) /*
>> +#define SPI_NOR_BP3_SR_BIT6  BIT(17) /*
>>                                        * BP3 is bit 6 of status register.
>>                                        * Must be used with SPI_NOR_4BIT_BP.
>>                                        */
>> -#define SPI_NOR_OCTAL_DTR_READ       BIT(19) /* Flash supports octal DTR Read. */
>> -#define SPI_NOR_OCTAL_DTR_PP BIT(20) /* Flash supports Octal DTR Page Program */
>> -#define SPI_NOR_IO_MODE_EN_VOLATILE  BIT(21) /*
>> +#define SPI_NOR_OCTAL_DTR_READ       BIT(18) /* Flash supports octal DTR Read. */
>> +#define SPI_NOR_OCTAL_DTR_PP BIT(19) /* Flash supports Octal DTR Page Program */
>> +#define SPI_NOR_IO_MODE_EN_VOLATILE  BIT(20) /*
>>                                                * Flash enables the best
>>                                                * available I/O mode via a
>>                                                * volatile bit.
>>                                                */
>> -#define SPI_NOR_SWP_IS_VOLATILE      BIT(22) /*
>> +#define SPI_NOR_SWP_IS_VOLATILE      BIT(21) /*
>>                                        * Flash has volatile software write
>>                                        * protection bits. Usually these will
>>                                        * power-up in a write-protected state.
>>                                        */
>> -#define SPI_NOR_PARSE_SFDP   BIT(23) /*
>> +#define SPI_NOR_PARSE_SFDP   BIT(22) /*
>>                                        * Flash initialized based on the SFDP
>>                                        * tables.
>>                                        */
>> @@ -569,4 +565,8 @@ static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
>>       return mtd->priv;
>>  }
>>
>> +static inline void snor_f_4b_opcodes(struct spi_nor *nor)
> 
> Maybe snor_set_f_4b_opcodes()?

snor_f comes from SPI NOR Flags I guess, so probably snor_f_set_4b_opcodes if we're
going this path.

> 
>> +{
>> +     nor->flags |= SNOR_F_4B_OPCODES;
>> +}
>>  #endif /* __LINUX_MTD_SPI_NOR_INTERNAL_H */
>> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
>> index 447d84bb2128..ff523fe734ef 100644
>> --- a/drivers/mtd/spi-nor/gigadevice.c
>> +++ b/drivers/mtd/spi-nor/gigadevice.c
>> @@ -47,9 +47,10 @@ static const struct flash_info gigadevice_parts[] = {
>>                          SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>>       { "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
>>                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> -                        SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
>> -                        SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
>> -             .fixups = &gd25q256_fixups },
>> +                        SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>> +                        SPI_NOR_TB_SR_BIT6)
>> +             .fixups = &gd25q256_fixups,
>> +             .late_init = snor_f_4b_opcodes, },
>>  };
>>
>>  const struct spi_nor_manufacturer spi_nor_gigadevice = {
>> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
>> index 1e5bb5408b68..aeff8f60cbae 100644
>> --- a/drivers/mtd/spi-nor/issi.c
>> +++ b/drivers/mtd/spi-nor/issi.c
>> @@ -45,9 +45,9 @@ static const struct flash_info issi_parts[] = {
>>       { "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
>>                            SECT_4K | SPI_NOR_DUAL_READ) },
>>       { "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
>> -                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> -                          SPI_NOR_4B_OPCODES)
>> -             .fixups = &is25lp256_fixups },
>> +                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> +             .fixups = &is25lp256_fixups,
>> +             .late_init = snor_f_4b_opcodes, },
>>       { "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
>>                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>       { "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128,
>> @@ -55,9 +55,9 @@ static const struct flash_info issi_parts[] = {
>>       { "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
>>                            SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>>       { "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512,
>> -                         SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> -                         SPI_NOR_4B_OPCODES)
>> -             .fixups = &is25lp256_fixups },
>> +                         SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> +             .fixups = &is25lp256_fixups,
>> +             .late_init = snor_f_4b_opcodes, },
>>
>>       /* PMC */
>>       { "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>> index fba85efafb47..9709eb68b613 100644
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -105,29 +105,31 @@ static const struct flash_info macronix_parts[] = {
>>       { "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
>>                             SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>>               .fixups = &mx25l25635_fixups },
>> -     { "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512,
>> -                           SECT_4K | SPI_NOR_4B_OPCODES) },
>> +     { "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K)
>> +             .late_init = snor_f_4b_opcodes, },
>>       { "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024,
>>                             SECT_4K | SPI_NOR_DUAL_READ |
>> -                           SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>> +                           SPI_NOR_QUAD_READ)
>> +             .late_init = snor_f_4b_opcodes, },
>>       { "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16,
>>                             SECT_4K | SPI_NOR_DUAL_READ |
>>                             SPI_NOR_QUAD_READ) },
>>       { "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>>       { "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024,
>> -                           SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> -                           SPI_NOR_4B_OPCODES) },
>> +                           SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> +             .late_init = snor_f_4b_opcodes, },
>>       { "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024,
>>                             SECT_4K | SPI_NOR_DUAL_READ |
>> -                           SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>> +                           SPI_NOR_QUAD_READ)
>> +             .late_init = snor_f_4b_opcodes, },
>>       { "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048,
>>                             SECT_4K | SPI_NOR_DUAL_READ |
>>                             SPI_NOR_QUAD_READ) },
>>       { "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048,
>>                             SPI_NOR_QUAD_READ) },
>>       { "mx66u2g45g",  INFO(0xc2253c, 0, 64 * 1024, 4096,
>> -                           SECT_4K | SPI_NOR_DUAL_READ |
>> -                           SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>> +                           SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> +             .late_init = snor_f_4b_opcodes, },
>>  };
>>
>>  static void macronix_default_init(struct spi_nor *nor)
>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>> index c224e59820a1..72cc4673bf88 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -121,13 +121,13 @@ static struct spi_nor_fixups mt35xu512aba_fixups = {
>>  static const struct flash_info micron_parts[] = {
>>       { "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
>>                              SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
>> -                            SPI_NOR_4B_OPCODES | SPI_NOR_OCTAL_DTR_READ |
>> -                            SPI_NOR_OCTAL_DTR_PP |
>> +                            SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
>>                              SPI_NOR_IO_MODE_EN_VOLATILE)
>> -       .fixups = &mt35xu512aba_fixups},
>> +       .fixups = &mt35xu512aba_fixups,
>> +       .late_init = snor_f_4b_opcodes, },
> 
> This flash populated the 4BAIT table, so you can simply drop the flag.

I'll do this in a dedicated patch, I'll need your tested-by tag.

> No need for the late_init().
> 
> This makes me think that many other flashes might also have the 4BAIT
> table but the developers chose to add this flag here since at that time
> the norm was to populate all flash capabilities. I think we could be
> able to drop many more .late_init like this. But unfortunately someone
> needs to do the hard work of checking each flash, and most flash
> datasheets don't even list the SFDP contents.
> 
> So while I think in the ideal world we would go check each flash, I
> think this is an acceptable compromise. Let's not let perfection be the
> enemy of good.

The patch doesn't change how the code works now. If some flashes can drop
some flags, we can drop them in dedicated patches.

> 
> While we are on this topic, I find this a bit "ugly". Having to set
> late_init() for setting these flags for each flash is not exactly very
> clean or readable. I don't know how the future will look like, but if
> each flash/family needs its own late_init() to set some flags, it won't
> be very readable. We seem to be trading one type of complexity for
> another. I dunno which is the lesser evil though...

Your point is valid. This patch removes SPI_NOR_4B_OPCODES and sets
SNOR_F_4B_OPCODES in a late_init() hook, forcing the reader to go through
the late_init() function to see what's there. As you saw, late_init() can be
used for tweaking flash's parameters, settings and methods, not just NOR flags,
so I would expect that this hook to be present among flashes that don't define
the SFDP tables or for flashes that have parameters that are not SFDP discoverable,
the hook will be there anyway.

This patch opens the door on how we could handle the flash_info flags. All flash_info
flags that can be determined when parsing SFDP can be removed and use for flashes that
skip SFDP, SNOR_F equivalents in late_init() methods. spi_nor_info_init_params()
should NOT be called for SFDP capable flashes anyway, because in case of SFDP flashes,
all the settings done in spi_nor_info_init_params() are overwritten when parsing SFDP.
1/ flashes with SFDP will set the flags as:
SPI_NOR_PARSE_SFDP | non-sfdp-discoverable-flags
2/ flashes without SFDP:
SPI_NOR_SKIP_SFDP | non-sfdp-discoverable-flags
and a late_init() for SNOR_F equivalents of flash_info flags from
spi_nor_info_init_params()
3/ flashes that collide, one with SFDP and the other without:
SPI_NOR_PARSE_SFDP | non-sfdp-discoverable-flags
and a late_init() for SNOR_F equivalents of flash_info flags from
spi_nor_info_init_params(), that will be used for the flash without SFDP.
4/ individual flash, no collisions, a flavor supports SFDP, the other not:
SPI_NOR_PARSE_SFDP | non-sfdp-discoverable-flags
and a late_init() for SNOR_F equivalents of flash_info flags from
spi_nor_info_init_params(), that will be used for the flash without SFDP.

Let me know what you think or if I missed something.

Cheers,
ta

> 
>>       { "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
>> -                         SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
>> -                         SPI_NOR_4B_OPCODES) },
>> +                         SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ)
>> +       .late_init = snor_f_4b_opcodes, },
>>  };
>>
>>  static const struct flash_info st_parts[] = {
>> @@ -149,25 +149,29 @@ static const struct flash_info st_parts[] = {
>>                             SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>>       { "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512,
>>                              SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>> -                            SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>> +                            SPI_NOR_QUAD_READ)
>> +       .late_init = snor_f_4b_opcodes, },
>>       { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
>>                             USE_FSR | SPI_NOR_DUAL_READ |
>>                             SPI_NOR_QUAD_READ) },
>>       { "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512,
>>                              SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>> -                            SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>> +                            SPI_NOR_QUAD_READ)
>> +       .late_init = snor_f_4b_opcodes, },
>>       { "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512,
>>                             SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>>       { "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
>>                              SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>> -                            SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>> +                            SPI_NOR_QUAD_READ)
>> +       .late_init = snor_f_4b_opcodes, },
>>       { "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
>>                             SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>>                             SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>>                             SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
>>       { "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
>>                              SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>> -                            SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>> +                            SPI_NOR_QUAD_READ)
>> +       .late_init = snor_f_4b_opcodes, },
>>       { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
>>                             SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>>                             SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index aad7170768b4..af10833f56d8 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -259,14 +259,14 @@ static const struct flash_info spansion_parts[] = {
>>       { "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16,
>>                            SECT_4K | SPI_NOR_DUAL_READ) },
>>       { "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128,
>> -                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> -                          SPI_NOR_4B_OPCODES) },
>> +                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> +             .late_init = snor_f_4b_opcodes, },
>>       { "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256,
>> -                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> -                          SPI_NOR_4B_OPCODES) },
>> +                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> +             .late_init = snor_f_4b_opcodes, },
>>       { "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
>> -                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> -                          SPI_NOR_4B_OPCODES) },
>> +                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> +             .late_init = snor_f_4b_opcodes, },
>>       { "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
>>                             SPI_NOR_NO_ERASE) },
>>       { "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
>> --
>> 2.25.1
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
