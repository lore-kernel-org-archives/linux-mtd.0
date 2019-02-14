Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36835C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 09:33:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F156420818
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 09:33:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D+qLHvys";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="rEpqOpba"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F156420818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uywis6MGaeqOB9bvXGfzhC4GM3UZJDaNNyfgdOgc040=; b=D+qLHvystZKZ3A
	+mzmuO5LRshzD83T885sIEPbzU31KS93IcVjCKDcwoW6tmQCk0hORWp5TFg9fvx+dwn9yTxbgifOO
	88lnf6VfvxUqkIj7TVQnUlZmZQsaLiBfQBcPbKVBazqFXyupGStT/hegmENuMI42kkUWElnGdFEo0
	YNPzbi1zFTEhSXHYaWln7KulXristwWoR8FA4j6CKucNSZJ4ybpj3pBaMsexM3txs312VdsE/+JzI
	CgXe2M0t1JeTkeDzidH8gK7qX678J/EeH3Mg3pUCncRJEjuZ+pMIo53mEV9TTdLpLILFEVWt4MHP0
	4e1XPDv9gCHo2A3X1FAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guDOJ-0002sl-Kg; Thu, 14 Feb 2019 09:33:11 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guDOF-0002sK-7D
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 09:33:09 +0000
X-IronPort-AV: E=Sophos;i="5.58,368,1544511600"; d="scan'208";a="26725366"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 Feb 2019 02:33:04 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Thu, 14 Feb 2019 02:33:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0R5MT6Bdn93A+i0idqNSID8TVhi1eFFQm9Cm076euw=;
 b=rEpqOpbaOGWzLNUD/eDubzxYxEUNRooblcEZKYRNclOp3/gf2uKpya29ChZV5nDIB65twGdYQUF3QjtI3jC4qYphLkYib8omHjqcov/w+TsBzODfC8+O4N5r2Snzj/58jsGqbxh5ZQY5NVXyGcWnf/QEnG55s/0eJy21/L3I6K0=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1970.namprd11.prod.outlook.com (10.175.95.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.22; Thu, 14 Feb 2019 09:33:02 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1601.023; Thu, 14 Feb 2019
 09:33:02 +0000
From: <Tudor.Ambarus@microchip.com>
To: <jonas@norrbonn.se>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 0/3] spi-nor block protection
Thread-Topic: [PATCH v2 0/3] spi-nor block protection
Thread-Index: AQHUuB8xSth1ixPvcEybGxvQLEP/LqXfHTQAgAAC4IA=
Date: Thu, 14 Feb 2019 09:33:02 +0000
Message-ID: <3f4916d5-45e1-fc7a-96f4-1dd6cbecbbc9@microchip.com>
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <a46cd605-efa0-7f3a-9887-43f58c646f65@norrbonn.se>
In-Reply-To: <a46cd605-efa0-7f3a-9887-43f58c646f65@norrbonn.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0101.eurprd08.prod.outlook.com
 (2603:10a6:800:d3::27) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2d4bb79-9f9f-44c0-cbd8-08d6925f6a0d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1970; 
x-ms-traffictypediagnostic: BN6PR11MB1970:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIxOTcwOzIzOm9vY2IwMTNhR1p2c2g0VTN0ZlFSVlFEZkFJ?=
 =?utf-8?B?WHNWa3lOdWJ1dWZ4N01CNk43VjZacEkxM3VNUzl0cXVHV0swTEZIN0c0b3Ax?=
 =?utf-8?B?dmlRWUlqN2FtcGt4K1ZzNkdhK2UwZlJUM1laeFlOY1h6UVloNi9xSCtWSXpW?=
 =?utf-8?B?M1I2aFJXUzloRUp6WnRZZVhXZGN2RkZZZEJTM0p2T1V4NGJjVlkwSXVLWlg3?=
 =?utf-8?B?REI1TzRwaVovS2lRQkdUWllaN0RBaW00azlUcUdHOUJ5UkxZcWFWTVJ0aEpL?=
 =?utf-8?B?UjNhd1c2YVBQL0trczgwcnhndXBMYWVObVpYSi9SSUxTTVNObFNtM1ZQV1Y3?=
 =?utf-8?B?Ui9QUjhnWjdNZ0pZa1NTYjVrYW1zeUNyQmVndXRDL1RKYWNCZEpkdHVhdDBL?=
 =?utf-8?B?Z3hzdU1TZHdBcldDalRaNUVxak9vMUFnSjM0Z3EzS0JhSHNBT0tnSmdQUko4?=
 =?utf-8?B?c1VLWkZUN0JhWnMweGt2U3lZQUYrVU1vODZwZ2pDdGd6N2dvOGFCaEpad2dR?=
 =?utf-8?B?cklJbmd0SEsrOFVqYWNhUXJMaFNadUlEcmZZeE5mdGE0ZE9Xang2Sk56Rkxk?=
 =?utf-8?B?UVM0Qm5lZno2b1lkMWMrcFhJZnV0UUQ0YWpETDlWcHdJUU9NN1VCRGtzTGR4?=
 =?utf-8?B?YnJ6bDdNeTFvUWxZUzFMQXlEOHZHNEhvb0g5TGxCWCtJckNZeDk1b3IxTjJM?=
 =?utf-8?B?dWs4VGVvb0RpWDlnT1ZsWFdSWWl6dXFjSVVicUFSN29DNTdQUkRZZTRhNExs?=
 =?utf-8?B?SzFRZUloT2F2UHRUNHNTb2tTc0NGcDlYSTVpencyK0dHUDhxQ1pCanJEOW9s?=
 =?utf-8?B?ek8yQnJZa2d2YzhGWXNIN1k1Z2M5N0NveVN4bmZETXZwL1BwOGE4aiszN0t2?=
 =?utf-8?B?S05MZkg1bVBXRmhyVjR4ODVYSGRZRlJkczhrSW16Qk1naDVkZEtQOXVhcGtl?=
 =?utf-8?B?M0JJZmN3UjhzRVMyMXkwOVBtT2hJa3l0eUsxMDEySzRMOGdVZlUxaDVFdkFz?=
 =?utf-8?B?STI5SWVmUXU5UEpGcUtUVnN3WFFkZFRkT0xMZ1BOQk1acENPQWZ5eE5RM3Yx?=
 =?utf-8?B?Vjk4RzM0amQxbEtreXlucDliQjNZQ1ptSlVyekc1czZlRmVsZTZURktuckdy?=
 =?utf-8?B?aTNpWlRRNk8wWDM1M3VwUnpBWDJYZlA2V2tIOExrMzNuQS9FQ0hNVEpwbU1H?=
 =?utf-8?B?SnNHQ2ZFNXlOajB1TTNhTDBGVy9wQkZUYitLTXZDL0IrcGFoVzNESGY4WFVY?=
 =?utf-8?B?YlJXZE4vdjVycG9CTUZEV09SSnN5YkZaUzBsUUZGOURLK0dyMDNSTWg2UjZx?=
 =?utf-8?B?WHhEOXo2cjllQW9TNjM4cFRVSnU5TDdBTU1rOGtXUTlITUFPZ2I1OWdDZVRB?=
 =?utf-8?B?S1pBU0hlRGxWOURDYkVqdFRUMVBRN1g1WUM5RmROOXU2VlZvL2htUmFySDRw?=
 =?utf-8?B?eGZNZE9hayt3U1UybEJmd251NlVIR0JvdzVlYUxTYXhwbUIxTzgwNlViWGhX?=
 =?utf-8?B?NlhidXVMUkg4WlhlQy9Jb0ZJazJDQTBqQVpmYVY2SkhGL2JmMG1qK2ZsTXQ1?=
 =?utf-8?B?ZHhHRTVmOE1ETlVlYVZsbzFqUG9URGRHeGxQVVd4N29yTVd6VkVYYm1VWmFv?=
 =?utf-8?B?aVUzUEV2dE8wcExQdnlXTG9qMTU5TUl1UTRSMXk2T1Yyc0R3TGc3ZHdtQVpF?=
 =?utf-8?B?Zm4zblozTjRCQ0VmSk5oZEl3dkZJZGQ5bXcvUXVzajBzTUliUjVRS1lQSUU3?=
 =?utf-8?Q?gr7HgMwTLSv+2KoGrpsgCIqmbGfkDq8aVWCBA=3D?=
x-microsoft-antispam-prvs: <BN6PR11MB1970F0D8C16F23E56082664AF0670@BN6PR11MB1970.namprd11.prod.outlook.com>
x-forefront-prvs: 09480768F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(396003)(136003)(346002)(376002)(199004)(189003)(558084003)(8676002)(66066001)(81156014)(68736007)(386003)(53936002)(71190400001)(71200400001)(6506007)(53546011)(3846002)(6436002)(110136005)(2906002)(99286004)(6116002)(6346003)(2501003)(316002)(6486002)(102836004)(8936002)(6512007)(76176011)(81166006)(52116002)(2616005)(11346002)(229853002)(476003)(36756003)(486006)(97736004)(14444005)(446003)(26005)(305945005)(106356001)(31686004)(6246003)(186003)(105586002)(478600001)(86362001)(72206003)(14454004)(31696002)(7736002)(256004)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1970;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FZqyvgkYAMA52+TDknhfdyRLiWAYS0wxlW2BwVXRDUCNCQjlINMiHOlNP/6FMJtZjBiPqTbpRV/rzlbFMYscO+5nc6DXVOKW4QRJJ2QiEFOxITGP7fEdcxNxByPai+QIaxRhN42kOcWFlLFzfvwmZS+wsvxzq+TUGdK7GK9C9/sDAwxZ4QdcQiitW317MO5aaL3/U5XF4fATDB6/WOeSVtSilPymtose+aIiuv7eHR4TxaLvaLQ9L+EOw/OoYjY0gMxaqwrqRgEYHeXnT4gmXYqDyvS8U31TE/8pbcyu0CXNudynu7PEtg34DqaP3h6+G40fM+CMypwRrJ1nex2gfebUv3j/72rEVBT8IjGeasgNC+MZBW4mDgAOB+esgzgDYVDHydXjS4nQzP2nOdwZ9rac3geiZ/pm3UTjrikU2fk=
Content-ID: <FA9EA0C3A65F0D4F87706EA11C83B1BB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d4bb79-9f9f-44c0-cbd8-08d6925f6a0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2019 09:33:01.3046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1970
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_013308_116712_F77578E0 
X-CRM114-Status: UNSURE (   8.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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



On 02/14/2019 11:21 AM, Jonas Bonn wrote:
> Hi,

Hi,

> 
> Just a gentle reminder that I'd like some feedback on these patches.

yep, I'm going to review them these days, I still have few in my queue.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
