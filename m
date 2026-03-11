Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29931049516
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 09:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oVvqzq6/0l/Fb3WMWUb3pN3CSL6ulXj3zbo9Jnbyhjg=; b=ADe3vtfgpoc2eW
	99iuDW9sWefeX9sz8bKLLLl0thTdH1a4iCBycBw4fMLl2gz3aOaf4gwGHZG5a328ZCASFS7WPkkrH
	nFmcSiWs2cV+g2sA2uPpyJMiELwcafVbVfdy2GRXxCoJbyBr+9v3xz7V80QdcdjoEP/szEiKkpxAZ
	eB6y8SUkMIPBoY4T3liHkKT8jGrBu647oQ36HhagQz1iD+oybN/eaedPOS1h07cnYI5uUhZWQoiGH
	IbvC0raE5U/BV9f/RDOoGyO/48dqvj6G39z5xOVY1Q5Vpax+GtT5LDcgWjRFXE27lQXC3LX05IrWy
	lIHMlgyOL7S8V22I+A5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Fq1-0000000BHfK-1sEq;
	Wed, 11 Mar 2026 09:26:45 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Fpy-0000000BHdw-3sDl;
	Wed, 11 Mar 2026 09:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773221203; x=1804757203;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=m4nrxJrptq9qjGF+s6HBpmfa9vqvfEDymQUIf7o+O44=;
  b=npCvd1i7q29PHshir9zCWmyCRshIh6sPqHKVMs//8OZ4xrqXtRoTnbRW
   XruavaLEwh5YssFelAcAeCuy3yevtL0PfZHEd4EJtAaku964L8QB4PXAU
   +nOfgSiRxATR8EPH2xHacfio4LC0Ynhz34FI/FITM5GwqX1VTd6CUd9zK
   pFdYWNcgrkBle8kxjgAcwCd+5jtaMejdcI4/up3AlhpKAY87Eet/7PBeI
   MItfzROWYLw0NHn7G6c7cPQC8HtwDKjZ/5sD3lqp5bI6BZxk9TE/y8hVf
   9dUivRlYVSAkZWH24tjS1DG1JCKdbHO/EnJGnzeyp3etDdC3OmzVENogC
   A==;
X-CSE-ConnectionGUID: JP2G3a43Rgm0W+GsDp9V1A==
X-CSE-MsgGUID: lMuzKpKUTTSl/BrJfdXKyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85760886"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85760886"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:26:42 -0700
X-CSE-ConnectionGUID: 0Mvc00UjTyaR49tMurlA5w==
X-CSE-MsgGUID: 6g3dkHLDRdOJkiETBGMAMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="225103701"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:26:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:26:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 02:26:40 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:26:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIUmwbqBuCkYAHr/gwuMT/vbVyoJqHWc0S7qGkZSE95vriQ1cF1TkGN+a1PULfHbuDyi5DzAqAQ/PNHLIftR7JWBOHqHHT+jY93nxY5ZTaryKln3OoABQnwzl4ngeCG392k2OZCcRE+72NiuMFZgNGV9NuZjzzgtAKJSUl8jY6DJFEy1qNBSO6tQzZgbmelQ97j6UITzZy/WF4mr3LqAeRRhIoK91Gf/AWW++ljiOXiNYHRS0xvC/qW3hLE7seWkIxqqC0ez1Gs6saFyjGmdUV0qDNucOah0DJC0PY+O1yBivIsQu9Rd0Je4acivVundufd1+gxOD6g6HHhdSMq7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4nrxJrptq9qjGF+s6HBpmfa9vqvfEDymQUIf7o+O44=;
 b=aBxZmB6sbegqcdGoKmtlZAOcsGRPJoNprfagE+h604gJAqAH4K6+KucWi6/tq0TarS5X5ug6WwI+Si+VnXJZGApS0Hp/He0BJm3O4i23WnRjIVWfT9fxBljBNaC9feFMVULojEpaixsil7zHJjzk/0Ei5rAY1WtxxlD9gS77inUNlktnOneLWplQNQV5pzR1G/7mz7TJdxJYLzt+Mj/x0RU8p5JaYh9hVbgYF9ieJV6cDINYiTVfqLAr/y19QYfhTWGVROS2hV99XVvqL7Clf7EilkoyJs2OW80ipPvFVFHkn71YZyTAVFDtCuAtCu+i3Ictw5nF52YGMajqU7oSAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Wed, 11 Mar
 2026 09:26:37 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:26:37 +0000
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
CC: Justin Sanders <justin@coraid.com>, Jens Axboe <axboe@kernel.dk>
Subject: RE: [Intel-wired-lan] [PATCH 54/61] aoe: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 54/61] aoe: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Index: AQHcsKKXHKPQgNOZaE+8HrFfa/02l7WpEP8g
Date: Wed, 11 Mar 2026 09:26:37 +0000
Message-ID: <IA3PR11MB898643D5101D44C2BF0A8D7AE547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-54-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-54-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|PH7PR11MB6836:EE_
x-ms-office365-filtering-correlation-id: 3b137b1f-021b-47d3-320e-08de7f504b55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: o9Bm9SPj2ErETACCCJiV1KvRnwRIZWxKp+r2VpCYTLVSrVoOXKHBBMTgWhVUDs2sANIccdbYTu+T62K218GKzN/aip0x72lnux++4JYJqlvh/+DLcxp1aRL+nnl8drAmndk+uoEKXHbjsrmbxKSpxxtM0yAgWpm+ZH5fdEYrQDmjD+U4clF8ZOIY5tdrP8KIkZKPgKHDF2WIQQw3kM6Neq/s19XJeWxmLprxLY7WEQtHIOBisCCjbPmMtmC0XeWKtE2QvujQvu1eudnbidCG6Owrkwkt7IMubEScD7/tiO4a6J8CaXb0tAJspoNXvqrDgBUuAlK6Zij7190dQ21EDY6HvvYrMZdBFum7HkCJ9c9euTvZsC4ESkWBnQwF4/dMWbNVJfHpB8DflELVEpkeDQ3x8Owrq/PTdR3oVwE/JTiZsKFpMvcfjloKUoUgBGjl7cK2eIKjQt6wm7RK6bMDB/1ajwKu+THF+Tg7TIUaB4p7dgM/iryDIosZN5plS1kAqVRyOkEiLAsO6f8ZbiVin+ueU3v211dxC7q+ylCyK3oioWwnNTn0243NE68MUoYZWMHZ5epFt6wq4t7JkSduO6Do/5LSsY9ynWsZnf5QwMmxXVPHYAa35TzmlVv/VQNApQGohJL/bIxrZD1Yl5/NbczocEPnIKZvTZsiZ0x0q0VZUEhP0bHuYPfQD0hUytJsjfviNaEYaOdc2HXjOuGQN4ezE9KU9/LVQB7y+Fu6Rvw+ygYyNvS5uRaazOasfnSyLhp3xd9l9KeyWCukEDFSJ5ns4y3fpZSU1j74TOlT+U4sj+sWuJNFh3Tl8Qe+8c16
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmFhZFRwZVJNNEZKWmhMbFo0K2FpUGZKZjZBa0M1RUJDemJkaitZUUlsWVNG?=
 =?utf-8?B?S2Z2VC9yVHNXcHkxeTdpMGk5OHZLbU1FQys1M0FUOXhkaFVVbWFXZ1doMHlI?=
 =?utf-8?B?SHlqWktRTnBBdzJkZVQ2R21OZ29iNk9mN3pMVjRaZStuZWY0TE53VmZ4Y3A4?=
 =?utf-8?B?TEJ1N09FbFp2WllBZUcrOEVSSHdVN1FQZHQxVkREdnpxVEFMTTVMWmx6c2RC?=
 =?utf-8?B?dWlpNlZwRVRORlh6aGpUSUlnNGsvWGhmWGJDUzZLbUM4ZXpjQ2R4b1NTTlJj?=
 =?utf-8?B?VDNQdWt3THNiZFlYN1AwYS82S2dtRWFhb1BpZUZqZlhydDFab2VINm8rSTM2?=
 =?utf-8?B?djF0MlBqL0x6R0xJbEFoeWlIVG90WjV5VVBtU21oSnE5WjROQ2dyVlFvallu?=
 =?utf-8?B?YngxK09vMFdibjA3T00yaXJuOW5qMTBrRElDQmRJVWdWVytQOEh4a2dLVXZT?=
 =?utf-8?B?NzRISHd2bkZiQnp4N2pUVjRKS0tVSThxeEhPWU1keE5GQTJRZmlLcVl3Vm1x?=
 =?utf-8?B?aGo0R3dpeGo5Z29rNFhsZ1Y2OVdqWTNBYXFpcTh5K2lGZGtqM2pWclViUmEy?=
 =?utf-8?B?RlRZcXI1aFhlY2FIWCt5aFFGU0VQbXM4RmVvYkw5amp3VFlEdlI4WWRRTXdy?=
 =?utf-8?B?VlRrQ2ptWU9Ka2Nrd0xpUHlnR01VQ3cvQ2Q1ZjBhOS8xeENJaUw2R2ZTUzlu?=
 =?utf-8?B?cXlsRDVDL0tUZURUbDA1MnJsT0NYUUc0UUVpTTVSem9QSUpWeXJveHZNUG90?=
 =?utf-8?B?OWsxbEw3ZGJVbFYydUtDUGt4ZE5NZWpBbHFQNnF0RzNLSTdHYmNMQm1UUjJE?=
 =?utf-8?B?Zm14WFRlOVI2V0UyT2NLdnJURmdsNzJtTGt0T3pYOHdCVXo3VjRuTVJEOGpl?=
 =?utf-8?B?a3IwU1U2RXE0SG4vWG1RdmRwZnhFbzZUV0dLRXloQjUwSVJsZzNVam92T05L?=
 =?utf-8?B?ajE0amhwN2hnTzQ4MGRmVWxPcnN4b2ZKUjlTZSs5Y1RHdFovQm04V1ZiRkps?=
 =?utf-8?B?TmxDZXo1bmp0bjNsU25ZZjVwMWpSdS9lWjFtQ3dpQm1jcWJaVG1XV24yOUx5?=
 =?utf-8?B?V3ZxTmtDVVE4RVpyYjR0VngreGp3NUpmOWpFcHpmMnhkWGtCSnE2VUpYMmRp?=
 =?utf-8?B?Y3hGc0c1MkdhUXpIbzhQYTFjaEFNYy9MTzFqb00wbzlNN1JBZzNIMnVKZDZJ?=
 =?utf-8?B?WWhObjJtOU1hT2crV2dGU3U1UFl2K1dlTkpBZW15V1doSUU2bW9tK0NWV01C?=
 =?utf-8?B?N0pGTktIWWxuVjloQnRKdmFuekJxcGsyb3VrU1FINTduVC9IbllqSlNocVZN?=
 =?utf-8?B?eGZQWTdZNGdxelg0UFJSdi9LRjJ3ek9BVm1pem5VREtlMXB2QWQvQXJjRFYv?=
 =?utf-8?B?Y3VqR0VlR1JHeDNBY2NVSHJJUzVyOGZxU0VFbW9LMEF4UHJ3V2pnamRlblpv?=
 =?utf-8?B?VnBkcEdBcDRFeTBIc3hkaUg1ZFdORjdsTXh5SjFsckdibEF5eGtueXVHcW5r?=
 =?utf-8?B?NU5TT3BJL01rVTU3cXMwdmxRN3E2QU9KQjkwMHRFaURCRlR6cVV3N3puZ1o0?=
 =?utf-8?B?R1dKd0FmYjRHVitKMUMrNjY4N2RuTkRuamoxcGtCWUJCMmZkQkovODZZeWxk?=
 =?utf-8?B?WkZtRURoT3NYRDVFcEMzNEp1anIzcUdyWVV0UllXR2NYcXU2SWZvTkNKeVUw?=
 =?utf-8?B?Y2NuNkdhalN4eWEvVFFRS1RzUnIzTDdMM1BRMDZQdXNuRHFmd0I1YUF6OVd1?=
 =?utf-8?B?b0czL0hrMnRwNjg2K1cxL0RwZmozV1lCZUxxWnJJbjdzd2xiTDZiR3M4ZUk0?=
 =?utf-8?B?RkFFV25lZHN2S0JjVXpTbXBjeE0yeVZQN0o4RW5ncXhxcHR1blVWYjhQdTRo?=
 =?utf-8?B?aTgwWTE4aWI5MnRFUlJiYjZDU2U1YWpVdFR4ci9yOUJGMVB6MXMxSGp5dDkz?=
 =?utf-8?B?cERDamNzcS9adzh3WUJ2VGI5cmV4cW9Ma3kwZitISjhwRk93KzdBMWFWVEs1?=
 =?utf-8?B?MnBmdEpxUHNUaGRqVit4YVZvNFFVa20zNEJUVUFuT25IOUllWkhoREZOM1Ny?=
 =?utf-8?B?WEFEL0Q1c1lka0RFZmJVRFpJWjlENzM0N25Nek0xMVlmZ1Iza0Jua2JMWFVX?=
 =?utf-8?B?aXp6NC81UldQNHdLN0lZSXJXRHZob296U3JXb2RMc2grZmI3RmRGR2I0cUh4?=
 =?utf-8?B?MEE4TlpEK05FRzVodEs0bEtua0w5Z0k2ekFSV2ZndTc1YTRJcDUvY1lOSjVy?=
 =?utf-8?B?QVhZUTE0MXdPaXZKWVY1aHh0TEhmV2t2a3VUY3NsdVVkQ3RwazQrVlhRRGJn?=
 =?utf-8?B?enhjSkdsU01ZdHgxWmVQSTR2OGM2c2dQRHlhZkl4SElCZnptQXl6NHo3dCs0?=
 =?utf-8?Q?Yx2xsHvVHigxyfmA=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CrOTZb1KRrluE8Hi1qKRD454X4/8qRXPxHi1cqFPQYNvr17f1fATBKuEHUjSG1O0/Hvh6RKs6WeVHUo5EpnlqFyKsFw7LDG/GIpH5YjjRev4xPkZtie/dfZhrv5YkbetTk+MjZ8Asj/daThWAC8Zllg6yxdewJSZ8D4dkiye9+vWa9ukZPFzKvY1+65tMcplIRZvV88n5ehhcwlbn4RZ96lty+38Kp5E+09w1hvWqFY/RAdQprsQK7Zd7WsIAk8a7rlWJL9k8IIDPNrS0kNlcvkQyr9F0pz+zR8rGkj80VM1Nm95YwTUKIV55FRluvP5VKCN51YLe7kXO0zjLjfgrA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b137b1f-021b-47d3-320e-08de7f504b55
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 09:26:37.1030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AxdWCRDv24cjq1vJ384aXrRsVpA5dEn9LMt6b7ZY4xpRPyA7+lzpYDvdn+c/fLlu4FAozNXPYwAhO263RnUUNdrC+EOY+Cy5UgkT++EsOPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_022643_060218_E676CA41 
X-CRM114-Status: UNSURE (   7.15  )
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
> Cc: Justin Sanders <justin@coraid.com>; Jens Axboe <axboe@kernel.dk>
> Subject: [Intel-wired-lan] [PATCH 54/61] aoe: Prefer IS_ERR_OR_NULL
> over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Justin Sanders <justin@coraid.com>
> To: Jens Axboe <axboe@kernel.dk>
> Cc: linux-block@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/block/aoe/aoecmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
> index
> a4744a30a8af4ff05113f3234021eec728265b4f..b31e539a66433a0a5d6e81117a32
> d12735ffc1bc 100644
> --- a/drivers/block/aoe/aoecmd.c
> +++ b/drivers/block/aoe/aoecmd.c
> @@ -1268,7 +1268,7 @@ aoe_ktstart(struct ktstate *k)
> 
>  	init_completion(&k->rendez);
>  	task = kthread_run(kthread, k, "%s", k->name);
> -	if (task == NULL || IS_ERR(task))
> +	if (IS_ERR_OR_NULL(task))
>  		return -ENOMEM;
>  	k->task = task;
>  	wait_for_completion(&k->rendez); /* allow kthread to start */
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
