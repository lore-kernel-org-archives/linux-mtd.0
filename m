Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E55FC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 09:40:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD24864E81
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 09:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD24864E81
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p34S7sAibmBSOxcmFShU28Pov+COHOLW26TimPiFT9U=; b=cFEbYV1BWca2GYhs2nezMZZy2
	WvBI/FpUgiM0K1pxVWuQXf32Ys98rKGxbwxrjL9nKwOADYsuswFlu8CMhzzwO1pneF1ttLwMntmTa
	HivsD7U92It06TBRr95xy80FxndVFW5mEmXZDJXUpOyjzo/mnOZoYOfvZG4NTEnSKgdCmztrRjwga
	UgekHus3lKQTp94iYj9OdL9pt9NpPmwxp5F1LnP2y8SVg8aQdzxUKF2s56QzLz1kT3zIn57u8TWnD
	35G2ErbjDbZ6i6CfE8oRUSNxv0Bm0v0j/9YPkJgUmqY30W5w+h3ViPSfjzp9wZDtI630OAjL5oZPA
	/IyqT9yqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLjhd-00FPOJ-F8; Mon, 15 Mar 2021 09:39:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLjhU-00FPMb-0e
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 09:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615801187; x=1647337187;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GE36DExKKMhlewQpTSnl65Zu6S2zKTgj6G93udIuLDE=;
 b=HaU1uysYbBcm4uD7GNJHrLmdaJTcOY+Vv36V3/olPcYhcLwPrpDeuwS/
 8WSlOqPLfztj1Rczd87HOwvvc1zkRzD1R9Jig6XlzzjFwhVHtZDOiRMRH
 xx1ZR2dkTjNY5QyrwrH0We3KWkl1VB5Q+a0kacoBrAkhnzS2dmIozIQS9
 i2qA3uBdLH42wiKORriJ2NFBLLwlslu2/ziBLca2WEYEnYJUgL6GxECUZ
 dBqvtNe0uTCytzmoNxjxrolO7LxFi8QBaUA4AJdgeqbrn71MXrFmbXNt5
 LMrEWin63T2qu99zYdh9k6yU8/uFfKqRwjymXiodgBTLhxAalmVMjDKme A==;
IronPort-SDR: K1skDkiGAyCysOQXPJ3S9mrXJVnKZOn7oq2lp+OFbQYqNLsURiaNEjnsq4gVseGvDxxdZrh7M1
 LdBKJmlNKksWzY6tzkKM0/KRvVumc3QCzDjwiE0HU6paYHbo4Nm7Da1jQVz2If0XF31IfG7gW2
 hqFApxaBhDDMeQIzBIQ4SeHNxIut5JHpXQHFXHn1FgPIPQDaT7f9V09NYUnz4LaFdZ0ZT/ylgV
 6mAMYy+3TbfzeE+y1JnisAq79emw9a2u7QGoRpEUiXrgp1fKTI5e/Rx2t2B+YAJvVioj7cDil0
 UrM=
X-IronPort-AV: E=Sophos;i="5.81,249,1610434800"; d="scan'208";a="107202583"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Mar 2021 02:39:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 15 Mar 2021 02:39:45 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 15 Mar 2021 02:39:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwWlmPtMVX/QbhUwwfF/3KJ2wWuenFiuxAAtmsJ6yyxa34fzRgSZggc4q2bFFcsTIKTe2rpp7f52xQN76m9QTOKD3BrKr86tatRsV52WyDBaCZ4CktouEoqUq/pGwtrlNH9VQ59FC55u71M7wmLGa+LrasFtdWVvRHWgNaOiMB8hBAN/Axhd1J3RF7CdpRZehsQG7J8UecrObcL5LE0La0+/f6n6xm3aHDbaqOYGzJg9Y/tHsS6r4aGTfXDYQew/GQC8TsiAgydonc9AzrUHXb2JRNqaJDQYs9sH5uKvEN3LMTRE9vyc4Osh013VaHAP8gvBeo9Q3vnOyEwOY3bgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GE36DExKKMhlewQpTSnl65Zu6S2zKTgj6G93udIuLDE=;
 b=dmSeB9spijqOJeBDGWUUsLV6ZtmHKKcRq5nAd7qDoD5XbgQMY1PdNbH0Wo0DPdDw9cRanl0LA47IIay3BJ058AjGdWxfaVcJ4HU+UvKmDOEpMzM5w/0LoB72OW95eh3LPTsb0vGqR6Oq7uwXT6GKahYpPlORhSemrMTm+58n0rigaFguEtU6pM8ai6PI+GBOTaNyvVJNmrQi7VPRjjmXeYj6gbzRUvKGnCGyS/sxEVDz/KqRknZJN8A1RkV9QGuBqHdvlOUClyl0GjUG0+JTi11J7XdVCU4d8R2J95JO7A6mtvIJuNKt+1SDcEnS5aZ2K+M9pdRSDQpfzpdu6bHG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GE36DExKKMhlewQpTSnl65Zu6S2zKTgj6G93udIuLDE=;
 b=HksPb7GiVhZ3ta5SNjYG4z7SdAVUYGtZeDDr592BAlxAg696rkUkQE7YmofR1hY5eO2MWlHYcgGuWm724sXiOFO1P2x0sbssD7aCLA+JyIGTTJ5F+FNIqirvch3SQr/j3kWcBlIcP5rILNiz4EoPVYdhuFYzzXoAA/Tv68EAe/4=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2958.namprd11.prod.outlook.com (2603:10b6:805:da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 09:39:43 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 09:39:43 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add OTP support
Thread-Topic: [PATCH v4 1/4] mtd: spi-nor: add OTP support
Thread-Index: AQHXGWzVX5jrWvQlhkiOlI7agfm/7w==
Date: Mon, 15 Mar 2021 09:39:43 +0000
Message-ID: <8b35d8f6-6ff8-9bf3-02bd-434cf46acccb@microchip.com>
References: <20210306000535.9890-1-michael@walle.cc>
 <20210306000535.9890-2-michael@walle.cc>
 <7dd4bfb0-bb38-20c8-68e1-ece836c847fa@microchip.com>
 <b83dbbcdee6bdeee0d494ba79fd792e4@walle.cc>
In-Reply-To: <b83dbbcdee6bdeee0d494ba79fd792e4@walle.cc>
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
x-ms-office365-filtering-correlation-id: 6ada4d8e-a076-43c2-acee-08d8e796437a
x-ms-traffictypediagnostic: SN6PR11MB2958:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB295859F7CBB89D8EB00F9CAEF06C9@SN6PR11MB2958.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: panlSSRoVIlZp8OblbhmzT0wv3mWjLckWobS/ZLPXrQX1Ic23lopYKhXdQHGWu+WNT23PtR3+S09ij7ALKvviynk+MdH9T4TXrinjyPoiHycYpuuuVYxszEWsOQbiFqKG5j8useLw0Eo714G1tUFVub52obhXjWRdHxW+wn7rlBKO8ANWLNEDytyeMe8ifH2zwyPSYNhNLafCnZcSDC/p0mPMTiVufFFPWt7s2yM1GGg3oZ7UvPg5EZOPk91Q2NdCvOIou1pCk5XJM/TAwJvLUAQYWxzJI8hW6Luavg7WHcNcB6dI8aZ8jkry4R4cxzseUjJxps6+wuGtbbQ8GZZTAh0XISBAwEQ6OS8EbvsfnXIppSqF4H/dPVXPb3dho3KQZZ5GaZIxyKI1+gXEm/cuIkpCB23NNkqGt1rgLoiBLLWWuJnud+8dl/b2idvpskrlmm2ImAMkvgxRI7lzDfnxgDDBI9fH5XyU8LRfiMDl8KUi+AV1DArfFiWn2Kn2YoM67Tr/rWrt28qAfY70Xa3PzeGBvlL6V8Xqnxc1uAx5X4VrAMgFlFeAzLk1k/18WTJurIufUfaICzZARLi6DWtIzo9mY7lAllJYqnaaKE6COrYuQoC7B18ePQ9GxGMP5FPfx2CNUfMJqJOiW7K9CEGTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(396003)(376002)(346002)(366004)(31696002)(54906003)(86362001)(5660300002)(64756008)(6512007)(2906002)(71200400001)(31686004)(186003)(478600001)(110136005)(66556008)(26005)(4326008)(6486002)(8936002)(66446008)(2616005)(36756003)(6506007)(66946007)(76116006)(53546011)(8676002)(316002)(66476007)(91956017)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Rk43SU5IWk00MGVNblQ2cVpuR2FoNXVHMFVDM3ZsODZtVUI0dk5yS0xPZVk4?=
 =?utf-8?B?TmUwbENrWVBkL3ovUGduVkorWUNVeWdjbTdFUEhZWlZNN3FrRDJTZkNhRnFu?=
 =?utf-8?B?RU9jNGlLeFdvdURKK2ZTT3g2OGwxWDlxUXhPVTUyTmRkN2RQa0tpbHRkM0Za?=
 =?utf-8?B?U0RvNDBvMGQ3aDY3MGxRcUN6OUxZOE45VzM3M3hEQUl5eEUyWVhleHhFRUZS?=
 =?utf-8?B?Mkh6TU9DUDdjdUhTZ2prNU5idy8xakEvMG1DSVUrNHpjTDBZcGJMZ21JakZE?=
 =?utf-8?B?MEJ1TnFsbmd1bllHVWc2bTNTUUw2Vy85V2ZFMDlLTDJQTnRFZ1JYZjRoWVZN?=
 =?utf-8?B?L1ZUTmJGUUE4MVlDbkZaTFZzWDFYZ1NTa3BIdEFNQk1FTmNkc1V5Z0pIN0VD?=
 =?utf-8?B?bnhwUmo2eVo5akQ1VDE4U2xTWUdrTXdtM2VXRDBndkRTVlBjaCs0N1czcyt3?=
 =?utf-8?B?WGNvNGErekNqaHJmOVVtWXI4VXB5VW9EbXE2NG0zRkxBbnl5Sm9BZHBabTJI?=
 =?utf-8?B?SlU1UEZHYS82Q0lWU2RoWEFwUE9wSXpYR3NydHFiWk5YdUVIR3NGeG1nQnM2?=
 =?utf-8?B?c3RzV2Evb1c5alBPN3U4OGgxTVIyMHFpQzdEa0xoZjIzZzhST1dMYXBpU1l5?=
 =?utf-8?B?OTJQRnFnZVU3dmJQbnBLMzVBaTZNcWJyTE0zRzRSbFJjS08wUGh5TWJnbVNv?=
 =?utf-8?B?cXlUc1JsMFM5SldZakNwME9SemozOVcwVmtOODU2UWFSN2RadGtSTU1tVjVV?=
 =?utf-8?B?R1JweXFOMnI1aU50Y2JLYlg4R3pleUhXcDRMODUxNGhuT2pCbGxBRUhqUnI1?=
 =?utf-8?B?YmlzcnZLRnNzc2MxR3UvYmFFeGJjdzA5MVJRR1BoaEc1UytwQVI5OU5sdDZk?=
 =?utf-8?B?Wk8zaW1wWmQ2bmZJL0djZndyTFFnWXFSRVBTaC8xaWdMamY2V0dIai9qclls?=
 =?utf-8?B?dDdKdmEveWVnUUlYWkNlRFlsckVvcVNYeEdiYzlkQk9TdUZoSFRERTJSOTJR?=
 =?utf-8?B?ZWErdWdGRmxSUjdVd0dtZHJPdXlnQ0JKMFdnVlBreStaZ2E5SGJPWFhwY2Zo?=
 =?utf-8?B?SlFhc1FJRzNHVE1GQjFoQXVVemlzTGxhcmtHL2JHbkRJbmFSRVo3RzZxdmlQ?=
 =?utf-8?B?TXp0S3ZKOXc1Qmx1eFlhY2thdVZRODQ3THQ2ajZEcXQzaC91RUlBMTF3VVRs?=
 =?utf-8?B?MkI1M0N4Q3kxT1NwQ1hkT29qNlF5WEMxRFM2cFBoa2plZ1pxMUNJcUloVDZq?=
 =?utf-8?B?ZUtzdExiTk1XOVJFN1BtcFdiLzRsU0U3U1VRMVZPdmNmNUlJeGR3OEZZcVIx?=
 =?utf-8?B?YVNMb3VseTJEUXRaaHRGTWd1SGdmWWVpa1pOUW1SNjRIY0h0b1REd1EweDU5?=
 =?utf-8?B?NWl6dGJ0NjlQSWhpdjR6TFJSd1A0b0ZEVmsxYjZmRSt5TThpT0doK2UvZ3dO?=
 =?utf-8?B?ckRLdjlQSFJ4clNaekdLaHcrbFYxUmdLalI1Ni9VcE5uNUNhbTR4MTRUcHZl?=
 =?utf-8?B?UmtaaEVIVU5LRHdwK0x5SjlnQ3hsY2JlY0pZczNiNkZ6c0pNNWFXdmpVMnp2?=
 =?utf-8?B?OTVYRTNuZFlZWVI5bXNkRldDbWs2cDNrekRyRUQ2Z3lxMVhIblZkck85YnFo?=
 =?utf-8?B?Qkg3QUFkSmk0eFdlaHhtTE51cmRTakhMdW1USjl6MmM3aFRORk1pQW5qUkU1?=
 =?utf-8?B?WDEwcUhOaTlCOFgraU1SVDYxNU9ORzQ1Q2k2WTZVTjRpd2dBc0dnelVUQ0J5?=
 =?utf-8?Q?r0UgZik4v+52whzgfI=3D?=
Content-ID: <BC22533BE6FED243BF1299705FFDEBAA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ada4d8e-a076-43c2-acee-08d8e796437a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 09:39:43.4794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: moCZkgPCilfLhmDMF4o7+H2lt2ea2V/Hicen9k4QzHQ/wnoB23ed9y8EO2y9RulM+vQXOdW4gRYd/NFRRjGBCzKE9vlqemUT4X2poSvAEoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_093948_937496_01288282 
X-CRM114-Status: GOOD (  14.62  )
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

On 3/15/21 11:23 AM, Michael Walle wrote:

cut

>>> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
>>> new file mode 100644
>>> index 000000000000..4e301fd5156b
>>> --- /dev/null
>>> +++ b/drivers/mtd/spi-nor/otp.c
>>> @@ -0,0 +1,218 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * OTP support for SPI NOR flashes
>>> + *
>>> + * Copyright (C) 2021 Michael Walle <michael@walle.cc>> + */
>>> +
>>> +#include <linux/log2.h>
>>> +#include <linux/mtd/mtd.h>
>>> +#include <linux/mtd/spi-nor.h>
>>> +
>>> +#include "core.h"
>>> +
>>> +#define spi_nor_otp_ops(nor) ((nor)->params->otp.ops)
>>> +#define spi_nor_otp_region_len(nor) ((nor)->params->otp.org->len)
>>> +#define spi_nor_otp_n_regions(nor)
>>> ((nor)->params->otp.org->n_regions)
>>
>> I don't like these wrappers because they gratuiously hide what's really
>> there.
>> I find the code more easier to read without these wrappers, because I
>> don't
>> have to memorize what these wrappers are doing, and I better see how
>> the code
>> is organized.
> 
> TBH I find it easier on the eye and I've never seen so much dereferences
> as in mtd/spi-nor.

It's what I prefer, but it's not a hard requirement. Would you please check
for a second opinion with Vignesh? Inquire about the helpers too. Then do as
you find best.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
