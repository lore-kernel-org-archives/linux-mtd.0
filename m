Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF59C5DF60
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 06:27:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6883821D6C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 06:27:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T+9/oXKQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="d7pmmWz+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6883821D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsKv5A00WEDlBxlsZS+HwvhJzzLNl33ekcg3oBUx1qg=; b=T+9/oXKQSHKsrF
	s/FLVqy/mEKWm+o/A+Lb4B3psucCjrnRln5fPNhBdtnUPht1Nvd3TrEhSMq3Zj/xzmnePz7evo4Ap
	uM6IQ3SqdqSeaKDiwDwJcy8dU+kT6csudi0bIfPbZNvY+SsPCrT+yTjUmdQBo/RcE4PQnzTuGX3PZ
	C+fHC1tu1c8YML/OL1Hkutc5/7NM8MIE5T+xv5Ni5ZpuPf5qWqjIb+0lbLymelJL4KQOauNYxtFw9
	MztxixUmouhco/nVKjkEEYDLg4IwAuBeOn7cLA8VSg9vEETtDMp+lZWUSUKTl30k6LgyMKJ/vI2gH
	frTPorahUCfddA7L5i5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSbGh-0000iR-NY; Thu, 07 Nov 2019 06:27:43 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSbGc-0000he-IY
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2019 06:27:42 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 70DXJUNXMh+odCrHZA2zHdVuodZctQFJ17vu2A6JWHEjaYwIG50tCvjLMbK6F36k2bWSUpzRSt
 8Fxl/0m68tqHboMb9MibXcJH8MjOZhVvBKIhr32HqV4X5cIsFLKLDtQmhbV7DLJH42KEqOxSjq
 IUrGWMXAVXezWjZUmVr+T2dzUlU/MoKQmEXvL2vr7Cc4wAk8iWoX/RH+SFCbxtHg02uMZE0M/N
 zOVSgnlctnh3xYTYZvwv6PVlGzz/lsveKaG9khuhQMz8Xast2frWjJ8gMUsOXr7l1pvht98zd4
 HxQ=
X-IronPort-AV: E=Sophos;i="5.68,277,1569308400"; d="scan'208";a="53255057"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2019 23:27:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 6 Nov 2019 23:27:23 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 6 Nov 2019 23:27:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVxOZ1wxPW/8BIbW9C/cA1l8rQ5X1HxH6UFH4d9LAXd2ZCbaVcOO822ODrjuIEjatZOf4cCWMXgM7yCF29Z/8dMY0lHUma+BjhFDEiYjCnnF6+PEL1Rp+bLo0D+6rNUlTdm+ilf4xlwrmVzMJZeUaTgL3xiWtXko3h0C1jTxwRaAYrBziG5RpAfiHN/iWbTv8wFlIMoiUYQyKMZH2gz4UCpM+NbQfWJU+qZ/MQcqfFFPO4vWRnAPtxhaejvd16U9NEfbLOo53EzpMT65cKjcCuyGVE8siyCfW1CmkxVmSkuV3Szgqvc+97ljpSxMimtdmWl1f45ip7lBh8A+QUIpvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8kStirzX+tz+0sU+k84VW+p+QmPLoLYZiDZ1UEiueI=;
 b=FmpvmdsnmHHEy8xJsgGO18zW1VcKoQuWREUIs+rEukgY3uMiFVImkKQiJkqavJ3sCzq5hP7aUwmFXgIwF667xIvADLz8nFXOW3TMKdr03uSKzgZrHQzv05W/e4Xle5tM+gi/977lBzVz+EBjuW2Ns3eQajl25btmE2IO+07dkLrS7k74K5Ai6G5Rjxd8ttBlmWdP7AoPTi6AYQdMfWbKyowtOUo5eipo6Q8+l+pLX4bz8/isItwmYD1dJ3hU4tKMnHqlG2MdDlvfb7m26j5MzLsWLkr9OTk6zplxC1QchSaG3HmapJ2uZGd280ZGp5YLLGadWpG+dwMmbTlqDZ0EDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8kStirzX+tz+0sU+k84VW+p+QmPLoLYZiDZ1UEiueI=;
 b=d7pmmWz+9G+yD92WU5nGMyUwuLavHl+ExFts8CGLW13Qv4ts22BeAgzZyHYnhqxOCqZwKfEgwYLjd5pxIwPhYVlznmyUJmQrRTEocdhLHdckCFlRznkrMff9BybmIYSmWgcireK18XAoJ1uH3BdXOltwGQfOPTowRMc8eMp5I+k=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3984.namprd11.prod.outlook.com (10.255.181.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 06:27:22 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.025; Thu, 7 Nov 2019
 06:27:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <vigneshr@ti.com>
Subject: Re: [PATCH v4 00/20] mtd: spi-nor: Quad Enable and (un)lock methods
Thread-Topic: [PATCH v4 00/20] mtd: spi-nor: Quad Enable and (un)lock methods
Thread-Index: AQHVkW/w1K7mIia8jkCIYuk++qibt6d/ReIA
Date: Thu, 7 Nov 2019 06:27:21 +0000
Message-ID: <cee4df21-b2f8-f9a3-d936-e79d57e926f2@microchip.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191102112316.20715-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0071.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::24) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e685fc9-9476-4897-2cd3-08d7634b8baf
x-ms-traffictypediagnostic: MN2PR11MB3984:
x-microsoft-antispam-prvs: <MN2PR11MB39842C54AB62C3DCFBE38A00F0780@MN2PR11MB3984.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(366004)(346002)(136003)(39860400002)(189003)(199004)(486006)(71190400001)(5660300002)(66556008)(66946007)(25786009)(64756008)(31696002)(71200400001)(66446008)(66476007)(31686004)(99286004)(14454004)(110136005)(316002)(14444005)(256004)(7736002)(36756003)(478600001)(54906003)(186003)(305945005)(26005)(2906002)(446003)(229853002)(11346002)(86362001)(2501003)(102836004)(3846002)(6116002)(8936002)(6506007)(81156014)(81166006)(66066001)(386003)(53546011)(76176011)(6436002)(52116002)(8676002)(4326008)(476003)(6246003)(6512007)(6486002)(2616005)(414714003)(473944003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3984;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U3EAZqUkK6ZYrgKRfgtM8tlh8F+Lt4y/cZZa7gW+XrCez3Nk98LpVT0bbt2aqdX40RHmFf0PQyg/+fzWROeKL1+NV6aDOLboGqLDdnG26Rd95D3pOwqrRnCqOPWgO6PazXWqKylBRzMJKaLMYFop6mhqn0Lat95x+adnDvx4qnYXaVknEWp1f6NDMYwmmd53zjHGuIO+x7+cEErPVyCgPa8CBELRTJDSTYMAFI6mGBX/TJ/unSb22YtPAjRbw+n8cQeZzVsreqd8y3ZBaZRk97bLnPBca+cgDoGX3iiKLdyUcXRGttjNC/GeSRuarRDFmXI759b58SubLGbkrH9nyNFuwyKFBzfwOt0AsqFos03os7MxB9vHiwSc2hkwnuKOwOJTChizY0GWk669bI2EUgMcBXlfThb71EVDI/zfS/5nwkKgTjvGnO05PItXtAbD
x-ms-exchange-transport-forked: True
Content-ID: <FF63B19E9322C14FB2F2D0AE7D33503E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e685fc9-9476-4897-2cd3-08d7634b8baf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 06:27:21.7442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8A1vv+VUOreFmAQUlKeLOk2f19b2/Yn0PdA02dpv419o59GBn6v2lWjXk/nmFYlXTY7f++PTZFgxqCK0RlQx8U9YZflBs6Dgl3QWG8csD2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_222738_655797_2627F6E7 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/02/2019 01:23 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Tested on s25fl116k and w25q128jv-q.
> 
> Fixed the clearing of QE bit on (un)lock() operations. Reworked the
> Quad Enable methods and the disabling of the block write protection
> at power-up.
> 
> v4:
> - Use dev_dbg insted of dev_err for low level info
> - replace "&nor->bouncebuf[0]" with "nor->bouncebuf" and "&sr_cr[0]" with
>   "sr_cr". Update across all patches.
> 
> v3: split patches, update retlen handling in sst_write.
> 
> v2:
> - Introduce spi_nor_write_16bit_cr_and_check() as per Vignesh's suggestion. The
>   Configuration Register contains bits that can be updated in future: FREEZE,
>   CMP. Provide a generic method that allows updating all bits of the
>   Configuration Register.
> - Fix SNOR_F_NO_READ_CR case in
>   "mtd: spi-nor: Rework the disabling of block write protection". When the flash
>   doesn't support the CR Read command, we make an assumption about the value of
>   the QE bit. In spi_nor_init(), call spi_nor_quad_enable() first, then
>   spi_nor_unlock_all(), so that at the spi_nor_unlock_all() time we can be sure
>   the QE bit has value one, because of the previous call to spi_nor_quad_enable().
> - Fix if statement in spi_nor_write_sr_and_check():
>   if (nor->flags & SNOR_F_HAS_16BIT_SR)
> - Fix documentation warnings.
> - New patch: "mtd: spi-nor: Check all the bits written, not just the BP ones".
> - Drop Global Unlock patches, will send them in a different patch set.
> 
> The patch set can be tested using mtd-utils:
> 1/ do a read-erase-write-read-back test immediately after boot, to check
> the spi_nor_unlock_all() method. The focus is on the erase/write
> methods, we want to see if the flash is unlocked at power-up.
>         mtd_debug read /dev/mtd-yours offset size read-file
>         hexdump read-file
>         mtd_debug erase /dev/mtd-yours offset size
>         dd if=/dev/urandom of=write-file bs=please-choose count=please-choose
>         mtd_debug write /dev/mtd-yours offset write-file-size write-file
>         mtd_debug read /dev/mtd-yours offset write-file-size read-file
>         sha1sum read-file write-file
> 2/ lock flash then try to erase/write it, to see if the lock works
>         flash_lock /dev/mtd-yours offset block-count
>         Do the read-erase-write-read-back test from 1/. The contents of
>         flash should not change in the erase and write steps.
> 3/ unlock flash and do the read-erase-write-read-back from 1/. The value of the
>    QEE should not change and you should be able to erase and write the flash.
>    Test 1/ should be successful.
> 
> Tudor Ambarus (20):
>   mtd: spi-nor: Use dev_dbg insted of dev_err for low level info
>   mtd: spi-nor: Print debug info inside Reg Ops methods
>   mtd: spi-nor: Check for errors after each Register Operation
>   mtd: spi-nor: Rename label as it is no longer generic
>   mtd: spi-nor: Void return type for spi_nor_clear_sr/fsr()
>   mtd: spi-nor: Move the WE and wait calls inside Write SR methods
>   mtd: spi-nor: Merge spi_nor_write_sr() and spi_nor_write_sr_cr()
>   mtd: spi-nor: Describe all the Reg Ops
>   mtd: spi-nor: Drop spansion_quad_enable()
>   mtd: spi-nor: Fix errno on Quad Enable methods
>   mtd: spi-nor: Check all the bits written, not just the BP ones
>   mtd: spi-nor: Print debug message when the read back test fails
>   mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()
>   mtd: spi-nor: Extend the QE Read Back test to the entire SR byte
>   mtd: spi-nor: Extend the QE Read Back test to both SR1 and SR2
>   mtd: spi-nor: Rename CR_QUAD_EN_SPAN to SR2_QUAD_EN_BIT1
>   mtd: spi-nor: Merge spansion Quad Enable methods
>   mtd: spi-nor: Rename macronix_quad_enable to
>     spi_nor_sr1_bit6_quad_enable
>   mtd: spi-nor: Prepend "spi_nor_" to "sr2_bit7_quad_enable"
>   mtd: spi-nor: Rework the disabling of block write protection
> 
>  drivers/mtd/spi-nor/spi-nor.c | 952 +++++++++++++++++++++++++-----------------
>  include/linux/mtd/spi-nor.h   |  12 +-
>  2 files changed, 583 insertions(+), 381 deletions(-)
> 

Updated 1/20 to use dev_err() when the SR/FSR report program or erase fails, or
attempts of modifying a protected sector. Patches 1-12 applied to spi-nor/next.
Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
