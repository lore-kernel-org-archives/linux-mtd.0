Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AA6C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2GBEDvIiRFNBFpaK/zSH01Jw9ZM6gF+ilqR6g+lu6w=; b=4xB2NmTw9Anzvk
	utvS1xIJ6SHKen4nVWaVq58wlDaOoGxQYLiRBIskBExHtyccR49ikUqeEeKdfdS5IwPPn25zCnqIT
	BVdY+niTmBNRF+ujox+9yqOdRvQPVztms62hgeOpulgk7b4soqCNA8zRovzo6x6sEMN8eFSptefxV
	mYpP7v2D/I1N1F47q2Q8KO2UO3GIll+7X2nZoMqj/Y9YDZiYS8JvEQ2t3kFprSY4Wl5LJ6v8kX76X
	Qe+OP9iiuXeibAOFZ/zXC/IYXHvMYq89tmmYNeQ01wU55cPRl15M2FSuae8P1T5m55IqK5XyXplz4
	i01jG2OHLFoFDLX2W/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0UA-005dcA-0d;
	Wed, 19 Jul 2023 06:16:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0U8-005dbA-0m
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=57LJG0o0O93z0YydkZSTpkwq4zSyhXfM8J3DOY9W4ic=; b=XOP20HKWyNeLjJNO5z/uVm46+j
	4fAbCIlsdH5ozV4P29EHTBwGAHOqZqwdDIBxkFFeqP4w1Mmz0tm/3EWi1Sh+ZVHL25zmH2gJci1Ux
	YmzLirVW2ZIpG3DZ3pAVdSnuz+u414OrtGZ2byZqmAeHv9uZJHXas5epLR0bZcD9VI/16VRn5v4ow
	WtUptiTT//Bv8sjk+5Khf0s6r60TbqyTu9gcUw2EesvvyHUH/VaD35hJX5mXJyG1zRB3RvcR8hqlE
	DMiRQTL5mdUbyPR9S4R1wfXrMP/wuW2BRQKZk6EGRshbgRSl1UWMnD2G2OIkr3v+UgxvndpVMrVAr
	PEogCpPQ==;
Received: from mail-mw2nam12on20626.outbound.protection.outlook.com ([2a01:111:f400:fe5a::626] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLivW-00BT6P-0o
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 11:31:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+aCUtZ0O/SaS5ioeE14ToHdvA0DcQgNwxyoDkf4SUrl8LbcvtS0PyDWvnKg/pomZL7fK7npn2c8aT5cgIe2i5q6LX0i/ItL6RGuiuaLMoKSAHav/5SV0Rav2+ElVKrK3oLmZtPM43Rzp/tieOBnC1u11wLOEJ9nAkH7meLTwUCdX/mjK+GJscw6ffS27y3QBXrHAUBN8g9RIDzyD5G3usACoFYzWxMMSgro1fw1ZGCOx5obm3BuAck1zoahZQbLn7JMuuQV5VYfQHojtfrHTDWDIRs0qTO1F16seyGzFkpjlDzdCMXMSEPhr5HIkbTmktLN/O1vUOTolyY2GBvuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57LJG0o0O93z0YydkZSTpkwq4zSyhXfM8J3DOY9W4ic=;
 b=mOC2t36X7O9WpUEVoW9b89hXLeO3A+luuWRW77rWdIAIt+slmhU+L22ryQQtf2gfP6vZ2AjzxGQ++Ur2aQaXzDG316vXHSZ8BwSCXiAoI/z0XnKOxTbWha1dg3rjbhPxS0f9+78cnB/6rpMmgdgArYTXHtwWdiD1bpMoOvW155aBJw2gHo1JEFZORor50HsA/90yv5ALY/JkVaSS61+Kv/toMujInEV5iCh2I/J2GY7obcx3LfbPJ7kZqAPlSxV+/KkTpQAldfApA+1gHGbbsohQnlCFKyW0tyr5R05lAUvF1uyZHtTD45jQUkGMsbYrl+Wq0DTN6r2eQHiBXM96vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57LJG0o0O93z0YydkZSTpkwq4zSyhXfM8J3DOY9W4ic=;
 b=4jh1ejjcnhAL+nE+wedNLB006oiIe9TQP1E2XnCzrlmrx5D6MVAaVHgVYtYKtw+B2CfarC5SzE1hBpF9ZHuLjU8mEkwZt3AtU3e4tullyTO+5/O3L8koGZL+SChF7mDG3RcqsB5CG+KIrQwKEllbeU9UNCtNMFEnnYFQ3JRgYEQ=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by PH8PR12MB8608.namprd12.prod.outlook.com (2603:10b6:510:1bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 11:30:34 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::2ea3:f48e:b694:b86b]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::2ea3:f48e:b694:b86b%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 11:30:34 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: Michael Walle <michael@walle.cc>, Tudor Ambarus <tudor.ambarus@linaro.org>
CC: Mark Brown <broonie@kernel.org>, Tudor Ambarus
	<tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "saikrishna12468@gmail.com"
	<saikrishna12468@gmail.com>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH 0/3] spi: spi-cadence-quadspi: Add Rx tuning support for
 DTR mode
Thread-Topic: [PATCH 0/3] spi: spi-cadence-quadspi: Add Rx tuning support for
 DTR mode
Thread-Index: AQHZOrrJ8nSFne/ly0SGqgRK801xlq7DCssAgP09QQCAAA64sA==
Date: Tue, 18 Jul 2023 11:30:34 +0000
Message-ID: <BY5PR12MB425847EEEFC3FEB4C9BDE4FFDB38A@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20230207060924.265789-1-sai.krishna.potthuri@amd.com>
 <67e1d3af-d106-bd5c-f8d8-3f43a58975a0@linaro.org>
 <85d8e122a236818b162b64b473a3fdc4@walle.cc>
In-Reply-To: <85d8e122a236818b162b64b473a3fdc4@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4258:EE_|PH8PR12MB8608:EE_
x-ms-office365-filtering-correlation-id: c400cb16-9854-4ba3-b58a-08db878266b4
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fn/dYeSvPWfEK+nratxvHlVasuPa26PVjgTF6cZvnIp2cIZlmPkh75VBqqfP08UALun49WYjrgE1e7aZnVGkfeOsGN9HRWgtrF3BetpiG+vaYj9fOq4BtyQ8j6MyYNUizLT8MuteQegwfGZRwEBtMwl3wbQotMgr7Na0umcZXeMH6f2wSxn3Bo58ldSHu1xxFEUicq5RVb9vIg3LgonMt8/iPIitcEaFbtz43bYEoUdmz8IaOqcb2B1Jdnn+GWiTptilJ2A17JVtMth/a0vYOMFxYdQPIS0oCLXvWSgnT1M0pZvb7Uy7FUaffhO+pjWfr8r+8mTclfBxHv/FksHr1h+FsodPzs1zld1CD5unAtnOcsDngAQG4xQ2Njk7uRp6FVsvsNv+JstfqyQp5HUNxECGft0e3w1R3G6dQvT5Trh6AvIKtsFHrnlh6t+wWlaulY1euB3cg762z1hKk5/CzhfT+y2vZ+P3BnJGgbywsSPjEX17b+hRVesoY1KFY+FdI16ME/IqAo9HD1uV9Vw8JqKokDr/B/wiJSFAQaBNlBX6xIuWHZx+G1XOMghb/fY7Iw5ysT6yEWeGfSawGmCChqq5YkAtGAaJuWtaiurWSE0DeMa7KCO9yuHtwhLKcE2O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199021)(478600001)(71200400001)(7696005)(110136005)(66556008)(54906003)(83380400001)(38070700005)(86362001)(33656002)(55016003)(76116006)(9686003)(2906002)(53546011)(6506007)(186003)(316002)(122000001)(38100700002)(26005)(64756008)(66946007)(66476007)(41300700001)(66446008)(4326008)(52536014)(8676002)(8936002)(5660300002)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hkW/VMFyM5Z4osGj9QKt/VpxU53sWmwdR/AvIWBqh81arXJin+fpmTqz3rVa?=
 =?us-ascii?Q?aZQlv6YMaVF/zs0Oak6Rgq2NmaKO9o8ikVEcFxYtZxABturQ7aQsnhNPWUuq?=
 =?us-ascii?Q?MhbEEheLhMmW39Gtca96V78iEboOy7P8HCZgz9HYytj/GVQCYocAa2SCebHW?=
 =?us-ascii?Q?bI9N+xRuskdFGcCZ1/wH2joSD5ReonPwmwKKyu61NBmDF6CSYtQJyUsw8JAq?=
 =?us-ascii?Q?2VsP/6G/uXEE3LizDkZboE+L3q/CKXBEqcBK2TvJJERry07sasPZ1y5a3IHU?=
 =?us-ascii?Q?IOxgY3QRVPcaxQ6QqFo+E1rJ2VzuzcUn5zQ4hYh4ELk3xMiegZoroBXsmPu7?=
 =?us-ascii?Q?RYUKnU3y1muXd6yttw/m/TLxj/sxiwbv5+/PHdBewucI2rtqAViwY0NlYp5Z?=
 =?us-ascii?Q?P87rmeknW+ZuAKggn7KELReHkBCkalJ63o0cyl9ZcS/ZXDB8PpvKBb4eldgG?=
 =?us-ascii?Q?JShvmI1CSNRNJqHOcG5R8azT5VknE4l6IpTJLRH9lg5no4sCuf0QfB0r/Pmi?=
 =?us-ascii?Q?NZXI1oEWnBW18uiIloKgj3w3IX2RY/h9Z0SFu88YXIFeZyHuEVF2i3g+VBuq?=
 =?us-ascii?Q?Yul4ggWLhZhC/wBQslR1h2AMeLjd8gChle01DSoyJM05B9lZjNYOu/++wovj?=
 =?us-ascii?Q?jeO6zJV5K1tVL1Lkkd9fEKI0U8TIfeSO3ISsZV9/Q1W0ssOzdGe0vcr9oaWn?=
 =?us-ascii?Q?kG1LI7lp+J/WzhoqpcBRH+ObjNfysd8eTh7kHOWwF82bAb8ouqSjQLn66kOV?=
 =?us-ascii?Q?LelFnbPnHMVi+PGDrskcMShsgE4PxRmiLfpLfnzlWWyo9Z/RvgNvk1mBPMLX?=
 =?us-ascii?Q?jUBXN8tdhPRdb2Pyqw33Mxrg88hT66GRTJm+XPQ2c2kMk2HwYhpRT/oV+NFz?=
 =?us-ascii?Q?7M+TVOlYcZ63UXrXvM/NE6XpHKZdjK1kZMmOBfayS62AUE39dUXaer2Lbxkr?=
 =?us-ascii?Q?amV9HB+l+4YTrBT9qZwUmjYENqlbF7ECeASJYRv0PczpN6s+XuNISF2Bzvn8?=
 =?us-ascii?Q?k+m3dspM5+iefZac9YPYwXOF3tjge4usODXlW8k4eeV/4Ye7XAi/gYRlW8FO?=
 =?us-ascii?Q?7K/Z5Gks+R3VImgh3buHQsQww2vR6TTsX7DsN9B9Z9wFnOyTnKBl5/BIpICw?=
 =?us-ascii?Q?jycubDVKT9g+7XH1SDLWorz8S2UizpFkAMGxdkJz1BZgCspIaG6hhP+WstGp?=
 =?us-ascii?Q?M/IKf60NZMvzP/7ylFZA7+mjOjLqEmTwwrLUvSjICGSQs0fjpHESDFTQ6iUL?=
 =?us-ascii?Q?BRAcJ3/Un+1D4NOnJ20/Xt2oLecmSau5ainOB/wKLMhfX5e0wCwwgvKcd/78?=
 =?us-ascii?Q?hGUitjmjfKrcCnIEXtZBIUrV5fAFXBOpeamqkdeyC3g2UXHFj+exzO/oYl5m?=
 =?us-ascii?Q?TjcbRsGjkltOVntAHExOKObnFkFBoLoGsxHetWZwD1hxgJ6D8CEoPhG+Mnyb?=
 =?us-ascii?Q?+HdJnRAd2VT/QMr45iyIj5sX5j46eiYSZIKqaTVIzOKGMoC+DwvgRZK2/9Kp?=
 =?us-ascii?Q?EcKFaGqoYJumZ9VBbnzGGMbSbrSMROxkTQSxNje2FuV8NAHek6qEIJoGm3Lg?=
 =?us-ascii?Q?arQTAcGtyJFjo6zHHc8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4258.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c400cb16-9854-4ba3-b58a-08db878266b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 11:30:34.1145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jFR05dmcrabUZ0UzuwSqNeO5k6Fqs+3bNPGXbGLDCMnVQZAj5tfAXrBUF9XCZNigqqNwpQORxNq8zImjUtIpRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8608
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_123134_559450_7D4BF03F 
X-CRM114-Status: GOOD (  36.89  )
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

Hi Michael,

> -----Original Message-----
> From: Michael Walle <michael@walle.cc>
> Sent: Tuesday, July 18, 2023 3:31 PM
> To: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>; Mark Brown
> <broonie@kernel.org>; Tudor Ambarus <tudor.ambarus@microchip.com>;
> Pratyush Yadav <pratyush@kernel.org>; Miquel Raynal
> <miquel.raynal@bootlin.com>; Richard Weinberger <richard@nod.at>; Vignesh
> Raghavendra <vigneshr@ti.com>; linux-mtd@lists.infradead.org; linux-
> spi@vger.kernel.org; linux-kernel@vger.kernel.org; saikrishna12468@gmail.com;
> git (AMD-Xilinx) <git@amd.com>
> Subject: Re: [PATCH 0/3] spi: spi-cadence-quadspi: Add Rx tuning support for DTR
> mode
> 
> Am 2023-02-07 07:48, schrieb Tudor Ambarus:
> > On 2/7/23 06:09, Sai Krishna Potthuri wrote:
> >> Enable PHY and DQS required for Xilinx Versal Octal SPI to operate in
> >> DTR protocol.
> >> Add and update device_id field in spi_mem structure with flash id
> >> information. Xilinx Versal Octal SPI driver requires the device id
> >> information to perform the Rx tuning operation. Since there is no
> >> common Tuning Data Pattern defined across all vendors, controllers
> >> like Xilinx Versal Octal SPI which requires Rx tuning to find out the
> >> optimal sampling point for data lines, this device id information
> >> will be used as a golden data.
> >
> > Using only 6 bytes as golden pattern seems fragile, but you are aware
> > of that, as I see that you chose to read the ID 10 times to make the
> > decision whether the tap is valid or not. Other option (which is not
> > perfect) is to use SFDP data as golden pattern. If I remember
> > correctly, JESD216 suggests to use the Read SFDP cmd at 50 MHz, so it
> > won't help you much. In practice SPI NOR uses the Read SFDP command at
> > the flash's maximum speed and we haven't seen problems. But better
> > would be to use some flash OTP data maybe? I remember Pratyush has
> > submitted a phy calibration series in the past, I haven't had the
> > chance to read his proposal. Did you? How's your proposal different
> > than his?
> 
> And its not 6 bytes.. it's usually only three. The last three bytes will probably be
> undefined. So the might return ff or just wrap around and return the first three
> bytes again.
> 
> Is there a datasheet where you can read how the calibration is done? Is this the
> same for all i/o pads or individual per i/o pad?
> 
> I cannot see where the op to read the id is coming from. Are you relying on the
> fact that a RDID is the first command which gets executed. If so, please don't.
> 
> Do you calibrate only one pad? RDID (9f) is  single bit i/o, right? And I guess you
> are calibrating with the highest frequency, are we sure that RDID will work with
> any frequency (on any flash).
> 
> 
> >> The reason behind choosing this approach instead of reading the ID
> >> again in the controller driver is to make it generic solution.
> >> - Other controller drivers which want to use similar tuning process,
> >> they will make use of this ID instead of reading the ID again in the
> >> driver.
> 
> Honestly, I'm not sure this is the way to go. Pratyush proposed solution to have a
> dedicated memory area within the flash array with a know pattern seems to
> make more sense, because you are calibrating on the thing you are going to use
> later, that is quad/ocal read with the fastest frequency.
Yes, I am going through his proposal and working on it to adapt that solution.
Agree, this approach makes more sense than RDID also, with this we can avoid the
cons with RDID approach like small pattern, calibrating one line, frequency limitations
with RDID command(if any) etc.,
 
> 
> >> - Also, we can avoid hardcoding the command information and
> >> initiating the transfer in the controller driver as this should
> >> happen from spi-nor.
> 
> So how you know that this is a RDID instruction?
Yes, I am expecting the first command after switching to DDR mode is RDID.
Agree, we cannot rely on this.

Regards
Sai Krishna

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
