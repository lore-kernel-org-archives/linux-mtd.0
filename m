Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8772BCA0EFA
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Aug 2025 15:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVK84R7Ws6WIRsiIA/bq928cfWDZdQgBM3nS+yZG6CM=; b=NMahx0Uv4e4Epl
	uZ6Dh/bpEjKhbme0m+4f8UpeN7p6uVivVvwdO22fnJ2amJWNxmyDP6RNJHvPYKESPd08CLJtd33f5
	h8vFcP1VSrM8crUd+kzF9xlmLSGN+y4cHAQpzUE2fe0BE56P5bpveZXL3bv74S1pKKvJ2HIbXV+I3
	GHt/IB/LyEjBjPEXwYYIkmeVg+/IU1o5HJdO+nNocHXRPhOdf0gOcXPfzEtwi+MbcqbdihF2YWLu+
	miRzB07dZL/GaDKBhS27ioE8kkCESSZDL2DkXMOJatBeGQH2RnynNEnPJjXc32RBcMs/7ZKdJPLeC
	/++CNl9T7l4CnyrY0Yxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYgs-00000008Nsb-2A8a;
	Mon, 25 Aug 2025 15:00:58 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXRg-0000000875a-32cs;
	Mon, 25 Aug 2025 13:41:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9cMpyEJHz3tNs/AWqjX9RTBRzKojot+jcvSyr88c0PbbflbykRay2lTuyEldYzAIyy/+GNGKNqafl+gDUUFAdP56JTmHKm8odCi+dJyKXvh62BXb4vftTCS22Ul6R6CjLlvN/V28CQvg1UzDljtOgCz4yP90lRHFgaFL+RlN0DTYVu5NgbdsPWNayyxjDvCkYzLinZd3/Fj4a3BZFs+0cArrJ3CF4kLelxbpEQFxkPtpYJUpwxB4/p4svUMYTfnf+dS2QhLtTQMlMxMoJC9rcs8B/shA9vYmaGujTk++mENxKXgPaH+ZokRT/QtFLtvvq7c+KHPTidIqikbOzQkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSv61KvwrCMTB8swzDVgmdKxJKJQoi+7oXWrBba+VSo=;
 b=CkkeiWL0+Uts2t1lrWVY5lVDQeRZdEEcSlD7NFmaCo0Btb74fnaGJ5Nt/DrTeQF2E8+PMLkB9EtqNEDGif0PEEyFVRIO+ymAafthRsGXk1MJia1XXQxRiaTBRTBc/pqSWlj+j9BX8+O0XTrkpm58KgzbJZDMyc4nnY25S0iCJT22TArtSr4HLlwVEQtntW1zX9fO38trQ8ak174ywUT4Ihz+YE3lKUB9uWOa3yqtuETMuSXEBdGYjB3QVHfaVaDyiyPWiuYkg++9UrLP7QexDQU6IBgYZRLXIAOhGUCUvnAL1avFf1NaOogsnCtK3fscfy1NUtJkvhCnSxgVqMu8lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSv61KvwrCMTB8swzDVgmdKxJKJQoi+7oXWrBba+VSo=;
 b=BKAVyIaK00M6343qztLo6kIBE9CgYFm0jS8e6Cpjdfh3tQtRToM8YzU25/1pD3Nkx8EXaebYkoIyMPhqHwWf+26RCfY1XAAn5J+aS3s0jL0lwj3ge2u4A45WxJWuppI0QOu9ltwKuHUpXxdyXEFU07pQF2JKjYeDLX8/pNNwlPic+MzOL/r+DUpgz71cflyfzm5pJ6xyAzso5Z0W0CxD80+xgV8ug331lW+hVbtXggC2PfqHuethvS3uhh8TJ1UajwOLJa6Sj3luBKxYKHfvtgH0Vm69uTohtAsN+i3xvWRFnmt0HvPQME+pj1XjeKzGCMfulqgfkvKUZcJnztOjeA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB8PR10MB3244.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:117::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 13:41:05 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%5]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 13:41:05 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "Balamanikandan.Gunasundar@microchip.com"
	<Balamanikandan.Gunasundar@microchip.com>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "claudiu.beznea@tuxon.dev"
	<claudiu.beznea@tuxon.dev>, "nicolas.ferre@microchip.com"
	<nicolas.ferre@microchip.com>, "richard@nod.at" <richard@nod.at>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"bbrezillon@kernel.org" <bbrezillon@kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: nand: raw: atmel: Respect tAR, tCLR in read setup
 timing
Thread-Topic: [PATCH v2] mtd: nand: raw: atmel: Respect tAR, tCLR in read
 setup timing
Thread-Index: AQHcEpNMap6XZeIVvkickt5PeawpyLRzOl4AgAAWBYCAABESgIAABS8A
Date: Mon, 25 Aug 2025 13:41:05 +0000
Message-ID: <513ad54017eb96a55176d232ce1464ff51bf452f.camel@siemens.com>
References: <20250821120106.346869-1-alexander.sverdlin@siemens.com>
	 <20250825-uneven-barman-7f932d0ca964@thorsis.com>
	 <3d0259caac9925e3d5dd3dd27a6785b2a2e82c0b.camel@siemens.com>
	 <20250825-vista-cuddle-c159a6bd97ec@thorsis.com>
In-Reply-To: <20250825-vista-cuddle-c159a6bd97ec@thorsis.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB8PR10MB3244:EE_
x-ms-office365-filtering-correlation-id: adff4d73-dfc0-4432-dc53-08dde3dd0a50
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?L0ZYa0pSUXZTUTdYbUVZaGVtVm0wUkpFRDVlT0VjVTNmK2UraUVHTjEzTDJI?=
 =?utf-8?B?Y1VPSWFnTk1vR3Z6dGdkWEhZMHVyYzVEUzBQa01lTUdiL0NIY2RvVVg5M0F4?=
 =?utf-8?B?aWdHZlExYVpNVW9YOVBQQ0pCcEdHT0dkeU1Gem9ma3FLY2pLWHErOWdzVUVG?=
 =?utf-8?B?NzZvTzVUVjlveERNcGVWZjdTL0dhMVpPdjRSS3VheE9MUDFMMldNM1I0TC9s?=
 =?utf-8?B?OTRVOGlsN1YzQ2NpZENBUW8zS2hiMVlyM0xUWXN6bGtuczcvWlpGdVgwQk5u?=
 =?utf-8?B?ZFdXNUJITVpVTjVTRVd2OXh3cDU0bFhWdzkrZFp1cEZrVXUrQnlWU1dVS21o?=
 =?utf-8?B?RTFvVVd0cFQ5MEFwK3hTMGgzaWN6OTRGc2doQ2YrT3hwMVVvZFBIbGo3WXFp?=
 =?utf-8?B?cERMQU8yaE03eFovY085ckwvdFpqcXF4MGxZL1lRcStZYnJJRytLQzNHcC9p?=
 =?utf-8?B?dG9IZTNPVVArSTlUTGkzSEpnanM5Mm9kVzMzRXFjZW5DNnlDdTNnbFQ1TllL?=
 =?utf-8?B?RFBiTW5jYW9tSmhZWjYrZ0JQcytVd0NWcFh1d0x6WkV3c2poUHlJdzdWV1ps?=
 =?utf-8?B?eTRNU3dHY3h4b3hRQWdrY1owT0sxM2J4L1UzbWNyTUhhNGd5YnI0YzlrL0xJ?=
 =?utf-8?B?K2h3aDJOdkI2YldLbEhReElYYTM3STA2SzFIMGxlOUNOVDNwL2NLNXprckdm?=
 =?utf-8?B?OGN1Nno3MXlhTEZIR1h3TnpFMDdVaEkyTDAwMGtSdkxlMWYyaiszUVpObHdX?=
 =?utf-8?B?ZkJaRGVpQzh4WWR1M201ZHI2NFMyb0V1OWFWZ2NSSjY3UUdCMjlrTEw2V0c1?=
 =?utf-8?B?S3NSeXg3V2JONENDZUh1VHVSb2FlMW5ua1EvT09YQi9qaFQyR2IrSnZNTk9M?=
 =?utf-8?B?NGJXNGhzazNkRCs1SFBWeGNCUTI5eUIvNG9ONGI3U1UyNHYwZFV3U3hjVjBh?=
 =?utf-8?B?U1B2WXFMelhoU095akp6QlltSmVXM2N3ZXM4dXJvQVpvelpIcUVEMm82MDNo?=
 =?utf-8?B?cFhtZEIzeFQ4cGFqbVpCd2o0T0NYUWNTS3M5R3FZUkdWSXRham5GdXRjVW5u?=
 =?utf-8?B?WUZ0MHRiTHl1MXdsdlBXRE5CL3RpQWc5R0IrSExFTjluRlVUU2NlL3Frdm42?=
 =?utf-8?B?TVhjczc5aEszQmxLYlRlMUV2enlqVlV5cVo1NW9nbmNCa1pndzExdFRLSXZr?=
 =?utf-8?B?QmhmR1JraUlXVWExaTl2WWJQbDJiVHNkUEJPdjNDMjJnOFFaV3dOQVlHY2h1?=
 =?utf-8?B?VWJVTGxTTHRsQzRrRzN6TGQzQ0JpbWVMMlkzdXc3ZjZxcHMyZnR4Z2xZbXNC?=
 =?utf-8?B?amJ0NENKRHViSUFEK1NsVzBnYWg2SENMZXV6bE41ZmNKVVV2QlhLYUNublRV?=
 =?utf-8?B?cGczSVkvVWJFMnFwbitDSFJyZ3U1MUFibFRMWmFXRG5obzFNbm1TRW9iYmtC?=
 =?utf-8?B?dUl6ampPZ2ovVTFweFB4N0RuZXdkTTJlUUhmWWp6c2YyR0F4SE1ic3BPaUs0?=
 =?utf-8?B?L3lzcDQzdjB5bk5KMDNCSkJQVG9KWkNuRUdRY21vYnQra0gxdm5EM1dpOE9X?=
 =?utf-8?B?THZvRS91eXZYeHNTL2cyMjI5eG16bFVNYm8wU1liVU1nWXlCRjNHckJsYWN0?=
 =?utf-8?B?UEtHQlV4UXRBaDhlSnBNMWR1eEJqVThldXN3WTRxQkJGUDJpVDBGVzJSTnF0?=
 =?utf-8?B?UHI4OXc0MGo2ck52VldNYjJZN2FQeU5OYVpPVXJ1U24vQ05NVjdrSFJVczhz?=
 =?utf-8?B?cmVXc2RlQlZKY2hrZXBlL2dmU2FleW5BTHg3dGhzT3RmcHR4OEg4R3RFcDBQ?=
 =?utf-8?B?eVh3OGF6WVJQZnBscUVFN3RjczV6elV5N0pnRDQ1dlFFQzRVRDVkYUhBRGJ6?=
 =?utf-8?B?S1J3MmhtQS9xNmpHeWhyTXNCWFllclNGNDhIWHVmUjBvU0dWQ0MzdFdnTzRQ?=
 =?utf-8?Q?dcHTYnmHIsM3hG48gC+IXpQ7YfrTuzYw?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nk93QUxDWVpkSTN5Z05QZWhYSlA3RWtWSFhHSjJqT2Z5MTZaUGJ2aThhYVpU?=
 =?utf-8?B?ZSt6ZU1Rd0hWQ0JjRWNmOUkwNzl4M3hPZzM4d1l4VWN2WGpnUDBUenFGQ3lT?=
 =?utf-8?B?djcyVzE0c3BrdzJJVG1uZU9ZeE84Vm00U2xwaHJMSU5MU1JZNmZjaVNNaFRK?=
 =?utf-8?B?aHkramN4SmlSN3F3VUNnODAwNXVnZWRydExGYmllT3JrQWFmTkZzRkRkVDFm?=
 =?utf-8?B?VFQ4V2VPT3JIbnNaVDNNVDA1VVhmNTY4Ykd2UStadmhwWFpKdXJjZkxCa1pM?=
 =?utf-8?B?dzRDNVRjeitXQ1ZLWW1BT0ptYXJiNG1yS0huTmxtYXdCTUVEQnhHaHdFRHBs?=
 =?utf-8?B?WGhRWGtBQjR0YTZjT3hMTUJPbmNNTnFtYnNiT2RidFg0UVc4Wk1CU2twWGh4?=
 =?utf-8?B?b1ArVHBySW50RUJJNyswdkN5M3l0Tk5VbGE3Q3ZYR1RxTzBBZXd0NDdVN1Bq?=
 =?utf-8?B?eEcwYU9Wa2VyN1Q3WnR5cEpqNFhxZUF2dStLdE5Uc0E3STdtVlJ1Q1dMUnBY?=
 =?utf-8?B?ckphcW54TkxHcFlzb29wMGpJSUpJeWRKZFE1dURxUHV3d1FVbmVBVEVtTjRO?=
 =?utf-8?B?RnNmT09JOW9nU25GWEt6WmJhZjVJMzluVFlsZ0VQUjVsbVF2WCs0T0pPZHJ4?=
 =?utf-8?B?b05KeGxoQU4xS3NtY212Z3FNRHJiUi9iZE5JYXhiZ2d2OUJlbzVSam14OXpL?=
 =?utf-8?B?SEE3VENWZ0RlTXA2d3BXdmNYQjRsQkhSZkxwS0s2Q3hEc2JoRXFvWnZaMUdY?=
 =?utf-8?B?WEpVT1dGYjNWL0hBUnBIOGhqZFR3NHZpM0FaZGQ5M3Uxa0Z6UjZUemNURk51?=
 =?utf-8?B?bmtGQVRwNFU3bjg5cUsxZUx3eHVVQnNlMTRmOHNSMnhNZFoyWXNCMkNrVTlX?=
 =?utf-8?B?MjYyeHovVDcyMmI2QXhvQkxtb0RnenQ4bTRtZWEwYTJpTHRNZmFnZnhJRVlu?=
 =?utf-8?B?dUFiM254MjA2ZmVLRm1GenpBUHVQcE1YSXlMYWk1S1RBRm1qQVNHcWhkTnoy?=
 =?utf-8?B?MFMxalB2Z3h5QXhKOXdhdGhVV1hhcm1vbnp4UWNINVpwYkFtQWpOcVAxY2RU?=
 =?utf-8?B?U2V0aDZFOFlsL1FVUjRzdHJHYkRyMFlrQk9Pam9QQWJGd05TbmwxWHJxRllD?=
 =?utf-8?B?d0grWjlTRkxXMk8rWDRzMEZVUDRZbUltQjR2Rjg2YnVHS0R2WjdDb3BuZm80?=
 =?utf-8?B?R29GM1dTTGZrbkVob3JWeHhza2NEUHhzL1JDeE96eGxCb0dpb1pWaVpXd0lv?=
 =?utf-8?B?MTVOSmttUmdhV2ZlZndTT0liekJMNnJ3QXpNTW9OM3JxbGlacnpVbFZDM2k4?=
 =?utf-8?B?TzNXV1NReFVDbDg5dW41UDJHK3BHcGNuL2pRSngrZFZxV1QzZ1RhV0pYTG1L?=
 =?utf-8?B?R3A1SWIwaDhwQkUvdmt1NTN5U3Y2eDJiOWRrVzVMaFVhU0l1RWFPcDFvZHpC?=
 =?utf-8?B?VTZxYnlURkNoVHMydnE5dks0ZXhHSkdTRHhwQ0djSGJuTkNwa1QyVHdrODQ2?=
 =?utf-8?B?QTZKQ1dWeW03d1hWcVRrQ2IwRmpZZ0NsMjFuQmV4MXRUVDhJMGRhajRrUUFH?=
 =?utf-8?B?SC9rL0hLbUZxbEp2dUtyaDhhaDBhdHN2QmNseG9jRHdlUE5EdkhqK2NaR3I2?=
 =?utf-8?B?VmJHcDJKK2NKNHV0c3hWeFFQT0tsTjltd3d0b3M1dDFKeUFNdzhiemVRYlJl?=
 =?utf-8?B?d3JtVm9qUmIzUk9ycUQvTFRmckZhOElDSnpab0JTeGN4TjQ5WWRkdEdKdEtK?=
 =?utf-8?B?QUNYNHVBRHhWd2xZSGg4SFJ3Z2NpV1Q0c05EbXYzZ1FhbHhUeVRqSkZuc3o1?=
 =?utf-8?B?bmNyRGxIZHcxVnZYODhiVys1d05WckJId1Fqc3kwTGZhUERTbVRKaEk5SGgv?=
 =?utf-8?B?VVR6eG9OR1psUzNZMEIyUVh0OFUvbEZUTE03a0ZnUFRXdVFjY0VlbXJ3aUhQ?=
 =?utf-8?B?N2F0bjZPVUxQSlkzaW5HQ0gxTWMxY1RvdHB4MS94YXRQQlZDdW1EV2FJd0gr?=
 =?utf-8?B?dzlPUkJ2Z1gzY2s2OEtuQlEveXpEYXViWHVmWXpJYk16OE8wNkZiNDBOelRu?=
 =?utf-8?B?c3BtNkNMMERld2EwZjJkK2MxcFBZVmpaVUNsZXpzZkFuem9EOXFENTE1QnF2?=
 =?utf-8?B?VHNPQWszREpkYlJBU085blVZRU5mT0xVZWRpbEM5Q1BOVGN0cWs1dyt3cXk5?=
 =?utf-8?Q?yj4EsKi2IcuVLYfLtX8ATQA=3D?=
Content-ID: <3CE08FAC96637B42AC45B7741ECA6D25@EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: adff4d73-dfc0-4432-dc53-08dde3dd0a50
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 13:41:05.6717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BjHNkzQbVIBQkwXBEPI0mFQiKWsWkoV5QIXljan6iduRfyS5cs7tRc+7o8vDbYADABR1i0xuw9H6xorPw/oXv4iLNMuGwZCtur2lfsHPreE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3244
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_064112_946075_75366606 
X-CRM114-Status: GOOD (  17.41  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQWxleGFuZGVyLA0KDQpPbiBNb24sIDIwMjUtMDgtMjUgYXQgMTU6MjIgKzAyMDAsIEFsZXhh
bmRlciBEYWhsIHdyb3RlOg0KPiA+ID4gVGhyZXcgdGhpcyBvbiB0b3Agb2YgNi4xMi4zOS1ydDEx
IGFuZCB0ZXN0ZWQgb24gdHdvIGN1c3RvbSBwbGF0Zm9ybXMNCj4gPiA+IGJvdGggd2l0aCBhIFNw
YW5zaW9uIFMzNE1MMDJHMSBTTEMgMkdCaXQgZmxhc2ggY2hpcCwgYnV0IHdpdGgNCj4gPiA+IGRp
ZmZlcmVudCBTb0NzIChzYW1hNWQyLCBzYW05eDYwKS7CoCBXZSBoYWQgZGlmZmljdWx0aWVzIHdp
dGggdGhlDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5e
Xl5eXl5eXl5eXl5eDQpbKl0NCg0KPiA+ID4gdGltaW5nIG9mIHRob3NlIE5BTkQgZmxhc2ggY2hp
cHMgaW4gdGhlIHBhc3QgYW5kIEkgd2FudGVkIHRvIG1ha2Ugc3VyZQ0KPiA+ID4gdGhpcyBwYXRj
aCBkb2VzIG5vdCBicmVhayBvdXIgc2V0dXAuwqAgU2VlbXMgZmluZSBpbiBhIHF1aWNrIHRlc3Qs
DQo+ID4gPiByZWFkaW5nIGFuZCB3cml0aW5nIGFuZCByZWFkaW5nIGJhY2sgaXMgc3VjY2Vzc2Z1
bC4NCj4gPiANCj4gPiB0aGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2shDQo+ID4gDQo+ID4gRG8g
eW91IHNlZSBhbiBvcHBvcnR1bml0eSB0byBkcm9wIHRoZSBkb3duc3RyZWFtIHRpbWluZyBxdWly
a3Mgd2l0aCBteSBwYXRjaD8NCj4gDQo+IFdoaWNoIGRvd25zdHJlYW0gZG8geW91IHJlZmVyIHRv
Pw0KDQpUaGF0J3MgaG93IEkgdW5kZXJzdG9vZCB0aGUgcGhyYXNlIGFib3ZlLCB0aGF0IHNvbWUg
YWRqdXN0bWVudHMgYXJlIHN0aWxsIHJlcXVpcmVkDQpvbiB5b3VyIHNpZGUgYWRkaXRpb25hbGx5
IHRvIHN0YW5kYXJkIHRpbWluZ3MuIFNvcnJ5IGZvciB0aGUgY29uZnVzaW9uLCBpZiBpdCB0dXJu
cw0Kb3V0IHRvIGJlIGEgbWlzdW5kZXJzdGFuZGluZyBvbiBteSBzaWRlIQ0KDQotLSANCkFsZXhh
bmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
