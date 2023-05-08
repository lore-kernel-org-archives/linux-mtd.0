Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DFCC77B75
	for <linux-mtd@archiver.kernel.org>; Mon,  8 May 2023 01:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/fJkSgcoIQ8bA4UekJzw+zkYiu9jmtrsj6oRMuTVt8=; b=DwZ2e7wlird7cj
	ZrDJYMNWniQokjtDfebVIM1lDzQiMVvfjYfLk1CyPufKIWa46wo9n7o3dWhJmp2TKQN8o0iEFfabN
	0IyAsuxPF2cM+0dZjjXgMnfiS6//KyeXB49NVHkf31JuNC8XDU2PjS7PRYtdKrNG61KQdtoM1GZMx
	RXwS3IehWiGIyuxmDH7H8YOxJ89aZRwforwGLsbzlA99NGOVQUxZRk6bgYx+JzdRrEHuYf4v+MemD
	aUeeeR0Lwbo9c9mnOuVlRIJ9UunHGHq2hsLnN6dYHB7a2dECmgMGI1dVRKpt7PEAGXl8TiQDrgZxa
	+Vp2NhYu0ju8XskEmTcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvprk-00Gxrj-39;
	Mon, 08 May 2023 01:40:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvprh-00GxrT-2R;
	Mon, 08 May 2023 01:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SBjx701N6W9A0jI3mdc6Z90QNy5ooLXyUUk3SXB3Cw4=; b=bwqqxqIIpb04Lp7ZL7bpTfES5K
	yjZqtPI0UmXs7uBxDYqgbY7RoVOxFiu89jwU6S6Q6/3B8+zJQlMqntln+7BO6E/SXkw0QICqXi7Ed
	kN+okNuNyC1+WwpP43onXQ3qSxe+f0FVjglCdHBbba2VkdGwNraMR/PTO4KnU22fFJPzek4uek7UW
	SQu7ZPXaSAjb4HDYKZnGDK4adRNYTejT57HM7GP9zlrym0zb+DDEvYXJuECayxQcEtknSmxkY9u1M
	See/tIVICBJOganwiQzI0WRGPEgrrRDRcdvGSYlvUKP9Q9trIgG8cd/F744ZD4v2dHT5DtVjRc+ar
	aklnVSrg==;
Received: from mail-tycjpn01on20623.outbound.protection.outlook.com ([2a01:111:f403:7010::623] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvorV-004e5t-0T;
	Mon, 08 May 2023 00:36:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENQD5aU9VmNq+6QbDbfvPAKDggMjSYwKMbD4nS6fuIZDfTh4WapKlqImLTMsw9ibc/oNw9VvegHZqcGd0F4evv8InCN4rZXxZiZQsL7MuzGJPvLg4wp/n9dVjfcV5hmIAK+Rnp1LefRpzaSwPhw+8lzDmMxL3KszDxpHCt8/zzM77psS9dsuCxR/t7fjSKA7vFhlKDp7GHJZH5rH/XDmvmOgr6U/9OZ/ZVwHWXZaTDFSWYI1DfczM9X4buaA8RtIGugNImpdSNjRAzGYj5cw+Fs1uOlBj/o+iYuPMJo10vOjq25Jv84yfVhSF0FJZ8BYU2LMf91XhvUk6hxb2eBTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBjx701N6W9A0jI3mdc6Z90QNy5ooLXyUUk3SXB3Cw4=;
 b=Z36RveF+YTC+Cz1L6Cfh1BQtjxfjtmnFksK4dOH3eRUOrnpacSehf0A/LozkSgmOqKEMW+zGRiBRpYqnuM09E0ynP+Om3MqmK/ZkPMZFroBrHQuts4f0wCu8ak8wOSfgiFeXpGTMgnKvq8NLKMIGzlTe0oXYmEUkxxbRcI8XeZsrmwZz9U+OhyIeHKaMpj7Tafy+pvUPKiTZ/9Cc7BGJ9T8G+Su40VE+STjse46JoVoKiAEI3+GDnQ9bJKUgKGh7tNP/CQIYrVaQPHhk9S+w6YtbPdNbcBvPAamaelrskUcD37WvgR0sPwywBAGwvOpSPtuOvD6FwHHZEkUQ8TFqvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nskint.co.jp; dmarc=pass action=none header.from=nskint.co.jp;
 dkim=pass header.d=nskint.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nskint.onmicrosoft.com; s=selector1-nskint-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBjx701N6W9A0jI3mdc6Z90QNy5ooLXyUUk3SXB3Cw4=;
 b=hnSucoTi/vP7njHzxyC//ZcYzZ4ISsYJe4Z2hA5LbeQdnoDPEHZHbbN0mqjNWaF+Znu9YTZ/fl3Tq1l/6JcBZlARERDb4Az3t4+NLqNRW4oPwebZFQI4AZlBVv37iVHK+NAMaupvCvxlYXrxL8RqWS4cIws5SHDbcSNVKMAdc8Q=
Received: from OSZPR01MB7004.jpnprd01.prod.outlook.com (2603:1096:604:13c::9)
 by OS7PR01MB11880.jpnprd01.prod.outlook.com (2603:1096:604:239::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 00:36:07 +0000
Received: from OSZPR01MB7004.jpnprd01.prod.outlook.com
 ([fe80::148a:7cac:32d9:1c03]) by OSZPR01MB7004.jpnprd01.prod.outlook.com
 ([fe80::148a:7cac:32d9:1c03%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 00:36:07 +0000
From: Yoshitaka Ikeda <ikeda@nskint.co.jp>
To: Dhruva Gole <d-gole@ti.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Takahiro.Kuwano@infineon.com"
	<Takahiro.Kuwano@infineon.com>, Pratyush Yadav <ptyadav@amazon.de>, Mark
 Brown <broonie@kernel.org>
Subject: RE: [PATCH v2 4/4] spi: cadence-quadspi: use STIG mode for small
 reads
Thread-Topic: [PATCH v2 4/4] spi: cadence-quadspi: use STIG mode for small
 reads
Thread-Index: AQHZMJVBHgHXafuso0ywMCCxmHrW5689ZDXggABfGwCAARZ4MIAA3JcAgBBuwJA=
Date: Mon, 8 May 2023 00:36:06 +0000
Message-ID:  <OSZPR01MB7004907B2FB95F45E9B83FEC8B719@OSZPR01MB7004.jpnprd01.prod.outlook.com>
References: <20230125081023.1573712-1-d-gole@ti.com>
 <20230125081023.1573712-5-d-gole@ti.com>
 <OSZPR01MB70048CE259A3D63C4179199A8B659@OSZPR01MB7004.jpnprd01.prod.outlook.com>
 <044a723e-b81e-f6f2-8bf7-3680a10abc86@ti.com>
 <OSZPR01MB7004D229048A950C93B40CC88B6A9@OSZPR01MB7004.jpnprd01.prod.outlook.com>
 <b1d30948-ba3d-a4cc-e1ed-851a9dedba7c@ti.com>
In-Reply-To: <b1d30948-ba3d-a4cc-e1ed-851a9dedba7c@ti.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nskint.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7004:EE_|OS7PR01MB11880:EE_
x-ms-office365-filtering-correlation-id: f46a438b-370d-4de2-1b14-08db4f5c365a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  pmieUeMuznMDVJbSVcJgrSWB4ezzV4g6W/+U6krT1kr38J0iW/w60ZkFhxG4c/qfaNrVm74vmqueB9sk92v5RCTyRVLrQopjeuMkyMMDkRrOXN50NrJzW3vqpXLqOVapyuAK/AIVb6Vmp15txxiTqFjX6VokuFSmN6wmZf5ryaEy5hFYbDUn0Q3X5E0PrCfNcOmuMql5px/Af0kT2H5j/ICcxU8SLkqWQyZslfhw1DHUvXZ1NLXt0zCRGHij2KjI2e9b76U6Tnvn1fjzYnkiPk2vCy3pvLRvZaLne5rlXZO1hkql/gjJGEvMeBScQmuJ3vSI7pb3G/EMn8TokEA0bZy1EHi4daoDZWTkBu2Caex1ELSpBdFh+JXpKIEQSLifDLtdGw/hH4ov/AvUNvUd00muIp7qXqhvD2JVIxVTcYKBOfak4XAC6BB0+cIxU1a5mxqNCj9rsXJ9aw1OQd2L9wYG8F943AVFhVbxcu+rw+ixxy5Qi555r2KEYN9Jwy7OA/3LFzEFq6XB3UAqj8zh2R8ps+nstw6/aDaxFRmX0JWMU+a/9CDrbGGOGBQDhR/WIxSR5rMmTF3/KiADLOD7BKy7Mk+Y24wbYtsNBmZ3aYYcfYQ17WoKCLkDu/l+JHg0
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7004.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(366004)(39830400003)(396003)(451199021)(83380400001)(478600001)(7696005)(71200400001)(54906003)(9686003)(6506007)(26005)(186003)(7416002)(2906002)(33656002)(52536014)(38100700002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(6916009)(122000001)(4326008)(41300700001)(5660300002)(8676002)(8936002)(38070700005)(86362001)(55016003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dVVnTzNMUTh4bUxERFBmZ2hMcm81M0xwL0VZZFZ2dGdRRXIzUEM0c1NGelVI?=
 =?utf-8?B?Ui8xcDUwc0sxQ0N6cHpXZTRUMXVWdlk1OTlnMkkzSFhreGthNzIrckkzK2R2?=
 =?utf-8?B?K2gyTXdScit4dkdqQ2ZrZDVWUWVOdWVVbUlpTTJxOTZaazVhZG1QS3BzVHdu?=
 =?utf-8?B?OXFVdUVuWTV0OEVDTC80SDFxOXZHZzlBNTk1YVdUMVBHbjNMa1A3ZUg1emFh?=
 =?utf-8?B?bktrNHMvckp1VG5OYm1Ca1EyVmJoTy9zbTlPWU9uSnNRQmJ5U21ybW43ektH?=
 =?utf-8?B?Skhkd3B5cUt0cHZkZFRBeEczdDJCY3h0Y1VlTHB1U01vSDlvRS83Mitmb1NM?=
 =?utf-8?B?VkVFM01pSzkzYUxFTlQxUkVDMStyd2xyNms1L1gwZFFpamFPdi80azJNZXdP?=
 =?utf-8?B?NXJMV1puNm1DRG5yWStEQ3BhaFZXNzU1VUtSSFhVUEljVStRdy9tZkprTEJj?=
 =?utf-8?B?OXpYTkhGWjhIV2I5bVRCTjdaVlo3Q3g0dlpZVUxIb21EVVlZVlJSSGVmRUhK?=
 =?utf-8?B?VWtlUGJtZ216MHFUd2toWms0NERDNkNnUnBZM05uWGx1SGkwNlF1SmhWUjhK?=
 =?utf-8?B?MWlMdUZHOHF2NE5zSXdESlNvVHR3VGZQZ3VOdVZLTXFvQ3FtRU1NODJ4UHlP?=
 =?utf-8?B?RDVoTVZlY1FuY25ZWGhwd2RjaEorc3RXYmpFSzVyTEJpMDZ5a3ZlYTgrSUs0?=
 =?utf-8?B?V2hNT21QYU85OUdCWWJySzViMW9KMDdNSEVjSTdqQmt3TWdFMUpXZHZZc3VO?=
 =?utf-8?B?aVlBQmxRayt0NytpQXVTN2R4ZEk2YlB1Z3dJbU4rM0djazdXSXZnd29kWUJN?=
 =?utf-8?B?bitrLzlzL1BzTmQwek94VnMxV1ZKUUJxalJXZjg0SmJuUW5pNjJiOEJGbDdi?=
 =?utf-8?B?cnJwekdpbTQvYkVKUGdPSUpMTlZQcVZYUEkybDZTcEFFQXVGb2V5SnVQb3F4?=
 =?utf-8?B?QlZ6MktzZ3lta3JqNG9RS0tjcVR3N3UwVngwWW1xbWw2SFZteFZBUDJiUXUr?=
 =?utf-8?B?SDhjUTB6bjZoLzNESHNsR3k5SW5xRTJOSi91SDVXYm9vbFBaZURqNTlUdkZx?=
 =?utf-8?B?azJ0Y2czNmVPU0w0ZnJwbTVlT2Nveml5Y1BTZGd3YjkraUlxQkY3Ry9kbStv?=
 =?utf-8?B?eWlKd052QVRPcTR1ZkxHNzFmZlk0ZUcwRnVadHlVbFhJVlhWOVZUVGxjeWVZ?=
 =?utf-8?B?YXZrRmR1QzRkcmdZbE5LeTBOa0J0MGxwaEliak5SbVFZdmpURzJrRlNMazVa?=
 =?utf-8?B?NXcyRm5Wc2RNeDYrTmVYSDVJd25XMjdlK3NyTmcvbGlMczhsVE1MMUFkR1k3?=
 =?utf-8?B?QkYyNEhzaHl3Z1NWTC9VNkVSdW1ubGwzcWJUUnNkbXorL25QTE9oTGxLeE5m?=
 =?utf-8?B?YU0yWTZXRzFza2o2aWdQcXBQOXQ0dnYwbWdGcEc5NUFCMko1VUdrSjRic0VP?=
 =?utf-8?B?S2JDN0FnUTBXY2dlaGUvUk9VdExCb2tpV2xpczBmVEVNZHN6dXIvWStDYmZS?=
 =?utf-8?B?VHM2QTAxOXJLajdBa0xHamo3RXZUUE1MNGlRdjVraVpsOGFjemJWQXc4eHZl?=
 =?utf-8?B?bEZhcTNjOHZRaXgzVDdBN01rQ0QydkErQk0rUE1IN1NnSnA0ZkxzUVgzWi8w?=
 =?utf-8?B?RXFYNW9jMmNkYWF0VlJ3ZkVMa3ZvQkRUb1cxMXBuekdVL3VLYUNKSjZidTY3?=
 =?utf-8?B?UTh4OGdJL2JzWWt1UW02Z1V3Z3JTcElqRTRLY2pJVTVwZUFEZGxreXc5ZFhF?=
 =?utf-8?B?NUlKb2dYdW5IelZjNzNzT1pFdGFFWUI5UmJ2NGhEeVRJMkd4Q2RIbk9YcHdP?=
 =?utf-8?B?Q3FIN0JoU045SU9YSDhaSE12UDdIaW91bXovWUFOYjg1QlE3bVR4QW5rVWor?=
 =?utf-8?B?WUxuTHoraUd0eEgxblVlalhHUlFyRTc2U3FJcFF2OVRaRUl4Q1k3c1p1d3BU?=
 =?utf-8?B?a1BHQkVmZFFCNGVxZGUrUDV5OC9XZ0p3TGduaHB1QkNDc1FzbEpIYUlvdmha?=
 =?utf-8?B?dzRucExYbTJWWmFzb0lJRDR2Yi91TzF4akRrbzVLZk1RQlA5Z0JXTm16L0Yy?=
 =?utf-8?B?dm9SNzFwU1ZlSDlTWjZSUTAwVktrNnViZlNoNHJnSHBYNEwrRStjaTF5anZG?=
 =?utf-8?Q?FVvuvWzJazPCX53dUshhRUEkj?=
MIME-Version: 1.0
X-OriginatorOrg: nskint.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7004.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f46a438b-370d-4de2-1b14-08db4f5c365a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 00:36:07.0152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 727455a2-9822-4451-819f-f03e059d1a55
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6b5IbwUJyLPpCd+G9kBgpMKC9XYqbYYQ+6VZ4hIj8R0ziLHtRkl6glvDeSIIbU80JokBBXjtcPDPmGwafLbwrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_013621_856787_9023C0E8 
X-CRM114-Status: GOOD (  13.95  )
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

Hi Dhruva,

Sorry for the late reply as I was on a long vacation.

> Thanks for sharing, I went through and couldn't really find any major changes
> at the controller level.
> So I am wondering if some specific sequence of flash operations on your
> device is exposing some issues in the driver's STIG reads.

Thank you for looking into this.

> Please can you share some logs with the following patch:
> I am trying to see a pattern that may be causing issues.
> I am unable to reproduce this on my end at the moment.

The logs obtained with the patch applied are as follows:

- Error at startup
  - Kernel log
[    0.980598] **********spi_mem_op dump**************
[    0.980613] addr: nbytes:0x0 , buswidth 0x0, dtr 0x0, val 0x0
[    0.984223] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x9F
[    0.988656] data: nbytes:0x6 , buswidth 0x1, dtr 0x0, data dir 0x1
[    0.993362] ***************************************
[    0.998329] spi-nor spi0.0: found mt25ql512a, expected n25q512a
[    1.006574] **********spi_mem_op dump**************
[    1.006583] addr: nbytes:0x3 , buswidth 0x1, dtr 0x0, val 0x0
[    1.010150] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x5A
[    1.014596] data: nbytes:0x10 , buswidth 0x1, dtr 0x0, data dir 0x1
[    1.019285] ***************************************
[    1.524271] cadence-qspi ff705000.flash: Flash command execution timed out.
[    1.533483] **********spi_mem_op dump**************
[    1.533489] addr: nbytes:0x3 , buswidth 0x1, dtr 0x0, val 0x10
[    1.537055] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0x5A
[    1.541579] data: nbytes:0x8 , buswidth 0x1, dtr 0x0, data dir 0x1
[    1.546266] ***************************************
[    1.551123] spi-nor spi0.0: operation failed with -110
[    1.558531] spi-nor spi0.0: mt25ql512a (65536 Kbytes)

- Error at access
  - Access command and log
# hexdump -Cv /dev/mtdblock0
hexdump: /dev/mtdblock0: Input/output error

  - Kernel log
[   75.401297] cadence-qspi ff705000.flash: QSPI is still busy after 500ms timeout.
[   75.401337] **********spi_mem_op dump**************
[   75.401343] addr: nbytes:0x4 , buswidth 0x1, dtr 0x0, val 0x0
[   75.401354] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0xC
[   75.401364] data: nbytes:0x200 , buswidth 0x1, dtr 0x0, data dir 0x1
[   75.401373] ***************************************
[   75.401382] spi-nor spi0.0: operation failed with -110
[   75.401407] I/O error, dev mtdblock0, sector 0 op 0x0:(READ) flags 0x80700 phys_seg 4 prio class 2
[   75.911339] cadence-qspi ff705000.flash: QSPI is still busy after 500ms timeout.
[   75.911372] **********spi_mem_op dump**************
[   75.911379] addr: nbytes:0x4 , buswidth 0x1, dtr 0x0, val 0x1000
[   75.911390] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0xC
[   75.911399] data: nbytes:0x200 , buswidth 0x1, dtr 0x0, data dir 0x1
[   75.911409] ***************************************
[   75.911417] spi-nor spi0.0: operation failed with -110
[   75.911443] I/O error, dev mtdblock0, sector 8 op 0x0:(READ) flags 0x80700 phys_seg 3 prio class 2
[   76.421333] cadence-qspi ff705000.flash: QSPI is still busy after 500ms timeout.
[   76.421365] **********spi_mem_op dump**************
[   76.421371] addr: nbytes:0x4 , buswidth 0x1, dtr 0x0, val 0x2000
[   76.421383] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0xC
[   76.421393] data: nbytes:0x200 , buswidth 0x1, dtr 0x0, data dir 0x1
[   76.421403] ***************************************
[   76.421411] spi-nor spi0.0: operation failed with -110
[   76.421436] I/O error, dev mtdblock0, sector 16 op 0x0:(READ) flags 0x80700 phys_seg 2 prio class 2
[   76.931330] cadence-qspi ff705000.flash: QSPI is still busy after 500ms timeout.
[   76.931365] **********spi_mem_op dump**************
[   76.931371] addr: nbytes:0x4 , buswidth 0x1, dtr 0x0, val 0x3000
[   76.931382] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0xC
[   76.931392] data: nbytes:0x200 , buswidth 0x1, dtr 0x0, data dir 0x1
[   76.931401] ***************************************
[   76.931410] spi-nor spi0.0: operation failed with -110
[   76.931437] I/O error, dev mtdblock0, sector 24 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 2
[   77.441297] cadence-qspi ff705000.flash: QSPI is still busy after 500ms timeout.
[   77.441330] **********spi_mem_op dump**************
[   77.441337] addr: nbytes:0x4 , buswidth 0x1, dtr 0x0, val 0x0
[   77.441347] cmd: nbytes:0x1 , buswidth 0x1, dtr 0x0, opcode 0xC
[   77.441357] data: nbytes:0x200 , buswidth 0x1, dtr 0x0, data dir 0x1
[   77.441367] ***************************************
[   77.441375] spi-nor spi0.0: operation failed with -110
[   77.441401] I/O error, dev mtdblock0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
[   77.441423] Buffer I/O error on dev mtdblock0, logical block 0, async page read

-- 
Thanks and Regards,
Yoshitaka Ikeda
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
