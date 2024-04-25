Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75C9C4345F
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2024 11:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdMwTtS5Ne69om1cwEYc2zgaG2wfydp6ALlC8jBAGOw=; b=oJytXWt2ksxBFL
	j+kXS0AVduFXkOw9WWf8ZomH61PicCy3f5ej1QQ+x5wMzwRkJ9sTxcTxqtv5q8zHLgAKfEZiRYVS1
	yvUZLfNTP7p2CAJFG1juB99f7iI97a0JRFUsxqmz1gDMx0vaKpYoIZmzSdQU2FppZZJ5VueooDTX+
	l7d8gUvxju3qGX+qoQsq7IEjwFpZubOT7swE7eY1Qcm+bENIiZQsUjUgm2QBZuYX0S7I8AwPiJqEC
	CGOJ3CTL4h0Kx69jMhELEaUeZkAu5NPgYa0E/vG84+fnVHhG+cUplWBMIBJ3CAxUThp9H43fjhwlX
	KF1cV29DajplmObSu13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzxkX-000000086OV-1jhI;
	Thu, 25 Apr 2024 11:58:49 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzxkT-000000086Na-3E56
	for linux-mtd@lists.infradead.org;
	Thu, 25 Apr 2024 11:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714046326; x=1745582326;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O3CEtFc/gJ90u6lAknDUE2HBeVc0ZKN41wZqpOQAW0o=;
  b=Ltkn8p3yCb8o9GCFSDh/1yduZQ316IOaHZl71aDBc4VxnF6MumUOIQMw
   8DwZw2jvVbbQMmJ/yt24AQM2apHlg+Cj4m5NJsXt93VxunE79FzGKNWfV
   KBf4ZNDN/TfB+w0TdAEh0usbvziHMZhKrvFIPL+gml7qmr9sr5m0Ps0Ad
   9VW5nuX2RbK333uqGfV4BGlaiAm9nRzVOgVs8C8ypHnqNz8LzqBSYe3yS
   BzeYMkCdjV1IZtXQz6w8Pi0jY4F5w9pyBqJsT8kYnwLAQHd/k1sFDqCV+
   OSxRzRE+lXHugbjq3ffEdKJi4jMZm9j8mlKd3OlvnmCP1JP+gQd/92CAY
   A==;
X-CSE-ConnectionGUID: 3EroBZPgRtGVCIRZDnXQWw==
X-CSE-MsgGUID: se9s18rqS2y6upIM5bNaYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9596237"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9596237"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 04:58:44 -0700
X-CSE-ConnectionGUID: ZpxqbmBfSu+mMy5lMFdOVg==
X-CSE-MsgGUID: wqXtE0BYSgCdP2KLxvsRsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="25468608"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Apr 2024 04:58:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 04:58:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 04:58:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 04:58:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jh/Xh4CVJ+Bmgozjgn5Tps8bYVaJWl1je3psAR58KqP+GKJ2eEb7u3amw/SGxmtyQuOhCkVjHn9JcNRg4jIGfu+B73X3zV0jTFLvS+gtLoMTZHDb0RJ6FesYx1o1fhqaf7R4YkCF+psCZqAhqIMRmrhtZ5zl4gDa3wkoIWR1eb1UvXLQh0d3K/AsPaP/+p1uYzRycz4vOKVkiK2MmvBhWf8tkQJrOiHahOJrK9l/dNSbr8AeO270jAX0hY8a4Ksj0wXbBw//a2vM/IUQvV4c8fro6+zVlxd6Tx3RS6z+uJU/hD44veqIRN8ceJk3Lb09ntf2ZfmtA4sqrPOPpGtJVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3CEtFc/gJ90u6lAknDUE2HBeVc0ZKN41wZqpOQAW0o=;
 b=DlOIuIMhdNfYE2lA43N/xweTBFGtFry59WbNjEIeYEvoi9XoGSaIOGRi7YIs6S70dxnh8OMMnq46a2ffv77a4AEFcupCV1Uo09uXi8AmeixsVYsSup3WulY9KP+/VeYkZudhZgGxXpm9sWZuel1pLKMWJ2aqMdSVOxFRVmU34ESekCwYxJsINb1PQ4vwPji7hSz76VlfSGOibQfHnw04FBQ28q/C29+kl/1cDOwdo8LCtos4233SckWhSQPa7k27Uq3hrIQg6sN9UWeB/GS+cMI01HzRGcHum+ci5Pq3CNPA5btLu7DMFYzi5Ob6/MM0FX+5Ud/GCSJsfJwdicft3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Thu, 25 Apr
 2024 11:58:41 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::90e5:7578:2fbf:b7c4]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::90e5:7578:2fbf:b7c4%4]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 11:58:40 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>
CC: "Lubart, Vitaly" <vitaly.lubart@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"Winkler, Tomas" <tomas.winkler@intel.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>
Subject: RE: [PATCH 05/13] spi: add driver for intel graphics on-die spi
 device
Thread-Topic: [PATCH 05/13] spi: add driver for intel graphics on-die spi
 device
Thread-Index: AQHagQsxukMtMuXEl0qGa1omyzhtb7FOq10AgCph1LA=
Date: Thu, 25 Apr 2024 11:58:40 +0000
Message-ID: <CY5PR11MB6366336CB9AA7BA8A5EF989DED172@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20240328122236.1718111-1-alexander.usyskin@intel.com>
 <20240328122236.1718111-6-alexander.usyskin@intel.com>
 <a8eaa566-bcc8-4558-bcf0-38b7fc1551b3@linaro.org>
In-Reply-To: <a8eaa566-bcc8-4558-bcf0-38b7fc1551b3@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB7663:EE_
x-ms-office365-filtering-correlation-id: d52e2e19-aa57-4c5e-c423-08dc651f0c86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?SjVpNlUxVURacldEM0xLMmdxdEdkWVdxOXRKMmpQa1Q1bTJvNWg1YkJTa0hF?=
 =?utf-8?B?aDA3WWNaSlNUdE1WYlhrVjRwSDRsQzJURFBVUFd5ZG9kMDc2OGtyQ3JWb29s?=
 =?utf-8?B?UlhTK1ZpSHp0TVZVWHZ3eVd0NkVpN2FhZzRjODVQSkFrZkEyek1mekQ3U3ho?=
 =?utf-8?B?Q1dBUjNjQ1lqaVU3bkl0bU5CWjdYY1RRSGlWYitZcUVzaU13SDlRbFE0TTda?=
 =?utf-8?B?YWpYN2V4UTlUZU5MODg4L2t5eDlQOWhYallpZFlGR3hYbVNzbUNWeWszdC9t?=
 =?utf-8?B?b1dsbHk3MUFod1B5bk9xcXdFMzU5YUx4a0RGemFUbFdMdlM2a2w0bmgxb1Yz?=
 =?utf-8?B?eUpvNW1MTWR0aGtZTEtYZmRRQi9MVEVvaWF4OTNRbGh6QmthM2VDWVZ2Vnhw?=
 =?utf-8?B?eW94cjdVak9XSERUL2dLN3pmWXZXZEMwd0RaV01rNGNWVUwya29DNld1amlj?=
 =?utf-8?B?QTZBd0cyT21sMW1SNGZDaEt3L2NJcmE0Sk1IR0NMR1I4UnFTVUVLaHdrbkND?=
 =?utf-8?B?b0xuOFFWWDVyQ1BST1RFNzlTWmZwTFRPZGdqaUJZVnp6aXE2Vnh6WlQ4aUFB?=
 =?utf-8?B?anhydjgrK3dpMDhKekZydmVBUjVFZmZhdXgxdnJhY01GZDU5UlNxdFI0bmlx?=
 =?utf-8?B?czM2SWROSFpmUVlnajljRmh5TjNYQWU2YnRTL2hXNE1XajdLMjNnMUdUemVy?=
 =?utf-8?B?cFNSRlpkUU5RR0FXM1BNaTlGcGk0UU5GNXVtK2NlTlVFN3JIOGZEMWhnUmZu?=
 =?utf-8?B?TlBuYXlWa2pQcjZnVnRnZzJZSFNNa2NPejQ0Y0xBQVpOand4NjFjcVEvWEVX?=
 =?utf-8?B?RjBuc0Ewb1NKbzJrLzRzeUxhWU9OTi9Cd1hlMTJBQlVPKzBCcUZCR213elFl?=
 =?utf-8?B?dy9NQjBRM0k2STZ5Y1htQXlRV3FHdU8rU0txWXlNMHdERlorU1RITWlnNy8r?=
 =?utf-8?B?L2xUcEt2bXdHaTJiMkFTS3h3SjUwcmVyWXJheVBVT1hCZVRmVmw4di9rQVJm?=
 =?utf-8?B?SUs3YUFScm1jLzN5R0JpeTdjV2pQL1lWT3g2b0k1aS8xeDZ3NEM2c2hZaE04?=
 =?utf-8?B?NjErUVVmR2w3Vmd5RnVwQlB2aittUHEyVHoralBtY0lYdjhwa3RYZis0Zng1?=
 =?utf-8?B?UWdKLzNEdlduclhVWFdEbFFXQlFPalRVTzc3QlJmTjdJU2ZncDROeEd2bjNj?=
 =?utf-8?B?QjZuQzRzMm9KMjRmUElrUFgyZzNZNWlHTmlObkdoYXlFS0pUSmtFSkE1cG03?=
 =?utf-8?B?UFhTSEhoSFJvMlJPZUtYK0d6eHRIVGdRVk1wWDlaV2dOMVEzM2NoOHQzUERl?=
 =?utf-8?B?VnZVQmFmZ0cwck03T08xZWlDZFlJaFAxK1ZUeStkMXZ6U0JIdWtrK2xLVVlV?=
 =?utf-8?B?eVdyM0J4aWdPRkduSUVyMjBjZ1QvVjRKWTYvMkdBNGNnQVdKT0hQK3NNell3?=
 =?utf-8?B?ek5ZRExOMmFWamc5VktOR3JkUjJIRGY5aXdWQXhYekZzbUNtd0lValNqeXdL?=
 =?utf-8?B?Sk44UE5CaUV5aytKVGRvNWpBclFjTnRUNzhNN1RYbW15WnB3RS9jT0RUaGU2?=
 =?utf-8?B?REdhQzN5RmNhY3ZOOG5RMjE5b0VQcWc3Q0VBeXY0MkZ1M3V5R2ZMQ3ZjVWt1?=
 =?utf-8?B?eWpvTE9xbHRJV2NzdzNOVlFKaXlWSDBUakVyc2lTUGxKZFZ1b0RjM2FEeDV3?=
 =?utf-8?B?Z2pNc0VrcTJpMDBEYVUvOFZueW5EdjRmRGJRV0p5a1FZVGlYUU5tTURJNzBo?=
 =?utf-8?B?UWFOTlZJSlVyTXBnTkc2Y3dadHNNSTlPbnNqRXBMbmkvWmViL1dBMjhsUzEw?=
 =?utf-8?B?TGlDTVBMNDNlTDJhZTlVUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHEyelVVYlplYjhEeTl0a2VXS0ZUNmFGSWprTnpkU1dadGFJb25zMk5GTSs4?=
 =?utf-8?B?RW1BenVsY2U3M21UT283UFhCcGltMkJpTkFwK0Q2SmZLREhzQTA4aCt5VUg2?=
 =?utf-8?B?dGFNa1U1UEsvbDRUMS9IcEJLY0NEOXFYZjI3RFl3TW1oYXlMM09DV0hPbTlD?=
 =?utf-8?B?WnMrb2pkK1lUUFcrcDRMOFlkZEdzK2dYVFhCWEVGRW43ZmxkWm9RdzJWWVhM?=
 =?utf-8?B?ZDhrMTdYUlY1SExiWGRIZk1Da2F3N3NuRHRybWpwb2Z3NDdidmRJcTMwOE9w?=
 =?utf-8?B?Rlg0RWs0OW9aWXljUW9tamFrbEpVOXk2U3pKTmZyNm5oakFUU0lRb3dsbUl6?=
 =?utf-8?B?YnhicHZ5VFU3MElNQzdPa1pQRFRhb1lpa3phMytNVnB3S3Foa2FtTzBnd29k?=
 =?utf-8?B?TkxXNFhlVU9pMTRzYzEzYXVQNGl0TFA5Q1FuSlFHMUdvYmFZaHdvby9DWEM5?=
 =?utf-8?B?bVdIcnZGOGpTQ09VVk0zN2VNM2QxMW1HQXdBZy82OXJMTzhUbkh1Vk1pK05R?=
 =?utf-8?B?MVJjaFdQVUlod2F3RDQxUVZJTFRkZVVubTl3QTRzcU9menBNZmIvUnI1Qm0r?=
 =?utf-8?B?YmlGenVJcFJQSm16R0xWMlJtTE00SnIrbFdQOUhqSDErdHk4VWJrMmUyMkFS?=
 =?utf-8?B?d2dNNERQeGZTK3Q0eHNXdXZmU0c5dW16eVlUNnR0bk9EU1RJaHpjWTVNVXJS?=
 =?utf-8?B?Uzd3dUVuelJJOVRyWGxKRmtlbEllakpjckJhZHVNVEtxRXVqQktLUFdrV1hE?=
 =?utf-8?B?d2NoWmJvNy9hVTIrcWYxRDhwY0QxWjY0K1NEQVM5QXRlTERMcjhlUHFZOWdN?=
 =?utf-8?B?UjVLMEpqd21CN0R4K0NlVlhSTkN0cXBjaytGMFRxMmhBU2VzYnpTZkozZmVQ?=
 =?utf-8?B?UlRpbERSNHlRTzgxNXBSYzhwL25QNktLeWZZVWg2SDF5ZjhVZGdCbTd6SGxV?=
 =?utf-8?B?ZVVmZTRVb295U3JJaDZNTlpZK0tCQUpROHIvTER3eS9SYzJOTCtqMVJlRVpS?=
 =?utf-8?B?L0twN2FNMGJadFUyc3FVZ2lzYUFXV1l1WnBZZit2NEMyNGU4VzdEcUVDRlBG?=
 =?utf-8?B?aXNRZzhnZndzNkFOWHg1NEpsKy9JejZXVll3RlFxblV3QUVZbjlIampweDZr?=
 =?utf-8?B?Snp4MjA4V3Z4YVVvbGQ1NDJuRE52dDRLVElETXBkaUx3bVZjUWRadUtUZTQr?=
 =?utf-8?B?cXY2RTh3c2FSVGJWVFcxWDdNUm1xUFBkcUpIaUg1eXhsUjFUWE1wOVZYRmM2?=
 =?utf-8?B?bDlaT01zZ0FZdlQybWY4QUpadG0zeGtyMVEvSk1qSkY0aElwa1VtOEY1WjVZ?=
 =?utf-8?B?WGlyU0wwZ3Y5alZlMGYrRTdXK3FqcE5razltV0twMitaaCtxeHV2T2YzdlVI?=
 =?utf-8?B?V1luQ042SVB5c0RkbnBmc2h4eFJzT1lyUjZrYWR5WXVhdUpmVllXQk5LRzNU?=
 =?utf-8?B?V0hUckFHUS9zVVBQL0poUk9Gd1Brdm05UklFTStDcFRWSXB6QVdxUGQzTU43?=
 =?utf-8?B?RlNMZEQrZU5mc0cwQ1RXc20wOWdkeHdSYWp4SFlLRDZDZnVGMUswZ01NMjFS?=
 =?utf-8?B?dGpqRTY5M3ViSm1LTkpwY0VZUnpWM3NnUXBHM1ZHRFBsdmFzUTNrV05mOHEy?=
 =?utf-8?B?bjhxelJ5N2Q1OUo0Rnk3NW1PWWh4YjYxeWJpVmhHdW5zNDZhdE01YlluSHdQ?=
 =?utf-8?B?N2dMcHhVOXlKMkRzOW8zK3JaMElPZWE4OTcwUnkxLzBwMDlhdU1zVExaVE5C?=
 =?utf-8?B?eTM5TDhNTVNWdDNVdjE0ZVpaV0w2RTN3cDdQUlAweHFRTHdYbjEwWE1Qc3hx?=
 =?utf-8?B?S2M3YWNLS3lmSlV4S0dhK2lRY2ZPdkNsZkgyaHhJZWt1VVl3TGMxVjRoQWo2?=
 =?utf-8?B?bFB0VkFGSms4Qll3Q3oxL2g5QmFBQXovWHVuZ1g4RjRpczNGUUprQXpsamdm?=
 =?utf-8?B?OUcreUNGVHBrWFpNeFRhTUdEYVR1WGxhSDJpbnBLYkpSVUpORCtnVjJNS0cv?=
 =?utf-8?B?ZjRWR3RkTTZwQ1RrSTg1bmJteW02L09HQXI2bUdPaUdvSjhJdmh0cVZRaENQ?=
 =?utf-8?B?ang0QnlhUzhhZ3N2QXJWNWZZNTA1YXRyekFBbGVNTGtWbmdaTUNSQVoxdTY1?=
 =?utf-8?Q?kx5HyPKCpOKOQXqGp9VMrLQnI?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d52e2e19-aa57-4c5e-c423-08dc651f0c86
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 11:58:40.7917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJKkPGE1FnbZV4qjFUqtiy0hY+5NTowg6D6StsuDAHlIovrtScbytboFrRi0ziqPXaOGfVh6lZjnLthQ2JGjptOI70glB9fBLFTfjdGy7Hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_045845_890596_3E20E8AB 
X-CRM114-Status: GOOD (  14.37  )
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

> > +static const struct auxiliary_device_id intel_dg_spi_id_table[] = {
> > +	{
> > +		.name = "i915.spi",
> > +	},
> > +	{
> > +		.name = "xe.spi",
> > +	},
> > +	{
> > +		/* sentinel */
> > +	}
> > +};
> > +MODULE_DEVICE_TABLE(auxiliary, intel_dg_spi_id_table);
> > +
> > +static struct auxiliary_driver intel_dg_spi_driver = {
> > +	.probe  = intel_dg_spi_probe,
> > +	.remove = intel_dg_spi_remove,
> > +	.driver = {
> > +		/* auxiliary_driver_register() sets .name to be the modname */
> > +	},
> > +	.id_table = intel_dg_spi_id_table
> > +};
> > +
> > +module_auxiliary_driver(intel_dg_spi_driver);
> > +
> > +MODULE_ALIAS("auxiliary:i915.spi");
> > +MODULE_ALIAS("auxiliary:xe.spi");
> 
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong (e.g. misses either
> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
> for incomplete ID table.
> 
> 
> Best regards,
> Krzysztof

You are right, the auxiliary bus process aliases in the right way,
this is remnants from the platform device usage, will drop.

-- 
Thanks,
Sasha


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
