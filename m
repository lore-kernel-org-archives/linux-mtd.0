Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68211049517
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CrLqcYPpeCPmDxTY5TtJ0Mj1nRwLTg6EUodsROdON0=; b=M6NGEpEZvadj/+
	/FA7BH5Zd32wb7jflO/zqGuOkyzTPCA3mXcRozsGVqHyFrx4tbRXQvb1RCGFcffSKtJ0R5uqjVnTo
	ckpRF4JH5Ie9E1aC8bvDWT8LOM0ieE606S/GLmy+g2RaqV7C4TIBFvOYt0UN74/5U2A6vhv5HVXKz
	UOp6NsXnGqy0siFyuWUlKPLqmOrW5RgMpSnyRZ3FD7feKPyaYIk0SDPGPy/0TbmmuR+Btnk1thsJL
	BtXz5Ow+sZ/kej6YsEYvy7jBXs0juS/z5TKi511NQge+wlGUF5DYXfC4cUIqIh9ifhWWV1/vKARVz
	kAM1suilpJW6ABeu9Diw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Fly-0000000BG97-29h2;
	Wed, 11 Mar 2026 09:22:34 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Flr-0000000BG6S-3RUn;
	Wed, 11 Mar 2026 09:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773220948; x=1804756948;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=H6ZMmP62ZGGoBnJAVDBydLgmrjhW3AY3g1J2nIlXoXs=;
  b=PZH9VV6tFWd5Ca4ziCMJqm17h30mkTIJNqXdeEZVtGRgkkZCjiS3ixRA
   Zgig8ULL/5yZY3DirQdNHTB24O/3l9tM+6XEUGNmzDglB1f4sOxn+OBqA
   zaV56q0CBI1++TyxGjSUvOU3u7atdB+eLqquYO4KDqO31emXzNql4+7oO
   QcehhVq4x21D2AeH7Yv07mNcaWTOd8F65h8zn9/OB9/42hbSwoX9C6ZLg
   Ld6bgwmoxT6WdfOwiyR2oBXBrHN6++EujbdAxW91Rlu4GMVsMtrrvxpPW
   aWxBDsvC7PzzQeTZHxUoRVfgN0B6ExgYr/vPxZmIMlJCtByEnrnG2rDNP
   A==;
X-CSE-ConnectionGUID: K1Xy2VmTQuO6kjDBfbkzhg==
X-CSE-MsgGUID: CZ4XwzhcQveB3UYiLUaadw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="96899135"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="96899135"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:22:27 -0700
X-CSE-ConnectionGUID: SIJp3t8jTg+0sPOg1FzqMw==
X-CSE-MsgGUID: hJQx9mgjTWuL23NK3z4+SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220353685"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:22:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:22:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 02:22:25 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.27)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:22:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vASBVaMpzIm06ceB/scxlJEznniYt5pxjd6NOKFOD79z9rJB1P1qMHAEJQYOaMeXqv+Pesl30EiR4R4+sJz3qei2yYQqUUxEKxjTzeyFYXVzFgyn6aEnOgb0m3YmaNFoTmA1bQOJZS74q3seYqxW0gtsDtwY8ER66H1i8sdKJZPQg/qYapbqJCJ2oytR63+cjaPeBwy0MTndLiVyBUOFd1TOXWeAkWhQU89e4UNXJEE/YpSwhawQNKUwQHQpfFxutIXjQ4saRV15OIKlQUhlSaKLNdFm/n9TEfDJfOUaoxacc170Il9YkZNdylcxqIn2OJJq3O4//AnTBOMu7c1Uvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6ZMmP62ZGGoBnJAVDBydLgmrjhW3AY3g1J2nIlXoXs=;
 b=jZQAJSG0EixaXIJpci1hZobEnzuy2JIXFBwt3fdUd72i6AflLKq+z5pV5LoziZOnZnnV9l6NJwxjwJ46uMlH5gRF5G6O3PEdqKjNceYzlnqjk5Nm01jE+LKYWeMSqNC/DpOlUArEcHUtlfqYwTSwsK4nvVGEtLqnXHB4dwbDFDcPyq/O6s+5yFtop3vsiKlOZjoBkCy6njnuxJZhPSax9lBhvy21KnnWzec2hZm1/JHbwDY1uiCrD+x17jttidfKQdtdRnJxdTNN6ECTtS2a5ps3OlHWyY0IkFsnJzCWvYF9ZG3TgX2H4mgzqC2dpsujmFmb/1h1OXFZdmMLwALrzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by CY8PR11MB7897.namprd11.prod.outlook.com (2603:10b6:930:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 09:22:21 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:22:21 +0000
From: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
To: Philipp Hahn <phahn-oss@avm.de>, "amd-gfx@lists.freedesktop.org"
	<amd-gfx@lists.freedesktop.org>, "apparmor@lists.ubuntu.com"
	<apparmor@lists.ubuntu.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, "cocci@inria.fr"
	<cocci@inria.fr>, "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"gfs2@lists.linux.dev" <gfs2@lists.linux.dev>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "linux-bluetooth@vger.kernel.org"
	<linux-bluetooth@vger.kernel.org>, "linux-btrfs@vger.kernel.org"
	<linux-btrfs@vger.kernel.org>, "linux-cifs@vger.kernel.org"
	<linux-cifs@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-erofs@lists.ozlabs.org"
	<linux-erofs@lists.ozlabs.org>, "linux-ext4@vger.kernel.org"
	<linux-ext4@vger.kernel.org>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"linux-security-module@vger.kernel.org"
	<linux-security-module@vger.kernel.org>, "linux-sh@vger.kernel.org"
	<linux-sh@vger.kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "ntfs3@lists.linux.dev"
	<ntfs3@lists.linux.dev>, "samba-technical@lists.samba.org"
	<samba-technical@lists.samba.org>, "sched-ext@lists.linux.dev"
	<sched-ext@lists.linux.dev>, "target-devel@vger.kernel.org"
	<target-devel@vger.kernel.org>, "tipc-discussion@lists.sourceforge.net"
	<tipc-discussion@lists.sourceforge.net>, "v9fs@lists.linux.dev"
	<v9fs@lists.linux.dev>
CC: "Hadi Salim, Jamal" <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>
Subject: RE: [Intel-wired-lan] [PATCH 28/61] net/sched: Prefer IS_ERR_OR_NULL
 over manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 28/61] net/sched: Prefer IS_ERR_OR_NULL
 over manual NULL check
Thread-Index: AQHcsKKXKbLvNRaSjkqr+6oyWSzc/LWpD88A
Date: Wed, 11 Mar 2026 09:22:21 +0000
Message-ID: <IA3PR11MB8986B4E436132BCDF617CD4AE547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-28-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-28-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|CY8PR11MB7897:EE_
x-ms-office365-filtering-correlation-id: 1d8c86ee-8235-4df5-c4b4-08de7f4fb316
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: lYTKhjmQY11Of1Xl+ydZd4yONcxgMTy4iHeBLMM9WUap0vDWuq/kRYJXEzMFDSH9UeiigqOQUt3OxTudans7ZFEPJAkiwS2axmcWoW/lnmEsT2o3BlZOfSwdacO/Ye6mH80vOkCcu382RyglV66jBPHKF1IoYS3czvfi/w5YLoTZBRCMgmy+OWPnwBloOfcod+2VpJ7aQnBvbsWFfGm3JOpqDI7K9jt3zDrG3mVJSK8rbbYD1kvJR73A7Brta40GId69c8upkLO8ewfXL0wp8T3wF2l02gMw6+/PRP2bdMQHlYLEBOKSoggABC/lp0075L3q/CiwDjr5p1IFLGURnGqen1/386TDweVGWf+8E1Mz7uYaTKABljfLoo8N4IgBacUCz8gL1pQNPPOzMh4haS47z88W1kuJTlPMJO5MXjtA+pDyaldjMBTZs9TJjaRoQTwbOgEWYPqQ/3PXEyZvuarj6EsNPsGx09VVhX+m4q9uMkNYmrESUMT8OvtFfTR5Ba8JCFgKxqSX/rofQWwKow5HaUToV0jX5x9T9XvJszQ3ruZSXnxqTvGvg45ywMKd59xbm38+/cS2UmBt0Zde/nxiFthY/3iRYhSgEeDde5AqCaGkaD8/i+eN6stimUv3iFAnHfdeGs5EiPkg/QUbR/+PzuMOD2E57q6c14IKEKtyp5JIFjBFCYUPRj/k2OM5pYqUjPt1554DALitLWA4gamM6l/2uJYJn11rqLASADzQB2lS/+RDNe1JYs9ahNo+a8cODNXYwPwvOKPfHgh/TUzTwtD8iYgeA8GTLP+UnCjouub/aOwbo6ZBFR65s9Km
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3krSFVqUkUyRkRDdkZDQlYyZlBJZld1STlDTkNrTm1WODRnNHVJckpSdWpX?=
 =?utf-8?B?VTJpaVRCQzErWW8rMEZwOGtVcmh1NXk0NkdKa1pGMUhjN2JmSktia0x0Yzgw?=
 =?utf-8?B?VU8yMG1sR0Y2VXJNTjBMQjIzVUdxSXBrU2p6QTIvU3pxV3BjK0s0b1Vrako1?=
 =?utf-8?B?K0dFWVJIZTRieVd5UkxRbUZHeXJlcEs2ZVd2VDRmSW0yYXk0SW9sWHFrbzFC?=
 =?utf-8?B?Z2xnM1VUWkwrZFRFNDM5ZnFxS045MmVIS0hGQXBvaVQwa3NmUzJiekZuYldt?=
 =?utf-8?B?dmpEQnh4UllyOUFVVTJBeUFHUzMxRWZMTG0vZ1k3Vng5TUpSbDVvVWNySzVL?=
 =?utf-8?B?cDV3OTlvRlkwVExrbWlpWUpDclkwM25FYVlhQVErcGFnV1FLWEpiM3pWdGpo?=
 =?utf-8?B?bkZYcGkrM1lQVVZmOVJIQ1doVzNwSVdDRlVGSmlrM0loWEZNYlgxSXZxMnJu?=
 =?utf-8?B?eEhjdC8vK0p6dm9OTk5MNHZMYndpdi8xZnFUa3l1RkpEeW15dFNicG1yOWtS?=
 =?utf-8?B?cHlBUkQzQkgxNDVHOTkrMDJlMUNQYm5KMDM1T1F0VE5EbHZDUytaRVZKTms4?=
 =?utf-8?B?b052dFkzTGprTWw0OEUzeFlkUGVjVXhvaEd0OExkZEZFbWJPVnR6c01vb0Jz?=
 =?utf-8?B?ZTlWakwzWTYyVmw0VFUxNUk4cm1NTDBGSnpvWnQ1NEVaeGFoaFlNVlRwWXhz?=
 =?utf-8?B?U0YwdmFUYUgxT2xObkUrbDF4cUdzSW9vdGF1U0FubEUxWldCRm9VM081OUJw?=
 =?utf-8?B?K1JWQjFFSVArVkZNeTlEWHArK1UrdHIxQWJ4VkF3N3MrTkp5NGpubnJIL21n?=
 =?utf-8?B?NVcvdDcvcmhhTTNNcVhjRGxYMXBtZFpEQU1DaDU2VmVXNlkyTGlFUTlWMmd2?=
 =?utf-8?B?RTBST1NQM0ZmalhKV1orNHNqQndlRGJmZ0cwb2VGWE1oTUMrejZBREpDdzR2?=
 =?utf-8?B?OHpZeUtXYS90eFZPdTc0S3RxSnFqRUN3dCtsV2RsbkhRcHBVd3FIODNiQ0Ro?=
 =?utf-8?B?elJLR2U0RmJpV21BKzV2Z2tkeEJOV3NNQ2VYSW9NMExCSE5jSmhQRjlvcHY4?=
 =?utf-8?B?S3liZ1hURjVwNzVzTGlJTUFqNFNRclN5SHQ0SFhHcWN6Tk9nQzZRVlZBZ0dz?=
 =?utf-8?B?eVJVWXBld2FNRGExb2R4N2ROYzRsUGxmbENrSzFxM2VmZVdmUEFEeDcwUWFH?=
 =?utf-8?B?UzlheHhJelliK0RMakhYUjV4cGZxSTZTSlRLU0Z1VWVobnRqT2xWQVJqTHVk?=
 =?utf-8?B?YUtSd0hxL3psTFN3WnBXb1kyVHh0UVFNUS9QRUpLTmh3LzNPNVNKM001UTFJ?=
 =?utf-8?B?WGpveHR6U0dHeXc2SkV3ck9PY01yU1lxNnUyTW1IN0NpMUd3LzdFQ3E1OFFR?=
 =?utf-8?B?YmdUMW9yMTJKVGpNejhlUTZ1cU4xNjdFZ1lpekVqL1lhb3lVR3VxMHNUL2pv?=
 =?utf-8?B?VE5SbG1OWjhPejhOS2ZvajBsT2NGaGxaeVFFelVXWmVWUFN1TUhCWDZ6S1dm?=
 =?utf-8?B?SVlxQmJSOHcwR2FiYVZtMklxMkx5cVVLZjJIOHdrUkdqdHVidHFncGFnRGlh?=
 =?utf-8?B?RjVnZEtmdjBjUUk3dkN6bFJYc3ZFMXpYNTNBVERzaDhvZUJnR1h4V2lGVHZE?=
 =?utf-8?B?M3JPaDl2TVRaSEJ3QWFkRVlMZ1hnVS9vdC93UDZQbmdBQ1AydjFEeU9xaDhE?=
 =?utf-8?B?djd0bnF1S2U1bkRQSE1GdXYvbUlpQmRrNEswUFBRUlpSSmw5WDk3dVpVY01y?=
 =?utf-8?B?M0FYL2hMbzlTL3FwQXpXdnVOeThaVDBSWFhGSTZTS096cXlmYWZjOVlMaGs0?=
 =?utf-8?B?YlFNWWUyYVRLN01jWmp6aGJITHo2QWhqNHRBNjZqVnJ1dzFaNzBpcExTa3FT?=
 =?utf-8?B?TmlXYnJTdjNLRjFXcitZRmdXT1NEVGtwVStMcnZ1MGNQRjFNcG0xMlBjWlJF?=
 =?utf-8?B?dHNOS1gvQWNDZEhvR0x2T1ZFbGRaNlk0M3pwaFhQbldYOWxQc3dkQWFsRG9x?=
 =?utf-8?B?Ukt4RVpueHpwZlJ0RDBKL2JSWkJYUkRDc3lsRkhrOWxyR1VmajlCSXU4K0V0?=
 =?utf-8?B?aS9Ydk1WTHlPMTdLaExaZldzRlFNZWRuR3JxVFRqVEtadmRtTmtqbkxnQjZG?=
 =?utf-8?B?alhjTi8wWWNEVXBQbGVyOC96RFUreHQ5Vm81K3dJNlpLRUYwTXlPaDQ3cS81?=
 =?utf-8?B?OWIvdXZXeGJwL0pDTFY2d0tBSHBUeTNjZVVlTXByWWZuRzU2WkhMMTJUY2xI?=
 =?utf-8?B?b2FKSXUzK2IyVnB5Tk84TXhEMEJBUUp5SUtQdjJXVnNTdDBIbXBEUHEyaXkx?=
 =?utf-8?B?WkdVV2wvaTEvRTM2djdxZTFNYVg3VEsxQitZWEEyOXA1UVBsR2tZczBQK3Rj?=
 =?utf-8?Q?TbjYjr9ffGvAw+9E=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Kq1lx9DENBc8+VcNgYj/D6gMPOX8ZBlVF3Rat7fquqmPSpZyoMd2kGVMm4Uc5rr1vtMPb2Bg+9DbUhZdKAfAq4i4egfAuSr3wHNCt89bfV3Xqt1joyzlmKAkyPPs8x+5KJCrj+s7OCcoUEtW5TV3S/e26LRsX6ZfP7L2GOSXRvcP3UFODJ5O8Iv3wTkU4AqtLYlZb+uc8/QaCxQljRmPjMp/aeIh1puaQWQ5Uhlw4IQWk2zj244pbD3FI4LYp2/WX8DbHJ6VybajGY3K9Ovf/nKxpL8iwrsoXX9H7UkzUohR+4nyYPsxr/3WZ+JKTv3ydW3lrt37+4BgigMCvrTH9A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8c86ee-8235-4df5-c4b4-08de7f4fb316
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 09:22:21.6416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ARGHiSh1aqJ99bPF9Ir1SfmdEA460X+vovmjgAKmEGwapctThjGdeMWI5LUI/zhc3VzMNi5q26EVkXPnkhnYaIMY0FKQyo1zDrRg1q0n3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7897
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_022229_535428_529EA18D 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
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
> From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf
> Of Philipp Hahn
> Sent: Tuesday, March 10, 2026 12:49 PM
> To: amd-gfx@lists.freedesktop.org; apparmor@lists.ubuntu.com;
> bpf@vger.kernel.org; ceph-devel@vger.kernel.org; cocci@inria.fr; dm-
> devel@lists.linux.dev; dri-devel@lists.freedesktop.org;
> gfs2@lists.linux.dev; intel-gfx@lists.freedesktop.org; intel-wired-
> lan@lists.osuosl.org; iommu@lists.linux.dev; kvm@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-block@vger.kernel.org;
> linux-bluetooth@vger.kernel.org; linux-btrfs@vger.kernel.org; linux-
> cifs@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> erofs@lists.ozlabs.org; linux-ext4@vger.kernel.org; linux-
> fsdevel@vger.kernel.org; linux-gpio@vger.kernel.org; linux-
> hyperv@vger.kernel.org; linux-input@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-leds@vger.kernel.org; linux-
> media@vger.kernel.org; linux-mips@vger.kernel.org; linux-mm@kvack.org;
> linux-modules@vger.kernel.org; linux-mtd@lists.infradead.org; linux-
> nfs@vger.kernel.org; linux-omap@vger.kernel.org; linux-
> phy@lists.infradead.org; linux-pm@vger.kernel.org; linux-
> rockchip@lists.infradead.org; linux-s390@vger.kernel.org; linux-
> scsi@vger.kernel.org; linux-sctp@vger.kernel.org; linux-security-
> module@vger.kernel.org; linux-sh@vger.kernel.org; linux-
> sound@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com;
> linux-trace-kernel@vger.kernel.org; linux-usb@vger.kernel.org; linux-
> wireless@vger.kernel.org; netdev@vger.kernel.org;
> ntfs3@lists.linux.dev; samba-technical@lists.samba.org; sched-
> ext@lists.linux.dev; target-devel@vger.kernel.org; tipc-
> discussion@lists.sourceforge.net; v9fs@lists.linux.dev; Philipp Hahn
> <phahn-oss@avm.de>
> Cc: Hadi Salim, Jamal <jhs@mojatatu.com>; Jiri Pirko
> <jiri@resnulli.us>; David S. Miller <davem@davemloft.net>; Eric
> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo
> Abeni <pabeni@redhat.com>; Simon Horman <horms@kernel.org>
> Subject: [Intel-wired-lan] [PATCH 28/61] net/sched: Prefer
> IS_ERR_OR_NULL over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Jamal Hadi Salim <jhs@mojatatu.com>
> To: Jiri Pirko <jiri@resnulli.us>
> To: "David S. Miller" <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Simon Horman <horms@kernel.org>
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  net/sched/cls_api.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/net/sched/cls_api.c b/net/sched/cls_api.c index
> 4829c27446e3369ad2ae9b3fcb285eca47d59933..4208225e7a4acaf0c331096ebf94
> 1f68cc2ed992 100644
> --- a/net/sched/cls_api.c
> +++ b/net/sched/cls_api.c
> @@ -2444,7 +2444,7 @@ static int tc_new_tfilter(struct sk_buff *skb,
> struct nlmsghdr *n,
>  		tcf_chain_tp_delete_empty(chain, tp, rtnl_held, NULL);
>  errout_tp:
>  	if (chain) {
> -		if (tp && !IS_ERR(tp))
> +		if (!IS_ERR_OR_NULL(tp))
>  			tcf_proto_put(tp, rtnl_held, NULL);
>  		if (!tp_created)
>  			tcf_chain_put(chain);
> @@ -2612,7 +2612,7 @@ static int tc_del_tfilter(struct sk_buff *skb,
> struct nlmsghdr *n,
> 
>  errout:
>  	if (chain) {
> -		if (tp && !IS_ERR(tp))
> +		if (!IS_ERR_OR_NULL(tp))
>  			tcf_proto_put(tp, rtnl_held, NULL);
>  		tcf_chain_put(chain);
>  	}
> @@ -2741,7 +2741,7 @@ static int tc_get_tfilter(struct sk_buff *skb,
> struct nlmsghdr *n,
>  	tfilter_put(tp, fh);
>  errout:
>  	if (chain) {
> -		if (tp && !IS_ERR(tp))
> +		if (!IS_ERR_OR_NULL(tp))
>  			tcf_proto_put(tp, rtnl_held, NULL);
>  		tcf_chain_put(chain);
>  	}
> 
> --
> 2.43.0


Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
