Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F5DC3DA49
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 08:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nawPOAiSEXRD76yJm9BdLKc9kCACo5mgqMLMdiQY1WA=; b=hLaHQiu1Z0y/pp
	sVQjup7XLtHBQPbAZ0D9txBKdKqR3gLC1yPJL1b43z9rXAB2TEzig78Q3BhiGIFyfsVWqFQrB1geD
	Wc+KsZdN78x5hhODY5FNEZ7wR8cOIso3slDfsL/Jz5DU25jRxjcZ9IMG9ZiT3uEJ1x/c5VQgvTZTy
	QvK+u1Rz5z1fnRbSsPApNUW9DtlyrZXo5xaMIAiAd6TqxvgbxWlcB9vXNmHZcorZTwaOmkMVhq1rd
	l62JPZEEST7jiq7TpsfblSgGI7tezTcqSXJXZgJUHh04P1zSjviLr60aKCxcL0P9nGbLU5/ZZTe6K
	wkKZtMRcJpM0LhVIrgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUMyC-0000000GUs5-34Cm;
	Thu, 18 Jul 2024 08:58:36 +0000
Received: from mx0a-00300601.pphosted.com ([148.163.146.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUMy9-0000000GUpM-3WzA
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 08:58:35 +0000
Received: from pps.filterd (m0359308.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I8XTKk009511;
	Thu, 18 Jul 2024 08:57:53 GMT
Received: from usgdcecpmsgae02.extemr.org ([144.191.128.198])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 40exwq18mr-18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 08:57:53 +0000 (GMT)
Received: from usgdcecpmsgap04.emrsn.org (10.16.75.145) by mail.emerson.com
 (10.16.11.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 18 Jul
 2024 08:58:50 +0000
Received: from usgdcecpmsgap03.emrsn.org (10.16.75.148) by
 usgdcecpmsgap04.emrsn.org (10.16.75.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Jul 2024 08:57:27 +0000
Received: from 5QFXWL3.emrsn.org (10.19.249.15) by Inetmail.emrsn.net
 (10.16.75.148) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11 via Frontend
 Transport; Thu, 18 Jul 2024 08:57:26 +0000
Date: Thu, 18 Jul 2024 10:57:24 +0200
From: <claus.fabig@emerson.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Subject: [PATCH] mtd: spi-nor: add support for MRAM Everspin EM008LXB
Message-ID: <ZpjY9APb+VdiFO0q@5QFXWL3.emrsn.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: v-0U3i_2ByPejOrGBivh_emSo_R_hcd-
X-Proofpoint-GUID: v-0U3i_2ByPejOrGBivh_emSo_R_hcd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_05,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1011
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407180056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_015833_912056_77B690BA 
X-CRM114-Status: GOOD (  17.84  )
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

From: Claus Fabig <claus.fabig@emerson.com>
Date: Thu, 18 Jul 2024 09:53:36 +0200
Subject: [PATCH] mtd: spi-nor: add support for MRAM Everspin EM008LXB

The Everspin EM008LXB MRAM has 8Mb and is populated on a custom board
using Microchip's PCI12000 spi host controller running on low 30MHz clock.
According to Everspin Read Fast (0xb) command below 60MHz is neither
specified and nor tested. Test shows that using Read Fast (0xb) will
result in reading inconsistent data in this setup but writing is fine, so
only supporting Read (0x3) command should be acceptable for the moment.
The device is JEDEC compatible (JESD251 and JESD251-1) but not able to
provide SFDP information.

For spec v3.2 refer to www.everspin.com/file/158315/download.

Successfully tested according to
www.kernel.org/doc/html/latest/driver-api/mtd/spi-nor.html:

cat /sys/bus/spi/devices/spi-EMR5555\:00/spi-nor/partname
em008lxb

cat /sys/bus/spi/devices/spi-EMR5555\:00/spi-nor/manufacturer
everspin

cat /sys/kernel/debug/spi-nor/spi-EMR5555\:00/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode        0x03
  mode cycles   0
  dummy cycles  0

Supported page program modes by the flash
 1S-1S-1S
  opcode        0x02

cat /sys/kernel/debug/spi-nor/spi-EMR5555\:00/params
name            em008lxb
id              (null)
size            1.00 MiB
write size      1
page size       256
address nbytes  3
flags           HAS_SR_TB | HAS_16BIT_SR | HAS_4BIT_BP | HAS_SR_BP3_BIT6

opcodes
 read           0x03
  dummy cycles  0
 erase          0xd8
 program        0x02
 8D extension   none

protocols
 read           1S-1S-1S
 write          1S-1S-1S
 register       1S-1S-1S

erase commands
 d8 (1.00 MiB) [0]
 c7 (1.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-000fffff |     [0   ] | no

cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00020000 00020000 "spi-EMR1010:00"
mtd1: 00100000 00100000 "spi-EMR5555:00"

mtd_debug info /dev/mtd1
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 1048576 (1M)
mtd.erasesize = 1048576 (1M)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0

dd if=/dev/urandom of=spi_test bs=1M count=1
mtd_debug erase /dev/mtd1 0 1048576
mtd_debug read /dev/mtd1 0 1048576 spi_read
Copied 1048576 bytes from address 0x00000000 in flash to spi_read
hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0100000
sha256sum spi_read
f5fb04aa5b882706b9309e885f19477261336ef76a150c3b4d3489dfac3953ec  spi_read
mtd_debug write /dev/mtd1 0 1048576 spi_test
Copied 1048576 bytes from spi_test to address 0x00000000 in flash
mtd_debug read /dev/mtd1 0 1048576 spi_read
Copied 1048576 bytes from address 0x00000000 in flash to spi_read
sha256sum spi*
cf9a1f3f4089602d194d67d1a918a574a5ca1d9aa71d391a661818c1f0ee1aab  spi_read
cf9a1f3f4089602d194d67d1a918a574a5ca1d9aa71d391a661818c1f0ee1aab  spi_test

Signed-off-by: claus.fabig@emerson.com
---
 drivers/mtd/spi-nor/core.c     | 2 +-
 drivers/mtd/spi-nor/everspin.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e0c4efc424f4..95267d9e8b65 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3713,7 +3713,7 @@ static const struct spi_device_id spi_nor_dev_ids[] = {
 	{ "mr25h256" }, /* 256 Kib, 40 MHz */
 	{ "mr25h10" },  /*   1 Mib, 40 MHz */
 	{ "mr25h40" },  /*   4 Mib, 40 MHz */
-
+	{ "em008lxb" }, /*   8 Mib, 133 MHz */
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, spi_nor_dev_ids);
diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspin.c
index add37104d673..c1f004c39c1c 100644
--- a/drivers/mtd/spi-nor/everspin.c
+++ b/drivers/mtd/spi-nor/everspin.c
@@ -31,6 +31,11 @@ static const struct flash_info everspin_nor_parts[] = {
 		.size = SZ_512K,
 		.sector_size = SZ_512K,
 		.flags = SPI_NOR_NO_ERASE,
+	}, {
+		.name = "em008lxb",
+		.size = SZ_1M,
+		.sector_size = SZ_1M,
+		.flags = SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6,
 	}
 };
 
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
