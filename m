Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278E4FD0653
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 08:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaHUALNY/Ki8NBsehsE31J7V0PmDAf4aswLdpymX4jk=; b=Q6qJlYKagszPUv
	SisvTMh657gI0svaIiwHmg1tFL0OgAFiExXnYFBX3FvOBVxhGdcwRNBbN48IP4D/rh3MISGrRs0c1
	XnUwJ7Ek4r2Hr46Fg8HYCtI6nlPXeeZx4iwEgoKFkJORYxI+P73msbL084QxdhDyxB5PlCkOD9nR/
	NAdlrnIzOqtMP+r/d/AeWD9oxjXXJLC2zieGFOzY/1PY5Ov2aWcaVazD28JImAO1hwfyz11kHUQCb
	JmSf3r4TAzagORBA43MUAqtfXwQ0qA2+B+0p5MsJf6INu+QaHXggwMYjOf0Xcx9V8PMpEDNwUFR6B
	pZ9UYolnFw/oz889HckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ele-0000000B9Aa-1QRR;
	Wed, 11 Mar 2026 08:18:10 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ela-0000000B98t-3PA2;
	Wed, 11 Mar 2026 08:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773217087; x=1804753087;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rHSTPR8Fc9A1kcEr9BNgQ3H6ENCSh2fOQze/dBJ1Cc0=;
  b=BDCmL9L2ayWiNdGY8whfHp85qh97G3BqG1GDr7VAUofTJ8MLVbT2pTlG
   pAtyACfrrnhQFW0UAWVhLWHJitPSUE7KMOZNwcbI6f+Iv+BKBRZFyWtEq
   zTNvKuomqUON9Jq8DydgD6WZPXC1jlnyIAkDDWJeQvhrnMsaJAIl+cS9Z
   Jd9MwWJ2YAgz0Pz5b1wkZkXou/cweWam69oKpXRgJMzkZMTLCXGtRuBrD
   iBh2UQlwNx5agvSqGvp4SWH+hQ6g7rpgjB+ZE4XtDQ5ShzKM9wEM2Ax1l
   R/opqAeWnLtuwvAwwruBn6lMlruGuDfE3qybm8DBbs2emrEGtVOUU0MLT
   g==;
X-CSE-ConnectionGUID: c+oqrVplSZGrUYURx5pDkA==
X-CSE-MsgGUID: Jjc/SuOgSVCeh0njn1vMyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74249430"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74249430"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 01:18:06 -0700
X-CSE-ConnectionGUID: Hhe6i8ySQPa1KWece/+b8g==
X-CSE-MsgGUID: muxfWZe6Tw6D9HQb+gLyPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224857183"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 01:18:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 01:18:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 01:18:04 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 01:18:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mL8svBQNKmw/8mtSvlf2JIW+8FxyS1RH8RujcMGnqIrU6PE0pSCQCGW6orrobOk3d+Qqs0MwBMYcTSiLso2GVCQLryZr7ve4sSek8OTw3pLhTOAIiS/mScFmL1V+tpL4QU8nXPg0QJWVtZ6jEIB4Sul9bZMhbvVMpIVLZCbzF0vaF60XAKR+lPFPorKThoxvgQiN2FVV0RPN0D+0QHlHgGo6q1NsTQCXPClrColCxjKjjhXk7ytVAU8IBR1WfwuA/NwZEeLG2x/R3vb82hlUqjIRqRCMSq6CoiGRufdpoSfsNMzS/QRJxw2P3cPd22/Oxaz1zavPeVKNFEaQ7K1r0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHSTPR8Fc9A1kcEr9BNgQ3H6ENCSh2fOQze/dBJ1Cc0=;
 b=ah5CXqMy7Do+WJ9plSBMqsIWm9msnWzxQG3DgJEjUJStONsj+1qroIhag9aNQQbJKA1lWCegeTAYlytc6Tkk2b0MFIhcXUW4lkJsVZWJStdiRvuz/Qsjy1zL9Hz+PRVKG4El9NlL/D/U1qtiw4G4bJssFK8HwGYtLpjcsTbx2rAjg811TeYUMAUmgWSbrd+lSp1VN5FucGBRTqUpZy0wZ/m0FVBDOKdtCtEy/loTCKYEJ6sFefpIUvKdm3MCZP+rVk+fINU7M3K7E5vUe0DfSLFkNFeu/+4m7Blh/ozrb6/zN3QzKIn9ftDPjB9v3rL349I7q6oGwhFvY2zcR+lzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by LV8PR11MB8510.namprd11.prod.outlook.com (2603:10b6:408:1e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 08:17:57 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:17:56 +0000
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
CC: Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov
	<lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, "Christian
 Schoenebeck" <linux_oss@crudebyte.com>
Subject: RE: [Intel-wired-lan] [PATCH 06/61] 9p: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 06/61] 9p: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Index: AQHcsKKDga63OVEHpEC6YaWFyczaH7Wo/acQ
Date: Wed, 11 Mar 2026 08:17:56 +0000
Message-ID: <IA3PR11MB8986DF184F43C9374B8A7735E547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-6-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-6-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|LV8PR11MB8510:EE_
x-ms-office365-filtering-correlation-id: 5b5ab855-410b-404c-df48-08de7f46b385
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021|921020|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 6rDIySybMEnrEtdINr8k5jYWFGk8tGETDyo7F47FsEs2kMQfOvBZpAEQatb2K5j5ba0H/ZnUKTlyVgDIHPUOdISEsD2JcGuzuWM2tLNvSgKyu/uxYe4lZDdxnx7k1ojHaZvToL0delNFlXnFDB0nAktpwIhjqHaLXFsoc+4GByTOnjlSMMZ7KUrq+6++Bgiq+O1Mj4ufCZKHxXpa+EPJszUnKaVoXkSiFZ3b74gfVTUCiHtDu2LwF1QCypkl6/4mAAmVDJDA/Uaf9FT5wkDwAq66pvnDzWJhMYqEXXRN8MY5mvX2Kffk9N97BX7tbUFGFCzylPMu/MH5y+0yxkqIJ7xzwUMFySm687PBUj52++g9lJ+EMuEAWFI6BT00dRSx2msRhrWj71pprY+783ksMzmFkfKy6Dhp0F73qeovM8SQ7joY4qouGvbRtfI8YQqbBo/lvKGaY1cdbCKq8zbwRtwppkrur1my3rSAazmyCL2PTyC83GwC3IcNkGtmQU46210aqn2QbjHOMfHARazZrxZB+5HVJG5B4kaJvamypCshm8Jg1SsCQlyHlpyqb4pVW+9NPWBkKnUbinEBZSTcidL0qQK7JymFLTd4ODfQLuB9vPlLk5eKDoWnL7lhMpa1nNXgek1mf7neEuZJGCWczr1ll6M9dbhjjsNvfICX/ZgRVdae4zAotC2Ig9WGoYH7U2gJ4uHvDf97GnMxb7GZyrtkzchjEdX+P/iBelbNbkQPtoo4FD7hGj8jJIYM1EKPcAtnOnwLOIzmNTT/xEivtELHoERlnQ7QssO1MG7syDWPzlp7MUyim+knN/0Yvwc3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEZHWVdxTkNyZlZDTUljRWpJNCs1OS8vOU9vUWRiSWxDVEgxWmZiSlRmbnU3?=
 =?utf-8?B?MTdPMXBBdkFLYlVpcnMyS3F1dllxTzZXNWFTR3czSk9jUVd4NjE5ZlpCbVNS?=
 =?utf-8?B?UlQ3eDFoQkUvbTJqMTRMNkEwenh3Ui9CaG5od3pORkpWT1dxbXR3bUVtRWU1?=
 =?utf-8?B?RnViNXpDckF6bUxkdnlSdDZ0MG84bzU1OG9OS1lSR1p1MUhTL1ZVUlZ1UzMz?=
 =?utf-8?B?ZEF3WWpyNFNrWUp5c0ZaSFBzVVJzTk1EOE9lZ1hyWFQvaEh6djJ3Uzh0VlFT?=
 =?utf-8?B?aTNKQmFKVE1qYXozUTMvS3Q4UUlNMUVkV1Y2TWVGd0JLSWc3aUdjK2ZlSWJQ?=
 =?utf-8?B?aXI0SHJEOUJvQ3NVUVRPRzVSUTJJT2Q0bHNxd21ZdldFeDRsaXZzZ3JNd0NL?=
 =?utf-8?B?U1ZhM3ppUTJtbHViTU95WnNCeURSdVQ0QjVERWVrQSsvTU1OUUtLaWlvcUFS?=
 =?utf-8?B?ZjZidWk1anM4aUJ6WmlGdzMybTgyNDBlSVFqUFFIWmUwT2c1NWhxN0MrcW5P?=
 =?utf-8?B?SE9HNXBKeHpWZ0JYZW5UaDVwaERycUFzY0doRVFrREg3bjhIdHJQenRMbmwz?=
 =?utf-8?B?STJ6Nmd4RXRydmw3RDB0SEJ0MHI5TDEvT0FnSndoVUFzUExXQUJmQlRNSjU3?=
 =?utf-8?B?UzB0ODVzNW5pQ2VGQ2lsTXJXN2JvY0F0dnUvMmJNelFEcjU2STRPOU9yNGh5?=
 =?utf-8?B?QWFLTDNwTDRRdTdXcFQ5NFVybEpnamN4aURmNFlneVVQcmdRTSs0NEl4Vktt?=
 =?utf-8?B?bW9VazFvVi9zallyNWIxNkRvTHpKazVPZ0NObEVUK3hrUjRRdTVwNytnMHl4?=
 =?utf-8?B?MWVrMmZybnZiNlpvL3d2YWJQcEdWWjlJTElaNFQzb1FFb0g3cmJVcitCOVRM?=
 =?utf-8?B?TmhjYks3QU9yOEc2bHBNVm9XMFM0T0loNEcrdi9DNDA5M0dhUFZFMVNzMHZM?=
 =?utf-8?B?QUNRa1dya2F4UWZaZGRMVUpRdHpnUXk1Nldxclp3ODhFWW9MUTZnRFJma2ts?=
 =?utf-8?B?c3Y1WCt1OWEySlJLWExLVlp3ZkN4eVZab1Q3bVdwTW5QSzZ4TUhlMzBlbjhU?=
 =?utf-8?B?UTVKakhIcUM3c2ozQThUN01heDFFNVUxV0VUQ2FlTFM5MW9JcGs1d3daNEJv?=
 =?utf-8?B?bXZacmdQYW1CTDFEbjV5QklXQmZTVmpyOTJ2MTFVQjdiRy9lQTFpNTZzMklE?=
 =?utf-8?B?cU9xQUNqU1RWWm16UEk1VE5PSnlxK0dReHhBU0VmM0JiSEN3cGVSTTR3SnZZ?=
 =?utf-8?B?ekpoNEtxT0REREQrUkhQOTFCdHVQdmViSXlDaTN4N2NnbkpHZ2ZpUTY4dG9Z?=
 =?utf-8?B?dkVOc2VXNStTcFdUaHovRDNDRUY1UUZuSSsxTFo1OTRwVmNta0xKdmdKTGxZ?=
 =?utf-8?B?a0FmVzNXa2Zab0grbk9jTktyZlFLYXZna05XQ29tOFhCZUVvaEhMeVVsSU5M?=
 =?utf-8?B?MWJ5b1VhaXlsbkhlSERHZm5ZODBjaVAwdU15NWtJNlJyVElxTWwyUDRxZmlz?=
 =?utf-8?B?c09RVmRIdWdpNG15eFBhZ2pYR1MyU2oreURsWnZnOEd0YjAxa3RyOFdrSndk?=
 =?utf-8?B?enlnMjlrSnBkbTQ1ckdJSFZwWWZZb0NSWTY2S1o4amkyVDIxUWo3VDB2dHdT?=
 =?utf-8?B?WERRTC9pVWVxSE1mdjkydDBjTWh6R215UDFQcWZxclA1ZUIrN1NyYXN0cFlE?=
 =?utf-8?B?M0E3ZlZQTHRUZm9hZEdyVndNdHRLLy9LQkdsbjBaQkNLODF3UXpydkI1d2Zj?=
 =?utf-8?B?S21iNGRleVA1bFdpZVBPRFgzV1lnRGZna080N3h2RDhuR2ZMRTZqN3d1U3VV?=
 =?utf-8?B?d3FNRHRaQWpFNDZ4ODhKWDgwRDhkcndlZmRNQytIVllVcVlvYWZHVWx4K205?=
 =?utf-8?B?cTA4TmdSV0JJejluMXRvMXpBMmFadi91WEJUTmtYM2xnYllORG54N284ZVVj?=
 =?utf-8?B?NTlMWitpNFBmcXFRREphKy9NSFdzU3p2TE52ZERTU1piN0haK2duR1FtK3pN?=
 =?utf-8?B?Y3Q2SWE2aFZYaTc3OFhOYzduZWtBVFZNTlU0U2thQTdMTjRXWEhyMVdJWkFU?=
 =?utf-8?B?VmRDNFBaRDYxOVJMdnM3TTl4MHlzbnRJM1RPckRwbTE1WkFteHBBM2wwRFl5?=
 =?utf-8?B?bjhvMDdlSDBLVE5XbGYzdHJTc3lCcU9sNE1LMHZHRkpQcHhXT1RlRUErY0Jt?=
 =?utf-8?B?VXRTamNyWXZRMGYzM2pKWGZ5bjk2Z3NPa25ncWkxeExhRXhZUlZvVjVVMzUv?=
 =?utf-8?B?cyszUU1nMFdrUzI5MC9QcjR2c3dHL2pqdFV1QjhDekRSMGhjMzU5WlhobDlL?=
 =?utf-8?B?dmUxZlh4aGdxUktZNy9iM0J4Y0w1eEhGSkFtbVRXeG5OZ0Y3TlF0emNDbWpN?=
 =?utf-8?Q?IDe+ZmwHwp+2VO6o=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: USw/wKHP68g1t56EH6siG7zPpyocD42Cu4vWflTDaMTguNZOaT9sPsucGnvHksNlMqdOMvn8ggcqsA4MnMXXmV+qcROA1KdgumK09PT3bgSG/u48PbpHQQZdmSXbyfrSG4REn5n7D7KP0Qb5vJGBbzWdWTnxklwqPRPFzXxy1QKl2feOGmPS0TAs/niD5OjhYle2zcTqs3i51pW+GT3Uiz5eFpOWjJIT7/s5caAqF6/mnU73L2AMjxG+X5g9wDIP7KoRZzACzaQdF2xQTiZjwH50DgfiomRjcdqzwC7f88mNqbXtZQ9Gm8Dn40liAQLZfSYiRZV4a92/S7OTf084yg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5ab855-410b-404c-df48-08de7f46b385
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 08:17:56.9092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W68ONACbRXrFUYzV7oSeFHRa5YZyG3+ltabAb3fDtAr9g1RN1zo3PBObktdebn+J5Cyze5fLQUBtTpvdulDRemsIZPtbnN+HE6XWLYpSSTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8510
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_011806_920570_B7FE6B23 
X-CRM114-Status: UNSURE (   6.77  )
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
> Cc: Eric Van Hensbergen <ericvh@kernel.org>; Latchesar Ionkov
> <lucho@ionkov.net>; Dominique Martinet <asmadeus@codewreck.org>;
> Christian Schoenebeck <linux_oss@crudebyte.com>
> Subject: [Intel-wired-lan] [PATCH 06/61] 9p: Prefer IS_ERR_OR_NULL
> over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Eric Van Hensbergen <ericvh@kernel.org>
> To: Latchesar Ionkov <lucho@ionkov.net>
> To: Dominique Martinet <asmadeus@codewreck.org>
> To: Christian Schoenebeck <linux_oss@crudebyte.com>
> Cc: v9fs@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  fs/9p/fid.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/9p/fid.h b/fs/9p/fid.h
> index
> 0d6138bee2a3d1ab565ab2d210c0a3f3bf97e4e3..3bb7ef4380e972a2d9ab67eb4aab
> 6cc5bfe2eea7 100644
> --- a/fs/9p/fid.h
> +++ b/fs/9p/fid.h
> @@ -27,7 +27,7 @@ static inline struct p9_fid *v9fs_fid_clone(struct
> dentry *dentry)
>  	struct p9_fid *fid, *nfid;
> 
>  	fid = v9fs_fid_lookup(dentry);
> -	if (!fid || IS_ERR(fid))
> +	if (IS_ERR_OR_NULL(fid))
>  		return fid;
> 
>  	nfid = clone_fid(fid);
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
