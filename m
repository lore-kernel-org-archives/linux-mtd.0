Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8006C3527E
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:46:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6D622A7E
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB6D622A7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=322DuDgZ3jczLXv/6FCM5E3q388Dv+LJ22csZ7/EQjE=; b=JDJ90GSlKuoEZhVpQAmofBw+b
	E6hfckS1Ma0CTfKjd8JI3Zt/UAyc3mkMRMZn9ybLVhzd5mKl7ho9ybpWruCQnFo8smd/E3U7aRUsV
	qNCf5ddOqBkcc9LbajyzYVXltz/le0d/n3yb21oy8AQ70QsgKQLjaDSkc/AwAb57FlLWgJBQqtnnE
	laJTIirk6YrMWSJKfGHQkc/RdZKc+PN6uJp1yXJmUJnMpvvpYiSBlHRkhUWw3As+PrwF2B/+3lavz
	Ndl/X7wd+Su55avKe3ugSzLQf3Qm9jHyiAQ4GJx9HrzTaWlWUHwpvRm/EoCrPNaHltPrBu7n1/hL0
	b0u8DCwTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkpmJ-0001kk-9N; Thu, 03 Dec 2020 14:40:15 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkpmG-0001jn-7K
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 14:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607006413; x=1638542413;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kYxU7BAfZs7UA2fkX6FDjffk0Io3lI33/oE2Tl0d92o=;
 b=xbOXVrI89jypgR7wZnUwSP2bJ5ZbBzSIkx2JMThk03es1yCh6PXi8Ead
 5mY7WGqpkpH7nlIphpnxv+GxTBoztWBgEBBS8fgxvj6zWF4Ja2qc6yR1y
 IIqHICDNvxlbC3GjyWEXznKj5eAcr5hyzaRLvEAKuIcS2MOIvc+v5w0za
 HcPhM7ReHgWnJhmhHKw4QrPtKoHPp6rPlXx2F+ii4KZ9KPfg+l0jKD+33
 g+c7DNd3TXhL0sM3zZ9bZGTAVOyv5oG2EookEQbI/laG1N1WC5SBI0noj
 qUjwOMPRT0Q7YdS4yPTesYBILiNN0aSO/DbpLbz5/uwHhfTr0kqN9voPl g==;
IronPort-SDR: H0ffqA39Vs03j4uw6DP+rG9PxtXuyGmBDs0oK8EMDklly4GaMp9rS5f9fP3mTaJZk3n6Uk11fO
 1va38V5eup4SofQ3ps8OKa1C1lUI7AEw564rUtIKnIw9XJO9rdpoYeozSCItB59kqZfZs5kGlP
 Kj0aE0JjpOt5cO2+DgfKYz1PPfd8mOquMImemT2q0NbQiFgCsN+7q7qWTY4rBDMeIBzrmBmRIt
 vw06RfJO8j40tERiReh5fOQe/7GlYCZhoLzGRGpmIlLRcRpjbLRB1k44n2vxJQVEsG+7yGowwB
 9So=
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="100747789"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2020 07:40:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Dec 2020 07:40:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 3 Dec 2020 07:40:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAPIvb3gbrSHdUy+tEFttZGXIgYIcTZpTXubva7bwsJfInCKWQpMvXAQyrJrV8gXGKZ1je/F3R0x7FXqwlbpl+Wx1c4gK2uAOoz5xLN9W9OyWIzA62EYE7Kvu7B6UHF2VbWdoDmLjtzwXWRWP3VPddrPC8ie4Nr5Pz4akrBgTcLgxI2uM1QWG9nI9TkmGmZAFMquu8lGCyNBWeaF9qXnaLakWdV0WGwouW161ed73KREWq2x20LPks/Io2i9mTc0UbrZwLMPV7LbH1+k/DoIzlC7jOzVFyaNGo1M99EP+Oc3AXUtCftxhN5nzxFabrRn5N1jLcuTZgtITpLwilDfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYxU7BAfZs7UA2fkX6FDjffk0Io3lI33/oE2Tl0d92o=;
 b=i5VeU8LjijoOs2NBZKBmF1lhJZRqVwRw83HTUIFcXtiVAL4wrsm6GYQk5pRuCZHXoYrZ6Q5h53fTqIepzFI5kW0lVS5WitbZ3rPv4uzOFbC1C1ipy2yhQorku9r++ihZeyGnblwfCZca0P7J5Vutv54SqsLciGGtEcsnIrpZfNL2Wzk5hCll2WeVYJPkwvGRe53CTghMmxZ53Wnu4hAE4EkfF8t1SpKzTWyKzzWjr5bD5RDKBnK/+QYKDECFxCnpOf9bgiLhmH1n5cjhHCu4FBV+mVDb0tyOr96f8PdJvOFcc8Wb/cCRCwBTslqrlf+rCdk6LQ9Fo8OcQDJTCHLuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYxU7BAfZs7UA2fkX6FDjffk0Io3lI33/oE2Tl0d92o=;
 b=GEZ0nT2vRB7G2HwBSoxOTlpd6BzEULdVV9FTK9JdXj3RQ+cuWVw+mB8B61fs0OeX+mL0xwXrFnoS6I9ynS9HIGV8RaE2KryU1oiZE9ZHezefEUP59mCMqVscGFLGhzORauUEBV4pVmcGyrDyTNXnXTjfxvy88ya5RNLprYMQoEM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Thu, 3 Dec
 2020 14:40:07 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 14:40:07 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/7] mtd: spi-nor: sst: fix BPn bits for the SST25VF064C
Thread-Topic: [PATCH v7 1/7] mtd: spi-nor: sst: fix BPn bits for the
 SST25VF064C
Thread-Index: AQHWyYIxbYejLXpUREmrcdCKcR8FGQ==
Date: Thu, 3 Dec 2020 14:40:07 +0000
Message-ID: <fe37e295-9d74-160c-9b16-bbd5dcd5a638@microchip.com>
References: <20201202230040.14009-1-michael@walle.cc>
 <20201202230040.14009-2-michael@walle.cc>
In-Reply-To: <20201202230040.14009-2-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1002a76-7ca8-4b37-fd50-08d897995460
x-ms-traffictypediagnostic: SA0PR11MB4687:
x-microsoft-antispam-prvs: <SA0PR11MB46879D7BC4CAA7BEF2F39271F0F20@SA0PR11MB4687.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VCVhpUkQ5uhJmnCt+2wTZlQklDtaySsxYueXXh/WVzymZ8vAZ4XHitjfwL0Jjdmy1uIgLzkOVYJuTuRoA3VZ6cZUWTjut9+WyKJuM8kNYGP8K7104AahR1Kw6d0hQCSzOokM0l3ZHCrP0s1gRXiQEwMKGUfBEjMT76t6tBGcnESIA32dpz07n39WV7jdazW+rqqV0t2fbx00zd/IybsjQgQxa4jg64hjsYBHvxIvg4T3H6zO7rEIBhWgQMT4LJwCdp4kL4TZi1Bq+QEtHIJCBqxAdkg0vM9k7FICaIHRwzns/oRIpwKDBxmg5taVI4gUFlaV9UkQiuuM5WWHTKwS7GMS09fwUx6LUCS+y9i712Om4jvNe7mx9hqBFfGZNKeTJgOScZ9CFvG4Rr9fXCbzzpiUlltSsaMiPa0JIxC8GeU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(39860400002)(376002)(346002)(6486002)(36756003)(54906003)(86362001)(71200400001)(64756008)(8676002)(66946007)(316002)(66476007)(2906002)(4326008)(31696002)(110136005)(76116006)(66446008)(66556008)(2616005)(8936002)(31686004)(186003)(6512007)(26005)(4744005)(83380400001)(53546011)(5660300002)(6506007)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WVliN0NhQTE0UFR4Z05RM2wvUG84eFBjakg1RldMNnZ2U0d5dk1tVUtGV051?=
 =?utf-8?B?WnhyemIrbnlHbGNsblU3RDA2K0llQUJ4VStzdGw0K29xZldFR25WSHVOQmgr?=
 =?utf-8?B?eXpubHYvNHhHeHZDYWJGNVlFcDJMTjZnaWZUcFRmcUp2Qi9Ibyt4U0hIQ2ZH?=
 =?utf-8?B?aCtOa2FsdVpQOUU4d2lEZ2FJUFZrZ3hMSmJJRDJTRDNyMXYzaFBib2hXNTg4?=
 =?utf-8?B?bEV0aThwcEpnNjMvZU1ObU9OMmhGbkVZQ1l4NGxWTDJBNU5Pa3VBSGlkYk1v?=
 =?utf-8?B?UXA2SzZheDMrcThkVm93WGdqcDZweGliSHpqUUxHbTViOXdnbDEyVEhlMFB2?=
 =?utf-8?B?YkhEd2JMR01XRnNGaUpIVGZEWTNzZlo5R25JMFZvOVkzM09WSGdsN0w5VjNB?=
 =?utf-8?B?SUFpd3d1Rk1UM3QxWEE2OVFGM2ZoU1Z4czliekU4Z016Y3FUVjdiV1FUaFRY?=
 =?utf-8?B?dnVuVnlwQnpnS1NKbmowcWVIb3lFd2JFcXhEOEttVHF3UTVLMWJaa0NzNC9j?=
 =?utf-8?B?bnE1UFB0VVp1RVNra3R1TkVXenZaQUUxZGZSWmt3U0gzaGpEYjB4ZWZrWENP?=
 =?utf-8?B?alFLQlcwcmJjTEJqb25HMEI2dmJHa2FTdXl1dk5FWnRuVHNaa3BnMVhPMENz?=
 =?utf-8?B?UEI3SzAvOUlYNnpmcCtJYTBhUTFoTS84ZjUxN3U1WXRuTGVnclNrSExrQVV1?=
 =?utf-8?B?S1o0bHlvMmx2U2thMWVwMGR3aWFsdWtWY29xK2F6WmRPSFVyNUx4emozSXk0?=
 =?utf-8?B?RVdIZ3FsdUtuK3lMcDAyMUhRSXlIejJMOEpuTk5UQWlpOXRqVUJJVVIrRHRa?=
 =?utf-8?B?bWQ3T2hoNldKYWJJbDF2REs3VVFYMmRRY1dvZUFRV1FWcTJYamZQMThjWmJN?=
 =?utf-8?B?c1cvNFlsTTdNeFQvVTZ5T3JLTDBOdkxSVjliNTVaVkNvNGRFQ3ZMSUNwR3Z4?=
 =?utf-8?B?OWhzemVCUXN0VzFUUXd4SjMyMXpkd2lLczFaZ2VhaU16SVA4SzFQVThJUkRp?=
 =?utf-8?B?L0JjQTZlQXdETmYzZzJwdnRrRkJ5Y00yM0NieHpHZ3haZkZVMjFPbEkyYUpL?=
 =?utf-8?B?Z3dUMlBubUk5M1BaSjFzcTR5ZXhvbWJSZkNybTkzenJKWGxHUTFBRUxJcExv?=
 =?utf-8?B?WnhlS0k2dTNacDFXM1BxblNIV1JzK2hJN2kyLy85OEE2ejdRRURRNXJzU0tY?=
 =?utf-8?B?N1JOM21UZDA0ckxqZ3U4RVlaTlZzakR5dWk2S1FueHRTaDVYYnE0UVNuYXZF?=
 =?utf-8?B?OThnRFZiam1XOU0vbjlNb09ubzZGb0Q5YnQvZFVqVm5ZcFBFRS9md0xxQllX?=
 =?utf-8?Q?/Q/ZdWT5rLTMc=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <F02BBDC9A854C147AD8196C24F4DC8AD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1002a76-7ca8-4b37-fd50-08d897995460
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 14:40:07.3093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QtOiZYc2lSQ9+fDtophGDxyFA0PHD28JGmvU843ED7HBFvgpwL63AHCQiwt4ig58SNtlhp9a59BrVLXf+G/BQYlgCELKAI8YdgwmaS+hXFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_094012_436413_C53150F5 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: richard@nod.at, boris.brezillon@collabora.com, vigneshr@ti.com,
 stable@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/3/20 1:00 AM, Michael Walle wrote:
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -18,7 +18,8 @@ static const struct flash_info sst_parts[] = {
>                               SECT_4K | SST_WRITE) },
>         { "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
>                               SECT_4K | SST_WRITE) },
> -       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K) },
> +       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
> +                             SECT_4K | SPI_NOR_4BIT_BP) },

And I would put 1/7 after 4/7, so that I can set the locking flags
in some order: SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP. We first indicate
that the flash supports locking, and then what kind of locking, BP3,
and not the other way around.

anyway, just cosmetics

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
