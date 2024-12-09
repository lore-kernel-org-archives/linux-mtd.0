Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B262E77173
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 01:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKTKHz8W2rl7R8fNdXqn+9dO0lh3uo5Z5YHNPmE9Yko=; b=eUmJz3XA80S+vj
	jswKBU+Td1BiRSBEq/o2E/1sqafnbybb4l9CQqFddh38GQT5IfGMtdMnTQXmEuQZoRQtmETdzqVTA
	vBtWxtqQRERUWjlmTap3OxS3PK5kI6nYlIPJENWyy+qzYFGZ7K/uFf/CXCXEhYuJAUUGrmgKqRarh
	Q9mU3T30IRnAy2Vfs9ycakhvr5M37FAu72lj2wzFYPRizwKW9Zr+mbbdYQBXrzg50LWtikwGQAj2S
	1AHDGy6enT7YWCbC+hDP7Djqd9l5t+1y63s3vj0escT9I/muAnk4HeSd8bPrOe4F3lLiiMVOF8cjJ
	RnTpPir8XJL6OjcM3nOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKShv-000000068zS-3guL;
	Mon, 09 Dec 2024 01:37:07 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKSht-000000068yy-1j8j
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 01:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733708226; x=1765244226;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XckRNQfHcr+ERiip99ax6JHKATDkL4iXNuqxY7qMdfQ=;
  b=iqYjr6aF1tGeUZUqIIJgcOn5Qnv00BPihPRmFYrCmO1JRx5rH5MmKbSK
   KR8WS47a7vj6Z+ssSsop1ek2YUy+gwIfyOu+ofrgi/pKgw1IMSZmIYYg3
   goaHkPW/n1BFT17ob443tRw1v+DMSuEIE32YKYV1Zdj5ojrYf+oiC6rTT
   voOdaQFINNXNlJ8b2HbFU/vSgAArrWlVa0hTZ+EBLuuXjc44oBksSay2Q
   0IZ859z/tAY9t+CdAhEpXFVCthybeRymhj00GiB0HJBc0vAVuQV8H5ogn
   5I6D1S3R7XlyXdle8XcDwc7D1h0IxZEJ2uCUlyZOf0lQEvRatR349/SG1
   g==;
X-CSE-ConnectionGUID: w1lO8E7pRYuyAPmvdH3JOg==
X-CSE-MsgGUID: UJj2bdpUSHO69WQkWNeNQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="44462740"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="44462740"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 17:37:02 -0800
X-CSE-ConnectionGUID: wqHfsiErS7a+1LnhWoO2iw==
X-CSE-MsgGUID: RQDZNUuET0KXFSvGom2/Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95275832"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Dec 2024 17:37:01 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 8 Dec 2024 17:37:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 8 Dec 2024 17:37:00 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 8 Dec 2024 17:37:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbCrU75I9TO/Ac/HWjeGmPfO9HtU3RsgQSll1C0SOkA7NHvv+pzGGs4kAA3Ye3HWsjYOni57LocB9ZecjVLA/jThnQoLNmLldPtOxZ8z8LhlKJZI6HzvPhPXzeWQ889l8Vb/3uplGP6jJtqFsdvbGIREuRuesrFjkgj8+411N/brOV6wrGNgz1qwt0+Pkf01WAv1z5i/Bzdrbl/HBIDmVrm2oZnpmZ4SzOlvs7XyU0jhMyReDB232E2Byt4LMGVkE2uGjvR0wYZADx5jyONRbKMYAWEnkzcHDQOX8qwOJZ9KhFiBpLHDBuHbUMlv+D0Bl0lMv2ZdCxY/2kx9iNY9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XckRNQfHcr+ERiip99ax6JHKATDkL4iXNuqxY7qMdfQ=;
 b=AibpdUsOCY1PNuVMeXFPCfjSq3EI9Q/BQjeJZZy+JmSZsQUNAyniD4mN2y7PzcBSQ7TC5E3TnBpDZdPHspFA82FemG4NK48gBgaoKn+r8lOPgqpCU1RqR+lujKR46Dk4KWrLFb0FnA39ZLwX+/VRGeIU8JiX79PR5YvgFsM3o/WPBEsNMdbkhDwpZCNZsZU+LG/k8Y85rAP6UsUhKHMydRjuqBK/mp4fy/E9+80IuQjAGRgEI6BJ6zYEMuDaDgV1nqV9Qv5OwCiUce9rl6OrkNy4EVz7FYEF51htY7bvN+QmQnulFi/eOmNrhpuZN/h7aeHfOdJOWsH1HkX1YStYLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.17; Mon, 9 Dec
 2024 01:36:58 +0000
Received: from BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f]) by BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f%6]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 01:36:58 +0000
From: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Richard
 Weinberger" <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] dt-bindings: mtd: cadence: convert
 cadence-nand-controller.txt to yaml
Thread-Topic: [PATCH v4] dt-bindings: mtd: cadence: convert
 cadence-nand-controller.txt to yaml
Thread-Index: AQHbRte2I6iSt4KgBk+IuGQxfboRn7LXcXdbgAT7LICAALqmgA==
Date: Mon, 9 Dec 2024 01:36:57 +0000
Message-ID: <BL3PR11MB653282E179DA562E3F4AB707A23C2@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <20241205053350.434370-1-niravkumar.l.rabara@intel.com>
 <87mshawhta.fsf@bootlin.com>
 <ugcx6muozaven6lolhzpk5mvrt5fncoaahnsx5lbdsaurid4mc@i4qflh2edqnh>
In-Reply-To: <ugcx6muozaven6lolhzpk5mvrt5fncoaahnsx5lbdsaurid4mc@i4qflh2edqnh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6532:EE_|IA0PR11MB8397:EE_
x-ms-office365-filtering-correlation-id: c439ce61-4d0b-4f65-5856-08dd17f1f87c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bnVwNXZndFVxRXZBejNFam1tYUthc3dTRzN5VGJBcVVHMEdpaXB4dDNNM0xr?=
 =?utf-8?B?aytrNHhMd1VSQkQ4U0krb2duZFh1TDJuUlJDTWR5QjlmbnlpM2lCbGxnbzMv?=
 =?utf-8?B?c3krT3lsNE10VW91aFFaQm56UDQ3U0NNZ0hVams4MnJYR0J2bk1lMHpGb2Zm?=
 =?utf-8?B?TW9HcmJwdm5SQ25YbmMrVDY1WW5TcGd0WWZIczdIRHNMU1QzRmZ2bHZJU1ZL?=
 =?utf-8?B?SXZmdit5MGNSdTZ1YzByTmlMallMb1pId0k5RkUyK1Z1ODJtRWJFallhN2tv?=
 =?utf-8?B?QnRaNGRhZUdsU1pDK1hjT2tpUXRzNmc1VEY4MElMZk0yZkZyWTdpMnhNKzR4?=
 =?utf-8?B?MldEV3RSUjEvYkp0b3hNNFFSdkd0RXlIVXdiWHVsRHE5UjhweVlMcWZYM2to?=
 =?utf-8?B?Z2hzQkp3SWRXMWdBU3Y0eXJta04zaXltOVJZd3JOUk9hVGN0d3Y5VG4xY3NU?=
 =?utf-8?B?RHVKVDVOaEdkNStXSzVReEZ2ZG9hcWRjQUJTWXlNWVN5Y1dpcXE3TW8xTjIr?=
 =?utf-8?B?U1MzOEZTU0FYNmQ4Q0s1N09RemJkYzhPRnFQTTY5V0pRbGR0c3BaK1Y3TVlh?=
 =?utf-8?B?a3FKZHhKZkJZcnQwTTl1VFFBUDFuekxxdXJwZnZ1QXFDWCszTGV4OEdCV3VG?=
 =?utf-8?B?ZlRxTGhsTG5DU3F0amVlVEZlQ05EVk5qdFNKMTNRWTN1R21xTmtNZTB5eFp3?=
 =?utf-8?B?dEM5WmRTQUNyVzdYOGpnY0hUdW90cGxqNlZia1pIUU9QdnJGbUkxa0krYm1t?=
 =?utf-8?B?b3VyUnBYZlR4cERVQldQVklCM2dQS3JHVHlmKy8wZnRqbCt4dzhabDlGMkh3?=
 =?utf-8?B?RkhCS1FsQUl5WjYxVDV2RzZNL2pRQlZLVDZvOXA2dWZwUUxRWEZBZS9UYnNW?=
 =?utf-8?B?bndtcWgwMVNIVE04UHNhZGR6RHkva2V0U21kL3ZkdXVpQksrMXd1dDhrQWxw?=
 =?utf-8?B?SHRsbFNsbCt1d1RvYkJtVjZON29ENy96azY0MjArQUFnN28yL1Z2L0xjcnRB?=
 =?utf-8?B?UmZMV05QZFJhWDdrbzd5bWJOeDZyWlgrNWUvaXJiVng0TnpnazlHMGFyY3pM?=
 =?utf-8?B?QkVmeU83MW9yWExzZHBOZTRMVEJtd0dXRkpPVGZKU0pBUVhJTk16dnBxVnBW?=
 =?utf-8?B?a3FSL0ZkRWpQdkdoS1VVTC9sekp3Q2FDbndYRUEzTTlsajh5SnppSWsxSHdM?=
 =?utf-8?B?Szcxb2JJajk1ZHRwV2xXcFc2RDNlYXBZUDFCVnE0RUVJYVFwenhYYUhJN2Np?=
 =?utf-8?B?bVJySk80bm1YbHhzOUIvWCt3cTNaK2x2aEpZVXZNTGdGVmxDamlFdS91N3U4?=
 =?utf-8?B?c1N5SG94UVoxVmZFQ1YvZWZlZEV1NUtYSEx5amJNYXZxWU1ockx3amE4WHNN?=
 =?utf-8?B?Njlwa2JnaW5iR29XNytxM0NpZE5SVTR5Z3pYN1lVK2I0QjE2ZE1lNWZGblpz?=
 =?utf-8?B?T3hMTFNqMitkV0RQK3EzQ0ZMZGFha01QWUNNc2NEb2RISmZDTUh4Mkt3cmd5?=
 =?utf-8?B?RWxtVzZpYitrMzRCUCtvZnZhZEN2dW53V1R6RVd2SDVvRStGelYzb05CcXlT?=
 =?utf-8?B?Q0pqNVpyVXBJdXo0OHRER0RuMVhwR2lEUCtoUDh6N1p0bjZoUFFZVWNOYm1i?=
 =?utf-8?B?UUFiQXJISGt1RE55ZTFBcERVMys1REQzREh4dXpqMFArRHRTOTZ2WnBFVWpY?=
 =?utf-8?B?YndFRVQrZFYrTDh5M0tROHR1SElBS1h2VHhlVmhnUnNtcVFkYWxaQWMwc09Z?=
 =?utf-8?B?Sk5iZEtPOXVGWC9kNU5aT29rMHNxZTdBK29vdGxVTTdpZWtCTVpDUDJUdlpK?=
 =?utf-8?B?VENsanVqN29hVnZGZDFiaGNmdTlKcTRqVG13b2ltUW1raUI4TlIxVTkyWDgy?=
 =?utf-8?B?bzRDc0RRd1hyM1J1OWxaWGlhZGpRb0pGZnErQ00xMEVYYWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjFXRUw2aGdBQmtRUFI2eTZGbkp1SmJFNXZvakZOVG0xZ044R00rU01hUTlr?=
 =?utf-8?B?SktRMWVxdGFDSTFnWUxXN3dkaEx3WUFZZlJIblcrSlhteDk3TVltYW9VMEo2?=
 =?utf-8?B?U0JaTEk5Q0tkRnlyR0FqVkFWMEEyN2M2bFBRTVhwV3Vma2FLQlhhSWpoSnJa?=
 =?utf-8?B?NVZHOGY4MW96OEs2TytmSGJKdWY2SEhkOGtHUHNRdXg0L3hWN2QvaWViMzdE?=
 =?utf-8?B?Q1RZOGMzeUUyTWhrYzNRRHBMK2l5cU9TTjE5V0JBTkxzdEptZ3IybkZxK0Uy?=
 =?utf-8?B?UldYOXZPVzRmeHZ5NURrWVF0cVp6V08zM2FocFIxU2xYUmR2SEY3VXY4K0l3?=
 =?utf-8?B?MGNuWkRxYmJmVEJDMitCWEF6bXFzczJlTi9kTDgvTXQrSExTaEdzVlRzU3hh?=
 =?utf-8?B?MWVGQkdIUzFHY0Y3dVFoWEY4NHRWNDhPc3RFVDVCL2x3cU14Z3BKTUNMNFVn?=
 =?utf-8?B?QmE4VmFyRnUrUVQvejkrK0pFZW11RFBpMWxwUWFGbEFNSEcwWE1ldUNjejhv?=
 =?utf-8?B?SklCQ1NrY3NSeUtUSmxndHRzU2lVb3N1TjBzL0d2Wk1RcXVzbnZuNy9SdUh5?=
 =?utf-8?B?eVBlTXc0T0FVb1VMa1ExRU9Fc0wvcTkvMmxJRHA4dDR5clFTa1pNd3VYVW1w?=
 =?utf-8?B?eWxjdTRVT2orNmE3ZTB1Wk1JWlNseDJxMkFKaWJndEI2TkdnY28xMzNWbmJr?=
 =?utf-8?B?bzA2UDBHeWsvWmpHa2pHaUExRHZMT2hTTWFrcTJMWU5pcnhMbXJNbzFsUmNO?=
 =?utf-8?B?ajJKQzBXb2paMEcrc3ArNzAxdnJoa0FWNm5iUktocWdMajdkbE9ZYnc4QlJP?=
 =?utf-8?B?VkdLalZqWklYYkk3bjdWeGc1amdIQWJ6cFFrTDRQQUk1RW5BZ0xKK01ETHFR?=
 =?utf-8?B?a0ZmSkhwdkdGazhPem1HSmtZRHkwaThWMlNNODlIRUdRazFrWGNNQW05cWJX?=
 =?utf-8?B?RVlNV1JHdFFHd2ZiQnpOeVFjQ2V5ZGhJVFhXWHk2WFE1bTEzcy9FSFd4Z3Fs?=
 =?utf-8?B?Zk8wek95ejhtdVMxeU1Ld0NVNEt4SVVEMVZzbTBZREwvYzBTWktJMTZtNDNE?=
 =?utf-8?B?TDJ2ZXRmMm9sUzNIUTRBOHJ5cWM2TU9ENXQzL2pDYmZqZzNrbkthNXFsYjl2?=
 =?utf-8?B?MlExWU1jL0FFOFdpczBYcUNudEVEYjdFRFpUWXVmTzRydGJLd2xCNU43SFhM?=
 =?utf-8?B?ZC9ESzBmYldlYVE1Zm5VMzJCeG5vTDQ2dEs3S09ZL3BKeGJRRkJNY0QwaW8z?=
 =?utf-8?B?dm5OYWdNRFlWVWRNYWtDeS9JeUVjN2xML2N2NWxtM2ZoWU5XSk9FUndIU2lr?=
 =?utf-8?B?YSt1QWwrRktwQjRBVmM2OUU4czFldUI4VDR3TFNhaVlEUk9NYTRWUFh2N2hk?=
 =?utf-8?B?emdaVFIySWpxSEk4OXZSVUtwV1lCdjlXVFZlVUpnQzU5U3VDQ0d2N0h6Z2po?=
 =?utf-8?B?eXMybGFId2diUVR5SUZOMk42SS81bWNmK0hwd1pJK292N3VHeEdRYmdyazQ4?=
 =?utf-8?B?cURDNEJVbW0wUUxVbG1RcVZCOVJMYXo4V2loMlZBR0huTm84UFlJRlZjOE8w?=
 =?utf-8?B?MmhHRnVMQmQ1STNBV3BiU0lGQ2krWmpPK0xqU0JURm50eTlnZUplb0pBSXZx?=
 =?utf-8?B?K0tXRFVoOVZZRzFQck1SbkR2RzZoZ1lNalVEOVJVekhJTk9DYjFOSUlNQWZv?=
 =?utf-8?B?ditabERraC9tdFNKUU0rem1WOW5LSzEyOVQ2YVR3Z0thbllWRWlaS3Bxa1Z0?=
 =?utf-8?B?U3k4dTVxcWdxbElwSUtBS2xQZFlXMUpxbWdRRDhCOUlML3BxN3VhbkNJa3RH?=
 =?utf-8?B?TEF0YVkzS0ZSU0dHVzNSLzZxMmFhL1EwMU42WXIyVDlxTkYyd3lwYWlpbUs2?=
 =?utf-8?B?dkR3L1NOelhrRWlsbmFvbmdSMjkzVnRKZzdSd2dwNGw5aUFWTzFjRFdFS2tx?=
 =?utf-8?B?MEpHZWV4R293UnR1alFYMkNQV0U0Y05wcjNtZENLajRFaTN4ZGJlYmtidDUw?=
 =?utf-8?B?dmZISDhEY1M1RElXci9BRHNSb2pKak0vUk5HOUhFREpDeW1hKzlUQjFhcEdG?=
 =?utf-8?B?Ti9la2todTRGQ1JhQnFxdDViNy9WZWtpRUNjdFQ2cW5sZnJ1L2RubEhjWi9w?=
 =?utf-8?B?WjhyQ3AvWndTL3MxN0JOL3dFUnhBUE9EK0RQSURpNldhUFViQ1VkV0hwZlRJ?=
 =?utf-8?B?ZEE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c439ce61-4d0b-4f65-5856-08dd17f1f87c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 01:36:57.9416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ms60uJhJrAJ6ZHwNSk/U+tKGBdmx/DYWNysEhKDW7oBS6le6l+WIcNl78DQY1MU9hiEb+d2POMW+/8WFFpnFqj5D+4EMNPj5DuFYMQ6tWQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_173705_526200_7873D888 
X-CRM114-Status: GOOD (  13.41  )
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
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Sunday, 8 December, 2024 10:26 PM
> To: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Rabara, Niravkumar L <niravkumar.l.rabara@intel.com>;
> devicetree@vger.kernel.org; Richard Weinberger <richard@nod.at>; Vignesh
> Raghavendra <vigneshr@ti.com>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v4] dt-bindings: mtd: cadence: convert cadence-nand-
> controller.txt to yaml
> 
> On Thu, Dec 05, 2024 at 11:22:09AM +0100, Miquel Raynal wrote:
> > On 05/12/2024 at 13:33:50 +08, niravkumar.l.rabara@intel.com wrote:
> >
> > > From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> > >
> > > Convert cadence-nand-controller.txt to yaml format.
> > > Update cadence-nand-controller.txt to cdns,hp-nfc.yaml in MAINTAINER
> file.
> > >
> > > Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> >
> > Looks good to me, but I'll wait for binding maintainers ack ofc.
> 
> There was one, but author ignored it.
> 
> Best regards,
> Krzysztof

My apologies, I forgot to include the 'Reviewed-by: Conor Dooley conor.dooley@microchip.com' tag that I received in the v3 patch. I will ensure this does not happen again.

Thanks,
Nirav
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
