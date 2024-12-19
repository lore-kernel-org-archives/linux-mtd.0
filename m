Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45912E77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yShMAYPOgCnNa/q/B9IaxABQdmfRl/Y8u02+4BhqHdA=; b=oiBNuwnlCwpRZy
	y9bOs58DksCYJra1v+hkMDyuTk2qG87n45D1QtSHkNEIyGpB8SeuQWWMdre0CHe9Paukh9rxmVEd6
	KiVGfz5cyGXPosDOrqDwBRisqz20iHW5TVMqZqRdxkgav16kWgyJsXcNgG+QjDF0RU4TBcBT2RwOK
	4ANTE/g9yRwu+v2R6IU9+RLuDV8iS/G4t9qQ1Go6UX8zfMRvBcbxw5cvXYi8l4SCG88+/SIGU5jg6
	jKJy2P1qASRZ5SjtiRThz537salupxhl11p7izKZcXCfUKWFQbdDJXQ3vb+bt4FY4flk9nVMDZJ5h
	JivPCrir0I+gkfCk7wsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tODwd-00000001Z5r-44wF;
	Thu, 19 Dec 2024 10:39:51 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tODwb-00000001Z4P-18Yh
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 10:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734604789; x=1766140789;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GwCAsnwf/U6qf/MPljt19Pl0DcMEllGZFuRzNpqYNsw=;
  b=EBqx6VdRPSoHbh86+BgT3SStP5M7CuUtV2jPFD/JrEf0msyrbfZ6591B
   P3iYp7+Py7jBIVi2X0dqK+Hsa01ruhjnyR8WmsPA59rrFPkyAM+25RMZR
   Ww6Yy4LEjcphDSwS4LDj5L25tok65cKKC/F1eYiz2QspWtU1k3NQT2w9s
   K0e6zGX7JXj0VSH+hLQLXkmF/rCpitEN8Pl3h6NMPatHd2iQ2mYPdQ4HC
   BQR0vyFhMnwGiwdkqRXdzgT2ytbjBJ8WInJXp+li5aiqIrLac206Trd8T
   JpU4f3dOoVBmN19RRvpYfvGUmwy5vJl7mg74K2HZeKbzFyZN4Yvm8u2dz
   g==;
X-CSE-ConnectionGUID: 2mJqEWA1Si2n4fAmWbfp1Q==
X-CSE-MsgGUID: YPTl79BaRNyFTOUKJJo0xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="57585188"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="57585188"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 02:39:47 -0800
X-CSE-ConnectionGUID: TjegMOejQMG2wKm851OMJQ==
X-CSE-MsgGUID: 8LDwROcMTA2FxMF1dEWjJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="98682766"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Dec 2024 02:39:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 02:39:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 02:39:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 02:39:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLVZKfX1L+CXUUkV9QLBxVgcr62RyQyhnJrc6v+0bK05mF429JZX4cqw5K9QfyO6mYIxj09jcu7zqlazNw2eExV0uEZ8ykN5SS0gOg6hi5035sbeFLTr5q0yqRTPeCaITTCwaFrMNp7oKTI0HfSOjIwzpTNuplTVt0CRwWXWFhRJ1css7PjI/S9/+RJtFvtdEMdBRZO1JcbuanCW18W4q6rsxucPSBDq7hteSBLxL9MWfaJoq+yb5zVkAskVq3Os8s0oQdJH+dvj/h/lZgs9d7ro2DMupPTOOB9DGpk/sycmRvbk7ImQyFafNLDPMqf/34KGMSwx3T7bLCuG0EqG4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwCAsnwf/U6qf/MPljt19Pl0DcMEllGZFuRzNpqYNsw=;
 b=Ls0W3oORoSEHq0jZxGCXJaWuyjDsRGmJdo0IX/va0AF5zyI1nBBRode2pO+w+ADkpOqPK61CXg/Fec96YTOH6igOK/sYQvJ2d521h2+pPZ71Y7n6GgCk2B+aHL5l9RNrpbGvr0lxRz4cVuLxY/zxrsdTvGk/6V/MkQSNIKoqRpvbXAxRDNre0dvlRrcuG4mPW4vc9X1KbTZIgbsTOOIgfiw/ZyRr0AMBtER5LKvOwaKjWrK9Ox/wh2HoQNkmObcLe/aX2tvBR+1Wn9FuWKN7V2+Rqx2DEGOShoyiqgopfDjYtJ7nrUcZWbcRMnVL2Ez/mWbOx0ldW9StJvauYkH21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SJ2PR11MB8499.namprd11.prod.outlook.com (2603:10b6:a03:578::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 10:39:37 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 10:39:37 +0000
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
	<tursulin@ursulin.net>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomas Winkler
	<tomasw@gmail.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: RE: [PATCH v3 03/10] mtd: intel-dg: implement access functions
Thread-Topic: [PATCH v3 03/10] mtd: intel-dg: implement access functions
Thread-Index: AQHbOo0x+BaFVUhnyE6oVC/Zg/egErLrNmeAgAJXVSA=
Date: Thu, 19 Dec 2024 10:39:37 +0000
Message-ID: <CY5PR11MB6366ACD36AF6AC5B967A57B1ED062@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
 <20241119140112.790720-4-alexander.usyskin@intel.com>
 <Z2H_rX23gLJmJ_Nf@intel.com>
In-Reply-To: <Z2H_rX23gLJmJ_Nf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SJ2PR11MB8499:EE_
x-ms-office365-filtering-correlation-id: d8fa289c-454d-4470-cd93-08dd20196fa8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?elZuT3ZaYXhhL1l1eGJsbHlpMUE0Zm9Hc2VOTlhZcTVrOTVQRElRNE40U1JP?=
 =?utf-8?B?Ui9EdlpISHd0MGk2VzdTaXFqZVNnbXlUWFJDMHhRYmQwNG02eCthbUc2TEdO?=
 =?utf-8?B?Z2pJR2ZxcHlzc0lhVTZKQkZWUHJBSHZ0ZG15c0dHVDN5d0lDZnZpbVN6TVp4?=
 =?utf-8?B?OUJCcjBHS2Ztc2txRVF6T3lGcFBYQUN1MGlqK2VUdnA5Zno1ZkEycmVkOUI5?=
 =?utf-8?B?aEVtL3FYbGRsQS9JSFh4MC9XNmdjRTFZTUVldHhEMUVBYWdBLy9jaENHbTZl?=
 =?utf-8?B?dVh5ciszTFd1K3h1TFhuWHdMd2gvczUrc3g5MHJHbXZTT245ejVsMGJXUWV3?=
 =?utf-8?B?WG1lYUNQcGV5UFNJODlNcUpwZFA5UHZRRm5pZ0V3djNXdi94T1BkWTBlQ1Ar?=
 =?utf-8?B?REFTcTZNcXMwREY4WERva1NFSEp2eUJSemRjdFd4NFZtQU1NbXJrRGdvckpq?=
 =?utf-8?B?Tk1kSjFtMFlnM1dFdmMvUVl1UmkzL0xCWFZVY3FGTjVYa2ZhbFVRNlkydXhT?=
 =?utf-8?B?Tk9ZeWJDTEo1NTZYWmRFYVlSb3VPRDFFVE1ob0VuTnpCQlpTR0creWM1M3RT?=
 =?utf-8?B?TDVDNnh4OE54RFVkL1h3VUNVS2xnTEh1cjZCR3VOUU56cEh3RGoxczNWTGc3?=
 =?utf-8?B?d0I2eDRMV2xsNmdMZjJGWHphbzZVRzlmSkI4eUhORDdOY2ZXY0ZQT0NwWHRP?=
 =?utf-8?B?VWVuR1U2aE9tQmZvQ2U4REJvR0FaRmkrb2l2Y3ByTkVkcFFXTFpoOGRLV0t0?=
 =?utf-8?B?RFM3WTlzL2NmbEVmVDlkbXc1SE1IQlJrRklJdmxUcU1icHdRZDdjRzNYclZu?=
 =?utf-8?B?d2hnQzRVS0VtUm15TmNOUS9yQng1UGwzbDNuand2cmVQeHA2SE42ZTlYdStx?=
 =?utf-8?B?TjVMTEJHdUFSSHB6dzRpQWFwUGFhQlZ5dk41cE1oRkd6TnF3UnJLR3NTRFRY?=
 =?utf-8?B?VWswK2hFaUV3REtjSUphdWFETDczS1hjTThWbk1HMFZYYklPUXpUZW1uU3JI?=
 =?utf-8?B?VWcxdkd1TkJnZVlwdjU1eGVjaFg2TUxPMG93bTJCRlJNNEJ4VHRVZnVNL2ln?=
 =?utf-8?B?em9nZDhzVVFzc1NvaTd1VGZwWW5UUm9yM0ZQRU9NYkVxZTg2NXdaU3dleDQ5?=
 =?utf-8?B?QWFOeHJPaGNXMU9FUlBhbHNrQkM0ZndvVitCRFZNaHpaK3lMQnRBVlZXdTJv?=
 =?utf-8?B?ODE4dXNsbEk3ZXlIV0lwd1l3Vjc1ZW93YjQyVkRRNUt1VWx1dmdPUGdGZitH?=
 =?utf-8?B?NkhRTnRsVks0NnZBUVk1dnc3QzJVb0xYSE1tZldJMDAyQlIvK0s3djYrZXpz?=
 =?utf-8?B?QzRZd1pyYklqKzlvb0tCTGtwS21RK29HSDE4TlhtMXFqeXZGTWZFbGdCQVlY?=
 =?utf-8?B?VkluSnRKOTU3WC9nYThwaitDeGlKbU5iOWxZc08rcS82bzFHZTNZenVuVjND?=
 =?utf-8?B?MmtQM3BGUTU1VEVZdHRVbmQ5dkRsQVRRRHNqWTZudnlUVG5qeGc5a09PQlcx?=
 =?utf-8?B?UG55OUNiUzlkUTl6Rnh1aURrdlZRV1NUTHlJVzVWbGFkUFJsU2ZhdEZTK3Fv?=
 =?utf-8?B?KzJ4bjhkUkFQaXdpSTc3eVpQZFViTjVFVTVLOWJFc0NIRXhteEZMbCs4OWt4?=
 =?utf-8?B?aUpUcUFQaWI0K2EzeHlmZmdOL3kyWmFIVW1majJMY3RDbGpJYXMwaW9Fa3VM?=
 =?utf-8?B?cHVsMzNDL1BKeFdTcHh1ZlJ1NTVYemhLQmFyL0hGT2o3YVVwWm4rWVQwYkpa?=
 =?utf-8?B?eERIWk81dGxEL0pPQkl5VTZaZitONCthZVgrbE05U0ltSlJyci9heGJZSGxt?=
 =?utf-8?B?UzZXOE1nUkJtVnU5dWVXNnJjdWRDNWRRUGd3R3BJenZOUGQ5MWlobFBtd2FW?=
 =?utf-8?Q?gPBf8G+d7t6tg?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEZ1VlB3UUt4amYxSUVLbnEvMzBDR0pUMllOWTJtQVVORUd0c1BVVEZhZGtt?=
 =?utf-8?B?Qk9QeHpCZTJ0aVpDNGdhNGpjWUZVYUNJOEYvQXdBZGFzNjl0T3VkSDhaWWw2?=
 =?utf-8?B?K3dONmhaRnB3bEpjeWlEOE5CSDI1T0RTeFczOHZJMkQ5L2hNMFl1aHdNY05s?=
 =?utf-8?B?OElCdUd2MEE0YWpLU29jazdtQkZLd0psdVd2RXkvK29DMkswaHg5VlBEQ2ds?=
 =?utf-8?B?WDNMYitLaWJsbUEzWUd5b1o4TzFPT0Z3OWRjRUFrTlZyQ2tCN214S3ZhTEJi?=
 =?utf-8?B?UU52Z3dCNzVBQTVqcTZzM0lXU1R2LzgwcW84empCNjJlWFlyYjR6YUNodWVE?=
 =?utf-8?B?YXZZdlZmckg1c3J0MFRINGNQcHJpd2lBODZOaFJaVlpPT0R6OTZRVEJ2WXZV?=
 =?utf-8?B?U0lxRjVoR3g3S2R1NmtKZ1pad0FRS0NtNXpTbTB4c01DYk9LUmtWQ1R2NGdn?=
 =?utf-8?B?ajNXNXpLdW43MGxtNFNRQWlDUHpiOXdDcmF2S3RHK3luRWd4aEsrRW15RjhP?=
 =?utf-8?B?Z3htUC9udU1nV1RlZFBZSmFXd2RqVmh0Z3R2TlhsMU1JL3VzSkhzS2o5QnUv?=
 =?utf-8?B?VzBzUlVmSjVvRzVUcnNPMU94TFJhK2tTTmphMDM1TVhmeVZOMjYrYmtUaWxm?=
 =?utf-8?B?cEthQmpZQjgwUkRqSjM3WUkyc2lxRUFPTS85WVhGYjBWMmgwV0pXVzIzQTM1?=
 =?utf-8?B?YmVjeWFVM1F3eExGK3dna21YS2pYanp4blZtZ05VSHk1TUhzeTF0L1FSTXpG?=
 =?utf-8?B?MnRJUUJqdy9SVFFaVk03OElqU0wxdkEwMkdBdzdtaWhxTS9nT3FzdTRYRWV0?=
 =?utf-8?B?U29zdUhYOUJDLzE4ZjhwMXNnTWVrU3R5TzZqYjBaVytVN2NaRVd3aHdDK0Rh?=
 =?utf-8?B?YW53QlRtYlNrQ0Q2YWF3aSt5ZEpjbTVwMFk1K2tlSEE4d000ZTJGelUxejFp?=
 =?utf-8?B?UDNUQnRYTUVJL1EzNFlOaVdXQm9qOGxHcUVEV0NtOEZERFgwalArc1pQdDlY?=
 =?utf-8?B?d0JScDM5ek1ueTd2bklwNmdlUC95S1JTWFI0NjRFUitxK0QycVF2MnREclh1?=
 =?utf-8?B?VnVua3ptKzJZaHBIMGhQSStlQis2N2tDUi9ncjZVRjlyc2JucFBFcXA4QkVL?=
 =?utf-8?B?WStPTENnL00xVFdXODhQWU9QN2grVXo0R0gvd01mZ3EybUN1alZpZktkWWIz?=
 =?utf-8?B?QzV6MEtueUZpUGQvZ0RrR0x5TWtxRmIvN2xDR1cxY1lCL3RmL1pHZjQxZXRK?=
 =?utf-8?B?TmtNaHJRaFZnaWxlbjIrYUprVmlmeXd2bzRKYjZ1aExuRCtQL2NqS1dZckNV?=
 =?utf-8?B?RWRPblFYcHlOQ1lZNUQraWVITWlMZHFxVmJwdzgxejRNUGZkM3h2ZVYzZmhj?=
 =?utf-8?B?Q1p4OWVCbHlOZm1zK0pPdWFqckxxZUQ3S0Z6am9SMHhtYkVLWGVqQ0cydzhY?=
 =?utf-8?B?amRsWmRUbGxMWHhTdjNBNTEzL0RYNlA0OFArTUhnQVFYVGdvZnYyejI1R0E5?=
 =?utf-8?B?M0c1dDBJNk1XWlBVem14c3kvRWhUQWtrYUljb0dmOTJ1dFd1SGhYWE9icncw?=
 =?utf-8?B?Qk9LNkdveVVaM3c1V3liS2dZNlR0QitLYUU4Wlc2bGc2bm9HQjlZNFViWWs0?=
 =?utf-8?B?eTFFb2syN3VFODJNOU9tclFjM2V1YStoZHpvdmJMRWthdVU5TnBYQkxCUTB3?=
 =?utf-8?B?cVM4ZG5XK0xhMVBsYTRRejI2TkVJaDIzWmlEZUcxT3NMc0ZRMGM3OHNVeWlL?=
 =?utf-8?B?c2hCZWZMWEdNdG9weklES0dLRlBDRnA4WlVnTThRdjlrT2hmSkovSUdrYUZx?=
 =?utf-8?B?eWVRaXpkZVNkUUtyVEVFa2YzMGNFUExnd3ZLanFqSXQyY1dYNWVMUzJtZnRG?=
 =?utf-8?B?emc4YnRPS1RuNDNJS1gwRUxZY1FGRldia3UrSnZrR2JJQzVOc1lzOW1BT2VY?=
 =?utf-8?B?M0ZCQjIvNVpBZ1ZHRExGU2o1N2JTdExTVU5zYmZ3ZFBMR3hUdjBqT3ZwVit0?=
 =?utf-8?B?b2ZKeW5zcy9oVGs0YlYwcThRTjQ0L2RhNktZRHVHZFhvOGxJSlhFd0dPaCtj?=
 =?utf-8?B?VUZya0xBcFgvSnJUcmhhWGNDTllhSWxTelJxRFhXVXFld2h3Vy91anZlVFc4?=
 =?utf-8?Q?4cBTDFbxc4dH9zn3VDpbUUVMg?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fa289c-454d-4470-cd93-08dd20196fa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 10:39:37.5672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P6Ew4HSsvC8w9woF8Vb+Eq5V1OdJQXsC+cmXo1XVbSjm3Xk4wh4YCZ2rVvOoq3E8YpSMGoLrcW9rqwIKeB+z/HnaW05bD6qnr2i9lrl7bNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8499
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_023949_419167_879CCAF4 
X-CRM114-Status: GOOD (  14.89  )
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

> > +
> > +static ssize_t idg_nvm_rewrite_partial(struct intel_dg_nvm *nvm, loff_t to,
> > +				       loff_t offset, size_t len, const u32
> *newdata)
> > +{
> > +	u32 data = idg_nvm_read32(nvm, to);
> > +
> > +	if (idg_nvm_error(nvm))
> > +		return -EIO;
> > +
> > +	memcpy((u8 *)&data + offset, newdata, len);
> 
> I'm a bit concerned with the usage of len here without any check...
> 

This is an internal helper; we can rely on caller to do things right.

> > +
> > +	idg_nvm_write32(nvm, to, data);
> > +	if (idg_nvm_error(nvm))
> > +		return -EIO;
> > +
> > +	return len;
> > +}
> > +
> > +__maybe_unused
> > +static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
> > +			 loff_t to, size_t len, const unsigned char *buf)
> > +{
> > +	size_t i;
> > +	size_t len8;
> > +	size_t len4;
> > +	size_t to4;
> > +	size_t to_shift;
> > +	size_t len_s = len;
> > +	ssize_t ret;
> > +
> > +	idg_nvm_set_region_id(nvm, region);
> > +
> > +	to4 = ALIGN_DOWN(to, sizeof(u32));
> > +	to_shift = min(sizeof(u32) - ((size_t)to - to4), len);
> > +	if (to - to4) {
> 
> As well the 'to'...
> 
> I was even trying to review all 3 patches together, 3, 4, and 5,
> but there's too much indirection on those values and no checks
> in any place...
> 

These are callbacks for mtd framework. 
The mtd checks sanity of values before passing to callbacks, like:
https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/mtd/mtdcore.c#L1570

Should we double-check input here?


- - 
Thanks,
Sasha


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
