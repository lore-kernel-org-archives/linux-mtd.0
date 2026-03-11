Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D7EFD2D9D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 09:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrRBZ4+bemkRBN4n83PXBU9v5xSmz7q9n6HC5sZ+beQ=; b=ejXcHe5P7JL21/
	shvGLKoY08PY5SmAqJ6Srk6EUbtKjUUdRfbaM+KUKvzGMurhTvKdbCNqrcwjsh3zPsflQaPrr/bT3
	dE12k55fQdibTVxOA9p6m2jA5V7uGvPq/QvRU5QI85kTLFCBWeqSr+4gQ/Njw7ZIAwZKYjvPvBtLo
	rBWQdC6o/ovxFPiQKjYEOYQPsW4dY4/2IU5eA/yNaA/cC+vW75+urkBVS1xfxVutwkfr4WIdLCokL
	/9soEFeekYu2DtrOHBMvt9KzEqTecsXtxUFbRLqKf6ZWrWW5Q7z4hGXcfwwwCHkykxr0USM0n0j6Q
	d7RY2hjNs1aYRV8sYXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FoG-0000000BGwS-3toH;
	Wed, 11 Mar 2026 09:24:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FoF-0000000BGv7-33ND;
	Wed, 11 Mar 2026 09:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/WnYjaq9zqroKxNH1/RH2NWPVjerKMwSwnhWZn9wJdw=; b=EIK1/pn8ta/FhxQpqIf1cUDo0L
	v1P2hL3qzyxoBrBHRG04FS4GjqavaGuZnZzWyQ6S8AwxEqTWF3nZUO7QuefnnY5JxnOJgb76lLh6h
	rfKxgqBvRh0DAV346ABWYtf9u5CgEMfQ10Tii63WEYDLqQ5qqYlCMo2qqauKiGyBTWE9XUHP5Ihr+
	TLPlJ0xmSFzwM9mR3/YBVeR1WFvmEkcCK8cyIoWCb73m0xR/aHYCOtb9UNLA4dhsRtX03AQiCJ9Sr
	tXC+UlFvYY6VLbw9+gpYgBKwi9brLw7W0Z4yRdnm2X70ENHDn0N21fBwBgXEA1M2ZOX/UJ9vP11mQ
	xi21n8PQ==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FoC-0000000GXcE-1pyr;
	Wed, 11 Mar 2026 09:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773221093; x=1804757093;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/WnYjaq9zqroKxNH1/RH2NWPVjerKMwSwnhWZn9wJdw=;
  b=DYfrSxtKYfoIXByvGLS1dl3UmDps8IXyRGarjpDmt/j0Uuf2+prk8Eon
   dSJhMkmfMqTnP8OgJJRBSeIwrYQJmV4JoAGxox2CVChxbl6H/asuI5oDs
   rvwD2NLG/ADABqYRni1Dagj9qiQXMEiqs4VUY6GwwgCmAsmWpnT35zjsF
   IB09K7H1BxsbLCNkNx7wlCbvptWwYHzrfiztPjhDMT8hn5mpdzo9CC/B+
   +O14kemEv67ETMB7XxXoBFG4EKPA1bRMff1KdIrB+aB+pT+pOsBKuwlIM
   JMkwIUX/9eZ6lk0LlY7xlvuqJOhGbqEa7Yr9/kOgA3HfVs2PsUBbQPqoP
   g==;
X-CSE-ConnectionGUID: +WpXNp9KQa6XZxA3fB/Q2Q==
X-CSE-MsgGUID: Kycwqig2QuyvbkVWHqCEtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="96899640"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="96899640"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:24:49 -0700
X-CSE-ConnectionGUID: +pNzCQuOS4iMOvUIOsAbbw==
X-CSE-MsgGUID: ihZy0IpkRxC1aXJmO8GjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220354338"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:24:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:24:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 02:24:48 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:24:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrGF6ysw3NLbFbz7lvDpDsZA34MAFk8M6PmU/DB+YGblIv+vOpJHUfRNdxOGGNT97eD/VPAXQl6832UdgZIlyco/xQ5N7yqkEP9715RZLzDgG2OCQPVM+c8qhUDQWzgNsSequTQ/0cGZBLotpTJdsw9XPPcvYJbc0W/0U13cjZxpsUs2+iBxSyLsO2jhJcZEEjEL65O/vlhdF4hOnb5V1YAhiiT08wChIxU/eWp8kLyw258X03oaDE2sw0J+vrdDo4X/jkMcyBQztWprdJH2K0PDhP9zDkx6cSSXKQUxpYrXJiioXIfZNZKg4X2+ZpjZTJceRSMn8YfckCdPx2uUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WnYjaq9zqroKxNH1/RH2NWPVjerKMwSwnhWZn9wJdw=;
 b=fEMQ+ysMnPe2j7XVEXA7acz6fhMjQ0kXtpbPix/u4OCeSl+jsMwiaXRncu292Ubnorn0DFmHj2r5fbLBS0tMaktq3yLpK67Yz9MZZksKW8cMKWP2/48/oi0Qbs1/78nwAKQS7KbhAgoKszGdIsSEhsdgPE9oY5UL743qCUq3eDsvPGV3dDzXTaPgUrK8YyzNp3FSP4nEk8xs+4aJ3mC+Sh4E6VtTKOLz5Ii7TYM+65aXFKGenEDpdLjLIqzCmHlJv9WyB2CBoB7Psd0bEnvWvBHO4Wd/YCGFEyQWVmLhMz/4VAlbZ0SuEW9Ka72ut/ucLp+5aLw47WUReY3sBQQFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Wed, 11 Mar
 2026 09:24:45 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:24:44 +0000
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
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Andrew
 Lunn" <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: RE: [Intel-wired-lan] [PATCH 39/61] irqchip: Prefer IS_ERR_OR_NULL
 over manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 39/61] irqchip: Prefer IS_ERR_OR_NULL
 over manual NULL check
Thread-Index: AQHcsKKg9oKg4QUhq0yGHO8ZtUkDV7WpEHiA
Date: Wed, 11 Mar 2026 09:24:44 +0000
Message-ID: <IA3PR11MB898641F143E155B8A8069936E547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-39-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-39-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|PH7PR11MB6836:EE_
x-ms-office365-filtering-correlation-id: 16e59c4a-c185-4674-e460-08de7f500851
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|921020|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: LSUZ060yA0zdkbfhlg7l9aVdcvsKojcvgwO3ACL3uZZlR/qzeqERV2DVHgMJwbPfqhu267UPDQzRLLv7X3d5RlS0JuOXDVxA9cm+WkkbMcCMMheQlIRAxrIktgbdkZESGhzlWgTbxl3Y/2gbbusycFgS0wjI5+GRZk26YjYST+YF3Cf7sBqIA7aduza3XxbWyGcS8eF9T0W6BRyf+jBN1IZ6mJ32KyDEwAPdnPfUMlrC6tr31AmtIuls+sW7d/tUscX6/XESWrivRoE+PBho0thaAsRLRKrhOV8qU1PPKRjY2iir7g48IrNLqDT5DRAQ22iTqJdt8cGwK7uoPrGBJxj7AULdq2IvwrtQYg0czy/oFGIJdrjEQvGAtmcVTPGkXmGkbNgRdgWIkvoA1lDlUMS2gALwKxiZh5PaAoX0JATl8b1EIr/ePZ+RXmc7HRRcAyUJ5ox0P84CR6ikaSNaIp/RQ4sOh2bGTfYI0V7N0JrWkAeVpHuGwS3+iRzCtLtXVMUvpcaKx6LgNt188r1ZN8p6Z9Jk/GFeOvJMqGFFsPLMwq0PebF4kfJt1gig815Ylf75pPpjL7O1ZPprsvGkgvnNM0uthucVJu6SuavLnsBH1QDfOy2BvuUqNHav1UU2sT7fQim8hOf8teLWQRN0nYSPrHNTDWP0c0PT2XpNnKCcpTYwz/bMUzACKZyfACaLP3dQ7r/lBBVithoKBQjk7PboSYKfrJ57BzzWTh1xwFMIbeKazCXevxZqhONUzLz3eAC5P0eeaEgZOsJ2yvUmoXihSND0r6uoToI7OcCqnrmC56cOaRHUHi+Q5fLAMXSS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmxSbWQwaUx5d3JubkVjM2tDUXZmaTdpNVNzYmdmbGhTdGRURTRxUjZPTFRL?=
 =?utf-8?B?QXVIejBEOFpaU0pHRXorVHBNR0c1dVV3Q0xBU2huK2VyNXBITU5IZU5vbHlI?=
 =?utf-8?B?UzdwS1BYVFhUUE1qRCtlK3JGZHN0bW5mNWNTdTVrTmhkWUlKTXJ6ZWlzcVlw?=
 =?utf-8?B?ZFFDYjZLaWFTeXhOYTA3SXpwWGVHVmZNcWZsQkUwZjhRa3BwbzFqWEdSQXA5?=
 =?utf-8?B?SndrMStaUmg1dFExejJqckFtNDBIOURJclI3MmVLOC85MGpETlBYWXU1MmJn?=
 =?utf-8?B?UjNTM0VUNEVkeHB4NlI0MENVSDlsclloMytKcERNVDczWjMzZHZTRjJtQ1pP?=
 =?utf-8?B?WTYwMVRsWXNLeDR4MWJxR0tqcmQ5OW1OTms2QXhScFdLQkgwRllnU2hIZWNC?=
 =?utf-8?B?dkl2TTcxbWJlRVBrWHRxaldyamNaTFgxdUF1Y2x1VmNTcVBVZEZvL25Gd2tm?=
 =?utf-8?B?V1Eybi9KOVJKZHIveW1kMVNmeUNVa3NpeDd4VURsRkRnSUZUN3p1SXQ1anhK?=
 =?utf-8?B?eVdDTTRNUUg3czYvK0lzUGFQcENCUEt6bGl6MENEalJ3aDFGaWlRVzRUMnRX?=
 =?utf-8?B?MEV6NmRseUFpYTdHL3FqYW41VWc1S3BYZEtkSGxTUkdZNEhBTXkwSkRSWVhr?=
 =?utf-8?B?enJSZ3V3VmJTa2gyWTdFVkdtcGpoTEVBSHB3Z2pUeFZ2M2IySDhTUTN4djUz?=
 =?utf-8?B?NUtscEVXM2Z3bFY2RGp2cGdpTXh4TG0rZmhhVDNLbGcrMFJ3dlUwSzlGYTQz?=
 =?utf-8?B?NEVxenZ4Wmt3TGdDalhRdWxSaFVVUWNaZUN2UlFZTFhFU1BPTFZhYlM1eHIv?=
 =?utf-8?B?YnVNbFFSYkRFaUZBcXpodHhnWldmRkUzUDVvQjVSZUlIb3FmOGw3UUM0TEgx?=
 =?utf-8?B?MFh2RGEyVHg3OVFhSE53OFhLakxqOHV2cGpJeHJVSXlLQXJBZUV3SFlMcHR2?=
 =?utf-8?B?OHZ2cmdKaGRvMUMvZHlmdklZUktUbk1FUFdoQk5YVENHS1pVN0VPRWp0Z214?=
 =?utf-8?B?Z1RYOEpJcHB3aXRXZ3I0cllMVVpRUk5xWTdXNXdpL0p1NTlCQnA5N1FRWDJ3?=
 =?utf-8?B?cnJoZGhrdm9MSFF3d1VlTlJzOVE5V0srdW8yd1o5RWdyRk5FYml5dUU3RWxK?=
 =?utf-8?B?TllLMW1nNVdXRytaYk5JWlVkKzdwbGdTRDhQYTdOTVpPRTh0Q0xzdkRsTmFm?=
 =?utf-8?B?WkJVUzhuWUNhRmZZZllKdzNvVWQwT203RTQrcVFHb0RSRHY5R0k4MEZZOC9l?=
 =?utf-8?B?dGlVbDEyMXFMbmZkYjNvcDdaR0JXODhaZ1hhYktwRytrT3VlM3NGbEdoSlZl?=
 =?utf-8?B?a2c5amkxTWlYV1c3K0tneUt6b0h6MUVMN1l0SG1mQXlRYWJiQXlJcUpZSTZG?=
 =?utf-8?B?MkRHdld0SDhDZUJ6Z0RIQURaNTdCbkNQdDJLWWR4clZuODBFSWg1QlNNdTlF?=
 =?utf-8?B?VHE1aGlCb1BMR3pxeFN1bTFaTmpnOHZnY3R2RWtmeEg2cjc5blgyT1czdGJw?=
 =?utf-8?B?UVdFbVB3Z1JwYnV0b1NidDkvZHZUUGp2dzQ0Z3RJRFVQUytJL1Jyb00raU5z?=
 =?utf-8?B?Wnlya3pMSW85ei9lbFJPNWE5U29vc08xUTY2b0psWnlrS1JZYWxUM0JvU3pX?=
 =?utf-8?B?d1NNSzhpcVFqV3RBZFhlZEQ4ODJlL2VyY3JaQzFibWxXVFI3TzZlZFlYbHVU?=
 =?utf-8?B?ZXVVUFhvYkFHdnRtUDJpdmRUZHh3SnFyNDZNd2FHUS9QNnRlSjRQbUNGNmJZ?=
 =?utf-8?B?N3QwaGN5a0lPQXJ3UmtHQmdXdFRQcVlSN21GUy96UGViTlBlNnZ4ak50dktI?=
 =?utf-8?B?UzhNbEZkVmJVb1BBY2lYbHJqQ2E0eDZhL3kvMFpXajVjSjVKaFByUHp6R1VW?=
 =?utf-8?B?QU1CaC9jUzdGL1IvaGNSMW5vbytyQ1RDeFZSVm5zT2ZkRmNFekpEZ1hkWWpG?=
 =?utf-8?B?bUFDK0xkd3Fld2laTHcra0srNUJabTMzdmV2bFZZbit6UXIveVp4djVsYkw0?=
 =?utf-8?B?YUd0M3J3RXdmSkpVSzhFKzB5bGRnRkxNVmR5RGFjWDErWFdCa1h5anljc1Q4?=
 =?utf-8?B?dzFwWlNFYitCTitjSTl0dVFpeitZV3BjMTdpanFTaEVocTFrbU1nTHZrZ1NV?=
 =?utf-8?B?VjNZMEtjK3BWTld2cjlmSlBOSjV5cG1kRnNSNW9peUpLT1dQaVlJRU9tU2NB?=
 =?utf-8?B?Z2RzRmM5YW9LcnNPZ0hWd3M1cnNwRXNzOEJrOW9MZXF3Q3ZHRTU5TXFhTVJj?=
 =?utf-8?B?NUNoVWZ2bXB3MmZ5U0tNRER0ZEMxZUY2dElmZDN5Y2UySzJTczgrdVFUVFpt?=
 =?utf-8?B?YWgrRlljbFVJZWI2UGtjSWVJcnEyYitUQ1c0R2NMQW4rQzZNQXkzUU5yT3p3?=
 =?utf-8?Q?EvJdgRAwpMEvFYGk=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Zf8elrkojfQdHLplxPSo4yK9pOgnQPMMprHUKo82JkQvl86yNTT6u7FAqvRzYBNdLnuPysxlVmp8BstvFqQDqny1cWRhAcdoxkdIDAaCWkbh77LFjBUgp1P5ILvzqgKv76QMGIEOh1HCHFDMNpA6qp6fjlUNhGD4z0Xuil3d/pUjxQZg/3YpD7F/p0nRjF86T2yIY3G/pKQ7VqTDdvTi73RoDCb8vNdc6V/1zzPvjfuZV2K1E+0W4p1UNIHK0+vefUDENNd8FZMhHxLc8ThB/MIuhK32ckKHzwIfbK/qurKFCa8fafTrKq8nMw4io2MAQKvogLpLBhp4MU1Nvqflcw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e59c4a-c185-4674-e460-08de7f500851
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 09:24:44.6383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yzVMZJlgYUyNW1d1n7aK2gDj2On6Yp4tdJvWL75v0WwQK8k+SncwWDB0auqqFg+FHOhWsQ/6XA7hgcstAFc1oOtOHcR/GJGawyNNy64hpBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_092453_066863_3F938A78 
X-CRM114-Status: UNSURE (   7.06  )
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
> Cc: Marc Zyngier <maz@kernel.org>; Thomas Gleixner <tglx@kernel.org>;
> Andrew Lunn <andrew@lunn.ch>; Gregory Clement
> <gregory.clement@bootlin.com>; Sebastian Hesselbarth
> <sebastian.hesselbarth@gmail.com>
> Subject: [Intel-wired-lan] [PATCH 39/61] irqchip: Prefer
> IS_ERR_OR_NULL over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Marc Zyngier <maz@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> To: Andrew Lunn <andrew@lunn.ch>
> To: Gregory Clement <gregory.clement@bootlin.com>
> To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/irqchip/irq-gic-v3.c     | 2 +-
>  drivers/irqchip/irq-mvebu-odmi.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-
> v3.c index
> 20f13b686ab22faf722dd2b24faf96af636a4bbd..6dc9827357a21ae05dd838fb7178
> 71c73f3c7562 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -2252,7 +2252,7 @@ static int __init gic_of_init(struct device_node
> *node, struct device_node *pare
> 
>  out_unmap_rdist:
>  	for (i = 0; i < nr_redist_regions; i++)
> -		if (rdist_regs[i].redist_base &&
> !IS_ERR(rdist_regs[i].redist_base))
> +		if (!IS_ERR_OR_NULL(rdist_regs[i].redist_base))
>  			iounmap(rdist_regs[i].redist_base);
>  	kfree(rdist_regs);
>  out_unmap_dist:
> diff --git a/drivers/irqchip/irq-mvebu-odmi.c b/drivers/irqchip/irq-
> mvebu-odmi.c
> index
> b99ab9dcc14b3ba982876cf5525499d02bc1c997..94e7eda46e81833cfe0479b6fabb
> a715bf4ef6b8 100644
> --- a/drivers/irqchip/irq-mvebu-odmi.c
> +++ b/drivers/irqchip/irq-mvebu-odmi.c
> @@ -217,7 +217,7 @@ static int __init mvebu_odmi_init(struct
> device_node *node,
>  	for (i = 0; i < odmis_count; i++) {
>  		struct odmi_data *odmi = &odmis[i];
> 
> -		if (odmi->base && !IS_ERR(odmi->base))
> +		if (!IS_ERR_OR_NULL(odmi->base))
>  			iounmap(odmis[i].base);
>  	}
>  	bitmap_free(odmis_bm);
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
