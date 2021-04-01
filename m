Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C757C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 19:54:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5945610CA
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 19:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5945610CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+f48shzWLpDsGJTtoaf3e+5EFcooqzQbs47Aqff4/Pw=; b=YZF5eo29hNFst7XREskFPYmqp
	alf3FZpjej3KNrB3NXdAdLLh1X1X7IdQyVvPeS1YMob+5BMhYPwC8O9nGwVDccZxp25lJ9BRorRB6
	82V+w3ELAt73hL4g6sKNHFtQwQO1U15OsEoHB/szGuw1Irt4CRK+Xi1vR0Knnf1nhScC4EvPkU5S1
	fbOWYsda8lqZRmJ1y1c6Z4uvTz9D7ott6VhexIZ7FzGVq9PYtXaMFzDqOcFgNpejzScTBdGRSJXYL
	CXFBsDxUnauiklABwQrR0P8zm665MyyI5Xs1hPUWWK+/2jiCCaPnivHsH4rPQZwkNjlsKntg+muBy
	/mAYT3Ypg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3Nk-00AqYO-Lq; Thu, 01 Apr 2021 19:53:33 +0000
Received: from mail-mw2nam10on2075.outbound.protection.outlook.com
 ([40.107.94.75] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3LK-00AqKx-RC
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 19:51:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=og7RJ6WAJDbJksgS0AC11du2lM8H/ZOJFKoytvFTIrbL47arGoiLopCKBxR39Mmug90vGkYJ1+Zz27BTr+/rlQ1hLOREOxWb1VfdgL1f2+Sgq9E+wxKA51kBNJCmviYa9F9UpoCh7UtbzZU2bmHY8tH0L8ukiBIaqis1pvNK980plgpNg+OLm82YBy+fFs2bXCHz8GxQuIcIz/y1QRR7Nqv9u/5aV0P5frcJpbxzCo+KsF4t907azYJzs2g0DsfszFxVLTQWA2qA6yF9DoUEj65vqY6hCSwLTKQ+Gru2NMr7IQQa4y4p/GdHX2UVOUBQm/2l+MfSccWWXX/LGLTkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tck0PUsOkuIcySO5/0J8nI7zsPOxx9JnYIWOjamzFnk=;
 b=TrVXnxLEu5T8Pf5xdMRt6t+MXNGuXyWJFFWgQE3q1ber3xH2Y9eY7ew1Bs2PhkvjHuBGOzEiYO6oPfMlgX4m4H5Hm+6U2kSVUUzU6WbLZui4JgPjqTMTvFLhwljD9hCupd451dM735epEPwoklaL8nHiaqZCiFsgtxdlvF1aYnNWB/24utFf3Iw+Wczg9bDlIdsjgHRzs9Kt7/qk19d66WfvxEcYqC71bNcxwDHFLZkyZxA9ZkJa/7U2PY2CNPHFqHEjc3PNpeD0MIvIvYs1nDxTdL7SbNFTkuEACgJix4XJL05/+dkNw0xo7j9dwYh+BP1mlyyG6wzAN/dW4jy5Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tck0PUsOkuIcySO5/0J8nI7zsPOxx9JnYIWOjamzFnk=;
 b=iXCcvR+tPrh8ZIIx0mkESqB3frOnR9KvBI6IZIi5PSKzYz3z4FTMfvxHkWGYR0dqO8193yyFCo9lKhevJt8laROlB8rmSXeXiBWvbA1YycauWkdtAQN6gqGDoUQEnDBKr/xT7TQflvomuUGfpps7A64xF1fgQzKmWzJedY6pUuY=
Authentication-Results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 1 Apr
 2021 19:50:35 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d%2]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 19:50:35 +0000
From: yaliang.wang@windriver.com
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, tkuw584924@gmail.com,
 Yaliang Wang <Yaliang.Wang@windriver.com>
Subject: [PATCH 3/3] mtd: spi-nor: core: move Spansion checking ready codes
 into spansion.c
Date: Fri,  2 Apr 2021 03:50:12 +0800
Message-Id: <20210401195012.4009166-3-yaliang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401195012.4009166-1-yaliang.wang@windriver.com>
References: <20210401195012.4009166-1-yaliang.wang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0099.apcprd03.prod.outlook.com
 (2603:1096:203:b0::15) To SA0PR11MB4766.namprd11.prod.outlook.com
 (2603:10b6:806:92::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-ywang12-u18.wrs.com (60.247.85.82) by
 HK0PR03CA0099.apcprd03.prod.outlook.com (2603:1096:203:b0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26 via Frontend Transport; Thu, 1 Apr 2021 19:50:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f206944-77a3-4731-8c05-08d8f5476aad
X-MS-TrafficTypeDiagnostic: SA0PR11MB4766:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR11MB476658491A127014B96BF84F9F7B9@SA0PR11MB4766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2lindFvpFDj6D+kqcKbf5OzrFmRNHFoFq6EqTd4kVfCTuLkcobBj6iAzppGWkWOKNSwsTBTJOpKxiMPjoqUPjW1pGzydF3RbfLwZcEHuWhpf5rYnNG1dp+SFaJmPxR4Ck+Kz0GdCk8SG5jL5nN3cfPEF61Rm1lqZR4kKh5IBVezpCGrkLiv0OX2AQTaSiDzo9IC/+rrdp6FE5Yroj+sRwmgjQXWojC/8QxD1E2rI06lPiV8hnE2gafOmjBoEQc4ohN3mKfxKbt1Wpo2GKbwGzjxXC7gEt3I3634hpYIMG4d3ruMflvE2j/wSbDznodoQALHxKAK0NsqXIgPV8NlpBv4WJr/cumxMF9yBja5jsV40FsdYWSz99Yuc2eaQzok4l3bNyx8CwrynuW/+3Dt8Y5UNSKYlz9baDspEunv4gBdH7vMnMUrwawzufmkgVuwy8ZQ+Qdi7oZraiuByPHdOeh02nzUeBUMiyRWMWX0rgDh4/9G/tXefJX8G0vIEZPvmIumZ9US7wO6f0iMHtXjtWgWYPoZyraJ2mg8Jub05A/uSxn967ASL3R1Q/62Jp8q+6/GUqsJXFFuSqvmja3OHJUucWzGGuYoGnZuK++eBM0ISPY2Kx0nV3xjiVGp3iT/P5AAmQ+EMz9XSSJVp4IDxoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(366004)(396003)(136003)(346002)(316002)(478600001)(186003)(6666004)(2616005)(83380400001)(52116002)(2906002)(6486002)(5660300002)(38100700001)(4326008)(1076003)(107886003)(8676002)(6506007)(86362001)(36756003)(8936002)(26005)(66476007)(66556008)(66946007)(956004)(9686003)(6512007)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9FKMAKy2Y03HFkgA5k7wkJvGAhLCMP3j6e81PWPemiFtgiVh4pxsW/yfRDXe?=
 =?us-ascii?Q?EOyvg5SsEyfDcfBoEH+OJGg34KC625mhIiW94iNJxArlSO4sHX8ag5qpTO8j?=
 =?us-ascii?Q?BQAaXi5rdCqhRytXAmcZhp+sgNwt35lPDfdfLm0plDsWgeTrjaOl8BXWi3ZK?=
 =?us-ascii?Q?2mJiohTeP04Vlw9pZhjFk4glFy4m+VrHYYlv9ivZAahpJ1nDyMV+O9PcBBk9?=
 =?us-ascii?Q?RyKfE9Cc07iDndHVOPsWae/u7P0ans/JdUJkPyShGtU43XOZCmKgc73lUKFS?=
 =?us-ascii?Q?RwL/5oBAW8JceocsKNkxEgKrxOtBZuHYf/ohGMg0mqAGB6lg1anncEVPy55p?=
 =?us-ascii?Q?OOOIDaMNx89JJRNtwRVpe/g/mf+WOxwqhy7VUQp4JDb+K04D/P8OuOPXMl0a?=
 =?us-ascii?Q?Kh2WsAvXhcH7WoUTuj9YZrFOUQOZUvCpI++1cKzG+81K/8jws5J1bG9s1yXZ?=
 =?us-ascii?Q?JLp0jTM38YLEpiJehgJxLVo0grAX3lqbQjXDwdwO2Sd5pCMf1PF+otBpsJl1?=
 =?us-ascii?Q?Bd3UGLBD2NWV+J9EDbztCEHabtUxF65hlrouORwuikwj5zymrzGeRNCaGErF?=
 =?us-ascii?Q?lfTCTfEcFZFl3WGvnDbLuKaz9FfVqq6rWpnNDlK1Rdj49Y/OCUhVrhHdFuGp?=
 =?us-ascii?Q?0Nb2bYk26/wsO19fMYU39XgABe+jH45G7eynKGmRVMKcLvKy87y4HaW2MRS+?=
 =?us-ascii?Q?wxEkjD4jNeTIBmV4tFWkXYB85Q7fTg28dRE+dSdzDKurPMBdPzn372vZh08O?=
 =?us-ascii?Q?cK1k7w4FiTlf52s9ecPkLETA4f8FYRf8MzFb95mxPvjizXEhx/0Xd3vf46eF?=
 =?us-ascii?Q?99QmpSRY8ogqCH2yV2DyxWVhqH1QLnhkZijIxWxMcWjh8Z+ppd25TZ415f6P?=
 =?us-ascii?Q?tn3hv/jCyTydvQ2F3mnvoRQNV/fCdO01EOBUHObmQAP05mPukLhohzRsZbrD?=
 =?us-ascii?Q?BxHvC7P8yRJuhLkmUfPdZR2Rgv1ghOT9tx+TJvq9aNQTBYTcq0uvOebPdCyX?=
 =?us-ascii?Q?KBVXog6L3oPPUcOKwNOlxZXMiCUbLUYxlwONvWVw/SQzJy2DEGGKYrZnumeh?=
 =?us-ascii?Q?nC6YxFB1tDe4afo/pSMZOKWv/xMNuAQ3JemifZt5ygiHch85R3o8nE3N3Hrj?=
 =?us-ascii?Q?HfxFiMTQ8hRCzu9td3LcZDVKPbbEsZH851/fgIY0IGpUq3GYOmu/l0gakyAf?=
 =?us-ascii?Q?O7QK6C3ONlMZ0WKFvXpmjIJAKd168uJ80r7+bb04h/RDIwTtyKwcH3kbnELU?=
 =?us-ascii?Q?Pnow34OKEdujvot3wAQVKICakPdKHmEVSuPyJBX5b476ACrwunmMAN3wlh13?=
 =?us-ascii?Q?ZjS6EQxG2aSo+QlDQJ//pnrO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f206944-77a3-4731-8c05-08d8f5476aad
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 19:50:35.6317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CoD435wkSSYQmTrLPcY4B2FtMQ4ZXY4SACJMvLuJU7lZgiMyS+S4EWDad+y40D+w0KRVBYdYcX9PzV0K/lLuOozmBfbMm96kEe1NYvQ7ATY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_205109_913580_0911AA01 
X-CRM114-Status: GOOD (  19.31  )
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

From: Yaliang Wang <Yaliang.Wang@windriver.com>

For historical reasons, Many manufacturer codes exist in the core, to
make the core a more dedicated place, this commit clear the
Spansion-specific checking SR ready codes out of the core.

Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
---
 drivers/mtd/spi-nor/core.c     | 26 +-----------------
 drivers/mtd/spi-nor/core.h     |  2 +-
 drivers/mtd/spi-nor/spansion.c | 48 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h    |  1 -
 4 files changed, 50 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index dbd6adb6aa0b..4e22aa3884db 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -654,7 +654,7 @@ static int spi_nor_xsr_ready(struct spi_nor *nor)
  * @nor:	pointer to 'struct spi_nor'.
  * @opcode:	the SPI command op code to clear status register.
  */
-static void spi_nor_clear_sr(struct spi_nor *nor, u8 opcode)
+void spi_nor_clear_sr(struct spi_nor *nor, u8 opcode)
 {
 	int ret;
 
@@ -691,28 +691,6 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	if (nor->flags & SNOR_F_USE_CLSR &&
-	    nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
-		if (nor->bouncebuf[0] & SR_E_ERR)
-			dev_err(nor->dev, "Erase Error occurred\n");
-		else
-			dev_err(nor->dev, "Programming Error occurred\n");
-
-		spi_nor_clear_sr(nor, SPINOR_OP_CLSR);
-
-		/*
-		 * WEL bit remains set to one when an erase or page program
-		 * error occurs. Issue a Write Disable command to protect
-		 * against inadvertent writes that can possibly corrupt the
-		 * contents of the memory.
-		 */
-		ret = spi_nor_write_disable(nor);
-		if (ret)
-			return ret;
-
-		return -EIO;
-	}
-
 	return !(nor->bouncebuf[0] & SR_WIP);
 }
 
@@ -3488,8 +3466,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	if (info->flags & NO_CHIP_ERASE)
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
-	if (info->flags & USE_CLSR)
-		nor->flags |= SNOR_F_USE_CLSR;
 	if (info->flags & SPI_NOR_SWP_IS_VOLATILE)
 		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index bc042a0ef94e..b60585950288 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -16,7 +16,6 @@ enum spi_nor_option_flags {
 	SNOR_F_HAS_SR_TB	= BIT(1),
 	SNOR_F_NO_OP_CHIP_ERASE	= BIT(2),
 	SNOR_F_READY_XSR_RDY	= BIT(3),
-	SNOR_F_USE_CLSR		= BIT(4),
 	SNOR_F_BROKEN_RESET	= BIT(5),
 	SNOR_F_4B_OPCODES	= BIT(6),
 	SNOR_F_HAS_4BAIT	= BIT(7),
@@ -453,6 +452,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
 int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
 int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
+void spi_nor_clear_sr(struct spi_nor *nor, u8 opcode);
 
 int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b0c5521c1e27..f90e0d8f9361 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -18,6 +18,48 @@
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
+#define SPINOR_OP_SPANSION_CLSR			0x30
+
+/**
+ * spansion_sr_ready() - Spansion specific method for querying the flash to
+ * see if it is ready for new commands.
+ * @nor:   pointer to 'struct spi_nor'.
+ *
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
+ */
+static int spansion_sr_ready(struct spi_nor *nor)
+{
+	u8 *sr = nor->bouncebuf;
+	int ret;
+
+	ret = spi_nor_read_sr(nor, sr);
+	if (ret)
+		return ret;
+
+	if (nor->info->flags & USE_CLSR &&
+	    nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
+		if (nor->bouncebuf[0] & SR_E_ERR)
+			dev_err(nor->dev, "Erase Error occurred\n");
+		else
+			dev_err(nor->dev, "Programming Error occurred\n");
+
+		spi_nor_clear_sr(nor, SPINOR_OP_SPANSION_CLSR);
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
 
 /**
  * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
@@ -289,8 +331,14 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
 	nor->mtd.erasesize = nor->info->sector_size;
 }
 
+static void spansion_default_init(struct spi_nor *nor)
+{
+	nor->params->ops.ready = spansion_sr_ready;
+}
+
 static const struct spi_nor_fixups spansion_fixups = {
 	.post_sfdp = spansion_post_sfdp_fixups,
+	.default_init = spansion_default_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_spansion = {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index a0d572855444..87e03943ba94 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -101,7 +101,6 @@
 
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
-#define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 
 /* Used for Micron flashes only. */
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
