Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D56C52D6F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2024 06:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nYGlQOTyO6Saiedk0tCzBqwu5GWCbVR+mtYwdxpu28=; b=nBXcLsODhChA0f
	hm/mfbxtSOqE4SMSfOXQ5mY6w6pkQGdmTnX3xCM2+WOT8G38/VhP0uniUA045BsYl4cYoTXV5M8X6
	zV7Qe5LbiiXn+yaZc4nOdReaEE+/LWI3nkmt5cBIUEqJ6poYYxtXRkm+hI5uOHooK2Lp3uwpxmz2U
	bfEapvMLFegOATpmxBGyhnL+tjg8jb+LdtLHfd51BhNgR/JbXdmD1Uv/uVQ744A7PlOSyJceiYU5i
	ps08vDUl6YC4xcvIzGFN2fP0cY/T1zqTUagq3KMa5iHBmoaDytjdWeukRQeFo6mn4xeh08Lwy38AE
	dVqAAkEz4Sa5rJoCmZqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sipe7-00000009zzY-1wxV;
	Tue, 27 Aug 2024 06:25:39 +0000
Received: from mail-sy4aus01olkn20830.outbound.protection.outlook.com ([2a01:111:f403:2819::830] helo=AUS01-SY4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sipe4-00000009zyu-2juT
	for linux-mtd@lists.infradead.org;
	Tue, 27 Aug 2024 06:25:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGQqPWX0fuK9fPZlO/+ZBt7fkLpO052OJa+KSVW+VeF/vjC69STBiSNd68s4kyqHsb93WerJ7aWJZNpHNxDT3tdCrXD330F5fhd/00hHZ3OWB7EtbU3pFL1ikggcSvj91jf8uFzds301tjU4KUJq94dDaj3V6f0YapBJKH0yc/UO/foR+gEJ3iddgwCSXsWpoaDwwiH8eBCwvjcSZUv2Uzbe010dRKj5jwk7xvexaJpTKPXAE/pOnE8UnNy0Tkk/DEXSm6Yi+pR8NIYFoppCTgLaC0oMmoJWN9/FlGWLFtS+lvOVUCDgui5KTYG1XU3uLMfKwrMHDwmnkBg+Dw+5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJw8UGF/N+tdXsiGYM3+ud0TSohYrQ8Y/DXotLpv/0s=;
 b=AsUrwcEQw4O+4gU04GCZwJ/OtfMJp9SAORKj1k2idoQUW3TNZWPL0Gj4B5iZp+RMWamirl4FLYBNPfN3f/DbnjYIehyoq1wcN6TD/kgyZesDqoBJZAzjOPYoQZPWk7tHfHDk99RYQMmInGzJeqS+BRRZcCW7Z1NMVfRZIOn9F4YvNVuYt+hFu/KcvjYffnWf/1wszlL8CHtDRvjv1Bb9HrlwmuB0LmyOkzPJ1/DXiq1nUAbFtlzZly7UUZbXRHSCQ3Anecb87VacrKHS3uKxLYom6GYisGSrlTzKOp004hYmolUOAdWPnsBVy/tpvcm1yLYoUoe/NozU4y+hcj4C0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJw8UGF/N+tdXsiGYM3+ud0TSohYrQ8Y/DXotLpv/0s=;
 b=BsBEs3VeECw3jUQVhQOqPrh8ZzsFoS7BTJstGnoOwLOTW9cTh+2lZj0hKHpCPWvVjF9ytYwPjTP253CsnhXTpv09w3WLNhHF0sPzkeNWBgQzxYRFuvI6SNgx2FrQ1KJK5K2rw91QVOYg7ybdQfgz7retnu9s834PsUG8nJp7yfsEfT3HCG2y0QyBNjIAw+15ZzB0VOITr443/Fleb3IPgfdsL4LIMELiGZ/tCXmSprM0Sbbcfzfi/fAQj1mMoYsy8yCdT8DdTjunCkf/YpeR42szOY1vqOBPTucz+TbHhGegDwOj3f8I2o+Eoupqpoud1y+PgpjbiPfr4PvWL3ukUA==
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:159::11)
 by SY5P282MB4586.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:26b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 06:25:19 +0000
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::f65e:52a:9bfb:525f]) by MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::f65e:52a:9bfb:525f%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 06:25:19 +0000
From: Ryder Wang <rydercoding@hotmail.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, "richard@nod.at" <richard@nod.at>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] ubi: wl: Put source PEB into correct list if trying
 locking LEB failed
Thread-Topic: [PATCH 1/2] ubi: wl: Put source PEB into correct list if trying
 locking LEB failed
Thread-Index: AQHa8ehbXNn7k+G2z0GDXSQiOejptrI6fQlMgAAZdICAABeXeg==
Date: Tue, 27 Aug 2024 06:25:19 +0000
Message-ID: <MEYP282MB3164273F8D66D202F6A9F5C2BF942@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
References: <20240819032622.2241165-1-chengzhihao1@huawei.com>
 <20240819032622.2241165-2-chengzhihao1@huawei.com>
 <MEYP282MB316452BB4702F6B48314C57BBF942@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <6857c06d-fa16-40ea-a14e-bb67e4406148@huawei.com>
In-Reply-To: <6857c06d-fa16-40ea-a14e-bb67e4406148@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [dK7jJcx/cQrwH3IvNF0NfBolltz1XJVc]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB3164:EE_|SY5P282MB4586:EE_
x-ms-office365-filtering-correlation-id: 78fd363a-2867-4d8a-155b-08dcc661062c
x-microsoft-antispam: BCL:0;ARA:14566002|19110799003|15030799003|461199028|8060799006|15080799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: NSAPkca0AXoUE0UV8ZM8/VI/XqH0Xn1y4UUGeKBAQPZwPx3TQ0IMOstQujogg5T79me81Ly5i+BqLJP3IshJFfPLbWDyVPnZ14x+Ja7xQGUagA6fUSHRHf7kTOROAmz5J1vksKztYX4+QbU6wo6zTUDwac2E6s4r30Ad6Hu/9Oo1Amy0LJfVJxmYtDD9bzscvBK2rZj3Ezaa6L8hLPrEnvCs8QvVtjuE7Ff2l6t6ZtqXs78cE1xKlgGgpFUt8ERVybbhguCb8FL8wXYpLcKXpjCtUPX/DIPjlQNBo0hYywKMxYmj3m+CwDYeX1psKM4Xlo+B73d/sg8/bUU2vJUVKS+tfDo4IG5iUmUdc9SwlCzGTnzxNAe9olM+T7oAmQuiWHa6hYOz7nM+dwVYLVNvrrS6XlwMkCQ51K7MTl3pFD84FDtMPq9AxZJM5tZwe4QAbQYVL2LCEcT5D5ZxUfcbdVyTIRl+53LtmrLxmxGGPlW5k+fAopzzD44tkmUFq7Cs1FVKgalQPFA0iw9kYwFkfhXV1xfvuNFMicax79NK7v9y6bU02ZIME7MOOwQFBof16uTROFuGVoQpTj4ESqV6GBtkPLshWecjSHJpV9cc723CtNwNten6zb9NjiyxCgpYoaFNsvQ5xJMsP7498uCa7SipcoKYTFjy5cK6RGPPyhwaId5Fl7yHxUF2G4XV7MK889xkU64LHrgXUbi0BBusCQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eoFLJpLOhqK3kDkwA7EZa8/EWCxfC73uEB4sG5sWxQQoBKxzYepAAfYXfS?=
 =?iso-8859-1?Q?Uh48pZLuvS3ir43H7V8ZydTUkXrbwsh3YRl4A7uiUTYhO379cldQa9V0Vw?=
 =?iso-8859-1?Q?tMmo8Vm2fLUBvjuT2j+vmlHeRLI4aQx/43rAdVI1MIc6uCpkjTtYnSW4e/?=
 =?iso-8859-1?Q?R1AaiAGvMlrqxfaCBwm5tvnkvsFxxViWnr8xsY2Gvd5qXsia+VZS1vuyrx?=
 =?iso-8859-1?Q?GUzU18VEOPP4SKPgIOS3j2YqZOWST0n3Z3wEdDBg5jPb7i2AVOU1YSLuA1?=
 =?iso-8859-1?Q?XcKUQA32w+wDpIE5YuOsXpS3Dgx+g71CQcNQpQzfoCKpH/DlkamAozpmZf?=
 =?iso-8859-1?Q?6SRQalGQ0BRoTFvJ43/tw6+fZ6nW3/yaDuwS0J7FC9JNdk63Xp/Semi7ZF?=
 =?iso-8859-1?Q?Rv4mk0XXv+r/b4+SXgIWchx8yYURd0s969KBkm9zDIwT3HzaAEdhxjIWvm?=
 =?iso-8859-1?Q?mAcDubgfMofbzWooJHbA7Kql5Wn97UN8HKqKl96b4VCdzYGEUdKrlDxdmj?=
 =?iso-8859-1?Q?omlMAFCNY3QfEiEorpuZRBMxPRsEh6z3wNS2kbk4iA8sOckgIBrrjTjcSI?=
 =?iso-8859-1?Q?mgTyvnR6nzJTK4cPY4lOuPF/ftYi7W9uvOX2GaBpkl8GkekC5o7h6R2jKo?=
 =?iso-8859-1?Q?t62CX119pabAACerDz5EqXOOv6JnfguFrjVbFFZeeYKJ4i0t10wKM7aBW3?=
 =?iso-8859-1?Q?55Q3IFtHnoFX74aC7jqfJVfa7wdw2Qfw7YdpDVe9YxDnyeDzGEX1UgTa63?=
 =?iso-8859-1?Q?FPsPuDjS+Li75FxnKBvlW+h8KFbz4wo96J5aI3XaUacqVfcYQuYMyGwtA0?=
 =?iso-8859-1?Q?J8xbZ5GecWinCk1npAMlDGxm5+0PeDTJjzBb0txUZIkxZMhow8Z64kaZTy?=
 =?iso-8859-1?Q?Y1askJjvMYJWRqu6tNqiRkalTKTlNClcMHO8hojnxCE0c22vY37hbnRkZo?=
 =?iso-8859-1?Q?yPWVu8ID9A8ZRm0y7DF2OyrtaVgxlhnDy/Ia1QIsL28B+Qq/WpiDHQjcjh?=
 =?iso-8859-1?Q?fSEL8ABA+QbiZy+eMLbW5zoyOiNc4nwD4wNerAOUS6PvgLN0ZZEKUF5y4E?=
 =?iso-8859-1?Q?vx4HJYcoO82UHUk2w45CP5Yt2foX2qjZIBbABX6HSI+Ji/M3VID7ZSWrEg?=
 =?iso-8859-1?Q?yig5RRWdJ+9oarS+vHOv1IH66jd7Va9l46YBby/NqETBphOCz0Nk/Pyl+h?=
 =?iso-8859-1?Q?jdwf/bQRlQh2Ge8k25Yf7Q0RzhMDcuLzBIvmjr1LZhvnvr2HDBhXx/GGdk?=
 =?iso-8859-1?Q?AHqJNgBqwP18QtnWHNkVAZ5mRKPhdiBrqf/a/oMFQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-722bc.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fd363a-2867-4d8a-155b-08dcc661062c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 06:25:19.7412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY5P282MB4586
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_232536_727862_2A1696D4 
X-CRM114-Status: GOOD (  10.54  )
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

> Now, e1 is the source PEB with smaller erase counter, it will be picked
> as source PEB again in next WL if it not becomes free yet.
> 
> We don't put it into scrub tree, because the scrub type PEB means that
> biflips ever happen during reading, the data is not stable anymore in
> that PEB, so UBI moves data from scrub type PEB just take the
> opportunity of WL process.
> 
> IOW, in this case, the WL won't lost keeping ec balanced whether we keep
> e1 in used tree or move it into scrub tree. It's the same thing as the
> MOVE_TARGET_WR_ERR/MOVE_TARGET_RD_ERR case.

Then what's the positive return and necessity of this patch? It looks there is few difference before and after applying the patch.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
