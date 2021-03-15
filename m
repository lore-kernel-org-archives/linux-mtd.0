Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF201C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 09:47:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 201E664DE3
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 09:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 201E664DE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BmD3442dgx4bt79V5xkCNVzneR9baDkJXly5zUPzDHM=; b=c9MtG1fC4Re6F5CTo+19/KYdJ
	drSHKiyq+T0+Kch8NioKr4COJr1QCArDO4Ywmj8PhFbp7mvQiF5ZDINa+Sj182cBFVJlN4sQrthfD
	+GOwQB0OYGzKgOdkQn46d6/m529RSiW7pWZ80McjpluDEIDWOnvUUUQ44ZNLz2jYQHDYMmEEjzcCo
	LJqLm/RC3qO09zOSZCAqL2JfJTL2l4g2sGswLF/UPscnFHl3oD0Rply3qO5AThUCU0C2yjSOX8n3h
	HYI1AOHgnC1LRi/fXp3/ItuTlUdnEPzNUV0gcoPSwt7zMgF8RCSgc0RTRn+uSOX00H9GOkd9GbvqB
	JUxjOGO8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLjnv-00FQOV-DB; Mon, 15 Mar 2021 09:46:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLjmc-00FQ4W-PN
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 09:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615801507; x=1647337507;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZWfN9HdC0BTnVott6ZF9Z4Iw2Il1GXINomTpt6LgJcA=;
 b=2P3San1sqY+3WzMhPjqloKn0I3Ms02l/TROpiZ1f7Gk03Wp30UE0HRyw
 z1X5mBm6LxBPYfFUMvaPf173tWdRD25EhN4tS5UUHEkh7xqseMCfUWP0A
 Eap9tVCP+N8viEKqHgIgU3oV4Bomsazm5eW3ZvIsr0icM5nt0F8al/lNS
 PkhjyDFNEhuRRN6p0zLj1PZ50zdJMnhic4figblT7LY1NW+Wxa35KJpNz
 YpoospP8cjp3DusKrtGKeyOP4p99psbusAzE5p8mg/QPZPzk6YslOf8Le
 ERLzD8b8HzSvWoc3IjBOmGUshP2NWVZNuVYBqIuuYdSGRg2VFNsR8vOXS g==;
IronPort-SDR: +Ukw6CLirYZOIId10jXRkeYDhvvqdgKAXSlj4aoF6HL9oY9Wkvx/tRDkREFW7Q4SCnLzwxdBHS
 sZsgMz/M8/gHpMN1yLGgcTyBFLNH0KbE1ezuoAT1282nK/612qEr8YgxCYZ1wEBgxdcLzUzEP6
 wASJNyLf29tsdyvV3E2twCD4SA+6CU1V+fCd6D4jaY/m+WYBc2DmLgusNR8xFw9dEe7Pa6q/Nd
 l9gZwJcc3DRJUlnf/AdIsPZ9TIA5RKHgInhW1mQgEFVN/XOUOJyyJjUf6fAeLGPawnCZvEU+Ix
 qB0=
X-IronPort-AV: E=Sophos;i="5.81,249,1610434800"; d="scan'208";a="109995851"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Mar 2021 02:45:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 15 Mar 2021 02:45:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 15 Mar 2021 02:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9TemTcoo+bwxgccxYTS42agyM7KpEbaGTsbRoQoOXOqze1gomMwnWgughqKZ6bDSGRDN5O3AGcG6jrviEK26kvYozwkxeT+ULxkoiaS4gxOfPYtZlkKeo3u6nfe/p2KLOslKdneaMruZKgyM7LvY+OZnMgTwuvEY85rZDDPntKy5SFCKWjDOeLnzkQXfHCR9FOFH+taeExZ4gHIAWrDCwzrY22wUcAiUwTE2/wzuLttBFiHpP+hUOnU66Ie0mBB9HD48bSARVX0c9b/ybUB54eG8a7YQkQ1RiXReq5zg/353F6Xb88ilIu4yie2X6taGfNWocvZovC+aZnpK2w+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWfN9HdC0BTnVott6ZF9Z4Iw2Il1GXINomTpt6LgJcA=;
 b=R89FqunBLTOgkn4LkZxU+yVW0yESStvhhU9uW6wLCUtImBMhQNbAozpdGpAZQAPHz2aJIrCIDUKiFJ5VOpeYbszde3pUD0Cctnic6iB2lXLMiyCDN7jbF4o/ZPF07hrVPjkhv4MdrbhMr51oS5VQ4LpbQXEn0EZmH31qIzNFSYJIZOwJ0PJPGFQhv3oTn9NifXZX2nfJ2URQ5Ma6wj0nC8gi+QVxMb/BEKMxaPZL4CwJ41pVGuD7YzKhnVEm/fMLTv6WWXIJaln/BrLhoMINaErBp3UClHgc4JIhHLmLfHXOpe/iToBhGZGl2LHk+GOPV/Uo1u79ihFtYbL0MT1bqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWfN9HdC0BTnVott6ZF9Z4Iw2Il1GXINomTpt6LgJcA=;
 b=Rz15BXwqdgly1xFMBfnD9rxpCbNtMjKxEFAf0N8zT+MsQsoCyzBgis7xDfs61ODORKsKSfb+KJrhE1tDUcenaPEgGUUi7i1oh+zwyGcs/WIogwlVmJBT0KuxeNCr6gOFE97rij1ywiTkJye2wOKNEYKdDcYGcMEOzw/mqh92Weg=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 09:45:00 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 09:44:59 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add OTP support
Thread-Topic: [PATCH v4 1/4] mtd: spi-nor: add OTP support
Thread-Index: AQHXGWzVX5jrWvQlhkiOlI7agfm/76qEzOCA
Date: Mon, 15 Mar 2021 09:44:59 +0000
Message-ID: <f0ffd9b3-94d1-05ca-7e90-5014bf7a3db4@microchip.com>
References: <20210306000535.9890-1-michael@walle.cc>
 <20210306000535.9890-2-michael@walle.cc>
 <7dd4bfb0-bb38-20c8-68e1-ece836c847fa@microchip.com>
 <b83dbbcdee6bdeee0d494ba79fd792e4@walle.cc>
 <8b35d8f6-6ff8-9bf3-02bd-434cf46acccb@microchip.com>
In-Reply-To: <8b35d8f6-6ff8-9bf3-02bd-434cf46acccb@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfae0b99-e089-4ed1-83d6-08d8e797000e
x-ms-traffictypediagnostic: SA2PR11MB5113:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB5113C11AECBCFEDA2BA5A769F06C9@SA2PR11MB5113.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s4H+MNvE7oxD3HET1orIEMT24Asv8IHPMqagWSoQOedyErfhSNS/yhHVlP75GoYZUDo21iShzvEsfVRNbl6U8grA67e66bV1inlKop4PSVcb/W1sEMpmpNqXyJvTUnCXvD8EQkNlblovdr9egEZxjy85KVN2HDrxQY3C/i3Sf7pxQCprdobsNJZTKeWtpzEqEz0upeLio5QkMRSWv7mNT7qK1BGZPVlOshTNU0TraiKJWpPj++kK1u0dOJnRR3tgeutAAcpfx5LisC6O5x+fyo55gnsb8WU7WCajHxX1GvYlfVU140CuMteyD+OV9Yyq0ChYY36tpGqHOyP7KBdqHzRZOePQcDw7TJFKtWInNbH+rbl1z0B7C7V4DTKsnmQXC/0OnvxQotPKeMp7JLYiYJfFBiJHE0N4d2kKqm7uh6f4hqQpWcX1GLoCIgsRDSUeEhGxd2pooDZeF2Z666yFkMU+jZHdt+Fj+uB4wP4zY5p+SIk5IVPwEswy88s+nFpuZ/jGtYdRMJbQVvWw+4uyokDrL7QZsCn9jUgpQPrj5Al0KJ2uyPg03Ez+cqkS2k+dRkhlHDYTcqE8DVy67fgWVfK/74wbh4rWz6GxZOXW2Fi7obx/ZWrYrr3j55bDjmM8rLye/h3a6rdSY1Jfj0xPJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(346002)(396003)(136003)(366004)(4326008)(53546011)(5660300002)(2616005)(26005)(71200400001)(64756008)(316002)(66446008)(478600001)(6512007)(2906002)(31696002)(66556008)(66476007)(86362001)(6506007)(8936002)(66946007)(54906003)(110136005)(6486002)(8676002)(186003)(31686004)(91956017)(76116006)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TWhsbFFqY1VUUjhUZUpqQ3lJZ29QZVd0YUtlS2VjazlUNDMrQWkxU0NJdWg2?=
 =?utf-8?B?WWpkSGZXUHZDTGRZRjFGQUFPbkhZM2IwcnJDb1FTUWFEY29zYXNBUjVuMUNS?=
 =?utf-8?B?L3EveEFuNnYvV2N0aVJMQWtUTjhiWWsxekZqWjI1a0hyTE5hM0V0NkovZEM2?=
 =?utf-8?B?WVphMUZWUzFNaVhhTFRMZlNEcTM1L0REZTFRcGRUZ0R0MWZoTEp5Y1pLb1VX?=
 =?utf-8?B?cXcwaE05cERZMlR4T0poSmQrZ29GS3A0MkpNd0NKcFVHZzIyT3h2dEwwYXRC?=
 =?utf-8?B?cTRDYW5Yc1QzUTVBN0VsV2hlU1pUTk52VXhhN2oxU2U3L1c3QzIrMnp3UlVS?=
 =?utf-8?B?MHd6RmJFTU9NcWxXWG9ydCt5WjJ1a0NKSzRRTkZEcENMdVg5TzAzVVFmdnR2?=
 =?utf-8?B?WnNCWXJHcm5ETTJ6SVViRjB5M0Fnb1BVYnVOZVF1ZEdMUmJJWlhkcWhlZi8x?=
 =?utf-8?B?MXdxaEVpcGlyYkl3dkJkcm9XSHRFUEdpL2ExT20vdzRtbEQ2ZDZ1YVE1M0RK?=
 =?utf-8?B?MDdHYUR6Qjd4ZUd6c3FiMkJGMU9jSEcrdFgwbS9LN3BKcnAwRmxZMkF2YTBZ?=
 =?utf-8?B?N2hmbjZmemFFWXp5RmVFdUNwYXRGcUF4T2NVQlZnczM4T1VyUVpQR0ErVGk1?=
 =?utf-8?B?bDc3Zjg1Q3p2WENRU29qZ0lBVXJRcGFEamdKTDRWL0hLdGhRcFdsMzd1V042?=
 =?utf-8?B?T2hOYjFhSEJHbzlpSXVhcXgyS3JjRW41cHdJOXZPSmhOVmNoM3pMQTJSeW1m?=
 =?utf-8?B?eEdqVWN2c2RPNXA5UlFmbUVUYlR4YVA0a0p4YlpiUmxIdGhiRWhWT053MXhj?=
 =?utf-8?B?QmpNcmFGK1dlbkJoWVFoVjdLWEowc2dKV3VsOWcvNWRBbzBERWg0R3N3UDUz?=
 =?utf-8?B?WDRDTjVybFZMOUVmaW51cFpvVVIvaXNEakh6TEpNUXBpeW1WNGJBSkRzOXpl?=
 =?utf-8?B?Q1FJZnlZN01BRjZKaGpzWmQ4QkprMEJEQU0zUnU1ZkdiM05lTUZ5SDlBRWps?=
 =?utf-8?B?ajEycm41MG5kQjRha3hIRFJUdHZnSUNDS1dLdTlCMitHSzZsZVlTQlpqeVJy?=
 =?utf-8?B?dEpubFpOMXY2bDZmdk9qQUlmT3dabDMxTEdaM3QvMU5UZlhobnU1TkdxMFAz?=
 =?utf-8?B?b1NRTWE1ZVkvNThEbmIwRU03WlNHUjRTeEpYL3YvdjhLVTZkZWhXYjRRa3pt?=
 =?utf-8?B?UmRleVh6YW9XeThYQWhzZkpyRDMzS1BTQ0NJeGRqSGZueXdFVkgrVStHYnNp?=
 =?utf-8?B?UG9hQmZIM045bjVoUWNYNGIvb0RmQXVBemhTMUN2ckVLK280d0I0S2VRNVRP?=
 =?utf-8?B?VmZDZGRMMVNObW5oY29XU1JxYmpTMlVpOXh6SCtkVS8zbGtFN21mR3JKNktH?=
 =?utf-8?B?a3pSK1I2bHkxUGpmTUFaZUdzeERQWUM4Q1lvbHZRKzM4REVXNnh3K1BDTnJ4?=
 =?utf-8?B?ZnoyRGxQbkxUUUlMVXRRa2tpSUc0eGsxZlhyelZaNlNuWVhxZklDaUZUTFQy?=
 =?utf-8?B?VlRUbS93NWFJT29DUGpwL0xTMmgzUTVSWDlVdTBreVlsVDQ1UkZMZURTaFZC?=
 =?utf-8?B?aUtudDBMWDh3Vzl6WTF6WHZaRldETk5yZmRxajRSOVBpL2RweGNpQUpSbzIv?=
 =?utf-8?B?ZVcvYkFlS2lTU1lrRS80d1dBN3BnS2d4Q1hqY0tKT0s0cEhNdHJhYzVDZGFM?=
 =?utf-8?B?cmRIbGhaQzc4Y21UQk1ybmlOSi82aDM0ZmE1Q1lydjdHWDdvNDZWVzBYVlVP?=
 =?utf-8?Q?xEGIQ5kaDNc99ly7/4=3D?=
Content-ID: <D8B3DB2620EDEE4CB4904C9690CE899C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfae0b99-e089-4ed1-83d6-08d8e797000e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 09:44:59.8540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRLJIlwHQCYSSxoHSHuZQ5pFJXEQQlhTT6IL2iyoXLbVu7UzkxNEhnqkTXSm75yD11eg1LXW+BYkp9lhaymbi0RDIb1e2a3qRKwQ5R1VEUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_094507_503229_F4D536E9 
X-CRM114-Status: GOOD (  15.27  )
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

On 3/15/21 11:39 AM, Tudor Ambarus - M18064 wrote:
> On 3/15/21 11:23 AM, Michael Walle wrote:
> 
> cut
> 
>>>> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
>>>> new file mode 100644
>>>> index 000000000000..4e301fd5156b
>>>> --- /dev/null
>>>> +++ b/drivers/mtd/spi-nor/otp.c
>>>> @@ -0,0 +1,218 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * OTP support for SPI NOR flashes
>>>> + *
>>>> + * Copyright (C) 2021 Michael Walle <michael@walle.cc>> + */
>>>> +
>>>> +#include <linux/log2.h>
>>>> +#include <linux/mtd/mtd.h>
>>>> +#include <linux/mtd/spi-nor.h>
>>>> +
>>>> +#include "core.h"
>>>> +
>>>> +#define spi_nor_otp_ops(nor) ((nor)->params->otp.ops)
>>>> +#define spi_nor_otp_region_len(nor) ((nor)->params->otp.org->len)
>>>> +#define spi_nor_otp_n_regions(nor)
>>>> ((nor)->params->otp.org->n_regions)
>>>
>>> I don't like these wrappers because they gratuiously hide what's really
>>> there.
>>> I find the code more easier to read without these wrappers, because I
>>> don't
>>> have to memorize what these wrappers are doing, and I better see how
>>> the code
>>> is organized.
>>
>> TBH I find it easier on the eye and I've never seen so much dereferences
>> as in mtd/spi-nor.

the dereferences will still be there, but will be just hidden by these wrappers,
don't they? Why would one prefer the wrappers?

> 
> It's what I prefer, but it's not a hard requirement. Would you please check
> for a second opinion with Vignesh? Inquire about the helpers too. Then do as
> you find best.
> 
> Cheers,
> ta
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
