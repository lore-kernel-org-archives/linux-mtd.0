Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C0EC2D0CD
	for <linux-mtd@archiver.kernel.org>; Wed, 21 May 2025 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5+C8Lzm1tfvIBLHbqAwCxJmxGqRhg9vUCNf6JH+7sM=; b=VTC0wPBrHfQYsX
	4F3ODVEoj6rI6R8ohd5f6VUFcV5Pq7SFa3jw2lHLwkf6oR+6+FxZtkDorXvYt93qKryTSVem7bMQA
	nVCYl1YiUa0tTPWk9ZjBW0Gt2nC4c5fSs+WYD1pPepiqt1CWQi4LlPcsvdgdJ0RKwNhxr9jVQijuH
	wUoV69hXcjM0K15A0E/cydCmyCFK5Fe1RWJawyE9lXIfP4Ful+ovl8SvZsrvdgPwy6E1w2Hx6UNTW
	i6tuuSy+Bc8efyTtK2ruoBf5d5NfmvScNt3gsiE+4xURDEe1X5lgCQEehlN64avmCdvkmEISmWr3v
	TZ9S5Hq2znpw9tlzOemg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfma-0000000FJtR-2qBk;
	Wed, 21 May 2025 09:30:40 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfc1-0000000FHkJ-1aMR
	for linux-mtd@lists.infradead.org;
	Wed, 21 May 2025 09:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747819185; x=1779355185;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fM5kWlQ0eo3blkPIm20nBwyWOuX+EOANdNJaHhEDfEk=;
  b=XQ9ua0mjeplaHngb7UoH4t3UZse9sUEZIFCCI54RW6z1vKeCxmmK/pur
   Hswgzf1cIWxyJvcwyUOlIlMmXVlrdN664TFzzAQ0mJh/AC3mdV7m4H8KP
   R6ZKt+KweV97PwbGt9qlp9soBV1JB4VcmRaPUqBatYn+iboya2HM0kgBh
   DhcN0+wSKXwfgTPVzuRlZREcRExhyVfAq362HMbqH0IUz/IFz7PcUfmsw
   TFQhq4ttsDQvfRLCWsy1U/q8AJQhbRto7ZgHb2LZnmipj7lI/QYup5Ksj
   0w9guPe3ORCPz55MGCLkMNcBJFpLgjOl/Ey6oIwx3zwlKYwXO+/Ave6Xx
   w==;
X-CSE-ConnectionGUID: cG31IrE0Qyi0/7Iu9Yx8OA==
X-CSE-MsgGUID: 8wf4ijZGTLKZ7Diu08Da7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60446338"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60446338"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:19:41 -0700
X-CSE-ConnectionGUID: 65eJMYn2QIKfivvDDqiLIA==
X-CSE-MsgGUID: OXvDr6ZqQ/G3jUBqmbZ5pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170984299"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:19:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 02:19:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 02:19:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 02:19:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWGmQICVDUVZsul1NxrHv0n1ZVilFK1oG+OnbNr6kMP7hn5ALVgyVwifuz1pXhDFcS8fcOi5besyBCkkKBwfRTt8oiioDwbqjCmU2qy44BhjbN9SvonzcesFRkZXRjHMFXeLwGeQVE+DSm74AW3WAiiolP2c4kqPI/4hjU5gIjz/sLqBFwZ9E2pAXVavEq6X/VGnz7UvS6kiM7mnVFg2wMnLatBoQe/2rxASIhhz2Uxr+Htcwt88+DuMOBABwx49hAsK4Tj4WpScu4U49qG5jTVMf44LotiDpyozdXjPvjhZnYQre90aPgVDokT/ZSAOQuZNGdZMCQjw/3hYqOEpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fM5kWlQ0eo3blkPIm20nBwyWOuX+EOANdNJaHhEDfEk=;
 b=mVXdaPujT6mnkR2gc9onN+/PH/aNaXvPlEbqrsmQAHdsiyfRvFBIFOuErLMZ8ykqJDJa+Bcwybu5yC54LJ4d0duuTfMrON+107dt8gSFcoaphLUMmRX9AhUqsFOK6JXeYHWur8CQ4z6C62wmMdV5D/2+xCgH4O+zQymG39w0oLet0Wcv0dSTwvNymUA1MF9wwJpDSJ4QldHQoJYbsRkxvGNcQZkrcgg+3rKxZFU/fltffAHSBwfSlAZRrFnyXqpMy2xgnoqYj0cGvl5KWYGCX0DjW/3vF72LJ0kGIOGP+ORAZlLJGblqpwzOBjgmz90aymCSkLNmoUjODaCJps2Jnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DS7PR11MB7737.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 09:19:36 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 09:19:36 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
	<thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
	<jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
	"Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
	<reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomas Winkler
	<tomasw@gmail.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: RE: [PATCH v10 03/10] mtd: intel-dg: implement access functions
Thread-Topic: [PATCH v10 03/10] mtd: intel-dg: implement access functions
Thread-Index: AQHbxaAAGk0T3Gb77EOFbnNMirDIEbPbzroAgAEIt0A=
Date: Wed, 21 May 2025 09:19:36 +0000
Message-ID: <CY5PR11MB63663A454365B4F8F6292BDCED9EA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-4-alexander.usyskin@intel.com>
 <aCy8ZJq4eDMDQukx@black.fi.intel.com>
In-Reply-To: <aCy8ZJq4eDMDQukx@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DS7PR11MB7737:EE_
x-ms-office365-filtering-correlation-id: b857982a-9507-4948-45db-08dd98489b14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cTFCWW1mdnFMUEJVa0VreXYxQ2IvaU9BVHQxWTU4d0ZXZFl0OFk3NjVUMmZ2?=
 =?utf-8?B?WElOdEZRWE05eVZ4d3NpQjdVQTd3RDk1OVFOYnFvTkd2WUUzbkwzMWVlQldI?=
 =?utf-8?B?YXJOUDlJRkt5Y1h0VlBQcW53YjZUZlpTcjA4c2JtUVAwVUxPejNJTjY2Z1dp?=
 =?utf-8?B?c254RDh0VkhDdlJ0bUEwaFllQjU4OHF2NWloeWNTSTMzdG93ZW1GNWhrbEx1?=
 =?utf-8?B?WEJEclpRREJiTXAvT3ppd1BiVklmSEFTUGZCNHJmV3A5QjE5MEdXRnVkTHlB?=
 =?utf-8?B?T3Q3MDRkK0U1b3U4bk9mUkFRZ3Y4dW1XTHJzU2hhMFFxd2VtR3RTZUl2T0F1?=
 =?utf-8?B?ZFN3VU1CSVcrNzI2NzAxZThURWl4M1FsZy9NVnB0L3RaRStpMEdtQnNMNXEv?=
 =?utf-8?B?T3k0UnVnaGhRL3I5SytxVXN3VTV2SjlSTEZBd0QrTnlRL1FmWGMxbHljYlN1?=
 =?utf-8?B?YldrNzVCcVhPVTVmcGVaSCs0TTduVjU0TTA2bjZuR3FVbXkwNkJRd1g2OERz?=
 =?utf-8?B?NnB1TC9nVVFaRzZwTG5iSHVXd01jc0tPV24raEtuUy9VdUpSRlkzT3d1TEs2?=
 =?utf-8?B?TkJzbm5KdTJPeVhmcDhLTzcvdmV0UGE3WU95NXNtTy9OcVUya3BaKzRBblEz?=
 =?utf-8?B?L20vUGZBcFVVdFlCcWhNVDJsYTl5Q012MkdYVU1VZndiYVE2MW9FclJrMVBv?=
 =?utf-8?B?NWVrSEs0YiswdFQ2Tmw3WU16YWU5UmtPTXFEUnRGN0FRblZteDNXbmJFNWNI?=
 =?utf-8?B?M1luNWpHMTIxRy9RL1lRSnZpTjRsVVY4cWJmSTZTOFVVYTFrVFA4c3pPVkFJ?=
 =?utf-8?B?WXlpUW91dysrUVJISWhsek5qc28zYXgrVUl5eVlwQVIwbnZjdGVieHR2RFIy?=
 =?utf-8?B?Y0pDaUVxYnlVVGVRdjJQRHNmakUxNmpPbWZ2VzNsOU9Fc2o4SW9wY1hsczB5?=
 =?utf-8?B?YzlDdkxUWGJuUWEyV0NOdjBwdHZYMmhYL01KOUpWT05hZGVZOUMyNEJ0MS9v?=
 =?utf-8?B?NFpFRjFhWUFvTW1QTHpRTmVhRlpQTDN4WVpkT2dQbzhLQUtSV0FxUVBDbk45?=
 =?utf-8?B?RVBmR2NqYnEvbXlQTWYvTDNnY3o4RnFRUERNYU9RRjkxYWdsQnVqUEJCNkhE?=
 =?utf-8?B?dEVqS3pCMkpHQlNtZER5M2U3Tml5VkM4OFhoaklxNE5pdGxGcTJkYk00ejhP?=
 =?utf-8?B?c0FUWWFSb0l5M1JrVlhBQVZuR1ZHZm5ScXRJWmdFSlZHbkczOFZqQVFkbENI?=
 =?utf-8?B?UWJlN3N3c2tUSkZKRFFEa3NDaDlYbmx6bVNKeWh1NTQzaGVLcXJrZlMvb0lM?=
 =?utf-8?B?WlV6RllmdCtWWFFja3RBazgvL2Yxby9Lb3QxTGozWVcvaTY4OXVNakVYYWNR?=
 =?utf-8?B?SEE4TllTQVNmWVIxRGVFaWU4ZVg5NXUxNDBqamZXckhiOGVJdnVYSktZaXRP?=
 =?utf-8?B?NHpHcmVqMTlEUEtlTkNpV2NUS1hDZmZFVVpoQmNXQ2NkbzVGN2hEUmdlRDhm?=
 =?utf-8?B?WTg3M3RlNko5OXl1bnNadE1YcEtFcmMrY29hVU4zZXd4cm5lKzlhKzhvempW?=
 =?utf-8?B?ekJNaXZYMnI5ZDZGbk84N2pvbFlkWVNhaG05TWdtL0cvRS8zd1hVcnZRUW1p?=
 =?utf-8?B?b2hKeU0yV1ZBUVViSFBRclhkdlNrTkpvWGJtYjBqZkNsYzdabTdBbE43T0Ri?=
 =?utf-8?B?SjNqVTIzd1JFL1piTWZmTXhybVJLcWJsdEROQ3ZvM1RlSkpFVDV1Q091Zk9E?=
 =?utf-8?B?SDVuYVlGbVJPSGtNcnJSN3dPQ042ZkFKcUpIeGwyT1pDNFQ5Wm1kb1Q5VlBO?=
 =?utf-8?B?RUtvajIwUk9kbTUzVjRtbDZrK2ZvM1NUdVR4eXNaM0Y4WWZnMVAvVFAyVml5?=
 =?utf-8?B?RjZ3ZTdNNEFSZ1dJekdLd1IzS3NzUW13bmp0Qm51QlZJM0tiNUpTWW1iRVN4?=
 =?utf-8?B?YWVLTzh2eFh6TjJUdjRRMlMyVlFqNXplcTMwNUgvRDJqTEJCeUJTQnVrOUcw?=
 =?utf-8?B?RkVHczZqdjd3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTc3S2hmdjFJR0NOSFhaSG9ibGR0eUN6SjZwWCtVK3B3YUlKbnhSMjNYK3hp?=
 =?utf-8?B?dHdtNXplT3N1bm5QelBxcitKMlFPQ0FYK1diMDF4d1BrdHpQbTNCdCtmOEJR?=
 =?utf-8?B?NUFTYmdWbWdSVTREWlRHMGMxc2FEenNPcnJTWFFGQ2ZBRFQ1V1hTK3VYYkkw?=
 =?utf-8?B?N25xT0FIc1B1YUdWcHVHck9qSzFoQ2NtQjRWaWdMMWNwWWcyYncyVGFMdU5v?=
 =?utf-8?B?eVVuOXRzdjhuTWxubTJrQ1dVVnJFcktHNUgweGRsTTV6bW4rS3RsZE1lZTVP?=
 =?utf-8?B?QkFOSUIyOS9PZWozUW9sLzdGN2Z0a0dmQ016MEhxZzdMaVhmY3FhK3FLVDB3?=
 =?utf-8?B?RU1Ua1M1TnllYm5ET1l0dWtmcXJJamxlbkpueEpwRkFKdVQ5VGtOdFh6d1FY?=
 =?utf-8?B?Q2VwSzBwbXp3dTZmQmZlWk9rSnpIUHI0bGkxT3BIUTcvRVdkZkNuSmdaVGIv?=
 =?utf-8?B?K0hIZ01GcjdyM3V6alo2UHl1d1gzQk9wMXc0VFBWcEhKRHpNQWsrR1dkajBj?=
 =?utf-8?B?MWhvLzF4azdzVmRzNXFxemVqdFI5N0poczdiSDJMSGk0dFlpTWZuc0ZWeXFX?=
 =?utf-8?B?MUI5UW5LRnZqUmpudlNTMW9wME0vcW1YeE9iaGVaL2VKOWYrZXQ3Ync3endD?=
 =?utf-8?B?NmdhaXBGdzZIVXoxV1lKVmU0eGhKdEZzY2ZQWHJUanVUc0tUU04wQ3V4SW1N?=
 =?utf-8?B?ZGZNMGc0Z25NNDQ2bWRlVGZhb2xUYWV4U2tNUThUTkd4MDZ2ZmwvL3BCUnM4?=
 =?utf-8?B?NlZ3ZUFkWjAyN2NGYmpuWlk3T1AzTy96akQrdUh1TDVyR3N1eTZ6Q2k3RExo?=
 =?utf-8?B?a05neWllc1FOckNFeEl6RHQrMG04cWFDTUNyM2FmNnhzZ2xsTnkxRUZPUFFH?=
 =?utf-8?B?bTBoRXhrdUY0TjZqNDRnbVYxOVliMEZmTHRXUW5rKzBsOXRXSGxCUjhFTmJi?=
 =?utf-8?B?VE1IOWFiOTJuUjJLMzhETkE5bFFtREtKdGNla2xmcDJhY2M1YWphRG9ta1JW?=
 =?utf-8?B?cWc3ZDdpb0c4ZFN6Zk9Rek14UTE3UkdBY3EyWmlVSTUreGJzWEVwOXFWTFlJ?=
 =?utf-8?B?NTV4dkNFUXozRTBZT0RMT29YVjB3OW9SUGRZeTIyRFBBV1RjdktCVXFaL2NY?=
 =?utf-8?B?ZHBMYzRyeXdWYmdpd2ZDTWJPTzBrK1k4bEdrNFE2Sko2QjNRdzZXd1AyQVJ4?=
 =?utf-8?B?UmFCUWdZMTd2NnRyZk5jQ2l1Z1o5VDIreGxvSU16VUxYK1A1Tld3c1Z4T2s4?=
 =?utf-8?B?QXN6QXl5bnN3QWxIbUNmb2RsQzZ4K08xNTZzaWpkOGU0dC9sNDZ5Q3UvdFR3?=
 =?utf-8?B?Q3RFTFBqR0RXbGNXL0dqZmU2L25wQzRjWTJObFQ3WVhVazNNbHpsaHdSWHRn?=
 =?utf-8?B?L1Q1SGJ3VzQwOUNZZEM4M1ZjQ1lGRVpub0NIbkQ2UXNTZFpaaHlVQWtIOEhq?=
 =?utf-8?B?OVpXK3pNcE1XQUxZa3N1WmgvM3ovaXFRNWhYYkNBMk84VWF1d0FxU0YxZGdD?=
 =?utf-8?B?REJoVm9ibG1vbEVnQ29GbmdCSUU1QTc5bkdGWmJGMVRaSDlEd3pxQStWTWFY?=
 =?utf-8?B?QXRNTU9IRWQ1MjV2d2VpZ1g0U1ZWSVVtMUVLR0g2aXhFZjE1Y2VyZFM2c0pa?=
 =?utf-8?B?UDJWVjlmalFMOUZOQkFFR0xqQll3TEhTUEw4U2RrT2R3c0g0clZtQkFDa3l2?=
 =?utf-8?B?aStWa3FhL3AxZG1jVWN4WDJnYmdqaGsyMVRaR1Yzb3FnSFFxSDcyb2laZXlG?=
 =?utf-8?B?TFB6UlV4cXJwWEFIK214UW8wTzB5MjZoS05rWjkvM01mbE1vd25remVXY09p?=
 =?utf-8?B?NUdaTW9TRnJORkFpZzVsdG80enZ0SmRlS3Q0R0E5R0xNK3RmN09qNGN2cms4?=
 =?utf-8?B?cmJEU2pHMTV0L2czem1Dc2dqanM4Rk4wWWgwR0hTVW1LWDJjZ1NCR1JCNEVx?=
 =?utf-8?B?TUQySmpaZGRXUGRlMlJkSW8weUxmK3kxdUoxQ1RKMllrRHdqNVViMUNCYmVi?=
 =?utf-8?B?LzIvMFZ3eGowVlhNMko2dDBvdFg5ODBGRmFpUW4xUUlYMDFuRHM2a1Fhc3lC?=
 =?utf-8?B?Wk9xZ0hIbmpNWDR5UUJNK1FCWFd6SmRWRUZGYlpHSUlPN1U1VDdIdnhwTjZE?=
 =?utf-8?Q?+NE3jZ5uVw5Z7TVysFdYdznPR?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b857982a-9507-4948-45db-08dd98489b14
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 09:19:36.3280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mf69SNEIb4/TVeHFzlOr+cTYiGQxf+3wPclgTo5c+Plovd8MO29u+Lq2ezyGG7/ncM985Vo2PgwTF+TA1A45eQWGNdUY/TBRpC0IWeFDFqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_021945_431971_0BFDCFB4 
X-CRM114-Status: GOOD (  19.75  )
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

> Subject: Re: [PATCH v10 03/10] mtd: intel-dg: implement access functions
> 
> On Thu, May 15, 2025 at 04:33:38PM +0300, Alexander Usyskin wrote:
> > Implement read(), erase() and write() functions.
> 
> ...
> 
> > +__maybe_unused
> > +static unsigned int idg_nvm_get_region(const struct intel_dg_nvm *nvm,
> loff_t from)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < nvm->nregions; i++) {
> > +		if ((nvm->regions[i].offset + nvm->regions[i].size - 1) > from
> &&
> 
> Since it's already off by one, I'm wondering if this should be >= ?
> 
Yep, will fix


> > +		    nvm->regions[i].offset <= from &&
> > +		    nvm->regions[i].size != 0)
> > +			break;
> > +	}
> > +
> > +	return i;
> > +}
> 
> ...
> 
> > +__maybe_unused
> > +static ssize_t
> > +idg_erase(struct intel_dg_nvm *nvm, u8 region, loff_t from, u64 len, u64
> *fail_addr)
> > +{
> > +	u64 i;
> > +	const u32 block = 0x10;
> > +	void __iomem *base = nvm->base;
> 
> Reverse xmas order (along with all other places).
Will do
> 
> > +	for (i = 0; i < len; i += SZ_4K) {
> > +		iowrite32(from + i, base + NVM_ADDRESS_REG);
> > +		iowrite32(region << 24 | block, base + NVM_ERASE_REG);
> > +		/* Since the writes are via sguint
> 
> sguint?

Sgunit, I suppose - will fix

> 
> > +		 * we cannot do back to back erases.
> > +		 */
> > +		msleep(50);
> > +	}
> > +	return len;
> > +}
> 
> Raag
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
