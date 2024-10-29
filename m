Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE83D2AB23
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vtwrphLYPxHLI73JJRx5ewslZNrirfp/M76VJ9rf5o=; b=apRH1JQpd7hrka
	bUZsb0ukOMgL3vUzq0bK+r4X5XkxbSfr+xHnsMldxSauyMQSAhxxLzGdtKnjDyTk3a04JTd/2+lS/
	tzPVsdkP3QLpRfNFojsX5f6RT8BJ2ZquvaKa9WpRebeCKHb7CL8fSDA7EClEPUs2Lx4oIoWBDa3ff
	nm0yDRLaWy2IhrHtkya11QWXCaOfVvFIX2P9F7R5yaxxpOgShj9Nc4+E5DG/TPDL6dMsLqP3sTstk
	Cssj/SGzySGlOhFFN7Z5o+u43BzNOQtzJ7RnYo6ufiStgqCuU6z1fvA3T21qsIBxo1MDo0i9qOz7b
	qs5CtuAzdomYp3h7QWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kha-0000000EHi9-1loe;
	Tue, 29 Oct 2024 11:47:58 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kL7-0000000EECh-40Pq
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 11:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730201086; x=1761737086;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GwAfmADrImPekHAKDwYPaxieSh8BUu5qo6IZqU9hX1o=;
  b=CQTAr+6bNihsEN+qKw891UWz5sXIICUoqqC26uWsO3y4rAGFk+7lBW2M
   vsMaoRa8xShaUpqdHXpHXcfffsYjfqXvR2aD39E//NgsJOmtboxXQDsHY
   YfJWD6/5pv9XzwFxve1zJMfyNi0gf/E9l/ASGsv81HMLxwHqTBJQ8dQyH
   RqB6heRNSdnF0cCMAfn4to/vsxdubyRB+cMfZPeCad11HEWx65UskDbuA
   rNT48CBcdePef8hswxXlRRhNXMMN02Ofa/MtOmu2gcbpCvWQMepfrKo0R
   qeZL55y4b/ySwjj1/kXYdYu3yRNqwEbI6N1RgUxMlPrAKdbXB/laBZ3ry
   Q==;
X-CSE-ConnectionGUID: 7Ix6PXpXSI+RkL1nVO2UxQ==
X-CSE-MsgGUID: 6qxNTbxUQ467fhIOLYhZ9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="17469956"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="17469956"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 04:24:40 -0700
X-CSE-ConnectionGUID: 3ATjSjfWRDm3THoiSMA6qw==
X-CSE-MsgGUID: I72k+78AS0G0Sbau7SIw2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86544587"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Oct 2024 04:24:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 04:24:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 04:24:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 04:24:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXz8HISSChql9sQxEF6XmfUGDpuM29py6jr6IzsyoFFeVEcExLNkt/Hu/ZaMt5hbRomByqm/Pe7JhqkRfmg0d5juee8i0G9JUKFJCAw2I/ZFE/gzUaN/TLrhnZZ0z9L1OeP2eqfoGdZGOwB2DNbu5oJE5SXCasS+FQJD5HaJqzzdyT7uQ9Zv9Fe55b+kkQf/sqNBswAqRTRvlfyEcFnSRlJJYKpAHGorCZmjuwfE1yUDAThmwn8+qQn19tIyfk3TzrvxomBmObcCk0blaa28sMDGYuAc69rgOMpm3MeUagGxMnwP2mayhDhVWoU1PBlftNwS0InxKiLgROB+xdUTrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwAfmADrImPekHAKDwYPaxieSh8BUu5qo6IZqU9hX1o=;
 b=k9C+M2R/89jU0aR2B4vKTCI4VzgeliFKtNUdULWqu1unpTf5Q4vC0n/NE5I7WNIsqrbtxSYVU+OHgyPVo2rgbALVv/rUO23hn0CXtG3drVGSqzJzx13ami0+OLG4W1+t4jvT2dsArfPs7tq1ZRLS6q857ZLE/V3XyRY2kPb6rZ2VdTe8s84hF1sTtfWJwLatpORV9EPcHUZkSKc1NNuj//MrYfAEjKsODmOoEFndFKxvFfdX1XxBr9zldmWO2R8p5yS95ODMII+vFKcLdyksAkgPdgHHixgwW/x7LdS4mGWOvQYXydb/SafK3jLd+HridBGYxzALiizKfjRn7NKAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CO1PR11MB5137.namprd11.prod.outlook.com (2603:10b6:303:92::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 11:24:36 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 11:24:36 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>, "Deak, Imre" <imre.deak@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
	<thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
	<tursulin@ursulin.net>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 06/10] mtd: intel-dg: wake card on operations
Thread-Topic: [PATCH 06/10] mtd: intel-dg: wake card on operations
Thread-Index: AQHbJHC0/rbs/wzgjUKBVSZeKHczwbKcSmeAgAABYACAAU36wA==
Date: Tue, 29 Oct 2024 11:24:36 +0000
Message-ID: <CY5PR11MB6366EF9CA6552ADF6E01A557ED4B2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20241022104119.3149051-1-alexander.usyskin@intel.com>
 <20241022104119.3149051-7-alexander.usyskin@intel.com>
 <Zx-mPQSHXv5Teq_j@intel.com>
 <CY5PR11MB621157335FFB1089F49CEF8B954A2@CY5PR11MB6211.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB621157335FFB1089F49CEF8B954A2@CY5PR11MB6211.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CO1PR11MB5137:EE_
x-ms-office365-filtering-correlation-id: 12b5ff75-31cc-4c61-aede-08dcf80c4540
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NjdkZHVXR2paSDAxc2tBWkxoS29qMG8vdldQYVc1ZGNseDBVZUliNktucmhv?=
 =?utf-8?B?NEJ6QmlWWElUV0dBUTBxNGdwMHZFTFZvYnVOam9DZEpNOFlNZUpRQmx0VTky?=
 =?utf-8?B?UFQ1YnBKYmExS1NKeXB1Um5MeFdiN21CbkhXbVRhNS9XVmI1SHpweEVabC9C?=
 =?utf-8?B?WjlmZnF3SE9FYXBVb3UrM0ZsZWgzTVZlaTUxaWR3SG1Qc3llYWNrRFNpcXdX?=
 =?utf-8?B?OFBXU3FQOURtRXVoK3JQV01rNWVnZVIxTForSEg3STVMblJ5ZjIwaFJlQ2Y4?=
 =?utf-8?B?VVVRcFU1YitpRk1hby9DRHVlN2NPdjdBcXNGUUJoMTBINGpud2hLejg2TjRS?=
 =?utf-8?B?L21kSUVLQkZ5VjdXRWNPRzF4TlJ6eExLN0RpNVZlYzJYc0pBMUIxNWl2MHov?=
 =?utf-8?B?RkdxRmVPZ2ZTNUkxbXFySW9MSHdQQWo1T3pUVHpRK2FnY2xQd3cyL25pckhM?=
 =?utf-8?B?b0VBNGZiT09POHNRZXNTWWc3RzFjVGNzMTJXTEg0UDFKMFFLNklkbTNtemhi?=
 =?utf-8?B?TXQ0cFZuaDQ2Z1AvbEg5bEtsU2J6dGFwVnpzcXdTMUdmZHZpTnlJNElnWGQr?=
 =?utf-8?B?bmR0OUppNitqS0tadzcwdXBpOEY3QXVTR09PMk43YS9iRms3eXBUcWZyNDNo?=
 =?utf-8?B?OFBIQU82NVdGSWd3UU9zazJyL2VFNE9zdW96bGlMd0JiK29aOGtDK1lhWW1t?=
 =?utf-8?B?cXVVMll4WEFOYjVxdEQzTTBmWnFOOTgzaHE4bS90L2xYMTJUd0xUUXlrU0pT?=
 =?utf-8?B?M0pkVHlMOTdmak1DdkVja3BYVWdsMFgvOWd5L2NtK2FwUjFOdHozaWxDd0NI?=
 =?utf-8?B?YkhnMjVsQWZidkVLeHFCMmxJY1BJdHVvVmhScldPQSt2Y2xQeGVzVTRndUd2?=
 =?utf-8?B?WTJkYllLLzlrazMwZDVmc2VxK2NaZW4wRnZhOHlXb1E4c2IyRnQwSmhUbDls?=
 =?utf-8?B?UnhvSDhnN1Vod0J3U3dQVkMycThNblFLRENzK0JZS054bklJNk42ZllRTFZR?=
 =?utf-8?B?OFBkNVdpMGxQVklxZS9UeUtNWkpZV1dpNnp3WElTbVA1YmhSb2JxOHhIdmpB?=
 =?utf-8?B?YVpoUzRKZHJHVkxjTmQwN3ZYNWVjYk5HMzJNTmdNMjJZTzFQbzlxVW1vSW5y?=
 =?utf-8?B?NDg0V1lsclB1K0ZjWDMxZVhwZnR5L0tneVl3WnB2Y0s2b0VZYlpPU1ZTVjBq?=
 =?utf-8?B?bDVyWjZVTHJ0NzRtZUlhSWxyeWNJZy8vODlvcHVsVVBGZGtiUWRqN05WS2FT?=
 =?utf-8?B?VTgyL0tGeTZ2SFFqcE84QjJQcHdiSW1JRFRuQXU4Y25NZkQ4ZXVZeCs3UUJJ?=
 =?utf-8?B?S01hNDhuWWV1bmxzREpvNUZsREJDVUxOYnQ1Szk5d3NXUEs1T2l3TXUyNTdH?=
 =?utf-8?B?S0k5bHEyWUZtK1Z4NmlDTEJYWXdMc0lFdjRIOEt1V0NKdFlRRVZKd1BoL3N2?=
 =?utf-8?B?T0Jtbm1RU0VYNVhaa1ZPM2RKTTNUK2VhM0p5WlV6ckNVZ0IvdEROQ0FxeHJh?=
 =?utf-8?B?Zm5RMWNvN1gyUjBPeUdRVk9qQ1k3UzlDTEh1MGh4ejZlVVJiYTU3eFNRZ3hz?=
 =?utf-8?B?UEFMWnV4VmNVYnNWbTBybXhYYTY1WlBoTWNWOVNONExHQ0sxOWlRYUx2Y0kw?=
 =?utf-8?B?N1I5WTZHVUNKbzg1N1VSdTc5b21QOU13REFnSWNQRE9tZFBRck1pYjJYcTlG?=
 =?utf-8?B?akxjazg3ZTN2QmgvejRIc3FtY3AxdW16VXdVQk5xam1Wck1Ud1BXWm9uVnFy?=
 =?utf-8?B?NWFjaHBCdXh0TUMvZS9HdDZsUFR6WWpsOU5ER0c2WkhzaVRPbGxiRGtkdEhJ?=
 =?utf-8?Q?s2A0a6tXbi5WrlAumgeziuPzRAeinL4N8lHzY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHdjcWw2ZVduWFY4bTNIV2t3RHE5Uk1zek5lRE1XaW5aQVpBZHpaS1pOY3Rq?=
 =?utf-8?B?akFtdXVPenhJMGtDM1pSWWJJZmF4ZEo2Ulc0VUJkL29yaCs3ditCWGljdVBI?=
 =?utf-8?B?MmE2cmVMTUVib2tkaldnUk9lM0lEREhMMmVZd2lVdk9KRnllZTJwdDUraFFG?=
 =?utf-8?B?U3dQSGNRM21VVFozdnpHRDFiNUZuaUdYZm9ZS1dQRlRVc2ZLQnZLUkdSNVV0?=
 =?utf-8?B?Ym1JY3g0SkdQRjNGalBMQTBDMmRKYzJnUVF4TEZJTXI1dGc3S1pjLzNrZDhD?=
 =?utf-8?B?Wldwc3ZqZEJ2WDVTYkRGZi9mQWhMNFdxdWJGQTBKaFJnejhRR1BNdnFtY2Q1?=
 =?utf-8?B?em12aHJ4V2s3K084YjUvTnl2WmQzK2dQOENGcWJEei85UU1ESHNmUXBMRFVG?=
 =?utf-8?B?Z1FCU25aRnJtRGRqYndEd3lpM2t4ZVAyNU9GLzc3bkl1dTNrZUFCTU1EY3Yz?=
 =?utf-8?B?S2I2YVdOSkg3SUwzN1JtS3BpdWN0RTRaWkNUY1JWS2ZZMml6SDRIZWxGY2lh?=
 =?utf-8?B?dXZqZlFncXFKUWFPYkpqVU4zNE42RmNJWFFFV2k1c3drcjgzbm5RZmtkZnBQ?=
 =?utf-8?B?c2pnaDN2RWVYNWNiald3TTN0cmtiQlJsOGpZU2o1VkVhblNUbkJ3UWUwcEVU?=
 =?utf-8?B?RDUwQldKaXIrY2RFRmQrRUJrYUx6YmJLUUlOdHdRRVRPZGMxVEtlY0hJNEI0?=
 =?utf-8?B?Wm13ZFFaMkxtVGJQL0s4dE5Gc3E4WWVFVDJwZ2xtV2ZpYkZlYmdFTjF6YXNk?=
 =?utf-8?B?T01VWXpoaDhMTmFkM3cxemt5MngyVW1WZmV2c3Q4cTFzQ2dOYWhsS2FqOFhY?=
 =?utf-8?B?MFVOUFpwa0k4WjVxempoa2RkM1YxeURoazNjdmppMllHdjluSTdTV0ZZYmVI?=
 =?utf-8?B?NWhtc3crQVBiV0piNXMyL21JZkVRMVdTb3ZHM3dkV1ByTENyY0tzSnV5Qkpi?=
 =?utf-8?B?bGZwdkNKd2VDYTU4emVleVFKUllRZUZrU0hkSzNlNkg1WFdhYS9PaUI4Zm9S?=
 =?utf-8?B?aDRDNVUwWlF0U1JZMmtQbGROaG9nVVJnQ3lYSDlVRld1QTVENk54NVhQRnpv?=
 =?utf-8?B?TGkxL1h3YnRWTWx3bjdhQzZlelorU2wxeGpqdGlHQkJGTXMwb0NwY2hEOEk2?=
 =?utf-8?B?ZjU4d1ZUV2FYS05HbDRaNnRhbHpZdDdmckRXQ0Jlb0I2aDlSNi93QVRuSEJX?=
 =?utf-8?B?VERXWFJjYnI2TVVYZml0MFZ5RVpQSmdyVTBMOVlTN3NKYjFqUDl1NWJNZzdh?=
 =?utf-8?B?SFl3aUc0cU4vTzhLTUtyMEhiaHIxZmE2anlPRzRTWVZFL3U4Rm14TTFISmd6?=
 =?utf-8?B?WGVRRW54SjBOMEVxbkVmM2owQ21ZYWd4QUt4eFJqREV1bmx3dytDaEUvUjlp?=
 =?utf-8?B?ZjNRZjc5YU45ZTJSOGdCUFJNU05HZ0Vscm9kUXhCWFBJVDJhNFRWWnhUQXlK?=
 =?utf-8?B?Sy8wazR2eW5ZbWZpT0dkM0xsVEdiNWg4VHN2Ujl3azVhYmRjcU1tTWxORTZH?=
 =?utf-8?B?RFhpL1ZFbDNjUXoxakRSQm92VzgrV0hUR0FCdStZVkhpSmo2Q0FvQzNkYlNl?=
 =?utf-8?B?eEU0d1NEdjJHN20yUW9rQTJWVUhsQXVaY2ltN3NJazZhWGF4d21zbUt4SXBj?=
 =?utf-8?B?S1ZuOGQxTVRPV09FSUpreHovT1pqaEZHWmhmUTFTdXBlMjB5VGZyV1lUa0hS?=
 =?utf-8?B?NWlNN3lkREdZeXZqSmFCaHhqZ2hGYml2L0JnTUJyM3ZPVWRKaHJON1NvUVhy?=
 =?utf-8?B?VGg0U0tqQXY2S1g0YzdvUGk4VmFWTWRDNk9pT0xXUUhPcDhwcVloN1QwSnVu?=
 =?utf-8?B?Y00wNnNDa2M5am1IOEhCSk1CeENrUkR4YXRidW45WVVhRHBPQkZBM2lwL29K?=
 =?utf-8?B?Z3R3akpzZGprZlBlSlZ1RzJUdEtwcngwbEZwQmZTNytldEIwNHJCUXlScUgz?=
 =?utf-8?B?NThDV1ZoWlo2VDhSeVpYMFdSQjJpeGUvSWxubFl1bkRwQURnMWxnVWsrRHRu?=
 =?utf-8?B?TTZWSDVwbHFYSVFmazgxc2p6cWxGR2RybWltYXFndEhjUzQ4MzlPeWExMEJo?=
 =?utf-8?B?Wm9UVEFoaHFBeGJsT0VtOFhKYmt1cGZRT3ppWG80YmVVdGJIK1IvZzFYanZi?=
 =?utf-8?B?djlUYUlGd3oyYjI1WHpQWDF5cXVQSXFJMmdjeHNmYTdiVUtUdi9UOWFzMlNQ?=
 =?utf-8?B?RGc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b5ff75-31cc-4c61-aede-08dcf80c4540
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 11:24:36.4628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTIGRSqwluopFycMn9P8XjZXoTAKNx4kEC+6ucWbpY/Mdop4Unh/n2ltewAOtrYQtDloSEu1T8qOqPpKPCtkNckTaeu1CnGxhYIHylrKu1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5137
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_042446_141973_9B4F0328 
X-CRM114-Status: GOOD (  12.83  )
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdXB0YSwgQW5zaHVtYW4gPGFu
c2h1bWFuLmd1cHRhQGludGVsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDI4LCAyMDI0
IDU6MDIgUE0NCj4gVG86IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBV
c3lza2luLCBBbGV4YW5kZXINCj4gPGFsZXhhbmRlci51c3lza2luQGludGVsLmNvbT47IERlYWss
IEltcmUgPGltcmUuZGVha0BpbnRlbC5jb20+DQo+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPjsgUmljaGFyZCBXZWluYmVyZ2VyDQo+IDxyaWNoYXJkQG5vZC5h
dD47IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT47IERlIE1hcmNoaSwNCj4g
THVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IFRob21hcyBIZWxsc3Ryw7ZtDQo+IDx0
aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT47IE1hYXJ0ZW4gTGFua2hvcnN0DQo+IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkIDxtcmlwYXJk
QGtlcm5lbC5vcmc+Ow0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47
IERhdmlkIEFpcmxpZQ0KPiA8YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxzaW1v
bmFAZmZ3bGwuY2g+OyBKYW5pIE5pa3VsYQ0KPiA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29t
PjsgSm9vbmFzIExhaHRpbmVuDQo+IDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPjsg
VHZydGtvIFVyc3VsaW4gPHR1cnN1bGluQHVyc3VsaW4ubmV0PjsNCj4gV2VpbCwgT3JlbiBqZXIg
PG9yZW4uamVyLndlaWxAaW50ZWwuY29tPjsgbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7
IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0
OiBSRTogW1BBVENIIDA2LzEwXSBtdGQ6IGludGVsLWRnOiB3YWtlIGNhcmQgb24gb3BlcmF0aW9u
cw0KPiANCj4gDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTog
Vml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiBTZW50OiBNb25kYXks
IE9jdG9iZXIgMjgsIDIwMjQgODoyNyBQTQ0KPiA+IFRvOiBVc3lza2luLCBBbGV4YW5kZXIgPGFs
ZXhhbmRlci51c3lza2luQGludGVsLmNvbT47IEd1cHRhLCBBbnNodW1hbg0KPiA+IDxhbnNodW1h
bi5ndXB0YUBpbnRlbC5jb20+OyBEZWFrLCBJbXJlIDxpbXJlLmRlYWtAaW50ZWwuY29tPg0KPiA+
IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjsgUmljaGFyZCBX
ZWluYmVyZ2VyDQo+ID4gPHJpY2hhcmRAbm9kLmF0PjsgVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmln
bmVzaHJAdGkuY29tPjsgRGUgTWFyY2hpLA0KPiA+IEx1Y2FzIDxsdWNhcy5kZW1hcmNoaUBpbnRl
bC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bQ0KPiA+IDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4Lmlu
dGVsLmNvbT47IE1hYXJ0ZW4gTGFua2hvcnN0DQo+ID4gPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT47IE1heGltZSBSaXBhcmQNCj4gPG1yaXBhcmRAa2VybmVsLm9yZz47DQo+ID4g
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBEYXZpZCBBaXJsaWUNCj4g
PiA8YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+OyBK
YW5pIE5pa3VsYQ0KPiA+IDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+OyBKb29uYXMgTGFo
dGluZW4NCj4gPiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT47IFR2cnRrbyBVcnN1
bGluIDx0dXJzdWxpbkB1cnN1bGluLm5ldD47DQo+ID4gV2VpbCwgT3JlbiBqZXIgPG9yZW4uamVy
LndlaWxAaW50ZWwuY29tPjsgbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGRyaS0NCj4g
PiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGxpbnV4LQ0KPiA+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDA2LzEwXSBtdGQ6IGludGVsLWRnOiB3YWtlIGNhcmQgb24gb3BlcmF0aW9ucw0K
PiA+DQo+ID4gT24gVHVlLCBPY3QgMjIsIDIwMjQgYXQgMDE6NDE6MTVQTSArMDMwMCwgQWxleGFu
ZGVyIFVzeXNraW4gd3JvdGU6DQo+ID4gPiBFbmFibGUgcnVudGltZSBQTSBpbiBtdGQgZHJpdmVy
IHRvIG5vdGlmeSBncmFwaGljcyBkcml2ZXIgdGhhdCB3aG9sZQ0KPiA+ID4gY2FyZCBzaG91bGQg
YmUga2VwdCBhd2FrZSB3aGlsZSBudm0gb3BlcmF0aW9ucyBhcmUgcGVyZm9ybWVkIHRocm91Z2gN
Cj4gPiA+IHRoaXMgZHJpdmVyLg0KPiA+ID4NCj4gPiA+IENDOiBMdWNhcyBEZSBNYXJjaGkgPGx1
Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBV
c3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBk
cml2ZXJzL210ZC9kZXZpY2VzL210ZC1pbnRlbC1kZy5jIHwgNzMNCj4gPiA+ICsrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLQ0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2MSBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvZGV2aWNlcy9tdGQtaW50ZWwtZGcuYw0KPiA+ID4gYi9kcml2ZXJzL210ZC9kZXZpY2VzL210
ZC1pbnRlbC1kZy5jDQo+ID4gPiBpbmRleCA0OTUxNDM4ZThmYWYuLjNkNTNmMzU0NzhlOCAxMDA2
NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvbXRkLWludGVsLWRnLmMNCj4gPiA+
ICsrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvbXRkLWludGVsLWRnLmMNCj4gPiA+IEBAIC0xNSwx
MSArMTUsMTQgQEANCj4gPiA+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L210ZC9tdGQuaD4NCj4gPiA+ICAjaW5jbHVkZSA8bGludXgvbXRkL3BhcnRp
dGlvbnMuaD4NCj4gPiA+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiA+ID4gICNp
bmNsdWRlIDxsaW51eC9zdHJpbmcuaD4NCj4gPiA+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0K
PiA+ID4gICNpbmNsdWRlIDxsaW51eC9zaXplcy5oPg0KPiA+ID4gICNpbmNsdWRlIDxsaW51eC90
eXBlcy5oPg0KPiA+ID4NCj4gPiA+ICsjZGVmaW5lIElOVEVMX0RHX05WTV9SUE1fVElNRU9VVCA1
MDANCj4gPiA+ICsNCj4gPiA+ICBzdHJ1Y3QgaW50ZWxfZGdfbnZtIHsNCj4gPiA+ICAJc3RydWN0
IGtyZWYgcmVmY250Ow0KPiA+ID4gIAlzdHJ1Y3QgbXRkX2luZm8gbXRkOw0KPiA+ID4gQEAgLTQ2
Miw2ICs0NjUsNyBAQCBzdGF0aWMgaW50IGludGVsX2RnX210ZF9lcmFzZShzdHJ1Y3QgbXRkX2lu
Zm8NCj4gKm10ZCwNCj4gPiBzdHJ1Y3QgZXJhc2VfaW5mbyAqaW5mbykNCj4gPiA+ICAJbG9mZl90
IGZyb207DQo+ID4gPiAgCXNpemVfdCBsZW47DQo+ID4gPiAgCXNpemVfdCB0b3RhbF9sZW47DQo+
ID4gPiArCWludCByZXQgPSAwOw0KPiA+ID4NCj4gPiA+ICAJaWYgKFdBUk5fT04oIW52bSkpDQo+
ID4gPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+IEBAIC00NzYsMjAgKzQ4MCwyOCBAQCBzdGF0
aWMgaW50IGludGVsX2RnX210ZF9lcmFzZShzdHJ1Y3QgbXRkX2luZm8NCj4gPiAqbXRkLCBzdHJ1
Y3QgZXJhc2VfaW5mbyAqaW5mbykNCj4gPiA+ICAJdG90YWxfbGVuID0gaW5mby0+bGVuOw0KPiA+
ID4gIAlhZGRyID0gaW5mby0+YWRkcjsNCj4gPiA+DQo+ID4gPiArCXJldCA9IHBtX3J1bnRpbWVf
cmVzdW1lX2FuZF9nZXQobXRkLT5kZXYucGFyZW50KTsNCj4gPiA+ICsJaWYgKHJldCA8IDApIHsN
Cj4gPiA+ICsJCWRldl9lcnIoJm10ZC0+ZGV2LCAicnBtOiBnZXQgZmFpbGVkICVkXG4iLCByZXQp
Ow0KPiA+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiA+ICsJfQ0KPiA+ID4gKw0KPiA+ID4gIAlndWFy
ZChtdXRleCkoJm52bS0+bG9jayk7DQo+ID4gPg0KPiA+ID4gIAl3aGlsZSAodG90YWxfbGVuID4g
MCkgew0KPiA+ID4gIAkJaWYgKCFJU19BTElHTkVEKGFkZHIsIFNaXzRLKSB8fCAhSVNfQUxJR05F
RCh0b3RhbF9sZW4sDQo+ID4gU1pfNEspKSB7DQo+ID4gPiAgCQkJZGV2X2VycigmbXRkLT5kZXYs
ICJ1bmFsaWduZWQgZXJhc2UgJWxseCAlenhcbiIsDQo+ID4gYWRkciwgdG90YWxfbGVuKTsNCj4g
PiA+ICAJCQlpbmZvLT5mYWlsX2FkZHIgPSBhZGRyOw0KPiA+ID4gLQkJCXJldHVybiAtRVJBTkdF
Ow0KPiA+ID4gKwkJCXJldCA9IC1FUkFOR0U7DQo+ID4gPiArCQkJZ290byBvdXQ7DQo+ID4gPiAg
CQl9DQo+ID4gPg0KPiA+ID4gIAkJaWR4ID0gaWRnX252bV9nZXRfcmVnaW9uKG52bSwgYWRkcik7
DQo+ID4gPiAgCQlpZiAoaWR4ID49IG52bS0+bnJlZ2lvbnMpIHsNCj4gPiA+ICAJCQlkZXZfZXJy
KCZtdGQtPmRldiwgIm91dCBvZiByYW5nZSIpOw0KPiA+ID4gIAkJCWluZm8tPmZhaWxfYWRkciA9
IE1URF9GQUlMX0FERFJfVU5LTk9XTjsNCj4gPiA+IC0JCQlyZXR1cm4gLUVSQU5HRTsNCj4gPiA+
ICsJCQlyZXQgPSAtRVJBTkdFOw0KPiA+ID4gKwkJCWdvdG8gb3V0Ow0KPiA+ID4gIAkJfQ0KPiA+
ID4NCj4gPiA+ICAJCWZyb20gPSBhZGRyIC0gbnZtLT5yZWdpb25zW2lkeF0ub2Zmc2V0OyBAQCAt
NTA1LDE0ICs1MTcsMTgNCj4gPiBAQA0KPiA+ID4gc3RhdGljIGludCBpbnRlbF9kZ19tdGRfZXJh
c2Uoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBlcmFzZV9pbmZvDQo+ICppbmZvKQ0KPiA+
ID4gIAkJaWYgKGJ5dGVzIDwgMCkgew0KPiA+ID4gIAkJCWRldl9kYmcoJm10ZC0+ZGV2LCAiZXJh
c2UgZmFpbGVkIHdpdGggJXpkXG4iLA0KPiA+IGJ5dGVzKTsNCj4gPiA+ICAJCQlpbmZvLT5mYWls
X2FkZHIgKz0gbnZtLT5yZWdpb25zW2lkeF0ub2Zmc2V0Ow0KPiA+ID4gLQkJCXJldHVybiBieXRl
czsNCj4gPiA+ICsJCQlyZXQgPSBieXRlczsNCj4gPiA+ICsJCQlnb3RvIG91dDsNCj4gPiA+ICAJ
CX0NCj4gPiA+DQo+ID4gPiAgCQlhZGRyICs9IGxlbjsNCj4gPiA+ICAJCXRvdGFsX2xlbiAtPSBs
ZW47DQo+ID4gPiAgCX0NCj4gPiA+DQo+ID4gPiAtCXJldHVybiAwOw0KPiA+ID4gK291dDoNCj4g
PiA+ICsJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShtdGQtPmRldi5wYXJlbnQpOw0KPiA+ID4g
KwlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChtdGQtPmRldi5wYXJlbnQpOw0KPiA+ID4gKwly
ZXR1cm4gcmV0Ow0KPiA+ID4gIH0NCj4gPiA+DQo+ID4gPiAgc3RhdGljIGludCBpbnRlbF9kZ19t
dGRfcmVhZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IGZyb20sDQo+ID4gPiBzaXplX3Qg
bGVuLCBAQCAtNTQxLDE3ICs1NTcsMjUgQEAgc3RhdGljIGludCBpbnRlbF9kZ19tdGRfcmVhZChz
dHJ1Y3QNCj4gPiBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJvbSwgc2l6ZV90IGxlbiwNCj4gPiA+
ICAJaWYgKGxlbiA+IG52bS0+cmVnaW9uc1tpZHhdLnNpemUgLSBmcm9tKQ0KPiA+ID4gIAkJbGVu
ID0gbnZtLT5yZWdpb25zW2lkeF0uc2l6ZSAtIGZyb207DQo+ID4gPg0KPiA+ID4gKwlyZXQgPSBw
bV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KG10ZC0+ZGV2LnBhcmVudCk7DQo+ID4gPiArCWlmIChy
ZXQgPCAwKSB7DQo+ID4gPiArCQlkZXZfZXJyKCZtdGQtPmRldiwgInJwbTogZ2V0IGZhaWxlZCAl
emRcbiIsIHJldCk7DQo+ID4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ID4gKwl9DQo+ID4gPiArDQo+
ID4gPiAgCWd1YXJkKG11dGV4KSgmbnZtLT5sb2NrKTsNCj4gPiA+DQo+ID4gPiAgCXJldCA9IGlk
Z19yZWFkKG52bSwgcmVnaW9uLCBmcm9tLCBsZW4sIGJ1Zik7DQo+ID4gPiAgCWlmIChyZXQgPCAw
KSB7DQo+ID4gPiAgCQlkZXZfZGJnKCZtdGQtPmRldiwgInJlYWQgZmFpbGVkIHdpdGggJXpkXG4i
LCByZXQpOw0KPiA+ID4gLQkJcmV0dXJuIHJldDsNCj4gPiA+ICsJfSBlbHNlIHsNCj4gPiA+ICsJ
CSpyZXRsZW4gPSByZXQ7DQo+ID4gPiArCQlyZXQgPSAwOw0KPiA+ID4gIAl9DQo+ID4gPg0KPiA+
ID4gLQkqcmV0bGVuID0gcmV0Ow0KPiA+ID4gLQ0KPiA+ID4gLQlyZXR1cm4gMDsNCj4gPiA+ICsJ
cG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShtdGQtPmRldi5wYXJlbnQpOw0KPiA+ID4gKwlwbV9y
dW50aW1lX3B1dF9hdXRvc3VzcGVuZChtdGQtPmRldi5wYXJlbnQpOw0KPiA+ID4gKwlyZXR1cm4g
cmV0Ow0KPiA+ID4gIH0NCj4gPiA+DQo+ID4gPiAgc3RhdGljIGludCBpbnRlbF9kZ19tdGRfd3Jp
dGUoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCB0bywgc2l6ZV90DQo+ID4gPiBsZW4sIEBA
IC01ODAsMTcgKzYwNCwyNSBAQCBzdGF0aWMgaW50IGludGVsX2RnX210ZF93cml0ZShzdHJ1Y3QN
Cj4gbXRkX2luZm8NCj4gPiAqbXRkLCBsb2ZmX3QgdG8sIHNpemVfdCBsZW4sDQo+ID4gPiAgCWlm
IChsZW4gPiBudm0tPnJlZ2lvbnNbaWR4XS5zaXplIC0gdG8pDQo+ID4gPiAgCQlsZW4gPSBudm0t
PnJlZ2lvbnNbaWR4XS5zaXplIC0gdG87DQo+ID4gPg0KPiA+ID4gKwlyZXQgPSBwbV9ydW50aW1l
X3Jlc3VtZV9hbmRfZ2V0KG10ZC0+ZGV2LnBhcmVudCk7DQo+ID4gPiArCWlmIChyZXQgPCAwKSB7
DQo+ID4gPiArCQlkZXZfZXJyKCZtdGQtPmRldiwgInJwbTogZ2V0IGZhaWxlZCAlemRcbiIsIHJl
dCk7DQo+ID4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ID4gKwl9DQo+ID4gPiArDQo+ID4gPiAgCWd1
YXJkKG11dGV4KSgmbnZtLT5sb2NrKTsNCj4gPiA+DQo+ID4gPiAgCXJldCA9IGlkZ193cml0ZShu
dm0sIHJlZ2lvbiwgdG8sIGxlbiwgYnVmKTsNCj4gPiA+ICAJaWYgKHJldCA8IDApIHsNCj4gPiA+
ICAJCWRldl9kYmcoJm10ZC0+ZGV2LCAid3JpdGUgZmFpbGVkIHdpdGggJXpkXG4iLCByZXQpOw0K
PiA+ID4gLQkJcmV0dXJuIHJldDsNCj4gPiA+ICsJfSBlbHNlIHsNCj4gPiA+ICsJCSpyZXRsZW4g
PSByZXQ7DQo+ID4gPiArCQlyZXQgPSAwOw0KPiA+ID4gIAl9DQo+ID4gPg0KPiA+ID4gLQkqcmV0
bGVuID0gcmV0Ow0KPiA+ID4gLQ0KPiA+ID4gLQlyZXR1cm4gMDsNCj4gPiA+ICsJcG1fcnVudGlt
ZV9tYXJrX2xhc3RfYnVzeShtdGQtPmRldi5wYXJlbnQpOw0KPiA+ID4gKwlwbV9ydW50aW1lX3B1
dF9hdXRvc3VzcGVuZChtdGQtPmRldi5wYXJlbnQpOw0KPiA+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+
ID4gIH0NCj4gPiA+DQo+ID4gPiAgc3RhdGljIHZvaWQgaW50ZWxfZGdfbnZtX3JlbGVhc2Uoc3Ry
dWN0IGtyZWYgKmtyZWYpIEBAIC03MjIsNiArNzU0LDE3DQo+ID4gPiBAQCBzdGF0aWMgaW50IGlu
dGVsX2RnX210ZF9wcm9iZShzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYXV4X2RldiwNCj4gPiA+
ICAJCW4rKzsNCj4gPiA+ICAJfQ0KPiA+ID4NCj4gPiA+ICsJcG1fcnVudGltZV9lbmFibGUoZGV2
aWNlKTsNCj4gPiA+ICsNCj4gPiA+ICsJcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVsYXko
ZGV2aWNlLA0KPiA+IElOVEVMX0RHX05WTV9SUE1fVElNRU9VVCk7DQo+ID4gPiArCXBtX3J1bnRp
bWVfdXNlX2F1dG9zdXNwZW5kKGRldmljZSk7DQo+ID4NCj4gPiBzb21ldGhpbmcgbG9va3Mgc3Ry
YW5nZSBoZXJlLi4uDQo+ID4gb24gdGhlIGZ1bmN0aW9ucyBhYm92ZSB5b3UgZ2V0IGFuZCBwdXQg
cmVmZXJlbmNlcyBmb3IgdGhlIHBhcmVudCBkZXZpY2UNCj4gPiBkaXJlY3RseS4NCj4gPiBCdXQg
aGVyZSB5b3UgZW5hYmxlIHRoZSBycG0gZm9yIHRoaXMgZGV2aWNlLg0KPiA+DQo+ID4gSWYgSSBy
ZW1lbWJlciBjb3JyZWN0bHkgZnJvbSBzb21lIG9sZCBleHBlcmltZW50cywgdGhlIHJwbSBpcyBz
bWFydCBlbm91Z2gNCj4gPiBhbmQgd2FrZSB1cCB0aGUgcGFyZW50IGJlZm9yZSB3YWtpbmcgdXAg
dGhlIGNoaWxkLiBTbyBJJ20gd29uZGVyaW5nIGlmIHdlDQo+ID4gc2hvdWxkIG9ubHkgZG8gdGhl
IGNoaWxkIHdpdGhvdXQgdGhlIHBhcmVudC4NCj4gQWdyZWUgcGFyZW50IGNhbid0IHJ1bnRpbWUg
c3VzcGVuZCBpbmQgaWYgaXQgaGFzIGFjdGl2ZSBjaGlsZC4NCj4gTGV0IHRoaXMgZHJpdmVyIGhh
dmUgaXQncyBvd24gZ2V0L3B1dCByb3V0aW5lIGluc3RlYWQgb2YgcGFyZW50Lg0KPiBUaGFua3Ms
DQo+IEFuc2h1bWFuIEd1cHRhLg0KDQpJIG5lZWQgdG8gd2FrZSBERyBjYXJkIGJlZm9yZSB0aGUg
TVREIGRldmljZSBpcyBlc3RhYmxpc2hlZCB0byBzY2FuIHRoZSBwYXJ0aXRpb24gdGFibGUgb24g
Zmxhc2guDQpUaHVzLCBpZiBJIG1vdmUgcnBtIGRvd24gdG8gTVREIGRldmljZSBJIHNob3VsZCBl
bmFibGUgYW5kIHRha2UgcGFyZW50IChhdXhpbGlhcnkgZGV2aWNlKSBycG0gYW55d2F5Lg0KQ29u
c2lkZXJpbmcgYWJvdmUsIGlzIHRoaXMgbW92ZSBpcyBqdXN0aWZpZWQ/DQpBbHNvLCBNVEQgZHJp
dmVycyB0ZW5kIHRvIGVuYWJsZSBwYXJlbnQgcnBtLCBub3QgaXRzIG93biBvbmUuDQoNCi0gLSAN
ClRoYW5rcywNClNhc2hhDQoNCg0KDQo+ID4NCj4gPiBDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtA
aW50ZWwuY29tPg0KPiA+IENjOiBBbnNodW1hbiBHdXB0YSA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwu
Y29tPg0KPiA+DQo+ID4gPiArDQo+ID4gPiArCXJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9n
ZXQoZGV2aWNlKTsNCj4gPiA+ICsJaWYgKHJldCA8IDApIHsNCj4gPiA+ICsJCWRldl9lcnIoZGV2
aWNlLCAicnBtOiBnZXQgZmFpbGVkICVkXG4iLCByZXQpOw0KPiA+ID4gKwkJZ290byBlcnJfbm9y
cG07DQo+ID4gPiArCX0NCj4gPiA+ICsNCj4gPiA+ICAJbnZtLT5iYXNlID0gZGV2bV9pb3JlbWFw
X3Jlc291cmNlKGRldmljZSwgJmludm0tPmJhcik7DQo+ID4gPiAgCWlmIChJU19FUlIobnZtLT5i
YXNlKSkgew0KPiA+ID4gIAkJZGV2X2VycihkZXZpY2UsICJtbWlvIG5vdCBtYXBwZWRcbiIpOyBA
QCAtNzQ0LDkgKzc4NywxMw0KPiA+IEBAIHN0YXRpYw0KPiA+ID4gaW50IGludGVsX2RnX210ZF9w
cm9iZShzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYXV4X2RldiwNCj4gPiA+DQo+ID4gPiAgCWRl
dl9zZXRfZHJ2ZGF0YSgmYXV4X2Rldi0+ZGV2LCBudm0pOw0KPiA+ID4NCj4gPiA+ICsJcG1fcnVu
dGltZV9wdXQoZGV2aWNlKTsNCj4gPiA+ICAJcmV0dXJuIDA7DQo+ID4gPg0KPiA+ID4gIGVycjoN
Cj4gPiA+ICsJcG1fcnVudGltZV9wdXQoZGV2aWNlKTsNCj4gPiA+ICtlcnJfbm9ycG06DQo+ID4g
PiArCXBtX3J1bnRpbWVfZGlzYWJsZShkZXZpY2UpOw0KPiA+ID4gIAlrcmVmX3B1dCgmbnZtLT5y
ZWZjbnQsIGludGVsX2RnX252bV9yZWxlYXNlKTsNCj4gPiA+ICAJcmV0dXJuIHJldDsNCj4gPiA+
ICB9DQo+ID4gPiBAQCAtNzU4LDYgKzgwNSw4IEBAIHN0YXRpYyB2b2lkIGludGVsX2RnX210ZF9y
ZW1vdmUoc3RydWN0DQo+ID4gYXV4aWxpYXJ5X2RldmljZSAqYXV4X2RldikNCj4gPiA+ICAJaWYg
KCFudm0pDQo+ID4gPiAgCQlyZXR1cm47DQo+ID4gPg0KPiA+ID4gKwlwbV9ydW50aW1lX2Rpc2Fi
bGUoJmF1eF9kZXYtPmRldik7DQo+ID4gPiArDQo+ID4gPiAgCW10ZF9kZXZpY2VfdW5yZWdpc3Rl
cigmbnZtLT5tdGQpOw0KPiA+ID4NCj4gPiA+ICAJZGV2X3NldF9kcnZkYXRhKCZhdXhfZGV2LT5k
ZXYsIE5VTEwpOw0KPiA+ID4gLS0NCj4gPiA+IDIuNDMuMA0KPiA+ID4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
