Return-Path: <SRS0=IoAM=FJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B987C433FE
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Dec 2020 06:31:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7E3422D0B
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Dec 2020 06:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7E3422D0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3+/e0q9JUlWJjwdbzGYmlhR/+quQf2lGFEG41WNxzsE=; b=udsHRCFWJalMyArFz+0ES8ERmZ
	t/IpQqW/bHFzTYVcieI2ncy4dmcvFLxTq1q1rNrEvLsnuom2aPfbQdrDhv0hbb+WjHkdMfxnn58Kf
	6dP4O6ZBIlfGHQlDSCeTordvPc0RFOvyYputjJ5joPlLw0pMN8txNXzVxCshXrpT1wiRQs1Fpool3
	sT+rY+c28wu/29A+2paEltVHguFmvvjM3TIB4u+oaDlR/Kf2Uz5AJGP9EvDxOaNdctnv1BdxVJL0r
	6bGlKidyQABgH1r5VQGyU6Dd/UrQbT+YECzwVew8OmiE32j+dpkL2vJgtn2eE8cfrMPjZLySkmqvc
	OH814isA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klR5U-0008NL-BN; Sat, 05 Dec 2020 06:30:32 +0000
Received: from mail-db8eur05on2076.outbound.protection.outlook.com
 ([40.107.20.76] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klR5Q-0008Mj-Fp
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2020 06:30:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSTHdsXApBs9OHBPuZuphHHzX+DXReFM/SDjqAzGjGq0omXNbs7KDsOF38K5b5yXwTzzAUzHJf1abFYG/r+OYm0msLNzh7lZSUofhIoPRCv2CgosFPBC443SJmImvdt+0RRIa9JWBsf1PQOb2CVR+sxTfuEzvh50C+zlRUTQneUQabJNMrnFwrpv4MqBsE5j0MGw6usGuZntI/DfsG/9wC4SdeSsCR/Wz0FEIj5vd1DQnc2llDenDF1KMfrAn4ykPOR4BzoUeblkPC68uDPZhk9So5f2v49Fz0D0CbNAbRvfpVBwi3Mg4SBoBF2aZ7e0aJpgLU7nvDunqW5Ql58UgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOldlmIq/3+lGUeGW0pezTSt23Geet+iBD5xa1aVKyo=;
 b=EV4fjQks8lDpR/SjEgqzMYhpalMqaiYRSINbgHkL1iDL72YV7v4l0xJdG72d51N+vHkJti+eQTaXrl7kv2fN/gqqWnzXYhcWJbvHrBp4kmh8r+xhRR+pfo2MzGwr5kNbbm7NRY+Q79CMyDFm4mIco2DqV23W9uDIlVkY96VUrhwhfGglwQ77ASEt0qeJBneHIGlpK4iy9pH24Xdd168gSptKuPot/P6Vqlgzmnp2yUVsnvyz4GkkvZXkLkqLFidFCnxY4DrF8SbKkZG2CwHh1Y+i+Mh0v5iSzLoTpqayjJnvrYfgsCQ1mW4L0l0eMd7nU4b3HpQPzd3B+OpncGfTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOldlmIq/3+lGUeGW0pezTSt23Geet+iBD5xa1aVKyo=;
 b=XmNivkv/nLqIoTOVtoY4sVVq58EHnk48ObPXXvdzjUxxsDoJMUh2c+guPfQkSG87ItOJf0fcGndGth8Fo7zg622QvSEaYyk48T1/tEhlplOfaEf+jtjYXUaOl/DC7J15Cp3nBQv+lfFVhyQeeG9U9d5JqL0P+QCAXYEhVFPNQHg=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16) by AM7PR04MB6934.eurprd04.prod.outlook.com
 (2603:10a6:20b:10a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Sat, 5 Dec
 2020 06:30:22 +0000
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637]) by AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637%5]) with mapi id 15.20.3611.036; Sat, 5 Dec 2020
 06:30:22 +0000
From: Han Xu <han.xu@nxp.com>
To: miquel.raynal@bootlin.com,
	s.hauer@pengutronix.de
Subject: [PATCH 1/2] mtd: rawnand: gpmi: Fix the driver only sense CS0 R/B
 issue
Date: Sat,  5 Dec 2020 00:30:03 -0600
Message-Id: <20201205063004.3099-1-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [70.112.23.252]
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (70.112.23.252) by
 BY5PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:1e0::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Sat, 5 Dec 2020 06:30:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bfe8ed39-30e4-4ac4-11a2-08d898e73e3d
X-MS-TrafficTypeDiagnostic: AM7PR04MB6934:
X-Microsoft-Antispam-PRVS: <AM7PR04MB69342061A5F1A35699DC2B4997F00@AM7PR04MB6934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eiv62BkGF7Pt+McrmnFjs+lZcJS2AhWUuP9XHNL7FSsT4THSAFj78Dq2EXHQ2MgKyVXyRU/gZS6xj1WLVwlsEk0BFpIFHpkoG72UHxDhgiVeEpTGs/9hSo5SScVFLfxfE2UulTWsOaz5N/rcb1h1/U1NmOoLqrrK6ucCXWTnp3tvZSqFbA5eL+3jkNopSl5d1A0CWwaJ/rDjCIIZFsUgs5VnocDS9110R1nJJpwhN8lCSapRLwrcx7uhQld0ohyRtyHc6q/NwYpXZbTa+aGQzX87XNeroWCFEXAbrLM7O//+U2KuNUYInlGYKaUtWedIfQKNMmKN3dNRWZ9YlLPYTc8cp97uOTkIXNnKvQr+UirL7jjhU8VyKjmR/PQdplax
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3701.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(69590400008)(8676002)(86362001)(8936002)(478600001)(2906002)(6666004)(2616005)(956004)(16526019)(6506007)(83380400001)(44832011)(26005)(1076003)(52116002)(66476007)(6486002)(5660300002)(66556008)(4326008)(186003)(66946007)(316002)(36756003)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UNsWEDlDcFRfA2XLXx6etdxcQ+y5Olhf6q+U1+8TYWKkRmsSuXRnkDUnijUY?=
 =?us-ascii?Q?TabQX2xyTh6Agmir2V4sH9D+4JA0L4IAy/g5+Ye9i2OVwPCARHClhFlLrXcH?=
 =?us-ascii?Q?y2pT5E3CwIVf8tJ8KekpyhGlGjPr7Ix1Ay6/XLJZdTUY2Q97XyLHMShxDg24?=
 =?us-ascii?Q?KV+QfQl7AskoVyqwUghXjslxpDPwXHq+rAYNxKdKEtSoVhzIsD0NSeLu2DJC?=
 =?us-ascii?Q?KQTo8IZ6zbgd3U9Sri9640uEzaDRC1KXDGIENaC5OW3Z4eWKiSeuVCypNJp8?=
 =?us-ascii?Q?igEuER0vFCH9lgcqG6RJV1rwmbfY87QjlzDsJ0Qw7YKvSZ9VplpBYQB7ASQN?=
 =?us-ascii?Q?LnXcg6DtYPZcQZTYKgIU2pYWsxYqe2jUnP5nOheJPx6EWvP9o5eqv9L/3C0z?=
 =?us-ascii?Q?+kA47PubD1mN4yQeIx9ZLwmbHs/+HmReaRQPgqZY8mofOPULvVged9WpDQsN?=
 =?us-ascii?Q?JZeEAo6JSD6xTTGkyQ1P3t8o77FJgoyluRNU0XO4nkL8IrxNExVv2Oa5RHVz?=
 =?us-ascii?Q?4WDyViLxVEKlRy4pXuD8qx2gGmYLcHG/e4TDpdzsOuApdjNaIzdPqNDcL6cS?=
 =?us-ascii?Q?9s5QxelsnXemj24Fd375hTnN8xuVabq5rTpGUYINgoD0cTEkc4eGEVWrZAy4?=
 =?us-ascii?Q?kZYcfjMRhAahniLOJbBLKbYEqmR0s84qp0mxK+go439Qqqbo9UMTy7YWtYHa?=
 =?us-ascii?Q?Fv1qsYJ9fI2WLYIe7OI+ccplysXsvn0LCOa/UYzkAWf1klQLUqKwZv5rD3w9?=
 =?us-ascii?Q?aEI0NKvs/iJnG6SBvmwqoVKjD9Ka/uK8mbeh0aMsQMFZimx5gxJqC6sTedUV?=
 =?us-ascii?Q?fVlYTW0h0ovVVWmvrkCl3cMCS5MVSYcgpKgnfRovLmdK8Xk2/wYux75EAHtU?=
 =?us-ascii?Q?rym1PPcF+dhkBClw9z6uF9cbYMXoy0J6nLeF6J/kEy6CV3E3fIdppA4c4Gbj?=
 =?us-ascii?Q?buLuHxWnXi9WxpJGi/BPYf8KPlROVXrNlAe3tbRjC9GDatBH9jVXAn2ajoBT?=
 =?us-ascii?Q?JDYS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe8ed39-30e4-4ac4-11a2-08d898e73e3d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3701.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2020 06:30:22.8438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sr5Y4XDCvQDTtiN02t4fV4fts6akX9G7DwRu4cfIDF76X/Qz4HMD5yq0LGO1mP3W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6934
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_013028_774614_69C8BA8F 
X-CRM114-Status: GOOD (  13.33  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

set the GPMI CTRL1 GANGED_RDYBUSY bit so dirver can sense the R/B signal
from all CS.

For the NAND chip MT29F64G08AFAAAWP, only the first chip detected
without the patch.

[    3.764118] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
[    3.770613] nand: Micron MT29F64G08AFAAAWP
[    3.774752] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB size: 448
[    3.786421] Bad block table found at page 524160, version 0x01
[    3.792730] Bad block table found at page 524032, version 0x01

After applying the patch

[    3.764445] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
[    3.770941] nand: Micron MT29F64G08AFAAAWP
[    3.775080] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB size: 448
[    3.784390] nand: 2 chips detected
[    3.790900] Bad block table found at page 524160, version 0x01
[    3.796776] Bad block table found at page 1048448, version 0x01

Fixes: 3045f8e36963 ("mtd: rawnand: gpmi: move all driver code into single file")
Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 6 ++++--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index b5f46f214a58..793a8e27ce66 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -181,9 +181,11 @@ static int gpmi_init(struct gpmi_nand_data *this)
 
 	/*
 	 * Decouple the chip select from dma channel. We use dma0 for all
-	 * the chips.
+	 * the chips, force all NAND RDY_BUSY inputs to be sourced from
+	 * RDY_BUSY0.
 	 */
-	writel(BM_GPMI_CTRL1_DECOUPLE_CS, r->gpmi_regs + HW_GPMI_CTRL1_SET);
+	writel(BM_GPMI_CTRL1_DECOUPLE_CS | BM_GPMI_CTRL1_GANGED_RDYBUSY,
+	       r->gpmi_regs + HW_GPMI_CTRL1_SET);
 
 err_out:
 	pm_runtime_mark_last_busy(this->dev);
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
index f5e4f26c34da..fc31fd084dcf 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h
@@ -107,6 +107,7 @@
 #define BV_GPMI_CTRL1_WRN_DLY_SEL_7_TO_12NS		0x2
 #define BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY		0x3
 
+#define BM_GPMI_CTRL1_GANGED_RDYBUSY			(1 << 19)
 #define BM_GPMI_CTRL1_BCH_MODE				(1 << 18)
 
 #define BP_GPMI_CTRL1_DLL_ENABLE			17
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
