Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA24C54FCE
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 20:26:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D1792073C
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 20:26:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z3ZSLMWz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="NbnjL3Cj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D1792073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVA/Q/mCzcV4WD4AacbHBtHwRVAwhRD8m0nW+gJyHVs=; b=Z3ZSLMWz3EnQdo
	dJ9NA41gtybTiieblugZHgikZteoMT15Gqt6fxFlVVdUOpaW8Y7QlUK6K3eF/s7CC3Hgswjt8tR6Z
	xuxGhdndvj7hmPb931IrKsQ8CJgJKgdibeqXBDHt8GNIKeQ3w5SwIluxM7Ev/8Zv3Mm3f7qxt2e68
	LIMiNb5wGrcv2/Krr+Db3A+qV/DDjDD/2g4CwsfAq7ha/SkvYL3UTcDoeeE+6SyajGQe64wI2fz80
	NX8OombPfLlldov2i5Ancyew2e8YaRvoZjutzdn8kaEWPLV0TM3jrrvq9YptwxF7nZubi9wZeCIQT
	qa0d9BkDl4U9bU0Psytg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGTeT-0005gp-VJ; Mon, 23 Mar 2020 20:26:25 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGTeP-0005g8-Ma
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 20:26:24 +0000
IronPort-SDR: JCSix285/zfwAg+C7vgGp3pG4SlAl7jYTw5NZR19SJni/DH3ntoC0r6Ozg+fLA+HrABbR4SPJZ
 DwMZHTbO8yAYH9VGa9/FKZH86EG4d7HmJUEAs/CG4VA/ctXclkw47wP5Z2GXbHiIpE2BRMmOE7
 b+ofx1TspkS1QZY0PIh1OSPwp51uli4+VVzGaLthN+sCHXE7hrvS9kPnZVvbHwqDl8/WM4zl3Y
 GykQC/4WNS1A0VCIvgh1R7R26xH0hop0kpVqNRk8lPf3h2t9fCCxiQ1ZMKQyyTr8Wn0LgtPX8h
 f04=
X-IronPort-AV: E=Sophos;i="5.72,297,1580799600"; d="scan'208";a="73164270"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 13:26:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 13:26:14 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 13:26:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSB+H43DB/Y3rZTRHWoRvStR/kSZJE4SfK33hkNtvsUU2JVVmlnI9WoEgD4Nbo2QoKr7CtEEiiXlxNNkd/WoR5tZtGaayqw5yofA4+cnl+HVaDRw1s/GU4wYl9fxmyZ6+di+OnWZBIZDNVRXJh5lQo0YXg9ucsvw0yFNNv1+M0hmSuepkMV9KMs4xB/8Ac8r/nOhgu1Zta0vaQ53uyBgbbBfyfgT2U6+/NCnynd7RffcgY2dwB2aRCf8Mva7nwnwPMc2J+xF4Gbw0GtbIk3cVzHHMMm3K3mzgY9lN86iY0T4pre08WRTRJ1jqlYkm+jDRQF02PopepZUIDOCwI8CCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlcMh/enJ+X99QQeqAa5LOQiKqKeWcW8SAX9KJPUu+g=;
 b=oB4uUFuRzAuGmEo3Y5K7FaeC34qzszaC0yy9RysnQCo91Ne8o9+3c+AlGExETNjjL7XCTgld7X/bvAFCpzry8cCKvJenjJaUskr1afgcUwDBXjwvvc2SgZ6m0FX+Yt6iTrjhY37cY6XTZLRH9neMWE97i3TDb0EUnN5c3pDcpvab87L+Siatuqlmnu+aQYQm/ThiFVIJb3krSyoWlbjBEMpHp9eRTgGX2bQmZlANWbp3tjK02cb106iUM8DhIKDY5BNb0kYZs8YVGFICI4aW7etLN2SJLyDM9SXD8FFRZUBt3kQoY9EBiUoUjzsTRrAoXkIdpQ9KkmTTeWh9WHDwCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlcMh/enJ+X99QQeqAa5LOQiKqKeWcW8SAX9KJPUu+g=;
 b=NbnjL3CjinebC0LewBckDoBDfPKfyN5s8qlZmeL9iaSjxmF0Gr524j5lU5n8Gt3PCcF/DhGY34dRuzxP3n7IX8Dah47ZvAm+VDGBpyxqOW5RBonshypXG+cRvHxImGiIJMVtgTnjpw5N601y+7JNTdfPWL4q4c45NtvB7PSpxSY=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4404.namprd11.prod.outlook.com (2603:10b6:a03:1c3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Mon, 23 Mar
 2020 20:26:12 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 20:26:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Topic: [PATCH v3 1/5] mtd: spi-nor: Fix gap in SR block protection
 locking
Thread-Index: AQHWAPTc+rZUxlHsAUikj/5G7+sVPw==
Date: Mon, 23 Mar 2020 20:26:12 +0000
Message-ID: <4551629.Jkd3TAmcGf@192.168.0.120>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <5899969.zVFlrMANan@192.168.0.120>
 <b2c8166871eda0ad5f8ed97cb6f69911@walle.cc>
In-Reply-To: <b2c8166871eda0ad5f8ed97cb6f69911@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f037aca-8050-42f7-cf21-08d7cf686dd8
x-ms-traffictypediagnostic: BY5PR11MB4404:
x-microsoft-antispam-prvs: <BY5PR11MB4404362DDD9127F18793A625F0F00@BY5PR11MB4404.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(366004)(376002)(396003)(199004)(81166006)(71200400001)(81156014)(76116006)(66556008)(8676002)(66476007)(5660300002)(4326008)(66946007)(2906002)(14286002)(26005)(186003)(64756008)(8936002)(316002)(6486002)(53546011)(6506007)(478600001)(9686003)(6512007)(66446008)(6916009)(91956017)(86362001)(54906003)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4404;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R3I8sz6JTIcS7CXvqZC4688PZ+ZSeMw8MGB9S9zM2VCs11u7Kcok1hxKnvAsnEivklro+Aezhnqrh2Bfvjzuhwtdhomjm982kHJvLyJRfF3/pyAw5OySYZCSJ/gaw8wxpjj2H+VT1vDIAVQusQYpTuC/dkCPxMVbY9UIvSvE/Tht4D/Nbp8YFH1Y8CeZAMT1fsWwKHOf2gAKIP4hSrqQ+JKFDBT2+1jbVMdAMv/Bjyt7/BCxsH/9XSPJwwQ7dsuZSl7dcSG7az4C9APDPsGjkG+SfcRYjxcrJgUlr+nKm2PoIEMKh4nsSSLOjgWTqGHh+f2gOdAmMqCXZWW3Y9nnzwsh0tk8uyp0QDPViyENgXqmzfoRBbOzw7hJ2nWJYl603LulmgC4cyjQQpWbvex9XJhDYFnaudrgYFY9gWz5pqlGbmuHxdd0q+scJPMNKqBSThEhwq4sPJIaWk9+c+BrmQ58Nj5Ww7NOz4mdMFnK/fybV65AM2csmOpX5punTvcU
x-ms-exchange-antispam-messagedata: OgMaklzAyBUHteKjXfmvxk+LbU2bDlF4au3xsEoOLa/KGAWiaix2h+paxhqCSC1O5AX6gqYOTtvr2ljiueuHAe1Qv5pbolZ0/t49oVEZKY3PAT9Nby0j4gHY6z2Ngjy2dCmNQKhyxiwOyb8mrQCnfQ==
x-ms-exchange-transport-forked: True
Content-ID: <AB10E8DAE4CF2049939EF2A8D49C68C8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f037aca-8050-42f7-cf21-08d7cf686dd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 20:26:12.1878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ip6392QzKfQ0G4ZDe8sBRvuUAswqsLDxcbGzrYoNiaPmMry0/l+zfK381/W/FuGTi2BGmvrCfnzE4jTkwcH6xRkbIuGRJM4AWPxmF9zJLvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4404
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_132621_746005_68E4EBDE 
X-CRM114-Status: GOOD (  19.62  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, March 23, 2020 9:54:38 PM EET Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> Am 2020-03-23 20:20, schrieb Tudor.Ambarus@microchip.com:
> > On Monday, March 23, 2020 8:27:13 PM EET Michael Walle wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >> the
> >> content is safe
> >> 
> >> Hi,
> >> 
> >> Am 2020-03-23 10:24, schrieb Tudor.Ambarus@microchip.com:
> >> > From: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> > 
> >> > Fix the gap for the SR block protection, the BP bits were set with
> >> > a +1 value than actually needed. This patch does not change the
> >> > behavior of the locking operations, just fixes the protected areas.
> >> 
> >> So instead of rounding up, it does round down now?
> > 
> > No. Why do you say that it rounds up? The behavior is not changed, the
> > patch
> > merely fix the protected area, which was wrong before. The round down
> > is
> > present before this patch.
> 
> TBH I don't understand what this patch should do. Could you give an
> example?

sure, let me try to be more explicit.

> 
> >> > On a 16Mbit flash with 64KByte erase sector, the following changed
> 
> >> > for the lock operation:
> 16MBit is a bad example, because it is broken anyway, isn't it? We use a

it's not.

> 32Mbit flash where 2MB are locked and the second 2MB are unlocked. Eg. a
> 50/50 split. I haven't seen any issued. Shouldn't it be then completely
> locked according this the following example?

I don't follow.

The table from below was generated for the S25FL116K 16 Mbit flash. BTW, one 
has to disable CONFIG_MTD_SPI_NOR_USE_4K_SECTORS in order to test the locking. 
When you have a 4k sector erase, the locking is simply wrong, but this is 
another topic.

> 
> >> > Number of blocks | BP2:0 before | BP2:0 now |
> >> > 
> >> >                1 | 010b         | 001b      |

- number of blocks is how many blocks you want to lock. One would do for one 
block:
    flash_lock /dev/mtd 0 1
i.e. lock a single erase block starting from offset 0.

- "BP0:2 before" is the result of the operation "flash_lock /dev/mtd 0 1" 
before this patch

- "BP0:2 now" is the result of the operation "flash_lock /dev/mtd 0 1" using 
this patch

So before this patch, the lock operation was bad, because it locked 2 blocks 
instead of one.

> >> >                2 | 110b         | 010b      |

- lock 2 erase blocks starting from offset 0. Results before this patch, and 
after this patch. Continue the logic on the following lines.

oops there's a typo in column 2, sorry. The value in column 2 should have been 
011b.

So before this patch, when one requested to lock 2 block starting from offset 
0, we would obtain 4 blocks locked, and he should have obtained just 2.

The scope of this patch is to first fix the locking ops, so that we can 
introduce a more generic formula that gives the same results as before 
introducing it. Without this patch, the new formula will silently fix the bug 
that is described here.

> >> >                3 | 110b         | 010b      |
		^ typo s/110b/011b

rest of the examples are good.

Cheers,
ta

> >> >                4 | 100b         | 011b      |
> >> >                5 | 100b         | 011b      |
> >> >                6 | 100b         | 011b      |
> >> >                7 | 100b         | 011b      |
> >> >                8 | 101b         | 100b      |
> >> >                9 | 101b         | 100b      |
> >> >              
> >> >              ... | ...          | ...       |
> >> > 
> >> > For the lock operation, if one requests to lock an area that is not
> >> > matching the upper boundary of a BP protected area, we round down
> >> > the total length and lock less than the user requested, in order to
> >> > not lock more than the user actually requested.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
