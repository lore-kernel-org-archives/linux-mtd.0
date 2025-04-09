Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534B5C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 09:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ImJZ91CVTQA8eDnnARnvYV9JPtkYwCK11dBahST8TWg=; b=Mq7Ak3yUegwxFc
	SqQI9p5jG/xZT308xzjY+l/D6c89XgnEAH4OvNB65ZP/fTn2jHrKTpGrrf8Zytj1cvX2kh7aCXk6S
	0IuHlcGZakA1oLhwB5VlIYcGS4+O0CYVJ3CiHTGZ7yLfxV6V/QR18SPS8MtG5p6SDdIgtaPj6Nr2M
	GH00sxjlVxfbD/zPo0s1KniqyWFAfAPwDl3J4Z6xT932U9+7+ts+scwzQZ2XwmOGghs5YkjKbXwQ7
	pofK6+pHOW8ZxXaWC5Ieh7e2DCuIlVN/AyXe00g4MPkp0CvQ8m42tsLz88+/8Yydb4mopYeCEidOG
	f/ShW+y4UShDSktMvpig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2RoX-00000006ig6-0Mbg;
	Wed, 09 Apr 2025 09:33:45 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2RoU-00000006ife-0ijp
	for linux-mtd@lists.infradead.org;
	Wed, 09 Apr 2025 09:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744191222; x=1775727222;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MKiONanr/XYBwMRd8gXnGNInqHZ6hciEso3Xfv9Mq5U=;
  b=aKk2Fybi+R1YkwCJTJQu+NKLxrodXR+KqtlC/NXPE3jbQh819J4U2XKU
   6ct4Lt6DLM0uFMzMijAHIYJh7p82DMQYychKZjGKUoD+eWc6rTrycJpHd
   yfqxTU/uoRXMyamJvfpKXBnAYsayJThCPMvk6o1Mw2zN55PI+J318cAVr
   gXvuWZV3FEwgo0lGw6E3ephCXleqSHluRKRfPzfvR2mLlVoBWQ7AtIYOj
   SissgYuseMb9XzIoTf2/kfVyGCGt0ko+DgmrarMTIJQa1CtQs35XUBd5H
   zQb59QRr7f+oAy9ue5yBXWXQeOn2IRQiomuPSLPs0DeXD5Fe/qVZpKaZ3
   g==;
X-CSE-ConnectionGUID: ZvbfQeKNTcW+/l/Dyv8ecg==
X-CSE-MsgGUID: IOqYvs0eR7+nycY+5F1Mhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45670218"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45670218"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 02:33:40 -0700
X-CSE-ConnectionGUID: PzY14DsaTgaT5JrJit4RxA==
X-CSE-MsgGUID: T3XT0J+XRoScQNEBkitrlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="128444747"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 02:33:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 02:33:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 02:33:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 02:33:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYDlvxlLIM2wF7wwfXxVY5w3/LKUklGgEJtscxb1EDmeq7/WqKLTtpKxtKxWzQ++YUGik9w9npDTNU7wQOh2hLwncEtGeGgSML12hPEnrn3NUUvkI1HC9AIsboeL9/Rs4nAjHIall4OMroTs8BYhEDyTHKT56KryBkhkc3ar8usSkKSGSKmkvyn4rdRSQTX5lrV8r4Hen/iHpDn9nZmJBsixaR3dm0veLExTChFC40W51ur1ydBpzoToQY2QgMe6CmfI/OdvCt6WEdpSFqC/t2xdR6aJTx74dlFa0/Ra7VpytrESGNJc4A3g5lc85z2wcduUDwZvpq3O+8maHVr/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKiONanr/XYBwMRd8gXnGNInqHZ6hciEso3Xfv9Mq5U=;
 b=ZD2JCSzsTL7VUA1Bcdy4mgd7YTB1M+jADw5Hs0Ok4L74jDVMyu4GP1burhy+hcA6Juv8e+LN7oABGgIZgRiuXoN0XSi4GG4WarwoE2rG0BZmTG3CSlu+emLLxjP5gTAQtlT85cRXJhdp2QwnO/i+esi0+YboatReq9Pb4gHp+5VJW12qkXKQostm9cRuEdeCZgEruSIydiMwpSz4xjZZYpN90dThxrSlBNxY32EI/XL2z3DsbEWDxtBuIub2zaZEuF/fgQfb+FU9rHV3DBbKBXTuVV9T+SLIZhdFjknoMgVkhJiK0e8ejYoEDi2ay1AIUQZIHgKBoDV9P6DC7MIPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 09:33:12 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8606.035; Wed, 9 Apr 2025
 09:33:12 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
	<thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
	<tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev,
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
	<oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 00/12] mtd: add driver for Intel discrete graphics
Thread-Topic: [PATCH v7 00/12] mtd: add driver for Intel discrete graphics
Thread-Index: AQHbnmT6FzF2AWGKfUOq+wjcS0j5p7OFzCuAgBVZc0A=
Date: Wed, 9 Apr 2025 09:33:12 +0000
Message-ID: <CY5PR11MB6366C5723305E479BE00494BEDB42@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
 <Z-RUEVrst6WWzDUa@intel.com>
In-Reply-To: <Z-RUEVrst6WWzDUa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DM3PR11MB8683:EE_
x-ms-office365-filtering-correlation-id: 0adbcbbd-bc54-44dd-7c27-08dd77498c12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bXg1M1NFcFdiV3FHTGRtUGhtMDZBY0ZPRjBxN2lZU1RDSWZWUnUxVDJMSHdX?=
 =?utf-8?B?T213L1BOTmRMZThIb2JUdVZTWlE1djh2NjNJNDVUWkYyMTFxVWdFa3lBbnlU?=
 =?utf-8?B?bE9tOThJd3hrbHFoa2NMTEt3WkhZNkxYeEV6dURqZ1FKVHlpd0FkeERkQ04z?=
 =?utf-8?B?REZlRTJmSjRMNTlaQjlpSDhHbS9OYXJZRmNCWU9xdm1NcVhVU0Z6am1mQnc4?=
 =?utf-8?B?VU96S28xckJIM25SY1hjSHk3QUhtZU0zRWN5KzlVSmFGb2xRV3RCbWR4UzVj?=
 =?utf-8?B?clR0NGtwNjlXNEhHempXdEk2WHhaVDF5QjBURzVQTnV0b3hwUy9NUmJtZlZS?=
 =?utf-8?B?ZE4wdE9FYTEya1BsR2JmNnFFdU1aZjU4bmN2S0ZYd3BmMHRIajdsZ0FrT2l5?=
 =?utf-8?B?REtuakJPczd5Wm93Q0YrT3JTZ3hGZ1ZqQkNlZmVPeGJCUTIzSTBwdmhhUWFD?=
 =?utf-8?B?cEFlUnF6NlRQU3RKWXErcjh3eHV6RDA0eU8zYjNzOElUSExRSU11MFJVMG9n?=
 =?utf-8?B?UE5nR1U1TVBlSjRTR3RyWGpRZUpiczJkVUkxaSt1L3k1STRPaWRLRURaR21v?=
 =?utf-8?B?Sm94aUlYWDV5bUFvYmMwa0dUYm8xeVJjRlZmR1MrcFpBKzNqblRoM1ByWm1T?=
 =?utf-8?B?eENlT3JUdkt2YWpxMCtwbFpFL3RoTVQxZlNidFJsNElBWHdTZG9hcC9aTDBs?=
 =?utf-8?B?WkV1ZVM4VnBqRUdJeTU5ak16TzlGZWFUWmhlZldzNHpaVUl0MzVURlNGWGRh?=
 =?utf-8?B?d1hZdVA3MHI4UzRCcXczSlVuVk1UQXB0ckNycnpHVjFTMUplL0x6cXdtcE1Y?=
 =?utf-8?B?UFlxQXhyS0ROOEY1RlF2SEFDdmxoVjlzOVFxODYvOGF1U2hyNHhyZW51blMr?=
 =?utf-8?B?S04zVGNpSXhRK0ovR1RCMG5Hc0dXRXlQMFVScmdpN1pRTlRNajU1bnUwQ0JS?=
 =?utf-8?B?dUR0S1orOFJIYTRobWhuS29WbDh5RmJhbVNrN2d0dWEzNmxaRGdPZ3lXbFNY?=
 =?utf-8?B?QkxTZVpXdi9hUG1MTld5dktnVzhoS25LSkd5QklZOHBDUWRjREJjMUZNYmhy?=
 =?utf-8?B?OHhiYjNsczlic0prV0RCWTl1cmVIdFJHblRHckpXY0lvTHc1WEpwcXM4OVlt?=
 =?utf-8?B?WTNiTXNPeDR5UGRpRE9Yczk5WFZKQkVGcU9nYWdMbDdIWk9WR210elFrWlZI?=
 =?utf-8?B?QXFqNDM1TVlha1BaZWxFNGIwaXBYTUl2TFEzOXl4WkxEU3QvT3U0VDlnanF0?=
 =?utf-8?B?QVhRaFhOQUJNWml1WU8xY3R5VEdHVWRONWVXMVNGaFBTR1hkZjg0V2dUUzRy?=
 =?utf-8?B?YVpiYTNuRFk5S3EvczV1YldUclpta0J5Q0FhcDFWNHM0aGtBajU5eXVVZ3gr?=
 =?utf-8?B?V0c5bUg3ZEhSTDh4amlZUW96c2tDaTBwZitrZTNpUUwrN05aTThyWXV2T3JG?=
 =?utf-8?B?S2VIbVAvS2o5NktMZ3BTQmdIYm1OQnI3UXlVeWlxSWhUSEE5VE1IWUU3WUg1?=
 =?utf-8?B?UlJydG5LV2w4YnFhbGphQVJhZFE5RFU5QkVJc1dxS1RoQTFNOFNyOEVaYlBG?=
 =?utf-8?B?ejJSWUw5YmNocFd2OUJmdUJCVVlWd0tvSEtzcnpTbUxVUml3dHlON2diTElw?=
 =?utf-8?B?SllPSFZRT3ZZNlB4TTN4eDE4T0tNQ1lWMXJtMm1wTGRrYkt1VzNmQzd1d0Zk?=
 =?utf-8?B?MEdFZkJibVJhMWVDN09DOEVRR3RFWnNBNDJNamMwY25hK3k5VllWOUF1SThY?=
 =?utf-8?B?d0RXMmJJWUZuZ2M3MjBlRngvVTZBWHArSEczSjVxNnljaHZMTjlGTDh6WDUy?=
 =?utf-8?B?Z015dk1Rc0p0T05haXVQQ0ZTQ25LMzE1bjRIdkVSb3dBRUhqaDk3dkVneUVt?=
 =?utf-8?Q?tEu5FlAKbH5wd?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0ZtT0h0Z0RCMmNvNDFyR3IzZTBDaVR5MnZVaEozSkNUWkN6UWV4VWU3VXc1?=
 =?utf-8?B?eGlNQ2pkQWNxTkQ0Y3RSc0ZWOHNReE9XSDVBckNncjZ6bkpNUmt3NGljODRQ?=
 =?utf-8?B?bUltMGY3S2txT2QxNmhBSENzZXN4QnFUZWp6UWZjeFlVQkRBUHpNdythSGJk?=
 =?utf-8?B?ZzhVdjgwTFJ4NkRFbzlWT0d6TEJCYURjYWNrQytia29LemlRb1BPRnN2SWNC?=
 =?utf-8?B?K0NqSFptTWRDc1g0c1NXZzk1REhCSzRDUlpLK3lSSVZhMEg1bXQ4bnU0VU1V?=
 =?utf-8?B?M2VCTnROT1VMb1FwaGFpZVRzZm8xcWtUL1ZYYVBaSGRuUVFRWjRrUnRSL3c5?=
 =?utf-8?B?cW5lQXI0RnE1MjBkcE90VFBWbHVzN3BSS2dkbUtwU2RiL0FUTTNOMk1YczdO?=
 =?utf-8?B?aENwdW5jRGVXYytUazZvVnVQL21hTGNrWHpMRDc3VitJY2pzeFRLc2IydkJT?=
 =?utf-8?B?TVE3Wk5QN1daRko0am9lS2o5Sjcra3FTR2l6ek0yR1FGemZBWG1leVh4b1p2?=
 =?utf-8?B?UjJQNWxhbTVFcktJUmVrZ1FZOVBLVDFPVVVBSTYvZ3ZHMCtjeU9oRTE2UGxK?=
 =?utf-8?B?UlVzMytuTVZiY2l0bU1PUHZON0ZxWXBvdmxEbzQyZFRqMEFCdlEzSTk2SDM0?=
 =?utf-8?B?MGV1SE5QK0ZjMHFJaHdrNzkxV1V1ZEQ3c1ZyLzQ2U3AxWVB1dWpVb3d5MVRm?=
 =?utf-8?B?NmhmUm50bU1yVStYYkhJNEI3c1lGMUZiSHB2SzlzWlZVWkYycTdaaU1zaWJ2?=
 =?utf-8?B?aFFrTmJDY0pzZ2o1M2V5QnBmR3JYVERBTjRXU1NyUFYyS1NFeWozMTlkTmFG?=
 =?utf-8?B?RG5EQVlWb2Y5c0paWXRPTm1rNGw4dlJoc3dkWUtmZVNvNDgveXRDb0JZNWZ1?=
 =?utf-8?B?djhBa3Z0MnlLR2RhZmZHYTQzVi8wVXpJOWt1dDdvOTljSnJJWlNSa0hxbTRP?=
 =?utf-8?B?TzhmbThTTHYwV1pnODNqdzR1YzRyTnRsNTAvQ0dsc2l6OCtQUWJwdHUvOGpD?=
 =?utf-8?B?c2FUZ3l1WXFuS0dpNWFIZVZuZzlxUHdwbTFoK3lzMTlGUnJFNFYxaEIrcGli?=
 =?utf-8?B?MWJaZXJZSW5ZZkpJTXJlMHpXMWV5dFY0UWJvanhnVElJZjg2bzJ4WFJ2MHA3?=
 =?utf-8?B?NmJ3N0UwWkxJeXMvUXU2bG1HcWszdUJBRG1LSnoyczMvRjRoT0o0QlhuN1FX?=
 =?utf-8?B?RHlISzdNbkNWQTNJMVg5cytYQU5ZR29jTElFSVJZc1RLa1RjZUNFWDdVc2Zh?=
 =?utf-8?B?MXVEcTRpbVVWbTF5RGdwTXNiVVFWRUtVbVc2MjdSbDRnRHRaTm0wSWpmVDhW?=
 =?utf-8?B?bFpsTnVna2NtV043Y3k2cFJhUGFubmpxVVpEU05yK0o5eHBPNUErYm16d3g0?=
 =?utf-8?B?Qm45NDMycmdFOGlza2lkQ1NyZ3RZOUVFMWg5QnVpZnpKYk96TGlUS1lvdkNz?=
 =?utf-8?B?Rk5FTyt6aVUzOXo4ZndySXdyN3FnNXhLV3VWNnVOTnFkNnlpOGFNdUFJbCto?=
 =?utf-8?B?ZWZ4Wm4vblAwdUhhNUFzZVRteVlxRElPdm5PR05VRTVwOEhRUjRzbkhldjgr?=
 =?utf-8?B?YXA3alloeFVmalYrQk9pdmhyeHFhNitWc3J4eXBRTURGcW1mdlR2R1RDbXU4?=
 =?utf-8?B?UWREQ1RwN3EzRjB0aitDMFZ2YUxOcEJHbjJ4d1RYczdvUGprcGpRRVVVcW83?=
 =?utf-8?B?WVk1MlpsbWdsaTM0NTZrelU4T1U5NDVmNlRPN0VyZ3NIcEFPWWcyMjVuRkhp?=
 =?utf-8?B?cXdqVHBJSFlOT1VSK1U0YTN0eC9hckpIUFBxVFNMV0FVN0FnMUN5ajhzcjdl?=
 =?utf-8?B?ZmpwMWp3YjNJVHR6K0NIeXhpY1Y5UEZCamFDMzFrUlAyMmtJS2RtaWtYb1pL?=
 =?utf-8?B?UUd2UlltTEhPQW9GLzZXMHRxakh5RlFqZHNTRm1vaFloU0VFU1YxYldKK3lZ?=
 =?utf-8?B?bkdxYWQvZzVIUElxVXk5Z3JTRktkT3haeW9qRXNaaEhHM1dlUWlQejlzM0Rh?=
 =?utf-8?B?OTV6TWZNOTZXN0JQTTR2Ulc4Wm4vRjNweVRNRTFtZXlNdG5BcmxKT08yZDZX?=
 =?utf-8?B?SDhoMklpOWg3SGFZS29oOHFrSVZTYjNPc2RyY28rM2ZiY0dnWDVRSDhEOVly?=
 =?utf-8?Q?rbWkAcmKmc11PubGDueblt3kK?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0adbcbbd-bc54-44dd-7c27-08dd77498c12
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 09:33:12.2634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DC2dAkpokUVucnyxzKNKS9SaDwmHS3Gng0cQHzUgeA12cu82j6B9yE/GWsjjkXosXF72AzWC4K64vxs/8jcltbC4FFJvG1dm3lknEX9RznM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8683
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_023342_309276_2D7DA021 
X-CRM114-Status: GOOD (  26.34  )
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

> On Wed, Mar 26, 2025 at 05:26:11PM +0200, Alexander Usyskin wrote:
> > Add driver for access to Intel discrete graphics card
> > internal NVM device.
> > Expose device on auxiliary bus by i915 and Xe drivers and
> > provide mtd driver to register this device with MTD framework.
> >
> > This is a rewrite of "drm/i915/spi: spi access for discrete graphics"
> > and "spi: add driver for Intel discrete graphics"
> > series with connection to the Xe driver and splitting
> > the spi driver part to separate module in mtd subsystem.
> >
> > This series intended to be pushed through drm-xe-next.
> >
> > V2: Replace dev_* prints with drm_* prints in drm (xe and i915) patches.
> >     Enable NVM device on Battlemage HW (xe driver patch)
> >     Fix overwrite register address (xe driver patch)
> >     Add Rodrigo's r-b
> >
> > V3: Use devm_pm_runtime_enable to simplify flow.
> >     Drop print in i915 unload that was accidentally set as error.
> >     Drop HAS_GSC_NVM macro in line with latest Xe changes.
> >     Add more Rodrigo's r-b and Miquel's ack.
> >
> > V4: Add patch that always creates mtd master device
> >     and adjust mtd-intel-dg power management to use this device.
> >
> > V5: Fix master device creation to accomodate for devices without
> >     partitions (create partitoned master in this case)
> >     Rebase over latest drm-xe-next
> >     Add ack's
> > V6: Fix master device release (use rigth idr in release)
> >     Rebase over latest drm-xe-next
> >     Grammar and style fixes
> >
> > V7: Add patch with non-posted erase support (fix hang on BMG)
> >     Rebase over latest drm-xe-next
> 
> There are 2 things that I should had noticed earlier and mentioned to you.
> I'm sorry for forgetting that.
> 
> 1. Rebase on drm-tip branch of this repo:
> https://gitlab.freedesktop.org/drm/tip
> We merge to drm-xe-next, but development and CI happens on drm-tip.
> 
> 2. Please also send to intel-xe@lists.freedesktop.org Xe CI only runs on that
> mailing list. intel-gfx is for i915.
> 
> No need to rebase or resend right now. Let's wait for a few reviews,
> then we rebase and resend.
> 

Do not see flock of reviewers for this one...
Can you, please, review the last patch? This one is a new one.
All other are already acked.
Then I'll re-spin the series with right base and cc.

- - 
Thanks,
Sasha


> Thanks,
> Rodrigo.
> 
> >
> > Abliyev, Reuven (1):
> >   drm/xe/nvm: add support for non-posted erase
> >
> > Alexander Usyskin (11):
> >   mtd: core: always create master device
> >   mtd: add driver for intel graphics non-volatile memory device
> >   mtd: intel-dg: implement region enumeration
> >   mtd: intel-dg: implement access functions
> >   mtd: intel-dg: register with mtd
> >   mtd: intel-dg: align 64bit read and write
> >   mtd: intel-dg: wake card on operations
> >   drm/i915/nvm: add nvm device for discrete graphics
> >   drm/i915/nvm: add support for access mode
> >   drm/xe/nvm: add on-die non-volatile memory device
> >   drm/xe/nvm: add support for access mode
> >
> >  MAINTAINERS                           |   7 +
> >  drivers/gpu/drm/i915/Makefile         |   4 +
> >  drivers/gpu/drm/i915/i915_driver.c    |   6 +
> >  drivers/gpu/drm/i915/i915_drv.h       |   3 +
> >  drivers/gpu/drm/i915/i915_reg.h       |   1 +
> >  drivers/gpu/drm/i915/intel_nvm.c      | 115 ++++
> >  drivers/gpu/drm/i915/intel_nvm.h      |  15 +
> >  drivers/gpu/drm/xe/Makefile           |   1 +
> >  drivers/gpu/drm/xe/regs/xe_gsc_regs.h |   4 +
> >  drivers/gpu/drm/xe/xe_device.c        |   5 +
> >  drivers/gpu/drm/xe/xe_device_types.h  |   6 +
> >  drivers/gpu/drm/xe/xe_heci_gsc.c      |   5 +-
> >  drivers/gpu/drm/xe/xe_nvm.c           | 161 +++++
> >  drivers/gpu/drm/xe/xe_nvm.h           |  15 +
> >  drivers/gpu/drm/xe/xe_pci.c           |   6 +
> >  drivers/mtd/devices/Kconfig           |  11 +
> >  drivers/mtd/devices/Makefile          |   1 +
> >  drivers/mtd/devices/mtd_intel_dg.c    | 884
> ++++++++++++++++++++++++++
> >  drivers/mtd/mtdcore.c                 | 141 ++--
> >  drivers/mtd/mtdcore.h                 |   2 +-
> >  drivers/mtd/mtdpart.c                 |  17 +-
> >  include/linux/intel_dg_nvm_aux.h      |  29 +
> >  22 files changed, 1385 insertions(+), 54 deletions(-)
> >  create mode 100644 drivers/gpu/drm/i915/intel_nvm.c
> >  create mode 100644 drivers/gpu/drm/i915/intel_nvm.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
> >  create mode 100644 drivers/mtd/devices/mtd_intel_dg.c
> >  create mode 100644 include/linux/intel_dg_nvm_aux.h
> >
> > --
> > 2.43.0
> >
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
