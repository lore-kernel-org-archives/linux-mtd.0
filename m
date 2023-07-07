Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4D8C001E0
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jul 2023 04:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IHlXkdEj6xqKw9ZncJqSg3rmQOcgO5Ow7tr2+/NuHo=; b=jdCbKjW78QD0bA
	7KMoZfLsuC1eSMnpdytjdTbq+Ra6b6exHqFm5tsEGPBSVTBTBWep7hRVaiUZy1R9LC5n7kKgP5JQ1
	v9kKQJaTGOojYomG/B97NbGVwHz/cDhaAn3XAPOjXGpdsRYW74sj//LfV23l1K/gvB63xLDzGCVT7
	ky4vFIahcB8W873jM4eYt5v9UpKJe9Y29Gvi1479aJGUPb3jXgm9kbXI11HNZLmrGtNlxbLoPs3zR
	B9OyBRRT12M7lVNWM/sSGj6uNJjIJ/5wQLd4FUGPNdMY7NP8oZkW6cNerYs8EFHhKPfQYM0H4ODat
	KZCEp31rZLUBQazsdmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHckD-003Pm0-1G;
	Fri, 07 Jul 2023 04:06:57 +0000
Received: from mail-tyzapc01on20713.outbound.protection.outlook.com ([2a01:111:f403:704b::713] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHckA-003PgP-29
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jul 2023 04:06:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaIWcN2YVClXp/ssjUJ9aPnigs/9f/CgOGi1mid/iKkytQsuh4NF5XbCyRvLwKcfKZvD1CMZ93Y76ewf8e/Dk2zx9shf9nfQF8a+V2xa3dj8KT9eCL5CpI6djMQ6MfleVcUlit3auprv11zlJDZrIod22K4BkFytkatYJJ4xUdiml8tCeNfbNYbXxamDA0n4rPcrjDcg3B06yxeZ7JZt3pbT4hD0De1oSSRIHd+yQLlbbWUxQvKIpJWn+roYTb9rIUb6QSONzgPzzaSFH10buvwl/j7rOcstt5bEaLJqmATxQ25f8F2od6mOFQ8tqOii+YW83JX5qjP7abojNziCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udgfQd6/i/Jnf6563xx3A7VKmqOwhDuQSXcGbPkVVAI=;
 b=EkYw02CP5TWyE0W9jcI3Pp2xcCPoo7ifiQZnOXGPkovbJFS6f9GubYMIdEZkmcLGogXtsHNvRoLAZ87eEqnFlScnxrlK9c98+Y0n6wqcO1ZMPrbS7PjE9dDc0CdTWEzkTd6Y5o0DdmYi8Q7vD9E/jvCboLZb3dnzkwVMavscbEQOi6Ig/mhnmq4yyLAn77kyYBuXbMgG1YWBNPdv4ZweIFxKMZCgdUctgXLnvP3GJWMd3B1VVz5N13qfontkCcZ51HgRaNgGNLvpT9EN+hqxByJjVLIgs/R9Vg0y2X6ufJXmPuVo52ic0oElvBJ5L58/emrEuDczZUKpj5W13a/1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udgfQd6/i/Jnf6563xx3A7VKmqOwhDuQSXcGbPkVVAI=;
 b=nBzAi1q8C35kdC38wcxPy6LHsTiKupiNG3gPfEIz7o+aSyKuvcdYx1B/+8CM7aVol5qTtAYTbK8vKTP8gkxOGnS7i/BrZHrVoGuv3noSnyGl7/zt9AqpyGLh8simOjHsICQ3YdCkbddxSepm+K5qD8WV5JtiFLlsC4qiDrD8UUA6axj92P67BCjQ0B8JVhZjAgDasXzozz6Yk+YK/3q1/z9ZMQPKCPlOJK+n6QaxfMcTSxoZ2NFTpivpbNGYuCv+ndf/kSHTpaYbmPKpDu7xZqffu8JgBhJk1tCCETW9jVkmegVwYUmhjshWsHfnzBRPrRDyziKJ3ev3w3LyoCFx+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5470.apcprd06.prod.outlook.com (2603:1096:400:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 04:06:42 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 04:06:42 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/18] mtd: rawnand: omap2: Use devm_platform_get_and_ioremap_resource()
Date: Fri,  7 Jul 2023 12:06:09 +0800
Message-Id: <20230707040622.78174-5-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707040622.78174-1-frank.li@vivo.com>
References: <20230707040622.78174-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0112.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b3e078-afe3-4448-ac0e-08db7e9f9248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6xP5/ek3yYfYK2KUr0dFrXGWzG6biQT3X90pMISYr/jutme9fHLpPXedXmxhMjAv+f/vRcNFl29ktFyc6Mq/9ZZ+icJ3PA4sBnN5HRO6NCSqy4xp1YWiUse+J9l9kJQvTxbRhzFENvPVDe3p+eG5g21zQXJstqxQAnlC8QiFli5QjuVuEF0P6uHSbtO4Nbj0bcMwXjJpQn0ZXk/EQw/+z7uQ4FXOD7EIkXypc6zw7OQB1lh9kOl+qkL4RWAxUjB9Gk3dDtCq35C857hJHrZfy5CxqdhzD6MRE9EmHbXN8RS4U+mls2a8X/ctyZ8RzoVHVtR4b/E7s8a9YUrVYFymjItbCEWApL/E1/IFZWVIWtH7pFWZd0HBmkaCRHAo7Vkj5NgLOEvVlseVPJcl5DyhdBm9DQTK4vOKZrrpXYOLeVzXJte3QZy4lvplMGTOj8xMvo7MESnz4Ijs6Ff4nPaChx/54sk5DBF0qY61L++XChuEmHTBVjGPSaFJ1mDI6K9CrcnMhSXP/+1z7U5WwR4smW1w8mhM4kXnxPWCIn/gSM3yri2I3t4mBvOtr6hDsyK/nl/4iuiJMS0Ad0oAK1N05RTRJhjz7uZDqY7lGlGvosiGt8f995pkh9X51NZ05xK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(478600001)(6486002)(52116002)(6666004)(110136005)(26005)(186003)(6506007)(1076003)(6512007)(2906002)(4744005)(316002)(4326008)(41300700001)(66946007)(66476007)(8936002)(5660300002)(8676002)(66556008)(38350700002)(38100700002)(86362001)(36756003)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qv2EKrlOvEwW1tWIMbZ3oiqeq6+mCKv9uIENu2RlQpJvL2osa+H5U45J4nxM?=
 =?us-ascii?Q?Ao1eHuWZ08Le0cGEy2GRHCAMu0A0FRaSFwRNtg2A//gFO/jLML/RacSmf1pZ?=
 =?us-ascii?Q?0C9ZHY8G1lzrrovXNc+WgMSR2Ozjd9mxyw7mbLeTRkVKJF7cVBRkU0FlIUqS?=
 =?us-ascii?Q?62BdusYBRWRWjh+qKj3wTKHLyxEuEAdvjgmP/VnMltCG3XfB2WhjDLUjmCeR?=
 =?us-ascii?Q?jb5VFFHaAKVeiota3pGl+q5GH0IzUsLvQYutvv+cnEvNrOGASIXJoijVrbR2?=
 =?us-ascii?Q?WBdV6zeQALj88WAyoYzKJZS7u5zKC0Bu+DJD04dsjt6DRLpxnGQFmoUjfc4K?=
 =?us-ascii?Q?ATv+m+TZn/5EN8agU7/YLlyC3Xk1YD4ZTpfDwbVMGr/yOFEH8AQzXjOa8KAD?=
 =?us-ascii?Q?tC8xIQbo46050dgTy+m4Rq76nazPPB353MnWZ/IvMQREjo2zKF8Gp2XtMqxb?=
 =?us-ascii?Q?UdRDy67ecA7U8A2ixnd457jVXYhBEKZo9+rTemNZN5pLpoY0ZNTm8dxtaKAO?=
 =?us-ascii?Q?W475o6VFIjGAqkEj/tgrEbCZ2RG0gE/4788b+eu2FxHFVYIT+fJQIhKoxujw?=
 =?us-ascii?Q?B4PoPzcGMr+kG2bW+6JwM/8Eg+c66152gkDDEa12lgYVhV7WJBYdGtmYqgwO?=
 =?us-ascii?Q?OvrOCL0efaRNx84sp5ZESlqENGsY6yHMsU74WinZ2abtBxw+KeRuHZXFyfaH?=
 =?us-ascii?Q?YVutEgo5eRcqF5o4tGP40cA2dwSSS/9z2njzqaUiY9T66wzvDeiTWqJFl9/B?=
 =?us-ascii?Q?D067Llh5ND/u9x8JXFsHD5vOijMzVHnPkDtLrokeUFP/5y8OFRC46VwT+M7c?=
 =?us-ascii?Q?8OSDMeI+wtIBkYu2P1xtaO2FVycxTasjqV5lUeV/e1HEpVIOaBKcyA/tcaIw?=
 =?us-ascii?Q?KlENEteNa8antZ1+Ozvi2UebHbkUGswX4EySH+ZuSQQ3FzftZxo2rFmvaIk5?=
 =?us-ascii?Q?2b42DjcOgDvkuNQbU+wy/asHbfUK6/0+823FzBoR55mIuPLOyRbEifcMjUFK?=
 =?us-ascii?Q?djWKYFXLLXiNLGZ/G5BnoVgETV0ZdGxawg5VxltiWexzYlHEYVZ/YC1lrVSj?=
 =?us-ascii?Q?+VlsYQLtsqSqA9N9mNKOvHEMs3PIAoTUNj6YTiWPMntGFwJP5Zijt0/msPxJ?=
 =?us-ascii?Q?VgiocLLgOfRApgWUv3dazynQMQphonPu4Ukiu6DtJrvHVsF7C15tBKXuTADH?=
 =?us-ascii?Q?fA1h/kOn1t85dS6Fy4yQai7+JH0OERNc+E81C7Zhy4iCNTdp7Hg7TjEatPhE?=
 =?us-ascii?Q?5SyF00T+Nfwpw0Y0C6+s/GFNbpC+DRaOBKDFWCI2H5+VGucuyaEqPHomIav4?=
 =?us-ascii?Q?tJbaslu6C6xO600kN9Ax9ywolVwxiJwxJa3vMr0+67qTrV6GMHiWiUJOgoSE?=
 =?us-ascii?Q?60xawH8/aU1qnlHbgXcyBBWnuWfD4yDYT3JAB3hqxRWO0HMPg7Qy8vcxL7MS?=
 =?us-ascii?Q?lOSm+AcDEKkFnIl5aJbE3Htqrb6yRk3LAlfwEQs0wSI9hCd2osOCu2sfT+i2?=
 =?us-ascii?Q?EBSgiVtImM+uHjGVrHjWIvohwnLETEo7rrjZ70O9ohzHiMQKYGvSziB2Iq1c?=
 =?us-ascii?Q?mhp9j1J5tByEbGqPp8AeTw+4w41mz/MhG+itWIfa?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b3e078-afe3-4448-ac0e-08db7e9f9248
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 04:06:42.4326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fegt7WeuoRPiWkCuU/UdFsxs+sijPA/npfE6+vxIU1l+r0y84/5Kgtfvfeuw2F7AJhmmmo5DW7zSElb5zC3BKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_210654_714617_B8BDA656 
X-CRM114-Status: GOOD (  10.28  )
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
 drivers/mtd/nand/raw/omap2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index db22b3af16d8..277d16f1e0bb 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -2219,8 +2219,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 		}
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	vaddr = devm_ioremap_resource(&pdev->dev, res);
+	vaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
