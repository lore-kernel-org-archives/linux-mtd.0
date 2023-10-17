Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0A3CDB474
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 11:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxX/juqmA/qkBW4t0xM5GG99rqmdPU3TXQh3kxpM8tk=; b=ShuNj2EiB0yqOA
	2uOAU7C2Wz7C5/8y/hkEi7Sm3G9Ql64ASTmWKtQUqwRYwQCcldj9IwnMmSv35GM62Zg9mbYwTD9Q1
	9AoNoXGKRh+JNb9R5mY2OV546uK1sB0ih8zii6bSRUHnPzMqs75i6ZP9DVn0L2k0EkWII9Re6Gm0F
	FJ2uZxj8ee0frLCXFBMUm43+ojvbGAS+PUg8JAIbUOn2ygGTw4QYjxeMbQykkkbP8RxaMaU2M7cTQ
	74iS7xI6p9Q2p+kHeZ8EdasXxstVBAJDPS/dPC69IfU1VoRGhhpDc5NK5XH/14vFqueXsWsYhBaje
	JYf0L5/GGsxjbYatR9SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsif2-00CFeQ-21;
	Tue, 17 Oct 2023 11:54:56 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsiez-00CFd0-2I
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 11:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697543693; x=1729079693;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LoLPzoIUnQll8RyQcCjooNVxX4KePa+qUAYW3+AlJvA=;
  b=PjkJU8uBAGAR6uHud96YeVFHx5zM67Ot8g5ij30xgnrjYru3XQKsZpjS
   iTtoFopVyOG9JoY7rXeheraG8gcptOYFKFa8RUv3rHhAQItq9+1mk8XfX
   LjikQslTJXrDKq9FKR6T00Q2VVh60p7x8JrAbj6qKHDLxhG85B7F6L8xH
   YkpWThQha0pLsxIWGBWQ+V5J7YclanpyDD7AC8DYHYX5unVsMo4RhKAps
   VRGlLKxbjWZcheNFQWTI1NL9tOgGVnxo2bDtWFpHo2ziLifIsXT842fRr
   zc2s7YmaZyceezAW9MWKpwmDYMhlx2ziaF9V8BgCYl+8iWa9xqKE8+NlA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="416847325"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="416847325"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 04:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="821951196"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="821951196"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Oct 2023 04:54:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 04:54:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 04:54:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 04:54:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGrfBGMb+MS6IrxG1rwT1ebb0a7FIAGewIOU+scIS4IuFCvjKBS8bjdQ/GV6whKF0O15BDazppVV0cnSfxrX8Tde5s90mnWA2bIMKvjFSaXOQhs5ZWiPognTLdcYp9ubNlHKeoQr96EYT67CjlobrenMzwSqaMqxz6y9K8/aHhBsYkoszhhC8OrumsrstZ6buzUc0VPGwGWkV7LhFQ97UEdgHq4VvOyAzqhOW1ZfsWqEDYcSBypM08ZyzM2vbKzjP0G8VqieDJ8j+CFwWv4fRSpXEp/4Ymo/pMTKq/V0dhnW/xhJWPpLPNokxSUZkvZoI7VIujQYZfG7YBpfPGnlVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoLPzoIUnQll8RyQcCjooNVxX4KePa+qUAYW3+AlJvA=;
 b=en3lV0CPnyvg3IyQ9HuUyXSB7rf3mnPEIq1JEH6LsKtlaj31lEGJUh+ZGGoabI6DueXim/Z+Uy1CPeQgBYA+i++onIcuiEtWLDFoQyxatRX/00w2ROBimsFSaenOGw/c77ssN5Sn7s6JwX2WlKXfEtTLfS1eYqSh4dCVFH54rcO+HsbBn7jiAGkRKfZIuEi4jPiqu32naaMf+Fb0Yqiafr9MvJWLdJW1Uc5SOQoXhsKB13iOv+gVQ1VrZloB2jTMoV2yqcPnKaGpSQaVZL7N2qYE+X+J7KBYLseVgUvPyQHlxs4SlnrJTkA/jSmK4qlWCStbsm2HWbww0vClCuUGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 11:54:42 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::8593:7da:ec34:29a3]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::8593:7da:ec34:29a3%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 11:54:42 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"Lubart, Vitaly" <vitaly.lubart@intel.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "Winkler, Tomas"
	<tomas.winkler@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 06/10] drm/i915/spi: spi register with mtd
Thread-Topic: [PATCH 06/10] drm/i915/spi: spi register with mtd
Thread-Index: AQHZ4+SWmqcIZAUsFU2z1MSft+JTq7BMUNCAgAHIK5A=
Date: Tue, 17 Oct 2023 11:54:41 +0000
Message-ID: <CY5PR11MB6366850CCE851BCA05A9DC2BEDD6A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
	<20230910123949.1251964-7-alexander.usyskin@intel.com>
 <20231016103939.67445bee@xps-13>
In-Reply-To: <20231016103939.67445bee@xps-13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|MW6PR11MB8312:EE_
x-ms-office365-filtering-correlation-id: b2df29e0-5feb-49ba-61c8-08dbcf07d948
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IcfdauAWo0RxwmVH9/GXxVLOk/jfircZB/D3eaPj/jbYWP1/HirBuxUQpIVEOo+H6/FuMdqr+tgrgW0xvfp5zM4OyzZEVqg+3A2Ha52lshWCZAwSj3k+u+fyXenB7xMVnATz0wOqSJq6bt9S+n3AyDh/L6a9y27mFoMXV096RyRE0riR020la82FzusHhudsZGlkddv7ouavF34yy3BRq9AyYY65s1F95G9FOOyVsSQqBE1u4YI4M8cyAaSKl7FYuDAPdGrNClqU/riHd/NqZ47o5PCNY8ENcwqoa8N1koOwXQMahBsubr1t+244lDdHmkfPD6FeBQ1qobAHvqKDWkhL+hSV5Jm6+a0IUt5++62UZ8ru0xGoeo2xHtmGdDunlz8B0EF0orxOq3ELuHx24XCvrbYX0XmaZOmmf6/XjUn/jvJjfhpbYrKLRkOEof1Qfa2dJcpLxkrW9+oDo1ihAYFc0UGZlNQ9QBPpYZj30RRnpR5TZVpMeO/YAExP9N6CfnwxVkjb4B0BxeTMi9VDKAkohd4dDHjImt1i8UfFB6OWlqFWTdcYRd6Vex7spJH/Tn+ZQmU3g1VRSnBr6EhoIpqPMG8oNxhZ9VxPzvZGoDvvcg3SZ2/jUJhOiUjS/uhx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(396003)(39860400002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(55016003)(26005)(7696005)(71200400001)(6506007)(8936002)(41300700001)(52536014)(4326008)(5660300002)(8676002)(2906002)(478600001)(76116006)(66946007)(66556008)(316002)(6916009)(54906003)(64756008)(66446008)(66476007)(38070700005)(122000001)(82960400001)(38100700002)(86362001)(9686003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rnpub3NLVkxqY0tWOVh0OFNza2MzNSt4eVRyQmUwQ0JDK2hlOVZ1TFREc2Yz?=
 =?utf-8?B?YWl1eHZWaFVkWFJjaG9hM1U0NU1MWHBMZ01CMFBSUGJpdSs1UEVkd0lLSWpN?=
 =?utf-8?B?ZU5jelN3T3l2UFIyb0xoampWYnRTU0FSMGF5a21FUFg3OWdzYnFDTklwLzZF?=
 =?utf-8?B?MTFOZjJ5ZlBqcTUvQ1lzNHkvSElrbE02ZWtyQjZ4N09tRjFHUFIyZmo1RllE?=
 =?utf-8?B?N3UyMXNWM1NkMXh0aFROazFzUkdUTFlweFJubnlrUkkwWThqOUcrbDZ6ZTYy?=
 =?utf-8?B?dk5YRWo2ZDFhakFxYzNZYnF4S1ZFZi9OM1RtdS9zd0Q4VDUwWkV1K0Z1ZG4x?=
 =?utf-8?B?aGxhTFdtM0NMUWxxU1ZZaUluYjR4RDVQTE8wd055MUp0SU5xcnJKcFd5YnJW?=
 =?utf-8?B?cis5czV3YUcvcTZOWXdxaUVKdzBVaHYxY09BRFlQYXV4bmdsWEZ0Zkx2MVkz?=
 =?utf-8?B?bXduV2hhdmNYc2VuOWhNdEtFQ3lRUTFSNGdkMkV2dlVrbjM1emRCV1hROUJN?=
 =?utf-8?B?ZHpkOHNaV2NwTy9IVFRqdEZCZmUrdHM2YStlbWhsOU4wN3RCK3ZTRzlMNFJs?=
 =?utf-8?B?c3E1VTlodkZTbHpidTU2MXZqRitSb1MzQUhoU3VQcTJZZHI5c1hSTU9VQWU0?=
 =?utf-8?B?QzBJQXk3bC84bjRpZ0Z3NWdrUS8vd013bUxCQ2ZjdnY1eER1Q1hUWUptWEcy?=
 =?utf-8?B?eXJmWWcreUxkOGxNakEvV01kNURDNWFhRzhUUzlrMW85ZnArV1ZMdis3SG9z?=
 =?utf-8?B?ODNMNkVJWkdlN3pmUytGdndkYzEzSXdIclprS0JmNW5sUDlXR3VUNG16NUc4?=
 =?utf-8?B?RTA3Mkt2OUluWHBCMWdtNEhjeFNFT0VUaGNKb0VpS1hBUHpBMzY4NVJGL2ZK?=
 =?utf-8?B?L081TStvZnNkWXhhWFlIamVmM3dNUWo0dDZsVnZGYVpVQU9vVDNycjJUcDB6?=
 =?utf-8?B?eTB6NkZhNmM5bXRFK3pnQklOWEJIWFZieFEyWGRXZUxJajBkMW8xR2JZMU8z?=
 =?utf-8?B?dDgxcU5RTTdGSFQ3T2lXcmEreEtIRGEwSFpuUHZVSDFwNkFZM1JENDFKVXVQ?=
 =?utf-8?B?YlBEZUpZcjU1OGUzTEdiMFBScGNKbFIzMHpqTnpKd2tNVFdHU2t3MXFoQkUy?=
 =?utf-8?B?TlFKeEI3NndwcC9vMitBWDltdWk4Yy9BNTU2SER2Tm9RVVBNSGdaUDQ3bTRv?=
 =?utf-8?B?ZGgzTW95cWhwaURiZ1RZUTNQOVdCaUtxZHZ4Ykt3M0NJUzV5dkRBS2lCQ0Jv?=
 =?utf-8?B?YVcwcFZTSXh1dllGNjUxR1ZXbFdDVUg2YlVSV2dEMFhsZlpRejVOc0lSVmpD?=
 =?utf-8?B?NmpHSmVZMlM5VEFkNzZVcGxBZHArZnd6RU5aUHRGaHZwSnpUUURQbGdXNWVq?=
 =?utf-8?B?Y2poYVlxQnBGY0V0aWxSaTlnOG12SDBURHFhanBCeU1kaDlMcHozcWpNcDgy?=
 =?utf-8?B?NzhKZzhJc2Q5bUFJWE5TVWZMQjhKSEpLNHJ4OU1NbWpZSWpJLzBTSzNRVEhS?=
 =?utf-8?B?Z2ZJL2I3UkdPQXc1Y2tPNlRpL0QveHYweU90S2tPdHFyZmZaajNOdkh0cG83?=
 =?utf-8?B?WnFrQm0zS09ITUFZWXFQWmNwWEpkVzd4dUtpSGY2ekJsZTdNVjdrSFdHd1lG?=
 =?utf-8?B?WUdSdmtjZTJPOGFrUmVseUgxakNlOWtZaXhFZU9Xb3JvdTBlY3lQc2wrM1d0?=
 =?utf-8?B?NTZWRFovem9YYkVlcVlNV3g3YjdvcFp0WVN3emdTVHhPdzFYbklLZDBMbFo3?=
 =?utf-8?B?TFZncWdwbGNCMytWUmpWR3I3SkwwN1Z3TTM5NER2VTgwTDNHS3FoSFltQldO?=
 =?utf-8?B?c2JCdXpFOFhRakhXckp6ZlZUVVFqWDNNbnpKY0hMS2FzaVF3VGxVL1IzdVUr?=
 =?utf-8?B?a1JlNmxlUGQ4b1djNS94KzIvNzAvU1BORlJtN1ZaRUF3Rk5adHZzQUl6Zkc5?=
 =?utf-8?B?UnVjdDA2RXlTa1lvemtJSDl3VVZYZ1JiUEkycHM2eFN6SGJIc0hUbEFUQzlH?=
 =?utf-8?B?dk80TEtaUmwvQ3NTd0FmOUJOZlRteElseFZHbUNJaWQ4Um9OMEo2U1dSM0t1?=
 =?utf-8?B?alZyUFc0dGtWdGw0T004OUtWOW14K3A0dEl6UGxqRlIrUWVUR3VoaU83VVJn?=
 =?utf-8?B?TjBtWlg1NUo5dGdxdmVLWnZLcWZQM1IvK2ZuRmZhcGtTVTk0VktyRVNHeTVL?=
 =?utf-8?B?aWc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2df29e0-5feb-49ba-61c8-08dbcf07d948
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 11:54:41.9941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tWyV0hEM6wD77eMEXWac7SPsRa4Nqy3C6kBbZsFA9npxfd/CFSnrc2tEmQV61uUokcKFK0kyie280TYe0Y9LoBV9GiLoQfdRuCnQdtFt2o4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_045453_786207_3D62810B 
X-CRM114-Status: GOOD (  12.05  )
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

Hi Miquel, 

> > +static int i915_spi_init_mtd(struct i915_spi *spi, struct device *device,
> > +			     unsigned int nparts)
> > +{
> > +	unsigned int i;
> > +	unsigned int n;
> > +	struct mtd_partition *parts = NULL;
> > +	int ret;
> > +
> > +	dev_dbg(device, "registering with mtd\n");
> > +
> > +	spi->mtd.owner = THIS_MODULE;
> > +	spi->mtd.dev.parent = device;
> > +	spi->mtd.flags = MTD_CAP_NORFLASH | MTD_WRITEABLE;
> > +	spi->mtd.type = MTD_DATAFLASH;
> > +	spi->mtd.priv = spi;
> > +	spi->mtd._write = i915_spi_write;
> > +	spi->mtd._read = i915_spi_read;
> > +	spi->mtd._erase = i915_spi_erase;
> > +	spi->mtd._get_device = i915_spi_get_device;
> > +	spi->mtd._put_device = i915_spi_put_device;
> > +	spi->mtd.writesize = SZ_1; /* 1 byte granularity */
> 
> You say writesize should be aligned with 4 in your next patch?

We support unaligned write by reading aligned 4bytes,
replacing changed bytes there and writing whole 4bytes back.
Is there any problem with this approach?

> 
> > +	spi->mtd.erasesize = SZ_4K; /* 4K bytes granularity */
> > +	spi->mtd.size = spi->size;
> > +

-- 
Thanks,
Sasha


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
