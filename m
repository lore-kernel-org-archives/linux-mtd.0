Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F280C6379F
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Feb 2023 16:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xbFzfx3HcWZ0eLBE4BB0cy3xc6KR4H9rAkt4S6LFnSQ=; b=cbmdZE95D46Mpl
	R2Mi5NbqKEaj7drOr8Arq0Jr1ZYhU9OObHK4mfiZbiEhWO+xWdbFxELPD5oljuAnYlGjuX3sta0nP
	bZ7XvJbCf6kfghm90s7nOjoUiV2xNsN5X1BhtejS6dJrkdNyhhlBQUdWkQ+xkASeJg1q20LlC426S
	+KUHH8KL8bqaGsIKyHUUDMc0GRJJQI0wNlPtm0wf1LCPmXAjJL+6ygLi5lZQh/AWuIQ3ILWjUIkyV
	WwRqvk1g7HVw+CvU8JIuww6dvLV+Y88aI4teJBM0PFL2IpvOafjMYXyaGJWQr+jsB1dsiqNo2RT/y
	djc5w9Z+wEqRtVTh6R2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVEp4-00HHDG-M6; Thu, 23 Feb 2023 16:51:58 +0000
Received: from outbound-ip23a.ess.barracuda.com ([209.222.82.205])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVEoz-00HHCV-C3
	for linux-mtd@lists.infradead.org; Thu, 23 Feb 2023 16:51:56 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176]) by mx-outbound14-71.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 23 Feb 2023 16:51:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebm2G5nztmX6TS471WXGnyxhR2KbT+Mb8CSdn4clmckxL+IZ9uOiTvW+JvSnKU0yhsbBxTncAZ1qX+WU18Rmv4u5KBNWESotW88srMkifOL0yriVDG1YM/Cm/gWY2FEbEJ3NSm5N6lXF9sd7rsOUXD9ibJwXsKnlWbKYbpJlydgzsGXJn07aflTslJ61iQOlSbHZNQPhE77/lynDMrtn2zWaIFeAxVspcI+NaKe5S1hqV4rjG3CL0/R1PwAr0Zc0Xn9uYGM/UMFsCWmGMNlWfzeXmmkxx+nD8oCOoavdtiXfjLNHNHZg4YG4f0Y8mDxpY0q4H3dCfAEAxLtclSBXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FE5330FRpvFLIc3SyvBkqnjw8SNucuGGDQAnYVERMB4=;
 b=C6RkMky3DiNxLUUGh2P472mW1Gw28bYKPHz3fFJpMArdlAkFqs7feomYGc4XIGelWTtBH3hF01PB+IB2QImGEf8YmsyuHfsbtEtT/FDLOJrFOqvgWZTlUWUGTycq7BeqQXZbLSQGbW8J1v199IQOxl0CN6vxZaJUw5Zm5tnfwJUkit2KEkP0v47YDAfeh4/DG9sKWND1XFTwG7RME1gPA+zHUsjx5NIEL0wRUewC/5KyWmkOSddJh8nKzXIPBkI82r8oVEu7tV5j6JRwxP/lq4OfXUW3A5W0LACyJ9YDJ4W1KIXFC0UHaHKsBIW0IFpV6idpoFSKQUZwYy6UTFwwbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FE5330FRpvFLIc3SyvBkqnjw8SNucuGGDQAnYVERMB4=;
 b=sO3wOOiSuCrcDzaKjfZ6J2wlb2lo4XHBpIIYJB7nxTIOTZq6G6LWv/iAjpULhbRzaKf5UdkRBe9uf+7+g8aF4OtdF/oGr4hbqrtnZYWt7C+sTdKZFcfy5nrZ9uZBbfDiq7oVN+tlUaNJ7SLU6KuUS0XkH7sX7ZsS0LTqRS0aInb4zkeWzvGZGdVEITuuFoGJlJwCuVKNbCCxiGswo/5E8fZO13OQJrMLKHccz/Pq9fxCacnaNyWDhqK8k6r255pKIvS2XiHB6R+1ZS7y0NrnSWEOEc99Iu9SI1Pquo7cN0WRJ/0adcv/jQ1zYK1H7gGG8hPBbDZWM2mx5xfPVNsRog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by SN7PR10MB6570.namprd10.prod.outlook.com (2603:10b6:806:2a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 16:51:34 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124%7]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 16:51:34 +0000
From: Hector Palacios <hector.palacios@digi.com>
To: miquel.raynal@bootlin.com
Cc: herve.codina@bootlin.com,
	sashal@kernel.org,
	linux-mtd@lists.infradead.org,
	hector.palacios@digi.com
Subject: [PATCH v3] mtd: rawnand: hynix: fix up bit 0 of sdr_timing_mode
Date: Thu, 23 Feb 2023 17:51:04 +0100
Message-Id: <20230223165104.525852-1-hector.palacios@digi.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: VI1PR0701CA0070.eurprd07.prod.outlook.com
 (2603:10a6:800:5f::32) To BY5PR10MB4370.namprd10.prod.outlook.com
 (2603:10b6:a03:20b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4370:EE_|SN7PR10MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e683d2-c4b5-4d4e-dc49-08db15be3874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gbSi9nZAik6gvQb7BPCoDxz7HM1Ol/m2mr11sa7lngrPqsIRiiftL1xRz0fciFhpizPIkDlJwB1tpWP0ykviPQbtniiv8g3dHDds5n5eC5f50nGsrMf2Mwfu1ptMTvP8+Z/l/a6AV9b5CDg9YmSYY2cNNuLZojZPNMOYtuZMJuEj8o+FhLqDJ8dreq9lFkNHF6aA2vgxa0drJU4nfU8278u9Tct0NrZq+U60ECkx7Ya5lFBAWbpcao2Wg5ejgAR2mSFoAAg2z1veg/ZJTUl9+s1/8vxIh6eQ33vV9FZN59quLv1L14hdssQhZfqXCl0xna147iRoh2Wg1UJI2uUewXpI7LWPiaL9JRKnXCK6GNL5VN32tuoyyAARs6nPYREJ2SWW/dWA2UE6HtYfXs0xevo5mHm/x3cs0ewHYFnhfD5ZD7WgI+qFpbWptfEirVzmPPjhkqHjqgwCnq0tVzAeZv1iPiuA0u+oWGy9PzoGAkrPG2kYwg3MhjBuVHqghLOUgRnvbhDIibpf5MJ1m1uhdG5IT53KR59sbv9SnubqS9G/Pq/TrKuEt+5K31OfTgg3cPtjb2WnWX9sZCUdy8jJ7UsNomN1CDTPg4dqcI/a6ONMTcI5xLw90CYUkfaU9dUfVQjAKC2kSUnZrkFaPVX80z+/5kO23gXCr4TuRq9EGaEKBDoWEidbmT517T4A6E+lu/8YdrN9bJfAa1wpvEUvrg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(376002)(39850400004)(346002)(451199018)(186003)(6666004)(107886003)(6512007)(26005)(2616005)(6486002)(6506007)(52116002)(83380400001)(316002)(478600001)(1076003)(66476007)(8676002)(4326008)(66946007)(66556008)(6916009)(41300700001)(38100700002)(44832011)(2906002)(5660300002)(8936002)(38350700002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?icU0d80Dnj7IUYRZw+xzPkmQQlZkiEWMd5N/ffRcDTG+Y31EIlskO0Mo/LuY?=
 =?us-ascii?Q?oK4Lu0lmoNJTL/3Kgk2iinyFUOokIMfGYlZwnJVkOqEX3aaUwkLafGRGIvuM?=
 =?us-ascii?Q?kJ9AQ1IzJrXiUKMUcHMvAfPXogAOKKlIlOSyGsgwGWEPZHKMb0bStuQDM9yn?=
 =?us-ascii?Q?RSxuqAtAJzeWQvbou+dWHBOZQmh3xLvgr12DPPHmOWoznwpX9O3N03bygMj/?=
 =?us-ascii?Q?HR+lbBmIs0+RhZDCw9K/asmHzMaqV22EgRzqEo9QC2LpzLT28BxtsrODPVSm?=
 =?us-ascii?Q?EKUdJNFrD+iIiVxjIbi401SisBwijTHWmvTYppvsZ2TSfWFX3AZg8ntmAbCM?=
 =?us-ascii?Q?j8IuRn4eRJ0d+q50jXNyiQeMJl7Rq+7GYBfsht13bC6+0GrAt5ojzrxVak+1?=
 =?us-ascii?Q?MGXlgQkA4V4S3GtbSQ14UjULjJFuyG+0YUxalYXj1DrWl0/b9rSPfrZ4BEs0?=
 =?us-ascii?Q?i45spNwomcKUlGSEnbSdLxQoYITSxWKYjZghxw5ANFB+in+icDUn+1YEVkWA?=
 =?us-ascii?Q?aI1NliP1j9F2vUKfSpV45oxA5PfpIdMCrHiRXjRjz/JgFpMIW0ijqpUAlCZe?=
 =?us-ascii?Q?if06iEf834qrC1feaU0ZH6+MhR5UdQwkTCNMZ8qIzqCv8hYGYjcLwdEjJkwl?=
 =?us-ascii?Q?dxrPeTvl2Sn9gURs82W+KyPKHVmxNjpmZdMW8w0a+JnAV9ABBMA8zsKysEoY?=
 =?us-ascii?Q?tBRiu3OkUXt15oD2p2mXJNgJoVKSJh+Jc9CLj7FPk6RVLJdPiCwCv/JUXElp?=
 =?us-ascii?Q?shdwtSdkNR+PD7UBzDpukxF380OAkwY1kqWgr9ijrnyt9x2puJdjjOOJTMnL?=
 =?us-ascii?Q?JXs/rFJt1MDhuIsX+Fi2z6xkT+4h06zoWrXltMgCgiguqKwRIte3GoPJt0N9?=
 =?us-ascii?Q?Ymzaye/SedkWxzWG3gzZRPXYkc3zJaEurwe+907Mig9T8U5//kx6IJG3G+YE?=
 =?us-ascii?Q?9ZgZjLd16J7IC5KYt2qnRQ7D9HbHUSLw4k8AMMua58vZwnI8MD9wAUtm3XNT?=
 =?us-ascii?Q?5b8kmgVYo0r/RA6HaNda+Jy4MSIfV6BlkGs3lN7QLtvar1kQm39RRnYGv+YH?=
 =?us-ascii?Q?FFBcZpqTJ7S5BSMkaCT9deSx6gV7lRzHEIXSocouWs1eG5jaAmnM4uFlON1N?=
 =?us-ascii?Q?9JHGxLEU8EFW3d2DSW3Cj8A9fKcGz4ln+m+m7F/e1cs8wlY6tg12sCvnN93W?=
 =?us-ascii?Q?I3anvMKd4nbLULLidBX2bDXRIYC6tsiMVxi2hAwp7zhKfP2i7oCfRHd3AUiT?=
 =?us-ascii?Q?ugF0DdXrj5S9dFud6Zl1PCUwFDanF2wEw2qExyy8FieBK7PC1gNPK9PzRKOT?=
 =?us-ascii?Q?YDNrdrhIa2rERt/JmyxBd1/bzhH6Uaqv5JnFPPyb136MpHCYwItrHJrO+Zqv?=
 =?us-ascii?Q?o9GYklAh7edb7sFW8EEOvD0BxaeoktDZGZiCZByY4cC1XM7QxjJMJFNdvI/g?=
 =?us-ascii?Q?fAXWL9Pd1NIdms0rBBsRhX0YiVV14TWDCrPhqu+oKL9su7n7oo0j+IlURKna?=
 =?us-ascii?Q?YiJDW1FPyG5QizQZZkvDGeoBoprwuISUrOw8UlpLAeLJf9IZRL4vTSqbgPIo?=
 =?us-ascii?Q?3BG76gOzsXPskPQRxQEKAZ2P8p/u7h+JbUADuHL7?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e683d2-c4b5-4d4e-dc49-08db15be3874
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 16:51:34.1659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hi0454sAi20ktzBY4pcwNnnoFhq/RVIoj8Y/TFUD+FRkSbsRkrSr1sSMaIdt+VDLzFGeu6fbov4QqByd+CN0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6570
X-BESS-ID: 1677171096-103655-5411-12796-1
X-BESS-VER: 2019.1_20230221.1854
X-BESS-Apparent-Source-IP: 104.47.57.176
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVobmxgZAVgZQMNnULCnVMMUw2c
	LC3NAgMdXCIs3E3CTVNMnS0tDMPMVcqTYWAPWuGHpBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246355 [from 
	cloudscan9-229.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_085154_343174_EA9F1565 
X-CRM114-Status: GOOD (  12.71  )
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

According to the ONFI specification, bit 0 of 'SDR timing mode support'
(bytes 129-130) "shall be 1". That means the NAND supports at least
timing mode 0.

NAND chip Hynix H27U4G8F2GDA-BI (at least) is reading a 0 on this field
which makes nand_choose_best_sdr_timings() return with error and the
probe function to eventually fail.

Given that sdr_timing_modes bit 0 must be 1 by specification, force
it in case the NAND reports it is not set. This is a safe assumption
because the mode 0 is the minimum (safer) set of timings that the
NAND can work with.

Signed-off-by: Hector Palacios <hector.palacios@digi.com>
---
v3:
  Forcibly set bit 0.
v2:
  Move patch to Hynix specific fixup hook.
  Use BIT(0) macro.
v1:
  Implement generic patch in nand_base.c.

 drivers/mtd/nand/raw/nand_hynix.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index 0d4d4bbfdece..5f64bb9b7ead 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -728,8 +728,21 @@ static int hynix_nand_init(struct nand_chip *chip)
 	return ret;
 }
 
+static void hynix_fixup_onfi_param_page(struct nand_chip *chip,
+					struct nand_onfi_params *p)
+{
+	/*
+	 * Certain chips might report a 0 on sdr_timing_mode field
+	 * (bytes 129-130). This has been seen on H27U4G8F2GDA-BI.
+	 * According to ONFI specification, bit 0 of this field "shall be 1".
+	 * Forcibly set this bit.
+	 */
+	p->sdr_timing_modes |= BIT(0);
+}
+
 const struct nand_manufacturer_ops hynix_nand_manuf_ops = {
 	.detect = hynix_nand_decode_id,
 	.init = hynix_nand_init,
 	.cleanup = hynix_nand_cleanup,
+	.fixup_onfi_param_page = hynix_fixup_onfi_param_page,
 };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
