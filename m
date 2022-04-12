Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BDAC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 02:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WI/PWEA36ECLkeZ9hjmqc/IcMLXHpV7oKf4MrpLc5g=; b=bpn60dAXB7DvyH
	PNT6HdVTB3VcR80Kj7rQl2IW/BxN4G4q4sZGBjq5ehrs8iQqeGmtWm2mVolN1h9xLAQ5SuLe08Fk2
	TNH2GCiKKheovoRYHMmH3RctoiE7LfrX1ZDKKWu5i6xqBA/EZsoxBlQ9IdZBYxA0ayQ8Pl1h2wL8r
	ngmdRF0mC8ntXKYUq0QzroCCnd9xunNx/WPLkkXxtsDagdgJC7seY+zBu2VMexZ89JR4hHlrLY6Mk
	+Q+oA7Q1Rb5BuBw5oz2vlrQxlQNOmYqiUvzpRjoMIdm1LD1B4N/qNwAAjfkJ6utXY1OPcjWOsRePN
	fq/GEHFSJ+Q50GBc/UEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne6el-00BLUw-SN; Tue, 12 Apr 2022 02:53:27 +0000
Received: from mail-he1eur02on061c.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::61c]
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne6eb-00BLST-Cx
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 02:53:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSBCC+BGJ1fxuHqJyObidGgJzz4E1yZ1QKgikYAJvsnAFLFCUT/0UB6u7aotiTm+tHsIOXvxone463zNOGAlkxRccdyAaSPaAXc0Qsgc8bZsytB2V4ozy3EeeSGRVUsWhXsQ78kYGvi8tsdhHgfYIrKTM3pXS8sS1wKU9od+vbker3pZP2UoPRFyMX7nh0A2OzFmZhjSd5obkhN0o3gL+KdZGEK9AVlFKMDVqrr3JOJ8cEbtxUokLaXRgrD6ZWlh1S+kxRutjzn0Hk+pFAbO4joD9GkzrbkKymVNsyrCsc3VaqQUCMV3hfWGRMEeYrIxNLyjsSjBCcDvQLn1H7n0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVeaVWKggW4FlEvD9+lQwPDRmQF4RN2H7TkYnbWbhJo=;
 b=hrRzgH+KfcINjQa0xowyywo9k3T7baBB9tumL1INsrbsXfb5y4/j/F9pvnSidRp709qSG0023GfqVSft51jVDizAkr+955LRvUAXkUTdH83OOpDbdcHDpDQEub9NVLchpKOHF8rbf5DJda+mAlEcCBdjplJXraXvpmCJJArZAyCKlNAsKx+y2OadUgo9mV8jH6s9ArNylF6FoyW6UaCGBpdktXybcUEFmET4e0eNrB8/70ZnpIyP9ERnkYJMb1hnBXXFzU++GPK+z/tG4ZyuON3/Sy0AaxWpJW9SosUxMjWbKKLWgkCJRHKIEXTIVi6B2/TFgE1Q0h+DKlTh3OAFnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVeaVWKggW4FlEvD9+lQwPDRmQF4RN2H7TkYnbWbhJo=;
 b=X4dZzm3q7D7hvKw0yK3EpiIyupso5QHs5e+vyvoNwzKmDuQAE2uHQkqBuKy6mTauxHv7FStL7o/9iGU9JbMR2MZpNB9GcmmEu+1LJ9I8ePfPhVWCArdc8CcwOb4rVW/GZ+w7WtQpRKXwOw4qI/LS4JrhngqypPamvo6RLY8deOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DBBPR04MB7867.eurprd04.prod.outlook.com (2603:10a6:10:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 02:53:11 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::644f:b22f:2f4:d69d]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::644f:b22f:2f4:d69d%3]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 02:53:11 +0000
From: Han Xu <han.xu@nxp.com>
To: sean@geanix.com,
	frieder.schrempf@kontron.de,
	festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 3/5] mtd: rawnand: gpmi: Uninline the gpmi_check_ecc
 function
Date: Mon, 11 Apr 2022 21:52:44 -0500
Message-Id: <20220412025246.24269-4-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220412025246.24269-1-han.xu@nxp.com>
References: <20220412025246.24269-1-han.xu@nxp.com>
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdaaf7a6-5df7-49d7-c41b-08da1c2f94e9
X-MS-TrafficTypeDiagnostic: DBBPR04MB7867:EE_
X-Microsoft-Antispam-PRVS: <DBBPR04MB7867838BC7A5D9DDC653EC2197ED9@DBBPR04MB7867.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CzFNCmuee2GPGOGGN/nhCRfBV5eGdk4I8c12+6Oa30h8FY+dsPFeDSUcWdgdPHaFqsCcBAdsU8/rbOhziFfTBL8V6KMHPncUCGIlKTebJSdTHViK301E/oilrD5ydes4w1L/OAuYyI3H5tDYUYwhHVV9WXYLHfFbZ+f68TdM6azSNYvoxvAd5K0HrZ06xXsb5PEitG8ZG/zPIC8/hTBAQxZe3G1Z81vxLCLrt+xlWwZPyGJBmC0FiXJS1lOzmsa4ykQcHJVGjFrOkBMCobui0lqITTB3KwGcg3cYiU1ifd5xsUtw3MCLa6aPyDVKhn8TY4jZm6ts1/2F/ttvFYSkxdAeYRfkZuESAQ2n45X+ckH5vUCpc4ER3smEWXgXxl9RRiGv5/F6qrVYKbP+0aNpL0uVloHT4whnkR2Loeq6fPhjA8la5b5XsayPgY+XHFIa2TfevpUqk3KvI0Kblckk0P1OQrHv6xuPOgbGeBqWit/QFI5EGQUe68F0bKC7HpAoMY+iDclmD9bbt5rqOQcE81r6Tsz2DcxXpDrxeTnvwv/wS+P4hiZSIPJ2k98HzK3w44+VE9PkjFAzwtHG5eQ/cldtoJA4leOjn9PsaXoB9CcaAlU1vgZl9erwwFzB+IWhyI4RLCfzdEju2GBAAm2w/1XHCzSEnRz+zJ7c53TLsGHobyIEhbRK9YtWxPI6ZcvZv6FJyxEQY8PD/RrKFz9FAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6486002)(508600001)(2906002)(6512007)(1076003)(2616005)(26005)(186003)(6666004)(83380400001)(8676002)(4326008)(6506007)(38350700002)(38100700002)(52116002)(36756003)(66556008)(66946007)(66476007)(8936002)(5660300002)(316002)(4744005)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N5f8UlG2Tq5LVtwil4le/y7g5xXmFCSOtDDamldz8RC9DepFM8SpeFwpxHlH?=
 =?us-ascii?Q?dSydGqNkbbj1tEoyvSE4ybH7exAyHYRCL+sx4sYqelD+Cqxy/OBRvXgz9Kpo?=
 =?us-ascii?Q?nTfJgwwD8oG6t0V3rjwRhUiRX7PxZxiGlY51brC7mXl7tjQRGx9PMH/qdahp?=
 =?us-ascii?Q?ePBtFdJKqsxjA4pC0B9J1A19FX8SABIq/aswlzOAkO9qN+p6gxUi0mk7Yj1w?=
 =?us-ascii?Q?RJ4c8HOfjKaIFj2radff5UmJtpg7k73Fe3kNmxC8qJI0CmM0kfoza2ZdScb9?=
 =?us-ascii?Q?kFVVhmFLALR+2OvhzlwxIFpqcyXhSsQiD9GDNfoR5aDH5xHX/3I1guwS2bBb?=
 =?us-ascii?Q?Q+jcwidFgtDYc/NTVcY73i4LFhdjCMGeuL/oY+a8Tbyu3ukBWRrko2COvUHN?=
 =?us-ascii?Q?j5IZgDpkZiOtE4bBYqKEUZ8Tl2wL7xItuZAQWDqhKpsQWkRmf6oVYowmaXoF?=
 =?us-ascii?Q?7cN7H/Yuc7RMrzFTEPDhCbq3I23adlebrBVfjlEr9Ot4lNAq8/wBD+EbkgE6?=
 =?us-ascii?Q?1e2/D0e5MLaJZPLVMgen5D+2C0zxb9nkK8X+56yPmVMsAMCxV4KEU0mhO2GD?=
 =?us-ascii?Q?FnMETt5r4ppMoww+tp4j7ZuF7iY3gwqSY+9X83/ffJhFYvQb6C8rPZ05af4r?=
 =?us-ascii?Q?O2wKLFxBJ+Fyat6tTY7nHxfxKWpe6ixnbea7IR/8HOrVfW+3ePTCuj97cC4i?=
 =?us-ascii?Q?kmWYRTAD5YL+tv5BiJlWyQFJUsooMfqY+kWKm4gU3l70FTmgrDg9Ca1Cg+QX?=
 =?us-ascii?Q?FExYL2ivlp82xl9C+0qStRWlaZEcpyS42+MtI9CVMnA6DDsZCljYx0bxo5WH?=
 =?us-ascii?Q?jfLISeK35BIaPrVjAfAlwG+HLhBpCzCozY8n73DNHcEh5gxPyJ9+jF9uAql9?=
 =?us-ascii?Q?crTBJja/TMZXrl1XiaOwohOjiLlQbVzulOVnbP7dOTanYNKpuYU3uqrRNMNh?=
 =?us-ascii?Q?dVsDm71QUvOriHDFMv87VgcSqXoDgRuMGYFvuXVWf8vjUdRlW5e2PDb6zpl/?=
 =?us-ascii?Q?pMsiJ2EAbjihcooykOIW/+ubQyLIkFguQcSU9Rbs6zMRqbjoYjlEIC8KepWZ?=
 =?us-ascii?Q?yiTe2v03r0PO2gZJNJsWtjbNQ7BSMsDq4ovzTTpRbUMpoRMYDrR2jgweL6Zk?=
 =?us-ascii?Q?2YptjvGkZK2F8uJX+XIDBS1K21z/r598b5QjzasYTZbfefp0RJ6EECNMWAj6?=
 =?us-ascii?Q?0AZmH/4w2oh8SX+8Zm038GuwC7wqLaBUX8FpRF79dGPIsxVRU+wEUmRLoymY?=
 =?us-ascii?Q?4NRe/F3frLLGDyencOoxGdNE9OlJu2FzT1xfSZbwzu4xXy8SRLkWnxPNxPPI?=
 =?us-ascii?Q?ZFwRwCYYei7L3yC5fcrmNJXZxhOeDwsOqOW1WNaEZi5eB8eXE5myYJh4zzaS?=
 =?us-ascii?Q?pm2TexISMFKcu313mJemhj37L8vRgFe2/J2GudXo8Xs8JAJh4N9q//fgIXvo?=
 =?us-ascii?Q?JplMnqT6SG5Locd7w90AI9J184fzyXS8Yfw+mRvEK8lw/Y/cCeG92VM+OlgP?=
 =?us-ascii?Q?kQ7xMNELbwer0IATjNTlB0hNU8tjJ59jbE+do5hd/k+RsnQ4UqqxKlf/9YJI?=
 =?us-ascii?Q?N6cXmiMZuoUTaUCIJ4kHmf0uR/oMJ59T1ZTY1rzhK87ly62trpCE+7PS7Fwl?=
 =?us-ascii?Q?FsKYAZXPmvvC5i2sCs0Fj+C2cXxiTsIkktBpNylLRKBJcO5rwkaYpp7BegE6?=
 =?us-ascii?Q?EAEeoQT7+lj3w+IiQQhlEVuv5bfgX9/ANx4HuPcT8qC6aBn5NLGmbT9c5GU7?=
 =?us-ascii?Q?VzSR6K5BHw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdaaf7a6-5df7-49d7-c41b-08da1c2f94e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 02:53:11.6390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bz285q2LM4rjqAG2extk2zSBrLSWviHVE4DQTu4EKZwZN+B8+m3iMNALdPkVtSv8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_195317_517562_53EA6BBB 
X-CRM114-Status: GOOD (  12.40  )
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

The gpmi_check_ecc() is not small after adding more strict ecc check,
uninline it.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index cee39126771e..0f82edc97e9d 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -238,7 +238,7 @@ static void gpmi_dump_info(struct gpmi_nand_data *this)
 		geo->block_mark_bit_offset);
 }
 
-static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
+static bool gpmi_check_ecc(struct gpmi_nand_data *this)
 {
 	struct nand_chip *chip = &this->nand;
 	struct bch_geometry *geo = &this->bch_geometry;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
