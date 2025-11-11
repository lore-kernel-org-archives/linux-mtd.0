Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28FBCCFA18
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Nov 2025 07:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LGoPDE2FNxgGGuHpCtDdN2CoQL1eCeqTjoqpBH1hiVk=; b=BqDK148yNZOnzn
	Wle7ybrouyZVg7NFxjCaxY3WHe14WdsfVClK0eqGWDmQudKTLxXe/MOzoUL8N/RM+3WMzzwgyArdl
	D3vE9tmewlI+36dXBmjTr6tTOMCuONpB4LqO6ibCA6asr2Zrtaqn9Br6E09u5PRGr/LhpCGzNktlp
	jltz7BJvSXD5gbBa/meVryQTNa1BpihasEVHkaOgenTQQ3SvuK3eL8vZ8qKvLJdyWPykgAWsSV2Vj
	lfvSss9ppyzkHN+kCDaDE1Y1mFKR++yhiYsL/KXzIh9ldrMybNal/0oWXwnGOAD/YiG7PIfrBcRqQ
	vzSk7YDoeZbOrSpPVt7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiPG-00000006e1E-1GxG;
	Tue, 11 Nov 2025 07:03:10 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiPB-00000006dvU-0qGu
	for linux-mtd@lists.infradead.org;
	Tue, 11 Nov 2025 07:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762844585; x=1794380585;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OOoKwfE3gTN75rqpafcdUnGgAuhjn8yf2s7edWfcGSc=;
  b=Hj6WBGLhdmIu1jyHQ3Lcjz17mCAU6Z9iDTley23m/V+nYicDRN92nxEh
   KGN0uaJCcxsu+1Y/tCfI9pyHJlR3vdoFOqjvqXbs1mPqqShQI6cLoACby
   XeCLf1HJstJ1P3B7d826glcFM4RBugv8KzKCO4annt1Jv3Oq69tvx7wMv
   Il5o9Qg+cltV1zhkp2mKVDnz7r6ATaoR1gRoK8BDyIw5JgZjcbNTbmct0
   uatiBzwgWJwJTv7HJYMl6xt7NFoDtvIJ9k/bwnh743ZoRrXiqai8qiT+n
   5zzWr2V4KWFf+GdQIg6kvcJ0tlZz+Nf/TtH0b+mo+GXvcGcoQa9I6jXaO
   w==;
X-CSE-ConnectionGUID: soiyOekFR0iw4Rtrv5IfFw==
X-CSE-MsgGUID: 5EnGEMj9TLK5grXZlfsuYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75517836"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="75517836"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 23:03:01 -0800
X-CSE-ConnectionGUID: +3z3y9lhQXWn82Uj/zLrFw==
X-CSE-MsgGUID: GMGnkHxBQxCYsO4vw0CYvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="189325188"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 23:03:01 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 23:03:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 23:03:00 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 23:03:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYJx9I8RMMLPIFoNiAsz0JV3dyz7mzAZ7Qy7geFBjfXJm/Ggh2/BUFWoI/WyGJyVu5gfvipAGmJOboPC2191JIV/oYE6I+RYwZungZ/7pUo8soB4rLOK3iWOxEkId1QBXpQ4dJGQFpBz4ORik8XxAOcoH3IAujW9spBZdQB4ZbzA471Hkf4+LThVuHzC+K06VMH9/ZilUaxjKct2/JKCygtVZaADLIuO6M3fhV1l6B6uoRBo2jbx2nTt43kDBr/+xAMmIyBbyL5ozvrXk77ABpHqELOMJH92Y4ojDnWRcZZ2/UpK57FfWLJJZHXZYVFgLZvei0Xo3ZbQxiLtidca2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOoKwfE3gTN75rqpafcdUnGgAuhjn8yf2s7edWfcGSc=;
 b=xS33k45tVgm/qDiJk2TNgG7yTVsaE6LKgJFBKolsKarRNnq9L+bi93O5qXHCQes3500y30mHFa06aUmxt+E544+Wdxyfy0eP5x8lBuy5K6rZGNmo99Cl0D5PuKKfCARQFRQPap1vfe4FA2/QMzIaNBehtlnDTrbx0CrbKn2pRjMWTTjrpu9crhTGX4Yr1iJUh562Lio9tTHdBCDuPQ1P4tv+AMoO0PcqbMP6DdKbNfXCltC+Q0Di0ze8H+p4+mSqZ013lW8sag0wPdRD7T6syBkgZXX+E2/hId9bQ8YDh9pY51xlJXh31IJvUVTXktEuivkezCc2rBecg+h2SOVhHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DS7PR11MB7836.namprd11.prod.outlook.com (2603:10b6:8:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 07:02:58 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 07:02:58 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, Jani Nikula
	<jani.nikula@linux.intel.com>
CC: Jani Partanen <jiipee@sotapeli.fi>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: RE: Possible bug?
Thread-Topic: Possible bug?
Thread-Index: AQHcUkei6Lo1KS3V80GUCdJROfCGsLTr7REAgABI9gCAANZZEA==
Date: Tue, 11 Nov 2025 07:02:58 +0000
Message-ID: <CY5PR11MB636652A1A7F88249BD81047DEDCFA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi>
 <75a84e116f2f1120a02e8ff81ca5343621bd04fc@intel.com>
 <zh45kns66vc62eldccyoefrjtylkqpexns4hli2j7jqpwwhvzn@viqinx2he3il>
In-Reply-To: <zh45kns66vc62eldccyoefrjtylkqpexns4hli2j7jqpwwhvzn@viqinx2he3il>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DS7PR11MB7836:EE_
x-ms-office365-filtering-correlation-id: 22c303a5-68f5-4dfe-31ea-08de20f058d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?YU9ycEYrZ21tY2lCNEMxcGRDUFZrZE5qUStaR2lncWJJZUpkbEg5WGYzZUhl?=
 =?utf-8?B?TUxtY2gyS2g2VVRrcHdNUEFQMjc2VmIzMFhubC8xSnMyN1YveEVMSi9GaGpq?=
 =?utf-8?B?UEZBc2pzUFUycXAvSjdTam9EMUN3Z0RZSnlDOWU2Y29EeXFDL0ZvTk8vekZl?=
 =?utf-8?B?S2Y4b05ZOVZvc05kandHdHAvZjBuVjhkNzNJQ3lNQkN1QWNzS3l3OWExVmV2?=
 =?utf-8?B?VnV5K3hhWDlxUXdsT2hBVzAxdlNQVElMdjdpOUwrNmVXbW5MQlBVb1c0TEpR?=
 =?utf-8?B?VXlTNUlORDlHZG1kdk9CaHdDMERjRm43WDF0ZktVSzVRemF6bzloOURzQk9o?=
 =?utf-8?B?MFZVZ1BGaTlRUTR5b3ZhQkdRa3QxbmQxemNLeFZvajdmdGZWUUl6V2R0Mk0r?=
 =?utf-8?B?QmNFSjJqQm0yaFVyOW4wWSs4ODdDSmNQVmo2VlJCQmRXZk9zVnVwbTJKUjBa?=
 =?utf-8?B?dnd2YnNnUVE0Nko5Y1FReXBOeCsweVIxVWZ6aUlQVkpwNTE5UjQ3YTc4MVpp?=
 =?utf-8?B?S1BMSmdEWUlwYnJ0eFlhMnVhRGdPWXN3RlZLOG8wN3FYRVdESWFzUjJsTm1V?=
 =?utf-8?B?UHVLdkZGQmVvR09UM2kyS2xVL3ZCajF6RW5KbjVESTJiUlJEd0ZHWjc1Tld2?=
 =?utf-8?B?cmFjVkhIcDlXSTg0TFNXb3BZUVlTbGZKM1BpOEZtQUMvV1kxZ2I3RTVaTWVT?=
 =?utf-8?B?NmlnK0ZIMlVsR29iMXhBTTFJdURhaUtmQ1JHUEUyOHZuNEJrRUk0TDVQdVQr?=
 =?utf-8?B?VHpkeGlVd1lqdVZ6MnV0cWJIUU5WUVNxNFJ2NkgweW5BMEpYQlJnQWlRbzZF?=
 =?utf-8?B?REFGVGxCYU0vMDRCQXJqM1FTUFJVZEg5QS9qdE5LSVc5dG1MQUI4WDlpUG0w?=
 =?utf-8?B?clBHVHhUcnZqUG41enN4TVJxSlhNbWpXdHlSVzEydlR1d3ZlMHpaVWhKUlFL?=
 =?utf-8?B?Zk91NTVBdTlWR2RRQXREQUdVNGZQelpLQ3gvYkY5NDVOZ0xjcFRzajhHQnh1?=
 =?utf-8?B?UjM1blV3SmlwUm5hUFRyUzhUU0p4Znh4RDhWTmhOaVFSSS8xNVlDR2FzalZX?=
 =?utf-8?B?a0tQSDk3MUtYMFBjM2FYRnp3WGJkZ1NHSFcvemV3ak13ZVJycUU0bW5KbGkw?=
 =?utf-8?B?dHRYcmZiNzZPT2ZZRWkyUHR4cnIrOVdwRm84Tm4xOXEwMTFuNWhnbWc2S1VB?=
 =?utf-8?B?RDF3YTdTQ0hSS04wVnFFVkVZUmZQcklSWXlVS2l4SmR1TUNML1loajJrUysx?=
 =?utf-8?B?TFFTNXBPWnJGTXVyRis0dTV3anBTblRCS0daY3VKRHBmSHNuWUJFMXNmcFZn?=
 =?utf-8?B?aER1MEtsWXk3Sm5aZFJqRVRmQUM0b0ViclQ5dUR1VDU2aWF4dUdEcmlZV3Zi?=
 =?utf-8?B?WGhuSG8vc2RUUXhYRWM1VTFZWXlqVk9HTEZhdEh2eUVsZkl1b2NOdVJabXRa?=
 =?utf-8?B?cG9lQThzUSs0SzFXZXJjaHNiRzhvWGtuaWxXK0VGaVZ2V2x0WDJMeGI1V282?=
 =?utf-8?B?UnhMR1hTZHhOMGgrd1EwMXNOQkp4QlNCbysyS21NcFVrUTN4SkhPZThaL0pT?=
 =?utf-8?B?L3hRNkI3TDV3UEpVZ0g0akFrQ2tTUzVtanFwQTRSQUg2SGw4N2M2OVhEb01C?=
 =?utf-8?B?R2pXYXdzWGVHWDdZRE83elYrSHhFYTloUTlKaUhLQ2tkSzVpclVOamlTYitk?=
 =?utf-8?B?UDlVU0lwckU2bjdPamFPMzVhNE5ldXA2N3J1a3NVQ25kOExZYW1OVEh6SE1B?=
 =?utf-8?B?Y0tMMUNFbUdFaUlROHQwZGI2VHJZL0MzRXBRdHhoRHRDc2E1RDRodHNTeDFx?=
 =?utf-8?B?K2xkMTJTMWQ1ai9FVmpIc3RWOUVaYkNYVGJ0Wk8wQldPaGUrVmFCUVRlRzN1?=
 =?utf-8?B?bTNyMys2QXFkV09oM0FPejg5YXlRcWR6SHZPL2ovanFjalJhY2JkYjRyN0Zx?=
 =?utf-8?B?bE90UE9zZ0Z2YncxTmhkNTVmSFdqZnlXTG9XR05uVzA2ZkVqL3IvdHA1aDZM?=
 =?utf-8?B?RzB5bFNzdi81UlZ4M3RPRVNyM3VCQUZMek83Wjc2d2JCYUk2OTVXZTd2ek11?=
 =?utf-8?Q?sCA2Id?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzBoSGNUbmdZb3pHTUh3Qlo0dHBneWVzY0xkNjh3emFpNWFuL0lNWkFMTHIr?=
 =?utf-8?B?cGg3U05RWjArcDAvVzBxV1VsYUt1VS9OQnk0RFkrYWF0ZEJMMGpzRzlOU3hS?=
 =?utf-8?B?SHZJQkVNWHBQczE2eWRULzhFbGFvNVp3Mkg3c1MwcitjWEIxayt2WTk4cU04?=
 =?utf-8?B?NndRZGRDT2tFQllQWVBFSk9pVFlGRXRGK3M0RFNCRFp6TW1oeVJVVU5aKzlN?=
 =?utf-8?B?RDZQNmVxc0V0NW1Ja05yVTFESkY1cTdLUWdqeUtzOXZMVjY5b2Q0VXp5MHlB?=
 =?utf-8?B?WGdITk5Oa3BVWkNoUGk2My81QTNRQW11REcxeVdmcDJ1ai9Qd1NwY2tMdDNm?=
 =?utf-8?B?dUJZcDZOa2ZIK1g4Y2xiWVN1R2lrMS9FVWo2bHg4SGx2QVB3WnZIczlWS1l4?=
 =?utf-8?B?a0ZrWmJzQlE1UDRidDY2cFBueGUzaGhrMk15VlNzYmU4WGMzNmRqS0xMaG85?=
 =?utf-8?B?YVB1Z0w5M2ZkVml5R2FCRDVOd3I5SzI3aE92djAwQUQ1bXp6S2RHenRIdGJi?=
 =?utf-8?B?RWN2anpmSmpOWlFmd2F3VlJYL0ZMRGZ2L0NDeUtIb2pZcDVRcWw3ckFIa0U3?=
 =?utf-8?B?RFpBQ2llN1pmWFVyRVFyZXhMUzVvaFNuVGlTSlZuUzhTNHlJbkN0ZzhjZDU2?=
 =?utf-8?B?OWZNdHdybEhtKzFOV3RDazNpOWorMlBzQnJ5T3NYVmc5elFnN3Q0ZTdyQnJV?=
 =?utf-8?B?V3g4SWlNL0xGRURrbUs0RGNVY2NxV3h4L0lMdUgwaWNPZGljRzZ4NkZiSmgx?=
 =?utf-8?B?amNjMTd5bEFTdmJvYjVoL2xTQmhGSnU1VVJRamw1WXY1WXMrWldWUmRMZGU1?=
 =?utf-8?B?aVlZQzRINnZLbUZXeWdvYXBnc3NqT1FGd0VIMUtHb05nUFhnT3d4NmRHVnZO?=
 =?utf-8?B?SWFLcU0wRUtRem02bU0yUjFnYURoMlkvejYvS0hQUmtaRjV0ZXF2czlPQWlW?=
 =?utf-8?B?SzlJcXdZcjNBWFJPejU0RDgvWGtNVU05clRKYXZNNnRMY2R5VGNNQXJVWnFz?=
 =?utf-8?B?dWRvRGlJN1ZxdDBDM25ITHZOTWpDLzM0RENhYi9Rb0NIMnhVZWpiRityQXdv?=
 =?utf-8?B?ZkthellmZFRLOHFKUVZYbTMxMXJRaUJGUmtIcjErUHNlUEppYnJkaHEvSnFo?=
 =?utf-8?B?WlZQTUpJaWMrQ0VlU1FtbTViN1ZyRXBsRmZIZHdEbTFlZkFOOXdVOU43V1RL?=
 =?utf-8?B?WXIxcDNKclNLSGs3anBhWFdTRVdWaHZNNEZWQVBHeHkwQ3JnMXFZUWRjNVB6?=
 =?utf-8?B?WmdjR2dZRkNYN2FqTWZ4akovUEpWbitDTW1vVDVtd0hoQlBKRGhYMU8zM0ps?=
 =?utf-8?B?Tk44b3VwQnpzMDlVVGlINm01SEFURmR6bVNNSlFDMlRySjNMTHBxSFZlcUhv?=
 =?utf-8?B?TDZnUjR3UmZkdmdYVnNoeWM1QmhoWGVjbTZibzRkWHdCbzRuOWQyeVVvU244?=
 =?utf-8?B?RDZEcnJ2OEFYb0tIdkN3R2FHYm8yc3VYK201cFA1M2dsdS9wQ0FsSFR0ZGdx?=
 =?utf-8?B?dXhhdXNQVWpCTXVYZWhEMm0wQmJWL0NSVWpoT01UREJFalk1TS9ITmNxMXN1?=
 =?utf-8?B?YjZXMWxZdWg0TlowQU9pTjRTWll2TVR5M2tRYVgweEdxYk91N0V5a2ZmL0R5?=
 =?utf-8?B?QTRxeENvK1ZseVZkUUVUcG5sendvMzVKNGo0bWVoeXlNRzlYZXhlZ1VGMlpv?=
 =?utf-8?B?U3NRdUVWSmpucWkxNW1OdS9kSndYYmNmaVhQN1NKNnBmVmpZL3ZiN09MVnlO?=
 =?utf-8?B?OGpLQVVMOUV1ZVpjU05kelN2c1JjbSt2alBZR0hPMm1BK292ODB4Tnhla0xw?=
 =?utf-8?B?c3dUUjZWenNPejNtVVYwV1JUY0gvVkxsaUhNWHYzTnlhczU3NXJ2MnFpd1Bi?=
 =?utf-8?B?b2N6a0RtVFJ3enBkVmRTdXhnVFhlaFUrWWZxWlM0NVgzNXIxVXhQWTNMdm1W?=
 =?utf-8?B?NW5WRS9qbzROdXJVZ3MwZlpMZWpwcXUrQjVjdUNyYmUxUzZHUjlTNGxJaEVy?=
 =?utf-8?B?NkRqblBrTllSTDhINkRKT2s3Yi9hUkNScTBtYXNIQVNSZ2p4UFpQNjZWclBN?=
 =?utf-8?B?WVI2YkwxSGNQOGFLRjkvbTJONVdCVEt6b0NVejFycFBwWnBQU0lxSk9pbHEy?=
 =?utf-8?B?YUdRSU11SDhzVmZkTDg4Rk40QjN6c3B6T2J1VGR5dHdjYllhZjVoeE9OVEZW?=
 =?utf-8?B?cEE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c303a5-68f5-4dfe-31ea-08de20f058d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 07:02:58.7073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xd4/rCnhfpjk/w5ai1BRB+hPOpINWro4Z/r7hspIbKtq9xhVMJ8aU5C7wY/MyBquNoDaKHwTQu5DvXKcquvhb4SXqRzBEg/gkdNhZoHNmis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7836
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_230305_264473_4FBE4FC1 
X-CRM114-Status: GOOD (  22.04  )
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

PiBPbiBNb24sIE5vdiAxMCwgMjAyNSBhdCAwMzo0OToyMFBNICswMjAwLCBKYW5pIE5pa3VsYSB3
cm90ZToNCj4gPk9uIFN1biwgMDkgTm92IDIwMjUsIEphbmkgUGFydGFuZW4gPGppaXBlZUBzb3Rh
cGVsaS5maT4gd3JvdGU6DQo+ID4+IEhlbGxvLCBJIGp1c3QgZ290IEludGVsIEFyYyBCNTcwLiBJ
dCBzZWVtcyB0byB3b3JrIGZpbmUgYnV0IGV2ZXJ5IGJvb3QgSQ0KPiA+PiBnZXQgdGhpcyBpbiBk
bWVzZzoNCj4gPj4NCj4gPj4gW8KgIDM0Mi44NjU5NDRdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUg
XS0tLS0tLS0tLS0tLQ0KPiA+PiBbwqAgMzQyLjg2NTk1MF0gVUJTQU46IGFycmF5LWluZGV4LW91
dC1vZi1ib3VuZHMgaW4NCj4gPj4gZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRfaW50ZWxfZGcuYzo3
NTA6MTUNCj4gPj4gW8KgIDM0Mi44NjU5NTRdIGluZGV4IDAgaXMgb3V0IG9mIHJhbmdlIGZvciB0
eXBlICc8dW5rbm93bj4gWypdJw0KPiA+DQo+ID5DYzogQWxleGFuZGVyIGFuZCBsaW51eC1tdGQu
DQo+ID4NCj4gPkl0J3MgcHJvYmFibHkgZHVlIHRvIHN0cnVjdCBpbnRlbF9kZ19udm0gcmVnaW9u
c1tdIG1lbWJlciBiZWluZw0KPiA+X19jb3VudGVkX2J5KG5yZWdpb25zKSBidXQgcmVnaW9uc1td
IGlzIGluZGV4ZWQgYmVmb3JlIG5yZWdpb25zIGhhcyBiZWVuDQo+ID5pbml0aWFsaXplZC4NCj4g
DQo+IHllYWguLi4gYW5kIHdlIHNob3VsZG4ndCBzaWxlbnRseSBjb250aW51ZSBoaWRpbmcgdGhl
IEVOT01FTS4uLiBTYXNoYSwNCj4gc29tZXRoaW5nIGxpa2UgdGhpcz8NCj4gDQoNCkluIGdlbmVy
YWwsIGxvb2tzIGdvb2QgZm9yIG1lLCBidXQgSSBzZWUgdGhhdCB3ZSBjYW4gZmlsbCBsZXNzIGVu
dHJpZXMgYmVjYXVzZSBvZg0KICAgICAgICAgICAgICAgIGlmICghaW52bS0+cmVnaW9uc1tpXS5u
YW1lKQ0KICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQoNCkxldCdzIGxlYXZlICdu
dm0tPm5yZWdpb25zID0gbjsnIGluIHBsYWNlLCBvbmx5IG5lZWQgdG8gZml4IHRoZSBjb21tZW50
Lg0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQo+IEx1Y2FzIERlIE1hcmNoaQ0KPiANCj4gLS0t
LQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRfaW50ZWxfZGcuYw0KPiBi
L2RyaXZlcnMvbXRkL2RldmljZXMvbXRkX2ludGVsX2RnLmMNCj4gaW5kZXggYjQzOGVlNWFhY2Mz
NC4uMTE0ZTY5MTM1YjhkOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRf
aW50ZWxfZGcuYw0KPiArKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL210ZF9pbnRlbF9kZy5jDQo+
IEBAIC03MzgsNiArNzM4LDcgQEAgc3RhdGljIGludCBpbnRlbF9kZ19tdGRfcHJvYmUoc3RydWN0
IGF1eGlsaWFyeV9kZXZpY2UNCj4gKmF1eF9kZXYsDQo+IA0KPiAgIAlrcmVmX2luaXQoJm52bS0+
cmVmY250KTsNCj4gICAJbXV0ZXhfaW5pdCgmbnZtLT5sb2NrKTsNCj4gKwludm0tPm5yZWdpb25z
ID0gbnJlZ2lvbnM7DQo+IA0KPiAgIAlmb3IgKG4gPSAwLCBpID0gMDsgaSA8IElOVEVMX0RHX05W
TV9SRUdJT05TOyBpKyspIHsNCj4gICAJCWlmICghaW52bS0+cmVnaW9uc1tpXS5uYW1lKQ0KPiBA
QCAtNzQ1LDEzICs3NDYsMTUgQEAgc3RhdGljIGludCBpbnRlbF9kZ19tdGRfcHJvYmUoc3RydWN0
DQo+IGF1eGlsaWFyeV9kZXZpY2UgKmF1eF9kZXYsDQo+IA0KPiAgIAkJY2hhciAqbmFtZSA9IGth
c3ByaW50ZihHRlBfS0VSTkVMLCAiJXMuJXMiLA0KPiAgIAkJCQkgICAgICAgZGV2X25hbWUoJmF1
eF9kZXYtPmRldiksIGludm0tDQo+ID5yZWdpb25zW2ldLm5hbWUpOw0KPiAtCQlpZiAoIW5hbWUp
DQo+IC0JCQljb250aW51ZTsNCj4gKwkJaWYgKCFuYW1lKSB7DQo+ICsJCQlyZXQgPSAtRU5PTUVN
Ow0KPiArCQkJZ290byBlcnI7DQo+ICsJCX0NCj4gKw0KPiAgIAkJbnZtLT5yZWdpb25zW25dLm5h
bWUgPSBuYW1lOw0KPiAgIAkJbnZtLT5yZWdpb25zW25dLmlkID0gaTsNCj4gICAJCW4rKzsNCj4g
ICAJfQ0KPiAtCW52bS0+bnJlZ2lvbnMgPSBuOyAvKiBpbiBjYXNlIHdoZXJlIGthc3ByaW50ZiBm
YWlsICovDQo+IA0KPiAgIAludm0tPmJhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2aWNl
LCAmaW52bS0+YmFyKTsNCj4gICAJaWYgKElTX0VSUihudm0tPmJhc2UpKSB7DQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
