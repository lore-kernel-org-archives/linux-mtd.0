Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B67C678D5
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Mar 2023 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F6vSDIEtJS4p2Z4yMZZ5CNbS8yjA+bm1T6RLCBzxAKw=; b=ABy2ctFerKhefY
	akVtvh5yUYyTtjNUj74UvciHZ8ipAccGcMItQy4xacdB+ybnvDDUdzZX2dZLr6BoYlJSjkXA/1Vqw
	AFAyaJcU1TTzRNsUseAVlznk6l+tw01+SrA6DFB0MeeS9gZ8PU9kqG4L4W1pJtbIqIpATAXhCUaA5
	m91jepImjZapPN7PGaYrbXswVVg/HcGcPlKsUrJRwlTLxtcKHWrp9EX4T2JuWF1riKo5iNbK3KNB9
	E5+/XN5sqSA10FuPMQZMtQDdKocPBSL76PRx3gHjdvSm0o4whSI6KsODDYxJXelyy0nkgTfKf0ayO
	YbrcJgwOc6xJmIHG4eRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZunv-005SMb-AW; Wed, 08 Mar 2023 14:30:07 +0000
Received: from outbound-ip23b.ess.barracuda.com ([209.222.82.220])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZunp-005SJf-Jh
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2023 14:30:04 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49]) by mx-outbound22-210.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 08 Mar 2023 14:29:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPfH/zvl7hEAzpKiUoAltHNICB2Gba7WBUg6o/9hNlNpeGLsOsvSS0M46ptpvtFNYA9hkFaQ+xXT1coEQ5dD09/17oKN5X0JcAJFT9cH8ymdLOT/QAOT/AwwF//Q8moymaQY0gmB9A9iVhhVtpaZ6l0RUPwjzVcHlsjTJ9StuaU6b/8mUSQBpA4MOanC3aAvI/MXT/4DdHWFDocn5yfQMB1Z///AtWcr6caYUI6Hzeenm2I0LIXNWpMut+lVMYFav8klv88u+iKL2XUZI+xFCNWmTz56HSKLvCA6YKLW4uQVGzJV0yray1LS613gy9eKYScxTXsvNv3Zr8onj6hpqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBggn7y01HvTaeMLIDo637TxbqRUQg7bEwgJbdtHwXc=;
 b=oP3/aPfnFB3DQA4TXmuSjG089Hf5g4K/AlKG4FD+j9fH+1pGmC3povcd27BMOLc6LidMQBOTzBSSupS2mj/hVHnZczLYl2/iPnBgqP5wXJ7qE0ZwarrPD3TTYoN80FMXHn1UsXwtDoGFVr2saRE5DDNgLp6hXBiaLslBRPWgwU0Irsq5kSVDLhnc80znhKPF1CSse+ifXM6nfiG+wZw3iKmhx7tLEH2JPcdrjMNsNvzEymk/Efuww47x4yAdgAoGfsod41dCzN+d9ZiqVMX/JS8Bh9cMrO7HBzakDsKUj0+fRowwx7WDCxBljLIO3Q/cJaIcYaE74w9p7jOOPyAeRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBggn7y01HvTaeMLIDo637TxbqRUQg7bEwgJbdtHwXc=;
 b=h7QJ7MQ+LSoWb4SotGmzquaeAJ+LQnCo4NkO8D1ChEs1CtYZiQncE+1ozOVoomYfyicYTsTrwYNLlbBRLiBDPUrjdmAbRIg3pn/6yNaQfbBqxtKEUMb+IJTPwAHWj4Dck46XqqpOSuo+Xu3TY2peFtg9eC/1t3nHWkdS09fKDmPquDgpWLdzibg/Pg0GbrGpekB3lCph/pCRq+uTRoUS2ilrqk1WurcsRd9LKZd9AF27w8YkQjhLJUOAbei1nFgtJOyB4nt39D+JD5F/5y4bij2rKi/KTZSXxnGUaPbGAqBBEs411A5Nsj0U97kIDSsD6I4KLHHVTLUpDbm8EULyAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 14:29:45 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124%2]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 14:29:45 +0000
From: Hector Palacios <hector.palacios@digi.com>
To: miquel.raynal@bootlin.com
Cc: herve.codina@bootlin.com,
	hector.palacios@digi.com,
	linux-mtd@lists.infradead.org,
	sashal@kernel.org
Subject: [PATCH v4] mtd: rawnand: hynix: fix up bit 0 of sdr_timing_mode
Date: Wed,  8 Mar 2023 15:29:26 +0100
Message-Id: <20230308142926.334787-1-hector.palacios@digi.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: VI1PR04CA0135.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::33) To BY5PR10MB4370.namprd10.prod.outlook.com
 (2603:10b6:a03:20b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4370:EE_|CH3PR10MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 909f2d8a-f770-4690-3ce9-08db1fe19080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ANjSsrn509UqbETg87dxyF+meArybA1Qa5bYUaniLTaQQeNPiHygVn99e86DHjm8vhcNNnBTmyQ5Ky+Y+BYnaMSe38RF6vcyX2LfGh1NuBbO+CbFTa7PFJzqmE03sz5occlPvTqI28LYiTm7Yl94ZExF/9lJwL0xgIHKU8WJxLg5yJ5MT/aWmA9JyfHhTR/9OlnaVRmbwd627h5KxrW2h1XFXev5/RTAksfAdRtOX8SXo1SEXw3F7vIHv9K69E0TCpBSCSbkyCgizz6xbD86e9AY+oUi6W140uKJZlyr2GFQEluhzw0otsGoToyUUf9XWbTQwoGSPMYkrlvQ/KBitWIIwUhrNY0N6v2CgGStwoVK5RFCy+wVmh13+jtuYm9oFH1BUprxFI6f7sO9uG0RwS7cJs1ewsQadk4tH1m2msclhGhwqyYJTNYGytfV3s3LRJ9k3G2iqhW/YEXJj8FJJ05df0JqC/1402IGDEyh0HzIwrlc555FBRAq+24okRj4c3hXHqbkZ3MUv1KVP91CpMVgURVnMwQLNjqcdqt0v3YWhhCEdk9dljZyt4X3fpMySPRoM8WjRMDDUdfy00t5e26rpHWLW+TqRzq/t+AAaPR74bmBZhVnXaECkOMU2x81Fn78JkrWdKuOhAKETZHw0wxsSLzQL5j2r7lM1XGUIJZvwerl6h6aOisF2extF/kA
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(346002)(136003)(396003)(376002)(451199018)(5660300002)(52116002)(6666004)(66556008)(66476007)(66946007)(8676002)(6916009)(478600001)(86362001)(4326008)(6486002)(966005)(8936002)(41300700001)(36756003)(83380400001)(6512007)(26005)(186003)(38350700002)(38100700002)(2616005)(2906002)(316002)(44832011)(6506007)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YsJ4Zv2cTxgdhJUeGpC3K5FCwijmBB8KvQRlm8TOLZrV8iy0i7h8CDYRLLYN?=
 =?us-ascii?Q?HIcIgsT/b1qQXQPhp3/eZOC61a9TIwGPKYjeLFSjRRp6bpvDbgUUm+4BUctg?=
 =?us-ascii?Q?kbkDaI8n+nhVNe+AO71/KpdTz0ehFpm6RCgSTeDjJeRjnU9RuHvd3ZjD6LpB?=
 =?us-ascii?Q?kjAiRcJPfb6i3tJhlNfx3/L4MBZBifXrJKwve2hsouKOZmPlrNjcQfzFaULu?=
 =?us-ascii?Q?Un9a+A2Jhu6rGtrwwArrvAVpokBi2rnWqZhXSq6v1zeBzvErgiZ1tE4SRuA1?=
 =?us-ascii?Q?iqrpcvdXth99UfY5dbO/jjCcAf9onhIMTWhibTWPDBeUnMYb60fB4uLdbZGJ?=
 =?us-ascii?Q?23SMp+fzMMFlB/BCP4lwze64cKnHE7ASh4RifpvGdLkDpy16KSx4ssinREk9?=
 =?us-ascii?Q?MICZg8zTfy5piHbuHfxNs8flU4llzlQQY1UCYKJ0IMWDlPqvM92IGvsqjfv4?=
 =?us-ascii?Q?Vq8Fpp4J/W2a57B7IGRHf034TN2QFK4lShVDnlQ46KwmCTFuyiqJqZ9DXgSr?=
 =?us-ascii?Q?Kf9P4XPYInsuc8jjQApb/5sGc9Jycso9clCbJSdDsQaz1vZS1xzjV2+0vWcT?=
 =?us-ascii?Q?2bqBjqNK0aC4wEqcTlTfQ/bbjQeWvB1kBpPylZ/354MaWAIb7QBFUGXCrUbc?=
 =?us-ascii?Q?zJCilHKTDysLh4GLrAJ+A/7CTsZKdYFsN0mSaf1dL3TM2p6lrWl++aWCttSi?=
 =?us-ascii?Q?dGGxJbdHRa4XgBiTy6Z4y73eU/k+kXTBB7Y5CN9+GE4VC9v8fsDwYd6M9XAZ?=
 =?us-ascii?Q?UfiUk/bfaozELN+e7WRSf3ulG3JAnkpmdorMciGr/b24YfLjt6sPn2CDUK2O?=
 =?us-ascii?Q?wuN8iyGTQ4Zyy6BW26cS7BP/9FDbqcxtQYYgjOt1O/OZCRPnh75edr6K6rJo?=
 =?us-ascii?Q?V5jzrh37bc8JdGjOyJur/PQfDVOsubGr/eQoEYQqaFel5ijRFmvuvlCsv5DN?=
 =?us-ascii?Q?CtL7Ev39nWNKvc27IS928OKYea8qHgfs3TaBbJeRXamYeY6Sadt+X0xGIYWL?=
 =?us-ascii?Q?FBhdT1iQ00lKlNqc22eV8Q+Bu+Vhhx58O/M7LOWUozt2GszqwI5sjFHC+8T/?=
 =?us-ascii?Q?adoIf3B7EtpgJgR+UhbKhOtP++s9RDtl5CUFK9DHxX2iWFuXLHOAtbHFyTL/?=
 =?us-ascii?Q?FH+zgGNYoUViumR5hn5S2LHeXFwEQ34QKkaNqO5n8u7ZwIOIsXtrIGtddaV8?=
 =?us-ascii?Q?u1LPjfybUn78VcZgXoAML3QjWCvJIZ2VvvAxPDMKBQSAZ5q/Dr2v0EXEeJ4A?=
 =?us-ascii?Q?PeRATF3mcQbTJIxeLuUSXnpESo/7wq4OBcuHIR8HU2WeGUL7Es36EU+fOrRE?=
 =?us-ascii?Q?A43sSKWMdJMtV31GmBZNsTiQqb7hASZKXH1aLX46OoY1W5+vtFWYjfrSk4ZD?=
 =?us-ascii?Q?gD8StNczqwXFTpuFXOX6IDZU5sdb0idg25skladr4xTbMMLFJ/qtQyvDCkyI?=
 =?us-ascii?Q?EDqFxn+CMa3vmzYM2XyVqPwpWgsL3VkPITrCtRV4570Uv/VVHgbT7915wKmU?=
 =?us-ascii?Q?mUpkJJqXwt1VvTpBfwsYGatexg8Sxjr8Xfb+Ve8cZ5K+71ryIrktsUWh6V0G?=
 =?us-ascii?Q?c78GlH0Pc4YdP4l0dba5q3RQ7GhRQJgnb+dMLMwz?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909f2d8a-f770-4690-3ce9-08db1fe19080
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 14:29:45.7045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0coqtQURs4t9XEezl0j06q6nKXT8MiqHuXvYrMzW0dtB0oBTWBkxNHOSqdNf1QiUFOWn3IXJdLn+iQ1HLmdO4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7329
X-BESS-ID: 1678285787-105842-5448-12933-1
X-BESS-VER: 2019.1_20230302.1753
X-BESS-Apparent-Source-IP: 104.47.73.49
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVoaWFhZAVgZQ0NAsJc3IOMXMIi
	3VxCLZ3CLNwDwp0djMIjEx2dAoydhUqTYWAIn+OARBAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246650 [from 
	cloudscan11-242.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_063002_733652_C1DC46F9 
X-CRM114-Status: GOOD (  13.69  )
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
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/20230223165104.525852-1-hector.palacios@digi.com
---
v4:
  Fix bitwise operation on __le16 type, per sparse warning.
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
index 0d4d4bbfdece..c17cca316148 100644
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
+	p->sdr_timing_modes = cpu_to_le16(le16_to_cpu(p->sdr_timing_modes) | BIT(0));
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
