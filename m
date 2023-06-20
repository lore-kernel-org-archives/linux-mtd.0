Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04F3EB64D7
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jun 2023 21:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DVm4QT2uaLK26XlanJUGUKngoWyvw03CUbRQqJXNuYw=; b=UoxTEjg5C3IISp
	SyOJXov9uERewI0fR3/VzGANWX/lWYdaGgh3tiS0tjenrqHwZvze7a7wMguTUgM55ow5Rfcpny5Ex
	H0+RQDbXz03UMiEhrWHf3UJfbNiSlEDWfQ7PQrt98nYwupWjhD8Y5lYLgNxzDkAVXY4REJEJM3P3L
	0D46LD59e1TaRhbSgjkfHhbnNvno83lZLJQe6vGd4oQ2UTCidJM+eE3VhHnknZPQbKCFpuT4HJnPJ
	O5W3Ra0kr/RHmhFzttEtXM1lKquPzxjqP5Raz2KpOA/U5Wjvu4zntaHjaZWreZfbMkUGSCh1ss06M
	idwNCfCA5ePKro7ot9ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBiiP-00CNAA-0v;
	Tue, 20 Jun 2023 21:16:41 +0000
Received: from mail-db5eur01olkn081f.outbound.protection.outlook.com ([2a01:111:f400:fe02::81f] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBiiL-00CN8o-3C
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jun 2023 21:16:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6wwnWyiBWbzVsAMyRjoMJKymo7sUZCpdsiAXZtRhmM8dMPiOaYbwL5K1rCAKAksDe5mYbS9vKDZ6EmxSfByHmUoj2zK6uiBwa/TZ9ezfNjoXvdlVzf9Kx2RoQDlJR1My9sAHevgoJQGrWSi2LAfjArlIBZabXf8F6BlR5NOil4+KfkcU4j9YWaevQNbSdwMLJmXrYO2n56UYebJMJBjUgAAZxiVstG5gSlnsRS2TnL3AiY7JdVeGuN+cje3WBuv7Z/4bqXyKV2nJpdg3n9W1VV13AfT51oVWW6tyCNiSDRlehDo3pdz2/FSXX7DkrrhSY4FIR8YVmf0JLOtOzFc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cE3e96piq7X65zG2IurrLR9KadGtCxg9FlH808RenjQ=;
 b=jag7Fb+FELdVFe5T6DvQqyLF7FSKiTgWDYs7djzFIY4alv4QOrZ3v2otjpOLSHfrUR2h3RzL1mApn5qgDOuH2ibuyswVJH2PpPav+pqtNaFSPbrN5PSd95rVIvOQSWgmIhJ5to/8Nie7/zSrSI+7Bqr/TtmEKGmo4eG7QNCTkagzYxbLfXfIpbxPYxXTVhv5Ip9pnNDsLlSdQNR1HHdLyRmHRbdQQRmLGfvytlI9SZDeBw4UCGBsZ1CX6jSckflsMsVjc7oxcGLkDI0ZE7UO/R0QG687GwxdXyLJ+yykzZeoplX3BffwUYJdr4Km6KIatCwSPxncpKG83wtDbNT40A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB4P250MB1032.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:3cc::7) by
 AS8P250MB0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:358::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.44; Tue, 20 Jun 2023 21:16:31 +0000
Received: from DB4P250MB1032.EURP250.PROD.OUTLOOK.COM
 ([fe80::1f3e:9e10:27b2:5ae4]) by DB4P250MB1032.EURP250.PROD.OUTLOOK.COM
 ([fe80::1f3e:9e10:27b2:5ae4%2]) with mapi id 15.20.6521.023; Tue, 20 Jun 2023
 21:16:31 +0000
From: Olivier Maignial <olivier.maignial@hotmail.fr>
To: 
Cc: olivier.maignial@somfy.com,
	Olivier Maignial <olivier.maignial@hotmail.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: winbond|toshiba: Fix ecc_get_status
Date: Tue, 20 Jun 2023 23:16:15 +0200
Message-ID: <DB4P250MB103296BD8C6C8CD514A46E83FE5CA@DB4P250MB1032.EURP250.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.34.1
X-TMN: [nPwspv7WqKfzL46xd6IDM5G+WcBW+2Cx1bjRLFu8rUcoTAeqTo62qpKkhY7X2DLCUs0YAuDTiIA=]
X-ClientProxiedBy: PA7P264CA0141.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:377::19) To DB4P250MB1032.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:3cc::7)
X-Microsoft-Original-Message-ID: <20230620211615.40054-1-olivier.maignial@hotmail.fr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4P250MB1032:EE_|AS8P250MB0029:EE_
X-MS-Office365-Filtering-Correlation-Id: a9609569-f44a-4600-4107-08db71d39e0e
X-MS-Exchange-SLBlob-MailProps: 7J/vb0KDx3jIOdPglS26yhP0UMaxzGvh1BRLql1gmMqxaFlLB+M9xiPXkROjndzCsLUOSwxPvtelowt1ok9XgmNbccM8IPeGvEgOAGYaN/14Q5ZOmPvSBh6qIVTHonIbfQLBOhIctpKza51wOx1aP3u8sGcH36FB1jaFuuswmHqAXUvRbf71M92vI+9I6bWeGC6R/bnLgORxl01HV+tNSSlVipEol8WeKRkX23Mprx0+zMcwmpnUf0RvWMdb+lT4nbAuu3kscRBtVQD1gqBrfVbl+Crs/MIloVDgX1YAif5gwU3Xz0iL5pyrJBFXjpNrFJgEsql912NQO1gLOuDaQwivlrZG837X8q1CAJsksvlory8lAMTeb9nIy4ayXIfno1pBh8dCtC3S7AZqSzofNGHaUXvy4c1KP29U8kgOgDE3ow/4O3RXrj1Yzx4Zb+Q2OMjZDNRNMtRenxmKjdOudripIzaSFcnq4Yhauh0UbawHO0UVvwFQmYytl2pR+7w93zs/9u9lQ3eB4OnoPmq5L/9uU3IBi4ax4a/nMyfqWnXPF+9lUmse4Bjg3YAeSytTMKU/lcqdutCazMlhObdJKpUa1zv6ZG1v5VFdatJwFO8gpecpymhA1P7v52xEl2BuorGcb1fkn6Yi3cylMnGBPJhh0fL6ZVCwPQH7/h1NUUuQAN7QJDcdTRYLqH4xbfrpxNdM3uZQ7GbUwQ26heVnATBCH+WdcjR67dn3wKwSads8mtcK4GcCZXKn1CKoIx9ljrilXMcUmVXDFCtAHX46FdImtW3sCt6ykkwN6WtjpfU=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sTj2Yc5q+1BS9rbyikRqOV6X/69rKfA+287XOiTdZL+B5cGhSHiPyv+PMKSWS/4e18RMi/cCm9bOKiqPHnaApNKyypVNJhwtIpGUpya3uhXgnwCXJZEEUzLHdZCnygMLvgprgYZCVsNUOJPaTFy8Gny+KCfxUZ8sZuoD18/sC6HRbRrNWtxV1vPQK+9OKE2euOR7uIR7ZVtkKvDVXbfe7N5SzsmY9YxOi4tVpJl7GhKyrt1QTal9wdSuqLAvASlnjTkAbtAfALgriQFRylbR1cQCCDfaPa6GELA92ioDELnJmaftjYzINWJAsEbbmH7vKKQOU00CbiTEowtJdp2Cqx7l0Ph7SlKwGLMY78d3kMahD5efgw9i/IQWC5lEuvuHFo0t5Nd1AWHylFnW7V1d6kNnqhzDncVsMfkcdt/g/PS6wu4HZTbVl0OdWuvTwsAKzf51LkzCLKSYj0AFlWNIXBvFnIwSpDqpsmaFLGjwcX4GlHWyBtjptGdFnOCEEW61wawdSDkcuUEUSFniK0pji+iWaDETlqZ8yd4wmeUhmYD+HJUrlW65p0p9RzBTZnTX+XO5IyhJ1XlNcCberxmGv5Wb3bPn7H46FsO0iPA0cmc=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s4hJhUSxuPU1tsEyphuF2UX6QYP/Ux+ZisIw9qY2mRKCQK2bS560Fyd4F5xI?=
 =?us-ascii?Q?ENCq25HhHgG18ArEnElaLiP2gXQzhSuV1gHI5yObTofH8UizYzfap0vh/GRk?=
 =?us-ascii?Q?GCONMYc4Z1Vk8L1sAXgkM+kTBia2sM4iRT3/ZHuMKnsU4XDICmFyJ9a4MnYz?=
 =?us-ascii?Q?MrzrdNQBfe8qzx4+0H+KNV2XZ5jZ70lUriU0cZeJV8ooV8bNkB8dBt2TRFLb?=
 =?us-ascii?Q?kP4wb7rXdvvl7vmhZb1voWoH6j7H8rmhIlZJCMj+J5daKGFlelaNaH26t0eJ?=
 =?us-ascii?Q?wjzpfTWfd1xJOQQrAmuIkzd/DBX4Eyfi/jBEgbhOXb20K/hQ59QFLZ5YUWQV?=
 =?us-ascii?Q?S+GWt+4lHtgOYoZAB9JEmaOQ4E7thx8AJPq4/1Iyv1yAlIGUwoilX6lY/XGF?=
 =?us-ascii?Q?Qkv68PEKzHwh/4yJEs6Q3niN4C3v9fpDCHpyKiAt0VmYgBpf8RGiRecotdzh?=
 =?us-ascii?Q?ATVB/Y6gXGxDuzULGvbWOoNrWdVUgMjK0WMt6uMCUN7F6lM9Gs1OaYPMjMmC?=
 =?us-ascii?Q?/hMWNUNtZ2VV3LFIL2jEue3YSDjWVbw19jvd5+oiuC+1SCelAcoG8aqPw8aP?=
 =?us-ascii?Q?y3v8Ck/IIYGauodQS9iheN9MKbOY5hkvmSjVXM4CcfVT0pCrRmp/1n/A+wnE?=
 =?us-ascii?Q?l/ZAR88tvoozBt3YeV7/HJdnqGMvi2O6lQohBfBxC2r5S3du30X5WCuHvL19?=
 =?us-ascii?Q?NxybPr6yc3Z6AJ2RS7Cumv8VGIPtAJu3Kez/WB87BIaYtil1rlXD4HWehGMU?=
 =?us-ascii?Q?x9LExQtlhNowcDG4vRsu8qIJdNQNhWuDCW0N4moeGOhow9Ta3C2bjLl1oZ0c?=
 =?us-ascii?Q?Fjw3le4G6WU5u6z7Vr/yW8Fm4rh8UfcfYsiOMjuTY4ORuB36lEGQiS/Q4sJv?=
 =?us-ascii?Q?az5NKxM41drTKzEAs9VFZc7dUR4phmcbMrhJirVb20Iywulpdu+nSezhX2c9?=
 =?us-ascii?Q?KQMxJkj8m65I170attzk9VjfAWelEDs0TqC5VMOXdnNqWDMR54ydASUK3kCg?=
 =?us-ascii?Q?NqGaCjv8YZhrk/QX9gbckEUB7byO6pUhQfKtJSxch4R1BI+KkPG0Iniyuuiz?=
 =?us-ascii?Q?yPLsA3AGihy6rlAnM+Qt+JxKfa3C/u8gvznPjXD/ffsbCBBZuaQvPNq7G1t/?=
 =?us-ascii?Q?VBLKEb4OquiMiMqscmbf+7wak1geJoy2OU6/YEFo0e/B792R3K44IpNaC002?=
 =?us-ascii?Q?OWiI3U9w3hdkQbHT6cpXlDun+MrsW3o4EjTnpizlhDV7XB6Q+Gzes0TAbBUt?=
 =?us-ascii?Q?v8jTLYe6ds4kz75Ue+ixJlNcZoEsxg077Yni5HOudO42N1ufTcykz6n5oWiY?=
 =?us-ascii?Q?P4U=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e3d53.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: a9609569-f44a-4600-4107-08db71d39e0e
X-MS-Exchange-CrossTenant-AuthSource: DB4P250MB1032.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 21:16:31.0119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P250MB0029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_141638_051618_C24460CB 
X-CRM114-Status: GOOD (  10.30  )
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

Reading ECC status is failing in toshiba & winbond spi-nand drivers.

tx58cxgxsxraix_ecc_get_status() and w25n02kv_ecc_get_status()
functions are using on-stack buffers which are not suitable
for DMA needs of spi-mem.

Fix this by using the spi-mem operations dedicated buffer
spinand->scratchbuf

See
spinand->scratchbuf:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/mtd/spinand.h?h=v6.3#n418
spi_mem_check_op():
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/spi/spi-mem.c?h=v6.3#n199

Signed-off-by: Olivier Maignial <olivier.maignial@hotmail.fr>
---
 drivers/mtd/nand/spi/toshiba.c | 4 ++--
 drivers/mtd/nand/spi/winbond.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 7380b1ebaccd..a80427c13121 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -73,7 +73,7 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 mbf = 0;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(0x30, &mbf);
+	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(0x30, spinand->scratchbuf);
 
 	switch (status & STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
@@ -92,7 +92,7 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
 		if (spi_mem_exec_op(spinand->spimem, &op))
 			return nanddev_get_ecc_conf(nand)->strength;
 
-		mbf >>= 4;
+		mbf = *(spinand->scratchbuf) >> 4;
 
 		if (WARN_ON(mbf > nanddev_get_ecc_conf(nand)->strength || !mbf))
 			return nanddev_get_ecc_conf(nand)->strength;
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 3ad58cd284d8..f507e3759301 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -108,7 +108,7 @@ static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 mbf = 0;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(0x30, &mbf);
+	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(0x30, spinand->scratchbuf);
 
 	switch (status & STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
@@ -126,7 +126,7 @@ static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
 		if (spi_mem_exec_op(spinand->spimem, &op))
 			return nanddev_get_ecc_conf(nand)->strength;
 
-		mbf >>= 4;
+		mbf = *(spinand->scratchbuf) >> 4;
 
 		if (WARN_ON(mbf > nanddev_get_ecc_conf(nand)->strength || !mbf))
 			return nanddev_get_ecc_conf(nand)->strength;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
