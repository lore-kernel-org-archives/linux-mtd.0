Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F345606A31D
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ufjfeJO6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OZ6pmmJT2awp7PhKudBBRezwh++c7BvPwsQJrcAKX/c=; b=ufjfeJO6m/97+0u2gXEMD0ADJb
	n/pw4PmLJMmHmfMLMowB2dhcVZb8CF6iTeuEvGBVaLA2Mv4rmZyU6HghVwW8eN83XZxfzy7JHurTC
	EijLjno33JX3c81gmbGyP+NzthUQeyr1vhIMd2qJEBcX5USRd95ddFDLHnf5R1pgt7sOLSJqXtUu0
	t7IrBzP8fGzXfZteQfPLLhgDS+F+/af6Qq864mKV2sKutOZ4xjEKL/I3sKfxxmi4Tyh/52Cb7tY4I
	4jLFlHbLNK0nyoxQmIf3LZshp/BQBL+yf5r3qswOOt2GjCW2XAr9XIBUgbibWL+p07of2K1oQP7tM
	T7PkHlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJq0Z-0000000Dvrt-3U4f;
	Thu, 22 Oct 2026 10:26:51 +0000
Received: from mail-sh0chn02on20706.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::706] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJq0W-0000000Dvqm-0qQO
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 10:26:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rw5QpTwHiK+ykVhSheQ9wwtRQcyfUwUoTPpbtoSDSmTcnNPPqbCe+1C7WaDYkFY0y6MKycdQoQ6k9CsNOiXVkfPvtCkKcozIJUHePkdCCiawrOSsyoE6pwu+yNVu4bwliAzv/KabDbQdWTg0e+Cu7fy3L55iugolc0nbYjG1MMI/mgXuvmbwl92rOWAj6E6xX8ZUMKGM5SSYU92MN0aK3CpXQ3HiwZeZqbnFiL63vl56VjknSgRiNZXEWr0HxjEk+Lnji7NqN3Q09laML7qAyTI4BkTaEnfbXT2YHC0K6fF8B0nepZSWJrDn/o7sPOqnGiYNEwMED8FxjmLw2Ti8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yozo4Snz1uLNz/lFzUwH/Yyh6PKBl5IC/kW1VVjxUqY=;
 b=aXlbpOaYWpTL1Bn6TNcC5NpCXM5gfXKu/T8uQYH8QfFPHOz9RvDU9va+hYwWosniPoLeOkuZ3RH747NpdOh33Fn8Kv19FZG2bi5CGAiamnJmjMybyqVWm72q81QsFYGHtt5jh2J0pkmHsRrpH9RhrEugI7TlEDl5a86V0ypgaWBYO/tYZLaJNCnrwafpi557P8M9QUEzPIzG1KtQbVPka6vLjQ+yvmV4KClyMFFkOtVfGQVkiOfrx/x+J3P3ovh3ARl5gfohcVl8dbmTpuLGcV+u3LvLvEaeUr1qbDrJoQcGl0mYdkGNnDs9Za0POqQuSHnlAbco+vxB7GmSNEE1iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102) by
 ZQ4PR01MB1298.CHNPR01.prod.partner.outlook.cn (10.2.3.110) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.16; Thu, 22 Oct 2026 10:26:22 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0546.016; Thu, 22 Oct 2026 10:26:22 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 0/4] Add DDR (Dual Data-Rate) support for DW SPI controller
Date: Thu, 22 Oct 2026 03:26:10 -0700
Message-Id: <20261022102614.75696-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: ZQ0PR01CA0009.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::23) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1298:EE_
X-MS-Office365-Filtering-Correlation-Id: 38588c07-83e7-4f04-d973-08df3026eaef
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|52116014|1800799024|6133799003|18002099003|3023799007|38350700014|261009223027099003|10067099003|261021123027099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info: C25BpvllFIkPUOzvN2hu2Lps9LLHLhQa9M76dtSg0ZhYZD+JTsH8lW9ajuY2O8aK6TKJc28H/V6eCNQKBAgUG4YazFcAdwhJXlbza/ynywhNdzQWllfZGCHaUZp7a+mw7t52psGYLu/e93h7zpbMmCnsMgvDS5K9ie3QCmIps09I2nmwPiKzsxWUGMS3dW9m+XRFScTZT1YNDwAOYxABpZlf/2mtNBmXt/TFdBXeADVMlOh9xNd9rQ/t1kQvOsBcVxXaS05Osrqj8KFXkefo9VaFbWk0Q0OWRf340D4MZjhY2er2ejCAPM65lfJF2O+ArvBOd00lBnT+GvxIR7ihS6cLyZ9tloJrXW4WxHbpegzq3OPw6nMJejioZC9pfCpGCDK04uTJwvbrEPAadX/FFoo7+5z5VoY+4ehE2welWIDbJMkgSO9sm4apHykv6itsqoMgaYpIBtdbIJBG2GTb8VRASErR3xehLZ5rYLRDcWdHN2sO9nDRR3G+uSpODllpXvcNwGAU2uvyA9fMJeO6O7sIG05t0vxbd15qUc6VStFXsXdGxbx5JWyJy+vmo3yC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(52116014)(1800799024)(6133799003)(18002099003)(3023799007)(38350700014)(261009223027099003)(10067099003)(261021123027099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XI4NI7LDOuVXlPC/UAJyvWDMe+pvVOBCzBOwyVMMG2H6Q0rrGqaDpYMLkuT+?=
 =?us-ascii?Q?Q1eMi7xy41u1lz/HWX3yoU17mWgUKWVSxF7ktCTdk7AeK9Obh7J5X6Q/zWgn?=
 =?us-ascii?Q?ivywP+nFGd49EbxU6mYgryBQkWB2H3Xn6tt/R1woGzBtIMw+ulrROrINi3BV?=
 =?us-ascii?Q?uap8mBzRCJytig07xea43pK1RtWxgwQhfdqaiRyEDDm1ZeYy4Nqbc/CGs20Q?=
 =?us-ascii?Q?W3oRs6N9wWOLgD0QFb9UuyMAkfTs8ARsHZtGlrXOku055WbegukgW11J0oce?=
 =?us-ascii?Q?x01oemModICIZaFYca0vOLjPJs6bB5RY986+yQhsdxHRXraogcGgt7CpQjrL?=
 =?us-ascii?Q?KIgpJIu7k6NpIdF68Y39PEj02c51HQGRXzV41o7PSCU6Ff13l7d4lVkv6KXu?=
 =?us-ascii?Q?/Nh+OB9jpgi5nCkwt2gWtJJbfCcwhwUySoNl82yf5jW7SHDe5Uv5xSWu8MBU?=
 =?us-ascii?Q?O/Zv/cC7yl/Rc0ggSoVJKxuz2WYBlaz2iU3xwcbjSuBps2C0Wg2BCiwMUdKQ?=
 =?us-ascii?Q?p6fBOMM7IGzOqUenM0xk5jnBg+JakjhtTfbCYfUE/xFwRGlV6uZOy7habTsY?=
 =?us-ascii?Q?jCQkR4uXAFzBzqIckW41Ob1mRH7a5Sxh3jbhVfH51qvZ62gBCMBqpoiBhmL6?=
 =?us-ascii?Q?gZXbaIWB/0kuRKfXAY5BBYJEqb9IILSRbLgTdYt5JM49QSNm7hMOxfuIQVfG?=
 =?us-ascii?Q?KuYNeqjSRJTomgD5n69npi4ThbvsNGStlT0Cw96N5UziIGKuCBc5gSSMXrX5?=
 =?us-ascii?Q?dDQSnSBM04Is7c23mCeELmGwi0xpy3kZkpx8xarhZEq8BWxaJVv5V/6u42So?=
 =?us-ascii?Q?isnh71llxqy79bB0J+CA38XHFPhJ6Vf27rMHnFW7gpDUmCYl8m5beIAzu0LN?=
 =?us-ascii?Q?Pr/x5f7kefk3xBU1WoDIsrk7rwGPxMxcf3atVd8KGBlwVBXOcihZyiJixxT6?=
 =?us-ascii?Q?ib3cHDRyWbHnUXALiizYUlohHZaB8GdadjV2VilGNeUus2oYLrvlilTkVPNg?=
 =?us-ascii?Q?6imx93NH9u/mbEEoN8Xgzu+7cNTNpl90eYXzEW7g5GD5qTR1LMBiYnfM8ng6?=
 =?us-ascii?Q?gCbbdyONS7/RJ7WxXnKd2ACtsqlkzIk7WZoPVp/8YxDX4Z7ujiczz/2BHDyu?=
 =?us-ascii?Q?vqR2Rfm9IRv8KBEvzrAavPiUdvO8gMUnq9sCFptuG099W/qGkiHfwhk9ihoc?=
 =?us-ascii?Q?Wge0rZlZ95L3wB1ZolSEuN2gZDK/DXC8v97MZTEKvlrJm/SfaRCU+jXlBfQh?=
 =?us-ascii?Q?xp9W4OTtjGiYUSHK1HqcYaimviWCD4oLzHAaAZHfYWPD28WfsNupw4/EuDz8?=
 =?us-ascii?Q?KScuqCxhZWpjwpnWi1vYjClWaC7TyeRUph9vO7Es1HrPQBHok7yB0k5+PY0t?=
 =?us-ascii?Q?m8+uwwwAKPLtjyZ+MH19Oq0hnL5NsBsrfDms/nCVfVp7jfi/C7wLr0EXkz8e?=
 =?us-ascii?Q?741v/9Gt5X753xeTWR0Bmyk2zczsUI610GeJejMuSiml5m3+kDM6bIL7e7Jj?=
 =?us-ascii?Q?EGIN8I6s82EK3d3ffwgjiwQ+5YY3wtyJGgzNYna4WUxLPXR1b7ffDIMoeFAQ?=
 =?us-ascii?Q?Hr3bAZNzft3Mm7GYsYiIBmZz4doJftEiIPxq+nt1pHZg8RR1kAV9G3koQI7S?=
 =?us-ascii?Q?e6HeHdYtAoiruJ+i4+1h4wiRStt1rQ3PfO5buMWCOQI0fobEtBPnMcTncdy2?=
 =?us-ascii?Q?NF4EqGni/yMfkGd8iw7cWDC7COha+rFZcOjPoGBUEGrAYiIk7Sb21WaNPv3H?=
 =?us-ascii?Q?TirNQXb57i+5sXj3joGG3Gy8D5nS7erK3gm8ZLUTozDuCrEkcYtD?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38588c07-83e7-4f04-d973-08df3026eaef
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 10:26:21.9922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: graKJoC1f7WA9V7Wt8b9fueywGAnZDD0rjSP/Pc5/Trs8h3OqY/RrA5Bpcn5yshChUm7IaiQlt21ij+moC8O1olr4pDDqUJZqe2mcduKIF/mEnvgJrwoOElg4JgawlA4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_032648_241281_3C4B3ABA 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series implements DDR support for the DW SPI controller and also
implements 1-4-4-DTR read support for the MX66L1G45G.
This series has been tested on the JHB100 SoC.

# cat /sys/kernel/debug/spi-nor/spi0.1/capabilities
Supported read modes by the flash
[...]
 1S-4D-4D
  opcode        0xee
  mode cycles   0
  dummy cycles  6

Changhuang Liang (4):
  spi: dw: Add DDR (Dual Data-Rate) support for enhanced SPI mode
  mtd: spi-nor: Support mixed 1S-xD-xD DTR protocols in
    spi_nor_spimem_setup_op()
  mtd: spi-nor: debugfs: Correct DTR protocol names for 1S-xD-xD modes
  mtd: spi-nor: macronix: Add 1-4-4 DTR read support for MX66L1G45G

 drivers/mtd/spi-nor/core.c     | 21 +++++++++-----
 drivers/mtd/spi-nor/debugfs.c  |  8 +++---
 drivers/mtd/spi-nor/macronix.c | 28 +++++++++++++++++-
 drivers/spi/spi-dw-core.c      | 52 +++++++++++++++++++++++++++++-----
 drivers/spi/spi-dw.h           |  6 ++++
 5 files changed, 96 insertions(+), 19 deletions(-)

--
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
