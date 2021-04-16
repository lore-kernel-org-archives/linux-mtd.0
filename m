Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF77C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 07:51:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAA8D60FF1
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 07:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAA8D60FF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Mv3dN+nTY8nX57/GboPGG6xdHKDSPrPXK3nB79kH7U=; b=NoPlIeCkE4g2tL/+M7e1UreMH
	cEyGc1L/DfCW4LTyj/LNjjhh90AELW9dC+QSl5gMQBVDY4T3444G5i+jApCqXCL+GSDxcXO+pxLda
	fNSoVbKHg/HAmWbSDtTAHx25iQrcebfJPFmwmj0J3o7sishZfTQHFjMvXc+5DgYwlafrh2buHa3wG
	EkJK2uUTLNy82vJ3tov9yLo4pEN5mgY+UsuLNzM6dipQI6hJ6A9cOB8BeErn84xml6eDyaaWDqS6r
	bFqNm4liELhkDi01BSsoFHtl3rEA6yKYL5QdzqviQk06PkSoLy7zUv9mZOtzwFFmIlIOU5zvQJ2gA
	VDR0PB2eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXJF5-001FEK-GX; Fri, 16 Apr 2021 07:50:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXIxA-001CSo-AA
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 07:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=tDeIvM28hAiKa+JGuXCNvwJqseHUXI5jnRuGqKhj/b0=; b=rVF/5mKSWrnYUZMXblnffJ6Go1
 3rIorL5A7fOS0LqaZllSBHeKwpgOSY7AkBBJo5iwln7B6PV6l9IUdzgNxk+8D7P0pKrEqT9r/yOPH
 Eii90TOt5Qp9fyd+VQJojCNfab15aqxDWuFUU/pDiaO98XsYEJL9W0kdiJzb/hyGI6F5Wio1u4abm
 NViG2TZrBkzz0LlddiXZ3HevnOcsoYs7PLxQnm7Al6QUc8YT/l6yD1ThyGdPXn90Gwijhp76Q5w1M
 eEvYbAIeawRr47SVopbjrlkyGDWBtM5jFl6Bza2s018/RIdAT9faNE/8M+7YdCudFs9LFtnNRiAIs
 WolTtzjQ==;
Received: from mail-bn8nam11on2049.outbound.protection.outlook.com
 ([40.107.236.49] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXIx7-0099Xa-HF
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 07:31:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2v3eC5NCDqSUhDIGUK4OUCsc8e8AVnHOFkB6lL1dU9wSWauTilsJlCB0k76ReT+6HcnKGPHduK8Y9fe8VQIxYa/zhSSmm6uBPkMh89TbDowBUG5IpqUqm//+7n744Kdtd0eLtP1BhFv9c6mVM7EP6gf9KsCo6oIkuGB1n1Cd3Antq74UolBFjQf7UKCcvVYWEGkJ1xQsInTOv4RVSLObSJwO2GFsA/P8agFmrC3nwjwMZ9hO6Q9EWSTS7Ypz0aYyyHSMp7+UC2C4/E4UhNfM0hO1ipdKuWucI17LDVfIB/Q+3ld3rGfvVVCqhQrOZNI9y5bjKeMnJ+Hg6OtbXqx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDeIvM28hAiKa+JGuXCNvwJqseHUXI5jnRuGqKhj/b0=;
 b=Ac/THzgdIqV452gB0CyPGdEA2DDwHw3zjfxrA28QziEfaOYRN/cXHdfq3RYoQCyk6bgsecunde3cft4g3Je8AzoQyjIvBorWBqwxN1xXsHXCb3wBpcV8HkB4YPwjYKlTBfwevOf0D7sT/h+lQI2MsQa/C5f+HIHgDhN00nZnbeD5urVZbtSEmjUFcxVyYOJHQ+o0DfsWjfhcd0pefgSnuHeTPYsjTIL09KzNx7NY2/xxZEUJ+qcxHsxko+v1Mb0VoKFscY8kygukB5Wrx/tlSy+XFaZLkh8I7b2j+CKDFDOhunosNGt98DAvRqcEMshD2lz0boizeQPfx/fRVNHkpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDeIvM28hAiKa+JGuXCNvwJqseHUXI5jnRuGqKhj/b0=;
 b=VqgOjw32fHCd8uXk6UdyxrULhidXjDFq5A9oJp0q//hP1cb/6UDLTGxG4F5ohFNcamuhs1Wt/FJmXIsFC1DSRmJ1arPP2KD3dcW8WihC673elf1OpgaiKlCJpnvMlh9yyU6VCyHFJBDXMhHVLViFZ8h5E0//fbiEPxnq6q2oJtk=
Authentication-Results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by SN6PR11MB3197.namprd11.prod.outlook.com (2603:10b6:805:c5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Fri, 16 Apr
 2021 07:31:43 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d%2]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 07:31:43 +0000
From: yaliang.wang@windriver.com
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com
Cc: linux-mtd@lists.infradead.org,
	Yaliang Wang <Yaliang.Wang@windriver.com>
Subject: [PATCH v2 3/3] mtd: spi-nor: core: move Spansion checking ready codes
 into spansion.c
Date: Fri, 16 Apr 2021 15:31:06 +0800
Message-Id: <20210416073106.1267805-3-yaliang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416073106.1267805-1-yaliang.wang@windriver.com>
References: <20210416073106.1267805-1-yaliang.wang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0014.apcprd04.prod.outlook.com
 (2603:1096:202:2::24) To SA0PR11MB4766.namprd11.prod.outlook.com
 (2603:10b6:806:92::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-ywang12-u18.wrs.com (60.247.85.82) by
 HK2PR0401CA0014.apcprd04.prod.outlook.com (2603:1096:202:2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 07:31:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8142405e-09dc-472c-5b8e-08d900a9ae7c
X-MS-TrafficTypeDiagnostic: SN6PR11MB3197:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR11MB319731089D63855957C63A7C9F4C9@SN6PR11MB3197.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gdTXeF6YTUpnQW/lM+NuunHEBW3hXtL6BnFRgeDDJIhRQUAJDekewmxSrT7Sh8Pq1WByp3eL3O11x2MuatiV65ajl+oUu6t5Ks7AfD9WwAnhL90jeoUEXxzpH8rGxIuh5ruRAcGFyZLr3XtZhbIqb4DOAkFLIZ8EQEIKzPFOU5SoD/NXXKPycHRdNZnG6qXsRa4FHTb/6buXtA/oriv6RMXBvDNyBRiFkjNebGbop66rTNvXjy03wPsLUdttU+mdafytsm09ihsg6VtGn0IYWvRp+/AZXpPsP2mvocL6sR9CXjnhFm54ynAMMVdXn64AK8mYzThZptm92JHp4KSlqNUh/UCXNCnuv4YlnZJDTYJ15vQJRtiGZp6BubR2Wyvdh5dZDMqj+x5LQ4PT+A4XCC/P5otgaNrWN7mrmnwSLSHcXtoJqLXbSeNiTIiMGmtpfVmBMN2NfyIs/3iLat+JPFHiZFlrsUy9A2VGMvC7oyPNKR0bQF9hS+Hu+zZRJgtKJ/pFofasT39/vV4fwqFKnqaXLJY7CMuugb82rUNshQ7ew1gbyo/Er54eVguaQ7lFJjJp8iK/QhSQhB9ah6qemjrFM4CsBBofVfYvC3kCaJKkXlUTQuYWTcEoEV20Q7WzEvkUOyKSMG8jyQ2bzX6lCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(396003)(366004)(346002)(136003)(2906002)(8936002)(2616005)(26005)(956004)(316002)(36756003)(478600001)(186003)(86362001)(16526019)(83380400001)(6512007)(6486002)(8676002)(6506007)(107886003)(9686003)(5660300002)(38350700002)(38100700002)(66946007)(66476007)(66556008)(52116002)(4326008)(1076003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3ZCnRSPsN1tehd2oDek2sv4he/5aCtLCgjQtpiiqwbFLfORiJMpMNAtAR6wo?=
 =?us-ascii?Q?XNlz1CYzWPzS3RQSZwrgpld7mFMhF+r8pzZicD6HFlHlVwkxt1FS5KO3sQLe?=
 =?us-ascii?Q?NLzPcytCRS+byylEuOi1jc0wuITw6K0oRjaXtXwKHT2NOuDRvDLaXNQSG56m?=
 =?us-ascii?Q?yyPXv3K/E9T6y2fESxZ1fVlwtm7kC9Lu6Ot91UNfgTwAtqoZgGYCqkWhW+BS?=
 =?us-ascii?Q?qN809Ul/fOlkGclvAe2DeXBEi83fhcvuvk6l3yIka/oLI7P1A3EplsVesZ/e?=
 =?us-ascii?Q?xwQwO6asXSaBlIqEjovPOrIpBpF8/fdeLuRg7NjO6Q3oCLHHdFN0/BpQ9PLz?=
 =?us-ascii?Q?BgKn1zaCmFdtq3V9Sbs7hcK9wmHwU41bdihmu/BUj4mvYMj3sBeS2wDocrbv?=
 =?us-ascii?Q?USwWqgBBKEIJepPtlAkvH8qDGTBW4rsvM4bsXjZnyBXD8aa79f222JRIb/wb?=
 =?us-ascii?Q?efNyPDDZie0wLjWrfA8p0lV5EIsOmBjcRe3VmOJoL6rElZrh/j0JtlXdah1Q?=
 =?us-ascii?Q?ULxwxYFcxRG88jKXsW96Ong2QERPhamsg3afT9EOn3YA7UhaIKHJtljLYg/W?=
 =?us-ascii?Q?Yzg+4X8RVHGMopCQV9CH89C8o7tqtQORW2VwLPo+5BUYAfvcF3nyyOtllD1p?=
 =?us-ascii?Q?CAeOG0vSQ4zt6uBQqkoWontKcNWhVuy/jmV2WTzXKrRmYxMV3dw3ij0fmKvq?=
 =?us-ascii?Q?bfvWytzNlrvOtF7klnJJpanPaKfsXmmCu5qD6ucSz3YhSDnqg2b1eZQm7D2X?=
 =?us-ascii?Q?jYQgZVP9SmfoumKnxDoJ4WTMrb/dbT1Lhf8ZlVYsHiGgOJTRW5TlVhOd4xEZ?=
 =?us-ascii?Q?Wcmfu3Ry/PTv8hKXlcCNQR3PjDzU9/o2SzOMhERO+z3p33AL0gXXAq6y+EkA?=
 =?us-ascii?Q?hZfl5tsr6404/vvNUpZ0N9Dx2qKnvs+Doc8Yfs8kEaLJbuLh0XXbc2SPkToi?=
 =?us-ascii?Q?gjJbK/Xo9Cd0EI1zrZEL4hfJOX+2a22snJloxULgoaEXJm81nM86jiGePrl6?=
 =?us-ascii?Q?aKVEXK12vHgZbJ0YI2ANbLTIGD2sE75nVbMZqXz43AzePh9gjpGIeEJYWJ0D?=
 =?us-ascii?Q?1btk9qx/YZ4mQ/F39o5xQWAGKHBabpt0jm0x5YrFlRYP9lsd0kIYycDjqOqi?=
 =?us-ascii?Q?0MsUc1aTO9K0W3Hwj+gJCiAADupaK2LUzVQjY9gXFndNMhHl6n6n6712DJiO?=
 =?us-ascii?Q?BfeGxcwJLwHR+3X8q7Xtyu1DsI9bksrmC6LQVlOKVb2qKmchL1VqojfO/Skk?=
 =?us-ascii?Q?quCRHQQC4j1EWZX+2KSxCK71eS2nh4Uad9ig+mxNH4urQ6kMcLzw0SAakeBi?=
 =?us-ascii?Q?HOSMxZOZT/nQ5FmHeWF8Z4UI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8142405e-09dc-472c-5b8e-08d900a9ae7c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 07:31:43.3394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQ6gAx/vMfFbIWTM9JlA7jn/B/+P0h96jrwO+gxMSvkL6/+Nef3y6cyqpGwW2cu3TauNQPQIDivOPSUT+uVZnHdfuC84FOdBho/RJdOc7gE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_003145_611277_0E5DA78A 
X-CRM114-Status: GOOD (  19.55  )
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
Changes in v2:
  - Rename spansion_sr_ready() to spansion_status_ready()

 drivers/mtd/spi-nor/core.c     | 26 +-----------------
 drivers/mtd/spi-nor/core.h     |  2 +-
 drivers/mtd/spi-nor/spansion.c | 48 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h    |  1 -
 4 files changed, 50 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0e7fcbc4136f..2a0dc8778bc6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -611,7 +611,7 @@ static int spi_nor_xsr_ready(struct spi_nor *nor)
  * @nor:	pointer to 'struct spi_nor'.
  * @opcode:	the SPI command op code to clear the obnormal status.
  */
-static void spi_nor_clear_status(struct spi_nor *nor, u8 opcode)
+void spi_nor_clear_status(struct spi_nor *nor, u8 opcode)
 {
 	int ret;
 
@@ -648,28 +648,6 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	if (nor->flags & SNOR_F_USE_CLSR &&
-	    nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
-		if (nor->bouncebuf[0] & SR_E_ERR)
-			dev_err(nor->dev, "Erase Error occurred\n");
-		else
-			dev_err(nor->dev, "Programming Error occurred\n");
-
-		spi_nor_clear_status(nor, SPINOR_OP_CLSR);
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
 
@@ -3445,8 +3423,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	if (info->flags & NO_CHIP_ERASE)
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
-	if (info->flags & USE_CLSR)
-		nor->flags |= SNOR_F_USE_CLSR;
 	if (info->flags & SPI_NOR_SWP_IS_VOLATILE)
 		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 02c12e04811d..3c047c9ef372 100644
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
@@ -446,6 +445,7 @@ int spi_nor_read_status(struct spi_nor *nor, u8 opcode, u8 *st);
 int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
 int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
+void spi_nor_clear_status(struct spi_nor *nor, u8 opcode);
 
 int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index b0c5521c1e27..824aaa4ff536 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -18,6 +18,48 @@
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN	0x3
 #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS	0
 #define SPINOR_OP_CYPRESS_RD_FAST		0xee
+#define SPINOR_OP_SPANSION_CLSR			0x30
+
+/**
+ * spansion_status_ready() - Spansion specific method for querying the flash to
+ * see if it is ready for new commands.
+ * @nor:   pointer to 'struct spi_nor'.
+ *
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
+ */
+static int spansion_status_ready(struct spi_nor *nor)
+{
+	u8 *st = nor->bouncebuf;
+	int ret;
+
+	ret = spi_nor_read_status(nor, st);
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
+		spi_nor_clear_status(nor, SPINOR_OP_SPANSION_CLSR);
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
+	return !(st[0] & SR_WIP);
+}
 
 /**
  * spi_nor_cypress_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
@@ -289,8 +331,14 @@ static void spansion_post_sfdp_fixups(struct spi_nor *nor)
 	nor->mtd.erasesize = nor->info->sector_size;
 }
 
+static void spansion_default_init(struct spi_nor *nor)
+{
+	nor->params->ready = spansion_status_ready;
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
