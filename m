Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB85EB64D9
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jul 2023 04:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JK33zOQNp2emrz2aiUWmXsNlZd/yxvV3jGVjU2gn5Tk=; b=jYKb5LPlfaKmzx
	2vD2UVCoCwURYJ4vygqIH2TJCN9DMM+bBFGe9RhWsCDl/HidEY2cR25VOGM3oPasp0/4RX/oBG2Dv
	yZjFOmc2jP/aJu/Ba2iqQWUshMeMqaGm1dPLYl9Zr/q3rdhGcPfMLgy+6tzKVifK/7+QmNEIfETf0
	YzeIPC1OT7/V7duvTBFAn5wHB3mBSzid2XiKGSR/uJh9KY88ZsUeSI3/9vEe5nW8UX7HF+q608/is
	FKWz1x9LdWSN37AaOgAtj1ZQ8z3XkcDEHL+EcJOpyl6yJMASilcDVQ5h1pH0c05DUjO+CvQMxTOim
	Xe5jIcX0Y15BeRTl2dsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHckN-003Pve-1g;
	Fri, 07 Jul 2023 04:07:07 +0000
Received: from mail-tyzapc01on20713.outbound.protection.outlook.com ([2a01:111:f403:704b::713] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHckG-003PgP-2I;
	Fri, 07 Jul 2023 04:07:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ax3CyInYUVpNh1QUaQs+4P9aD6+UtlI09xGxLIMOCsQ57b6BQYc+xK9NCKvqFVxNloTG4TibI4VsUDy4T8UY6sTDOL/kMsK5Xlww5U6dverwzulY1GfGUBnvrqLVwE/Us76X8mpUiesTOdKOaI1BIUn8p/loRO3AA2v34uhwjpG3llLmSAlTiWnbNqGKw9eLZv2sBrTi7TuCm0bZ6zxrrnfI6KsLAM8/mgQbf3kYBC2HhY716roYsyoqPNUaJsAdPjeDHjmVxxB7/9DnRzzb7R1DtBKyF+R93Hds7MX/77xXiVrlL6o4gG5WZNsxF/oi29/kBZgFESorHmfBYIMGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2q2+f3UaUtrv39e+e3MvLdBDED5EJrbT8+Jgrx1WuyQ=;
 b=iq0GEOI7GtIG0Mff5+FBHxGmWyueKig/3J5nJk/8mQkg9kFD7HolrSBCg7WrDQoYkjsWNJayoMGIqVWkAUR+RiJnWYe3jTjnGFpCH0sVzyJooFKGwZMa6mWcENeVqkVDCcB6LWj7MKbngs85pBsuPk9XDS9yGHsUx/NrFu0fCkPQ2e0zukKHYKGJpTiAd2MPhJ+uMUlIhgKfbWk8cYXTvLntN4TyHClNFj7B7WOay0NVOIRiaA62HLdfohJhn5cmFPhBpuutc01npbRHClKl5oNYbLQKLXXtsPLb9A671u+Bt2RiAwx0OrJlvlWcUcOpRriG4c4sdxr+pkFAK3HPTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2q2+f3UaUtrv39e+e3MvLdBDED5EJrbT8+Jgrx1WuyQ=;
 b=Bp+IGglsMA91j6hCJiKFP2p+QiavofrEQ4Hg7zjasgkGjuzCS0d2Ug4GkaQSiry+56Ar9yvywzUlw8llaZO5qD9Hiw29B42lG4mQb8xgm5dPh6Joa9arWCja+2WrXaeonLwz9OsLtjKQEu8r8tfk2y1oePpiXWbBfZUqbTdWpptR4ySLQIVvYYMC2Wolqbw4U10QtcN5+3c0sjWRIzEl0NnOIW+FjHepOkfyeA3FA2zMN0k4xHi1oAHO3KsdWK+92rHER+I9oBdB7FL/HWM9Wf1JuUpJCQMwQvop6DvV9ux+CsOUyn2yqtCHOmYh8GOpTngo4/02GyYuvYYE+KEyeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5470.apcprd06.prod.outlook.com (2603:1096:400:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 04:06:52 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 04:06:52 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/18] mtd: rawnand: atmel: Use devm_platform_get_and_ioremap_resource()
Date: Fri,  7 Jul 2023 12:06:14 +0800
Message-Id: <20230707040622.78174-10-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707040622.78174-1-frank.li@vivo.com>
References: <20230707040622.78174-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0112.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd4481e-b5c3-45c2-5278-08db7e9f9870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d1uj8fa7Xr3yQ5L/HzmNsiBywlz+cd36XsMfdle9nSCFbPyjDxXaLQBlKbNp01YhVZ5pIwOEbTSMJNehT2QO4wrYBkPOM+1rf7HuktxXgDZ1kD8iPeE/JFMcFtael8wapSistgpk3N613twGUprRZy+2ZysMGQEsOwetlUaCM7JvQL2eNnFmeFtQU5qbzEVK1e++WfJc35bU9A8BTfJZ/m0oi+whaW567XddmQHVJSJquvWGnKGRcFh8H8+JFn1A73ZPNtXxF4oErqPzCcgaKhYxS0amWqrKc5Mv0UeOH+kUY7wOnJ+mA8xf2hAaXtujnwdYA6HxCNNHEfbeaceB8hBEFBQNH+jYavm6A55CE4j97z6LD/ofKAuYh9aOH1r93GuNUfSdD4bXfj79Q8ihdngltKVcK/1sIPdPW6lPYeGXdz6xAzykdwIiAz+xP9NfPLtKizzVEbdAE61aP3Hqd6afNntMuC2c/y1WPRsOO1XMnWJ87n1OP17Jb60rzuHl5ktHX0RUq+2sQfmfLnpv/jVpg1jMdzpBacksx0+P1Ah1cps46xBaXY7ZQcVOvdVX+nIpXlXG9TOd34GcxJ8tnjH7MgMVhW9bjxp+BfVTaO3718W0M4zTRyWI7ACO3DzH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(478600001)(6486002)(52116002)(6666004)(110136005)(26005)(186003)(6506007)(1076003)(6512007)(2906002)(4744005)(316002)(4326008)(41300700001)(66946007)(66476007)(8936002)(7416002)(5660300002)(8676002)(66556008)(38350700002)(38100700002)(86362001)(36756003)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?185zHx+9n97puVq94Czeth9zzrevhpRC5JubBrD9IE9GWkFMrg4ubDIrQiKJ?=
 =?us-ascii?Q?Pm29lA0oHafWHAHGqzHE8WbLYQHjqeeqpvc7bn6D5HZcg8bbYppw2g0AT53m?=
 =?us-ascii?Q?kRdHym+RMTw2lhdlAR+KIDiQpn7CVHjFdOfs4V77G2+Qvhj5JHqqvGzHiC3/?=
 =?us-ascii?Q?QcBnuWptYrl1cqaKCs8XJhhUKuj/mBQHf8+dJt9SJUdW0NEmIcwV2ookBF2+?=
 =?us-ascii?Q?Z2Csw4K+Cv/94J08SPu2En7jIMxWLEcdl7uA+4A05VPL2/lF2/j+Lxb1Lm0R?=
 =?us-ascii?Q?T2f3gSp/hJPlwaqEDyPGujQ3mKFQmL4ch/k89IIQjzKhrhMiu/jyxlogG/8K?=
 =?us-ascii?Q?4DdQ6oZUAkDYeKv/tlgLgrRfVxfKsw8ZTsBzhtfQMBZTMQ9va+VZGr6RA1nP?=
 =?us-ascii?Q?QbkNh0rEtlpiwxsIy+IdQVnhTiS1TebF3iaHMbob7UhCaLZeJlrYm2vqfv2f?=
 =?us-ascii?Q?t6xo1Rzx1Oc1vJrqu6Vo53n9H0AhKM44+l9HDYmccsacQLRetKAp+K3GUTM0?=
 =?us-ascii?Q?fd11jpdegdsueF6zR8wSoG7RLL10ORpKXi4BvhM/mdJnwp0oxCj9i4g41bFZ?=
 =?us-ascii?Q?axZVfb6ejVJ3Mg4phSszjHM9Ho+M1zpO7sqWXXMflFZQWdk6CAoYW6ORJ/7X?=
 =?us-ascii?Q?2MeGkyRVez2oc6yu2qOse7cxHQLUNwfG3jdoBC2paTJOcTj5lcpuEoEE8Ws+?=
 =?us-ascii?Q?vezm/UHNGqepzYJrFN/OFKBGrab5HpVdObyW7TYUCGIDvG0wwVrs58LuUEh9?=
 =?us-ascii?Q?b88DNeLZ+5UQudt8+wt+7/yrocZPt+J6s1+YJuWwk8etisBncuBbw8Y+mxMN?=
 =?us-ascii?Q?3/PL6ABmby5htkFU5lriuO/4topgY+8VPfKfRTnQVEgky8IJ+bBQh/QjAMXh?=
 =?us-ascii?Q?M/uGxnwXi7HOmnwGqId3euOJ0Jw1aGL/nhhTVR1oM1qskuuielEQrHcf5Pyp?=
 =?us-ascii?Q?8eEYgVwnsCbMSl5TRSfVh1ldm45qO+I8wvJb4H8MW3s75uRm27urpI8bzwrU?=
 =?us-ascii?Q?6KKAhC37Hg4AfvWzOqJVvxx86yyfC2G00mrXxaOVtxBLGFmR/0UQAq1Q/Wtv?=
 =?us-ascii?Q?vG4Fh5SDRj5N8hXB9l8GAnB20XzosSh4WReA9Fkp0tGB6g/Kvj8rzgCUFLyI?=
 =?us-ascii?Q?HxUbJlVqkrrFsY/KR9yC2VdnsaEGyHoIXalnKsNkAdDpu5irAUIStgmZM1Mx?=
 =?us-ascii?Q?dzRgfRluDEW1DloQJsgB+tVHzppJXG/ocKwFYmiyH+lgSmMW7FVUbfrdrdAf?=
 =?us-ascii?Q?/ko6rP1kvt0e4gF3A0zaMS2r1+Y9uTKA+blF8z4KiOlaYbFDHUV/mUxIml3T?=
 =?us-ascii?Q?yYQczO7EOVgnbP2SObMID3nK/nsVhmpFR9sPC6duqY0kVY20qEHodLR1Jhzu?=
 =?us-ascii?Q?XL5/6br6zsGe1B7fIrpzwsDfQQ0HFEoL7hFtD4yS/Iuv/zIxC5Vkgr71p2me?=
 =?us-ascii?Q?3coDBpTNdlp+YckHlFut3YQcoc2WoVLFtOJpCxVmemWKOt1TzEx/oTeYup2L?=
 =?us-ascii?Q?ZklhBetQ3lhPWjelGkvMPqOveBeZ+yx5O7+6fmSPfsRj2+GJfQw5zmsG7FqC?=
 =?us-ascii?Q?+DFsI5Hk5pL3w7YxkLaziT33+n37Zjs0H8XwFZW5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd4481e-b5c3-45c2-5278-08db7e9f9870
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 04:06:52.7549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9izdOpqDKAb/esxGMHs7FGQte1KimDJHa4kw3Px6HR2eC1YjTw2K1uCWOnerWJDRCqSCeLMmablsswPfhiZtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_210700_757251_A8268B32 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 81e3d682a8cd..3f494f7c7ecb 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1791,8 +1791,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 
 	nand->numcs = 1;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	nand->cs[0].io.virt = devm_ioremap_resource(dev, res);
+	nand->cs[0].io.virt = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(nand->cs[0].io.virt))
 		return PTR_ERR(nand->cs[0].io.virt);
 
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
