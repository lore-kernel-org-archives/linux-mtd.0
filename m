Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D311049514
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 09:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6docI3TTr8XYQSma9J8ZG3Trp/s40Px1/4baJJntk+Q=; b=DlzFON4C/Mr3DC
	L/tcHqA7N/mWhBtIJeLETW+GnwpoQtGDjbHMSP4dwwdIo+7Jcpb1FQX0bXwJnfRpAQB3hZ8cFTotj
	5jAtdwtsa32JFGfHuRa6iSENKmA5gS5lPTYXMWyGoOQR3CmlYdv3uroMrJk56WHhAkeH6LgNUGfwY
	7ESl4OTUuYoVeP3x224+GwgZQd1FIfCsM5b8zLbiI+FX5ONBhTf3Q4XCu+FkAkkSUlfjL0qWtxm9N
	jiVzoUr1RUZ5+w3sVAF5sz7CnkMTqSNOA39wcwet2zB7vpiRhTiovyzpcUxE+FIWbvMwXC6j8aeKk
	6hjTL7WziWjV5B350xBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FlL-0000000BFvy-2GfT;
	Wed, 11 Mar 2026 09:21:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FlJ-0000000BFvR-1RTf;
	Wed, 11 Mar 2026 09:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=v1t280Vnao4M3LdN6N1OEluSWRx5I9iIpTKM8xy2hGw=; b=f2QwoUA58Y2KEu47hq/L1cIqv0
	XMPc9jmPP6NZB+hxJrl4deS7kJxAzLIF9RXpYwJwG6csI6vGc0QVZHKEf+5DBTJm2ZCgziuPpfgy/
	rKcqpxapeqavi5qZkFW+XxU6fbKmUr6S5J+xA3tgiz1nexAdRVf2l+5jJu4m4YecctB0LsejK6nIB
	tBq2r3q+Hd1U0bVaJ/w2dDqcREvus7zA6EWTmPZYwChq5rOT3IuxC9Gxbd9zACxeiCofchlIOOoqc
	FT0RiTNjINOdsRU23OUUnxzvU7EOtaR0ibRxv9nClJ198Yu1QGAfGJLQEg5wezujSNKrBcUFlK8V/
	LuRk4jRQ==;
Received: from mgamail.intel.com ([192.198.163.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FlG-0000000GXBB-0EeX;
	Wed, 11 Mar 2026 09:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773220910; x=1804756910;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=v1t280Vnao4M3LdN6N1OEluSWRx5I9iIpTKM8xy2hGw=;
  b=XfBKSwX4t2SxvM2lXYDtLTDzkKZ3pYrgFTW8T9v6R89f+rvKm02uWo8+
   tApuSi4+lPudB5fhzS8pVsxcASHgvetRD+uvSSBVU1h5qLnBONYcWfB5T
   BMDTp8IhE4hBgeryJwh8Bme1AyMRmw1D2rIvMquFyVPyApqu0bH5VmZXG
   hQ23zPtOoGTozQisPcXwvlltlXvf1mRw4j/Wyi32oL8t4s0UsNzuWT2ld
   kjQaqSWhscWyv8/ZfjvTlBBqhKb8ZMG2WvM9ZijbMpIqtdnLXfamgj8OY
   FkVi7KrFHpfTaY9UAicJ5avdEbdw6qhyMdeWr7lCzcIFmYzR7eLFSN+ke
   w==;
X-CSE-ConnectionGUID: /iyr4nFVTc+FyFiRWvgZGQ==
X-CSE-MsgGUID: rVJU94SGSzqzN7kK440VCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="61856370"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="61856370"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:21:45 -0700
X-CSE-ConnectionGUID: N/7289b9QyiHBtEPBGJDwA==
X-CSE-MsgGUID: JtgS+kDiQyOaY4gnmZIOPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="258315167"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 02:21:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:21:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 02:21:44 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 02:21:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXodpLz1ypWACOxjs5Y2yzW80sowbvJYr/aIvDxxQl+ZmlEnPh/FM7km0tAylRfL9xBtInzAJj8Y858Jm2zhRKRHmUnzF1EhKbTKFQI2W3H2H7u3Azyq/LSNGld25wR6ZzkEV7GWoU0rjEFQHWdwbcjwrmSZ1cYfU9cTJD32n45m2b7ipHs+R8ZrDySuZjzNS4x8hckwOdgZ1wXm/GCKgbO/QnWPyTk3m7KADq8I67kSJ3zcD09BbI7zMV+WtfRUXxDaO0XQpRKydHfAtD2/zMb50M3vACZ6k2brlpDiEHMgGQnoNAmNmy6s2bkIuix/XiCDq5L9HIGtfuc6UWp2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1t280Vnao4M3LdN6N1OEluSWRx5I9iIpTKM8xy2hGw=;
 b=iAyEiRaFvhPZh09LE1osOGyngK3EbAzskXqsUU+kRwDn6PCUsYxBt6m9xUoDJQA3Z6xCNEyUWZvjJYD3NV9587UfrVsWitiaYljh3Z9IRbiKP+526n6MrPquTuh9wKXSjStSm12Xge6Bn7WBu4QaR+MIv8bUbTIsz/228IdbRldaB8Xe0qt/GpP0B+/yhWOoO8ujD486aziCbOQVsKRT2TvptQ0nVwTWJJ7d3U7v5rVh52B5x2F61jD+Z4VUzMKX6Ea1LO66VZHgTSaYwtFySc5wCmyQLkmeZ98yngjbmpHWszjpjbC81JMJv80RBPa8IOoyR5voDkE1b1pWYhHjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by CY8PR11MB7897.namprd11.prod.outlook.com (2603:10b6:930:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 09:21:40 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 09:21:40 +0000
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
CC: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Subject: RE: [Intel-wired-lan] [PATCH 25/61] net/bluetooth: Prefer
 IS_ERR_OR_NULL over manual NULL check
Thread-Topic: [Intel-wired-lan] [PATCH 25/61] net/bluetooth: Prefer
 IS_ERR_OR_NULL over manual NULL check
Thread-Index: AQHcsKKfY2LGU59NIUyiYsEtTLG4YrWpD5cA
Date: Wed, 11 Mar 2026 09:21:40 +0000
Message-ID: <IA3PR11MB8986984785C5D967485333E8E547A@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-25-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-25-bd63b656022d@avm.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|CY8PR11MB7897:EE_
x-ms-office365-filtering-correlation-id: 7226963e-0fed-4154-d9cb-08de7f4f9a57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: fJZ5n8hAlyXDfP0YDfkDn7z6vFCt+GrYnz30UYmYjojmxfDFquyzt5QyTDe9wxdqAjAhxkFW2Dwsh5dNNRKcChxLhdRKRe62KmneDcetFkttgK9sacTWDioY3H/qcGKQt0jU1RL0KGZHSDKbCl4dQWRsQkJ/aZncoa53wbbuvAIP2u5/31nFdScaUFkhW9pe8nvCt7PZMS4psIDrtFHcWmgLBB3671Ai3D4BmI/qCX7ztZ3kQDVRACYTGVh5QN+QMSrkOukQxY9qTanZkqO2po7GSA3RClaD6r3Y9jAG1kNQPnWmBKjdoznlKfWWglhG4ixnfDw+qFL2W7vThVD3QzdZV977pmrIDWdwvbQMQ03yFfK4pHj5MHhRME2QT9h+ilPtEpTmroVd/xK3Aum6b5GfTsP+AgonPjB6YOXiVBRjMLI1/soSOgRQ4ii44eN5YCFPPpBWOUIpWss8FJNuzDsfrrVlg2BzHXyzhxErAL5uaE59wkecYdk4mhM3Dxxt+4jC1U1jmSeT89QQExeDQ9F4c4CNXoJR5IeOvpwKQEBuGT5gBJiX5FqkIAf6DvApKzoZm+UMesTjQ043jNazxStk4HQrlZv2KOknuMa8gUkGPQ/JSugLkJvRW0Yp6gxm1Yfe+JWNJjt4d3DBCO5WyGpR/VE87+/dPVqdA+iS0IN8GZKUT8ZZE0M5UBU64/hj5VE0KZManqnyMLdFj5guyHjfcuE4omOqM7zmo2WJ8zt4VMt4UtmobAt1OmMt15GBcD4JZpXEjdYM6U4gxEHxUet15xjMlPNmbP36pbe7Ewzq9O9A8ixqgObSPQNSC+0v
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnhKTG9nd3I5V0YySC9UNGpUc3VIUGZhdXRUQlcwQ3d0TFMzZ293V1kzWGNs?=
 =?utf-8?B?N1JKQ014Yld3S3dZbi8wVlFaUnhVNldVQ00vODNyWGp1enZWY0svZE45R3Bp?=
 =?utf-8?B?aHIrbGpCUEVZelNTSmxlTUhCNm5pek5yY1E4SmhJSG1oMVlUTXR3YjIyTE1o?=
 =?utf-8?B?QTNyS0hTbGNjalFnWHc0NEtSd0Y3TDVXWGtUcDJSRWpUdisxU1F0Y0FjdVd2?=
 =?utf-8?B?L2M1VTRWUm5FeE9qU0hwY1FzbzI3MzUvZk1uMGpXbndWTzVhS3R0VVNEYmE0?=
 =?utf-8?B?cEdsR05BdkJtUElxb0xocE5uZm55NUtCVTViNjIyR0hKQzBRcUtiempGNCtO?=
 =?utf-8?B?Mm1XcEZnbWNlOHpSWnY0WTJnSHNrS0Q5L1FvUmJnY1Bra1g3amJkMUc0Rmpq?=
 =?utf-8?B?Mmw1SnF3c1Jad3BsRkQwbG5YMVlNU0V1RENFV2FlY3JNMFpXYjN0TkdabWEv?=
 =?utf-8?B?SWFCbklENGRVTDNDYTYzL1J0NGc2MThtTkFMZXZGM1k0M211YUx0eTEwV3BC?=
 =?utf-8?B?OVNYcVdLczBxekE1Smw4YjNPYzdaWDJndEg1cTJMZFBKSzJYU0lvTVgyQ0JU?=
 =?utf-8?B?dnRmT0FreU92bkJXV3dzOUFqd1VRTnJZOTM3bXljNjljcUxHRDU2S25zWnha?=
 =?utf-8?B?TnJ6KzVzR0xNR2ZQNzFGNVNsRVduTllOV2hTc3ZVMS9FNklkMmVWTytNV0Vq?=
 =?utf-8?B?b3pnOXFPb3FVcXZpVEFOd25xNHNmYW9NeWFXa0VwNkdCNlpmZmNXaVFRMVl1?=
 =?utf-8?B?SXVQQjVlWmd5VFZiMk9xTXRhMUw0SUZiWjQwclpiNk11MktlSEpYWUZ6ckdk?=
 =?utf-8?B?U3cyK1ozT3FxN1ZZZlkzKzhrcTlDMzRRZ3lEMWFvTFp3V0hTOTJMVkhSWWFx?=
 =?utf-8?B?cEhVWEZ4RUNieFk5VVNBSEowYU9ua2VOM3RjNFZJbVZ4cFgyc2R3cHZNT3ZJ?=
 =?utf-8?B?SUJMY2k1RlZzbVRSb3B6ZFN4RnpxQS9mdkQ4RmdxMTVxOU1hQUxYU1JIa3p4?=
 =?utf-8?B?M3RxbHFWR1c0WW9QOW1aSkZ4aWRSUTczMWZPamt4QlNjLzBnQ0s5ZHVUZ3ZF?=
 =?utf-8?B?cnNlaE9aMTcxWWxSOXVIWjdaNWpKQmZoZzRId3hSMTgzVFowZHAzZDBvSjN2?=
 =?utf-8?B?bW9yS1N1SklheXJqVVRCQVpMbENrLytGdXNISXVHbFE5WnE3aEs0UzRpNGlr?=
 =?utf-8?B?OHdCYzRHTWhjdG55VVgxVTRQdlJDd3d6SFhkaVJWQUc5Z3lmZUh5UnFtTlVN?=
 =?utf-8?B?KzZwVnlqQ3R5dkpsYmk0dU8zVHAyUXh5clAzNkR2L1NrSXUxMFRMcE9HbEhS?=
 =?utf-8?B?eWphcWdmS3cwMUo2UUJqMDVMSUtTMlQ2Vnpab0EwNUJtb3lyWFh1RXZKbm1n?=
 =?utf-8?B?TkVWaWs0dCt0Uzh2Wm9pNlA3TDhTWTJQaStLRys3Q0gyYTF3bTNPQkY2dSsy?=
 =?utf-8?B?U1IzZEY3dnhSbXpHQngzUnNYb0JBME9KTWR6blVueDRTYzRTM2lJOUNXdVFL?=
 =?utf-8?B?WVhIemxhNTl5WGxmTk1BTkZsQTc3N1hTWFIzWDI4YTNLNGN6NGdNOTI0S2k0?=
 =?utf-8?B?bmNNNzNJbnptVk1BZlllVW1OZzRWdVhlaGRHQzk4eEtYclBJZmp1aVFCaFFn?=
 =?utf-8?B?YThtYk00b2hpWlVRKy9mMUxXOWVvZ0tnNHUxRVVoR3hoMWpScmF6TW9lZTVD?=
 =?utf-8?B?QU9Ub2Z2cDdna0U4M3c3RTEvdkdwNW1ieWYyRXNCcGUxQUJ3d3p1STM0R2ZK?=
 =?utf-8?B?ZmprNkxUNVR5Sy9sODllaXZPTGFzRThmRWRrOHo5NmJqK0FzdmRuaTc2Z0xI?=
 =?utf-8?B?NnBRK2VaV3cxKzJOMW5XWjJXcjJZUENkL1RHRGFOb2NVWVQwY2pYc2x3UzhY?=
 =?utf-8?B?aWgrelgyL1NUQzZ4b0JXcHFHZjkxQ09SNHZ0bkQzZEFNdkJYL0ppdWkrZCsy?=
 =?utf-8?B?Y3JER08zV0dKTEY4MnlwS1FqK0MzQUtQK0plQitNbmw4SDFjRzBWRWQ2ck9a?=
 =?utf-8?B?aCtpUU5HRVRWczVQS2FuT2tra1FtNkw0MDRESXRkZlIwam5tc1Vmc21kbzU3?=
 =?utf-8?B?b2VxUE5ZZ2JORllYb3ljc1Jxb2lrZlVsK0thb0FTWlh5WjZ4UlZ2Y094N0tY?=
 =?utf-8?B?OElCbmNKazdxK0ZQVEpsV1ZNOTNTcEdtZThuMTAzb0lqSUNZOUFNTjMzZEZR?=
 =?utf-8?B?M0JYa3h6NzBBcFpOd0g4a2dRU1M1c0JIWi9aVDhIcTdZVjVHZ3dzYjBVeXhn?=
 =?utf-8?B?SXp3OEh1RDlHZzZXRG9LaUJIYmhVYWh2dENYNlNiWW5oNnhmSVVFRGlaUzZZ?=
 =?utf-8?B?YnFRUW14RjJOMHZNS3ZFK08wUVNLZ0k3VVlVMUhYYTlVaVdONnFMOCtNaitk?=
 =?utf-8?Q?dp6qTd4tTyIr8nxA=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EKSgq8YxyB6SQjCJLYlEMyCI3jNphKsg/+Qj8bvXgpnOPyghf/rR8MM+q1SNVS4rhfFdDEHbU16vqV1PJF+ZgwX3bghoHtvlt9wI/QqzyHK2Y441h+FPRqe68t1OMy/31wxjO51TkQHuZXGGM9yGmtUGmn95KTo3N/pxYO2LbbmWzjcGvfqCIgCXmy0ufA/+MzqhNd0Lmk2bPYsbPy1EB6bSe+OL4aZactvdB4wdqgS+QgLaQq82yViuNZ/+NWU1oufNHIpKLPyFvIQoXQvx4Rc2C/ZlRQgzKYrWuz5goSXRUEuI7rontLLjHpP0W54mjZOPsSu3FCLdmJxxNiRlGA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7226963e-0fed-4154-d9cb-08de7f4f9a57
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 09:21:40.1727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KXVyM1udEKOqZuvOHaP8T8W4bTGeVYOjXfLAgEw/Lyi0EG1f9FPPOfFsv8kpQvm1q6xkaU61sKgabJVhEvk/ZHNb+mqLMIoMp777pmRqkgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7897
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_092150_615823_1912CC5A 
X-CRM114-Status: UNSURE (   6.90  )
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
> Cc: Marcel Holtmann <marcel@holtmann.org>; Johan Hedberg
> <johan.hedberg@gmail.com>; Luiz Augusto von Dentz
> <luiz.dentz@gmail.com>
> Subject: [Intel-wired-lan] [PATCH 25/61] net/bluetooth: Prefer
> IS_ERR_OR_NULL over manual NULL check
> 
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Change generated with coccinelle.
> 
> To: Marcel Holtmann <marcel@holtmann.org>
> To: Johan Hedberg <johan.hedberg@gmail.com>
> To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
> Cc: linux-bluetooth@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
> ---
>  net/bluetooth/mgmt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c index
> a7238fd3b03bb54f39af1afee74dc1acd931c324..06d2da67bbe14e17ee478aa939de
> 26526c333d91 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -4169,7 +4169,7 @@ static void set_default_phy_complete(struct
> hci_dev *hdev, void *data, int err)
>  		mgmt_phy_configuration_changed(hdev, cmd->sk);
>  	}
> 
> -	if (skb && !IS_ERR(skb))
> +	if (!IS_ERR_OR_NULL(skb))
>  		kfree_skb(skb);
> 
>  	mgmt_pending_free(cmd);
> @@ -5730,7 +5730,7 @@ static void read_local_oob_data_complete(struct
> hci_dev *hdev, void *data,
>  			  MGMT_STATUS_SUCCESS, &mgmt_rp, rp_size);
> 
>  remove:
> -	if (skb && !IS_ERR(skb))
> +	if (!IS_ERR_OR_NULL(skb))
>  		kfree_skb(skb);
> 
>  	mgmt_pending_free(cmd);
> @@ -8277,7 +8277,7 @@ static void
> read_local_oob_ext_data_complete(struct hci_dev *hdev, void *data,
>  				 mgmt_rp, sizeof(*mgmt_rp) + eir_len,
>  				 HCI_MGMT_OOB_DATA_EVENTS, cmd->sk);
>  done:
> -	if (skb && !IS_ERR(skb))
> +	if (!IS_ERR_OR_NULL(skb))
>  		kfree_skb(skb);
> 
>  	kfree(mgmt_rp);
> 
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
