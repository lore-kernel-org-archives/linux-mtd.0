Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483F6606D814
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 10:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FAil6q5r;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Q6lLe8pn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Y4LQUCjPmPzVl7XtcNKUD4RrvIf00OHE6Z6Cxe5N1yE=; b=FAil6q5r4JhBq1cN8CxPpYhsex
	9yvKfVuja/1lIvq516No6uEYTduhnyxnnpi1kQh+zVRzEO0qNSQ//HDDTFXZp0NP2RjNJPPGv/H5c
	6Qs048Jd4qQR2oXSB7rpN4DdAXcVlYZLicXGmV/ouhxfrfPC7+/OQcIhSPgNtrtG1D2c/6zS8TjXT
	W1L5jME8pjMZFL+U9gf7ui0BnpfdeqMfyMRdAkASxhgLGE8OWAVtPM1gGVR1VLnWmFCJ78qzgaVzY
	CpAx4E0tm3RhuB0bVxTdWQiR9bJ7oBGHfNtQlvpeg6f/C7ax2HI7bL7zoFWl+z5f84nbyP6iszEvE
	K0p5/U8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuNM-00000008Pr9-2G1k;
	Thu, 05 Nov 2026 10:07:20 +0000
Received: from mail-francesouthazon11011043.outbound.protection.outlook.com ([40.107.130.43] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuNK-00000008PqG-0VEq
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 10:07:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gucy5ki7a6IWHV/7TLiLtWSmFEmBTU10GNTyEqa+GmMhQd7CigrqdXIEx5Nl2jE17xXh7S5ywYFop85kqHiPFYrm7Winn6IdfdcetGAT8INg48NOX3iKBoVyGmFJJ6vSfBM7FZ/8j7tRpX8945agfH7JYCOEsmjvfTtMrLMkChmm1HJC88C3/nq6OItkButS3zQhAKzUGTWE8XXeJ6aAWcDhO/J7UTxWLtjrKWUs59ukGYTkHIhKY7qHgiSDQAw3Pv4SNyNWBm0VOAc18ffW3T3wmGpuqOQo+TCqwD0lMJQjsIX+jyhkvl1HbjpIF5TeliY8AXf7on6oooBXkKxkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UL/2etCOwskJuW8f9sQMCSKPam0VrvJOQdi/TDH0f0=;
 b=ybMccfjeuAM29Gq1ppxRqg30IOiYK0cqA1FeyO+NOUdBL3uLfCpe1stAu8xAfc4TFtR3ambMUo8F9O49W6a37Jd7I93dy0wslRVOOvCAGAMnCiHg4nF3CsoJYtYXfM3SKF2G7loCJFxCNmysSBDAfWJvSW7Tf3FLo2eVG6sLsw93Yiq3w+j30wkxYsJtbYCSen1FAsHDaPwgo3lNgsL87MfJsCYtd52lpguY1PrnpA2GBB228bxhoccWg+aPRArCjWxB4kgtzTceE043QC9rKzYk0eFNxmTKucWLKSXkw17hyc4cVDAIA+DIuZ2Z4ogmwSxPDofBYFaXFo/FaS9KDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UL/2etCOwskJuW8f9sQMCSKPam0VrvJOQdi/TDH0f0=;
 b=Q6lLe8pnEBaG8kajlHgUxkFR7ioF4fyBRAjP4ZpSuF+VY+i/apbM1VAFpk4nDNq5HNMzUfDWhOxDMiAX2Pui5DQTXfyhrwMaDBKc5uRJpdIe5AHv6piuvlt2AIe0Ttzmd1xj08KdOk6Su1Rb+HiExokYHHUWcbFaR5UBFOKqcQQJVLX1obcRLXtLoRnZrgrEYo1pSMEvdzBH8uHH855GfOL2ai4TSHJXMHGBBRULK4GglIeF80kcatgn9P+5D+CwzwKDrmHS9qpWE3xL7+kJcwSA69EhRrNUEr5mv+5hTtuEgVmEsuD+JnUQb4WIBoJNCrwHPmPG2SqIDz5ptve9qQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4474.eurprd04.prod.outlook.com (2603:10a6:5:3c::17) by
 PAWPR04MB9986.eurprd04.prod.outlook.com (2603:10a6:102:380::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 10:07:11 +0000
Received: from DB7PR04MB4474.eurprd04.prod.outlook.com
 ([fe80::c22a:1b5e:12e7:8b3e]) by DB7PR04MB4474.eurprd04.prod.outlook.com
 ([fe80::c22a:1b5e:12e7:8b3e%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 10:07:11 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: han.xu@nxp.com,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	daniel.baluta@nxp.com,
	vigneshr@ti.com,
	imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Ghetu <stefan.ghetu@nxp.com>
Subject: [PATCH] mtd: rawnand: gpmi: Fix unintentional integer overflow
Date: Thu,  5 Nov 2026 11:59:35 +0200
Message-Id: <20261105095935.159650-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: FR2P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::11) To DB7PR04MB4474.eurprd04.prod.outlook.com
 (2603:10a6:5:3c::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4474:EE_|PAWPR04MB9986:EE_
X-MS-Office365-Filtering-Correlation-Id: fa56c6e1-66ee-4afb-2761-08df3b248f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|18002099003|10067099003|56012099006|11063799006|261026121527099003|261009223027099003|261102123227099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: fsJYPe+jnI5fJGsLoZONx3T1jNmcmwhYVUwqRcCfuQqM+QxdL373SJYh4+F3Ggfb+6NsJ2ryMBo7kWdMfsqddTt4DL6bam69tCOpJ13JiotZrTgSKp8/rOkdy4ENHKCZs8QNh+BQIgP1DtBcNiKjEX0/SOc9gQA9sRoIjFAse9p0+0OubRLW2gNHO0Pw5T0Lc/Ff4WYW1LNd6BGEg0mwhaiXIwlHTeJovALsf+LUBb1cf3HBn6p0l9c3QlqLJ+qSFSj9fk+dvVBXbbSzKueE0nX0N3n2lyL4BT1KYPbFiadxdK+EDWMp49G7aENTgTd8v2IDPBwL350VRD42CauN3W/ZlxtylTPp3CbY61PLM8ZQTfNDMM0l24WzRK5yPQzSFzug5n7OO8V7baAoTPZuZiKZalArDSV0eAhita/Bcf7qFFW+2DPbzGinqlmZsu6TvYTelSgZ331UybEgc5U6zlts71ugIEtW0WHmnfAVVvI6ESZg8rPaPapFDv3iuV41CmeGXaH4LLJP8a1Ic0z/1NEm5epbXlTp9Tx8caSYo50rg0f6kOvB5WdcJ2pWHOOmhKJZhtovhwf9DDjScf13Q+Eaul1qb8/33wWQ2wh4yYa2eeNstB2CpJipXZYDWnE+D0CwiYLoWliQxwkvSZ6EPP45ArhHn14RCnZwXx6YesY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4474.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(18002099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261009223027099003)(261102123227099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ukr6Kh/rs5SdggqMselky1jJo7R7Yh1eO/jVkucNq5aCbK8RNu5DoIOpIIoE?=
 =?us-ascii?Q?qklyTkG7uxwoXLdiqZvpABRDr4XiuIYUwnzDENXrq6oFTIoqje+jA1fCpB2r?=
 =?us-ascii?Q?wYftg4XfTHSCHaSUdAflMiCSDv9rWNIujHRmBeeV5ULEQRAHiiGTNtX0DyzD?=
 =?us-ascii?Q?JJe34QMqCiWS09Ow5PfYlYA2uaeTHIJqynzrfVoq5AM7xFY6B+LHMEv92Bib?=
 =?us-ascii?Q?lhbFCwN40Zyr9y+EXiOzE3Ylf5rrB+pgDBsAg4i21Kgvh3IYxotUzfx9baXP?=
 =?us-ascii?Q?7YWUZEP8WspTrfnpoeqRH8UIy5mVunbcOFR+jvdAoUN/ztVzArN/wwIxTEPH?=
 =?us-ascii?Q?AmWqt2O89ai7NKqwP2yyC3tE0cQG4F1jwNLcCwoYbb0eGXuNcuKZlbemP23O?=
 =?us-ascii?Q?Lh46wp95KTOAoCuKE2K4IFyvMhP4Bpq+sGRiVm58wnFaICX3+FgqJ4pGvcK7?=
 =?us-ascii?Q?GIzM0kcZ76XcbiKOWEDx7DTReh8J1lEYGhoo1/PMffQyILT6Isro85wparur?=
 =?us-ascii?Q?donRfVwad1o8l+3xMHLCPAkTYnwDi8MEYITXaX0CMH6t2NJgoYNYUhVkWTan?=
 =?us-ascii?Q?Aq8IibADPCr6PEpV9XYq3WGU0m0uU0T8X1NcMH9TEx7WWFP6gWk3GRD4Geyb?=
 =?us-ascii?Q?8xF/R0w3iRHw1D4+FFapjrxuhfaJAF65Sv9BjydEH8CKvPwgpJ3J906ct0zl?=
 =?us-ascii?Q?6aui1eMRtEe3jmbbuTTsMxOUHXHPBWnkjJS6gNavHjsLGWM90Hta/1Mv10x7?=
 =?us-ascii?Q?m7dmIYYacV2dR60BTbn1xThXl0wrPiibt7d9zLofnaqFBbvawV3JhcAtCLpA?=
 =?us-ascii?Q?+PnOvXahcFmo1bkQGhrng0GxOrJDF0PwQAaWhmFsucM6G3SPe5frqXNpb9KD?=
 =?us-ascii?Q?jNCl2cbf/26ymh5qHChObsW2UsqaiYz+H9/hQZcdeHoqjw4zd/xCCC8Mv33N?=
 =?us-ascii?Q?zDDjOKn07IhwcV0Eq+gEnly3uBwRgE5+cjGQdowuoN9hhal7IAznO/YhUpYZ?=
 =?us-ascii?Q?5eWb16j6FUdwLlNsA92sw/G5lHwO7QStFKr6gDg+8OtyeU9Vb3+2kIhHnEiZ?=
 =?us-ascii?Q?6dF4UUCV4Ww49SW6IV/L06p8QcYgCuNePCrVHpvo+C9FOIFtmkbhGfJfi3Eo?=
 =?us-ascii?Q?lKpxLELus+L3n1fqMsyFyVv6ILsnrsDdESG+Bgtr+DoDtSWHIO99oOVtvsa5?=
 =?us-ascii?Q?+t0E+kTJAZWmv3paXBaduo4CrqYtQmc//SjUg743KicLOp1hZ8SGxiprH6sc?=
 =?us-ascii?Q?8XeRNRIHtRMwisSu68rX9fTCweNksEzLgJ5nud+A/MIDlmViN26qjtat39zb?=
 =?us-ascii?Q?w3o35T27ywlzWZuP9W5k6KndnxsOx2De6MqxvBuTvWWKQcBq+ue6EFWImovY?=
 =?us-ascii?Q?Ih7TZcjwCY6WgjRMg2WbhWWCX91CldEs0txBNctJ2SynNWQWjPuAIsr7hUjV?=
 =?us-ascii?Q?O5r5W46tKun/SY0kd7dsk3jO8lLOtg3DAEwWignEtW8u2k6uGWWc062Xkyz6?=
 =?us-ascii?Q?lX3AIrtB345+OQLatEW21FqMUWcECpFGObOn/J3G7JtDHODDqv/+AqEPNVxn?=
 =?us-ascii?Q?qsH4xliPAMAX18lBxsQ2HxDkAlJZkLz+2uY8tFukkWsW1L+Yl0J37nRfBkAe?=
 =?us-ascii?Q?Kit0NqO/CN/AV1nFkvoi53pWT3/WWRR0Mna2WUyatzW8iPqkLBrQ1XvSf6lX?=
 =?us-ascii?Q?0KhSfNZNeneXP9oKMbP/1TxFuS2NevuM2l+LlXf9O6+VrdF3G3XIPsjSYVT0?=
 =?us-ascii?Q?GJ3SMlCc1A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa56c6e1-66ee-4afb-2761-08df3b248f11
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4474.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 10:07:11.6587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKm2m0k0GK0qNetM27vWgfv04/oSmg4iyOb2a59DmE/Z7DJS+JMg0z8xQi5/gaoyqK4oFiULe52fC44Wh1IDBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9986
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020718_158638_E2FD7CB5 
X-CRM114-Status: GOOD (  12.36  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Xu <han.xu@nxp.com>

Cast block to loff_t before shifting, so that the shift is done in
64-bit arithmetic and the potential integer overflow is avoided.
Reported by Coverity.

Fixes: 10a2bcae9926 ("mtd: add the common code for GPMI-NAND controller driver")
Signed-off-by: Han Xu <han.xu@nxp.com>
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 0f1528710a6a..e21e407f86c0 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2236,7 +2236,7 @@ static int mx23_boot_init(struct gpmi_nand_data  *this)
 		 */
 		chipnr = block >> (chip->chip_shift - chip->phys_erase_shift);
 		page = block << (chip->phys_erase_shift - chip->page_shift);
-		byte = block <<  chip->phys_erase_shift;
+		byte = (loff_t)block <<  chip->phys_erase_shift;
 
 		/* Send the command to read the conventional block mark. */
 		nand_select_target(chip, chipnr);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
