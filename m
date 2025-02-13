Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4207C021AB
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Feb 2025 07:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4dCYzh6mFHdKz1Tn4kAjYqjhIosOcszBu8RdhP15ZDU=; b=JmZ0JZ4j7Nsx31
	q3vMVcnD4n4KZcf7hkUIw5IWgCSrtHFUVEhivJ7DiXevLm2OzKfqt0fCTiMZ2ir4Vhbg9pK5IduSC
	SIaR5WhSkQcTAb/afeppdP5Bu142F3TGSxFZoH22I/ZqiIrW86Wtg+DMtWjYY32kf12Z9f2e2EkC3
	e4EGJL90ultbGEOUv8KE0FF2PRWNnLpU1XVF00/fd0388ZNG0/hIuGlIyjuZtcbVTTVLZdPa+2Hem
	WTUvKsEEa4iL3xzrsvRAR3pCF1s2MgzB8wIE9ywIp5mJLmDyw+BdDgx7WeqhkNOfTwbUC6hdJSw3m
	6eF+S8hj+HVGv5I4Wc+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTjq-0000000A6wM-0J8e;
	Thu, 13 Feb 2025 07:34:22 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTjN-0000000A6tR-01dr
	for linux-mtd@lists.infradead.org;
	Thu, 13 Feb 2025 07:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739432033; x=1770968033;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6q/8SQJ7s68YXfiVr+JirauxgaYI+E3TZEOeZmcU1aY=;
  b=F9OumMTNu3rpGioFluqIp7TTyju4/zj0rtB3brwiHcYN4+lP70Vh+s5O
   zbna++Ku0p1uSY1hQNdW19tHfz7teMYHrK6Wy/4XXutCJMsaP/djJruGY
   9uFbUPVpEt1nN7oJpF+DHFg4ekOuyaBkBvRVMUsuZKwodnD5CJdLTRn5F
   yKEYHrw5KXyNlehXhs6GOCmqrU/AKCRj2lBN+YuzN5H4qinZFyJysNBEQ
   K+Q7cwJTqtKaiiaJLge7vPCHHFW9/MOfLzwgLUisQBxvfJGjyZcFTDHDe
   rX04tRKthUBpSFvFYQhwcwPd79tEGckG+6Yv8ExZYI2zpIZXQteCCFGNd
   w==;
X-CSE-ConnectionGUID: TxnH2LGZQra1CQf5dVEpJw==
X-CSE-MsgGUID: 92hV4hzlR/G01vkgY0ofdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39306390"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="39306390"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 23:33:53 -0800
X-CSE-ConnectionGUID: 2z0h7OocS++TpqNWRhjuZg==
X-CSE-MsgGUID: t1St/HrvSHyhgXFGuQ09tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144008857"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Feb 2025 23:33:52 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 23:33:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 23:33:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 23:33:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jb8G36gcc9YPt/9CDrPwiIDrce3jjEiLKzgh39COVJNHTPt5AxENef9oBeYokXa1Q7N/zbf6opu0eTd1FXIl7IE0m2qyuE6WYlKKlYVsSht44BVvKLRJCMQa30wek8Q1ogOUzActv7d62y77g7FQ07am8Kf9VsMQ3RF92LWz9nCh6iesUn83qoRVRaTnFtjp5zjljl4yplXnHDmvSlJ/ekMyAniBd0QNKyJjS+EbbMBYqVC0PMzfr0y1nTA6B7zQULqlHUdqdhY4L7Gz8aeZ60yp/Dxt5gEXv96niJGBFdrr5nCl10VTMsaegNkCVnNHr+doWcA0Pe9VtYLuLsGOeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gN8l789nTRn/pOVY1GVHwNsddCXl/1HtQldwKyPtbeY=;
 b=HQcIMdxcbRhyhARxwnpWJwS4+NQCESlXko4SD5wssvzaxJHGnKBjKv9k84p9meeObOMIQ9DTgbcQkGY96an+QkaQD2UFP/dI1oFIOPhmbT2xWmUVt2NPMMheNvqLVrgluHnM2xaT8y7/JwSiaPQKKo6QP213Fd2dlDTuvo2lXZKoVxW0637HGl/KzwI3BYwb2r50zHxSeZow/LDDMmSZM8EStfL8vEWR7/36yUFPzyc3LK7Xtyl9aNn5bsbvkKyyLmJSNlMrRWJVFqHXp6sDtzwDsD20cq6zLMZ0r75xKoFRdP1T7o3CQ8hWaEbms/7sMSB9XonGutaRl8anm4WarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 by SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.14; Thu, 13 Feb
 2025 07:33:49 +0000
Received: from BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f]) by BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f%4]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 07:33:49 +0000
From: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [bug report] mtd: rawnand: cadence: use dma_map_resource for sdma
 address
Thread-Topic: [bug report] mtd: rawnand: cadence: use dma_map_resource for
 sdma address
Thread-Index: AQHbfebGihLSDPmvHkWYcVaytU7xkrNE1IAQ
Date: Thu, 13 Feb 2025 07:33:49 +0000
Message-ID: <BL3PR11MB65325337C3F6BBAD406F6E36A2FF2@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <e448a22c-bada-448d-9167-7af71305130d@stanley.mountain>
In-Reply-To: <e448a22c-bada-448d-9167-7af71305130d@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6532:EE_|SN7PR11MB6945:EE_
x-ms-office365-filtering-correlation-id: ba501200-bf49-4ee6-dea0-08dd4c00c233
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?sGWSzfVOeUkBV/aZZgem7tMOu6CsTYWhiwCBI8iQjCMUny+h1KrZydNQ3FzX?=
 =?us-ascii?Q?2vRSlylBncNCyciFut345AhnLbX9nNaAX74TUPkjGzfN7YP4SgUKnOAg28w5?=
 =?us-ascii?Q?ZImlLCXZZb8sZnwGYzRFzAX9x5AIs3Om86yJ/ANOLccLmJQ9G6BAwD8ED9Wz?=
 =?us-ascii?Q?SErPUumZ4XZmLNXM9Ka6Ycos4evqtLCFazAlMAfOuwMKOQmHojorOp6x7dO5?=
 =?us-ascii?Q?Z+dqt9zG87f1Tirwnz0RGgvZ3pJemD6AqMcXUr8hxKL4JNDa2hYwelmLeMCG?=
 =?us-ascii?Q?wEqcWZsVbXqalH/pGu5KTJsbYy6WQuv/u/6hOspHe4DkOe7iO11LBkDZ1zSv?=
 =?us-ascii?Q?5vDxnDLU9145hDiaeAFxU37oLjSVfLTRyU/2X8GgWn53ijMjOc/0/QK/fw1J?=
 =?us-ascii?Q?L75Q+9pbYxC2xclAsqkkG9oxWk4rAFBlpCqDOWDWt9p/N2LldHrv7Mam9ypb?=
 =?us-ascii?Q?Ci82EQr75bev18pZK0raM6we1Aqljjs1qWw2xYLdCWOeOZM5EntJT1f4zwUP?=
 =?us-ascii?Q?2GQG1B5dVC7o7OoW9Hsjv4id1+2SIMPz32ksL4MFE3mzy4+Ddv+K4c6trEOM?=
 =?us-ascii?Q?ppMYIAvA5Whjwb1oLzwhwIgeGAmmC2085cxl9YRG7U5nn76bBxdL9hrX0fEB?=
 =?us-ascii?Q?PUNEQGEfFKrGy4rM8Ke1YIwOCK18VR7i8DfFxwwvjhfMnO9H0NXH52iTwSih?=
 =?us-ascii?Q?f3qgD6dvUsfuqq2KO0o7viFOju6AR3PGR7UNL8k1Z3bi2fVml3VTvTUhRs/k?=
 =?us-ascii?Q?BGrZKopqToMz7Ktpi+AClHD1QRoyRWa9fKSEQrGKH/F0kYtNaenXd2+MH8Q1?=
 =?us-ascii?Q?QV+O1+vcgTdhvfu/wUpMYf/1zE3wLANdLphUS9rkm561+gUU/fYMVa9UXRaC?=
 =?us-ascii?Q?j7WoST+2OorHrj4QISMFiNNxEdnj/Tl73Qo7jKkEF5QNmT/ot1XAR5eThte8?=
 =?us-ascii?Q?qqGqoIuvvaTTy4gORLOApDFPd4TDcmfOXJgbZANLlHUQaLqiGMicpkGwhoRP?=
 =?us-ascii?Q?eckKPIgJNethWboxdF9Or5q9XOCITgLqiQwckxNSP99gIOlSnT4ShJE8g+UJ?=
 =?us-ascii?Q?GLrlbIzUXYcnTDGGCoL8KfhJ6/I6yfJYVj4HoIk1q/xXcS4i4sNUL4mrcNGW?=
 =?us-ascii?Q?KGLCaF3djSCZwh1f/maYbYoEgbemYrc/m49HIKO+IEtesanL976oORwiXS4S?=
 =?us-ascii?Q?zJub3kNQL3/eeVNgJB4nxwZ/MXrT0f+kyDg4rge0bnzPuv/992Rdiv+r3FtA?=
 =?us-ascii?Q?bVJJmkckGE+nIswCmFB617dMOMBOlS7mhDMXBbo/wwOyMfjgQcv1ZJ6oZuU9?=
 =?us-ascii?Q?PMwcGOTISv+zHslcpFgodkP0e3P8O0Y3YlWt3XIraT4FBOsLaiU0qBj4X/cw?=
 =?us-ascii?Q?4scHqBcNNM+zBUU/kaxv9CoUqgnKCMLNnzSlB5R1GJZ6uZPcBUZm4diaseUv?=
 =?us-ascii?Q?Rb6jIrwBySKjvfMw34HndxKcAzbIqJHj?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xXECGc00etzHLPijR5J8Jb1qSr/3IGEvahMHIkhAPKJyAfLZzd0lii/+h1QS?=
 =?us-ascii?Q?Yi2PEKlxeLeLfNVOF9x1rCAY/qjbs43iLbvDi6ICvB2E9LyP+5rxe/+x+YuI?=
 =?us-ascii?Q?sMOCc3j/9EdinEhdkSPyeoZNcsIpO3k7jDMctNpcurV6WLnCtqj75ICiXmfV?=
 =?us-ascii?Q?H2+pZOgklwxnPsnkNALl49pOMUqiXKsamUkirTkJm390J/9tq+0tOtwXnXLP?=
 =?us-ascii?Q?vifg6CwpbwiUiVpIMlcknboO++tHChzpxTNgIxilRI2+DjomgL4WKLNvGmHG?=
 =?us-ascii?Q?g7zP2r9TDFubSKj1ySX35+DOAow/dZ/ik9HDp00pwKeys8Z31Aw5Ya076Ryb?=
 =?us-ascii?Q?Kcp9Y/Rc4XjCh+eMzmlP1DJCniMw9ZBM1w10UOkCmnwRWQXRlffyAy+4SP0A?=
 =?us-ascii?Q?nJtfIy1pI7oVBddTuLXKm9JJA4r6K8WcAhu9eYpBO4weidbxpTHDUA3YHhhM?=
 =?us-ascii?Q?ohzxc3KgZS1UwdxKKQulYpnvsFIbmNYK3fWKP1R2wJzt0ZS+XDvly/exuSLF?=
 =?us-ascii?Q?VIGKIrc5VEVEc7fDRfwUrxpZf642hx+zPgpg3LoekAT5rqDlReZ7fVeEfHwQ?=
 =?us-ascii?Q?KlmpkiaQVpR6ej7mAhoiBNBJ9ZPSBsomv4gIp1znCvSGuxU2bIS3rUD25eu8?=
 =?us-ascii?Q?eCWJiPhJD405mt2A3aotOB3tu8Jx/aaaP2RGShYx0Wnkr0OQl2pNUN2lTEdJ?=
 =?us-ascii?Q?t9ZYnpWUrXgNkNco1qYMihkiMfPsS3Hswf4WffoRGwxuwSp3zAVFNEoqP/Kx?=
 =?us-ascii?Q?K449zfYys16rSEaJQl//wdSOWuph8KlJ8FuWXNULyhGWIfnG2B9FbfDo5Wmh?=
 =?us-ascii?Q?C4aWLd0OUxzmxxIa69urD+yNj/uRpbcoVDpvyO9cEnW90+pJXTnurffArPEi?=
 =?us-ascii?Q?//L+HgOGd5nhvenBY4hEk68/bVoq3bVbe7vPOlpIjBLESORyxt4ip5gBkAUA?=
 =?us-ascii?Q?yxukzxBLLLW3p7fpR0O/Hv7y/NPnmUYIphvfqdypjgQqefPzuusesfbbIo+Z?=
 =?us-ascii?Q?NImYClNx8bZcNx4wjWL72RQwadNDYvJ7aH1iyUjQYArHLBtJKxMWrCXmNe75?=
 =?us-ascii?Q?IAAFNgyWjm2Z+bvJqeowSvO/S9abL7p0yz4slabXS/DZAX7FudESi3WcwtpS?=
 =?us-ascii?Q?qqQUZb+HR1VLpMVWubNQt3L1UTGUHOyL6vfO5O4Gy/N8AGBb5ULQ1d0HUMqe?=
 =?us-ascii?Q?0m5OTPjD/CT80sc38IvzagxVoA6KvcyPb6lSuAU0XRCfobTANw4+GO1Y6D2u?=
 =?us-ascii?Q?oaiSbcnD6nJoyXgAPjpi676hiWbPteiyqySpYExEoAtKOYdccM0POLqOGnDX?=
 =?us-ascii?Q?3qWNfWJAVV2ErjEAcySe6+T85SXCKC7RbfUhhDjX/8zdzzsQgwRJj134WMGq?=
 =?us-ascii?Q?ZkSuTFSIt6lSiYbymk+PzJR0giGSXXiEM0CnLIk7usHUogou0HwcoSlI/37H?=
 =?us-ascii?Q?BNxTVFiUYvclSPPG+NpHUmxeeK8dlqLL40YT19eVEvj4O1cXPX2uFs3Tet0p?=
 =?us-ascii?Q?CjJjts7sN5iOodjYTVl8qm/uLr5CdfHHpa10BbrX4F2yF/aqvhTaPuQ4ziRE?=
 =?us-ascii?Q?yZhhz/jpP56B556HEx0Ro+OzYuFbLB2EFqvc8JcJFbjGIHiVdIj/+7T/d65b?=
 =?us-ascii?Q?Qk7NHLSPiz+jqJPQGbHj6H9N8kH24X7l/pVk1bzc+Am3+Ov9qiGu021RvT7i?=
 =?us-ascii?Q?pujKdA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba501200-bf49-4ee6-dea0-08dd4c00c233
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 07:33:49.8095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q8SWZ7ECmGNWoL7pApvC7iIhyIRHHxpuX5BVKxhD/u5ZUxl+ISr0/PGlbUVyIHqJAcH7x7TvsHXqEOWZ3vnEIxSnLwery1f1MktOvQGVudM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6945
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_233353_089203_1E9D4E5E 
X-CRM114-Status: GOOD (  13.15  )
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

Hi Dan,

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Thursday, 13 February, 2025 3:13 PM
> To: Rabara, Niravkumar L <niravkumar.l.rabara@intel.com>
> Cc: linux-mtd@lists.infradead.org
> Subject: [bug report] mtd: rawnand: cadence: use dma_map_resource for
> sdma address
> 
> Hello Niravkumar L Rabara,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> Commit d76d22b5096c ("mtd: rawnand: cadence: use dma_map_resource for
> sdma address") from Feb 10, 2025, leads to the following Smatch
> complaint:
> 
>     drivers/mtd/nand/raw/cadence-nand-controller.c:2982
> cadence_nand_remove()
>     warn: variable dereferenced before check 'cdns_ctrl->dmac' (see line 2975)
> 
> drivers/mtd/nand/raw/cadence-nand-controller.c
>   2974		cadence_nand_chips_cleanup(cdns_ctrl);
>   2975		dma_unmap_resource(cdns_ctrl->dmac->device->dev,
> cdns_ctrl->io.iova_dma,
>                                    ^^^^^^^^^^^^^^^ The patch adds an unchecked
> dereference
> 
>   2976				   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
>   2977		cadence_nand_irq_cleanup(cdns_ctrl->irq, cdns_ctrl);
>   2978		kfree(cdns_ctrl->buf);
>   2979		dma_free_coherent(cdns_ctrl->dev, sizeof(struct
> cadence_nand_cdma_desc),
>   2980				  cdns_ctrl->cdma_desc, cdns_ctrl-
> >dma_cdma_desc);
>   2981
>   2982		if (cdns_ctrl->dmac)
>                     ^^^^^^^^^^^^^^^
> But the old code assumed ->dmac could be NULL
> 
>   2983			dma_release_channel(cdns_ctrl->dmac);
>   2984	}
> 

I missed this.
I will add a NULL check before the dma_unmap_resource()

if (cdns_ctrl->dmac)
	dma_unmap_resource(cdns_ctrl->dmac->device->dev, cdns_ctrl->io.iova_dma,
			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);

Shall I submit a new version of this patch?
Do I need to include any additional tag or info? 

Thanks,
Nirav 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
