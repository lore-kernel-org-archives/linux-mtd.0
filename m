Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD57CDB47E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 06:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bs0CtxebMgHqf+rlZknAgHWYFzjqwJ50V9bapSgub3k=; b=KI0+9nw13RS5mb
	WLoCdWMde9Krog7ubTHsXsZDtR/hRt0iNw0wOl7ixnO/wxsf4GvMG8hROh2sopNISBx7rA/AymslU
	0gTUOR1a8FCK4UvhfL5e5jsevjhREBE/mL3ZCwGyWkmKk+pTsXxTE4ZSNqiXdsr/wl94tlTTfSgaQ
	1SKwrVAOar4uBIEzait0SDqj4HnbmXjipIXRmoqcDuq8C8C6mZGUFmH0TFKrO09fji8IWwN4lIY2n
	Az3DQPRfHFTWS+uUtreOG6QTUl3oHHDAVzgU6bI7vQAjr5CboEib54TFAmj1YxXSked8UPiQdJoNe
	1iIlbTMNB8z9RmyGl62g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qszp2-00Dse9-12;
	Wed, 18 Oct 2023 06:14:24 +0000
Received: from mail-sy4aus01olkn20831.outbound.protection.outlook.com ([2a01:111:f403:7005::831] helo=AUS01-SY4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qszoz-00Dsdr-3C
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 06:14:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMr6IAUnzfMo5pI0GGlZl9ldrbMBllD4+BYt6MkJvAIJyLDzRc5Sqlk/61B8iMt4x0uiXyO0SDHHL7e+iUMO4OTiHfxQMXzIKrV5lgr2JCRP24lp2EZn4nHJucvtG6QELLjObJWpjWbCBDhHnuosB6Gpjn+iWTFJKgda1KIM2xfLlYPg8mujggUgVcQhYtRweJBMtd/1AYuFbmZ258tgF9qJlDtHLjUI5rFukvLu+uj8VU3EXVWjPXzeOFtBwithCYsYym2l7Gl1NyWgCO0HiGjZyW7UYjvDknevvnAlhyRwwVJ0K8Sb5uoQ8A1hM7Pl+wkDUUA10gkfXH1dKbQA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GMudZsfxO0sJeRYjiTO12n0MasPQg1bebUbVlORF0A=;
 b=SXzlNo0UVF8lGEiuMy36clm/SuIW68c9hXfSMJcUr5jz4eFGHvyxcwa2JGKx1CxYwbLi5A/F4cfN/sL3pIwXMg2OFLL8RMl+v5qS501aP8rHs4agPtt9Ywe1qsEOYhCFaE/c8VeiX78DGGrTtyTe6/2d2QoPIclDHRKV/lmQjVloNNU5vIi8/FCIX5KimL/jVxmZxSI4siXEjwaENLHTDoQO2KyTB75PEEo6OyW8D2oPD3sYe3zVm1AIwocSrsSApcvBxlT7iRqxFtiYLvDylJqwtfKcgjc4c2jPmtpy8y6F1r4Jg/R8i0Hbee47Ny9zM48Dm52wzFHi7KYQiorAOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GMudZsfxO0sJeRYjiTO12n0MasPQg1bebUbVlORF0A=;
 b=WVUQI+lBQgil6Yjkg3I2g6rkJCeIAMByejUs92s+5EXjpWV/SeM2V59sphTex0fDXiCocAFjsmh11hb2dmEfckCz8Hdbr0DPeyYqbZKphUZfMtFfDTHCZoPnA19EbILTWB9BkoNNBTJwqvPElYruL9TpESK5h0c3L30tlURPESBZPHnsIKsXQS2Cdu66MtU/CWWcQdilqaGeYynhW31/T9Jl/QxQbTWi/9WikC4jdyLObMpomud798C68KDwZEVBfqLutwgSPoU6Tuzk65kkns4rc+UGA+7QgUPHKBRm+0XUU4KrgVpne/UmBxgTNsL8gVc7HHaNVD0OeSHwuk4qpg==
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:159::11)
 by SY8P282MB4291.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:257::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 05:59:08 +0000
Received: from MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::b729:fb11:fe5a:5366]) by MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
 ([fe80::b729:fb11:fe5a:5366%6]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 05:59:07 +0000
From: Ryder Wang <rydercoding@hotmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubi: some invalid code in the function scan_peb
Thread-Topic: ubi: some invalid code in the function scan_peb
Thread-Index: AQHaAYgTG91tdv/8dkayS7JsgFhh8A==
Date: Wed, 18 Oct 2023 05:59:07 +0000
Message-ID: <MEYP282MB3164B8C92CD51ACC0897F0F2BFD5A@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [pbHmvSU5aQ1lqh6xhD7p3swHbCf1VQXEI67yOCQ89fk=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MEYP282MB3164:EE_|SY8P282MB4291:EE_
x-ms-office365-filtering-correlation-id: 380a6737-af70-4db7-3c52-08dbcf9f579b
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n5EbUQvQm2atRjV7A24+AkrdamY+3Oh3Un6lnCOULYPqOKXYdTre1RqTQYj3Gzxr7lyPvWTTzSvJR3Trnk8AULe3dvTDK4a/2UtVbUa+GtAiub2uANY+Skomd9QQI4N4cP8g90zYqz2DERJNPhRp9tWYdAGQM9pfZIXkKkyvB+QXw9E3p1ZY4dtmrA0gY/r1M9UldG4axhriHzLiTgQiJOnP5HRJphZZmkY2LbMZ/5bODHcCEJXHbD3FEm58zkB4x+knxdxV1ohVIvDVSzhyLCtyk3mgxMYqoyU6jlI1iyf8G1txn3HFtRmjNY9BiBt3tAu6F5u4ynIF5PkHoab61/tDCrvVCUlp+lg98xk9+vkqJGhxRkD3UkdWQ9viT0TIcDxD/chYiN58lZVRf/bIr/ef3cHm3DwoGB6dXnEnCggBnk3V/Ag/sIFinaurrIJFmTMLDPFL4ZRGt5QIfdA/FRpv2xjXRnM3XlxERl/war3q8aC+VneIGvhuYVO27i+JUemMTNrrZLHAisrS673+AsKGhUCLw/egoP07s/IBAJpyjWRjgILprnsUZXJb8NTI
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qosNVv+UMx58q/7HOKCSjaqUVKLD+CtTN4Ajqsgb1zlxHASjIYVB2JbJeD?=
 =?iso-8859-1?Q?c4isGfFJUd0Nn4usgUq2hGwQV7m672XaJInK5DepbfYbw+Zit/s6l2t+KK?=
 =?iso-8859-1?Q?BGszt7ZY4Jz/6LAZe6DlkZ+eFxukloj9LSk0gmtHI6t2kkpcqTwyKHaxOB?=
 =?iso-8859-1?Q?GAh5Do9gSJssrFxpGrHpNeb2VSgHWBSY9tlX2X+g93TEnD9OURFdAGoeTu?=
 =?iso-8859-1?Q?F1BHS043hLRFOfzRFItzrOVBr8GkSIeORlWYCF7zqRkFaSXRENLphZQeTV?=
 =?iso-8859-1?Q?9jkSlK79Rh7f46KromDMsexvMEE1CHcRR3kU31Imkac1e90vqndyhUvMgZ?=
 =?iso-8859-1?Q?oELVJX6RgP8GzAWRRaerohz/zDq982o0AtH+kDVRCE6+UJJh5q8iuMSJqU?=
 =?iso-8859-1?Q?2SSO3sHKi8TL90Nq0rG80xybGuAac/aIfttc55xyewhtf4QKWGWmp5WIhQ?=
 =?iso-8859-1?Q?BVdnAi9qFU1t6hVWsMD7dqEtAk+CzNKkd3uJ1+pRFNhreWnsrwWNJj2p3n?=
 =?iso-8859-1?Q?9PkngDrPvWpvSUeS572YeG4fHVxH5snOf3ooPbhQrPycSxKfJZzmhVjRZR?=
 =?iso-8859-1?Q?pgl250j3P41KCOGGQ/HtcoKSuO7rrUoCZYQ2YDIpTKeDn+L+5Z9j6isdWe?=
 =?iso-8859-1?Q?vo3L/4yviLu0xoy9R9DmBry1k6P+w5OtuJyOJCXzUgIIqz67HfWn1b1/LH?=
 =?iso-8859-1?Q?IB7iQ8IMCpfGyH0ldXG4phDErh8O854AmWyeiovQPPgQfymkmKJxk5cSXP?=
 =?iso-8859-1?Q?a3f2K30MguKvF2g2VrRc/UzVY2WO49lSnNe+oPxXhnV1eOr/Mc385BrlSN?=
 =?iso-8859-1?Q?95yy2kzbIxpegPQ/FMhgSoqgJcQefmpEH84135KLcWzbYUHDqQKC8i7Rt7?=
 =?iso-8859-1?Q?YRWjYpvqQKxWVstFdaF60cPZaJZo9b5Fm9T3fD734wllGGvjGhbA9MWzQR?=
 =?iso-8859-1?Q?x1Hly2oxFcFmWpCmDHIdnUY8IOQasl7HzqIuRe/iXgPgEGM16+jzAOK3ci?=
 =?iso-8859-1?Q?fkbE3XDL83hvdGpSkgHHltAgGA4uD/JWpKdkUxz8fVkrfkEsj3ZuJTD9jI?=
 =?iso-8859-1?Q?oqdkxEMCL8EMSOqWt4abzDoR06LJfnet6Y/JkqZz0VpEEnol8ttkr955ed?=
 =?iso-8859-1?Q?cHCmhX09xpzDmipIesKepqVPtSMQPdPsemDB4dMqxk81IMq278bwRDl1tR?=
 =?iso-8859-1?Q?vlsxj+3tlpbwPywAIZLy8I7KmGh4mcksI0FlyVhvCS+a0CNaKxKFk8GjH0?=
 =?iso-8859-1?Q?Yl/Y/7KJ64VEXM6lau8g=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 380a6737-af70-4db7-3c52-08dbcf9f579b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 05:59:07.9122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY8P282MB4291
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_231422_058609_BE9D5CCA 
X-CRM114-Status: UNSURE (   6.21  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I just find some dead code in the function=A0scan_peb in drvier/mtd/ubi/att=
ach.c.

In the function scan_peb, it calls validate_ec_hdr which calls validate_ec_=
hdr. If ubi version or erase count is incorrect, it will report -EINVAL and=
 abort the function scan_peb. However, ubi version or erase count will be c=
hecked again in scan_peb and such check code will never find the errors bec=
ause such errors should have been detected by validate_ec_hdr (aborting).

Thanks,
Ryder
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
