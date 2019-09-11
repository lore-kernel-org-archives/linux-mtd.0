Return-Path: <SRS0=ZCmB=XG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63FBC49ED6
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 09:43:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4E482067B
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Sep 2019 09:43:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZiiYIof5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="kDJ1DdtN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4E482067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwepl1/pkGykwJNQaWwQUFOXqtmTaG66ufu8c6W2fGc=; b=ZiiYIof5VRTnu4
	hhX+xlinVbWdWgQo3kFo4FGkuAevl5TMClbN6RUhM/yoczmQbNn7oiaHXZpXX00JmOaXEPfW/rocp
	OrZcykp0eNKyJckrz1oCvlGNST5quFWzUUWo+1crVh1W9GpTkphgIo0eQdgI3qW+hHvtYQ9CUkqB2
	hhSha26sxBwe14U2ks5JkYs5t7hIRO6bdjiiL17e2mS0rg2T5Usq6qpzNYwDgf+WhJdlI8L8gx59C
	kt0RkaVu5Lhz2FDs305Tf636Ten0lsPFb4uw6jOC3peqt3vrWNR9zHT4oKECJBLt66PjB4sXSuoyN
	csoZBvgQd+FLn7Y1PO4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7z9V-0003By-5T; Wed, 11 Sep 2019 09:43:05 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7z7Z-0001bz-0R; Wed, 11 Sep 2019 09:41:06 +0000
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
IronPort-SDR: SizrrDUj/gyLo9PLit0Ybwl3V0n2hVLcP1pqHIweRxyjCgJiJyIpG6tuzweKBlG6NQtANOiXqq
 hTgPFUgJWGorwl/hxJR0QNE8UzuQAoKo/a81u+lKxWRhR83H58mFD3XzuYHAK/bpDVxs2AWZPg
 pYsfjlseflEHoAqJi+bp7ZJ4jJRMGkW7fi7dVOxUDSL29Nk75sDO/k0AGIRpnrAvZSrFcPLLHT
 MgKLItx5QvNgLoknUoQgF1KfPYBIHVT1bJff6Jg2Z8R5hlVPpw5Ek2lRwFs6tcf0pbWLOXEXHQ
 FOU=
X-IronPort-AV: E=Sophos;i="5.64,493,1559545200"; d="scan'208";a="48492528"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Sep 2019 02:41:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 11 Sep 2019 02:41:02 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 11 Sep 2019 02:41:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8lt88UBDl8XS28j8ZiaHwE5Ti23lMjbNSKX8PpH0glxFRD0Fd5Dc5oHPO251T4799Sy6XNKi/+pQq0MqMh5/sbGvToqQk0Ix4V3YA911A5JAaOPjJhPEx22VyZIOhgX9uDuKLet04HblrAgKU8qhvtit9PuLrTYqEZh1AHjO9UbowrC5fGpBzBWKEU8VLf8ANqNx2e+6mi6RXcXlkNubxqSXka/ZI44wKjQlhUvJbskLcbhUftV1ibiodNGerXdrvlEZYmeVVzjcQOnczhQKO8raoSVy++d8kZOVVxGBtauCqrU0dPzeGAA5lPpWvRImdV3Vcb3kabGftphQZjg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUpIXUhu4RWe3t8N62fzh1utHw8yXcX0oBC2Sh90kM8=;
 b=EN1/kYXjQ4qhoNSgwdQ4L7VHsEbxJTnyFvH1R78/T/fSPDG2EUrLZp1I0qdpUxlpGQsIq1/8uRUCJOs2/TnNHPZgL7qv4dDP2TVoaFGfc6ABTgij2pKYBQ8gabiXmw3UciOA7NRWtfoNeR1OmzLMXBefDsverqJE6cy1oE0jUakEVncu9KBB4Tv5LMSemyxeqNXosmrbsjqxQC16eWX60S1xrdUnIGv53QNhQn5y6kBgC73141Eick+RhIpdoSifgZBI7WGp5MIeMhHFz5Py8wyyCfiNxdxTiVLCCtVrs9pV1U0LI4X5aeQY2hgK7gTq0xcEUyx7UR+iMW5Sm7PXaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUpIXUhu4RWe3t8N62fzh1utHw8yXcX0oBC2Sh90kM8=;
 b=kDJ1DdtNPxzv5iHvpRwWNyNLjUgzjtBh2h8Y0FsC2799KPAkXuEwuNmk8jtxIjjlJAdiMzIMfAdgQkvtoe/TwgrhWROsdPddrB/1v+Inp07WZXef8pRccuXdHQwr1kHZchG/UyK3/uLRVxeKPqO8FUuA2nMA5CpvWloP722zYPc=
Received: from BY5PR11MB4435.namprd11.prod.outlook.com (10.255.89.94) by
 BY5PR11MB4401.namprd11.prod.outlook.com (52.132.253.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Wed, 11 Sep 2019 09:41:00 +0000
Received: from BY5PR11MB4435.namprd11.prod.outlook.com
 ([fe80::4049:4ab3:1825:469b]) by BY5PR11MB4435.namprd11.prod.outlook.com
 ([fe80::4049:4ab3:1825:469b%3]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 09:41:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <matthias.bgg@gmail.com>, <vz@mleia.com>, <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 05/13] mtd: spi-nor: Rework read_sr()
Thread-Topic: [PATCH 05/13] mtd: spi-nor: Rework read_sr()
Thread-Index: AQHVaIUFGu6v4Jt/nESchwznVdL01w==
Date: Wed, 11 Sep 2019 09:41:00 +0000
Message-ID: <20190911094031.17615-6-tudor.ambarus@microchip.com>
References: <20190911094031.17615-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190911094031.17615-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0118.eurprd09.prod.outlook.com
 (2603:10a6:803:78::41) To BY5PR11MB4435.namprd11.prod.outlook.com
 (2603:10b6:a03:1ce::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b15005a5-bad8-4436-8575-08d7369c2764
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR11MB4401; 
x-ms-traffictypediagnostic: BY5PR11MB4401:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4401F4AA378E01C3680BFEA1F0B10@BY5PR11MB4401.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(376002)(136003)(366004)(189003)(199004)(1076003)(53936002)(6512007)(102836004)(478600001)(14444005)(256004)(36756003)(26005)(25786009)(4326008)(5660300002)(186003)(2616005)(476003)(11346002)(446003)(486006)(107886003)(2201001)(305945005)(3846002)(66066001)(71190400001)(14454004)(50226002)(76176011)(110136005)(66946007)(71200400001)(7736002)(66446008)(64756008)(316002)(66556008)(66476007)(99286004)(8676002)(52116002)(8936002)(6116002)(81166006)(7416002)(2501003)(6436002)(386003)(81156014)(6486002)(6506007)(2906002)(86362001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4401;
 H:BY5PR11MB4435.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hg5Yr3J30CsNJTPe7BXn6KEEzEVtkTiD6Bh3YIG9VwEoc3caoDsqlbBPPW4TAX3pSgl71b9jEolCnAd1kYhj+PGYssLTe9brqAwy+GI7ulQ8+gB2A0WU0KsUNJ+ummNzhYXqzfKWfh4ZuaUcaVPu2B1uHCCA+wjLw8lgQCN8BXCfa8jZmr71To/V3MZbCvTVaiKZE7uXuq7SWrAhG8j0M25SmGRJ6aEYrnz12LZXgSpAefNNRLq9bW+ge6wJcN+HOoLm9yv/XkENGGHYl6nbGriewJh59d+aHZdn5XaY+wVTrOaTd901fclWkdccvoKGiP/JflsjOuUYSjMocwPQRe08FwgwcqH7pHzgdJvKAZTL4jItqQaqNSU1EHAozF2cuWjzHjmWkCXOFhyx9mszirFdmHY/5FasaylWAaJEmKo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b15005a5-bad8-4436-8575-08d7369c2764
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 09:41:00.2830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ldaBZDl0+lfn4GGzcq+38PRSnwvYFqqw7svTVy7Za5WYMQrR0K+9zC63ixrbWV+OPV6KRIxFM1rA2yMo7fTuWF5cV1ldrz5O4FGpQBqoHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190911_024105_201666_D84142C8 
X-CRM114-Status: GOOD (  15.54  )
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
Cc: Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

static int read_sr(struct spi_nor *nor)
becomes
static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)

The new function returns 0 on success and -errno otherwise.
We let the callers pass the pointer to the buffer where the
value of the Status Register will be written. This way we avoid
the casts between int and u8, which can be confusing.

Prepend spi_nor_ to the function name, all functions should begin
with that.

S/pr_err/dev_err and drop duplicated dev_err in callers, in case the
function returns error.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 131 +++++++++++++++++++++---------------------
 1 file changed, 65 insertions(+), 66 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index bf9bd0b8c3e5..d3b48d06f2ed 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -388,12 +388,14 @@ static ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 	return nor->controller_ops->write(nor, to, len, buf);
 }
 
-/*
- * Read the status register, returning its value in the location
- * Return the status register value.
- * Returns negative if error occurred.
+/**
+ * spi_nor_read_sr() - Read the Status Register.
+ * @nor:        pointer to 'struct spi_nor'
+ * @sr:		buffer where the value of the Status Register will be written.
+ *
+ * Return: 0 on success, -errno otherwise.
  */
-static int read_sr(struct spi_nor *nor)
+static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 {
 	int ret;
 
@@ -402,20 +404,17 @@ static int read_sr(struct spi_nor *nor)
 			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR, 1),
 				   SPI_MEM_OP_NO_ADDR,
 				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_IN(1, nor->bouncebuf, 1));
+				   SPI_MEM_OP_DATA_IN(1, sr, 1));
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
-						    nor->bouncebuf, 1);
+		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR, sr, 1);
 	}
 
-	if (ret < 0) {
-		pr_err("error %d reading SR\n", (int) ret);
-		return ret;
-	}
+	if (ret)
+		dev_err(nor->dev, "error %d reading SR\n", ret);
 
-	return nor->bouncebuf[0];
+	return ret;
 }
 
 /*
@@ -752,12 +751,14 @@ static int spi_nor_clear_sr(struct spi_nor *nor)
 
 static int spi_nor_sr_ready(struct spi_nor *nor)
 {
-	int sr = read_sr(nor);
-	if (sr < 0)
-		return sr;
+	int ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
+
+	if (ret)
+		return ret;
 
-	if (nor->flags & SNOR_F_USE_CLSR && sr & (SR_E_ERR | SR_P_ERR)) {
-		if (sr & SR_E_ERR)
+	if (nor->flags & SNOR_F_USE_CLSR &&
+	    nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
+		if (nor->bouncebuf[0] & SR_E_ERR)
 			dev_err(nor->dev, "Erase Error occurred\n");
 		else
 			dev_err(nor->dev, "Programming Error occurred\n");
@@ -766,7 +767,7 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
 		return -EIO;
 	}
 
-	return !(sr & SR_WIP);
+	return !(nor->bouncebuf[0] & SR_WIP);
 }
 
 static int spi_nor_clear_fsr(struct spi_nor *nor)
@@ -1342,11 +1343,11 @@ static int write_sr_and_check(struct spi_nor *nor, u8 status_new, u8 mask)
 	if (ret)
 		return ret;
 
-	ret = read_sr(nor);
-	if (ret < 0)
+	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
+	if (ret)
 		return ret;
 
-	return ((ret & mask) != (status_new & mask)) ? -EIO : 0;
+	return ((nor->bouncebuf[0] & mask) != (status_new & mask)) ? -EIO : 0;
 }
 
 static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
@@ -1441,16 +1442,18 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	int status_old, status_new;
+	int ret, status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
 
-	status_old = read_sr(nor);
-	if (status_old < 0)
-		return status_old;
+	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
+	if (ret)
+		return ret;
+
+	status_old = nor->bouncebuf[0];
 
 	/* If nothing in our range is unlocked, we don't need to do anything */
 	if (stm_is_locked_sr(nor, ofs, len, status_old))
@@ -1521,16 +1524,18 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	int status_old, status_new;
+	int ret, status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
 
-	status_old = read_sr(nor);
-	if (status_old < 0)
-		return status_old;
+	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
+	if (ret)
+		return ret;
+
+	status_old = nor->bouncebuf[0];
 
 	/* If nothing in our range is locked, we don't need to do anything */
 	if (stm_is_unlocked_sr(nor, ofs, len, status_old))
@@ -1605,13 +1610,12 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
  */
 static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
-	int status;
+	int ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
 
-	status = read_sr(nor);
-	if (status < 0)
-		return status;
+	if (ret)
+		return ret;
 
-	return stm_is_locked_sr(nor, ofs, len, status);
+	return stm_is_locked_sr(nor, ofs, len, nor->bouncebuf[0]);
 }
 
 static const struct spi_nor_locking_ops stm_locking_ops = {
@@ -1718,24 +1722,28 @@ static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
  */
 static int macronix_quad_enable(struct spi_nor *nor)
 {
-	int ret, val;
+	int ret;
 
-	val = read_sr(nor);
-	if (val < 0)
-		return val;
-	if (val & SR_QUAD_EN_MX)
+	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & SR_QUAD_EN_MX)
 		return 0;
 
 	write_enable(nor);
 
-	write_sr(nor, val | SR_QUAD_EN_MX);
+	write_sr(nor, nor->bouncebuf[0] | SR_QUAD_EN_MX);
 
 	ret = spi_nor_wait_till_ready(nor);
 	if (ret)
 		return ret;
 
-	ret = read_sr(nor);
-	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
+	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
+	if (ret)
+		return ret;
+
+	if (!(nor->bouncebuf[0] & SR_QUAD_EN_MX)) {
 		dev_err(nor->dev, "Macronix Quad bit not set\n");
 		return -EINVAL;
 	}
@@ -1806,12 +1814,10 @@ static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
 	int ret;
 
 	/* Keep the current value of the Status Register. */
-	ret = read_sr(nor);
-	if (ret < 0) {
-		dev_err(nor->dev, "error while reading status register\n");
-		return -EINVAL;
-	}
-	sr_cr[0] = ret;
+	ret = spi_nor_read_sr(nor, &sr_cr[0]);
+	if (ret)
+		return ret;
+
 	sr_cr[1] = CR_QUAD_EN_SPAN;
 
 	return write_sr_cr(nor, sr_cr);
@@ -1849,12 +1855,9 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
 	sr_cr[1] = ret | CR_QUAD_EN_SPAN;
 
 	/* Keep the current value of the Status Register. */
-	ret = read_sr(nor);
-	if (ret < 0) {
-		dev_err(dev, "error while reading status register\n");
-		return -EINVAL;
-	}
-	sr_cr[0] = ret;
+	ret = spi_nor_read_sr(nor, &sr_cr[0]);
+	if (ret)
+		return ret;
 
 	ret = write_sr_cr(nor, sr_cr);
 	if (ret)
@@ -1965,15 +1968,13 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
 	int ret;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 
-	ret = read_sr(nor);
-	if (ret < 0) {
-		dev_err(nor->dev, "error while reading status register\n");
+	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
+	if (ret)
 		return ret;
-	}
 
 	write_enable(nor);
 
-	ret = write_sr(nor, ret & ~mask);
+	ret = write_sr(nor, nor->bouncebuf[0] & ~mask);
 	if (ret) {
 		dev_err(nor->dev, "write to status register failed\n");
 		return ret;
@@ -2019,13 +2020,11 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
 	if (ret & CR_QUAD_EN_SPAN) {
 		sr_cr[1] = ret;
 
-		ret = read_sr(nor);
-		if (ret < 0) {
-			dev_err(nor->dev,
-				"error while reading status register\n");
+		ret = spi_nor_read_sr(nor, &sr_cr[0]);
+		if (ret)
 			return ret;
-		}
-		sr_cr[0] = ret & ~mask;
+
+		sr_cr[0] &= ~mask;
 
 		ret = write_sr_cr(nor, sr_cr);
 		if (ret)
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
