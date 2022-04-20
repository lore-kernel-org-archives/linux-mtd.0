Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FD3C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wwE8UynxH4WMIbb5PEjxVEULSWTPAJOyub5B7hUtV5M=; b=utRnkxOZzC62dy
	GiZ0k7PeZy3d+5gwX786yb8OLssvCsC/a0IcRFEUgNzdnOKbtpMnIBkp+BSjtk+Nvk4jOU+dlWXdB
	nBprUO9FFyj7q2z0zr997OyzMlkxmjhI9c8fIih/ziUEufiZFwO6ZXjskSVDpqbQs7neU0hs7osDf
	YmZI7SFylsb5UPfpZoFrUJUV0R1RdO2QViE2nYYz+Mg1WS1M26ya5rCPDEX2o8oOnhRjpsXh3vFvO
	84tHnCctAJ3V9ckzpOi4udq7j40+Q3vs98r2YcqCzr956EMxfi/IJj62/8mQm4LGiN0GcaKsZOD/c
	OoDnVpKiplN7ZNdJwfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhBEH-009NgH-E7; Wed, 20 Apr 2022 14:22:49 +0000
Received: from mail-dm3nam07on2062d.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::62d]
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhBED-009Nfc-W3
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 14:22:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/knsKJSBSZl7KNJyb4RzaEayL2D/SkdEs9ABxlvkNMuy6X+vsrZI+1spZifdALv2Cc48uFYwN/JKa+ci0IeZsBFuENgO3r+W+uAW2ivSL5MZI1V/hV1MIZHrtFyq2kFh1RZXqyuVHFjQcSZeH6CfIhUzV8nG6HpKkZnzSlR84jDeZz3cvZr9vROChNK54UYxgL4270wZ4B1Davz7U481TukKfVo3Rj7B/ZRKTKYfF8/7zc5mJR+6BtXI/8QNq4VVjgrJTjSgBtUA0PB0KSNbtqrMjrLerHJHNXAqpOn6y1mt97kAN+rIKXz6wm23MK/EULQYKDiYnr3wJPKCR6RwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6APwwNB+qkKnvAa9wqwjOCYzuTDJLhieN3q0GKExww=;
 b=ki4vin/FinNRIR2l/50R5d7NfaUGO2ZVdDZ8/COvEt0JRaDA5TXdnynIk901SiMhJEgCgTDpaGMWJaGn8CIXWvmWOjmALfVqRrzIvspLxyM5/NkFLHZnP6basIa0Lop/fbkcyzwnltxN04VGHew0OBL6s+TLbbt2acnvLf2s+RU3aAV1qJxfKqUKTPkyIWiiFXWdP2Cu+fvL5BD1tTZu/pUPbf3WvoTDirSdIBnE6GxouIYKJ1T9nY/u+/0JzuRnytOmi4DRh3aMOa3YXXsHrnOsodEX2ECz2RFtX/ru6yuF0A7F55K2b4llt/1w86Yrdkn399Hs5KMi/cmPiIfYBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6APwwNB+qkKnvAa9wqwjOCYzuTDJLhieN3q0GKExww=;
 b=D2y4weQ3CuZ/LA7wZBH3TcjrAM8LJcuujeWd9+q1C5dByJqG/vwvQxph0Ht8NBtt38akPGeMje5I/lMtYQ0rlEhhwMkbL31XH5Lppo1BAc2Oqu2fLqkhDEhyfXDZQ8oX/uMp6FS5iy0Z+b8/Ef6mSlcKX5C/2AWT3SuNiX4LD4A=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by SN6PR10MB2815.namprd10.prod.outlook.com (2603:10b6:805:d1::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 14:22:42 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::dc1f:39cd:605b:5588]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::dc1f:39cd:605b:5588%7]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 14:22:42 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: JFFS2 Summary causes OOPS
Thread-Topic: JFFS2 Summary causes OOPS
Thread-Index: AQHYVMIYN7wRIEaG/EKfj1214jPr0w==
Date: Wed, 20 Apr 2022 14:22:41 +0000
Message-ID: <25eb361194ca2de2ea4f8dbe68bd59fb93b5b9a2.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.0 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63ab2650-2d24-4c3e-04bf-08da22d93b0b
x-ms-traffictypediagnostic: SN6PR10MB2815:EE_
x-microsoft-antispam-prvs: <SN6PR10MB28155997C3732657B25D9374F4F59@SN6PR10MB2815.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r2yCc4/Fxgu12EXdSnsRe6AQVCsnOqJORDQQUqUsTsQ/zEAsBjivyyxfe3tNVpm6KyYr1K6tqUqNFujrwiaad2gps3VA2TeBSb+DcS1RfA4+HxBwV6jS5vfV3aXWfj3iEjZtHo07qFq9orn/VF4TVT/8D70T1YR1r0TuHjG0Y/hdQpa625ognWV5mxMaiOYimNZsBmJNTurzxq5MfGdznAMvcdnyOLhjqXUIn0MMFOQReXd3vExg8bbx/9LLqlmXA+Dh79DbQ2ZIvE/OS+49LJC0wK5vTAqXD7QX5ZYVJ+01vusdquy3+lB26Z0XQP5m8Iolylw5XTgi+sOhY/dBnRow3wlUBmAF+PQWCZDp+M16NOxgKTwAitUzCOLb/vfNcgxPj+SsBQ/8bM5oLA9XYDGeTrSuEMp0SnaBOVAyBkuMa7CtF7ydDuqjP+UsILzuNDpnSpe0t5ZP6OGGMiQf+m51FcNBv0QyLKb0msrvHKheGpQQBjR6BKYFCEvj37S7XhiTeTjyzkGLl/fsATWUUp4FfLpxFu4F78oG9OQ5s0OnhxIHFYyt7yFIJh+/hPBYA/lGKQVWbljiIKNHPpm3CiPjoqJz38zmIMBSOSgQF5Uzt3zn6AChk7bW7w0UiI692o7slGMR2HpGrtpvIYaBPdwpub/zWrKdZj2intTMnsnstAu8DHDGT3K9Z/wIsWqPYJcy2GBcZAMLIlmwIep1BMFdn34dsBDCDELfgvjhZb8ZpDmzKcTgwrGiGK+wf0DGSxP96Lkd0GRHDwm0hvxs2Kq637ZBy8fGs5HmIk4re1M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4615.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(6512007)(558084003)(966005)(186003)(2616005)(6506007)(508600001)(6916009)(6486002)(316002)(2906002)(86362001)(26005)(38100700002)(38070700005)(8936002)(122000001)(8676002)(64756008)(91956017)(76116006)(66446008)(66556008)(66946007)(66476007)(5660300002)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjJPd002c2ZKNWNaTklkTnVwOEtyVHBKdHlQa3NERGlvVW1oSjBXd2Z6MUIv?=
 =?utf-8?B?SHh4QWRzVDg3MG1CV1puZU5jY2pMZkd3RkFES3Jmcm85M1VvY0Q3VEMzNjlO?=
 =?utf-8?B?UVJ4MnlOUldIclpHVit6NklUMGFZWEJhNWlNUitHeEluaVA5MTh1WDNaanJj?=
 =?utf-8?B?VUljRjR4L3RjZ1hPa1RFaW50YjNxei9SMHFnV2taN3N2aURmNmJjYXkxZ241?=
 =?utf-8?B?UmVJN2FqZlkybysrNlN5Mk0rbkVMSHJhbDVWdkd2Tms2akJpelpyRnlwUkNU?=
 =?utf-8?B?MWN4c2hLd1dhNGNlMDNTRWY3ektpUnFab0JGWWVDQTZqdVR3SkFBVFFjN2lp?=
 =?utf-8?B?LzBsdkl4NFcwUEh5YTcwWDRTQnl5VDNnb24ySWVseVBLNU9RekJrZUg3OVdN?=
 =?utf-8?B?UnRDMnNxQU8vb2JEOUN0dFFMb0pzTFZ0cVJObFlnUlhER01LLzFVN1lOZTVp?=
 =?utf-8?B?ZGdGQmhLdmE1S2hCb2VTNnJjSi9nSmVOa1B4OXFoTXZzTklPSi84SnVQQlk0?=
 =?utf-8?B?akVZL2NQRXJCMUh6T2NWMGVrUmFhZzVsZytneGxldEZoY1VQQnY3QXdQc3gx?=
 =?utf-8?B?RENvRkJ3OEZSM29qYTFLQzFIMnM0TTQ1cEpQNmxpUTFHaXh2S3F5MzN1VlQ3?=
 =?utf-8?B?OEtweE1UVG4rNnpja21vNXp2UkpuQXpqYkUyTzBXcEppQm9NbmZPTU8rNkx0?=
 =?utf-8?B?T3E0c3RGekd5SlE4NFBjNU4vcCtKYkRiSFRZUGkrY29oNHJzMXo3YzVxamxs?=
 =?utf-8?B?YjdGZlpHTDBjNkJUbFBjTDZZZ3ZHSlIvNjdLZXBUOHBRM3V1Y2FJTmRUb0lu?=
 =?utf-8?B?bStpNTZoMFNMQnV6TVRHMmNjWGpuMjM0aFVWZFRPQVhtZUVHRHBNQ25IakpH?=
 =?utf-8?B?NUd0V2UxOFpHMUN5TDRlSmRCZ1IwOWFNNnZTYmZOZ2xPUXFyYm5JVGhJK1Bj?=
 =?utf-8?B?YXdLMzg1ZDYwR0hKanFhQVZueHNrREw2TTArYmNhenhiRzE0UkI3NFVVUkEr?=
 =?utf-8?B?cDNNRXI1b3Z4UE5rV3JsQU5rRVJ5VTl2d0d2ME1sZm1kdHlCTTdtMUVjT0dq?=
 =?utf-8?B?QWdSSVJBTU41cGNqek1Pakk1WlRtWVRaL0d6QVl4U3BmczFSc0pjdHA3MXE4?=
 =?utf-8?B?ckRBRGVkdUhvWWpyRmVDak5SV2wrUzZwWGlCclhBL2FNU0x3SEI5ZVpsbjJ1?=
 =?utf-8?B?RDZjOHdQVHRtUnF3U3NVbmRCbUZxOWNZRmV6Mk1rYjFGL1UzR1drbEkvRS92?=
 =?utf-8?B?TDkwa2JPdmZBNERyZndpU2RwNDRuY2lsbEZvdW1Mb282OUh0Qlo1NHBMYXp1?=
 =?utf-8?B?WmhPUlR4MWYzQlAyNHlVU3EyWG04R2xUWEtldGdCVlVHWXI2K2M5a1hMTHBp?=
 =?utf-8?B?clRMZWhTWkYzVnFQYWppWUtGR1FxZVZURWNQVFJ4QnlBdUNCV0R3SWx6WWJh?=
 =?utf-8?B?S3MxT3hVSUFDQ0w2Q2F6WHdnSUhQcm1KL2I5UUNDVmQwSHdkbDBOWWg5V0Vj?=
 =?utf-8?B?NnB1Qjh1WFY5V2tXN0EvN1lqb2J2RU5OY0o1WTBFZWRxeVVrY0cwNDRtZkh6?=
 =?utf-8?B?eFZxbFRmb04vSTZyd2lqNEx6M3JxSWZQdVVlUTJGR1VUN09WQTVsOFZVRVp2?=
 =?utf-8?B?U0pLWjJlMGw5UXpLNHdHZDVBd2IySFBUamxhZG5KcW1sRlVXOE00MG9tZDZN?=
 =?utf-8?B?OFZMT0tSQmo4YnIrYTdQQmRTWk9BV0pva0tmSnFEc09jMm9OYllhSEVvSjRq?=
 =?utf-8?B?V1RsS1IrOFBXY1dyZ0UyNUZRdkpiYTd2RDJQR1lFT0MwUVBxTHVYeTFTcHAx?=
 =?utf-8?B?M2JENmE3WHp1elRSU2Q2Y2NzV2owVDhwbitMUXNGbFptMU1Oci95WHlYRFgv?=
 =?utf-8?B?akpMNW5rVzRmN3ZHT0pVSlNoWWNCKzZJNWdiRVZJZ2tuNXY3Y0pwOTBsU1Vh?=
 =?utf-8?B?L0RSbE00TUNleHc0dnNKUTF5ZHZMZm82YlRBYXBOOEJaVTNEUmFkUUpNNlNG?=
 =?utf-8?B?RytYQldxdis5YTdoaFVPWkJxYWtlQ0hnTGR0SHNlbnRRQ3VBejVPdHJSVFQ3?=
 =?utf-8?B?SHY3MnZ2cjVDM3lrUGV5Z2Rrd2hYVXZNbTI3SWdGNHpCaFFHS0l6N0VSbk11?=
 =?utf-8?B?Y3ZtUTB2eFQ1WGU5SFZXVlBzRnR6ZlozVUhqQUNpeGV5S1o5VmNZRkxoRkZp?=
 =?utf-8?B?QW9VOGl1RlkyS0FOSkhVa2trYlhoNnhkMmc0dFBtR09CSk1SNVBjSW8rRWwx?=
 =?utf-8?B?Rml3Um9OQWZTZXk5TDN5dGJyRFpjYkpLOW1FcHRycVdVNFFEUUovbEJ3UTVk?=
 =?utf-8?B?UDBtRkt4WG8vMkFSNFFIbWJyRGJGQitJc0lHNFlXZDAveDBxNlN3bEM2b1pW?=
 =?utf-8?Q?15nAwKTIkn4iUxKs=3D?=
Content-ID: <AD9F62E9FCD639489804A6EE21FD96FC@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ab2650-2d24-4c3e-04bf-08da22d93b0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 14:22:41.8922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R1M/YYUOyM4z5S/V01JPuBD7EHclaqdLuBEpHVh4IieXLF1JBtaJxI5d8UxgE368bDJlFzDm0md1m33nYF/3AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_072246_377473_0AE90411 
X-CRM114-Status: UNSURE (   6.89  )
X-CRM114-Notice: Please train this message.
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

We think we just hit this old bug, kernel 5.15.26:
 https://bugzilla.redhat.com/show_bug.cgi?id=717635

For now we will turn off summary but someone using summary may want to
look into this problem.

 Jocke
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
