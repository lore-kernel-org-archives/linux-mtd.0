Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5814BFD0652
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2SOg8MBw8V53WC14WophRcPNqwg7NrjZyez/CAgU8IQ=; b=mzAVdMhlxLxVxe
	jnc35q21IwB+iCgEf261E65gQrrbGLfAjKlvHy2c6GXVShg2+da+padGUmZPxjJ8I4l0jph55jMIC
	8ayqeSXb9nQsJ4C1xwI7P1vjmULNcsZVMjOQ8gLhZaAOqSTwVI/X4QAIKbbEmcx6oi6aasI6tXQ3z
	T0SisLHqn+eJtJ6EUODfINAhhcJoJLajxZ2bMwLJe7J8zqYamQ3X14SL1/LFVl1pnBkVkbvU7To3b
	e1/ED8/o6K06KGrZdojzTsWlNWOmRrrYJKHXs9qlKVco8hvHCQBNEQjg0vR9tlRYVWqNEJ5EHSTUm
	M7rsAZVsgyp84WhzNODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Em5-0000000B9Mi-3Thj;
	Wed, 11 Mar 2026 08:18:37 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Em2-0000000B9LI-43Bj;
	Wed, 11 Mar 2026 08:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773217116; x=1804753116;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EtXvAtG2Nq0/hQHPRy+43TWGRsERYyZeG5NpAQzHH84=;
  b=UERYJs0f/DI1JTsMa+oNep5TRD2Qj11M1BA9qlnXss31PeQ/5ijIv3gm
   kIB2O0EaxpnygV8/Wzor3zczq0qtaZ68MwjAgZ1KYS93vZ3ma799veDWd
   p/k+xamoxyil3Z3XMgpi0FnRIqUWFUjQsfrsbu7FP280CKIyB1su+xVvD
   PSFJhhPx3Gp6iKSUYT4MxTHaSsONLKKMvTsJ5oGOp3mD2P0e8aJHVgFov
   Rq6UHI5lLgp9mosiKX3ct8Razbz9pntXVAYpPNz5ySMN7E/aRxxaBKRa0
   VaMs04+LOOxlcHk/qNHlg5y/64QCvppdcyoRDEYINJWW2fQ+arqTOlVQV
   Q==;
X-CSE-ConnectionGUID: ysnn1iNeS5iEq6OgFdMfsw==
X-CSE-MsgGUID: F4enHB2iR/avArU2OaYdzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74249486"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74249486"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 01:18:34 -0700
X-CSE-ConnectionGUID: HltMTZSVTuKXfMA+/dCoxQ==
X-CSE-MsgGUID: H7QQi/l0S3GdrHVwbKdJ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224857220"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 01:18:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 01:18:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 01:18:33 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 01:18:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhWeUg9RHkwde45PsJ4JWqOSCdeKLI4zXqfmOmLC72RNsSuaePzgBOqydmdBart9kBRM4vGCsXHuicMQPqiRMunr+TDVDVhjNwU1uJeqkh0qw8A/rUlXEy/lbqK3GEeN6jUz2fC6wRsQWKqauF298jSC+Q/RFbzIE+W6VXt1JOgD0fpdatOT8es2hWEYCz53kPlVU+jVDyu2pogz6Wn68NcOQWy6ltCboG3aPGBv0QrmpKXLYCIr7s1fjtw0jMP6lZ8WrHxrb/qf/d7UhIdns54Ef5rr67QRiD2BG6rZQdTfrVQlCGs87WeWbmXIrMIE97HPLe1NmRthT+C2QpjZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtXvAtG2Nq0/hQHPRy+43TWGRsERYyZeG5NpAQzHH84=;
 b=oHyUy+PcAJ26UqZIDCAhBkwR5PEuLcOV9EAPJMdOG46fYZ3sZ2zEh+Jc6vEr0V4LxhaUtEWfuDtX7RY3ICuoXWxq5vIFctYkIcwqQV7qyRvYu2c5nW3GgdDpodZHiFagr8lWXwIHwa9+USjvsv1BLItaRNouSk6Pfqoisok3Citrt3is/cIKvqrJlJdXIS+bOYKW9LgL0dlSZXsVlJoadFXIuYaLtkBy4uIfc+igV9KMIS3gdk7CD4SJNdDHHpoSaTKjLN6hM0+Dxf+5rsxq3JiX692xN8nkcV1L9wo64i6ePYwPAEbh/cQuWFrnu4YYNRRwwhIP9PnelRsa44jKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by LV8PR11MB8510.namprd11.prod.outlook.com (2603:10b6:408:1e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 08:18:29 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:18:29 +0000
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
CC: Miklos Szeredi <miklos@szeredi.hu>
Subject: RE: [Intel-wired-lan] [PATCH 08/61] fuse: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 08/61] fuse: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Index: AQHcsKKakfOg0IOsvkih4vkupNrtzLWo/fKQ
Date: Wed, 11 Mar 2026 08:18:29 +0000
Message-ID: <IA3PR11MB8986489054B55797E95481B4E547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-8-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-8-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|LV8PR11MB8510:EE_
x-ms-office365-filtering-correlation-id: f0b79d3c-8a1e-491f-e6b6-08de7f46c705
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021|921020|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 218av+tk7NyEEEJHlt1fulpFsi4UC6fpwgDNRhUIo2srO+/2TlKPYUzqV6H5yx4/knSysiIYLAaj2nLqZWHAdu1SoQpRi0aWwfjkYGZkXXTnOqXXnGjeLjtTkO4fkIexEpaVwuoR3rXyNToQRzb5udkf2e0TkniRf63q3E4x2/Qsy+YHMKSDhdg0YrR7bqHLlTT65eVWUG8bQYTxuOIwxH/3eEeAr0QVcnMXps9rVv8ms4jTZAl9oBruoKwrcVKRvMAYtQeOHm/H4N+39mJro9jTVq7f0K2pUUVPUzLH0SjvADMnP79eNq0DfEgvto07cN9GtBHLJj9yz9ap6CHj+QxVwbx7qnEz+h6gtanoNtbQAXJS14mOiELCA7UYoGbm2oG9tpe0FbTbI35z3zgrJiCfOOkMu+TdauAyFH9ONVtEqs1BCc8Q08aATYoMPjnXz7l1F/Ie7LN32cpJHXtHUeLUZ7mt8QdGON2+772urnKn+bCSRhWpVC7iK5zs/aVo3VesNyKjWDntP0E+RvmNW9YW6iP29xyzZmIepfzptq7O0gVsc83K5NXWqNDl0XZbP2m+2SJLVItwf1rRVA98Uoic+p9HmIszvVm1BCdKiS3O68tN9M6AIUVmOV9o3WIVfAnXbSY0BVKVLXg3Mb2lx+2EkcGz43AAWbJ6eDOmDruN/6VoYWM/wCcQiAJj1WX/H//FLcsMb6L5AwFYc93/4NoHeaJGmcMFGb+D7+FzqWd9JGofHi/dA+FN1sszd7ygtK2IjBhTpNvItFkx5+FRi12Q/yLaVwUVyW18stZ9w32/hdIP58uJhbalSmXIx8AX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWx6ZFk5R0FqZEFyM01sZVlsSkc0eFhldEgyK3lOV0NGektFVWlqRThOOGlC?=
 =?utf-8?B?Ny9zTkZHVHlxWUhTUDVnL1J4WVBONk43VzZpNkprY2NyWDJPeEh3NmFjU1dC?=
 =?utf-8?B?bkU4d0pjVlFWM0pUNlgraHZkUFlLODBpWC82K2s1dS9KM2RDeTdlUytJaktV?=
 =?utf-8?B?dzI5T0w1bDVnUm43bEh2Q1UyOVVGYk1XblJEUmN0OXZxcEV0QTl0a0NzQUR1?=
 =?utf-8?B?NHZnV3dwY2pQclgrSTd1emRVT1g2VllPa3ZhclRvalZSenF4TjljK2hlZUUy?=
 =?utf-8?B?Rk9reTdLSlRlcUsvWlBWRjQyQk9WbFVDSGlzRkc5UlRza1lVZUx1N0dYOHht?=
 =?utf-8?B?dFFlaG1RV21lNlhMQkQ4UkVhM0JwbWEwNlYrbjBhRXIwbVp5WmkwTlFCTHBD?=
 =?utf-8?B?eDRWbXRnaFVYaGNkVkxFVFpaK3NOYUVuZXh4OVhxbVIwRk4xQ0hKQU1OL1lN?=
 =?utf-8?B?ZXpqeHhOTDY0MzA0SVdPdXdoS040NUFwN2c4eHA3WDkwUjZwNmV2Zjc2Z1h6?=
 =?utf-8?B?bGZpV3M5K3YwNnlDVlNRUWxkRUF2SHZUbStzQ01GUko5Qk5mRmhsMldWamhF?=
 =?utf-8?B?bUNVemRYWTVlbHBmd2NFSkRQZjIzc2dpOU01dktYbEcwN2FOT3l5RjVtSDdT?=
 =?utf-8?B?am9wSDdSWGIyTUg5UEtwTWJCWTFPZXhRZExxdlZuUGh0OXpTSExpN0dDczNu?=
 =?utf-8?B?YVR0bUtodFdVcHpyVUgyaEZ3UEQ3SHUwNjdoZ3RyZ2o2Y1B6Q1NlYkZMMmFF?=
 =?utf-8?B?YndOaXMzQ2NxeWJzRXF1NitOR0loOUtwSDVBZHg0N255V2hRdXJjVExuQVYx?=
 =?utf-8?B?V09BcDl2bXJQbTdWcmNQcVJhbENJdzZoc2VWSjZXSm12MkVoOHkxSDBEM240?=
 =?utf-8?B?Y09DY0g3aUxtZTlCMTc4ZWRzOEFubEY3UDZtci9lamVHZit6Y0tVK1cwdEV5?=
 =?utf-8?B?bDZ2RWFYYjNXMWRFTDhHL2ZhVXRpYm1DM0wrLzhacG1FQ1lkOTFvdnlCY2x0?=
 =?utf-8?B?MGJKZmloUUtvTWVCN1hZaTdITy9wdzV1U2tiM0Z2UGxXYWtxdWpLWXRxOFNa?=
 =?utf-8?B?dGdvZUNZSVRnNXFncDYvTEJhWGhIL2duQkJVUXp4aUJMWURVSTJSVGNRbkow?=
 =?utf-8?B?czBrUlNJVzl0N2FuUXJnaXBkNFRYMERQdlJqVHFBRFJKdUI5SmsvM3VscnFa?=
 =?utf-8?B?aVgyNlFDK1lIVERQeHJwWWpmMDFPMUdCRGNqUDZyUGNLek1BTVpmVGkyRlZt?=
 =?utf-8?B?RWVxTWJmb1poYURLZkkwRTNZc0liWlBpZUVKalZuR0taMVZBM3MyaFFhMnYx?=
 =?utf-8?B?RUpJVnRtbXQ1a1BRcE0rVUJXUXUwR0dVZmtLbUIzMVV1WTRKMDhLN1dTSngv?=
 =?utf-8?B?NTNpNklFTG5DU1duMWY1VTdTM0x3MFB0Rjl5dXVIa3JveW1KSk1Eb3pHVDRD?=
 =?utf-8?B?SktITXBPanVzVXJzOFZXUTI2eGpsc1YwOTRlaGRaMW55cnVqRldNZ2VTTlAr?=
 =?utf-8?B?YUdTYkc0YzNwSlRlNC9yOURYclN3UXlCRWxHR202ejZJa3lnQWdvb3U1OUM0?=
 =?utf-8?B?WnlpbEY2Z3FEM3dHUHJTOHNOTWJ5R0JCalRteHhmZlB4RXEwbFpZQlpqSEE4?=
 =?utf-8?B?UnVEZzlCa2Mvc0huSUEyQnJJSjhtczkyLzdIVXJ1RzRieUYyenpUazBwTzdL?=
 =?utf-8?B?RDFQRFVZNjFuUTc0V2ZnVjVmL0pOUW81YTc2cmN3QWtJNDRYcDZiZVozQ0gz?=
 =?utf-8?B?T2pFYWdTUlhqOVdQK09xUXNEVzFKb0ZBbU1FZVByUVUrZno1aUJNYTdoUFVZ?=
 =?utf-8?B?MzN3NzB5a1ZTd0xVeGl2UlRvcnQyTEhIY3phd1VMLzdWNFFqa0JQVVNYVGQ5?=
 =?utf-8?B?amhRMEhqK3lVRER4dmVEMGFMV1czTXJvNXEyVkZ0dHBHWU85SjRXSkplZ3U5?=
 =?utf-8?B?YlMzRVF5enFCZWJkQW9hVGYrZGJmWkVMVTd2djcyM29tWW9nckJFQ0VZWVNI?=
 =?utf-8?B?MUZ2TzZhMXFzOFkrN2xNL01PRXFZSm9tdkdtNXJ4V3c1YndxZUhOVytmUXdK?=
 =?utf-8?B?RE80RUhCMUdUeE1CSE1ldFB6NXRMTHhKbWhQNlJ2SlR6S3FWNjhFZ1lyUndl?=
 =?utf-8?B?SGtXbmtZWEpRVFJiSTU2Y1pPUlpIK1dIVGRpVXZHUkNRWFhWTDR4dE1ZWXFL?=
 =?utf-8?B?VzVMaHRwTDE2S0swcnQrSFJCUGdKamhQVktJSkpTNTg4WjNtUWJ6cE5aU3dn?=
 =?utf-8?B?QVN3ZE1VTjltdUpudTVrY1MzaGIrOG9nVjluZzUvQkRPZlNTbkpyaHNFcmda?=
 =?utf-8?B?ZzY0alErTU90NisrZnlMQXlRTU5WbEJsQ2VkWFJBZkttTG5jNzRpSVVKK29K?=
 =?utf-8?Q?937ogaSyRs1rYCpc=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: BSr62bCMqwvc3ZcTgKxPQEVAqCIGt47aCt5UFuG+ESCN/jeAx23g3sUt2to6KpPVm0z784cA7hIp1ShQK03CNPBOyVdxyDvJdnWURgYcxcMwEN6Ctx1Vn0H1jrG9rOS4k3a/6F2vFOGDqyG9ziWaiGYqYVeBzCKxv5+83M/FkSqNsRReWlomos6fqjV7BpRVXvadNez2cWwMc3FFTZWyHuyu/K++tUfMA3eG48glHKIZjDt42c1OmtYDfm2TeM7VARx9JHPeh74XZuCdnPIendjbbcNtuv/eIcqF8D+ph2o8ajfqSNJ/od+hZxZ3kv6WmCx49CEZKRVe7RzbSDvROA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b79d3c-8a1e-491f-e6b6-08de7f46c705
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 08:18:29.6298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lBgAK4LdcQe4vqxPgvycIwFMG4fqUxSz+qscY7c9Lw1EqVibO5WkDRGF3FDerZbyM25IO2GGZA3bgNIdAApemWxaqr28XJ0iX0vmtSb9Kak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8510
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_011835_095635_436799F8 
X-CRM114-Status: UNSURE (   7.00  )
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
> Cc: Miklos Szeredi <miklos@szeredi.hu>
> Subject: [Intel-wired-lan] [PATCH 08/61] fuse: Prefer IS_ERR_OR_NULL
> over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Miklos Szeredi <miklos@szeredi.hu>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  fs/fuse/dir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c index
> 7ac6b232ef12323e3afb97b98301f623bce917a4..7b39c013027bd9c4ba6f080bfc9b
> 3ec22bc2dd4a 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -1599,7 +1599,7 @@ int fuse_reverse_inval_entry(struct fuse_conn
> *fc, u64 parent_nodeid,
>  		goto put_parent;
>  	while (!entry) {
>  		struct dentry *child = try_lookup_noperm(name, dir);
> -		if (!child || IS_ERR(child))
> +		if (IS_ERR_OR_NULL(child))
>  			goto put_parent;
>  		entry = start_removing_dentry(dir, child);
>  		dput(child);
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
