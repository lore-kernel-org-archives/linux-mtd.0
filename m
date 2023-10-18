Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A023CDB47E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TxDZ0LLB+h9hFoCGcqLWMiTvzP/AeeDCq8Jabrj4obM=; b=tdtEelK0Jberyx
	uKZYMv7ypiVqAxDqQxN39by9oiTvKBa9p4nasjqdNDAi0vTgAvcbSCMk7vVoF/RNFDulq1bLdqfpJ
	PXvIhqQGOOIOdyT7HwTNeBR8Xg//7d21F0viv9I4wqoHXYIi7LkKZBMO8jlZtpQeVCJBSKcKbTE1e
	qFG3oK+kwIR4XRB0SLMes31ZUGBzdxwl+q7AX41cnkxyOASIpi+q2aetN+tQrldt57BlyvZf2Xhq4
	4yDH+CoQSTynJPrRxCATPtOasyp3SScaM3xJB0MvcKVfBlDy62uikLKQuwuvP3TKlm5/Y3qtMyn+x
	pfSoRCxhn/GiRNcsUTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt7Bi-00EqMJ-2d;
	Wed, 18 Oct 2023 14:06:18 +0000
Received: from mail-bn8nam12on20613.outbound.protection.outlook.com ([2a01:111:f400:fe5b::613] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt7Bf-00EqLv-2F
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 14:06:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LayFoISHjOnW6Be6L+zxzFa4SbKyk6uyAAWBcer98qYt4O4x0dYF5Adill+15cx7Sk3wazLW7FrlPHNvC685IVky3eVrbS2olbiIJJfXAO1jWtAU5+SVFfSgMiFKc19ROZrZKIof1yf5ceDzBb7CU/yOeWRp5Ae0nVWfwCxlnyX48H8aGpWuKqOHU0htm5F/hN48qosFqHaKUMsl6GKkdxVNdv4JsJxb5KeqYj8SMYCpHtHw/mEtekc2Pp5Rtu5vVhVtlSC0v8xbUqmqP5iF+Qbze0S8znEg9wH4DqJjIkhX76Mm9Gxn9FxLzxUsO+YaQZ1yE1Ye7WHfm+Am5fzhbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdhVApBt+kXTWe30v2SpX07/KAIQm2MuHZwIcgoFJOs=;
 b=cXXCsx4aXE0WdyNIL5zPUniMG1vg/4eybQ3HnutSzDplx44uBduxamNViwRoz3T95RJVemj44mEv2iCSqhbfWCczo4kPhFs+W4vKYbjtXtZ6xGKW82pTon8L9m7grR7sAeOuUm9aE4YL321Qe2eg6o4Gh8pAwsa4UIrYlXHw+v+7iVJLs2LCCS53G5Ridli9zziwkTCjpxqqo+ls4IkB9jOIG19WGh5RPk72W6CsSRt6/gEuAppJKZaIFNAA2so9ElBw24zDfuiGKJ2mvya10ZxgeAXJNCwBjVLtXeMjBk8YtnyV+JNcmPHKcUdfkvdCgQObcQ6j549zRVMT9NvRqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdhVApBt+kXTWe30v2SpX07/KAIQm2MuHZwIcgoFJOs=;
 b=UnsbQkoSG//RUYzkBqLY0ZihYBW2aGw2bI3Chpp0TrQzTzBs6Dex0dM+QokwtsGCiPsBH/oQta7/6YOHjdPeq/o3Su4UFeevtRI0Y1E/U0tHeYDCkYaOU1IjGstlfpdc5wIyZskoDI5vIQvuf1RYVtO0S+30JIQIjnnGaTqoN5B/Go1twu38lsVZNWwS2NFzUQrf/8opdaNq7Ey2AbaxYWr3dxZBVxqaIEV9OvxrRwfgyAwca3PhmvOnwYXeBVAqGdZVKOixHdRd10/MBC3DLPyIBlGvRpolIxVhlWTZSIfzRxcpYktGwMiQshZj4/cCbc88EXTF9zRkyheaX2iDgQ==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB7005.namprd10.prod.outlook.com (2603:10b6:510:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Wed, 18 Oct
 2023 14:06:04 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::afbe:b011:cdf8:b0c1]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::afbe:b011:cdf8:b0c1%7]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 14:06:04 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: JFFS2 bind mount bug ?
Thread-Topic: JFFS2 bind mount bug ?
Thread-Index: AQHaAcw7eCRMFRTuG02iR4aRAwe+EQ==
Date: Wed, 18 Oct 2023 14:06:04 +0000
Message-ID: <1876d96f398217d9e7d166a6cb4068dbd9e8c69a.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|PH0PR10MB7005:EE_
x-ms-office365-filtering-correlation-id: e8e384de-52cb-4a9e-2f5d-08dbcfe35e32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Iyv7FNKwxXJZ640zKBCp8xZqk2hmdLnPI7YyCnfMWN+AashQRhb3BE9pqGfDpb32uXZR+XvwEKPVV2UOvDihvg2ONv5+pgd5Pi/0p0iYTAwQFekelVPx9BhfSuXjfzFLUo14GlbmFxDZdeGYPHq5BnMikBbaE91PY/+55ShqQ8evZ2mqUYBFYJsWPFt5eDut/LKznyV3937TpsKJ98MvhTm2jaKHjpHlMsqN23YEbFJxRWPdpVupubkrPG1yq+WCqhzfXMqddQmovWQ9WgelXCd+OCWWmyJ6UdIbaiy9/ed+3z4XJHJILwcwgeI7lKZcbdJFzGVa7hcvwuGmTiuvO3rFwrYedZrrY0mFR8+yLeNsFKYjhMsQO68utesXx3S5pgdbobw31m/FxuyDqWe5NIa6rC9eVjP0BR7fJ+BLtPWcMWmPx32+hfWu0vsKexkk13217oIP9pCHCx1Cof3+QFQqLWMmhAvPodXbox0ecSTIV/7PDD3R1M7SxRwl1zGr2XKEnRyLfXxz49KtLvzxTM53USDr9X3+TQK095XS5Xek9BHtlYyR6mqiMIQEklWAm130si5YNX0nTU5/WgP+8Un+iWBsn/yLka8hmmXngSr7HST/yraozYBuVbN6P6c
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(39850400004)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(76116006)(64756008)(66476007)(66446008)(91956017)(66556008)(66946007)(6486002)(71200400001)(6512007)(6506007)(122000001)(316002)(478600001)(6916009)(38070700005)(36756003)(4744005)(86362001)(38100700002)(2906002)(8936002)(8676002)(41300700001)(2616005)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVhERW9PMTY0KzFHbnI4WFE4S0N6MmVNRXdZaUk0R1N6NGVVQVdWN0hrcUwy?=
 =?utf-8?B?RERid3F5aTVXVVJEVFlVR2R4M2N2Vy9yVnI1bEVHWW10QlRXVURpY2hGcGpl?=
 =?utf-8?B?TlN5TXhaaUdKc2NOUDA3S2VqNWx3aHAzNnNwdTAvMjhnL0RScHFaa05yMW1i?=
 =?utf-8?B?SVExRHJRZFBNN2w2c1JkV3Mzek1TVWljck1Qd2FDU1lyemF5SFdZR1lsdlJt?=
 =?utf-8?B?Y2drOVdwTW1lQWhpK2cwcDVKUFg2K2NmdE9uVkNlWmpPeGJML2dWZ1JqK24x?=
 =?utf-8?B?T0lDTkhadXNNRG9EOE0veGlHTTFzSUJwOURoc2xLaVFOWFEzdHJZVTZHVzgy?=
 =?utf-8?B?REpSRVBSOU9iRzBqZmpTejFBaVNmRlN2UEtTNnBnSmdQQ1dPcjZya0NQalVD?=
 =?utf-8?B?aDBaamw5T3ZyNWxNclpYVlE2Nm5SNEc4SXRmOUdlTFZ3cHhucXprUmhPSTJF?=
 =?utf-8?B?cjJKUnFsM2k0K2FmditZSlE1akxVWnZnTWVldmNrOU9ZblpuVlhsUU5OZXcy?=
 =?utf-8?B?WERZaE9HYnFVR2dZWHdsMHNHTlhIcXFocG8xRDR6NUhjalEvV216ODRPN2pD?=
 =?utf-8?B?UHVxR0tJaFpCQXF4OFE3K1lMMDRkak10MGRtWEpaNHB0NmtnOHNIRE1rc2dQ?=
 =?utf-8?B?N3JNMlRqTkVIZkZwcmZHeXduMkRxN242KzhFd2pxczBubGNYM2c2NlVzYVox?=
 =?utf-8?B?eTUveCtjVXZuRzlIMkNHTVdyQ0FYVUZpdXp5R3FlMFcyNTVIRjdCK21tb1dE?=
 =?utf-8?B?eDF0cnNRMmxOUTlMaGNNUXZKTEdPVW9HU0xrNHVBaG1QTHUxRjhORkk3VjZp?=
 =?utf-8?B?TEdSSFdQRERtWS94cVdBUk0zMjBKemZ6WUdiRTBLNGE0eXBzd0Q2ZFYzSW53?=
 =?utf-8?B?RGJOeEhrWHhvWGZLYTRFQ3BNdzlxY1ljU3VGemJNNDhiaE95RG5udzlEVmJi?=
 =?utf-8?B?NU1PMEYxQ3lYOExHSnlMTnhwTWlvVnI0SmR2N0F5NHJGYWFKU1U2a28wRW9V?=
 =?utf-8?B?NStlYUgwY2gyNC9MdWZYODdsNmJrbXBseGx0NzJwZDlZQTVOamIvaXNzSGd3?=
 =?utf-8?B?ZGY4aG05cG05RjdYL3phREJXSEJBOUZ1TXZXdlZ5dnEwMUh4UGt2YllIYnpk?=
 =?utf-8?B?UDhSV3liYjJrSUhwSlBEUVBwL0c3RGpHa3UzSGkxOGtYMVJKeUdWa2RqSVV6?=
 =?utf-8?B?TGY2S045SDBMOW9vcnVzZ29TN25Xa2dyMGUzTjNZU3oyWUowblBvYld2dnFV?=
 =?utf-8?B?VnBKbVJVSlFMQlNyRGIzbll6SHJYSmc5WEZ1S3RHTEF6WWp2K2l6dXpNM0t5?=
 =?utf-8?B?TnJBSEZnRzZUWGM3d3J5UktOWDQ1YlYwQ2VoOHphTDlRWUQ5aGREZ1dwa1Vu?=
 =?utf-8?B?NHp1UnNvclpEM2s1VUNVMXVBVWV5dDlkditSdjVSMG9JZ1RUd1JaS2JSSnV6?=
 =?utf-8?B?ZkRNL1grekpqSGZOWG5LWEJrc0RTcmQyQTBzOVg1ZFBreFRnSWsrREorcHlP?=
 =?utf-8?B?N0xjVDVCMllFLzlxWEdCNGRZY09TaHBPbHNjcG1SV09VcVdpTWJZUm1pSWx2?=
 =?utf-8?B?WWxJMHpHUkI2SXppdUt2bHNxMWtOYmVUbndnTEZ6dUhNRkhhbjdQV0FaYVFR?=
 =?utf-8?B?QlBMclVHemxqZTlFSEduOGdtLzRUUWhRY0ZVUnlZUVlkRFZPbzFERUwveU0r?=
 =?utf-8?B?UEpqWjNQSFI3cHJnd05VOGh2RVdhTUZJekpWOXREUStIdzNteUgweitDY2cy?=
 =?utf-8?B?V1hXVjZCdFRaenhIc0d6WnppS2hxQ2I2bThqWDI3b2VNWC9CaHVDcjdvemtw?=
 =?utf-8?B?YkYzYUorMnVYZnFHbUJ6MzI1RXBhMlpvTVM1OSs5OFRkTmJPcUo5RURuQjc5?=
 =?utf-8?B?T3VGU1EyMFFyMG9WMnkwNEx2VXByMG01c3FsbFBaYkwzdUJIc2xOUFZSQUVJ?=
 =?utf-8?B?dFZSNUp6K2J5QVVoaWVwRVBnVzMzL0ZtUythVXJDL3l6MmlvL2s1dEt5YWRN?=
 =?utf-8?B?VWJVM2JEVmhtemtPdHRGcWFyMWNGSFpjc3lGZVcramY5TXFpeSs2NWtCT2d0?=
 =?utf-8?B?c0V4U0dtZHdSeDVmd0hFOVUwWmwzdzgvaXNybVl5ak85V3grMG5wZ0tKb2FZ?=
 =?utf-8?B?TmpBdDh3WEt3MzhrSVp5TE1pSkNrMDh2VGpmQWZNRDFPbkdraWlBcW9la3Zn?=
 =?utf-8?Q?Tx9qEfgrD8IezBoUT6J3//n37oRqzb3Gjrfw2sb5R/vK?=
Content-ID: <D4A3CC570AAA68429CE9C6545A1DCCA2@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e384de-52cb-4a9e-2f5d-08dbcfe35e32
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 14:06:04.7744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tn5YLH77FSMNSlBvW+BSVXgkgT5fRZVvd5yChCKlAG24seDsZie6DJoR7QugE80+oH2DvB1/Skd6PcJA44GDjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_070615_798921_6A469B2D 
X-CRM114-Status: UNSURE (   7.00  )
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

Got two JFFS2 partitions (on / and /var) and do
  PWROOT=/var/os
  mount --bind "${PWROOT}"/etc/shadow /etc/shadow
then I modify "${PWROOT}"/etc/shadow and expect both "${PWROOT}"/etc/shadow /etc/shadow to
be equal but the /etc/shadow is unchanged!
Kernel here is 5.15.129

Doing the same on my 6.1.54-x86_64 works which uses XFS/tmpfs works

 Joakim
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
