Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A008CCA479
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 16:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0vkmhLXqK1Be9b3nYFoQzc8h6BgXrzBPIUPp6p71u0=; b=gXZ+KG7Je1WXvw
	LEYYe5L/cUoJ4VY2ZOuxHfHi4c7LRndB579lSfTJaL4/QdWyRSoKRyP3WJrr4IZzR1J3C8BiMiIIc
	Z/FJEEY/8G4FPnALC15axg8WP7AITgRPpGmUV+m8N9gW/QB3omJmgw3ADd+xYHMpfGzJD96HzrtzO
	Gy2Bt7Kv2tjEEbdvJR8O4yoI/eFFckrYlMr3rES1IjdbHIsd//2Z/AngcA+DQ9mP0A/1L4NSTvbaw
	O4crjDbazGq8/9Nn9pwuNCYjD58lUMsTC8u/hBqxoyfTzaDPWVsqMBMJI+GHh5xLRnS9ckLjsFWAb
	SCdIBlIirt1lk5h9kMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDTx4-00Grck-9l; Mon, 18 Jul 2022 16:50:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDTx1-00Gra9-1g
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2022 16:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658163030; x=1689699030;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BYbetZCZmhIpPO479eS5Y16zAWPaBP7Hb0nV7/+8YTY=;
  b=E8XkN/AKYvzE5FLBh73q9hb1Scw/EpvkP/yer4f/sSI/dGuDOo7oR5QU
   LEdYlP6sbQ9OupKCEmUQNQihnZpqeqHvhtSpzc2UQDAqhR+BhEHu1XC8w
   yyLYj6MesVaWh8x5GsgesbQWzeBxVqdrqBaj97vG6D7JzJmHZ3YCCfM3F
   YhWRXAWFfMRku8sXwT2AHz/pQMlmMZe+mR9xDX2Xh3QKMUKVJLHLZjZ8q
   5QXhm3sG2i9slS6zcm0A/jY23PiOpkmkVHy+MdAB0PuntVENHfgT70KyB
   KptfefAIizbxM3+Xzge6Rvo+INcGxJ/NNyhOX4aP9+CcYK8xu/aJLLRzU
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="168350102"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jul 2022 09:50:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Jul 2022 09:50:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 18 Jul 2022 09:50:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awRvpPL8lu4qGbcM3IBvG2ndhNO6hNiXjP+8MIIy4RUbkhTzYIzld5LltwtefpQhhQphjbNwPCKp2rrTR3uykJEEphjzoSHSqP7OCPUcyvXaNQfcwQy2Cpe5oDg/+37PnDEJxIy2dJ/e7ZZJxqStWK4hqBNVcZ5KCRUyHU736ruNJ7G10C01IMQ+fCUS0IGZBnw8T4qDGxt6Mz4lKEbbtWqWH6NTxoFB/vIfsoBA8cT1/iowM4N+LMZ6/bB9LZC+NwxLpgXWB1P8yf1XZFj2YH50Omo4ShuBDgHHsh6Fjcht+PPETndKY3yfq0/FUB6YmvSwkHyKeSSW2MKuqi+e1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYbetZCZmhIpPO479eS5Y16zAWPaBP7Hb0nV7/+8YTY=;
 b=RcZSd7HdZOkL3pISajydTtziF+8nY9OXdsur4eYosZd3eI0K9UEqA3A+c9WCuDwjL7uH92NrcrFaZWtqr1BLoc8ODqrwEhrAlrjWtge6z19ZTXL2R5DTt7T3Afn5lkIahaOTob7cnPiX9YwlJ94FwOD1pEFDC0UcAslF1QJwbpHGVIbu2KEf9QnRDH1zML54R5IZJYuSpMGD/znf1n7TfJD39H/ABSfc+3ScNo1+rLUkpIcTpImC4Aj42nIC4ij5n2P6/7bD85NN9TVVLgKjegTnYMnqzzlz2CPiixvvCTag2Q5Joa6UxBmGfsifyy07GnOanMn81RlY5iTvGOUQRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYbetZCZmhIpPO479eS5Y16zAWPaBP7Hb0nV7/+8YTY=;
 b=nZfTWZGabRtR5KR3H41ZjOJ3TT2/+2o+Q56IMGmdNJjre+Ez4+nzpxDQqtnf6beiX4BR+OxkTFsl/G7ccRZ0xO2NFF/iiSuVfM+UjRezKnGmh/Bx8wTJWpHeS8ndAD23XTW9TF0kTWqneoA3UIbd9YNUZofS2Oh9Le4kEafaVR4=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 PH7PR11MB6676.namprd11.prod.outlook.com (2603:10b6:510:1ae::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.14; Mon, 18 Jul 2022 16:50:19 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 16:50:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <alexander.sverdlin@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Introduce erase_proto
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Introduce erase_proto
Thread-Index: AQHYmsZ2XQoWsO2E/ku+T0Ijf1R7sQ==
Date: Mon, 18 Jul 2022 16:50:18 +0000
Message-ID: <c1a4e233-f00b-a4c4-8c28-111889f272d9@microchip.com>
References: <20211209100813.61713-1-alexander.sverdlin@nokia.com>
 <20211216200535.jikqd42nohr4477n@ti.com>
In-Reply-To: <20211216200535.jikqd42nohr4477n@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95374ea2-9d9d-4a51-72ce-08da68dd9903
x-ms-traffictypediagnostic: PH7PR11MB6676:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CVicZeJ79CvRoqc8k3zhhWJMLZYjHsK3vc1mnWSC+cbmSU2i4nhvMWao9nuZPnJYB9vSUdTRZXIBWpK1vvGdPNdG1cPNxMMJNK7Ti0ad5afFrVxFZUgt+U/c5SGw5LgkmaXFOw8oPFVMJrTJdwDEUj1qNqffrfFevlL7RhWztlS2QDGPAsXRYSy0+SxyHrel9bQK31L0ieP1b6DohU30VWiES15LD8gcGdgMihlscanXpAclZ1XWoBlqB4BiOpuHAQBLkgv7t9JX18Rk0kArTmMH3rFqkFqNNvalhTkwoOA7QDBSLtDScuLgJbguBPtcti3v25msM7gSPfg7xwGvhqcf3XUmMXpP4IzO9XweaSk93Ow54pi2jBSxr429ZEfBrIyo0Lghs8C1j8kAXVwP8HaZEcwe1ULt7wNWZcy3LFJKoJEPKoX6av0vQd+/8WemzisQhwLKkW4I6Z/GeIh0jUHDxwkswyznryyJ4Qp4XI1t0ImZ8QB4+f6gmDCh8Dmm2bNkX4Ayv4d373ZDK9MlH7JGl9/8D1mQCK2DnjRT2A6qAgcPfkJjAuQQH32SQUSHICsw77V3dianC+AnRR1UyQZagpdcjsX8oE742of9JhFtBahEEkc6NJ1x3ckGCirTGocTgRb5hSUTryLZ4vwgO57u2sDpQGkoKd1ncj64OK/wCtRm21hPpq8C4CWu1ZoGbCTkg3GYm9/97/+sRU7JTCrTdY7mlBTNYnKmV8N/u6K9+bsUGISFR801bwGV0um7/CQztFxXeDwJETeA49efntwVoXrz6rVVqbT5MFFDmn2yUGvGLq3QG6oLbXuBNbrZnLK15c0xAxGAG6RaAGEaNzAdQNPFbyAYtksF5MLC1diSzqd61k2r5Q2nC+4HF1MGElvGSRBdNw65GPoWflsCIKCkqCLgatDPxOTnUQim4ig=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(376002)(366004)(346002)(83380400001)(38100700002)(91956017)(66946007)(5660300002)(110136005)(54906003)(38070700005)(31686004)(2616005)(122000001)(36756003)(316002)(76116006)(8936002)(31696002)(71200400001)(26005)(6486002)(478600001)(66446008)(86362001)(4326008)(41300700001)(66556008)(64756008)(2906002)(66476007)(6512007)(966005)(53546011)(186003)(6506007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N09xaTBobEJzWXhBcSswUS95K3kvREw4c2wwMTNJSGpXc3NRZWtML0Q5dzBO?=
 =?utf-8?B?WjlDMjNkVVhpNi8yaDdRR3lNR0ZTc1o4M0Z5SXVTZkVaWld3blhxVGlRR1o3?=
 =?utf-8?B?RjlRTmVGSHlyNm9MTnE0VXQydEliVk9xK0trdjBTeHdKOWNtOStnOGZrS3pX?=
 =?utf-8?B?WGpyYUVnZVY0YktJREFQSHJ3dnpZTHRjVlZqTE5Ua01DRjlQNFpDNWZkTkY5?=
 =?utf-8?B?SHFKQ0tsVFZuSHQ1b1QxeFJ2QXBFa3BGem5hd2c5OGpzc01iZStjemFYczEx?=
 =?utf-8?B?cUEwZjJ0YzFvSVNtL3I5YjJvYnRSazNHMGZ4V1RJeVBTMytNVzVRM0N1R0pk?=
 =?utf-8?B?VnlONFBYTWpLbjZIZXdSZlN3anc1a2JYeE9YV2tmTGZqTDZndW44WHU4QjZD?=
 =?utf-8?B?TXpOY0FMOUZINHBtTnBTbzA2dlYyNXc3V1JSVjNvb3Z0ZW5SR3JxRWZQcnEx?=
 =?utf-8?B?dXZUQldLdUZULzNXRkk0TXUxd2R5aTB3UjVvUGlIZTJBOUxLYStDeWptZm02?=
 =?utf-8?B?RVdoRkhwN1ZabG1BRFFIbmJiVXdKU0M4ZzhndWsxbldOVC9hUDZrbmZsdkNy?=
 =?utf-8?B?ODlOZ2dzWDllc2k5clN0dnNBYXIrTVZ3U0piOVMzMEg1cFpESFkxV0NNeTBv?=
 =?utf-8?B?RlZGM2ZLbEJJU0xLWHNTYTd3Q3B3d1ZKTmx6anlyRjc5UkNrSzBXZWpQMUZi?=
 =?utf-8?B?dGxYanlNU1lEZmVDamxnQzQybnc5WHBOMEUzU2RuRThtYWVkNDNtUkhTS3ZZ?=
 =?utf-8?B?UGxQVEpPSXZoeDRwRTZ0dmhtMUY3S205bVBEWkoxNk9QRzQvQlZaaW1DQnZQ?=
 =?utf-8?B?SVM1c3BweTYzRDNraEJpdnBJVjlST1RQNHpBVXhFVXJMWDY0REpiT1V0Vytj?=
 =?utf-8?B?WVpPcTB0UzVTZEhPVGsyNXU4eUpUN3VZc0I1eDR1K1RtdEt0R1g2aUVKc1pn?=
 =?utf-8?B?QmNLcUlMN0VqNzQrVnV5WkhSNXpaak4xazJqU3dSajMvWW8zaElOeGFsYk5q?=
 =?utf-8?B?blc4TmlkaHhwSGhIZGk1NUdCTldTQkQ4a0pITTVka3FiSGdFTlJvckxrRXgx?=
 =?utf-8?B?TVpLNWU5TlpDOXFMUVVXY0VOMlA5aTJGZ1lPV2ZlTXNwZDROdHpjaEplMkdY?=
 =?utf-8?B?TVhhQVhzb1RaRHRFRkxJNGtJK1hIbnBtc083SXlhQUg0aE9UaWFvbTlqM01o?=
 =?utf-8?B?OWJSWkVJT3hoVDQ1bXE5TmVZUDRvdWNwWkRYOWZBS3hPU0M5QXRsTkJLaDd2?=
 =?utf-8?B?dEtRZ1YwRFJ0ZnlIRFA3ckRzVmx4LzhxY1JEekVmMmhsck82aFJMcWduR1pu?=
 =?utf-8?B?V0wzS0hmbWd3ZU5LV2orMFQxWFpHRllHQnJXVE5KZGxsVmdlYUgxeUU0dzNR?=
 =?utf-8?B?d08yK3J4cEpldHpxSXpmOUZkN3pSU0ZORGFnRXlNV1hFTjRvUWVpMDh4aWtK?=
 =?utf-8?B?NTlwVTJpSk5GMG80bkRlUXFnOS9wK3NEeG1IbktpZnZ6dkxwQ2x4MGFZZE45?=
 =?utf-8?B?azFPekNFZnU3WjZLb3Npb0o4S0NFUCsweTJYcENobHFqWk5HOG0vUnVTdklH?=
 =?utf-8?B?b2RraEJIQjBjQVRKS2N2R1I2c3IxbkliQXo2TWZHTUFVQzNsVkdTMEVKZVFG?=
 =?utf-8?B?Q2prTUtBYTQrNWtlaTRCTElJVncvWUdka0F5RUNMVThzVkQzSmVuVHg1S3Z5?=
 =?utf-8?B?Q25udE5KVzRCeDF6YUJ5cGNxODVhcmJOQzNmN2ViNzZuaHpMTS8vdzUvSVdO?=
 =?utf-8?B?cjJpckdEcmFTV0pqdmZ6YUhoQTVLbG9KczFqK29uRm1raVFFNmtzclNTbGRh?=
 =?utf-8?B?NnRmUjNDaTNHMHcreEZrOGRTZTFQRURJWkExNVN6bVZoeHY5eDhEMkxnUHF1?=
 =?utf-8?B?VGxuQmRCTVlvY25iMlVwUTFzZ0p1ZEt5UWcwZ1JUNEJZajFRL0c5a2pnK2ky?=
 =?utf-8?B?N1AyanlxVWNtYzBYRHM3bEljQm1XaWxxM0ZKZWhsZTc4N2FFbGZYM1oyRmZI?=
 =?utf-8?B?MkZPRjY5VCtTZjBDMEREeFBmeFVCSkhFcXhGTlJGV0YwZmVQdUZsR0o2MS9l?=
 =?utf-8?B?cDdLMnZRZmR1OVhvNXFOZTlMMC91QjFaTm1lYlZWZTdxNG11b2FoZjZzRU1Z?=
 =?utf-8?B?cnFLOVh4VDBSd085dkpIMjBoejNBelExWEpmOVh0VDNoUEpsVHAzMWNNQXhF?=
 =?utf-8?B?MkE9PQ==?=
Content-ID: <60AC3F047DEED440AF2F08FABDEAC98A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95374ea2-9d9d-4a51-72ce-08da68dd9903
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 16:50:18.9828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pqu/4dgUDo5+jILSK4Kk5x/ectjeKrtv8XidQ68tqWs12Xf8pqWYRSdALKdQ2zgB9gjN2k/VLdPqY1sxaz6HtTZu7QOFHFC4Tq419a/KkFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6676
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_095031_250743_7019B358 
X-CRM114-Status: GOOD (  27.93  )
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

On 12/16/21 22:05, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Alexander,
> 
> On 09/12/21 11:08AM, Alexander A Sverdlin wrote:
>> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>>
>> I've been looking into non-working erase on mt25qu256a and pinpointed it to
>> be write_proto 1-4-4 selected from SFDP while the chip only supports 1-1-0
>> erase.
>>
>> For now just introduce the separate protocol without functional change and
>> leave the real fix for the following patch.
>>
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>> ---
>>  drivers/mtd/spi-nor/core.c  | 9 ++++++---
>>  include/linux/mtd/spi-nor.h | 4 +++-
>>  2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 2e21d5a..dcd02ea 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -177,7 +177,7 @@ static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
>>
>>  static int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
>>  {
>> -     if (spi_nor_protocol_is_dtr(nor->write_proto))
>> +     if (spi_nor_protocol_is_dtr(nor->erase_proto))
>>               return -EOPNOTSUPP;
>>
>>       return nor->controller_ops->erase(nor, offs);
>> @@ -1186,7 +1186,7 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
>>                                  SPI_MEM_OP_NO_DUMMY,
>>                                  SPI_MEM_OP_NO_DATA);
>>
>> -             spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
>> +             spi_nor_spimem_setup_op(nor, &op, nor->erase_proto);
>>
>>               ret = spi_mem_exec_op(nor->spimem, &op);
>>       } else {
>> @@ -1331,7 +1331,7 @@ int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>>                                  SPI_MEM_OP_NO_DUMMY,
>>                                  SPI_MEM_OP_NO_DATA);
>>
>> -             spi_nor_spimem_setup_op(nor, &op, nor->write_proto);
>> +             spi_nor_spimem_setup_op(nor, &op, nor->erase_proto);
>>
>>               return spi_mem_exec_op(nor->spimem, &op);
>>       } else if (nor->controller_ops->erase) {
>> @@ -2727,6 +2727,9 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>>        */
>>       if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
>>               spi_nor_init_default_locking_ops(nor);
>> +
>> +     if (!nor->erase_proto)
>> +             nor->erase_proto = nor->write_proto;
> 
> I get that you are trying to not break any existing flashes with this,
> but I don't quite like it. We should keep the same initialization flow
> with erase_proto as with write_proto, read_proto, etc. That is,
> initialize it to SNOR_PROTO_1_1_1 in spi_nor_scan() and then let the
> initialization procedure change it as needed.
> 
> The problem with this is of course that it could break some flashes by
> selecting the wrong erase. I would expect _most_ flashes to use
> erase_proto as 1-1-1 but I of course haven't went and looked at every
> single flash to point out the exceptions.
> 
> I would like to hear from others if they think it is okay to do this.
> 

Doesn't [1] solve Alexander's problem? Alexander, would you please test
Patrice's patch and provide a Tested-by tag if everything is ok?

Thanks,
ta

[1] https://patchwork.ozlabs.org/project/linux-mtd/patch/20220629133013.3382393-1-patrice.chotard@foss.st.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
