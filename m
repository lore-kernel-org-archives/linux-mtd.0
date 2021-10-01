Return-Path: <SRS0=UGcd=OV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A7DC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 11:44:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 318B561A82
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Oct 2021 11:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 318B561A82
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etdP81smeDVTCQ/0BzNtRPcEvpyfAqOHmy+QTmwKF0M=; b=l3lXIfSy64N1tS
	mrt41Di3E/VI/lGf8S7oudhDoBIkoIjFQTwzDsxbuGLSInZwN13yE6rGAfQNn89zmWDVOqBKIOzLg
	WfAold9faKMu4oksZuvYVJNnnSPEfM6cgvFo0kiqAjSQ9IoqFG+S4OhcRrjHxvEZqc0f6g8B2ZHtq
	pR6eVaN2I9YGRUmSYofusPT55MIz+r7xil5eXB+kOb6ppOhoU5wZh0lR002YrLL5c4rHFRDL63OdH
	nQBIfBragZLy/DcsBfC6zHovA0e6zojr9pX6z9+m059sTO+cNC2DeMpjt/sVUhhmvya9uFI/lGM7Q
	jA7KWa61Ak7jZfb7IVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWGwv-0000hY-3b; Fri, 01 Oct 2021 11:43:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWGwr-0000gB-QR; Fri, 01 Oct 2021 11:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633088610; x=1664624610;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2GBaHM/KXV+MlNZu0/kZbAO6iFKzGXFbzmSWl5yI9Io=;
 b=FCRWBZxXTwoSGGJqiWptaK7+AXF6xrLfggVFKnD10FiVQ9D2OXPOKrwd
 4czDGO51zrLQaYOy9/G8tAOMPxMAtTXhFhZ/Guh6dzKXPQzra6Y/7sgRd
 vambGUbqf/OOgCKyBJ0G1wFxx0xUo2b4sK+ou+Iu2g8iIndg88vIMpTab
 pahLxMDesbPvQiLixKeOZCYU6210iErsQzlEV3I3ev+/EPQrWX1K7PKQ5
 h9lHpuVFPnXti5W3iPI6I2RoYYRech62iYr3NuUd5+j4yRv7Zn8hE6s5z
 VboPQtI1RymhSRqVEcRPeqxO4F+QD5LQHHf506JljPna/R4brYzWRqCgU g==;
IronPort-SDR: iylsqzlCcgNp462blsGy6SR0PFXANOESn8vlvDToH6zmX87oJd8eiMMKNMlc8wUKaxpKhz9st9
 fv5ECv/6a/QsFokwX4OU1rzElD7Cp3FQqRWIehEeVoyzz2zoyuT8qUZeIdvRqwUyqmM0UAJ/fj
 5gncRwkp0mZ4ILI52DZsNCaOf4q/TWtlRDIjQZ7GtgxT4idTcYyvk7Qsf5yImSVmP5Hc0zO23G
 y+DHTEIbvI99sS0woozjLwwD2ehPbw5CVmqxA62o48ERPrFD81g3SKoY83ZpNrzoCENt8uWaRZ
 SQS5EoNcLdYns3MKFwvfsMJ1
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="138701102"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2021 04:43:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Oct 2021 04:43:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Fri, 1 Oct 2021 04:43:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITDadh9JSZ6tGj4HjGJdK7TtAp+7W05yZ2a50GSyyHnJv528aQehFShgEqJdzOnmAvuKhgS63bDdJORnmciyy8K+ZEU/7GQ2xfkLr7UO6e7ujp0YQRR1TbQ7uPaOm+hR+bEErDFJXucK2cyUNNCZ4kHtQn7UAq6wfbX3W9nA3N9koIHiUzClETxDcJM5CRA/F8HLTnSBHbpwUdphM80JqcsTLF5LVurmJtY/T6YgkHCBP0Lx2wQgjWUCVhiO8seb17wluO6OSeHWj19ooTnQ7ZwW4jlSPaKKLwKILj6q5kYvz0lIqGuYvWgXMpUOcI4O9Dq28Udbz0L845P5cDhv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GBaHM/KXV+MlNZu0/kZbAO6iFKzGXFbzmSWl5yI9Io=;
 b=U+Rn/1oRsxoXuBQnpagprXpYHzcd6BgYgfgEZwqKKY94gj2TErfAmyDD1Moo27awvi9Vjgvqcdg6RjT0MaivoKJZobltgpweuq/9w3DfxpJVtlSMT6zL07mcZBcxC6WALfzct6Z3R8T8NE9cDg6EHSkj70SE0g2GlOIm2IcZV/gWW7E65f+NHNei+n2sMYoCddjUgV77tt4hejGvs+UXUPga+bQz8QeVw06dz+2hyHIa9vJsRC5yjU8ejym3Ld6OQtrhaGfOrrVnHny9SnF5fxF9gSkqVTRy3z/NaoasJIg1ZQ2sw0XP0BwdRMrRFahDx3uYoeSPcDEyc0cQW20irg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GBaHM/KXV+MlNZu0/kZbAO6iFKzGXFbzmSWl5yI9Io=;
 b=N4z8AqjOMuHTVqkfOLHRG9EwDdd1MSpbe7HKBHZU5xEGTQ5hPbEUD76Nu1/U5aAY9QS2EjfXB0Xz3aupj8tu/ewyPhyM+axXSRFLvuRBUtC6Qn9y1EuA6upAWsPwdEjQ57sJcmKwK5RzZ+AQH3YxkXUW8j0ZBk+LZyJxYx8IoXE=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 1 Oct
 2021 11:43:16 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 11:43:16 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 10/35] mtd: spi-nor: sst: Use flash late_init() for
 locking
Thread-Topic: [PATCH v2 10/35] mtd: spi-nor: sst: Use flash late_init() for
 locking
Thread-Index: AQHXtrmGo8QdJ150YEWns5Haqq/rpA==
Date: Fri, 1 Oct 2021 11:43:16 +0000
Message-ID: <3bd6b85b-ddd9-327d-7236-cbc982f7e00c@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-11-tudor.ambarus@microchip.com>
 <20210816190928.kvzex5r6ml77uigs@ti.com>
In-Reply-To: <20210816190928.kvzex5r6ml77uigs@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: baa90747-29c9-4023-87b5-08d984d0a890
x-ms-traffictypediagnostic: SA2PR11MB4907:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB490745D5ED023943C2892E10F0AB9@SA2PR11MB4907.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GK/cEie6ip7s8kJGzhJ4mlOCmi/yULzDE9qZrLs35L9uDO/WkDAFXfJqQia0cE9uaX1yt8/l7kfj0BOv1T8otI8b6wnqz9cXb3MqlJAcScBRgF3zstffiWhKNEta0Rd5IUZMqmJFzzOkySMYwz/Eo1xCAZhTIQ186cevAWu4Xq+LXvUe/877LISIlmawinoHXJlWEdhrtvJMCTU81HSArMaUdUaMgU+ny9Ui6ypp7PCPi6Z+Wh3eRnw/t/H86clIecydPP9B+HfHYdvsW/S9Oao8yzg2maSjVE4WY17x2WLxEicJl6/5Y1++qHRAPpbqBeMxTrvJNVM6TRKT5cAb0aCL7K5Y5/PoefHb3uSohMKv0uvTP9MVHQsW8sM8SDa92kbje96m0cHcmYiC041QK7rVosMHIOMlbtGoF28uw7xMhFcMySgVKk+f76mwRNfCz6ZAMh4t67ZMe2eXI0oQ3tH5uIkEdMCBwNSl9zggcF+ObhXLnsGjdLjfBIr6avjK5I/KW5obL/g/2poKXR9Ov1a+mZZM9yLm1jE8EKTN5Z7ftqzT6Vrh/+hmG+VNXFxTggvwXHlCUWEdzJCgMmdPp1PalTOilOWt8nVRCpfPSOMKlHt+PvCnoczDC0nznKl9XkbKRQYYFcz98oRdoe6c747w1DFEY8MSUSG8wiUPq2i2yHg9K6BLAtlcu0do0INSbS5zjjj6R4SgqcMPdRs9ylHaBVOKoKzs+UZ7yYY8FE2agF0KxTHFjppfF0im82lLOIQUn8O21Hue7u6BNaspvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(83380400001)(6486002)(26005)(6916009)(36756003)(2906002)(4326008)(86362001)(53546011)(6506007)(5660300002)(66476007)(66556008)(107886003)(64756008)(54906003)(91956017)(8936002)(8676002)(76116006)(6512007)(71200400001)(31686004)(186003)(508600001)(2616005)(66446008)(66946007)(38070700005)(122000001)(38100700002)(316002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RllDaGZLeU5WT09FZGRiVUIxeEZiZmY1bmY5K3laWUc0MkVBS1dCQ2tCbkRR?=
 =?utf-8?B?SWR4VG1lNU81Y2UxRzJ2ZGhrZWQzaHF2UlZEV0owQlhWNTdOY0hGVHhOZVVR?=
 =?utf-8?B?UU9EUWNIVktWRVllRzN4Q0VNaURud29HVTBOd2JxczRHRzA4azJRN2F4Nksz?=
 =?utf-8?B?L2tZZ0kzRWRDREFHb2UrRDAzd3R5MVdOaDFJdGc4ZWxTdnNNWDNxeVlEV0NI?=
 =?utf-8?B?UkxxVVJXZkJWSHUyOE55UzltbG90aUVxK0M5dUtFUkE5S1VKMGtQVUtQY0lN?=
 =?utf-8?B?ZHd3NFhFM0IxL3VMdE13UmVhVmZidWxQTG9USHdKR3ZlT0ZNeTQzejJJNGVN?=
 =?utf-8?B?UktvdUxmQ2YraTZWNE9yODQyUUY3M0EzM3BPcW92QkRVSDhwZVQ4NWIreW9k?=
 =?utf-8?B?RW96eUJHdXRYY1FyaVp5ZFBnakR5b2NDaVhHc2RVdkNiM2JYd203Y0hwQjZS?=
 =?utf-8?B?REV3NHZoMmZJYW85ZFRwMjJMdyswOEY0TXRiczZaOVpWb1RsRkxpZ1VxekNF?=
 =?utf-8?B?b21jRUx3MzI0YVdLYklKYVBQb0YzVVV0L3dkbWNwa3J5S3BBU3R0ckxuai93?=
 =?utf-8?B?MUIrakRHcEZkZXBIc1dZeVUwUSszZnhIRGlaMFBwZGNza3ZLZzhWdVl2Y0Ji?=
 =?utf-8?B?YkZ6a3NVekJiKy9FVnZzNXQ1QmN3MysrS3pka2tWSjVaR0M4L0h6VDVZMGhP?=
 =?utf-8?B?a2NlUmQwWjNJT0dyVkkrT3liVm1jNU9ZQ2hQYW1qZlBDMm1rYTROUi9MamJX?=
 =?utf-8?B?bHFKQ2F2bXVRc3FaQlJhVVVKQlhmakFJdks0NlBEbkdZRGkwa2VTRzJDVHA5?=
 =?utf-8?B?TnlGdGtDeUkyNkdZNjkyT0lBTzdtMWg3Vkh3MklTZzFubUlMcFRRY2xnZHNC?=
 =?utf-8?B?cllkajR0ZUpOR1JseHFoMU5BanJjSk11cFl6MnB5bExwMnMrRFRwSk1GUWZh?=
 =?utf-8?B?R01QQ1BZVXpsNGdtNHFMZU04Z1ZubWdLME9HaGt0SGZsOFFxTE8vM0xjeHVO?=
 =?utf-8?B?VXd0YkFlUm9UN1BNZmtacThmZEFXcXNlZDVMTm5iK3Vmcy8xb1orOHBvOUFx?=
 =?utf-8?B?ZW1UbXRZWGNiVk52enRIVjgxa2UzN2JWUWh0clVIL3BOM3dGRjdmME1WNkZJ?=
 =?utf-8?B?cHEvRUlhM2tIRGY0M0tEekxzTXdGUy9MOEs1V2JOdXM1OHhOU1ExeFlLWStH?=
 =?utf-8?B?R2dxNlBWSFpwNU5zT1MrOGR5bEN6dVhkQmpMYk1ueHZEZ3gySEQwYlk4WFJO?=
 =?utf-8?B?bG1oYlRXSGc2a29BMFhJRWpnZjZubmtUMncxczM3TzVPN2QxWjd4Rk5NVHcw?=
 =?utf-8?B?bmhsbjVKdDlRaG9zWENqMFVLVHQ2TmdrNmJ4K1Q3aVBhODhzSWJ5MWRDeWlD?=
 =?utf-8?B?QnVxL2w3K3N1aFluTFdpVjJXd21haEJhOFpGUEtIY3pRMDhCcnJwc1NHWXZG?=
 =?utf-8?B?bVFzTnRiWUNyVUlrNi9hM1lCTnNaMmlFbmpkSXVJbzA3MDZIU3NjbDNMZDNO?=
 =?utf-8?B?WGN1TUxJaDJjQUJqVFVwa0ZzeTMvMGpQOTYzYzd1clprclExdDZWb3BJMHU0?=
 =?utf-8?B?ajhXNmR0QXBFZG54MFRkREhVWUxMVkp1aWdNbDY0TzJOTFRTWFRpK0pIMWNa?=
 =?utf-8?B?N3JpRzYyUkwva0NSVThTZ2xUYWZMTmNiSlVKbkJhYTZET0pMSDl0eGxLaFl2?=
 =?utf-8?B?V0lFNjUzbEh3R0RTY2haRytVclZoSklyRUZBblhnVzgrOXJKK0dSbnVoenpI?=
 =?utf-8?Q?hcw1grdg5YSQ6YHuCQ=3D?=
Content-ID: <C019DB99719AB94DA673740051A1E913@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa90747-29c9-4023-87b5-08d984d0a890
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 11:43:16.5156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V2D5/+wgOyAw13+CovunbUYAcl9AM0h2zgAbBLL3tZSZr6l0U+Eq233+Xiegzt0of6QbiLnU7EV1Xvb0v2Idfg3iKWMOos009Y5oj/iJ6K0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_044329_918142_59B0177B 
X-CRM114-Status: GOOD (  23.01  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 8/16/21 10:09 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/07/21 07:51AM, Tudor Ambarus wrote:
>> Locking ops are not discoverable via SFDP, use late_init() call.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> 
> One question though. Have you tested these flashes (this one and the
> ones in the previous patch) to make sure you are not causing any
> regressions? While I don't see anything wrong with the patches, it would
> be good to have some test reports.

sst26vf064b was tested, I thought I specified it in the cover letter.
I haven't tested locking, but will do. It's not a tragedy if we slip few
bugs anyway, we're here to squash them.
> 
>> ---
>>  drivers/mtd/spi-nor/sst.c | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
>> index 980f4c09c91d..29d100febdbf 100644
>> --- a/drivers/mtd/spi-nor/sst.c
>> +++ b/drivers/mtd/spi-nor/sst.c
>> @@ -46,15 +46,11 @@ static const struct spi_nor_locking_ops sst26vf_locking_ops = {
>>       .is_locked = sst26vf_is_locked,
>>  };
>>
>> -static void sst26vf_default_init(struct spi_nor *nor)
>> +static void sst26vf_late_init(struct spi_nor *nor)
>>  {
>>       nor->params->locking_ops = &sst26vf_locking_ops;
>>  }
>>
>> -static const struct spi_nor_fixups sst26vf_fixups = {
>> -     .default_init = sst26vf_default_init,
>> -};
>> -
>>  static const struct flash_info sst_parts[] = {
>>       /* SST -- large erase sizes are "overlays", "sectors" are 4K */
>>       { "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8,
>> @@ -88,7 +84,7 @@ static const struct flash_info sst_parts[] = {
>>       { "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
>>                             SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>                             SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> -             .fixups = &sst26vf_fixups },
>> +             .late_init = sst26vf_late_init},
>>  };
>>
>>  static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
>> --
>> 2.25.1
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
