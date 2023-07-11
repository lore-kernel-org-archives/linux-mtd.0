Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27E9EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jul 2023 02:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v4c0a7UdCGMw8ypTzzJA31T4i/oX8GBpky/3sLreNn8=; b=ieoPJiWZ0Kr+q/
	bj2ee2WNzrs8HJdiAzYCQ8Rpx9Zj6f5JEOBUYHiajnFSQmL2xNT/jOawZhOVWaalwVHU8Wuy54uwl
	F2uvCqh2SaN6M/6mycriPp0TOs/kJEZq3R/+S/MgDPOjAiDqurrrIkH35AlADTtA7ZnAePXCBHbrt
	RTS48PhUkrNvuHYbXsbWOkGVtTNyeybh3tnN3l4GlaqzxeOC41R6BkMxH1raKoWxcmbHmc8Fd5KQe
	aps/dJZ1uiExyaDzIDjYXDwvQqJYvUS9gWEKlUloXPGdc9cXMGskRr2BeWYU3RxuTZ9nqEz2gaJp9
	MJImstQkVbTj7qUPer1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ2ve-00DIM9-0B;
	Tue, 11 Jul 2023 02:16:38 +0000
Received: from mail-tyzapc01on20704.outbound.protection.outlook.com ([2a01:111:f403:704b::704] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ2va-00DIIK-27
	for linux-mtd@lists.infradead.org;
	Tue, 11 Jul 2023 02:16:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtRGrKMvE/G8jNH7Tz2UdJ8BFvFvUSfJAwyyuJIB1C4t2TaknKrfCLQ1C5DeZ5iR77qBmV5NwCqTNJKWr7RQNEk6Y5Iv78wd8BZuACJQY7cP3Lpz8893JG3aAjnZRxNbQNJseM04jnI1KuFzdVOAoeI5kYUC6mJuTFnQr11BPM6STflj1YBIQuf+E3nJsYthMkFSDXWOpVt5xR1p4TkDYGsq/8hYas/sV60Y0qRLJW8fh9ucourpQoQ+A4HH1Pr+3kft+F4fKPaylkudmSpN31nj6G9SzPxE7+l6DeAtlcdoG/fgZkEwXz1MzqXyZboO52erbbHzvX3rw6HnVPfzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAgYBsvm+5MtOl0FA+KExxjV6685XtKEeMZjklp8o4g=;
 b=jEeiAFGoPJyWdwYbqnqadZMRe/aXcXQTOZBknWOcExgW/4La6sDP5KbdMd9Vt/0Do3nXlcMEUcgJqcAyHxdLFZKNOpWxDnDEKmEyV5iWYgG0q9u/Uu9RFj84gsIXAKSA9GDe9Zuua4sPrZWbIXu5FUT38/mCsCSgQjr2k/mH31CrBIvaDbyc0aEgOI1I4av0iRbWzVoMFKceLZcZSAEINmFqu0JC4j1Vj74KeuNe9IIL3vu1+CwI7XgfP+XUpjbwawoXuhtv++m3fOJnAnQS1IP84E3jmxae8SJEzdWiNYrY3RP3V8n0A/zPVDj9HskPgqEhfXE9dd/YAb7G1nUHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAgYBsvm+5MtOl0FA+KExxjV6685XtKEeMZjklp8o4g=;
 b=GrmcGEBQT9luPCI3q/LPXBZULjLmz8xTBOFrNmMA9m/5MLz9hTJAi7LL54zGrk+rq8v9pJYy51b9QTnE8u8elds0PZBAf5Fp2VqiRGuMmLySCKYi54BuJEunUBt3nQDCIwCKPn85PJo+KSGpJfigpsDkaO2Lrq9Dt8KRujQk+Gqc9b/T2a23pPXsuga+XdedJa3pPHh6U+MDJHjBVXR1Yw3aSYt1w0Z1ahhCHQ8FsMNe0GXYCMA0dKZWioGJtWnWwjMJEFCt00h5+Rb7fVUsqOeAWGFfavVNV2fdfNAzgYbagXRECtttkDgrgWM50gMEDt3HDhSI7uLYAlk+USGJhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB6615.apcprd06.prod.outlook.com (2603:1096:101:172::11)
 by SEYPR06MB6505.apcprd06.prod.outlook.com (2603:1096:101:16c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 02:16:13 +0000
Received: from SEYPR06MB6615.apcprd06.prod.outlook.com
 ([fe80::c817:d237:dc0d:576]) by SEYPR06MB6615.apcprd06.prod.outlook.com
 ([fe80::c817:d237:dc0d:576%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 02:16:12 +0000
From: Yang Rong <yangrong@vivo.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list)
Cc: opensource.kernel@vivo.com,
	luhongfei@vivo.com,
	Yang Rong <yangrong@vivo.com>
Subject: [PATCH v3] mtd: core: Fix resource leak in a for_each_child_of_node() loop
Date: Tue, 11 Jul 2023 10:03:10 +0800
Message-ID: <20230711020752.2344-1-yangrong@vivo.com>
X-Mailer: git-send-email 2.41.0.windows.1
X-ClientProxiedBy: SG2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:3:17::32) To SEYPR06MB6615.apcprd06.prod.outlook.com
 (2603:1096:101:172::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB6615:EE_|SEYPR06MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e6e008-b9c3-482c-1db1-08db81b4cc34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OLfKVqTyCGIwiXBXQ/WjAj4LHWktd8x1yj9FluOj5j75er8DsQvb07fDrywLSgQvlZjijwxHKjDBCYpsOAlMvsCkwRmPv6iK+ZXYIHqYsQpRBp2PRQY/y+hXjm20JDE2KG9n4Vl7+xsOZ/bSQ6hx96aINdvgbAbSF1uXDRq5okCPubOzA9wlPpNkKO7RnimX0TEuL8qERtgXiOLuYkcHinXEkASDr78oZ9ffUe7gM2FwGCFYccglom9Hf7tdQzMJx4YhkqDs1/bC7FJ0NAZbSwzSmknfnzkyPluK44Uq2YWi+fMmiQO3YD/j3LHuem/G5nvMNCyZgoJBOG9245jt5fyPIl+rdGWtqqOsCWy38+ZpNTjZ0Z8oaaUvYt3Bqn4IZTkDL7YhQiavxLcmwjZFtdGZU+/0unkOjaJuDPqf6hBXUrwr0XAINZtLCIDj7zOPsBStcNJE29yzm/6ImUK5r0RCSCrN9k8hXIeHJZ0gkzbsE+hHvH3HMLJDRm32owFSLPs3DEEbpHrvSX1krARDWvmBMsjF5urihvG9inEgXGkvxINndcBcTRRFs4wKIirF1lcIOq9+0VNJ7l5iIXFFaqx+YjMHJc2Hef/AetG2LhA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6615.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199021)(5660300002)(8676002)(316002)(8936002)(4326008)(66476007)(66556008)(66946007)(41300700001)(4744005)(110136005)(478600001)(36756003)(6512007)(966005)(6486002)(107886003)(1076003)(186003)(6506007)(86362001)(26005)(2906002)(52116002)(2616005)(38350700002)(38100700002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tcv1yY0Bzd/cBgdAHf7WlS3GrWowbKwV8aO0Pix9wuWo/EiV8AsmIPMQffMx?=
 =?us-ascii?Q?r38/XYf5xJsDCCcvxyCW3RIQfGrhTURCH5DyonsLN3UpeozP9q1TGw0fticD?=
 =?us-ascii?Q?6n1C6UhH1J5ruUsZdYwWpyCOo9Uza0AaiHpKYwPrbEFQzXnS/6nSquljngq4?=
 =?us-ascii?Q?TW3WKmZSeuHf1WD9UZkIPvmbki2lmrFir0c/aaAflYCJjhiQsLYyfcLsAeiq?=
 =?us-ascii?Q?pSuJdyKcdOSrxvW2zb4XWmTyg4bkGPCywiZa1OXgYJMHEp8P7kIiQN2Ageev?=
 =?us-ascii?Q?OZ89DSTd5yDuAVMK/ctXcQtbuggmZXhnz+le/wVXrDGr2X6J/t0HciY6SrQI?=
 =?us-ascii?Q?Ot581sj7N4G0VXANVMjLDA//aGEUOIuuPr9dSr8EWM4XetDXW1taBk2RJ7wh?=
 =?us-ascii?Q?1lCozRIocstld4WCoJai2G91WjpSmCIQ/xrVjGwD/Yh5Oyc7BRfnpBFY8N0t?=
 =?us-ascii?Q?D/I4fAFks/xjCnC6xopHBgif2heUbLudtPbBWgBuE8BQjRMkF9+/mwap1BaA?=
 =?us-ascii?Q?oeoSw5C3hB0jNPY3vekudoRvYD5y6A3YRm8jlIAyqkt9nLsvUMsHtrRI85LX?=
 =?us-ascii?Q?/Xz/Lh2ZI6ipW+9EHDuUFmFlEMzdfPAUwh4SP5dbl7bC8Yw233z5KYRdu/+Y?=
 =?us-ascii?Q?+Ykc4P4FGMrXdWVsPdM8hPtvXeFTZ+Vl69Qv3939m+b3fNNx11pnDtCZCXTG?=
 =?us-ascii?Q?6hWCXWM0LTvI+qV1blzaQLRYbO1PTkZn5XMC4vVb8sMPvuq7uzNEKazBX38Z?=
 =?us-ascii?Q?ShSUtLy7zknGLw5Yg6aEE3j6v8/7/r/IAaIpLDQkTxwFV7O98bOVLcepLmjL?=
 =?us-ascii?Q?Gui8UApv1A0AVH9fVot6yGQUUfdE06DKaE0TpOpXgQ5kW/PV+HoXGTVi6mvT?=
 =?us-ascii?Q?lxwa8DFrZ9a4aBDdW9LcnSNVhdq5GesIK7eyEBW9EdeahBUyhUZv+ieSTqB/?=
 =?us-ascii?Q?tF71PhTVVY9KNPIUL8kMzMcVbLuCA3vclVStMi6xH7DM/y6c+CLSEZVakBTc?=
 =?us-ascii?Q?zqr14+2cSMLyToiAD/Gdaiwsa3bcS5sACC5kLjNs6Zt6a6FtdsHYYs19x6q6?=
 =?us-ascii?Q?BzbB7CoFk69xE/+uamUGc3xjvsEt1RBgnZ1zO3WPTsLHOl9hAoLUkPmdtu/u?=
 =?us-ascii?Q?8fhCbTUcaP5aqhKbHnCJ6arlY91U0R+mriIKYTwo5iqCvw7V4aYnAo2sG7we?=
 =?us-ascii?Q?gyza1NHFCLsAVZVkXwhneZlPE4Dm+jT51FcQmmMLhW1VFa0OVufBWm1FqxYp?=
 =?us-ascii?Q?jmKF37VmPCB7e9R8fB+nOAR4b9yWKdxQT6CL04Dpd8RN0OynSklTHQ1zsvNB?=
 =?us-ascii?Q?/uOco8I7lOQAolXrgRtWR6X8sIIzg20VYIQ83uoym5GQpvsGi0o4NJWi6wON?=
 =?us-ascii?Q?utDT5TaOtp1vpWk63q3xdAl1RYds1j0wfIsVjFPy9sH+/ea32mk7jN61t6Go?=
 =?us-ascii?Q?I33E/pm5BuYGPCBTesI0Ekvk9Szug64BtvQc/WrunDm4jVaeH+W4jnB3kMj0?=
 =?us-ascii?Q?YB957xyRQt3gYNnBJgIsoRgGT/h745Aoj0sKmVp9nW90roK8eeT5K2Ml6edD?=
 =?us-ascii?Q?xtEyMqCEMo4rErOEG7zMjfVAXaCx1hWW1122CJ5j?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e6e008-b9c3-482c-1db1-08db81b4cc34
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6615.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 02:16:12.5542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ltQYKAhd+axV/iUAjJKBRJb/knl+Xz6ZiHoVIW/pCypsa8AudHPTtL4520nDGYbG++jDE8c0i6JJkS5MG90AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6505
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_191634_722428_04BBE7A4 
X-CRM114-Status: UNSURE (   8.31  )
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

Ensure child node references are properly decremented in the error path
  of this function implementation.

Fixes: 2df11f00100d ("mtd: core: try to find OF node for every MTD partition")
Signed-off-by: Yang Rong <yangrong@vivo.com>
---
v2: https://lore.kernel.org/all/20230710061412.2272-1-yangrong@vivo.com/
The modifications made copared to the previous version are as follows:
1.Optimized the expression of the Subject, making it more accurate.
2.Optimized the content of the commit message.
3.Add the tag "Fixes".

 drivers/mtd/mtdcore.c | 1 +
 1 file changed, 1 insertion(+)
 mode change 100644 => 100755 drivers/mtd/mtdcore.c

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e00b12aa5ec9..b02cb8b1a38d
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -591,6 +591,7 @@ static void mtd_check_of_node(struct mtd_info *mtd)
 		if (plen == mtd_name_len &&
 		    !strncmp(mtd->name, pname + offset, plen)) {
 			mtd_set_of_node(mtd, mtd_dn);
+			of_node_put(mtd_dn);
 			break;
 		}
 	}
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
