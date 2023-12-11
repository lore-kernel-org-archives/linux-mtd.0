Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE48C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RbINVFy0I5a45opLyQ2lmNtdPa7Bto2ztB7sAASTDc=; b=259N0iIWKoG8mD
	9byBoj74U7Hp+qjsGEIOe2dsz4Sp4GW2HyiWrNItah6Pf5glxl9vwRVpVSwtchbGVfv7ao/uP6ooA
	CTabMQcA13RlB0xhd3lNN695AjLFbcBjIIUvbd27Sp/xfSpB/pEYpNUcnlGnnnG7schxOSZm69Lc2
	997LN2wUKPRDXGC+xREZMWmTM0vrmq+gPvEkdlkIXslRjbT3fIXFQrLgv2W2fPQx67+/ELqzplMdI
	HXr5MiGsVuvUxzOoxF9rFksCnaXayzZVDI/uFGYbiGJ+S31XM0KBDA3si/SCjet7kuJ2FN58IEZDS
	839NSg/jU5DxCnurAypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgTR-004zLe-0F;
	Mon, 11 Dec 2023 13:37:29 +0000
Received: from mail-co1nam11on20600.outbound.protection.outlook.com ([2a01:111:f403:2416::600] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgTK-004zKK-2K;
	Mon, 11 Dec 2023 13:37:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmImDvT0bYrk7aJszdBNc4g8OkLmCSvjqAXCdQvFKqEyfOoPJ3YDSZ9i05KpBjhuQk9pxZ5soZiC9ceK+e07lbHKCbNpA+P1Il7kLboZVyytrynHDrIgPaQpIgt2dKudJKdU+EmMMK9omAxQTlq+WQ+jWGE6WqLlWhxg66v1CCWsvc47KnYWzo8W7wyFqHo4S3QODtOXsygrfl2shhosZ39oQne9GSgyAKMH3WhBwoE7CPUeEoa2r33S52BGLv9gJAFfj9X2u25hBEX4kTEU5mSTxCF29Brdku432uvf8gvg7p7c4N0VxDS1Dro21ARhP6lrx4X6ucQOgVr/asQ3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ve7NVVNWf5Szhwu6+1uYkRg2fzITBmr9QSsBQJWs8tY=;
 b=eGB2tmNVTJd0JuF6qqAvbYyIx7wdxkZBbyRHmxyEcOFhdENopJy38QAhJ1hwEvtiqspGACgXCa9N7rg6GAYp6DwdUhi4Gma/b1taX3xuEbhEbkUxwwjyJ8TmP18r+4OdkKxNwrx9Cg9Ij3kd/Tdpo3pHluCLS06vzFdZ58kIhNi9w/2T9q9bNFORLfIPJ50hT7PyXotND+LwYLurehhefkBgAzEdlnQO8pK+++2bmEp8qsBxbegqygEmBln1XWFnl2QIfGLMXD6FQ5piolC4G5wTTa6F/5rrMi1z53afOApaGVrkUQksQP3haMVG37fV7xT7SIkPWRSS4FS5Lw8ZRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ve7NVVNWf5Szhwu6+1uYkRg2fzITBmr9QSsBQJWs8tY=;
 b=hkwHah+eGlT4BfMF+x6pbbEzvggQ39BY16qBRjtO9uWrJI0nhuqbgvexPbPmgVY+lIeo+pnSQbazlxZzMq0YVXKhfcXfgo1cNXMr+dCwI1E9ysVGTgeDZIJbT5J/ypr8t3GNTXn59OaTVTZ6o7e67L9hY3gc5/xMpsyAZ181q+k=
Received: from BN7PR12MB2802.namprd12.prod.outlook.com (2603:10b6:408:25::33)
 by DS7PR12MB8420.namprd12.prod.outlook.com (2603:10b6:8:e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 13:37:10 +0000
Received: from BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::2a35:852d:bc78:ed64]) by BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::2a35:852d:bc78:ed64%7]) with mapi id 15.20.7068.033; Mon, 11 Dec 2023
 13:37:10 +0000
From: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "pratyush@kernel.org" <pratyush@kernel.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
	"lee@kernel.org" <lee@kernel.org>, "james.schulman@cirrus.com"
	<james.schulman@cirrus.com>, "david.rhodes@cirrus.com"
	<david.rhodes@cirrus.com>, "rf@opensource.cirrus.com"
	<rf@opensource.cirrus.com>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"michael@walle.cc" <michael@walle.cc>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "nicolas.ferre@microchip.com"
	<nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "claudiu.beznea@tuxon.dev"
	<claudiu.beznea@tuxon.dev>, "Simek, Michal" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
	"amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>
Subject: RE: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Thread-Topic: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Thread-Index: AQHaH4D9pFM5xtDoeEuMNIpXuxvtzbCcYmwAgAEJ+aCABhoaAIAAMcLwgAAzdICAADdZAA==
Date: Mon, 11 Dec 2023 13:37:10 +0000
Message-ID: <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
 <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org>
In-Reply-To: <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN7PR12MB2802:EE_|DS7PR12MB8420:EE_
x-ms-office365-filtering-correlation-id: 6a9f118e-dede-4c76-bc5f-08dbfa4e46d0
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZgwEJ/Ngg0/0WpJOvEbOQIw3Svfcn8NaeH3PtBVnMeZET10i45UEc5oxvOEfxJmPaZ+dY02uqgb60Gg7rmhOXrjGbKL8NT2Dt/y0LQEfZCluJ2/ladonTbWMOsCxrNf1nTlYiS+6tDUvusBrCbd7ng0RK8sWOMo23aNCDzJce3AB1MX1BjmARffGnNqbKwdqIosE1HIliBRqdgyWXPNdqbb6SI+7j6W59l2CBhib2r+1jEQG8BZDN8YWM4mqQzLzU3dykm2q0M/6ic9E0X69Xakj0iFvvU9sLIu/8fa8cYNainWRLcZ16ObSmZbFtS3eCWrfvxOd+nH0sR5AwitATiPM/2ohV5gAyxo1lUtaikgYlGyZaAcqpO2e9DjVcHR0kCha59sH2hreFpah2irJc7Ibr+K6KUlwU6+FHH0QpQbe7giOcwr4Evgg0/db8vk3g6o6pyBIB/CCkyNYF95h5IQMXtekhQWewMxuGS/nJCElSaiGCOVuahV/K4DizJa5ZRy/iDkRV6VdlwYyCuweJ5PI/UkIwE+2UmleFbD4JKStSX+B2nbq7BzMWGdKOHcsQtqzA1YutbdDL8NJSQa+aXpSOCuAF+eE04OMbmgh0rwEGkgDDlb80hHpAutHrcBE7NwUJYJa4/a62CDiWst+c3j5R68sEhhXT8lA6jSky8w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR12MB2802.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(366004)(136003)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(6506007)(7696005)(71200400001)(9686003)(53546011)(5660300002)(83380400001)(7416002)(52536014)(41300700001)(2906002)(4326008)(478600001)(8676002)(8936002)(66946007)(110136005)(76116006)(316002)(66556008)(54906003)(64756008)(66446008)(66476007)(966005)(122000001)(33656002)(38100700002)(86362001)(38070700009)(921008)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0lwVWprcjFEU3BjbzlCWGlPVEpxZzBsZG9vam5rWXE3blpkcmRpRXBzc0pl?=
 =?utf-8?B?S1lwTVp2MjRZbDJPZHZXVFBjQ081NkZ6bUNCbmNnK0FPb2pXZW1WOEFWcHFs?=
 =?utf-8?B?YnlqY0phTkdFRms0ZklSSEZDZjNHSk5Fb1hsdkFydTErUFg2SERCd1RsKzRJ?=
 =?utf-8?B?WXpCUmFpOGVKWHRsS0FBSGNaWXlxWTdIb0dBelBMQjE0QUl4SnNDMEZ4K1Bt?=
 =?utf-8?B?Q3ZjUGoreVZnejliN1RqS09OeUI1UFNHek00S3JQM0ZmQS80VS9UVDRkOG9x?=
 =?utf-8?B?angwOTB1OFNuU1BieHdBUm1SVXJDOTN1UGJGeFBnamxoRFZLWGVOUWpNbVpt?=
 =?utf-8?B?WDVkSzBJK2lTN2tkdGV3M2h2N3paRlozdUFEeFFNMUF2NUFPdzF4Yy9MTk1C?=
 =?utf-8?B?b3M2ZUhyNHZadkN1b2N3MGFoMzJ6Q2UrREJTd05XaU1kUkQyK3J4Z2lsMkdI?=
 =?utf-8?B?cEJDSS9PaG1JWGg4VktqdzYwQi9ONDNBa1JMYVNBTW1ycTRnQm5aSkh4eGNh?=
 =?utf-8?B?am1FcExaSEVYbHRlbTFHdHd1R2VMWlYrakFRUFBXZUVaTDNYVGFyQTZ6ODJB?=
 =?utf-8?B?b21oYUVtTjVOaS9IdmRzb3VldWZiMko3aWdBY0V2bk5LTkorQ1I1Y1M2azIr?=
 =?utf-8?B?NmtndU9CZ2NQMzI0UjRHYnh3RHBvb1VMSFB0MHBZUFh1RkNzdU0zQnZyVkk3?=
 =?utf-8?B?dWdManQrS1VyZmpWRjFnYU04UUJod0FBYU5pc3IzdExYVGdjclJDVFp5TFVh?=
 =?utf-8?B?aUdBS3YyZWZUWGhIcXl5eEJkWkdZWGdtMHptd3ZzTkREMWtnblNhNUpHOW5P?=
 =?utf-8?B?YVgweE9jNHg3MUZycnFmeElub1hUUG8zSnVRS1g5b25TM2FBV1doSjFMNFVC?=
 =?utf-8?B?S1dnNWpnbkE0UzY2V25rVjFJRSswaWE2T25Gd00rdzdET3FLQ0l1cUN1MGQ3?=
 =?utf-8?B?bmRNbHp0OWNDOUE1ZmNJWDcyMmlLaVpyTFQ0dUZWR1lOY2xjdjBTWGkwbFM1?=
 =?utf-8?B?RGYyNEM0eGNkVjFqT0doVUpBaVZ0RTgxS2FPMXcxczBvM2hWTWwxeXUwZUxW?=
 =?utf-8?B?eVVLQzh6Y2xCZXdCdlRnWWphbk43cFg3Z1ZBUU1CaDZLNW4vbHVGakFLZFBq?=
 =?utf-8?B?d0w3czlQTFVxTEg3WTNnNlJwTDdDS1U3VERFNFljZFMxNDd3bUpqYjNLN2xm?=
 =?utf-8?B?MTRjbnVmb2V0cTZBeWJrNEVKLzJSS0ZNUm5wVHpZYTFQcm84QnZObDV6MXNF?=
 =?utf-8?B?c2dKSEtxRUI4Mjh3dVp4L1BJZFpkQjRqVE5XQnowaVdFdlVDbVUwVHk5WTNn?=
 =?utf-8?B?amNjYm83aWROZFJLK3gxMXF3U0k1WXdtcFRPS0NFSFh6MEZPMmNTRHRvSUdn?=
 =?utf-8?B?d1R4aHJZSW9mZU1hbVhSZ0Z1T3d1SHRQQ3JXM05TZ2tYUzNVWUZmeTlEc3F0?=
 =?utf-8?B?S1hSUEhSbXRDcEVRdnBMb3B1ZTV6K2V6K3A4S2JuSXNUU2RNdU5zd2cvN3Ax?=
 =?utf-8?B?bm85U1FQUWRxeWhtdmU2TEVNMkhyVDJ1RjQ4SlJvbDcyZHFoUlNxdlBKdkts?=
 =?utf-8?B?UTFCdnV2a1plZWNseFhTb0Z4SU9OZ1p0eitCckh3ZkZxbzRNUlU0enQ2SXhq?=
 =?utf-8?B?L3dsY0NoNFhTVno3bjlPVkwwb0FDb252clNCS1diZmFsUXFBL2VpcExUaVd1?=
 =?utf-8?B?d3dMZm9rbzVEcm1UM2VqYytLNEFjQnJjMUdteWhJZnd2cHZqWmVXNUNIcFRa?=
 =?utf-8?B?TFVYalpkU1ZLM0w4UURPdDRHYjhqR1V2RTNURS9VWU5JaW1xU3JRL00reDVT?=
 =?utf-8?B?MVIxZnhUMmZTY0lPL3FuUnNMeVk1OVBWSlBCa2RuRWhrcm1sbHVWc3ptR3l5?=
 =?utf-8?B?UmVyWEoxYjE1ajNZR3c2b2VNTHJmYjA1ZkthY2FXWjlmZ0ZtMHQ2cExid0Fh?=
 =?utf-8?B?dHEzdytBRWdjMjhIckhGenhmbzdDRGl3aU11bEZ6elBxTFV3cGlBbEZMUzls?=
 =?utf-8?B?NVpnUlUzcDNOUVNsZ0wzY1J4MmtDYzlSVy9CNFdVUk5aUWZpTndySDdCZSta?=
 =?utf-8?B?K0h4TjRtWE1qcXhVZFB3R2RZUlVVZHBQVWE2aUw4VzB4dHg1TFAxTlV4VzNE?=
 =?utf-8?Q?8Gd0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR12MB2802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9f118e-dede-4c76-bc5f-08dbfa4e46d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 13:37:10.4940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wJyqlvxBGm+GSzTd4MmOdMZfpbqo/zkDjVEQLro1VFmv1+qRhgwkJv1v9dETZPL5F8awRn59Ajp9eUfwpIuoKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8420
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_053722_828892_B4864300 
X-CRM114-Status: GOOD (  16.63  )
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



> -----Original Message-----
> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> Sent: Monday, December 11, 2023 3:05 PM
> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>;
> broonie@kernel.org; pratyush@kernel.org; miquel.raynal@bootlin.com;
> richard@nod.at; vigneshr@ti.com; sbinding@opensource.cirrus.com;
> lee@kernel.org; james.schulman@cirrus.com; david.rhodes@cirrus.com;
> rf@opensource.cirrus.com; perex@perex.cz; tiwai@suse.com
> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org;
> michael@walle.cc; linux-mtd@lists.infradead.org;
> nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com;
> claudiu.beznea@tuxon.dev; Simek, Michal <michal.simek@amd.com>; linux-
> arm-kernel@lists.infradead.org; alsa-devel@alsa-project.org;
> patches@opensource.cirrus.com; linux-sound@vger.kernel.org; git (AMD-
> Xilinx) <git@amd.com>; amitrkcian2002@gmail.com
> Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support
> in spi-nor
> 
> 
> 
> On 12/11/23 06:56, Mahapatra, Amit Kumar wrote:
> >
> >
> >> -----Original Message-----
> >> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> >> Sent: Monday, December 11, 2023 9:03 AM
> >> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>;
> >> broonie@kernel.org; pratyush@kernel.org; miquel.raynal@bootlin.com;
> >> richard@nod.at; vigneshr@ti.com; sbinding@opensource.cirrus.com;
> >> lee@kernel.org; james.schulman@cirrus.com; david.rhodes@cirrus.com;
> >> rf@opensource.cirrus.com; perex@perex.cz; tiwai@suse.com
> >> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org;
> >> michael@walle.cc; linux-mtd@lists.infradead.org;
> >> nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com;
> >> claudiu.beznea@tuxon.dev; Simek, Michal <michal.simek@amd.com>;
> >> linux- arm-kernel@lists.infradead.org; alsa-devel@alsa-project.org;
> >> patches@opensource.cirrus.com; linux-sound@vger.kernel.org; git (AMD-
> >> Xilinx) <git@amd.com>; amitrkcian2002@gmail.com
> >> Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories
> >> support in spi-nor
> >>
> >>
> >>
> >> On 12/8/23 17:05, Mahapatra, Amit Kumar wrote:
> >>> Hello Tudor,
> >>
> >> Hi!
> >
> > Hello Tudor,
> >
> 
> Hi!

Hello Tudor,
> 
> >>
> >>>
> >>>> -----Original Message-----
> >>>> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> >>>> Sent: Wednesday, December 6, 2023 8:00 PM
> >>>> To: Mahapatra, Amit Kumar <amit.kumar-mahapatra@amd.com>;
> >>>> broonie@kernel.org; pratyush@kernel.org; miquel.raynal@bootlin.com;
> >>>> richard@nod.at; vigneshr@ti.com; sbinding@opensource.cirrus.com;
> >>>> lee@kernel.org; james.schulman@cirrus.com;
> david.rhodes@cirrus.com;
> >>>> rf@opensource.cirrus.com; perex@perex.cz; tiwai@suse.com
> >>>> Cc: linux-spi@vger.kernel.org; linux-kernel@vger.kernel.org;
> >>>> michael@walle.cc; linux-mtd@lists.infradead.org;
> >>>> nicolas.ferre@microchip.com; alexandre.belloni@bootlin.com;
> >>>> claudiu.beznea@tuxon.dev; Simek, Michal <michal.simek@amd.com>;
> >>>> linux- arm-kernel@lists.infradead.org; alsa-devel@alsa-project.org;
> >>>> patches@opensource.cirrus.com; linux-sound@vger.kernel.org; git
> >>>> (AMD-
> >>>> Xilinx) <git@amd.com>; amitrkcian2002@gmail.com
> >>>> Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories
> >>>> support in spi-nor
> >>>>
> >>>> Hi, Amit,
> >>>>
> >>>> On 11/25/23 09:21, Amit Kumar Mahapatra wrote:
> >>>>> Each flash that is connected in stacked mode should have a
> >>>>> separate parameter structure. So, the flash parameter
> >>>>> member(*params) of the spi_nor structure is changed to an array
> >>>>> (*params[2]). The array is used to store the parameters of each
> >>>>> flash connected in stacked
> >>>> configuration.
> >>>>>
> >>>>> The current implementation assumes that a maximum of two flashes
> >>>>> are connected in stacked mode and both the flashes are of same
> >>>>> make but can differ in sizes. So, except the sizes all other flash
> >>>>> parameters of both the flashes are identical.
> >>>>
> >>>> Do you plan to add support for different flashes in stacked mode?
> >>>> If not,
> >>>
> >>> No, according to the current implementation, in stacked mode, both
> >>> flashes must be of the same make.
> >>>
> >>>> wouldn't it be simpler to have just an array of flash sizes instead
> >>>> of duplicating the entire params struct?
> >>>
> >>> Yes, that is accurate. In alignment with our current stacked support
> >>> use case we can have an array of flash sizes instead.
> >>> The primary purpose of having an array of params struct was to
> >>> facilitate potential future extensions, allowing the addition of
> >>> stacked support for different flashes
> >>>
> >>
> >> right. Don't do this change yet, let's decide on the overall architecture first.
> >
> > Sure.
> >>
> >>>>
> >>>>>
> >>>>> SPI-NOR is not aware of the chip_select values, for any incoming
> >>>>> request SPI-NOR will decide the flash index with the help of
> >>>>> individual flash size and the configuration type (single/stacked).
> >>>>> SPI-NOR will pass on the flash index information to the SPI core &
> >>>>> SPI driver by setting the appropriate bit in
> >>>>> nor->spimem->spi->cs_index_mask. For example, if nth bit of
> >>>>> nor->spimem->spi->cs_index_mask is set then the driver would
> >>>>> assert/de-assert spi->chip_slect[n].
> >>>>>
> >>>>> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-
> >> mahapatra@amd.com>
> >>>>> ---
> >>>>>  drivers/mtd/spi-nor/core.c  | 272
> >>>>> +++++++++++++++++++++++++++++-----
> >> --
> >>>>>  drivers/mtd/spi-nor/core.h  |   4 +
> >>>>>  include/linux/mtd/spi-nor.h |  15 +-
> >>>>>  3 files changed, 240 insertions(+), 51 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/mtd/spi-nor/core.c
> >>>>> b/drivers/mtd/spi-nor/core.c index 93ae69b7ff83..e990be7c7eb6
> >>>>> 100644
> >>>>> --- a/drivers/mtd/spi-nor/core.c
> >>>>> +++ b/drivers/mtd/spi-nor/core.c
> >>>>
> >>>> cut
> >>>>
> >>>>> @@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct
> >>>>> spi_nor *nor)  static int spi_nor_late_init_params(struct spi_nor
> >>>>> *nor)  {
> >>>>>  	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor,
> >>>> 0);
> >>>>> -	int ret;
> >>>>> +	struct device_node *np = spi_nor_get_flash_node(nor);
> >>>>> +	u64 flash_size[SNOR_FLASH_CNT_MAX];
> >>>>> +	u32 idx = 0;
> >>>>> +	int rc, ret;
> >>>>>
> >>>>>  	if (nor->manufacturer && nor->manufacturer->fixups &&
> >>>>>  	    nor->manufacturer->fixups->late_init) { @@ -2937,6 +3042,44
> >>>>> @@ static int spi_nor_late_init_params(struct spi_nor *nor)
> >>>>>  	if (params->n_banks > 1)
> >>>>>  		params->bank_size = div64_u64(params->size, params-
> >> n_banks);
> >>>>>
> >>>>> +	nor->num_flash = 0;
> >>>>> +
> >>>>> +	/*
> >>>>> +	 * The flashes that are connected in stacked mode should be
> of
> >>>>> +same
> >>>> make.
> >>>>> +	 * Except the flash size all other properties are identical for all
> the
> >>>>> +	 * flashes connected in stacked mode.
> >>>>> +	 * The flashes that are connected in parallel mode should be
> identical.
> >>>>> +	 */
> >>>>> +	while (idx < SNOR_FLASH_CNT_MAX) {
> >>>>> +		rc = of_property_read_u64_index(np, "stacked-
> memories",
> >>>> idx,
> >>>>> +&flash_size[idx]);
> >>>>
> >>>> This is a little late in my opinion, as we don't have any sanity
> >>>> check on the flashes that are stacked on top of the first. We shall
> >>>> at least read and compare the ID for all.
> >>>
> >>> Alright, I will incorporate a sanity check for reading and comparing
> >>> the ID of the stacked flash. Subsequently, I believe this stacked
> >>> logic should be relocated to spi_nor_get_flash_info() where we
> >>> identify the first flash. Please share your thoughts on this.
> >>> Additionally, do you
> >>
> >> I'm wondering whether we can add a layer on top of the flash type to
> >> handle
> >
> > When you mention "on top," are you referring to incorporating it into
> > the MTD layer? Initially, Miquel had submitted this patch to address
> 
> I mean something above SPI MEM flashes, be it NOR, NANDs or whatever.
> Instead of treating the stacked flashes as a monolithic device and treat in SPI
> NOR some array of flashes, to have a layer above which probes the SPI MEM
> flash driver for each stacked flash. In your case SPI NOR would be probed
> twice, as you use 2 SPI NOR flashes.
> 
> > stacked/parallel handling in the MTD layer.
> > https://lore.kernel.org/linux-mtd/20200114191052.0a16d116@xps13/t/
> > However, the Device Tree bindings were initially not accepted.
> 
> Okay, thanks for the pointer. I'll take a look.
> 
> > Following a series of discussions, the below bindings were eventually
> > merged.
> > https://lore.kernel.org/all/20220126112608.955728-4-miquel.raynal@boot
> > lin.com/
> 
> I saw, thanks.
> 
> >
> >> the stacked/parallel modes. This way everything will become flash
> >> type independent. Would it be possible to stack 2 SPI NANDs? How
> >> about a SPI NOR and a SPI NAND?
> >>
> >> Is the datasheet of the controller public?
> >
> > Yes,
> > https://docs.xilinx.com/r/en-US/am011-versal-acap-trm/Quad-SPI-Control
> > ler
> >
> 
> Wonderful, I'll take a look. I see two clocks there. Does this mean that the
> stacked flashes can be operated at different frequencies? Do you know if we

In stacked configuration, both flashes utilize a common clock (single 
clock line). In a parallel setup, the flashes share the same clock but 
have distinct clock lines. Please refer the diagrams in the sections 
below for reference.
https://docs.xilinx.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Interface-Diagrams
> can combine a SPI NOR with a SPI NAND in stacked configuration?

No, Xilinx/AMD QSPI controllers doesn't support this configuration.

Regards,
Amit
> 
> I need to study this a bit. I'll try to involve Michael and Pratyush too.
> 
> Cheers,
> ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
