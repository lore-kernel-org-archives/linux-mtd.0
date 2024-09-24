Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636CDCF9C6F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 12:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yGO7gLBsLI4BykxcvLygBAzWJIPJYy2xdZqqLZ0Zaus=; b=d5GemLPoLNwlIY
	NWprNEBCI8ZAArbbRReJ63Bs2L1qq9jILrrqni8YKvZIdgJCxmCR5DCMNRVDI1Zy0O0qnFJhteZ4Y
	xoIpewbkdWJ0NpKaBizukLshUWy49xKkywnOkuG1qCtUSHVkfFo20a35QPpgSBEhajW418JMs+Y54
	QIuqPEt+QvsV8u+kKW4I6dev3416XlKGe5SPoxMkapiPmAHoTO6fvFmDPVSIG7hnWGrw3zCXRt5EQ
	z5pAHR8aCVQIqzPtQt85FQiMdIj4yjDhN8nb/AHq6dP/CsMRST9DOVlxdITYl3sVGd7erl5dbS/Zp
	1IX3S5PMBeNJsmZ6OPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st4hs-00000002KDN-3Aii;
	Tue, 24 Sep 2024 12:31:52 +0000
Received: from mail-am6eur05on20621.outbound.protection.outlook.com ([2a01:111:f403:2612::621] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st4hp-00000002KBH-33hH
	for linux-mtd@lists.infradead.org;
	Tue, 24 Sep 2024 12:31:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MhGR5RPyV42+PLNA67WbQSRTx5O0slSTcsZHMWg8EuBiLXhQ7KdCbmBoXq4DyIOQ65a+NqTVMhfqlTscq5jmEbmS/+7VCRczCm4u2M2gjU8s9VGcNJ/hBVpbJCGuc2mIKeDjVt6xAqfqGTKjXntH+1OH7WMF9kkLGeIKPB/J4J6LOsY2tSVAUq2Hw7K6qpYkX4bcPik7HhG9WhQjFp2unwYeOQHC/gH2I2DSJSm0de4c4dBJws0c5b2amc3Lnw9Tc7tO8ypbxwYDDkdphGp9WlYSoDA9ZAmCmJ5G5+nJ0WZRnhEkPhpNvbbQLo5c7gxoLnDYde0Vdw4C4yutrAXTdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pASWFbE2vWCYMnb05l1k2h8OAZS4VVApqW9wvsXrAqE=;
 b=jTjHnPHA2k0n/fjzQoJdAZ7ZXlWhLkVOj8LnWn/PmXnqF5F3zJFkZfNXCulB6n1//J8dUV7gdfPwHmKTOGbYAqRVrcu/jC9pAOliRfI+UpdRjXl+tqq2ByiMnHTe45lXSL3htHHLeTxWBIB0XuAkN+IAOTWYb1HRhrQ+UDEX9o1PX7OLkTK6Zz3C6wBCvy9vcPfhp0NY4s6WprViMHnfzlW4TTWZv5eAJ5MpZFRff9kbCaDBKN2N7xW8fCAc7liCCBQPg/RP54m1gNSEsGaSErskW7/UThMbnsJnZZIaqji+hkOrlH0dAEub25tWXMPxC6QJ/sP0T8gutBgi/KZ17w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pASWFbE2vWCYMnb05l1k2h8OAZS4VVApqW9wvsXrAqE=;
 b=iKgdgM7zYnYIy3PBFY/jOC+++T8ODJg1ZVp8SjK1ordcfUj7Le7P8FzKULCw5GmP2g973WJZ2pTFFyUgvzf4xfIhn/Fexsg31mg3/emj8a6ec/bWWwA+vpRDsdRjN4eY251vkrDVdG3tqCEwdKyKCTDBXbkOlfcObt0EDd8MVkvHAotZPF/iM5UlvMG8/RKkyAtq7GFH60Avn1PbmHGVhJego2BW/43NlsOR31qGv46kZ6VkBkJMoPI48JTaN3kaWL5iOhOBYkBvLHSvHCRLuaV+HfoZNm3XYSeo4nVZWEKezIlEQ7Mtx/FkAoqsScvoPwPXYKldONd7bU3tLj5QVg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GVXPR10MB9182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 12:31:34 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%3]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 12:31:34 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "mwalle@kernel.org" <mwalle@kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
CC: "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>, "vigneshr@ti.com"
	<vigneshr@ti.com>, "pratyush@kernel.org" <pratyush@kernel.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>
Subject: Re: [PATCH] mtd: spi-nor: infineon: add Cypress (Ramtron) CY15B102QN
 F-RAM support
Thread-Topic: [PATCH] mtd: spi-nor: infineon: add Cypress (Ramtron) CY15B102QN
 F-RAM support
Thread-Index: AQHbDdkd6GH0fAscAkSkmEnaZH6UwrJmmoEAgABFLAA=
Date: Tue, 24 Sep 2024 12:31:34 +0000
Message-ID: <36adf15058a6c0ccf5d3842460d3505b282f340e.camel@siemens.com>
References: <20240923165324.845639-1-alexander.sverdlin@siemens.com>
	 <D4EDC01ZOSDV.AOFOP6LNWWJ6@kernel.org>
In-Reply-To: <D4EDC01ZOSDV.AOFOP6LNWWJ6@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GVXPR10MB9182:EE_
x-ms-office365-filtering-correlation-id: 93157849-b705-49dc-8082-08dcdc94d39a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bHhORm02b1BBcG13WXBLYXhzZWNrbFgyVUN5YkRmU0JrL1BGSk1IVnE2SExR?=
 =?utf-8?B?RitjbVkzOE02ckRBWnQzb2plV2FXejNmZ3JobEJXTXV3NkdiL2N2SWxqK2J3?=
 =?utf-8?B?MXIyczFvNEJOWkhCSFozMUtxQktUeUE2OFkraE52cmNvMjVKK251dkFXZGxj?=
 =?utf-8?B?QjZXSFpLTFBmKzJmL2ZKZmpvanJweVhOUkFydFIyMXVncVdTc0pBdS9SSHVK?=
 =?utf-8?B?Qk11UHhCU2d5Skx1UFd1YXhyNTBXUXkzL1pkcW9sRGM5c2svcVgxcDlxZ1BQ?=
 =?utf-8?B?QzRsa0VMNUw0VGtGWTJ0TmRDZUJ5SEtoNy92cUEybnk0c1FQVXVia0ZheXp0?=
 =?utf-8?B?N3Z1SkdwNWxEcmprMzZFRzMyTDZhMndkaUM1eWV1Slp6QUtyMVcxS3c5RUFH?=
 =?utf-8?B?N1NYdW5zT0lJZ25MdnBqWWZSNUlyU1ZwSWVKSXpuS01WY3orL3Y2SlNjd0pH?=
 =?utf-8?B?SERvYTQ4ZkQ2NytiZVY4ZWJPSkFZbGJTTkVPSm9iYUFpVXM4c0JvVnBDQml4?=
 =?utf-8?B?d0UrSUdOQlQxRmg3bHFEbHVTT2IxY0VGZkV1OHRaU0pmb2praXluT3FYTmJl?=
 =?utf-8?B?MVl5Y0pKdk51TTdFMTRvVVA3QnNmc0JWTy9wVWlJL2RFVVR4eHVNbU9EWlVT?=
 =?utf-8?B?L1ZGdk93V0lWVzlXWmtBaUl3MXM0OFNSVm1PbUFEek8yeHArenNETDF4SldV?=
 =?utf-8?B?c1RkZ1c4YTR4SHA2MDNERkEwMDBmeGlhVTZOQjJCRjQ3VlBoRG53WVdqTzNJ?=
 =?utf-8?B?K0Z1MXlMeG9aOGFVK0xnSDhEOTBTNnZxSFZjUm1MZ2hIUmRUeTRldDNrRFNE?=
 =?utf-8?B?aE1sNFR0ZVMvZWpDVExCR0d1enVvVGhQN0pLbzFMUkU5TTJyQ3FubERKNDZz?=
 =?utf-8?B?UjJ4TXZZRHpJU2w0K3M2Zk5Wd1BpcS9uWlJBM3hQYXRIc1B5bEhlcHl3d1BL?=
 =?utf-8?B?L0Y4eHJvSG11K0VjUWxvSjBERHJLcDZPUGppcEhBNnp5UnprRlNrNVc5UzNt?=
 =?utf-8?B?TytiNjhueHBvV2pZZVlrV0EwWDNDbjhxcnczNnEvS3lPeUlsR0h6Q2N1UzYx?=
 =?utf-8?B?ZzJBR3hVRFQ0VEtLWnJMZmQwZlNCVW9RQlM5VVp1MjhCT21hUW5ZUTI1SGsx?=
 =?utf-8?B?eS9OM1I3eXZtVFlBMVZCMGlOVnRXSUl5djJaK3FjbjNGaS9XSEllaHpxUE05?=
 =?utf-8?B?aUFjNGhvbjlrUytENmpjTmNpSFU4amdieTY3UVBCV0tFa2dyVC9CWEtSZDhm?=
 =?utf-8?B?RFFkNGREOHdOSzkxQ3ZlRUl3b0gyQk5ZMnk0aG5OenY3TFJvUno5RzRoTHc5?=
 =?utf-8?B?WGhuRXlJS1NsTTR1RExaMXkxU0lmdUdzSTl0cStaejlLUjR1dHc3U2JHcXZq?=
 =?utf-8?B?dWlwanFlTUw3cEdqRjFybXdrK0k5TnFPNS84VEdFVjYyRHRWOElPOFMvL0VB?=
 =?utf-8?B?Vkd5amtHWVZjdVA5MWcyRkJIOXl2Mzk1cEdRTnNDZ1RZM1U3RXNuYnlMWjRi?=
 =?utf-8?B?d2hxWSsyOVkrenFsS0FkSkZsbmpReUFDOGVGTFBxY0Jtc2ordStRNnlOSGtT?=
 =?utf-8?B?bVRSdzFBWmRjTHFmUUJ1MGlTOFBnOWRSazVNeVFUeGxaV20wcDJGOUlXNitS?=
 =?utf-8?B?Q01mRW9neHFPMVBuNkJFdHZuMEIzY2JzQ3psWkU5RTEwZVFjSDZHTFRjN3c0?=
 =?utf-8?B?bC9FaHVsWmRZa0VKWk03eEtLVVlLWUpPSkdxMFg0TUIzK3pCSHh3bnJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjFpVnEyVlhoWmNHVnlQSUpKbm8yV2pqTE9Lb3VkZFBXSjFkTTQyTzRxVnUw?=
 =?utf-8?B?eUF6djAwV2dCYkhsbVdwdXJlVklJNEdjZ0xxVm8yUE9WZW1jUEplUlRZcS9F?=
 =?utf-8?B?MTV3VjU5Ri92V2EzbElCV1QyQWhuS0JqMjRNUHlITkMxanVwMW9UYWt4d25V?=
 =?utf-8?B?ZFY3eGpLclo4bVBrd09XQzhLS1E3cWs0SVVzeitHMzFIelUxYjBzRnl1MXVD?=
 =?utf-8?B?Zy9IbVppWjBkYmVPcDNUWEcvYmlTaWpLK05SRkU1azI2OHRUTkNoUk9QZEg0?=
 =?utf-8?B?SWY1MDZ4Nk9zcFRGZGxqNjlwdmlNMVdqWkNtZ01hZVpLOTIxNFR0d29pZGVl?=
 =?utf-8?B?U1hTVW1BdUJmejBlYVN0WEJwS1RmS2JtbCtMRWxLbHFITm5LSm1VZ052Wjdk?=
 =?utf-8?B?cDBJdjZ6eW1HWEc5WFlHOWtJMlJrelNrc2RLUy9IY2xVZmJ6d3hqRjdkQ1Qv?=
 =?utf-8?B?ZkJEa3EybWNlQml4d3hRZDRLZC9YRG84c0xIbGQ4VFNLWFEwbXhzQWNLbm1F?=
 =?utf-8?B?T0wranU2UXN4QU93SzlZU0Z4Uk5JdFI3M2txYmJieE5oa3hyVFF4b2o4MmFu?=
 =?utf-8?B?NGR1MTE1RFBVcnpEbzUzUDNkbU9DUjJodnNvbWNBZW5BdEJScENMRlRCRXNN?=
 =?utf-8?B?aUZ4UFlod1UxTXZ4N3RYZUJCRklkeHZoaU1iQU8vV3ByUmZORVllZXM1S0o1?=
 =?utf-8?B?THBBTjdvb0VCNWV5NlVXWmxOdHFac2EyNlFKUWtnVFI5cUhseVJyTng1YWx3?=
 =?utf-8?B?c2UzMUp2L2ZWV1dHbU9HQm9IM2JRRDU1d1ZoZ2hoN3k5cUdCdHIxcVlyQzg5?=
 =?utf-8?B?czRCU3NLOWpYU2JjNk12Y2hqenRFb2xHYndJL1A5Q3dZUkJOMDJQYm56Vlg5?=
 =?utf-8?B?Y2lwcWUyeCtWOCt1clJtUmZSa0kzNDE3SFFNM1I2UXVMNU5Sc0lIVC9GRFkr?=
 =?utf-8?B?M1BzMDh2c0tkamxROEY4cjVKcTZnNDJnOEhnODRaZFJBdktBZHBaOVJCMGZ5?=
 =?utf-8?B?VE9lNEhTaW5rYThDTTRzNFRjOXFISXdENXJSNXZvZis1S1VrcGtzMFFVcHF5?=
 =?utf-8?B?UDY0YkNwYklDdDQ3V0xLNmcrTkltQURwR0Q5OVdrdjgvTUlJQ29xUUw4THAz?=
 =?utf-8?B?U2c3dDlFS2pEQ2tRdnc4NXNzc1AzN3k1dGZTd3JXOHBrdkkraklwY3YyaU5w?=
 =?utf-8?B?T1Vrb3VESm5ZMTgrVlJiN1ptVDkya1dUZi9JTXJpUGlHQ3RYblk2bk5NRmd0?=
 =?utf-8?B?MHRURmVDU09XdzR1d25NcFV0U05sNDJGRnoxR0VPc25Ddmd2SGtmMzlRTGNi?=
 =?utf-8?B?cDVsSFQ2T0JiVUNJb0Jzbk5hSUQ2WnFIMHlmUmRrN29uVjh0VkttMmRVN3Vs?=
 =?utf-8?B?ajY4cWp4N0x0ZWtMend0NDRvV1o5OXVVcS9JZXFOTGNja3hzUnNTUm1ubUQv?=
 =?utf-8?B?bFdWYzBqajJwSi91UVlUVTJJR2xtZnVrUUI2VnV1NmZQTzA0NzlkVkZjTkk3?=
 =?utf-8?B?Zy8wUDVjc3A4ejYzMUplcjViSE9CT2FGS09UeWtRU3dWVFJJUnI1dkFKWWFD?=
 =?utf-8?B?QUNzbVY3R29xaGp5bFVnQWJqelBFNXpJMENPbjdmK0tYa2VIRUFEOExSNnhZ?=
 =?utf-8?B?Wko1Ry9sd2hTa0h6SVFMR3BPcmZhVittMXEvOStjSkt4NkpYNUpVU2JYS3Js?=
 =?utf-8?B?b2wwanM3ajdIalBZcDdWVEl0WmJ4bjEyd21jaFJzbmxWWUlvcWI0bmRhbG5v?=
 =?utf-8?B?YW16S05oS2M4bThvLytDTCs2c1NJTnc2WisyZ3VLVjVST1NxV0lFRlBwMjdm?=
 =?utf-8?B?cE5hakcrVFk3ZWxlUkcvZ1RvRUZaaHllTDdXVG5vMUIvRlZPbTR6MVlJcmZz?=
 =?utf-8?B?M0tMVFMwVW5KYVVlSnQzdXg3cTBGSDA3YnZ2T2NiZTlOSVhSek4yT0dwNktB?=
 =?utf-8?B?QmF4eXRGK0Y5WkFML3hrSi82T1lyc1cxZE5ESFBKdGJibW1meFpUN0ZNR3hU?=
 =?utf-8?B?aXdQSmg1Y1hMdWcwcnlqMW1OcXFreWk2cmhoQk9wZ1AxeGcwbVJqWU5UaVIr?=
 =?utf-8?B?MVVlNWNCeUlvdHR0WDNxcStrN2JvTERhQTE1NkJBVjFnL1JJOWRlaEdGTFly?=
 =?utf-8?B?TnJKMXN4WWw5Zy9JTnIzaXg5SkdPUmRwSlBtbzlRbEszVEpVUURrajRqWlhQ?=
 =?utf-8?Q?1plH5g6g8oEvF5WkJeFzgpw=3D?=
Content-ID: <C5980DA03736204CAE8B6AA448D756F1@EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93157849-b705-49dc-8082-08dcdc94d39a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2024 12:31:34.2176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dY6Tzljm3wTrT0xo4qmzM/fAi+aUub4f65ylwQ7w9CuwYNEv+QPMpVUuL/oR6m38e/n2GchnyIcZhdl+B1xwzDctnUPfFaMW7XrZLnO/1jA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_053149_908543_4116CADE 
X-CRM114-Status: GOOD (  10.39  )
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

Hello Michael!

On Tue, 2024-09-24 at 10:23 +0200, Michael Walle wrote:
> > Similar sad story as with "cy15x104q" where JEDEC ID comes last-byte-first.
> 
> Please have a look at
> https://lore.kernel.org/linux-mtd/20240729102016.8527-2-alessandro.zini@siemens.com/
> 
> TLDR, please have a look at at25.c.

It unfortunately doesn't work with SPI host drivers which only implement spi-mem API.
Or did I miss something? Otherwise "cy15x104q" could also be handled by at25.c.

-- 
Alexander Sverdlin
Siemens AG
www.siemens.com
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
