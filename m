Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E71C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 08:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GRX6D+ZPVNAUFsImzMQbxqV00Vz1r8FjC71vJjazz8=; b=1UEyPpsbakW/K+
	10laMDuACcwOJspcaM98NPY6/jUyrLHpqE69WPHtL7eUKIMjvk4ey1em1BElqson4lfVrgZbPJ8G4
	0ps+sS1Z8QCuIcv1nS9/pMTIFyD5oD0fmPPbBVVE59dMN/MWU0WZaS/0iyzMLt7bz4Dk+Fnemehmn
	wXr8mpw7GVCrjZNO/7aA6a9jsViY+NEUdvb7gfFTWtuLss4pPw4hkNUIbPTKOnlmrQ8/fafVWXVvV
	ejLC1wXM/KVQxGtZXA7a4bAtl593oEsYGejj1FXTWU5YJqHlHtLe15JsYUgLkQOktQfFQ3vxmeH9a
	N4gRhzyH+FWJnUvPRSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4L0-00GVOk-Lc; Wed, 19 Oct 2022 08:22:06 +0000
Received: from mail-am7eur03on2095.outbound.protection.outlook.com ([40.107.105.95] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4Kr-00GVBC-2k
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 08:21:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBc7CR8+Hx8HM7uOWzxoQHAEAW9mr4jHnMQi9x3O1tztJp/h0YvVAsrGSf+l6LuJ/HBXgHwpijOWXCeTZCnF38WzGwdaD0Ceh3CmI/ZyLBXslYENrrx4V6mB9tR/BIhiXreMtw/kRICiXtbVJfvIlMOlnMpK8z4/OgpaO4/uwEAU+NcEOYQQPvIUECJ7UySdMb9J9hFB7S71xZ3XvNIL+HAjhFeZz2bVtVoY5g5R1bx17hppHSP60csJzDkCnJdfwtbvaKcGfUK6dac/EHOngAYnyx1edYsXEQ2pOfACXVZamcs5CMK041cnb8LtR2q0Q3wOAUy6gebXjs3GFGczsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Zqq+6atQst8xSBDiXola7CEiaQd7MWo/ASvH5t6vz8=;
 b=R4NL4KQMKoymhTW6PJ2nrlhPmBsSvLuPpzU+DwZgAI749n9M/zgpv+LRG44E4TDhys+XoHzKw+llDuuZwMhwxv2p/XLDmRTQFyhQNzyd0633zfgiE0X7W9wZx6Hl+ZCXe6mwTZ4aB29s9mCKM3y+rE674MoEiktAHm8ZvZ3BS2gTneYK1iKNK4DxLCp2e/apvlp51b1Tae2t8iOmhE2i3XAAJhYfP5gCcDxxmAlibzOWL8JvPVU6P0XiiKFQSR5zG5nSlwt0ykt5iXyeQ1o6GahBZ+VxItXBxZyGXFc0hEwODUJyQZaBuvoR5IF6il2FsaoB7/vnG2mkg6394BDKmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zqq+6atQst8xSBDiXola7CEiaQd7MWo/ASvH5t6vz8=;
 b=X8YC7XSxk3REbILt/ZCgXHsL0TSC66Pr3CYtr0mwY0dJtk+/VW6Bh7nvoR3CI2XQQRZSJ6P2LgGE6tmF7QmvHjGNSjh1zEEu4n63v6tiCR70CzaetZKjCKA6tTJxafEhCK4BB4+rT8QSkQnJ8Zc76eurV6kYUCUvezvCcGPQftc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=plvision.eu;
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:38::26)
 by VE1P190MB0879.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:1ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 08:21:46 +0000
Received: from VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::a621:b61f:de56:b8]) by VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 ([fe80::a621:b61f:de56:b8%7]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 08:21:46 +0000
From: Vadym Kochan <vadym.kochan@plvision.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Roger Quadros <rogerq@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Liang Yang <liang.yang@amlogic.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vadym Kochan <vadym.kochan@plvision.eu>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Elad Nachman <enachman@marvell.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Aviram Dali <aviramd@marvell.com>
Subject: [PATCH 2/3] dt-bindings: mtd: Add AC5 specific binding
Date: Wed, 19 Oct 2022 11:20:39 +0300
Message-Id: <20221019082046.30160-3-vadym.kochan@plvision.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221019082046.30160-1-vadym.kochan@plvision.eu>
References: <20221019082046.30160-1-vadym.kochan@plvision.eu>
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:38::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P190MB0317:EE_|VE1P190MB0879:EE_
X-MS-Office365-Filtering-Correlation-Id: f441b2e1-db76-4e78-54ad-08dab1aaf616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PKHlMqoZWYIXMp/3QsjOPIgd285K19D2F0ISZ//FU2Fk6LCaNfrUwgHHyv1IO2h8zePMXRMDUHmaYBB7JqEqiR/VITvtBb85bMEe8Top5cxEhSJCD4sLt+Fyz+cJ2ZpVIy44syusmhLiGIWQnlKStgoRblyw7XxiK7xg/Ei6lvOzX8PkkZiqQHEvBvfck9447Q/cZbAJgVFpwI81sRx4DxC2t2ZCrqnZki7x1MeGdt+xjNaLKOtwhI1L1BBJTQITVz2Eyn7cBfHx4QO7rFksqkRWUoal72c+KIjfmTX2P0O6z/buNforSNA2zWDe1SDxa2fFuVldC6qIHOpro1RHEK9DxHHo2r2y21pbRbp5KraqgBH0glKMN/3dCG/p/a38kCaa6K8sSo1fk3KqP0Z/lZaZ2jwrKNXdZtf/7loNXfAnXLBAYIo5j5vaj3rNKgitbW/ECACI7mAVE8dW7eGmfui/gY37LfhNqhvufZh2Adk5UlYMmfF9D5G84ilZ8UfgUDpwahAbDOHJcjd1pmG/VT5SMEFqI4ce6PpONjdskPr/1JMGHOUjz7/LxAsyROfQO9ynecHlM99GbnlUjIzmNz1inqB1afGdJjovrcg3+aS9JEIf+JaI9W2Byue8LWHNO9DkMyJAqSp9RL87YVPWXFA88MR6R5hXwiBKXiAPUJIisjxWG3ZyA5W3i0nWWKkNVIXx/DJ6UwehE89y5TeH/XCXVEj4jF2M7+EuvMvfBnAYRm+29iA2SLn0Aln2EOJ9w8F0HpIwHufnaabEf4tlyg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P190MB0317.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(34036004)(346002)(396003)(376002)(366004)(39830400003)(136003)(451199015)(508600001)(6666004)(38350700002)(316002)(6506007)(8936002)(66946007)(66556008)(8676002)(36756003)(6486002)(110136005)(41320700001)(921005)(186003)(4326008)(38100700002)(86362001)(2616005)(1076003)(26005)(54906003)(52116002)(6512007)(44832011)(66476007)(2906002)(41300700001)(7416002)(4744005)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?eC9J1a0ZWKQWTt8swOu/w/GM1g8K+4sAZtfzowFErp1kXGol6XP1nNOTt7zQ?=
 =?us-ascii?Q?YAp7KVWuBrNsnxd2J6VeqLrJczVhbAF+/HBoxuv1sklPq1EDdxw5DwAeLLm6?=
 =?us-ascii?Q?WYBZaJpzW+ZyHNAlWCV6+lOuAIk123gwzU2OzrLVTnriMHjUc8TyvyBjLcXb?=
 =?us-ascii?Q?5+Aa7CYUt/ytYUYuXnjJSRWPU2OQwENGYzH6XWXEN3rpo1TkjM2fLXk74Rwo?=
 =?us-ascii?Q?W0Aj/ajwCI5eGcsmplYV3R1adAt1seZ/XZqa6VnhPNS6XvTqvS6z73yTjdH8?=
 =?us-ascii?Q?ktEzp1qzDHoyodnkO3vP/HXEkBy7kTMoMWNzzQMWW77oeY1xaCxFXV9cGUml?=
 =?us-ascii?Q?W1UEf69z1yWNHsCybkA7o/nIVrk8x6cakWJUoJJLHlVfiPXrO7/TZk7oG4zf?=
 =?us-ascii?Q?TvnovCEJK5V6IOAngHwHfQhKMRPOxdod9kyNDqRPPyRgmKVQog3peuW0QwA5?=
 =?us-ascii?Q?auw09dMtAi9lKwFTJW9xeSnPLqBMQMxWF3NjSHfnzo1D5nkmg9oryk3axt/8?=
 =?us-ascii?Q?Ya4rJyDUAwe4sL1ZOMl8TpGpJImmYODJ+j0zwwyLBZRQQywxICPtFV6doLcc?=
 =?us-ascii?Q?qFUXOhr4s5zZiihJbeWrU7dHfqU98WK8rE7PEyQLjOaI5DhTPwLFaEn/MF1M?=
 =?us-ascii?Q?8XkmF/psB0f2wVxZVUajtx9vNEh3aDcu3HZ61iA6LMgL5P88T0TgRqwQS5zR?=
 =?us-ascii?Q?KXVCmIubWRGN1TnB3rznMOTHXziBSh+s7mgNXPytVwqSdw5KBwqMlNwa9skp?=
 =?us-ascii?Q?WuKKY2OyRbDSSUERFTqgaVAO3vUlmXT8JIbdmSKtez6vWSGsqWaC8THhFoR+?=
 =?us-ascii?Q?3bSEV9QUvtm5DcpFmoea7loTjZyiIrF2sm43y1XZykAF5tGI1UPLEP36P+zP?=
 =?us-ascii?Q?ZqhIbIWDJLq5e71O4oyUgCRDpVP1qmGUY51oLIPtiTSLlkiMSYRFjX2kM3k0?=
 =?us-ascii?Q?NnFYYfSfuarpsecQmzB7K8JBXq64KigPocZ6sF9yT3TQl81QJFahqoJB6OEq?=
 =?us-ascii?Q?+MCRde3acbFt9lAUuN6nAw32sO1YMLXg1D/BpOVZQGXY6u/Xn3OzMcGzdxXY?=
 =?us-ascii?Q?bkx/Jdyqc2ThbqU/4myHYZD45mGs4AC3irCmswshF3ZZ/6/wyZ14UZ6VG2Mn?=
 =?us-ascii?Q?FvV1s4o5i9UFHH2Nex/nirTjzuOBcekYtCDPYB9idJrJ1TnsQOlJby/gFy15?=
 =?us-ascii?Q?DLRSOZPcLQitn/wYEaXAZIrFGZzwRBS465el+nPZG8enSqlctziCVB+oOZim?=
 =?us-ascii?Q?O17vuN0VfEuNdXKh4qmgdERpyUovM1KkijBO8jMhqjJoIKd1/cdEFQP3uh2e?=
 =?us-ascii?Q?aXESwVWFcRhP3kYCS9+2rdaSNgmnRIE3sKUlU8nMEKyLqyL1Wa2jKqKyq1id?=
 =?us-ascii?Q?oJcpZmgYFhuZf4jMtEKbcU/1Hvs30MydN2oUPupIyOB+Kg73J3I6drftFFPl?=
 =?us-ascii?Q?m7jduHhVI2YMe70pigbfacVSW0zAf9OOIryWm5rsmAIOezsgxHgOHN7o+Iob?=
 =?us-ascii?Q?OoRNaVhZYPtD24ipNbmNAxdSpov9MByXSvGtOuq9CEFVrGU/KlLdmFL9jVpq?=
 =?us-ascii?Q?W+M7VUYqFE49ZKKd+YM+MImEjmzJhgolgCHtEQ/hEC80O66AZ4a+ehcd07Bu?=
 =?us-ascii?Q?4A=3D=3D?=
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: f441b2e1-db76-4e78-54ad-08dab1aaf616
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0317.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 08:21:45.9436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LATxV6teSpwLEjJgP9MIqgvx0JnXg+MkAb8Am5f23Q8ziRKvq/foJOZHAky4zPBEkkXM4I2zyaxXpIBqwWqEV5KZS/zE/dgD8Nsykjj8g8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P190MB0879
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_012157_435775_AEB3CF2C 
X-CRM114-Status: UNSURE (   9.41  )
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

From: Aviram Dali <aviramd@marvell.com>

Add binding for AC5 SoC which have its special way of handing
NAND layout.

Signed-off-by: Aviram Dali <aviramd@marvell.com>
Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
---
 Documentation/devicetree/bindings/mtd/marvell-nand.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/marvell-nand.txt b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
index a2d9a0f2b683..293551ec7350 100644
--- a/Documentation/devicetree/bindings/mtd/marvell-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
@@ -2,6 +2,7 @@ Marvell NAND Flash Controller (NFC)
 
 Required properties:
 - compatible: can be one of the following:
+    * "marvell,ac5-nand-controller"
     * "marvell,armada-8k-nand-controller"
     * "marvell,armada370-nand-controller"
     * "marvell,pxa3xx-nand-controller"
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
