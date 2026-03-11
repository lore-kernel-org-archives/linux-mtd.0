Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E3E1049519
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 09:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQkM6hW+IMsInztDAv42RtPdvrT6AE/TQgPwh525XG8=; b=pYSk2LaqSGnFW1
	/JB2ypVpcWXkSG3l3JfVghSFD+/XQjD9bCcG0lMUYXfyF6YdOkxybh7wCuHjLB7pn4DTp5FWCx1a2
	fUHkKaaDMa9fMz4Eu/MKJ4LjA5XaCWImLRHEyDZ5NEjQ/YhVP3GBpNJjx+gKXmmr/wliCknmokFEq
	UlF0cN/5Xco5Wwq+o8bmy5Ujo3k2wVuG3Ad7GTRvY6VxIVrNPSAX9HrrI7iSzwQnSQUsR2q9jzrUu
	ohxk9vZ+hCl7srKRfccANroQiwpb/pTGPTNb/tfns7hIYDOoKGI0Ja/7UDcS+wztauePj2ULvOM/9
	VoaHW2nFWgZnAsFhYDkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Fph-0000000BHVJ-1RSY;
	Wed, 11 Mar 2026 09:26:25 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Fpe-0000000BHTk-3Bwq;
	Wed, 11 Mar 2026 09:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773221183; x=1804757183;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=M1zX9+PPku/ezMDAwbUGLL4E51fSgV56iroRvGjTTG0=;
  b=m85qbGCfYy2JUP6QnYNnygy2pN+lGM1Ec7HscSDpQz9S0xKMy0HMu3cw
   XatNFTWN7OipdgA0pVorVUahyEWAD5UAU+OTV+VnJ+0w50MRZ9gf+HwUj
   +j4poOYvzrzOWyREGVc/kxm9bKoUOc4X/B5sDm69RUulrMoZRIBYyiLLx
   TpZfulR1XnOa37K87Niir2wZ17ue5z1ZemXoSC+etqOoCyW3nWhY5EST4
   /IaW0uGjWb8V/rkZlaMUnOE35KjvBiyODMKt3nUB4eTidf0b4fwDirs7t
   /PrDkYnVShkMWoYyjmnbyU5SdjIE7O1rAD/sgHey4XDSKN/C8h1NtrEEO
   g==;
X-CSE-ConnectionGUID: qihrSwCBSeiNZPCkO3cGeQ==
X-CSE-MsgGUID: Yi7IyCM8Tf2IJCW67vmBzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84607312"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="84607312"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:26:22 -0700
X-CSE-ConnectionGUID: LMXY3nXATmyMWa3R/nchBw==
X-CSE-MsgGUID: ZqQVSMjVSvKtafNEdG+NQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="219652696"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:26:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:26:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 02:26:20 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:26:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHcSIfijcpH/6CRWMoLgzcpmerxymuEMU/11u9hBUq2RgCQMKONwbAgtuf0TdXeO63j5A8VJC6nUdOYYCur5CfY5FYoXgbr7ioY00VVV+VB58/wHGUJl3bqccJI4DCEvob5sH6S/Fy0nnIF1YtmGcV0+VKD7oDaxIUwQaEMQH4wJNGRLRFCfV636zxyF2xgp7COoqDZA19iQ2TZBkxmWvjfPYM1xuo41el2q9p6RMtkvzUYzsfu00hMxgCPcwmTveaou4d7Qr/Y2dqMmeoNA+XTaJJD7tMJwvDYg4tIWmHnWMLhLTNBNmR8ikJa8V3ZhUmsq0ckFPMpOZX9RO5b04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1zX9+PPku/ezMDAwbUGLL4E51fSgV56iroRvGjTTG0=;
 b=fh9Osd/t6LBSLRVXWch8QVmPLCtnKal2mEVH6UDjD2cX4NQlByAFShJXQxewu5aMe35/KS4KDzu211/10FanESnm2hIp87g1Hq7+qhPEG1q2VlydaVQUPm2WgH6I89aZz6BMAg4N6j15BBsnKXDa+FRkfyRjsEvB+s1w/6Y5MwXQEAmx+1DjPja6bR6taNNdghLIKjqfSJnrnIXplza9ssBNfxvdv+SRWyRF2rIzVoSyPxrvtnOoJqmg8r9O1D3KmAuta3L0tUuglPVZww+IYMTdvPjWg8LlIDJrf3wxRQcbGOTLfBAP9G7o7/5a984Z1a1XF9IfSnxKE6TisQsp9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Wed, 11 Mar
 2026 09:26:18 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:26:17 +0000
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
CC: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>
Subject: RE: [Intel-wired-lan] [PATCH 50/61] iommu: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 50/61] iommu: Prefer IS_ERR_OR_NULL
 over manual NULL check
Thread-Index: AQHcsKKKsLw8ffVSJ0afYyGoGNmoEbWpEOYQ
Date: Wed, 11 Mar 2026 09:26:17 +0000
Message-ID: <IA3PR11MB898657C50235115E4008890FE547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-50-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-50-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|PH7PR11MB6836:EE_
x-ms-office365-filtering-correlation-id: 96cac31b-82e0-4d79-7e67-08de7f503fe3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: L7AbhlILyxI6R8isGXcs2nyf2NNr0nZWS5k6L2IPzei04OuUfC1rIwLyClFyZ5je9ovWr/B1dafcS/kw7EJGerupbSOfwkAgOlGEpAwElfESJ/7GopwVGvFcM+uyrVGr8X4e62KV1J8AxGQqeRIfts3e51/x+lgsXn71Vs1qi+JL64U3u39q2K8GxJjJo0c7fkXQtNWIokNjRzXju6WLbhWVeKBrHbc8Honxw7SmCB0Bsj7ub9bACNgcuNtLXqQdMtKtzinrs348pVo/DKURLNMhZ/6zJSajZ6frL29TDE0k9BJd4y0kVRawVUEglESCQzbF9gFlZQhHmsJtLQcYLoF0YroTs7br5hAxzlK6Y86xNF+zZU2Z+YzNnzmnNt7cEyempZ7l/ucsfDbei1UxvzVICOE9MPYzamJXDR1lQRI8ScrSGrHeN9GUsdQvSVzFWGLMPMfAUYsmkJE9X5SDvC5p9+mJGDlrlaXtFNx1Y9sHSFdheSExL2PrnFgZ8BPkkF0NjEq1788KeQQifnN5WsCYRhSKLLdquuRAWg8zOHCuRjzrN8E7kRrPcnH9uOBkIj1G7cgJRsE4gjmo5hlMfjAUmcfKL/55e9kqsLLdQmYzUlm5KqsI25hYnls1PIttxskmnImEAy3x4OBQJHXFaSbgz/w2Nv6+5DNji7RlZY1ZXPBdfmkJua64pNZ0O8NEKZFY5vn7rJOXWEcTtWe0N3xSHV98d2yqC+uGv/HCkYZIJoJgDsvaqEgWpxkbClxSf0MTGF/Ns2XNYb1m8iu2CMxUIYRVgz8mBRjPM1q30T8QkhQGtw5toaNHkrdf3bHo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXFvK05adWp3aElIbVZCeElSdmVDdWY3cy9uQ2UwWVNzL0luQ2h2clVReEJi?=
 =?utf-8?B?UFp6UU81bXpsYmxnMEE2c3MzT3BVaTRIOXVIb0dsamVBcUY5cFdnVHFyYWFZ?=
 =?utf-8?B?MFZiUDFNUVdFSFJ5YU1HZVZtL1dOcWNyYkV5VGNnT08rSzZRUWxHcUVSbEZm?=
 =?utf-8?B?Q3ZGelRHZ0ZuZ05vT2JuVWtabXA1VEp0NVFqT1JIc1RCQXF3bVVwa3ZkdmdL?=
 =?utf-8?B?UGpjb3NOWmViOWY5a3lrNDdZZlhaaU81VzZBT0dYWHJBcVZGYlQ4dEZzR3ZU?=
 =?utf-8?B?NkF1ellaVkdLNWhUUTh1VSsvdG9xZjFxRnhyY0l5WEhUdTlnaXJ1TldKNE9o?=
 =?utf-8?B?TFR6OE5YZFJsekhQQ21PNDBMcVFaSmdLUFFsNVZkMlBVNDVyUldCSGYwY3ZG?=
 =?utf-8?B?ZGVicnM3WStiazBUTHozdjV0em4ycHhDbG12ZmdpbGZvaE5sSTE1MXIvSGR3?=
 =?utf-8?B?djZwZzFJWm4rNmlmMjh3YkJGVURGclpXZVgyMzFtalYyOXA2Y0w1TnRIc2ZZ?=
 =?utf-8?B?QzhXVVFKS3NQT1VpREFoVjdyNTdmTTFWZDVFMTNueGI3dE43a3ZMU1ZJb290?=
 =?utf-8?B?WkxkQVBVSnJKajd2MDN3MytyUlBiN3FKWlZJZERxaUVTeXhZSExzL3dpZEZx?=
 =?utf-8?B?aEhkekFPMjkzcWlQNmNBWVBHM08xRVpRRWROU1ExV1NrN0FaSWtVOUk2Kzht?=
 =?utf-8?B?bld1OXlOTC9JOFZwMXZrSHNsOFVUVFNnUG5DMnR2TGgrT0xSdGY2d2FzOXJt?=
 =?utf-8?B?OVBoU2lMQzVONmF6WXhUVmpHNXhvL3dITXRiamJLQ0FEcGdBRlVISmNkR0lr?=
 =?utf-8?B?VGwxWWZOOFBHWHQ0MmF5eE1jQStpbmNPclZyaXJJbU5meWFNQjh1WnZoa2w0?=
 =?utf-8?B?cnUzalUxS1l4RXpMcEdEUjlUY3lzSGlYVmNWZTNkeDZxRTdsZGxxeEk0LzEw?=
 =?utf-8?B?K0l3VkZmVGFGclJWeFNZb21SU1R5RmU0V1FwcXVUR2p6bE1vNlZSWTYvdHBx?=
 =?utf-8?B?MXc0SXFQU2hHeWlEdmlZS24wRlhjNTR3eXlxK3BxUEJObGJ2WG5BdWovNUZS?=
 =?utf-8?B?Mk5ic1Rxa0F3bnVORk9EbWRtczFYUmdIWTM1TlJCWEJMRVRXUDdmQ3ZFUG1p?=
 =?utf-8?B?cFVXeTJCd29tRjhnRGNLWDNybTZTdlgzQnpSd3NwTDZRcFE1Q285dHg3K3dl?=
 =?utf-8?B?SEJoK3YvNC9YUmx0NVFBcTJQVlNxWC9ldUlQRzUvUExLVFQ5OTU1d3I1eG5x?=
 =?utf-8?B?THpRVmF2ZW5ScVJnaGZiWithVVI4ejViTVcvT2NlTXRnK3V1OXloR0JOV1JL?=
 =?utf-8?B?UDZ1VlhHV04zVUpKQW5NQWJOUVFkZzRtRmlydU1RdnJudUYwQnRKVXhXYVlM?=
 =?utf-8?B?dkpJcjZUMm5XaEVrMW5sNVoxZTVJb0RJRnY3cUN4bThMTG9KdDE5S2hRWUhH?=
 =?utf-8?B?Nm1samhiL2RvV3VrVE5mU3lGZUV4M0pRVWJyS1g1Rk5JVkd2OWJyVkRwai81?=
 =?utf-8?B?VXdQL2FWTm1RUENUcXd6czhobFdqWG9SZUhkV3N4RXExZ2xiblIwdzdXU3JV?=
 =?utf-8?B?TDF2bmxQKzZ1dlZhQTlBMjk1RjgyWXlyd0RHNjFMd3lac2VPUkl6bWlIQ3VH?=
 =?utf-8?B?OE1OaUl5K1RiazF0ZGhBd0RmTTFtdkNMdDR6dHI0eFU0cG9DV2RXVGUyMHlY?=
 =?utf-8?B?dFlyWmpCSnpzWi9hMWlyYUxwb3F1QjhzYU9tMEhZVjltTGxzMzJ6Y1MzRElh?=
 =?utf-8?B?QzB0U1lJaVI5ekM1NUtsTVYxMWJkN0JkdkpvUzRmdHVUQ0wvRHJrZ09jY0xV?=
 =?utf-8?B?NlhtNFdjeUhVTWdCTFBqbndVWWRqdUpTanlCZjRILy95b05DS2VlRHArcU1K?=
 =?utf-8?B?aXV0Q2VldDFmS20yTnVyZFdoQVpSQlFKV3M1am9HcHNhTkRKeC9XR3BiZEhn?=
 =?utf-8?B?Tk9BVW5UY1pUUFBJNHhLMm5UUC9FR3REMmI1eTZrQno1NEFIcW9lSnBrTFl3?=
 =?utf-8?B?eFcvN1dHbVVWNEUvWlkvWldkdkZ0QU5KTFB4ZVNUN25MWm84N3lPZUV2cU1s?=
 =?utf-8?B?T0Q4SmNPL3Bna1EwTlh6VnJXdzRibGFBRjJyeVFJYXdFck0yQmFzU0xDbnVq?=
 =?utf-8?B?Wk5md3JQUng4VURmQ3NNdmlrNlZKM2d2MFMzcTY5RVNEdzI1VGdIY2R6RS93?=
 =?utf-8?B?QzVYQTY0dVNhRTF0WVM3M1p0U09YM2VEL1dBK3JtYjBrRGQ5Nzk2RzFuQ3Ra?=
 =?utf-8?B?RWNPL3pFOGpKa1hISGJ3QU5UOXkzK1NtOFVZbGt5T1ZQaWRrNCtLUjlWdE1x?=
 =?utf-8?B?UEpCbmZVOUpLZFVTRzZ0cjlkWlBlZmVPRDdQNnRQdjJaOXpuczlsUklmbHhP?=
 =?utf-8?Q?8Tc2j9aiEyVh+eMg=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ij9suR4+gfmfb75J72t3lGk74ceQ1dJA8Vk3YjNrzse2pltTXluRMto0A6PWt4MZCYpbGych7s9ipx4+D56FRlB0vIFbWQ9Ahqe5rQcmEi+hykaQd0SP6ZyeixwJ0B4kTGFqz+CQIMbIjWAURGPGeLqo6NSAO4nfWrghPgt32SHnGt/Pys8KCPXtUobyk26FzdDNfIp0fO0Co2lFE0Ptu7x90qqtcAV+LgseI9xwKfUhYgUbgyRVMX2xxQ8ncRk3QjFjQ1cSGDOyW4N+AQLyvybZN84FEG21l3UPxubJVvVn+4fMw3QB4h3zo/AURY1iqcrpPzZcNDGlu04uUt/DCA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cac31b-82e0-4d79-7e67-08de7f503fe3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 09:26:17.9098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DKRoUTqSMgB7X+QiLzdNcDatHXI4GweH+7eYdOWlw+0DQhKehh0ceQgtCK4BL/RkhQUR0hD9OmNngsUP77xKwyRvxiR3TL2zy2CeBb7eKNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_022622_855363_E233262D 
X-CRM114-Status: UNSURE (   7.24  )
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
> Cc: Joerg Roedel <joro@8bytes.org>; Will Deacon <will@kernel.org>;
> Robin Murphy <robin.murphy@arm.com>
> Subject: [Intel-wired-lan] [PATCH 50/61] iommu: Prefer IS_ERR_OR_NULL
> over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Joerg Roedel <joro@8bytes.org>
> To: Will Deacon <will@kernel.org>
> To: Robin Murphy <robin.murphy@arm.com>
> Cc: iommu@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/iommu/omap-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index
> 8231d7d6bb6a9202025643639a6b28e6faa84659..500a42b57a997696ff37c76f028a
> 717ab71d01f9 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -881,7 +881,7 @@ static int omap_iommu_attach(struct omap_iommu
> *obj, u32 *iopgd)
>   **/
>  static void omap_iommu_detach(struct omap_iommu *obj)  {
> -	if (!obj || IS_ERR(obj))
> +	if (IS_ERR_OR_NULL(obj))
>  		return;
> 
>  	spin_lock(&obj->iommu_lock);
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
