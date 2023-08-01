Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A44EB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Aug 2023 08:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUaMu3CFplfzBgkmZZag214ptKFHaArWfbAi05rIwo0=; b=R+VWpt1khyNc4r
	WxMsCFKoKNXV3u33y62ofkOKjrroqzgfxSVa+ihwHk2MG2/tJyY4qXf2RcloaihBqMu+aCOiarlMW
	QgT7ilRdsgt52USAmsXQDSrM3z3ynLT7BvO0JhH+U5tMutRAVH32cTR9LbFX6hPS1N4ngfVmj2WHA
	fknQKKYF6VyqhP6DliXmqq6zN9UUbgMO3YmJINJHBdB2XLFI2hJzPEralu7hl5Dj7pvPqOLYS13Ok
	ovJaIm7ZZcBW55pofjyNR4ifwDdiQfUIf+8o9GcuxDTNQ/3XW0Splh2NnfjtCGd9ZoGq1+Y3fQ/dp
	8BFhYu1XVXxtlDZKqq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQl0z-000gKG-2n;
	Tue, 01 Aug 2023 08:46:01 +0000
Received: from [192.55.52.115] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQl0w-000gJN-0j
	for linux-mtd@lists.infradead.org;
	Tue, 01 Aug 2023 08:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690879558; x=1722415558;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kalbm+heO/e8BsaSlcU+6vDkLsIpFeuT888CVCW1RK4=;
  b=O1KPyTNDPlMvxvo7l2hBOc/sZjqu70ucz+c7EKDmxhbT+eOWsiqR71uj
   c4NGF1bFHUH9WixWnCxJXjW6gRY+O0iYTTJJySipx0OjRFrvQhKutjcWV
   mfF6yzbDNhESWB6/iNcawghw0JwftkVlJ1yS8dfM1UYLIo6ykaXMvH4Je
   R3O7RkDwhEeAc0sRQC+hjB19JqOGqgItwIzniJgPYmRp2TUwAlMcgY2tJ
   LDeUW+RxBtJ+UrS49kWBh9z69ztOkAoyAF2SeXQq45H9hzK+sOQwUMrTB
   ZQqYW1uahXqtH0pfd0MzAUdKscV5o56lfYIA/2XFKkiWMdmJ3lB+kmkrr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="369236103"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="369236103"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 01:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="722416211"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; 
   d="scan'208";a="722416211"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga007.jf.intel.com with ESMTP; 01 Aug 2023 01:45:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 01:45:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 01:45:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 01:45:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P99zfnwTMNxh9xxdMA6QkGEcA2Nm1ue2WnDE01JLS2tjLkoXcCq8qWl+K8nXQ/yIJNJW9TxUzCnxdOBCEFzL077xPBeMvcttkpEqL7RzGDuezEZ23h7jB9TkXfoIHHdevgzf9cCYMicUf3QNhz+2KBswTiaY+JUnpfXYQpTfnIX5vXU3Mqf1/AKbB7K4ihllA2EjWQ1Po/ctO16M1Dnx4Q7Tk16M8VbOGflCrwYFOLcPmfiKBXtHxFfq+w9qi5JvXLgorqnzeFIovpgCQB6lyjFUDV9ADMp2pRHaywRQoCXrYLU2369KzGhoXheQSKsO7iD25IILJ4yHcU7K/UjpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kalbm+heO/e8BsaSlcU+6vDkLsIpFeuT888CVCW1RK4=;
 b=E/TTiNVKp2G9PioN502Vgbpdujl3AauRVtenH0mY6cCY8Nhec/vM2O84ARoMzSMunzgi8H2lA3D9lWuJJhswbNNcU8a5UQJ5iUCCLh9hJM5niUxPYmaF4XtieBPSoKWqQBVSytSdsH/Qz2GNXr6g3upYIUxwMtJSytqAaGpcXtuWuqDdZGdlfuHxStcNUbK6F5ufSSwzKIAyaKUNXAeJc6IAC/d7j1RDAyes5sGqtEW37t1qxpSZvJGBG53/eG6k5lY44AUVPh/ufdWfXPQlU3qh9AUmkOLXyEUrEjfFSKz5JTe1Rq9ZmsxgYHmEXn2CB+KDLI7tWbBoJ8YlYQrptw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SN7PR11MB7041.namprd11.prod.outlook.com (2603:10b6:806:298::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 08:45:48 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::f8a8:855c:2d19:9ac1]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::f8a8:855c:2d19:9ac1%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 08:45:47 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, "Michael
 Walle" <michael@walle.cc>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
CC: "Winkler, Tomas" <tomas.winkler@intel.com>, Zhang Xiaoxu
	<zhangxiaoxu5@huawei.com>
Subject: RE: [PATCH v2] mtd: Fix refcounting with MTD_PARTITIONED_MASTER
Thread-Topic: [PATCH v2] mtd: Fix refcounting with MTD_PARTITIONED_MASTER
Thread-Index: AQHZw47T/iyZoMlFH0Sbev1DShu4/a/VIQbA
Date: Tue, 1 Aug 2023 08:45:47 +0000
Message-ID: <CY5PR11MB63664273EC02BE1A9AC05D7EED0AA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230731090903.770277-1-miquel.raynal@bootlin.com>
In-Reply-To: <20230731090903.770277-1-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SN7PR11MB7041:EE_
x-ms-office365-filtering-correlation-id: 821e1856-4c44-46bc-55d6-08db926bb383
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1XI17C3XJ4UOb+/6ylHkhsSnPU87ghCJlte6t/PJOPjtSwes1lTxj5BGT1yFMnfC7r4Fd6uSCZJ7jEqAdb1BKjZMKuFkpSsPFG7FATqWp+iM8j021KxpCS/jLBoGhWX/Rud9NtZiarYlKXp1vMsKLxF0tB/kml/P6wjq8/1VgqLDRAafpM+brxPAS+souHfQT9kCi6wka+jzn2lm99mreWbeKs924zsRVM70cK6f4sJUxFQOOWykyV18im22eTRXh4iMnuHQVNFk+XfJ+L7wC8T3ySCArmbMZz0UmOZUUjV8H0dwnha9ga3DE3Ze4gPXmRJpFfsMzr2BltIOCyL5q7PsaskzbRN8OH/t9dkTHpmZUNiBar/XJaleZ+fUGNz2DBvTTnoM9c9yUsjLEg2FV+ML9BerQjtUHIKwy+nDPsl0Svq9TEvRxRyfkyuKsHHhBqKLpyvuS9rmu+fdCtvSZwQgTTCwZE7bkpQGmevHPoCJl2yHQFPRsp4fa2erPl7Ap1CGzWIa9skSKr2SF22IcQdlo3TSi4uGMKPkoAMFDKke8TQ8Ytrd1nW7lsgi0OmjThZEP/Qlbgh/4mHSaPtUcIiUxTEJXAxEf3bNLOGufbFDdtQIRT4mbLyrIgpoKBPz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(33656002)(83380400001)(38070700005)(122000001)(55016003)(71200400001)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(316002)(4326008)(8936002)(8676002)(52536014)(53546011)(41300700001)(6506007)(5660300002)(186003)(26005)(110136005)(54906003)(478600001)(38100700002)(7696005)(9686003)(82960400001)(2906002)(66574015)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGpQdk9HQ1VNZFYzemN2WkZIcGtoVG1qL0pIN1lVeUN6bE9MSkdremlVVWpo?=
 =?utf-8?B?aFFIVE1JeklGd0c4VDBpVjUwSldiNU9iZEVIVWs3Yng4RnBOdUdIRkJQcXpr?=
 =?utf-8?B?VVpZclJWQTV0QVk5WDZCWklGbkRKWkZaM3dGU1BPNGFjOE5LZUNSaDk5ckJJ?=
 =?utf-8?B?UEkzVzNOUy9OQUlJT255bUxTQWFGTy8vYXNYWWVLN0RaSURFaUhoNXVoVlIz?=
 =?utf-8?B?aHB4UURRY3B5L3g1cXY3TGphbEo4MzBlR2l1YWxZY0NIdkY3cXlDTC9BbitY?=
 =?utf-8?B?SEhzYWFPR3FsZFpzQnJEeHRsTnk0T0tMbHRGM2Rob1dSS1ZuVm13T09tcVVL?=
 =?utf-8?B?eXFvV1RFUGdYNTdHNUhMTXJMMlV6anh1MHVucWZjSHNOS2pleVZVaFVCeHJ3?=
 =?utf-8?B?enRJSmgvMlFtNHpqWlRPSmt2cmg2Y1BmMGdGQzkybEIza0E3enZnOWI2Vjkx?=
 =?utf-8?B?Z1lkZjRmZmNLTmFsU2s3WGRFaFI4YVpVVjZHYjN5QnQ3M2VJdUJuU3R1Yi9t?=
 =?utf-8?B?NWk1aytDM2V0ZEMyRFBnQlExU2xyV0RzamxYVCtkcUJKYWYwTkJ0UW5ZdFkw?=
 =?utf-8?B?OHpaT1FGRC9hWlhGVVNXU1FVY0NkbFNWWW9GZ2FiR3h1bDIzR01LcC9ha0ZU?=
 =?utf-8?B?bUUxN2J0RnNnYnd0YzZFQWhWQ0FvTWJqYlJOaFc0cnVuOFhmNmRPR210RHNn?=
 =?utf-8?B?L1d6T1ErTXVNNjF3RnFLWTlnT3ViakJoM2YzZ1hyR29DaVVlWHBSaVByL3FP?=
 =?utf-8?B?bkxERkFyUS9la0U1b0xzSTN0RXFnbENaRVBEM3E1TUJabzNQZTFWejdsQVJI?=
 =?utf-8?B?SmhyRzk5TVhiZTNWZG1JaXdZYTZERndtSmZhTjljTm5EOTdMV25PVzFBQlh0?=
 =?utf-8?B?TWpiclZVK24rcFhsVjRETjJodjhVWXhEdTYxMDZoV2RZejNLdFBoMlhTQzF5?=
 =?utf-8?B?dGM4TmRwTytSNmh5TVFQRjBBWmhkRTVicytZODQ5bE5NZmxYajVNa2w0K2E0?=
 =?utf-8?B?YzAyay8wcHRIZWRDWWhIUTVKZmRDOUpJeVEyOWJxZWZqUDZtbisrV2N5cmQz?=
 =?utf-8?B?RzBuRmhRcG1iTjJTM2lpdDBkNnRtM21pby83SnlSdG5aMTJzSGVzQ2xuY0Jm?=
 =?utf-8?B?YWVVMEdBV2N1d1BDNk4rSTV0S3RoZThUTUFBRWltWmNHMS84d2dRbUNUSkRP?=
 =?utf-8?B?cGM1UVZ4bVcwcUZXMk8wa1JZWGtVU0NESWthbHJlQUxPVGhnb2ZTU21BdXdS?=
 =?utf-8?B?WnNyZFpNY21Pbm9EWHdGZDZKaThGc2ZadjNiV0d5MVZWL2trTFdqMjR2TVZy?=
 =?utf-8?B?ckE5WEVZNVNVQkc0L1NINWJCdXdvMTBZTUJWakhld3Nxamw5THJ6bXF0NXBk?=
 =?utf-8?B?TUtoMnJ1eHdKNGtnd0dLNlNBWjMyL2dCdGtOaFdGcWdDZDhqQjdaQmpoT3Ra?=
 =?utf-8?B?V2xJV2VBaEVUVFBjL1pTbkhWRVZMeWhZK3RJTW4rVlJrS3AxWXQzNkYrV1l0?=
 =?utf-8?B?Y0VKM0N2c0V0Ykh6UmttZFV1dndrMUpyNjcxZElsbjE1S0NuRVhVZGQrQ295?=
 =?utf-8?B?dEo1UGMxSS9iUFE3cG1UY3ZiaEtlQy9tRzBMQisvbGhZU05kbEpVckdpc2Fk?=
 =?utf-8?B?dXBoMVBwK29pbE93UTRKTHV4YjJ1T2poZWVPU1NWTzRuZ0kvNXBRUDFRbDc3?=
 =?utf-8?B?R3dWZWJkTi8wV1NKdzdEWEVodnNlS1lzcUphR2d5djhJcmRDb0UvQ3VmYlZl?=
 =?utf-8?B?WThnakZ0eUUweUIrenhKTUdyZlBEZUdTWGlqelo1KzFaQVRlZFhaR3gzWkQw?=
 =?utf-8?B?dmxiVUM3ZmxiN2V2bktxbEZJUitTeVlFMmg1RmxkRWtTQWt6dVZvajAzOTBJ?=
 =?utf-8?B?dzRBV1V0RWg3ampXc2dLRnVvSmdicTdqRkxxRGE3NmVta3AzWGtobVVMbkZG?=
 =?utf-8?B?a1lNYjhFRG56V3pBK1A0OFk2dENYOFJvTFBDUXhNNy9XWHI1LzZQcUlhb2pZ?=
 =?utf-8?B?ckJBQ1NOS3FhdFlWOHp4MXZwR1dleXlON0RqakYrVVg5NStZRFdQUEVOTGc0?=
 =?utf-8?B?SytKTGNoVFlQNklONlBOZDlkK2VUUU1XelNEVGd3WFpKRHVFRU8rL25SMktP?=
 =?utf-8?B?TXlYQW5aenJvdGVxTUpDWnBvV3hHWVBtRk9Sc2ovUEFCbndiOThhR1FkQnlq?=
 =?utf-8?B?MFE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 821e1856-4c44-46bc-55d6-08db926bb383
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 08:45:47.3649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kZLtsF8lAnInx7H+wieATZ/xoN9PH7qUx+db4hltVAlVKGDypWY2xACBlqAma4PTyEiCV0yNjbfCnxYZ/sMUHh9qoTXeBVK1T4auVIDBG94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7041
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_014558_287317_CA2C072A 
X-CRM114-Status: GOOD (  30.60  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVs
eSAzMSwgMjAyMyAxMjowOQ0KPiBUbzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5h
dD47IFZpZ25lc2ggUmFnaGF2ZW5kcmENCj4gPHZpZ25lc2hyQHRpLmNvbT47IFR1ZG9yIEFtYmFy
dXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz47IFByYXR5dXNoDQo+IFlhZGF2IDxwcmF0eXVz
aEBrZXJuZWwub3JnPjsgTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5jYz47IGxpbnV4LQ0K
PiBtdGRAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBDYzogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT47IFdpbmtsZXIsIFRvbWFzDQo+IDx0b21hcy53aW5rbGVyQGludGVs
LmNvbT47IFVzeXNraW4sIEFsZXhhbmRlcg0KPiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29t
PjsgWmhhbmcgWGlhb3h1IDx6aGFuZ3hpYW94dTVAaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogW1BB
VENIIHYyXSBtdGQ6IEZpeCByZWZjb3VudGluZyB3aXRoIE1URF9QQVJUSVRJT05FRF9NQVNURVIN
Cj4gDQo+IFRoZSBsb2dpYyBpcyB3YXkgdG9vIGNvbnZvbHV0ZWQsIGxldCdzIGNsZWFuIHRoZSBr
cmVmX2dldC9wdXQgc2VjdGlvbiB0bw0KPiBjbGFyaWZ5IHdoYXQgdGhpcyBibG9jayBkb2VzLCBo
b3BlZnVsbHkgc29sdmluZyB0aGUgcmVmY291bnRpbmcgaXNzdWUNCj4gd2hlbiB1c2luZyBDT05G
SUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiBhdCB0aGUgc2FtZSB0aW1lOg0KPiAtIEl0ZXJhdGUg
dGhyb3VnaCBhbGwgdGhlIHBhcmVudCBtdGQgZGV2aWNlcw0KPiAtIEdyYWIgYSByZWZlcmVuY2Ug
b3ZlciB0aGVtIGFsbCBidXQgdGhlIG1hc3Rlcg0KPiAtIE9ubHkgZ3JhYiB0aGUgbWFzdGVyIHdo
aXRoIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSDQo+IFNhbWUgbG9naWMgbXVzdCBhcHBs
eSBpbiB0aGUgcHV0IHBhdGgsIG90aGVyd2lzZSBpdCB3b3VsZCBiZSBicm9rZW4uDQo+IA0KPiBD
YzogVG9tYXMgV2lua2xlciA8dG9tYXMud2lua2xlckBpbnRlbC5jb20+DQo+IENjOiBBbGV4YW5k
ZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KPiBDYzogWmhhbmcgWGlh
b3h1IDx6aGFuZ3hpYW94dTVAaHVhd2VpLmNvbT4NCj4gRml4ZXM6IDE5YmZhOWViZWJiNSAoIm10
ZDogdXNlIHJlZmNvdW50IHRvIHByZXZlbnQgY29ycnVwdGlvbiIpDQo+IFNpZ25lZC1vZmYtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+DQo+IA0KDQpJJ3ZlIHB1
dCBpdCBvbiB0b3Agb2YgbXkgIltQQVRDSCB2Ml0gbXRkOiBmaXggdXNlLWFmdGVyLWZyZWUgaW4g
bXRkIHJlbGVhc2UiLA0KbG9va3Mgb2ssIGJ1dCBJIGhhdmUgaGFkIG5vIHByb2JsZW1zIHdpdGgg
cmVmY291bnRpbmcgYmVmb3JlLi4uDQpJTU8sIHdlIG5lZWQgYm90aCB0aGlzIHBhdGNoIGFuZCBt
eSBwYXRjaCBhcyB0aGV5IGZpeCBkaWZmZXJlbnQgaXNzdWVzLg0KDQpUZXN0ZWQtYnk6IEFsZXhh
bmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IA0K
PiBIZWxsbywNCj4gDQo+IEFsZXhhbmRlciwgWmhhbmcsIHBsZWFzZSB0ZXN0IHRoaXMgdmVyc2lv
biwgaXQgaXMgY2xvc2UgdG8gd2hhdCBaaGFuZw0KPiBwcm9kdWNlZCB3aGlsZSBub3Qgc3RyaWN0
bHkgaWRlbnRpY2FsLiBUaGlzIGNvbXBpbGUtdGVzdGVkIG9ubHksIHBsZWFzZQ0KPiBjaGVjayBv
biB5b3Ugc2lkZSB3aGV0aGVyIGl0IGZpeGVzIHRoZSByZWZjb3VudGluZyBpc3N1ZSB3aXRoIGFu
ZA0KPiB3aXRob3V0IFBBUlRJVElPTkVEX01BU1RFUiwgYXMgd2VsbCBhcyB3aXRoIEthc2FuLg0K
PiANCj4gQWxleGFuZGVyLCBtYXliZSB0aGVyZSBpcyBzb21ldGhpbmcgZWxzZSB0byBmaXgsIGlu
IGFsbCBjYXNlcyB0aGUgbG9naWMNCj4gaGVyZSB3YXMgYnJva2VuIHNvIGxldCdzIHN0YXJ0IGJ5
IHRoaXMgb25lIGFuZCBzZWUgaWYgd2UgbmVlZCBzb21ldGhpbmcNCj4gZWxzZSBvbiB0b3AuDQo+
IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAqIEdyYWIgdGhlIHBhcmVudCBiZWZvcmUgY2FsbGluZyBr
cmVmX3B1dCgpIHRvIGF2b2lkIGFjY2Vzc2luZyBhIGZyZWVkDQo+ICAgbXRkIHBvaW50ZXIuDQo+
IA0KPiBUaGFua3MsDQo+IE1pcXXDqGwNCj4gLS0tDQo+ICBkcml2ZXJzL210ZC9tdGRjb3JlLmMg
fCAxNyArKysrKysrKysrLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29y
ZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jDQo+IGluZGV4IDI0NjZlYTQ2NjQ2Ni4uOWU4ZmYz
YTk5OWRlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRjb3JlLmMNCj4gKysrIGIvZHJp
dmVycy9tdGQvbXRkY29yZS5jDQo+IEBAIC0xMjQxLDE0ICsxMjQxLDE1IEBAIGludCBfX2dldF9t
dGRfZGV2aWNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQ0KPiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4g
IAl9DQo+IA0KPiAtCWtyZWZfZ2V0KCZtdGQtPnJlZmNudCk7DQo+IC0NCj4gLQl3aGlsZSAobXRk
LT5wYXJlbnQpIHsNCj4gLQkJaWYgKElTX0VOQUJMRUQoQ09ORklHX01URF9QQVJUSVRJT05FRF9N
QVNURVIpIHx8DQo+IG10ZC0+cGFyZW50ICE9IG1hc3RlcikNCj4gLQkJCWtyZWZfZ2V0KCZtdGQt
PnBhcmVudC0+cmVmY250KTsNCj4gKwl3aGlsZSAobXRkKSB7DQo+ICsJCWlmIChtdGQgIT0gbWFz
dGVyKQ0KPiArCQkJa3JlZl9nZXQoJm10ZC0+cmVmY250KTsNCj4gIAkJbXRkID0gbXRkLT5wYXJl
bnQ7DQo+ICAJfQ0KPiANCj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfTVREX1BBUlRJVElPTkVE
X01BU1RFUikpDQo+ICsJCWtyZWZfZ2V0KCZtYXN0ZXItPnJlZmNudCk7DQo+ICsNCj4gIAlyZXR1
cm4gMDsNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0xfR1BMKF9fZ2V0X210ZF9kZXZpY2UpOw0KPiBA
QCAtMTMzMiwxMCArMTMzMywxMiBAQCB2b2lkIF9fcHV0X210ZF9kZXZpY2Uoc3RydWN0IG10ZF9p
bmZvICptdGQpDQo+ICB7DQo+ICAJc3RydWN0IG10ZF9pbmZvICptYXN0ZXIgPSBtdGRfZ2V0X21h
c3RlcihtdGQpOw0KPiANCj4gLQl3aGlsZSAobXRkICE9IG1hc3Rlcikgew0KPiArCXdoaWxlICht
dGQpIHsNCj4gKwkJLyoga3JlZl9wdXQoKSBjYW4gcmVsZXNlIG10ZCwgc28ga2VlcCBhIHJlZmVy
ZW5jZSBtdGQtPnBhcmVudA0KPiAqLw0KPiAgCQlzdHJ1Y3QgbXRkX2luZm8gKnBhcmVudCA9IG10
ZC0+cGFyZW50Ow0KPiANCj4gLQkJa3JlZl9wdXQoJm10ZC0+cmVmY250LCBtdGRfZGV2aWNlX3Jl
bGVhc2UpOw0KPiArCQlpZiAobXRkICE9IG1hc3RlcikNCj4gKwkJCWtyZWZfcHV0KCZtdGQtPnJl
ZmNudCwgbXRkX2RldmljZV9yZWxlYXNlKTsNCj4gIAkJbXRkID0gcGFyZW50Ow0KPiAgCX0NCj4g
DQo+IC0tDQo+IDIuMzQuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
