Return-Path: <SRS0=9E2w=HK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A3CC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 06:34:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 169B764DDF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Feb 2021 06:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 169B764DDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:
	From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Nch3sYAIgiGZEvE8fhxU2M5SXCA5gwgQqeJq2fiSVk=; b=XFwSEnXpFw9/jxFxRJk3FdGjTA
	XtQ/YcMLrL1JucG+/iUKrAi9N6IzknG42Y2qGSeR0gwKNaO8F/eG+cbezmXFBtMiZ9mf7YZOVKMGh
	N7BHYmV59fcxbDF7nTbDRDEYAfW/hrBZY6+v24LMFveHqN/sHH01AEC9scrzKuDqnCdBNjgtOhahO
	TmQfa8KrVpjC6BGyQZs19srPdPtPevaRtivJXZbCL3WRJ/h1HefMZSSS8RnmLL2AqxM0EhNyltwpN
	u1QmTDps3sTasRhlVHqHNEYxH5Lh/MuxS3t543de7+bCjiMpExOsU1Q2o9CEs1rVyfclzeIA3xg/G
	0dgJOMgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l907H-0007Bf-GZ; Mon, 08 Feb 2021 06:33:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l907E-0007AX-W8
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2021 06:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1612766025; x=1644302025;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=OZEz7wC96G1cz88D44BwtrezfzIpVnipTHZ2NRkst14=;
 b=cmgkLYhOXElEO8l2e4pS+lNS6KQ13Q67GNhIwaKolDiI6YUzIy/yoV7L
 frvIHGxU4qHu+90Wlwf5siLSCPXVydq5bxHADDAo+rrvCSspBLTdSYqf6
 mYqgTu5SlWxn80Re4vELDq8aLsHpeDmRLE7aFYufjpFU5SIa6xH1Xz9Kh
 HLElps6Ddu97PCTRH30CExgY7aUSNlSZeowFwSH5jLYkNJGkEt2eeonK4
 kxudgQXX25udS/lHWxjKvmDS3TjxuzLjJ+9xcyGrQ58CiNQEHVgvZMwNC
 PMQW8SlSh3eW+FPwKX/LD61uQDgod781R+JUNGyro8F0cj7lCNWrEjwDW w==;
IronPort-SDR: TXpGHbccsewWhc4PXyiVJdLaFwkTaLTrqutw0V0p3QNULEUTJL4f/be/d+jy2H9/z6BUpQq/H1
 tsL7K1GBGNvuM4qV4RjaFpmbPG2H1lc3YEnZ5kfz0hKL7w6k7rweL4t02QD3YYqo1E1/qNkZtE
 +YWNgCw7D1C33gC5NdC5IUq8dgEiGAG5Zw51TfKnvC1KTqB1HijRAg31pX2BRi2U5g4UQzPidh
 vFxu4Q2heiDkqgAVeKaqkcDS84TtpJ14gMZP1bUAlCjGI89g3q4mg/RvkyZJKQczfb5mTIxJ0o
 oL0=
X-IronPort-AV: E=Sophos;i="5.81,161,1610434800"; d="scan'208";a="43298838"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Feb 2021 23:33:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 7 Feb 2021 23:33:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Sun, 7 Feb 2021 23:33:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6Zf5jMiDgIPVHNDAw0LQiqfBjrv5IPsYofZt2uGwQ7PmtITaYXJiOUXC1XUNr8EV0kERs6n5biHOuPrFWc1pQt+F+QKWqrkvb2rGHZAiyvSnOl9K/z1EIDEtX0pNQzz18R2lQ3SPvMXJ66p2dtE7wLJxQhtrJGacCcR9F5BfwCs0NksbIyP7QA5x8H6WvJEXh01SytSUJnzFGx0QXlAsLx09B3G+a74/S2eYXO6Yg6+GC1hjeZFJ/tkqqtiplceZ7FwB4GD9oSuNGIdZT7+7YHUe/cFbPSjmlzHAqUKOdw18F6iwrRug/U/dGAj9WqUoEOvPNo7lxioxEg1XC9d/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZEz7wC96G1cz88D44BwtrezfzIpVnipTHZ2NRkst14=;
 b=hmpSCbQX0RGM/h4F8igNWN2er9b0Z1Ku74LP7QJf6p2ADNLLWcfLDwyy/WL4QC7xs9+7NmBjxF3SEqB1B64MeYsQIa+TfmFSPjs1Xjrqwq2nHuphoqWqfGEbgVtmCSVyPlx6JAYpyjzBgjLXNZQMnT44ZYTXBx5lc9HpjFVT0rDcR5xh9qUYbD81xTWj9lUXZvbzm1n+b3yNCWxIvYllgwR8TeBttLYcdD2A6MnFb/vhH9TMQV10Xys2G+NI1tUqPDK81Pox5sxYEVj5OOLuDfVqg51R1l7Ey8dc4aXPJU2PPviwd8YfkLv1HJeoMtMZXf2W39SW6Tx72z9N26TMmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZEz7wC96G1cz88D44BwtrezfzIpVnipTHZ2NRkst14=;
 b=t/g71MmT5LJ/wPDAMxS/W2xMnHSzp1Ll3Ju74gXlCglgOMtxiaDCDvOlTubR4BIs2yRbnQp9p2ataMjZzm3niD4UczXGQ3WNXUIOxaGmOp301aDTDayGv0bEMpUAONRxisRn1kBPV5dz6N55e5N5c3eTwUqXy7qaktu5kkqh/jM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2941.namprd11.prod.outlook.com (2603:10b6:805:dc::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Mon, 8 Feb
 2021 06:33:38 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%4]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 06:33:38 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>
Subject: [GIT PULL] mtd: spi-nor: Changes for v5.12
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for v5.12
Thread-Index: AQHW/eRVuYWfbnnB1UyAW+0KoM9ATQ==
Date: Mon, 8 Feb 2021 06:33:38 +0000
Message-ID: <353c6d02-5426-81fb-c883-d9b399ea3111@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: nod.at; dkim=none (message not signed)
 header.d=none;nod.at; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8928434b-ca99-437a-c2b4-08d8cbfb780f
x-ms-traffictypediagnostic: SN6PR11MB2941:
x-microsoft-antispam-prvs: <SN6PR11MB294105BD36A5D38EA6ADAB10F08F9@SN6PR11MB2941.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:370;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V6TwceF5Te8rrRKvYBSgSTivwhD6ipN5WTpcATTz6JIud3TQpzFSsPUtbJTu8keNURj0XuzrdA0jgnErXnYvgnQeKfnqwib3wsqQUgH0uu0Z0DQ921sfATKU75u/balD9Ux/qm5/udeW7hvD7FzTVCn1Pp3KH+PAK4e8FBQSd4nKgkOLdk42U232UiQk4WPtYce/hkpuow1evDZbHASDwwfRixN0dtvB01cAPBmaF6oz0PtC4FOEbKHo25P+i96t/j9c/E7QIlt829GBWY58QnZtgFyCQiLvhf8wLkO8jNac0xlNJqjoeyIE/qn0o4aJWkDd3PGsPYDmXB0p6CnsAjtBkv7yDxWSlWS8RMEIbpoAFjDy1jAqTtjeBiNG/Z/mtp0N9jL2dusCbmpqJxBa5kTB/YuIgNbBQmtSpB6vrfqBZ+4oUeQRjddr6nGg/7vaehdMFcx2zPl+NbKC0cVKVFoSteNwYm1tSwEplSN9+d1X4TvLzfX2fA78pw2TN16nES0v73tUzLx6hXD/Zt31JwqC2A54ZRibhD8SZ81pvSIkh13JTabbEHinWvD/cFA9+ae2/AodIXgXLxzYfvf6gTKFC+g1j/ZXUQLTdnmULCA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(376002)(346002)(396003)(136003)(31686004)(66556008)(66476007)(2906002)(8936002)(66446008)(5660300002)(8676002)(4326008)(36756003)(64756008)(2616005)(478600001)(6506007)(186003)(66946007)(76116006)(91956017)(26005)(31696002)(316002)(6916009)(83380400001)(71200400001)(54906003)(6486002)(6512007)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OUMvZ0JnVDVHQzh5cVRGRnJRWWhKdG9DOXl6bXprdDB1cTN6ZFRsTWVSaU1X?=
 =?utf-8?B?azRQTG1kQXJRbTErSSt2Q1c3ckNvMzZlVk9WL1F6bS9CR1RKa1pSTFA3VElq?=
 =?utf-8?B?L0ttTThLWnAvbExoUGxTenMvdEoxNUZoZW81ZVBERnBaOTJIcW85RlBCdnFp?=
 =?utf-8?B?Y2FLTi9sZ1J1cThBSVZuMys0ekcraXZmcTZyd3NtVUg0dXJUdWppdGdaT2lB?=
 =?utf-8?B?TXVHTDFCd3kxUVlQZ2huM0c0R3F6ZFhtSlNHNTJpd3pSbVR0eHBLWGlSMmdK?=
 =?utf-8?B?RU1ySy84WDE4SzR5SjV4M3BPYlF6SzNFR2lNMTRkRCsrU2VwUTdsTEpOZnpU?=
 =?utf-8?B?a2Vyc2ZZZE9kSnk2SHpVREVMS0JPdkp6UXNGbFJIbkhlK2p2Y1VGWlQyTE9T?=
 =?utf-8?B?S2VkUE56RXNRUGRSSGFZNldSY0MxTVJxaUg2MzhKY2RFa0tOeFRZVGp4VG9K?=
 =?utf-8?B?MzBLM2QzVEtXV2YzNWRvMEMrRTRpMUVQWDUzOVdSK005MkY0Z20xcnBRTU52?=
 =?utf-8?B?ZXdCR09oeFVYcTl3S2FaVldZbkpKMXFBaUU5VXM2UitCRTFMUmx1eC9CNzh4?=
 =?utf-8?B?MFFaT0dPZC9ZZFkwK2FaeTcwV2o3MEVmZ1hlcEVaQm04Q1hWRTYyVVRWcENO?=
 =?utf-8?B?RFR6elp2RjV5VmxFV1VkaFlPZWhBdHZ2eFVlUWF0MVRIbTNpMEYvbGZJeEVa?=
 =?utf-8?B?S29MZ296R1BYTEl4Y1pyYXdLc2dSZVlQQURHNm93TFVhVExTS3Bpb0NhcTVC?=
 =?utf-8?B?OFdXblMwUCtsdWVORFp4Zk50eXlTL0Y5WGlPdEEwTVRsV0xGSCtjNW55a3Ez?=
 =?utf-8?B?RlNUZEJOdmV1WCt3YWhlUk9uT2h6K1hLMjdRM3gzTGlwc0sxcnpSZTl4aDFu?=
 =?utf-8?B?cGtjWUFyL1M3dXJoclFYYWh1VWhzSVdSNVE0QXE2d1JkNzJoSDhrWWJnZ2Vs?=
 =?utf-8?B?V3hSbmxSZFRFdHY4UkVnS2liSURKK0svaFJYbDFRYTlQU3VUSmZLcTJOWDZH?=
 =?utf-8?B?RU8xWnJWSFAvbGtXSTVPNzFQbER5RzhSa3hqL0QrT2R3ZkpaRmRWL0hhU1RF?=
 =?utf-8?B?R3Ryc0pla2RnRGNmK0xVYUQ4anc1U01pWkk4eGdvK25wa1RDMk1XUHpFamhR?=
 =?utf-8?B?UCtmMER3SU1WNXVwTE1oRjFOdVRSTDI4SDNEVXZmNXluN1VUSW9CZVFwckFt?=
 =?utf-8?B?Nk9Eem1adk42MUNvMzRBMlJhb1RVUURIYXQrTkxVd3hnZlZzdEFtdGNGQ3RO?=
 =?utf-8?B?M3VvTjMvcFQxN3pHVEtVL2F5aHJGRG5DZnRHN3Q0Q3Bld0w1TDhuV2pBKzF5?=
 =?utf-8?B?cHpFVGErT0kwRmZwd0t3M1owWWlKOFRmbVplRmRVTHNwaXNwaEQwT050MDRt?=
 =?utf-8?B?UzRCUWFSdDhFMFpGOXhyNjM0SVhaSXp0b3NQK2cvUUhYZmtsOVhESkFBdno1?=
 =?utf-8?B?SldnSzRUMWRnMm1KcFltZFBCUzlWV1FadEhYTy95NGcvQU1yeUVPekZMYU1M?=
 =?utf-8?B?MXNPYlZad1lKUjdqSklTR1BLbSt2OW0rT2Nha1NQbWlBOGtjajEvR2hVQkpE?=
 =?utf-8?B?aDFGTlpTZWZYb2tCRUV4R3pSbjdPTjhMK3JHS0NBSkVxdDkrcWRQbUVFcnNX?=
 =?utf-8?B?N1p0bksvNlhCQlFjRUhyRUV6Umg1WTVhdzZDSUNYd2lZUGpLWGpvRkFITjVj?=
 =?utf-8?B?VU9uZ3pqREtLVFZKWEp3c0t6azZCeExXKzFFWjV3enBNWms1VjdWRzR6K05Y?=
 =?utf-8?Q?sp0I6jYtRTDrLiiWkw=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <CA934F564742A642A4B831E1C060530B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8928434b-ca99-437a-c2b4-08d8cbfb780f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 06:33:38.2671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cdOaANYS+3kDZE0VWNf3pJdyJH3D8d9H5Ks5usU6B0+FX/iBYKXTs3T9chv8pitiO1QwOgW0IGe27ELTbS4Z8TSWee++NG5Rne3q8hyWfJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_013345_331239_FB95C387 
X-CRM114-Status: GOOD (  10.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Richard,

This is the SPI NOR PR for v5.12.

Cheers,
ta

The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:

  Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.12

for you to fetch changes up to 75386810d3a61f4bb9e180774291454f7235b8b3:

  mtd: spi-nor: sst: Add support for Global Unlock on sst26vf (2021-02-05 15:24:59 +0200)

----------------------------------------------------------------
SPI NOR core changes:
- Add non-uniform erase fixes.
- Add Global Block Unlock command. It is defined by few flash
  vendors, and it is used for now just by sst.

SPI NOR controller drivers changes:
- intel-spi: Add support for Intel Alder Lake-P SPI serial flash.
- hisi-sfc: Put child node np on error path.

----------------------------------------------------------------
Mika Westerberg (1):
      mtd: spi-nor: intel-spi: Add support for Intel Alder Lake-P SPI serial flash

Pan Bian (1):
      mtd: spi-nor: hisi-sfc: Put child node np on error path

Takahiro Kuwano (4):
      mtd: spi-nor: sfdp: Fix wrong erase type bitmask for overlaid region
      mtd: spi-nor: sfdp: Fix last erase region marking
      mtd: spi-nor: core: Fix erase type discovery for overlaid region
      mtd: spi-nor: core: Add erase size check for erase command initialization

Tudor Ambarus (2):
      mtd: spi-nor: Add Global Block Unlock command
      mtd: spi-nor: sst: Add support for Global Unlock on sst26vf

 drivers/mtd/spi-nor/controllers/hisi-sfc.c      |  4 +++-
 drivers/mtd/spi-nor/controllers/intel-spi-pci.c |  1 +
 drivers/mtd/spi-nor/core.c                      | 49 ++++++++++++++++++++++++++++++++++++++-----
 drivers/mtd/spi-nor/core.h                      |  2 ++
 drivers/mtd/spi-nor/sfdp.c                      |  5 ++---
 drivers/mtd/spi-nor/sst.c                       | 52 ++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/mtd/spi-nor.h                     |  1 +
 7 files changed, 103 insertions(+), 11 deletions(-)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
