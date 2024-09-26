Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5301CCFA13
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 08:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i65oy5Tlg9JE+QMS/97B69WjqPmn+2abJEV5+I8E7jA=; b=u3kwGNQGF/d9GZ
	1TPJJYi3CxRv07jFtKgWDxRC6GvCfyAyiaShvnpj80QxuY/ik5xnAdB4Boxwns0KpRbbSw3ALXQxm
	HDWSXIXO9OFlkZlJcoQPClFzHk28aIxWR0DS40v3D38INiXI94QjmkFu1Lgl+WjQDWB+vvPqXYpJv
	Qruhwh8s9XuAxjId5F/nRltWoiLtQB9vCg8eOtrQY2IfKyb3qJIIP6SjGsCN5Lirq8NDVDpNbXU0A
	11RY2K/R4tjCH+SmAYcvhHR91+c1Min5QEvpU/eyn5y9qxOEp1exSB7KPhmEYPLOznrOArC/UpC7K
	Azpr3CVu49koiByzvBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stjpA-00000007g53-1Myy;
	Thu, 26 Sep 2024 08:26:08 +0000
Received: from mail-am6eur05on20614.outbound.protection.outlook.com ([2a01:111:f403:2612::614] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stjo2-00000007ftD-0P2p
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 08:25:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvMBqy/REHbAJdVpO6eVd5jsnq3Lw8+8XphcnF8/pazU1xkzfUEDztSvBKghAKL5Bh3tBBXDw6S0mnyLm4VwqRSQt6M24SkoOzismvqS6zcU78zncQCPrl+G+qFKQbWaGRtwsQxC6vhSrhG2KDJ0MLOjx4DajnQ3OYKatKKnWWbVBGHnIpk9tIl41zqhksN6xq4+crcSWdvTsWB7edHK3YkwM/uL9/nlkWQN9xYwY+l1JHP2v58WgD35l2I4L/Yu/e4DGjgn7Gg5t3WSxdIWYDB7c4XFPcST5Wlc/ZXXfjuzSSNtjBW+S2A2vQ3MAOIWnNGHb1tYkVmSOp9zL2WVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzxXxLgc0+tQ0/h78nG7/bLhXramtkmAWsO3fFPHrIk=;
 b=FRRUqcWmjGgZvnpT76ettJXzVv0fiwt/FLbA4n7+JiSRP/Kg0Sc+8GKMtBMNKUC/lvM9A0lp6FVaisCI0oSQn2UU4KxaVDApXaNGdutoFZIhOJUBNYxWiBGNydqKbXebuAl5VGDzOQejhQxQci9aBPWMJ1YRSIvHK2FlewwPUEtk16KGk3ZEsn9ZA6CP42tezq2Z6xEEj6faWNCR0BJyDulK/fwdC8AbJ1ikVNyNdZ6XwivJQpWVe6qUwhWsMkRZkB1OQCf2wpQYLsUKiWg9DL39M+iiAc9QQoFfN31Y09fV2juZumfF1/seAvRZEM7XgR/BAvCxenxyP00hRsCzBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzxXxLgc0+tQ0/h78nG7/bLhXramtkmAWsO3fFPHrIk=;
 b=fyvz1a/POHTcpFJohR3xWb9nJk5yugfyCRfmLEYiQDDGjKcy9ERGzmV2Dq6b6/uU9Z4l/NgnpY1eS7uYmqMj8+hCuEIXCto7llyRT3+l6DgZ/IX2BD3QTtce7Cn1C/+12mK3Dg7q6U0BTn+e6r3O6srp7yeP+2n3V4MibnVZALAIvXuocTAckK8m0ldPmho9On6thUtv6kIn7OcFZ+oyIu5i5KUaT4890BUktlnQkL7Z9NLIRTGaBZFXzqOoi2+1eKCINcL/nu8YHTnAZPlxO01XDEC5/LtAV+GO7wXAA2aijN5B0WW0gowSz+3PgB5dOxxIw14iyCe52dUHy/MEww==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by GVXPR10MB8928.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.30; Thu, 26 Sep
 2024 08:24:45 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%3]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 08:24:45 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "mwalle@kernel.org" <mwalle@kernel.org>
CC: "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>, "vigneshr@ti.com"
	<vigneshr@ti.com>, "pratyush@kernel.org" <pratyush@kernel.org>,
	"hui.wang@canonical.com" <hui.wang@canonical.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"richard@nod.at" <richard@nod.at>
Subject: Re: [PATCH] mtd: spi-nor: infineon: add Cypress (Ramtron) CY15B102QN
 F-RAM support
Thread-Topic: [PATCH] mtd: spi-nor: infineon: add Cypress (Ramtron) CY15B102QN
 F-RAM support
Thread-Index: AQHbDdkd6GH0fAscAkSkmEnaZH6UwrJmmoEAgABFLACAAgQ4gIAA230A
Date: Thu, 26 Sep 2024 08:24:45 +0000
Message-ID: <4f3a9baddf8b7d272c373a0e12741e04e5236b04.camel@siemens.com>
References: <20240923165324.845639-1-alexander.sverdlin@siemens.com>
	 <D4EDC01ZOSDV.AOFOP6LNWWJ6@kernel.org>
	 <36adf15058a6c0ccf5d3842460d3505b282f340e.camel@siemens.com>
	 <28ab8b72afee1af59b628f7389f0d7f5@kernel.org>
In-Reply-To: <28ab8b72afee1af59b628f7389f0d7f5@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|GVXPR10MB8928:EE_
x-ms-office365-filtering-correlation-id: 02a03e05-c0e6-460f-6ba5-08dcde04ada9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OFlRcGhoQk5URWxoczdyMGZCSWpuUXJRUU4rT0Q5WTZsa0svSHFHbXV4RFFE?=
 =?utf-8?B?WlR2d2hpVEJRam1uczZqZUVYMzNhYkM1S1p5SUloVUpuc01Rd2lMS3lFTWhm?=
 =?utf-8?B?VHZYMnZJcFYrbnZoNGkwL3JETmdxZUZ4MjR3U1M2cGt0bFFEWVdqREI0MkJo?=
 =?utf-8?B?SERlczVXU0oybDJoQmtnSTRBekZSZ1FzY1dCZjZJY2FJaEpDVDRIRGtWaEg1?=
 =?utf-8?B?bFl3YUcyMm5PNDNvbGk0czEzZWJ4eWlhZXFwZFRtM0tXc2M0TEk1UEpCUUM5?=
 =?utf-8?B?NDlpaGZvUS9id1kyaG1YZ2prNUVTY3NiMmt1NVVUdEtpOWQzRnMxM2NEWmc4?=
 =?utf-8?B?d3hKQjNRNnUzcFVFWWxvNXA1UDY3czFRZUhRZFZZTFFnUEt0SXhab0diNlNB?=
 =?utf-8?B?YzlyRnRCU1pmckMyQThXcWdsTW5GZFc4YitISzdhZU54UWpHOGpGZWlWVFRm?=
 =?utf-8?B?cjJDaWVvaGg1R1VHWGl5SkRUdEZ2bmFDVVB6UEl0Mk1PODNKekd0VllDWnRO?=
 =?utf-8?B?bEFnMHV1MmFjN1dvLzgwUzBkMkFEaG9nT2ltclBQb3hqT0xMK0JNdzdUSnpq?=
 =?utf-8?B?SXhRT3oxb3J6K3hBbUt2S0JkTlFPOHlzazFxMlhUMWFxOUpnUXA0OEZrREE5?=
 =?utf-8?B?QTNYdHFlSmRCendpUDBZZ1RiR2pvSXZFcjRRSVR2dzlhK3l5Tytwd1ByRTRu?=
 =?utf-8?B?VmVKRWZVNGZnTnowdnJ1VTJGOW90VzR6SlNUTXA1RzdaNnVJbVQ4dXlNTkFh?=
 =?utf-8?B?dUN0cGU5ZThWY0NZcE9Lc0ljbUY3RkE3bFhjd1dHclUxWDZKcjJGZEl3ZUR6?=
 =?utf-8?B?cVFzWHg1NkovM3paQlNXZUh4bW9MRFBaMnFLMkkwWVNCekxLT1V5NHJhdFMv?=
 =?utf-8?B?SFZXYzRHTzA2K2YxZmZvNUNrVEkreWlxTkZxRG1uZkZQSjFWZmx4VVZWK0hP?=
 =?utf-8?B?L1ZkbHZEcUpoTzhRQWhOTGtqQ1hUaUloajJ5T3FKZUZXSjM2Mm43RERrZXha?=
 =?utf-8?B?NTJxN2F2R2diTFJkVW9yRUZQazZRMmhESHppS04wcHBVa0I3MHB0N294Mk8x?=
 =?utf-8?B?c1FUdjhLUTJPQzRNTUduRndWY3Nma21oRlh1ZDM1dXduOFhDVXV3bHBGbjZP?=
 =?utf-8?B?QmxuMEhpUjhxcVVUamlyS1h1SHhVVkNUU1Y5ck54N3JrTHZGZW1kL1lVemda?=
 =?utf-8?B?eDdXbVJmTWVCOFJSMzZrdnB0SU5GYUxlOGI1T3FXWnhFZ0o0NWw0UG84VVl6?=
 =?utf-8?B?cmtUUkhabU00MmlKL3N2NUFseHNtYjJMK1NzTEpxMHRhakVjSGVGY3p2TGo3?=
 =?utf-8?B?SmNZUXE1S0VjK01qSEw4T2Z2L2RPa0VCMm5lYTA2dWJzU3R0ODNKd2VvZG51?=
 =?utf-8?B?cnhGb3NWNlNJZUV5MzljY1pzSHMzdWVzRVc5ZFZGZjd5U0pHWWhqbElCQlVz?=
 =?utf-8?B?WGQxRjF3SENrV2xnaktvMUlrR21VOEpKNzhaTHVUUjluMGFVbERDc1R5ZUo0?=
 =?utf-8?B?Q1NvWkxRdks0M0tINFk1eU4yNkFqbmxWT1FxeUhQVnQ5aURoN21NbHJTSXdG?=
 =?utf-8?B?SDRFbXp0OHY2bGVpYy96TVJsTW9RVFBnSjZUd3NGc1lpaVVJNnRmcUVzUHlo?=
 =?utf-8?B?MDd6R0p2N3ptY1IzZU1BR2ZXcG0vWXVONzZDR0VoditEQmk4Kzg4WXpEbzRh?=
 =?utf-8?B?ZjRITGZUZURBeitieUFxdkNxclFjb05FY3JTeHFXWHhUWWpNUFRvS1hnUVQ4?=
 =?utf-8?B?eWVuNWJiRTNlaWljYUFwU1Q0eE1lYURiUkJpUHpaUkFGd29naFZnNFJrKzBF?=
 =?utf-8?Q?JFdq+SJdqWwI2VuSUMVSP7EZo0qRd2TxCUu4E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1hzb3NlVzIxNEJobVdDdlA5Z1daM0k3L0NwNHNVeW9uOUdlMGJsam04YWNl?=
 =?utf-8?B?UHNtWGxvemcwM0EzbDBOZHNOL2x5OFRnV2EzSzUwc3U0YllCbmNoalZLaUgv?=
 =?utf-8?B?S0ZPNTdXOG4zVnZoZFE3VFdvaVdpKy9tRUtPSFVpYWtpVkQrZSt5WUJZN3Uy?=
 =?utf-8?B?VTVLS1lyblF6WXdEVXdoQWV5dWFOQWhlRmlPb2FSNEs3Z3V3bGJYbEhnbWVV?=
 =?utf-8?B?a0dObmNxTFlwYW5xVGR6V0xZYTVJT1Bzclo4ZEFYTVdLM3lnVFg2YStoMXhM?=
 =?utf-8?B?cWJ1czFQSStTZlU5bWttaUFjMGlqOGtqY1U1azZra3pXYlQyeDM0a3NVbFFt?=
 =?utf-8?B?TFc0SW03ZTVVOXVBNWpkOHU5cnNoRGtzb1R0STFwVEV3UFQrR1NGd3dTUG1o?=
 =?utf-8?B?QjRmbXo4R2xLK0o3L2Y2VDdzdEY5ZHZVYjMwa2dHZGZXdjJueVViSUNwZEpJ?=
 =?utf-8?B?bWNQcXluOWNEOFQ3UU5uY3pqMlNvbnNzcDhuQWkrZ2Q1bkNtdDY2NnB6V1BR?=
 =?utf-8?B?UEhjQ013Y0JJdTFvR3FZbnVwTEhBTnpBUE1paWFydnRmaVNkbHpTR1ZnM2x2?=
 =?utf-8?B?RFdENi9RR1JZblhjV2xIRis4d3pLNDBJWkRNYWJXNmRoZjYxTHdaNGxvUHRW?=
 =?utf-8?B?MDU1MGErUm9UMkZyOE5EdDkvV2tsZDVSK1UxSDBuczNReThRbFpDdWs1VGMv?=
 =?utf-8?B?dXdnSWZaMlM4dHA3cWIwYzZ1UThydXZ2RVBYUGFsbUc4NEp3Q3NidFhBWjhM?=
 =?utf-8?B?SHN0cWgrRlRvc0dGa0wxYjlQZnZlaitSeGVRVzZNcjMvRS9FY2dKVStBVmM1?=
 =?utf-8?B?aGhoM2hmUVMzZ2hlaUhyTzB0bHFVOE12WE1oRHp0QmhWRFQvRGtFTjRuVkhW?=
 =?utf-8?B?OTdpQVlIem8rSXlKVW9tQmpLdUZxcVRnc01DMURnL3ZUb3J5S1Q4aGQxSU4y?=
 =?utf-8?B?YlhMbmowUFcyeDFRbU5tb1kvZUVMNE1TQjYwNUVJcVBoeEZSNksvWWZJbHpi?=
 =?utf-8?B?Zmo4STlSZzJrMGtiNkpoQVlFUWN6aEZDZUgyeWI3YlJ5T3M5OXZKSVBWd3FP?=
 =?utf-8?B?VENEaDBoUG1ZOFByeFNDYmdXT052Z3JXRU1rS1JwWXYxY1VRV3dCOWZjZFYx?=
 =?utf-8?B?cnNxekxGSWxuVzJmR1BUUVEvMTI1azd1M1hDdmpXM0tTVjd4TmpLUTRYMGpr?=
 =?utf-8?B?MThsU3F6S2JGaXhiYlpLbGU1bnhaUVFtaFcvY0I5UThDeXM0SVhlU3YvOHBx?=
 =?utf-8?B?QXBQM2Q3VHZSM0puaFBOdVVXYThGOXIrYjdMRFp4aXdZTm9DY1JyekF5Rlo0?=
 =?utf-8?B?QnJFUkpiNzRYVnVTRW9oZC96MVNMUTd6ekF6SGRjUXRMVkxEZHdBdXZsL2pC?=
 =?utf-8?B?b1hlM1VsNmRDbWRGTEJpUy8wam1SSlZocXVyVzFoOGErMkxNNzFPY3ZBR1hB?=
 =?utf-8?B?QVQwV09IYmlybUtqVWRDNVRIOHd1UVJ1TVdnMkx4N1J5OTlUOUhkRWVSNW4w?=
 =?utf-8?B?T1crWXkvWkc2QWFLU2FKanBuSEliR21wWHA0ZEpNRlhpelQ3S2pnalNndmVN?=
 =?utf-8?B?eFQzWmcyUUZPbmZZRlpRUHZsMmxaMkVUVmpBd2UrMWhDUFVnd3ZySkxUdld0?=
 =?utf-8?B?SHQ3dGlFd1RDVWxMbldpYm5nY0lWc0JSVFUvdk4zM24xQnhIZlp2TCtIekNk?=
 =?utf-8?B?OXdiZDJsalViTnltVG5JSGxsalF2a3pNc3ZZbmZvWWRDRWo0bmtxOTNxSXFW?=
 =?utf-8?B?ckF3cm5lczZDZmVFQkhFSzBiWDVBc2JOK2JhNnBGTWt5UXBQV2FRdmJtcGo1?=
 =?utf-8?B?aVVrbjU0WmtrTXE1OTFIazhGLzA5TGx6Z1RwL21rWlNVSXdIYmIyOHZ2MUdu?=
 =?utf-8?B?YnkrazQ4UjVISHFFWXJaNXI0aTNIT001enBrdVZFb0RuMUtIRitqbGxkZ0VB?=
 =?utf-8?B?NnFPN29qSEdULzlzZFdsYjQ3SFpFNUxzd0gyMUxwb3FTZndCWkU0aWpXYXkw?=
 =?utf-8?B?ZTNtSkV4eHRwd25UMEUwY2xyVUFyeHB2ZXUvM2JRblpzNkFBcEVIenVJNmhC?=
 =?utf-8?B?dldQZ0UyUVp4M2RpcHdidm5uSjFtTkJVNi9DZ2N6RlkyTjcvR1hadnFRZ1BK?=
 =?utf-8?B?VnFpSW4ybml2ZkpFaEdEOVFmQVFJUzVpSi8wZWwzTjRyN25VdE9qbEdlTTFM?=
 =?utf-8?Q?tAPXC9X0i7RnkX1ys5KE8Jg=3D?=
Content-ID: <9926B61574A20042AB9F89474B057CE3@EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a03e05-c0e6-460f-6ba5-08dcde04ada9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 08:24:45.4229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NNUNBQpr8Q56lOp1X1DWuxUP5UkUPslocHcOlQXnUdmiit63XySyEwD3H4uFSgb1U7tmNqhFlIismZCv1iBOTxYxqQZEVxIyz/lZUY+Fono=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8928
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_012458_559841_4882362B 
X-CRM114-Status: GOOD (  16.23  )
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

On Wed, 2024-09-25 at 21:19 +0200, Michael Walle wrote:
> > > > Similar sad story as with "cy15x104q" where JEDEC ID comes last-byte-first.
> > > 
> > > Please have a look at
> > > https://lore.kernel.org/linux-mtd/20240729102016.8527-2-alessandro.zini@siemens.com/
> > > 
> > > TLDR, please have a look at at25.c.
> > 
> > It unfortunately doesn't work with SPI host drivers which only 
> > implement spi-mem API.
> > Or did I miss something? Otherwise "cy15x104q" could also be handled by 
> > at25.c.
> 
> The solution here is to add spi-mem support to the at25 driver :) Maybe 
> you
> can work together wit Hui Wang [1].
> 
> -michael
> 
> [1] 
> https://lore.kernel.org/linux-mtd/20240408124328.777375-1-hui.wang@canonical.com/

thanks for the reference!

FWIW, F-RAMs can work without SPI_NOR_NO_ERASE flag, so neither is it blocking point
to remove it, nor will it be broken by such removal. Even though they do not support
the command, they seem to simply ignore unknown commands and do not alter BUSY/READY
status bit.

But I've got your point and can look into it with lower prio...

-- 
Alexander Sverdlin
Siemens AG
www.siemens.com
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
