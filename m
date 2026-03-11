Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AC6FD0656
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/p0/WU7BW6ff0Tqk0w2HLmpb/RKFfcKA7m0zJBn1DKU=; b=R68QtOIrW8b0Up
	DkpE1z44jeTfRMYIcLbWUFhqlSCCzDuR9r1q63YR44fROwMcZPJee4GgNWPxNcgHQA/WGlmBt+Jmm
	HmacQDIv9Dl21nRDm9bzVbeJin36EhCtH1gpv1CR49sV4fit1OQiCLKjJdVkx7GOgstrGSb3dQfbo
	uUKBwmUr8TuAiKV9A/oKnXJTB5xtPDPJSTVAc2Ul0RkfnMmHDhhTamg/CJeGzcQpK1RHEj28KEwHB
	pNXNBDdR2OnghKF9VoOW1V7cdi35AR2SL4ZnZ3Ln4B6LE6eQFsRr15pGuMy27JK1DzPAW+nrRqCBB
	8iaLrhzF5s8WpZA1GppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Emi-0000000B9dI-1fI7;
	Wed, 11 Mar 2026 08:19:16 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Emf-0000000B9cN-3AhL;
	Wed, 11 Mar 2026 08:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773217154; x=1804753154;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Vb8k9EUnk5kJj2LtvvAOaCQRgisPN85MlLKf/pO85gI=;
  b=Kj1Jt1sOYQ1p+NuTskmEgu4uwfPCg+utPRq5TtZ/Ry2dJvP37cqjKl0c
   81dOci5M8MiJEE1RCetC2fbsBs7vhNG/38VrsAx8W6L+wBO3HkJecWkvt
   ob3v9gq3YUgefC3DWgIRSYaDVGoZ3PSQRrwj6X4Ey5hewbULurBhjtcZR
   qAkGb1ZLY/hSmCtzzA8zpyurkhibAFjNKCC8Yxb9ts2bO50/7enRawq4y
   d8DYXzwTfadml+9DYlHBt052hard6G2ECRYZVI974JuBBQxD8BbPYlzI3
   cXSfpGSkC7p11/GsYz2GRdtLsIZmUqcKEWPUJU2uaBo+5DuUnomBc/mAN
   A==;
X-CSE-ConnectionGUID: Zbmthpj6Ry+P83jm/q4yYg==
X-CSE-MsgGUID: 1Hai0tvVR9qV5pLvlFrj7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="78164841"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="78164841"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 01:19:13 -0700
X-CSE-ConnectionGUID: 0G/JU1hJQDO4CX97TaJrVA==
X-CSE-MsgGUID: 7FfCmmmvT/izw51Ty9X2lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="225346316"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 01:19:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 01:19:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 01:19:12 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 01:19:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4t3UpqGV4Iwt1Cg6SX9sEYFE2m/da3cKxX1afn4MUvi6yj9zT4pthCq9A004dIzW7bXS98TU+4axPGJTAwGmaY4N+rIysvulbxBCWvABnjSe2slga6kxxoUrNS2SrwEb3m72CFNJrcnea8IwcAnV2fNBnVp+qQiIqggtQxb12siFmvcMMNQiQ/amYzFg0jAmYSdgAJQ+skniHyl9D5Cqd5q3+NuM1nWRLNYV3+y5+VCCRYlUYIStZFepSpxeyPs41EHIwIt1vDy5IeBXEiCTNxJFvoavqlmZWmUEVv2c8mw1/Y/AK/xOfvnTAbGkRRK4mxSnbdM8rkcHEzBqL8uqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vb8k9EUnk5kJj2LtvvAOaCQRgisPN85MlLKf/pO85gI=;
 b=EiUDl672fvZA+ijYyaPTCjPwCEpLVplqSI4cfOec7Ynh7DU2D4qpjt0i0z23WnYoDvTJQctct/WQka/5QESAAZNzsS6Xs7eWWanjQegd5OMJJHYOXP+7iSea7FgOCC5gb/aTcR1EKawbkJ4kSdCGsG2h9POGEZyqLyqzBCuM9FavPV0Dd9MeP2JP/jXaJ6uo+S9AQL/5zKzlmIL0Te6Kn8TcKQD52+fBTb9lcUvFHL43STQ0rxNQ/FMHlW+R8Z738/lbQsDmYnFJTo42pYkPGtx+qlkbTdQ8UoDbCsmeR8hKVcgCEALh1m6n7GH8z/HcjPI3HsUO1QXiriKSC/Cdjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by LV8PR11MB8510.namprd11.prod.outlook.com (2603:10b6:408:1e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 08:19:03 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:19:03 +0000
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
CC: Jan Kara <jack@suse.com>
Subject: RE: [Intel-wired-lan] [PATCH 12/61] quota: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 12/61] quota: Prefer IS_ERR_OR_NULL
 over manual NULL check
Thread-Index: AQHcsKKaOR7G0NDKQEmlo1IiQUHj5rWo/h3w
Date: Wed, 11 Mar 2026 08:19:03 +0000
Message-ID: <IA3PR11MB8986DFF52256F69D2D8813AAE547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-12-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-12-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|LV8PR11MB8510:EE_
x-ms-office365-filtering-correlation-id: 45170395-41f3-4f6e-eee8-08de7f46db56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021|921020|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: uDlo72zsfG7E7OegXYkgviuwxoEgXaQcvEoAJg6j4/rltsamRh/Qn9VNeTSSeHInq0aq0fsq4v/Bdcg7Bu9fowjf7kVfGkmRO4sHgo6UoLAucxJE5mV1UPNNekdUC8c14BHka0ajN4E62VBuw8ezPo6Szn1KmPPoCHszFNbnFKt73DcPuLI1+5CzzWdpgYMbhYzughjIDAdGd5KaDrao2XCGz4Y7vlp4pPkxhGSgBcWd8od5s+H0FtaAvLLkNLcxHrrNOJw7W3cr4+lGQ4TYN+96OzlDiZ98/4xKM3zQxVUr2YXyQnyaw2/LKg6lIZBu/bWHL1GmeV0gkPoWjYtsvSf8c8B6B50GnO0Q/HxfYmkH42E+A5vQGURNRR0syUZ+5vE42aTiX2VQSvEJp2bX8V/VCBR492SZ/RQAB/B86gzbVjpJhp/UCY+d7MAlBeNz3Vhaz2DbUsQxbpdQJTlcjBFUadmDgWef08tW5Dn28lL+u3v9HxgXk6FrNIqU/uuxb2gNMow5kq/4A3yV841iZVQanjpdLzZE15xBEFpzoOnLaSUsbEc9vap5CVUMr3oJKfVh6txp+I/91pdubcTMhiM9H3SoxgEyDUY0a5gKuil0QqoD2+8xDTkcc0lhWGn8p2QfT7dFHBEqprQZJl5C3GACzzX2bzH68IsnSQ/ZwxfznEaGV+bglhaLusO13upuwd3VwYC311TO4BYUFl6nKdo/Xr579B2L/I6b8Oh+5SKiokkchULV9lvfi4xnS7hLMk97rjgDRIKbAYsYJjOEn/YP6hTF/tCJfk2+qJeQ21XLP4lDmom5BfybqRJ1Uelu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2xncWZUZTJZaUQ5SDZWeEtDZlMzcVc3SDZsSThjMUJSYjQrV3JWU0ZqS2Fx?=
 =?utf-8?B?czNKVzhscERCS2VEUzFhVW5BbEk4bjRZeUd1ekdmekFlTSs2bXNFSUh6T2FG?=
 =?utf-8?B?cXUwZlJGdTQyVUhPUmI0emsycHB1d3FuUTdRWC9GbGdNR1RpRVZIZXVUa1FR?=
 =?utf-8?B?YU8zRVcrUndtNG0zWEFCQTRNdldGQ1RSbjQ0d2txZHNuZDVmYVVhQko1dm92?=
 =?utf-8?B?OERFTmh5SkpLdWVIenNSV201YkRndWlWZ0FvMW5xWHI5eEFLNEdydkRlTTFT?=
 =?utf-8?B?R2VLR3FIV0xEOUhQUDZJeStlRmxSU3doZEV5NTZtbS9DWHhIQkt2ZzZsY2dn?=
 =?utf-8?B?M254RnZTbXZSV2piN04wRTF6L21oWmJya1l0d1hjUjlOdEtXcGdpZE9Zelhy?=
 =?utf-8?B?dVJxWmlvV1h0TVcwMDJwd3VkdGRKdWJSdXdFakQwZ2hGMUFuWEp2Y3ZLSG1m?=
 =?utf-8?B?Sk52TkRZKytpbm1VYTg3K2c0eUZ1ZXZUSXZJaFg0ZksrK0hYZm5TMVl4Zkd6?=
 =?utf-8?B?Yk9ta2ZqUVZkSUlFVFlCNDVtVDJwbmNIdVdkbXlRWGZ2eW1LQlBWMlNJdEdj?=
 =?utf-8?B?bU4yUjdIODFPNFZJVkZzYitwSkFPZVM5UDIvWmhHbk4wUmRNckE1TDJKeHZS?=
 =?utf-8?B?aGh1Y3cxUWF2S1phOFFPQXptTzlNblB5dytGMHpCdStmcDM4R2k0bVVISDY2?=
 =?utf-8?B?aTVJRlZYdDlBcXpSdm40NHZGUHFPMDZkYTU0dTRUcmNidzR5TjFxS0FOSDdF?=
 =?utf-8?B?dmVEcmRXQ21LSDd4STd6WVhLNC9UNzVVTG9PbTNONHFZVUlSWUFvRmsrcVcr?=
 =?utf-8?B?U0F2cXVsUFBWSUhSb2M3ZUtCU3lxZTFjekpEU2k3c1ZkdWV6WXBLU3plc2tH?=
 =?utf-8?B?U2hGa0VTanpGcDBNbDJBOFhOQlRCR05BRmJYMm9lZUdScXU4a3Rxa1kycVV1?=
 =?utf-8?B?YTlpN2QreHdNYjR0Q04xQ1d0ZEtIeHZKenBQazhvY1V3a1VJeElKSmhRR1V4?=
 =?utf-8?B?bjJBRkxXVDIzT3gwYVl3eVNiYTVwcFllTzN2WGRSaDlVdzAvdE91NUphUVRz?=
 =?utf-8?B?aVZaODlUcElwNzU2Rk5PZVEvbkhWbDhhK2pxd3dvMXNxeUNrM0tZUmxGaC9Y?=
 =?utf-8?B?WVBzWVg0VUlyTGEwVWZjYnhGYk1sZUoxZG1PWWh0ekw4dkJROE83Zzd3Q0FC?=
 =?utf-8?B?NHV2R0UvdS96a1R4Y1JadEFab0d4ZldRbnQzR2xqa08rQUc4UWZtVXlrRUxM?=
 =?utf-8?B?MXVyWFJOVG1Ha01mSXpiNG5NeG5weUpGVDRqV3ZuOVF1YlVWMUJycnhMbU5Y?=
 =?utf-8?B?TTZrVG5RZTZNT3QzZUkzYU1QK1F2VUE1ZUZVWWlwd085QWdQcFQ1cVA1WVFI?=
 =?utf-8?B?b1cyWk9QZzhWaHZkWDlnNUZ0cERKL2F4cFVyN2R0MVFjN25XMkdGVUFiTEd5?=
 =?utf-8?B?eGRwaDlGUWxZaHhtNVhGQUFOOXNRdTcyZ2NFTVdIM2JYYUhOTlZ0ajlsS1Jh?=
 =?utf-8?B?YjFEZERQNDAvWEpGZ1RxUmgvYjZFaHdLcGdZSTl3RCt1ZFpycWNjL2NyYUIv?=
 =?utf-8?B?Q3JxUGdrOFhGM0xpNkpGYXBOd2ZNWGdaYnpaRnpPMmhQYWZyZ2tOdTVYSk9l?=
 =?utf-8?B?ZTMzNCtQMFo4dmFTd3QwSXhqZzdiRjZGLzZOSFNmTGoxZkFpcXlFY1dBUDUw?=
 =?utf-8?B?V2JkaDBkV1FXZG1WNUJZcCtIWDYxTVpjcmFrMmtDR3RmT0t0QjkySDRzUUU0?=
 =?utf-8?B?d3BzSEZCOGNDY29RaVNrSWZ6cnpiV29Kamw3ZmQ1c0VhOFY3V0paWDRaelVv?=
 =?utf-8?B?d1E3RFJHbmNJdG1uNmptTC9kNmRpQloxaDNvd25DVC9mays2MDlMSEwxbG5z?=
 =?utf-8?B?UGZBQVoweFhSK3BVUzVVTmJQRnBIdFlEUEI1Rkl3S0ZDUUwvdzZlY2NRTTZG?=
 =?utf-8?B?anJTVEtZd3B1S29rU1dnRU1CRlhTaEtuUmhzeHM2alQ2NFo1cklTSU0yaDB3?=
 =?utf-8?B?Z1YwUlRnOU4zcnJEZkVQZmFKTzZWYkEwaFNsZGFhZXNHdFlsUHhHZ2xkOFAr?=
 =?utf-8?B?N2xVVjdNaGlwdDJ1ZG5YK0xjdGp4N0dERk5laVBKQndMSm91Snd3MSthVm9j?=
 =?utf-8?B?a1BlcTlYR2cyZ05zdWRtbGRteXl5T3JpSUQ2eHhub0JFeGd5dGNmeTB3bTIr?=
 =?utf-8?B?ZGJFTDh4SzV0NFVSSXhvdXVlKzBKc0haSXMwQnhFKzg1SWNYdGhtSXQvaVlL?=
 =?utf-8?B?N2t1bFNyYThOWWVySmZFRWVVdHRQT25KZWtMcHBOUHRvQ29kUjIwaHdjUWgv?=
 =?utf-8?B?ZjBlQ25mMVhRZG1CcGlrOWVQMU9uTThtTUhJNElGN1FXazRlUy9TbUVwMVRw?=
 =?utf-8?Q?7E/cpfHei4SBWdR4=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ch+ochnprmtl2q9ovwqRCZrVKKPwM03tyxbmujYFXAOT4AvuwA9ANdyDEY1HYq6IS0CBOXih0ogi6kACQR5W6FOpUALMb1OgLPFZSt7TP7Zhrw7oa9Enw/9mMlwsHJG+Pm3TxuDNvdJyQO8kQOVniBOcvmswGUA/ghhpct1Qc942Npgeam/uTxbvHzh0RlgJgnbg0BOQC/40OOrTRkwjrKD0Zx07MQljFPxynL49qHtwlJhex01xgxSeN3yRDQ93lb8sXyrrmWc84Hn2r6LcA0e8KmOYPSzhVMI7T+UZ3AilKzyF9I4T3COOKVRZjIH/UnbR9RG+DtSLbXhPRtKf5A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45170395-41f3-4f6e-eee8-08de7f46db56
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 08:19:03.7196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5RHPwGkuHaFJ/hqNzAtwi022X2mgyphxIgJ+1aWEloOatEVlDDLjsHcJbFCqfAMKzQX0FZ0cacMjTK6ge16Cprkp4plz4B+kggP05WubqN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8510
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_011913_813092_E7CB9317 
X-CRM114-Status: UNSURE (   7.11  )
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
> Cc: Jan Kara <jack@suse.com>
> Subject: [Intel-wired-lan] [PATCH 12/61] quota: Prefer IS_ERR_OR_NULL
> over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Jan Kara <jack@suse.com>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  fs/quota/quota.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/quota/quota.c b/fs/quota/quota.c index
> 33bacd70758007129e0375bab44d7431195ec441..2e09fc247d0cf45b9e83a4f8a0be
> 7ea694c8c2a1 100644
> --- a/fs/quota/quota.c
> +++ b/fs/quota/quota.c
> @@ -965,7 +965,7 @@ SYSCALL_DEFINE4(quotactl, unsigned int, cmd, const
> char __user *, special,
>  	else
>  		drop_super_exclusive(sb);
>  out:
> -	if (pathp && !IS_ERR(pathp))
> +	if (!IS_ERR_OR_NULL(pathp))
>  		path_put(pathp);
>  	return ret;
>  }
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
