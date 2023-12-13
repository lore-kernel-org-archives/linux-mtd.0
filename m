Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A9FC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Dec 2023 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FZkUmI0qhfKb1d+TmS04lD7z7mCasvydhKMkT51UeXg=; b=4lLOQQbZKFZfq6
	CNOOYXOilygLJMDO/gCEFf816U9GX6dzXTbF2ZdBQoog2amyezicZg+85WHWd6RgUCEI2g4PB9/YG
	S6rsxD/esIL5+IlFp86YnCzaqDFWGU3YIK/Lld0ZGvYaipuHk68sNnTvbWA0aav7sKMFXX3pTw+Be
	yUwmnevZdvIWu992DjCWwPhtka/psJ/e1n2sD48mkZwgDi9JyW9iErgy5jpl0ocQEbvSjNc0UfgFj
	lsKl+DeQbhQ/H/jpp7NkmLCXJI4+5H4brWGcAj3O348YSmgGgJRwcM7soOyaE4796jcm+u+r9aLzH
	RiAs6+Y6PWyoL23Bu7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDKpg-00E414-2i;
	Wed, 13 Dec 2023 08:43:08 +0000
Received: from mail-vi1eur05on20607.outbound.protection.outlook.com ([2a01:111:f400:7d00::607] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDKpb-00E3zl-2T
	for linux-mtd@lists.infradead.org;
	Wed, 13 Dec 2023 08:43:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpcOcf010FiSm7tK2DiRihRYcgABjGDKslyQZz/Wk1Vo82vDzJp0+qWs01mDxgyd2xsfuZbXx6QDgvYMakm645olzYBtlHjEf2uZhrL8jRva10dj+D9B9UNK4CptQmkA3s5Iqr7+vIn9n52B0RR1Tj0OmtwvOBjqZRO2YOdoENoDvajfoe1NLEfBHbkLgsWezeFeadKHgJoaIkr1w94axpUxljeucKc+9slII3AB7EwayZVTor5044RIe1RwektmWYzjorr4UiOzNnMoEM2cdbq9tAjZLd29RNe5kDN+RDBaeVRhLm88LCrmrO+M+IsMDrMEA/Zk0muYMJmyinkX5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1VNLPEM+m+8A2i+B6aS2+VOk/lcVinFNO2W5xfGbMU=;
 b=P/SqvGblxuEqxfysQNHcgqLvLF6Ca0+z3sy3xMGzukoXmfcRj9kBRN5Ox+ffRs2WJuMULgLCCQ707+KHB1N6Dy/OV4xsZtpRcGE4i63wIrx0pSIopKKDPYqx/KU6qwFK+ATj1T+Ak+e0RGPdNu+atyT/ZTF0Wd3GFj7RMCFuXdczOXsi0EuUSKK4a0Rf81sQHtrAxlonlCXVbZPsNpmqprQW04zGb2QIGXWx6JgG1UsaVfQ9615Yb/If1Fi0f4sXSsqEq0+DZEBB7KFDjUokU+i/zalQ/4WSgCWM1zc+6qvmWOOXlOs3mQZRuGdqv/jTtvd9DK85GhrvA3Ucb1NaLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1VNLPEM+m+8A2i+B6aS2+VOk/lcVinFNO2W5xfGbMU=;
 b=g94ZDg0kCpHBDjC3ucA7AgfCL3VOYE1WSDeE1GbAmt8guuaCUHDeX0vgwG1X8SZ85lseQrN240WFQZg0BcoYbMo6w/k5g3KjCR9m73Ti8PivpqPqDrxTqGvboytyUc6+FR+o00mEI4anEHzpcfeiwE5TLa6UoRUwzl8qypHmjKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 08:42:56 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::f008:81ba:6172:d79]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::f008:81ba:6172:d79%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 08:42:56 +0000
From: haibo.chen@nxp.com
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-imx@nxp.com,
	haibo.chen@nxp.com,
	han.xu@nxp.com
Subject: [PATCH] mtd: spi-nor: macronix: add support for Macronix octaflash mx25uw51345g
Date: Wed, 13 Dec 2023 16:48:20 +0800
Message-Id: <20231213084820.932217-1-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To DB7PR04MB4010.eurprd04.prod.outlook.com
 (2603:10a6:5:21::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4010:EE_|PAXPR04MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc492d4-3eb8-4682-20fc-08dbfbb78082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dEPrQtzr0j2l+BGnaLlwltqMZNLNfPWvl9cqg6BcvuzsijhrEDBERnxt9koF7CFWMLkGysrnM91UGO3rVltsUbM+Z+tM1ZRyWXC5kp0Fl50jaAY5Ol4EcbjH1E/bniQcaHLqk2FBInWtYsiSn8dIC2mJdxjhQ9k8ybU+GxoA+NEHCIznnqC8tgl7utLsTE+ZhfZY/Es3j3ZPzEVrQM1UX5GSvV709ezNpg2ULeBi7afjfmxgOLMMRrSJZNfT00qArlcDy6s7GEyfT76ZKxQoy5iNcN32HHrLHbXKlNdANCB2C01Z12GDBa2wWJkHfhREfESybe3Tc8s4Jv5yF4MhIHNTroXmkkh1wwyugoLUE+MM2vbe7wzqeywtZfAob++DtpFkXKl/Ug+vB4+HwLuiTamYZ3QDiqQy8i/NvaPyTY6uAYjLv/17bPTZ8juTr8US5wH89QPzz8oGAPiN9hYYGFS6hYV2T0Lk7TlB7CbvbjzNTDc5ziknOS53NFxtgPXzinxKb9R3uNYaNn2gE1RBkh6zxCI84eAYArS91llCPAzqAffNisQKu46vdIp3fGNV79i03KzklEPn5Hr2H/nViBufud4x9ncjls7GXCLI8Lo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(83380400001)(6512007)(9686003)(52116002)(6506007)(2616005)(1076003)(5660300002)(4326008)(8676002)(8936002)(41300700001)(2906002)(966005)(6486002)(6666004)(478600001)(316002)(66556008)(66476007)(66946007)(36756003)(86362001)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bk8Rk6SAhVB80MUyIVbQc96HbSk/MunQ7pO27tYsisXDW8iDCiaxBhSEQW39?=
 =?us-ascii?Q?NiVygWbCY2iUWD0Ry1dtF9FL/c5KqNaZqApuTX4f8rrO+37FeCwzA6+n72tj?=
 =?us-ascii?Q?MlxjxRRaoCZhzENpThaPo87gTJpJlknFb7sx2CRdVbvpAqp9W1/V6I/iuEHL?=
 =?us-ascii?Q?+17MqB4+wR2K6gFCLi9zxggH+oZAkvl0coztvEJsOXiGrxV+Y12iGVXBv//l?=
 =?us-ascii?Q?3RvNUbWHxZyDwU94A6rHcMrEFDWTYP8EOKGQuo0CWTpczyu9wn/cyqsgL8HK?=
 =?us-ascii?Q?76RmUVd4jWvyE6cAyRh3vNn0gp5Ee3e98yYpzqYpsjxWC20+0C6N9W8qLjyo?=
 =?us-ascii?Q?Uw840a9P9Y1Ufaov2OHj9nwCV1JSn711Jtn62OSbcKNPBi5HelPDx6nNcgle?=
 =?us-ascii?Q?D5ItdPTSrVCPXIWh/qN5RdOhexE255tGNJeSDakU7bsC3t+Yh+2ayD6iljKQ?=
 =?us-ascii?Q?R/hjCFmI3pnoWrJ2b7m4VMZ6SAmlmjXkRWbBqz3v0fVuncrN207nAC1y3ME4?=
 =?us-ascii?Q?nHCkkMrwpCGjvoCPD1Nw4ZA+jxEt0pmQ8rJ8qrfFr+ABKz3864gYgO6KS2JQ?=
 =?us-ascii?Q?ejob0Iat+dOPY4C6qvF/BrcnLM4ngIAr+Pf+Whjj0CP7hpGi1JNZS+VPZqZl?=
 =?us-ascii?Q?Qg32HzTUTCm7QHYHOrm7zP3bl4XrybB+xAZqp9DGtkt3DUhS6VA+3bD7WI5t?=
 =?us-ascii?Q?4WL2ofDobkIGG29BMUYVyvM2W2FUWHBI4pJoDjaNrNdsktAPpL0ZHls1k0c+?=
 =?us-ascii?Q?/2yR+7QhN9mNB4RkCGRcP/NVWOqzMo0/3VWF8jpvbnFJgwRNZk42rG61FreG?=
 =?us-ascii?Q?Hx54aBpUU/9kpsjMxL4qtq8nzwCVJKzFsBXWn4zveZuWy+zYpYgbTpobRPp5?=
 =?us-ascii?Q?L+cNL+o5/N4T4W0yr+HLfrPq6PiqP+2UXkxpnGNLXqK/TqVZeQYoJ0IVHLiT?=
 =?us-ascii?Q?/qPRE+sNsXfTYuW0Pl2zqboCnBqPEoCzM68/i8JHSmNxcFevXV7aRDhr6EP4?=
 =?us-ascii?Q?rcxEHeyDpkeHzK5ORKrRr/Q6i3+ysbkN4J1Rk/v00N7wgVXubuGdBuofX1D+?=
 =?us-ascii?Q?7Icm2E1gLvnJPwaFGEJyOr6tJ6ISDbfei3qG0x1b0ys1xdtjQggiLufuRXya?=
 =?us-ascii?Q?T4Hplg4av2K249lQgCPbHLSsKy30owbAPRdIMant/Lco+hz4ysLoo+HF7LiZ?=
 =?us-ascii?Q?Drjl1bX4lQQkizh/a6DsFiH/sKBj13xgVR98B7PwLj99pROcPBTBMXZq2VCt?=
 =?us-ascii?Q?d+mnm6BeJKCec93PnQCEtBMZU9ahfRQ+5NfJpDwDjh2wkdhnUcmYQc8ZoM1u?=
 =?us-ascii?Q?o6nHQwLL/hwluTeFx0+0FsrOR5KokiNyUmXtHstF2YQB2DTTOwTP5burQelU?=
 =?us-ascii?Q?Xc35a3gkJS7xui9YAu9rTXOaaFUssaYQT4B8K9OK7r7Cz8SG4lUb04p1sZhc?=
 =?us-ascii?Q?Wq+lfN1J2XxJMUM8kUb7O3qQh02NCazC7lU1QZrGoFo/JiE1Kk1i/St++fmn?=
 =?us-ascii?Q?1BqH6WdFy+Lm8WfwKfVBQlvVyO8cvj7rztyugsYAvzYqtp+t/vhKT23HG11K?=
 =?us-ascii?Q?YWOoYaj14zynp+tptrOO/BTrqbPPeoyvW3gxMYiY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc492d4-3eb8-4682-20fc-08dbfbb78082
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 08:42:55.9872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: So8fZOf9S+dEExLCOFOX3zuwRKu5eEcM7MAgF4jkilOAWiqaprpSWVjW2okM1MQ1fkSVRIOftH4OV2IY4yby9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_004303_922955_0D5BB71D 
X-CRM114-Status: GOOD (  18.79  )
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

From: Haibo Chen <haibo.chen@nxp.com>

The octaflash mx25uw51345g is an xSPI compliant octal DTR flash. Here add
support for using it in octal DTR mode.

Try to verify the flash ID to check whether the flash memory in octal
DTR mode and SPI mode are correct. When reading ID in OCTAL DTR mode,
ID will appear in a repeated manner. ex: ID[0] = 0xc2, ID[1] = 0xc2,
ID[2] = 0x94, ID[3] = 0x94... Rearrange the order so that the ID check
can pass.

Based on the following patch:
https://patchwork.ozlabs.org/project/linux-mtd/patch/1621232088-12567-2-git-send-email-zhengxunli@mxic.com.tw/

Signed-off-by: Zhengxun Li <zhengxunli@mxic.com.tw>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/mtd/spi-nor/macronix.c | 91 ++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ea6be95e75a5..8a1ce17cff3f 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,11 @@
 
 #include "core.h"
 
+#define SPINOR_OP_WR_CR2		0x72		/* Write configuration register 2 */
+#define SPINOR_REG_MXIC_CR2_MODE	0x00000000	/* For setting octal DTR mode */
+#define SPINOR_REG_MXIC_OPI_DTR_EN	0x2		/* Enable Octal DTR */
+#define SPINOR_REG_MXIC_SPI_EN		0x0		/* Enable SPI */
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -32,6 +37,85 @@ static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 };
 
+/**
+ * spi_nor_macronix_set_octal_dtr() - Enable/Disable octal DTR on Macronix flashes.
+ * @nor:		pointer to a 'struct spi_nor'
+ * @enable:		whether to enable Octal DTR or switch back to SPI
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_macronix_set_octal_dtr(struct spi_nor *nor, bool enable)
+{
+	struct spi_mem_op op;
+	u8 *buf = nor->bouncebuf, i;
+	int ret;
+
+	/* Set/unset the octal and DTR enable bits. */
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (enable) {
+		buf[0] = SPINOR_REG_MXIC_OPI_DTR_EN;
+	} else {
+		/*
+		 * The register is 1-byte wide, but 1-byte transactions are not
+		 * allowed in 8D-8D-8D mode. Since there is no register at the
+		 * next location, just initialize the value to 0 and let the
+		 * transaction go on.
+		 */
+		buf[0] = SPINOR_REG_MXIC_SPI_EN;
+		buf[1] = 0x0;
+	}
+
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_CR2, 1),
+			   SPI_MEM_OP_ADDR(4, SPINOR_REG_MXIC_CR2_MODE, 1),
+			   SPI_MEM_OP_NO_DUMMY,
+			   SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
+
+	if (!enable)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	/* Read flash ID to make sure the switch was successful. */
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
+			   SPI_MEM_OP_ADDR(enable ? 4 : 0, 0, 1),
+			   SPI_MEM_OP_DUMMY(enable ? 4 : 0, 1),
+			   SPI_MEM_OP_DATA_IN(SPI_NOR_MAX_ID_LEN, buf, 1));
+
+	if (enable)
+		spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
+
+	ret = spi_mem_exec_op(nor->spimem, &op);
+	if (ret)
+		return ret;
+
+	if (enable) {
+		for (i = 0; i < nor->info->id->len; i++)
+			if (buf[i * 2] != nor->info->id->bytes[i])
+				return -EINVAL;
+	} else {
+		if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void octaflash_default_init(struct spi_nor *nor)
+{
+	nor->params->set_octal_dtr = spi_nor_macronix_set_octal_dtr;
+}
+
+static struct spi_nor_fixups octaflash_fixups = {
+	.default_init = octaflash_default_init,
+};
+
 static const struct flash_info macronix_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc2, 0x20, 0x10),
@@ -177,6 +261,13 @@ static const struct flash_info macronix_nor_parts[] = {
 		.name = "mx25uw51245g",
 		.n_banks = 4,
 		.flags = SPI_NOR_RWW,
+	}, {
+		.id = SNOR_ID(0xc2, 0x84, 0x3a),
+		.name = "mx25uw51345g",
+		.size = SZ_64M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP,
+		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.fixups = &octaflash_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x9e, 0x16),
 		.name = "mx25l3255e",
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
