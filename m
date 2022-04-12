Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C45EC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 02:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rN543Sn+DE03AoTYIlZ8vxLuDuZdoS3QWT5zX8jKoF0=; b=EiAqumPg/HVMPS
	FKUE0JvSxsdD/ME2sJCZAgRZuJtCYO1XxooQGM8ost6vGOkQLpWeewxU5MnnerVb6jZBKUBQ+ywX5
	yIZgA3+y2oivSWnovhmPUeyCmHKJxDhTSWkpzkQD3C6N88vop3kEkOO8xVc3VKMZDNoZsk5HTD3iM
	LO3wK6eF2NGbYdXQtwgFWyZ5ELKQRfKt8VYpaIdWelq1LTsf8Wf6mKmDWwrrL5HTERw7g508thfk1
	zBfuE4GAKKmy/4hgPTQ9EWD1dKeT+MoH9g6rJ7WaZY6RlvOD396WU0dsdsQD5Hzwjvh1P6VeFkBmK
	/NcGPTlRRC+8w/lF46tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne6eh-00BLU6-0H; Tue, 12 Apr 2022 02:53:23 +0000
Received: from mail-am6eur05on20607.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::607]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne6eX-00BLRL-Oc
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 02:53:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ma1EwfLsgVcPgc/gwkIzfHwOPHNYCsuOF3Kri4pN28hGt7y8qucGOwGJ6Ey9r3zKaFfgYqy1VKfyQMOpU8trqIYM1gSayo32VbAPqteeVfCGRpTEbyLAKfIvO0P96f46EBU7REdO33wJQmjnh7LYmlIOdv7DzQKxZQG0s4e9WdqvBdDPzMSE6f5duW+vKjo0WCDl0pZvUyI1SToc0u2U+SGIJWyeFA5spA3/lxf4tWEzgC+R0zvMSWxUTje2lEfDUI3jn0cQGNkIYPIdfJ7lnjCxYMIuMuLiaDmJeeBhpuRpV7VZ2Lf6GtIbORnAA+O/WeNMaBv04GF6dEaXnZ/xCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQGKygy9teI3c4oEr3kszriQxj0XTxHWfQXm00H4DQ8=;
 b=mLzk39gn9u5+f/uyWJW+i69gvIulNDN6WkIm+zCRkBenrptbhWKdwxYrYoErEhIag6L4ABTYCfTj9E7uwRUA3oLKOu5rru3JqB/b5cD8VhUmFhgrPxO+trGQ1h4HsTILpJeK2hf/647iX/3wAgKel1wv/z9wyDFCbyb8UTy/k/dNdniNir+BlD3SVOobmztMsOf4SY7nK+Kbt4t4MA31eGdF8J4AxEqqUfF/9FPuyg58eNa23HacSvhZqgPOlph9WT6oeuk8YpcaYu6Y4/KErpv14gv+LON6pQeTaIloA+SsXHccpyseNw+zcmiQq4FjNN+j5mV6SwvdGsajs0vuoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQGKygy9teI3c4oEr3kszriQxj0XTxHWfQXm00H4DQ8=;
 b=gIqbM6B8ojYB4JEv1XAhpYf+9a3MGSgwnvcVKu1J+Tsj6rmPCGgtnEqZ5X+p8OlfjC40hCP/sQk5PUhUNRvk2smlshBx7oxSwb55o3yBuALsAOyilVusOr1AZlFAEZbyWRzZc6zGQjVJ+lxQ5oFaPK8ZueybU1UsGd1EEt6Q728=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by VI1PR04MB3229.eurprd04.prod.outlook.com (2603:10a6:802:e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 02:53:09 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::644f:b22f:2f4:d69d]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::644f:b22f:2f4:d69d%3]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 02:53:09 +0000
From: Han Xu <han.xu@nxp.com>
To: sean@geanix.com,
	frieder.schrempf@kontron.de,
	festevam@gmail.com
Cc: ye.li@nxp.com, peng.fan@nxp.com, han.xu@nxp.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 2/5] mtd: rawnand: gpmi: Add strict ecc strength check
Date: Mon, 11 Apr 2022 21:52:43 -0500
Message-Id: <20220412025246.24269-3-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220412025246.24269-1-han.xu@nxp.com>
References: <20220412025246.24269-1-han.xu@nxp.com>
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 404651b8-c198-47ce-7cc7-08da1c2f937a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3229:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB32299F958672BC416E2B024197ED9@VI1PR04MB3229.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NYu0Zy+P6g2s2FSnczNu38cLY/15u+QjIQ1UGsMaQa8hAPRM2XozporZlestDXwK4o7YvRitwYnxpajcaO6jBmy1zW2AGJRoCn8SbFrETO3xaaKaGCMOjamlpLFY7mcTPw/tsrDAGi6cR0KfOy/J/dfwYzngfGGN2+C/hrvUDKQDHfuN95/6xWYCbBkZZA2ecpDX1rVrbQQhdvyz2XTdMhI98AYLMEogeAZ2GnXuEvEWlKX3NGo1REb8U+7TtHJsmwdiNCziZybE/8Pww0AH/ZyOzLC+rWg8/hTuOo1hWF+FYErOanSInc8+P4Fe2MyCmTfL2LUBqKKs6lFKZ83/pfLFVr/o7PMIPzjfCePRxgfuIuHvTZIQoJzsJJEPghZOiJJBcpQtWVTqBXt94CtQ9CgNBBP40S5jIQbEshHBr+gLSBBFL48gGXU5nhdlyOS95D05SjjG4+/dCf3BjfjQ0MbTioTFHdrh5AeSI6ZYXdZt/BMOi+C6SmdGCxcKmizqeWcVKRJeBtmOUmWaqEwQ0MHP7ZnzRruax2JlR2nsLeDBw/AUUp1kcus8okbHuwhLKPju6/dMYF1lEvXvKSdwtfvbqKjkJpaSsyeppb2IC1ifs/lWunNSCxwW5ofk20VClxZwRiJj6itDgQnOnC8eflld5xmZDRpL/WPqQ6W4ZEN1JPyxo8uvdhcmr4vFy4YxGTnlnXMbIYWP8B7nF64tww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(186003)(6666004)(2906002)(5660300002)(6512007)(44832011)(316002)(2616005)(66476007)(66946007)(6506007)(66556008)(8676002)(6486002)(8936002)(1076003)(4326008)(38100700002)(38350700002)(36756003)(52116002)(83380400001)(508600001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FrTZDiCUPh09ktW3mDHcgTc75PpMn0HL65Rl80L8Dmh/1bLsWN5piHb4vjJI?=
 =?us-ascii?Q?G8/uOYbZ4GljOUVF/yB72ySnNOB97s7h0CiyRUoa3b9YeaYwfQ92raEmLGiI?=
 =?us-ascii?Q?mRNYtST5xnton/Vx2MPICcBK6k5OlGgWEFlK9sabFR7kQM0SP78pTJGuhqSK?=
 =?us-ascii?Q?n/uvxj8LAcZVour43leffzXWgiea1mTfgF36FG8cyTD2M5djhfdgYAcNyc4H?=
 =?us-ascii?Q?IC/XafIpKEXj+F1BTahL3l8qtcoDpAvCbcuUp1vWsKL+7+mEYXbEsLwq/UDy?=
 =?us-ascii?Q?6yVQzLG8A/SFJiG80WH71YoeNVNrR0Qrq6R9IZMgCya65LPgBmKTxpZACMdf?=
 =?us-ascii?Q?EOAuVaLRX5vbbSpA/QU7NbKdhZgeRVvtMtIo4kUP0W72QhP14daI0bm/HaK4?=
 =?us-ascii?Q?tBKcAb2Ncb5jzDdxzjrThZ8xrHPc0ftW8OBDCWKTMdqLby3cAC3inifDH5YX?=
 =?us-ascii?Q?FiZdLsjUrfMWojT0XtGy+8Sw24X4XaVHfyKHQosKIafbP+IrA9LK5bFuvTnY?=
 =?us-ascii?Q?z147ninmi87uds2EordSXlsn3ZPyHbxdo015iWcA4YxvcU+7shpiswjfkOHy?=
 =?us-ascii?Q?2jZvO5l94PIch/t+TX7m/Ee70yKpZbHE8SOgYCjptJ8j9Lebo0QXsGp8vujB?=
 =?us-ascii?Q?512jFpIXMwpi3uNmkm+bc8/B/b5NhNQIFhp6Z7IhVkFoxfSuLbf3a2CMx5DG?=
 =?us-ascii?Q?c7IZhWMZvfIt5caw6KscnWxO3LG07XyNYftVVY9OTLld/9ve6LndSD1ustjO?=
 =?us-ascii?Q?ik0WyqzaT/HvbqOw7HoiTEUE+H2+IGfEeFdnO/Z5+509UT3E+L33058og/6/?=
 =?us-ascii?Q?EdVP1TU8zklgzp8ybjhoDSYw/okVSF69lprQwWRfT8RolqVLtepiWo8yU3wv?=
 =?us-ascii?Q?YgD4CFEKpd8R4xkT4RlIsCx9IPRG8d523xhr84yXjStr8cqeZygaPg2lLLeJ?=
 =?us-ascii?Q?BMSrBR2eTDC7eoSv7wptTEw1iXceGGBnieHILNp2cXXngOCUBDfPVdulUizU?=
 =?us-ascii?Q?rIWRZtJipjQguuUKnmUMqiIhFT8RDRxj1krb5adA7JY/LjWcWM6TLahuDqzx?=
 =?us-ascii?Q?fsjzbQgt1EWCEYM8rJ3puwwrpsjCeXLjdYCBpZyYgb2n2z8yKBFlLCHqR2Bn?=
 =?us-ascii?Q?Jjf2trTo3dezXVeufIj2gMW4bcDH0yx437PhciBclIrN2f9t4fENRasqKCD9?=
 =?us-ascii?Q?ninxmzWkj2aEq8RrG93J1/d6Mw2B6Fmb2h1a60v+0LvbhXL48y4CSFFVSSNb?=
 =?us-ascii?Q?o4ZA109QQNDPqQBI5JOG5IL/52kGJHeXkHlc/bUjsk0p5jq+BE+60CRUx6mw?=
 =?us-ascii?Q?sp+5+BleXti+AnQV0YFykqP/Ss8fqmv7ncFMKDGBkHJitJQqbtH6isN/tkle?=
 =?us-ascii?Q?Fk9MrwDW2Ie3+zT42X68qwPYOEIt3Vo3AuBEVXil0RsKG3QrRNFMFr5BCvgQ?=
 =?us-ascii?Q?/+w8SkeukKxqBA0g5ntNms0zNctjpgwFjLqade9hHeP5Pn7YrporkhTVZtfH?=
 =?us-ascii?Q?0it6C/i3PNJUhTjinA81VJ3ZHJ5W9NuqF55IctCBxvVUjnQTmGaxtOfzY6Hc?=
 =?us-ascii?Q?610N2qxsHg/Qlea3At6AGkaP7l4mipjO9SS6+TjohuRXTpHDpSTglXr56YVa?=
 =?us-ascii?Q?cZEMMs/0pf2D836/+PIhvQiPFXJZavO+5bK2pLOkhuiYRHia/IXB2KNE+0Bg?=
 =?us-ascii?Q?FV7uac/GoYsbu7SgUQL1Dbo3LKlxwnkxixGFXEh8GMqYUYrbSXcnUm5i4UHN?=
 =?us-ascii?Q?5YScKZ7Qsg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404651b8-c198-47ce-7cc7-08da1c2f937a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 02:53:09.1383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kdnrZZTglSBNIJBuq88KegqtemDPI+H+DNxuCz5yfnSNuk0xmfg5sJnFBuh4/Mb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_195313_819577_618F1192 
X-CRM114-Status: GOOD (  13.83  )
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

Add nand_ecc_is_strong_enough() check in gpmi_check_ecc() function to
make sure ecc strength can meet chip requirement.

Signed-off-by: Han Xu <han.xu@nxp.com>

---
Changes since v3:
 - split the uninline to a single patch
 - reuse the nand_ecc_is_strong_enough()

Changes since v2:
 - split the ecc check to a single patch
---
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 66ebd569858d..cee39126771e 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -240,7 +240,13 @@ static void gpmi_dump_info(struct gpmi_nand_data *this)
 
 static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
 {
+	struct nand_chip *chip = &this->nand;
 	struct bch_geometry *geo = &this->bch_geometry;
+	struct nand_device *nand = &chip->base;
+	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
+
+	conf->step_size = geo->eccn_chunk_size;
+	conf->strength = geo->ecc_strength;
 
 	/* Do the sanity check. */
 	if (GPMI_IS_MXS(this)) {
@@ -248,7 +254,14 @@ static inline bool gpmi_check_ecc(struct gpmi_nand_data *this)
 		if (geo->gf_len == 14)
 			return false;
 	}
-	return geo->ecc_strength <= this->devdata->bch_max_ecc_strength;
+
+	if (geo->ecc_strength > this->devdata->bch_max_ecc_strength)
+		return false;
+
+	if (!nand_ecc_is_strong_enough(nand))
+		return false;
+
+	return true;
 }
 
 /*
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
