Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0F41049518
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 09:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uwv9m32xnTVFmu58NnugaMCE5w2Eu3ycZlDa5DBtqJY=; b=Dm04H6zO/m627V
	YxwY/1k4H81/foYYqL4RCjV2jTAQf7yW2m1PKmBgQqTbBPsv7EoDFFWQgroHmU7duSjkcSftOTSsz
	kVBVEw7QzmgYb58FWrfAUR+khi8FAbzw7lXxijkvDm4Xooba27tz5ivvE/HoyFsWzUUC9ExRl3lFM
	EgzjaAgvJdWssC19NFPWSzCgRQ/vUkeJBhtNOhcZ/a3rW9mykv6ACHHX9N/xOkIgM4MYB5ncD09ZJ
	qmTdFOu1KoMRoS0H8A7bz8LoU1OZx6Po88s6YTIfTXipFEhDFD9SiWD8OEj0Xl06KJ9rAKimgxsP1
	Yzusjd9kwpGniFKdQisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FmZ-0000000BGR0-1Bq0;
	Wed, 11 Mar 2026 09:23:11 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FmW-0000000BGPv-2Gny;
	Wed, 11 Mar 2026 09:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773220989; x=1804756989;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NB2nBRc43fDX8zlDL4NBYU+3M2DIhtkp5vKO6YL+b6M=;
  b=UduVW3tsHSyvwKSkREmdbxdrutVoweuJFDtbgy8IFSwRdI6HyrjSrC+r
   8LgeqZBIMVcYgnPcsGIPRPvID74EPEp25/t9InV27x7jVmze5y+RUr7/h
   f1v8Mr8GEwfb9gB5qxcFI1hiK3hPRaqSbqzHvWWFhbYP37circtQss74z
   NlJAmeIsbxJ9kX//hK4Mxdp1osA2BszY5ErJHgtqBmCihpfbiFBp49mSh
   ecXWoS0Z0iYcNYRsF2QQrvEGl36wD33uYnz2IsdAiuCrjSZJbJ/oJV+ez
   n4Qz8xfrCcRMhGugzrDgQlbCWQtLSQFwkC8DocFnoyk1JG1oCnH14Bwxg
   A==;
X-CSE-ConnectionGUID: SmebLXRfT3y9fjD3D+nXNQ==
X-CSE-MsgGUID: ahyJ/AsGRMKysOEcVxvxnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="96899293"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="96899293"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:22:59 -0700
X-CSE-ConnectionGUID: JgNxlRfBS6KCtj1uc15vuA==
X-CSE-MsgGUID: 3z3bFIfTQuSWrDhKNAVhnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220353827"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:22:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:22:55 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 02:22:55 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:22:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baDKytEOSuGkPkikYD7+K5e3b064XaUagF8q4zWo7sRLP1x11vxxCZ0aqocLiEvcRwPWXe5NmAi4V60e5wQ242jK60Xlom2m7LiDRCfrqO/giF+QjAotDZJba+hbVhOJjkLM3VawTekdruOcV8QPGq6XLuXxzygetIn4lARS5+PjYAQODAQNeoeM9tLVHNNd6uXTVpCWgv5zZcXOY22kMhohQ2ORDtH8f+fftD3Dpra3gBjm1VffTHnMecQ1QbKmK+sf0qU/GweRNoPR4Jbchgp3J2xy/rYzrSRUxjOZTw3l+5/mVduPjfjn/wYXN93fxX24jg5tzIdZsbXPQfAT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NB2nBRc43fDX8zlDL4NBYU+3M2DIhtkp5vKO6YL+b6M=;
 b=w904wRkk3dEy+6955ivcfDdm519SZfBc5PoypOQOBqhPX/y2QEtd3JxFPwp8SAy+upM81Z/48KwY/MTVwpbA3zCHIBa7vma0VOm/BX43uRXEWRfAEOhvtJnBDOdk/TB+1u0BZpbJNiH2njmsAJayodsYG2VYrZfJ1rUVeDQGUeuxtVNd9MpyX0IIoD2QNvQc0iTzdLRSMQDVD8jB3kU3oj5xl0O9FRM2gFcxrnYX2dZqlT0eGyBrDds+cQ50dAc+23+4t1lVTW6X8IamG0cZpNgo2lHUCE0lzAHfbSP6GxPZKZyR1lqfgSUg/Lj2ItGwfGTAl/hAg9SsopqfrY2Yvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by CY8PR11MB7897.namprd11.prod.outlook.com (2603:10b6:930:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 09:22:47 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:22:46 +0000
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
CC: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo
	<Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>
Subject: RE: [Intel-wired-lan] [PATCH 30/61] net/sunrpc: Prefer IS_ERR_OR_NULL
 over manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 30/61] net/sunrpc: Prefer
 IS_ERR_OR_NULL over manual NULL check
Thread-Index: AQHcsKJ0tObOnwx+9kO98VYqVZZsnrWpD+kw
Date: Wed, 11 Mar 2026 09:22:46 +0000
Message-ID: <IA3PR11MB8986B27E91681D79D9D8A387E547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-30-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-30-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|CY8PR11MB7897:EE_
x-ms-office365-filtering-correlation-id: 7b7a6dfc-62d6-47f1-862d-08de7f4fc20e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: GxQQCd/c8eV6aNEekxf/kywrprbTaee5KerYvJkRN8yhsK9GmObVtty0cvZUqgruTDOnh9FYrnoryvIlYHlX1jPbTuRpZFBHu0FodbAGXBM+tQqVuKBZx5Rq5rtunOYZymKDvLdiGJJ+X2LSaEy6lyql4V32YdAsR9WvQ8LriGm0kT3J9sogaMlIk3w+RzQKv2V36PikgxJS0X03x1SKBIvYbugQ7+HXCFx+S54977zIJ0P0jRt4d3SI4R500xOle9LL9wl+NKUs+ZtXRPDTxXBRGMmhTxjrDke6HTfJlrlwNrD4bO3TlWEkE4iYRtPmH6ZzCA+S/yfwao3UbFe2MBKJPGG/WIGx8wWaqVG8suHB5h+oms3skixZcAmCnqUZfNhX7jCe114UW1puMdstFSN+lluiuvgbvmN1SFqRfkJOHBuCbAjmvGKIgPeUiVCJTUDUyRxcP3PVqW9bRFVu2O60LuQEA92OXdiCFtLBjr+mbnFBBlCUgnPczWphaTpOXMhAO/fyChiiDZF9qZNNPmIYPAtYNfW5A0zaj0sn5oIUzYxRvpEaS+vUowvXJ7WJPDoYhzDQl9DBoT7+PIYO895bhBXT1Zmo1y0gHPtb1RFJQqg+Fz4LGos7/ZrbG2fXN5CnlbS7KCCsk7050OVomSqrDeM2JP8EJnLoASHFjS9kg1Kq4S9smaAsEcfjgDGCX2082HK5ZN49fqlW/TzBrwoLWqJsfEGeIAfOm9NxClGzHYS4qqDJ40xLMc2sASYXhYaiH1O3kHtejDX8szCddM4ytwOhjczmM5QSQx06WvcYdwOZd6yMRpnXJn/nr1Cy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WU5GNWpPRWt2UXd3R05laHJacUZxQzlXN3RlNXh5YVJVUHFnbzh5OHB5TFY0?=
 =?utf-8?B?SkNhUXVpeHkrejlsNzA3YzYzdDlxTFVIRUptdzdiMU5ndFVpSCtvOXVhZDBl?=
 =?utf-8?B?K3l5dGFlWDRPVVVpaXRWRFJiTDYxbjJKOU5lRjR1bzFMbG5aU09obU5ya3Rj?=
 =?utf-8?B?L0JrWS9BRnVodFFZOXp4a01VYlA3WnBWMHd1TmRqWkliT2ZCNG13dTlPQ1RE?=
 =?utf-8?B?NWp6MXFFMEFMTU1STFh5bWdRSDdnMmI0RTh3Z2RhNlRDSDdZQWNoQ0VHM25m?=
 =?utf-8?B?cit3LzlUclZzUEtXQjRnVlEwQitxc2NoZTc2cXV0M2hUaSt6cHdQcVEyUHFN?=
 =?utf-8?B?Q0pFWjhETFI4NzI3Q0gvcjIvY1RrNDI1WDdMZjMvYlQxaThJcjZia0FuOTZ5?=
 =?utf-8?B?UEZwOUZSREhXSXk0MUdWUmR3OWhQT2trdlBTVUNFN1g5WitSeFVMMWdtSS8x?=
 =?utf-8?B?T0lLMyt6M29KbnV5VFNaejRiMWF3akhkQ0JzbVB2dmZIbjArOVM0MlltdktG?=
 =?utf-8?B?VVVKdTRHUjRlTnVpTVhLSE9saE44NnQzc2RQbVp6ckRQR2UxWENFR3NUc25R?=
 =?utf-8?B?aEQxaHc0U25FZWpQQjJ5Rzh1VmtUZW1McElvWTdTeEpvaS9GVG5lektXUVVn?=
 =?utf-8?B?RUxCbk40em5TQTR1dE0wV1p3T0RJVVJVQWc4dW1QeHkvcnZiYk1lSHBPUFdi?=
 =?utf-8?B?S1BGMGVhUGVyRDRjL3dFT1JFaGFuViswTk1SZXNiNXZJdEhqTnpqSXdWK1o5?=
 =?utf-8?B?ckJrd3kwT2lmNVljOGJvRWRRaW1PNUQwT0xUWkpXYUtNWWF3VUN5Q3VLRGh6?=
 =?utf-8?B?bVFqbm5QTlRCZll2SVhwaFVYSW5DMGhOWDRRbjU2bUxVVUtXNFg5UkN1eG0w?=
 =?utf-8?B?L3Rqa2F1SVUrazdqZ2doMHhBSjdML0s4Z21mRm5WdlJ5M1F2cDduYTRySDM0?=
 =?utf-8?B?N3k3THpiYlViTnZhV2VvQm0vOXVpRHBHUmZGaEpBcnBERkw3Qlc4RnEyWWpE?=
 =?utf-8?B?amU3RTRZUjVNYjZxR29VSXAyNVU4OFhsYVptTTQ2THVsOE85ZVYvTG9vSU05?=
 =?utf-8?B?SUpIbDFCOTJmZWU3ekpVL2oxNDRGWUFnZG1YUHJXRGVLaGFJczhVZFNjdW1B?=
 =?utf-8?B?cjhFbGJVT3NvWHlKV0pRMHZ3eDZxMzl4azVZRjY3S09vSFZ3RjRhSldHWUhV?=
 =?utf-8?B?c212T1JlSHZpSGVoQ29XR3NpRE9qa3VvWGRrODFyc3BkNXVHdStSZGszQzJw?=
 =?utf-8?B?UllibFlFRmVLRjlPcGFMM1VHT09ZdzZrRHQ3WDIvaGZRVkZOUHNJWUloU05r?=
 =?utf-8?B?NkJza1NvdFZuNUhBc2FiV08rbDlxSVhzd1RqencrdXZiVzFUa0RjTURnaXZ6?=
 =?utf-8?B?T0VTT0x4cEZVTi9uVDc3ZFVKSnNIb01FTnhCOHd1c3Vqck1OdnFQMnFHVzJx?=
 =?utf-8?B?SVFXcURtMnJ5MGF5VlRRdjVpNHVYMG45ektvaUVORzA0b21NV2FwZ0wyc3VC?=
 =?utf-8?B?L2xxbGg0VnpZcTRhMzdlNncxRzk5Q21iNnYrYnJMSmJMWWtPcU9BZUtMWWxG?=
 =?utf-8?B?bkFJVm5DaHZ5aFpCNjE1V1RMZ1JELzZOUk9QdGIvRythMjZib0d1eDNSVUZS?=
 =?utf-8?B?aXZlbExHUU1xZWtRc3dqRFl2QlJDc05hZzh2eEQ0U1FKdGlIa2NQMUhCRmdJ?=
 =?utf-8?B?L0N2VDNFcDNwRjRFUDR2RTZ2dG1iQVg5OVR6d1d6OTdWeTB5cnI0QVRHTWxI?=
 =?utf-8?B?ZkhLT201RHRkSUJ5VXc3a3JmUitEczJodEhqaEhzTHl0UmhkK2hCMEE1V1h1?=
 =?utf-8?B?RjNuczdmTmdsNVlDMDE1NXhPNHcwRklJQW1xL2MxdWNsRnIwZVF5bVdiNXJ4?=
 =?utf-8?B?WGw5OEM1V0pwS1BXSDVuYy9OQmJuVVdEUlA5amFYL2JCSllLaEhnSnZhR0Uz?=
 =?utf-8?B?SmRJZTlnWjRoU2Jwczc0bTQwdzdHNkhJamxGUXRsd3dDdjZpNVk1NE1QT0N4?=
 =?utf-8?B?bVNwZ1BqbllvZTNTVHdSN09MT1RGQWlpa3BzTkhxZU4xUjRxMjBPdm01RGZN?=
 =?utf-8?B?VXZJODBnd2dnZVU0ZkM4RVM1Q3A2MkIrd3ZLaCtSaXhnOTlEaUV0dHBRay9W?=
 =?utf-8?B?TURmTWI4V0RVQVJxUFlNS3lNcmVndGMxSk14WFlmdEsyQTNVemdiZGZIY2FO?=
 =?utf-8?B?UGk5NjBmaFFHVVZWVXB3VmxZb1lBT005blU5ODlsRjMyclVPRWRJZENGbFZi?=
 =?utf-8?B?dmxZeGNPSWs2Mnl5dENGTFIwaDJkdWtjSVI4Uyt5ajluS1dlTVIxNXBKem9j?=
 =?utf-8?B?aTk1UkhSUHBsWUM4WkhuYTNTdXAzU0ptSEZVU2tDcFJldkpnOGxacEVLc3hN?=
 =?utf-8?Q?d+ODkmbfj2d1XMOQ=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uqN/PRuN+pHeGKAJeiVslQTfIoQDMSjXr/jPdOzJJ3OoQQSj1v7QxjBPGBW57eCn9dqtHV3Z3wcPezqhXwae0k4zhFu9vFi0et76GamFVnAkwI7j5nAUh51dQkzv7R11kKVmL7oPWLpUFr/Tp9x33d6niKWH7giuk1bdQtDsIPGTQEfzNY9PS91Tov41ZJ1s9KEOQUrVXkuWUAl3T655CAr6N9dkUsS6vrgGUjGgnP1oRdTpPPEHB0iXn1jkQGV/Q/vi9xP1yDKqBy6Bab/qdCXXkE2CQhJXlb9oyHY91l4tUFHb588Fyn/6VCgF8kU3Mh9lJHZ+WMoUvfnbvo5/bA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7a6dfc-62d6-47f1-862d-08de7f4fc20e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 09:22:46.7619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZLgNgL1yFcWDQiRaEtxZHr4XDLXtW42+n30PIQJxmEMOHU73e4kE3c/XFVsH5B8Pm+/0D1cNn3DD5Kane2r8K2fhocF3RSNuDUsNdiqZA+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7897
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_022308_727943_10004456 
X-CRM114-Status: UNSURE (   7.35  )
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
> Cc: Trond Myklebust <trondmy@kernel.org>; Anna Schumaker
> <anna@kernel.org>; Chuck Lever <chuck.lever@oracle.com>; Jeff Layton
> <jlayton@kernel.org>; NeilBrown <neil@brown.name>; Olga Kornievskaia
> <okorniev@redhat.com>; Dai Ngo <Dai.Ngo@oracle.com>; Tom Talpey
> <tom@talpey.com>; David S. Miller <davem@davemloft.net>; Eric Dumazet
> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> <pabeni@redhat.com>; Simon Horman <horms@kernel.org>
> Subject: [Intel-wired-lan] [PATCH 30/61] net/sunrpc: Prefer
> IS_ERR_OR_NULL over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Trond Myklebust <trondmy@kernel.org>
> To: Anna Schumaker <anna@kernel.org>
> To: Chuck Lever <chuck.lever@oracle.com>
> To: Jeff Layton <jlayton@kernel.org>
> To: NeilBrown <neil@brown.name>
> To: Olga Kornievskaia <okorniev@redhat.com>
> To: Dai Ngo <Dai.Ngo@oracle.com>
> To: Tom Talpey <tom@talpey.com>
> To: "David S. Miller" <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Simon Horman <horms@kernel.org>
> Cc: linux-nfs@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  net/sunrpc/xprtrdma/svc_rdma_transport.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/net/sunrpc/xprtrdma/svc_rdma_transport.c
> b/net/sunrpc/xprtrdma/svc_rdma_transport.c
> index
> 9b623849723ed0eb74b827881c6f32d3434c891b..b4d03e59a8202f20360cff1e2e79
> b1e325396517 100644
> --- a/net/sunrpc/xprtrdma/svc_rdma_transport.c
> +++ b/net/sunrpc/xprtrdma/svc_rdma_transport.c
> @@ -578,7 +578,7 @@ static struct svc_xprt *svc_rdma_accept(struct
> svc_xprt *xprt)
>   errout:
>  	/* Take a reference in case the DTO handler runs */
>  	svc_xprt_get(&newxprt->sc_xprt);
> -	if (newxprt->sc_qp && !IS_ERR(newxprt->sc_qp))
> +	if (!IS_ERR_OR_NULL(newxprt->sc_qp))
>  		ib_destroy_qp(newxprt->sc_qp);
>  	rdma_destroy_id(newxprt->sc_cm_id);
>  	rpcrdma_rn_unregister(dev, &newxprt->sc_rn); @@ -608,7 +608,7
> @@ static void svc_rdma_free(struct svc_xprt *xprt)
>  	might_sleep();
> 
>  	/* This blocks until the Completion Queues are empty */
> -	if (rdma->sc_qp && !IS_ERR(rdma->sc_qp))
> +	if (!IS_ERR_OR_NULL(rdma->sc_qp))
>  		ib_drain_qp(rdma->sc_qp);
>  	flush_workqueue(svcrdma_wq);
> 
> @@ -619,16 +619,16 @@ static void svc_rdma_free(struct svc_xprt *xprt)
>  	svc_rdma_recv_ctxts_destroy(rdma);
> 
>  	/* Destroy the QP if present (not a listener) */
> -	if (rdma->sc_qp && !IS_ERR(rdma->sc_qp))
> +	if (!IS_ERR_OR_NULL(rdma->sc_qp))
>  		ib_destroy_qp(rdma->sc_qp);
> 
> -	if (rdma->sc_sq_cq && !IS_ERR(rdma->sc_sq_cq))
> +	if (!IS_ERR_OR_NULL(rdma->sc_sq_cq))
>  		ib_free_cq(rdma->sc_sq_cq);
> 
> -	if (rdma->sc_rq_cq && !IS_ERR(rdma->sc_rq_cq))
> +	if (!IS_ERR_OR_NULL(rdma->sc_rq_cq))
>  		ib_free_cq(rdma->sc_rq_cq);
> 
> -	if (rdma->sc_pd && !IS_ERR(rdma->sc_pd))
> +	if (!IS_ERR_OR_NULL(rdma->sc_pd))
>  		ib_dealloc_pd(rdma->sc_pd);
> 
>  	/* Destroy the CM ID */
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
