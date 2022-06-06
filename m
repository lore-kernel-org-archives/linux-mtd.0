Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15329C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 06:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lJAObWpYbtztj0ft1U2s2UTuM/mjy3qjrZllDWI4PgQ=; b=jw5IvoG9DAgOO/
	+qac61jVZUx0PiE7TRG9mMXXEGyU4UduJZK4VESi3ZCgl/ZqaPbqwJaAznBpcVKgC49Wvx1bKzaUI
	XQF5X7Lzq70jfBTaQGtusder3SqUPdRqlBWB/2hMglhLohQw9hQ3q4Kq3RKiYarwtUZtqWkpQtCbj
	FeH7I6yThWxGfie/0X2PPwAoMTm7hxhxJCAr2xdQF93nXslA1IReN1eltMWaign0GlehXn0AFv42r
	Ls5ZKFQpx50mTXNpiZ+uxs6B8f03UI9WTl8JBR4Uyd3gyopBI/xn5naZvnEav60E2vwJLbAyDClcA
	ayjX7RhVmzgp1ZswZFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny6Ok-00HKMF-NF; Mon, 06 Jun 2022 06:39:34 +0000
Received: from mail-dm6nam12on20627.outbound.protection.outlook.com ([2a01:111:f400:fe59::627] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny6Oh-00HKLi-KB
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2022 06:39:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CplM6iprLchEc1FdJkrCpPLapwopEhh5XwBK3G5jUlhM4+aMvnTtiPCSSyM+YnVXq0wh5OjhGlz9OS1GxpZQLuBZAI/wX78CDlyq0dRvoz63HkB6dUbQkKvdRG1+mc6Q1fQ6eEOpWjQnLGh3bj1LdQNSCwbyvt/WmMdNpkvaEWPxFZz7++WccQMb+4/CnneuCXQ+VT7Zxw1IvMTnV23K7UzokevPETkngTxlQjtjBniargEESsDuIf8EMivjFO0bm8k0PdEweKfo3PVJbT6UYeH9ONfNOhuQEWGkrn5tUFpJv1sPtT1UQy05/Ukj5/za4xhUzdJFfowYW/FeROIyag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+iGRlIfgIleM2Ys6ZzJNcM0TIMWWP8Fd6LEmEV3Z4c=;
 b=jlIvDVXYoQ29JaKSs3Qm6xV/qircz2SF6SUWYfvjISqNPR0KQMfL/PqbdWG+XYOUZ2ejZS+qwI5xm6iXerICozwrjeYr91uYkyhgeHE1NePO/sYisPzLCXKoj72yN5m3Vg4ZUV/ZeAqqEFhKmwvriL9M07MRxBjBscVxmLn/8Kz1KenB1a1aXVE6+QBDp58YmHvEQpq4abGF+JWNx2TT0u44MNrOS4bSrGmF8IgWzNpuxM+H0dghjumU7EP/lXrmZ8G73/CxA3cIsbnSudEX4eDW/URpG4E/RmolLJ3ReLUomVcYuwk0tTOtD2NTZYIhwiMquVu1uW0nx68yzPk3hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=casa-systems.com; dmarc=pass action=none
 header.from=casa-systems.com; dkim=pass header.d=casa-systems.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=casa-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+iGRlIfgIleM2Ys6ZzJNcM0TIMWWP8Fd6LEmEV3Z4c=;
 b=eIiaF0F1of3oG4Ps+eElWRSaDuqKI/yi1GITbulwDmoepwWzgk4IUBF4uFT1oHgp3EySotmQ2kNzQpnhBEkDsxEQRPkMKkLDo8V7R706YWBnp6XX9v/pVBMaSiFE+8i2LL3leZX0cgG3k/3J0UgqbtAu0io+9uOkbxdNG/ZHGYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=casa-systems.com;
Received: from DM8P221MB0553.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:1a::8) by
 CH0P221MB0443.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:108::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Mon, 6 Jun 2022 06:39:25 +0000
Received: from DM8P221MB0553.NAMP221.PROD.OUTLOOK.COM
 ([fe80::5906:2007:901a:e67]) by DM8P221MB0553.NAMP221.PROD.OUTLOOK.COM
 ([fe80::5906:2007:901a:e67%4]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 06:39:25 +0000
From: Andrew Mellor <andrew.mellor@casa-systems.com>
To: linux-mtd@lists.infradead.org
Cc: Andrew Mellor <andrew.mellor@casa-systems.com>
Subject: [PATCH] ubinfo: Fix --vol_id return code for absent volume id
Date: Mon,  6 Jun 2022 16:38:46 +1000
Message-Id: <20220606063846.2061-1-andrew.mellor@casa-systems.com>
X-Mailer: git-send-email 2.36.1
X-ClientProxiedBy: SY0PR01CA0001.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::21) To DM8P221MB0553.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:1a::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b67143a-68ce-4ce0-954a-08da47874c23
X-MS-TrafficTypeDiagnostic: CH0P221MB0443:EE_
X-Microsoft-Antispam-PRVS: 	<CH0P221MB0443FBECD07AA0A553544F79CEA29@CH0P221MB0443.NAMP221.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LHOMgFIkPq3uhXhiyosvlQfNMN1XmAF37wzfunTliMhG7l7y3Fe/eBDAjFiYMD3W+yj6QCCOg0eUnnVjt2X75re/i4EWuSWID/pOQrdKJS+tR4lS0ztFEZByMGhWN53qZvUCOwPqRFtitartHA4H7KQZMMGLA9kvM9QNVjwPOb8CnJyNFVXPDUTVGYmNVH1qlgkuxnBQEL2OkSYXPxVzQSPgX2FpF7oiY8bLvv9slwEDnApl6n1QK3P57cM/iSuyizs5Qw0n9z+GEmozAhjxrNG4zGdRAlynfd9LNIJS3bK2w1ki0Zxlz65on/yeW/jJ6sKoIu4gnXisfe6ixN/+EcQVGze79Q7jJzdFapzIo/z5DMNeQ6UOHagR5u5GVjPYW0nGEPxDq8KXWveyawK0lfkYvB4RJt7Z4mtGDV7pF0UABBxiIYvTX1KcjVDDXtmIX0fUweiNgcT826zT03Z9WEpwdeA5e2DN7hGZ0dr4/txJMzGIaUqlpApm/a65AFYoM5uI2melYp6jDQbRaFt5rfyGl3VtbC0hVtZgLr8nL1ANr7kZ+PfGhE79IiAH9AcKVdgu7ehFuQgp/OxbO1PA47xREVMgq2TEPUSLdBb2fd+VdtinFJZNxsUny4yBUVzkzOg4XafIPmsFwyTZT134qzc1xgZenDz3TBpRSPPFE1AavhDBIirVqvI5YnNn2N2pLsxHKdXnMA0FTa/sf6VzpQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8P221MB0553.NAMP221.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(107886003)(66556008)(2616005)(44832011)(36756003)(2906002)(5660300002)(8676002)(186003)(26005)(316002)(66946007)(66476007)(83380400001)(1076003)(6512007)(6916009)(4744005)(508600001)(38100700002)(38350700002)(6506007)(52116002)(6486002)(86362001)(4326008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pEonM5AOphLCiMTcUiH33PiIx03AEELpX8U0/dWCqCUvwK4ucattbPvyby5b?=
 =?us-ascii?Q?uZoymXhdSgIPYcEZgaKm+YLQEaHpRKHshbfsPw+wF2JviJAoboiludbXkD5X?=
 =?us-ascii?Q?MdQq+HsOIDsqJp9u0e7mNq4iSWrdL2vUq2ZrbtjCEopPUvLV+asULMJIyjCZ?=
 =?us-ascii?Q?fUBeXzzyZ91T4NZ1zCq8mx4rp0/5h5qTVIS/1cAa7D7MFpC3dIpJ1dznjiNi?=
 =?us-ascii?Q?pDiVrMlYoLttU6Ea34KG5P7X6MD+fIrNIG2OyZLug+MNGS+zp9LYXZLJr99B?=
 =?us-ascii?Q?PpvHoUPWfkJT3nrue999OR9r9OIufmfuzp+f/T0FZdGPLZhTJXzvsSWWruhb?=
 =?us-ascii?Q?JUS32PN7HgBcjHN8B4eirMNHkHO9ll77Rscc7BEqVYdUlgLJF8go2WuZzzzB?=
 =?us-ascii?Q?L88WAAnQbv/+fhS3Z/T7tY2A5xiHMu5A9SUtmYWd25Ehg+cUfbeJgB3JEswj?=
 =?us-ascii?Q?Cf6tUbx1uYSu8DZei0cr0lqZy8CF2GHXVJTqHUw68xfxV9hbnScG5jY3oYf0?=
 =?us-ascii?Q?T4o9glvJ8HWpfKNQrVNMtsAXfcU3vzq1N6YZdrOovrlII+bOC8RWtHUjb4SD?=
 =?us-ascii?Q?6M2jy2dgBtWnVdpgqKkB3yW6TBmHenGUmNQ4z6P2KtOsqi0imnOrxFUSwbbn?=
 =?us-ascii?Q?5OCvcx6vcc90alBV9rIqASsCW17EHQ1FVSjSz+meEWhSybS2oB62O92dctsR?=
 =?us-ascii?Q?QEGRykulcD4C+fjDIjW2WiwURJyWm53uKFTM/FCFD7lFwnUzE4qvIFNsaofT?=
 =?us-ascii?Q?LcS512oqrZ7yrMkxG3G9kgPY29f7/4TrgRIfhW9TAbkbBzntrDWaWB90xckF?=
 =?us-ascii?Q?POU8LlRCy9fEjDLgroJAg3+U7OaACZ4RyAzY0NxkPDbORxacEzDt4CUIgcm7?=
 =?us-ascii?Q?bIr5mkSV8nl8eJcqDKKLb8yyFE04lU3fsznnSuXMOMklNDrAtRvzO6wpkgPF?=
 =?us-ascii?Q?h0Q+uKdSkF8khPCqaqxBwDDztLUi4ujAiVjrsXWuCl8IzxOywV1ZnhAp4Iv1?=
 =?us-ascii?Q?MRa/x29cycAtjKk7ZXbmBp+Ij81tp6NLHvpBv9UtfKXH9+6WpnrJWVDJnltu?=
 =?us-ascii?Q?1/CLP52PW3FIc7LiDnUGnsotWpHazNd1G+1FfHytHbds9tynk71xiikWhCPL?=
 =?us-ascii?Q?wx4rnkR2A2YjFYw3Myslyfrpc5GO9nf5tZ26MudVQBYu+JxoV0VI2bEA1NIK?=
 =?us-ascii?Q?urOYhzfRgsIq4WpTJ/BTWIAr5M49TAg6I184AwDjwiC24nDlAnCtocbiYPA+?=
 =?us-ascii?Q?/LyMSscRZlgo9YET2YOYDpBpkNpQZhny3dhkoCglGRqWFqnrm0+jXjCEKGd+?=
 =?us-ascii?Q?B4lKwJL2xWKBJG3aYnvbLcDHmNnne36Kt7EmyNdfJw8m4Ecux4FHBIXCzMGC?=
 =?us-ascii?Q?jmTEhQkrKbHa/DhGGLb4RoOyz4CLnvDdHjmXJoSZmJgYR7aSF22nmzdfSmLW?=
 =?us-ascii?Q?J061hQuJ5Lfbz7SDrDB3ISWJ/KMjKSydlC2+/AlbL7PBXQiwCvvEC531gNIQ?=
 =?us-ascii?Q?loaVzdEp/8SKxUjbaEsY+pjky4rUjW2pmBN57gIjndl3B3rcoQcrurD57Yba?=
 =?us-ascii?Q?xHgl06qrfXWZVDxvnpjbgUeeiOua6uVCTgKUkQcNWeYMmuUxBaNdh3fzfmCB?=
 =?us-ascii?Q?h23rruzifMteZD9Z8wYdIcA81gJIs6T6i2vahYSzJxvIeBSR/52QkJuLoOaD?=
 =?us-ascii?Q?DrsuXMeDyF+aH7MV1qSiUiKcOOr6y3bPNEshc56NfDcdh98dvRo2JA0KjRGh?=
 =?us-ascii?Q?jgnl0VX5W+1uoMpBRke7Br7ybiSm92w/1Wg7QI9R02SLooADAypf?=
X-OriginatorOrg: casa-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b67143a-68ce-4ce0-954a-08da47874c23
X-MS-Exchange-CrossTenant-AuthSource: DM8P221MB0553.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 06:39:25.3184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 17b16a32-cb34-482f-946d-8a975023450e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyzibMGgvjRumh3nOvMvlNa+X/CwkxFAJIMgUWFMzkyE0eYH07tLSn2qaZoT+M61danbHMrYrOHXfC6CD3rM4UFmaoTPu9p+wxcAamCbepc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0P221MB0443
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_233932_052412_F9AE9E50 
X-CRM114-Status: UNSURE (   9.53  )
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

When using --vol_id and that volume is missing, it should return
non-zero like the --name option does.

Signed-off-by: Andrew Mellor <andrew.mellor@casa-systems.com>
---
 ubi-utils/ubinfo.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/ubi-utils/ubinfo.c b/ubi-utils/ubinfo.c
index 29530be..53519cc 100644
--- a/ubi-utils/ubinfo.c
+++ b/ubi-utils/ubinfo.c
@@ -417,12 +417,9 @@ int main(int argc, char * const argv[])
 		goto out_libubi;
 	}
 
-	if (args.devn != -1 && args.vol_id != -1) {
-		print_vol_info(libubi, args.devn, args.vol_id);
-		goto out;
-	}
-
-	if (args.devn == -1 && args.vol_id == -1)
+	if (args.devn != -1 && args.vol_id != -1)
+		err = print_vol_info(libubi, args.devn, args.vol_id);
+	else if (args.devn == -1 && args.vol_id == -1)
 		err = print_general_info(libubi, args.all);
 	else if (args.devn != -1 && args.vol_id == -1)
 		err = print_dev_info(libubi, args.devn, args.all);
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
