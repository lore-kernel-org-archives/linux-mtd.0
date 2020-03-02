Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7BAC3F2CD
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 18:18:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4956E20836
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 18:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EKPgAAuL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="JRKZQEBV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4956E20836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8shMNO+EbBWFiR+sSDr2o9m+lHs1jy84nSGkEFcAl2A=; b=EKPgAAuLuwPNab
	pviVtN6m5o//Mg5SqK/QLyNBT+EUu9lJ2tDF5I8Pj+VZ1t96p3QFE6p6Xp6AxnpxdPcn6VeUn2MwU
	jpVwn6eI3SPQVmiq8mSgHJtytkIz1lWROrWq3xgZmJSWovgP7OdNndlxK75blOvtVonDEsIXtbGpe
	cgwzQjamhw3d8hIZYTVf2n27qSLnEK9R++O5yu+r5/vnqsydKmBiV/QVr7kJHRcAb2dB8YtB0DlbJ
	wbYIpdk6XtV6MCp9YMRR5A5ZPxOnjoaZcQD3xMLE9ekthH+h2E9nNCXUiIEZhoMtuuoW+NSWScj7S
	K9m80S1BscCYACmjIbuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8pdd-0004r7-LZ; Mon, 02 Mar 2020 18:17:57 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8pUT-0003J9-AM; Mon, 02 Mar 2020 18:08:31 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: cfrVPIeaSkhGl2Mh9/su+V3J+eMeD1e1G83GVsxe/+wBnav+8TScrephurOPTNyH2sWenci97y
 tkCxw++fD5xLnKwdynCW4Mx/S6dAxxTmSBp3Tnuai4pkWajkjuQl0IUl/r1CnR0OczbYGgcdKh
 XfJ4LyIuzrpnHRhmyvsUuBAHFBRDMDJyNmCG+in+gYi5qBTnCczMykiGFfSZHfTGvZISUMwVno
 n76UCcXtp8ieqWcq6zLCIW/ujsuc6xxDi3zxsPD86A+2lhbfQq7Dor4wB5XnCg56I+h1qsOInr
 Wdg=
X-IronPort-AV: E=Sophos;i="5.70,507,1574146800"; 
   d="scan'208";a="4205011"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Mar 2020 11:08:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Mar 2020 11:07:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 2 Mar 2020 11:07:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P5k44vk8JAEpihlz5cSXkqX5z5SII2dbbL+VWl6yaRrhE7bVrbYUkFWEO75l8Ea65mMq3fUPC/mn8DP1EkXi25nGQRJ7XDp+QnBFt18ka9e9Xw/la61UGLGTBJHc2+bj1ZmWYMbjk6qzNdisp6cr9S3AGlF7hJp0djBxWFafl87CzHq/+oLmw+CkPrv/OZR8sURSKSUGGxw1NSRI7J484oasJCklIyHkgktoyl1H0cHnMQz3cc7EfItd8QBNRvSzqwefnTTHMZmY/g6FWtHhh1xg+Q/nqQtJXJCIARVZnygWC3OfYriQeQ/BJu29xDbBUVuP+Ymkf9QsGX2uvE2aJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbT1iJuoyTSO2a+8nx4R0QiZBIx/d3ykp1QcMd3vGX4=;
 b=oKX/yyRYn2vGOGCmiTpSfnZhIzbrwkOvVIRmEOKOM5BXAMs+v001pC8ndKpfE68IKeWKyrh5YgVKxURDgX7K3u5PiVKsoGAFF+g1N7rhAhsdvqZGOaiXwXhxDIIaWrZof/O2BCBFHngS38QXbrqkjya8z5YOHY8Ldvt+Io38duYei4yICeeEZ+6kPQmRxlChFjFHgT0g3N1+yG2/F03V4rNtr53h2MjOMOUIa8yMOQt1X7LpBW0kWmkiOYbrSdeCNNxwDGJe+ey0hnLF30c5bnLz7XdDZVnieY1vruPpM0xCzxlsfWf06q1rYA9XhyrN3PRg1gpDrcl8aZ6Z0a1poQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbT1iJuoyTSO2a+8nx4R0QiZBIx/d3ykp1QcMd3vGX4=;
 b=JRKZQEBVYt4hIhkxj4EqDM2W2mgo96RNXTEG+O0GbTneNXwya4ROYvY21qBHRkhC5wkZY+s+KZT/NIK5JCGo4oryt/TttEfaWGBx45nwgUeH5boPO1ZJOR5deHHK6Yzs5gsqhqx4QEmDYacz/qrHTvoIcyH1IzWUd5iCg8uN/fc=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (2603:10b6:208:193::29)
 by MN2PR11MB4142.namprd11.prod.outlook.com (2603:10b6:208:135::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Mon, 2 Mar
 2020 18:07:54 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2772.019; Mon, 2 Mar 2020
 18:07:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <bbrezillon@kernel.org>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 16/23] mtd: spi-nor: Move Spansion bits out of core.c
Thread-Topic: [PATCH 16/23] mtd: spi-nor: Move Spansion bits out of core.c
Thread-Index: AQHV8L1+il5WgLrsDUmvjceoXNKuXg==
Date: Mon, 2 Mar 2020 18:07:53 +0000
Message-ID: <20200302180730.1886678-17-tudor.ambarus@microchip.com>
References: <20200302180730.1886678-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200302180730.1886678-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 383a0376-635f-46a0-d5a2-08d7bed4a156
x-ms-traffictypediagnostic: MN2PR11MB4142:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB414201A05042883DA8158BE2F0E70@MN2PR11MB4142.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 033054F29A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(39860400002)(136003)(396003)(376002)(189003)(199004)(36756003)(26005)(66446008)(107886003)(6486002)(186003)(2616005)(4326008)(478600001)(6512007)(91956017)(64756008)(66946007)(2906002)(71200400001)(76116006)(8936002)(316002)(86362001)(54906003)(6506007)(66556008)(5660300002)(66476007)(7406005)(1076003)(7416002)(81156014)(81166006)(110136005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4142;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OPXGHvK5Ogl326Vq5x+lE5XeFsEBGEfhwm9ZYFbevOXnyYsHT/qKIj0aGd4VbuxvAi+9Q+rKpLcZ7mONF0EdEM6OztEGtluAYHf4Y7mTt+riD/bf6kup9LJJQdoAPiXJx9o3JwmlL6VLAOWAwPu8Qx8rYHMtCVRjA+b8qmPknYPvwn9q+9Cg/OI1JGbOqaaUFdHwVEshgD2/wV3Cl04GLbmZOc8bk/ePXPKJ1zhxf0PZIK/4SK2QhHSTP717gntxkv19+qun4jvNok0eOkaiMP8LyeBtT9LX2Ba9FJeze43tFa8e6lQq+2blWh1I55W7SZRUV4q8yQK3Ndbph3jxrq0sT1KIDw6pD2eb6JYaSbrtsPVjvDsJugn954T8+LTQYzh8mvMh84hrybnoaQmvOYvdOuFFgsQuhPjV0iKdZJ65yIWK693Rm+USLmV7eYzE
x-ms-exchange-antispam-messagedata: RDxaFHgWwpQ2Mjr36qFEctoZBiiJefubUxuF4wlKORb0BViitPxV/xURi8I/d4ZUpUlxsaf0bB4gDemmhXWQWynEO/+jW/egWNYnlGKUuPdvSGpfRPNDppBnvJq80J0j/4dtQ6IphJba2H1pnJCgMg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 383a0376-635f-46a0-d5a2-08d7bed4a156
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2020 18:07:53.7675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MfV4B84LB+0d6IcHo16ZZP5qdu9EcOO8DE4l3UaHF1zhDgQRuAhWDn9F+pFOmbRuf2846qeeA6SoUP82qdNqmLsN1fTI4iLoR2/F7Xm+ZcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_100829_539910_33A57A4B 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: kstewart@linuxfoundation.org, alexandre.belloni@bootlin.com,
 linux-aspeed@lists.ozlabs.org, thor.thayer@linux.intel.com,
 jethro@fortanix.com, rfontana@redhat.com, miquel.raynal@bootlin.com,
 opensource@jilayne.com, richard@nod.at, michal.simek@xilinx.com,
 Ludovic.Desroches@microchip.com, joel@jms.id.au, nishkadg.linux@gmail.com,
 Tudor.Ambarus@microchip.com, john.garry@huawei.com, vz@mleia.com,
 alexander.sverdlin@nokia.com, matthias.bgg@gmail.com, tglx@linutronix.de,
 swboyd@chromium.org, mika.westerberg@linux.intel.com, allison@lohutok.net,
 linux-arm-kernel@lists.infradead.org, andrew@aj.id.au,
 Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 michael@walle.cc, ludovic.barre@st.com, linux-mediatek@lists.infradead.org,
 info@metux.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <bbrezillon@kernel.org>

Create a SPI NOR manufacturer driver for Spansion chips, and move the
Spansion definitions outside of core.c.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/Makefile   |  1 +
 drivers/mtd/spi-nor/core.c     | 59 +--------------------
 drivers/mtd/spi-nor/core.h     |  1 +
 drivers/mtd/spi-nor/spansion.c | 95 ++++++++++++++++++++++++++++++++++
 4 files changed, 98 insertions(+), 58 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/spansion.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index c7e5fb908bec..cb06ee50bf68 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -11,4 +11,5 @@ spi-nor-objs			+= intel.o
 spi-nor-objs			+= issi.o
 spi-nor-objs			+= macronix.o
 spi-nor-objs			+= micron-st.o
+spi-nor-objs			+= spansion.o
 obj-$(CONFIG_MTD_SPI_NOR)	+= spi-nor.o
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8d54dfe33cdc..448717543d1e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2017,44 +2017,6 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
  * old entries may be missing 4K flag.
  */
 static const struct flash_info spi_nor_ids[] = {
-	/* Spansion/Cypress -- single (large) sector size only, at least
-	 * for the chips listed here (without boot sectors).
-	 */
-	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64,
-			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
-			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
-	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
-			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | USE_CLSR) },
-	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
-	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
-	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
-	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
-	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
-	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
-	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
-	{ "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
-	{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
-	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
-	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ) },
-	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
 	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
@@ -2173,6 +2135,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_macronix,
 	&spi_nor_micron,
 	&spi_nor_st,
+	&spi_nor_spansion,
 };
 
 static const struct flash_info *
@@ -3106,17 +3069,6 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
 }
 
-static void spansion_post_sfdp_fixups(struct spi_nor *nor)
-{
-	if (nor->params.size <= SZ_16M)
-		return;
-
-	nor->flags |= SNOR_F_4B_OPCODES;
-	/* No small sector erase for 4-byte command set */
-	nor->erase_opcode = SPINOR_OP_SE;
-	nor->mtd.erasesize = nor->info->sector_size;
-}
-
 static void s3an_post_sfdp_fixups(struct spi_nor *nor)
 {
 	nor->params.setup = s3an_nor_setup;
@@ -3134,15 +3086,6 @@ static void s3an_post_sfdp_fixups(struct spi_nor *nor)
  */
 static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
 {
-	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_SPANSION:
-		spansion_post_sfdp_fixups(nor);
-		break;
-
-	default:
-		break;
-	}
-
 	if (nor->info->flags & SPI_S3AN)
 		s3an_post_sfdp_fixups(nor);
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 7e3ec8e4ef34..8e45617578f3 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -178,6 +178,7 @@ extern const struct spi_nor_manufacturer spi_nor_issi;
 extern const struct spi_nor_manufacturer spi_nor_macronix;
 extern const struct spi_nor_manufacturer spi_nor_micron;
 extern const struct spi_nor_manufacturer spi_nor_st;
+extern const struct spi_nor_manufacturer spi_nor_spansion;
 
 int spi_nor_write_enable(struct spi_nor *nor);
 int spi_nor_write_disable(struct spi_nor *nor);
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
new file mode 100644
index 000000000000..16683983a20e
--- /dev/null
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info spansion_parts[] = {
+	/* Spansion/Cypress -- single (large) sector size only, at least
+	 * for the chips listed here (without boot sectors).
+	 */
+	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64,
+			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      USE_CLSR) },
+	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
+			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      USE_CLSR) },
+	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
+	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     USE_CLSR) },
+	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
+			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | USE_CLSR) },
+	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256,
+			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      USE_CLSR) },
+	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
+	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
+	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
+	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     USE_CLSR) },
+	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256,
+			     SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     USE_CLSR) },
+	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
+	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
+	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
+	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
+	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
+	{ "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
+	{ "s25fl116k",  INFO(0x014015,      0,  64 * 1024,  32,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, SECT_4K) },
+	{ "s25fl164k",  INFO(0x014017,      0,  64 * 1024, 128, SECT_4K) },
+	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8,
+			     SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16,
+			     SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     SPI_NOR_4B_OPCODES) },
+	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     SPI_NOR_4B_OPCODES) },
+	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
+			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			     SPI_NOR_4B_OPCODES) },
+};
+
+static void spansion_post_sfdp_fixups(struct spi_nor *nor)
+{
+	if (nor->params.size <= SZ_16M)
+		return;
+
+	nor->flags |= SNOR_F_4B_OPCODES;
+	/* No small sector erase for 4-byte command set */
+	nor->erase_opcode = SPINOR_OP_SE;
+	nor->mtd.erasesize = nor->info->sector_size;
+}
+
+static const struct spi_nor_fixups spansion_fixups = {
+	.post_sfdp = spansion_post_sfdp_fixups,
+};
+
+const struct spi_nor_manufacturer spi_nor_spansion = {
+	.name = "spansion",
+	.parts = spansion_parts,
+	.nparts = ARRAY_SIZE(spansion_parts),
+	.fixups = &spansion_fixups,
+};
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
