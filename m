Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8428D1267F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Dec 2025 23:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCR+M97qixKJMXWshFi+cdpZLkihhj3pOz6wjDvbE/w=; b=NJTEhNr9SOO41l
	9HCaGvWSTRCDjT+cnOG33MI9FXvdSKr09xntw6AAwZtdLwitZOaj/TyP5/Vucd7CtzQNQdn0E31BQ
	DTuQa6N6JO11sLFbGOqc6w+BQvV866FMwyq7MSJlS6foi4r1kBGsgRURB6bylei8Wy6el6GNLqZHM
	TCv6VgzcXV7VuFifHMiO1Zvz7V3p4/FWhOKLnuaf93cVo8Nt23rkgNWohb1MvcAurVLt9PFD2lo22
	hsIvjcBIZE3OH+5mzwa6rHMsk+9nAktYcP4Na8/Xv3ZPGu/J7isfiv82uO8enGJynwqxE9U1PkhNJ
	4I7tOoA86TvbjBGOdbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQa6F-00000005wiV-2KEb;
	Tue, 02 Dec 2025 23:48:03 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQa6D-00000005wfv-0m0r
	for linux-mtd@lists.infradead.org;
	Tue, 02 Dec 2025 23:48:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGShVRE7INErIBTZLHMr3hTeD8Dm9nolOVksvIHx3qPDBa+T07J8aQNct1wx8xHwaka0d3A5ynXmxBrtZ3xtO31q+xewBaXAJGaPGzstX1fZoXXm/XPLOWNohAlxsdfiQBe2rrb1j+63nKaK6Z5vBkWHqnkaaBt3+nmuaquJ91I3LE73XUBk/sQ+jGV2E3fJNQ5n6XBKlDGUgle9qe0YAi7fhWc9fh32f+10YV6jIDjJ9rZJshGGO6nJiobSIv3M+eI1clXz48QtcIuGoMxpdKzMNiIb+A3yLY/6ErNUXoD5OmE0rvUWZjAJ8KtPtVroo9vpyHjrsu7LeqojbeB6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKQOJs3GEz9UMdwN4SnVTE+ioYnXKLdjQnSH0CIcp6k=;
 b=JCV+UaZQ0GnOh9i85UOYz9V1RLVA4a0HTDXzHgTwVZgutmUlDVFUeLBMSJCtc85nmKnzRfm/tkT+uQGBZbSheA0mred5AAIiYMlfHrssB6H9x/mdQiCg5bGVNTjJdwLmW1T29Q6u22fFOv5ovphQ6kn8NxEyqzfy3h+ghL4gU+1Fyl6e8EjnxxJQyEdOiw0qswIH7mcq1k62Csi3IcQtgRSexduCoDOJ6RR8xSqcIb9k720D2VZVMWMvrgnaDYg+RK/jg1Qi19NtzCX7Nngdwe63KNdaABXgh7NsyVmK7p5bJj6h5CaNdjhl5kq4Wtv06mclcIYj2TqiP7Il95pfrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKQOJs3GEz9UMdwN4SnVTE+ioYnXKLdjQnSH0CIcp6k=;
 b=RTjJQEjzmdgH0K0hPC16ytyLZ1t4bkhRr6h1Ll3wbZwzQ93QpC7rS1YEmtjhaH1P/br6hr411VC1sIy/iVwwT6kxU0yWkISVAtEHZce/ypbzKWCUZl+vD71wMumdPHVQ3o1OjVn+YPZn1qxXUlxy6wEPBP4dC6YMXsLhmFDgsGBxBpKJpOErCCxYo479DC9VpbMeZeB2VEUnf5kvcQpncmNgrBoLfe/EftrpWxVcd118cJWIZYhb928o4Qo+kZR4DWJl/INO6guOynTWtV8LOKIM5HvQuovUWJbLuIe4Xx5RV2HzCjC8sY/6gLeYzi7ztMWsgFLdY0oC0hC4s4kLvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DS4PR03MB8447.namprd03.prod.outlook.com (2603:10b6:8:322::12)
 by SA2PR03MB5689.namprd03.prod.outlook.com (2603:10b6:806:119::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 23:47:56 +0000
Received: from DS4PR03MB8447.namprd03.prod.outlook.com
 ([fe80::4682:710e:536c:360a]) by DS4PR03MB8447.namprd03.prod.outlook.com
 ([fe80::4682:710e:536c:360a%2]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 23:47:56 +0000
From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Subject: [PATCH v2 3/3] arm64: dts: socfpga: agilex5: Add dma-coherent property
Date: Wed,  3 Dec 2025 07:47:35 +0800
Message-ID: <1272181d9befff75281363c753e9ffd6d796aafb.1764717960.git.khairul.anuar.romli@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1764717960.git.khairul.anuar.romli@altera.com>
References: <cover.1764717960.git.khairul.anuar.romli@altera.com>
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To DS4PR03MB8447.namprd03.prod.outlook.com
 (2603:10b6:8:322::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR03MB8447:EE_|SA2PR03MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf39412-dcba-4043-2ad2-08de31fd37d3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fkL6tUpltXa8QZdqqiPRuu/YzlP9w5RafHIOXT73j43wb2OB3186zH0DCD8s?=
 =?us-ascii?Q?jgJxmzaeZUU2gZRfyngxWZHL80eW4uVSVvf79tXEqKlbfULNM5ZylXIZFAJr?=
 =?us-ascii?Q?GjS0tL1DcNk1fhV70AaR3UO2PBpAsQ8dFPH4x9LpsxK5r0icX7L9WANG/yEw?=
 =?us-ascii?Q?jqqFSDQIM4D+YD5AXYce6uFB7P0PtJcfZjk4dNC2DMfjP8SQeZ7a1NimDy1n?=
 =?us-ascii?Q?Fxq4xaoyMaNOq1NS0GGGjIfx1QQ3bAxNrxTf3NfvbVRsvbL3Mx6qLM06P7rH?=
 =?us-ascii?Q?W0kVwSPwTB4eqd00H+qXQvEdd7VFSZiXTnD+Xznkv8uqsAxMm/DGZH7EazEg?=
 =?us-ascii?Q?cHZH33mxwHzAe+Mx5pieVZSaj03aIE1JyCanIJgdmToyi5m1edPtmXLEztBY?=
 =?us-ascii?Q?OQ9DZOKuzcPoCRGyFw/v02bKrU0SUBU6KfFGAmiKcZhnYrWJXE4gh0cxLPk0?=
 =?us-ascii?Q?iBpm1weCNyEped18SlrLnGbmMUDSlfNLDm9XNuY57jtbRDEL3PePjvsOgyVk?=
 =?us-ascii?Q?iGJzg+O/oLhSbrR+RBvHf6EYTtojqhXCWGt7jwk6qXTy/dNmVVwEZXLbHJL3?=
 =?us-ascii?Q?R8pcUMYInNmMecyUdNHubFBiFyvNqgdLAJ5Hv8p/K3j1fzd3ajogxBfJ3JOM?=
 =?us-ascii?Q?E2JMNZ2rpQ5VeNn51CGDmSTmhGMX0Lijlkr3CC8ly9mmYj3s5G1UNihgbcTq?=
 =?us-ascii?Q?zC29aGcuj5l1FFWB1VgLuil5AgsBO1JiI/Al6QS9z5oBADOqEO3As63EF6gk?=
 =?us-ascii?Q?zq4rqVdtcTGpiijy1slWcwEnooAWhIOPN1CCLYmXWwt1thldJPnWa6VibZ/h?=
 =?us-ascii?Q?fT+csIIfhuroGgyr0rOUXY8iWKTpHcrySufUrgd4Oq634jEXxIZ5u9eWczXQ?=
 =?us-ascii?Q?UrHNKY9JZU9czZ78kJo7LU3Zw2rHtsbPQ3atniV/beDlBuCa1LRLxsod1ONl?=
 =?us-ascii?Q?n5jeiN48rnKoAYAwa+xbx0BkX8smfOoTVOxhRngk9xyQj5srtnP+aiYBIP3V?=
 =?us-ascii?Q?FyyViX3ef8rOThSh6OmzAQHtE03vHG4nkrIccGoOwVpdwOVvbc0Fx79QZi3F?=
 =?us-ascii?Q?Zhaq5Du2TU/ZLmFtBBCSYHoU5h4NiPv8Z3SguE6aQEMmSlStg77FWDU3iwrS?=
 =?us-ascii?Q?yiFkUSjReCaHkWRvit7/9fbEk0EqN34Ql/f4H1kluE4m1E+RvmBTphNL2FdK?=
 =?us-ascii?Q?+KnFxjba/tqE1bYIKgUXVAPSF4FnOMyFaAilOoUGBUNAB45VXO/gLY3B3Ttx?=
 =?us-ascii?Q?KoEM0Vy1oeRMxFoH1L5sEE563a8IWVOU0G1JDOpnNJGCXfEQb+T0Ys1a5apC?=
 =?us-ascii?Q?q8bAiOmi7AzY5tEl3DOuC0aHFUpRYRdU5WRoy5SbvJ5YId/QlLp6vPxAsmk4?=
 =?us-ascii?Q?ZlBxIhqvMKMN7NRxfHdC/ATKzRV2OjmUXtQyaT/8cfzyE7u8pU+v0obBWaMq?=
 =?us-ascii?Q?rf+bXht5H35Gr1Tonkv+sccJ///OMS2dWmsx/N+5ajAlCIgv8XzAqztGZ9G/?=
 =?us-ascii?Q?BZnuWyueJ4Xz0M8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR03MB8447.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4wU1gzIxzatrmKfHKioXi+oTyioRg1Psdkq0Bs7DLS40q4N4SES6YKaKgrpr?=
 =?us-ascii?Q?CRBegm1D+XhfJpl2sXfjchS6ot7GAWhcAgOtJzF8DkmV2UeNYCEkiJMz5+Dn?=
 =?us-ascii?Q?h4Mbqrg024m1fsKiSUoS1vx81kAC1Ok08R42BE4M3R+v1xEIh7LwIgYFV6m+?=
 =?us-ascii?Q?/AmX3HxTx+HDSX6PqQbr8ZWGbBqDS1iHsj4rFdBZ+S6DhpV+c8xvq9m/0QCU?=
 =?us-ascii?Q?9dYqvdfPg2MdNeW1+C+j3btRD1n0SfpNwofon/cKy7bsucMvsBssmNT9xLAe?=
 =?us-ascii?Q?3dZ6LCzHLyvwtXqYh6HVWTKQ8BT3TmQm9J8LGrpD1xCkpS/9B14ATwFJG5x2?=
 =?us-ascii?Q?ecFTjo/O/NGi7oUuG8tPmkQABJZK9eE2ad9Ge+MGFWFaKLF8dWf6fmefm9x7?=
 =?us-ascii?Q?VjpKjZrtX7WRMGXUdIC37EzmA8ppzZ1nfJuJjOaDKcgGloXvHYavVV60Ig3k?=
 =?us-ascii?Q?BuRD1HMeciUkF/0liQ+D7QqgvRLm5H4P9BEbrpafAmjemF3ZIuEUMk5xy8sX?=
 =?us-ascii?Q?za4/A3YHvI3KlUjvjDzg2BrwN84/+nZ0jbZocOqEgi6fv0o9opNllmKGw7mn?=
 =?us-ascii?Q?IWX9ia7K4bHR888aJarjAnsFCskS53f7HjnKVFaxjpSQ0/CPrJ4OQVXV9vVA?=
 =?us-ascii?Q?D173uzTe+Ocrfr/sEN4wVx2rT+6jk+1ZexpTLRElNAGMZ9omQpmbK0DPclwr?=
 =?us-ascii?Q?5NijCy7ek5/zc6VEWMcxtZ0m9vjOCF00pd0OVRk4oJyb2WBmWzUUVh/0pYqW?=
 =?us-ascii?Q?ZlVxzCx3Z82eE831Upqa4hAcQdhL9UC2T4AF49xdqVtCnwa6z5c0CnOeUm5B?=
 =?us-ascii?Q?/KzzN5J4sEpsGZ7WonLGS1Ih3yVIfmJPH/Htd+ENTCA1y0AeH3VgK+EibIK8?=
 =?us-ascii?Q?X3gcVvC/lqf5LNBFY4TvV/qllRz7wsxRwzPIsB0JoxarSA3DOoYsU0Z/0uq1?=
 =?us-ascii?Q?6I2sxqPyOSQd78CkAJDa0275+NwQNzBgMOjomEQctSvA+8a0u6IWdaL9aJ/J?=
 =?us-ascii?Q?2E+GcV8zgbSnNsiOOZtIHtgVFucSuE9lmYVB18HV23+jM4lEOMxmKQLWZLzu?=
 =?us-ascii?Q?9SiP/gUsFvwc9+Yp/pk+cCgl/jjHGx/2l7dDIapTjJAfyPeAn71by+O5Mk4w?=
 =?us-ascii?Q?Xwv7tx9EHoXL+WwUGy45YBigaEGgiGhVY3R/M1RfHVpjYyWgvxUmNFWsZHz4?=
 =?us-ascii?Q?hAU6EYm8ZGog5NDHrxIOIkVOcNoR6YOVXDp6JiyCIzJ7RBVdbVWChMU6cDXF?=
 =?us-ascii?Q?2LTZyWszAgf5PdotJPyMk7TJkVXot5ig5FQhLBcJNrH7zEbOW0pGG6/S+T38?=
 =?us-ascii?Q?Lbj985W4GJUtXoNZ38PC0PDc7AUoitzSAgpsuUX79zqBTVWC6miff7ZvpKRp?=
 =?us-ascii?Q?vvxy8ejj1I0MuSwno1Hg77vTS7PKC38409CSp+PXurhYcddT9pXf5up0dDDq?=
 =?us-ascii?Q?XwJTn6erfAE1C01C1X1yIT0LUpiJG8OUkw1jisKtfNGU+RVo318J0vNPECDV?=
 =?us-ascii?Q?KRtVGhsTWqu5shPNHDxWyw33UP7QrlS60E2Ow6ycmqo+6zJGTgvDedErSEi+?=
 =?us-ascii?Q?Cs4FtE9qYVp1Lo9icc0E5YcU7cTKeDb5wC8K0tMThuwUEi74hmLUfM8urYbV?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf39412-dcba-4043-2ad2-08de31fd37d3
X-MS-Exchange-CrossTenant-AuthSource: DS4PR03MB8447.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 23:47:56.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkcs7El790aS1waBC3fv6Jeq/9dlDXrf8sUPmb7EhmFz9lCKJSMff3Ih/2nGycIjo/pY/ZEUJICAaa7PiunLoyp7tarc/pyVeR7gqNWWefE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5689
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_154801_239885_AB03715F 
X-CRM114-Status: UNSURE (   9.59  )
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

Add the `dma-coherent` property to these device nodes to inform the
kernel and DMA subsystem that the devices support hardware-managed
cache coherence.

Changes:
 - Add `dma-coherent` to `cdns,hp-nfc`
 - Add `dma-coherent` to both `snps,axi-dma-1.01a` instances
   (dmac0, dmac1)

This aligns the Agilex5 device tree with the coherent DMA-capable
devices accordingly.

Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
---
Changes in v2:
        - No changes
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 1f5d560f97b2..d6a2fe445fa6 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -324,6 +324,7 @@ nand: nand-controller@10b80000 {
 			clock-names = "nf_clk";
 			cdns,board-delay-ps = <4830>;
 			iommus = <&smmu 4>;
+			dma-coherent;
 			status = "disabled";
 		};
 
@@ -351,6 +352,7 @@ dmac0: dma-controller@10db0000 {
 			snps,priority = <0 1 2 3>;
 			snps,axi-max-burst-len = <8>;
 			iommus = <&smmu 8>;
+			dma-coherent;
 		};
 
 		dmac1: dma-controller@10dc0000 {
@@ -369,6 +371,7 @@ dmac1: dma-controller@10dc0000 {
 			snps,priority = <0 1 2 3>;
 			snps,axi-max-burst-len = <8>;
 			iommus = <&smmu 9>;
+			dma-coherent;
 		};
 
 		rst: rstmgr@10d11000 {
-- 
2.43.7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
