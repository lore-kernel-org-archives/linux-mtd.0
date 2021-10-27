Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792CDC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 00:01:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E0A260FD7
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 00:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E0A260FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JtXp7kOlIF70it/82AZmiZm5VAjefr/sdD/KPRsJXGY=; b=Nenz/8oZSAjdW6
	fnbYZR703pscFdom1kAtxhw15lY9fukVDM35l24CdiL7OvK9KE16hLJAv43BNioEUOANY7xoslYBA
	GaGw2RqPqIhFwdrYTTMCB9a+xU5+Toi7Ptns6FtNzUY3T0PNPP9ZVyvxe2k1PmtJY+B+xKiaMxVR6
	1BaNMNzSCCdmDEj2RdHRusn3Dos2tBVRKFSZWfOtS54TgdVqAPE9FqEsvzGzDSYzTu1QetN7MXL8/
	It4pmL/EvS+cshsi8AaMF1Gsl5nveAm9FKlhhoZloFI25/UILdiAuuucbZxAXjCIm7NkVkmsdwmgX
	KCpo8SKH9I+1dJ59duIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfWN3-003KVf-NZ; Wed, 27 Oct 2021 00:00:46 +0000
Received: from mail-co1nam11on2049.outbound.protection.outlook.com
 ([40.107.220.49] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfWMz-003KUO-R0
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 00:00:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zy27Hz4rJcedj/Ss6fWUa+msiz/lXtN3YHWcX1iudrRxzpH6DmHZTkaxhpDDb3AvUrqNv2c7W8OkwDgQ2t51+CSV1DdhtxhmSmWER52PrmKK+c30VnH/IuT3DSghROAGOGqs35u7/ttFDjV491dVlGkZeaDVnUBSxTDmQWtbuj2t2Rao1L1vRthiQ764thqjoNH3UIgpJ64ZQyWH5dnLu3kxCi7i9uGwULbgskjx43Rggte1x5e/f3VrhWD2y8+VC6fxslxcTL3fD9aWQYmD6gCt1cT4ctZsRG7gGuUZUTXjS4JRUz5MpDu6mog1bCMjCUid3hLMi+mKWJ+JHA3bGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gb7hBE78Vd5vhqmltzGhFkv+EfRLt9gM+8grN8KOv8=;
 b=OnCvj9L0c0QVhwcIx16cfRYbB3ny1lJJ5eGnVrfXfwJmRu6NHoRXVNYBikNNxtmwBlen0ckwVFrF0YBNks8jUtkTAAUS33g1M5EzWExIM9fsBpBmbiHiPm99j3DbzPRJovTRSN3enVBSeH6UOWYwatZ+9fhb9RzgsKC9J1Bxxq35PtPF1+pgNQH2+cD86D0z6R+S/MckluF0B/m6Neva4nn2XtJUZ0X98IRqHk5uF6GBAPkKJR0I3RWV4t8btElKlD1gUuaKKXrmeHxPsf2aYQvPCLjqvNWmzl7R2Asc1HOfVDNvC6Jpq1nqBPi5tc7cZinABlVd5mt63N6/u38rxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gb7hBE78Vd5vhqmltzGhFkv+EfRLt9gM+8grN8KOv8=;
 b=tySqNG5eiUOJJjuSyJ/eoLFgn6MPmYmxTT/AA1rO6u8GrAPZZ6WP4KZxgfPEqo0Nh/WV2Nu/yXC2zdHyByVPIoOmdhO+uJkHIDOazFh6bd4l/U8aHQGxFwUEdvEWEcRFv6A2XXH/Jj3mYc6z5dPdoqjRApYUjKAaqdbe3aZqzXeoR1A5lYvKFqwzly9yz7qo9F1pGTAnPJgoAy27JaIPv9f533ddC0No6hCbgMeWtk9DFOFMFEr1BuSQt7xSQSY5IjzWcDFhXYs2DAETu64awkKHWXIdUFX93GAbaqEghz6JxVCy92gwgtgZ0YLgbMAAdp2POB+rV8UgyMu6qEgzyw==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by MW2PR12MB2572.namprd12.prod.outlook.com (2603:10b6:907:6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 00:00:33 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::3db1:105d:2524:524]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::3db1:105d:2524:524%7]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 00:00:33 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 05/12] blk-mq: move blk_mq_flush_plug_list
Thread-Topic: [PATCH 05/12] blk-mq: move blk_mq_flush_plug_list
Thread-Index: AQHXyW66/zBzr85JCkW7BHMXIO2yjqvl+HWA
Date: Wed, 27 Oct 2021 00:00:33 +0000
Message-ID: <8dbbeb46-3cea-8fe1-9a9a-687fca133570@nvidia.com>
References: <20211025070517.1548584-1-hch@lst.de>
 <20211025070517.1548584-6-hch@lst.de>
In-Reply-To: <20211025070517.1548584-6-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9298ef56-5817-4c9d-7545-08d998dccc30
x-ms-traffictypediagnostic: MW2PR12MB2572:
x-microsoft-antispam-prvs: <MW2PR12MB2572743F9FC65EC6F7A2D1C6A3859@MW2PR12MB2572.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XUuSvxJzcNOTTZIC2sdR773XWSHYmtSJRzZ54+wT3NGHNao8l5QFIw5v/V9I3nkIpKuFie1WWyV/O7/qDrAcDDzOo+p2PZKBF28i+8zxK7PIlOsuFh+sYojfY0ZAyX+CIdUpqRK1muSjGBxR1hxkqyiciJLsyxd/CZfHKS1EOO3ClPRRqBg2xjVdnRrlncguQ2BZsbzm+RHKpZdIe6OfImF41iwjgWKc5AipELTUfT70blhjqdLgN8xuKs45jkbpqOoVPiUZ4oN+Kkn68e77SR+i8d4xPWVXoT4pgNc7Hem6JhEcPNfHOo46fyvwQx/vusxjsAVYEQWOEDWvOxqmS90qhh3TxVDzqzkeQOEIWkRcA0bCEHoQlWapcyy6JNM+VZoOSCkV8pu+Tai/O16a1sIh6EyaydINYHk/+eH2N3S94yCsFizZjZ1lAhtSLeJ/ZogNsKYwoJ1V3ZYT6RDdYaVO02eTiBHOd5Y85E9Y4BScG3s47lIQmdA82Co9k1zV84XSWm7742U+dflVHSE4gyo0yj0q0rlKIpDVCfQQ8RKdUT0eEjeL71896ehCkLvwa5qwRLhyt0r3zvdKir5iw54Ql8RdbHtMMrYFMwXQdZZgj3713t11bjNPfkg7PL6SM043ya9bfKQhXXp2L2DkHr/xolfh9AZDmrcSuhPe07rUcCBS1D7CpE2uBaA575gj3el1hQLpQU7fxpb99pmy2FcKrFJfiqqkyWfhAxEyn+g5pBQGbOjIIZ0mQXH64bfGr+TQjmJhothqixpZpmYzkg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(5660300002)(8676002)(316002)(6506007)(53546011)(31696002)(8936002)(6486002)(76116006)(4326008)(54906003)(66946007)(64756008)(66446008)(110136005)(6512007)(558084003)(36756003)(38070700005)(71200400001)(66476007)(86362001)(122000001)(2616005)(66556008)(508600001)(38100700002)(31686004)(186003)(83380400001)(91956017)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzBYLzhCdGdiTUZEcEEwMlh6TTBQTTd6NnpsRWY5UHhzOTlEeFBNamFSeFBP?=
 =?utf-8?B?NURiUHZ3UUFnamtMeW0xZCtEdzFqYTZTUzFmSFBMRUMvTGQ3bzFRbmNXNEgy?=
 =?utf-8?B?Q1lnL2pxUE1wcE9DTUFRUmRwK2gwMFdTanhoMVE2UEpXYVRENVdwUXVRNUkx?=
 =?utf-8?B?cVd2M0Y5MC9QUXhubTRZTGhwYmRPdFVEMlBSWTB4bmlFUi8yOVprcVFLT2I1?=
 =?utf-8?B?TUl3SEozR1RLdjB0Nis1VUxtMmdJdkh5REtLWjM3cm9JSXV4RTdmZnFiT2k0?=
 =?utf-8?B?WVVZUzUyZzBlU3d3ZzlvdmlScVNLK3BLcGkzcC9hVFE2Qk02dHVMbTZHMlcx?=
 =?utf-8?B?ejZIenBjRzBXZTNVa0VYRmFtaGt3NEZOai9STHhkSEtEZ1NUeXhSZGpWOGp0?=
 =?utf-8?B?dFQ4K09naVplVEVBRGhIc3F6ZEpmTmRTZVpWUzRGUm9MZXp1ZlFEQXVTMUp0?=
 =?utf-8?B?d01OcDNxQWhCRHJvV0pLZ3JvZVBKOWFKT2FMdXlpaGtjV2kyWXIxeVBWNkFO?=
 =?utf-8?B?L0I1c0ZiTkhUOXNlVHdnMU5lUXoyNUVFU2ZIQ0NlSmFOWXRPdXVYSW1jNkJx?=
 =?utf-8?B?WGRtMTFOYytFdm1CVDdzdmJtdmhqR2ZFSmFKQmpUNkFqdGs2dDFRVTRZYndR?=
 =?utf-8?B?Z2V4QlFiOFdXMkRUMndlQlZXZ0puKzNtL2VBNTFadkZUSFZ2YWpCL1lyaFQ2?=
 =?utf-8?B?TFdiWW9rcGVBWDZUdXVYaVBGNHJwYTV2azlMTUxnZi81L3dzU0ZRTHFaVTVu?=
 =?utf-8?B?SS9LUTV4Ulh3THQ2M0N2bUg4VVY1NmtLeUthNTdtRWxpalJjUXhWREQ2YkNF?=
 =?utf-8?B?ZW5QNHRSSHBGKzNodGF3Mk9SWXBHdWYrZ1Q3SlpxRDhuYmhleUVoUmlqbTNV?=
 =?utf-8?B?Z0FjM0pQOWhDeUZXSkR3b0lNWFI0eGsySlJoUTZCZ1c4bWlNK2FjQjRwQWkx?=
 =?utf-8?B?d2k0YVdCdGd5eVl1Y0JWbnJPTE9rSkx5ZjllVEJaRVR2SkhhT080ZlUvWERr?=
 =?utf-8?B?ZEdlWVhjNGozcklyejkyWjVTMFRaUHhDNUJOMmpzdmxmdm1mVmlNSDljeXVo?=
 =?utf-8?B?amFyaXJzcXNxY0FmVTJYcmU4MHNMNjFlK2JOYmhzTDZ5YjA3L1VQUnp5Ujgz?=
 =?utf-8?B?MnJqZU1aWkhqUGxLUXJsOUFTaUlZL25JMkk5bjJyMktTVTJ4YXFUYjBlV1J1?=
 =?utf-8?B?R0ZvSjJKVHUyNTFWcVhZc3hBK3ZlN1pCa002V2tRR0pIZW1rdHRnNFBBRTBx?=
 =?utf-8?B?WkxIWCtXaTZ5RDcycUJ3SGpQUit1T0F1Q21pY3BOTVIxeFp4eldQTE1uNkg5?=
 =?utf-8?B?NDdma04rMjZxZkVBU0VER0wra0sxblNKbG5md1NvaCtBRG9IU0l5OUVxSTJS?=
 =?utf-8?B?cUVITW5VcVpoRG1IN3hyWkNFUDJDK3ZnbzFTN0NwMllBT0ZpMTBXRzNYT015?=
 =?utf-8?B?SDRWekNQSE9tTnI2bWFJNjR6dStHNVppNWdXVnViWVBUZlZHWE9VYWFhNjR4?=
 =?utf-8?B?VHlvSU1ydFozOEM3L1c2SFplUkFqMlRuTGQ0MkdpL0xuS1ZTTVdKWW4wTWM2?=
 =?utf-8?B?MmNYQ21Sb1g2TTZZemtITXpwbDZXSWt4OTlTcmdUYjhET3F5TngzcElHZVdV?=
 =?utf-8?B?NnBGa01nNTBFbWsvSmcwbVdFRk5LWkl3Q2sxUXZqU0xqZzE5L0lxbGNiYkhS?=
 =?utf-8?B?bnVtSGlJZWQyUTU4dlU3Rmc5c2JZQlBvWk5pNCtSUnQ0anMyNWdwNjBOODVW?=
 =?utf-8?B?dkZIUzZrWkh5c1ZEY25vZGprRUhQTWVHYkxscitSUmlRZU0waTNORkJaZTZu?=
 =?utf-8?B?RFZtYW02LzRyam9OSFhKZmJxRDRZSlJlMmRiMVNTMjF2NmpTTFV0bE5uRC9B?=
 =?utf-8?B?TEd2Nzl6ODlOTjg5Z2xIR1VQWlo5emtzL0paSWFQTHpmcFBJanFrMmVkS1hS?=
 =?utf-8?B?a0VkT0M3eDYrSlA4cW1OZ3Q4NFN4NnRCSGtwOVR3cVRHc05HamkxUVZtd1ZI?=
 =?utf-8?B?RVg3ZkxPNUFkNmRLRTNucU04eTJwYlFaT2lFY1JSckd0aHhyTmRiRm9zeU1C?=
 =?utf-8?B?NnJKcS9USi9EbVdubzlhWE50cTU5Y3p1dkx3OGswTEhONnRiSTlDWmQ1UUN5?=
 =?utf-8?B?SGZDakcyQStYWDFFTVZvVUZwSnI3RktvbG0rQzljQ09xY1ZQQzNOUno0WnNp?=
 =?utf-8?Q?6aP0vwIcXcMWPrWqSve8km99V/YnCh/JkNZEfnyJtuhs?=
Content-ID: <E4C2A71DD387A241AF326D8E87F6A9CD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9298ef56-5817-4c9d-7545-08d998dccc30
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 00:00:33.4671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WxJRdmP88PPQp2BKECFiVqumf6GQXJg/7gFQ0nB/4VpJebvPzFttMg/CSpUW4KNHvSLoN3Uzdkn8a0aoJNLMEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2572
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_170041_926497_7C0B1CB2 
X-CRM114-Status: UNSURE (   8.99  )
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

On 10/25/21 12:05 AM, Christoph Hellwig wrote:
> Move blk_mq_flush_plug_list and blk_mq_plug_issue_direct down in blk-mq.c
> to prepare for marking blk_mq_request_issue_directly static without the
> need of a forward declaration.
> 

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
