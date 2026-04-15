Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B05EF43844
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2026 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0a3ZkvVu9KixR1fz5dNWZbZiiGY5AbHQ3tl8wLVVzs=; b=vUznj98z3wEF4c
	M6OEe7BYHK/FhMoIHSxoqnrJBVtQAdnE5Iqne+J5g1f5+Wg1us0jJ+jiJbszIvHM0cFmJu17YZZ05
	tGw2+NY2dhgZ9V6cHrwnlcYOePx+nckzfx6IpbdAPAEu9qsEa8NbeCfAvjeUsK8PbfUyVaCcAuFnz
	oF6KkwgUv766OBGUtF9hilKp2WnSlW9zrdHYmkOg7ZpsQPjM57bpEpSebhcSOiq71xvrunsS+nH4n
	+TTDqW4QL+o3+cWfwcDIUO3aOKvJ40fkUS2AMg4hyXiVSdl0x0Io79kDTlufcp8gS3Tos6uwaqVdv
	k0EKlRBus7kzvwPRxqPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD2E6-00000001Ki1-1bJu;
	Wed, 15 Apr 2026 15:32:26 +0000
Received: from mail-japanwestazolkn190120001.outbound.protection.outlook.com ([2a01:111:f403:d406::1] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD2E1-00000001Kgu-07E4
	for linux-mtd@lists.infradead.org;
	Wed, 15 Apr 2026 15:32:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEwRl5wTUmgb9QSoZRxSnXxphkfWyUG8/Tq25stXX4IoyMszwdXYqSaiz38lDWgJy19KJ/JVNeb5uV8pKtkvhHfFwG00Py6gn4XEcaM+kc28V3+UpRKOFcx/IOSLdNVbCMP+FgP/rUAL2YB7HKkOdcaWQXThn/mil+5PxUkZ0DaF75VOx+AR30jK5+ScSmPKZ90kovYwsg/CS0sigNqve0RQKW/Co3nZhNjFYicsTxZLEoLGABxLy+J9hU6E7GNmS8FMlsFLz3RqSvbG+dysCRxjR/d6y+8ANBUF1t/6g39qgJ/Z5kJHTH0I72q4U82HBbIguktFxid+6VSqxCUQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPMt4rRm8mDNb4GPd5qWQcEC+Ok5FlyPtMIFyYODDZw=;
 b=ZmsJJv2PUi4/lNtWEkf/zEHd0MfQPM97RH+HuM+AwwqEBcZDGhUgQ69PPpGj7eW2SNXTIO8zmicwndBVEINKzAM+qEgYGXNsCmRMttP5yOjLdfOWfbtySCtF5E4blGzSIoykNBPRps6qHXN3ggiKeOKtgmbg5T7XE/EWl2tBULgDIQSOcek/nqRaHZhZ7gguqXG9r/+GswxfCXFqYx2ITbGAZKzYAkPR2Q+/8SR42vPjCFsB0wTrswPfnwrKHt9CDt6o+fXJmElouJGquM6QepNfRTLhCC/ep97gVOSRujuPKyysosTZJti41TuZkLlb/F02WvHaXvptOf4vPSfG2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPMt4rRm8mDNb4GPd5qWQcEC+Ok5FlyPtMIFyYODDZw=;
 b=CiQumETrT2Zc+WuCoMuwuMC3+Uf8e1m4f6iAw5Pv0ZBIQxiEMEzlOGgUIrFIe1q4PMwRI3PYj9ML/+0EKWryy/hC/U4JQX/VvkGpiHcTD8ZbjKxmUst/vAbRPQzVsDaqSzDZvTulXuTrybZfpPCt6JIMjgNzAAQ29i/q3zGhASRKiLA63wHTd3o1utHeWRGDhbzXFrqYEZlYE2PmQgXkPT07aOz7IePFVzTGHs8/ap6zYVFMAZh7VsyYOs25liCdzRwy2kw88kgwKryXQugjZ8ZX0T5z12TGc30SluTmJ+2dai4yUFNJz7EpN/UMT6/crTa9l0tHhLlGwRgrEJ3Jng==
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1e1::9) by KL1PR01MB5115.apcprd01.prod.exchangelabs.com
 (2603:1096:820:dc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:32:06 +0000
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612]) by SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 15:32:05 +0000
From: Ziyang Huang <hzyitc@outlook.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	cnsztl@gmail.com,
	hzyitc@outlook.com,
	csharper2005@gmail.com,
	mikhail.kshevetskiy@iopsys.eu,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: spinand: fmsh: add support for FM25G{01,02}B
Date: Wed, 15 Apr 2026 23:31:41 +0800
Message-ID: <SEYPR01MB5882D37365BB442818AEC143C9222@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
References: <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-ClientProxiedBy: SL2P216CA0116.KORP216.PROD.OUTLOOK.COM (2603:1096:101::13)
 To SEYPR01MB5882.apcprd01.prod.exchangelabs.com (2603:1096:101:1e1::9)
X-Microsoft-Original-Message-ID: <20260415153141.1774599-1-hzyitc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB5882:EE_|KL1PR01MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f9031fa-5a0e-44f7-bfa2-08de9b0425f1
X-MS-Exchange-SLBlob-MailProps: Om8TgR6f4EAEdu9ieeuz9D5SeZesE0h2Gv2i22ubEqDCCayIeelgC24obR09D8olpcfUToyWmksgHWjEvGzNFYpKoJy/vcI9ZCecyijlXiuCzA4ypyHc8hqyBaKTiNfQBM8xSprrBTobmaHGwj5wgQkRBttrCyX3bLTfxJMh52qcUjvb0ehp8Vi5zxxBK3ObNv66X311PQjLVD6HdYWIllEF71FjD9Pc+JCpUSpXMRhmbO2wRZvtwScMfu7WFo3ViZQEj7NkAbm5NWvWLpi/OBfcwVNPyhbwUvZcTdrBlHamFikwe+qUQio5YBQdzvJFn5B+dRKlmNDxTr5gqWdZurZQKrUeqBP324HUz3ChsfAtdnZliyTMjSI6cL+yHLjnF0WsJLhg8pVs+wOCXhUOnKuDflFk8dt901EbjYzGmBg5zzpXjf3sk85Lfy3XVlKQljLJRRYy2vJGpP4wRTY0FG8ybjH97MWkW1AV2o61WyUnP0FyOUfLk+HLDRJkBR2raDCmYbDLCkdCwz0tnpPwQyhNtZBObkPm+xYAZRcsuapWhJlIWA8DgtePSOfcPGR8lZk58SW+4MjWR0E0mS6b8hftReBk3tBxUIYm+ERsyl8q0C9J1wFqBy0rMLxzQIJf6O+FjAlfckHJAlzLA97Sm/WdlUr4oiLox60ZJIkDOXU9v8XTV+Z97mmpSOcFR3q1jYVTjbG2W20PpBV5UBQVs9KKwOZaruprJJafIBURD3U9M6KbQZBTUBoqs3MJ8MPsQ0wB0oEUVclckYMx3hkyA5+92hlLrvHrK95VqLiSobTIBfsBvD33CqUYvbnNs81vJt/JYUnfv/QgszaWxzGdF6J1x9wgchNC
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|461199028|41001999006|8060799015|15080799012|51005399006|5072599009|19110799012|10035399007|3412199025|440099028|12091999003|26104999006|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I6cm48nNuGufM587dlQzAkfo3/1tG8Z7RTy96qFxDenr0jX6JxeiUHA5hGwK?=
 =?us-ascii?Q?rYKH6pY3Gu0oQNB8MI3vZUHMLckRQJsCkuj5bQjMD9pyJezyM9IdJIhZOxzh?=
 =?us-ascii?Q?MFmkzA/mmmtakzh7t1FQHyWe6D89XnCAecz+SiAs2JBnAnpsizjebe1Jqokl?=
 =?us-ascii?Q?NLNc1otDhUmlceI2O8cKCxznAvD5XTigPGMuagGMtFIqWHE5JY21bcPT4bC0?=
 =?us-ascii?Q?4Hbyq6dDgwwD5Kjua06yYxdf6b3z9Aly2Bdhx9ckr0UQ7LJknhptshkgEjn7?=
 =?us-ascii?Q?vQiQ9GS5wri1+6dciTbR+TwC6+Rj+/sTlec+bBQEX6QXilhXLkU6ADkCxAWZ?=
 =?us-ascii?Q?5yCEir1bFrATcCm+NLEicS6/Nfug3VO7ZagWF+R/tg0HvhVlc9CrQRrHl2W6?=
 =?us-ascii?Q?Y1vyonuFbUpn79PzE5bZ3YmHGJanA3Eagol/tcBPDDbk8eDQBrjIxNkJIrN/?=
 =?us-ascii?Q?Bw5NiKIQNrrg2Qm11KZf5BhiQla3wUNUgdXWSMqt7JXDZMq/qYUOGLCZrJWV?=
 =?us-ascii?Q?VAboXwojJ/KGTqJjDuR9fVqaHfPboBZTQHc2YXfRy0utvhltXrcqSLvglVyu?=
 =?us-ascii?Q?AePStfI02KBpGr/Cqi+16lZYXUYovvxHrq3sYdoO/6xWoyj+KlMkoXftZN3i?=
 =?us-ascii?Q?qW5+ccDpun01e0PyMy0GShhKpE2JT7jELwcFQg5CgqyEJoi7a/ODFKaliZXE?=
 =?us-ascii?Q?TaEX1A3QwpWiDmXWgYC0szvhj1vpfl7Ybnq9X1uqUvenH0K/y36hVuYEArxP?=
 =?us-ascii?Q?PyHc89wI1lc3UJycQSfRTg+cC0Wf45vxM71GjB/kYrxxfuPcQrgcFfvQ4/wb?=
 =?us-ascii?Q?nAuSHcZuwj1B3JwcAvhtAkvQXoh37MZvxxw84ELoEAW8k0X8PYu0WO2+yFPU?=
 =?us-ascii?Q?S2xNWuvke1YuBI06N0jmdM0pjv9KGb7FaWVLE2nyPCU73ji6nfbKtv0Sa5yf?=
 =?us-ascii?Q?drRhqWBKQcOOzbwk8jmzsF+PJlAJloA8oangiE0WLEoDL2Z3TvMYnzNdODEJ?=
 =?us-ascii?Q?QvB4kBPnK4BcEgYPR8K8CE1ZhxZ9OghQxnJAxnxCPAEZPj0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ujJsMJQ5rFfHRatXqbMGAMOvat84AIimNd9Fw6xe00iI/iGhWnqLinadtLcS?=
 =?us-ascii?Q?BFUc3Su333f2C3mr6f2ojleSI57XwAJXDVThocugn1TBAlrxJyxSqF0HdbVv?=
 =?us-ascii?Q?S5mg0up+jSMqbCD9UHhhToMmD4BGgC1+GTgeY4PKtQrK3fawSJ8Vbyz+c1Hq?=
 =?us-ascii?Q?vqJhDLLy2wNT77g+PtURCY0AS6IRcBSvK2OjJQofvrqvKsXGnKaLHM9G28cM?=
 =?us-ascii?Q?Rrtue511vcPd344JK0JcDk9HjD5LvyaUSMidLHjG2gibFLjtPvDfB46yfKHf?=
 =?us-ascii?Q?Mtv+EnX4Z2DOeql/le8CunGO/zPTCCfDn3kTJl72zXF97jTtO3Oq09kZ+qwe?=
 =?us-ascii?Q?VcCNbfbdzxdZcpBHgYGg5CWJbmUW2d9L9WDJQrhcagNxkjMzKE6aninDlqm7?=
 =?us-ascii?Q?3KTxH3XufkQ27SM8jYIfUxe56VCYf5Tp1DHXz73R5jwB0/bSGGKROW67Fp7E?=
 =?us-ascii?Q?O5j3JW6dDBCDHDnP/gpxKwnKwGhoIjMWJMQvn/qa34SrcV8g937hI3ZPadNQ?=
 =?us-ascii?Q?5DY1e+vPZxKzL5V/4bwbAGseYaaocLe5U2cezkLHFJrZUf5oAEHZhA2iOPE/?=
 =?us-ascii?Q?enzHUisbj/BtdAXETUFYu5lDL61bGT4shvEdZI93kDklWAf09shWZuBcb/3D?=
 =?us-ascii?Q?ne+iHZ5uCWf7Pf9KTm4krkd4bn9pusiTd71nnCfiF2oej2skLwDCJ2PSOEOI?=
 =?us-ascii?Q?obbq+51p1Yg/vu6qbhLgvM2WyQeo6fLDKJM+78eVoTRoWfKgcg063e3GdzHv?=
 =?us-ascii?Q?iCOLbbdWR7dlB133GdFMVuHQHFuh0efGnjLUQ5WMzTlZgSY7+fweKzi3fHgg?=
 =?us-ascii?Q?8fLVvg/E9Zv8vahJZ16Zx7lI6SilO4zCCecqCV/2dRidajO84GnpqHTMmt+k?=
 =?us-ascii?Q?QXyz+x6f1rS4kEPciwV72YDCcPGY8VOrrJR0mrm5XpK2MIvA624uNvdXZciS?=
 =?us-ascii?Q?BI0ZGF96WQgsGQ1lsbfv7gKkd/sJFAI2nLtyqJLQifo/TtfB44Q++B8XlJzs?=
 =?us-ascii?Q?5tPW1H7JD054NzrxnxphsZnqvULEQcVCQRGJTTXLv+SUFt/fL+GIlze3y0hr?=
 =?us-ascii?Q?TvYBg4kOwuHylxBlmA5rrQC0S7n82bRp7Lgp5lxvi/vxmA7SKcIpAwO+FAeu?=
 =?us-ascii?Q?G/Ju8OXE0JLo8FPgL0BR01AAL3SB5RulrPR/L/qCl3EQtqn5p77cuFbiGruz?=
 =?us-ascii?Q?OgF5eC2QOaLkev9FXt/uScVr5bzanboSS6NCoNNxq9ufrNz+WDohvP+xxnHu?=
 =?us-ascii?Q?4rPDNSAqj/ebORZl7OlEZtlXEfdOtPHlA02hPC2WZEtTqxxhc7veqYhy6LuT?=
 =?us-ascii?Q?Y7C6iuPY+1a2DF6in6dC7aKXfIgfXc+flxNsd9PKMo9goNRwImaW5XbkcbMH?=
 =?us-ascii?Q?DC1oaH+UP2eCAbzHd/KqlfswdnWZ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9031fa-5a0e-44f7-bfa2-08de9b0425f1
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB5882.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 15:32:05.4342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB5115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_083221_074283_D010FA40 
X-CRM114-Status: GOOD (  12.56  )
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

FM25G01B: https://www.fmsh.com/nvm/FM25G01B_ds_eng.pdf
FM25G02B: https://www.fmsh.com/nvm/FM25G02B_ds_eng.pdf

Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
---
Changes since v1:
  Fix copy-paste issue. (Correct FM25G01B size.)

 drivers/mtd/nand/spi/fmsh.c | 101 ++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/mtd/nand/spi/fmsh.c b/drivers/mtd/nand/spi/fmsh.c
index f417955f7d1c..a9b219ae6c29 100644
--- a/drivers/mtd/nand/spi/fmsh.c
+++ b/drivers/mtd/nand/spi/fmsh.c
@@ -9,6 +9,16 @@
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
 
+#define FM25G01B_STATUS_ECC_MASK		(7 << 4)
+	#define FM25G01B_STATUS_ECC_NO_BITFLIPS		(0 << 4)
+	#define FM25G01B_STATUS_ECC_1_3_BITFLIPS	(1 << 4)
+	#define FM25G01B_STATUS_ECC_4_BITFLIPS		(2 << 4)
+	#define FM25G01B_STATUS_ECC_5_BITFLIPS		(3 << 4)
+	#define FM25G01B_STATUS_ECC_6_BITFLIPS		(4 << 4)
+	#define FM25G01B_STATUS_ECC_7_BITFLIPS		(5 << 4)
+	#define FM25G01B_STATUS_ECC_8_BITFLIPS		(6 << 4)
+	#define FM25G01B_STATUS_ECC_UNCOR_ERROR		(7 << 4)
+
 #define FM25S01BI3_STATUS_ECC_MASK		(7 << 4)
 	#define FM25S01BI3_STATUS_ECC_NO_BITFLIPS	(0 << 4)
 	#define FM25S01BI3_STATUS_ECC_1_3_BITFLIPS	(1 << 4)
@@ -34,6 +44,72 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
+
+static int fm25g01b_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = 64;
+	region->length = 64;
+
+	return 0;
+}
+
+static int fm25g01b_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	if (section == 0) {
+		/* reserve 2 bytes for the BBM */
+		region->offset = 2;
+		region->length = 14;
+	} else {
+		region->offset = section * 16;
+		region->length = 16;
+	}
+
+	return 0;
+}
+
+static int fm25g01b_ecc_get_status(struct spinand_device *spinand,
+				   u8 status)
+{
+	switch (status & FM25S01BI3_STATUS_ECC_MASK) {
+	case FM25G01B_STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case FM25G01B_STATUS_ECC_1_3_BITFLIPS:
+		return 3;
+
+	case FM25G01B_STATUS_ECC_4_BITFLIPS:
+		return 4;
+
+	case FM25G01B_STATUS_ECC_5_BITFLIPS:
+		return 5;
+
+	case FM25G01B_STATUS_ECC_6_BITFLIPS:
+		return 6;
+
+	case FM25G01B_STATUS_ECC_7_BITFLIPS:
+		return 7;
+
+	case FM25G01B_STATUS_ECC_8_BITFLIPS:
+		return 8;
+
+	case FM25G01B_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static int fm25s01a_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -102,6 +178,11 @@ static int fm25s01bi3_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static const struct mtd_ooblayout_ops fm25g01b_ooblayout = {
+	.ecc = fm25g01b_ooblayout_ecc,
+	.free = fm25g01b_ooblayout_free,
+};
+
 static const struct mtd_ooblayout_ops fm25s01a_ooblayout = {
 	.ecc = fm25s01a_ooblayout_ecc,
 	.free = fm25s01a_ooblayout_free,
@@ -113,6 +194,26 @@ static const struct mtd_ooblayout_ops fm25s01bi3_ooblayout = {
 };
 
 static const struct spinand_info fmsh_spinand_table[] = {
+	SPINAND_INFO("FM25G01B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xd1),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 21, 1, 1, 1),
+		     NAND_ECCREQ(8, 528),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&fm25g01b_ooblayout,
+				     fm25g01b_ecc_get_status)),
+	SPINAND_INFO("FM25G02B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xd2),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 41, 1, 1, 1),
+		     NAND_ECCREQ(8, 528),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&fm25g01b_ooblayout,
+				     fm25g01b_ecc_get_status)),
 	SPINAND_INFO("FM25S01A",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE4),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
