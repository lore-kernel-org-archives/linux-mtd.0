Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B46C43334
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jul 2022 01:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZkmwxLfIQ055FCYjLLreVeU2dE/cvtdn95HydXXHbg=; b=dkGHuXwQ+eZ8iu
	1MRBLqNw6amzFtVBl0jnyhzpxx2OE/cAIZwspClLPdffX0uAtT1z7ecy06jxR+GPTHFYDEGKTvVLW
	bpz98qRz7UDGBvf06fpOZurwOnL/5GvRix718qeC6+J/N2rJHGQgTAeuu/4kJUYK/TR6c9KB4eC38
	9VTDedOUhiDaRP+0f0Q5DILLC5174Gxg+OQ6fC1XcXMF++RTxJMs0N5o0TALa7RaTCH/n2BbiteR4
	a4fYAKfJ9feRLSwNIdzhLb3+bFbnrk6K5V4ed24HJq0Ryh+nczPUVkJjHMnnjKpfIFtR3yL3CF0wS
	V7RLeMvOToqOSgMqfjzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFQQC-009R8n-C6; Sun, 24 Jul 2022 01:28:40 +0000
Received: from mail-dm6nam10olkn2061.outbound.protection.outlook.com ([40.92.41.61] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFQQ9-009QzP-Ny
	for linux-mtd@lists.infradead.org; Sun, 24 Jul 2022 01:28:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqQ1Q9dJk3wNS0KBTCZ1tRRCYVujEmoYyu079zj9g8xIgY8Fn9LjSYDutH+ar3phvpZnPlg+Kp6/W9f13p6DGcqG5xtZ7nX5hnAUukriNcvHK0WgGGNvw0SME8KyNS+hns2rx1fzkwVjvkT0BLvWP5UU6Xra0xNYgSV/LFOfNC0P+3k2bvrF2dqP7k479sp0zp9dmPVPJZO/Xd8dhDwI+UR47DMK0+RFNJpOY+zOGLYw/CcI8GbRFE3aNN1EgPzB5aQBX9VQ1LcGWTXsOww+iHgCWnKSK8Q24gDS/cYA4A/CQEuBO1SYwEPBOjBAEgedMoxkU2VUUvSCbQ96bhSOrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKNe+L3SRHjF36HT8NkfeAA1QNfMLLH64xU1P4S7PGE=;
 b=SIVh0+lnWWJOs3ChW6YqV5V/pGrS0CC/cED837OqgLNhcZ2Ax5a2FpqqotDEbL3NnRdvur/F+PBQp/LqBbLxtIG5HFvPfiy66RCxMPMiB+LDv6hjwbk9f1lfj/G+t56uZG1IBX0hwPbwXropW6xVx8rhrcv0WFjDNW9n29gmoaXMB8MscGS5tfuKXzUa5eFDuNo95gT+1SyevqQnPvQplafzQ/LxXWKUG+ZQxJKcJnDOfAMcecboxb1v2cI59NS7yfFLyb7rFhGX58OxlVQE+0mwWnVGIGgRRekDBqZ6J7ucvo2342UM2+4qtV8HQDzdAWCx6bIAoYUcTBZUc/Xp6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKNe+L3SRHjF36HT8NkfeAA1QNfMLLH64xU1P4S7PGE=;
 b=iNlVkUmArFY2k6Gc04GnfJ0ZP3dSDNqHr8w2PwVpLyKnLdw3FbU1YZFN84aC7UVHrhRXonERvVfFC1wvZxtodnxpLHbLdc1BPgGDlY2npcsPotC1ZXq84Kfp0C4IlsTbbhBHKz6MWsO96MDLVwQ7mfvpThpwKeNZ/kEd0zNf1bGXoYEP8NlR000972xRvdt8bU41RXiIhJqiqeGmKjNnv/LtfjollbXhkl5iLlX4rUM1yj3T/iW7vUNcKIxkmVJYoybWq4ZjX1foiR28M8zezX8YlKYQRAPQofBD6H779ZUcSVBvCXC/b9iwQNSb9qn0cOd6PRkHinRLGF2gmZ2tmA==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by CY4PR17MB2024.namprd17.prod.outlook.com (2603:10b6:903:8d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.22; Sun, 24 Jul
 2022 01:28:29 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::3409:88f8:6069:ccba]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::3409:88f8:6069:ccba%3]) with mapi id 15.20.5458.023; Sun, 24 Jul 2022
 01:28:29 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: kernel test robot <lkp@intel.com>
CC: =?ks_c_5601-1987?B?IPGy5vzL+SAoWmhvdSBZYW5qaWUpIA==?=
	<zhouyanjie@wanyeetech.com>, "Tudor.Ambarus@microchip.com"
	<Tudor.Ambarus@microchip.com>, "p.yadav@ti.com" <p.yadav@ti.com>,
	"michael@walle.cc" <michael@walle.cc>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"aidanmacdonald.0x0@gmail.com" <aidanmacdonald.0x0@gmail.com>,
	"tmn505@gmail.com" <tmn505@gmail.com>, "paul@crapouillou.net"
	<paul@crapouillou.net>, "dongsheng.qiu@ingenic.com"
	<dongsheng.qiu@ingenic.com>, "aric.pzqi@ingenic.com" <aric.pzqi@ingenic.com>,
	"rick.tyliu@ingenic.com" <rick.tyliu@ingenic.com>, "jinghui.liu@ingenic.com"
	<jinghui.liu@ingenic.com>, "sernia.zhou@foxmail.com"
	<sernia.zhou@foxmail.com>, "reimu@sudomaker.com" <reimu@sudomaker.com>
Subject: Re: [PATCH 3/3] SPI: Ingenic: Add SFC support for Ingenic SoCs.
Thread-Topic: [PATCH 3/3] SPI: Ingenic: Add SFC support for Ingenic SoCs.
Thread-Index: AQHYnetNUOaTJqPXOUWAkct1ePh+ua2MsOQAgAAMoGc=
Date: Sun, 24 Jul 2022 01:28:29 +0000
Message-ID:  <MN2PR17MB337549EACCAA9E83CB484F9FB8929@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
 <202207240839.YeZ8uQ0T-lkp@intel.com>
In-Reply-To: <202207240839.YeZ8uQ0T-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn:  [HBRMvXPQdeHP9N0OFK0rEBuUpz8143CheIM27yrwJtCKmLxEo8V+mPmR0T++2y7OzDJbujS7NUQ=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2088d9d-a764-406c-de0c-08da6d13d073
x-ms-traffictypediagnostic: CY4PR17MB2024:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  U3pgkuUHtwRmCpe3UvBX9RqbTnKxYfIUHeBX8GGFEVjQlcOX281b4IMDZ7a1lIPDZxhxyHnkSCTpoH/HD7DR5nPTcIbGC+1LrWzNy168YbEw/DWFiESCz6XsSxZTFPcMXa1yFksRfoPX9F4X7g/T6teNycU7gAL5KcuBkU5lyxQwIgQmN/xAzUqUrH6/ZI719OXy1vc3Gf5o5WU5T8snmk9afRos8TUJ9t+0+IMLtjRpECTcdd38dM6rut+ig40yjn3/GtrGLUQqk8j7WZlw3LurwWuVONPQMRMFrKElLVfXuiX5d2bVxpuok67VJAmpqf47aCwLEnpyatPEYOsMBzdAdl2a00sHlPPJbsTdIQPLLoDnARKpcAMscskoW2Q0QYYA/vvkTJCtoS+tt6oX7sivj756Kr2k91NWC4+ai09z+58nSLwXbKFd6wqMC5aj8Hc1ZJ8FMKHJeKN3JnxUDew9XdOzZ6m5G9r5Ffub5G624ontSh6PmdQwwJLdaNQIhW/0sFVPI8z1RUMy0xtBe62Cd7Qen1GHjLZ5VsnnimiNB5scRKQD8jqOTUtBLkm7zbtgyqoOuCvotNrLi4dAZE2J9Nu24CyV6aWS9voQYOituEVxr4Ebu8cbiYTBcBu/fdSOWUKsCSlafpsERM+dwlehaPp2/zN7h9BchLE1PcvcDIVWCH4nsI9ikzDAS6q4
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?ks_c_5601-1987?B?anNyaDVHbmJiYW9xQUpnVFpUYmZlbTlBdEgwRXNuQU1vZkRkRXJw?=
 =?ks_c_5601-1987?B?NXR3SlpZMUNVVnBEa1M0STU3MnNCazBsMWZDZ2l5VVJiM083ZTh5?=
 =?ks_c_5601-1987?B?TXl3dFY5Y04yQy9RdTBuOTNHNzNocWxnd201c3JvdHEzT2kwRThB?=
 =?ks_c_5601-1987?B?S3dVS3Avelo2ZlYzMnBGZ0hscWs2NlRjZlJFSWpZcXhqTTUyVXhj?=
 =?ks_c_5601-1987?B?UEhRY1BuNitiUGZDT0ZBaXkzQkpyZ3JoSUIwdlllK3dCOTd6ejBh?=
 =?ks_c_5601-1987?B?RFUzbVNVVy9neVpCa1ZvenZIcDlwOUcrQW4yWkdmdEpmZFRnanU3?=
 =?ks_c_5601-1987?B?akVaNmt6WDlwZExydmJDczVlU08raVhnd0pIS1hVQk5BV0JzWFpz?=
 =?ks_c_5601-1987?B?Uk1YQTRTbE41ajQwQm1jQTJIcU1IK1dVMVpSWDhmS1ViNXlmd0R5?=
 =?ks_c_5601-1987?B?RWZjeE1nQ0I1V3o1NkUxZXlPQ3JhYkRBWUh5RW1ZTndGWk4yM3BF?=
 =?ks_c_5601-1987?B?QmNlYjkwa3NpODduelR0VmtFNEV2dmx2a0QrVThVOElVdms0aklG?=
 =?ks_c_5601-1987?B?TjNSNEJhTUJoVHc3ZEZicUtHTEJVenJodEVadTR5TzFWR0lwM2Jt?=
 =?ks_c_5601-1987?B?MmxBVXhXQXlFbnZUUU1Ka2tQNnFkRTZUWDNpakFCYUdheTlJOGtH?=
 =?ks_c_5601-1987?B?RmdJSDdUblB3K3dVMjg4YjVZTkZrZ0p2WUV5Y2NtbDgvZlA0MmJE?=
 =?ks_c_5601-1987?B?WmxaRk50MGloYUhGTXJrM2pQeWhGalJFSzVVc1Q0VFdNZ1BOWDl1?=
 =?ks_c_5601-1987?B?VjFxVnhRRUdrWlJUcFkzMDhrT2VuSW1TelVzNFFITEE4LzhIVGZt?=
 =?ks_c_5601-1987?B?RkRRYzVMZTlKcjhkRExYejJ4S21vVjUyQU5NUkUxNkZrU2NyU1p0?=
 =?ks_c_5601-1987?B?dm5vWjVvQnZVd3F3UWUyeW1RZFNySllqbEZ2ZjNlSGRVY3d5czI0?=
 =?ks_c_5601-1987?B?WEpLdTZvTW5NZ1BKSjFWUlVqNkJoMGlyemNMU2ZZL0R3ZmdhNTZQ?=
 =?ks_c_5601-1987?B?WGRVcU1QUHhFczdrdVJWcE1tdUVXNDdSOGZuNlBISHlNTk5sbFZH?=
 =?ks_c_5601-1987?B?dkNIMWdwenV4WXVnaXhKTDJjenRSeWhXOVRkM2lJWDVYZnkyWkdR?=
 =?ks_c_5601-1987?B?cnFCMFV2cHdsTzhhWk5IS3owRnJNalR2VGlyVFBydjlSL0x6Z2dE?=
 =?ks_c_5601-1987?B?OTlYNDNxSE1SbEJENmxZTVRCOUZVbXgrNkl5dVRPeGN0NFhiUHV5?=
 =?ks_c_5601-1987?B?WHgzNFNUVVlHS0E5TjRJZ2pUdmRDdmlYbmMrbER2WTF0aEk1RHQv?=
 =?ks_c_5601-1987?B?bFJrdndzaWcxc2RnWGZvNkRENnZ4ejFIcmFtREJqWVRtS2dkWXV5?=
 =?ks_c_5601-1987?B?d25wY3lOb2EydHdmQWRjUTI4Yis4amJnTGJ5Y1BOSVcwa1dER1o0?=
 =?ks_c_5601-1987?B?K1VqT0p2NzFQdngyNmZLLzRNQWtsb3dPQ1h6Z2MwZlpqTkE3S2Nm?=
 =?ks_c_5601-1987?B?QWNMY1kxSGJrYkpwb1FyRFRoUVliWVV6NlN0UU8wZTFuajBxQTJ0?=
 =?ks_c_5601-1987?B?dEpaeDV5cUk0aStrbWxGTkdjSnUvbG9WL3p6WXZkR3QyckV4bFYw?=
 =?ks_c_5601-1987?B?d0tNZnFGQXBMRG03NTBWTEpsenJHVlZhblk5S0J0c0hlQ2NOK2hV?=
 =?ks_c_5601-1987?B?bWt3Yk5YMWZGUkMrZnhJNGdLV09pWUlOSmNsNUc2QzNSV2RJQnF6?=
 =?ks_c_5601-1987?B?ajhJTzhCdndoUCt0RWxMVFBscFBtU0ZJaTV1N095U2k2amJmSFdv?=
 =?ks_c_5601-1987?B?cVpYZlhaKzNpMEJ0ZnR5bVIzbUd4WlJ1ZXhHbU1FUXhadHhpVlBQ?=
 =?ks_c_5601-1987?B?RFhPemNhemRMbWRoOGVxc1hldGE0eWNlYnM3MTd3ZWtLeUc1VVlG?=
 =?ks_c_5601-1987?B?MDdXYTVEcTBWQW1pU0N1ZDRGSEFWc2Q0bFBBWGZBbmlaVHd5T2lB?=
 =?ks_c_5601-1987?B?OTlWcmU0S2JiWDNCVExac1NMVHdTcUIvak5adG1Ic2p0R203dkh0?=
 =?ks_c_5601-1987?B?UT09?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c2088d9d-a764-406c-de0c-08da6d13d073
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2022 01:28:29.4938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR17MB2024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_182837_802921_3F055408 
X-CRM114-Status: UNSURE (   6.83  )
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

288                    op->dummy.nbytes * 8 / op->dummy.buswidth);
  289    
  290        if (op->data.nbytes > 0)
  291            val |= TRAN_CONF_DATA_EN;
  292    
  293        writel(val, sfc->base + SFC_REG_TRAN_CONF(0));
  294        writel(op->data.nbytes, sfc->base + SFC_REG_TRAN_LEN);
  295    
  296       

Sent from my iPhone

> On Jul 23, 2022, at 8:47 PM, kernel test robot <lkp@intel.com> wrote:
> 
> 288                    op->dummy.nbytes * 8 / op->dummy.buswidth);
>   289    
>   290        if (op->data.nbytes > 0)
>   291            val |= TRAN_CONF_DATA_EN;
>   292    
>   293        writel(val, sfc->base + SFC_REG_TRAN_CONF(0));
>   294        writel(op->data.nbytes, sfc->base + SFC_REG_TRAN_LEN);
>   295    
>   296      
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
