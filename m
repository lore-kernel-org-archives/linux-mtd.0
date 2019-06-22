Return-Path: <SRS0=H4dZ=UV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE16AC43613
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jun 2019 12:09:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB67220679
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jun 2019 12:09:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RuxsiHsS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="LWrS+6/Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB67220679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzGNb9vpZ/0WNNBv+rr1mnVDw+bEWkrUDRc53xRrWS8=; b=RuxsiHsS5nizWq
	1P2lYA3v55E2UdkvldRD44kLJ7/EHT4Uf4fWMXov0IDG/M/SWtb2OspGUQzSwRxRvVGUcQknFXiu6
	BixEu/D+nb/Z6o/Zo9IcHKRYRGPkbdwirXZJotugpZuwefStvYpasGl6CXMq496FU8tqgVqmDdfvD
	RpiyBgcGh5P+zwxDP7PWqPCtspIJ5eAfjJ4SmMt94eoXzwr/hppdsMFL9x7E/Tq0Qu6x+VAmF3utQ
	8LGZO2mmgT2/ryw6mlRxA8MBpG+YrOMAt08YVaN4Rjm/mtfbXNZKDkCktxztPE4ujXzm1KHEFAP/2
	4eOadWHfJCTvuOuojV9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heepb-0003qS-OO; Sat, 22 Jun 2019 12:09:19 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heepZ-0003q3-8U
 for linux-mtd@lists.infradead.org; Sat, 22 Jun 2019 12:09:18 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,404,1557212400"; d="scan'208";a="38479250"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jun 2019 05:09:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 22 Jun 2019 05:09:18 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 22 Jun 2019 05:09:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvCCkWRJ7CJ1AjfnkmIrFGqWgqpHiita7e40gSRyL4w=;
 b=LWrS+6/ZjNQCOjf9YV/tdVN2PzJcjePDItK20QLx+sx8NrKrAyT2FYgmGvkpLEJENTqOLMBvI0z7iJCbca7tWZmtB8TUESzto6MNJhfvF751yOCSDM/3mX/BsOzvJWiRZx0ryC7ur8AYdPOc0FnqXJDe5Xn+2Wdo6WfrSQ5mdOc=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1683.namprd11.prod.outlook.com (10.173.27.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Sat, 22 Jun 2019 12:09:13 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1987.017; Sat, 22 Jun 2019
 12:09:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <robimarko@gmail.com>, <marek.vasut@gmail.com>,
 <computersforpeace@gmail.com>, <bbrezillon@kernel.org>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Add Winbond w25q16jv support
Thread-Topic: [PATCH v2] mtd: spi-nor: Add Winbond w25q16jv support
Thread-Index: AQHVDbAeVtuytf2rgkKyIDXliKCMbqanyzMA
Date: Sat, 22 Jun 2019 12:09:13 +0000
Message-ID: <60e454e9-f106-babb-5d1c-88c815e646f6@microchip.com>
References: <20190518192935.22684-1-robimarko@gmail.com>
In-Reply-To: <20190518192935.22684-1-robimarko@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P18901CA0024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::34) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.138.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 836b8352-3293-498b-048d-08d6f70a7088
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1683; 
x-ms-traffictypediagnostic: BN6PR11MB1683:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN6PR11MB1683EEAC4E0D5AC4B4A77E88F0E60@BN6PR11MB1683.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-forefront-prvs: 0076F48C8A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(39850400004)(366004)(346002)(376002)(199004)(189003)(76176011)(2501003)(316002)(66446008)(4744005)(81156014)(99286004)(81166006)(31686004)(256004)(14444005)(229853002)(5660300002)(25786009)(52116002)(8676002)(110136005)(36756003)(14454004)(6512007)(446003)(72206003)(102836004)(476003)(11346002)(2616005)(966005)(6246003)(6306002)(7736002)(68736007)(2201001)(186003)(86362001)(71190400001)(71200400001)(53936002)(6486002)(66946007)(26005)(66066001)(6436002)(31696002)(386003)(6506007)(53546011)(6116002)(73956011)(66476007)(8936002)(305945005)(64756008)(66556008)(3846002)(486006)(2906002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1683;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6Rw3NWHp7l8Q1ioiPzR1WZ1sd/JMGqja51r8QncnyW5UjJKn7MjjfhEbKqDPGjB2FA+DI+nSJxS0x6xiTmQWg+QV2fMEHwhx0myt5oP+scG+viHP0EULn51ZE8oVBttEwIXHkDDp12u13sNX9vIvRxiu2UIsTgD2eAeXKvxx96IsSjV7NkgHW5v+YgRcxagJXhXaWZUhG4hLLQdfbilLFRkZ1qXkWDRHUypEbC1g1d5/houR+P2bRpx5XO+A7CKNDEz/L526Hj9nBXUCXwPEx3TdpgimT4lQgcyS6iALlI4Jp62y6P9dDGYCcWXR/P76LBZPUiVbzdAr2KvmnOK82sQiHZgv+EBgSISqX2SRFim3ciDZ69sE71hi0VZXXpf53b3xeYVybkiOx29fDY0sbGAHjXbZ0H57rFxoh+/5uMs=
Content-ID: <CCBF67F77E7CBA48B0871573FD2B8880@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 836b8352-3293-498b-048d-08d6f70a7088
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2019 12:09:13.5495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1683
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190622_050917_339880_6B433292 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 05/18/2019 10:29 PM, Robert Marko wrote:
> External E-Mail
> 
> 
> Datasheet: https://www.winbond.com/resource-files/w25q16jv%20spi%20revg%2003222018%20plus.pdf
> 
> Testing done on Mikrotik Routerboard RB450Gx4 board under 4.14.119 and 4.19.43 kernels.
> 
> Test board does not support Dual or Quad modes.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> v1 to v2:
>         Alphabetically order
>  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

w25q16jv-im/jm and w25q16jv-iq/jq have different jedec ids, fixed flash name.
Amended the commit message and
Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
