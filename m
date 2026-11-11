Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805CC606A330
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j8/WVAOq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E0ltjMdMMGvgY2E0e6pOsdxJX5sYOgUVLBK8w7jnQvw=; b=j8/WVAOq+pX+xJ0iNHrBuH9ItW
	7yCUDj29lABx27e6PpxsWlXx/fU4agwpCyu/KSINr4KUxLjY70BRNj9TXwUW6FvrYLnoVx0J3z4wb
	8DrGSyFAsLhYZ/DUYv7ucNu6K0jB0mFmdHASDxgh2Cn7Tut2XFQlG8k57fumZCKW4jf+JAokC4Yt5
	ZYQegzp5KSiT/Oqs3BdZFbwAlxfNLHsxqN7SJq3ofbzFHL/VK4oGcJXfE0z2PavQGvfWJIR0bewf7
	xgI7YROjb/OeJG2BuMkObzJyViyp1NSsaMZwVSZiGWBWDZkE6MO4A8rwxIbmFoDfFGZmJRWxiscg+
	eEFXOjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5KP-00000006JYo-3CNO;
	Wed, 11 Nov 2026 10:13:17 +0000
Received: from [2406:e500:4420:2::72a] (helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5KN-00000006JPo-1LOb
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 10:13:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5n06sdI9mluVT5rDllW9l75eX/j0gNzXa6zu6rEjjIx8Ahlz0seCehGYcNKBaNI/DIQ9XUiO4S8qFO50KJaDZdPdOSlzardrZmjbmructtT8iygcGleUxuaD2U+gvbOeMIfs9aZ1s5mLcf8WnHNXiiADk/9dCOGAr2VISDK/BZWpCedGG/7MfkI7rYdjsuJJsNqYTunUIJ6xNruhACDxCfTiNsYUS/tF+9CSHVv/q50Ze3rDds93Gkfu8P6DT5yf/I6shWUuSr0YqFiU5/SkmZ6r0cjrrHINLTKW18uNu72WItGoKJ15mDRlqHxlVx2/1vO/fZNMye38T5iwa99Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnjUPM2GuS95A+lP0lgI41j+KRXHz8rqkEMXUcDlNZA=;
 b=NGGA8xdOLRZkxqSm9Dj2NqLbVUlOZXJk592oxzhewBZpjM/xaho/IqwO212pex4uJKYvgx+Nvttmx8TjYqCuDla7j4Uf4PmcvQbslagtcvE9wxuDpsSbtxaOgswKr2HNeKMXVXYhkt+HLv5G7ozcgZsz2mWSi6dalJMUT8gs5kupVrfeYGGBjHZ1YaN5mWO4T2kpr3gAVaHtUsl3uh7w5PqUfvhh8ZaG3WhCvgsjJX+RCcWex3pxY2jWaF0Xy0c6TKU7n9+5D0LyQWDjaGmvr50XX0VjyFANmwZAEwI94nIwhNZbRoJ8CbaD5UlR1WqLdu65YlMCe7eVpiGygYWobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 10:12:54 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.008; Wed, 11 Nov 2026 10:12:54 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 2/3] mtd: spi-nor: debugfs: Correct DTR protocol names for 1S-xD-xD modes
Date: Wed, 11 Nov 2026 02:12:39 -0800
Message-Id: <20261111101240.7378-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
References: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::6) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: a7369266-dbb7-47e1-fcfa-08df3fdc59dd
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|261026121527099003|261102123227099003|261021123027099003|261021121427099003|261022075727099003|38350700014|56012099006|10067099003|22082099003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info: Ut2LpUJNpl1T+FEM4ehIvtkjKdaHRr3EVa6tAjQpgKq6k+rsChOltU0lJ+2OpIIyWcqiWGmpH/X3O67TsbrcXybFWx5N1lTrsZR8Kjs2iRi7QGw/JEEBtH7YJ1IbH0EMoHe7h0J5WKFoIA8UPd1eA11DcZZrRP3aIdztFpILpUXefYmUwddz5/hg40b8AUBFmjOFDZTQ2Ze/+jCbWDUL/NRmx0ujY+9vdiZRFfMMOqfBvYk5qO4q0VVtm63FgK4PhSCRU/Ilx/Q1dQi4AxxLFWy/gv+35uCF3Dh2HmmJJbRMrIizgTifaiJ6IqkeL3VmJxCrM1HfNVnCT9yydDdGMHtpeeLBerlEIIerCrUvtg0nHKmGExtrrYKd4iGOE7nHvoxrHUYRt+wHS+G2QlzRX7ZQfcCTwRe2Y7DJwNWM6YOuV97pEVFWmJ+o7oKM+sK07kz+dmZaIt+yn73Hx+GJrt+KIF1w7P9fQCiRUhClxFGK+WRDh3Aqkwgrr3nLIc0F63u4aDavQyahMNcaTXv5HqKWbUgIAtO4C2V/ysvaZnr3hzcttCJLaWHuP0fUp7Gr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(261026121527099003)(261102123227099003)(261021123027099003)(261021121427099003)(261022075727099003)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3mqfvFVFSlumdLTqWf7rcJsHeJGIek60UJOsltudkvAf4LLMcXf3Gx6NW/mV?=
 =?us-ascii?Q?4SjZqmjFsqlWlvEhiidSAaCGBGnDQA23urKQAmwvoczqfjCMVDYfJpfD5ep4?=
 =?us-ascii?Q?91hWqRquRmECKciHDRaUgmJTpI7P94ErM7hIZ7ntAFNKTGfo3zoTiJKXDx8U?=
 =?us-ascii?Q?r4BE/z+Gd9F5QGwZNAzyckE+XzBW0tUhmveAXtGqRn0mtUyrB3eQqOhzLySn?=
 =?us-ascii?Q?QDvXis2hEPaGdquBEB18zam+8YDnDBUqMPTTynp5gyZ8jBxvYPoy5MI2J7Nn?=
 =?us-ascii?Q?3FaC7SjUqEAyf7qggHomyT6q5Zc7CoXN6z2WI1GcRXbRVkE7tw+7jla96sD/?=
 =?us-ascii?Q?1fmMADWocidf+/rekGeudzi7XG5q+Z26FFvCsqCH5iCPkAVV7txnjKmrjW7N?=
 =?us-ascii?Q?6CpmAZBprLsnuR8ndHLX9pblG3uYJCg+D69gfny7kztJ+sD3961RcirXQNBC?=
 =?us-ascii?Q?TYAYdBwTSmBpNf8UQBsVBli03SIdp3jSF69vEzKtK0/vC0UO/0ZrSnpmN9bE?=
 =?us-ascii?Q?SEMil/UBHdueioDucKaR00f4jyEKQ44RBv1x5vS4Dcvr29B4+cLZazE6xEzk?=
 =?us-ascii?Q?TVf11LOHSPNaUM0hX1R285tXjrEUl82VsY4FUuEatH+ynXDsC5K0J+oUs/Gb?=
 =?us-ascii?Q?eiIk/1ujVcD6as0xQYAEpPT6ZtrPT9b6zjzN3/PgyiveB875EWLbTgFGvGUg?=
 =?us-ascii?Q?C/9x5HE25HpVu34ur8Ugz2yuKSKC8oTXs3zCkg1CJ0SjuIO1SZ8ynfSOARn9?=
 =?us-ascii?Q?CCjuDewXx+rKoXw5ylltwJzB6HKwjnFm8ckv2kJ7mWP9ST7KeahX51Z2Dga0?=
 =?us-ascii?Q?Iuzp422IF3ZyWE/Ww7RVTwJUIEcukRC0SwFUXP+yk/1SUgq2sPfRD67+SZPD?=
 =?us-ascii?Q?JHD+r3RnWG61wokwDIEfIXCy4A6kufQFN9CMDL1MokMut7IjGsRttviGL5PW?=
 =?us-ascii?Q?+bG9FcKnvDC/8tV8AoPNpLaNlR35jirdmKOGfBfrWE/jOYmA+tlt60sVyRly?=
 =?us-ascii?Q?/q2pAGQgryzlzHw1AZ7ea2RaFy/RlsR0DXR6c4bY64lTIZeigxMjICaopLwY?=
 =?us-ascii?Q?w4htbClzx6UgHXrY6XCLzBKwYdFugWbErJTLT72Cj5VRPwYUJW6VftN5/mRH?=
 =?us-ascii?Q?K2qJfZ5D/LRIr/wNH3Usmi0+hQq8atrUvBAvJxlz7B+GsYU52Lxw3lB6uHuu?=
 =?us-ascii?Q?piZuSNYlEWS9R3m4UMeo8V3gRtqlalWWYUZuwv/VXY2vAjYCtZ6SN1yUToM/?=
 =?us-ascii?Q?BWKm9mz0eefNrYIT0qWFYfPB0Hp8nB9elEx6DsFQo1jyYF1z+DMnsFDKZb/X?=
 =?us-ascii?Q?t4uXx0Fyzo+oOoG7VtUKjdetYyM8eI4rdoK8JcKGQXZB89aYwefRR4snsJSA?=
 =?us-ascii?Q?Mi7im+lHx+z0M27LeaaYPgSf5ajGwhnEuj2ULQnkzgBgjvNdYhM10ZD7vWtK?=
 =?us-ascii?Q?AhtqDJoNefZdwXbnWZgTdFEfXT2GQdg1pV6SfHRJ/CmIe5ej0ndUl8wv8YTQ?=
 =?us-ascii?Q?H75RIy6Rq85wHEtjkecEoP5DSbHirr4fHn4QKgw+h1Qvz9RU0fnIYOWtafVn?=
 =?us-ascii?Q?H6RIgHTzRL9cr0608KBNWwwWeXTagbKGpDEOBJ9U1DUN27Az0LU5DAI9H7VB?=
 =?us-ascii?Q?u1W+NCwQNphhWQ9qDba2I40ASe6yunA8+NvJCOXHyMTWQximXTSgLjLynYcb?=
 =?us-ascii?Q?Wj5zFSybfEYLsTY76dDKGjQCWEQiQWN4XTSwWNWKm3PWsSb1zn2YsYkzjsoG?=
 =?us-ascii?Q?VmPZGkvxQG+DPq1UK5H+NnNML2JB3FFGSqzl5e/nQiZOiM0lKWMk?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7369266-dbb7-47e1-fcfa-08df3fdc59dd
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:12:54.4336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifih683XpmGmCvq4BAapNj/GNnOmJi3AdwAJHVPRuWx6/1eD34CUmbOmG49oqDIQ3PZLiRg4nKi3LjGz/ol6GhJSMnESqX77c0Xfxg0GcXHyYkoEs9dnF+E2w4PUhUll
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_021315_372266_7426879A 
X-CRM114-Status: GOOD (  10.23  )
X-Spam-Score: -1.1 (-)
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

The debugfs protocol names for the mixed DTR modes (1-1-1, 1-2-2,
1-4-4, 1-8-8) currently print the command phase as "1D", i.e. dual
transfer on a single line.  That does not match the protocol
definition: these modes issue the opcode on a single line in single
data rate (S), and only the address, dummy and data phases use DTR
(D).  The "1D" prefix is therefore wrong.

Rename them to "1S-xD-xD" so the names reflect that the first phase
is single-data-rate on one line, consistent with the "8D-8D-8D"
naming for SNOR_PROTO_8_8_8_DTR.

This only changes the strings printed by debugfs; no functional
behavior is affected.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 3f8d586a7622..f9ec5697aab0 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -45,10 +45,10 @@ static const char *spi_nor_protocol_name(enum spi_nor_protocol proto)
 	case SNOR_PROTO_2_2_2:     return "2S-2S-2S";
 	case SNOR_PROTO_4_4_4:     return "4S-4S-4S";
 	case SNOR_PROTO_8_8_8:     return "8S-8S-8S";
-	case SNOR_PROTO_1_1_1_DTR: return "1D-1D-1D";
-	case SNOR_PROTO_1_2_2_DTR: return "1D-2D-2D";
-	case SNOR_PROTO_1_4_4_DTR: return "1D-4D-4D";
-	case SNOR_PROTO_1_8_8_DTR: return "1D-8D-8D";
+	case SNOR_PROTO_1_1_1_DTR: return "1S-1D-1D";
+	case SNOR_PROTO_1_2_2_DTR: return "1S-2D-2D";
+	case SNOR_PROTO_1_4_4_DTR: return "1S-4D-4D";
+	case SNOR_PROTO_1_8_8_DTR: return "1S-8D-8D";
 	case SNOR_PROTO_8_8_8_DTR: return "8D-8D-8D";
 	}
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
