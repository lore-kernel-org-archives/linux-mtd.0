Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F9FC3ABDD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 10:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJBLtI0ySPrPyb7WAQSa1Jjj4qHBNDibXQ0tvAIHmvM=; b=fPWUmwFArOdqIU
	uMAzsc9OCi2JTyFAGwoGcoBX+8h57oEKsYEjUo86j1KVMXetKw9hDaMSmZG7Mk2vY4jcWNCY5JJLu
	jjMOZOsBIpn0m6Dkj4Yp5EebjE98nrm6U4GU3vdJVBgJ397WTq8j4rO6yj0OT+y631o2btymnJ1NM
	BBd3K4TAsS+TfSjWv35LvMEVPsNjxPBAORAhuWAT8RjX37KTs80Hb9M/4k8zdLiLsLdayH3nHjLT6
	vA9BGkOuDl075lQ4c2Zs8+06akMjFzUBDoUWZ4MztQejjLMDrEdokPWHP4/+gJkH/famObUo3i/Mf
	6X6trwQaY9TT/z3j++hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVvD-00000000JCp-0hsi;
	Thu, 15 May 2025 10:34:39 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVYy-00000000GRG-1GD3
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 10:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747303900; x=1778839900;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+6+P8jtnqeyljsXA5/wbRmpV1r05AeLneBVkjoc+ycE=;
  b=J1QxgTbmPsLabVV0hcKoEVuvIJIrKedVtwvftTlHQP+OBidfwuumB0Pb
   0PIjgxFX8jnX8ozcfKCPGF691CgJAKScpwhV1MZceeKACz2Ngdh59I+Hn
   m8bI3TOfJf+10EPvK5MIMlzLIvZ/uPiMyyLKAVAdt2bOZLGb7IiVRqihl
   LNS0n14n5ApV6oAfGmAbPhj5rLrYkdjHGU4p/Y3+Cys5AUmmGui+5DQxN
   j0o7y9iDjkY+2wqIFriDfFrGnnxEkas4Difv6i79ir4R1ADjJb4KVqT9H
   LvH6/59R2Qm4mNMJfU2t3caGbtIgI0PYf/P9Y/sWBrpvjy/mUYQHlq42h
   g==;
X-CSE-ConnectionGUID: antNKsBkRmefwAD/KZmY7w==
X-CSE-MsgGUID: TnAcCa2GS3SFqv5BMN/I7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60244877"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="60244877"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 03:11:38 -0700
X-CSE-ConnectionGUID: HYKTny93TYeorz1ID+s0KA==
X-CSE-MsgGUID: d/phchwBTYScTegC5ui9rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="139223606"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 03:11:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 03:11:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 03:11:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 03:11:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acBm54m5kQAzomWhWtmA/mKrMljMZg72JHhGC1z03BotaGRutbVptU7jogsMQoID4iCI6cFC45HB7aVAqltgw09m28Dr6fUGfqVRYZxPogi1h8y+KXSQ4o9r4CFNcXVfBoKmySumc/6xKAKBhMDHylUcSqcj3xP5oX3hEMMIbLgzAtWDOI2wsRS/gVacRC5I54RlDVnoIVrQbOJb8TAhCokzK1sbrpp5iTQ8QZZZARqLUN/e7DmqJA9aB7VVTIzLyecDDfFD9alftm7Xt18o4FXbBRaZOmx4bKmjQ4qFZkEycjuwzSIu+Pd4BH685Ti4vpD0bb0GSJ4ZbMWijefTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6+P8jtnqeyljsXA5/wbRmpV1r05AeLneBVkjoc+ycE=;
 b=DOlTe1GKvJ6hfAXFN4+rntoSSbn7imgPvQi1hI1Gars0L8i3MVtxv3yDh6oqBueXvwVlNVoDnzMJb7URhagxkdT049HHV3qCrs8PyWj5Xq1jK4wkDkkQyJus/tz/AR3Hn3j9oUvOzehR++Tdf1dgB5tt2CTGGhhhEB73uM2a+YBHAUaVTu2vEgFEGk/QR/mtmVaV+aFMgXw35AhwoL7jPhBAm0SgLSj8+kfYc7hZNSCYV9HeyZTgkoAovlsML8g1QthaclZKx8yy/Wm7g82yFBSvdJp5LiaLTVNULVPcvPD95Upqus8/A+PXxBljAQZAniXrlSKWztQoQuW/CCuhZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by IA0PR11MB7751.namprd11.prod.outlook.com (2603:10b6:208:43a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Thu, 15 May
 2025 10:11:08 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 10:11:08 +0000
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
	<tomasw@gmail.com>
Subject: RE: [PATCH v9 02/12] mtd: add driver for intel graphics non-volatile
 memory device
Thread-Topic: [PATCH v9 02/12] mtd: add driver for intel graphics non-volatile
 memory device
Thread-Index: AQHbtR4bMdUBeR7EsUy4fNjydqIKobO6aL8AgBkeP/A=
Date: Thu, 15 May 2025 10:11:08 +0000
Message-ID: <CY5PR11MB636656BB76C04BD77F0ADB25ED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
 <20250424132536.3043825-3-alexander.usyskin@intel.com>
 <aBCcdPbIxthARrMj@black.fi.intel.com>
In-Reply-To: <aBCcdPbIxthARrMj@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|IA0PR11MB7751:EE_
x-ms-office365-filtering-correlation-id: 69bf7e0b-1ac2-49c2-d9c5-08dd9398cf75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UzEzakloclZHbklIWVdMd0xLY0lnY0tMcjlqRmt2YkJNNHRTWjQ1V2VLUGgx?=
 =?utf-8?B?MUdJY2RqQ0tVYkJBWC9uZzZJcEhmcWpQNzRLUjFCTkd6ZjFRbm95RnlSbEVy?=
 =?utf-8?B?ekptUllpTnVrVmVtRHFad3hmVXlSdVdpdTZCaEdRVXRRblZvSVZjUVc2R1Nn?=
 =?utf-8?B?V3lYUlVFbE42dUx0N1FxSG1aVGUzM3JvWGZNMEhVcXJkWGhyeGZ1NnVLbmxZ?=
 =?utf-8?B?cVZaWDdUSkJwRTNEcjNjTlVjSDM5akhVOVpzYyt1S05OblNsMGdvSHc3eE1j?=
 =?utf-8?B?bWF4RkF1eEFVamEySVdtZUVFYWRlUERraWg0cEN1M3AyTnY1SlYrd0hDU1R0?=
 =?utf-8?B?TTlLZGFKaVBmNEZ6dk51aXYwc29HL3dqNWZnTGdIMHYyVENDaHNGMFFtVVh2?=
 =?utf-8?B?R25qcXRDcG0rZkZDMVNUdEd3TzA3YUxhMUt4NWloWXZLbnpVdWtlMm1aWk0x?=
 =?utf-8?B?MXdHRHE3RzB3RmFodVFjZHhjTk8rMzJDYzA2UFk2U2FFVEMyaXV5Q1gxNndL?=
 =?utf-8?B?NGljUUtQbXVJdW1IUnpIQ3R6U0RnZXhYbzZscVMrNWI0M1IrendSU1RpUVk2?=
 =?utf-8?B?U3N5WlRyMFV1NDFWNnBsMW1WV0pzQW8rMm5JUUJwa1FYeldyMGdzVnVnakor?=
 =?utf-8?B?SW1kR3pEckVxWldFY2svYUZqVHJwbW81Q2V0eitvQnZkWm1pNGhaZmx3MjMw?=
 =?utf-8?B?V2VIMG5IaldXWk4rN1huS20rcFJDQUhLSzM2YUVlcm8rbHVaUWtGRWJJeXVo?=
 =?utf-8?B?YlY0TXpEQzIyaE5md21yQktzc0haMFFtUW5PTkI1OEEyRkFZTE53djNIdWFD?=
 =?utf-8?B?UXMyazBwZmVMQVZQVW4yQVhKVXNTb3dCaCs2ZkIzZllsUG5oRm5qbFhpNVFr?=
 =?utf-8?B?MUVaZEEzbjFreDJjL3piYmRwazZrWFkyM29HYW13WS9EMExFWE1NZmZlemdV?=
 =?utf-8?B?bi84VkZMSlROOG1oc0k5aEhVWHJ6RnoxaGdjRk1tRnA0SE5MamlmL2lIa2ky?=
 =?utf-8?B?c0Z2ZTZvZWhHcU45ajJzbkJZWjRxTnA1T3ZPT3FTYzYwUktGcGhiQ3ZzMlls?=
 =?utf-8?B?OXNDYVBKdDErR1U2cHREVzBWbm4wNmluTFVqTUhqNGppZkdhNTBGZWlPSUVT?=
 =?utf-8?B?ZUx2NEg5b1cwNVJUWHFoRDZ2Vi80K3ZKTEFhV0swWCtuYXJrRzJieVM3Y2gr?=
 =?utf-8?B?U29YN2VRUzZUZEFFdmdrbXQ5YUtqempNbUZpM1Z5elpINFFHU3p2ZWtqM2Yr?=
 =?utf-8?B?TnJlWEdTeXcwWWl5dUpoYytvY1lkQnRLMjljOGMwSUIxV3pzb2Z0OHUya3ky?=
 =?utf-8?B?TG5TeDRjdjZQWUorUTQ2NXVhT0xCQ0UrOEJrTjF2QXhzcUVINklSMkRscjk1?=
 =?utf-8?B?a2NjaCtkeVV6WkpYNTUydk5tOW54d3V6QXpzVml6VGd0NDM5aVd2Vm5PV29I?=
 =?utf-8?B?L0xzcW1GUERydlh3TVlISmg5R2ZJdGhTNGtGVVB5RGRTV0k2M3phRkNFcWVU?=
 =?utf-8?B?T0NFWnFESHVOSzJ4THlMS1plazBwZUdhVmJSU0lqLzhPelBZTjJKS0JsU20r?=
 =?utf-8?B?WXdGa2d3YTRKOGp2cndNYkNHUG5GU0Y0T1V4SS9uMk0zekl3OGJtaWhFbXg4?=
 =?utf-8?B?T05rMWZWK29mV0tuZ04yRGhCNjRyWWVROWF3anZlcDJtbVl5WTRRN0NFMzQr?=
 =?utf-8?B?UG1RU2xWUVBEbGdhbGx4S1R6T3JpSzJrOHhmYy9uQjNKempPOWZ4aklIZ1V0?=
 =?utf-8?B?U1NHSnN2NkhTWnB6TndYZ2xDRmtoSlpmQjJJeGtBUUdYYVRhSTVLQVRTRWJl?=
 =?utf-8?B?OERWalVSVTZYbG5QRmZWZWlPT1lybmpSVXZIaW5tcXJMNGdmSUQ1N0YvcUg2?=
 =?utf-8?B?dXZYMGFHR1RnemtGWFBiQU1rcmdZOG13UTFzUXgyK2syTmJoZFdlTDRBUEN1?=
 =?utf-8?B?WExiWDRxVzFxRkRmVUZsK2N2ZzFUTjFndGZ1RGpQYUp6YmFZUnlYTmJOMjB0?=
 =?utf-8?Q?cBn4yX+gA/UOL4QlXyrUxN391qB044=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHdDU0QzSkF5Y2lvOGl1clNNM1IzRC9kMjRMN1pNLzlkTjZqeVE1aEoxTmVI?=
 =?utf-8?B?VHZlS0RLaFJaTGR5SlYyR0NKMVgzL2tob0dTY1RpekQwNWNFWWV3S3RuWnRl?=
 =?utf-8?B?UzJ1RVJOWnYyQ0hJakhTTnAraTA4ckhNdlJGOFl4TEUyTlRlV01JK01Oc3VO?=
 =?utf-8?B?dDdOSmpSbklHc3N4UWUxN2R6aXlKVFFkS29WRWFQSFNERVBFVkV4NGg1OHZs?=
 =?utf-8?B?S1AwS1BEcWRnT2NzL2tjaVMyWGNEMk1DZGR6a0Z2TkdZRDBYM2xld2FNc2J1?=
 =?utf-8?B?dC85MWhrRCt4cDFlTGM1a2NyY1BGRUUxQVJWbmhHa25QdW1SL0ZsbVVLS2dw?=
 =?utf-8?B?M0s5WDN0LytyWk5ZZmVOa1JmbWRValBkaGFGVE5FdnhPczR3N2FvOEZ0ZkEw?=
 =?utf-8?B?R3lJbVl1Y1EvMGpnMi9DWHp3L0hKZkd3allyZDVSV3E1ZFdVZ3I5YVhmR00v?=
 =?utf-8?B?QSs4dlliTEhHWCtSQUZiTEM1QkEvM0k4cENLTFpYNXFEaXZKZzcwMVpYSDBm?=
 =?utf-8?B?NUNHNmZGOXpsdXdiTXRUSCtSR3BPbVcwZkR3ZmpiSzhiQjJ3K0I0cFNwall4?=
 =?utf-8?B?SDR6RCs2UFlPdmUySmlKR3kyQzczUHk1bTYyOS9WYlZBcDJMSXBvZEFpMnZ5?=
 =?utf-8?B?eVpSVDd5cmhXdm5WQmdKOE55SFIzRytJNStwSXBzL0ZmV1gwL3c0V3R1d2dj?=
 =?utf-8?B?NFlwalVBU3FWSHBubjlPRFFFYnFTb05jUVROSmxLWmZ2MTJoQ0FzVW5rdEk1?=
 =?utf-8?B?VzhpdTZWMEFwRUNmdUVKM200QzF5OVBCbXpVbWE5V0tTREsyVEM3TGlBVXVB?=
 =?utf-8?B?cXNHWU5IenZ4OTF5WThjSW5aSXJUNWRkWkFKNGltRENDN09MTy9yM2tOZUJN?=
 =?utf-8?B?M2xNSEhqd1Frd3IwcVViS2I0ekRoZ0ZSajJNQ1pXZGhCbCthVEN0bkdQVG1Q?=
 =?utf-8?B?SzVvaGR0UmdkTkdSQVJSakl2Tzl5M3p6Z05CSTBFZUZ5UVQ4bWE1YStVUXhr?=
 =?utf-8?B?SGxZT2tBbW4rTVZaRnlRdlJSZlhpSEdvQjdWWnA0bE8xNGwwdk5ESVkrL0VT?=
 =?utf-8?B?Vm03d3JZRm8ybWQxck1hYmFZMGptSGJja21QcGs1T0RrbThvTnJMWmNmb2pM?=
 =?utf-8?B?NURUUjVqNDdHR0VGWUtzQXZXZWxtRENCZDNRdXJ0S25nSVVzZ3l4NlBrNFBH?=
 =?utf-8?B?ams4R3BQOThPTXhPZFU4STNnSHMyN1JOZml0bDcyS3R5QWsyVnBGYWhlOUtx?=
 =?utf-8?B?cE1qNG94MUtUWW5XRnVoWnpTeVVSUFFyOXY1N1RSZHVoMTJEZUUrUjh2cEFy?=
 =?utf-8?B?clVlUkI4RDhJL0UwdmcvUS9yaDF5WkQ1UEN3dWNCWUhFVExYZzJxSWhQak5F?=
 =?utf-8?B?NXhjeDhWUG94MUNKTnBrM0YwcWgyem56anBhOG8zT3BBUU01dlNpbUxYKzVj?=
 =?utf-8?B?bjFITnROcUxPU2NDc3pqVjZxNE1mVFNUUXB1NXA4NXJPajJsOXAvY0lQVFBn?=
 =?utf-8?B?bC9nSVZzTnJ6WmU1UGQ1aDJicVQwSzdrVmRPNWlqWUFZQUF1cTg2cG9OaC9Q?=
 =?utf-8?B?YzYvR2tkRy9sZzBCNHluL2J4SzRHQkgvc0ErTUtkZ2JPWFhNWktsOE4vUWNP?=
 =?utf-8?B?ZVR1cnRYMjdrVDEybExQWWpuQ1p6UGJjZVQzNTdvNE55TitZUmdyaVc5KzZw?=
 =?utf-8?B?aXhYaldKRmVjUHVYQjlObklLTTRrUzlSUEs5VVZVTXhJcWNocWRtcXhzZFo5?=
 =?utf-8?B?WmpyM3kwNTMrUFBxUm5CTnROUFZtTXlEdHBEeFpnRzVYNGRZdlBVU2pqTkZ6?=
 =?utf-8?B?dUFUa0VZMmhFbmIrZUM3THVwS0l0ZjNQN0V1OVhoVWwyVkVUSnBTT0VxOGxk?=
 =?utf-8?B?YlBHcXJMYlRWOGRlRmlpREpyOEhTZGNpVHJqVzBBa2kxcU5CNGtLcVdiQU5U?=
 =?utf-8?B?ZHBPSjBoZWdicDIvZU0ra0VibmdIU1NXTGRVZUMwZFFIR1lScWNFejNQOTEw?=
 =?utf-8?B?UWJBYWVTcFJab0lHL1dqNEptUDcvQ0tYdzBhMWhDa1ZabVo4Q1VIVk5panRu?=
 =?utf-8?B?QldxTG5heDVGNHI1SjBOcDBWV01LQlYvK1dFSGtsYWtrbHN4VXYxRXpidkVv?=
 =?utf-8?Q?YyVhb/1HfMv7piLlVGdP5UUdg?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bf7e0b-1ac2-49c2-d9c5-08dd9398cf75
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 10:11:08.0849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VfuPgdJZGOrXa79eoAlkhNGLuJXwRjr24pvJp3Ygu+rrPLgm/LutEqUDhXIIBZ0nP7ujDMyJKnqyOOuvsyR1I3jQWOJKSVRloNDAcihy/BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7751
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_031140_396191_4A44398A 
X-CRM114-Status: GOOD (  18.94  )
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

> Subject: Re: [PATCH v9 02/12] mtd: add driver for intel graphics non-volatile
> memory device
> 
> On Thu, Apr 24, 2025 at 04:25:26PM +0300, Alexander Usyskin wrote:
> > Add auxiliary driver for intel discrete graphics
> > non-volatile memory device.
> 
> ...
> 
> > +static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> > +			      const struct auxiliary_device_id *aux_dev_id)
> > +{
> > +	struct intel_dg_nvm_dev *invm =
> auxiliary_dev_to_intel_dg_nvm_dev(aux_dev);
> > +	struct device *device;
> > +	struct intel_dg_nvm *nvm;
> > +	unsigned int nregions;
> > +	unsigned int i, n;
> > +	char *name;
> 
> Perhaps move this to the loop it is being used in?
> 
Will do

> > +	int ret;
> > +
> > +	device = &aux_dev->dev;
> > +
> > +	/* count available regions */
> > +	for (nregions = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> > +		if (invm->regions[i].name)
> > +			nregions++;
> > +	}
> > +
> > +	if (!nregions) {
> > +		dev_err(device, "no regions defined\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	nvm = kzalloc(struct_size(nvm, regions, nregions), GFP_KERNEL);
> > +	if (!nvm)
> > +		return -ENOMEM;
> > +
> > +	kref_init(&nvm->refcnt);
> > +
> > +	nvm->nregions = nregions;
> 
> Is this assignment useful?
Nope, removing

> 
> > +	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> > +		if (!invm->regions[i].name)
> > +			continue;
> > +
> > +		name = kasprintf(GFP_KERNEL, "%s.%s",
> > +				 dev_name(&aux_dev->dev), invm-
> >regions[i].name);
> > +		if (!name)
> > +			continue;
> > +		nvm->regions[n].name = name;
> > +		nvm->regions[n].id = i;
> > +		n++;
> > +	}
> > +	nvm->nregions = n; /* in case where kasprintf fail */
> 
> Considering kasprintf failure, should we move forward if n == 0?
Not sure if adding exit path here adds something positive to driver
other than complexity.

> 
> > +	nvm->base = devm_ioremap_resource(device, &invm->bar);
> > +	if (IS_ERR(nvm->base)) {
> > +		dev_err(device, "mmio not mapped\n");
> 
> Is this useful? Perhaps the helper already does it for us.
Yes, will remove

> 
> > +		ret = PTR_ERR(nvm->base);
> > +		goto err;
> > +	}
> > +
> > +	dev_set_drvdata(&aux_dev->dev, nvm);
> > +
> > +	return 0;
> > +
> > +err:
> > +	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> > +	return ret;
> > +}
> > +
> > +static void intel_dg_mtd_remove(struct auxiliary_device *aux_dev)
> > +{
> > +	struct intel_dg_nvm *nvm = dev_get_drvdata(&aux_dev->dev);
> > +
> > +	if (!nvm)
> > +		return;
> 
> Are we expecting this?
> 
> > +	dev_set_drvdata(&aux_dev->dev, NULL);
> 
> Do we need this?
Is there guaranty by auxiliary device that after release nothing is called?

> 
> > +	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> > +}
> > +
> > +static const struct auxiliary_device_id intel_dg_mtd_id_table[] = {
> > +	{
> > +		.name = "i915.nvm",
> > +	},
> > +	{
> > +		.name = "xe.nvm",
> > +	},
> > +	{
> > +		/* sentinel */
> > +	}
> > +};
> > +MODULE_DEVICE_TABLE(auxiliary, intel_dg_mtd_id_table);
> > +
> > +static struct auxiliary_driver intel_dg_mtd_driver = {
> > +	.probe  = intel_dg_mtd_probe,
> > +	.remove = intel_dg_mtd_remove,
> > +	.driver = {
> > +		/* auxiliary_driver_register() sets .name to be the modname
> */
> > +	},
> > +	.id_table = intel_dg_mtd_id_table
> > +};
> 
> > +
> 
> Nit: Redundant blank line.
Will remove
> 
> > +module_auxiliary_driver(intel_dg_mtd_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Intel Corporation");
> > +MODULE_DESCRIPTION("Intel DGFX MTD driver");
> > diff --git a/include/linux/intel_dg_nvm_aux.h
> b/include/linux/intel_dg_nvm_aux.h
> > new file mode 100644
> > index 000000000000..68df634c994c
> > --- /dev/null
> > +++ b/include/linux/intel_dg_nvm_aux.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright(c) 2019-2025, Intel Corporation. All rights reserved.
> > + */
> > +
> > +#ifndef __INTEL_DG_NVM_AUX_H__
> > +#define __INTEL_DG_NVM_AUX_H__
> > +
> > +#include <linux/auxiliary_bus.h>
> 
> Missing types.h, container_of.h
Will add
> 
> > +#define INTEL_DG_NVM_REGIONS 13
> > +
> > +struct intel_dg_nvm_region {
> > +	const char *name;
> > +};
> > +
> > +struct intel_dg_nvm_dev {
> > +	struct auxiliary_device aux_dev;
> > +	bool writable_override;
> > +	struct resource bar;
> > +	const struct intel_dg_nvm_region *regions;
> > +};
> > +
> > +#define auxiliary_dev_to_intel_dg_nvm_dev(auxiliary_dev) \
> > +	container_of(auxiliary_dev, struct intel_dg_nvm_dev, aux_dev)
> > +
> > +#endif /* __INTEL_DG_NVM_AUX_H__ */
> > --
> > 2.43.0
> >
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
