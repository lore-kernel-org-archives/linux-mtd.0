Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB41AC02194
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBoWvwKpytOrXzngJORo0Juyegk4vzjtdIXLBD++9EU=; b=Mp/iJB5/3a75Mu
	Tle0T/L1vDJkw1vFkN6ZhcQDTjpiD8uioiziT2K1puLDSuK29cD2bruAt5ew6tg1YuOXj8oFoVn7a
	r3zFAUdK1XipDgOshhXaVbqutJHYQ1VZ7jasdXOF2S3LK0MkYNPc/EHSQ2TepumVsot5P09o6igzL
	CgdA3HRFI4TiZa2QM8loEVNOzXmHm8qRU1LJrIymn1FyIUu4b5k1kQaG8dJzKfBfKhUleen32PXRO
	8URHZeaKtZIXKckbEu8WclNGWRMhfW3XVPoBXhGaPuLMD0FVSqkbdNskv4geh48E4n9rtnHx5Ovod
	l2Xwfg/XdYkcuH1ECX6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGQP-00000000BJn-0H41;
	Tue, 04 Feb 2025 10:45:01 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGP6-00000000BCH-1YGd
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 10:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738665821; x=1770201821;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=W9/bbpxxOXaf576h7rqF2N+FXx0J10Q0miyLwzK0VCM=;
  b=lbfycDxDlEu/k+Q8+8RKmDXsUQfdkHNbUATAkpzNs/U2hqFc+wUFEt1I
   Jmsc6ieqlHFJGT1gYhfQ5kBEyRbl+GFHhXifDRK4txS+w8VnPbbi56INC
   8jWDG9MbA8j3MVI4OqG7V3zsSbMtbtry/rrmzywR7dFzXtkpScvGLmWLA
   8TvUCXMLKITR8AoIBZkQzYAgBePDleblWX2X+/XgSfihsxzGxDSF2bxL8
   rHKGlnlZqnrQMD9U8D6HfuFl7gfjSQPl4/xPPQSd/lwSWWT/SMy37INZf
   f95arEMxRss1JgL0OMIj9tVG/NJwvFGj7a2RvzTcKUgVDhwZwVWT5eCsZ
   A==;
X-CSE-ConnectionGUID: N6zHF6kqSF6RGGleHH13Ag==
X-CSE-MsgGUID: 0cAy1CcVQl+GXm4EbRy3Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50181209"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="50181209"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 02:43:38 -0800
X-CSE-ConnectionGUID: TlNT/kNVQLS3dIwRrwnkWQ==
X-CSE-MsgGUID: edwSLEiTRCC1dNXCg628hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="141445225"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2025 02:43:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 02:43:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 02:43:36 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 02:43:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2Oty9Fichv3OIsyqhpyC6eqU9ouabwTaSm19+LcyFBMVq0rUxGFasfIZIcfFUNl+/zB5/gXk6RI4rwndBZOmjiuq3SiTgH1x7VL53ViTJPFafnCiMUQPog6/k2LPCtlRSr21QxJZxIgeFmSOTYgra3RMkiEeIzM3e6ulkU+XjMswSkjP/E/cW6mBbAKKJh+MYnPaotjd0+pxeZi6oIRadmZGpT64zVPtJ+k5lqRzP/EKZp3DLQBBGLk2Bx/9YhdbmAbIoCYrjj6mgqyNT8L2yNFh+9J15geibr1LYGss2IOBH0mvjrIQQXLKpq2WGpuJ2+F6obeJ8fGb82hDFlBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9/bbpxxOXaf576h7rqF2N+FXx0J10Q0miyLwzK0VCM=;
 b=IjJMxLSFnUQNabEdrglFpk9qgC7BLxVtIkYyGjhdQI+Nd9RWgOXDMwFDBvSERid5uw8zBjreqCfvQTllal9M+tMrYXfdmPWzN//VJ/5QQC/w75+5u4AqfiZmydV2aNwiMI7J8FmFdOD80c2zolMRAFQhjeOc9XtqfnZO47Q3UcIdem7PazKeVpW43nuaAr09MH1nrHTENDIgR6WDj70XoCP+Hq7QN2KIBdErgDVNA2teElbq0ea+FCQV6ewp+sbymkWjhQBvDk+Yk6/NtmIYOlLUutbylcdM8T8AgYVlmvI0WaSB+mKbCFwpPF9jecZH/56V+Lq6ZBY43bf2qT6K8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 by SJ2PR11MB8469.namprd11.prod.outlook.com (2603:10b6:a03:57b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 10:43:20 +0000
Received: from BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f]) by BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f%4]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 10:43:20 +0000
From: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, "linux@treblig.org" <linux@treblig.org>, Shen Lichuan
	<shenlichuan@vivo.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob when
 DMA is not ready
Thread-Topic: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob when
 DMA is not ready
Thread-Index: AQHbZ8ZOILCVzRcq3EiB9N8/dGJ/ZLMhBMtugAlQtQCAA0UcDoAA++LggADu3AKAB1OZ0IAAI5krgAAWHVA=
Date: Tue, 4 Feb 2025 10:43:20 +0000
Message-ID: <BL3PR11MB6532369D14375CC94AA2714BA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-2-niravkumar.l.rabara@intel.com>
	<87plkgpk8k.fsf@bootlin.com>
	<BL3PR11MB653276DFD3339ADAADC70CCFA2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
	<874j1i0wfq.fsf@bootlin.com>
	<BL3PR11MB65321B556C59C995DC05C70AA2E92@BL3PR11MB6532.namprd11.prod.outlook.com>
	<87msf8z5uu.fsf@bootlin.com>
	<BL3PR11MB6532451B44E7C5D82F5EC4AFA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
 <87o6zi83se.fsf@bootlin.com>
In-Reply-To: <87o6zi83se.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6532:EE_|SJ2PR11MB8469:EE_
x-ms-office365-filtering-correlation-id: 0aa930e3-c54d-425c-3644-08dd4508bddb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SzRjN0dPVW1LQjh2YnVNQUhqdkNtR3grS1NlWjFYYnF0a25YUU1IaW84ZTR0?=
 =?utf-8?B?NHdiUy9NalAwbWUxcW9QSjNQYlJMNzIwM2t6UEZsS2hXMnM1OFgrVnpVS1c3?=
 =?utf-8?B?WktJYWVMTDhndUNuZjk5d0tNRG9QektiODRuTTIxVUJEUDFOaWxxUlNyNkgy?=
 =?utf-8?B?MCtPVDdMcnp6VWY3NGdyZTV0dzFzMXJ3ZEhIcTg1d2RkVHVsamUvSGsvTW96?=
 =?utf-8?B?T1RraHdIVFBtM0xuSS9GcFYzSFBsdFJXMEowTG5EYWxjWTg0VVlheXNzRGJU?=
 =?utf-8?B?Wk5kd3RySDh3MStnZGdIUXBQTXFucW9KaHFKWGtsN2NoZFd2ejhGUHlweGVh?=
 =?utf-8?B?bmoxMkQzdEJGRmR0cWRJT2dxcDEyNSt1SXUxbVU0azJ6WERGY2JSRWJYak9o?=
 =?utf-8?B?VEZEUlBMRzZhN0JuZ0ExaENrSlFpUjNYTlVlallydGlIZUFZRFZSUFNMUll4?=
 =?utf-8?B?U3A5c3NCaFN1RHIvbzIrN05zVkJ3VTZESUVoT2ZvRE9JbXFtdHFKbTNseXQz?=
 =?utf-8?B?cS8yc0QxNlRxZENWU0owRlZWRTFlckNqMXVYd2Z4V25lNmJrcTFSQWFzM2l6?=
 =?utf-8?B?QmxWdDczVmRYaGc1VDlYZVIyK3lQZExScUhtWDV3ZmZaYXJPYm8wak9CU2Vw?=
 =?utf-8?B?VHoxeFFDWEVCNjM0SVg5czU0TFRqc0ptMWEzbEZLZHRidS9iRFZMdjJRR2c2?=
 =?utf-8?B?VjhueTZleER5MGF4VGlQd3ZoSWNYZE43ZjlsT3ZnVlZISW0wN2NWOVUyTjBl?=
 =?utf-8?B?RWpGbUtBclFBY1dJQlNveE9kWlFvNVhRS1pQTzFpanZwcDY4M1hwVFlOV3JL?=
 =?utf-8?B?M3I5dmVkOTcxWi9oSGtEazlNNHdYdnFJd3hacE5yYkpXK3o5QmdNcmtZWGU0?=
 =?utf-8?B?eVhtdkxBcldUZWVsczBzang0b2loTW9TQzFwMFpEcnR3OEQxU3BNV0NHL1B6?=
 =?utf-8?B?UkFueTZsb3dZNG5XZzVZRVRadDRiMi8zN3F2eHVIT200TGxTbGxmR21nYVlW?=
 =?utf-8?B?T1dzV3NjWU1MUmg4MTRBakJLNzFXK1BEeitkVVpmSTllMHVhZjBqUE1tUlVt?=
 =?utf-8?B?UGNITG5VTDlTV0FtSnJZR2I0ZDFvVy9uT2dyRnRnOHlBNGMrem92cjIvL0pv?=
 =?utf-8?B?RVNmTzJ2QzlzUEhxSSszNmtXeTltK2dVRktsMlZEd1RWbndhbWFyNWxxRytK?=
 =?utf-8?B?WkR4b2FlZEtsZU9EeWsycU1xTDhFWXg0dTlvLzl2MUExWjNiOEVqcitlQzhy?=
 =?utf-8?B?RGR4ZzB3L3V3dGhPUDlXb2pKTWtMQm4yWm1rdUxubkpoM24yQkgxb0VDTWMy?=
 =?utf-8?B?UVQvS0t1Q25Dd2RkWVYwRFZvb1g3WE1KT2JOYkRycGpYTm8wT1p5S3BjWlZF?=
 =?utf-8?B?aC8veUtBaCtUSTFROHc2RnBPYVo3NEZJWWRiOGdJbFFtWlpxeFMvNjV0L1Ez?=
 =?utf-8?B?S3lqKzBDWmZ5WjJTMFdNaGRBdzhjbW90aURHY0Zyd0xnQkVaekxqWmJzOWs1?=
 =?utf-8?B?Nkg4RlRFZ0R1VmhtT3cyWmUrcWNNc3d5OUZhdGhtMXdhcVFVcXBoRGFPZEJz?=
 =?utf-8?B?cmoxbXMyTDNMT3RxNTRwanlCNzlqVG5OUFkvblo4WkRFUlp2dWFVVFFnalVn?=
 =?utf-8?B?di96elZjU05MUnJCc1E1by95VE04eFB6TUZwUjhUY09MQUl6eFhTRDdSdWRM?=
 =?utf-8?B?NnNCSkgxRVpITXRrMUhHZTRaWXFNL08rVVJLWlR1QWJmaFcyWC9VaExONWxW?=
 =?utf-8?B?WjR3eXZTcmhzUHk4ZmZaT0c2a25QT3VUOTRicVlIWUhjSitNaStFTzk2bS9a?=
 =?utf-8?B?U3d0MTducVU0MlBoSXM5eWprRU54TWJDakVQYXMySmRCak5jUWlwUzVPSHdK?=
 =?utf-8?Q?UqqkmSsuZjB8X?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmtyWHlPcnNZdmJYTkJ1eC8yRFAwMXkwUW8yblFGb0RDZm41akdrR0xwRE9k?=
 =?utf-8?B?ZFZkZUh5cndSRDlMWmhkVFpuSWY2OFVMNkdvZ2RvcVB2K0I3ZWVMYmR2ZjlY?=
 =?utf-8?B?YjhxYi9jWERoWWtxRE9HQUN3YWVyMVBkN0FPaVk1SC9aZEFoY1ZwMVU2OHRC?=
 =?utf-8?B?dGVWRHlIemV4MU9nQ2MxRUpBZ1hRSjdnRFN5Y2h5em03bUhMSVdvZmVzNVBV?=
 =?utf-8?B?b09RejlnWjU3MURsL3dHNHpCTzFtSGdiNVR2M2NmZFR3RE5CNTc3eVN2MSs0?=
 =?utf-8?B?L1BUSGhzSDVmOE10K3lVZzNneVJGa1NsRlpTU2tqQ0JCM2xOcEdmVmZXZ25H?=
 =?utf-8?B?dGs2T3ZFbWt0d0o5T1dGVHhUaWVUMGlVV0J4WHBOcGVrZkRFMHEya3A3M202?=
 =?utf-8?B?YzZ1K2J3aEJaTDVlNTBqVXFyMnVXTjZtaFhCbWkrSkRXM0lQZGxURWVwSVlB?=
 =?utf-8?B?dFNKbXR3bWJId1lnYmlId25aejk2MFBDeFE3VkJ5RlNPR2U1Ti9uaEN3THg3?=
 =?utf-8?B?bGl3UXpITWxOQnZiY2hjVUdCL3FUc04xdzJOSFhBNDMrL2wvSnUvbVYrN2tY?=
 =?utf-8?B?V3dpVDNKTEFLRWg5cmlNeE9RRmZvWFMxWEhxMk5iTWdnSmtyem1Cb2NscnNI?=
 =?utf-8?B?blBwOW5MejdaYUdjOXEveklWbzRmVnRuR2UyWmZ1NHMrSzEwOHF5Sy9Nb0xB?=
 =?utf-8?B?ZG03Q3I5MlRUZ3Uzd09YT0N2WUZIdHVsRTdTaEVpaUNUdTh0OE5XWGdxYjZi?=
 =?utf-8?B?WGh5N1VLa1BiV0pPT1FnSzJsWDdleURSSklERmozd3RTaFlLbFN2UkF4NUY0?=
 =?utf-8?B?bWxzdkNIUENxQWlkYVRJcjRKYk9GT3VMSTM1NU5KMWxxellta2RyRERKcmgr?=
 =?utf-8?B?U1p1OFdiWk1zbEhDY203OFJoaW54b01KSzFUTS9Oam9VZk9zZ3I1UW5GWWJZ?=
 =?utf-8?B?RGZzZmQ5cW1vdW8vbjlmSEJWRXNScFJwbGNZV3V6Rk96R0RyL0NWcVZabUxP?=
 =?utf-8?B?QlR2SkFsSENDS25Wa3hKOVhTZWowMVF5NGg2MUZ0K2F1bjFOOXk5Lzk5U2FU?=
 =?utf-8?B?UEVuWjRPRTcrRHVScHcwQU1nRk82QzVOZ3h5RmNkVjJxYVFSSStJV0IrMEh0?=
 =?utf-8?B?ek55RW9TOVJoUmFJcWY2d28rQjI1azZkZHR1dmlROEEyM3l2ZXVDODBvZlQ1?=
 =?utf-8?B?RFlxUGNGMnM4NzB2VkU4c0lSYnJyTFgybFNsSUZ2KzZtSGtaZTVSZFRFUDFp?=
 =?utf-8?B?K2VtNjk0dzBHZVF5ckZzcnVCbU1HY3g4aUc0MURGdDNSUEd6Q3lSWWFQTkt5?=
 =?utf-8?B?WFUxTjVuYkVaVXBhVXZhL2Z0cWhQSUpTTnRWYUJ2S1JPK3ZyYWloS05IcFRV?=
 =?utf-8?B?NjdEUFZrd3MxTlJKMk5sVEM4L1JpR1ZtQVRoT1FpNUxoWitydG1SaDloeldQ?=
 =?utf-8?B?aXZ6Z1lydzFaSWIyUkxkRWhOak1HcjUzcUlveUxhZWJnbzJkZmpMRStDQUZQ?=
 =?utf-8?B?aFlPdFBIQXRhcmpOVm5mVm9TTTZyMk9CaUZKVS92dlZBS1dQSDVyWDROZ29E?=
 =?utf-8?B?eHNCMHBDazF0UGQxa3llRXd0VCs1Qll6Vi9zZjdLQ00wQ05IWHRpOWJFYnU3?=
 =?utf-8?B?ZkY1bmZmYTBxa1djYzBnc0FmVmRNTW03YmZWM2JCaGVXZGZKUGJEcGNSTndN?=
 =?utf-8?B?MExyM1MwSHc0NmFxL1VPalpGTER5QXhYSGdHQXNIWWxNbVFySGlveFFNS1dY?=
 =?utf-8?B?b21FbTF5M2pSbXZDZk9sOTVVTEJJWkt4RzZzSnYwRmhZNC9aTFR3WWtIbzFR?=
 =?utf-8?B?TE9zQWpwRXQxbUp4NElkdUZ4OHBiU2dLaFVWZnVYTkVpUVpOTEg0cEN4MDR2?=
 =?utf-8?B?emtlT3NNT2J6Z1VZRWRJVXMra3lmeUtkM1oxK1lqRWZpSTR0ZWtHWllhb2hD?=
 =?utf-8?B?MElMc0JzbkQ5Z0NQU3dyeDVUQUx3R2tvdVBGRFA1ZER3MXFSZmNNK1lGUGxp?=
 =?utf-8?B?cXJhNEY1dVR4V00zbzlsOXVFSkZhR2NOOVNwOFhpZWxCUHJLY3hDVDZDdjBD?=
 =?utf-8?B?WmlpOUdmcFh3a0M2Z3k1L3p2a1o1dkVYNGFPN1pqYy8yemxJVTlaWHRrOHlk?=
 =?utf-8?B?cHVZZnIyUVlPU1JLY2Eybmp6RmcxMFo5b3NFemxWRWJMdy9aam5aNDVnTXVw?=
 =?utf-8?B?cWc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa930e3-c54d-425c-3644-08dd4508bddb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 10:43:20.3372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h3VTJP9mx2VJN+M2jy6F59EQicArq3AuPat1KNUdnoMQyUzJjnCFmtKzoChBipEc3Xwh+EYt3xUsQPvIj+K7fxTvOaWXeFRiocga2OagLOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8469
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_024340_510761_61C7CC8D 
X-CRM114-Status: GOOD (  14.72  )
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

Hi Miquel,

> -----Original Message-----
> From: Miquel Raynal <miquel.raynal@bootlin.com>
> Sent: Tuesday, 4 February, 2025 5:20 PM
> To: Rabara, Niravkumar L <niravkumar.l.rabara@intel.com>
> Cc: Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
> <vigneshr@ti.com>; linux@treblig.org; Shen Lichuan <shenlichuan@vivo.com>;
> Jinjie Ruan <ruanjinjie@huawei.com>; u.kleine-koenig@baylibre.com; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org; stable@vger.kernel.org
> Subject: Re: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob when
> DMA is not ready
> 
> Hello,
> 
> > My apologies for the confusion.
> > Slave DMA terminology used in cadence nand controller bindings and
> > driver is indeed confusing.
> >
> > To answer your question it is,
> > 1 - External DMA (Generic DMA controller).
> >
> > Nand controller IP do not have embedded DMA controller (2 - peripheral
> DMA).
> >
> > FYR, how external DMA is used.
> > https://elixir.bootlin.com/linux/v6.13.1/source/drivers/mtd/nand/raw/c
> > adence-nand-controller.c#L1962
> 
> In this case we should have a dmas property (and perhaps dma-names), no?
> 
No, I believe.
Cadence NAND controller IP do not have dedicated handshake interface to connect
with DMA controller.
My understanding is dmas (and dma-names) are only used for the dedicated handshake
interface between peripheral and the DMA controller.

Thanks,
Nirav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
