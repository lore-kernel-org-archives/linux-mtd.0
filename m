Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E0DC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 00:06:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B11E6103B
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 00:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B11E6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyrjs5+l69I6DXgFXkl0HYd/O2kuCZjy9/M1RNQOK/8=; b=arhFFtPbxyaVvM
	vfAegtRLuu6bk3bcA3d9WGSzXoVgZt423VnWINFNiXfWKi3B6Js1xNBbXi+Ksv4kPyK2YK0LvVwzn
	gO60wNAQgnjhnK3BwS/rUws+f1BPXO4TPmBF34fkbRMlQK4Span/JoGV+hRUZUCmaEDYzO0uK7vdq
	w2k5Nn4UedRlYf0q6l8Xc9d+epbjDq4fKbcz5qCGfJYb6duHTTzYYCAlyosRpz9a8AolViqVwxHMG
	SZ1RWV1PRfxOEViCjMejhFpgEnTEdr/A0dCMfFNC0qWBsf1obDmaZKUlJScQzgMKgI/5UyULeHBOo
	zaB/wJV67HvEws8GJVgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfWRV-003LZy-Uz; Wed, 27 Oct 2021 00:05:22 +0000
Received: from mail-mw2nam10on2049.outbound.protection.outlook.com
 ([40.107.94.49] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfWR7-003LTl-OO
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 00:04:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJYaCufgfyqi15VA5B6tVdJCp/HJ5nKnAbCI+mwUGg2BkxK9jwtoYEDEdvceY+cBWG3QdQJNRE4kDDFeKuLCKKOCCQCSwR6X88nRQVm/qdXQK3MIPKKHsXCvxwcbRlA6VMaQnMmWcUQkq3GCKAcSbR4Ql5adUqdsJnxPETJEmR+Lb2Bok1k73GGn+RPO4zFCWDFN+ZSooFj3WCTPKi6NEsnCSqeHXRazGgk1t1lY10cMXKIqLTEl0CI9NSecIdxvTKn9jGw4agdEEgOSD4eD6SN1jImgsOYl63wcol4G9+gw/9hVODTiJkPM4QqNiGARlxFPJleRRU2xQ3uGeu3kZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rhLBwmIxJf5fvozQpuJIaVMrncLR2pO8SxTgdCllME=;
 b=npk26zJNKeSkpKwvg2e85mLHrXzpIgK67JIwaoYNIlVISGU41H3Pggdd+Nld6oy28Xp4N1JhPedTyNdF4RbqcDPmWmXzA93AWNZlCei0MEU4T3Wkg9iyxNDwmuLNFtWDYGa6bOas2kgmEvuLZJQ2+w43c39pweMloL+qBSYksBoZaZFT50L/j7Zz+lCv5+WPTzFXU8IsraQRAV02SYjzHSo9wbTbGkPM9DSJabXOo/RaOi1qwdLROl94ur8UKBym8B48W2QJEOuPRkLV5uop+oRF/QlluFVX044CAlTwG+/pC/yTxwvaQcvqIt01F+CvVmD8SWpb/xe/Tf7ETM+IlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rhLBwmIxJf5fvozQpuJIaVMrncLR2pO8SxTgdCllME=;
 b=ur8jKfZ85Qbs0E8LfBcuMMnqzJGpzvHijCzm8DB+mbjyFy8mjCIDc68WIK3btnSKbhh7fHgWurjNhKC/D/Iwk7eMoRDl9MSa5xgO/K/mvE9cRplv+dKobBe/Jj8FjJZDRTje42Yv1sqfAOhoo790vPbidk9OWRT6LcpyrxONngmc5tlGppXF6B3Ovi8EM4lO460SeWFDVzh0eZId8t0j48JBC7s45Kv7qv2F1+TFKP1wsbgCcrUedTPWq9RC8CqfQg21NC2mCYl0BrIWIZKlg9dXqdOS6OsRMcM4pkdHDn9me9j+gJJmD8ECgMMj5fd6t4M55Tukr4EQhocytjyqcQ==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by MWHPR1201MB0016.namprd12.prod.outlook.com (2603:10b6:300:e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 00:04:54 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::3db1:105d:2524:524]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::3db1:105d:2524:524%7]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 00:04:54 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 10/12] block: move blk_dump_rq_flags to blk-mq.c
Thread-Topic: [PATCH 10/12] block: move blk_dump_rq_flags to blk-mq.c
Thread-Index: AQHXyW7Djowo64EmL0eOpocDxNjpJavl+awA
Date: Wed, 27 Oct 2021 00:04:54 +0000
Message-ID: <f4fc40da-ec63-8764-d4a2-ee583381795e@nvidia.com>
References: <20211025070517.1548584-1-hch@lst.de>
 <20211025070517.1548584-11-hch@lst.de>
In-Reply-To: <20211025070517.1548584-11-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 754ed595-e384-41a7-9ddd-08d998dd67f3
x-ms-traffictypediagnostic: MWHPR1201MB0016:
x-microsoft-antispam-prvs: <MWHPR1201MB001653EDF88D1C2D275A445AA3859@MWHPR1201MB0016.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:234;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dGE0LxwUqzd8uSR09A2YCfyLpefKdUc0Vbq+5L/HLI/uQ5qMMjlDznyg7r+MZcCbXv7kmgchGpX9VpL0Zid9gDF8hv6+SEuvoeO+dZEmTcjUXkb7KSrjQL0oh8ex38HYRycNHULvf3wCdfiOEEyj3oY1e22JQd7JvshcUp7ceP7tpJd8LJZSl+PnzYyNTJ3YG6gqlB3TSIkg8Lxy/McL58THfcYqzazTSYlajJnouCtvJ6h94i9wwSe/0akQIgBHUSlosAeUNvgSNjtDEOiv2H8tWVibVJ0dYeZwMovYqkQ5ctHomuGzP8zxvoChAmrMdKbRjMQ1gFsAsDop3sz70ClVXxgdzM7HOT6kIflM/9lXiQELFhWK4QG5qsvWW39eY51/Sc7i3x6UH7fMJ0XJGw5E41TijKJoWAbaTPyRatzihiyuYnOO94D+0Jkxtox+nEfonRj+xmMPZQuFFFjTWsAOAUC5Z0pAjCaB48WrtzZOUNXpBVayqFY8mftkcY1jYsuVa16lij9KUSmse/8dBDGoSNWDDNWAbSeWQzZAh/Lyo13NrOt6nhUomzV159dwpO+WqQwGvKymIfknCAH7ijgXRD5WCPqf7aaDf8B9QIZP/TrZ/gvNguOU/2YX+yuStR8m895SMCpYYsg/zdl0o9v1CDvUgjtGuo6Jx7c9HRw+1otvMEaDzwXj7zF4gsj+EtmN6jpWWXiNCRqvtIqQpvqwH52DTWks/zhpEe/sNQ63AtrRqz10hfmUCBASuRnXEuJFVpODlx34GBxqqnBdNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(31696002)(66946007)(66556008)(508600001)(8936002)(83380400001)(6512007)(110136005)(6486002)(36756003)(38070700005)(558084003)(86362001)(64756008)(8676002)(53546011)(6506007)(2616005)(76116006)(54906003)(2906002)(31686004)(71200400001)(66476007)(186003)(38100700002)(122000001)(5660300002)(4326008)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1JCaDBLeWxBKytuSHhEY2tocU04dXJWcmVwNFlpclNsWXlTakZqdnY4dWkw?=
 =?utf-8?B?RWl6ZDlLd2FoSmhSVFB3Y1MxR2UyOG52aXRwcWZETkhvOUhaRisvNmh3NE1H?=
 =?utf-8?B?TWdFdVM1ejJPUVk5NTBpdjN2Vi85Zm9qT1Y0NzlpRXQyaWVyU3A5dWRwU0hF?=
 =?utf-8?B?OFVTWThROTNIUHUwaUxhclkzNTNDU0ZZSVBaTG9RaHVUZGh3L3dOMFQ0Z0JD?=
 =?utf-8?B?R3JYcVdGKzJZZWE1RWRlVCtVQUZpby83WDlSRTM4T0VWNmhvUFdZUWZyMGcz?=
 =?utf-8?B?eW1namhaay9EZ1IvdUszaGIvSjAwN1F6eStyYThxVVYwVjQ5dTBJWnVCS2V2?=
 =?utf-8?B?SkhnRjlOY09SWU42WDBlSUV2TDR4ZFFQYVFKUndMcFlQaUkyeGJId1RINUdo?=
 =?utf-8?B?WGsya00veE51V0R0YjFSY0dLazJvWXMzOGlSZ1NQa2dpU1p0YWt6Nkw4aG1m?=
 =?utf-8?B?M2UxQ3E0NmZMN04xbkR1dTV3ZTlRSVJuZGhZaHlsZHhKUlFTNi9SVm9SVndk?=
 =?utf-8?B?SU1Oa0VSRytqc1ZWbTNDQkMxZjExSXUvQ0UrbXptb0lHRUJLaU0ra2xmVDhX?=
 =?utf-8?B?THYzb2hhYTNHZ0JQaFRic3JUTWZxTlY2OHVCUHhSSS9ZVDhyMzZtMWlJbnhw?=
 =?utf-8?B?TWlmaGZKamJpSVBhK0dCR3YrSTdlNVcxY1lrN2RsWHlyTFlmUlFLM2QzTTgr?=
 =?utf-8?B?ditWTUVUZFRyY0ZSeHBWWXFDajI5YmkzOFFFbHpQRkpFQnpVbkdydGEvakZ3?=
 =?utf-8?B?aGppRkNDZ2FvbXBLeVZKT3VoMW96K0R1UFdQamh4T1lsTXVUaFp3VFNyUWVV?=
 =?utf-8?B?M2FlSWdkazQ2TzRiOGQ5ZGJjVG91SHBwOEpmRGhqS0ZmaWlLY0p0S0c4TDJQ?=
 =?utf-8?B?NngwcWFiMVdYN3dqWExYenN3NEkxRHVWMXlRUnNDZVpubE0rcVlMbnUyQUsy?=
 =?utf-8?B?bm96Y3I2LzZiVUY2ajRPSFpJbllDVHRDcEE2Uk9RS2tGOHBLbGhCMWJUUjEy?=
 =?utf-8?B?dDFudjlxWDNMdVlUL1RiSmRIdTZWbXpJSXNwVDJvV2VyUWt6aExoNDl6TXlT?=
 =?utf-8?B?Z0ZCNXVLejF1REY5KzZ5Q0tJWmg4eFVyUm9xWHVTSlp5aVVtUCtMUkZqbHVw?=
 =?utf-8?B?MkNtN0VZWGVlcDlFOGpOd0ZhVXlWcnVrT1o0S2pHKzhFUERMWXZ0RlhJVXNu?=
 =?utf-8?B?NVVTWFZKaElSY1kzUjFobXhuUWRsMFplYk9YSlFjQ0xoMEtHajRZQjlYcEZX?=
 =?utf-8?B?bzgrd2dqMStEQWhxSW1ucU8wYnp6ck9mWDYvVTVEUG5ENnV6bkRTV1E2eDNG?=
 =?utf-8?B?ZXZpTUlIczJrRWh1bUZWODI4VmlwTUF4dnpvUzZmeXJ5RVQwYnFvSHJJTWpt?=
 =?utf-8?B?bi84Mk94bEhWdnVjR0cxalFiUUt2clhHOGoyckx2TmloOUQ1ZHRIdmRmKzM3?=
 =?utf-8?B?cTVNdHgxaFE5OFZZb0lBTVN3b3BVNEMrMFJpOFRSZjJBZ09sSmxlZGlPRWVt?=
 =?utf-8?B?S0RCMFVRcERHT2p1bjYzS1NLOGZHRXprUHUrUjBtdGMyUEpRckZGenY0cTRl?=
 =?utf-8?B?OW1TNklzR0JqdGVuWkdmMXN6cDdMQWFIUkd3aUdXUDVlR0k1QmlCazZpVzB4?=
 =?utf-8?B?akhjRWFsTHFJdFRBRmUrenQrMmJMUWJKcFNhV0VWS2ZMRGpVZnRFOVZsZWNG?=
 =?utf-8?B?ajBTTGFSSzFyLzBOdW03Q2M5NDA1d21qZlJjMFR6eVlvZ1Q3cHp1dXcxSjVU?=
 =?utf-8?B?emlyamN3N3NKbjVWY1dYSnF6R0tBbEh0S3Z1YzhmWjRROHFHQzBXSHo5dkxp?=
 =?utf-8?B?MUxQZ3QxazVUYU5JVzQ1UkE3Q2Ryb0xBN1UwdTMzWFA5WkpXOU8rcnBVbmpt?=
 =?utf-8?B?R3JDanpqL0kreEZNSEQvcFlNTjd0MlI0ME5DWlZPdGZLYURKSHd3Rk1CQ3dP?=
 =?utf-8?B?dkowNkZuamhUSXFGOWhES1pXMXhsZlQ0KzFKZkpIMnZpVlVlbm11NDBBR0lq?=
 =?utf-8?B?K2hoUmVoKzZIRnhXN1lGMU81TnFWUUN6anllQmt0eVNtOGRzcGNXeXZFNEMr?=
 =?utf-8?B?TytQZ2xHMjJ0c1RRVkpkbkhGTzg0WGx1QnFlTksxUVVhVmZvL3R0TU9JWUNI?=
 =?utf-8?B?WTZHaU40WTQ4b25kbmNGTlp1aDZkTktuSWptVEwwajJ5TzltY3FjSHVzK3Nu?=
 =?utf-8?Q?VBf09/UnsTV0f4Ritng9NzRXFxxoa9+Fl8YupQkKgWqx?=
Content-ID: <BB970D6F51193C4D82A749A7C9B0577D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754ed595-e384-41a7-9ddd-08d998dd67f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 00:04:54.7889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y061ztjOb7vQn+fAWelGYASrG+8KSY22HgMsJAPQvHDJeI/MDCfnuKS9KfeLlR0AxARqcwkMrccJlJwMGO9NJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_170457_834453_1538AFF3 
X-CRM114-Status: GOOD (  10.83  )
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
> blk_dump_rq_flags deals with a request, so move it to blk-mq.c.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
