Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7424FD0654
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 08:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IWnQmt7ighAzTt9NhCAboMSA6a5pPhaJR4Z5Dep+UQ=; b=2wnKpgYjTuYdy+
	JOvGxVbtCPxghLJ8zIdl5x7n1axD1wDomKTy+gn9QJwdUdOsnzR8ouY8JePnFyObiH31t7lYXRwnG
	vC6xzX+epm367bcclI6DMq0N4YNlZwt7lDDHZY8nZMFDfMnHm45g021paFgw29B74/u8kY0xi/5tI
	47oUUebSiq7hXDEhbkSOB/DSMnzREvaJUXz4LhguOVxJl/VrqXuSaYkmsdcBLTFgMwZer/vuV0n+i
	b4fS3+JoV9HjNLSE12BxxnxSdGZmgZMPX8Q98iDWuimQXypS6WDt9Ei/umrUO6f04pS6ZCvr9LkBP
	9ar6E8kaQNJ3caglED1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EkY-0000000B8pQ-0mhr;
	Wed, 11 Mar 2026 08:17:02 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EkV-0000000B8oh-2rq5;
	Wed, 11 Mar 2026 08:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773217020; x=1804753020;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Mh00NQrg2lIKNWkDXvNhPe2GMjEhYIMI8kQ4tCuMao4=;
  b=UEB82GXTGE8LKaxZjLrQR2qxrgdNhb0VzNFo9CW4oGeF43w8+fuQYCDl
   ZzED9JF2W0mmeoW4/Q3MRielKvaPseGOrASxIeNMwcgd/u5AgUbvlvvlk
   eyUN70JFO4nkkS6qXjXH9KbcW36YAHW0HoiXB9CmECb7Y2HCIe8MzTbOM
   aaHaN4sCsb8r2FGzMlaxQ7eKlCATNxzqKAZsY0KQEegwC45xRuHCJ+uEz
   YEy0YwIWKmpzQ6ckS2iGgnubTAfM1Le/9q2f9AXg/QQCpbpPoqu2av6Gi
   SMQQn3Lnqpdf8I4FTpzYkGOaxoHqLMvOV0ib/6/eTnN40RwvFw7DRNdhg
   Q==;
X-CSE-ConnectionGUID: d/eU0xgrQtyBRM3XxTDFcA==
X-CSE-MsgGUID: ND18VKOfTeqoMew6GqjiUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74467609"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74467609"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 01:16:55 -0700
X-CSE-ConnectionGUID: BMGoJHUZRWmghWNXe/Zk3Q==
X-CSE-MsgGUID: g5YTB1s2Sqi+a6FaJQciMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217077384"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 01:16:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 01:16:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 01:16:51 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.26)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 01:16:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Opo9MpRJtwx0zLgDgZOZFJvPXyHqHHtJzkUiUwVJCsz4tKEKo07LreqxtnrsCjwVojH4U+UwLGvLUj6tWPkc6m4pF4S6tJD49D6pQ27s7xGcfs0lsvws5Mc4Crewz36bF2iEdApjb3wgDXOINHplZ8RrYmMyGB9KiYtvU5ZM7+8PPHQ4D+mLJZuIVu46F87G8kMLHuO5LzweNhPlt1T0hwPb8bjCxWtbmFufuecYQPnZ5Losrc+UeFJp5bjwsqeLk92kr09MQxsBmElWGC1C55jrobnIuiBTr7MkzzIlRr7ETHdfc04dd2ppiR3SK20FP0U+KXkotq1HmCcVeC5k6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh00NQrg2lIKNWkDXvNhPe2GMjEhYIMI8kQ4tCuMao4=;
 b=PvZIA67maJcJZMl8ktUdh9e+oCmpUPO8uwMtDhImWg/7I0jtaQ97c2U03ZqEoY5MA8kxm/yaPjMOIZv/MRKJR5724vKgt3Zy0JtPGquxl+oby5wgXKR+gL5+Or5WdIAw4vi7PIP0s32fyfKM3StEJoqnrE68jqMTix3K03Ob2M8ClebhUzWxUWTTpgzEU+9ptB0YRzkwnLjf3Gbc5uI4fJXkLyhlVjPmb83qjchjgoQt/KAwPjnhtyjdlxnRgmuNmCsuQLP2UvSKZFbsiecOE8S+TAZM+vodeF7mGh4J2QrbQPRzL3dwaH393UaCBjVAY6A3gLotIzLPB/B5adEJOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 08:16:43 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:16:43 +0000
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
CC: Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: RE: [Intel-wired-lan] [PATCH 03/61] ceph: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 03/61] ceph: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Index: AQHcsKJtosLQvJfHUESbmHNNZ0gghLWo/XCg
Date: Wed, 11 Mar 2026 08:16:43 +0000
Message-ID: <IA3PR11MB89868EDCF9D093C501E01FA3E547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-3-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-3-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|IA0PR11MB8379:EE_
x-ms-office365-filtering-correlation-id: e34e8a58-dab4-497e-6b65-08de7f4687c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: jQMLhYHNcc8rWLFFel/x2sMvHTNauRhuYBG4bf+v7DsJZFhupIQte49LtN3UoUBak4B1IEWtI5P1CmysS1a+awGpSJz1r40isgFFN6L4/mibvFUKClT/MHdIMjSE4HQukbYf0M2IxFRTmvLUaDZO/+OqT2RCKgtSBSNwPfxfWkRyzOeF2hz7VqpT/bP5wowbzNc66q4wL8xr7nzirI6YWKRsmxf1DWqNzDJq0ZDssnFrN3NJVD+DmQgHzvk6oU6znVEUc7rJrNuDvx5SfI22I0vk5YAHgZS3r3GWilsK/mH0/G6jWruqtyFazGqdS4YPo4VggHYRFgUF4hMOlNHdsU7DcnNMARrbZ0SGm+HoHpUKEXC4slgRMBk4pTRlS1bNRHmu7dctE53a4eld7MfvX4/VCisN7uIrH3H7wkgEnlsZFrITVWlYj6tCEICkv95CBNqOFL+vcNYaZDnlXRN4h4ieBBAs4bkxgJo51IR6odZkbLzjMXpzGcqsI/mt6RfxXqC8AL1RcxFJ07fcXv73zoGCVGHcwPZIItHDvtrPE46pL/lO0UByfnfuhJKRNACe4ge0dP0jWubYBPg4uKPCBIlEiu1E9lLwYWDODI+MxWMdCnw7Hi6ZWZe7Crnx98PGgc8WM8q+qFjTlWci6orACn3nPHmShktAHNmKZLfzUy4xRYweFBtNzgWrA73evyHgmwW3MabvCgHgm+V/f7BaRNGziMylCelvMtY5LRr3SVkxqtpuIWlU2tl6maVXxD/6Zma/pAGcxVD3vEAJpHEREdZUf+Id82qWyMcEFNe8aBamRKZIZReDd6IYnkL9aw8J
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0JnUUFIYlQxQkxQM3YrYlVCSThmZkoyOGZMejBVUmpSTW1IdDhLdTdBRVBI?=
 =?utf-8?B?MjRuT09YQWdUSjNsclQ2Yi8wSDZBQjdiVzhCZmxXZkhQSTkxNjhXWExvNkZB?=
 =?utf-8?B?dGNLYlNJbi9SNlMwSG1HNTd0RmVRT2NJRmVYMklXdjdDNFI0Rnd4dWtKUFZk?=
 =?utf-8?B?YnZQVDBHelJaTmluU1FFQXZTelZZUlRNblJGMjVPT3Q5VkFpQXFLeW9UNmNJ?=
 =?utf-8?B?Vmc0bEkwVVBOSk5xcVJJMzh3b3NNWlI0MnVPVmE4SGxuUVJiaXF1NkNkUXBK?=
 =?utf-8?B?NmFLa2tEeWU4UEVPWERuTzVsVFZzREQyYnArUWdRVWRTRW5OK3FQcXZWRHpZ?=
 =?utf-8?B?MXdxUmtzUC9uS011RnlNZmYydWZHSVMrcDl6b3JnWEl1MnpIZk13eFZpVHda?=
 =?utf-8?B?UXJpT3RRRmtyOFdkUHVyKzZUN2s3NVMzNkZIU0ozUUgxNzRES3pjOHZaRTlw?=
 =?utf-8?B?YXBqeUMwaUg4WmNTWkdUWlpaV29vWVVVSWk4Rzhnb0dDeGlZWVVPbVZHN2lm?=
 =?utf-8?B?VUFobVB5cDM5K1ptdG5kcFFJUXd0aEJhNVFYanZKUkRIOFJKZUlweGZvWGxW?=
 =?utf-8?B?SVRwaEpvQk5nQmJTVCtPQ2RGZ0NnNWNiYWRaQzkyWmlpMzVzbThGZ3B6RFVX?=
 =?utf-8?B?UGxTOHJUSWFyeWZDSlZWSmtSM2Uwc3BEQ0dsM3hJS3J1S3FObTVvOW5sVzQz?=
 =?utf-8?B?YWRoekI0Wk40R1Z0Smh6VHpwZlRCRlBXc3BqQzgzZmZVYVd1ZXRtL3NHc0Jk?=
 =?utf-8?B?YWtqTEFtSHh2ODd6a29LYkpwSS9nUlQxU0xjdVA0c2JqUG9pT2VxMHloakNK?=
 =?utf-8?B?NnZmMTZXOGczQzBZLzhyWDNna1dmdWtXVUFaTlZnTHM5c3kvektGNEg5TG51?=
 =?utf-8?B?M2tieDF4dTBhUUJaRUJvQkNqcGkyMTJSYVl6eUpDNEZsbG42SCs0YWRNT3hp?=
 =?utf-8?B?UFQvVzJTTis5RnFEWE1WWjlSZVdFSFAwb0dLQkIvNlpUODdtdHFlT3JKeXhJ?=
 =?utf-8?B?cUN6em01SW5RQ0p2djM2NDR6UUxiQis2OGJGSHBzY3VURTZ2enhCT3Y0aDlC?=
 =?utf-8?B?aEZNeWdVTmlBK3hBUHBuWjRVSmRFZmJNWE40NVJ0RE9mc1IydUJmYlU5WitW?=
 =?utf-8?B?WVZKUXk4dUJGaE9tNUd1WmJ2ckN1V0VveVpqOGhXekxZeUxTcVRENWVFeVhr?=
 =?utf-8?B?V3dpSWZYajNPZWdZTkdpTWlta3RtK25uTTBpZENMUTU2NE9YeS80bE1uQi9D?=
 =?utf-8?B?SmFQdDQ3bUpRWmJwT3lKcVRFdEpHd1VwSHU3cXlBbnAraVBaR1NVQ2lSblVo?=
 =?utf-8?B?aVN4eXBTcmRHSHJNaFhITWpCeG81dFl0dE1VTUwraTc5SVBmTEFBMzR4eFJ1?=
 =?utf-8?B?bHZFYk1EZEYyaEVDTjlPUlBxN0ZhQmRRRms3YUdlZGpwTmVNMGp2UlJLS3h3?=
 =?utf-8?B?UVBhZzZJLy9XQ1FVVElVeHBVTzRBTHRPNXQwam92ZGFJaXlLQXp4TWxaMkxY?=
 =?utf-8?B?d1hGU1M1ck0yZkF4WVQxaXJaTlhjTGxXSTE1dUVwMVhzMmhmbC9JRk1yV0Yy?=
 =?utf-8?B?RDhWQThtL2xpT1E4aEt3OFBVcnU4bHJrVDBvVXpMM0RhSXNqSDdpcjVSVzFh?=
 =?utf-8?B?SWYyZDVLWUtBMExrcmQzdmJZYkhaN2c1VVR6SXUyWWVKNFE1Vit1dHdLcWF5?=
 =?utf-8?B?RTRaWUF2YkdtVGxHSVFTakRabXU4Y0lYOVMyMURmb3FrK1lPRVQvQ1NQZFpC?=
 =?utf-8?B?YWgzeEhPTjB0TjRNZ1NkVTZBeE1IMG9FelU3Qk8yYkRML3dwQ2RuTXJWdU43?=
 =?utf-8?B?ZFZPUS85bmw0dnc5cmFGWDlxbm5PbGlOdzJKTWhTSUk3clNXNTc4NW9NQWIy?=
 =?utf-8?B?MlJTR2JkQ0xiYkYrdE5LbXF2RkVERllYMzFZWCt2RFB3SlV3K0ZSeFJ1VTMz?=
 =?utf-8?B?ODA1bk45VERFZ2hiRXlWeFNJOUJLZ1AzTk9DSDJVMEZSYXNxWnlqalU4b0tP?=
 =?utf-8?B?K3RtZTFCb1VRK2l2K29abWdZZFpRWFl5d25GYmRURUlPbGxtTUJWWWpVem1a?=
 =?utf-8?B?bXcvR054UUd5WUVTNnlKUFAxdzdaa1NtN1BJSjJXWFFjY3h6eWp0TmdDS1A3?=
 =?utf-8?B?MWlybnExWTFMRytzeTVXNytOcFRNME42eU9wNk9xc3pQd05tNk42V0hhQm1L?=
 =?utf-8?B?dTl3YTBjbGxkYjUvMDdmV2NTNnlPdjl4Y09Ec2VrNXZZYW01amJOM3pZdWp6?=
 =?utf-8?B?YVAwSjFoV0FydDhMS0J0VWNWUmFDNVBtTXRnUEVKNnJ3R0N3RnJHNk42SEN0?=
 =?utf-8?B?eDA3ajdsQ0EzTkVhcXhBV0lsOU9vdk0rU0gwWmpnYzNnMHdBcjM0TXViZ2Yv?=
 =?utf-8?Q?pmu1iw0JdmpqlrD8=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lS2x9ZIERkqgSn6Qc2Rfme6olSfFFxn2kmThqyIUm9Tyig3CNDNpPt1RwVWn7smwbBGJOzGfzCUuSOp27IHdik5xKs6rWV3ymJopLnDQSlVKAM6dlmNiDO3CJSy8X/IwO/YZdVRbsCsLTnoDX/jQ7pe8NGHKIbWh/d/7lgxquo77YLgktOmX9UtHTSiUFZKVZNxDUkmF1ReoboNIUri7zvoUg3oS177Awk4d+KM4Mj0dBehbim9Vu9HmZcBLy7DO0/CV06JdE98SmKBKqBbfyaW51ogywi/q2lMNh4w0K3qwNL6po5vnFnNYH1EUfdnz2mU2G/+qIrH7ce+ltJ6kWg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34e8a58-dab4-497e-6b65-08de7f4687c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 08:16:43.5293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ICks5v4abd3Mi47kJZ/Surb/+jNIrlILUiXV7SvcOuIRk0/oIphN5Js5Fof8QKa29fKfn+Kf31+5teG4Pxt9Lzf6o71UCRgFr4PD3RuzL9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_011659_796003_77D23DDD 
X-CRM114-Status: UNSURE (   7.05  )
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
> Sent: Tuesday, March 10, 2026 12:48 PM
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
> Cc: Ilya Dryomov <idryomov@gmail.com>; Alex Markuze
> <amarkuze@redhat.com>; Viacheslav Dubeyko <slava@dubeyko.com>
> Subject: [Intel-wired-lan] [PATCH 03/61] ceph: Prefer IS_ERR_OR_NULL
> over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Ilya Dryomov <idryomov@gmail.com>
> To: Alex Markuze <amarkuze@redhat.com>
> To: Viacheslav Dubeyko <slava@dubeyko.com>
> Cc: ceph-devel@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  fs/ceph/dir.c  | 2 +-
>  fs/ceph/snap.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ceph/dir.c b/fs/ceph/dir.c index
> 86d7aa594ea99335af3e91a95c0a418fdc1b8a8a..934250748ae4fd4c148fd27bdf91
> 175047c2877d 100644
> --- a/fs/ceph/dir.c
> +++ b/fs/ceph/dir.c
> @@ -889,7 +889,7 @@ int ceph_handle_notrace_create(struct inode *dir,
> struct dentry *dentry)  {
>  	struct dentry *result = ceph_lookup(dir, dentry, 0);
> 
> -	if (result && !IS_ERR(result)) {
> +	if (!IS_ERR_OR_NULL(result)) {
>  		/*
>  		 * We created the item, then did a lookup, and found
>  		 * it was already linked to another inode we already
> diff --git a/fs/ceph/snap.c b/fs/ceph/snap.c index
> 52b4c2684f922bfed39550311e793bfe3622cd26..528ad581be160713f91416115659
> e2dc6f259576 100644
> --- a/fs/ceph/snap.c
> +++ b/fs/ceph/snap.c
> @@ -902,7 +902,7 @@ int ceph_update_snap_trace(struct ceph_mds_client
> *mdsc,
>  bad:
>  	err = -EIO;
>  fail:
> -	if (realm && !IS_ERR(realm))
> +	if (!IS_ERR_OR_NULL(realm))
>  		ceph_put_snap_realm(mdsc, realm);
>  	if (first_realm)
>  		ceph_put_snap_realm(mdsc, first_realm);
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
