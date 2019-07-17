Return-Path: <SRS0=DY/e=VO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2F9C76186
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2019 11:31:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63A6B20880
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2019 11:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eb/ZDHGn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="gOg5zRJv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63A6B20880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSQN2UrBDril/jInxZKtq/x1kp62AxbPxrZ87GvFqs0=; b=eb/ZDHGnYbJXWF
	8ed8MUGlXC1QxWRO1RTn9LgkiDGEjysKTX2JIFrQoqXNQLGDC+P7qahdQbsQ8qDFC1QxxErTsKYme
	/7e9Y6CNz7tg0cwREvUDk7cWQ2PT8S82FcsOB8TzP80+stn06SrPslaCsss7jT1+m19w0USr8KbGt
	V0ZhMz8p8tin32dN1N9zqtciJFT0aAWvE3p9m38TsgdprMbOR3/hQ5eH4bB4ZL258BcGRw9zuFJ7o
	BCZhQ57C9fo11GIM1OQu/XZ+GtHBhTgOn5Or/2A5Sfyv6a+GWDkJxGzzEdJTCtseOhGpAcu+ucYaI
	zNy50CcPLm1/telGqvlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hni9P-0004es-8F; Wed, 17 Jul 2019 11:31:11 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hni9M-0004dx-Af
 for linux-mtd@lists.infradead.org; Wed, 17 Jul 2019 11:31:09 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: kp3RKACexQj7Mygoj0cCkv2sOf6P0suKxe/wjHOrANgijPPu5gHn1lvFx4DVp/q6hN5WtBEfqG
 tRxgdoHtOUHjX80neyKiyKnR2+eBJBVoDY6Qi6etkjUJyRmu+M1BMuY/pJJZngThKOxktetFrx
 g9wraeuUuz6bVsylgkGz4QtxBUiY4ZDbWEGfoE0qiZSne755IahVzmKbpk+GstM7OHf3zPpR9/
 6BQ1GmtKBBc8EF70ofYrJxKgkioWyW/tbXMivKRZahaq4IfnKVT0fQZV8LhZxbtJp5H+NmZjci
 oHY=
X-IronPort-AV: E=Sophos;i="5.64,274,1559545200"; d="scan'208";a="39993641"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jul 2019 04:31:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 17 Jul 2019 04:31:01 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 17 Jul 2019 04:31:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4vHUngWo84wW1/dgtf/khq0lAD7Br60lmTyZMnDUSJntcghFrnUWnNwd+aCJ5TvOUgkmbaazCSflisxo1oLEZ3hSSRp5N+oTVrYsuk402gOYIYp2cpaOD+WLKrbXu6ApBZGRR3jJr4MPb1dnJ+p0dkqee+FSXTQvCGRQIqL6dRcP7f/F3x+96iunqISaAHUfclLUWbej9s7GJi5qurenZwx65rK6sLnOhpIhC082eEZ7sUx0CckjsSVhJ06lRtRMuewM90KpYvmTrZsFAzDiykAfYj95xRkMWWfswb6E9sB2oqP6wAyjtbxsnIOVCGMkx8cITT+BeZtODJari4vbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRz0pcwD5gXZDuQ4BhKs/hsrp1g6wDkg7BTH72UuFuo=;
 b=QL+6Y5rSEpKDAPlyc+2GG7vN7oT9rDNyWmvVY8O5tMelLHOrKNXmPT6rHxLoRaH9st23rq8FRh3BhWuQ6k0DFZhDaTChFah4wE4Toj13eT2dEd80v9aroaKtLDMQnodGaAUL6Avrg/4CnSKdHCagW4Y0bXR18BXurYPvu+lTfnDYVzdRFo+hiiQ/X09HSY6txABsj+L/b1foMt/tPHnsyh+2LVpkGylAlYK0Ss7b2Bvp7uug/l3pMgJo33uv7jzVfd4xzNz1RHsf2+BP6IbM2m3KXOURVsjhPICVXE+x+13PD9UYeUV1++4wUhdTwWiZBFzG+PQeqLCrsBGQWbtmZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRz0pcwD5gXZDuQ4BhKs/hsrp1g6wDkg7BTH72UuFuo=;
 b=gOg5zRJvz3ZklS812WWrH30Ba/Nz1bXNhQwNLEa6aHBWFqXlYCPv3aITPtd9ZUNkHMD4beAKMTGskERtPg7oaMO0fdkTJvSmJz4kNz7cHFT9xOJnnMtkz28zztailVu9SO4BAZGzvWhik+zDgejEh5UvuIvqg58VZz0dUhVXHK8=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB0017.namprd11.prod.outlook.com (10.161.157.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 11:30:58 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::6515:912a:d113:5102]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::6515:912a:d113:5102%12]) with mapi id 15.20.2073.012; Wed, 17 Jul
 2019 11:30:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <marek.vasut@gmail.com>
Subject: [PATCH v2 5/5] mtd: spi-nor: add Kconfig option to disable write
 protection at power-up
Thread-Topic: [PATCH v2 5/5] mtd: spi-nor: add Kconfig option to disable write
 protection at power-up
Thread-Index: AQHVPJMakV1xa3A5rUOQXW8L9Q6KDg==
Date: Wed, 17 Jul 2019 11:30:58 +0000
Message-ID: <20190717113047.32596-1-tudor.ambarus@microchip.com>
References: <0fc5d3bb-aa11-2816-4734-75dc86deb0d2@microchip.com>
In-Reply-To: <0fc5d3bb-aa11-2816-4734-75dc86deb0d2@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0802CA0008.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::18) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0f0464f-786c-4a5c-bdef-08d70aaa3d00
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB0017; 
x-ms-traffictypediagnostic: BN6PR11MB0017:
x-microsoft-antispam-prvs: <BN6PR11MB0017A560D99524A26ED4A4F5F0C90@BN6PR11MB0017.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(136003)(396003)(346002)(376002)(199004)(189003)(2501003)(68736007)(8936002)(36756003)(66066001)(3846002)(86362001)(486006)(81156014)(81166006)(71190400001)(71200400001)(186003)(305945005)(256004)(478600001)(50226002)(14444005)(99286004)(6116002)(110136005)(5660300002)(4326008)(64756008)(66446008)(76176011)(7736002)(6436002)(102836004)(476003)(66946007)(386003)(26005)(25786009)(14454004)(6506007)(11346002)(446003)(66556008)(107886003)(1076003)(316002)(53936002)(8676002)(52116002)(2906002)(2616005)(54906003)(6512007)(66476007)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB0017;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /R6yGv0Ul2xu9/wZATxkHCbbyrlDDyJvDUqcPf5C0wZFbrCynZXX3PuZuLFO04zA/MZQN3+p2UYttGHce9JBuSoKd7jLtgo/k2R/nxRFl4VnkOMXB1r7jZ1i3zTZx/f4RC9f8CqY8hBZ4mvOgSVzUgV6ICAHGYrOVORdZbPFQMTK8wLCpUQNil11e+uTO/WDF0z+y1VNdeUNHtIuX753JAgzCjh+O8thNptgS8nVGVstss/Lb/8ICLGQ2bTGxgZ6X+9XfPRvNnkqpQXuZHt4MvYl1VzVvdvr3jTS++7zemtUgy2zLvPIKGxJijYXzsxXNqSyIbYcZtMaGkCLIjJYt7zHnQDYVVXRvu9eWkCNgrZqeJhfldseflWtajSo6f5e+v/yQjFa16DoAZbSpwr1CutMKNPHrAAAQuUhHjjUhFY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f0464f-786c-4a5c-bdef-08d70aaa3d00
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 11:30:58.3400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190717_043108_485520_796EC9BD 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: Tudor.Ambarus@microchip.com, richard@nod.at, linux-kernel@vger.kernel.org,
 Nicolas.Ferre@microchip.com, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Some spi-nor flashes come write protected by default after a
power-on sequence to avoid destructing commands (erase, write)
during power-up.

Backward compatibility imposes to disable the write protection
at power-up by default. Add a Kconfig option to let the user
benefit of the power-up write protection.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v2: mark spi_nor_spansion_clear_sr_bp() and
spi_nor_unlock_global_block_protection() definitions as __maybe_unused,
to avoid -Wunused-function warnings when
MTD_SPI_NOR_DISABLE_POWER_UP_WRITE_PROTECTION is not selected.

 drivers/mtd/spi-nor/Kconfig   | 8 ++++++++
 drivers/mtd/spi-nor/spi-nor.c | 7 +++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 6de83277ce8b..b550e10657f1 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -22,6 +22,14 @@ config MTD_SPI_NOR_USE_4K_SECTORS
 	  Please note that some tools/drivers/filesystems may not work with
 	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
 
+config MTD_SPI_NOR_DISABLE_POWER_UP_WRITE_PROTECTION
+	bool "Disable write protection during power-up"
+	default y
+	help
+	   Some spi-nor flashes are write protected by default after a power-on
+	   reset cycle, in order to avoid inadvertend writes during power-up.
+	   Disable the write protection during power-up.
+
 config SPI_ASPEED_SMC
 	tristate "Aspeed flash controllers in SPI mode"
 	depends on ARCH_ASPEED || COMPILE_TEST
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ffb53740031c..9b948295ef27 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1684,7 +1684,7 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
+static int __maybe_unused spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
 {
 	int ret;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
@@ -1726,7 +1726,8 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
 	return spi_nor_clear_sr_bp(nor);
 }
 
-static int spi_nor_unlock_global_block_protection(struct spi_nor *nor)
+static int __maybe_unused
+spi_nor_unlock_global_block_protection(struct spi_nor *nor)
 {
 	int ret;
 
@@ -4049,6 +4050,7 @@ static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
 
+#ifdef CONFIG_MTD_SPI_NOR_DISABLE_POWER_UP_WRITE_PROTECTION
 	/*
 	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
 	 * with the software protection bits set.
@@ -4082,6 +4084,7 @@ static int spi_nor_init(struct spi_nor *nor)
 			return err;
 		}
 	}
+#endif
 
 	if (nor->quad_enable) {
 		err = nor->quad_enable(nor);
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
