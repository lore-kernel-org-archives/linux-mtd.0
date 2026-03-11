Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FFCFD2D9D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 09:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYZbU77h54C1B6bkKrvtzVcEcxknkNxy64woS30ivsM=; b=vmso/GJ2Ut+M6F
	C/0IWuP7h+CkMJEe1ZJKepO9oVDWBFIn7EqrquZmlenw+UUD1QkB8dPFN1fg/PwuPLUORHlBYSFLy
	p+SV52lou8kSk6YVbobn9Y+db46xzBYcabt0Qi30R+IKvl/JN4Oj03tcubFNK9IZn6UjgJv0rMOgL
	sirAx8mrPcr7tgW5n2uMIpRMQZM/cyvfh/5/hxa6d95iZSNgSE1rHCuJkNW81w3IeDQTFQoFh6B8/
	HWlSLdCotJO6FQ36LMV3sgSkgo1j3bVO7BK0LS6Q4WILW9WmyLzSdoxC0ynHNXiWw6c43EaStVgCr
	tqPMKIolyqRHt2YD48AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FpP-0000000BHMd-2Bvb;
	Wed, 11 Mar 2026 09:26:07 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FpN-0000000BHKG-1ZBy;
	Wed, 11 Mar 2026 09:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773221165; x=1804757165;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cyKspt4RQZA4WPrUM7YTnCuz9AcvIkjZ2vzIJ7xgo4Q=;
  b=G+hAmjBgXiitGMxmoF/uVubhzgiBZTMKWdKgtM2mIRPT9unq/tCJpoFa
   LMSwcqTGokLgXMqantxSgc6L7LgaqsX4fbZ1g7ymWSO95W5S9D+OCAeen
   eHaOou5zAseS/FJyJs7ej8tOjffAiSUlKCJfvYhhWxn8euZ+tAS5LKg0r
   lNuXTQ2gvckBJsEqwJfr85r8BHYi1ZajEQxw1Epq+ibEW121NPU+hVu3i
   s3T5s2J1X92YzffCblSBuUc43elPPw3apoXcC08iFyp24G9tp9I5fbvZa
   PxFATfXDoCmUg6KQyJD5DFXuka7zeAh6INNdlcvj5vy26bo0nGKOq7DjR
   Q==;
X-CSE-ConnectionGUID: zIwzPnCMRM+w/l5DExP07Q==
X-CSE-MsgGUID: AKShyfuwTl6nBSsQttdKuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91665780"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="91665780"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:26:04 -0700
X-CSE-ConnectionGUID: LFU5EhHeQjeumOwM0B7MyQ==
X-CSE-MsgGUID: OawEcd+9SG+7pZpl4N5cLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="216681025"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:26:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:26:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 02:26:01 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMnelAnsGLh5mEAtzesRCYmMt3dlbe/7+sd+j1vDC3YROHwbrIhkDxd0+Xx6utnKVfa7n+qBM+wqLN0qEEPQO6lKYauG+1KvJwdLax01tLZZyf6JlCkOMofD3uBMpzs/8oKmQ+5iezXjeMTLFwHwj0kKuhq2I3oW6mYy4zGql6QSi1jXDJbQz39PaIxZ8C1DZuOHA6n8/x45vRpqXGw0qjCJTSXqUACJEN1TWL7zVOWaxHNgKYcQv92836rDdTmPN3nBqNy/QBMTgcX4/d7CN3CwoCzED414/Wf9tP3MyPKL4cy7V9i/TbqYCu0lvC3nVnscZObE8DFPFZgRlcW69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyKspt4RQZA4WPrUM7YTnCuz9AcvIkjZ2vzIJ7xgo4Q=;
 b=GjlIN/UTpN09nyoNrbsP4m2NtmQT1Ly+FkBlozActzyCraWzuD1nUyJEp+HrS0C20oJk9RcPus48mUW2MDELLubo9aYbyFccc2ANgYjdky85DPnEmsAmPwH2RM6cdLln4Zvl8ojQHxebSljiJVMWyIjnqRh3YDBqJIW9eTgQXioO1CVb2lIzRlLlfUEHbOSjfcY7aIlDwUgCOzhRVMb06PT+9Om6d3qoVamqsPLZarpxSv+Bv6MmevXseYp4id6ZEC9phqppcUUluELbRG7zZBemV4qyBjLO2vfMTrVJL3LsfwShmujm+CNPQzLbDBK/KxrpauxZLWRUoUirtW7YhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Wed, 11 Mar
 2026 09:25:58 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:25:58 +0000
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
CC: Shuah Khan <skhan@linuxfoundation.org>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: RE: [Intel-wired-lan] [PATCH 49/61] media: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 49/61] media: Prefer IS_ERR_OR_NULL
 over manual NULL check
Thread-Index: AQHcsKKJC7wOPu6zykS6DEkPokoDo7WpENMw
Date: Wed, 11 Mar 2026 09:25:58 +0000
Message-ID: <IA3PR11MB89861DF7C206BD634B477539E547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-49-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-49-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|PH7PR11MB6836:EE_
x-ms-office365-filtering-correlation-id: c9ed382a-e59f-464c-640e-08de7f503440
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: +h66MB2j2vOXsLZaMH2Eb9pjjcM19YQTG6uM/bPbqnKJKI99df9KIqs9QYBEEAIR3WdzyLC4fz7DgIn9WnSe+EhbqCc6JwetdPXEJxaN+Z96UtWHQvrTThP76ftGAaGTJc5M2KLRc46RdmGHskO2Z+qarm3AyIUGfwOuiLpLsqiKjo4v+HlEYJtRYrhXc3owI7zaRzFeEftfpBZ+cz15SrWYjf/WJHFfXK3IX29T/vsLHaNWNNjGBvcE1Xoe41F1TUeO61BzemC0ghFCnrSpwfWZVQ2x7m6zs425wMWVfpok0Le/M/w+RG9Yd46JoLYYRxb5YRrVaT5iHv8NAsMCjHGsORvP0P/dL6wIgk4TT8s1Tmi2aU5w5zXdgT2N/bzSoaC4AouUEfMWGdEKuF6G049D/Kc/dM5FFvDvFS1rRdB/ZNNPmjTe72OyYvwyqdYJqyuVne+FaG4CsbbKsWuTHF2kz2Nflqalvzm9hgDWmj9qyyDIeyhr3YEeDjJ59bQ2tIeOWIK8BZ36OshnVjOdr2jgHJ+rmIzqnSGkEsUkRYSCo0xeEuMTVk1oxU1ntyKcshAuNRpOQAC9giFYrajphl+bvZmKk8SRmNfWVyb1VQwwvxU3RYcj52WRVJWNS2jut6tOSRuDYQmospdx7wp5f24zdMI2BAZeY5ydGrMcmhF4qWvGs71HYgjdMP6Mutx+2BBUa/Iz7S4yqHiagw4S5/lzQ2MwBhhpTiPgXyY4lewdvBLPHyuMt8Z0AwymRno43q/8w3tFcIoRg7dRI/w5p8lNNSoG9vd/liEKI5uiPYNsBn60fKJ4IUGT/9+sGc1B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SW54aFNRcDZSZURGMlo5UkhvN0RHSVpnZHlsTUJLZkM1a2YxTzVOa29xSVNE?=
 =?utf-8?B?UmcrbTZORk1ZV2h6QTlRdXpiK0lWS2VYZlFSbmlDMVF3ck9TdFczN2FYVjBl?=
 =?utf-8?B?MmpyUERHL0F1NG1nNDF2b2hRWktndWVvWjl5cXc4ZGJxY05NSUh4MmpoYzl2?=
 =?utf-8?B?c0JNNGp4V3NDdkYybGdMUllLZzBBWVRvWDFmMTRHeVVSL1MvSVl1ejV3UmRq?=
 =?utf-8?B?VmdkZG40OFhkdk8wMEpUMkNsR2ZpTkhtNVhtUzhBR1VSQ0VvcGxjNkl2a0Zm?=
 =?utf-8?B?bExiaGhVK1dDYVA2YkR0ZHRRQ1lnWEhaelJuZXFuZUtuS3prUU82OHMzay9O?=
 =?utf-8?B?K01BT3lqRjVhTmRTNlZjUllIc0hMUUdmUksxYS9aclhLV3cvWXBSbE5FQXlV?=
 =?utf-8?B?TElhYUNvZ001NEFraEhJZFpkL2ZDdEF4MkZoMCsvblpCNGg2K1BOVXVJdkkw?=
 =?utf-8?B?TitRSE9NU3IrZDhuNVpHdXZ0Kzg1TVdNYlVWTVRtbWFLMTJQUnJ1WFd2WmI2?=
 =?utf-8?B?T1REUTN6N24rNDdwc0x4U1VQdUxFeUdiT2h6bnUveEEwNEkzazZZWnl4VzQ5?=
 =?utf-8?B?UXpVblYxWE1SdE5PYzltbHo0WFFWdVNkM2xmN0xzcXhZKysvbC8xZUYvcDk0?=
 =?utf-8?B?OVhXWHU4UENwR3gwaHo5MXJsMjYxMmgyRkFFdzFQVXg1czFtcnJmdTUyNXF1?=
 =?utf-8?B?SkNHSUhCREVDdmw4UmhVVGlRZkxxWHcxdHB5WkhXaW84U3QzZ0hSQ09QM1lZ?=
 =?utf-8?B?eWZOd051SEVzTXFlNCtyRHpHUjhja29ZNzlGZnp4cmVFUkg2VGJWSFBJajJE?=
 =?utf-8?B?eitNZlFBTm1hOWdVODBnUWZDM1hFNkJhTmtGazhVbUpBM3c5UkFrZmE1emZ5?=
 =?utf-8?B?R0lZZEZJWWJZK0h6QVhISHhvOGx2N2tlRWFNWjNxQU80aGVYTTI2dzhxaE9N?=
 =?utf-8?B?a3RwVDJCMGhJcGpLUEVyTExsWlNiZkhLUjJOQTJwbG1WTlp2cWdsOEo4SCt5?=
 =?utf-8?B?WnhWMDhaRDFxWWFNMXArbG5TMlRuYkZyZTl6eFF0VHhqeXV2aC9RQVBTNUND?=
 =?utf-8?B?dEV0WUo4bEh0aFo0UXFyNEcyY3czaHladFpJTlJmTVRFNVhoREszVy9QWXhP?=
 =?utf-8?B?bEZGS3BVcklKdTFWZStIOHpxREpFTWNNeXZzVFFrQnZVenRXV1lLajhrbEpu?=
 =?utf-8?B?RjNpa3FQT3ZOVWVVY0w2emlmRGw3MUpxalYzOGk0RFMxQURuNU1rMG0yaGh5?=
 =?utf-8?B?MDY3WCs4N3RQOGJXRFZQRzhob2NFa3FNV0FaN1RHWmpzVGlBUysrTlorb2JT?=
 =?utf-8?B?MXZWNXprUDR0U3M5YmRZa3B4K0lKL1I1RVdrZ1hOVlVYNmdmdVJ2aFVmUzUz?=
 =?utf-8?B?Q29nV0pMWVE0OVI1UkhiSDIvK0paOTZma2RTVkdXL0hJNjNXaFBQZExMbUR4?=
 =?utf-8?B?cEg2b1hpRGtud3lDNFNCN0E4R3JzUmxaLzNoMkhUR3VUVDNzWE5aZmtQOS9U?=
 =?utf-8?B?a283Q0xHbTVtaktqbWZHWkVRK2JPMVJnek5BN3NXK1QzVDE4cnh1cXN1SitF?=
 =?utf-8?B?L2lvcExuYk9KbFNZY3VRbnVtN1F1UjBxWGZLTkNjK2lDTnYzY3NSRmFKT1NL?=
 =?utf-8?B?NFkrZTVMVGpjUHFLMnlocnNtYnpkaDhnM1h0K2w1L01FZXllOEs1bjFPd1lQ?=
 =?utf-8?B?Q0ZvSGFCU2FSTldLaTQ1WXRsaXhxM3BhSk4xeENhaU50cWhpSCt5TUpvVFFz?=
 =?utf-8?B?RDZEL1d2UGt5RStEWjhJL0JqQ1FFSEhBZ0RsU0wrYk1IdTljcVVhKzRJMWsr?=
 =?utf-8?B?UXorc3Q2NkRVcmQ5TXZuVnFKUE9LT0FDaE1IUUVndno3dHBjN0YzdHdPNVFv?=
 =?utf-8?B?Kyt6RWlya3UwVmdMQWR6QnluZnFuMjBPeDhrMFpoak94QW9JaytwTHdyeGRW?=
 =?utf-8?B?N0JlVkVoVXZHQ0xCL2NqaUxLSm51N0VVR2Jnck0zc1kwZU5ndkNyOEZEMkRq?=
 =?utf-8?B?WHJJK3kzL3RxNEl4MHM3OENsdHJjeTYzYiszWVNrSWJKS0U3SWI3L3c1ZE1M?=
 =?utf-8?B?RzJNMzNwdjJoK0ZhTW1DbytmN0V1VUhYT2dGSWtXYUdOWWdiNWQxRytOQmZR?=
 =?utf-8?B?cTF2Vk4xVTc3dk5yR3BRQ0xxbmp5UStlMXh0YWdvdWdObnRua2lvMUI0Y0NF?=
 =?utf-8?B?cGl5aUs0NnZBTlJZdk5JeGtjWGM1bTlIemhCbG1HbUVPb252ZUhOeVBWLzdK?=
 =?utf-8?B?TDl2emN5Nm9ydlpUS0pEbmU2dmJVUDNod0dSalgyU29kSmhLUXI3VnpXQVRV?=
 =?utf-8?B?aVBQUFg0Z3VVL2h0RGlod1Q0ZFJWcy9wQThxZUZGL0R4UzlLZFpUVFJHaDNV?=
 =?utf-8?Q?S0CYujZn+ePJQXsw=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SQZePNg7nKAAbDqMZ7dW1KHZ0FFwuCn1Jt76oEzgegnF5SJgaGKEma+2Ac/wYI7p91qOK6NWHvlqijxMpvA1Xza0Jp4lz2KSWF/jDCkOBRpYZfPPob7+/x1rDy3YvjVepeutrQse19LJjPl3wgjksdB6NxWPkcJdKbdr6UtWEumlUyob+dvC7YmHtdOqYRVglVtCv7xN/s/kOoRo7wbnCqfz8YpnB2EAV5EegXbPvG9BeGRclUz1aOXpzB1+3hzmIim2BIiLVIznk4NiitZnWOlJPFzUCAVHh7vcsc5I+DmmrWO2DMt/V/STYZrYLvvBzUlSimeefDhCGuunhuIZNg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ed382a-e59f-464c-640e-08de7f503440
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 09:25:58.3602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HjZdscLZqaiMLL5IiMuiPhMYno2isL9hRuKVDLo/kqTRKMwOrvrBMcD4bI+ntSh9gHqWiFjs9lRHrj3mUdYG1LDTIMXboOJ3d8OYEwoCxpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_022605_484918_97D5CA38 
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
> Cc: Shuah Khan <skhan@linuxfoundation.org>; Kieran Bingham
> <kieran.bingham@ideasonboard.com>; Mauro Carvalho Chehab
> <mchehab@kernel.org>
> Subject: [Intel-wired-lan] [PATCH 49/61] media: Prefer IS_ERR_OR_NULL
> over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Shuah Khan <skhan@linuxfoundation.org>
> To: Kieran Bingham <kieran.bingham@ideasonboard.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/media/test-drivers/vimc/vimc-streamer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c
> b/drivers/media/test-drivers/vimc/vimc-streamer.c
> index
> 15d863f97cbf96b7ca7fbf3d7b6b6ec39fcc8ae3..da5aca50bcb4990c06f28e5a883e
> b398606991e9 100644
> --- a/drivers/media/test-drivers/vimc/vimc-streamer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
> @@ -167,7 +167,7 @@ static int vimc_streamer_thread(void *data)
>  		for (i = stream->pipe_size - 1; i >= 0; i--) {
>  			frame = stream->ved_pipeline[i]->process_frame(
>  					stream->ved_pipeline[i], frame);
> -			if (!frame || IS_ERR(frame))
> +			if (IS_ERR_OR_NULL(frame))
>  				break;
>  		}
>  		//wait for 60hz
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
