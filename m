Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18549C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 06:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSkFjDUpkPZz8LMJt9NRwS3pqbD+rJq62yU1XvJolEk=; b=o5gcB1yygGPYnV
	AnrxwEWdJLUU0ey7VumzWwKDpjX2R/Lx9E61OABt0fxjFHDSqFcwYZC59wjCX7CA/PY2oD5/Y7OAT
	LzM2EzBBz6iecNzNtTuTMSLhSH/SgKx+YElJbB83/IzdeEGWDZfVxNdDmh6Fl9K++W51pZLmonx82
	LicQy1u59VDVcNDhdb5ELX7I1korn4yYwlOVDzyTZQJyf1FNBQtssYpeYwW8KFS+GMHhmFkreJCyM
	ReTLmemY0ZDv8vsS4NvFchp0L52DS9rABSU1+gjJ8YdpFmYbfmGry3RWeggUkINRpyGUi9eVXLX+5
	xBJi5ZuTqQWUBCm28lJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEPuo-001BVX-OY; Thu, 21 Jul 2022 06:44:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEPum-001BUW-Kx
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2022 06:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658385844; x=1689921844;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cXoG9BfmTLY3vRK1lVh/kBH40T7Mv9a5DZqs5FEq+Zw=;
  b=KMZL6geNZsXfcV7T5AFwhLqSKe1XL5lxsn5skNl36sXnCLEcCoZOp2my
   sCDxc56Na/s0U1m/P+r25hqbWrITrbugmji9mYVee2s0D/2oq7Btr4291
   Ic+cjsjz+wrRvcwifE5/COd352/v15q/o6HU7UZRXXwWD2bJkXULlp4dF
   40qvZKpP1rZY+5iFz3/7UBGO5OGcgOl0evHOZp+bT7PYAUEgplN3KgY1m
   kd7YiMkME17Hx7i1SFeSUBBA6TW4hmvU0E0w2EEAmAczMFXB+ARAg46EE
   2UoXXvl324KFmwt9m5TWXj5PenM8WT7cRz7fui/udgJ9QqY9/2LfNTZ3Z
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; 
   d="scan'208";a="173212207"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jul 2022 23:44:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Jul 2022 23:44:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 20 Jul 2022 23:44:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqdCmlXQZe/EaHVMzi2zHeNzkUHkGYkXbQKojdmUpayLKzCbeWXoOme5pDB+VSgp+3DyFc9/s31T3xgyIz9L52NmfWIwks2IkQ4rl/f14POgrWCaTapnCustSf1Ongcaixk6Z2rtnHzoAA3okEaMlrGy0M2dAj4E3IIecNnJnbm2pQybT5MxAJ0I2SQMlJwyScDEjXRdlc6T7ZSqwblwgZiuFffBEbap69XgPt0zUGNGE5+XcoclN1sDg4+vouiZgqpmDCtmS5GJcDMjkNEvoe0sMEko6e54JrGGx6beR9KYf0DZZOUBxI6jg4JMRVG9BToKBeYkcztc8EN+awM+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXoG9BfmTLY3vRK1lVh/kBH40T7Mv9a5DZqs5FEq+Zw=;
 b=DliZoiRme+3UjbDsTkErYV+WFt2FdOdN5Kuw59C2McB1QkPUjfeAcsiX/pm2SUf1++WD9fr8WvIruoEnPMREmBOhU/88V2/J56adauodUHo+ts3jZ55C2sXZaU0+fnMBcW845FDDK7nc4QsQgZIwgEMqDndB6iynmlOD50dpbPayqx1VhvIuIm4iRWcI42Wjk/1k5i4OQSm6BzMwRrP8tHNwgGW7BQFfKZdfDo0pr7s8veRb7TCzM1I2Qz2yfFBu9aMuyQ4NGh5TH3f3shfiWSfBVonaSyvJQ//d+7pApar+/R78dyzC4As5gSRdSw5rBl3QBnQyCxph9rE2kMBwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXoG9BfmTLY3vRK1lVh/kBH40T7Mv9a5DZqs5FEq+Zw=;
 b=DLxDO6CgCU0cOT2E9ifgwjOPlRAqwWdK3NPK5+YsLq4RmEjSUT6n90jWQ6weVC7OqoyloKOwJI6k3Fr3TR1RmAm4iTAOq2WLBL+M7Z8tpTElqrTVR6MhrZdNQ5ADSMrFT+kgO5es+FH0I6bBNoQgU0Z+Ly0ZvWW5vF0wb0rtSUs=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM6PR11MB3817.namprd11.prod.outlook.com (2603:10b6:5:13a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.21; Thu, 21 Jul 2022 06:43:57 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%6]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 06:43:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <gaoxin@cdjrlc.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: <jim.cromie@gmail.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd:do not initialise statics to 0.
Thread-Topic: [PATCH] mtd:do not initialise statics to 0.
Thread-Index: AQHYnM1ADLCY6+AozU+bEgDC4IxH2Q==
Date: Thu, 21 Jul 2022 06:43:56 +0000
Message-ID: <04309792-a73f-2bb8-6138-c4151d168ef3@microchip.com>
References: <20220720195526.9289-1-gaoxin@cdjrlc.com>
In-Reply-To: <20220720195526.9289-1-gaoxin@cdjrlc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4cc52b1-a920-41ee-83d5-08da6ae462c3
x-ms-traffictypediagnostic: DM6PR11MB3817:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fx2Tm35ScIA3bWgeXjLFtI+tbryGNkM1xWeFuy5MzlSai7ov8Z53g6sUvrhVtP2mOnuJEqbCKJR7kuetCodaJHttAqUyKoeHq+HQktuPBFB4mX0ZnLd2FlnHR+aAs2Gs/4uKZPxUR6L4l3yhEfn5k1rPGFGCkHTUuhIVE9Q9bZSuzhM0l63kE7IEu/gQ/15HUskz2ohHBOPelINETuKVm0TnErv2kpJmVQ8WpByOs+9lBz7bRbamX5Ys5B7eaeWBTTuuy6cxd3FH5N6ul9zEbAeCqbEBqKSF0kGkKsyebQp94V7BnyJv/ZO9enAk5CuYSTLfyfx4dpHDHglr1tQHfcfaR4qidnQ4c7Fq+cUEtN9qhZVpaqiiFkhRX5QcrR10Ke34cocslzzi34zEXYwQ8Of3B4n/C+sie/gR+R3eCbE7Plq2RFrji+N94NtAnWmMGhOYlWdLsNpu4K68HBAtPDcloiRrMghuCBW3q08N5hOWBpuR1q0c8euZFaU7+UOBZ5BiQ5Z/neYsAwTLD/Mbujh+2plRktIOyY8JtJeeX4H8HqFVwD8br7wFV3W7P3ayyZdyJL1FPiVG4YqeY1w9+YJu053MTYkB2ZRO+tsjYo8yuzwM0VOJpvE6v1gZNKK6LYOI7PTxUkxwvysBViC+VZ/9iZtuNSd0z8zs7655p1PB5cetiRSDyl40Jjykpia4qURe4QneOC/Cg0bOu8dSUMPauYZJy12mUHi/UX6C4xGapFBJpujgknyOnJd5O833muF81nqr65RSQUamkbAvJxua7z22BmPKuEtUgycj71ldkyzGmcjPnsbQ8+GOo5UzNwuDOQh0bzQ9NvGJNNGDq3tL1qwtvI9vOR5AWQSlDt7jOu9crxVOLAJTdjOS1gPtCqeQQUQnmbNFK7zi3RuBK4q5ThPRvEELBOHK/TO87qRLb+IwapZR/djgkUBzLa23
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(346002)(366004)(396003)(39860400002)(38100700002)(66446008)(66476007)(8936002)(4326008)(8676002)(66556008)(64756008)(110136005)(66946007)(76116006)(91956017)(36756003)(2906002)(31696002)(38070700005)(53546011)(54906003)(71200400001)(41300700001)(26005)(6506007)(31686004)(186003)(478600001)(316002)(2616005)(122000001)(6512007)(5660300002)(86362001)(966005)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVpwelczeEtTTGFDMkZDRldNcjd2YllDMlNNVGMzSWlrMVhOTEtLdXAzRUlF?=
 =?utf-8?B?d3Nic3hzcTRua3hKK1IwYWdPVTVWVVNtRmZrbExhQ3Y2aU42UW0waUFNTmlr?=
 =?utf-8?B?djgyajBTcGJSVCtCak5xcUREVmZjK25WUDhVZUt0OE52c0F5RWh5eWQ2ZnZL?=
 =?utf-8?B?N1VSWDVZZVVtNGJ3cTFTOGRMYU9DM0p5VG9wVVUwZmFmSDRsYTMxWGZSbGM5?=
 =?utf-8?B?YUk2SmlnL2Zyd2FhM1BnQzl5dzRjcTlnMGRmcU9NZjNNczBUMVdOZ0NLdjhq?=
 =?utf-8?B?SW1QOTVoZk1lUmNvS1IzclNuZDdMaWc1R1RUendxNURSY1NsZ1pSL1RUMjUy?=
 =?utf-8?B?UHY1SERyaFNCaFZlaWFYZkZSZmhlUUtHVnlXMmJWSDZtYVhGRXQvNm9ITVBF?=
 =?utf-8?B?M2VuL01DZ0VSMFdvVWdoWWFHeE9waEloQnRoU0k0ckFWSStpOHpiQUZXYjZF?=
 =?utf-8?B?Z1dOZFJ0aUpWU3hEMHZlOEduRzZXQXoyaW9yYnpKYy9mQlJhN1BzNDJNcmxN?=
 =?utf-8?B?VUkzSDU0NFpLSm1aOEVJV0RaWlZSY0V6UG14ZFE2QTBWMjFjSE0rNW1HTk1X?=
 =?utf-8?B?R1ZzcnhzTXZFVTZHTlJ3ZE9QMXB4QXBVSkJjV1RkYklwczQ5ZXh1bVFXNmZS?=
 =?utf-8?B?YTE2MDhMSHFZZHJwR0FERVhiUEtQTzFsUk9TNitObXhuQXRvaEpFdVVXT012?=
 =?utf-8?B?NlczOUdjSjlmT3RlKzE5TlBwR0NTS3V2VEFVeTh2TVNOQWw2OFBXTWhQdG9a?=
 =?utf-8?B?NXpIV2hTZnVMdkNNUmIwSXoyNkpGRGQ0NzB3ZFEzQ1U2N2JPYkorb2dRNXNO?=
 =?utf-8?B?UC9ucExRTkI0UWk4ZjVXajVKWm5ZRjQrSTFmeUlVcXc1emRGNGlnaDFyU09W?=
 =?utf-8?B?aUFPc2Q4NWFCdVU4RkhQYTdSbEplZkliVE8xcEM0d0FtSkNJQkQyR2NiVzN5?=
 =?utf-8?B?SUU5b0c4VGYzY2x3cDlsbEphcFhyWlBMOXl6Z3Joa0pPN1d1U3NGSHptaFBx?=
 =?utf-8?B?M1p3bTA1RlljMUdlKzRka2lBV0ErQktMcjBJYUZhTWozSi9LYnEwY0piZFEv?=
 =?utf-8?B?NlZUcTJNVStOSENlZGhyQ3A3ODZ6czBXR2c5N092UTh0M05nNHU2b3dEbVVM?=
 =?utf-8?B?TkxPSWZDTm9BSnduWU5mNTRDZngwRWpCODBCUS9Hb2JHUE16WWNUSzczcCs1?=
 =?utf-8?B?eVY3Q0ZYOXh5bEpUUUQ0SjZmdlBJZ0V1OGhzckJVUkdDSEZzNDgwek5WMXR4?=
 =?utf-8?B?U0JoWit5K0tYWUdOQUlhV0p0bVhWTjhLaFdEUFpycEtlOGQ1WWxFU0Z5REVW?=
 =?utf-8?B?Z25yYy9ibzRWWFpqZnZxVFh5eFU4aVBZQzIrLysrMFRtK3pnTXRrbWNKOTNN?=
 =?utf-8?B?RmVWRG1oVm9udS8rY044SWd1bXprTzdrT3lzNkJjZnRXbkRUYTJuYjZyMUh4?=
 =?utf-8?B?R1FHc0xqVFhOMDlQZUJUVzQxMG1DRDBZd1lOUVRaQloxL3RldmdGRWZHajFM?=
 =?utf-8?B?aUkyVHNzdDU1L0ZTWlYreWxNMWtwODJTcHFiZzN4OUN3ZVg4YTgxMVlXbzZW?=
 =?utf-8?B?NTRuSW01WHdBRUVSSzBsU2JKREFMRzNjWkVBOFpET1hOaU1oN3ZkcEpvODZP?=
 =?utf-8?B?MnJHMGg0VnVUWFI2R2Z3VThCaXc4aERFRHR2bEp3blJVbG52a25tc1VDL1Rw?=
 =?utf-8?B?TmtMcFpMTStuMlhjSnVGbFRlYWJyZStuQ2xSRDZUNm92cmlqQmdsN0dvWC9P?=
 =?utf-8?B?N0NIMEZpWWVwTUUwQk9HeXNDNmwyQnBEV0ZrSHJrL2U0bk1Way9EY0Q2UzBH?=
 =?utf-8?B?c041bDFCSS83TE9meHQ0M1FVWTl6aWJQeGxlMGZmajlWQzZqaHVTZ2x6N2ZU?=
 =?utf-8?B?MzBpSXhIK25Ld1Z1aU95azRsZ2YwcDZYcXhGM0FDcThJaU9aN0hPQjZBR2hJ?=
 =?utf-8?B?N05KVUVTMW9HTkUxT0NTcmNFekpReUdRQjlxZkFPem41Qks4dVRmWXE0WlIr?=
 =?utf-8?B?WCs1dWJUWW5iSkxxSU8rUlJEdy9XN21wYWl0WmxScFo0azFkcXliUjNuNXBR?=
 =?utf-8?B?WHZqZmZNMGk4MU1hZ2FzN281OEZ5RzBwSlRSZFEyeXFabzVCR2R0VFU4WGZm?=
 =?utf-8?B?NHpsc2xRWE9PKy8rTEdob0FmdnFkMmFaNVNlWDlpWi9RYXQ1Y2FaanhsTi9T?=
 =?utf-8?B?WHc9PQ==?=
Content-ID: <198A51C63E908A48A92B39DC30BBF890@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cc52b1-a920-41ee-83d5-08da6ae462c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 06:43:56.8258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xEpip1w+D+Gl6jmT6nuPsvAZIs+VnOBVQn56vXZjJgLwGMIShUIx107b23DorVk9Tz0Jog9TqsI+5GwckBYUj+fpMG0ro542eqQ7IdzszhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_234404_717448_8A64B8EE 
X-CRM114-Status: GOOD (  18.58  )
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

On 7/20/22 22:55, Xin Gao wrote:
> [You don't often get email from gaoxin@cdjrlc.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> do not initialise statics to 0.

Please describe why. It may worth reading:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

> 
> Signed-off-by: Xin Gao <gaoxin@cdjrlc.com>
> ---
>  drivers/mtd/maps/scx200_docflash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/maps/scx200_docflash.c b/drivers/mtd/maps/scx200_docflash.c
> index 8462662b7128..a565d69d28d6 100644
> --- a/drivers/mtd/maps/scx200_docflash.c
> +++ b/drivers/mtd/maps/scx200_docflash.c
> @@ -24,7 +24,7 @@ MODULE_AUTHOR("Christer Weinigel <wingel@hack.org>");
>  MODULE_DESCRIPTION("NatSemi SCx200 DOCCS Flash Driver");
>  MODULE_LICENSE("GPL");
> 
> -static int probe = 0;          /* Don't autoprobe */
> +static int probe;              /* Don't autoprobe */
>  static unsigned size = 0x1000000; /* 16 MiB the whole ISA address space */
>  static unsigned width = 8;     /* Default to 8 bits wide */
>  static char *flashtype = "cfi_probe";
> --
> 2.30.2
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
