Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB88D44149
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Dec 2025 09:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBR51WCgQVP3M+tr4auxaUXhFti9ltaoCEhIaw+fvdQ=; b=azPLnc4yxO+NcT
	jyuhaIrlApVkiP/VxGvmPuB0lGcMsEZx1LkjeKCmM6QWtOd7dP0IBeZzOmN7Kf9rsCrPKSH/hK4xJ
	h1eP9Nx9CgLKOZFn/zH5WcPdrkNOtWj+AO81yUY1sY/6SZY7uZMZfrsnvPdoDzNFVbqP0Wu8mxsC5
	LXQKMe0mX7hzXjW1S+HQJTcjBLmaTvokDoWj48rjy9zsjUuhVakweGyg9si6or4WH17pNkMHtm5j/
	DMDWaXOg5doBIFLf3CPwZx7sFAGJVqDuANr9wpySPlXjcGRIILyb8+ByGh0U9iWvui6JPMd89XW1i
	qHggeiE0pElRxQMCyugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz3x-00000000IfF-1Cte;
	Fri, 12 Dec 2025 09:03:45 +0000
Received: from mail-francecentralazon11013019.outbound.protection.outlook.com ([40.107.162.19] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTz3v-00000000Iej-1mjX
	for linux-mtd@lists.infradead.org;
	Fri, 12 Dec 2025 09:03:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDU/03oEqO9bkyqi99iohA+UOdIdSsulXCumm4foAoHI6i/eadjhiHKrLCe7psgzJabX3YDhbvMDqH7enU0fGGcwHVmDT2JvkUIXJBuK4Krb+MQW0FYjqZeUD7H8Ur4ScMAi6PbJyhqgJdAbm5U/2RoUOa1qwrZZG6mk04yjPZwL2aXqvmzBEVdNKYfddIVQMxuIpsj6GOV1DRhNYYzf3kx/Plvsk+xwgjrt8oIBHVD4/qRVLe2v09+9igUc6tK6OQQ82hqu93awJegvGMN4P5SisrKRbSJ7/uC/ZSCfGWcpG1wLVD86rZ+30cEQmt10aB0JUSKKVTdukGbNIu77Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YjxBLZL52dDbRm9eAQa1WPVyDa2GW64pb0bCQNcae8=;
 b=T2DxC5Qwwy+LUMt2GfaW9oD85gNgBJo8i37KCazVEnRxCwxnufO4ioSXOdIfdo3kg0n28M1jmPvUWLbF0QkQtvpiIyF1NVi1nL7R/hgTz5tPmYQnNAtw1dJRp+mnQjYJ5TYDfbKYehlfBolUVKG0CCrriG9nzDseiKljn8joMl7yfeSPWyJomKtjFHN7vqvtdSfBjQE1Bi90gE9RM3algfBSSPcHQ7S8amb1i4TEKWwlOapbc3xT1c1JSzXeTbBdDs7DSD08B9tXc0Jt9ZOfWojESgeLMaE9Nv6ePa/w+f5bBoElgUp7Busjbh9/kNyktAVfSxEeZq7IES4kCp0xJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YjxBLZL52dDbRm9eAQa1WPVyDa2GW64pb0bCQNcae8=;
 b=Pc3I7mdXbuzqzJYfSqj/nuACAx3aek4TqA6MthuM94+Kmr/tbDWm8r3WKhKU9AkqtgJwKjTz/9QoNNvhMu8ZqxY6HHJxWxKey3+3FR0+EbYYBlml7x93I9ipB+NU3uhs2Qe4nWJh84fYYh79Lly104RpKOvbnobiADbDM8MRBAHxx3pIf7/vnWt9BENnb1HnyITF4c1VPIpmVfKEsLpDb2F2Ly+2+twm+iMAt1uzw8g2hMKsO0tzJ2ZHyrJ3Z+D04pqw4Mi+VtwsO8AbETOtqTTCJWissTjH9duv/dR4CPXQHMT8HzZZw2ak+6wU2JOPOMfEZ7qDTbx6qQIRGGGGtA==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AM9PR04MB7617.eurprd04.prod.outlook.com (2603:10a6:20b:286::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:03:38 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:03:38 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Michael Walle <mwalle@kernel.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Han Xu
	<han.xu@nxp.com>, "open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER"
	<imx@lists.linux.dev>
Subject: RE: [PATCH] Revert "mtd: spi-nor: micron-st: use SFDP of
 mt35xu512aba"
Thread-Topic: [PATCH] Revert "mtd: spi-nor: micron-st: use SFDP of
 mt35xu512aba"
Thread-Index: AQHca0FxCEaUmSyCeUy+98b5FduawbUdrc6AgAAAbHA=
Date: Fri, 12 Dec 2025 09:03:38 +0000
Message-ID: <DU0PR04MB94960504A809674A265689D690AEA@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20251212-nor-v1-1-20a5a381979c@nxp.com>
 <DEW3M3BQEGIW.3AFGPPSCBGI16@kernel.org>
In-Reply-To: <DEW3M3BQEGIW.3AFGPPSCBGI16@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|AM9PR04MB7617:EE_
x-ms-office365-filtering-correlation-id: 8c4d1c48-2a8d-44b3-bab6-08de395d56f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?gb2312?B?Rk0wOTVWWm83aG1iNDY1dHNmNVIwTmpmemZoUFVsZ0FuRmpoanNkVlVVdEx1?=
 =?gb2312?B?eXJyY0VDaTlxUmlxZjhLcHJ2WXBYNk1NdmRNcHpKend3ZHpLSHFBcjhOU3R6?=
 =?gb2312?B?dURDSjFPU0J2clpILzQ5cTZ3eUw5MlEwTjYydXp4c1N6KzlBdUJsUWtWeEJ0?=
 =?gb2312?B?bk45MFJFaHBuSndNTUIzT1JETk1MYWZ4ai9XOUhxaTNoVk0wY1FpQTl4KzB0?=
 =?gb2312?B?dFZkNHRCZ1Njem5FN1lsM1lzQ2MzL2ZuOEVHaUsvdlNib3ZBbWlGV3dmMkF0?=
 =?gb2312?B?L3lldWRWRlVaY3VhQ1d0TW5mZFN4cnFMK0RtYTJ4WDdoRldwdFJNSWpaTHF0?=
 =?gb2312?B?K2xRbExaazNLZ2M2a0l4b01pY21FNVh4Q29uaHlHVXhJT2VWZ0FmVjBaSGFY?=
 =?gb2312?B?dmVkWEc3c0VxNlZMam5EUis1bHE2Y3hMcDlURFdTVkRBVEJ3R1VKVnp3L01F?=
 =?gb2312?B?aUFRSVdTWGpNY2NvVjFiMDRBNnNhMlU3c3d3ZVU0azRBUkRTeUpCODRVRTlB?=
 =?gb2312?B?SmFOSEtzOTMyTlFsN25oNUUzR1ZxNEZXRHJ6aDZrYXljNXp4VlVnc21kSitJ?=
 =?gb2312?B?T0tCQ2lwUWpyczNBUkdTZmJSV1BsNHFoeXRWeCtVY1l6dXN6M252UnFaa0Ux?=
 =?gb2312?B?Y1diVHVwMWw1RXlXZ0h2WHFvckpjVnF5ZjJzakxDNXhiSnU0dzlxYVhMQkxi?=
 =?gb2312?B?dy9SamhTK0tJaUhhb3RoWGxxK05UUDA0dnllN1o2L3lQNXd4eTcydVNJdExW?=
 =?gb2312?B?U09OTzU1YVQxQlFIS2NXa1czaTIrZXJWT0JYKzlkTlpva3FoSWFVM3psalFv?=
 =?gb2312?B?dXQrZDNoQUtCRzZzSE51N2dUeDZDWmtReHE4WFpnN1BBb3QybDFsRTBpbFFl?=
 =?gb2312?B?TEFXR3BKYis2ay9sQmp4dWZYcFZIaFFhOW80TE14cUIzbHJxVk5CbzdPenph?=
 =?gb2312?B?SnJnelUzNjl0NG1MQ0VJZm9ZYjZvVXVpMExoMDZ6bllKYWdscDBLb1k1T3c1?=
 =?gb2312?B?OXJHbVE5YUpwVjdBQWNVSCtpOEZYQittR2RBUFU2WE5KOE0wQWJIbHBub2R6?=
 =?gb2312?B?Yk1OUlZtSWt2akNQWndrM0V6RVF4ekJVTytzczN6Nk5ZWDUvTU53YnNxVTkw?=
 =?gb2312?B?R2xnQXdubmtzWG1rUUhQb3EvT2hTMXBCL1NpZkpiVU5OeE16UUJWMGFjeTNm?=
 =?gb2312?B?bEhoN0RiWEMvMXZzemxIK3VicmFKU3V2OXo5RFc2cS9HL1NLRk96dTJQb1BB?=
 =?gb2312?B?dVN6QVM1aTVEOXNNMm1od2MrUDE5aVljWitkWVdKWjN4dEtvV3N5QlN4Tks5?=
 =?gb2312?B?Vzl2NGlVNksza3ZxMURaekN2T0RMbE53Tm5XckJhaUdab016RUdyNmEzNXNO?=
 =?gb2312?B?cCtkK25TdXlFK0pSV29ReGlBblpwaW1sNmZpUUNkYVpiNFVHelFGWFhuQys1?=
 =?gb2312?B?MlE4Q2MycEdrbUFUZ2RHZTB2YVpUNEowVlRlU1dZOG4ya205T0dlQU1id0ha?=
 =?gb2312?B?N1ZmSTkyeldTbVU5NldROUhic093a2RDeGhneURQVDVlRUY5TmM2NU94b01w?=
 =?gb2312?B?OTFNbitMNFRnUit0enNVdEF4QVRDVjhHSG5JSjJueXM4S0FNMENaaGVmSm5C?=
 =?gb2312?B?MCtGT2xCbm1JRGZvWkc1RElHN200SnFqR2RqRmE0bExHL0I0aFZDQ1BCRUZ1?=
 =?gb2312?B?RFY0bXBtN3dvWWQ2ZWhZa1F5QlZRaXBGcnJLczFVRjlLQ2FIYmpWampZQ3E1?=
 =?gb2312?B?Y04rYmtHUUhadDByTVhZeWsrNnB2T0NFNW8rL2hBTGM2c2poRzNwd0tsSlFM?=
 =?gb2312?B?b1N3djlYeWZiSXZsbjkzamd2VkdUS0YyREp5SS8xbTROdnlOOXlLWnVXNDRZ?=
 =?gb2312?B?QzZYNW4vQTdVTUhwNW1ybHNpS29qemNpUk5RZ0VpYmJvTXRZV1ZidG5seEhD?=
 =?gb2312?B?R1V3Ry9HaHdQM2U1UXJXa2VHbllyUjBJVTNrSVMvVElzY3F0WXBibHVzVHVP?=
 =?gb2312?B?eGo2UzY1UmlZbGF2M09GSW5hdU0yb1grc1hrdWQyOTBqOHdtS08xMEJHVXVX?=
 =?gb2312?Q?4KYWut?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?MG9FcXNOVnVKT1pOWjkybnVFTlZ1b3ZTTlp4NHUvTUJEYnNXQUh4TkdYaVdD?=
 =?gb2312?B?eUpJc3dMMm8wWUdNWjJqT0Jsc21CUXYwdmdkeEpSSU96UjJoTHpwMW9YL0N5?=
 =?gb2312?B?bmtGUUJRN3pxWkl1bjN4SDJwNHJmLzY0cjA3K1F6L25YSW5wM2VlYkNrS2RC?=
 =?gb2312?B?eHdTLzV4emFzVENWdTFhZXRHcFE4WW05Q0tZd3NmV1dGZjFxUnFhVUF3eDdL?=
 =?gb2312?B?TE0yOGx0K2Z0dnVDYXdZUDAxQXFsSFhGejMxcStwaTRPZW9ucTYwTmhnMEFR?=
 =?gb2312?B?dkNXVkE3MEF2cldIT2NuS0k1ZVFqL040ckgwUmorUTFPRm1iY1R1dDA3d3I2?=
 =?gb2312?B?aHowcks5ZjZXc1QveU56L080eFJDdTUrcm16Q3dwSFB3L1JIU3I0dStNTXlh?=
 =?gb2312?B?Z292eWgvQUFYYUpkdG9wN3Y0MVBoemtuRERHdmdQRWN6amQ3RUFIbDJtWmhj?=
 =?gb2312?B?Mno4MkZCaFdIZGwrMDNYeXcybGdWL25BODlQMG5lamFSOWVqaXF4N0RReWdv?=
 =?gb2312?B?b3ZJdUpCWTJleXR6dlNvMTVWcjJ0Q3UwbXEybUVQL0lZTVExRjU3VEpPdmNI?=
 =?gb2312?B?Q2ZYT2xzSVdYcm9nbnVIZkNVbW51WU01VnFaRnRSQ0YzTVU3aWp5elRIRjhH?=
 =?gb2312?B?bm50cEpQMzhSTzVodFpmMEVYdEhGVjA2ZFRiWG9KbHZ5M3dVYnNxNGpkOWYr?=
 =?gb2312?B?Qm1zb2xGangrRzM1ZWFpRDBNYjZOM092MlpRMEdIZ0J3dnFVSUFhc084UHZu?=
 =?gb2312?B?c2hIYk1YSXpvS2tGK045MFZkb3I5cEx2Tk5NKzZWejN3OXk0MGtwbGw0MUY1?=
 =?gb2312?B?enNmZWI2M2tSTGN3bVBURUc4TUY2bTZHOEZRZTV0VkpPQ3c2dHZtUWJTbEFw?=
 =?gb2312?B?UEt1YzNvdGZBQ3ZJV1BMVTNPY1pEVzE1NHFGb0JXcFVRR2xVUzFZY1o1TG5a?=
 =?gb2312?B?eURpTEJDQmxnTWgwa2ordnBjVkRXN0dPNWp0N1cyUUlQeFJQWXRIZXRxbGJY?=
 =?gb2312?B?ZU5LTWlKSndYa1haYk9UVlg3N1BHcTd4UDBmZnlwNDgrZ2R6SDJMREFTTkNi?=
 =?gb2312?B?VlJWczJzVlRTWkcxYzRkc1c4OTh2emxic05WQTgyUnBrOUZxQ0dnVEZ3YytG?=
 =?gb2312?B?UzRyMjhRVFczWTN0QUJPT1dqVnJiUUxYYjRWeXprTERqRUdXaHZnUEovK21q?=
 =?gb2312?B?QzZQN0I1QUdCcXE3ZVZndThUZE14Z0Nnd3ROdUVXZjlES0xvMEFvOWFzZUlX?=
 =?gb2312?B?SVIxdXdUZ2x1ZG9zODZJYmhtUmVTZnB4MWZNU05hcHAzVGVjN0xDSWIrV1hK?=
 =?gb2312?B?VVZxVS83b1pFQXdKN01ENnl4S0dhamtWS1B0cG0xdXoxUnJTbnlQRno5cVQ2?=
 =?gb2312?B?cTdIK0lRWUFUQ2hqdXA3d1dqUDdJblRHSWpOWW9jTWVFU2V2eTJ0blRiMFYz?=
 =?gb2312?B?RzRVemZyWTExVmZTUkRkelYzUWdvQ2x2QkVyYjZjWDVUOEhSdXBRWTRlQml4?=
 =?gb2312?B?c2VnSXNuZTZOS1FoWDB4Qk9EQy96ckVkN05EekF3OGQyZmJHL20wVkRyYktE?=
 =?gb2312?B?am5sWnNoT0k2emszcXNrRlBWcGovTXRwTHA5UE5qT2plSldjZS83a0ZoN3A0?=
 =?gb2312?B?VjV6bHJlb2dDZmtvamp4d0pCekl1NFFXdjR5QXN1U25PYU56NXR1OVJnNkgy?=
 =?gb2312?B?ci9zVW8yeDFxYWsyMHRiRjV5ZWFybFhOYklmV1BMU2RFUkxpRFNXcnArazhs?=
 =?gb2312?B?YlZWSUNENTJLT0o3NFRINzZuckdTS2s2TXR1bjdham1jWDArT1Myc1ZUS1p5?=
 =?gb2312?B?aDAyeXBiZTk2K0RBQzMxblBZb0EzTi9vN2Z5R1JpczBRN3hzaklFenBpOWMz?=
 =?gb2312?B?SHRGQWxDY092N2REbEdrZ0REeEUvcjZvTGttUEM0bmlIVVVxWXNMOVllWU9W?=
 =?gb2312?B?Y1poY2JpTG80NGd0ZytXeW9uQ2NVdnQxLzIwZjRxTWVSczdlR05wd211RmZt?=
 =?gb2312?B?a3NYaFZNWG1IS1ZSMjRRY1U0VUIwcnQ5T3VsSUNSd3VvVUdxVEdqOHBQbmVB?=
 =?gb2312?B?TFkvbHJjeUpmSnRhQWpOUWt5dmRRYWpJdnJjTHI3bkZtOXpzdmZoTWhZSnNN?=
 =?gb2312?Q?BLhw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4d1c48-2a8d-44b3-bab6-08de395d56f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 09:03:38.6759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6mL8U/sGeeHy8NOx2UI9FGfAkS9LXNEJ4oipkgpqREN+lqDnZzy1mzjux9JBYWQ/BvdcBGPFB0FWXLKrj6iBuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_010343_626739_C6EA71BE 
X-CRM114-Status: GOOD (  18.43  )
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoYWVsIFdhbGxlIDxtd2Fs
bGVAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyNcTqMTLUwjEyyNUgMTY6MzUNCj4gVG86IEJvdWdo
IENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT47IFR1ZG9yIEFtYmFydXMNCj4gPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz47IFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPjsgTWlx
dWVsDQo+IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT47IFJpY2hhcmQgV2VpbmJl
cmdlciA8cmljaGFyZEBub2QuYXQ+Ow0KPiBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0
aS5jb20+DQo+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgSGFuIFh1DQo+IDxoYW4ueHVAbnhwLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gUmV2ZXJ0ICJtdGQ6IHNwaS1ub3I6IG1pY3Jvbi1zdDogdXNlIFNGRFAgb2YN
Cj4gbXQzNXh1NTEyYWJhIg0KPiANCj4gSGksDQo+IA0KPiBPbiBGcmkgRGVjIDEyLCAyMDI1IGF0
IDk6MzAgQU0gQ0VULCBIYWlibyBDaGVuIHdyb3RlOg0KPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQg
NDRkZDYzNWNkNjMyODI0ZjQxMmZmMmE2YjMyMGQ5MzAyYTI3N2FkMC4NCj4gPg0KPiA+IEZpbmQg
dHdvIGJhdGNoZXMgbXQzNXh1NTEyYWJhIGhhcyBkaWZmZXJlbnQgU0ZEUCBidXQgd2l0aCBzYW1l
IGplZGVjDQo+ID4gSUQuIFRvIG1ha2UgYWxsIGJhdGNoZXMgb2YgbXQzNXh1NTEyYWJhIHdvcmsg
d2VsbCBhbmQgc3VwcG9ydCBPQ1QgRFRSDQo+ID4gbW9kZSwgYmFjayB0byBoYXJkY29kZSB0aGUg
ZmxhZ3MuDQo+IA0KPiBXaGF0IGFyZSAiYmF0Y2hlcyIgaW4gdGhpcyBjYXNlPyBBIG5ldyByZXZp
c2lvbiBvZiB0aGUgc2FtZSBmbGFzaCBjaGlwPyBXaHkNCj4gd291bGQgdGhleSB1c2UgYSBkaWZm
ZXJlbnQgSUQgdGhlbi4NCg0KSGkgTWljaGFlbCwNCg0KWWVzLCBzZWVtcyBhIG5ldyByZXZpc2lv
biBvZiB0aGUgc2FtZSBmbGFzaCBjaGlwLiBBbnlvbmUgZnJvbSBNaWNyb24gY2FuIGNvbmZpcm0g
dGhpcz8NCg0KV2hhdCdzIHRoZSBub3JtYWwgd2F5IGZvciB2ZW5kb3JzIHRvIHVwZGF0ZSB0aGUg
U0ZEUD8gU2VlbXMgYWxzbyBuZWVkIHRvIHVwZGF0ZS9jaGFuZ2UgdGhlIElELg0KDQoNCj4gV2hh
dCdzIHdyb25nIHdpdGggdGhlIHBhcnNlZCBmbGFncz8gQm90aCBzdXBwb3J0IFNGRFAsIHNvIGlm
IHlvdSByZWFsbHkgbmVlZCB0bw0KPiBmaXh1cCBhbnkgZmxhZ3MsIHBsZWFzZSB1c2UgYSBmaXh1
cCBjYWxsYmFjayB0byBhY3R1YWxseSBmaXggdGhlbS4gQnV0IGZpcnN0LCB3aGF0DQo+IHdpbGwg
Z28gd3Jvbmc/DQoNClllcywgc29ycnkgdG8gbGFjayB0aGlzIGluZm9ybWF0aW9uLg0KDQpGb3Ig
bXQzNXh1NTEyYWJhIGNoaXAgd2l0aCBsYWJlbCAwREExNSBSVzMwMywgdGhlIFNGRFAgZG8gbm90
IHN1cHBvcnQgT0NUIERUUiByZWFkL3dyaXRlIG9wZXJhdGlvbiwgDQpidXQgc3RpbGwgaGFzIG9u
ZSAuZml4dXBzID0gJm10MzV4dTUxMmFiYV9maXh1cHMsIGluIHRoaXMgZml4IHVwLCBpdCBjb25m
aWcgdGhlIE9DVCBEVFIgcmVhZCBvcGVyYXRpb24sIHNvDQpmaW5hbGx5IHJlYWRfcHJvdG8gPT0g
U05PUl9QUk9UT184XzhfOF9EVFIsIGJ1dCBub3ItPndyaXRlX3Byb3RvID09IFNOT1JfUFJPVE9f
MV8xXzEsIHRoZW4gaGFzDQpubyBjaGFuY2UgdG8gY2FsbCBtaWNyb25fc3Rfbm9yX29jdGFsX2R0
cl9lbigpLCB3aGVuIHRoZXJlIGlzIHJlYWQgb3BlcmF0aW9uLCB1c2UgT0NUIERUUiByZWFkIGNv
bW1hbmQNCm1lZXQgaXNzdWUuDQoNCldpdGggdGhpcyByZXZlcnQgcGF0Y2gsIEkgdGVzdCBtdDM1
eHU1MTJhYmEgY2hpcCB3aXRoIGxhYmVsIDBEQTE1IFJXMzAzLCBPQ1QgRFRSIG1vZGUgY2FuIHdv
cmsgd2VsbC4NCkFsc28gdGVzdCBtdDM1eHU1MTJhYmEgY2hpcCB3aXRoIGxhYmVsIDRLQTE3IFJX
MzAzLCBPQ1QgRFRSIG1vZGUgd29yayBmaW5kIHRvby4NCg0KUmVnYXJkcw0KSGFpYm8gQ2hlbg0K
DQo+IA0KPiAtbWljaGFlbA0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBDaGVuIDxoYWli
by5jaGVuQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gbXQzNXh1NTEyYWJhIGNoaXAgd2l0aCBsYWJl
bCA0S0ExNyBSVzMwMzoNCj4gPiByb290QGlteDk0M2V2azovc3lzL2J1cy9zcGkvZGV2aWNlcy9z
cGk4LjAvc3BpLW5vciMgY2F0IGplZGVjX2lkDQo+ID4gMmM1YjFhIHJvb3RAaW14OTQzZXZrOi9z
eXMvYnVzL3NwaS9kZXZpY2VzL3NwaTguMC9zcGktbm9yIyBjYXQNCj4gPiBtYW51ZmFjdHVyZXIg
bWljcm9uDQo+ID4gcm9vdEBpbXg5NDNldms6L3N5cy9idXMvc3BpL2RldmljZXMvc3BpOC4wL3Nw
aS1ub3IjIGhleGR1bXAgLUN2IHNmZHANCj4gPiAwMDAwMDAwMCAgNTMgNDYgNDQgNTAgMGEgMDEg
MDMgZmYgIDAwIDA4IDAxIDE3IDMwIDAwIDAwIGZmDQo+ID4gfFNGRFAuLi4uLi4uLjAuLi58DQo+
ID4gMDAwMDAwMTAgIDg0IDAwIDAxIDAyIDkwIDAwIDAwIGZmICAwNSAwMSAwMSAwNiBhMCAwMCAw
MCBmZg0KPiA+IHwuLi4uLi4uLi4uLi4uLi4ufA0KPiA+IDAwMDAwMDIwICAwYSAwMCAwMSAwOCBi
MCAwMCAwMCBmZiAgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYNCj4gPiB8Li4uLi4uLi4uLi4uLi4u
LnwNCj4gPiAwMDAwMDAzMCAgZTUgMjAgOGEgZmYgZmYgZmYgZmYgMWYgIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwICB8Lg0KPiA+IC4uLi4uLi4uLi4uLi4ufA0KPiA+IDAwMDAwMDQwICBlZSBmZiBm
ZiBmZiBmZiBmZiAwMCAwMCAgZmYgZmYgMDAgMDAgMGMgMjAgMTEgZDgNCj4gPiB8Li4uLi4uLi4u
Li4uLiAuLnwNCj4gPiAwMDAwMDA1MCAgMGYgNTIgMDAgMDAgMzkgNjEgOTkgMDAgIDg3IDhlIDAz
IGQzIGFjIGExIDI3IDNkDQo+ID4gfC5SLi45YS4uLi4uLi4uJz18DQo+ID4gMDAwMDAwNjAgIDdh
IDc1IDdhIDc1IGZiIGJkIGQ1IDVjICAwMCAwMCA3MCBmZiA4MSA1MCBmOCBhMQ0KPiA+IHx6dXp1
Li4uXC4ucC4uUC4ufA0KPiA+IDAwMDAwMDcwICAyZiBjYiAyNyA4YiAwMCAwMCAwNCAwMSAgMDAg
MDYgMDEgMDAgZmYgZmYgZmYgOGUNCj4gPiB8Ly4nLi4uLi4uLi4uLi4uLnwNCj4gPiAwMDAwMDA4
MCAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIDAwIDAwIDAwIDAwIGZmIGZmIGZmIGZmDQo+ID4g
fC4uLi4uLi4uLi4uLi4uLi58DQo+ID4gMDAwMDAwOTAgIDQzIDBlIGZmIGZmIDIxIGRjIDVjIGZm
ICBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZg0KPiA+IHxDLi4uIS5cLi4uLi4uLi4ufA0KPiA+IDAw
MDAwMGEwICAwMCAwYiA4MCA5ZSBiMSA4MSBiNSA4NSAgMDAgZjAgZmYgOWYgMDAgMGEgMDAgMDAN
Cj4gPiB8Li4uLi4uLi4uLi4uLi4uLnwNCj4gPiAwMDAwMDBiMCAgMDAgMGEgMWEgODggMTAgMDAg
MDAgMDAgIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmDQo+ID4gfC4uLi4uLi4uLi4uLi4uLi58DQo+
ID4gMDAwMDAwYzAgIDAwIDAwIDA2IDAxIDAwIDAwIDAwIDAwICAxNCAwMSA4MSAwMyAwMCAwMCAw
MCAwMA0KPiA+IHwuLi4uLi4uLi4uLi4uLi4ufA0KPiA+IDAwMDAwMGQwDQo+ID4NCj4gPiBtdDM1
eHU1MTJhYmEgY2hpcCB3aXRoIGxhYmVsIDBEQTE1IFJXMzAzOg0KPiA+IHJvb3RAaW14OHFtbWVr
Oi9zeXMvYnVzL3NwaS9kZXZpY2VzL3NwaTQuMC9zcGktbm9yIyBscyBqZWRlY19pZA0KPiA+IG1h
bnVmYWN0dXJlciAgc2ZkcCByb290QGlteDhxbW1lazovc3lzL2J1cy9zcGkvZGV2aWNlcy9zcGk0
LjAvc3BpLW5vciMNCj4gPiBjYXQgamVkZWNfaWQgMmM1YjFhDQo+ID4gcm9vdEBpbXg4cW1tZWs6
L3N5cy9idXMvc3BpL2RldmljZXMvc3BpNC4wL3NwaS1ub3IjIGNhdCBtYW51ZmFjdHVyZXINCj4g
PiBtaWNyb24gcm9vdEBpbXg4cW1tZWs6L3N5cy9idXMvc3BpL2RldmljZXMvc3BpNC4wL3NwaS1u
b3IjIGhleGR1bXAgLUN2DQo+ID4gc2ZkcA0KPiA+IDAwMDAwMDAwICA1MyA0NiA0NCA1MCAwNiAw
MSAwMSBmZiAgMDAgMDYgMDEgMTAgMzAgMDAgMDAgZmYNCj4gPiB8U0ZEUC4uLi4uLi4uMC4uLnwN
Cj4gPiAwMDAwMDAxMCAgODQgMDAgMDEgMDIgODAgMDAgMDAgZmYgIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmDQo+ID4gfC4uLi4uLi4uLi4uLi4uLi58DQo+ID4gMDAwMDAwMjAgIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmICBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZg0KPiA+IHwuLi4uLi4uLi4uLi4u
Li4ufA0KPiA+IDAwMDAwMDMwICBlNSAyMCA4YSBmZiBmZiBmZiBmZiAxZiAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgIHwuDQo+ID4gLi4uLi4uLi4uLi4uLi58DQo+ID4gMDAwMDAwNDAgIGVlIGZm
IGZmIGZmIGZmIGZmIDAwIDAwICBmZiBmZiAwMCAwMCAwYyAyMCAxMSBkOA0KPiA+IHwuLi4uLi4u
Li4uLi4uIC4ufA0KPiA+IDAwMDAwMDUwICAwZiA1MiAwMCAwMCAyNCA1YSA5OSAwMCAgOGIgOGUg
MDMgZTEgYWMgMDEgMjcgMzgNCj4gPiB8LlIuLiRaLi4uLi4uLi4nOHwNCj4gPiAwMDAwMDA2MCAg
N2EgNzUgN2EgNzUgZmIgYmQgZDUgNWMgIDAwIDAwIDcwIGZmIDgxIGIwIDM4IDM2DQo+ID4gfHp1
enUuLi5cLi5wLi4uODZ8DQo+ID4gMDAwMDAwNzAgIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58DQo+ID4gMDAwMDAwODAg
IDQzIDBlIGZmIGZmIDIxIGRjIDVjIGZmICAgICAgICAgICAgICAgICAgICAgICAgICAgfEMuLi4h
LlwufA0KPiA+IDAwMDAwMDg4DQo+IA0KPiBUaGFua3MhDQo+IA0KPiAtbWljaGFlbA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
