Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66E7CFD37D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Nov 2025 10:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u9By98yx18mnQgBjxvLUGMQAeR6rLnIhYiO/B7oW4k8=; b=mZtKnWQ/rzd+Bc
	8FG9x23jZ7oMsZDldjWeXJT2Z5SNqJj9BgAX8fVM4GSTKMRYaEWbAxMlQIdwH2RRIfNV55BgCVrV8
	3CEtgjCPrq39/IqNRohbqzYK5hRrbvAdDgf5fUDVhvqHVM8Fwm5SYFHVpZ/XTCymaId4KrPLFU6ZU
	R+YfilvY++u0d4nK3gQskdfdIkiz3Vmh71LwVKqBWIXA99S0e6RIl+mApz32O174iKLdwijoGA9s8
	FidXMMkGDRyNmgtwkdd7HT9QjDFFucvy9RWsA6TO9b5YqDzMPhfXGZdOThvJV0JInzMkan80+P/tA
	vAgRC9wQYx7DkKLvUabw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNq2c-0000000D6hI-2ytb;
	Tue, 25 Nov 2025 10:12:58 +0000
Received: from mail-italynorthazon11022118.outbound.protection.outlook.com ([40.107.164.118] helo=MI0P293CU004.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNq2Z-0000000D6fV-0gCc
	for linux-mtd@lists.infradead.org;
	Tue, 25 Nov 2025 10:12:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8yYfmWefSUnXWRiVyEt3BTFjK/ynw7pGUohVVj4NQoogFOHLqP51ljElsuYF00Q8+rnJy9S20z2kDT49tcWy1kFHQpOCRuXlgMH6RiGoz1ElNWb3yhmBguiJCtgS2Qhx9tNB39yntmoYwusXvDdTYnYFcMz71iTMM7IqI+6/MCvcL5rrrAhAKNUNhU/PxxZxjjr2C7jXRRoJOv6mQbpO+o52wLrtY4O+n8kWA94n5yYTNSSU0qvzee6OqHEZaOCcUOLySuDJi3A1K5PyF0Bk0T/5OPeSpiqmPl1KApNRUoq/xWFJ/MhaA1q5iaVoD9eNMpk+u6RxsYWTI4EZga1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5avkxfDzrPWJ6c3DcMiARhCxMDd7Sb17NV8aCaYkYuM=;
 b=DBgwTxg8grIEqo7rHg8HKphpJC3tWwNPlhm9m5ChpbmNiDS9NoRdrljBj/jeSdFrMbtvsUjVM06T1VAcnJAVA9pTvIXdO7uQ10dzvcLjo1I8Hrc5cEZgv9ySzhAyuHn9x9yHvpc/iGjWv7qmQK8Y/P9d42qyhoNgYDBV05z7my2pc9q5p8quiR41qNC9qJ4MZSDkrI/yW2gC889ir/c5aTbAOYx/spacvsX7jZTZCAaHjyxWmzAeZyvImBfWyX7GlvbG3BDID3d2rAm6rdovI7NwD3dFNgbd30lpD7ad3tLC5AfBG0Uj91s3sDgLulil7iGqiVAWXOBX/vvO58r4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dave.eu; dmarc=pass action=none header.from=dave.eu; dkim=pass
 header.d=dave.eu; arc=none
Received: from MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:50::6) by
 MI2P293MB0076.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:4d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Tue, 25 Nov 2025 10:12:48 +0000
Received: from MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM
 ([fe80::aa50:e6fc:e616:391b]) by MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM
 ([fe80::aa50:e6fc:e616:391b%6]) with mapi id 15.20.9343.011; Tue, 25 Nov 2025
 10:12:47 +0000
From: Andrea Scian <andrea.scian@dave.eu>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: mtd_nandbitserr and seed using pl35x NAND controller
Thread-Topic: mtd_nandbitserr and seed using pl35x NAND controller
Thread-Index: AQHcWIitaJPLR9cXY0GsgWcvgoifgQ==
Date: Tue, 25 Nov 2025 10:12:47 +0000
Message-ID: <MI2P293MB02644E845892FAFBEC01AD5997D6A@MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
undefined: 5030455
drawingcanvaselements: []
composetype: newMail
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dave.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MI2P293MB0264:EE_|MI2P293MB0076:EE_
x-ms-office365-filtering-correlation-id: 2b5533e8-9427-4939-335f-08de2c0b2f06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VXIxTHYvUVdBNWwzdUM1R2FMMTN0YTV4cnJ0VmFiODFOQmVtNGZ3ejhwY2Zy?=
 =?utf-8?B?WmY4aEpjWEtJK1oycE5RNzFPSVZkcEozSlVFR2hNbTBvSHZvbllpaFhEQUMz?=
 =?utf-8?B?NjZlU1djVVhTR1FGMitZYmRFVXpYVFZjMXJxUUp3NER6VWc1cklGZWxSRXdi?=
 =?utf-8?B?WURyQ3E5QXVsVjBNYVRnZFhKdUl1WkVRYzVxVGMvZ2xtRkRkK0JkWUljeHFX?=
 =?utf-8?B?M3UyOTBTT0RnU3Zucm5vQmpiakg5M2JBTVZEYWlVRzdvTXRNOFgvd3prZUdX?=
 =?utf-8?B?TnNTSEJhakRCQUtTc01FN285eXNKUWJoNjByNjZudy9VdW9Bc2ZPOTFKWjdl?=
 =?utf-8?B?clY4clM1UjM2VUlkTUxMVi9Dc3JyQU5JY1RkZFV2NXQ5a1RXYlE2Q0JVa3BT?=
 =?utf-8?B?NUs2WjVtTml6WDhnc2k0YkN3T1B6SW9kTnpJa2N4WVk0UzUxUUg2d3ZWa2Jo?=
 =?utf-8?B?NTdybTdFcit0V2lKcGJRMlNHb2p4Z2J1VXRvbzBTUHpjSDZmb0hrVklqd0Q2?=
 =?utf-8?B?MlA0Wk8xbHFFdktNejZzVFU4OUdQMDBKSXNuY0Vxckl5Mng1OWdVVkpMWVZH?=
 =?utf-8?B?bGZTVENMRUoxYkcvUkRON0xwQ3NLb3ZUajNXZS8zQVFyT3dVa1BkaTA4S2lK?=
 =?utf-8?B?QWtoSmV3WG0vQm9jdnV1encyUjdiM0g3VGZYaXpNWlRkOUIyQmtRclNEamJk?=
 =?utf-8?B?VUd2YkhFbTZWNUpmdTR4eXBQTndFMFBjdFYrV0ppdUhTbmxBS0tneEZYKzBm?=
 =?utf-8?B?c3ZaS1BVQjBReVJZcjRMcWg0dkNqZXY4UkxicnhaZnFsZld2QWh6aURmSUxz?=
 =?utf-8?B?Vm90N0hVWGFsVnV2SjNEeHYzakpJck9tM0lrNmVvZWVMUDdVbFhmSnFXSnJC?=
 =?utf-8?B?anlhbUNnM09DQnF2dlY0UldZdmp3ZTVsMzRBVlVFY2pWd1ZpY3Y3SGlpTnJF?=
 =?utf-8?B?TSs4ZWZXQzkxVTlnY0t6TnV4S0liaE1jWUNNdUJENlpIS0t2SlJCSVhMSTZ3?=
 =?utf-8?B?Y1ZpWTBZYTlvZXBTZWU5ZmNUM09ZWk9ZYlhwZVFPUjhZaFJLandEajVQVmRt?=
 =?utf-8?B?VXJNbzBlMVJJTFZsYVdubHhMcEk3eHI2am1rbERWckt1VDREMkJYRmNtVE1l?=
 =?utf-8?B?VFVqbFNjTlRSRUYvRHl0MGxrT3cyQUd0VUFCR0FJUjkzVkdsYUpGQm1lbGRy?=
 =?utf-8?B?dXFFYnBJT0hMZHg0Umd2NVRFZFVjZGR1RW9CY3JYclVYY0pWOHNxQkp0aENQ?=
 =?utf-8?B?d1VpTGkrS25NT0hkSCtJOVc3NU56dEpEeXRLdlA0NVNZNWUveVJIU1Zlc1RM?=
 =?utf-8?B?K3UwTVpyTVg1STEyY2NFb3JIK0dMcExoTEk4K1JGMFYxYk0zNFFWTWJ2N2RG?=
 =?utf-8?B?OWgzNmhNRDFDWmJnS2VFUWRZNEtybDAwckozOG9peXU2cUFaTjNTYVBvWjda?=
 =?utf-8?B?NXBvSUdxTnJxOStveTZuQmpRdEd4VEYzblpMN3J0NitSWEpYSnZBN3doR01R?=
 =?utf-8?B?M1BoWk1RWFNEbUxURTdPbjl2QS9FZDV4MU1HSEIxbms5WTQ0Z1Y4TnFwUGVT?=
 =?utf-8?B?UXF2R1A2V2hydUtmZkQwVDhjT2oxbHNpWXRBNE5Zc3QrYWpsMnhzTm1zRk9Z?=
 =?utf-8?B?bzBXOUsvWnlNVkEyUGRYT294UGozZXVVWTd4WTRDa1pYM2F3MFd1ZnhqZGF5?=
 =?utf-8?B?aVRleWdrbmR4QlBGbmxES2pRT0tVK0lONXJrcnJRTEpMVUx1di9XWVhIL1BQ?=
 =?utf-8?B?MW9QZW80elUzcEVMZEVHM213RWgreUpXeDZ3UWNRdkY2TnFWSXVxaHQwOUFO?=
 =?utf-8?B?UEY1cENTTmRPTzMwYjFpUW10N0phVGtHekw2UjNhMGkwVG1XeCttd1lxWkVW?=
 =?utf-8?B?NkxJRnE4cDk1VjgyMGxYM1EwWjNlRGlsb3E0UFBtMkxuRGNnQmxoV2QySVVF?=
 =?utf-8?B?UlJRSndIUktHOTZSV1RWNm0xWGhHTFNPK3gvdU8zZExGVzB6L0JSVGRsdlpK?=
 =?utf-8?B?cDAxSHE4c2w4SEVTOFp4R3ZpaTBRNkhrbEovb1Zsd1Q1KzR1WldEbGtVWEov?=
 =?utf-8?Q?+CbIVm?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzFjWGpDMHlSMjFMYnBYQzRoM3dCNysxTnpaelRpQUoyaFJUd0VJdGpKUUkv?=
 =?utf-8?B?clU1MXZlbXhlVUhneDBnZ1hlM2I1aWVIVlk4TnB3UkdqTXZmNTUrOXE4MTls?=
 =?utf-8?B?c1BOcitHSENwUmVQK0NBQzJNeWRhd2tVVVVIZmZSMWJUQ1FGdWJBYUo0eUQv?=
 =?utf-8?B?c0NyOWJ3VlhhVWJoT2ZoVlpiVTFmMi9DUFpoeEFlaDh4YkxGV3VsZVQvMFpE?=
 =?utf-8?B?OTVxT2RKc2tzQlhCSS9HYmRRaWNvMm03NkdPaEU5b2xlL2NHa1lXNCtYMDV1?=
 =?utf-8?B?R090OHNkZVR2aHRrZFRRYS9xaDQzbUZTZTlHZGFxSGtpQVhzSnd0cUJOR2xB?=
 =?utf-8?B?MVY1dUJDOWwxRi9Tc1g5ZUptdURVdlRWSnhVb1JwS3lBcTIvbTFTcE5hRmR1?=
 =?utf-8?B?ZE1mQjZrTUJKNW0vT0g0QzJqS0UxZ2VYTVhBc3NXb0N5dU1aNXdVUFN5Wksw?=
 =?utf-8?B?SEE1aHBYaUJDVW5rOFBjTVEvOThTaWJPMzdnWmwxd3VxZCtBU2o4WENiMVhF?=
 =?utf-8?B?dGZCTkp1WkxSaHJpL2pTQzkvK3hKMnRNaW4ya1Zob0xkVjhNRjdERWpHU1hq?=
 =?utf-8?B?NWo5YlphMTIvZmFyemw2NDIrMVBOaVA5TURhMEhaTHZOWHB1eC92bEduNHZE?=
 =?utf-8?B?TzZNeFh0MnA4OU9mZEU1VjMvb2djTFNRd3I2ZGtzeGhVei9LSVB4WkMxQ0pz?=
 =?utf-8?B?ZHpiY1k4MDhNR1QvR25Vb3JvU1ZTTEU0T1c4NFo3am1NUUZQTENPa0R6ZDlB?=
 =?utf-8?B?ZXhqSFdtUDl4K0cvTjF2SUhydnc4QkJ5bWswekNKQk1OV0t4di8xK1ZKcUlx?=
 =?utf-8?B?MExjamtLblhiMHlGY3ErRE5idm5VdEhucmJVQUxxOWwzeDJFMDgwZE9MamhW?=
 =?utf-8?B?cEdvcUd4Qjg0K3N3MGpjQ01ONnArZi8rWTl6S0RXTWd3OER0Z253blpyUXhZ?=
 =?utf-8?B?NzRqcVRIN0UzWVVTZS9kWjNHTSt4KzRUT1JGTDg3UlVNeHNIOUJqMk1YcWxU?=
 =?utf-8?B?Q0R5WXBqaktLVTh2emNORTBpd1BoOFdEYVJRcGQxYy9EMHdwZzdHd2F2b2Nx?=
 =?utf-8?B?MXhMUFMwVm5wTjJ2TmhZSzJJOUZIdjFLMHcxbEQxcXBJOWYzTWRXaHhMVkRJ?=
 =?utf-8?B?TDV0U0JCWTVkM0FkNjFXa0F3WjROUlNrM2VJOWQ2Z29CNThLMW5CZ2hNa0dz?=
 =?utf-8?B?RlVQc3pHa2xza3c5V25GWHhNUkJiN1lFa09ETzBCV2NSRUpnSEVEcGZpMXlX?=
 =?utf-8?B?d1BHa1lxcEs1d3BwUm8wV0JuNitJMmFDeFpHUFFxL2Z3andNOXJNWWNBVjBj?=
 =?utf-8?B?UEVRVmZLd2p3dmx3VFVFZTVNeHBiMHVkR1lBcWdQanVOeHEzYUFhYVR6S1du?=
 =?utf-8?B?Q1Nhd1lVM29aSXUzd1o4RjZUUXpzb01pMkVQSUx5V0FlU0k1Q3Vma1hmKzVi?=
 =?utf-8?B?Sk1IWjNxMzhOTDdyZ2dIZWl5Ymk0Vm9FeklCTmxZT2hna0lsQ0hxQWo1Wlpl?=
 =?utf-8?B?RENWdkU0eldoL0VaS21FSnRLbVpHZVE4SHVaYzN2alJuTUM4d0Juay9XRCtv?=
 =?utf-8?B?VFFFYUFnVjNZQUFLbnhram00VjFuczNubGo4UXV6T1VuOXp1dHBFNjlQZGpX?=
 =?utf-8?B?c05QanZiaEl1Z0hJelBEUXVGcDlTTnZsSGVzV0hCblNsckJFbGUrNnhNOWFY?=
 =?utf-8?B?MEsyRzV4ay9IcWY1RlBzbXZEWDRjUXMvQkJzbGRTTWFpZ205cWl6Y3Y2cXJI?=
 =?utf-8?B?NjJtYWwvUDZiSUN1bkliaXpVUUZwRjBXeXA1ZzhBcjFWcy9DMjVENWZySGVE?=
 =?utf-8?B?Y3IxTFhEa1JSSHVZc2V5RDdpV2V3U0Z4STJSL0I4RkNXUHlRWnlnL29WQTVC?=
 =?utf-8?B?VEVkb2dId2hlVWZHVCtnb1gvemFKd2kzcGFnengzTWpmZnJ2cEhvdDZDOHZY?=
 =?utf-8?B?TjI2T0p6YnkwdnJlZEFOeWJNbVJSRitUUUh4MkdLVHdQNzdnck90dFFzc21L?=
 =?utf-8?B?NWRCaW5GRmhNcVhmUFozMUlhRE95eTZzRCtwTGtpYkdFL1hjVTRnMWtEZ3N3?=
 =?utf-8?B?RlZFT20xMkxpR2N5L2hNZ25qbmprcFVBb2dFbHg1bm0vNDlIZEhLdEVFZ0dP?=
 =?utf-8?Q?lZSc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: dave.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5533e8-9427-4939-335f-08de2c0b2f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 10:12:47.8359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c85ddbc-ed10-48cc-8f28-5d7f9561238a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pAMfeYG6W4aUyT11Ao0OHTnuXc/LhRk1kSGIfzOwIIn6Xw5DzUy6ihplL+d7P6Po
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI2P293MB0076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_021255_357783_A582DFFA 
X-CRM114-Status: GOOD (  17.59  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CkRlYXIgYWxsLAoKSSdtIGZhY2luZyBhIHdlaXJkIGJlaGF2aW9yIG9uIG10ZF9uYW5kYml0c2Vy
ciBtdGRfdGVzdCB3aGlsZSB3b3JraW5nIG9uIGEgWnluazdrIGJhc2VkIHBsYXRmb3JtLCBydW5u
aW5nIGtlcm5lbCA2LjYuMAoKQXMgbWFueSBvZiB5b3Ugc3VnZ2VzdCBtZSwgdGhpcyB0ZXN0IGlz
IHBhcnQgb2Ygb3VyIHZhbGlkYXRpb24gZm9yIHRoZSB3aG9sZSBsb3dsZXZlbCBzdXBwb3J0IChO
QU5EIGNoaXAsIGhhcmR3YXJlIGRlc2lnbiwgTkFORCBjb250cm9sbGVyKS4KCkkndmUgZm91bmQg
dGhhdCB0aGlzIHRlc3QsIGluIG15IHRlc3RiZWQsIGZhaWxzIHdoZW4gdXNpbmcgc2VlZD0xIGJ1
dCBpdCBzZWVtcyB0byBlbmQgc3VjY2Vzc2Z1bGx5IHdoZW4gdXNpbmcgZGVmYXVsdCBwYXJhbWV0
ZXJzIChzbyBzZWVkPTApCgpIZXJlIGl0IGlzIHRoZSB0ZXN0IG91dHB1dCBpbiB0aGUgdHdvIGNh
c2VzOgoKcm9vdEBzdzAwMDUtZGV2ZWw6fiMgbW9kcHJvYmUgbXRkX25hbmRiaXRlcnJzIHNlZWQ9
MQoKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KbXRk
X25hbmRiaXRlcnJzOiBNVEQgZGV2aWNlOiAwCm10ZF9uYW5kYml0ZXJyczogTVREIGRldmljZSBz
aXplIDEwNzM3NDE4MjQsIGVyYXNlYmxvY2s9MTMxMDcyLCBwYWdlPTIwNDgsIG9vYj02NAptdGRf
bmFuZGJpdGVycnM6IERldmljZSB1c2VzIDEgc3VicGFnZXMgb2YgMjA0OCBieXRlcwptdGRfbmFu
ZGJpdGVycnM6IFVzaW5nIHBhZ2U9MCwgb2Zmc2V0PTAsIGVyYXNlYmxvY2s9MAptdGRfbmFuZGJp
dGVycnM6IGluY3JlbWVudGFsIGJpdGVycm9ycyB0ZXN0Cm10ZF9uYW5kYml0ZXJyczogd3JpdGVf
cGFnZQptdGRfbmFuZGJpdGVycnM6IHJld3JpdGUgcGFnZQptdGRfbmFuZGJpdGVycnM6IHJlYWRf
cGFnZQptdGRfbmFuZGJpdGVycnM6IHZlcmlmeV9wYWdlCm10ZF9uYW5kYml0ZXJyczogU3VjY2Vz
c2Z1bGx5IGNvcnJlY3RlZCAwIGJpdCBlcnJvcnMgcGVyIHN1YnBhZ2UKbXRkX25hbmRiaXRlcnJz
OiBJbnNlcnRlZCBiaXRlcnJvciBAIDAvNwptdGRfbmFuZGJpdGVycnM6IHJld3JpdGUgcGFnZQpt
dGRfbmFuZGJpdGVycnM6IHJlYWRfcGFnZQptdGRfbmFuZGJpdGVycnM6IFJlYWQgcmVwb3J0ZWQg
MSBjb3JyZWN0ZWQgYml0IGVycm9ycwptdGRfbmFuZGJpdGVycnM6IHZlcmlmeV9wYWdlCm10ZF9u
YW5kYml0ZXJyczogU3VjY2Vzc2Z1bGx5IGNvcnJlY3RlZCAxIGJpdCBlcnJvcnMgcGVyIHN1YnBh
Z2UKbXRkX25hbmRiaXRlcnJzOiBJbnNlcnRlZCBiaXRlcnJvciBAIDAvNQptdGRfbmFuZGJpdGVy
cnM6IHJld3JpdGUgcGFnZQptdGRfbmFuZGJpdGVycnM6IHJlYWRfcGFnZQptdGRfbmFuZGJpdGVy
cnM6IFJlYWQgcmVwb3J0ZWQgMSBjb3JyZWN0ZWQgYml0IGVycm9ycwptdGRfbmFuZGJpdGVycnM6
IHZlcmlmeV9wYWdlCm10ZF9uYW5kYml0ZXJyczogRXJyb3I6IHBhZ2Ugb2Zmc2V0IDAsIGV4cGVj
dGVkIGE1LCBnb3QgMDUKbXRkX25hbmRiaXRlcnJzOiBFQ0MgZmFpbHVyZSwgcmVhZCBkYXRhIGlz
IGluY29ycmVjdCBkZXNwaXRlIHJlYWQgc3VjY2Vzcwptb2Rwcm9iZTogRVJST1I6IGNvdWxkIG5v
dCBpbnNlcnQgJ210ZF9uYW5kYml0ZXJycyc6IElucHV0L291dHB1dCBlcnJvcgoKcm9vdEBzdzAw
MDUtZGV2ZWw6fiMgbW9kcHJvYmUgbXRkX25hbmRiaXRlcnJzCgo9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQptdGRfbmFuZGJpdGVycnM6IE1URCBkZXZp
Y2U6IDAKbXRkX25hbmRiaXRlcnJzOiBNVEQgZGV2aWNlIHNpemUgMTA3Mzc0MTgyNCwgZXJhc2Vi
bG9jaz0xMzEwNzIsIHBhZ2U9MjA0OCwgb29iPTY0Cm10ZF9uYW5kYml0ZXJyczogRGV2aWNlIHVz
ZXMgMSBzdWJwYWdlcyBvZiAyMDQ4IGJ5dGVzCm10ZF9uYW5kYml0ZXJyczogVXNpbmcgcGFnZT0w
LCBvZmZzZXQ9MCwgZXJhc2VibG9jaz0wCm10ZF9uYW5kYml0ZXJyczogaW5jcmVtZW50YWwgYml0
ZXJyb3JzIHRlc3QKbXRkX25hbmRiaXRlcnJzOiB3cml0ZV9wYWdlCm10ZF9uYW5kYml0ZXJyczog
cmV3cml0ZSBwYWdlCm10ZF9uYW5kYml0ZXJyczogcmVhZF9wYWdlCm10ZF9uYW5kYml0ZXJyczog
dmVyaWZ5X3BhZ2UKbXRkX25hbmRiaXRlcnJzOiBTdWNjZXNzZnVsbHkgY29ycmVjdGVkIDAgYml0
IGVycm9ycyBwZXIgc3VicGFnZQptdGRfbmFuZGJpdGVycnM6IEluc2VydGVkIGJpdGVycm9yIEAg
MC81Cm10ZF9uYW5kYml0ZXJyczogcmV3cml0ZSBwYWdlCm10ZF9uYW5kYml0ZXJyczogcmVhZF9w
YWdlCm10ZF9uYW5kYml0ZXJyczogUmVhZCByZXBvcnRlZCAxIGNvcnJlY3RlZCBiaXQgZXJyb3Jz
Cm10ZF9uYW5kYml0ZXJyczogdmVyaWZ5X3BhZ2UKbXRkX25hbmRiaXRlcnJzOiBTdWNjZXNzZnVs
bHkgY29ycmVjdGVkIDEgYml0IGVycm9ycyBwZXIgc3VicGFnZQptdGRfbmFuZGJpdGVycnM6IElu
c2VydGVkIGJpdGVycm9yIEAgMC8yCm10ZF9uYW5kYml0ZXJyczogcmV3cml0ZSBwYWdlCm10ZF9u
YW5kYml0ZXJyczogcmVhZF9wYWdlCm10ZF9uYW5kYml0ZXJyczogZXJyb3I6IHJlYWQgZmFpbGVk
IGF0IDB4MAptdGRfbmFuZGJpdGVycnM6IEFmdGVyIDIgYml0ZXJyb3JzIHBlciBzdWJwYWdlLCBy
ZWFkIHJlcG9ydGVkIGVycm9yIC03NAptdGRfbmFuZGJpdGVycnM6IGZpbmlzaGVkIHN1Y2Nlc3Nm
dWxseS4KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
bW9kcHJvYmU6IEVSUk9SOiBjb3VsZCBub3QgaW5zZXJ0ICdtdGRfbmFuZGJpdGVycnMnOiBJbnB1
dC9vdXRwdXQgZXJyb3IKCgpBZnRlciBhIGJpdCBvZiBoYWNraW5nIChhbmQgbG9va2luZyBhdCBv
bGRlciBrZXJuZWwgcmVsZWFzZXMpIEkndmUgc2VlbiB0aGF0IGJ5IHJlLWVuYWJsaW5nIHN1YnBh
Z2Ugd3JpdGVzIGFsbCB0ZXN0Y2FzZXMgZW5kIHN1Y2Nlc3NmdWxseQpUaGlzIGlzIHRoZSBwYXRj
aCB0aGF0IEkndmUgYXBwbHkKCkZyb20gMWNiNDQ4ZWMzNGIzOWYwOTU4ZGIyNjJjNGE0NGUyOWZm
OTU4MWIxZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogQW5kcmVhIFNjaWFuIDxhbmRy
ZWEuc2NpYW5AZGF2ZS5ldT4KRGF0ZTogV2VkLCAyMyBKdWwgMjAyNSAxMToyNTo1NSArMDIwMApT
dWJqZWN0OiBbUEFUQ0hdIG10ZDogbmFuZDogcGwzNXg6IGVuYWJsZSBzdWJwYWdlIHdyaXRlCgot
LS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcGwzNXgtbmFuZC1jb250cm9sbGVyLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIuYwppbmRleCBjNTA2ZTkyYTNlNDU3
Li41NDJlYzg1M2U5YTY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1u
YW5kLWNvbnRyb2xsZXIuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNv
bnRyb2xsZXIuYwpAQCAtMTA2NCw3ICsxMDY0LDcgQEAgc3RhdGljIGludCBwbDM1eF9uYW5kX2No
aXBfaW5pdChzdHJ1Y3QgcGwzNXhfbmFuZGMgKm5mYywKIOKAguKAguKAguKAguKAgnBsbmFuZC0+
Y3MgPSBjczsKIAog4oCC4oCC4oCC4oCC4oCCY2hpcCA9ICZwbG5hbmQtPmNoaXA7Ci3igILigILi
gILigILigIJjaGlwLT5vcHRpb25zID0gTkFORF9CVVNXSURUSF9BVVRPIHwgTkFORF9VU0VTX0RN
QSB8IE5BTkRfTk9fU1VCUEFHRV9XUklURTsKK+KAguKAguKAguKAguKAgmNoaXAtPm9wdGlvbnMg
PSBOQU5EX0JVU1dJRFRIX0FVVE8gfCBOQU5EX1VTRVNfRE1BOwog4oCC4oCC4oCC4oCC4oCCY2hp
cC0+YmJ0X29wdGlvbnMgPSBOQU5EX0JCVF9VU0VfRkxBU0g7CiDigILigILigILigILigIJjaGlw
LT5jb250cm9sbGVyID0gJm5mYy0+Y29udHJvbGxlcjsKIOKAguKAguKAguKAguKAgm10ZCA9IG5h
bmRfdG9fbXRkKGNoaXApOwoKU28gaGVyZSBpdCBjb21lcyB0aGUgcXVlc3Rpb25zOgoKKiBpcyBp
dCBjb3JyZWN0IHRoYXQgY2hhbmdpbmcgc2VlZCBpbiBtdGRfbmFuZGJpdGVycnMgbWFrZSBzdWNo
IGEgZGlmZmVyZW5jZT8gSUlVQyB0aGlzIGlzIGp1c3QgYSAicmFuZG9tIiBzZWVkIHNvIEknbGwg
ZXhwZWN0IHRvIGZhaWwgaW4gYm90aCBjYXNlcyBvciBub25lCiogaXMgaXQgY29ycmVjdCB0aGF0
IHN1YnBhZ2Ugd3JpdGUgaGFzIGJlZW4gZGlzYWJsZWQgaW4gcGwzNXggTkFORCBjb250cm9sbGVy
PyBBRkFJSyBvbiBvbGRlciBrZXJuZWwgc3VicGFnZXMgd2VyZSBlbmFibGUgYnV0IG1heWJlIEkn
bSBtaXNzaW5nIHNvbWV0aGluZy4gVW5mb3J0dW5hdGVseSBnaXQgaGlzdG9yeSBkb2Vzbid0IGhl
bHAgaW4gdGhpcwoKSSBkaWRuJ3QgaGF2ZSB0aGUgY2hhbmNlIHRvIHRyeSBhIG5ld2VyIGtlcm5l
bCBidXQsIGF0IGxlYXN0IG9uIHRoZXNlIHR3byBmaWxlcywgSSBkb24ndCBzZWUgYW55IHNpZ25p
ZmljYW50IGNoYW5nZXMKCktpbmQgUmVnYXJkcyBhbmQgdGhhbmtzIGluIGFkdmFuY2UsCgpBbmRy
ZWEgU0NJQU4KClNXIERldmVsb3BtZW50IE1hbmFnZXIKCgoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
