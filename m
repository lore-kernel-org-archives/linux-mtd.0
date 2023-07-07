Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E255DEB64D9
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jul 2023 04:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ojtUl8oT7MIml8zRDAH/GvBf9IfEyOW2Vpmq2K0mtU=; b=xj6m3k/u7iyCWo
	15m5r3c1F8dQWTxGXXIhEy1kdUuJbs6HGtL4lcgMsWnTl1Iwv+zg1EkwFQW2KwZTLnPpQrLZYVolo
	zm0gvGQmDA7EAlKs6+5LSDs7QEPWzFJu5enaJfFV4Gtg+TxIANu2kM2LEMgvBEsoTgn5Z7TI9H4cU
	FG7uRVQHPl1rHPN6EqvOjxiIoGrf3Dch64hAl1R/eLTeccM0JonxXx/8Vxz2WG3xiUZwshwlE/Rzj
	iB1NAbiHxhjTFBquCbM0B5e0BZ0sBsdY6MvUfisbak2sdruUjddAs6hpwBXEa0hZYtVKFiF6dm98Y
	Exz3czx4292igluo+V6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHckK-003Psz-1M;
	Fri, 07 Jul 2023 04:07:04 +0000
Received: from mail-tyzapc01on20713.outbound.protection.outlook.com ([2a01:111:f403:704b::713] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHckF-003PgP-0E
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jul 2023 04:07:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYa9FCTr/eE5QdlZXVuSMcNSg0aPnmf6Cq7esY4cewnDbRKmKT4E0IwVheK3m/V6l5Po3nhPaynBGuopvNPih8Xk9Sw6wyw1OX9Sen1j9rmNi6iCDv5gBmHK3fkXnzOwdqu6lWmaTGc4oKZT1nVbCMSGltGDTVV4NsyEZV3y1OHYDuMPeSoVfiFQxOswGxIE/hfqD7T9Hfpxc+QmhMd4+HfRbcRYMdAa0Cgs4pW1nXfPdw1SzGpP/fuMFw4USkJOQxRdUekg27bjtzEOs/BLu0DHCPXH0Hha7AtcA3hFv4Oh2GSdYRMJv4nBonmlrX5XdMVD2QFMrF+2kE7dxjkctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKvDbD2UhnuQuWo1K6WXRj7t6N4tYLBRnZSfVSh4zDE=;
 b=GA431mLMrvx7wudr+5b7evimqhDpmn2L71gSYWpoRAJoqANMwo+cgyjh6h+2Wjns+GIS19T+Ict6Ryav8pdYec2ofVo8JP4wasD0hjkYggRv2vLG79ey5EzLx9DqHzpyhuwUu5spYXAatgThZ0vNpO0saC+Fexn+NGa+4Wq6fdhLthLIvIq1lKALxApCElKneCRMLopmRvRp2knSlmvTorupbQWefxpwIVg2Zyk6NdCDXel/+GRb/1jmrlWK4CrXSgzRNwbNwMGUKKNxinRVwP/TzNW05q6jIEkda7AIfN00RpHRIfvEcibEGxMcG5yZaJ8Hz9hxYYQV3wE5Os7nSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKvDbD2UhnuQuWo1K6WXRj7t6N4tYLBRnZSfVSh4zDE=;
 b=FASkjbtnbAaC1ukWO8l4ROMARBZYR0vkie3JrYUpjks00PG5pjE1RQbK562gdzi4nvWGR3LS05wVn8IRvqgQt7YHmP4/L2uvpTsB3NyKKkz+lgIJ8eCUQkVeKTdreBL/eL7eEF1OMZWa84agtqnLjvFbJjxfAY8nRlzgmj0lZ+eof/j4zNweaHjrhaxJrLg8eqQPNY+NXQhDy3AkC4TVJk4EsF/j4Y3A0r/jvvguBougruWzQG6sX9AVDq8DHDr7n4mTvvnUaZ4WOZ2/dQ98lFaYYzaJ6nN9cUKcUKdVvOXS5YoxfP9WZCJs6dXlIaRDf+Jq+my8epXlhy73SIpR5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5470.apcprd06.prod.outlook.com (2603:1096:400:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 04:06:48 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 04:06:48 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/18] mtd: rawnand: fsl_upm: Use devm_platform_get_and_ioremap_resource()
Date: Fri,  7 Jul 2023 12:06:12 +0800
Message-Id: <20230707040622.78174-8-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707040622.78174-1-frank.li@vivo.com>
References: <20230707040622.78174-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0112.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: 3857dcd6-276b-47ef-1ca9-08db7e9f95ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFQSeAspfp2lDFKlxzMlPhTf3CbT70KjF/itr0/ihT9zHgsBBmvOvMHWUZHtpX+h8PObOqACrVj3RRSp7MuRadLHFP3Cv69TCKmYRqLbtwJ1I6n2P7qyOG9RvVmdOrgktO+rGBqRR8fJjIwIDkFx/jP5wRPsyW3BHa2jZx+BZy7slfJK7JBp/p+3IXptnW/L+xkk39CKlnyIKnf/DTG4GJPKZVyIXXceNkbCqVV96Aw3YSVa/AQYQHNj7mZaEVz/q1DedG+pqp4wBkb/vk+Tw+KL1JYM6V6xRUhTf5Om81aMP8VIvE22vnxPT2QDIYLIf2lwli1yxogo6K8qvC+V+8KUYdksL/3avfg8reqtNdo1938mGGomsuqRt0cqqfK/l6Ccvc7ymu2lx/hH/N34y6biqrzWW0eZVXHdWSZIFPCcsz3aSB1CDZH2fqOdg8ODWDSdNNFgpEDMB6Ay3KlsLzZG65KIrn7nBpIIdDDTfQKNVeyF2zhjgq5ziBnpiXJsC+l+yGSs5hMsHSTM1X64HUAwZS/wwNiE5UO3eRlR1NlJcJ3JGi0zSsxVJjSnVjcETYQ++GyQdigQOGDMxCUeZ425VJslTQgysMo3/tRNTGAVsoewUtktWdX3AJ8BvxaW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(478600001)(6486002)(52116002)(6666004)(110136005)(26005)(186003)(6506007)(1076003)(6512007)(2906002)(4744005)(316002)(4326008)(41300700001)(66946007)(66476007)(8936002)(5660300002)(8676002)(66556008)(38350700002)(38100700002)(86362001)(36756003)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2+91pixTliuzBm287BEnS41LFXujS71RJmAANe8oHAoazx6U8JMg+MZKbeCh?=
 =?us-ascii?Q?NQlyf2hWxj7qMsQGb4Ik4GsZFl1AYx3GF8pcaNhiGE7BI+DRRJpbXOPu97uX?=
 =?us-ascii?Q?uoAsUa59rbLjpj6zHIS4V4IpCkDmIk4YCOtqXVqi9xVvwD105PvJ4LPlpU2w?=
 =?us-ascii?Q?+hDm8z68zb417l3lYmq/T4Zbtg6SGXxVPRSxAlZBdekRtLCmI2Xpr7o3E70y?=
 =?us-ascii?Q?FfKmzl5WqpBmKYPc5G436CKgVGI7m732wuuUaWAlBzUWeRhlz3tk7jYglkCy?=
 =?us-ascii?Q?FXJJRMTvUYIQF36ny7HQVlZbG2Epjd1PDywcjqowjG1zefSVLBUyb+s2wA5/?=
 =?us-ascii?Q?rb5wwFt6vEzDj2crs6DD0V90eB+BE/WQWgQCAFC4GIUZ2fuyHc4AyiT2PlZN?=
 =?us-ascii?Q?v7jHorSZz77jgt23fP5OW2NgTM9DHALC3iz4x8XVsuz/y7dTYBOdD2yerIec?=
 =?us-ascii?Q?VQATunAXzxUao4ZeAljWbanWJuDxVWyM1tu6uPsb+9G9UIPWsxUPZKmx8a45?=
 =?us-ascii?Q?J2PCeXTPRJ4ocbfuqqoznel4G9MDIrEJQvRtdO4RYjq4/yoYDAy4GPK0X7jC?=
 =?us-ascii?Q?+Ns35rlI0WcELhPHwmq5H2U99sH/BaG9Z9Eo956xgjwEa3+HaCCazNO35aZl?=
 =?us-ascii?Q?aN0yz5wd8A1Gin9Mx9d0K1YjJKdGUecEa0bQoOcNNZApNvTJd2PZ+vaVNh6J?=
 =?us-ascii?Q?Xo268XQMv3r+E0WConaSN3ja+f8LFi7fgkGxZETeqlVP3fi9oI1HVRnLVPrj?=
 =?us-ascii?Q?FVBWLa6yuo72xoQ1Z8rb2GdpxRwldPly/nrMQHnKl/zoo1VMIhjoFtlm9FoL?=
 =?us-ascii?Q?Ls7cCWA6WA9pezNjs859FuMjnQMkXdBo2Cuex2HxUrk1O0cy/nUXl0MDwny6?=
 =?us-ascii?Q?me92tfd4I/008YM1RV6U7i8TZRtN7bvoxF/RC7p+emULcqgtEZm6xtg5LEBQ?=
 =?us-ascii?Q?8BngO640QCuM5tV9hu7KjUIzVwuAMr8Ez6GRZDsJjkHodF0WeAUYRkV6W4H+?=
 =?us-ascii?Q?euLN233baBNF/+AvWZGDn+FZSM5t/tBkMOYCIJ2IeyGOBKNnDZLGP87b6VlL?=
 =?us-ascii?Q?JY0ULAWO0UlGVym9I2kO9E4FidJnDjEtjgoGI8G333ft6YSrdC3DzG0Y0gcq?=
 =?us-ascii?Q?EjhNYFlEj4Qa5A+GX292uMWgP5qWDuUpY2zoZ0c1Ku23zELTp1qfCDIIOu8J?=
 =?us-ascii?Q?XWR2zo6d1YlDMArqbwM4+yjMFicnYRbKVFIOO0lztkR1wg2RX9qBQ88id8Uh?=
 =?us-ascii?Q?loWunHJt2Bt3GJQJ4QuDE61CvyY3Ur3FiWH6D1slrYv0YIZkBkOBQqMjiCpn?=
 =?us-ascii?Q?XdjkI3m8yPx1iFEkyLK5/gvxQ2vcnXjUc+iphlAyTNKAY0GY0A+PZoj6gi5Z?=
 =?us-ascii?Q?n35ugvEGP1w1dELZYtCbhb6G/RcFwbOqjtN0lLne2gGe0ERzqwHzH1cZTkNh?=
 =?us-ascii?Q?7K8MFs1q1GHvAX0YCPw5ADFDUBoK9PixLhZ/xPaW8lhikB+56INRNTYxuBb3?=
 =?us-ascii?Q?gCcUkVjyYpZmIYc1r6SM+i7Op10AG5//ePKi2E9nuh/J6FjLyOjlBGXjz0Lq?=
 =?us-ascii?Q?vHwrp7AfZq3CFV3/K5eNSihgLCF0GqiPumTmW1eq?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3857dcd6-276b-47ef-1ca9-08db7e9f95ef
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 04:06:48.5376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bmuMV//wz8Ld9Kobf/NgWmQO9I0087/ej25+LwyF7dhO18bvDomWkPWsa6LkMgYBZdyQgId6OXW34xoFWKMEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_210659_117912_AA822464 
X-CRM114-Status: UNSURE (   9.95  )
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index 086426139173..f1810e2f2c07 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -172,8 +172,7 @@ static int fun_probe(struct platform_device *ofdev)
 	if (!fun)
 		return -ENOMEM;
 
-	io_res = platform_get_resource(ofdev, IORESOURCE_MEM, 0);
-	fun->io_base = devm_ioremap_resource(&ofdev->dev, io_res);
+	fun->io_base = devm_platform_get_and_ioremap_resource(ofdev, 0, &io_res);
 	if (IS_ERR(fun->io_base))
 		return PTR_ERR(fun->io_base);
 
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
