Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313F7C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 04:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlZvypfgDwEsiu03a3niTHpaiYUorjhwQghuyDeLlW8=; b=TAorlGRLkNr/SC
	lru23ehr9go+vBx6YkT/sl2T/1GLZ27Ki0GyvqVeX58Zcoq+FPFJVftSoarV6qE1IiQJ6NQOydfuH
	xWtgJKRwSzEwi5MsU2giOiUG8i3nxqTUt1FXKQsjOjVXoTSllcsJBWnlEYDTF4Rg7PsTLvtzmJ1Oq
	e9iZLVJ6dqU0EmHWH4JP5d6jErZQfX/RXSCb18o2WS+rGu0t9A1V4N0eqNFIJnyv+bx8jqLzXMAye
	P8NQCRPVUJ8NeQOHq1HEg6jwULlVz0+9iBiwRPaLXQt7TUA3r2e6kWNUEqaQuiXSFhPx8woXt2mHH
	Tk27padzJEFdox1iLMng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDfIq-0056LW-3r; Tue, 19 Jul 2022 04:57:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDfIm-0056AS-Vd
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 04:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658206664; x=1689742664;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=m5yyTVE5IkUEXFI1ABiNMkM2A2N4ETEddPZ9MECeHp8=;
  b=HzLK6Na8ShozwDFftcyukbzu+jcM+k/CKF7Y+mVJZmUo820NhfcKwqE9
   f7e1Vn3NUlSfrWr6hAbGrUfdd1GNgBnU0cVv2Fzj+R0LO2u6z5BD3Y0HZ
   Cd/HP+Sd+/YA9LFIr9IxGkd5+FLf9Uz5WWOr3qQ1JI+fXpBMRSa6S2u/j
   QKZhRDKEUesOT8wcRFk/7B8LbmZ5lV0qo3cBsFgY6WD64Ms12z6pLgi+N
   MRjBTpJ4q0rI1LdyVQtWm5kD6TGCjU/K7nvNwAcxauSU8hlrwdQWPdzrr
   Q66d3ekIsUhsIH4ZlTCNaLUVLr/mxWjufjxIQbn44RDAMyObA+0AOucSB
   w==;
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="172875678"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jul 2022 21:57:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Jul 2022 21:57:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 18 Jul 2022 21:57:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGlAJYaRtoIYEXf58xKKLBoP/Gsvsd/KoJFpoCiSIDQcxHOqjc77vdcvoRY8lQ0pdot+pAGr/K7dR8AwdDQkcatdTcnk0nb/nhUUZxSzleIz682zO3xjYS+Z+PSM7jS8CCWk6ttD5xwVjsmlQGzPFUzjBo+ZMmn6sPX40o8jihYdCBth+aMXv+JfEAk4QtZp69Q9/X05bbfE2GaXjmE+HQthzqe93UQEgVtWzfJ6NPRpB8eAvevcFG0nfG4uNRTmCPVmREiZmNg2wNmh0j5ZArsFYhZdwDed1r4uI7o51LYg3B0Vg8fuLyLr/46Jl3825dom+8oezw1YLTrr1Hmibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5yyTVE5IkUEXFI1ABiNMkM2A2N4ETEddPZ9MECeHp8=;
 b=Ai3n98OkO6FqCHGRl1rn7B4gFsfikh/98lvy6HEUKUACzKU0eiJi/mVed/8hS5G6I0AF+PWBUEo6niiHaFGNy+Nvlu6xTKl0v1883rqCU0v35PserHzAlodGUBtZGYc5UU0zPHZ7d9HXoHbcfD+5VDQ0FqnQHLATI9gssAxUmo7zQTWckQm5z9hfZNit/Xv6Jn/YmkKuXy+e2tQkcExL7Q8Ia7o9xwy25vnj12rEe/s/1a7dKRsE7KUYq2bH04J2p6H2ZYO+NH5vMf60pK9lkI1ZfmcLHeNVBXfV5YsXs0PHnxSttK6NfFsApdMBdRgpVAtF+HUstGnWLoCKBH1TaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5yyTVE5IkUEXFI1ABiNMkM2A2N4ETEddPZ9MECeHp8=;
 b=B8V/m61H+/SjfpsazjxKNAvbZBrMxZ271/oexZu3ra5Sea/sR5yoveccETu2a5G+itfcDzGmGVGufXwzRf2QT7VkJvLZ9Wvt+CQfxoOPbdvJVGjpgUxX0kA9p1ghu2ueTyq5XB/lUG4sd31pkuZHjiaWlElQWeOM/kvD7FoyWRQ=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 IA1PR11MB6219.namprd11.prod.outlook.com (2603:10b6:208:3e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 04:57:42 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%5]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 04:57:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<heiko.thiery@gmail.com>
Subject: Re: [PATCH v1] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
Thread-Topic: [PATCH v1] mtd: spi-nor: unset quad_enable if SFDP doesn't
 specify it
Thread-Index: AQHYmywTE2aD0LVQO0KmbZoSG1RT0g==
Date: Tue, 19 Jul 2022 04:57:41 +0000
Message-ID: <43041ef1-2b1b-5729-9611-00964d617f63@microchip.com>
References: <20220304185137.3376011-1-michael@walle.cc>
In-Reply-To: <20220304185137.3376011-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56a14fb8-1be7-44a4-c735-08da69433620
x-ms-traffictypediagnostic: IA1PR11MB6219:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E24nJb1YODdbhZoK9sIw3dHqE5UsZ1At1/bT0QDRUuSfZp1MyHeuEhpC2MaRa6c3x1wYbwRCSTAKsFNLsOo2cDlMol7ps2b+HypNbJCpkrSKXxpKP4yMJpXmJeaLxCjr1vQe0KvbwdNrpZ0GM1PvpJjKV+jg6MjvQ67W5claBVyuYFldt5e2IKJsX8bi53dCKa5rxj3npASTSjEwkNRBku9R96HCXvYxvthYSavxDzrtbhN7fDvEDeZu+Dx6WKq7MY01cTcHiuYFV6qptcqIHgk2Rye1viG+9e2/ywhwQJxUt4qqdbi8f1NLvNBvLJzpZGBbAVQyvI/nJrz+8wbV5jbtxVIjwVQp+594PnXKTLFZhTqobumM943vlyYOFDe3diHma2dE09SWBIq/SqBoPrY55Btr1FdM77Kt1kpHdvK+prkl9SZcBGAluYx2M6nb3bvDa9Jh8/EH4+s22zZRUpTzTRIcHhHVxYXNv2SVv+x8uvrcjMyQAhvzsMTavDilOaecs2HAr4+4MSHaghc65hkjl3JQEOsfZfUwhI9n7yoK34uneo7I2WOMo/sqf+bR06OSJQ64WB8IqBGHqsh5Mp0DlAVA0unThhebKpFX0JiBn/axa41+vu/FYGOTrVxfino48w/3+sqjspXi9aQK9yBUEKU9zlL+utstZ5KYHGbOh1Q9JABJfVIkeA8urnW8cNOpDqtK6JZaCkbX2VOuGvSRWUzyhA+XapkJBw2HEar/2Fn2quvEbKI6djNXWc5BP3ooo5rFKDMjl1A9JlfvLSv1T3fAaRbem9SsuIggaHGQwVSeMOe25b4LSfBeMSTrGMljFR5av8VGtGU6UCpLD1v70Zv6rWpL+ie3SBD8pXqsrUQ5JMhn0+h3UxHRiPcI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(346002)(376002)(39860400002)(110136005)(54906003)(53546011)(26005)(6506007)(6512007)(6486002)(71200400001)(41300700001)(478600001)(2906002)(76116006)(66556008)(66946007)(8676002)(66476007)(64756008)(66446008)(8936002)(316002)(5660300002)(4326008)(31686004)(38100700002)(122000001)(36756003)(91956017)(38070700005)(83380400001)(31696002)(86362001)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDI3Tk0zVFBTOERpMEFFcUJvVGtpNitYc2ZTVjRXVXFWZ2UvZy9QQTBvT3dW?=
 =?utf-8?B?eHRMSC9DRjdZUDRUQlRjRkhKNFluK0dEMG1MY1d3dDhMc2wxR3pOSXk3TnF3?=
 =?utf-8?B?aExhSnBNbjNqMFp6NTJ6Vm1tS3FsVUxwNE94WEhqVURSajV3cDhSSXd6dlY1?=
 =?utf-8?B?OFUxdXdTNE5WTURFYWdSeWtaMmRzV1NEQnBDd2FUZzJtOW9EVzhvSlhDZm4x?=
 =?utf-8?B?SjN4dUNaOHJUWGlMMVJ5SFZpVmhMaHNLbmRPV2w1NGxPM0JIeklTL1d3MnJk?=
 =?utf-8?B?REQxZ0ZIQVBYOGpwS09UVFZZOGpZSTArWllFSmJ1WmE0RUdkSnpKV1BpeU14?=
 =?utf-8?B?cHdIcnNERS9BcEtxVE9xOVduWkFPM0tjc1JIZ1NtMnRMUTdWTFJBZmczaFp3?=
 =?utf-8?B?Y2ZWaEJhSVZCcGRtUEUrM2pmNjNJdU03MjY0alNqRnVFbmErRjIzOTd0TzJF?=
 =?utf-8?B?SzhXUTJSQ3R3bDgvTmh2NkZPcmRjdkd2Z2ZPQ09DTExmTkw4TFNTODNHYTc5?=
 =?utf-8?B?dGdzYndpdnBzeWlQVTh3QWloRlQ4U3ZKeHlLbEY1dDdWVTJrRktvR2pYQmtP?=
 =?utf-8?B?THdEaTRVb1gzdXhGcWxGemdhRjllNDdLMGVvZU5lMGRHcjBzakdXQmdkOXkv?=
 =?utf-8?B?OWVVV1VDUEcxR3dnS1NROStwbkZ3ZHpIQjlUcnpNS0dXOUZHV0wxNU1XaG9k?=
 =?utf-8?B?OEFaR3JrWDdSQWhEVE9xNW5hblNVU1crV2FzcXd2SlpQejhOOU5SOFZTbktU?=
 =?utf-8?B?WDVmSjB6TFFjUmxwaytNWVZPdy9YVzVqSC92UjNOK2ZkVi9BZGdXYjVaUUNF?=
 =?utf-8?B?NVRTSWgrU1BJa2p3ME5qM2hkUDhyRGc3Qm0zV3JjYU85eW5MTDNzbkRINVpN?=
 =?utf-8?B?SHNSQnVGN0NvcGpZZUk3Mis4YmRCVHhubm1yck1xQ2U1U3ZTaGE5SjZCM3dy?=
 =?utf-8?B?cWp5YkZqU0dVdHhsVVNHVE9NQmlWbnVFR05SVkl5YWlWS014NmFNVEUyMVM4?=
 =?utf-8?B?dm92QWk0ZjRoUVVGWGNTckRLQm1DQnJSU1FoSzZjKzhCL0JRSjVlSm9TQ0xi?=
 =?utf-8?B?U0YyOUNDSFNyaDFQY05ZVFZVWXI3NkU5SUQ0cHg5eGRTSlY2bjlOd2p6Y0dj?=
 =?utf-8?B?WVlqY3VoYlkxRTZER0RvbVU4bHBTTXpvcnJaSS9lMWZpcWdYdVdJemhDbk5E?=
 =?utf-8?B?Z1Q3VWJaZ0R6Zk9jN3VkZnZkQ0pJR1pjNWwrWUx0cThLZE93bmtNL1IwWkJs?=
 =?utf-8?B?ekRPRzlSbVEvdHhRWmRKWUNnOXBPSjNyWkN3YTlxYnk4WXZFKzBlUGlDVnND?=
 =?utf-8?B?K3lFcWRrZGIyOGhvTHB0dVEyQmpKMm90V0xlblpPZXh0TmpEUWFsRUg3YW5v?=
 =?utf-8?B?Q3BGZklUdDNNQ283UFBDZ1Nza1Y0SXNMcGt5SHhmLzE4NG51VFVUSThCUlVa?=
 =?utf-8?B?cEkwd0lacU1hYzRRckh2aDNnNWljOTJKNms0OWpzYVF5MFJmWEM1TzNveWoy?=
 =?utf-8?B?QmluN3Rza29aUFFFRmpwdEFFU0drbXh2N25teXlHT1Ixdy9nL2RWbVphK3d2?=
 =?utf-8?B?alpFbk84ejZiYkY2c0NjM2M5MXFkOCtnclc0ZndvV0ZOYWdjaWw4bTJRTHRw?=
 =?utf-8?B?ekwyUnBUNEdBTWMwa2FvMEVVM1I3TlEzN3dpQXVkRXZjQXdIdmdVdW9DRnZi?=
 =?utf-8?B?dmh2cUNpRlVxSHhjSmMrRFBLTy9GTnlsVExQTGNCT1RZYVZtRUhOajdheDdn?=
 =?utf-8?B?ZkdlcUhndmNZL0tuc2p1TGtwbkc5eHhUejZYYVBzTWd2ek5BQWdlMDhXR0Mw?=
 =?utf-8?B?YmYraGN2Skw4VXp4cUZobHJYbjJEZE96aVlkekdMcGxSeER4Zmo4V0tvK2c0?=
 =?utf-8?B?bG9oOXl3RVBCdWdHU1VnMGRSYktQYis1MmRmd3hRRkFpeFZHb1F0bUJOOGx4?=
 =?utf-8?B?Q2JpbER4eDJwTkx0WjdpOVpZMlBOQ2hBQ01kY2x3MDJMZmx6bGZ5ZkJlYkV1?=
 =?utf-8?B?dWVqUVpFNDJxOWxheEJPTUhqQUUxVTZsakZiblNhTmZJYXVyME04dGZsUWNT?=
 =?utf-8?B?NU5maWd6UG1jamljcjlqUjRFaEVzNGQxeTkvTzdDR0JlU25sdERjUmxpSGk2?=
 =?utf-8?B?STQxZGpFQmp5ajB2Sy8rQWtXbjRPYlpCRXBvKzZvb1NkdGJFY3pzSWxCT2ZG?=
 =?utf-8?B?Mnc9PQ==?=
Content-ID: <3C13C8EB6369074B9E9E7ACDAD4A2D59@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a14fb8-1be7-44a4-c735-08da69433620
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 04:57:41.7720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r59kgzdFbsKOpRklBZDQ1z3s/px1QzLOAMdHrcGO6061lhq3TfVZOsHnDfYlXr14T2RHWeeiq81o87ocL8VlDtcyUe0qMzhYkiphu8N+IyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_215745_284742_40F4E49F 
X-CRM114-Status: GOOD (  34.79  )
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

On 3/4/22 20:51, Michael Walle wrote:

Hi!

> While the first version of JESD216 specify the opcode for 4 bit I/O
> accesses, it lacks information on how to actually enable this mode.
> 
> For now, the one set in spi_nor_init_default_params() will be used.
> But this one is likely wrong for some flashes, in particular the
> Macronix MX25L12835F. Thus we need to clear the enable method when
> parsing the SFDP. Flashes with such an SFDP revision will have to use a
> flash (and SFDP revision) specific fixup.

This is equivalent to clearing the default QE method for all those flashes
that support SFDP, with implications for those that support SFDP Rev A.
If I continue the logic, I could remove the default QE method from
spi_nor_init_default_params(), but I don't think I would like that.
You could use a post_bfpt hook without explicitly clearing it here.

Would you please explain more why is clearing the default method better
than using a wrong default one, and why you chose to do this just for
the Rev A SFDP flashes and you didn't include the no-SFDP flashes as well?

thanks,
ta

> 
> This might break quad I/O for some flashes which relied on the
> spi_nor_sr2_bit1_quad_enable() that was formerly set. If your bisect
> turns up this commit, you'll probably have to set the proper
> quad_enable method in a post_bfpt() fixup for your flash.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
> changes since RFC:
>  - reworded commit message
>  - added comment about post_bfpt hook
> 
> Tudor, I'm not sure what you meant with
>   Maybe you can update the commit message and explain why would some
>   flashes fail to enable quad mode, similar to what I did.
> 
> It doesn't work because the wrong method is chosen? ;)
> 
>  drivers/mtd/spi-nor/sfdp.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index a5211543d30d..6bba9b601846 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -549,6 +549,16 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	map->uniform_erase_type = map->uniform_region.offset &
>  				  SNOR_ERASE_TYPE_MASK;
>  
> +	/*
> +	 * The first JESD216 revision doesn't specify a method to enable
> +	 * quad mode. spi_nor_init_default_params() will set a legacy
> +	 * default method to enable quad mode. We have to disable it
> +	 * again.
> +	 * Flashes with this JESD216 revision need to set the quad_enable
> +	 * method in their post_bfpt() fixup if they want to use quad I/O.
> +	 */
> +	params->quad_enable = NULL;
> +
>  	/* Stop here if not JESD216 rev A or later. */
>  	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216)
>  		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
> @@ -562,7 +572,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	/* Quad Enable Requirements. */
>  	switch (bfpt.dwords[BFPT_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
>  	case BFPT_DWORD15_QER_NONE:
> -		params->quad_enable = NULL;
>  		break;
>  
>  	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
