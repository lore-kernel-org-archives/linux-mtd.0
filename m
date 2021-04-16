Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CDCC433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 07:51:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7277960FF1
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 07:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7277960FF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XB0pM0Xfy+dwpZf9XfyvG0fFDyC1TRQBQsvkpJ/i7nc=; b=nK3qPsKdJcJi6y04wK/0TRsl3
	O/IObg3jZIiFn3xc+/uVPI/3h0FmaLpTJAFSHq9B8ZGdBZ+Sk2HyVh3h0JbqWQGA6wqt+fzlIsKQC
	zTSk4TDbzaxdhd48ng8U8QvgBBgd00S7D8+8wj6YVv97G1IyU7jaaU1XTGyt4E5lb+0KO2qpuilCs
	B7SHFykgvV9wNuhEFS7qR2Y+WN+mPO92HjnUnhywPGF/Yjjkn2z1DLM6OpBpmHufTzKGfRhgJiLPC
	4i8wlCSTWdM8QS+5SaVsRPMnd5ruja1Gvye1y+gjBN0PJthOwGjgO1qKeV+8RsWUuMn+zuSRoPaPw
	x0eL7aptA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXJFb-001FJG-WD; Fri, 16 Apr 2021 07:50:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXIx6-001CR8-MN
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 07:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=1dqCHggfF/wU8Kcu7mLQ2UpvIPE0NNBqLCIbP9uXowQ=; b=HCPCZWPkkry1ZyEeQ/CMbNqSSS
 GHrsqtfRENSU5LpdAGRQdl6e2JjYxJVsZLEjSOdJY0vsn8VkaOMnd2K7pk1YXWI2pE8pt4HQgdId7
 ekwbVI+Y4yn3qOiKIDAwe0L5v2m9+lFAtYwd1YTYkoTHHWMUsmeRZVD4yu1cnpq2qdLXdvpuwisne
 GRRZTdloZRdxutCWCWHGwgMkPvNJTwkdK3RCmPIUdIUBNHNALnadFSYgEOqpVt5C1z4gA+BL09ZHg
 ZCw044dbmnkQjNLoqzAlFMYPibAIpZlxajiBM+bhJ/17a7u87w56ymFSuXpZG30ZWdtSRze8/anOE
 Wy9Qqlzg==;
Received: from mail-bn7nam10on2086.outbound.protection.outlook.com
 ([40.107.92.86] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXIx3-0099Wo-KZ
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 07:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FE/owRQntQzKYTQTvn5UUivE536zxNW/6X9hKR0P3MSpKL2CEojm/E/G7WSCKuBkphd4JHXm8+6473cUazXL2wQi3iC8GVuv7CdMQMHyhunpzZUXTEc33DtAT0GSXf/yS9May0hOr933TRh2G3gCEG3Dxry8v9gh4AOvVHfItKuFyeVDp3RWDBbbMuFMdnWeJhlufMpgkPXpxOUOw+CVO+XXDP3bhz/gs6Hb744DYyAUD94iQi2bI+CobaBEc4MpitsEB/2X7A5EfN1aUAoU+bxcHqLG1QaDX3CZTx+izLG0jjBePWt4VmNuPD07azxs+WkYDEyUv/VJ0u+yeYcUVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dqCHggfF/wU8Kcu7mLQ2UpvIPE0NNBqLCIbP9uXowQ=;
 b=Q3TEsnboyL0hfQZvhdIpNWUvZO8l9jmA3F8G4tMr/IoTKJHHhZKMp+1AGH7eWXGq06n6PkKvBqavcKdk6ocuGaLEnOUdmHKX3PLUs926gkUR2zmRtfI15FaezYQrWeMcZwCMwtEEfNzYvdANr0OPRW4oTIQWplrrcksRJqRqU9/Qqo4OcGGAVe+CzHKEKRCvAn4N5l0KhqJkBjOubmnPCsPhaEONpDHAsqpoSv7r9kUoyL+blAkuAO1YC33y8YPJ8h1a2ARdAAszjBpgXhyd/C5vEau0g9fSGSK1aLClFHBfrujzfctnLV0Dm+vbkraXrkVbnFXvCDumlRbB53rHvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dqCHggfF/wU8Kcu7mLQ2UpvIPE0NNBqLCIbP9uXowQ=;
 b=JWx7m10Vl16FGaz0AGI5ErxZizCUYEd7hrREhWkyXu8HlM44t3s+xlZYe3Sv2Wkvtyc67eqKS8Qjg3xAnh02ZglnovgkcjvmCO9SiNYmu0CIdCZoAujvB0iWbrmdIod8BF88S6PsurBnlCcSr7PCWYH3eeqGpYJK/XtX29yOeYE=
Authentication-Results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by SN6PR11MB3197.namprd11.prod.outlook.com (2603:10b6:805:c5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Fri, 16 Apr
 2021 07:31:39 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d%2]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 07:31:39 +0000
From: yaliang.wang@windriver.com
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com
Cc: linux-mtd@lists.infradead.org,
	Yaliang Wang <Yaliang.Wang@windriver.com>
Subject: [PATCH v2 2/3] mtd: spi-nor: core: reuse spi_nor_clear_sr and
 spi_nor_read_sr functions
Date: Fri, 16 Apr 2021 15:31:05 +0800
Message-Id: <20210416073106.1267805-2-yaliang.wang@windriver.com>
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
 Transport; Fri, 16 Apr 2021 07:31:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7515efad-0a85-4db0-735a-08d900a9abdf
X-MS-TrafficTypeDiagnostic: SN6PR11MB3197:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR11MB3197033694C1D5AD08464D7D9F4C9@SN6PR11MB3197.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 816dKC80BS63h4VIgUEutoMjAjIHXpSb7ci4lTzDiMmN16+VYnm937W/aeJdw7sP7gLPBj7aOu9vbcuhF7F3fW4gyzXwwyvYoOXMOcQZhhNVC4ClGr/Y0mA+5r2qBjoTpnavkDcdX4HxW9g3pTVRfWRISCEcZ5BmB1YF8dOMp00SHaagYMLNcBflB/oKLKYUngJiKl1TxjmSLITAmqnSwb2DmnN8qu8YFE7CBIW91dc4JilHL9y3OHPg1PbSs0cziBh6TEf3F8P7CcOrA6XrgOCiyoBaG/R8jevfuzUcsv65BTLfr7ufE6HHsHNF43TCFZF0NFNx+/jw2hYC3XlJd3iFQEr/p+zvVsBJ4642Qo+HluWK0hWBOUqmDPBA6Y5UCCfw/uC3oyvpAPiV71CPUhY66vn7rpL2u2+nyHRjDKz/3jdLEjhI6UDpiXU3OPvn2s6MsE+1y9wsvEqZc30/TqYnsrz/IkBXiiG/s17CN9uxE6xKnPphcrL1mfGVj46bHNT6oU318ItsSnuUJL+onLo9lqNBKQ7Y1x0jxNmjyGLC3z1hxtri4zTvV23hUGTJkBK4P9/GjiCymyA8sz4xYA9WgykfH3Szi73GVOVJxCuh4YrXHt6pjHYIlQpKbC45aQSAk3ff4E+Olbh6HX042Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(396003)(366004)(346002)(136003)(2906002)(8936002)(2616005)(26005)(956004)(316002)(36756003)(478600001)(186003)(86362001)(16526019)(83380400001)(6512007)(6486002)(8676002)(6506007)(107886003)(9686003)(5660300002)(38350700002)(38100700002)(66946007)(66476007)(66556008)(52116002)(4326008)(1076003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HizauaWntKgKnsca2A/S7EksiGspkwgJG59BPjoQfdBhMRYKQgid84eNdmFJ?=
 =?us-ascii?Q?7G8JKkR7u6JqmvI79fT8Naw9VDNxHFsESm5bMPyBD8c1ZvFRXIa+v5q9a1Pe?=
 =?us-ascii?Q?90Pdkv14V8ul25IyEIEYrfNN+33FICbGAD3pF72gKNijEpyRXeCgF+JwI/uK?=
 =?us-ascii?Q?9oLxVOaQ8wRxvtDYGKQtIbIO9tTKZg6xfH0rN6T61Cjx/u+uxfXtjF9dZA75?=
 =?us-ascii?Q?tR8awJYveGi0xrc/7XuR+UtjDyZ0FoxUm9U46jlgOC3BzonKUu4CbqN/dVpN?=
 =?us-ascii?Q?ukR2rizVU9Yn/NoudzNCfuq0KXN1+eHYVatG7QoPYSkrdRi/fICKIGu2gONX?=
 =?us-ascii?Q?jr5/xfivonDZVRN2U8m3k4/U5yIUguZXuyxUNAjvRgMVW+CV4bWNEcUqWVxT?=
 =?us-ascii?Q?EsR0sQ3pXpKsq0mjXXUSieendUPR/hJdabIJIgGMz2Hoa12zYtvUWKsBnylN?=
 =?us-ascii?Q?cnF9e2LTh2Teuu2zWl7ac1RbCpvzSJh8uPGof2yJrNDJJVWFXdl45twdr6aW?=
 =?us-ascii?Q?GoYqclWT7qnPU5Trv9I1Vbz9UiLlKQvNYIbzTBCi+wKcphT14anTENfVjWMV?=
 =?us-ascii?Q?edkF6Q36X0+28xsLZbj7ZeqYFyyiGdmOzSm0Ido9Q008VN0Y2zAcINLfHMWT?=
 =?us-ascii?Q?ZTbm1hEa39rrw+nTYYQAXCrAcGEWIxNcME+xFd5nnIBr2uhzUfkQ3kLc7p8I?=
 =?us-ascii?Q?LWRzqAFefyreOhq+lj5HSlEtRnrV/gsuijYqfDbheWAmSht5ZtEgtrLttW1U?=
 =?us-ascii?Q?dWq9uBiQumDiJIG9vS1Sn3jRzwaUKfzaiSBnbGlcpSITaOlbiV/nsgMwi9tL?=
 =?us-ascii?Q?PvN0nLDuh9TW13pXS8FSZmGNmpqF9nOMkVlxMkriNVqoptLGXggbdg780kBt?=
 =?us-ascii?Q?nqRplG8k5LShNQheA0flWB8Ep8YcvkDR4hSDoVh1qAZ4nYpkuAvDww5+jZYI?=
 =?us-ascii?Q?hhvQIVKdMERewWqjp/90hc2Yo4MPfDm99SuMLnl9yoRMLxEO6Jet0VvTwRVb?=
 =?us-ascii?Q?dz0Tzptk7/kA+Dc8qU89xyL3sOlNYyawYz3VrN8AxCLOEbw41V07zbfhKbG2?=
 =?us-ascii?Q?wqdJmosvezaTMcTsgdqMWoLSDqi0vUI1o6hqnk/Db6XQ0xbdkAzzgOxEeD99?=
 =?us-ascii?Q?RAoo90QTG4iKdn9Kio4cOFETiIKQ0cfmBNZva0dFh/hpIEu1+qU2mu4/zNdJ?=
 =?us-ascii?Q?uIlkHQfrMF/tzG+UmCxMt70ZTws9NuSe50EhzskWh1oA737dfNOqs7HYPB3n?=
 =?us-ascii?Q?y3tK4+AWKTrsTeeuK+aEvjsUj7Rr3bpUQZeWEa5z4RiDqjTNJya8RXW1u0bg?=
 =?us-ascii?Q?5PqsZW5mCnw4Ek8GplZNarsU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7515efad-0a85-4db0-735a-08d900a9abdf
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 07:31:39.2772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wv+7WQFQ+yKGJ1u/bG8DtrxgFdJy3JHaf10NotueO4oa0SStHeyYlPeuRRUxHUQsgO960RIr60fOaz3cmTBbH/mKikjp1Tu2/iyyVNZ89jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_003141_712634_156BAE1C 
X-CRM114-Status: GOOD (  17.05  )
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

spi_nor_clear_fsr() and spi_nor_read_fsr() two functions are almost the
same with the functions spi_nor_clear_sr() and spi_nor_read_sr(), with
little change, the last two functions' codes can be reused, and can be
easily expanded to other manufacturers or chips.

Also, rename spi_nor_clear_sr() as spi_nor_clear_status()
spi_nor_read_sr() as spi_nor_read_status(), because they no longer just
deal with a specific register now, they deal with one type of registers.

Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
---
New in v2:
  - Also reuse spi_nor_read_sr() codes.
Changes in v2:
  - Rename spi_nor_read_sr() to spi_nor_read_status()
  - Rename spi_nor_clear_sr() to spi_nor_clear_status()

 drivers/mtd/spi-nor/atmel.c |   4 +-
 drivers/mtd/spi-nor/core.c  | 119 ++++++++----------------------------
 drivers/mtd/spi-nor/core.h  |   2 +-
 3 files changed, 28 insertions(+), 97 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 1fea5cab492c..769299d06f78 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -76,7 +76,7 @@ static int atmel_set_global_protection(struct spi_nor *nor, loff_t ofs,
 	if (ofs || len != nor->params->size)
 		return -EINVAL;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_status(nor, SPINOR_OP_RDSR, nor->bouncebuf);
 	if (ret)
 		return ret;
 
@@ -133,7 +133,7 @@ static int atmel_is_global_protected(struct spi_nor *nor, loff_t ofs, uint64_t l
 	if (ofs >= nor->params->size || (ofs + len) > nor->params->size)
 		return -EINVAL;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_status(nor, SPINOR_OP_RDSR, nor->bouncebuf);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5de72322ae32..0e7fcbc4136f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -370,23 +370,24 @@ int spi_nor_write_disable(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_read_sr() - Read the Status Register.
+ * spi_nor_read_status() - Read the chip status.
  * @nor:	pointer to 'struct spi_nor'.
- * @sr:		pointer to a DMA-able buffer where the value of the
+ * @opcode:	the SPI command op code to get the chip status
+ * @st:		pointer to a DMA-able buffer where the value of the
  *              Status Register will be written. Should be at least 2 bytes.
  *
  * Return: 0 on success, -errno otherwise.
  */
-int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
+int spi_nor_read_status(struct spi_nor *nor, u8 opcode, u8 *st)
 {
 	int ret;
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR, 0),
+			SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),
 				   SPI_MEM_OP_NO_ADDR,
 				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_IN(1, sr, 0));
+				   SPI_MEM_OP_DATA_IN(1, st, 0));
 
 		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
 			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
@@ -402,56 +403,12 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDSR, sr,
+		ret = spi_nor_controller_ops_read_reg(nor, opcode, st,
 						      1);
 	}
 
 	if (ret)
-		dev_dbg(nor->dev, "error %d reading SR\n", ret);
-
-	return ret;
-}
-
-/**
- * spi_nor_read_fsr() - Read the Flag Status Register.
- * @nor:	pointer to 'struct spi_nor'
- * @fsr:	pointer to a DMA-able buffer where the value of the
- *              Flag Status Register will be written. Should be at least 2
- *              bytes.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
-{
-	int ret;
-
-	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDFSR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_DATA_IN(1, fsr, 0));
-
-		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
-			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
-			op.dummy.nbytes = nor->params->rdsr_dummy;
-			/*
-			 * We don't want to read only one byte in DTR mode. So,
-			 * read 2 and then discard the second byte.
-			 */
-			op.data.nbytes = 2;
-		}
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDFSR, fsr,
-						      1);
-	}
-
-	if (ret)
-		dev_dbg(nor->dev, "error %d reading FSR\n", ret);
+		dev_dbg(nor->dev, "error %d reading status\n", ret);
 
 	return ret;
 }
@@ -650,16 +607,17 @@ static int spi_nor_xsr_ready(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_clear_sr() - Clear the Status Register.
+ * spi_nor_clear_status() - Clear the chip's abnormal status.
  * @nor:	pointer to 'struct spi_nor'.
+ * @opcode:	the SPI command op code to clear the obnormal status.
  */
-static void spi_nor_clear_sr(struct spi_nor *nor)
+static void spi_nor_clear_status(struct spi_nor *nor, u8 opcode)
 {
 	int ret;
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
+			SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),
 				   SPI_MEM_OP_NO_ADDR,
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_NO_DATA);
@@ -668,12 +626,12 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
+		ret = spi_nor_controller_ops_write_reg(nor, opcode,
 						       NULL, 0);
 	}
 
 	if (ret)
-		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
+		dev_dbg(nor->dev, "error %d clearing status\n", ret);
 }
 
 /**
@@ -685,7 +643,7 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
  */
 static int spi_nor_sr_ready(struct spi_nor *nor)
 {
-	int ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	int ret = spi_nor_read_status(nor, SPINOR_OP_RDSR, nor->bouncebuf);
 
 	if (ret)
 		return ret;
@@ -697,7 +655,7 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
 		else
 			dev_err(nor->dev, "Programming Error occurred\n");
 
-		spi_nor_clear_sr(nor);
+		spi_nor_clear_status(nor, SPINOR_OP_CLSR);
 
 		/*
 		 * WEL bit remains set to one when an erase or page program
@@ -715,33 +673,6 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
 	return !(nor->bouncebuf[0] & SR_WIP);
 }
 
-/**
- * spi_nor_clear_fsr() - Clear the Flag Status Register.
- * @nor:	pointer to 'struct spi_nor'.
- */
-static void spi_nor_clear_fsr(struct spi_nor *nor)
-{
-	int ret;
-
-	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLFSR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLFSR,
-						       NULL, 0);
-	}
-
-	if (ret)
-		dev_dbg(nor->dev, "error %d clearing FSR\n", ret);
-}
-
 /**
  * spi_nor_fsr_ready() - Query the Flag Status Register to see if the flash is
  * ready for new commands.
@@ -751,7 +682,7 @@ static void spi_nor_clear_fsr(struct spi_nor *nor)
  */
 static int spi_nor_fsr_ready(struct spi_nor *nor)
 {
-	int ret = spi_nor_read_fsr(nor, nor->bouncebuf);
+	int ret = spi_nor_read_status(nor, SPINOR_OP_RDFSR, nor->bouncebuf);
 
 	if (ret)
 		return ret;
@@ -766,7 +697,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
 			dev_err(nor->dev,
 			"Attempted to modify a protected sector.\n");
 
-		spi_nor_clear_fsr(nor);
+		spi_nor_clear_status(nor, SPINOR_OP_CLFSR);
 
 		/*
 		 * WEL bit remains set to one when an erase or page program
@@ -948,7 +879,7 @@ static int spi_nor_write_sr1_and_check(struct spi_nor *nor, u8 sr1)
 	if (ret)
 		return ret;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_status(nor, SPINOR_OP_RDSR, nor->bouncebuf);
 	if (ret)
 		return ret;
 
@@ -1042,7 +973,7 @@ static int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
 	u8 sr_written;
 
 	/* Keep the current value of the Status Register 1. */
-	ret = spi_nor_read_sr(nor, sr_cr);
+	ret = spi_nor_read_status(nor, SPINOR_OP_RDSR, sr_cr);
 	if (ret)
 		return ret;
 
@@ -1054,7 +985,7 @@ static int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
 
 	sr_written = sr_cr[0];
 
-	ret = spi_nor_read_sr(nor, sr_cr);
+	ret = spi_nor_read_status(nor, SPINOR_OP_RDSR, sr_cr);
 	if (ret)
 		return ret;
 
@@ -1878,7 +1809,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_status(nor, SPINOR_OP_RDSR, nor->bouncebuf);
 	if (ret)
 		return ret;
 
@@ -1963,7 +1894,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_status(nor, SPINOR_OP_RDSR, nor->bouncebuf);
 	if (ret)
 		return ret;
 
@@ -2040,7 +1971,7 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	int ret;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_status(nor, SPINOR_OP_RDSR, nor->bouncebuf);
 	if (ret)
 		return ret;
 
@@ -2111,7 +2042,7 @@ int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
 {
 	int ret;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_status(nor, SPINOR_OP_RDSR, nor->bouncebuf);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index cf265044b543..02c12e04811d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -442,7 +442,7 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor);
 int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
 int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
-int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
+int spi_nor_read_status(struct spi_nor *nor, u8 opcode, u8 *st);
 int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
 int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
