Return-Path: <SRS0=N0H7=L5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F409BC07E99
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 13:25:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B621B61447
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jul 2021 13:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B621B61447
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osEwkHtEhuyX/8/2jV/7jSq6zsf+6f7w960HNh+l3Ag=; b=jZm2PysWkVQ5pO
	8qk0k+d+RbPSfD7w6otwiuuDvKaQi+rNGGsZnTNfmq6yaTAqbvVrIHzWYc5hOQ2SeewBndx2YffTw
	vcygPKPqxzjGGDgZ6zu6k/xQewTkxlF0tlj8eETkFt+frd4LFe1MGGjQkzvOI5LXdLHJPnBvoj+BL
	NmFOYnuY0v2DyE7dqk7qcMfeKzkhIsOr73WcijHjeZqLHqOVXrYnerodiFqvBlhgCcUqjliKBducl
	80a3wlJqdewv7lJc+i/2G8IOPbrHy6nKit6j0esrWhiwysxuISy/0crxqk6v55BW/ninG6ADUKJJj
	kxN0RHwxQR/nti4yQxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0OaJ-0090NY-UP; Mon, 05 Jul 2021 13:24:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0OaG-0090NC-Vi
 for linux-mtd@lists.infradead.org; Mon, 05 Jul 2021 13:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625491464; x=1657027464;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bLhmtPt+R5DFpkgK+dehOvvJzKQQQLJidNrYFhZ6Sfs=;
 b=BUsk/FEoFLGPsvY4iDR/NUm29RTLYomcCjxdTePL4gsrX6dfeSJXkmMW
 xDj6tpgCOLEpwDBaI9lfRk2ED/ESJm8HDkDsGFu/VdVGkR5It3B6XGwwn
 Bu47QqOQXNNZTK2AppuKVd6639TmFCc6c00UO6EbHf7qCzDJxFTvExx+1
 c+83nj0OkajquV0/Wi0syqfh0Liwk/fqCgKnv+6/25J3GoFVbS6xngW8o
 n328OwCE6iRL2tK/9TO24WWeP0Pqg5RfId2wOI0+8xyBpQUdmU9zqbHbe
 tAokzuvnTAP6Y8djF7TAVm0+stEOs+CuKdso7lpGS4QKuq2OJ4R+lL4pz w==;
IronPort-SDR: QpHn67a6WoaUYN6UftPlAeha74W/4tuWwgK1c6qP3CC6TmPi0Ui297mg8ncUuls1peLmzLt2O1
 G6uoczRMLNqFroSvCX2fO3x0zMAULEy8QcZVX5reeNyXKWVbPcCY40QJLYujq/0bnUvlJBev4M
 UE/uboNp6xzAZ4eb5S/qKMFVT4K/r24fFx+E935VF/SXnhLjlH3x7brAYDi9id8C5rFGnf5JKG
 IUDkyH1g1f/eru/b8YzShdmQHjboKfocf8ogSi3udLuXbaakAzhEricppjmn+8i6LpS3bw5ipQ
 xGE=
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="134623651"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jul 2021 06:24:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 06:24:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Mon, 5 Jul 2021 06:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhj1O0qGNIojulgMKRWFrTOVhKrGBhikrvVfoIHFh/lSBCfdPHSMscvv/A6i2Q20YMA4K3x3Zjo9KxtW7/AxdTOxNcZNUxpK6xgpdJzWOHvkWBEb/cvh2/qQooKIfoKBBdEWLA5ryVdiN0APtr9xI2jYypsr7O3W0pEUCXY6c9pNVVfmvWBzJpbSexQ2NQU/CgPoXQ4Bk76sriQN5cxotZY/ULttM9TPGu8Fo71XoWJlxl5OLQpNnnm5LxGFq5x6ZhLZVmdPtZchkpr6qnSugSZ0GGC45/B/0sahJxbpFmILyyV4x2vVXvNxQAStizTYh0EIflCNAg/lhD0bDUT2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLhmtPt+R5DFpkgK+dehOvvJzKQQQLJidNrYFhZ6Sfs=;
 b=ejc/PCYdFTPMdgPtZwoJHat4JyD1Ngj5wY1eWLjjA+YM4KYkZ42CIw9hWqZOwER8+c3CevCA/Rh0KK9C4mhklsCphmyP3vzOUSmtEdqZ5l+AmFfFj5DrqDC5g1DD8f5E9gKLFkw9rqb2IqeDKnC1hoxtLhH0d/m4G1Y2jq47KrL5BPzm3rai7r59ql7z5Me7QGLPCULUlVWlTHvRyhdHtAQxnwqVGIKPKVsjZx0yKpyIP8/rH6d66nXADYUVPvmAOUKx/6H0aDSXyAUBt1GAHxLt0BFSKr6AHtaE5HLEp0MkAibT7Km3L5skKYXQ3aUnfkHyKca9fc9I/Rq/AIvZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLhmtPt+R5DFpkgK+dehOvvJzKQQQLJidNrYFhZ6Sfs=;
 b=U40IUsjHqrovP04fJ8Jx2b40mHa4VLv+u6+rms23YXicpKoOF8Xr2dsmoPLqyMgiR/6FRe10zE1pzqWC9Wv6o0lnjju7ggiYKNAsemMV5sOoKBVjifTyWxMk8R84hiNNv4Au1uDP/2VCEWiw2O2tPjTnZi2mYXD5bniV7tGVrcI=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB4886.namprd11.prod.outlook.com (2603:10b6:510:33::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Mon, 5 Jul
 2021 13:24:22 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%8]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 13:24:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, 
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/7] mtd: spi-nor: core: Report correct name in case of ID
 collisions
Thread-Topic: [PATCH 2/7] mtd: spi-nor: core: Report correct name in case of
 ID collisions
Thread-Index: AQHXcaEQoPsVFqIFYEScMC2zhkoVuQ==
Date: Mon, 5 Jul 2021 13:24:22 +0000
Message-ID: <579514fe-3134-c964-48ac-af729c4ccffc@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-3-tudor.ambarus@microchip.com>
 <20210705131328.ik765ywjryr44pyv@ti.com>
In-Reply-To: <20210705131328.ik765ywjryr44pyv@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11b5e5d5-0757-40c3-51b1-08d93fb833b8
x-ms-traffictypediagnostic: PH0PR11MB4886:
x-microsoft-antispam-prvs: <PH0PR11MB4886DE604D9E32EA3CA96075F01C9@PH0PR11MB4886.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fmrACqugVFmOv/danOKitsWnB0HLYBgkqPVe+jhSwedaYJXn/dYc4RFgDdzOHVfpBlX8PECdcOjlIhhwp7Zyuzw2oM/r3zjUfRsqwkxYAoMCy+iCttXyZHG64YpN/M4RwWjwXJ2az5EhDWiHWG68aO7neiaLkncUhc9Kezuo/jYgTUTcT+inenlfe4xzv2h0HdiNOS1wR5oXIikux/AQRtLuvgZP+OdYhxZdzc6a8H1jMFo91M4DkBvvLYnxhU2anOZ/+PHw4DnBoJSaRK4LUA2V34OVImcmWS2WXN71XMb4iiq4t3EJYeaQ7j3Q0+EHSMEcO7NN/lrGIIEn2p8z20VA4BE3b/JPw7eg8a/FZmEmpSUeNGYFUliQrpSN8mQz7tpvJRwwcwGD0ROKgibwZHY3z/lzx5Fcdxm+ndt6soa07hUwJ4pK6SlQLPxVLiNorhFIX9JHZzevKPKRJjxicbl6o1RxE+vAAXSlOGzZDXILhuBOT7X0sKIOVdvsg+nXhmHidgIAaIzDnEwBw26OJYrBJnJXoPxmuwIfZ/+Xl8D42fWLkOKkClYR2YV8JgjneDdCQELROHpIFYaCiRpPj5r9Dq3EWgZuuMFZlTNQnH0T3aUch5XG9e4SckIfep8kqql8kxuygOrJuL7qTTvyi2vI6YqUQzORImi8D8AziJdjHqaODw9c2UbgQ07HS8KpWzEsHAUC279X5IIMNEKXy8L5hvNrYgPp9YKG4BOkfIJ6u5f4wDtsIUHDJtqNENCD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(376002)(396003)(346002)(7416002)(6506007)(53546011)(6486002)(36756003)(31686004)(2616005)(66446008)(66556008)(64756008)(2906002)(6916009)(91956017)(76116006)(8676002)(86362001)(66476007)(66946007)(31696002)(54906003)(71200400001)(8936002)(6512007)(478600001)(26005)(5660300002)(122000001)(38100700002)(316002)(4326008)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHNEaW5GSmZMYU4xK3JjSmRuaHRSSkVGL3BWMFFjR1drU2IxUG1OajUxa21F?=
 =?utf-8?B?S0p2Q0dKSnQ3N0M4eUZadjFZYkVuVDZQOFpZZkpaSFU3L2I2NmNhNm1CRk9Q?=
 =?utf-8?B?a28wdERVRVRuMGovNmcyTTAvMzZJdjViYzJrM0hjWUVCdzVuNXY0cXFJRmE1?=
 =?utf-8?B?eUM3bkkxbVhHcWVLdWdpRHF1MHc1UkdNYmgzMHRzbjFpN2RWS0xCUTlLZm1I?=
 =?utf-8?B?SXI3ajFtaDBBckJUQ2JHK291K0hsK3RvUHhlOXBiNUVIOERGZm1aUmVpTEpE?=
 =?utf-8?B?bmIvbThQSmxpSkV2NzBnalRHQllaL0lWWnRvcDZGcW9iWk91ZHVHbmxaY3FK?=
 =?utf-8?B?MElibVFENlE4WGRqNDNjVWZMYk8wMnlXbFllcXB5QlNDT3VxTWRxSlJUUEJX?=
 =?utf-8?B?NGhjYnhSTUNxdmoxTU4xVjFFQlFwblBtWkRjMFUvMjdtVnQzZldGalNwSE1B?=
 =?utf-8?B?YWRKQTVYcVpLYUd1SXlKUS9taUw0ZEZjbmVqZ2xZbVEwOU50c2g0elZRTUZq?=
 =?utf-8?B?UGo5dXhyNmk2NnNJSnZMc0prN0h2cURpWVFtNHZFLzdjTG9hR3lhdjliRjYr?=
 =?utf-8?B?bTdjdmFjOUVQR0VDNGdKL0toMEpsbkJkRkcyL1lycWViZVBUUnYwd3N2RFQr?=
 =?utf-8?B?T1VWVGloRWlDUXExV1pMeWh6T0tscVZxbnRTcTQwbVBKWTloUGRyU1NtU1Fl?=
 =?utf-8?B?ZVRtbE1LVGZlU21EL21yRzhUWjkxVXpmT1hEU2o4VE1WT1V6K0pSaGswYitj?=
 =?utf-8?B?MFBONnl2bDJQNkJocTlwT0x1anFoZytLcytQUGRDOUIrNVNiVXB6YjFXOHNk?=
 =?utf-8?B?Y2s5N1VUV1A5dGZxeGFDYU5qV1krQ1dua1BDelQrYmE0OUh4MG4vNlZLeStF?=
 =?utf-8?B?eFBQbVZNY3RHdUJQTEM2RHQ2SXdraFVYU1FhZURCN2xzRTcwUU5LM1BhL1R1?=
 =?utf-8?B?cmRaWmpmU09jRnMybWFTRGwvNHlBeFRvR2ZVWG5DMmxUV2h0RjNYZTV5bDR6?=
 =?utf-8?B?Q1lFZHZlYkIvUEVmSjgwallRTzdmUEMzVnBRWFppRHVYYnhZUXNrN1l6aURx?=
 =?utf-8?B?YjlWazg0clFCT0RaMUJUYVh2MTJRTzNtYTUvSVdlbEpkWWF3dU5teEYrQ0d0?=
 =?utf-8?B?NDFKT1EwQyt2aDNDcG1HZm51V3h1eXE2aG9hMFhteEI3RmxDSWQyTDZ3RUIx?=
 =?utf-8?B?UmF1QXIrd2pMckhCNVNzZE1mRlhDRWNuN2YzcUJUdkpUZ0dYSnh5Vzk3V0hX?=
 =?utf-8?B?TkIrWFhTTWxsTDh6OWdocmZLc08yajljU3FabkR3NEpSUW9pVlpMV3ZraHJm?=
 =?utf-8?B?MlhvOUxjRnBrdWJLNUlXcmY3WjFxUnQ4clhKUisrSTg1T2N3dFZsbWRtU056?=
 =?utf-8?B?NEpUTjZHZW1oTUhOZlNGMDBMTkM0Q3B6RkF0M3hVeTEvSlNBMjdVcUdadGtr?=
 =?utf-8?B?cFo3RlM0QTZOU01aOG1OaTQ4ZU84MS93SFBjTkdLVkNnSzd3djlua0ErRDVW?=
 =?utf-8?B?NWVhS0QvT0djZGd2YWtFRFRMeThYK2xLQmJ3cTUxbU1YMmhSeE1XY09rcmUv?=
 =?utf-8?B?NEVoMUI4WlMzWUZYYURzUUVMZVZQK283THlQdUNUc3BnQnRQcHNmNWhvNUJa?=
 =?utf-8?B?UTVJTnp6VEdrYWsyajIwQjZ2TUVEazk3UkhVSkJuQmh5a3BidEJTN08xdHBr?=
 =?utf-8?B?Sy9wQTBJOWdWUkxjc04wOXlXM25EdXJYWmlJZ2V1UDNJdnBCSFNCSjNkSkpD?=
 =?utf-8?Q?+UYYfkaO4TZQWP26TQ=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <C671BA4F09C9044E89FCE49D8BB09F74@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b5e5d5-0757-40c3-51b1-08d93fb833b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2021 13:24:22.2551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: drFyY8Q24bASzd/ZEgwz8b6++mUBW/RAjtGSeubDRFX8uzxTY+rtWi0WUf/eB0EoAo965hv29mm27mlT9N8Oqwxmh9WUjoP2AlBohfqagdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4886
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_062425_170864_784B0251 
X-CRM114-Status: GOOD (  19.41  )
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

On 7/5/21 4:13 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 02/07/21 05:41PM, Tudor Ambarus wrote:
>> Provide a way to report the correct flash name in case of ID collisions.
>> There will be a single flash_info entry when flash IDs collide, and the
>> differentiation between the flash types will be made at runtime
>> if possible.
> 
> I am not sure if having one entry for all flashes with a collision is a
> good idea. For example, say we have one flash which supports SFDP and
> that's all we need for it. Another flash with the same ID does not
> support SFDP so it needs the SPI_NOR_DUAL_READ, etc. flags. How would
> you handle this case with the same entry? You would have to set all the
> flags in the disambiguation function. And nor->info is declared as const
> so you can't change the flags in there. Any code checking for
> info->flags would not work properly for these type of flashes. Wouldn't
> it be better to have multiple entries with the same ID and just pick the
> one we need in the disambiguation function?

Your scenario is hit in patches 3/7 and 4/7. In case of ID collisions between
a SFDP and a non-SFDP compliant flash, I propose to set SPI_NOR_PARSE_SFDP, as
well as all the other required flash info flags that statically init the flash.
The SFDP flash will init all its NOR flags at runtime, while the non-SFDP flash
will issue a RDSFDP command that will fail, and then it will init all the NOR
flags based on the flash info flags.

> 
> Anyway, if you do decide to go with this approach, comments below.

Right, thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
