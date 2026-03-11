Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E9EFD2D9D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 09:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdy8h0Y/gkz2uQyLYR0JlwbfU6IAv6xEdu9iB/M+ggA=; b=qrYF8E40VVIPLL
	YIi3VVCfwmKuOF5W27Nu1ieNEFXhmzBfBFApyCkyyAWKNNpML+/TJ6aoL6O/kBU2hK/72JLtfHQ4t
	TOgNWCfgEMdCtv+CzAPLR/TjK8qeF8FEydjO88YpAw9gtyCNQk1OduQvCmE9LwPsUjBax0fZiWojL
	6TVMD58AEJALvoPCuLWLsBva1//x6mewmKEDXws0kfUIS37JkBdZvSX55qPEUbykzJxwMDjJc+Mq9
	yfNcuTy2KtXFuihKTt5s7e7KNvzQQ2/Ocqry7XKROftBl6qosxbQSzpOpz/0wrdANjEP2VJfDNjc4
	fdfr4tMZiqZOB13ZiAxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FpF-0000000BHFl-1OTM;
	Wed, 11 Mar 2026 09:25:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FpC-0000000BHFH-1auC;
	Wed, 11 Mar 2026 09:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6tbQO6yGCv8N8ouulw89rMIOzkRWnTreTX8yvsT+jIw=; b=djYSZU5KoFNedbSCwqoZNuBu+h
	iQbVhgLUXcUy4AVNN2kRh9nhEZVIF+3li2ctduM1jBNexRkoVF5G+mWFplvID1+TghLb3zsoSSeTV
	vmekKoutedMQvDPRsRUSChtUm9jKBn2m9GFs7BR9io3v2wMnTi6l7qhIM7pUirCiUvS4jbw64+HbW
	YFwwZzVOFCUzO96oqLwdVIyx4S3kBDR8FNaRlsCPj+c3zqJSUthRoina4wRUWd9Qa1+Q7OObw04dA
	U+8+313JgMz2dppr7dBLxD3rt+zKikGWahrC3tdwKKhybBRP29A8uMmjmET2kreM7svu8sSsBBTju
	MCCMczIg==;
Received: from mgamail.intel.com ([198.175.65.10])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Fp6-0000000GXmT-3qdf;
	Wed, 11 Mar 2026 09:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773221149; x=1804757149;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6tbQO6yGCv8N8ouulw89rMIOzkRWnTreTX8yvsT+jIw=;
  b=ZfXKlHYZ4amREIMciSEgQCYZQbQYTML6qUKSYN0PCCKUQ8z22/vJiGhu
   OfZw8DTfwGHSd+xXrzyS5gb/afCnZb9+SUqMNE9l4oTZeH3YDDcewuvX/
   dC7yZEsjHCQJHUTM/0nQz4krR5CiXU0c8jx6Jv7hC1P2Tt2DzFmQYJkkO
   +EqEk61io6X/SIvsx88RUZRRof/oZmOJ+Xf51hw3mgo8xeZl0SHvMzfDS
   c5m46kz4ldgTZgoqQ2U8buq+X9BmK1WaDEmFKo1vaZahBqBSJxftWkicB
   iu6KGEEmXStKlW3RejPJMdPjj62Ol6E8ikgUvibTJ+vWOcPDBW0I2yEeQ
   A==;
X-CSE-ConnectionGUID: iu+HrbSDSUWcjgxGN37+3g==
X-CSE-MsgGUID: PG05rVSWRVKZgBvBh4KapQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91665685"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="91665685"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:25:44 -0700
X-CSE-ConnectionGUID: SeyEpxAdRfKJdobfw95FZg==
X-CSE-MsgGUID: +WNep8C1RFOCCFDhvBjEIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="216680976"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:25:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:25:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 02:25:41 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:25:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gW7OiJ/Vub6V5xTra/ISXVlXWhIT515YR6o9UWl/udHMC20jLQvrj8nFa/PS8DIIepyiaCG7xOVGsr8BbAXQBGQt1qn6UEPw2rOBw5w+E+IycMaBKlFzJ0MvVbxEI2I/zxUSZCJMfWE3Cc6RT/WW2yJsVR5BrEZcNknypHx9j/UtdK3k3oenT1hqvwXBbVnu8pgyD4zskIfel6K9+2y+QtBUHq/E2D0Nq8/0zbw0L0TVoofcWxetLyTwuv98sbQbRasji7oAFF5McjHGNBpPPXGRBZ6jobvKU7DVFLqYXgd7hypEb3zqU6Lx5p9q8NklQfZ8D1ts/7Mj85MVkzbaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tbQO6yGCv8N8ouulw89rMIOzkRWnTreTX8yvsT+jIw=;
 b=I3Thht5AdfSZtHdfajJ7eIVunnxE5CRvAwCbGR56ueiIf41wcbjW+t2KkXE/dbaJEEKCaiVddoATrP10ijwVcfOBsHecxOvNpl+NBL/f4CshphkIFQ/Fy3VZzqa/+x2AfDCHe8D6GgjyIQBujr5VNcYw3UQ09ZWLk52OVHIy61cUmBn1r6EShc3SBcjP+k4XxKUsR8Go1HpE0AQLlxpNcTsgLcv5z+C0FIsM09dHPG8BtEIgyqg3PAjPZPq56EMV92VbRknBrPTpe0c0lJRqoNrqaL0lGEk+qujM8+SGOrA8HRGCl8w8tVm5r+sdoRD/Y50jFsrNNJTk2QHw0dlmfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Wed, 11 Mar
 2026 09:25:32 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:25:32 +0000
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
CC: Alex Williamson <alex@shazbot.org>
Subject: RE: [Intel-wired-lan] [PATCH 46/61] vfio: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 46/61] vfio: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Index: AQHcsKJzVlY0YaDH1UWzLB4DgG1n+LWpELCQ
Date: Wed, 11 Mar 2026 09:25:32 +0000
Message-ID: <IA3PR11MB8986D7F17B8E72F94006F48EE547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-46-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-46-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|PH7PR11MB6836:EE_
x-ms-office365-filtering-correlation-id: 90d04f78-f9a8-4250-9905-08de7f5024c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: PSa5Y/PRV2m/kBT405RyAaoUJSX5xxpx3lXjof6vmQpQmRNVaVIATI8WjW50wiW5w9NTDPVVyaNBrQ7GCG8kuJz4NzT9+GWO58CZB/MdOrAvvlxH1/wqcUH+UbgPV+WOfNbdLrCQK2qG2X0Hha3IOjShHNNIcCITQlMaE04JBDrstdeeBgFUwl/imZDKfAoLOX0iTzyxjZmfMCgg8ZjSplg6uJ3X4pZdna1n53VyS7k4r8JFU0z26QeggH6qVfEi5j2YZ8NWkMH8cjNYaYYaHFPchGvS3j547P5kmjcvcDN0jvjGZkOczaBz+ZOcloldMjJcdUl+V6jze/Z1+Txs/Bl1IamV0Y+i1TcMzNJms/9izJCqv5lalfuD5eINGmiIDrSSeND6V0ZUV09j+ZByyu3fmIZHUE200vw84Kj+vrBaWPzqXZfM/LzwAHGXNJ4pt9OpvXxqhwLopyo01OE3zLCZyf7tvGdt/tvvnZka/gZ4vanhaNBS4sSMtyYRSYbkkfAZ6Rtbtnlr3JBixVkWbLaslCvPzUWkJ8VAqRwMDTvCO4yMsDe5FWvQAFZpU0CMQKJlnGcD6Ar6qUx0KSjfJf2d9QPi2VC/AcilJSteFrdEdjJnD79WBYeeT2+AlBimbEDh3vw9eydSvxZXqwzkd3d5qalNQhocxZYvg6swL2YwkVmIrqLM2wR4fnX1l4owl+/UcnQcZUdiss+ftKZOPLdPuEBmEy5WzKNok4xpdncbA9Qw8W6wGIHot5EaqQWnMpN7u9S2DQ0iwsCf/dM95INa6yxB7kaztB5gh5XjcuEfZWTyqw34mZOkj4N6KU5Q
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aC9nY0o2RGxpeXRncjZMZVM4QjBOL3NMSWc3Kzh1SGllL2IyTHoxU2c4ZEc4?=
 =?utf-8?B?eVlpalJqaUV2d1lESHdwNFV5blUrVlBlQUtoQlNXV0ZQeFFUTDVVaEVpd3hG?=
 =?utf-8?B?c1V1Q3BiR0djZzc5WVJkM1lnWmgvbW9uNU9xQlkvYTQ4bkJreVkycXF5RUEx?=
 =?utf-8?B?VFZQNGRiWmowMHhTWGQrcWdtdTMvQnkyVFd3S1BqMmZJMVh3YzAzRGo2dnpZ?=
 =?utf-8?B?R3JhOWhQWm50TWVCd1prY3B5VTlGblcyUU42NkRxWWlEVy9JbG92NHgweVZC?=
 =?utf-8?B?YkhRKzJ2RzQrUC9MMmE5YzF4U3hJQmdteFF5eDZXUWtacDd2djg5R3laMUoy?=
 =?utf-8?B?WWNQZXRlQ1gxeGVEa3VMNmpJODNEZEVYUzFqYkRLMmtuOE1lRXE0WndLWFdT?=
 =?utf-8?B?eDdNMU9tOGtKREdGYUo2eGNyYy9ERG1WdTVDMCt3STQyYmdrZldjQ2tKZlZW?=
 =?utf-8?B?RmVLQnRFUVpneUdRd1h6b0NidG5PaGpjZEdaV2VJNi9NZkpvbWNKM3hzVitD?=
 =?utf-8?B?V3ROVy9ydFZLY204YkxXWTdpQVNPNTVJQk0wMDEzQiswa25RYVB2T0J5dVhq?=
 =?utf-8?B?bk5OOUV6ajdIQk5jRFRSMW9Cc2UwbVpvY25BL2lBRWpRVmIvTWErQTJzcC82?=
 =?utf-8?B?Qmp3YmJGT1FDVk8xK1kwV1FUZGdCRkNBREJKb3JRc2toMWFBRnlVZzBZcHBi?=
 =?utf-8?B?QlQ0YnUyeVZpMEFxdm8xakhlSm5sL0lxRkN5akRVMThDREdzMy9OV0RNZ1lE?=
 =?utf-8?B?Z0lpQnZVdTJ1eXdPVXJZN0xUUjBRSE5kSXcwK3RnK3J0WitQbitMNysyMHhv?=
 =?utf-8?B?bGFPSlU0TFdWUWkwVFNVSXlxUHc1dTNEVzYyMmxYYm5sdmlaNXFyYnVsdE44?=
 =?utf-8?B?ZmhQeG0xSlo3THZMRVlYUGZPSWVtQ3ZySjB4SkVQdUxNWHNrdGE2TkdneEwy?=
 =?utf-8?B?YTY0WmV0N1hSU3FOQmhIeXd3aUwvUkhrK3JLdUIvaEtXYW5OVWNNUzdldzNU?=
 =?utf-8?B?V1ZabjgwcEtFTWlhSnNTbGIwWURHM1BvUCtqWVY4Q2Y5NlcwWWR2MXhsUDVF?=
 =?utf-8?B?Vjk3Y2JCRUR0M2hOdVVUK0VRSXpxbTRnRWEwUnA4aU83bW1FdjJOMjg0YUMy?=
 =?utf-8?B?TWI3SmdQa3E3cGNRV3RCL09GeU1JSEZ0aGdaOFZFL0d0cGlZeCtlQTJoWUkv?=
 =?utf-8?B?aHh5ZTNCaitGZmhYTk1XQ1o5Lys2R290QWRsd1F4RDhkWjduSnFCbG5mU1Va?=
 =?utf-8?B?THVRSkpGU0VnNTByNkZjZStUZW9OSUxYTWJ4dFZML2tNWXFqVHFiOXBqbFMw?=
 =?utf-8?B?d3lzK0dMSU5IZlplUk1PL2NGSmR6UU9TcE1vanVTZU1qVGc2aGdZT1VQemRh?=
 =?utf-8?B?Y1l4V0NFZnR2L0xmTlh3UnRVVTQySEJvSVdUVGRiSGFXaTB1M3NieldUUjlz?=
 =?utf-8?B?RE93N2x3SjZjVjZZOW5DTUZnMWpaaXRpVHFFTFV4Yy8wVnU2bWdUQzFnYisr?=
 =?utf-8?B?VWt0ZXJoalpLU2F2ZWh2OXZnTXQyc2txMWFLOG9JNGNUempsUlo5NE9WQWho?=
 =?utf-8?B?VllNOXJSYlFJWUJoclkzRTBZeVNxemE2MU1VRXFIeGFNU0FRTlNyb0Rucm5U?=
 =?utf-8?B?V1IwS24yNWtBOFR1M3labWh5QXpnbFNUT2o3bEV4MnprbzFvc1FWb1J2Wll5?=
 =?utf-8?B?anFnUVJxdWhEY0JRaUtOazF2NFBPSGt3QXhnd1k1MUpaSExtUFFoZ1hEWi85?=
 =?utf-8?B?RkxMRCszRi81OFpMNWlUTDNGY2owbkVDOUk4Z0w5bk1RMnNkTGE0MGN1N3hj?=
 =?utf-8?B?NkJOV29hVDN6RjVhVldRd2N2UTAwN1ZVbDhSTktnMEk3Zk43ZHZYdmsyTG5q?=
 =?utf-8?B?WVJHYXczOVlTREVNcklZS0FoUzkzRjdOdTB1RDZQckNVdnYzMFl4TWZVY0lB?=
 =?utf-8?B?SVZWYi8yMGNJbkpHWkhaY0RIZnZXdXpBam55UktHd2wwSFZZbktGQTh0MkF4?=
 =?utf-8?B?RUN3RDU5WTNZd1dTVVRnb3hMd1pucTBMd3YrMXRLWXVXZXZNOEFXL1NKUWZs?=
 =?utf-8?B?RTZuVWUxWDZzbWRsWWRHWTNmOGtDb0QvdWFUbndSWUVrR3VaQ1Q1WSt5NitK?=
 =?utf-8?B?U01ZMExwMjYxRFlObXJ6WGxnVWVXbXlrdmtndWVHbGlVQjJPUUdHS2J4TDNu?=
 =?utf-8?B?K1VMakM5Q2l3MXJXdjVkc01GQ284TDZmTzVaa2NFV1UwNUZ2U2c1eDBZY3g4?=
 =?utf-8?B?ZUlSNGpnWG12Mkl6NmhNS3hsOFg4bG1PLzY2WjZFME5MRGF0ZU5QTUIwT0dw?=
 =?utf-8?B?NUUyTlhEQWNDRi9ZcXZQMmxraW8rS1kzRU9iaEJwT241cUEzTkdySVNleGlT?=
 =?utf-8?Q?4Jl7dbELKf/NIoBY=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qxLMk7b7Z4VaRlU/blG3DwPF+9DSKvWLDG8L40xgYD2idsB68FPTpw82p42vVz1K/Okj4Ka3poKyal4FgGaFj4PRs9ridMbhEqcd2D7L5JEhE2WoaPdMSB5ZRZmdP/VDOVzgrQH4dfjtDnh5HS4SOleEwdh81jcCnm7Io3RyAY3SQq7jAgWjySlw5s5slQEbvkrsakuI+Hk5bGu1lmwS6nBqU4zmHNQAitzVitGNZE1Tvw1aSdHfIOdt1eQnCH8+Wj5VlCgajHkzCxzBYiPnfaynRjrVdAgn52jYlQNVQ/whbFgnJ1idVgszD7bR/hDb5v5wBqgV+zJ5F7EPLGAuTg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d04f78-f9a8-4250-9905-08de7f5024c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 09:25:32.4108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +1pvfJK+0PL7J+YO35gTM9aZY86krg7i/7eFOzQKqaNkODxRVunAAG46KrZVxBvpu4/YFbLZrR5XM6UINBHaOiQshgEsxK66oYYWbE1iQ8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_092549_527383_9BB6DC41 
X-CRM114-Status: UNSURE (   7.27  )
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
> Cc: Alex Williamson <alex@shazbot.org>
> Subject: [Intel-wired-lan] [PATCH 46/61] vfio: Prefer IS_ERR_OR_NULL
> over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Alex Williamson <alex@shazbot.org>
> Cc: kvm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/vfio/vfio_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c index
> 742477546b15d4dbaf9ebcfb2e67627db71521e0..d71922dfde5885967398deddec3e
> 9e04b05adfec 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -923,7 +923,7 @@ vfio_ioctl_device_feature_mig_device_state(struct
> vfio_device *device,
> 
>  	/* Handle the VFIO_DEVICE_FEATURE_SET */
>  	filp = device->mig_ops->migration_set_state(device,
> mig.device_state);
> -	if (IS_ERR(filp) || !filp)
> +	if (IS_ERR_OR_NULL(filp))
>  		goto out_copy;
> 
>  	return vfio_ioct_mig_return_fd(filp, arg, &mig);
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
