Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341C4C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 20:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pc1y9H6ZfOVLOYRjy6/AKObJDj/Pep7MrCxkcEswZ1U=; b=BaiOdTV9Kk+gp4
	oP/WM51yk2+DvNLvkStteU6rn1i3A6pxLlMsnfrAr63v6YE8jLQXc76/4YFcsG6HfJDHMvXqCVOps
	z1fSG0PWPBTZEZEhovwHuZo5clGPPFt3sHQDynwvPfku18lJezsE+cNQyUrF5upafbsa9MuT6DbJ0
	ixynQxuGntxqraOvqZsbOqY2h+yyGOHZ4W8nUhP8utva0qqa/vD2h28kosZJqrKf45pyASOGndTOG
	wr+zD+eEpNKCXXUwbRIQLwjJuuJn1dDJKOVym6hy+QWdeK8Y80nRZFVzv6EZC+zFrHaldXsQ/+Zs+
	GHV48r5LGv5tc7tNnjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbT21-00GKFI-Ng; Mon, 04 Apr 2022 20:10:33 +0000
Received: from mail-am5eur02on0605.outbound.protection.outlook.com
 ([2a01:111:f400:fe07::605]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbT1y-00GKE6-Ct
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 20:10:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CO26pl4xhviWKRiOYpDyh1kxqsAzGOHSKj7oJAflbvmWAV4dzsOF3vjxRWNb56S8KRLWRztUD/WI5l3l1vnX/ZoI8FwbeTFOMp9P+VaxNg8vY7/IB/zZgAtSyNFkPzFD5oka6gh7SrQydSKjFT2/BxpJl+H470VCV/JbMm+4T/prvFv04dhb14+U4CxBHnsDo6C2JmC9t9mgsv52I2fYj2yMTteTTiVedpf3YYkw2IIGoth05Kh8sZUNRM30jpxaNFZRCcpxSDxyYlacppCa7nR2sgd6H4C4Sw3F+l7KicgTBUsXXH6xh1NgzHBF9BRPcOf+bDDpnyAVexu0OvWquw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wm+fw/UdVQgFzcMvHX/EsmwDazQhmpW7lZDsc3GXpIg=;
 b=RKC+5ISU4qajT/umtGsOMHQg2XNB8Ihssl4E+zRtznM9q0QCjP01pmEN5NG6XrxC0ckAlmGmT24Sr0NTWWwzUOJqgeGANFCJx8ehKmrqlvnqOloa1YR1h3IBNUOdI4lccui7+TJ0qrPqOfqgGPDf469mIbj5MUIXxLIeQu8DyRFmVXm2XrYJHzOhxRK7T+EX3fYUfpZmhZr8021zmZKIozNbnpY/83bBKsJ0WNAPKA1RyQgqJT+VhCoavtfs4MlYyPW6JD3KhNjVlEwERe2jxY9pLJ3O/py81Z0UfjQxQSFk5YOOyYmzQGLj8gXIp2hpEHSOZyejsyK/H+UoAiBRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wm+fw/UdVQgFzcMvHX/EsmwDazQhmpW7lZDsc3GXpIg=;
 b=RstMLZt5rL4GVubjLyNQePj5KfK2RvB7FPcEOU6zVqHd7kCRdmmQZIBwx2B6Cp83F7deu2J1Az82KMpAScqY0w1ST2+AfUTxwRQai9Va6gudzXsmWk31RYjsVYshoieBDzLJen+d3l8KSKgVhzvFSAQ4dFx4tgDYrPGUE0uzgvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AM6PR04MB6552.eurprd04.prod.outlook.com (2603:10a6:20b:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 19:54:43 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b048:39cb:7748:ed56]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b048:39cb:7748:ed56%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 19:54:43 +0000
From: Han Xu <han.xu@nxp.com>
To: sean@geanix.com,
	frieder.schrempf@kontron.de,
	festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 2/4] mtd: rawnand: gpmi: Add strict ecc strength check
Date: Mon,  4 Apr 2022 14:54:25 -0500
Message-Id: <20220404195427.8871-2-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220404195427.8871-1-han.xu@nxp.com>
References: <20220404195427.8871-1-han.xu@nxp.com>
X-ClientProxiedBy: SN4PR0501CA0010.namprd05.prod.outlook.com
 (2603:10b6:803:40::23) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37f69a02-b5b8-4c76-0203-08da1674f689
X-MS-TrafficTypeDiagnostic: AM6PR04MB6552:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB6552DCC47DF552506BDC3E0D97E59@AM6PR04MB6552.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NmZp35bM+7UQntHdPX725HPsY2R8DeozxNSTE1aea6y4nF50VhbEUUQqLHTbclXhtYUnrDhjCkX7qudfV4rT7Oiq04FH44RebTn7kJTo8UN0ylf4e+wOWhY0/5i4oxW8DFsnVt/D39x/UBox3i0cQ/DMngIrjMStNlIEp+JytQUukPNPylkW3TQW6MtYeXEMoNa8LCQoK7RfAh0E9v7N8Y1RfosTkBo6FGqj2otPhvgS/uSNiYe4HBLxunFXWOGAPwUi19FzS5gE24OFGyJ5Uu8D+XNC3OSf4SS4naCMFtClvGG375fATr8PMB2TjTgEWjhjgQWQ8cApygNPvgnAk25i6SHe/wFVplhHVPmyMn0JiaYPJyilwPgSCPugSHligZtMJJ6DFYAxWLAAxuZb9wEhia1A35FTbSi6tPL2ymQ0ygQNNYekrbAq6VuXxyJDRV33j3uTTbFkwtsZF2lGURxYqrcg2oZosDIfylwBRB77O/u6ad+9FzckP5cDxQ5DsepAdr9GHN9n3qwsgu+Y7o2fzyNOGYySI4mcBYkxs7xMPsODa+KF+45r1X+evuU+1BVzVhq+4u6fKm9hTdlStNTFtyAf6gZHCX2XQoa15TrUlACZgKmOjHzcwFWFCFoFEnvXHVEvd4cRRnAH7jOJd0fvesN9NgSK+bfVZOP3i4YiaskFDAk6ue2/0Sf0y3Togq7+U8Iwisl58DqbW5OoWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8676002)(66946007)(66556008)(316002)(66476007)(83380400001)(36756003)(1076003)(26005)(186003)(2616005)(38350700002)(52116002)(6512007)(2906002)(86362001)(6666004)(38100700002)(6506007)(5660300002)(6486002)(44832011)(508600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/n3HIZwHlSmsqDMcv68LDZD/Mo3lC/fmh7PjIuLWbKoS21UQdwVTv3kBZYFK?=
 =?us-ascii?Q?JfB02mQWrafItQfzSGXc4qh18sgyaqPSfxdbNki698iuo3uXkUF7wIMbAveO?=
 =?us-ascii?Q?auCjNfdNFUvElt/NhE4GCaV3ZdSbw54KCeCE3lewLkxWPuT6sJbU+N5ckg7k?=
 =?us-ascii?Q?M1FNGJYxUs7ZY7/KnFFRZ3lS3kRZ/wRF9ysAD7avPydRuJNMvBfrByHPVmg6?=
 =?us-ascii?Q?MFpHPL+krJJWmw1kdcIgMXsmAvrVne9IzzkkVFakeF8yMEFb4oUt1CbLwazZ?=
 =?us-ascii?Q?AkRLNWXzcNH32Jsh3zX/RU1E1sCfPubztE5JGoVW1gPfYAfq4+KdrabLEFPp?=
 =?us-ascii?Q?hI4R8hiKAJcYGEfFnStxJ9PM1F+i4cFb+g8jbmYg8JamqkLFIEsK5amxyBPH?=
 =?us-ascii?Q?hHXdl+sfvA58ZhGnTHENtZJRdBN95b7qZ0s/Q8qO6saDD9PDDEAj7sC+atlF?=
 =?us-ascii?Q?p/fNHsLvecMa1yXrxpuhKI+5MdwkliEgFNTaFo/FDds0cwUOK+TxBuAbmZ2w?=
 =?us-ascii?Q?fNZDBrTuOZVcOsfDSjK0jpUDloVyi0kHYmn2XzeVr54QEpBEBBuxhfJwVISE?=
 =?us-ascii?Q?q+zEURQkB64FZrgjHzgib0NmqVsTv3Fe5AN8w8Ln1mPLd2ghNz+uC4Ufj+6D?=
 =?us-ascii?Q?9ij/g5j1oOBGzIzyUBxva0rUXRadh8HEz9SS/yIIhozAE1m3ZNfT6uOW5Pnq?=
 =?us-ascii?Q?1SKIiDnXdiAsXC0QD0HleKAgGbB5iLglbeADhD2fvvQu2/AQ/LgpnFuEJZ+1?=
 =?us-ascii?Q?0RDd6Fiz13Z6tCCdHc5tjVPQIEElPioDVyX4B9vrweq4Gc5p49bUoOpxkDvg?=
 =?us-ascii?Q?u1rsN0jwPcDmJW2Xzez36it+SZ1G6k4ySpV+B+gW9UHSQ+Xud3RgSeA2jhFM?=
 =?us-ascii?Q?UQj238qLEr5Ljk85YOawbG4g86ilRutYg7rAi87hMgITo81LG8f2rj2mpaKB?=
 =?us-ascii?Q?84dy09a4cQylWEIT923Y5Zz1JCj+VHsYlfOHhK9VHz1BOX+RpkSsbnJPz0gt?=
 =?us-ascii?Q?BdkCRPpZLlMumI1pyNlI+eWhnF1i/EVTzcN4e7ogKeg9d0VFT7qQP/Eivu7S?=
 =?us-ascii?Q?x3QUyZH3I+2K/M+4pBAG7lipbDedVnWjUSM81j7nJvpQIUhGaniFmXH6aGsQ?=
 =?us-ascii?Q?ZTN2D15MikVl3tSC6e/0E23c5YN3aVpsYQF1Olmqag82NFdfI7LMPbgM4xAu?=
 =?us-ascii?Q?C9WI5Vc/57DlAl79671WDdLbqjtJ5utY2WHVEvVTjmTkeHNB0zo8Tr+usZk5?=
 =?us-ascii?Q?alwzY61suEuQ1eIatkS7euO+AESYClUaFo4WElo6HqcZ/xStzPP6F60fPktX?=
 =?us-ascii?Q?4EpWVAEIcTjIrqOULzz7TPEyQ+Xgd6jnoS6uJQAXcA1WeRedB9UgKRcZC9UE?=
 =?us-ascii?Q?/qYgZ7xhl7He0MH9tSTJv7Kty8sZybDyEgPuoBPwx8e1oonrl6WUXGq4C7a5?=
 =?us-ascii?Q?ZMhaBR1+MUnO9qBKRb/x3WAjQJcSaDgk+qdZ4MnloL6RSh3tHS1+xUKyMOyd?=
 =?us-ascii?Q?OPITJ9Vs8qToiJsPCb1RCpMjkCsoKwUChx8kfwCLmy3+j9qMu+7lNDHVkY+a?=
 =?us-ascii?Q?ZqkNCqqkvUwl39uWUTnwSiVOkizSJsPf+UHRs/hUtPN5eMJo4AZ3ZAUewP9s?=
 =?us-ascii?Q?GBm161Ydj75EyqR1SM1IYkgPKaQTMJx/DPkiCPij+7vpnof6H+IM+lpvzmUB?=
 =?us-ascii?Q?tH4MNaEmzPqtbgeSu0qFB6xz9ttPtdZUSz5QHLZ5Dyct2pHf6RxgiCvXQzhc?=
 =?us-ascii?Q?S0wVGOJmXw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f69a02-b5b8-4c76-0203-08da1674f689
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 19:54:43.7182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLpc4OHWohtNbaZEKVC/aMxVYRXQXfFwZHdwxsK3aeOyi12cqpuPWnhd0txv36/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_131030_471435_39E245D0 
X-CRM114-Status: GOOD (  15.77  )
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

Add strict ecc strength check in gpmi_check_ecc() function, which is
same as nand_ecc_is_strong_enough() did. It will check both correct bits
and correct bits per byte to ensure it meets chip required ecc strength.

Signed-off-by: Han Xu <han.xu@nxp.com>

---
Changes since v2:
 - split the ecc check to a single patch
---
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 24 ++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4144d5937103..9a37f8cc663e 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -238,9 +238,14 @@ static void gpmi_dump_info(struct gpmi_nand_data *this)
 		geo->block_mark_bit_offset);
 }
 
-static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
+static bool gpmi_check_ecc(struct gpmi_nand_data *this)
 {
+	struct nand_chip *chip = &this->nand;
+	struct mtd_info *mtd = nand_to_mtd(&this->nand);
 	struct bch_geometry *geo = &this->bch_geometry;
+	const struct nand_ecc_props *requirements =
+		nanddev_get_ecc_requirements(&chip->base);
+	int corr, ds_corr;
 
 	/* Do the sanity check. */
 	if (GPMI_IS_MXS(this)) {
@@ -248,7 +253,22 @@ static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
 		if (geo->gf_len == 14)
 			return false;
 	}
-	return geo->ecc_strength <= this->devdata->bch_max_ecc_strength;
+
+	if (geo->ecc_strength > this->devdata->bch_max_ecc_strength)
+		return false;
+
+	/* check ecc strength, same as nand_ecc_is_strong_enough() did */
+	if (requirements->step_size) {
+		corr = mtd->writesize * geo->ecc_strength /
+		       geo->ecc_chunk_size;
+		ds_corr = mtd->writesize * requirements->strength /
+			  requirements->step_size;
+		if (corr < ds_corr ||
+		    geo->ecc_strength < requirements->strength)
+			return false;
+	}
+
+	return true;
 }
 
 /*
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
