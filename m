Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64DA1049516
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 09:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2DMe+awt389PT8+TfUCdrJF1V1fE8ADHjbei8zu7UU=; b=XsqqgnQcgtgIYk
	ErIKX/+3r2p138kag+sLxVt3s8x4v+PNeagzgCi12oSRy4aDRgLKAg3nE9ezqe5F7Ga6ZEiAm9M5N
	aluOq9N2DaiL+K/lVXvPpYWf05g7sW4+CoPhsT4ywvoVnQQVqZLq9cboYdi4gq+SZ2xlKABVuSSzu
	GuqCq+DT/7Tlcm6+UDhvGWtMrddPOTcUorBjoPR3PjV7FJMAsbeyK5L7ZYJNsiN/h4xe1/9BU70s6
	QP0a1G1IY5g/JbWwBzUy/VSDhqXEsJlZWG66xC/orhhM4kfbZBon7j8Lqwb+06fds2FmRhxQ11UNe
	NfEPOBBf6D49GROcDokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ffu-0000000BExU-4AKd;
	Wed, 11 Mar 2026 09:16:18 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ffr-0000000BEwy-3Oe9;
	Wed, 11 Mar 2026 09:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773220576; x=1804756576;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xPVL3bTeONWi/ds5cJDTAGXrbPqCVMwyIidh5uvqAMA=;
  b=ekdhsWP+0QyjMvpOiOeo6QiVtq6+4uYRjJ2OoMKvJNuTxoeNXtUdn88E
   mZeUrPOFwBBbA5DESa2j3eT4Ix4A3qd25wepXIc2iUWZSoG7UTZQcbkbB
   2mqx1ugIvHAoqfqcmXsGMPNMzPyLs6eYcTBVb1SdBNWHP8icNf4FXFTc7
   5kHXaIabVKCesgnMNjwV/LN86BdjSQZZC8SR7VhGrbxfrPcpoBECtWr0Z
   ffgyfp59/Hoo3mKRndOXkWMYVZKcjjgakIVYZzAHkZLLmeA9YK/J0rTJ/
   idw9MxmKJOM6nw82ifQLcpaj/xkwNcc7qp33kORX114Vh0IPkNhnbsWFp
   Q==;
X-CSE-ConnectionGUID: mDwPecZxRoWs+8EVOwVveA==
X-CSE-MsgGUID: 6OET7hYySh21VSes/M+NKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74473170"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74473170"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:16:15 -0700
X-CSE-ConnectionGUID: 0nldSm1gQjySuKZO2vFqPA==
X-CSE-MsgGUID: z1vnnK3bT6GqnlTxUKLRkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217088498"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:16:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:16:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 02:16:12 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:16:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/04S6Prr2YA2xe2B3IprnhrK7EgUmJRr1d/dWgNNo1VyR+AGeHf70MFTmnZCUa6yJrDLzQAGLT/gizQz1D9PDrj0wkd04QQLtgpNSdGKa+2MtdH5LSrS3Mfk8fRNbaMEaLcWULWgs+iVRyzhFw1oWIFZyjELsu6cfLmgB2hQJnFFyQsIqT5WiXQTazrikD070Ftk1YCd8p3tT+exOIDiUGjCVeDRBb0dQTDIE66MlVHYTiW50u72SRewNrkdKVSQOo3t7Tfe19JltpwtkxYEq1S4KrIHODYKBfrm5ZVCTltiv6btrS/Da7bDDaNxA6zgNI6VG6OYTjMixb2e0xlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPVL3bTeONWi/ds5cJDTAGXrbPqCVMwyIidh5uvqAMA=;
 b=CKBOAgqZ+sYTR9FSJGdOI5a5Rt0GJswEcmJFCN0S/PIo91CN8VepAt0aERjuu3wwDCtGUyWOqyKu3trreCp+8R2GlQH0YCVZCqvQlG38ugcFFGWfQZD6Q8WFCYRuJJ+Y/tbqYUz5Y2/ooQuXdOK11ymBuBXAvEeLUBO/hVPlBllNNGfCWcgnPpgsl6G/IkH2uZybj86P1F7zwwdwwSAHM60Ylg3cCzHkDk90g++a1afzgjhJ33WNXJp4usIzuAaMr6so1shLrPu3VGUBFoYSsUdYmqIiIQYOFZYQcZ2k0jrNFShbR287OLH3GZCtRUFAbJv+2eAF5EE7Guo6wNkbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 09:16:08 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:16:08 +0000
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
CC: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi
	<arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, Ingo Molnar
	<mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
Subject: RE: [Intel-wired-lan] [PATCH 16/61] sched: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 16/61] sched: Prefer IS_ERR_OR_NULL
 over manual NULL check
Thread-Index: AQHcsKKfUYNoLm9pdUuTIzut4nKxsbWpDgGQ
Date: Wed, 11 Mar 2026 09:16:08 +0000
Message-ID: <IA3PR11MB89860B67553D69141D41B381E547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-16-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-16-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|IA1PR11MB6291:EE_
x-ms-office365-filtering-correlation-id: 21fb89e6-e749-4c05-6fde-08de7f4ed4cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|921020|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: qTRoNxtrbOzoNiDMXOgHCRRy4iHbiJrgtvgwYO44MVanYjZgMhyavLxKBk7cdDGb6c936CFY/D++xMeX2S2/7CM4v6vVLPXA0FJFsc+2fEetReB07WYN4Yo1to/CVH4Hl8c9xGG/RnRoxtww2Nyjz9UVg0Evk4vIGYmYDGMaiD5qcjqEHdICUg0xFoDhN/ZIQsrEYjGJHgfrjWvCERcw/+LcDcpBacDAhD5edPGUZqm7eJ7E9KFnU7kU7j6XYyRkZ4MGa2dzl93dOOHyun61nI5yfMNQS9pMByKpRmjxxQQtg3riDgn0T458vn2T9gJSfQfr5vQaEt09jfzbsWt02UU8qcZSP95yawlaVAeHTCQDykGEv9dwiOrJx2Fqf6k7u6KszQfzgo6oGNxxBOA5Ox2+WG0Ynch2n2tBp7AB6Fp3c5GrPMhsjNG9FFwGMh3i4iXD5A4R+5AZhSL2SvcVc6xjnOoI8ASm76kx+cr6Tjpa0YhFmOB9wAKFIeqr9eD+Y7JVLI73qC2rku9bESO7bmNOqwJQTpf4gRT2M//vxHmWVQ+p0o0YUrrpt7bsTrrU+BcoQoMPFLJ3GBmid44Cvs6JGuaiJZjrEHpPr2FR/pzZRQ3WwsOdUUq0S3w4uRS7phrCeZMTskyyaJi0phvIz1Jt1MKX0gKv+3iHsjBoAwLCR5/FPTl59m7WxiVerDBxqrvwbmUSQp2hhtqV/5H9lRmrSlskd22+2NqJ4tTV1s4hSiq1jBjWGE+xWG2K6c0NjSnFSfm0EWNDIx2AraNR/VV6JB5tU5hhPnnijlps1/0iRCljCFtaSrD2CA1/RKg9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWxaUFFaK0lPT216T0xlQ085QXhWeFhJQkp1enl6ekJxUHVFaEJpb2FFeUFw?=
 =?utf-8?B?OFprdTRrOGhFeHg5dk5vd0RPdGxPT2ZOeFpLTk1qQVhSSzBzYkkvZDI5WEtP?=
 =?utf-8?B?VDgxd1FXS245SkRHeXE4TlJQSWM3WjdNTnRjcTZxQllDT0s1MmUzVU1GZHBr?=
 =?utf-8?B?RGhNZ2ZINzhLTS9zOEEvRzcyMUlBd05lZE4xV2pPL1hkV05Jd09ONCtxUUxP?=
 =?utf-8?B?YXVNVVllSnhwamd4b21XcjhkOVFtb3Bpak1IMHU2VnFsTWZUeWl3US9WZUJF?=
 =?utf-8?B?cldJWnpPZDVDcFYvcVpzU1FDOVY0Um8wYnBYaVB0blluN1NBYk9hWHEwT09X?=
 =?utf-8?B?czBVTEptOXR3V2JIVTF4ZTNGRDhvY0EvM1kyYTBwWmk0OFlGSFdiTGs4Y1Rm?=
 =?utf-8?B?VHdoSVU1bEQxd0oxQmgrWXRPdmNRKzBaWFVzWWhoRURpcFgyc0lVOWJwRFVS?=
 =?utf-8?B?UXV1ZUpDdldMMmgwN1gxNGY2RUVrdDZxcVAxOS94YXZkcXF6cElXSkJCQkNp?=
 =?utf-8?B?YUNvcXJrL0lkNTNVT0svSE5kRVUxbjlRdmpWZ3A2TWJHSWRTblJUcktkU1c4?=
 =?utf-8?B?TWNUUzJCRDFMU2U2SXBBZG1KUWtxa291cEEydEZKU1htdmxnVXNrWG4yREVZ?=
 =?utf-8?B?OCs2cElscUpsaXoyTG1HTmthOHBpelZjUXd5OWVzRFJ3eFFDUVU2azZqcnYz?=
 =?utf-8?B?SmQyRVovL1lxTFFoVkJTVlNCUHBPUFUrckZmWlNoclFUMG1WczZ6WFFxbXZK?=
 =?utf-8?B?RUJZdjI0TVVRWUNkckl1K0F2K0E2b1dVem1KRnluM2VVSlg0czlFYkxydHJw?=
 =?utf-8?B?STVQa2lLUE1Db3N5YUR3QisvRHBvWlIwMVlmQmROSnBBc1U1alBqNmxUWWNZ?=
 =?utf-8?B?dmEyeEhXRU5wakg4Z0wwTkxMV0U4ZzRaYmNPTmN6bXdhVnNsdW52K2FFYkRV?=
 =?utf-8?B?eFkxVUNGQytXVTZ2cnNSWHFESEs0YzEvRzcvZWg5TEIwTzRPRHRFM0RIWUZZ?=
 =?utf-8?B?TUU3QysvT2xzakp3Q0RXM1VGN1pvM1Zqdm9KNmVVRFdYa2FJU0hYMVNOZDBx?=
 =?utf-8?B?RXgxYnhXbWNlR21UOXpkV01ZSmk4VnpYOGd2OWRmTTlQbjk1VklMVzFEcld5?=
 =?utf-8?B?RTg1ejRJOXVidVUxenN4RDJhbTZRdEt5aW5HcitDOWxZT1pCcjlnRStZakx4?=
 =?utf-8?B?aHZGb2YzOFpRUitMUTNZMEFmMGJ3eERyVmJaRlIvaklNNkw1Y2NCK0xFc0Ix?=
 =?utf-8?B?REF5MFdzenVrNUF3ZmNDZGFLY25waVBMeG1JYVZiNVdvdi83TitHM3BoOWtk?=
 =?utf-8?B?RU1uMUxYNU9Hd3UxemRWWUlIWUVwSHBobmZ0WjNZZGI0T1FWUUFMbUwxRm8z?=
 =?utf-8?B?VWFicTZTTjZpMjUzdlRMcEJHZ3lQakV2aDl3NWpVd1hYRW14MUpJM2dZbkZD?=
 =?utf-8?B?WFpHUDEzd2xKRzFJVUdHbXJjbDBRYmRlU2U0NTYrcFZBYmpERWw5NUU0blph?=
 =?utf-8?B?em82anRFWXVUTlRSY0hoK2pVdGl5MjFLdHlrZ2NmWXVmSFpyM1hsazBoTlJx?=
 =?utf-8?B?TFcxOTlZRjJmbGF0RVN3WDVDa25oN3hIYVFVZnRBNDYzRDd5WFljTy8xUUpJ?=
 =?utf-8?B?SHJvSGFWaWUycEJHbXlNTjc2ZDI1WU1RcXQxTEtUdm5RMmlVQXVIWUlZUXdO?=
 =?utf-8?B?YzdCS0luL0lpTVAydENFMngyT2FOVEdFdUMyaDJ5U2NYVnhkUy81azhaQzlr?=
 =?utf-8?B?VllIY2lsbFNRS0x1bkdUbXVmSnNjaUFZNGRJSVRpMHRRYnRWdUhJUFk4WVhX?=
 =?utf-8?B?Qy9RNXpLcHdyZWQyRStGMnViN25vYzlLdldFVjhQTnAxOWs1Yk9OTG40djVn?=
 =?utf-8?B?ZDFCdXU0ajlJOHZsWGdneURva3ZySnhyUnFybTI1VHJ3WlREcFFkRldvbGNr?=
 =?utf-8?B?MmhOZCswZnBKQStzenUwRFNObzArZjFkMllpNjRZdURoL2tEbnpUZmVFWVlQ?=
 =?utf-8?B?Slc4cGwza3Z2K05XM0xuYUlOV3hzNlkrS1htbjYrc0FUOHpGQjJrMXB1eEVi?=
 =?utf-8?B?cFBCMElNOEVxOHZzRmd3TjFKVmdSU1BpSFdkalBlWFBlTEErdUpGSXRiNEpG?=
 =?utf-8?B?MlptL255NGl4U1RWRlZPeXNFZ2tHd0M4Mkt1OG1GVkxHUnNXREhGeHVWZmRZ?=
 =?utf-8?B?Zy9Ya3NYbUF3bG1yQkRFUnp6T1dvd2tGNDlWcklYRzdYTGw0TDliSXoyUHBT?=
 =?utf-8?B?bURaYmgrbHY1ZGZyb0o3L1IxMC9GdDF6dmYrNGNiRHl5LzFDck1BMTJnY1F3?=
 =?utf-8?B?aU5WcnByTjczbHZnRkdsTVlRU1I2NnhIamc3VWVIcGFyUHowbWgvWDZEOU11?=
 =?utf-8?Q?AxQtvYoIkyHYX4PA=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: M3cngJEvkFuurESqdwsRbufXMuRoqMkoe6jxfomI88XKAiMl7ZpyE5ss46HqjTtO3g4uf7YqDnk/nQDsPkB1r6tIelsYVMm01y5Nd9qG/rlyVJybZfaL9H+9ijc4ui8EXmDe41aKbVnxbq4xOpX3Ma0UKZS4roN3UnszvRSu76YH0sGNhcw8/0A/AyBV9EKiitGKA1lf46ndW/+UJDUSzxpuR25eDuanCI1ZudbTl/lMPnr1f/mYSg+QHVshBtO3/75kI1ed51WwnsOgM3pqnzpMvPOLPLFrWxpdcm/Sg8OVr2SntFxTlEfhY1WS3fH7WFbYSKe0oLxQ7x8Fj3veRw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fb89e6-e749-4c05-6fde-08de7f4ed4cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 09:16:08.7290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h47sHmLqaUCG9vERJMTMEVxi4anH3F71frhZm7Ao4Df9aB1l1rCKts+uUTjDLDD04Kf+AvEB5gcJrSB0AOLGrVWD6Gml2s+5NUYuU0ZCqVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_021615_921160_2ADE0B2B 
X-CRM114-Status: UNSURE (   7.58  )
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
> Cc: Tejun Heo <tj@kernel.org>; David Vernet <void@manifault.com>;
> Andrea Righi <arighi@nvidia.com>; Changwoo Min <changwoo@igalia.com>;
> Ingo Molnar <mingo@redhat.com>; Peter Zijlstra <peterz@infradead.org>;
> Juri Lelli <juri.lelli@redhat.com>; Vincent Guittot
> <vincent.guittot@linaro.org>; Dietmar Eggemann
> <dietmar.eggemann@arm.com>; Steven Rostedt <rostedt@goodmis.org>; Ben
> Segall <bsegall@google.com>; Mel Gorman <mgorman@suse.de>; Valentin
> Schneider <vschneid@redhat.com>
> Subject: [Intel-wired-lan] [PATCH 16/61] sched: Prefer IS_ERR_OR_NULL
> over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Tejun Heo <tj@kernel.org>
> To: David Vernet <void@manifault.com>
> To: Andrea Righi <arighi@nvidia.com>
> To: Changwoo Min <changwoo@igalia.com>
> To: Ingo Molnar <mingo@redhat.com>
> To: Peter Zijlstra <peterz@infradead.org>
> To: Juri Lelli <juri.lelli@redhat.com>
> To: Vincent Guittot <vincent.guittot@linaro.org>
> To: Dietmar Eggemann <dietmar.eggemann@arm.com>
> To: Steven Rostedt <rostedt@goodmis.org>
> To: Ben Segall <bsegall@google.com>
> To: Mel Gorman <mgorman@suse.de>
> To: Valentin Schneider <vschneid@redhat.com>
> Cc: sched-ext@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  kernel/sched/ext.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c index
> 1594987d637b09e586ae788b7f2e6336332d605a..cfa869bd7de5406a5ca094992ab0
> 4c62b0e92fd0 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -3688,7 +3688,7 @@ static void scx_sched_free_rcu_work(struct
> work_struct *work)
>  	do {
>  		rhashtable_walk_start(&rht_iter);
> 
> -		while ((dsq = rhashtable_walk_next(&rht_iter)) &&
> !IS_ERR(dsq))
> +		while (!IS_ERR_OR_NULL((dsq =
> rhashtable_walk_next(&rht_iter))))
>  			destroy_dsq(sch, dsq->id);
> 
>  		rhashtable_walk_stop(&rht_iter);
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
