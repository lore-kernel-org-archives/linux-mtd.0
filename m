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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B73C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 19:54:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF5BA60C41
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 19:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF5BA60C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hK0Bfpvt3LAUJasdU8DM9Oseth0exwy7QWYSGSlnG1M=; b=EuitqunnRN1qkyQqU4U8m02gUr
	DlWiqS9+peiNRrnD8w7rygjV2WRWIsy9kxLiwWsDI3fF5b6O2bczUptbz5CWZqzo55srFs42ZPNmE
	aMli3CxoPQKvwmjXKeiM6B66wRGDi6JWOcixg+C63an0iFZeSSSsYxLemaODpwequ4xFmbWKcFAyD
	VS7UI9K0zI2mkwsxuUyk0BQeBg5VvYzAMDJW0IbXUEeEHlD5bK0EWGbgUpljfxNpmUCuc+z2h23Fh
	dCX78Y8aRT7qJ5POlyTVMkSvq7nhg+CcE72VqITJAcMmPTlnJX352B6UyISB4PE5n9CTorKy+PtMO
	QGhr4VBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3Mh-00AqMw-FW; Thu, 01 Apr 2021 19:52:45 +0000
Received: from mail-mw2nam10on2075.outbound.protection.outlook.com
 ([40.107.94.75] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3Ks-00AqKx-7Q
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 19:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BG1HA12Y+iuaCnyXUkYS1QvoPiakNo4HBitM5a1dmpO51pls86fRrHT+VDOwCvd6jsjUgPoLfKYmDaQcNJhCJ5HUohYX6Uul67lD4HSKkXMaotCOyW6SXyyEtgOI+3s7XjNiKoyrRiE/PcrB8sKOxtHFkHSpxo5PKvSR9UAyD9XVY7hlFaYJAW4fRByqkkEFOwvwux5oXt+OUJBokvkkAqwevzWkl01G5QQVYB/eoYMvX6HQ4I74IXzVlcKdR6UNDZlNZhTLdzxPLanIlmdO0h6PM4xQiV1dneNoO8ls9Oy9GfIIDOAXJnX0Xny/DghXgRLMoB1MKoh3eRALU9LtcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyAVRVYqqHgxBj6IJPPr0pXf6uKEELVu4eNO7v2gePc=;
 b=S+ANA5OhOhPKR1nlRLastqxzoxs15IHSuN///YO5DqMu8pVM2X/LSICS74nsP5gSQcZFTTagT/8JFQM/EI87h095X4LJnYbjNytsrszUUwATHa0pasWdbO1XFIkoRyJLU8YLRlZyvov7hURAHuffIZSbIchFHOTnN870heuFEnGbJVLIhxca1ky9OTCrOOXjR/d4GDp95Tw1F2yeciM8geknmlT+EqxD0Fpk+fBtOcP9mmTFDYUwGVK6VGTMRgmDJzDEX3xxKn9LhfZtRxgGlu0O46NkkWukQ/pnrQS5voS3l+vfkvO/xA7IGgJpu8GdbpoOv9RA747rtYya4cG13A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyAVRVYqqHgxBj6IJPPr0pXf6uKEELVu4eNO7v2gePc=;
 b=QRYQKsfbDDP3WHIsr91/8U0dCmryc4gUvuVIJBh+cxyo/gG+Vo54Uqtga93+llLkQ31m+4JQ1z2dqZzUgZizYqQ0shWsNVvELdh6MwEqB+c42luB0x4NcTCcSvX6yQpzjGa+On1p8hCtqP3ji7CSAc48xW7rrnpBi9pX0zoQP5k=
Authentication-Results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 1 Apr
 2021 19:50:30 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d%2]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 19:50:30 +0000
From: yaliang.wang@windriver.com
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, tkuw584924@gmail.com,
 Yaliang Wang <Yaliang.Wang@windriver.com>
Subject: [PATCH 1/3] mtd: spi-nor: core: Add manuafacturer/chip specific
 operations
Date: Fri,  2 Apr 2021 03:50:10 +0800
Message-Id: <20210401195012.4009166-1-yaliang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0099.apcprd03.prod.outlook.com
 (2603:1096:203:b0::15) To SA0PR11MB4766.namprd11.prod.outlook.com
 (2603:10b6:806:92::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-ywang12-u18.wrs.com (60.247.85.82) by
 HK0PR03CA0099.apcprd03.prod.outlook.com (2603:1096:203:b0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26 via Frontend Transport; Thu, 1 Apr 2021 19:50:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8374f77c-2292-4757-ceab-08d8f547679b
X-MS-TrafficTypeDiagnostic: SA0PR11MB4766:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR11MB476612FDF00234DE4E68C5729F7B9@SA0PR11MB4766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nsp0oX1NTn82bHmyBu+F5cK5cO/lB08Mu+Qtv4BkuB3Ry8jr3rC0ME42+a3UOcucp6/cp+oFnDYYfHG9wwu6qohu7cR5QnPT4jzQyNM8JZx5fVFfg+3TKaId1hEyRXnnYH+Ql9iSbJJVDTqITWnHWxspjfhl3mm5EUCrJycsAHQUoYC1OeOQK3YB2heE46vMS3uX03W4HJX/dYB+61nGEk+1JLgha9qRD7GCElQsmyu8sdGsDtzYMtIQ36zA2R8FEQL8RCU21qQ5ep9QIWXTjxIjmNxU0WBC9wcOFUWdOH+S6c0ebkKrNkrLAHaSpV/N+7tqRpGVP7Iqx9GGgJRkTAPjmSA7eAk5kSMgzB13+nOT3vsip6e+YAfuKSsSLgCcm+7lCtNaVm+v0zd0XLq/BjacxFWnSQbYP1g11onQSIBW0E5YWEGgK4EejWrxIVCCcPPgTjPbnRs/7ib7sjKCOTH1SIKhsT9f2PUCUZcipfDlDa3Og0P4uXvfTdyptBbeLptR8PajiH7x5o0bXC4ynYxjria5N5hEs5x0MEW4hd1ZhYCO36+To/SdI+lmDgsHl3FQDqekB5eWQ+B6QHPqp+OurqoeSEtBWs6UFsvbCE1MJtr6rQUV2qu5TcZ08OwU9Ukb+Fz6GpUaEBULza+faFrQupyfiBtDQPGZxrdFvPCCNeMUcToG+Erc9OhAM6dOS9sJsm32kzFjzmUOMuPGWhq+aKeqtrxFxmn0F9g5h5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(366004)(396003)(136003)(346002)(316002)(478600001)(186003)(6666004)(2616005)(83380400001)(52116002)(2906002)(6486002)(5660300002)(38100700001)(4326008)(1076003)(107886003)(8676002)(6506007)(86362001)(36756003)(8936002)(26005)(66476007)(66556008)(66946007)(956004)(9686003)(6512007)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?x38XzhtTpQIfJWXfDEpOjs2Le7Wl88MeGYFmnwswqiSV4i1GkIsxhX+ibree?=
 =?us-ascii?Q?PlGLEpQIWf0ikDUaWO6+KnwUWifdfFDiGAl+FSAcospsAnPdzUiy7hjOxGiB?=
 =?us-ascii?Q?BvB2EqKJdiMeywKq01h+vZVQbcgf1Xuv9gR1phhZwJBewba/t/esOROxT5El?=
 =?us-ascii?Q?xSMcJ0ebU9bFFWsgi3tixSUD75KqtFLQuTRgw9kqbHJQdnUVt0Te5JFpmJok?=
 =?us-ascii?Q?UtAvy/Cl8y36jPiFQWTqUCeu69rCc2zxvkC4OnZrU5hB5s5G+cuwhgGYjL5U?=
 =?us-ascii?Q?8cjk2ExcW4yX5JMwpu6PeiLFrF8onzrP7SzpwXmeQO3Zs78byRD/hS+sHuxn?=
 =?us-ascii?Q?k4hgoNr8cEyK5KmqozRUTVpfstKqty656vJT3SEsA9M1aufNzG8jThPiq7Kq?=
 =?us-ascii?Q?dAYT1E+NxSJDKah3ItqvPDYkFGis8qLV0Qka+FVnMxstfmbtNEZyq79UJ57l?=
 =?us-ascii?Q?aPhb8LWxmmsVquY9SJkP8NcKQZKD+ToF0Fv50OEU8dqUbcybKf7ScSy9NNwh?=
 =?us-ascii?Q?jzJd2o+U02n5Rx4xMW9WQS6DgWuxUmIPGaBUCHPhlOAY539FTbSvhAXHag5L?=
 =?us-ascii?Q?Eh4a/xxcvRNfhAxMI8oWASIKmsPV+TBqGIKnypPDqBPhBuL5K70hFcVykOaM?=
 =?us-ascii?Q?SipAVo/IbLStdG8DdX0XSGvdB9F8j5r01ChU4eRmqkruXiNINfdIfMwtK5rg?=
 =?us-ascii?Q?ucC2PrMbPCDJRObTWEkhzR6EXCW21bRy5vEpa2be4eXzGutJIbY2rVUT9bZt?=
 =?us-ascii?Q?rraT+UdSYmgwhVuGs2TiGcenWLOGqdRBGrzYkJO0Ot830Ke29pbuQtLHHLGF?=
 =?us-ascii?Q?lYZhhMZDQO69mtDdk2WydRyK84eu7KKnFT5S0xdlNmJNzAz/7itKtQ4uB1S1?=
 =?us-ascii?Q?T8ufr4Eg4upmZWM2c4Fe1/8y/Q+ILxC9eMa2gO0Z8pcfCVSsaLNyv3v4zT3u?=
 =?us-ascii?Q?u834rYEcYtxULj4SRoqr9Ybd9a7QlNPAnkjyCpLxx0crwsohhIhvbfe/WFFi?=
 =?us-ascii?Q?Bo9c1j0UfsJYaA/927K7+eYz/NCEWUnoIN2POHi1G1sPJkuTdJjZA08PyCg/?=
 =?us-ascii?Q?ud2flBf2SmYBX2n6FS0AUVPtyuAkOiwEZFPFGIdtlLtZAfVAyWy8jWHLfYj+?=
 =?us-ascii?Q?A7toVuQcBNNugJmMaj0O6F4ZyFTyM0AtOonZY3wnC71AB7y8YIxH6h3tiprF?=
 =?us-ascii?Q?ndMba+c1vvvuviMv34VWPwEXZLP9Q5OIzosEJVmGUZ+LgLSzhln2HLfns0Jo?=
 =?us-ascii?Q?1UeOfxztfCEQwy17MzBBHOKarUg3ipS/eUokTp1lIpe7QQezt0HL6rusNQuA?=
 =?us-ascii?Q?XYXSZrMhM4102aFlurAGY11p?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8374f77c-2292-4757-ceab-08d8f547679b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 19:50:30.4484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxyJwsNAEC3QtRV8fRdrlYsJQo5aOFB61Cm+QzR0K/FUcKLQozf+Ze2eb5OsIuSf4tPgx5AkW1m6nbAXVTXZ3RyBVmiY49d8FDBDcS680b8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_205044_660522_C82FA86C 
X-CRM114-Status: GOOD (  14.34  )
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

This is quite similar to the patch made by Takahiro Kuwano[1], except
replacing the bare ->ready() hook with a structure spi_nor_ops.

The purpose of this introduction is to provide a more flexible method,
so that we can expand it when needed. Also Basing on this, the
manufacturer specific checking ready codes can be shifted into their own
file.

[1]http://lists.infradead.org/pipermail/linux-mtd/2021-March/085741.html

Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
---
 drivers/mtd/spi-nor/core.c | 8 +++++---
 drivers/mtd/spi-nor/core.h | 9 +++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0522304f52fa..6dc8bd0a6bd4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -785,12 +785,13 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_ready() - Query the flash to see if it is ready for new commands.
+ * spi_nor_default_ready() - Query the flash to see if it is ready for new
+ * commands.
  * @nor:	pointer to 'struct spi_nor'.
  *
  * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
-static int spi_nor_ready(struct spi_nor *nor)
+static int spi_nor_default_ready(struct spi_nor *nor)
 {
 	int sr, fsr;
 
@@ -826,7 +827,7 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 		if (time_after_eq(jiffies, deadline))
 			timeout = 1;
 
-		ret = spi_nor_ready(nor);
+		ret = nor->params->ops.ready(nor);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -2920,6 +2921,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
 	params->setup = spi_nor_default_setup;
+	params->ops.ready = spi_nor_default_ready;
 	/* Default to 16-bit Write Status (01h) Command */
 	nor->flags |= SNOR_F_HAS_16BIT_SR;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4a3f7f150b5d..bc042a0ef94e 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -187,6 +187,14 @@ struct spi_nor_locking_ops {
 	int (*is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 };
 
+/**
+ * struct spi_nor_ops - SPI manuafacturer/chip specific operations
+ * @ready:	query if a chip is ready.
+ */
+struct spi_nor_ops {
+	int (*ready)(struct spi_nor *nor);
+};
+
 /**
  * struct spi_nor_flash_parameter - SPI NOR flash parameters and settings.
  * Includes legacy flash parameters and settings that can be overwritten
@@ -232,6 +240,7 @@ struct spi_nor_flash_parameter {
 	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
 
 	struct spi_nor_erase_map        erase_map;
+	struct spi_nor_ops				ops;
 
 	int (*octal_dtr_enable)(struct spi_nor *nor, bool enable);
 	int (*quad_enable)(struct spi_nor *nor);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
