Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B89BC83F27
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jul 2025 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3mYh8g9XHWTlS8C6f3iXXQL6KkUQcgQWSfj9G5sv+Q=; b=iaY9j59P7PYFWY
	uU+5R6iSvt/udt5wXgWzRJ6jXztr9WGtKxZeGXHmRJfYFEF8Rti1TdTRTQaxx5k2YsY9vZ4cBXjnv
	iXTlhl7DkTuupcVD5EqWhTi9U696K/s3PLuiT4BnY1boWpoz5Fp604SRetXIs6qk+GbXjQVFHRbQF
	0+OQE9es9pmpdOBtt7Zu/Gp7ZlYaOV9i2ul0Fhj6qjrunZSmmYXsyoSR8uapMjmqFSpJSrb15cTRv
	OeqpNwLXZEvx/3PdCDqNUHVqW1RcF0vsMeC53sHn3Ye/09TkMWFA5/Aak6jaSlwhN8BGDzM2b9kUz
	E0oQnqat2T/PKNCZbY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9hM-000000024IL-34Ed;
	Tue, 22 Jul 2025 09:54:12 +0000
Received: from mail-dm6nam10on20600.outbound.protection.outlook.com ([2a01:111:f403:2413::600] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9f2-000000023tx-3hfq;
	Tue, 22 Jul 2025 09:51:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrT8G6buQeWZWJuOZqf/ghv5q7VIhoafn5y9CwN9eJkzpmeqaKpX+v3bICFQRLr7cyJ3Gqz6c5rWAHpgGTdQ+6C5eip21vuyB4f5uhW+MvSjWPpkmjGt9HJX/l8da51Kz5H64krF6TfR+3WMlv4WXxCJwS7pbIOdWcv4q2JIfVhXeSmyad23+lWYWf12azJWSxN4SY5klLRx5Wv7Tjhb4+OwcGKSI9gXnLqN82C5gZu3PykMqVlKp/WE0VUMS50D3wCb+zUjdgYFoR3/ohXN4JCnoSxR57V+KUxXmfRUYyzg70LKXQe3ObHxultHqtJ1srY/2L+QzKMtlc69/H+1Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I74V2osVNYu2q2ZEuU7PoJ9b7//zjhM6FYODzO6kQI0=;
 b=jCwDdGSVHgoALnR7nn9hTGpKnyK/ebXa532IkBnDTm7XYCKb8DIzYNlcX3iBGC3Fso1+fMcToIU0FOVzKQAtvqiBXynW+WaBcNIxIhIvdIMOVWqtgcwGFiQ4oEbTr2nRzkOebioE66umUVeuAIJPySJ9L4nER16lswpOGrp4KONmfTRufoQ9TESa+kyhNsKt0/iYWCYBGGWFDzHI+9LkXrvP3EmoFGeosVgHPhpxb66wqtCbrGsaonu16XQstVjek9yioJZZnZSlCsi32ih/7BCDGkOWtmOHDCfIjQsugGppgpFfHZS0OmelpamCVj6OfYAfQo9ye8Qma/rm2qgQGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I74V2osVNYu2q2ZEuU7PoJ9b7//zjhM6FYODzO6kQI0=;
 b=iQHWbi5iv6pU/nE3j2yHZLeY6n/7WTGk5oXLetkxW2cKKu/WpgH2Rnzyoj/B89F1zjKRjwZS4fpsa5En7sUYOEdvms6B0V8MZ2A6rGPgOHkxPRguksYqnCoLnOSoFLG4CPCEPT3VSgGcZBdzNIGI2C4hyZF0+FpJfjR9wDiPT9uOrGkfABpIpmcnQDeellbRaH8sCqfxvyg5TUetGVIQkJKfeySvYLfjH4UM55NeTO3Iy2G0up+xcQ+YMqNdVo49vfszL76DAzpydHj4EPu2tEmFsIU7R9gYT0Amf5BP16HEXRYtukaIVDj93p0RAaroceqVFLNDoXjqT5PZRRnhpw==
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by IA4PR11MB9369.namprd11.prod.outlook.com (2603:10b6:208:565::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 09:51:44 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 09:51:43 +0000
From: <Balamanikandan.Gunasundar@microchip.com>
To: <alexander.sverdlin@siemens.com>, <bbrezillon@kernel.org>,
	<linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: raw: atmel: Respect tAR, tCLR in read setup
 timing
Thread-Topic: [PATCH] mtd: nand: raw: atmel: Respect tAR, tCLR in read setup
 timing
Thread-Index: AQHb6pmsVL1Yfp21NEeuFkipLHpM9rQ+Bz4A
Date: Tue, 22 Jul 2025 09:51:43 +0000
Message-ID: <24142dc4-a3a9-4d17-bc85-913cc9a56261@microchip.com>
References: <20250701133333.3871085-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20250701133333.3871085-1-alexander.sverdlin@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6231:EE_|IA4PR11MB9369:EE_
x-ms-office365-filtering-correlation-id: ecc40f1c-a6af-41fd-c236-08ddc9055d89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MmJFa2NtUktuZExDVG5GVFRVQmhwQXExd2MyVXVWa2ZCWUxZUzA2YXFqMDVj?=
 =?utf-8?B?VnM2SDBhNURaY0hrYTZHRUYxK0FkYlkvVlpKZmQ3bGFselcxeVMvTFd0KzJ0?=
 =?utf-8?B?dkU4U3NOZGZRcUFGL3REQzF4cFlSS21kdzlXNzhqNnJ3eWRrT3hxQmZvTHVY?=
 =?utf-8?B?WUlKTWVvcVdDTUdHOFp0TUZ6dlNQcXlUVWxlaWlQYXVOSWh3STVBVWx6YjZ0?=
 =?utf-8?B?dW42MGw2eUIzV2dLNytUdjNldUd6MjRsTStndmZqR0g1UXdZcFdSeVZmS2pH?=
 =?utf-8?B?NkhPYkYxSmZCclhDcjJjdHVmbSt6WDFnVUtqM3pRZ1ZleUZKUDBzaGwyMXpn?=
 =?utf-8?B?RElZdlRKY0o4QmdDdWVmbC9hN1N3Syt0T1pLMy9SWXNQR0MzOFJPWllSQjd4?=
 =?utf-8?B?UWJkZk1ZMFR6RGgrektmNWlEYjNNckFyWkxZVmdSOUNCTFlzZG8wazE2RmJ1?=
 =?utf-8?B?eXNtWHFEZ0ZNR1NHTndUb0l6S2M0aEh2MnJWRVBPclZJaVpMM2hYV0M2b1hG?=
 =?utf-8?B?c1NsT2tqWTMzZnBjV1ZGbFhhTStQbU4zN3pYajlDVndkUEwxY3Z0VmREYVE0?=
 =?utf-8?B?QUxtRTd5MUlBTld6L2pWZnFFclBjRkNycUo0Q3R4OWJkRmdSMkFucUxQU25y?=
 =?utf-8?B?YjhLelFWN2FnN1lIaDhwK25TN2JHMWFEMTdqZVQyanhnRENsS0JVdDB5VHVw?=
 =?utf-8?B?MFVoNFZzUjBIbGFEZzFLSldzdmlsYWdhZUYzT0FWcWxQcGtVN3lHNE9Edi8z?=
 =?utf-8?B?ZmNtblkxdEZraXJFVlYxUjBkZmNCU0JLSFdxckJvckI2TFl4VDN5dEYxdWs5?=
 =?utf-8?B?cnNGOUY1cGZIRnUyVTI2T25FVkNod21xN2xITnZCdDNEeGhnb0tsdUdYb0pT?=
 =?utf-8?B?VUpGSXhQMjlJZmhRZ1RJQXBtd0I3VGJNRllXenl1YktoNmVLOXNtWG5taWxu?=
 =?utf-8?B?cVA4dGtRYXR1ekt2SzRXdlFZQXpEck1IR25GVlZRdUh2ekJHSUFJbHFHbEVK?=
 =?utf-8?B?M3M2Snd2RUIwMy8yUVJERHVYa29Fb2hiWng3TWVpdjFPYWk0b3ZNeS9xZVR0?=
 =?utf-8?B?L2htQVp5L0NGNldyRmM0QmNZTEdzYmFzNmZ4c3YyRTl5R1ZnUnJCR1BSUWIr?=
 =?utf-8?B?RHU1dWR0UldQTHlGZUdxby94VURKMWZ3TmJieU9SNE94d3FVSnRYcmdHU2o4?=
 =?utf-8?B?Q0ROUXAzVjg4d0grQkIxOCtUYXVtcnhLTDQ1L1VldUVXbUQ1azA1WVU1blJI?=
 =?utf-8?B?WXlLWUhhQ1JocHlSMlVqVHBYejNKc0VqQWV5RG9NQzBDWVQ2QWxORFRJVzFL?=
 =?utf-8?B?UlZ6VWovS1dWMjBYM2Fidm5EOUJXVEJpM05wbWhMSDRrdk5ES0RXNlgvQzBo?=
 =?utf-8?B?WGtYdzRSQTRSVU9iczRHOVpZSDhVSTFtam40VXIxL0dQWHZCeXJUUjVTZ0Jt?=
 =?utf-8?B?SXphZHFnVWFrQXRJd21oeFVnWTMyYTZyZDRwamJqcmNyVnBiSTMxUnZ5UG9C?=
 =?utf-8?B?ZkZRNEMyRWllTFlrUUpUMHJrUTc5V0ZNaXJYZGZLZjdoakgxbDJkdFcwUmdh?=
 =?utf-8?B?dXhqMGJmNHVGTlAvTm1vSXhFU1NNY1Jod2ZxU2JnYm52MzRua3B0RVJCeHQ0?=
 =?utf-8?B?SUZqZGtLMU9WTVpjajJqMFdOZ3Z2aXFCMHNIQWZtVHd1akM2Z3lhRFZobWdy?=
 =?utf-8?B?ZzR3UmF3enVKZWRrUklCVjYzcHVMVGo2VEFoK29BTnNuUTdVQ2RRd3I5cjUr?=
 =?utf-8?B?cXBUcFhqaHVBSmN5cnVrUWxzd0ZjSWZ3cHYycFBzWEU5UVhsUWNoVzJnZkhL?=
 =?utf-8?B?Z0swRzNuZTNNem5ld3RTclFDUVRxSkUxajZIdmxvRmdZaVdHUGF2bGxORnFo?=
 =?utf-8?B?bUs4THlJNmk5VnJ5RENZL1o4WjZKUUJGZVRwSllZZTVYUEtXQ1VDVkJQSGJM?=
 =?utf-8?B?cmlZcmRxT0hxL0p0TGVoeTRvZXhBRWpWQlNLMXdIbUxsc0NNekEvRVhuZUZj?=
 =?utf-8?Q?5F5uKTIpbFB44D2mnel4VBOresLTUo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dm1rODZsOUlYRGNPN1EvU3ZmYiswVndMSldXbE5HU3RzMzRQVHp0TXB3M3Ft?=
 =?utf-8?B?bFByWHlwNjB4a3BHSytpQUFBQTBwNjlLSjUvRVkyUjlnVzg0V0pRWEl0SFpt?=
 =?utf-8?B?MTRpMHR4bWZBcmpIcnRBNDlQVEs2dnhIUTA4V2N4VGNweHV6RjhPWXpYeVZL?=
 =?utf-8?B?S0pmS2R3VzF1UzRMMHJHZ2pRQld0cFB6dWZwc2JsNUszM0dzWm9ZTWNxeHpi?=
 =?utf-8?B?UnhoVkxiTFVrMm5UTmZiWkdicnNvSHBobjdtMCtLUWNCMUc1M0RwSUJGc25K?=
 =?utf-8?B?NThDS2RhOHFzRVlxNTBWcHB1MnBwdTJnZk1nNVNJMWlnRXpZRkFaUWJzWTlC?=
 =?utf-8?B?NlZBa0xibi9LK2VxWk5TMzN0NzkxenNZd0VxTHRvbTduTWJvUWdUL3hCeFNv?=
 =?utf-8?B?MTdEMVRJdUk3N1ZoMklRdURPS0VMcXhQb09LNXpoT3RNVzRySWZ0bWlidHRy?=
 =?utf-8?B?eXBlMzFRSFd5eVZyNHJOUmp1N01HclM4TUlML1JlVWI0bFNCb0h4enVWUU5P?=
 =?utf-8?B?bjRRR1FLaDFTSHc4TEM4bWdsQ1pjOFhMdHMwQVc0UmdYMlZLRmhQYjdpNU1I?=
 =?utf-8?B?QnEwSG40RkRzZGxwdmhqdjJna0o1Zy9WNUpkVmlmTTdObEthU0ZlSnNUUGRm?=
 =?utf-8?B?RUZJU0hLbnhnS0pmelJzckVNYWw4OXAza1hiUjNxZy9HOEZ5dUFBanQ3RUp6?=
 =?utf-8?B?RGUwZFZUK3BBbGtSV2RQQ3JqaTRWUmx3K3pxT2JpQlE5SzhiVlgrSWFrS0U2?=
 =?utf-8?B?ZDVtSlRUZTVjUzAvMzlFUnpHMW56UlljRHdzZmRuSVJpUmwvQ0dYM1JWR0lr?=
 =?utf-8?B?azl6aVp6Sk5NdDBuWEx3SnJRS2dVTjBrSmo4V1hzNng5WnBWWjFMcktPSVlH?=
 =?utf-8?B?NVFsV3RrcjdlcEtJbmpvWjNPUFZGd0hnc1hIdXNnUHcvUDBBWk93SWE0Yksv?=
 =?utf-8?B?Mktlc3lXSUp5OHBxejV3ZjZDbXlzd3EvUEk5MkxaRTd4ZDhEOXZlVEN3aW9I?=
 =?utf-8?B?VGdqYjFTSnIyWXpna0l4SHVNV291N1RWaS81cktZUHlFYngxUHNOenFGRTg2?=
 =?utf-8?B?T1R6Z003d3A2aWZtMzJhcllwaGVFc1pySHFsdmxrcTlVU2tGMkJuL25JTGV4?=
 =?utf-8?B?QmI0cXN1dFhkTktqYWdzU0Vxd2RBVEI5UHVpdENEL0RKZEhOSEVpSk9IWE51?=
 =?utf-8?B?cElYZSs4emJOcDRCcnpFb0NkRStEZzA4TkxXRXNmSDNwSjcyM0Z5OVNEeU5h?=
 =?utf-8?B?TGFTRkNNQkU2bldVdW5DMWE2MDJpamg5Q1Bac0VUYlZJYmJ1S1psaGhSY1I5?=
 =?utf-8?B?bUx1bHo1Vm5YOGVlVlljS0Fvd0FyaTMwYVpKbFNvU2ZsYXVQaVg4UHNPRkt3?=
 =?utf-8?B?aElRbHpISndZczNBMFVUYUtCVlczckR6dG5xMi81eUlUK1ZHKzVUUG9EUnZE?=
 =?utf-8?B?MGFyaHU4eis3Mk43VTZmVEVTamxRaEJvQlo3cnNmWTMvbFA4VXFGRmpqaU9Y?=
 =?utf-8?B?SENkVUt2alh5QWk5MTZIODBlcCtrNWlmQUMvT3VJeTFPOGxEbkFVV1hlRG5S?=
 =?utf-8?B?R0FVU243RVowOTBqZ3lWb2ZtMVJIaUtreVZieVV2T3ExeXVrKzZKSnRlbE1r?=
 =?utf-8?B?ZldlOERVS3ZmRHlsVmJ5NVVQc2kzczk3Uno5QmNiSGhKaVdVR2dTZVo1b0t4?=
 =?utf-8?B?V2Ztbk5WUFl3eFl3WUNkNG8vcS96Umhzdzhib1FrdVNSQmgzV2w2RWFES1R3?=
 =?utf-8?B?a2ZJUStsQXRuOVc1MDRZSXhiTjhoQkZDTkRvaHpmU1NvZ3l6ZUNuWENkb0tI?=
 =?utf-8?B?V09oWHVhb1NMY3o4RlNrVS9Lc0h0ZHhZdDc4QnVvQTBBWnd4Tmpiamk3RUZM?=
 =?utf-8?B?b0VBNFRWUWdHVFBieVUxb2JnWUNjTWh0bVZiTUk5M0NldGFjeTkrdWM3S1ZU?=
 =?utf-8?B?ZCt5SEF1QVQxc0pnTmlVNDBYRjM1R1JHdXNFakkyVTdrSUYzSEt4NDlkVEwr?=
 =?utf-8?B?OUlsblJsUGk4SzVxbnVYejArSXB6anRNbndiWWh5bWkvUmNUajF6QmpsSE5q?=
 =?utf-8?B?M0hyR0VnUlAyVkhxYTQ2OWl0TXBpVHdCQmNvcllLMDlWdU5tRVFzZzRhTG91?=
 =?utf-8?B?aVJVZ2N6bFlLcmhkdVl3bXphVDlEVmVJRVRjMDhJcGc3OS9CUTZ2Q2RzaXFz?=
 =?utf-8?Q?yPKeLR8jhrkOI5WzxrjHR/M=3D?=
Content-ID: <F92D924ADCFF74418C7DDBA4CEB52B4E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc40f1c-a6af-41fd-c236-08ddc9055d89
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 09:51:43.7228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U4sXPBBKtgipRXlTa4ZSric2bcjWD+0m08RndVm2TIshLQurwK79hkX0msF1mOZaPjL2DnrP6ahs7m7VjuUS1Mwpt1agV88kYu1WXrQIsQFFaSXdnSs93elldnhA7ipt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_025149_940328_88BEA575 
X-CRM114-Status: GOOD (  23.73  )
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

Hi,

This change looks good to me. But it didn't apply in any of my trees. Am 
i missing some thing?

However I got this patch modified and tested in few of our boards.

Thanks,
Bala.

On 01/07/25 7:03 pm, A. Sverdlin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Having setup time 0 violates tAR, tCLR of some chips, for instance
> TOSHIBA TC58NVG2S3ETAI0 cannot be detected successfully (first ID byte
> being read duplicated, i.e. 98 98 dc 90 15 76 14 03 instead of
> 98 dc 90 15 76 ...).
> 
> Atmel Application Notes postulated 1 cycle NRD_SETUP without explanation
> [1], but it looks more appropriate to just calculate setup time properly.
> 
> Without the fix we've measured -2ns tAR delay (REn asserted before ALE
> deassert!); with the fix -- 60ns (subject to module clock).
> 
> [1] Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ApplicationNotes/ApplicationNotes/doc6255.pdf
> Fixes: f9ce2eddf176 ("mtd: nand: atmel: Add ->setup_data_interface() hooks")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>   drivers/mtd/nand/raw/atmel/nand-controller.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index dedcca87defc7..844df72f45063 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -1377,14 +1377,25 @@ static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
>          if (ret)
>                  return ret;
> 
> +       /*
> +        * Read setup timing depends on the operation done on the NAND:
> +        *
> +        * NRD_SETUP = max(tAR, tCLR)
> +        */
> +       timeps = max(conf->timings.sdr.tAR_min, conf->timings.sdr.tCLR_min);
> +       ncycles = DIV_ROUND_UP(timeps, mckperiodps);
> +       totalcycles += ncycles;
> +       ret = atmel_smc_cs_conf_set_setup(smcconf, ATMEL_SMC_NRD_SHIFT,
> +                                         ncycles);
> +       if (ret)
> +               return ret;
> +
>          /*
>           * The read cycle timing is directly matching tRC, but is also
>           * dependent on the setup and hold timings we calculated earlier,
>           * which gives:
>           *
> -        * NRD_CYCLE = max(tRC, NRD_PULSE + NRD_HOLD)
> -        *
> -        * NRD_SETUP is always 0.
> +        * NRD_CYCLE = max(tRC, NRD_SETUP + NRD_PULSE + NRD_HOLD)
>           */
>          ncycles = DIV_ROUND_UP(conf->timings.sdr.tRC_min, mckperiodps);
>          ncycles = max(totalcycles, ncycles);
> --
> 2.50.0
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
