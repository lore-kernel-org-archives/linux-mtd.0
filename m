Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D235C3A59E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 08:23:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D83822DA7
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 08:23:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fRlGMHKL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="mU4f6SfQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D83822DA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M37PjAMUnbE44kwG2Uh5fhythlWgvRBMV7hDOMoumKU=; b=fRlGMHKLUgbxnl
	ciLSFrT1lfVL/Yoky0Fz/+B5XpOAZKio1iVjYqPyW6jHy/rLQ2XGMkblT+LrDqc8FzTLcFrpTFDB9
	LUZk44nJus0ulLoujBXB5mSUuQeDyTBdjwRkyqaWpFPv7mKUU9TbQ8Zgi7xohud3ezUbp7E1J54jY
	YJmULH6dYPPvITA6Az0QXASG1HShEyQEW0vSfM8pDh8EMIiLQX8jg9WsynAjZ93JNGuZHXA/FNHIS
	ROc2jO7S+sG4vZkeWjGQnqtnqSu6XGZgsJHVeyYz1kF4GmuyY2xwFk+5rq/z3f28T8uF8hRDNB3so
	n/YWxA54fs6YyX5eaycA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Lti-0003Dj-VN; Wed, 21 Aug 2019 08:23:15 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Lsv-0002Sv-E1
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 08:22:27 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: gi+GMHunzjHB69NO11jpQ/9x3IT/WGEqOAhRhur0coirPBZecPML2Or/mGZ93GiUjf0w8Pg13I
 jFbVUH17K8weFmJHBAh4pD4pyG7Fg4pdH3j6Z2WpTsEa5Bq50WW7e3Lo9lDuTui9qhBe4O3pBK
 5cVVkedb86ZEdnyQLPBtckkEZ0bLAFA2v71n+gLa1ShBgcQ2vPlAG0x1W/nmg3qyUcjDQrbjT/
 Kh4kafRe3fQU0yCyd5y44aVqOdcY91npQaMU/7jbuGW3qxjmdD1KczTXbhZaxytLAOIP376X2u
 x5I=
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="46037599"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Aug 2019 01:22:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 21 Aug 2019 01:22:23 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 21 Aug 2019 01:22:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tja1wHDwQ8o/ynq/wFAeO3IDVrUD1Sm7YTgyuR1SCKct+749S4hbr5gTJliX2XMi1madJ9LEqhKt7ZD7P25/oeL31D28vrzXp/UdAyMwjW4PifzMOtx4aVP0m4MMc1Flk5D1H3iJYOpnbIIY2juuMR2uVZQWX0VdcCoiW///hN+cuIcx4Zau5rYNndfEw/Geq8b+yaPRQu4MwH5PaE8A6MuOPgyerYlrenHR5K9AluHMZgU37RmplwNjuLW5eU9tT4xvFSnLdRP5liBsDbM9D+QwZahcME+2Pw2IFbLdHTQeIOnLugYwJXzz965KhhKwg0b/v/NNwyt7PGN++/C/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqON4Mow7rodsFak/2Tl4GhYVtuDUhbrJdc5rZcefU4=;
 b=cvJJpwTl4oxiDRqsOCv/GYuHV/35N8q8deJffZZRyxzA0NMp60ISDnXajINN0esh4F0xlt4torO2k3Ld2l5V00HtNSVkl8/xF9XnX1xmt4JYGMt4XcuwQt9ILrULdjxUd7MpRE3bEWxdQNF0A+1wWC425bWd/95kCsVZLjocMeoCQdHk3uANfdr7xyNXjTqBuXvC2VsB+DNb5wGTVXYG1GdNCo51uEnN36DydghqWZe+AmeYkjI8+YmjM4x/AiSeTBULYS9b8B0DqtC5XFdMUlbEPKStc2VMjJToN8aWIsSpNgGxrbp5ZDuQFAM8seTAp+wSCKu8X2i8COyGjbJD3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqON4Mow7rodsFak/2Tl4GhYVtuDUhbrJdc5rZcefU4=;
 b=mU4f6SfQT7PHbZTOg5OnHbN98qPAkh3ALh+Qcgy8RA/+Ed9HFB9wPrEg7n7WCyblBGOnNw8omnvRfCGLYaPZ4ZDWRuzCJ3aVdmT0pi3X0pC3eDXD3+cyfeq3boB8BW9t3hLNUw0w1W1vHRMy7a/24Rk5/sdu3cDarxAVMUoPQk8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3918.namprd11.prod.outlook.com (10.255.180.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 08:22:19 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 08:22:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <thor.thayer@linux.intel.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [RESEND] mtd: spi-nor: Fix Cadence QSPI RCU Schedule Stall
Thread-Topic: [RESEND] mtd: spi-nor: Fix Cadence QSPI RCU Schedule Stall
Thread-Index: AQHVU7xeH2z0neoGB0mjYqq1QJRJg6cFS5cA
Date: Wed, 21 Aug 2019 08:22:19 +0000
Message-ID: <5f0349e4-e412-99a5-ea86-f8fb572b0ed7@microchip.com>
References: <1565909736-11379-1-git-send-email-thor.thayer@linux.intel.com>
In-Reply-To: <1565909736-11379-1-git-send-email-thor.thayer@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0245.eurprd07.prod.outlook.com
 (2603:10a6:802:58::48) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e147a8fa-774c-41ee-8ae3-08d72610af35
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3918; 
x-ms-traffictypediagnostic: MN2PR11MB3918:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB39183F3BC3B113C8F861AA53F0AA0@MN2PR11MB3918.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(199004)(189003)(45904002)(66446008)(66476007)(64756008)(102836004)(486006)(52116002)(8936002)(36756003)(110136005)(446003)(2616005)(81156014)(316002)(81166006)(8676002)(6116002)(3846002)(31686004)(2501003)(2906002)(26005)(966005)(11346002)(54906003)(76176011)(186003)(478600001)(71200400001)(71190400001)(14454004)(25786009)(66946007)(2201001)(6306002)(53936002)(6246003)(229853002)(99286004)(4326008)(476003)(5660300002)(6506007)(6486002)(386003)(53546011)(256004)(66066001)(86362001)(6436002)(305945005)(7736002)(14444005)(6512007)(66556008)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3918;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x9NWJ7BL0ieXDoyyQ+9dOMGtM0/OD4aiKBCuxNptE0GKu5LRD9jd2i/1FDDINGqbSsvMYPzHZrll1sqdW4sBTDEVk3w6zArDDFxbtP59nHPRpkEA0ERdu1+2Saa3iPqI7hJfBj2ZDV/I6YDP5MsqjluCI5pv+gNIAkHL+b42+YRMSOE/pI54RFv7WzQOET6D8H9P7ugleX33DEuBFza//iWfAxQDIjppT8tuCCEZQmjCWjJg+xBWBnHlQc3CP0SIpReZq/ULOJNM/a94wWpn6JduZKggTsYoAebcMWt6IYqyxf6RHoEiN6b7Ip29C4tZ3I6bhJjXCkhvvif5kEVwhKqZdlflwZ0FUUXBBkAyOhqKEH2w3hRFkIJZfuxxGj6TcdeXQfpvtb7J0bdw2KNjdXb/FyMh23Y3O4S84wbFlPs=
x-ms-exchange-transport-forked: True
Content-ID: <4E178AC7E696054FB75B16F39D0D077C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e147a8fa-774c-41ee-8ae3-08d72610af35
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 08:22:19.8487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cdTOJvulnbRwJPENudh/O2fOCOXMApQDxfgy7WQBGCmOkppq7AvJshXRpv/KHfF3bo+6pslMX9ILVX9eL+15vKPi0XLvoRVNGChfdY+S2+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3918
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_012225_718765_CDE347FE 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/16/2019 01:55 AM, thor.thayer@linux.intel.com wrote:
> External E-Mail
> 
> 
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> The current Cadence QSPI driver sometimes caused a
> "rcu_sched self-detected stall" while writing large files.
> 
> Stall Report:
> '# mtd_debug write /dev/mtd1 0 48816464 blob.img
> [ 1815.454227] rcu: INFO: rcu_sched self-detected stall on CPU
> [ 1815.459789] rcu:     0-....: (2099 ticks this GP) idle=8c6/1/0x40000002
>  softirq=6492/6492 fqs=935
> [ 1815.468442] rcu:      (t=2100 jiffies g=8749 q=247)
> 	<snip> (abbreviated backtrace)
> [ 1815.772086] [<c05a3ea0>] (cqspi_exec_flash_cmd) (cqspi_read_reg)
> [ 1815.786203] [<c05a5488>] (cqspi_read_reg) from (read_sr)
> [ 1815.803790] [<c05a0330>] (read_sr) from
> 	(spi_nor_wait_till_ready_with_timeout)
> [ 1815.816610] [<c05a182c>] (spi_nor_wait_till_ready_with_timeout) from
> 	(spi_nor_write+0x104/0x1d0)
> [ 1815.836791] [<c05a1a44>] (spi_nor_write) from (part_write+0x50/0x58)
> 	<snip>
> [ 1815.997961] cadence-qspi ff809000.spi: Flash command execution timed out.
> [ 1816.004733] error -110 reading SR
> file_to_flash: write, size 0x2e8e150, n 0x2e8e150
> write(): Connection timed out
> 
> This was caused by a tight loop in cqspi_wait_for_bit(). Fix by using
> readl_relaxed_poll_timeout() which sleeps 10us while polling a register.
> 
> Fit onto 80 character line by truncating the bool clear parameter
> 
> Fixes: 140623410536 ("mtd: spi-nor: Add driver for Cadence Quad SPI Flash Controller")
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 


Since the bug was not introduced in the previous release and we are quite late
for mtd/fixes,

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
