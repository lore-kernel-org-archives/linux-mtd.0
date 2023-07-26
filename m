Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43CFC001DE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 08:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yE8jqLbdQgV7YYEb6LOv+ju5UFggB7jar4xPluxKNeg=; b=qhtz/6vUPOtcMQ
	WbCmpJUUKg8AGCDoUmBu0zUO7plAVSqkyCcu7uXOr9UO2C14mKbo7FyuXkPm0mV8iicgqqJm4clb9
	p7iTFuWZDo5shrwmSmhZxoJPWLWVv9FOZZFV1WKONdn3tjTrK6HZg4BL91S1Fw0YRZF6kxVS0R3nj
	wPOqtMtyYnYwaqOXj2f6oyZw+iFZ9VTGgyJuK95VlFpuFBerXSP1aK3UFpw7PlLMgkgIfi3QVUvyc
	mFdkl0YOGaH9ZcrME3XW2n0B+idhML953ZlhlvbmKnvdeJaF0dfh1GeowVUFMSJr2uC78zuwEKPs7
	eXLpIvV8Wtv1V4342dzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZpB-009a3Z-1m;
	Wed, 26 Jul 2023 08:24:49 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZp8-009a32-1h
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 08:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690359886; x=1721895886;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8LVSj+UaL+bii+iABC4aeVrlEAXBLGNzhEYO2g83iUc=;
  b=lSdvOl92TMNmKsYmqnFVTrMvZz1aLoDzg8K7LgGWl5FgWL1Q0D4FjsCM
   HZZzcl7L1hL1j0t06+7vajIm36exufR8i0picoqm4D70G/keq+L9uICom
   a7Uuew+g8FvOzm6f2C8MZWOnIyxKRWhVQDIRMfPVZgHWkqUFpHZm7ONq1
   IzI3xNSBQzQtF1sQ1eEPpCFY9vt69TEdPHB4/354GD9mwiZn8cctyHjH8
   4um2TH3/eJiC4ICqQIR+1qmS5JAgRkJ3syQVfQaw7JvpvaPU00NkOo1hU
   E1JYezP9n2ajDUiQKxWMbmeDMdsR3GEI9F70+F8cqqPR94Ja9iAyVOacw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="347566383"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="347566383"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 01:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="676584479"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="676584479"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 01:24:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 01:24:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 01:24:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 01:24:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 01:24:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoQEZSfao+6mayPR0HzIcZUUWV9BWbTXCWuDPWnDI5w7Jw8MP9H3pv5NVBfSHR4ujh5Ofz2PGnIojrfT5r1xb7WeBmvfpz67LBmhow146zZRJgRgLoeJoC4stS8wfrx5u8CLNU0OGW0cQRXqZdNqkF9m7bTBvetJLRqtQk+Y7mwW+rDHbuAFPgSRzUl5TqRMb2fr/bbRq2XIgV1heyURxOLahflTMuN3GDwL02Vg0j54qSNH8bmW7Sd6yEWlN/9xsWxb9fpVKQvJc/BQBYi5LCnvEuOPpqMb13RdRWfRjMPaKFFFAQg04tHWXMJVPJEaVKD/2izC7sCx/yrr5iR0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LVSj+UaL+bii+iABC4aeVrlEAXBLGNzhEYO2g83iUc=;
 b=c/pZUXY9Mg+r/lqsANAgnbBzWCopN70J66M+QNqC6ATef3dHm2FXh3jmRin/zCoIZi63K9V0aSoNt9keqz7Lsi8Csf4qDBKvZyigDjoYNPxBe75vS0YI3ks1WxSWrlht+qsEsSDxzAqIMMNTAKAE+IoarqiUuAlWwoNAqZsYv1+Bpi8iDU+1Sm1SrrcJU+tt3gqYf5Ttg/3UAxWgMMKNR8v5sNjQYBBFpYH1HJQaiBjmNM+BGPjEXP2p3O52sfUsFMozRPU5G9SOm7VK9ZlYbZTM2ugSBBF2U7IWmrPY4zHKpq6dSjQsT3ACFPAppl/QVGZ+6LJZYoR6eX46sz8Zkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by BL1PR11MB5350.namprd11.prod.outlook.com (2603:10b6:208:31c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 08:24:31 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::cd4b:70e7:dadf:68f6]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::cd4b:70e7:dadf:68f6%4]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 08:24:31 +0000
From: "Vaidya, Mahesh R" <mahesh.r.vaidya@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, "pratyush@kernel.org"
	<pratyush@kernel.org>, "michael@walle.cc" <michael@walle.cc>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"Nikula, Jarkko" <jarkko.nikula@intel.com>, "Zhou, Furong"
	<furong.zhou@intel.com>, "Sangannavar, Mallikarjunappa"
	<mallikarjunappa.sangannavar@intel.com>, "Srikandan, Nandhini"
	<nandhini.srikandan@intel.com>, "A, Rashmi" <rashmi.a@intel.com>
Subject: RE: [PATCH v1] mtd: spi-nor: macronix: Add support for MX77U25650F
Thread-Topic: [PATCH v1] mtd: spi-nor: macronix: Add support for MX77U25650F
Thread-Index: AQHZukezhnuwLSWDtEONN1YsR0u8b6/BNBsAgAqMA5A=
Date: Wed, 26 Jul 2023 08:24:31 +0000
Message-ID: <SJ0PR11MB561367FC6A2A9984E636A25DA500A@SJ0PR11MB5613.namprd11.prod.outlook.com>
References: <20230719132700.15274-1-mahesh.r.vaidya@intel.com>
 <b6725f64-7d08-5966-e0bc-17c5b2e846ad@linaro.org>
In-Reply-To: <b6725f64-7d08-5966-e0bc-17c5b2e846ad@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5613:EE_|BL1PR11MB5350:EE_
x-ms-office365-filtering-correlation-id: 5d92fe0d-d73c-4db2-10f6-08db8db1bc68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wXv+bMx8phfQUd5baLxvMJsuE4/tMUu76XKX+qrTOS/zjtNipPYQoiksS6m+ApPed29vXQjn9Fl0VqSzkdsOzLjuesdFsgX+uB9dlz7aRJFYmnwgmaSD42YwJdgs18iNa0QPugPhceCPn/MCfnLSmoXDnxb1JIv4EKMnKx+/8DU3PE8wIOjN8pMuzuVcyfRmv4g6CVo00XHbj4063BfKK5JfSnoOJf9aG2OYFsA7uFKxlysV5LH2/49eW08LvxXKLpUnqP+zjSyvE5O0lhv/sBPpSvkY8K2/CqXu2DQ5gpsYq+Wj2gp3vOdiUs4wefMXZk5NLiTe3OCKJKH9XWNt/UfUWWbBrfISHKLz7pya4X3YVmLwlZdnBRNaclY9CqGYl86wSbbP44iVtQXoS4oPEONfAQumYwyiENPtVa0my5M5zBziGbAjWvkF51mPasJqT8tiNZkbVhrE9MYwyNiowRdMlEUxpj8jmu0NGr1YWDjK77d73wjcw2cW3y/8zfz2KI3n61/GmP02Xset4PUfl3uq0h9428abzCeeGYe7FbwRPbZWFhv33Pk1/dMN592emxs4I75olRnORCUhkr15F1ouWjzZaSAFb+H4jVbP2TA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(39860400002)(396003)(346002)(451199021)(110136005)(54906003)(71200400001)(7696005)(2906002)(122000001)(478600001)(82960400001)(316002)(8676002)(8936002)(5660300002)(52536014)(41300700001)(38100700002)(55016003)(38070700005)(76116006)(66946007)(4326008)(64756008)(66446008)(66476007)(66556008)(33656002)(53546011)(55236004)(186003)(86362001)(6506007)(26005)(83380400001)(9686003)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RldSdG5lOEEveWsrOFVzUHJXNGdoZ2tkVFpYdTFKNUVPeGNSejg5SnVYc3ZH?=
 =?utf-8?B?OGtjc1dabVRqOUJWQ0YzOHJiZ3dNQzlxRUJJNVJhWFZrcWFWV0pQSHZTWE1O?=
 =?utf-8?B?YmREeDNiRVJraUtUZ0JlVmlYS2FCRG9BaVRJY0t6Vmxsd3BCVUZZUEFhM2M3?=
 =?utf-8?B?MEg1Ymd5bUpzbks2c1FFV3VWdzVSWU5kc3g0T0tUaXlKRnN2SFB5Y3ZoR3ZB?=
 =?utf-8?B?cGxaV3VUbFRweitKSVRkU2p3NFpkMlhqdGVjUXdKOC9pdElDY2QrOEgvOFkv?=
 =?utf-8?B?dzBPMlM1eXBvM1ExekltSlZGZ2RKYTFrWUo0a2ZrbEdYcU5SLzQrRkNDd2lS?=
 =?utf-8?B?R1M4TWFTSnUyZ3ZPL1hPckc3cmx6T2NtcGJnOWFDb1FGTE5nZWk0Zit3TWZB?=
 =?utf-8?B?UlRCUUJ2NzZRN0FYQnRsNEpkSVczUGN5TDRtVVdQUEFwakpHRVVaRmxCaEto?=
 =?utf-8?B?S0lOM0RjT3pmcnUvTzl5TFpETnFVWHdVUzZMbWEwMzBWeTZaaXZOaEt5dDdV?=
 =?utf-8?B?ajBkNzlQZENKRDZDcUlveWtad3FpSDFib2x3NFE2TlpBcUdkTEJua25wTE16?=
 =?utf-8?B?OUYvVmJiWFg2WmpDbGQ1RTZ0d1Z2NVZ3czFrQVd1OFBnMmpEQzRXcEw3cW85?=
 =?utf-8?B?cEdkMnQ3T2VpVjVNSENmeENia3RsMkFVZTZuTFdmV081SnVhZVdDZW1FZU5Q?=
 =?utf-8?B?TU0zN0dNcTFPTVhaU09tUzZ2S0QzQ0JrZHphd1ZjUDhLSVdIRlV3WXZGVzJS?=
 =?utf-8?B?OXBIVFRSVzRYSnFPTHFkeUNSOHdoQjdmd0kyV0dDalZzVVNBSWszaCt0Q1k0?=
 =?utf-8?B?bnhETlppNEFuNEdXTTVCYWZjV1IyUWlsUURrczRCaFdoTCswK053V1g3YlNP?=
 =?utf-8?B?Q2dzZm1KSlJXLy9LWXhRdERVNW8xem16bEdoWmwvaGh6WTE4ZUxFTHBWQVIw?=
 =?utf-8?B?cWtzVm4xaytqOTBLS3ljOTh3MWZXbjd2L3M5cEJpWXEwT0dMY1FRZ3hMUXgr?=
 =?utf-8?B?OGwxZEhkRC9hUVVpcFFwRzZKdi9yWDNOY29XbmNUQWkyUmozSmZaYzJiNXgx?=
 =?utf-8?B?Rll0NjdNNjhOcDFvangybVlBWnFyZ1hqREMveC83ZnFVY0NuS1BaZG51L0RC?=
 =?utf-8?B?Z3c4SW9RYUl1WitpOVFHeUJzSGdnTEphdkl5cEQ0VzVaMTJsM25Fc1JpU0ZD?=
 =?utf-8?B?OE8zckdhS0JSOS9vaFBDNndCQjg2ZUZ4STkxSzVoQnduSFRaUGZqU24zUU41?=
 =?utf-8?B?YXN0ci8rS0NGN0dTei9VUlhmOHlYeU1qV0JXRE5BcDNRL2ZuWVR5dWM2QlhI?=
 =?utf-8?B?S0Q4UW1MaXJDN042QzB3ZUpqNm0zK3FvZ1RwNWNPRjB4aFZ5WlMxQzZtWEsv?=
 =?utf-8?B?UjVqbGUxZUsya000ZkR3bklYZWp4dW81N2xSc0NqTGRna0dIWmlIYUp1aHdZ?=
 =?utf-8?B?Z2hFeisrSFl1SElVeWNpY3B1V2JnR3lZd3RwdVVidmZjYVhIaFY5SzlKMEx3?=
 =?utf-8?B?eFdFTE1JazkydVFuekVqTlZLL2NFWEwrNXhjUHQxMUFCNENnY1RCcHdzSHY4?=
 =?utf-8?B?bUNULzFoMUpCdjh3L3gwM1FtY0d1RVNidGJwR2tIbVZBRXJINUpCV1ZmUlNn?=
 =?utf-8?B?ZXFXSGUvbjVISys4ZGRkS2llTG4zazFPSlExM3htTEhhZlhrdzcrV2RWdXhV?=
 =?utf-8?B?OUNpNkhsbWkrZ1dlMklqMFY0dkxMMUhuSGhoYitwNmlkSFZFY1hWMnd2cHlD?=
 =?utf-8?B?dTRlNk13bUVPV2RtWmI3c1dyZDNkcWp6eEw3dUsvU0hPZ1VSanVPWi80TFR3?=
 =?utf-8?B?Q1V6L0cwSW51UHFWU0pHYVQzZjF1eHY0bWxOSGUrcFErdnk2VERQTWZEOWRt?=
 =?utf-8?B?R3lGQjluQ1F0R1h4aml0YWJHNUhlOFZkQ1RtTUM1Z0h4SGNsZmJwQlRNK21r?=
 =?utf-8?B?VDZwL2E1Rjk5NzJnY3BXRjNxNTlGeGlIRmVIWk4vcWlyNXZQZXQxYi9keXBk?=
 =?utf-8?B?dmZ5QzA3cFdzcGRrWjRlaVFYd2pmNnZxODNjb25PYVFBVXJwZmF4OU1MMTB4?=
 =?utf-8?B?bUp6R2hzUkpxT2xNdTIrUHRGWitVRStiWW1pZU85RnNZOTRVU1Bhb3pJdnpq?=
 =?utf-8?Q?ned069/95L+RNXMj/AQQnvMzS?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d92fe0d-d73c-4db2-10f6-08db8db1bc68
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 08:24:31.2335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L6kfixAqa1gDS3daB4LkojKUxJwb9A6CC/26WqqAXsrALaQ4tprXcPNYELI8PnEkrAP2CZVR6/uVb2s12uggdZSW4+aPaWyXUXccw/CI4/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5350
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_012446_672852_C496BA43 
X-CRM114-Status: GOOD (  23.34  )
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
> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> Sent: Wednesday, July 19, 2023 8:49 PM
> To: Vaidya, Mahesh R <mahesh.r.vaidya@intel.com>; pratyush@kernel.org;
> michael@walle.cc; miquel.raynal@bootlin.com; richard@nod.at;
> vigneshr@ti.com; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org
> Cc: andriy.shevchenko@linux.intel.com; Nikula, Jarkko
> <jarkko.nikula@intel.com>; Zhou, Furong <furong.zhou@intel.com>; Sangannavar,
> Mallikarjunappa <mallikarjunappa.sangannavar@intel.com>; Srikandan, Nandhini
> <nandhini.srikandan@intel.com>; A, Rashmi <rashmi.a@intel.com>
> Subject: Re: [PATCH v1] mtd: spi-nor: macronix: Add support for MX77U25650F
> 
> Hi,
> 
> On 7/19/23 14:27, mahesh.r.vaidya@intel.com wrote:
> > From: Mahesh R Vaidya <mahesh.r.vaidya@intel.com>
> >
> > The MX7725650F is production chip for new design from Macronix with a
> > lesser memory of 256Mbit with unique security features like Permanent
> > 4 I/O RPMC, Secured 8K OTP support.
> >
> > Validated by read, erase, write and read back.
> > Tested on Intel RPL, PASS.
> > Tested-by: Mahesh R Vaidya <mahesh.r.vaidya@intel.com>
> >
> > Signed-off-by: Mahesh R Vaidya <mahesh.r.vaidya@intel.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/mtd/spi-nor/macronix.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/macronix.c
> > b/drivers/mtd/spi-nor/macronix.c index 04888258e891..995936ba58e2
> > 100644
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -103,6 +103,9 @@ static const struct flash_info macronix_nor_parts[] = {
> >  	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
> >  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> SPI_NOR_QUAD_READ)
> >  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> > +	{ "mx77u25650f",  INFO(0xc27539, 0, 64 * 1024, 512)
> > +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> SPI_NOR_QUAD_READ)
> > +		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> >  };
> >
> 
> Does this flash support SFDP tables? Here's how you can determine that:
> https://lore.kernel.org/linux-
> mtd/cover.1686557139.git.Takahiro.Kuwano@infineon.com/
> 
> If yes, then you could use the generic spi-nor driver, thus you won't need to
> explicitly define a flash entry,
> See:
> 773bbe104497 mtd: spi-nor: add generic flash driver

Sure, we will check on this flash and update on the SFDP support.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
