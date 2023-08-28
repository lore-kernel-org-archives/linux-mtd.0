Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87CDC71153
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vImRN6jVLYlmaA0tXVlMtRqZ/BiELQTS9QG/QXwcNpc=; b=ZSXzqlOSRql8uN
	Qi9huT1qQtONrZ04MC+W+epYDkIk7end6OVfRz+HBh0M82ODnJ9oDjxHLxY7f1SIg8WGegP/jMcGu
	bJhiXS+FwVXATKuV2DTmlVAE3XqZzlpJDGtTqWiG0j06pHwhAo2MoFFiaKp9V0aVQ8IIx7ykeJt7q
	Qson+SNraDxMySeb/vk37zum5vcgsrU2eh3oQMsQuVsjc8ztU54Ph2Ogu9BgBD14TNjWnCaAwt8P9
	uEF8VsJt+2aLxMIBnYCFuw1QmkJK7ZdKjh+AR+keQ2aY4IR0nXcWqVldPHv01lXUIjRZzOFERLwQ2
	dgnbj4mB/PU7PV+AU5oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qacL4-009dgy-2K;
	Mon, 28 Aug 2023 13:31:30 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qacL1-009dgH-36
	for linux-mtd@lists.infradead.org;
	Mon, 28 Aug 2023 13:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693229487; x=1724765487;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J72EpWDi0LCxhyHiPaW/x1LkUzmNo9YrygOLW5vOnsg=;
  b=BuTGBib225pcNlLhB66oLvI3RV5jN4SnaQBwM/d4EUs9Pys+RkSEhL4g
   xUwuFuQr9Ru3GWJ/2Gcm17J4T/Ho9GVeCHoNiyRFY7AbFIoBuI8P8Ftj6
   +qqS3gzTjpw/RMHbpreZ6KvWUTdLUmdyffAzdWuV2notiKTd9mfoqfRYA
   8qbEpEEdgrkMRrEOu3F3P6/bEOHqUyJj4LIK8pX9aI3NKrJDVNW/+Y7fj
   +7iR79AfHpNWk8uhnnOexSv53FMI9GFRNpS1zGYD+cBNc7MsoSus6taFC
   exzMPOzDDK5tH4zzxHgJAMvJYES1G4BFiUGe0a2c027r8nFQROFElfrWS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="372510184"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="372510184"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 06:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="852859185"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="852859185"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2023 06:31:21 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 06:31:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 06:31:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 06:31:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsJKbs+GHyIWe5ppXBZRwq9ORBEkIsjz/bDdOL3bGV92sHpLus6R4E+c1SJt0x4sskt85q74x7fZJxsYVcQ8+p7Ro0My8Xy2DmkN+zUNIf5x0CppZA8RzqSQF8pDCTt6IIQDPhD4oMnss9ZiqQfOL+vqjEks3LrxEmkaBhY9rMAtcVnQdmty68ACW0YNBnWYbZv22Py2Rpmqaj3MAg0iWbDtAh1aA48A9sMw/4518Czlorok9QQJMTM8FKDygcMqRIKfOWscJQjCg8bRDhDR4DtZ8mu0PhlvhOZDmJ0fSNG1X1jo1wojCKPx8kqymy5vYMAXDeNvpF8pQTzQKhiaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J72EpWDi0LCxhyHiPaW/x1LkUzmNo9YrygOLW5vOnsg=;
 b=IIE9xTRqz+eH3K9GMKA2n/CXVOcGeYtmcK8jjlPFMlqSLKQwLGa8/Uv7nQkHLR4s5kegMx35A5rvLpinDXljVM7rr24zs/y5u618uge4JIcz6yXf37HX8yBLVrTBXO+A+7tj21rR2OPymp/npznUJchy3fGQNbcKyrlTE0Hix5yQF9tLAIuDADegc2YIJVdtq9xa6X+pqJ0HOQM7IqRsVnv5DilzTWnnjh2Nn8ymkAsc5ONLGtZeCviPJVWB57+ea+2x8GNoloS4a7iVmtRXmMn86WcujToFF6t+SieoX+x2I2DKfQFAvut9PsGFhXExarlyrDlFaN4uOyMCDvR7Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) by
 LV8PR11MB8559.namprd11.prod.outlook.com (2603:10b6:408:1e6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 13:31:17 +0000
Received: from DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::7c76:b797:1cec:b206]) by DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::7c76:b797:1cec:b206%7]) with mapi id 15.20.6699.035; Mon, 28 Aug 2023
 13:31:17 +0000
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
Thread-Index: AQHZukezhnuwLSWDtEONN1YsR0u8b6/BNBsAgAqMA5CANC8EMA==
Date: Mon, 28 Aug 2023 13:31:17 +0000
Message-ID: <DM8PR11MB56083DF77695E0CB25EA7587A5E0A@DM8PR11MB5608.namprd11.prod.outlook.com>
References: <20230719132700.15274-1-mahesh.r.vaidya@intel.com>
 <b6725f64-7d08-5966-e0bc-17c5b2e846ad@linaro.org>
 <SJ0PR11MB561367FC6A2A9984E636A25DA500A@SJ0PR11MB5613.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB561367FC6A2A9984E636A25DA500A@SJ0PR11MB5613.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: tudor.ambarus@linaro.org
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5608:EE_|LV8PR11MB8559:EE_
x-ms-office365-filtering-correlation-id: 596a1c92-301c-4e5e-5678-08dba7cb0f28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i4zGWtAy3Ez8Fvmf41qJ7Bu/1CcEnsu/YmHiS0Rpk964wxS/H3SHPyz0pA65is8LoT5Sy78WYmK7hpA4bOoCRF9kkQBwl0h/6Ee2RnopI0kT5WI55jSRg0max9YgPk1C3kQYBnkNDfJFncS8snzPHo8kK5HMY6/4AIVhyBwF1VKRNqppl0nO29F+EMEnLuUYV+jYsYS6kKZHQz9DN5lP7o4ZT5v/6r4bPpEbO9wudTzNPK6w19Ukmyp/vGpimndwsce/8xa7y2v+5vnBuvq6Y+rzi44se/IgHodKoCnougCVS99AUZJ49Wp7at/RtlYVJtlIWIhsbwr9LGx4tTD6udbZsBmkxbNV/6/VM/+qR5bS/9Hutu4ocQOF1kcmrGllu0DmAe/ImADseNGuY9O0l1JAhmVHKDjjLQq4BPXiTrndgJerx8zzeGfiVyN9AvifikaTbOyNUpAiFaRhNwG9ubHAtE3pMlscq2811P4iQsVPMZsNgQ6jlYTvfEsS7G76LtrARhsBh32vVyR2kTNKtJyrhaU9VM7JGE/A9JsGQJMfnILP2UhGd0QwyY2JNRZ+HD9ADFnWZkpKf4GcPgRmeBw5lYgey71b2hsBmZBwabLQlNSOfdLLSRWXHjz2DR/E1xXmzC9kWI4QWPFvopfmFNvZmPzJ1bsGEBrUu530Zds=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199024)(1800799009)(186009)(8676002)(8936002)(4326008)(2906002)(66446008)(110136005)(54906003)(66946007)(66556008)(64756008)(33656002)(66476007)(316002)(76116006)(5660300002)(52536014)(966005)(41300700001)(6506007)(7696005)(53546011)(26005)(9686003)(55236004)(55016003)(38070700005)(38100700002)(122000001)(478600001)(83380400001)(82960400001)(71200400001)(86362001)(473944003)(414714003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWNiZ0VTWnFtYklwRHpINmtvdTEvK1VOTld3YmovaytKUS9za0crcWVWSHBp?=
 =?utf-8?B?bzErY1I4dFJsMksxZVl5NFd4MjNKR05aVDduSVR3R0t6dWYrblhvdXRNSmFq?=
 =?utf-8?B?RU5PcmNlSnJ2emVhUEptZlI2bURhVEFKNCt3cWMya0UxWDczQmtUdFJPbng3?=
 =?utf-8?B?N3RRcEIvang0VVUvNG9uVUZiUlNSMzZPVE9XUGZnZkFTNEFhV0ZqMlMwOHRZ?=
 =?utf-8?B?RDI2RWxMeElQWG9nMEIvWGFlUTh5eFpHQlF2a21XVUt0WTRFckV3S1lHL3ZU?=
 =?utf-8?B?T29jYWU4TCtrbVRLZGNXSWRJV2haaktyZ1BVSE4raE40Q244eEQxR0hBditB?=
 =?utf-8?B?K0kvUDNkOGR1NFBNMGZEY0NyUDdzQXorZ0RGbEtObDZXUFVVMHd5UlZIVXhI?=
 =?utf-8?B?K2xLNCtFRk95ZmtwczVZanU3aWU5ZHhIMkZmbitsdnZSbHJ4SHQ2bVFBZW9J?=
 =?utf-8?B?ekJRcXFjWm1YajV4bTJyQU1TMGcxLzlMamNWd3lsQlE4TDJzQ1JzTFlnOHJa?=
 =?utf-8?B?Vy8yemMxWGRwU1BVTzJ6TUJiZWFYWHBYZEY3dXpULzN6Tjd5Q2RheWt1eVVE?=
 =?utf-8?B?WFhocVM0MUxxK1V5bmI0TmJ2SmlKNjhGSFBxclJlK0N6WWhKOC9CS1BySm9w?=
 =?utf-8?B?eklzVGpWQlpWTnRCVSt2eHFNakV4S1MycWtKUWNneTQ0VkpMNlJqM0xnSVJF?=
 =?utf-8?B?S3k3YTR1T0F3bVJaWUZQWXkxU1B4V1VmM2ZhbmJqVkxxY21xdEkxZlFZOVVW?=
 =?utf-8?B?YWwzMjNCUE5zeUQ0NE1pMHNlR2RVODkwb1c5Rk1FVWFtQzd2U0w0NnZnOXoz?=
 =?utf-8?B?ekpGTy9RZU44Q1RNWGo0Sjdkdmh3M1ROOFZYTVlqSlFqRVVYemNXQmtGRXJu?=
 =?utf-8?B?ajBXTld1UkwwR1ZUWGpST2w1eGloWUlLeUF6VGVWZ01vbDNhQ2cwQzNxMmhV?=
 =?utf-8?B?TWx2UmZhcHNVcFE4ZU1DRFRUOVpEQnM5YzkvZjZEZE5pYURMTzlSdHBBTDlz?=
 =?utf-8?B?SW04YmVBMFpHRUl0Q1VKUnBMTFM1OUlOUFhVNCt0SmNydVJraERBeWQvZmJP?=
 =?utf-8?B?YTNJZnMyTHNod3hkNFdCRVdJUmNHekRCQ0E4OW44OG5HZDQ5eEVFczJTTENZ?=
 =?utf-8?B?b20yQ1RMZEYxMjNjK0VMdE9PTUpsL1RjMklrVTNUMU52K0V1QjFOanlwOEw3?=
 =?utf-8?B?VXY0U0dQa1JpY1laMy9SQXJzT0dOR0RHS0J6emNJUWkvc2FrSENFbmpOK3dS?=
 =?utf-8?B?Y01YS21SazlPb1hkMjMrckg0QUZZYWIyM3k3VFBmSjR0NHQ1ZGRZbW05bW5v?=
 =?utf-8?B?MjR2UnA0aEZleUNadXN4WFJZLzZjM2Fjek1aRENLL0lFMUVSTklCbWpXb0sv?=
 =?utf-8?B?anpRWURaVERhYmxlVG1OYk10bjNNUFgxRUJ2RW40Rjd2SWUzQWVGUms1cVFW?=
 =?utf-8?B?NGhSbHdOckFQbWNDbjFCSGIyZTlvQWNIWkNyamhRRlJtWHI1Q01xY0tzSjc1?=
 =?utf-8?B?Uk5UTXNRN3pqNlVPbWhud29jQVZZYWxkNnl4TkE0aE91c3hSTTV4VjVHOEtZ?=
 =?utf-8?B?ZUFVbmdUeXM3VUxnZDJwZUxUWDVUR2Npbm5ENnFZZUQ2RHZtSEttNUhPcHJj?=
 =?utf-8?B?V2k0UEJnMmVIaWVsMWNLYUpiUXcyVDFXcDAweWo5RWQ1Ym94M0ZkVlQ0ZXFo?=
 =?utf-8?B?YkxNeWpmbXdhaE5acDNSNXJ1VmlmZXJ6Vk9BenZkejFjOURDWGZmeUNPbWhr?=
 =?utf-8?B?TWx2RnRMODJ5WmhGQWgzYytvWk1idVowZWd0S0QvK1NzajJmcU9kQW9jV2J1?=
 =?utf-8?B?V05sY2tXbUJLNm5NT3dCYTVua3ZpOEkvejFFOHJDNjltTTJLL2laYk9yMlRE?=
 =?utf-8?B?ZXNZaXZkM1RqNnlBTHF5T0JJcVJnVXdJSy9uckw1N01VcXAzWUlhUXQ1SWVk?=
 =?utf-8?B?U2dSM1Q0T09GdDJBdm5YOCszeDlEWkw1cTdqQkV3KythWm1UQytTdGxIbjIr?=
 =?utf-8?B?Zi9DcEhjWWJLSU16Y0lxVjlCZjcxcDNTankraXplZWdUUHk3WHZzQmY3QllC?=
 =?utf-8?B?NWl2ZEs5K0E4VFcrbDZtZHQ2NWt3S0tjcEFSMFpSRkVmbVNSRXhoYit4b0FU?=
 =?utf-8?Q?qTxgvpiT3vwUHIkdGZvcfIs7O?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596a1c92-301c-4e5e-5678-08dba7cb0f28
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 13:31:17.6966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bM0ofFCt+sCazqQV0IOD8Occm0JFlmchjknxZnsczIvDP1HJmniDhBi5W6thw0fv9B0hyu8dCSwZLbyi+Fymqox1JQGpC1kXDe+7bUoKrHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8559
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_063128_048888_954479CD 
X-CRM114-Status: GOOD (  27.07  )
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
> From: Vaidya, Mahesh R
> Sent: Wednesday, July 26, 2023 1:55 PM
> To: Tudor Ambarus <tudor.ambarus@linaro.org>; pratyush@kernel.org;
> michael@walle.cc; miquel.raynal@bootlin.com; richard@nod.at;
> vigneshr@ti.com; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org
> Cc: andriy.shevchenko@linux.intel.com; Nikula, Jarkko
> <jarkko.nikula@intel.com>; Zhou, Furong <furong.zhou@intel.com>; Sangannavar,
> Mallikarjunappa <mallikarjunappa.sangannavar@intel.com>; Srikandan, Nandhini
> <nandhini.srikandan@intel.com>; A, Rashmi <Rashmi.A@intel.com>
> Subject: RE: [PATCH v1] mtd: spi-nor: macronix: Add support for MX77U25650F
> 
> 
> 
> > -----Original Message-----
> > From: Tudor Ambarus <tudor.ambarus@linaro.org>
> > Sent: Wednesday, July 19, 2023 8:49 PM
> > To: Vaidya, Mahesh R <mahesh.r.vaidya@intel.com>; pratyush@kernel.org;
> > michael@walle.cc; miquel.raynal@bootlin.com; richard@nod.at;
> > vigneshr@ti.com; linux-mtd@lists.infradead.org;
> > linux-kernel@vger.kernel.org
> > Cc: andriy.shevchenko@linux.intel.com; Nikula, Jarkko
> > <jarkko.nikula@intel.com>; Zhou, Furong <furong.zhou@intel.com>;
> > Sangannavar, Mallikarjunappa <mallikarjunappa.sangannavar@intel.com>;
> > Srikandan, Nandhini <nandhini.srikandan@intel.com>; A, Rashmi
> > <rashmi.a@intel.com>
> > Subject: Re: [PATCH v1] mtd: spi-nor: macronix: Add support for
> > MX77U25650F
> >
> > Hi,
> >
> > On 7/19/23 14:27, mahesh.r.vaidya@intel.com wrote:
> > > From: Mahesh R Vaidya <mahesh.r.vaidya@intel.com>
> > >
> > > The MX7725650F is production chip for new design from Macronix with
> > > a lesser memory of 256Mbit with unique security features like
> > > Permanent
> > > 4 I/O RPMC, Secured 8K OTP support.
> > >
> > > Validated by read, erase, write and read back.
> > > Tested on Intel RPL, PASS.
> > > Tested-by: Mahesh R Vaidya <mahesh.r.vaidya@intel.com>
> > >
> > > Signed-off-by: Mahesh R Vaidya <mahesh.r.vaidya@intel.com>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >  drivers/mtd/spi-nor/macronix.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/mtd/spi-nor/macronix.c
> > > b/drivers/mtd/spi-nor/macronix.c index 04888258e891..995936ba58e2
> > > 100644
> > > --- a/drivers/mtd/spi-nor/macronix.c
> > > +++ b/drivers/mtd/spi-nor/macronix.c
> > > @@ -103,6 +103,9 @@ static const struct flash_info macronix_nor_parts[] = {
> > >  	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096)
> > >  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> > SPI_NOR_QUAD_READ)
> > >  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> > > +	{ "mx77u25650f",  INFO(0xc27539, 0, 64 * 1024, 512)
> > > +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> > SPI_NOR_QUAD_READ)
> > > +		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> > >  };
> > >
> >
> > Does this flash support SFDP tables? Here's how you can determine that:
> > https://lore.kernel.org/linux-
> > mtd/cover.1686557139.git.Takahiro.Kuwano@infineon.com/
> >
> > If yes, then you could use the generic spi-nor driver, thus you won't
> > need to explicitly define a flash entry,
> > See:
> > 773bbe104497 mtd: spi-nor: add generic flash driver
> 
> Sure, we will check on this flash and update on the SFDP support.

Hi @Tudor Ambarus,
Very sorry for the delay in our response.
We have checked and validated to confirm that this flash MX77U25650F does support SFDP tables.
Below are the test result logs executed with the SFDP support indicating write/read being successful.
With this, I think we can close this review/mail chain. Please advise otherwise.

TEST LOGS below-:

spi-nor info:
user@localhost:/sys/bus/spi/devices/spi0.0/spi-nor$ cat partname
spi-nor-generic
user@localhost:/sys/bus/spi/devices/spi0.0/spi-nor$ cat jedec_id
c27539c27539
user@localhost:/sys/bus/spi/devices/spi0.0/spi-nor$ xxd sfdp
00000000: 5346 4450 0601 03ff 0006 0110 3000 00ff 
00000010: c200 0104 1001 00ff 0300 0102 0001 00ff 
00000020: 8400 0102 c000 00ff ffff ffff ffff ffff 
00000030: e520 f3ff ffff ff0f 44eb 086b 083b 04bb
00000040: eeff ffff ffff 00ff ffff 00ff 0c20 0f52
00000050: 10d8 00ff 8341 bd00 82a7 04db 4403 3738
00000060: 30b0 30b0 f7a9 d55c 009e 29ff f050 f985
00000070: ffff ffff ffff ffff ffff ffff ffff ffff 
00000080: ffff ffff ffff ffff ffff ffff ffff ffff 
00000090: ffff ffff ffff ffff ffff ffff ffff ffff 
000000a0: ffff ffff ffff ffff ffff ffff ffff ffff 
000000b0: ffff ffff ffff ffff ffff ffff ffff ffff 
000000c0: 7f0f f0ff 215c dcff ffff ffff ffff ffff 
000000d0: ffff ffff ffff ffff ffff ffff ffff ffff
000000e0: ffff ffff ffff ffff ffff ffff ffff ffff
000000f0: ffff ffff ffff ffff ffff ffff ffff ffff 
00000100: 3c9b 96f0 c5a4 c2ff ffff ffff ffff ffff 
00000110: 0020 5016 9df9 c064 fecf ffff ffff ffff


mtd info:
user@localhost:~$ sudo mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 33554432 (32M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

mtd read write test:
user@localhost:~$ sudo mtd_debug write /dev/mtd0 0x0028000 18571 qspi_write
Copied 18571 bytes from qspi_write to address 0x00028000 in flash
user@localhost:~$ sudo mtd_debug read /dev/mtd0 0x0028000 18571 qspi_read
Copied 18571 bytes from address 0x00028000 in flash to qspi_read

user@localhost:~$ md5sum qspi_write qspi_read
0c86a86c169a8a296960888a78b75cba  qspi_write
0c86a86c169a8a296960888a78b75cba  qspi_read

user@localhost:~$ sha1sum qspi_write qspi_read
1321befe7c82bd7488d5be933ccb6c4459c3207e  qspi_write
1321befe7c82bd7488d5be933ccb6c4459c3207e  qspi_read

mtd_erase test (all but one sector):
user@localhost:~$ sudo mtd_debug erase /dev/mtd0 0 32505856
Erased 32505856 bytes from address 0x00000000 in flash.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
