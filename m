Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1001C0219B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2025 09:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WhqQlE6JD3vqtBeuwq/bRGBxKJQLhvhK9pAZb2nU9s=; b=s+nJFzYNmSzRX4
	go51EHI40S1rrFMcQVLtl8TZa4p5ldUyqS+PdQrx0yoJWYKDqlvIY0a0gyHkQaCReAv75dtpmE9Vl
	P3DtX4v4lUUI+xRvi5qxxccIc2ZZoOcWep0TjhP6lJzabzwpcsWTtvnYV9Ztqj3h+xH1yfr7S/23E
	maQbba6j/+uTrmoDx8Tvhjc7Gydm+IQxIBZTzRDachx3nn8tDBBsmHaS6Vs/qXFk2OS23WrQis9OF
	/LMsq937Zd3TGV8zQ9XpbwMzoFxDdnrRLtHhHUoAoKS086BQr9+WFmW6ZWHE1DDUAP941OzrwiYZ9
	YH7OroWiLow2bShZKUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKTL-00000008yq0-0fOT;
	Fri, 07 Feb 2025 09:16:27 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKQG-00000008y5A-3IGq
	for linux-mtd@lists.infradead.org;
	Fri, 07 Feb 2025 09:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738919596; x=1770455596;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8mPk4XLdKN36zkA03qKyznIXQ4Ggwxa6IYRpZ5h8mUY=;
  b=GTPDCI3o9zzrg+r8plXl9I0Cqyb/pZOgTOn/H5pK6WPPEjuyVE2lAbQU
   PTISesewzaaEN7ma4T6ED7J0rzPjuA79u/yHo0LPTNphwZacz7GZrGDnn
   5gUPgb/Blef6SXMQOZMAbPrStsrZWQUMCBbigQ/v+zmYOKy8y/lmdbFEL
   YfDys5vEXtz+AdMup67Dup1lOz6bAa1q+BCT9IN8HNP248HCbBvquHpQN
   Ary6KSQyHm+Xh6AwHs3BM6h4h205A2xo0wrUOtRN8FH8oXnQphl5ORERk
   S/LvGSgW10aQ6cQE0HomQCaJP6+jyye3g9MJ12s+zaNua8POqcBtnrUo8
   Q==;
X-CSE-ConnectionGUID: rASzeFBUS+S29lIiHY0B9A==
X-CSE-MsgGUID: HcVUln/RRNqeoOdJyrnX7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39582343"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39582343"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 01:13:15 -0800
X-CSE-ConnectionGUID: HOK1jeAgSGSVmzgwq6FMkA==
X-CSE-MsgGUID: U0dYRMJBQAO7BGC/YP0sLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="111672595"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Feb 2025 01:13:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 01:13:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 01:13:14 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 01:13:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiNdqRhu+sDCLdYAAw0n38JS3E0rDGFu9tDGwXvBgJZlBUrrItinO2pZdLKbkOrMbzBD9Gf6crJyS8Xs76zBh+iRaUQA5frCeSo06PDiCNp6Pwje+1Dy6Fpg/cJfpPPOIoZYksHe/RaO70aktetJEe3eB3GZj/HABKmLYwJTkDN/sf24+lDqFrkQGPhBVIxwpzQR5HppLyy5J9P+FnMYWw56sNxqPzl3dNuDG34tfBPCX+9yaBmVByoyavLh8XEee3fyW/jLpKEG1agmgXkkVkQpBekUVfCbEZw+0rpVexoQfQPfZK0pcF1ehN87jRvKeqcF1rZl+aDaVNfTWnV0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mPk4XLdKN36zkA03qKyznIXQ4Ggwxa6IYRpZ5h8mUY=;
 b=KuWRcOcI2kgPfxpbNctap+wli9jiMTkqXQtPDyLjCjhHOEGSsYlewVAbIczGENddkzjqXDaH2y/ASuezrLp+VX4Tm3H+5NHr+8Wg+LqTXPkEIBc0mduHzaWReRUKQ9zSzYiVnPFb4HbCdDPklc3615Fif+agR/baFDow2UgSL6qP0abGR2HdZ4Ro7Ss0wpMQIIDSEdHj4UNco4AFoqcHZ2b0dL/k5juF53tCGMZozS6/GmrOIjeIr79cApqSCyPcds5NlNzapNcmSkvPKaXThsY18b0edVx4UecuSJ/JRRfJmTyLyPfV/czdKS8X8sNhxQb3WRmNLPEzAI6o8c0JpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 by PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 09:12:44 +0000
Received: from BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f]) by BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f%4]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 09:12:44 +0000
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
Thread-Index: AQHbZ8ZOILCVzRcq3EiB9N8/dGJ/ZLMhBMtugAlQtQCAA0UcDoAA++LggADu3AKAB1OZ0IAAI5krgAAWHVCAADB9joAAB7ywgANXOxWAAQkp4A==
Date: Fri, 7 Feb 2025 09:12:44 +0000
Message-ID: <BL3PR11MB65320CBE12D13EBD3940CE44A2F12@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-2-niravkumar.l.rabara@intel.com>
	<87plkgpk8k.fsf@bootlin.com>
	<BL3PR11MB653276DFD3339ADAADC70CCFA2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
	<874j1i0wfq.fsf@bootlin.com>
	<BL3PR11MB65321B556C59C995DC05C70AA2E92@BL3PR11MB6532.namprd11.prod.outlook.com>
	<87msf8z5uu.fsf@bootlin.com>
	<BL3PR11MB6532451B44E7C5D82F5EC4AFA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
	<87o6zi83se.fsf@bootlin.com>
	<BL3PR11MB6532369D14375CC94AA2714BA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
	<87frkt96nw.fsf@bootlin.com>
	<BL3PR11MB653239DDBD9D8E7D413B60F4A2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
 <877c6357o5.fsf@bootlin.com>
In-Reply-To: <877c6357o5.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6532:EE_|PH8PR11MB6707:EE_
x-ms-office365-filtering-correlation-id: f86a14e5-48e6-4cd3-4c4e-08dd475794fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZXNmRnhRSGpKWFNPaXkyUDZ6RnhveHBzYm1WNUJyei9wNjhKQm9kbW1KeWZx?=
 =?utf-8?B?WXQvOFZxbG5XdWs0SWZwWmgxM2xONElzMUFTVUF5RzhYa2tIMmpaa1VMUy9w?=
 =?utf-8?B?Y29pZmRCTjJ3aFYrNmsxZVY1VzBqL1VEUUxmeUdmVjdCaDBZbWZFdEVUTjA3?=
 =?utf-8?B?dWNrNjI5UnQ1ZDJTdW5EQU40enhYK01XeGVMRk4xTS9laHVST0VNM01GZFd2?=
 =?utf-8?B?aTBlN1VDcy9MSnlwcGJuYk5RbzRkMDBxdmYwS09GblNEdmkwU0t2U1pibS9i?=
 =?utf-8?B?blE1T1dBY200dkhyKzVEbmRpTWtNb0VxTjNMYkUwUytKUmRyYlV5S2JmbU94?=
 =?utf-8?B?TWJBU0JyYyt2ekdYWjQvMkhQM2kvMFBYWnAwYlVVRSt6MmhZQThwS1pidVM1?=
 =?utf-8?B?Y0FzK2FOWEx2OC90WThVdEEydkp1Rm1ud0I3NWpyMElyQXVaMkRNdHBLUDA5?=
 =?utf-8?B?SEx3NUVkOHFXdm9JNEJkTVh6TEVKMjYzUHRjbFB4MDdyUkh3L2Z5cXRTVHNV?=
 =?utf-8?B?V2o4ajBBYXFXTDFKcmpUazFsa2tTYWdyUEwzMzNUR1pSc29LWWl6MUZoOStj?=
 =?utf-8?B?aEFVSGl4RUR4NmFhblNGQ1NKSktiUk9ubnRGVjdTdEMvZndNUnZEOS9nanNF?=
 =?utf-8?B?NU1RT3dmbmxOUy9QZ1VWUS9XaGxVQXY4cDByMktiSnE2T2ZiNkFQUEwvbC9m?=
 =?utf-8?B?OVpUeEJUSkNaQXUxQ040WnlIM1Z0eE04aHlreW5OVW9lVlpta3lRUFZ0Wi9O?=
 =?utf-8?B?b0cvTHNGcVNXOStnUktJN1M1YUxJb0Q4MXk1QWFUcWVaUnBGU1VGN05UZFVQ?=
 =?utf-8?B?QlZRU2M1T1lDR0phR2hucDlrMTFMVW5RcGJOa0xJTnI3Q0dNTEE5NmtTRmUz?=
 =?utf-8?B?WWRvTEdlUHV1NG5Nd3hseWlvV1E4aW9JWmNWMXkyN055dmJobnJDRzRaKzlL?=
 =?utf-8?B?N0dqM3laYjE0SjdnTTRDUHhzL1JocnMzTjhLM2gzUWc2eG8xbklmMDh5d1Ra?=
 =?utf-8?B?U2JITDdBUFhuSDZJMUoydGZ2S0hVVXltKytoc1o4Q05kREx4QlhCRGR6RkVw?=
 =?utf-8?B?NEFCTTM0cVlLOWNWeHU2UDI3eXJjeExZZnQ5bFo3UlUrK1UyYTR0RTFudC9z?=
 =?utf-8?B?TVUvRXQvbWNNLzBvZUw0TzJrL2FzbFYyTlc5VmFyTS9LcGNjZkxuLzZjUVNm?=
 =?utf-8?B?QmFKTFh0cmNZWkNJTUlNY3JWb2Zod3ZjdWliTmRaNmNnZDhzbElnYlNWczcw?=
 =?utf-8?B?RHkrZlNyK0M1QW0va3lOYkFEY2Y4VUZqZi8wdW1qbngycGlWemVBcFRBaUFp?=
 =?utf-8?B?ZEl4aWR4dmVHYXU2alVLUm14MFZzb0dEWFpmeklHNkxnQVJlZzdtMEhDR2c3?=
 =?utf-8?B?YkNxZCtoK09acVlWR2V3SUNoc3FRcjVYZ05rb1hWL2FaczQ1WTducG5KNnNJ?=
 =?utf-8?B?VUp6WTRJRWZKOVVJUjE3MXAyOUgwVTc2WEFjckJFcHQwSVI2Sit5QTdpeTZF?=
 =?utf-8?B?RU1WYU92U205NzlnUnlXUnBvTjI2MjJieWFhY21rbUFuRng4VkYyVC9ITytW?=
 =?utf-8?B?a2xHODFXOWloYk9ScnlxWjRTeldlVkxEZTVBZ2hWQUY1VVpMVk9LNWFWNHVH?=
 =?utf-8?B?S1oxK1lEOHhxSDZhTnprcmFRYUFtRnBuZzlrREY3Y2V0eWd5b1RtNjhnMFUr?=
 =?utf-8?B?MTVkajFReWR4elZ5bks0aUZDd2wxOC9oVzlKajFmeE56ZFRiQzdNenZMeUYv?=
 =?utf-8?B?eFFXRE9iV2Z3NG9Md2FUbFRwVlE5UkdMRDhiaHVDWkNpZ2lObURhRnJzODJp?=
 =?utf-8?B?M0JoYTFhL0Q1ZDhndk9VampSVFNJWXpleXpYdW9ld3VXM0c5ZXZONTRCSmNw?=
 =?utf-8?B?UGc4SlF0WW9BbDZLeXByc2VqR09qYW13U2FUWDh6VENpOWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnlaS1BveWR1dGl0TXBSY0IzaU1lWG9JbFk1aTlCY0gxdFRsV3F6eFdidFA2?=
 =?utf-8?B?TXUwKzdhaCtMQmR1UmxoMWh4VUVTb2FIM1RsSndzVk5pLzVqdGR2dGtaNU9a?=
 =?utf-8?B?dDhXNWF3djhwWlF6dnRWM3B3eU5NMHVBTTZELy8zQ3hJOFBva3hCK25Nbkdl?=
 =?utf-8?B?M3RVNGs2c3VYR2NUMGk5Y04zOUxUOUNKT3loQ0l5dEp2VWZpb1g4akJ4SWlL?=
 =?utf-8?B?M2hWTzdtcWxrQjZ5TktjUFgrMGZ5VDJKaGMzbVpoREtzZElXd29XajBXOWVG?=
 =?utf-8?B?V2xXWmxqSmZkeU96ai9GcU1NRmZvRFVmMmdzT2M1bzRqSmxmWnBRZlhKTmgw?=
 =?utf-8?B?T3ZGNkNBV1oyZkxzN2hFSFNOUlRkbTFqWUNFMlE3UVdkaUVBTitzVUdlYXhx?=
 =?utf-8?B?TExGWTlkak5NMkhVL2Y5WG1vSWxvV2hvVFMvQnZFdjliTFZiWTRsVXBGVThn?=
 =?utf-8?B?NlBkNm5BclJZRjY5U2w0NTU2WWoraEZyTkp2MVhkWDJwUU04V2VsdURlcVUy?=
 =?utf-8?B?NE9CQXk4VGlpM3doYVZzUTZsMldQVnVXZzhyRDVXODJObnhFZ3hsUVNuVFBr?=
 =?utf-8?B?UnlxbmVjNldBcWtZNUdrR0tudmdMWkhsMkdGTjMvcmRXVnBtOGVZdWVqZjhy?=
 =?utf-8?B?ZHErTmV6azlEaklNdS8rV2FTbzNUZXFQTE5WTHl3NTEyMWwwZnY2Q2JPT255?=
 =?utf-8?B?RE5FZnlQT2ZiakVGRm5qakt5RzZVcGxQQ2M4OXZQQWR6ZWt5UXREU0QwcmxN?=
 =?utf-8?B?UmU2NU90L2ZmWUxDekVqMXhTT3MyTlo2UkJtekFlQjM4SGoya054b05HVFNM?=
 =?utf-8?B?cUJPek05bGh0Nnk5YmtONUYycmNPZS9UK0RQVWVYOFNhbGVDbnFsNlE3QTNW?=
 =?utf-8?B?N3FZc3FYODZpc1BvWEkzL2FXU1VQOUFlMkdLelExYlRLQlhiejNsVDFpRVp0?=
 =?utf-8?B?Rm9kbkRvSVROY2VNczlpbXg0ampkVEhxeVN5UGg2aXIrcjRIMTBTWkkvc2xx?=
 =?utf-8?B?eGR5ZVNnc0t2bkRGMEtBaDlDa2ErSXk0OGJxZi91YVFxUFFpU0V3SXdHK2FU?=
 =?utf-8?B?eHhBbHo0NFZ0ODYweTNpRFZXNk9zbm5JcEkzcW9oVnZMNVRaZ1c4SG4wYmVF?=
 =?utf-8?B?WTYvaVJlRVd4R3kraVVaa1hHbERGOTk3djJvS2x1TWswL0NEVW8xb3F3T1Ru?=
 =?utf-8?B?ZUhRc1Z2UVcwK0svaTBqMWRSSFh1WjcxUmlXckgzdDY4QU4wMGsvU0krQmZO?=
 =?utf-8?B?ZXlDbnAzUXF3R1lSM1JHWVdRODZ5clNHZzVvRzkxckJjZUdSbWU5U1lIc2x4?=
 =?utf-8?B?K1dpemxodm5jVUg4cFA4OWpMQi9NUDNWRVkycEI5NUpibTk2V04xeDhWY05j?=
 =?utf-8?B?QmV4dDJuTG9DUzljRWszc2ZNTC9tYmQvQWZOSlZtTzRjMWZOcTdKbHZvcGQx?=
 =?utf-8?B?YVBHRXZJdlgxVXB5VmRtaElnUzhObjJ4SkZESCsyb3NQeityV1NTK01uei9J?=
 =?utf-8?B?RkR0QUhKSndwVHB4RENMMC9EQVRMM2l6T1pFUjBYMURxeHVTK1crMC9wcndW?=
 =?utf-8?B?MTgwbXJLVjJELzVycUNTNmFBUUhYWE1DNEdwbVMzbUZDbkVnSmErT3FGSG9t?=
 =?utf-8?B?cDhGNW93UlNOSHI2cDNGTlpEbDM4eGM4MzBvNWFac0s5L1ZmQUpYak5vMlk2?=
 =?utf-8?B?dmVtK0pUbHlDYlg1WnlyQ1RjNXo3dmtORnk4SFlRQ2RQVE56WndIS3Z5V0dh?=
 =?utf-8?B?aXlKblp5clZsQjlKNjJjNUVNcmtuZ0V3ZHRiYml2YVE4c3FmRS92N3Rvek9v?=
 =?utf-8?B?bHdCclk2MGsvWkdaS0VOR2NIVStOczBHVkx3LzJ3VkR6MGVjNjI5UkJvMU5H?=
 =?utf-8?B?WHFyRkVsQnloVVR1eG5sUjZWaTVyaW9GcnRtZExpdmhuM29lRnBmT0tNTW8v?=
 =?utf-8?B?TXFkck5Dd1R5UnBaaXRGT241VEdxSWJRZVJqTHdvUDYvRzVCUlhXaXllNU0v?=
 =?utf-8?B?aVpKV0FzQkNVOEt0TkYrNE1wa05mMS9oL3pPOWVWV2E0MUpXK29Vc2lEQUlr?=
 =?utf-8?B?SGtUbHlkTG4zVjBrcmNZRzBVMXY1RC8yVDhJVEhZUnZ1VW8zWG5ZRDN3eFJI?=
 =?utf-8?B?bFN6YTNDRFB5Smw3a1ZWRnJVc2dpZFZIU2gwL3VPL0JFTFNURGdncnhpeDBl?=
 =?utf-8?B?d2c9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86a14e5-48e6-4cd3-4c4e-08dd475794fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 09:12:44.3504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4/zytUbuSE6owIg2lQX25qUSi1IJIpf8e8Bm50b0WOoJvdxK56hV+m9s5blv2/c13HO4K/j6/dCuShItksspJIs6MShQY9kLBvOuDgqyC8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_011316_908820_E96296D7 
X-CRM114-Status: GOOD (  21.22  )
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
> Sent: Friday, 7 February, 2025 1:02 AM
> To: Rabara, Niravkumar L <niravkumar.l.rabara@intel.com>
> Cc: Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
> <vigneshr@ti.com>; linux@treblig.org; Shen Lichuan
> <shenlichuan@vivo.com>; Jinjie Ruan <ruanjinjie@huawei.com>; u.kleine-
> koenig@baylibre.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; stable@vger.kernel.org
> Subject: Re: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob
> when DMA is not ready
> 
> Hello,
> 
> >> >> > My apologies for the confusion.
> >> >> > Slave DMA terminology used in cadence nand controller bindings
> >> >> > and driver is indeed confusing.
> >> >> >
> >> >> > To answer your question it is,
> >> >> > 1 - External DMA (Generic DMA controller).
> >> >> >
> >> >> > Nand controller IP do not have embedded DMA controller (2 -
> >> >> > peripheral
> >> >> DMA).
> >> >> >
> >> >> > FYR, how external DMA is used.
> >> >> > https://elixir.bootlin.com/linux/v6.13.1/source/drivers/mtd/nand
> >> >> > /ra
> >> >> > w/c
> >> >> > adence-nand-controller.c#L1962
> >> >>
> >> >> In this case we should have a dmas property (and perhaps dma-names),
> no?
> >> >>
> >> > No, I believe.
> >> > Cadence NAND controller IP do not have dedicated handshake
> >> > interface to connect with DMA controller.
> >> > My understanding is dmas (and dma-names) are only used for the
> >> > dedicated handshake interface between peripheral and the DMA
> controller.
> >>
> >> I don't see well how you can defer if there is no resource to grab.
> >> And if there is a resource to grab, why is it not described anywhere?
> >>
> >
> > Since NAND controller do not have handshake interface with DMA
> controller.
> > Driver is using external DMA for memory-to-memory copy.
> 
> I'm sorry you lost me again. What do you mean handshake? There is no
> request line? There is no way the NAND controller can trigger DMA transfers?
> 
Yes, I mean there is no request line, so there is no way the NAND controller can
trigger DMA transfer.

Sorry I used the terminology based on Synopsys DesignWare AXI DMA Controller
that is used with Agilex5 SoCFPGA platform.  
https://github.com/torvalds/linux/blob/v6.14-rc1/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c#L1372

> What do you mean mem-to-mem, how is this useful to the controller?
> 
I mean system memory to/from NAND MMIO register address for page
 read/write data transfer. 

	reg = <0x10b80000 0x10000>, 
		<0x10840000 0x1000>; <--- This MMIO address block
	reg-names = "reg", "sdma";

> > Your point is since the driver is using external DMA and it should be
> > described in bindings?
> 
> Yes. But maybe I still don't get it correctly.
> 
dmas is an optional property in cadence nand controller bindings. 
https://github.com/torvalds/linux/blob/v6.14-rc1/Documentation/devicetree/bindings/mtd/cdns%2Chp-nfc.yaml#L36
Does it need to change to required property in bindings? 
 
Please let me know if you have any suggestion/advise.

Thanks,
Nirav


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
