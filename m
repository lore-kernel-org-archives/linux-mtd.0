Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F8EEB64DA
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 06:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJ/5dqvxQ2UzM8LH8UVWXllh9fATItxCRRjperCBR9M=; b=xZuERgnqvzms96
	U1YLO4dfkzeCdCNfPZdlS9Uytiiio3r8OFeHbeA0L6S96r/kwetXwO6SwPoEkOBYVqkPnElc8JSMR
	yn8vZamOz0BCLKVLFgHpsVHTJltq85NNUyqb7ZLiBe+2lnf3brsMt+l52jT5O3pMgD3bJ/61uO+VP
	AnWNwtG2mZyxkm7aTbEv+ZhvYcuLBWgFLqanZpBAXbQpdXn0pM4EIZTgxWykUx5v2e5CagdGSY2yn
	qS+0IBoaJ8BWZZBQg7f6SrZislgBdGkSXilwSIRJwdxanCTDQ+EXwcDsz18XJVc0zJzD0oIeVnXIw
	t9LQs3QK8QuwoZKYlHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKvFo-00ACD5-1o;
	Sun, 16 Jul 2023 06:29:12 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKvFl-00ACCP-1c
	for linux-mtd@lists.infradead.org;
	Sun, 16 Jul 2023 06:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689488949; x=1721024949;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KrAdlbCLz/nSLKA4Cpxd/YjTJ6aYknwXx4RZObgFRAI=;
  b=GEGxRjyNK9ixRb6lGs43H5aERZSwoILat//bjl2dRP8F2tqYR43Ep76P
   8nxCqhXewGnB25qnBhAx650biWEAlnZqEZzpDq1bfERpL/ThmxaHWhjCG
   Lm5F5SqoVL2q5skxkiZJcDZLU/67yqdkdrxi+8k+liqaExYemtPhUgnmO
   ZktlZPCF+RVTcpubE07seJLK/Y/NmO6mKaUDAnSsWhknwfZOqikjnN1sU
   voqVPZOngcMETrwpf8RYuL6Mch1XuUPsCX0O6OT09DxgwqYaP/gaJf9k9
   tKZmYncb84r02mlgB3/rkIkO2LprAzVOBp1VOEmSdxVhVrXbKglF00cb/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="429491258"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="429491258"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 23:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="836506405"
X-IronPort-AV: E=Sophos;i="6.01,210,1684825200"; 
   d="scan'208";a="836506405"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2023 23:29:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 15 Jul 2023 23:29:05 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 15 Jul 2023 23:29:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sat, 15 Jul 2023 23:29:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 15 Jul 2023 23:29:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncDclADZ03UcTU8MjRUkCH4FQmvmf+1kQQfRJgzxDNxIJERQOSm5fyzyVh9pBSA4imzKSyugDxX0PiyNDGwpSakfcRPyAsu/sAMfMEUz9YnTsK4bnIAiedEjkod9uk+Qpok8ZZhT57jTwQq8pkwsrU9XHc0j9edpwyDrHArSZPriopHXh6lDeyACyKcjuOKX5hXvIBVyI3CKLjAp0tFndkp/o/TqkWCH1ALs6Xs2lTHw3HT+w3rHsuSjRnIJ7Wbq/8oR5iciz8oE5in2leLsxBbymAjLsqECU8SU9tJJOsosvXvrdATHPawE3jbSPp62s9mJIRQIoxQTo0x+IZ3oLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrAdlbCLz/nSLKA4Cpxd/YjTJ6aYknwXx4RZObgFRAI=;
 b=oEh4fLl0ECbX5Z0kiwdJ9GHx2ns3LXBAyb8faQkgV5WkCziQ0689YV3tVyvk5HjB+2Zr+s9a32YnYlFgzw35/fzh+4dpg1hgFVnL3KxLgvf+u0SiBc1yb6r+BaFcG7tR8r+5num0UqBZ/rniyGvgWtaUh3aIHcV54lcoNSS28OtX98JPqlm1agdHoZOiy7V/ByNxZLPx6vwhdViIQWn9W/9Bb0536o8FyQNp+IuRqboFsSsRGAnYN5wPyvBtsdY0vV8I6OiffkPiazGv9Rdfc70ZQY/uA65gE/S3WVua5CP+0VERgb1qStY724xD+bKzij+sYP+2L0/IEHvhO7QC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by IA1PR11MB7870.namprd11.prod.outlook.com (2603:10b6:208:3f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Sun, 16 Jul
 2023 06:29:03 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::f8a8:855c:2d19:9ac1]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::f8a8:855c:2d19:9ac1%7]) with mapi id 15.20.6588.031; Sun, 16 Jul 2023
 06:29:02 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Winkler, Tomas" <tomas.winkler@intel.com>,
	"Lubart, Vitaly" <vitaly.lubart@intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 1/2] mtd: use refcount to prevent corruption
Thread-Topic: [PATCH 1/2] mtd: use refcount to prevent corruption
Thread-Index: AQHZo3n2ZB8U6WhTx0+aElx0ckVEpq+5lImAgAGKEwCAAPTUYA==
Date: Sun, 16 Jul 2023 06:29:02 +0000
Message-ID: <CY5PR11MB63666C8DA33C93E1DC3BCB21ED3AA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230620131905.648089-1-alexander.usyskin@intel.com>
	<20230620131905.648089-2-alexander.usyskin@intel.com>
	<TYWPR01MB87756794A30EB389AB017EB1C234A@TYWPR01MB8775.jpnprd01.prod.outlook.com>
 <20230715174112.3909e43f@xps-13>
In-Reply-To: <20230715174112.3909e43f@xps-13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|IA1PR11MB7870:EE_
x-ms-office365-filtering-correlation-id: 67dd9932-d470-4b37-ac35-08db85c5f271
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WmI13oFM9JQJjH4hljzOrDK6D8fZkdgj67FMrHjvkLX1IWiob0RtNCiTEKw9MvGz9h5bXZAHilalaYwqC8oa9okCvcEIy/FxNvF278de9TMr0LS2iy6vc3KkYuuXBm8VxWUpjHLl/UYCzmaBJTld589dhl8EEGCZu5g0Pm0Ei5bj9gb8mONVi5a1WzzojHvN5/WdZaazbKL6d4HtN+OyrK37GzexWwvd4nrlZuEzRZnVaRB2j2yJ7PSGJMHxj3kHW/wW999HhOOthVo0JBN0KZjpHmlqYdwYFpJKcUot7k2XCmHZYZKp69bA7MpkogWHZOkjha6uZbhhEvxQ+OTeiVAYAWS/Hf/VLzSwkxBnz5YPYacpgnS1ERnfrNV9mShpQ+SE1PIzBvPLXNZruGGZOYyzTrjar7IIXfEtxu0SEt6u4uxqhF6ff4j+OAzcs+X1NWEzBbVb2w/tBUJn8jDohDK7dSDP7NGH0Eang+3eRY/P6cO0UQeiQ8kAp5XqZzxh/DUzTzuPqvJyDVKeOzWMai1MA1oslyRTEMDn+aYuVDVO7PpLxOz+iNnFZP6BizFmbB7l7taAbAjw484ANqjRBNIobbl3I6DQ4+0y8KeUsrPgZOx6iprnXqOvzI0XyQgk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199021)(76116006)(2906002)(4744005)(7416002)(7696005)(71200400001)(5660300002)(83380400001)(6506007)(26005)(9686003)(186003)(52536014)(110136005)(33656002)(54906003)(82960400001)(122000001)(38100700002)(38070700005)(8676002)(86362001)(478600001)(55016003)(8936002)(316002)(66556008)(66476007)(66446008)(66946007)(64756008)(41300700001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEtGSG03bi9xSlFJbjZxREI4Wkk5L255RXBIMk51ZUx2MkE4VDVyZkRoc0Zq?=
 =?utf-8?B?ZDV5KzVEL3VjR1UwU0drWFdDZzZvejNLNjJCSEoxWEtmaGxIc1hOK1BQRnRK?=
 =?utf-8?B?OHlRektLUVJMQlA4K2x0NFkvcWVoYXBCeS9NMTBTUUNqVEUxRjRXMmlOek1S?=
 =?utf-8?B?ait6Mk52bXZ5b0U0ckdkMmo2Ync4dlpHV3ZXbVVXWWgzeHVFL2huOG1yZFc2?=
 =?utf-8?B?emswcWtRL2ZKOFVsSVNEZzdLQk0vWDhrMzRueFlCWVlrQjkyL2NZcmNjWkRO?=
 =?utf-8?B?OUFjYVl0cWpDZW9xT2g5WGEzUjN1dy9FRmlZTTUwTFozdEVSYWplMGNHUTZs?=
 =?utf-8?B?UVErUGNLQ2VkMzd2bG9xSlRFTW5rZU91WTJMaVl0Ym5tSDNwSHAxTzFKSzBj?=
 =?utf-8?B?QTU2bVZKbm5MQlVrK05OelAvQkVJcExOWlZoeXgwdFpEcURZdm5ZUHB2M3VB?=
 =?utf-8?B?RTdrK0hJRTExbVRrYThTek5pVmZzaExrZkxLL3hnQ3NwNXJuQ2E0ZVpxWGxR?=
 =?utf-8?B?OHFtaVNGSUQ0cWpMdWlzOUQvUEVXVG1EN1BKVTM3S1Bnd29zYy9HWXRSQmMx?=
 =?utf-8?B?WDBzbWlJbmVhQ1hBM2RhN1JCNWJiK2tFdVFKc1lNS3dyeXlRSVFUempjZm5S?=
 =?utf-8?B?YVB4dnpLMEZzWTJtS2VKQk82Z3lBejMySldRbHptYVpOZE5hdS9rWncvUDNU?=
 =?utf-8?B?VTZEM1MzVEhhY3BwNUNsTUVHWXd1eEV3Q0xXYkFadk9ucS9EbktlRG9xL3pv?=
 =?utf-8?B?Nm1tcElndHdMRjB1b0srZVIwM2xVWlJ3VzRqSDJJMWNVMHBtQ0I0VGsxNnNj?=
 =?utf-8?B?cVBuWjBlN3dJTUNrZVZ0ZU4vQ094Y0RiZVhiMkJuYzl0cHdlUW1CT3AyMEdW?=
 =?utf-8?B?Y09zeEg0eGJ1WDRZQmRnNDM2TXM0V3kvKzJUR0NJMWlBd2lIK01mem4wdTRm?=
 =?utf-8?B?cjh0SkJ4YThXTUM0VThvZFl6VXkzb2M1QWYyL0taaTB3Q1pTQ01Nc2NUcVBT?=
 =?utf-8?B?OGJ5MVpDRjd6VEQ5dmc3UjI3MzFpODEzR0tJSjdienI4ck5lREtOUDF0M0pX?=
 =?utf-8?B?UUJseDUxZzVEckNSUjE2eEFjdEdiSWFHRTNJWk9qcStSbXFGZmRmY0REWVVh?=
 =?utf-8?B?OElobFZPL005YmtNcW9jc1VidHlvOU1tU2VabXhYMkNZc1EyRkE1M0pTR0lX?=
 =?utf-8?B?a3JPODRzQjUvNGZ4cGMvZ2UxYmV3aVIxcW55bEpiUjVuTEdldW81bzlZZVo3?=
 =?utf-8?B?c0gvbFkybHVvWVVmNHJxbGQyMU5IWjhXMFF1YWlmLzQ1cVJNcFVjT29VeE4r?=
 =?utf-8?B?UU04UmFjZTJ5Y0hyYkQ0bmNoV0NqU1Z5TTFFR0YwRUhCRERUVXZFenN3SDNi?=
 =?utf-8?B?a1RIYUo5QzJKU0NscHRXeXhNa0pKQ1F6U1d5MnVFV1hOMUNOVlZTTTVFUGRo?=
 =?utf-8?B?OGNrMDhWVmhrZE5DR2QySlBuSFluMmRUSVVwaVcrL2JReDZMQU5hTlVRUm1V?=
 =?utf-8?B?QWNGR1ovMFlMdUp2a3Jlb0hjcUFOdXRVeWs2MEVVUjVuMzIxZVJ4cmpZSDYz?=
 =?utf-8?B?LzRBMFVuRlBLckNuYUh1NlVVNEcwZGpSWWJHeG1yblYvRDhFMjcvdk1jcXUx?=
 =?utf-8?B?T2ovMDhkb09GUEFwcjBicFk4SVdnNFVJeUhLWmE2cHZzNkdkZDlqSHFGNjR2?=
 =?utf-8?B?TGZUVHBacGNVbmVBK1M1TE9FaEhSZVA3REdRaEowQ1NDblRMK2o5TkdoeHh6?=
 =?utf-8?B?NjdxSG1jMmt0VHBsMWJvQStyWmN4dVhObmJPb2wrM2hYbXp1NDZtNERCNUgv?=
 =?utf-8?B?bFU0ZDFiQ0xQS2dObmhFSlhaTUNKMUZEd1pueGowWkpuSDREMFBWeDhOcUVo?=
 =?utf-8?B?d2dHWHluSncwaEVwSm42eHdZYlB5QzdmSnhKVnpROTZ1RUlCc2JGbWU5NFlW?=
 =?utf-8?B?b2RiOFN2MTZVWldnTnhKUTBDeU9nQ1IxYkVvZEV1VTQ5SkR3S2VSOXd2d1BG?=
 =?utf-8?B?VW5zeGV0Z1p5SWU1SHU4SG1XVTFNYlZ5M1hNTzNuU0d6L1BpdXBxbXo5d3RP?=
 =?utf-8?B?T1IzcGVYQmlBS3V0R3I3UFlIZVRkTnNmUFpITzliSjBabkpYMmVzYk02Y2NC?=
 =?utf-8?B?eU80R0VjaDQvelc4Q2tFbWM2MHpZVXZyaHFOMURNUm4vU2xyTDJITldodWZI?=
 =?utf-8?B?d2c9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67dd9932-d470-4b37-ac35-08db85c5f271
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2023 06:29:02.5602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joddXIwCo/k6qnGuzJ5Uy49YaC2dAvbidzBtR4Jx/odmugxAOx1JTLlWCnSQJ5CSi3nrcoE4+7CndAmMFT/tfBbc+SbWV0pd9JLqlZuLfTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7870
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_232909_618807_EE06DDD4 
X-CRM114-Status: UNSURE (   9.92  )
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

> > With this patch applied, when I load up the module, I get the same 3
> > devices:
> > /dev/mtd0
> > /dev/mtd0ro
> > /dev/mtdblock0
> >
> > Upon removal, the below 2 devices still hang around:
> > /dev/mtd0
> > /dev/mtd0ro
> 
Our use-case do not produce mtdblock, maybe there are some imbalances of get/put?
I have somewhere version with pr_debug after every kref_get/put. That may help to catch where
it missed, I hope.

--
Alexander (Sasha) Usyskin

CSE FW Dev - Host SW
Intel Israel (74) Limited


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
