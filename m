Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D60C4345F
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 14:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzpu2eWCXL2VAZBewfAH1eabYHjdhjBkcyoqQT8HtpM=; b=qvde9kI/vA5QHV
	gq+fP31xCEAefDq+k1uBpYn38fw26NX+Ekc7Cywj0fwN+U8hNI81iKUXR/CZjTFsFMYgsWBXLtkA9
	xQNvXzaYKQ5Qz65ELuwn5YdNdkK7rfXbgSDGnamR8MXofo+pD2vakGRv+Pw1mP07z/Q31UIpjmbWC
	uikvtqjdMvhbpQWB9KoOAnoyEpNzIf8tYRqZ3cUOsKxHHht22UqEU60I3ggFJGIMptz5aiLv7P5wK
	fQ9yVUTD7DZRpDn8AJUVTzT/ppaIXCfFIO764CzDZSVaZb9Ngq17Snx55m15yhS1UF3E+tc28X2SC
	nKNvnI5Gy6RvEU8nQnYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuiE-0000000CFF8-3JBE;
	Thu, 11 Apr 2024 13:43:34 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruui9-0000000CFCm-3O2C
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 13:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712843009; x=1744379009;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qt6fInXEZ2EvGHTIA0/KtOFw1+XtdlVTAwp+OIWwW4g=;
  b=aMLrqs8odCNg91Unh/U0yeY1Cdx/Vn+pO43uxgP6y4srmRj7vgGEgf9R
   8q4GoTVk4V5xPe3cFm3zz4SbL9MA1Nrx3nHfZ/97j+76P3ZiRg7M57iLj
   +/4Jj4zXPgkFWuKRd0jDUmeJgl0jeiE+fLhpJn3SWYzYM6oIBQqM4S+T4
   DrXdbBowZdk+Ybdhl4F1ZJSfqXF/LhH2v4/nKdKHqzKZXXPLFSbsImcoE
   +L+x6laeU4LYDCxXnrNupHefrcYmr1HSHXBjC+AQQU6Q5EyVWf66prtTG
   N7NwG2xmqbsrSn25c1Vf0I4GgQ5vkIYScyyygsiDzeVnpg/ygEK8WJxwE
   g==;
X-CSE-ConnectionGUID: mqEUSEYeS46GylqK8o9F7w==
X-CSE-MsgGUID: 8JwsBWUdTjaPlEl2x4G3uA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18960313"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="18960313"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 06:43:27 -0700
X-CSE-ConnectionGUID: Bqc++wqjQ3mBD0i97r6Inw==
X-CSE-MsgGUID: yO77Ne1aRDqlUAOOyszNMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="21490933"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Apr 2024 06:43:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 06:43:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 06:43:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 06:43:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 06:43:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5ikEiOY26fT8WuoO2b1weoSzdyee2mgvxnoRv2JStdqmp1Zc9N4UC1sKZto+jO0w9nkht2/Fm/1yf4SJGMNphydGKdGgVV0x+2zgnmjffJZAwpjh62BJsppv7L2IPoA+vx/O/NegYlhwZinPmHCASI6vs9iM2OvLhY6lSZ/GyLxDJrqUcflahtzNAlMkorhsVZmmQiK49iSh4WlycWOsf2iuyYNG7+7GG/Aw1ehqI4kwjq58eK65aEuy0gvuEzFQ2LvXCVAeEaz+CTaZeBG7ECnA88/wLGYdECX2GB0JmtDyJcXvTveBaGXaUqKnniBFvW9mNdrOGbfFR9LSzyebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt6fInXEZ2EvGHTIA0/KtOFw1+XtdlVTAwp+OIWwW4g=;
 b=ZiDDiWTXgGIbznhXiEWMszqoVjO1bUOHy7xunjK8cnhH6bQrg6M6YLrlFq00SRrQY0ZMrgk/9gSmmTsd8xxDQZL8JJBN4VeHWCKyFFBX5pGYmriWpAu8ybWsQcHyF33SB4pOcQPU+eKLzhoHrGpEEcbdWqd2VUGIxXy5gAPxXecBMv5tgOHGCHVtpxvY3LgQuY4304NcUBuo1DhQ2nbNaGKzGhck/hQ2Iwy4Sd9RxD411crY2cDLx2kyGQzXvtrWckUf+QCF2161QwJtodLcWQXBq4Fhou5w8BH7L6O+W9PaLaKehyM2cykE9vVhMK6unAA8jozOCDmNdgYqvq01zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH0PR11MB5173.namprd11.prod.outlook.com (2603:10b6:510:39::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Thu, 11 Apr
 2024 13:43:23 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::90e5:7578:2fbf:b7c4]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::90e5:7578:2fbf:b7c4%4]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 13:43:23 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>
CC: "Lubart, Vitaly" <vitaly.lubart@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 01/13] spi: add auxiliary device for intel dg spi
Thread-Topic: [PATCH 01/13] spi: add auxiliary device for intel dg spi
Thread-Index: AQHagQspWlQQ76pPS0G0Ios5aazV5rFOrEYAgBR8ElA=
Date: Thu, 11 Apr 2024 13:43:23 +0000
Message-ID: <CY5PR11MB6366D8B056F50DC6D7B31867ED052@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20240328122236.1718111-1-alexander.usyskin@intel.com>
 <20240328122236.1718111-2-alexander.usyskin@intel.com>
 <3f26157d-d79e-43a4-b61c-5da5aed9adcf@linaro.org>
In-Reply-To: <3f26157d-d79e-43a4-b61c-5da5aed9adcf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH0PR11MB5173:EE_
x-ms-office365-filtering-correlation-id: df946c49-134c-45ec-5109-08dc5a2d5ba8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bQBw+FYLwManlxt+UWz++7CksCMVG5OHwsh8uQ4HA0MCLWhxOg7gYpZV7iYTa0+fwxSiiL8RzTBb0UAhwr9sjSiHUWq3iwejLSo6VB8requKvRwcljVG5pwfKlP9md1no8ENRC5/QkZ6ZBu0SmpHMDYhuHqIfTcGVgWiZ6ZT5NDG/iqLzvPF6U0MnPto7jNitd8uIETsQLpkngLVaMYIT3N90zYv5Gu2Wvs7mHqGtuXIiiUDrBqEoxnug5WzwDKTSwsgoH3J42pO2bCzpOAsLnKrqpQKcLzaa/J3kUG4NLknlSq/41A4h8j/GWAbw6Xr/lDd8kIcEHaYP4YlCrpQKKu87eRTE5cYEz8pjDvFUhRaEFEuI6ATNHla8Qk2rieVN2uMvP55rJ2krYTMAA/DaOWJaw/WGkCothMQORtX1ZIavR+2nyWGcAvcB4z7GCBayWS00Sl/JJglv/lkGB5akHb8A7hkm9icFw59rt3agawSifuibWb+UizZOuFUQmXdgfDPeQ5iNfNodfAE/ssJPZENgA06NLXmhQ/GGR44ZiQtuCQDpT+vWHTA55X1/atUY6mtASov+CvMI/l2O6uAR5kI5IyuTYXa5RgKKssGbKAen6p9aAwtyKw2DOuSh3hMkauJO/jzEBXosfRaObn29+yx4WpYQUA5+FPGhucRd77GVijPRUeMwzObO8fhU/etn8j4wXBbgaRLJV5lg6xzdMIEfHvvt13nQd1f+hs3+wQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bllvN0VCUTh6SG5wK2Q0YUhCSmpldm5xc0pIWXhjMDNYd3pOTkRRY2p0MWll?=
 =?utf-8?B?dUw4VTZpMmxmOVRVSXo2aWpEa0hLbUlqbkR6RzVMUHVkSHJMNlNDc3ZldmZK?=
 =?utf-8?B?QlB0RjRiRjQzY0I1RVpwR09UTW11R2dHTnFScTZWN1o4VEtlZ2VYVnhxNHJx?=
 =?utf-8?B?UnZZcks1Rk9qM0Fwa2srRU14R0xsMlFGMTUrMDhNQjYwMEdjMDRKOEYwbFJ0?=
 =?utf-8?B?Wkc3UndyZ25FYVZJV2ppNGtsd212bW5XQS9WVGpxS3NNWlVjbFhCaVBJeDdC?=
 =?utf-8?B?Qk5nTmcrbXhrUTcxL2s3aVQvNHU4b3FvYTk1dCtoTFgvMWNOUzRYaW95cStR?=
 =?utf-8?B?UWlDU1p3bGxqbEtNamhJS25JdDJtNm5KTEZnOTk5azNJaVdBc0dQZGo4NVNU?=
 =?utf-8?B?MVBFbU9JM2NBS3I0VjNNMVhXdWZ0eVNVMXlZM3duK1ZndFZvNWpoNE1SS0NO?=
 =?utf-8?B?SDlRM2lrOGhYNndMaGg5OUJYblk5RTlNYVFNWWRqSmFrUUtFWW8zV1Yzd1hR?=
 =?utf-8?B?VVVlSU9FSDVuMFJsZXpVU29OUFlCRDFlbTF3bzJCNW1VbFUxOWNyWlV3T0No?=
 =?utf-8?B?MGZBdnB4b0Vod2tjb3BVZithSG1jOXBQTEgxSXBRZW5xYWxPRjRCeXlldE4y?=
 =?utf-8?B?OVlOZ2ZBSFNlUDZOSDc4Wm0vbW5XRDI5endHdERmVDlvYWhSeERjTjhKeitR?=
 =?utf-8?B?ZFlObG00eTlDdTdtcmRQQlNKMm0xeWtKVE5FYXdvQ2RoMldqVlRqN0NhaUVN?=
 =?utf-8?B?SHZvQlh4VW1hc25LbGY5bzFMeFFHYlBnNHlVN010SVFYcmxSMldiZFVhR3dT?=
 =?utf-8?B?SlpPQkJKZFdscDVGZlRaVEk5cHMrS3pEaTgxYWxDTW1ic1RjU0d1cUpoZmZs?=
 =?utf-8?B?Sjd4d25pUG1DVzdkQjZhMlBqR3owVVdhQlpyY0pjeGRmQ0EvcTFLWExOdzlo?=
 =?utf-8?B?SmVYVzc5ME5LaUVrMG5BYlNKdEhEYkhkYWlkeXVIMWpROE9PM3F6NlIwQ00z?=
 =?utf-8?B?VDVVeVloaUR5K2E5eEozamJwVWlqdGVZSUZINEMwTG5qSVpTZWptSFFXL0hp?=
 =?utf-8?B?ZnoraDhKM3dZSGl3TTByYS95TjJUWVdQRE9HdjRhMlBRVkppOVIxL3p2TnBO?=
 =?utf-8?B?UklKQU9KdUxyTEdybk5GVTc4L1JhZWhqdWdxR3dQc0pCVlhiSGFHWFF1a1Vo?=
 =?utf-8?B?alczMDNiWnpuWTBrbkxOQm5mUU00dTljNlF4NEhpWStNMHBTd1Z2TFkycHBh?=
 =?utf-8?B?NEJSY2s3QytsSnoySmhqM3pZUCs0Wkhvdm1TM0JNVitEdXBDSVdVOWRsZjA3?=
 =?utf-8?B?M3l4OHJJbUppSDUwZkM1MEtjVHIyN2IwTGpsa2ZxeUxXUVFyZ3ZLbTVMRjFN?=
 =?utf-8?B?L2NEUmdkdW1pUHdGQVdmQlRlSU5BSFZHRUMrdnc2Yzd5ZHk0RUVkdHdMQ0Vp?=
 =?utf-8?B?M1JwOXNqVWlvNkU0ZEl1THgxSlplTnBncjBHcldIUE5DeWl6QnVOS1YwT0Rr?=
 =?utf-8?B?cEpxbk9veVQ0V3N2RE1HaTZnK3d0TUhkOEo5TE51UEtnWG0zUjVnYWxHS3Yy?=
 =?utf-8?B?OUIzN3NrWW9BcGtVeC95VjUxU1FlQTFDd3pHbHh2R01ZQ0M4enJ6OXZkajVm?=
 =?utf-8?B?Y01jLzB3cGVLZGF4ZEVrek43RmFtV0U1MTBvUXU5T2VrOWhWVVdmVS9LOUdz?=
 =?utf-8?B?UmJNY3RCdXlqVnI0bXBLUlUvcVRIdGpZSzB3NCtwaW53YjJ2V0NoUmRUcUYr?=
 =?utf-8?B?dUNPSnEzaFA2dUh1L2lkSlhzakJVdWlpdVFBMzRWbVRFSzViK1ZVcHUzNTdx?=
 =?utf-8?B?VG1GZlRIdXMyQ3h6akQ1UmVUSDl3ZUw0T3JITjk5Wi9HbCtvcmwzSW1Dd0kz?=
 =?utf-8?B?eWNxSTJjUE1FRk5iY2lHbXlodWp4SkVnQTdkYUF3NVZvNmVqTFIxOE54ampa?=
 =?utf-8?B?MXhKc3RPS0YyblBFYWhUR29VaE1IRERlQUJKRERlcm9oVTB6bEtQZUdobmd2?=
 =?utf-8?B?ank5WXUxVWFKblBoNHF3NUdaQm04VFlQNytTWXJlSjlnS3pZYlZMUUhXYWVo?=
 =?utf-8?B?bUQvVWJmTnRGMWVVTk90TEo3cit4WHVGenBtSmhQNkJ5eDkyUC95REtBcTFJ?=
 =?utf-8?B?WnlweHlrbFhaNkF2S2RkbUduRlNnVnB3N09GN2JLeGtGZFcrSjJaUUZzdUhW?=
 =?utf-8?B?alE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df946c49-134c-45ec-5109-08dc5a2d5ba8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 13:43:23.7365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KRnEIyZl7lBKz5M/yMvwd6gjNVlqQqYXvHvP0LwKSw/AKX5sYxzSEW8BNpvHd98tZ8QCEtUjMFn6uOBcZYQlRYvBItKgsbJ7rTI7DqLltzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5173
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_064329_983266_35F9B1E0 
X-CRM114-Status: GOOD (  20.97  )
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
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Friday, March 29, 2024 15:47
> To: Usyskin, Alexander <alexander.usyskin@intel.com>; Miquel Raynal
> <miquel.raynal@bootlin.com>; Richard Weinberger <richard@nod.at>; Vignesh
> Raghavendra <vigneshr@ti.com>; Jani Nikula <jani.nikula@linux.intel.com>;
> Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>
> Cc: Lubart, Vitaly <vitaly.lubart@intel.com>; linux-mtd@lists.infradead.org; intel-
> gfx@lists.freedesktop.org
> Subject: Re: [PATCH 01/13] spi: add auxiliary device for intel dg spi
> 
> On 28/03/2024 13:22, Alexander Usyskin wrote:
> > Add auxilary bus device structure for
> > Intel Discrete Graphics SPI device.
> >
> > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > ---
> >  include/linux/intel_dg_spi_aux.h | 27 +++++++++++++++++++++++++++
> 
> There is no user of this header. Please add it in the patch which uses it.
> 
This header describes auxiliary device that bridges between
i915 or Xe driver with spi-intel-dg driver.
This header included in both drivers; this is the reason this header
has its own patch.

> It will also justify why you use this or other subject prefix. Now, it
> looks just wrong: it's not a patch for spi.
> 
Can you suggest what subject prefix to use?
Like: "auxiliary:"? Something else?

> If it was a patch for spi, then:
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
Sorry for that, will run this script to pick the fresh maintainers list and
push v2 with a new list.


> Best regards,
> Krzysztof

-- 
Thanks,
Sasha


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
