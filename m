Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0951049514
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 09:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sG4453E+Fz+JjSIZlrYkx0prNCGAcYEgrsDdHw3P5jA=; b=MVghQihe4adE1S
	M+LsvMu1w+VQGAAATVtVxndpJNEFWZG+nj+ukyIX++B0q+iODq/d8S41dfcTOySCOR6IGaQXARjCM
	e/CXCAdZ1ltsZ4GIwYeuwEX6zNUh2H9jPf9fyEPumkktXzS1ituwj4M+tsfEAeNtlY7JnzZnFaiR+
	LucADQcq4707hSKvt5iXpFMVBX9qToQU2Td/o3jGG1ykSfM3vHM2YOql3+X8NXg9RTxZXzrDk/5Pa
	aQOivZQGA9KNApq/zIUC7fAqN/o4HSPI12U2ZC/4YO9Gg1nRw14WzTGy6vixQEMP6QjXqUfvg8qT2
	n8lCyrW2zv3HY+nngKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Fnz-0000000BGod-47uC;
	Wed, 11 Mar 2026 09:24:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Fnx-0000000BGnk-2HzY;
	Wed, 11 Mar 2026 09:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5RoLMOnUP13VcDZLe8DOkUtk65UsNylplQ/Hwrj5XX0=; b=UvDmNMl37aFPddF5eJQoUEhChN
	UiVivIi9mGK/BEwawFXuuSF1TdIkiniy3VTQ/fLkRgc0XCcRBp8vpJqdaIsrBFlVzd3eGtvGJ/kc/
	r+jdNfo74aIomB2blauUvZYqD9LSX8Rq9QVCIk4FUEKWFMdQ2H/sl3m6CvW6Wv5l0WLJvqJSEjmRn
	VPGW5NSywRYWjOnW4Cr+9PHeb4KCs6LMnXfqfXJx1Bk8xQny3/ltOHqA5/a2kJokR5Avq1n85t9hS
	8Nxa+OI1RHXD9L1ycQkNWtYrh1V576NRAxxw1fTGIEiNkvql0L14ALfrXkXaOV0XU2cw0xxfhj9mx
	PpIc5Rpw==;
Received: from mgamail.intel.com ([192.198.163.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Fns-0000000GXWQ-3aa7;
	Wed, 11 Mar 2026 09:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773221073; x=1804757073;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5RoLMOnUP13VcDZLe8DOkUtk65UsNylplQ/Hwrj5XX0=;
  b=lzqeYQL3Hrm8F5iZawc79ANgGYjnTmtsPuQQkHoHtg5FM5hnBjjxRWIu
   Rp4Hl++nfCZvhMpy9SLhFQw3Pwm8V/qqd41CyTPgBGPlX8yLN6hk0JqrY
   WZl4IMR5CnbBIOpxXg6ygG1bc+tIPO163xXBnmj+szbB9cUEDXdjoJ2wm
   mJugJJzx3DAeUloBivoyHdb2SrvQjl+w/2MyZRlFvpQYu3GGbuUf1y0Zt
   nXbCvDKN5I06B7IF+PMpLyGDTBKHXok057ExLbitpuH1nmptFdmUpRifh
   /14eQjiXiMIY+jxNxdCbzdhBS/U4Ewx6Q2LIhdctLgbXv72V3t7xPLN3V
   g==;
X-CSE-ConnectionGUID: So3Ip01sREu6csBAZCYzNA==
X-CSE-MsgGUID: VC0gNN/fQtikrHBfjADX7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74403627"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74403627"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:24:28 -0700
X-CSE-ConnectionGUID: XlPxWM9tSxuxy/R2m8bOgg==
X-CSE-MsgGUID: 1FQ9T3YETb+alF/y3zB6jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220442344"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:24:26 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:24:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 02:24:26 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.54)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:24:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4+obR+DUr1NWwPV/opT2BKJh5cML7CR20tMRhNWdIVCWngUB6pzmViltafc4aDRm55nkHXh2TM7mR7st8u9tFZxfVU1SKXLojgWQRvGac+YzVyLh1OfdMQIvXqJq2VkW4MdAnl9kIwLIuTwxCRwVeKgvpcvYR0X/z54xlfkdT59fzK1+cv5NVOp0P3Ka/RX66j6C5Wo38YNKA9g6ojB7TSZbBTooYeaGaSF4EMhqyFemSb5To6PE+n/adJDL8MXy8Mo74eAOWKGvTwoyApFeVMBqYYpVNMqUAyLoZB1I8YufPsAmo1xHgKWaBtS2wGz37ilXKYdOgTuTIq5FeoSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RoLMOnUP13VcDZLe8DOkUtk65UsNylplQ/Hwrj5XX0=;
 b=C6pGgAvmJtyJbfm2PTOG3k6NJQdDzvUvhD74MCZldYycKj2miReiyKckyYPInfpA9uAeQ98ghwAPbTe2itQFk2LVevWtFM5tbBH9vrKUn6gKowICmRixlKTv/E4CchxfNN56c4dZ41mGzvLJJ/X3YGj/pBt9WE3jyqgDe9qDV8YBglbLiB371dkd9+hWLNu8kgvmETk3pQrB+oH4Snu+vgYsbu+pyu6dKmxVIpdnX5pnJvTKjsYE+sdZa6krSYFuplswmu+ig/d7lFbCuStKUhVx32hAtgqoW07tVVtB4t1Hx61H9GopyGe4KqWQVndSHrD1NghJz0swgoU8/0pQng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by CY8PR11MB7897.namprd11.prod.outlook.com (2603:10b6:930:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 09:24:20 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:24:20 +0000
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
CC: Igor Russkikh <irusskikh@marvell.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan
	<mchan@broadcom.com>, Potnuri Bharat Teja <bharat@chelsio.com>, "Nguyen,
 Anthony L" <anthony.l.nguyen@intel.com>, "Kitszel, Przemyslaw"
	<przemyslaw.kitszel@intel.com>, Taras Chornyi <taras.chornyi@plvision.eu>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Iyappan Subramanian
	<iyappan@os.amperecomputing.com>, Keyur Chudgar
	<keyur@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>
Subject: RE: [Intel-wired-lan] [PATCH 38/61] net: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 38/61] net: Prefer IS_ERR_OR_NULL over
 manual NULL check
Thread-Index: AQHcsKKD4Ry70gA6uk6MEWNBv9uR1rWpEF0g
Date: Wed, 11 Mar 2026 09:24:20 +0000
Message-ID: <IA3PR11MB8986CEEF7657B227DE50BB7CE547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-38-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-38-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|CY8PR11MB7897:EE_
x-ms-office365-filtering-correlation-id: 63193b5f-3977-438b-d8d6-08de7f4ff9e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: RgkrEof3rBWQFwe3FC5U4zx9z4zsXX197T2TnOA/LmSF1sXJiOcogItWd8nR52P67MFVsl294YF8lIK7qyuGP71/sFqcDuXC/PPs6sKebUAtadKRjL6erwv0g5zGPPBhMR+RiPTv18H0kLEnwNIZl4sZgRDSCBYPj+EVcZL4lqDWpjHJQv+ocpkZQX0f+C8+k5qmm/50uTUAJA2nXbNpWIf5ro+RwC5os6JQbBWXM8DuxIitv6eENm/ZwrV9DaSKm4LL4iQh95P0vV6On1lpP2N3O/jsLsYBBpDAe682AZv/YONWwDALs0CzkU9aVzMDzM/Lq2J3d8y0yJ+cuEoHTeOp6ChixF39mzZ9LYXxTs4qm005aEfANeh15vW9ljZ/s4jDYpb0sfnZ1zDvbx0nncPqc3wK4ENUrtaWG68vllsEsJeUWunovycH8UwPHu6NugbYZoFqbtjzFZSt0mjC6M+ao9DIurYQkhcQ+J/Tvr1HeFBYFlrgKkFBO3W7uBa2JCdk0ObImtjiwU91Chj7j5Z2MYnHnly19+MOB3RueyoXHhtxP0919zBkT8aqMsqlT6us5Z0Ud8GZjKr6KdnzBNQv+oC7/q0Uq6SFtz+h+SPxQV9LVE5x3VkNd14B3L3cVCaovzE27HT2HdRqFUFcbRkoQ7gvDFBN2qx+096pxYHUmCyhZ/peMsmjjtg0YKzxd5JYqpGx6B5wExqFVNAygcdlcMS4yY2Kg/cn9DZWE5Cxt5HQQLoifGZBhpyCl4DV3/79vhL/L2+lbem5ZF71pVBWKPZJCVKCLmjd5kpYALiNPBgbwHwazlKE7HI6g/BQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3JkMDYzeXV0aVc4VmVvV2MzYTNOZ2s1TTFUcUE1eU11azdybzVYaVZldzA5?=
 =?utf-8?B?aTBsdG5rcW8zNTc3Vm9yZXljV2ozUGQ1WXU1dTBzRDNQUmVrT2x3MCt5Rnhi?=
 =?utf-8?B?QzJpVmRkTzZaV251YkY0U2lsbmZFaFJJb2VzSHEzc3llckhSMU1WM1czYW1k?=
 =?utf-8?B?UVpKQXBBZU1OcnlYaHl0TUtIVmRuQlBqSVZDL2EwWnBtTEhVREl3U09xQjRJ?=
 =?utf-8?B?Z2M5L2pIVzlEalBVNG8wNjdiOXpSeE12UVdERjE3Q3paLy9GRG4waXhnZEp2?=
 =?utf-8?B?RUNXdDBHZm9NUkUvVWRYcGkrNkJPVGlyVWlFNTNHRCt5MzU2cy9uQTA1UkY4?=
 =?utf-8?B?OGtYTmNjL1k4U0tCTnI1R3hBV0R3TGI5UitLTmx4b1NqQkdBbStyQ2JHaWtv?=
 =?utf-8?B?WlFacy9yeTNyc3Q5bnlBdnVDUHFJK3VFZkJ5MFVyc2lWUlViSk41UENJYVlh?=
 =?utf-8?B?SndNUkx3WXdoVW9YNWJtQllmYmlOcEdvaTBXaE80UHY0QXBoRUZWdStBRFI3?=
 =?utf-8?B?VjNHOVMwMnMxSnRXMm9lVkl4RVBjWDF2YjFpa1JyR2srNHRGeFhrU1ZjVnVr?=
 =?utf-8?B?MklOcE5ic0IySFJCd1A0V2RaT2tyVnlHckxiNzRBam1OOWtPcmFnZVZIMWFF?=
 =?utf-8?B?YzVWSklMOFZMSUVDVndyOTFUNjNqZUJXb2hPRkpOOEJORzEvUkV4bHpyVlVD?=
 =?utf-8?B?ZENNM2RtcmVQa0JXTWxBZ2VmRzNNVUNGUlZiQnFWQVh0bk8zTEpMc1kwTUM0?=
 =?utf-8?B?a3JxS01PSER6N3FWQkJtUW44Mnc1YnZycktDZlFvR1dSNlpzUEQwbExuZ1Bt?=
 =?utf-8?B?NHAvRnlGMlQ5Qkd1Wll2SW1WeVh6clBsQW9CVUgzTkxlWlZvMHBUa0lxTUly?=
 =?utf-8?B?YWFpb09qN2dvRWVvOHN0Yk1lRHR1bkFLaXRyTWlsbHhHMHIrVUpScm5TcjFa?=
 =?utf-8?B?Sys3YU56SEdWVHV6WFJsTzBMRTI3WjNxYlNoRDRZdzJwc3FmczlwS2k5NGwr?=
 =?utf-8?B?R3E1VWdIY09wRkg3SW5OeGJhSzdQMVlTUUIxK2lnYjNoL21HSjlOanhjTWpP?=
 =?utf-8?B?Qll1eHBBdDU4cE9hVHk4ZzErZUo3d3lFenJxR1Q4WWNkWE9hUEZ1Q0RZcFdK?=
 =?utf-8?B?MEhiemtOVWlEZHhtM3puV2NWenJCZnFzRFBncmNRSUZ2TEFXQnJiOTU5ODcv?=
 =?utf-8?B?Wkx2T1c2NHlOcHFUOU5US2ZxT1k2eWxxbkFidzlwYzBZZTB2ZTVxaTU3MUtN?=
 =?utf-8?B?VnZVV3hMdVVObkVuUjVmVWphMHFBWVRyM2tyL3lYajlEcHU3VXhPeWswWTRF?=
 =?utf-8?B?MGhmcDNmR1pDazV6VkNZUFNlbzEzSUE1ak5QMEQrVHR6cG5XdkV0S0h6T1B3?=
 =?utf-8?B?a2hWTVJkTlUyT3hTTk1Ga3dSQmZQajhOM0dydjN5aDIwZkNBS3B4VFduYzdT?=
 =?utf-8?B?TFl0WW5rOUJnbDArWXhqa1h6ZmtKdjB6Rm5jUFMyT09CcC9RUUZvaTU3d0Ry?=
 =?utf-8?B?LzkvUWF3azVVTTVXZ0hIcmJYblJYMEVRVXRudGFmSmx1WUdreVd6SDZ2djdC?=
 =?utf-8?B?eHdlVW5FMW8ycG9aclRtbWVvZ25jam4yMVZjMTJIK2hCbUphUHlMcWE4ZkNr?=
 =?utf-8?B?cU9XT2pPY3hoR25YZ3dKd3RaWlZoRnh4U25IVGZqeVY0Y1B0ajlRQk9WNEE1?=
 =?utf-8?B?QnloMHVkakZtMlpJT1RvS0tMWngyNWpkS2FES3M1WEYwNllMWGQ4MDlXY2NS?=
 =?utf-8?B?azkvMnluYThyeHJVRWFTUnd6ZGVPbEhpTFkvRTA4VmRNSTUvVUV0WFFTb1dO?=
 =?utf-8?B?SkMzMHlKNHMvSDg4dHozVHJWRy95VzZvVXdUNGxtbzlRL3pIOXlkMEFtZDVh?=
 =?utf-8?B?NTNoL21iUEwvUmMrdlFETitnNXpDTFRUWWpycVhuZ2FkYXlnU05KTUY4RTdN?=
 =?utf-8?B?aU5qckxrdHpMV0w2S2d1ZWFHaUx1Ukl0c1pPYnl5aGF1VTNhc25pRWNkdHFp?=
 =?utf-8?B?Z1BHT3BMYUhDSDdoa0xUUmRRMm1obXd4Mm9ZM3BNRG1VdGVSUjdETWNycnRm?=
 =?utf-8?B?YnF2Vjg4dW9TTHZGSVVUdXVwcGN4MEg0akI4U0JkZUJYTnZYQTd4SkNtMldV?=
 =?utf-8?B?eVROOFV0M2ZiaHZkK3VZRmRVajlnYTVQU0R4ck82WjUzcXdOVkp3bnhaQXRG?=
 =?utf-8?B?S0krUW81ZFk4d0FGK1U5eXN5YlpTUHljMS9nQmpreFRlbnUyTGpka3YyOGdx?=
 =?utf-8?B?K1pSbk1PNTBhR0tFUG4rVFV5ZW9hSHpGU3N3NTB2aEQxK3FabVR0MEEzMGhr?=
 =?utf-8?B?b2E1UWYxSDN0OXhJMm1MVFFkYmtXUVRYQ2tuT3FVWW1KZGVyeUphSkdwOTZi?=
 =?utf-8?Q?K9umCgd0L7xEFc8w=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AZwS5pzkS+D5Nh73DvJfKXwuNk8Q81jLKYf4KuXrdEmDElrdoxJ+RlB+KWtM7wBvtd/MjpDS+6pYLjB91TmVt2v7YoFVhC+4LQOcaCl3kFKvfqv1G50mfIYQj+zvxnsvkiVqdqGR+A4iKK5R03s1w99lvqOxzMW5/XKRmNy42GRnrIX2KKXfqo0DvAd7afvfpqs52iNZEwtUVP0QgFnHh5/hZO/pbwtSLXxGiM3Rlz3gm3Iv4xq5EWCAdEmkK6dOW8woUoYZJDeMWl34IyVmn3FFU/HDabQdc+z4aSa69sViJAk3qSCF0RJPn5JsT9Ujhy65+16jwkfK+TXolw3DeQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63193b5f-3977-438b-d8d6-08de7f4ff9e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 09:24:20.4139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QTSSA+Jgtyl80MXGEpHEOtktlwsSjBf7+eCeufNAQo7CS/YqBWskpsPW8wBpAkjRhMREhc3ZLbJuxK9CE9E6oAGpyKAGYr0bqoL3MzzO7CA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7897
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_092433_630173_20832E92 
X-CRM114-Status: UNSURE (   7.32  )
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
> Cc: Igor Russkikh <irusskikh@marvell.com>; Andrew Lunn
> <andrew+netdev@lunn.ch>; David S. Miller <davem@davemloft.net>; Eric
> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo
> Abeni <pabeni@redhat.com>; Pavan Chebbi <pavan.chebbi@broadcom.com>;
> Michael Chan <mchan@broadcom.com>; Potnuri Bharat Teja
> <bharat@chelsio.com>; Nguyen, Anthony L <anthony.l.nguyen@intel.com>;
> Kitszel, Przemyslaw <przemyslaw.kitszel@intel.com>; Taras Chornyi
> <taras.chornyi@plvision.eu>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Alexandre Torgue
> <alexandre.torgue@foss.st.com>; Iyappan Subramanian
> <iyappan@os.amperecomputing.com>; Keyur Chudgar
> <keyur@os.amperecomputing.com>; Quan Nguyen
> <quan@os.amperecomputing.com>; Heiner Kallweit <hkallweit1@gmail.com>;
> Russell King <linux@armlinux.org.uk>
> Subject: [Intel-wired-lan] [PATCH 38/61] net: Prefer IS_ERR_OR_NULL
> over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Igor Russkikh <irusskikh@marvell.com>
> To: Andrew Lunn <andrew+netdev@lunn.ch>
> To: "David S. Miller" <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Pavan Chebbi <pavan.chebbi@broadcom.com>
> To: Michael Chan <mchan@broadcom.com>
> To: Potnuri Bharat Teja <bharat@chelsio.com>
> To: Tony Nguyen <anthony.l.nguyen@intel.com>
> To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> To: Taras Chornyi <taras.chornyi@plvision.eu>
> To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> To: Alexandre Torgue <alexandre.torgue@foss.st.com>
> To: Iyappan Subramanian <iyappan@os.amperecomputing.com>
> To: Keyur Chudgar <keyur@os.amperecomputing.com>
> To: Quan Nguyen <quan@os.amperecomputing.com>
> To: Heiner Kallweit <hkallweit1@gmail.com>
> To: Russell King <linux@armlinux.org.uk>
> Cc: netdev@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: intel-wired-lan@lists.osuosl.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  drivers/net/ethernet/aquantia/atlantic/aq_ring.c        | 2 +-
>  drivers/net/ethernet/broadcom/tg3.c                     | 2 +-
>  drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c    | 3 +--
>  drivers/net/ethernet/intel/ice/devlink/devlink.c        | 2 +-
>  drivers/net/ethernet/marvell/prestera/prestera_router.c | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 2 +-
>  drivers/net/mdio/mdio-xgene.c                           | 2 +-
>  drivers/net/usb/r8152.c                                 | 2 +-
>  8 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
> b/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
> index
> e270327e47fd804cc8ee5cfd53ed1b993c955c41..43edef35c4b1ff606b2f1519a07f
> ad4c9a990ad4 100644
> --- a/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
> +++ b/drivers/net/ethernet/aquantia/atlantic/aq_ring.c
> @@ -810,7 +810,7 @@ static int __aq_ring_xdp_clean(struct aq_ring_s
> *rx_ring,
>  		}
> 
>  		skb = aq_xdp_run_prog(aq_nic, &xdp, rx_ring, buff);
> -		if (IS_ERR(skb) || !skb)
> +		if (IS_ERR_OR_NULL(skb))
>  			continue;
> 
>  		if (ptp_hwtstamp_len > 0)
> diff --git a/drivers/net/ethernet/broadcom/tg3.c
> b/drivers/net/ethernet/broadcom/tg3.c
> index
> 2328fce336447eb4a796f9300ccc0ab536ff0a35..8ed79f34f03d81184dcc12e6eaff
> 009cb8f7756e 100644
> --- a/drivers/net/ethernet/broadcom/tg3.c
> +++ b/drivers/net/ethernet/broadcom/tg3.c
> @@ -7943,7 +7943,7 @@ static int tg3_tso_bug(struct tg3 *tp, struct
> tg3_napi *tnapi,
> 
>  	segs = skb_gso_segment(skb, tp->dev->features &
>  				    ~(NETIF_F_TSO | NETIF_F_TSO6));
> -	if (IS_ERR(segs) || !segs) {
> +	if (IS_ERR_OR_NULL(segs)) {
>  		tnapi->tx_dropped++;
>  		goto tg3_tso_bug_end;
>  	}
> diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
> b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
> index
> 3307e50426819087ad985178c4a5383f16b8e7b4..1c8a6445d4b2e3535d8f1b7908dd
> 02d8dd2f23fa 100644
> --- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
> +++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c
> @@ -1032,8 +1032,7 @@ static void ch_flower_stats_handler(struct
> work_struct *work)
>  	do {
>  		rhashtable_walk_start(&iter);
> 
> -		while ((flower_entry = rhashtable_walk_next(&iter)) &&
> -		       !IS_ERR(flower_entry)) {
> +		while (!IS_ERR_OR_NULL((flower_entry =
> rhashtable_walk_next(&iter))))
> +{
>  			ret = cxgb4_get_filter_counters(adap->port[0],
>  							flower_entry-
> >filter_id,
>  							&packets, &bytes,
> diff --git a/drivers/net/ethernet/intel/ice/devlink/devlink.c
> b/drivers/net/ethernet/intel/ice/devlink/devlink.c
> index
> 6c72bd15db6d75a1d4fa04ef8fefbd26fb6e84bd..3d08b9187fd76ca3198af28111b6
> f1c1765ea01e 100644
> --- a/drivers/net/ethernet/intel/ice/devlink/devlink.c
> +++ b/drivers/net/ethernet/intel/ice/devlink/devlink.c
> @@ -791,7 +791,7 @@ static void ice_traverse_tx_tree(struct devlink
> *devlink, struct ice_sched_node
>  						  node->parent->rate_node);
>  	}
> 
> -	if (rate_node && !IS_ERR(rate_node))
> +	if (!IS_ERR_OR_NULL(rate_node))
>  		node->rate_node = rate_node;
> 
>  traverse_children:
> diff --git a/drivers/net/ethernet/marvell/prestera/prestera_router.c
> b/drivers/net/ethernet/marvell/prestera/prestera_router.c
> index
> b036b173a308b5f994ad8538eb010fa27196988c..4492938e8a3da91d32efe8d45ccb
> e2eb437c0e49 100644
> --- a/drivers/net/ethernet/marvell/prestera/prestera_router.c
> +++ b/drivers/net/ethernet/marvell/prestera/prestera_router.c
> @@ -1061,7 +1061,7 @@ static void __prestera_k_arb_hw_state_upd(struct
> prestera_switch *sw,
>  		n = NULL;
>  	}
> 
> -	if (!IS_ERR(n) && n) {
> +	if (!IS_ERR_OR_NULL(n)) {
>  		neigh_event_send(n, NULL);
>  		neigh_release(n);
>  	} else {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index
> 6827c99bde8c22db42b363d2d36ad6f26075ed50..356a4e9ce04b1fcf8786d7274d31
> ace404be2cf6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1275,7 +1275,7 @@ static int stmmac_init_phy(struct net_device
> *dev)
>  	/* Some DT bindings do not set-up the PHY handle. Let's try to
>  	 * manually parse it
>  	 */
> -	if (!phy_fwnode || IS_ERR(phy_fwnode)) {
> +	if (IS_ERR_OR_NULL(phy_fwnode)) {
>  		int addr = priv->plat->phy_addr;
>  		struct phy_device *phydev;
> 
> diff --git a/drivers/net/mdio/mdio-xgene.c b/drivers/net/mdio/mdio-
> xgene.c index
> a8f91a4b7fed0927ee14e408000cd3a2bfb9b09a..09b30b563295c6085dc1358ac361
> 301e5cf6b2a8 100644
> --- a/drivers/net/mdio/mdio-xgene.c
> +++ b/drivers/net/mdio/mdio-xgene.c
> @@ -265,7 +265,7 @@ struct phy_device *xgene_enet_phy_register(struct
> mii_bus *bus, int phy_addr)
>  	struct phy_device *phy_dev;
> 
>  	phy_dev = get_phy_device(bus, phy_addr, false);
> -	if (!phy_dev || IS_ERR(phy_dev))
> +	if (IS_ERR_OR_NULL(phy_dev))
>  		return NULL;
> 
>  	if (phy_device_register(phy_dev))
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c index
> 0c83bbbea2e7c322ee6339893e281237663bd3ae..73f17ebd7d40007eec5004f887a4
> 6249defd28ab 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -2218,7 +2218,7 @@ static void r8152_csum_workaround(struct r8152
> *tp, struct sk_buff *skb,
> 
>  		features &= ~(NETIF_F_SG | NETIF_F_IPV6_CSUM |
> NETIF_F_TSO6);
>  		segs = skb_gso_segment(skb, features);
> -		if (IS_ERR(segs) || !segs)
> +		if (IS_ERR_OR_NULL(segs))
>  			goto drop;
> 
>  		__skb_queue_head_init(&seg_list);
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
