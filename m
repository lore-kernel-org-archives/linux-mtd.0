Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A31AE6BF13
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 14:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j7E2G1Bvg+8cI0WG+8blBtDl6pzRuzlzIDUEhFcQP8U=; b=mwKV2+08zRnjBFftCy4C9SwxHe
	SyGTwg2xKQfJEsBWJ13qLhACzO2XL4DjmaPd6NUWAyuqiOmCXInFcZRXLPZZgaqDJhoU98UaTj2hf
	lQ3q+c6Z0Xck2jNN9DWqnWdcMFrN0eGTdKi0a9NvPzQO6KSMVeie9Ilayjcg6bI/FMRopWs6f5H68
	GZT0W14Lvf+l/gYY3MVMN8BI+a4pogG+dBLq4czGWOkoJxbv7ac+f1tGes1Xh0wA1W0mylb4vhj2c
	03+vuQz2Uz6fUfF8kxJ6IgN84uCaRgLj9fiagl+P7UvVfCTGc01uLQ4gBSqo05CYizumkBL8L+3RU
	lNJ1m/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpNS-00000001aHb-2ndd;
	Fri, 30 Jan 2026 14:21:38 +0000
Received: from mail-norwayeastazon11023109.outbound.protection.outlook.com ([40.107.159.109] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpNP-00000001aHG-0dVs
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 14:21:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+f6APpC22M9k/URoviNbafwPyre+QqeV0f8l5Uv7/zjxkBhr4mGMR/3h/0MsXuNvFe1WCy5lzX/X4TQ3IzFhmm2dy/zxfmSvp5BI3i97YMLoHYFN2K8Siqg69iFtkxArU6dckt2OiLQvaFSqekMb185O1Vd3DtIJITpbgdgVt0kMKrnwq39e1qy5c8mll7C6CfVqSUpQeziQG7ykDDomlbRJtepBf4RmvUSvnDgtfIjyBKJIPKrdxfRDsOZUy4PYp5yM3Y5DIpVZMU8bRHoVYTf0gtR4y0X5673W9UJwDVjtrGIi3fqGau0xK2U5D7AiRvxNAewPzWbXow+RZSk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFK1pTi9x0vVgXJqCV7o+DXcQl4G0SXUWfsY+VgjCac=;
 b=KDkFmxi8EEx13xBqjVIpgRX6lJKCu5scoIQnbuUL9plCr6obHaropx+jGthvo6V8wl4mmST/AcUR6eenj9sQL9nyrK2G99A0l26diM0YvCr4gQCaKr4DziZHHQ9mKUyqXOd1ROWPc9XrbW+3vtOamm39R5zx+sahdGMH34bf5ZXKa4KXJQOwTMns3EMsPEDCZUTiwmqtJBRMmz3ceq1AQ+nCRxbgCgRfg1RggAbWWZjAfIFn/kWFZsgTUYY0R9xXfcSJJ68kj5SmFenoGPLKBhAlzGCYekdO4GSYYSnO+ArF9lrOoTshefTtHW/lE4AnjxKfbyTnJwjhfUNKAUu4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFK1pTi9x0vVgXJqCV7o+DXcQl4G0SXUWfsY+VgjCac=;
 b=6bmx2dNHsDo1r3Hezv2BxOpOBR7RA85s4llyfrwxYCl+WN29LKlblIvJsWFs4cSyD43mklIwUKxeBBjrPu3MY9Yx8ujrS21jCUQOxJVdhBKtZaJPgsmcfGE0kaDtwmeLFSg2b5RIf4o+KQ1IuGHTKkq1zK9rFW5lXXgUzbIFjar7D1Lyc5iA7XuCTq4Rn8LLgQQCPbJVNIVgLhV0THHcRqzocmkOV4Px5Yv0Y4QEsSuSlL5D+hrIu2UzszMxUFS8QHM65yWA9XkC6nvt12hMh1EUHxJ90pR86jv5By/WIGAC6mGSTiWJA7sBmA2Si5F/pr5ECsP2KS57Y8pMetvwaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by PAVPR08MB9283.eurprd08.prod.outlook.com (2603:10a6:102:304::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 30 Jan
 2026 14:21:28 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%4]) with mapi id 15.20.9520.011; Fri, 30 Jan 2026
 14:21:28 +0000
Message-ID: <9e5408bc-3209-4a55-9640-e5985b6faf08@iopsys.eu>
Date: Fri, 30 Jan 2026 17:21:24 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spinand: Disable continuous read during probe
To: David LaPorte <dalaport@amazon.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Martin Kurbanov <mmkurbanov@salutedevices.com>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Gunnar Kudrjavets <gunnarku@amazon.com>
References: <20260130013334.72135-1-dalaport@amazon.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <20260130013334.72135-1-dalaport@amazon.com>
X-ClientProxiedBy: MI2P293CA0004.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::15) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|PAVPR08MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe974de-3446-4f03-db43-08de600adb41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnBkZk5VQ2poc0lyakZYUHY0ODNuQm00U0QyV3N1bWw1N3FkZWloTTFCMkhJ?=
 =?utf-8?B?ZytEeHJZV2tVck1jUThOMkNaMXZ4dGlJREtIL2dFL25MYUtpNUY1ZnJvWENW?=
 =?utf-8?B?QlZHamEvSkI2UGl3cFBoajRseEpyODFGU1A3akNMakdvZUk0alpDVm4ybkIv?=
 =?utf-8?B?STRqTjNNTnNFWGorbnpkV1NYY29ObnVEWjRyc3YwOXFabWN1d2VOTEZzTFdJ?=
 =?utf-8?B?SUQwZDBVVTBHaVZsOVp4dUZQb0VqZmJsbWhNSW9qdFR2WnlTcVh3L0lDeE5T?=
 =?utf-8?B?VU5HY1ZTV1hCaWRXbDJLRHlwVU1KQXl0QkVaUWhYZEkzaktLbTUvUC95UzdI?=
 =?utf-8?B?S0RSQ3g0MVB3MXhrYVNkbytlaXFTZCtFc29ESWxYZHBYV3VBbmIwaVJSa0Zh?=
 =?utf-8?B?cW9mTU4xdm9zZEp5ZWJReUhMaXdjSFl0SERqL0FFV0NvZDZZaVFlcWhLU3BQ?=
 =?utf-8?B?UUs3U2FwTGIvME1tOElTVEs3a3VvR3N5bWZRZnQrelhHVC8zelc4RHBJL3hP?=
 =?utf-8?B?NEtYQWs3aklLOVdKQ24vN0Q0SlFaL0pINUZXU0lUVTdUaXdCZXh6SDVuWmI1?=
 =?utf-8?B?Y0Izam96c2E3NWphKzQxTDl0ZmpFSTZ0b0hRZXhVa3dNYVJwdWJZTFNJZUda?=
 =?utf-8?B?K3hEWmEvMmsxVThmQzNndlAyVEd0cWEwZkV5WXE3WWlVL1dhdU1UQ0FtVFMv?=
 =?utf-8?B?YnQ3V280Z25heE90T3ljTXk1bm05ZDVQZnRxcnQ4d1ZMVVpWakF2OTNuMWx2?=
 =?utf-8?B?VzBOSWxyU1ROcFc2aUlVVlVGQXZQcnIyRWxFY2JITEZ4SFZnYTFSa0NhU2lu?=
 =?utf-8?B?WVNINm9RUUh2RFgvYnMvWXBRUXNMeG8zOGMwTm14WCtmSGVNQnRXNC92cUds?=
 =?utf-8?B?dHkrOVIvU1pvMGJRMFR4NlArcGF1U3g4bDVtNU1ScEQvaG1BSEp6cUFZU3Jq?=
 =?utf-8?B?cGRvbWZPQ05XbnlCTmFNMWVyOHNKdUZQV2hpUWhUdHZLUS9kemh6UFF6Z2dF?=
 =?utf-8?B?YWNXNURubEpsR2lvaEQyTXFYOWswTGdJQWNwdkFRMlI3a1A5bHJ6aXNMU2VO?=
 =?utf-8?B?VGpTSzJGWVRub3gzYWptd1JYdkhtY0puRzNSNlFIR1MwdTU2cUlaOXcvUUw2?=
 =?utf-8?B?YXlaaU5Zd0tvVEZJOXlSTnNKZm5POURLL2JFd05ZbW56eHhqVGdnU0V6ZGxk?=
 =?utf-8?B?b09pQjVORmU3OGF1V0tKK0hVYUhKaDRvT0Q1a1FBQVhRRk5xMDNPOVZQcThB?=
 =?utf-8?B?ekpwcG96bjd3TytHS1ozR21CRzVsTlBTVS9Ja3YxbGtJSkpmcGl2VGwyckIw?=
 =?utf-8?B?cy9KaWJPemNLRTlKN291UFpRQi9jcnJrOFY5L2tEbWg2TkM5Ymp5L2p1OW45?=
 =?utf-8?B?cTk0TlNCeEtELzhrUndrZklaQU41MzFBeFdMK3VUdms4M0lXMjBOTkw4S0ZX?=
 =?utf-8?B?SmhkNDdsMk56Z2V1NTB4U0FKbHROSlFJSWZ1OHRrUm91VWZUNHhWcHgvTEVj?=
 =?utf-8?B?UENRZitYakVyWXEzVEpyMkNQU0szSmFNZ1ZaQlNubGdyL3ZUNXhQcFo3N2Vo?=
 =?utf-8?B?VXM5TDR6MSsvUENodXlKc2dqSFR1dlgvS1k2TExNTDRsMW1Qa3ZoNnE3ZFg1?=
 =?utf-8?B?S2VVNGY1QUU4Q2RMWWo4SkFVMmtKeiswOExQbVJXa1MwcG5hVHFESnZyeHpq?=
 =?utf-8?B?ZFVLL0x3K2RMM09peXVvK3RTclhKUnp4TmgxSkZhcldsVEVrK05BUVQyRnVh?=
 =?utf-8?B?S2N6MVo5SGRza0dGK2lpaEFKT01HMzUwRVFWeDZHbmpHMTZhWHE1eGw2SGxO?=
 =?utf-8?B?QWZ2ZUJzanp0NlBQakZFeWZOTENoMkVZOGQ3UjdWUEV1ZDZkTDQ5TWoyRHJ0?=
 =?utf-8?B?VUVDWnNMN1NRQ3NiWmdRY0E5TTlzaWlobVA0ejVaTXJMQS9aUDMzbEhRbWZ0?=
 =?utf-8?B?QzdpSmt1YzE1Q0MvWFVRd0FlZWlLWTZWWTVydGRWQjRCOWlVWjQ4cElwQkov?=
 =?utf-8?B?dG5OWWZBNnRzS2wzWmZuRmtLZHFGcklNRk4ycVFnQ24rSHI5Q0tqTUY0bCtM?=
 =?utf-8?B?bmtsVUdybUhNR2UrT3pyVGNYL0FRbXp0Z3psd3ZvZ3pLUXJPTFZvY1BRTFRz?=
 =?utf-8?B?S0FlTWFDdGpxQkx4b09hY2diT0RScDVDMjJOYm9UTEp1NnRhSWRCbHRGNkY0?=
 =?utf-8?Q?GApxb+M/hXthIe/AJ1t8gEc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmljNDVLV2pXanl3eGpCU1EzUWQxelh5d2F1OXY1b1lhRVExRUJWTFB0RVV6?=
 =?utf-8?B?VFB3UDAxMERIOUtUenpjNmE2UUlNMmJxL3RuTWhub3Y0T3pKNFpsblVsZElr?=
 =?utf-8?B?a3hPTTJwSThFa3E3MlZWTVZTdEcxV0w0KzNNMGhuKzM2YUdJYkFYNWlJRVlO?=
 =?utf-8?B?RDlqK21sSHdHbG1oRnpnS2Z4RnQ3MGplS2R1U0lHU0RhSjJWZ3pTS2c4ZkJE?=
 =?utf-8?B?VFRVbUFsRmVacDR1dVh3cEZ6a3dTbDd3VTRpbCtJZlNNUzNxZ2M4d2NDQzBv?=
 =?utf-8?B?K3BnUG5ObnBqeXF3Snd6VEFyQitqOXEreHBlMUsvcisxZnh6YmpPa1dsN05w?=
 =?utf-8?B?U0tpd0p6cTdtNVkrLzJwbENha0tZaUNraUZOcDA2ZkdhdGFaclNkSExUVlJr?=
 =?utf-8?B?cVk4dHVQaVNvNC9ONlMxa2ozWkZsclA3U2haR1prY0ZYVlZUVnRQckpZUkx0?=
 =?utf-8?B?eVFIU1ZvOHJvLzdHRlFRcFB6S1ptRXA5d2pDcFpnZzY3eVBpTERGTStUVDFQ?=
 =?utf-8?B?bTFyd2k4aEZwZmcxQ28rMW5pQmYwelM1S0QydjUrcHVKc1cyQmFMc0RlZ3Zi?=
 =?utf-8?B?SjJnVE56VDhQOWhLMEhFVWZKWGFIeUwvVjRjeXBqdFU1RGxweVhmbHlDT29s?=
 =?utf-8?B?OUlqb2xLd3krVE43NFAvVlBpVXBSSS9aMjNBbm5hbGcySDRrbzZlaDFQSTlF?=
 =?utf-8?B?U2t3a1ZDVjQyRVFsNTVXdUgwVXJUcmhDc2MxeG85ZkdPQVYwZEUyNER6ZmFn?=
 =?utf-8?B?RWdzdk9Oa01nUENVTStQek04NnZHbmNBUDgxMjhjS25zYzdITUgyVUlGUnNz?=
 =?utf-8?B?M2QrS2Y0OE1HOGxYQ2xIWkhVS3JpTmxacWdmQlR3ZWZoY0FsaDJ6VHl2UzJz?=
 =?utf-8?B?SW5iUlc5UU10Y0F1S3cyQWxXVFlCbk5iUjc2UlljV0RxVTFNc00wUWFBT3NR?=
 =?utf-8?B?STcxcnp0bXN4SlNNdUl3endqQjFIajlQYmFyWW5oZ0FadG9wV1NBdzhsVnpK?=
 =?utf-8?B?dUJsQURzN3ZkbGx3ajZKWDJ4OHVZekZQbXIwM0cwSVpmcEt0Vitybndmb1hV?=
 =?utf-8?B?dWJLNXJWMWFETUtWNk5xWmo0Z1VaeitVUWwyOXZ3b0htbTJIenJXQ2tiM21p?=
 =?utf-8?B?WjhzM2JvMmdIbzB1bFpjdjRqaC8vT25QcVJzQ2dRVkpJZCtzYld5RDlhaFdE?=
 =?utf-8?B?MHVVang5bmpIanV3NmFVRzlqY3phT255cTZ6WkRVRXBPajltekdOY1pvZmly?=
 =?utf-8?B?amRNVCs5R3FGaTVmcVlOaVZrZ1NMUk1KWFcvemFmd1MrWVdnbjF5RDRSbEZB?=
 =?utf-8?B?ZkgyYVZlc2R4ZGVtNlZSY0ZDeTV2QXVwaEFVV1ZNL3pyZFAzUXJKRE9vQ3VO?=
 =?utf-8?B?azl2WGVtTCtRMjVDUndoUHdXT1BmWXdRd0dLTnpJQVg4RWtFMzZGdkEwWERF?=
 =?utf-8?B?dVJwVWlEaFdsK2JIWmJ3WjFvNXpLbXMxVFY0YXBJRVpPVFJuSGNwNnZjeHZ1?=
 =?utf-8?B?SlMrZzI0UTJ4MmViQytxNGR3VnNkeU9hSFhTbEdCeFJ3ZnJhQjZoSWpxdG0v?=
 =?utf-8?B?UEZ6UkdJcjNveHJGNlhjSytxMXFKWnhyVXdhejJsWk1vSExOd25FSmdFNUY4?=
 =?utf-8?B?eXpGTGNvclBoREdJTWNlSzN0dmtsck1UQVliRWVTUm1WMk5IY0tNTE85YTEv?=
 =?utf-8?B?d1R2ZFc3U21TN3dkL0FWb2wvQkxKNUhUVEtYQ3l5YTJ1dlU3WmtuSy83Vjkw?=
 =?utf-8?B?Y0tHL2dJMXJZOFEyQ0M3NWZBbU1MVzZhODNiWFlSTjhsTWdhRTN3Yi9RZG9E?=
 =?utf-8?B?MUU4Z0N4RTgxa09NVHMzZmRSUjlLSkQ2ZHFKUFRsa21FeTZTeHhBR1B0ZE1Q?=
 =?utf-8?B?aFRVQTFsMFJuMHZlakdRYWpObWtlYktNaEpiTDA4SFJ3anB4SU1WNmZsMW5L?=
 =?utf-8?B?blI4NU1kVFJORUFsNkNRWDN1eS8rbGZ2bDdFUkdNUndsOWMzdTBzV2RmOERW?=
 =?utf-8?B?VG5zY2l6eTlzem5pWVJDYjB4eFhvcXpKb0ZNV2NneVNaZ0ZzTFN5TVcvSUVp?=
 =?utf-8?B?RU9SbmNaVlFWZHNUMFhpRVgvZkt6K2EvQ2xrSUZMUGxzZzRiUFNqeTV1SWNl?=
 =?utf-8?B?QUFRVFAxV1FIejE0TzBGemUzRmNLMjZZNTd1Wm9RdFNaV0hPMU43SFl1eEp5?=
 =?utf-8?B?UWVNSnpYMkxieG52S21DRlRxQ0diMER6YXMySldQMTNuczF3b3dMOEdsWmlD?=
 =?utf-8?B?L2J1MnBkMWtxcExGejNrTGhPd014OTJwU01wY3R6NjRsR1o4bUVibXYvSldN?=
 =?utf-8?B?c3pvSy8zdFJFN0o2SmxuS0x2ZEp6MW4rU0ZxRng2Uk9XaEFGQ2tFekE0R1NQ?=
 =?utf-8?Q?2CrVkEnZ4yixs2ZY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe974de-3446-4f03-db43-08de600adb41
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:21:27.9131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGTAE+YXak4wwN/Dw2YCTUtIxkjEWNQ22gP+J3kK2Or34i6a3qDV9Nwv5RVWt6Otn5ZL/DQOU3gYIOIJApMApphxlg9Ot9D0Bk98PWrqumA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9283
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_062135_832413_5EBF8BE4 
X-CRM114-Status: GOOD (  27.05  )
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

Could you submit the same to u-boot?

On 1/30/26 04:33, David LaPorte wrote:
> [You don't often get email from dalaport@amazon.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Macronix serial NAND devices with continuous read support do not
> clear the configuration register on soft reset and lack a hardware
> reset pin. When continuous read is interrupted (e.g., during reboot),
> the feature remains enabled at the device level.
>
> With continuous read enabled, the OOB area becomes inaccessible and
> all reads are instead directed to the main area. As a result, during
> partition allocation as part of MTD device registration, the first two
> bytes of the main area for the master block are read and indicate that
> the block is bad. This process repeats for every subsequent block for
> the partition.
>
> All reads and writes that reference the BBT find no good blocks and
> fail.
>
> The only paths for recovery from this state are triggering the
> continuous read feature by way of raw MTD reads or through a NAND
> device power drain.
>
> Disable continuous read explicitly during spinand probe to ensure
> quiescent feature state.
>
> Fixes: 631cfdd0520d ("mtd: spi-nand: Add continuous read support")
> Signed-off-by: David LaPorte <dalaport@amazon.com>
> Reviewed-by: Gunnar Kudrjavets <gunnarku@amazon.com>
> ---
> Changes in V2:
> - Added comments to explain why cont_read is disabled here
> - Link to v1: https://lore.kernel.org/all/20260129221606.35158-1-dalaport@amazon.com/
> ---
> Testing details:
> - Instrumented feature enablement and verified fix on internal kernel
>   v6.12.64 build with affected Macronix MX35UF4GE4AD-Z4I hardware:
>   warm reboot without patch marks all 2048 blocks bad during partition
>   allocation; with patch applied, device registers cleanly with no bad
>   blocks marked
> - Patch cherry-picks cleanly to mainline v6.19-rc6 and builds without
>   warnings
> - Boot tested mainline + patch on aarch64 host without SPI interface
> ---
>  drivers/mtd/nand/spi/core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index d207286572d8..9540fd04156c 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -859,6 +859,14 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
>             (engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
>              engine_type == NAND_ECC_ENGINE_TYPE_NONE)) {
>                 spinand->cont_read_possible = true;
> +
> +               /*
> +                * Ensure continuous read is disabled on probe.
> +                * Some devices retain this state across soft reset,
> +                * which leaves the OOB area inaccessible and results
> +                * in false positive returns from spinand_isbad().
> +                */
> +               spinand_cont_read_enable(spinand, false);
>         }
>  }
>
> --
> 2.43.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
