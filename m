Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B35C54ED1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 06:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxepNzL/HsQAOA7zI5/imZvu+TknQRRIEjDjSwvslnQ=; b=Cc3HhGH/5T/kz4
	cOy7EyOfqVTGHcwkf6JidyJ4uk7GtwEHxpWXdSpsWC3w16O6zR7i7IUNNMtL55zrDx2vRhu3xqaD9
	3lYu/DI0Orq+7QZhtm2COCxSgICZBQ8oxfWm7rP2CAx/jV+ffcVuMIg6LTPV7RJxhu9V1kVX2VYUv
	E67D1Kplix726f7Xoi7cGT24JIKeQW9uNDu4hyzRobPNBagSk2Rel5aKUCzTyyoxIzRhCLjnyz/7P
	ra0lGUqYt02vTLxin8+WvQfoe0ImdH5+iZaWlY+/kR1JGy9CjTjdBeoRyoOZLzSnmU/b/gcGRcoRx
	SDDa0b6T66r1Ga+HOirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnMS-00000009z28-3jKf;
	Tue, 27 May 2025 06:00:28 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnMP-00000009z1h-4BPn
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 06:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748325626; x=1779861626;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=r4AjzgjHU8R6aDlRaWrkXApC8+PwZ50CPTK2OmU2Lac=;
  b=bE/53j1PJs/B6t/0XavoqCII2GtHYormoLbzBGdEB3yPT1ev1JTfm0zo
   j8Kosry7O0eQbJTXrMtCCd6pDp6rzPoopTQQnUMJOD2fQ0hrScYCBvt6v
   kMwEGgPKTv63edU6dqWQyxG8Xf4gKUnTQwEQAvDUOQcPAgoWv2R2p3OGA
   oMzz9HYKjsn70kLFqDrv6qLjJfVQjFELpLaaY1iLSaNdgBy5bn6wI3gCu
   7y9JlnUYb+QEo/5qvDA+clckPODDeApxyQcwtEta7eS5EOgqYLbXfY8bV
   4HAUp8/KbLzz/LovY9gFMbKAC/4x/hEc3/fylRDRlPTPxQT+WV1KruXCG
   g==;
X-CSE-ConnectionGUID: Cyi2YTMUSZeCcKlU8dmhWQ==
X-CSE-MsgGUID: +obuwDRDQeCuP93yP+nHmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60550491"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="60550491"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:00:25 -0700
X-CSE-ConnectionGUID: xLVKQJyMRDe/3G4yBmwCyg==
X-CSE-MsgGUID: y8527zSkQveFuc3E6pJIjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="147675897"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:00:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 23:00:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 23:00:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.43)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 23:00:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeBpTRPJQTTQILJSJnT7GRdT2ebisvygUaA8jO9e/HRBx3x+wmzYVZ67armfDG38CDiZAJ3BIafKnTwKs5Dg+OyZY5Pa4XqKk/ctzgRo2V0azFO1oHTfAFeSURWkc44wiisq48RMU2IKN0he1/AO6zS7uVeJht6OJYkJJhCu3lnFwH1rutSBhNiLBeIPZB+hTro3tgiX0EwG6zpQ249jLApgDKa/XnSJsod+ZygzcP8XQGrXuvtWj1UfyOj4Cw69aTnKsFv2z510BdJqfbJcRffxN3Ofy5HL1ZtPNHThOwKVD+lnEAbuGW/zP/eDyytlzmEvqWQobzwQVkdlfjpIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4AjzgjHU8R6aDlRaWrkXApC8+PwZ50CPTK2OmU2Lac=;
 b=s4k/JIX5cFXzIvm8sUcFrN7H7Cw3A5qyegfLVTprVHgNJNUlu53fbDH1kb12bqAaOS36gbQ1B4e4qnQDnyo1+gm1xRgJ2OLyf1/z5Xac0GWgd11GHFw3hMaXJc9bb4wRmFgAGYW7FJBucnESmNl6e6NakZt5zBDYyBcREFoLEcORvK994mrsj21zMiIPKVUmMQgF1ntJGXpVoxswlgs/dL5uSinSomvbghry6c9ey/Du6PvNHIKFKKqEtEKdUbOkdpTyveWTUDorMRmPlQCkqnakqOM/BZc3M/ygiDyKEM2THQi+8eudoq8qAyuqLNcSnVQ2PRoVNhvP1jYRR72LZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 06:00:20 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 06:00:20 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
	<thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
	<jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
	"Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
	<reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomas Winkler
	<tomasw@gmail.com>
Subject: RE: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
 graphics
Thread-Topic: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
 graphics
Thread-Index: AQHbxaAYsfXeRjkanUq+gmwHohKWMbPhn5sAgAG3RSA=
Date: Tue, 27 May 2025 06:00:20 +0000
Message-ID: <CY5PR11MB6366E83555BDF8B89C9DD6D9ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-7-alexander.usyskin@intel.com>
 <aDGdWof1HfViERND@black.fi.intel.com>
In-Reply-To: <aDGdWof1HfViERND@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB7513:EE_
x-ms-office365-filtering-correlation-id: d0be2854-2355-493f-01ae-08dd9ce3c33b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZUV6U0s0TXhRQS9CN0J0bWhRMkNmcm1McTByaUdwendKN1V4YTlHSFowM3pV?=
 =?utf-8?B?dDJ4YXRyUTRjVzBLdWJzRGx6K2JHVGFneC9kTTBsSDVPeTRyTGxTVDVhNkk2?=
 =?utf-8?B?R3dtMnNnVDI3ekcvRW55eURrWUUvMkFPVmwrck8reTBEZTdFVlFsaExjdzhM?=
 =?utf-8?B?MDd1SERRclBXZEZTVmg2ai9kc2pWZTFNY1hhbkhjRmJqb2crWnFhY1lTc1Zq?=
 =?utf-8?B?amZzVUcwbXM0cExyOWd3NFVlZ0MzZk9LcXVxU1Z6UFg4TnJ2RlFtSmxXNHp1?=
 =?utf-8?B?K2hMUWgxQVgwdVdldEJOQ2lVSFdkYWg5dHVRc0ZsdTJLd1dqQXNrMVpIUG1K?=
 =?utf-8?B?ZVZxQ2VROU9GSmZLNHMvSVVQa24xRmU5TmVFVktMakpHOHBPYzhsSVBZcnVy?=
 =?utf-8?B?V2lwT2JuUC9OWlVMN1RKZlowYm42amNtNjhqeWtzUUNXd3NqN1MvdG5yTzkv?=
 =?utf-8?B?Mk0yQWVZWlhkaXc0Y0QyNVNXRFdVT3VyRGh1NHllNVYxdjZpMkR2ZTlsVGRn?=
 =?utf-8?B?cjNlYTUwekQxeFFPWWk4MVFxYyttdUgzOVlLU1duUndlLzlxajJPcGdieTlW?=
 =?utf-8?B?U2xhTmVycTNxUXp4N3NmZ2UwSmN0OENIb0ErYTVhWE40L2VIUlZQd0l3b21N?=
 =?utf-8?B?OENpd1VXbWVTUWpjcC9tbmpmRWc3SjFtdFI3RTQ3TEVMbGNjQ3hac1VCV1ZU?=
 =?utf-8?B?R0RvVkVWTHFaUm44ZUswcUc2M0FhV0ZPZ2ZxSmxFRGFRazF0T0NWRUpmTVRT?=
 =?utf-8?B?bnpDd1c5V3lQb3NWZDZkZjltcTNrcTVuMkRoNzFGMjdEVmsrSGp5SlpueFBn?=
 =?utf-8?B?RXMxZkllaTlkdXdadmRGZFRpUXF6TkVSUy90d2E4T1RlVW8wZkJXUmtFVDMv?=
 =?utf-8?B?d2doQW5wY2Y3WnAxZGNvdGh1RzNSZ3IrajdOZXN4N1FLNFNqRjhWSnBwTXU4?=
 =?utf-8?B?TU9LU1MrRlhiRkVjR09VR0hKUm9IcFc1cTBNeHh2MVJTRVBoS2J6TFVRekw3?=
 =?utf-8?B?SnRtZ3RpTmNlek95VEx1UEpoRnhla2NlWFRqb0l3THRyMWc4ZWZ2ZlIvNmpJ?=
 =?utf-8?B?dWttQUJQbTIzOEJCcTRSWVhFMHBPRytMZFB0UktBRDI2R1Rmcnh1YkNkK2pM?=
 =?utf-8?B?V2xTNjFCeFB4TmxDbFE1dDI3TXlmVVZJMCt2NjlFNlV5MDVwYXVjY2NEam1h?=
 =?utf-8?B?dWI2VW5zU1ZlVVNKbDdMTWVSalUwMXBneEpTeFZkWXJjRTNneUs1YzU4alNw?=
 =?utf-8?B?SmpQTE1uU3lxa2p6a2Qxalg0MHJoQUMySDRlQUVkcW85UXhtR3Q2a1QwUG5N?=
 =?utf-8?B?QlRPenE1K2dlWlBPWFBUYWFIa29xT3FCWDZVc1hHSjJBVUY5dnFsYklVUzVl?=
 =?utf-8?B?azB3S3VnZnl0c1JSNVJJek9rQkFUSkhDSit2VWNIamZzN25yVk9xZFJUMXRk?=
 =?utf-8?B?VXBwdjdIc3ZlUXdoMisvekVUSmgrRjRCNUNjSnY4dUVRV1NGRjI5NFFrTG9J?=
 =?utf-8?B?R2tHRUNqL1E5MWVRS0VYQlNjdjdldlZybldlRjFkckx5SEp3TVlhZ09OZFdO?=
 =?utf-8?B?amRWUU5BbjIyNXFpT0xnYy9uQ09xbVVDYmVtdkFzRzdEcjFhK0JoSTVaNVhC?=
 =?utf-8?B?K1JTS1JFQTRWc2RRQWdUYmNOSllHV2lxVE9BV29CNDRxRTY1RGNZREZtRDdQ?=
 =?utf-8?B?ODZlTUN6a2ozb2d2eTlmQW5YYzVoWGhBaGsvdnNsWTF5WVAyaGVYQVMxcWNj?=
 =?utf-8?B?OUtxRWNvQlFRa1N0WXVPZ0xYQW5vckxRc2VHVVRqN1p5aTh4NVdsbU9GRkt1?=
 =?utf-8?B?ZnlRS3pLTXJUenBZZXlXbjVmU0tCbXN6ZWxaYXdHSmpCQmgwYXhpWS9yWElt?=
 =?utf-8?B?cmtkeUN4Um1JdVEvbkQyVkx3c0VkQU5IalFwamRoZVBrOW1wdkxaWmwxV2g3?=
 =?utf-8?B?T3VXKzgyeXNVZXV5UG52OUwrT3VncUJ4dHJDMU9UUFVXKzNVWkd6QW1laUJ0?=
 =?utf-8?Q?JHJO+PNUqUIKc3OXfCpXjSqwKS3YmQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTMxT0ZWVzB0NENpdGhVaWJiZlBDNWFWcVZTZWUvN0k0TU9GYUpLaFlLSWQ2?=
 =?utf-8?B?U3R4YzhtRUpzeHR6VXF0cjBFMVhkMUgyWlFPaVNhRmxQUTcvRHlnbEdBeTN3?=
 =?utf-8?B?WFJJaCtFV3o2dklocnJua2ZOaTJPS3hnUTRJSHdkbmF1cHZCYXlVZUlTQmUz?=
 =?utf-8?B?S240Z2pOSG11aEdqNnNYNTFneW9IVVJIdDlFQXlGdmUrTWk5cnBOb244Q1Na?=
 =?utf-8?B?NkpCOUdDVU5hQ25vYkY5cHhMNWVVaDdoSXRZcjJZOEg5MDFCRysveDBMb1NL?=
 =?utf-8?B?aVozSGgwT2xhakg3d01RbFM3dXpjS3JPOHRBZjRrbHVaSk45REFrVTF2VGZv?=
 =?utf-8?B?NXczK0RlRzY2LzNWc0ZyZkZ6c1B6Q2Z6UUhzMCt6WVllN1Rsa25yR2FKVGRO?=
 =?utf-8?B?azlTcUt3Mk5IWXF5UmwwTGhyNDcrN3VzaHB0clhJRDZVV0dQRGV1TjVibWlM?=
 =?utf-8?B?UEUydnhQNU5qZDVBTytpUFljaFFBSFI4NzVITk9FcUFUb2hERXVkbDI3MTYr?=
 =?utf-8?B?aDA1eEhKRHFUY29zWWtVcDhCMzl1TjZXTGVYU2pudmV3elNWVnRDU2RUeWNk?=
 =?utf-8?B?bko0K2FOeGhjUFErNzRtblhDREwxbDU3ajgvcVNYTENvZ3NqQkEycXZtWjd2?=
 =?utf-8?B?Q2FWaUtSd25oQUxjMm9mc0NZTjE0YkxiRnYybktEVllBUkVEREJhT0Z0VjZl?=
 =?utf-8?B?N1FRMCtlbGhkL2V0Z0ExWFdZdkpZUkVSN3lucmQ3MjIycVNkL3hrdVAycU1m?=
 =?utf-8?B?SHdGVEN2UjkxNUk1a2FUazN1dC9ZejgzN2plOG1MV0RLMDNFL1djdXhtdjJW?=
 =?utf-8?B?QSs1SUE4WThySTRLZld1VmtwU3R4Z1lLbUxTT1lSOUFiRjRFWFNmbHNMUHh2?=
 =?utf-8?B?cHN5cTZLYzYwaDVSQWlickMxczJLZXFTT2RpUnc5UHBBZUkyQXBWTDRzNS8y?=
 =?utf-8?B?bnY2dnI1dG1mMlA2SmFDWWJ1bjFVcHZUNGlMd3loSmNDak1WM3RqQjFld0FW?=
 =?utf-8?B?dEVLdlNCVjNSTFZrSXk5NkxwMHl3VXBqQWE0b3l3d2dZTHBvVllTb2kyM0or?=
 =?utf-8?B?TTRzS01WN3dFWTBRK20rSUJQa2pxSU9HKzBmQys0aHE3MHJvYVBZMm0yOGNm?=
 =?utf-8?B?OWptMzNIbWVod0lYc1IyMkd3ZE5IL3o3WUdzbVZRaXNCaGVWNVp0d1RFRU92?=
 =?utf-8?B?Vm1yZnlwRFhRekZTeUFsR01YY0xFNmhNbzhQOUw1aURQZWovMmtISFJyNmFL?=
 =?utf-8?B?VlYxMXlSSTZteHNHNzV3N2JQemRIeUV0YTV3dGRhRzFaSWlZeWdMMzBZTVVs?=
 =?utf-8?B?NEdHdG9ZUEhTVVkrUXV5R1VSL200empzU3FoZEl0dXE4dmpBS0M3R0Y0L3BF?=
 =?utf-8?B?Qkp0NC9OenVlZVluRERqSGtzK3l0WUtjMG56bHZRc1cxQkVsSmdOek9pN1kw?=
 =?utf-8?B?MU9tdmN6RHlCaUJLcmtuL2FGcTlxbHpMQklVdm01Y1crUHFkcWJ2MFNrbUZJ?=
 =?utf-8?B?K01VMGZLSXZDMmxlNUdXZXNwcWxiSEhwWG1ra1V5b2pkMTNEKzhwcmI4d0F4?=
 =?utf-8?B?US9rMWVMSTZQaTNoZWsxWmVISlBZT3JQZmVJQWZlNWlwUXo3QS90eUU5ZFlk?=
 =?utf-8?B?d1ZvTDBVUkhuRG9DQ0I3YjhaRFUwc3hzL3ZraDZnR0F6WnMrTmJMbDg1a0xQ?=
 =?utf-8?B?MFV4cHRVNWdGbHk2TC9QdU90QlVEQ1BYRUd4aUZSRlJaVVA4QlNIdjdTNGJI?=
 =?utf-8?B?eGg3MktxbTN4UnI0MUJJRGVCZkExcnRDQU5QNWNXc0pzWStXY1lGdWc3MHpO?=
 =?utf-8?B?Ryt0eG12Vkp0azNaaXZsWkEvQmhiOXRKVGhWYnZTMGFXY3F6ei9Fc01yR1di?=
 =?utf-8?B?QXVJTFd2Z1VoY1J4TloycTJ4QnFDZTFTYWYwak1zWmJIdkYyc1RZakwvSGI1?=
 =?utf-8?B?dDdueFR4SDFFTTlOdXRWTElEb2FzOWxDRndmWUZKa0lrMlVwb2RjWERvZDlW?=
 =?utf-8?B?cElJaXJqT0hQZEw2NlpwYjlja2pDMUNwYWE4b3U4V2c3bm0yNHBHd1FKZ0tG?=
 =?utf-8?B?ZkhPYVNLQ0pFeHV6N3NNaW04MlliR1ovdVBUTitaMllzVHdnWk5qejdRMGEz?=
 =?utf-8?B?YSttRHV1bDNubjNWRVZvZHhlUzVDektKZC80V0xnazJiaUlFVWRkakVHYVRs?=
 =?utf-8?B?d0E9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0be2854-2355-493f-01ae-08dd9ce3c33b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 06:00:20.2904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Zjjz2O6XlnVz2myHjPsIT4asahYyBf20EVX9Ml5DQqPfPjlEoEb9BZgoe08leeKmkO7FRfhX677eaAfZG1VJ57nJF0hXrI4K3E6S+dIc0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_230026_102443_6477E4D1 
X-CRM114-Status: GOOD (  19.83  )
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

> Subject: Re: [PATCH v10 06/10] drm/i915/nvm: add nvm device for discrete
> graphics
> 
> On Thu, May 15, 2025 at 04:33:41PM +0300, Alexander Usyskin wrote:
> > Enable access to internal non-volatile memory on
> > DGFX devices via a child device.
> > The nvm child device is exposed via auxiliary bus.
> 
> ...
> 
> > +void intel_nvm_init(struct drm_i915_private *i915)
> > +{
> 
> Lucas recently revamped xe driver to address this, so let's not hide bugs
> and return an error where possible.
> 
I can return error from this call, but the SPI failure is non-fatal for Xe.
Caller should ignore error from this init.

> > +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> > +	struct intel_dg_nvm_dev *nvm;
> > +	struct auxiliary_device *aux_dev;
> > +	int ret;
> > +
> > +	/* Only the DGFX devices have internal NVM */
> > +	if (!IS_DGFX(i915))
> > +		return;
> > +
> > +	/* Nvm pointer should be NULL here */
> > +	if (WARN_ON(i915->nvm))
> > +		return;
> > +
> > +	i915->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> > +	if (!i915->nvm)
> > +		return;
> > +
> > +	nvm = i915->nvm;
> > +
> > +	nvm->writeable_override = true;
> > +	nvm->bar.parent = &pdev->resource[0];
> > +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev-
> >resource[0].start;
> > +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> > +	nvm->bar.flags = IORESOURCE_MEM;
> > +	nvm->bar.desc = IORES_DESC_NONE;
> > +	nvm->regions = regions;
> > +
> > +	aux_dev = &nvm->aux_dev;
> > +
> > +	aux_dev->name = "nvm";
> > +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> > +		       PCI_DEVID(pdev->bus->number, pdev->devfn);
> 
> Why not just pci_dev_id()?
Will do
> 
> > +	aux_dev->dev.parent = &pdev->dev;
> > +	aux_dev->dev.release = i915_nvm_release_dev;
> > +
> > +	ret = auxiliary_device_init(aux_dev);
> > +	if (ret) {
> > +		drm_err(&i915->drm, "i915-nvm aux init failed %d\n", ret);
> > +		return;
> > +	}
> > +
> > +	ret = auxiliary_device_add(aux_dev);
> > +	if (ret) {
> > +		drm_err(&i915->drm, "i915-nvm aux add failed %d\n", ret);
> > +		auxiliary_device_uninit(aux_dev);
> > +		return;
> > +	}
> > +}
> 
> Raag
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
