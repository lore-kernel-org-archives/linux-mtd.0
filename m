Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DFCC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 14:29:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D7C964DF5
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 14:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D7C964DF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vAcvvAPEXo8dJDr2JnOKMVhTAJUC7t5Z5h+jVHo7FeM=; b=1F+SrRyYJYp6eoCNAintVpfxq
	mtc2muTEwam4SPL2ugqWV61al271hpWa+ivAIix6n2kqWOLDJHmyV4Sss4+Ki5fz5Uahnxw2j4yi8
	W1zvbC4cG9kzvlX3kk+4gWeFgm7ePqTxUzORdsZ/aFeMsxEQZM3+GtNP+VnUGJQ+ZTjaz249UeMdi
	5ObN5oHen8GHRtWO5NriGe2FSa0JfZDZPRCfxeqWiRPnDcRPhSB7GbOZ5bekCOrWFvO7+sQthSiNV
	m89f3IzBQk2GDOmkT7tWTivllvPm2M+f6pqAXcdJQQ+GQPJQXTg+rsbmLuyHhCZ1k/Q1NwRiSqBqK
	Go+/afwJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGjXt-0000MT-Eb; Mon, 01 Mar 2021 14:29:13 +0000
Received: from mail-mw2nam08on2048.outbound.protection.outlook.com
 ([40.107.101.48] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGjXq-0000Ky-6K
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 14:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOgZl9mZa83WWFR/n5s2UFfqTTcsA9mr32V2TGAl4wALumuGvt7KcArdOc3tKn0kPHJMq62o23nOjbP8o+fkkWRchUSZ7vChNOSWPZJsG5+qqCysRec1IOoZPPRol8wc5JnRHK+AOMjr3EXZlrEvLn/05Doqf6ZYuo8Ed60UbfC5TcU70xV3DVTG0HoAc/QPACArwGSHEekRQmUlhxFUSCg8i77ZSDfJMSEjRkkWuou+jY8nhJGcWQRqjyRnpRiWY0CDG1E4wW3gJK7YiQxPRU/0SQ1lQvMPKGapBvacnY17PlDVvipnccjqOmUbypj5CVzqs1dnK+TNz/2QyomHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GDWScmAUoZKj9Mpsp7YpLyrh53hMRgiGd0UsYe3XAQ=;
 b=Y6Mfg9Y9gklCimyU1AqyGzMQwg4bWhj+bnfruAxotkchTGrOCrLyqGLn9sawISRTVsfJ7LlYKYP7xHSbW9FnPSiD6gZ+5w3kGQIcBmpSjgVH8mu7CrZXV0L/tne/MGUFpZBAtQTc8IFJdofzZZ1j1rnwYtmp0GFCHGwnUQqxvg+MgenzBTcbjl9AbF17cVUHzYjKY/8mpn50Jok8J93vLXF5+FW1Tlu6ZGcU6tCALU/SUht9Yt8iaQP/D1qZQgobi4UbWriRYIONmMZF70kH2AY1C+Ri9Fi64g4oHhNp4wkNBRXz18z4iPx0AIOUzYPerIOBWmd70gp71McNs2SvyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GDWScmAUoZKj9Mpsp7YpLyrh53hMRgiGd0UsYe3XAQ=;
 b=XGfJyn7qbEiIWqvxpwPTheTfnRGcEozt1APhoAL6asKxuPf+PUlXrSXmTRlbqDh0jZyQnnXPFuOva+myR56eELzIjDqf6PW4gpQ8rLSbEBGDSONKCUN5AFCWbuwkAi8ChRhAHDNR5w14z7v3aOAPr2i6viIiCYoVsB0VVpelBTI=
Authentication-Results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 1 Mar
 2021 14:29:08 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::1402:f204:de5d:c47e]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::1402:f204:de5d:c47e%4]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 14:29:08 +0000
From: yaliang.wang@windriver.com
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH 2/2] mtd: spi-nor: spansion: uses CLSR command in
 S25FL{064|128|256}L chips
Date: Mon,  1 Mar 2021 22:28:44 +0800
Message-Id: <20210301142844.1089385-2-yaliang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301142844.1089385-1-yaliang.wang@windriver.com>
References: <20210301142844.1089385-1-yaliang.wang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:203:b0::36) To SA0PR11MB4766.namprd11.prod.outlook.com
 (2603:10b6:806:92::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-ywang12-u18.wrs.com (60.247.85.82) by
 HK0PR03CA0120.apcprd03.prod.outlook.com (2603:1096:203:b0::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Mon, 1 Mar 2021 14:29:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da0c51f1-df98-4ffd-1200-08d8dcbe5fa2
X-MS-TrafficTypeDiagnostic: SA0PR11MB4655:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR11MB4655FF29D5E86E74554779059F9A9@SA0PR11MB4655.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3qa2fUVRuELxg+8HX88Z7HAlxKPz1Lu9lsC8VPGQJqVT1V1W74rOhjXm2nvGIq9l/Ki3G4XRVFNzyNO12oPiOiJOi2wPhThRP58fVZxtwzVYafN5rlEQdQD0P2T4XHu50dklrcpCDBk8Dl8R/lfyLx2FvU6tYSUmZea28DIWE7hbUQ4awxL2AHzfZ0e9T5ANwf5CuhYeZPJa0puABHaOGOzYsLICGq8K8jcwfuS1NWBD/Ftu689k/CFEPX1UAMze9uIi6GaJnAN7LsEGhVUCY61IiI4VYJN7NBn9XN1gdmmP+TW3UX2dhglloid7Q/Hi9gsbO8SBgEoEs82hj2It3wrxM6Ox8dYvwhEi/fLIWb92wvk8r6uP2W+zztTHtbjySC+5/zvv+aC84ib+XFW5Qac51VooumyitPf4HpEUoCmw204YJyi+4Q4o4Pa5IZqs0lj1paJjnGIF1KhXch4gURqLCsRc+uZ+GiAUgtUr8JeNi5Fmypphv2TrqImBExo7y18aJlwoEtfKpeEWepMKChjsaSgo9+G4AEl0rXhvwlTRK13+iUjqTPXKUxt9Fjns
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39830400003)(396003)(2616005)(8676002)(83380400001)(36756003)(107886003)(316002)(6666004)(478600001)(6486002)(6506007)(6512007)(1076003)(52116002)(956004)(186003)(5660300002)(9686003)(8936002)(66556008)(26005)(2906002)(66946007)(66476007)(86362001)(4326008)(16526019)(83133001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9VS60gYlW2ThkgGsvy+mHKcCc1xjq0Pk4pss+9YIS6M4jo6RlzHUQZR04Jmg?=
 =?us-ascii?Q?98DRfzSp0zZznpw9gakFOJ7UFNGHkFVDN2WfW0yEiPk6tdoVX1qBBVBHQkHy?=
 =?us-ascii?Q?EqhMg49J88kZG4j0qT+eAjEwD2TEJoYbw2HUrA7dOrtMxitenZ1nD88BnX0u?=
 =?us-ascii?Q?0dB9NIbJgxxfafQO8ScdTPhOiy5qllhwZp+uFXCiI9ePMqDjJj4VS0NVSr5R?=
 =?us-ascii?Q?K9rdWeF//oxf50o5wIcTD2AGA4/UKqsnZCEFhOcv/XpD9Nl85xmoAzlDUX6O?=
 =?us-ascii?Q?bZg4liDhMHXIz0sJ78ZSyoWiUNyQNsaFpn5TRHCGYIB6vQ2naoRkVGkXhpz9?=
 =?us-ascii?Q?Zy9LwXvwfqCqFB8BxwXX9aFGL0v7k7uiqCYmA2Vqd2LZE4D0bcWOmNVVZIiS?=
 =?us-ascii?Q?troVtR/NbaTzrKcnd28r48ceV60NAipDOClt6XGNgY7K80AfPB5vw/InSlNQ?=
 =?us-ascii?Q?mWL3EiZHAHp6eZ7pTcydu5VC+1pejtEuDoTw8YW/4cgJt/vRi5dKFDxei460?=
 =?us-ascii?Q?sKEB5xpfPROe//Knu64XN+mpvj0dGzvRD9x/gBDqi2ZDMqtAzm56feDVJxPM?=
 =?us-ascii?Q?BEELiCWbnRPkGa1wMOhfeABxinPUrd74h7An1pZsJuScLdxCldOCAQmqIpVZ?=
 =?us-ascii?Q?6Iwsnl/wTpl9jetWZ3d93PV89L9FavEuadTIl4d9HJlRoPVwRhSjPU90z1At?=
 =?us-ascii?Q?Sx5dwgKNwSMraP7YMRB/AzURx0IsPvejPHqnOdRsoKKFis+cteO2lXtHKXi/?=
 =?us-ascii?Q?y27i7cLWvDsnI8s2BDq7fAoB6Ty4j2R1WR4JbJO+UdQQuDfmXAho/5WBuK/U?=
 =?us-ascii?Q?/ABIaGRjDaQLIvgCC+y1C9x0Bc1jKFQ7IM46f3f1DTtkJhuhLbd6GhvqOufa?=
 =?us-ascii?Q?0NYERvUbehUDd6ImRPEEmLLKjGmnwOEw2wHHMVPeOqklKSsiroD1QnxNIIn7?=
 =?us-ascii?Q?uw5EwArgKPEqIKJ7kuNpdqYS3A5H5zSuGdM+KubBk0KVy2lh8cr1Aa3953fW?=
 =?us-ascii?Q?4s9aDS1uCCLE+B8akIJ2S9AtXTvlT8TKkMn8MfxeIWK1gaFBEoeiE4RC8wIp?=
 =?us-ascii?Q?aMe/J28AGpdEBuPhT5D2gf5B6CFo/brIeqVxOrwYPh45jHAkPw/xpnd/fDhl?=
 =?us-ascii?Q?GPLYLAA90Nqk6zrndEJtsNxLWIQisNlhyxiseNLzHNVAurD/BSpSm0HNGOGf?=
 =?us-ascii?Q?ycyHte7Dlyb8wZcri9T6YICipiVsx5Uu0ia4osCtGwUtkMbOS06fEFk+4bwr?=
 =?us-ascii?Q?1MBJ/0MLmPz3yRuaXUSevXDxlt7TIaatD3hjOF2RaDriVD1hjnQBGypmLqCa?=
 =?us-ascii?Q?2TlbChjhZDUIOZmuXAaG6opg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da0c51f1-df98-4ffd-1200-08d8dcbe5fa2
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 14:29:08.1788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUblaY1M4Hy6MrEQoFD3rs4NQd+dooL0tRPCZsS6uUPVICRFmLWzMMiMq0exYivMizqPJidD8abcVn5Bb3lSROcBMOdKDnV3GeCR1FcA4jQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_092910_278132_E88D7F6E 
X-CRM114-Status: GOOD (  20.54  )
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
Cc: Yaliang Wang <Yaliang.Wang@windriver.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Yaliang Wang <Yaliang.Wang@windriver.com>

S25FL{064|128|256}L chips can't recover from errors when program error
or erase error occurs, P_ERR or E_ERR bit will be set to one, WIP bit
will remain set to one, A Clear Status Register command must be sent to
return the device to STANDBY state.

First record of the can't recover error is in commit <c4b3eacc1dfe>
("mtd: spi-nor: Recover from Spansion/Cypress errors"). The error has
been fixed by the commit, however, S25FL-L chips shifted P_ERR and E_ERR
bits from SR1 to SR2, which makes the previous fix no longer work.

Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
---
 drivers/mtd/spi-nor/spansion.c | 96 ++++++++++++++++++++++++++++++++--
 1 file changed, 93 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 67619b64c148..4ed98cb969a5 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -19,7 +19,10 @@
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
 #define SPINOR_OP_SPANSION_CLSR			0x30
+#define SPINOR_OP_SPANSION_SR2			0x07
 
+#define S25FL_L_SR2_P_ERR BIT(5)
+#define S25FL_L_SR2_E_ERR BIT(6)
 /**
  * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
  * @nor:		pointer to a 'struct spi_nor'
@@ -203,6 +206,38 @@ static void spansion_clear_sr(struct spi_nor *nor)
 		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
 }
 
+/**
+ * spansion_read_sr2() - Read the Status Register 2 using the
+ * SPINOR_OP_SPANSION_SR2 (07h) command.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @sr2:	pointer to DMA-able buffer where the value of the
+ *		Status Register 2 will be written.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_read_sr2(struct spi_nor *nor, u8 *sr2)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_SPANSION_SR2, 1),
+				   SPI_MEM_OP_NO_ADDR,
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_IN(1, sr2, 1));
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_SPANSION_SR2,
+						    sr2, 1);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d reading SR2\n", ret);
+
+	return ret;
+}
+
 /**
  * spansion_sr_ready() - Spansion specific method for querying the flash to
  * see if it is ready for new commands.
@@ -244,6 +279,55 @@ static int spansion_sr_ready(struct spi_nor *nor)
 	return !(sr[0] & SR_WIP);
 }
 
+/**
+ * s25fl_l_sr_ready() - s25fl_l family specific method for querying the flash
+ * to see if it is ready for new commands.
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
+ */
+static int s25fl_l_sr_ready(struct spi_nor *nor)
+{
+	u8 *sr = nor->bouncebuf;
+	int ret;
+
+	ret = spi_nor_read_sr(nor, sr);
+	if (ret)
+		return ret;
+
+	ret = spansion_read_sr2(nor, &sr[1]);
+	if (ret)
+		return ret;
+
+	if (nor->flags & SNOR_F_USE_CLSR &&
+			sr[1] & (S25FL_L_SR2_E_ERR | S25FL_L_SR2_P_ERR)) {
+		if (sr[1] & S25FL_L_SR2_E_ERR)
+			dev_err(nor->dev, "Erase Error occurred\n");
+		else
+			dev_err(nor->dev, "Programming Error occurred\n");
+
+		spansion_clear_sr(nor);
+
+		/*
+		 * WEL bit remains set to one when an erase or page program
+		 * error occurs. Issue a Write Disable command to protect
+		 * against inadvertent writes that can possibly corrupt the
+		 * contents of the memory.
+		 */
+		ret = spi_nor_write_disable(nor);
+		if (ret)
+			return ret;
+
+		return -EIO;
+	}
+
+	return !(sr[0] & SR_WIP);
+}
+
+static struct spi_nor_fixups s25fl_l_fixups = {
+	.sr_ready = s25fl_l_sr_ready,
+};
+
 static int
 s25fs_s_post_bfpt_fixups(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
@@ -331,13 +415,19 @@ static const struct flash_info spansion_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES) },
+			     SPI_NOR_4B_OPCODES | USE_CLSR)
+		.fixups = &s25fl_l_fixups,
+	},
 	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES) },
+			     SPI_NOR_4B_OPCODES | USE_CLSR)
+		.fixups = &s25fl_l_fixups,
+	},
 	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_4B_OPCODES) },
+			     SPI_NOR_4B_OPCODES | USE_CLSR)
+		.fixups = &s25fl_l_fixups,
+	},
 	{ "cy15x104q",  INFO6(0x042cc2, 0x7f7f7f, 512 * 1024, 1,
 			      SPI_NOR_NO_ERASE) },
 	{ "s28hs512t",   INFO(0x345b1a,      0, 256 * 1024, 256,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
