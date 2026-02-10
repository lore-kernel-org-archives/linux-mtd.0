Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED254EB26E9
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8mZxYTbYdxEf7qLp4DKhCIy5R21Abhy1YzCFkXUaqI=; b=tvc07ed0AjmBB+
	JqKRNTIZILAq/R9Is5Yd1v5yKZqIZd0B/gVj+VAv4rOSwZ9Mnj06Ok9ehQWZZBKjXeGKzODkpy3v4
	XvWhBVzRGAswpIUKwOojejmEWR642L6ZP7q+GozwUtknqETRY4tYtObr29pBeOqeODHTPvwGrGlme
	DhoUBPZYyzKVWixiJdS9VanTSwiA+kHIZ5zTLABlGwybS0PyyM4lNOhnqOzBpOCrBBw9WTevp3rtR
	ZI8lGXZ2Jy31vklq58L6v9dB8lFvUrlQG7lKla3enww0G+yukSshAdd7qo7lKiIK9Q9S19qaUzm4Z
	W7SME9Ocf8qVYMQ4TJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqmr-0000000HFv1-1L8I;
	Tue, 10 Feb 2026 16:40:29 +0000
Received: from mail-swedencentralazon11013009.outbound.protection.outlook.com ([52.101.83.9] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqmo-0000000HFt8-2Fze
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 16:40:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZCNpVSs+znRk6hQXTIsiAY58MlpDFRRUX/zt5HXUp3kae/RlVbXrnlDonNju9QWBymVtHPpKyjDVZe3heUyYTVCfZ63Uv3xfRwJZWXFvmHnCucbYY1RXcvvlrVc0FIg44pgm6fJC2FAxUMtw8dTDOio02dQPnLL9P0hb1b6G8+XHo5eAFFqRmbGdPjN1HOJ29H2FkgeLjIhF3KZeKauXggL8a/JaDouJ0CYHBVYv/9/YOw/Tef/zuI6+DpbB9hpbDtPYtB+1rOR4vYPAVPxtjaOlUwzUw/aDyf+akvyDgRa3AkwrDSBW1c4ca90MHJ/EfE/2Yq6SJtxOE5so1jESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEA8Sx3aXhndl4BHDleVmY6cdglcnLR3LU8WhTtx7qQ=;
 b=rpJ6bmwFaABc3OG8TnLLiXvXHxZ4/Pdq3LelXMpyLgrs5fk4PQTqXpGza1KtMZZMGYb9RM/WBTzFSPs8wkyqtZ3EElP+GzEQfFoCblssBVLtSNQYzsbKrm8Pk8U5ks0BBLUd7KvRaL4L5LKXlNNyhluEy8rBLxoq+ealMOnnXXmOcjEhx7BnCDjwFuqa3FKC8Qmq30OX3FCCqXCZIvc92asqLQ8hkeSMHdo2hb5OAaAO5RXWCwRX5dU+/aGDd0iN5Tr8Gk+d7KKZed8f4/A4Dxx50hG1lCAPCv5v08E9sylYqYFnSLFHE0aWloSCKcFmcVN/d+HhmRgLavBzEtqu8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hitachienergy.com; dmarc=pass action=none
 header.from=hitachienergy.com; dkim=pass header.d=hitachienergy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hitachienergy.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEA8Sx3aXhndl4BHDleVmY6cdglcnLR3LU8WhTtx7qQ=;
 b=WobQeuwW2lnov5/r+L7OnFAsSJKQ5Ziff+B+ofU6G15lReBZSeDcUUAEr7Z1ZBa+Opn7XUzBniciHi8f4ssoPZMLK3JUC/5dEVIDigePrqzpkE9bm2XNpeRXyY4e2trRR1AbBjYM6w4mVosY/VxhOV5ALsvsW3avGIwSO8FNlrDXs/v63w1xtSuNJLcAy0BlcSkEqqGm4aKgEoqJUEJWbxd/MDgV8R9BvOKybxJz+sprhvpM/hnCjEwPQ/XFvkGwa0pzXKb6ta5Y8eX/q/ufNvySlfW9U4TNa2AjoAy8wOcPir4yKOeaD/MDRgxnelC8ETUK7NGrn8pe0b40lUVHcA==
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com (2603:10a6:10:291::22)
 by AM9PR06MB7987.eurprd06.prod.outlook.com (2603:10a6:20b:3a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 16:40:20 +0000
Received: from DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab]) by DB9PR06MB7849.eurprd06.prod.outlook.com
 ([fe80::f0f5:da:c159:65ab%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:40:20 +0000
From: Tomas Alvarez Vanoli <tomas.alvarez-vanoli@hitachienergy.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Topic: [BUG] UBIFS corruption on powerpc 32-bit targets
Thread-Index: AdyRCkfQa4Zi0XkcSIOaDwEHvEKqQgAfkK0AANfexzAAKpBxgAASt8aTABoBiQAAHEXIlAAWQcWAAB0NmY8AFokAgAB/U8m+ABbb5YAAHUm/jw==
Date: Tue, 10 Feb 2026 16:40:20 +0000
Message-ID: <DB9PR06MB78496CB06BF8E60582CF40F7C262A@DB9PR06MB7849.eurprd06.prod.outlook.com>
References: <DB9PR06MB784979B96C388174F81F9103C29EA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <356439c2-5289-57d2-52d4-8b436252a630@huawei.com>
 <DB9PR06MB78490A50AB800FB36AEF5E74C29BA@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <b93ff0e5-79ad-ff73-bdb3-e7e7d5c35256@huawei.com>
 <DB9PR06MB78498340513D9788FC7576FDC298A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <d0eb0572-e383-466e-7b4f-97e4a853b7c5@huawei.com>
 <DB9PR06MB7849BCA2FA49A7AEE3D03104C299A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <2e8dee20-842e-e946-87a0-9ff0190600ab@huawei.com>
 <DB9PR06MB7849E51C72D54F8109C55714C266A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <581cbf94-a48b-3670-27bf-3ecca07ddcb8@huawei.com>
 <DB9PR06MB78496EADCD11536AA66C22CFC265A@DB9PR06MB7849.eurprd06.prod.outlook.com>
 <8f65d531-b752-b058-4163-09a66fd9a7a1@huawei.com>
In-Reply-To: <8f65d531-b752-b058-4163-09a66fd9a7a1@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hitachienergy.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB7849:EE_|AM9PR06MB7987:EE_
x-ms-office365-filtering-correlation-id: 3d78d649-75b4-4dfb-dd52-08de68c3143d
x-he-o365-outbound: HEO365Out
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?12i08X8YYFLJoDEboQCxjkF8sxq9eZOhkj5d9Jfu7J8+S0kaIoK+4E8f0N?=
 =?iso-8859-1?Q?Fqgx+89htN2Rv+40+jPnrExeiILlKILMU7nRCFrQ4oOrtWk0CG7xB2cC6X?=
 =?iso-8859-1?Q?fMEt18Pw4w4Qj7Z8RbVc1zaK69UWhTOKcVAlsB/dro0fMHejXdP7ZkZS2g?=
 =?iso-8859-1?Q?DIhW/hSO996IPBgln9qWHoeSvhJJH9Ra9ddIKvOFlMYz/vFEVRR1sZnp3p?=
 =?iso-8859-1?Q?Yz6zgBe9ksYW+lP8xqqMiWOXYxMSfZNLIKIoN+tlnFvObQL1AzIJ2GtXjZ?=
 =?iso-8859-1?Q?3zQx2kFPQDEzplCQbu4kxmgD2BgDqJPKGFNXWsNXGiS1eF8CsZkEn9Utfq?=
 =?iso-8859-1?Q?caYEtBoAEdcbj3wrPfwoo6H92Y5Fe2mxDUJyClfe56WvFhR45yAoqwbAsy?=
 =?iso-8859-1?Q?0y3o0z3MD/dzyYj6EVwdcnRwBZIG7Oj/YA5jgOLfuDQIhoPyYLDN11nRxg?=
 =?iso-8859-1?Q?HO9xyHw0HN0RlXzGDT19kyqymqgqsSIXlxPi/eX++0xkOPRTp/eL5bJt0L?=
 =?iso-8859-1?Q?y7o1jcNjoJPq107CR2osj/JRSEB95u6BuaIoAUsbDuT/PCGYna3GzvF9+8?=
 =?iso-8859-1?Q?aRzpcrTmkPdJwLpObTRcN2259Ps3DgJKtCy2T9RuR4VKVWI2/zdXOhFxoI?=
 =?iso-8859-1?Q?CmmHp7Mhiqg/SxhQJ5U27F/tZTRqTQ6SHwEUhHJMeSWjObguP4s3+Ti+q4?=
 =?iso-8859-1?Q?c3aRdVsQKShrZOeIf8o0wpMIOl9clfO2UMQ3SXd2p2GSXKqauy0Ncrmeux?=
 =?iso-8859-1?Q?yqnHrmFH1nwWQNyG1wLRUa9UvdL3nILaW+rZ+UswwWDnP9tC1Ob/ckkvcn?=
 =?iso-8859-1?Q?Qhw0DZnUskCklf0l1IVYrhr5iNvVl7cfYb90QltSIIsJ07a9AhYr5tlwiK?=
 =?iso-8859-1?Q?ulx+anaMtmiVvj+UqUyqBVItKUGzsJ0udY2j7dvOrw6tsO4K/CzH1OM2rz?=
 =?iso-8859-1?Q?lIo1efuS8B7TGzKAb1XaRHdXLCFR4C0fJAxBAF03P5ftLC03fabjj8eEMl?=
 =?iso-8859-1?Q?uBGgqBPHiWzLw3pliFf+grln7YJSn+uLZfp5y/MUcCj74akJFqAThR3LQi?=
 =?iso-8859-1?Q?U7smHGvQFu7vguiuqMroOoJZsxTMocIZyAQCSmXszwOAuPhLRJYmNXMJhv?=
 =?iso-8859-1?Q?KDpgAWTt2l7FKrKwvg2TUjs05aSHEbhGn0Wjc+omJ3Gejrj8VMh/GlY0t3?=
 =?iso-8859-1?Q?slVGAvucOJaFRmf9QDiPS2xRSu69Xa8/BK0aAaMXKlgLh3M5hn4A0/5b6A?=
 =?iso-8859-1?Q?URhiGmrW/t4l5CBYyda/ulLV5HNejeTUcKbZm534rCXJe1wDfJ919NAIon?=
 =?iso-8859-1?Q?0HqBN2t9A1VCY4+ftfMm0ZuM9crcBe4S9Gf9fzashsSnyYaiC7CHZNQ4ke?=
 =?iso-8859-1?Q?AVX4amdW9vk5uVTjSa7+/OpHD2Ihgon5NtX9oqHkT6wzLW28k4szF8R9NM?=
 =?iso-8859-1?Q?qI/CU3FJ1wu5O8WIyVMv5KmupjUXFSR9nZX3rQ4hv9KPRaxmmHZolfaN3K?=
 =?iso-8859-1?Q?Q6BADCW5Z1o4nus7k5z6mMHZsaBxxu2dbbwCzp0A7sbszAfK2K3ZZBot6M?=
 =?iso-8859-1?Q?2Oe9pBHfTT3ch8uJqGWMxrsAH6o5h/qqYRFyhpDdDmYkX2VeRj+mSkGH/0?=
 =?iso-8859-1?Q?Ktc1Y72hcWRhoUoj6AJGFBeWRMqFFJHWufU2sJP/UjGBrXpPrycVjDuFa1?=
 =?iso-8859-1?Q?K6oIaaCcnItOPWuuaQw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7849.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DAU1qCdgzcsh+e+8lyx9Mot9/BN5a+Dwx+z9M3J/iUqX/Mka1SF2OGigJw?=
 =?iso-8859-1?Q?41bufYyHbzNvq4lI5G8k16pWp1vz4nZo+R4OtinmNaM8d7d6qaX//hYS2c?=
 =?iso-8859-1?Q?gj+eID2Xw4/2NHnZOUT9oZ05k/V8T77VPk5QvuYvjXxSCC9ZiDvWxvey0w?=
 =?iso-8859-1?Q?57NY4U9w7FhEkAQJl8Ba7Q+QEXdCNNsxtOHKoptCX37tu+6hNWe2pN1JQ/?=
 =?iso-8859-1?Q?8y8AmwTDklc8YqudlIqHF37YeZ0nWsClXgyGtl4AWSPVSM+1W1+38WtUgI?=
 =?iso-8859-1?Q?v9RxQteoYoZDs/QOiJhJ0mh9tCUG2xeqbb+jSqWcyzolscyGCXn7UoeXP9?=
 =?iso-8859-1?Q?1m40tPoSLgfLHL8l8dqZoMYgn+MHpqVHQ8feHFz7vRI5SitHqyOj3VkjR+?=
 =?iso-8859-1?Q?/RHw27OheEXIbHDFZY3HTY2iVjghxPMTVOjYQYK1OTZNwAgsUIq5Rcweqi?=
 =?iso-8859-1?Q?XJQjZtZF71HwjO/shfRBlyTCpn10NkRC4YVP+nNet3QaGOl2169P8b0wVP?=
 =?iso-8859-1?Q?seIXsaXc52LxZNPS4YQuCUX+SBEEWNifGWcYDbGrnK0WtDmXoKQ3ifTACx?=
 =?iso-8859-1?Q?O+rPgmm0GNkLb2uSG6fDPUJ3/22EgAj/pKtntSNc0Pn1jfh06QQ+YYX2Ue?=
 =?iso-8859-1?Q?Kg2H09VthDWZsue0lzgkyztycRn4EsUbhP5e04GMcMdkdIGRZTqnpy6u1S?=
 =?iso-8859-1?Q?8nbDGaUMry4ohkYu4mkYXcKsAuDobEqpA9s/DMNPwVUlRPcE71b6l0y3Ld?=
 =?iso-8859-1?Q?zLoRFe0h2PIdE7XwxJs12vJj176kO0kAqOWbHMu5cENZGtE7U99AL9tW8t?=
 =?iso-8859-1?Q?grkgvIZqMBN63HggujgiNuSI5C6eTIo+r6+jQ4XUEFII3UqhRD47jaju81?=
 =?iso-8859-1?Q?DMwEvmzno+q7l6SwsnMT0+jNGgAEygBI2iE/DcMy8jCyFWRLi9mV2Zj+Nl?=
 =?iso-8859-1?Q?VAgH7733RWao/m/Du3/kQ3RmLeK3RINP4bUA2zwR5dCp+9yAqLNd7aDvdL?=
 =?iso-8859-1?Q?+BkKQ8WQbQuI4OVqMJNSkFsD+ms96BZoxnp8p+bKr+M5TUONip9JKTevGZ?=
 =?iso-8859-1?Q?IzhYMR/OFn9padOl1KPDno9u6YwXrCCCJ/sOWNxEjzxQIvMJekEsH9lkE4?=
 =?iso-8859-1?Q?Kn08kLUbV5yP5PxLUiGq23x/7NIUJIJajqL8Jiekv1wrGEDRPLoXlQUbFj?=
 =?iso-8859-1?Q?oEaR4sRektB3lDDGboVZA4yGArVBCkwNQ2PjvdBN8/5+gEX+pophVDNt1I?=
 =?iso-8859-1?Q?BxgDUQcxVfPd7DPYhFra8Yqtg1CSqjJVjbkA8GrYncUpGvQ47LH3Umu9Z5?=
 =?iso-8859-1?Q?pGyOkgOpb8K8/VS1PV7iz3OdjzjgjOLTE7A8gwXkUjhG+L/h+iyyzWiRQa?=
 =?iso-8859-1?Q?G8KRBXjOTTboaj7HmfcGyLBrz7XHzB+igEnac3slQpJvMdW3d+oYtboSYd?=
 =?iso-8859-1?Q?jiG5Iew4joy2bGc1YZx41Eh1/2g4KnlcEwU97l4QJA/T0wsRPxqJvc2uDZ?=
 =?iso-8859-1?Q?EtWMh8z7nHZvGZTlshTQKOu4wh8npQckgkgLMfS3kiC/PaicKUDLVramzU?=
 =?iso-8859-1?Q?cCJxoaNR12gwNrDy72mfd5LId6/0j1N6h2SIVWBxeZ6dBOCS08adUC1X20?=
 =?iso-8859-1?Q?rBtqLNOJms5KF7G1Ohvjcw1DyvNbDtjuS95So9Ist76+LaUsg48zg7VcVG?=
 =?iso-8859-1?Q?sscuiy2NNZwFYJSnhULDChkZ7+cR2aJ16Ri/WgpLg+yHPtSRP/2HntxFz2?=
 =?iso-8859-1?Q?gjNyNfog5oR/9+xlar4llkkOb8rM7U0DWU4K/wwKZd0ePLBIXLCZM3h7GK?=
 =?iso-8859-1?Q?UvY+tIb6pmi35LwcUhSn1UczLGx0nrOQR11R1yzt0nCAM6oPmktF?=
MIME-Version: 1.0
X-OriginatorOrg: hitachienergy.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7849.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d78d649-75b4-4dfb-dd52-08de68c3143d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 16:40:20.0674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7831e6d9-dc6c-4cd1-9ec6-1dc2b4133195
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hXWfQO/QSVYSaguf6C39eLbelCcDDZ7M8va+cnCTmqlV0bYpQZAUhix99PjnfhUZrNBDbPhBCZi9enDPnut4pIZv6sNtUj0RMT1E9IT6BvxU91GgNMV6mELC5RFVyCtK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7987
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_084026_597990_C8FFE2C7 
X-CRM114-Status: GOOD (  11.82  )
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

>Is the ubifs mounted in readonly mode in 4.14?
>If not, the do_kill_orphan process will be committed on flash.

No, it is not read only.

>The commit 3af2d3a8c56fe7dc24f60c4df0ab85b7ac941902("ubifs: Fix
>unattached inode when powercut happens in creating") [v6.11] is
>introduced between 6.1 and 6.12, which will add every inode into orphan
>area at the begining of creation.

By creation you mean the first occurence of it or whenever there's an update?

If I understand correctly, what you suggest is that it's possible that as
the new inode is added to orphan area and the board is reset and booted into the
older kernel, which then cleans all the orphans even if they have link count,
leaving the fs broken?

So, in other words, my understanding of what you say is that for
3af2d3a8c56fe7dc24f60c4df0ab85b7ac941902 to not break anything, any kernel that
mounts the same partition needs ee1438ce5dc4d67dd8dd1ff51583122a61f5bd9e and
4ab25ac8b2b5514151d5f91cf9514df08dd26938 .

>So, you may try option  1 or 2 and check whether the problem could happen:
>1. mount 4.14 readonly
>2. backport fix patches on 4.14

Potentially also replacing the 4.14 application with an application based on
6.1?

I am also interested in consistently reproducing this at my desk. I have been
tinkering with adding a message + a 10 second delay at points in the ubifs code
so that I can reset the board and boot the old kernel to trigger this behaviour.
Would you know at which exact point/conditions it would make sense to add this?
Or is it not possible?
I do not fully understand your theory, I have read the docs for the fs but I 
have little experience with filesystem implementation in general, so I am not
sure how feasible this "hack" is.

Thanks for all your support!
Best regards,
Tomas
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
