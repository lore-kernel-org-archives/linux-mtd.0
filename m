Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2B8C6FD19
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xvxhGNOHBE/lrD8QjXfAS+1PgM4CBNVqTQSD5nupXk0=; b=sL6Ka35vDLQhF8
	23qt0MQiwNXBweCYPqgpfGIxlGWbhUoVIjUOGrIPKwKcuhVvfGQyKJQ1uHCEdaGFBLLc7pyrXC+N+
	SPLsDhA4VuICmq7RoPAjvmG1f2e31VmiNoSeG5xhb5P/EZE6dYh7NQBK6bdGq5sWEn4zHDxQm6ZwL
	pFyh6NwpNhksongP6wsMVogqdxSw/DyS4V8wk87Q27bxhN7YwChXGeiNDK5o9q2OyyHbR67lbe2HU
	kJnvzxPCEjQ+ohRiY3qub0QK5rf1E3Qud2dfPrmWAVb2U+KO5wmMHr4K2oAlsAt1wtrA8z9jXAfX3
	LbU/vaAeUTQpt5Rvp3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXmr-00DXAC-1F; Fri, 10 Mar 2023 08:07:37 +0000
Received: from outbound-ip23a.ess.barracuda.com ([209.222.82.205])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paXlw-00DWWV-V2
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2023 08:06:45 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45]) by mx-outbound9-7.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Fri, 10 Mar 2023 08:06:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwEbNQ1OGZx9Wvgd7S/hbF5IurR6O9sPnDxZq5qEsxltiLtZlmowKOLtIpZ/0wk5YSM5U6/8FGrDdO5gnafEA1qJbpolVxlyuRmJqb28LTpz1+zkPWAma7coz6L6h4tsaNjYg5ssxR+tGzATC4pT8XH4taKh4Lh5Xbmcb/oHzSswy3qg4K8FVtUwcaAMXih3W1mtji+ITNWIAW9+xkEUlDlmraKYS+jYKMfEF2E04hx3FumQetyRD+5Lnr+MV5FmOrpeaR0MFLL9r7MEI2TTHUsS2kaP6AYup9uye1UgJ7Yncqn2GWrRbyDbk+JeBwYH0dGnnjgVyXWSKbgFUnLEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGhZc9xL56S1P0c2d76edKoT/jt9LNGWr0TPs8d7Ft4=;
 b=j5ark6ieI/tMyBqQuFiFx1MmPELO5GDdEeW1Y5fEDX/CMG2To2scgoz8zdXT8VkNi5NsyMXBAvu6rDMLtB2MAJpkLd4Cf7pYZKe49r6i7Ud43lmGZOBNIXOuEE/lY+TLSevIq7YUKN1OTvI+xPQVC1Ev5T7FXOLYJk/V6bDUHQIhAzE0E3Z3YFI4hwOYNS4egY6ZN+cvh7/7ki2Cl/RRPFt+dFus0AuiSfGqoGThJFPzKhmzvpwn9N6oie+85HQA29J2Jt9w++r4vmo2KRR11Am/wGR8NzULvcubXW+kxv36cwnEMQwf2Pc8qHZAIWxgaHya5QZRCC2fRUk2TqQZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGhZc9xL56S1P0c2d76edKoT/jt9LNGWr0TPs8d7Ft4=;
 b=fF3vv69z5h1ozQ3j8q6GR+FURm7eylx3wACLmvo8Ut/z3Dbm1jjDNWiiI4cwHDBh5ktXQMsS+m8ZEBg+7jpjBsv0tzKn9AleRlXUQJ83i8lh5RSnvP6Ho3DThpjCTNiFF0CRtdI6H4+X06dM1LvwllKiju8NGwpCP89lklTc+FwWS+JBQqlwvtPPxa+P5+dtWr4gr+fBMAZUZ8zod/Z+TpSsZpywoiNkVQ53Lrr5v9gF5kGkA82lqQPXphwtRNXiKGDS+ginNrjNqVlU+zGi4mYC9wC8ax7R/mwkJtFyC5FiHz9kutS51XyW1SBJkOEIvwpFFS3Y8OiZDeJX18n9uQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BY5PR10MB4370.namprd10.prod.outlook.com (2603:10b6:a03:20b::19)
 by DS0PR10MB6245.namprd10.prod.outlook.com (2603:10b6:8:d3::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.17; Fri, 10 Mar 2023 08:06:29 +0000
Received: from BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124]) by BY5PR10MB4370.namprd10.prod.outlook.com
 ([fe80::88cb:a839:2d87:1124%2]) with mapi id 15.20.6178.020; Fri, 10 Mar 2023
 08:06:28 +0000
From: Hector Palacios <hector.palacios@digi.com>
To: miquel.raynal@bootlin.com
Cc: herve.codina@bootlin.com,
	hector.palacios@digi.com,
	linux-mtd@lists.infradead.org,
	sashal@kernel.org
Subject: [PATCH v5] mtd: rawnand: hynix: fix up bit 0 of sdr_timing_mode
Date: Fri, 10 Mar 2023 09:06:09 +0100
Message-Id: <20230310080609.1930869-1-hector.palacios@digi.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: FR2P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::16) To BY5PR10MB4370.namprd10.prod.outlook.com
 (2603:10b6:a03:20b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4370:EE_|DS0PR10MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c141fc-9b47-4b62-1ac6-08db213e5a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/mBw89V2QR3UW8K9Y9LmOsXLkN2S6f3w9eNp2Z2tcBGHXFLg0peQSRQNBIs13Odoh8EvY5YI2LdwfrJtnYI2iQ2LxAK+Acny7lbuiV2CK4zV72CBi9QgfMokG/6oJ3eci28YUVFqywjqEODQZnsfvLuRJ0if166Ny2jI+l4bSIsILfym/qvY/OJXsbYXqCzt8FM3p+4/7w22vjKJUweG8uG/mtHrgTPEM3AoMhBY9COzh1LuOp6pqWHSlUcTtYNutVv7+OeA7BEU0+iQ2ht4BWgFkl5FRlge1oMx7J9G5+rfH7StVRokGH5O1gvCCXr5+bztd5EmqoVC3U32vsrBi1IocHdggLgoijW/aFSP185EiuzYyEuo/MJDnWdPrZYFNGpwWYFELfX6XhllecZrE2bpSGEkDQRGA590w1iCKEZW+Zgl8o4cMpMfPRkXslq/aCbbllY9qQccEjXTpiExZ8qsBsHU90O1gS31lBIGPkrdpPrZWKss817JlWUvLUzwdzCZWkwaG3byzgT0oLoBXpkiqOEngPX30YPrTkG202AZAUEprpIJ2RbpjN3KSU2aGaeeXEQ+jRcfDQJQ3tjfOq1IIbc43cIKLg+7cJL/GQqFN2T1Zsr5eYwhmLwb1bjLgtZL/r+hcjRSYXRcBshY14x53+YsQGGXppOLpyKJbDCfYeK0jinecMc5RyvdAD2U
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4370.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(396003)(136003)(346002)(366004)(451199018)(5660300002)(6666004)(41300700001)(86362001)(8936002)(316002)(6486002)(966005)(38350700002)(38100700002)(478600001)(44832011)(83380400001)(36756003)(6512007)(26005)(2616005)(1076003)(66946007)(186003)(2906002)(66476007)(66556008)(6506007)(52116002)(4326008)(8676002)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?eVkUKIVFU8oGsMS5dtvE54vRS0f+hi7/wCAwmKzJwvlTSwK7wtepALA+7HAB?=
 =?us-ascii?Q?eENiE8IfZLYjLrLN6xDHKyb+ii4W5ZoDfTHTf2z8DwuYB88zWqvQ5PXQXJNh?=
 =?us-ascii?Q?ApiTyuNlpjgG/RjvujTpro1ANRt17rCye0vFGyDvVRomaWY/nw5TutXmUjln?=
 =?us-ascii?Q?wD/BEBCZEzj1t+icNqVBoXcpEfb/YvDfj8h1GWRufJ2TimgZFuX1XWz5muF0?=
 =?us-ascii?Q?oEQ+C6OOA5nqAHsBNZN+PVm3ATXmHc4Td/m/AIrRTGuOO8zm9LdmTl4dMSXc?=
 =?us-ascii?Q?GjB0Dm10GM26I6EobDuvWB/KLE3T+bfY9z76SSuLm3NSLr+rDZGPqN4O11gB?=
 =?us-ascii?Q?NJ2fP15FAVwoQRhfCa8C1XY91mrSY3ZFfvrFNYo72qSj3PQUPWenX5dZxJ5N?=
 =?us-ascii?Q?Bc3XrVZqrT9qOFSmYMzZT9Wb9tli46h/tkqa5QjzsoJRa893Mn9rzJSbM4BZ?=
 =?us-ascii?Q?fKAy6jkwcGb5Zq711HPhGLhCQWbQLgPl8ZLj9Ni47zoPKWdyJIooOskku2t1?=
 =?us-ascii?Q?X9h3x0MGqm5pwRn02P/ITuHwpg92Ed1fwoZ7DLldAFUMgP4Xp7pm1JaJXxKC?=
 =?us-ascii?Q?mLqYX2yxKLXdKROrPQBOj+7HEgH6aoG0Wi8MBfBPRPcgiiMpI4R6tfle3HQ8?=
 =?us-ascii?Q?Q6DrERIFclUiX9gqdc95Z/ntjRSi2osEcTi+AtSfI1YPGwlpRMjldL361L8L?=
 =?us-ascii?Q?HsoI5QeZVy8joU1a+6StdYNypqJgS0uRulp1cKxN220M2tM8H//gZKwQ1CvZ?=
 =?us-ascii?Q?t6T7PVXeVD6SKSPLa8oUNdcoiYra6TO77XWJ2L4tvwpuyciGqaBedUrIC82X?=
 =?us-ascii?Q?LYSMAsYQ7kI9LLmH4JjhwUndpej5cxZrpmiEY+RmoWfT2P0slHJ+Vsyvq0l8?=
 =?us-ascii?Q?u1ngNkeYYMGl5UW6qsj1VfaCLrkAfTyXhTXRtw0KrQ9/Y6BB9J2VgXEw11dS?=
 =?us-ascii?Q?Oq8kCavhRoXA7lfQOvrjXfMVoDohtrvlvVKCrsa2zo+r2Fik+Qa4S/3g+0DY?=
 =?us-ascii?Q?qtaRqWCulP4poVf9k6XfrC3GUXxpoKe4+kX15a7TmRISDKsu2i+aqEZWTLo5?=
 =?us-ascii?Q?RE8NP3VHu0nBtzVtrz3FqDeSDH9v3ITSKfpnD3/pW5fNi9YI8sxH9EHEVBi8?=
 =?us-ascii?Q?+ETXjY0tF0hzfIovhQTkzMmjb2S6lQnJux8e0HLH8Cwed/R+YaOg+5ht1J6p?=
 =?us-ascii?Q?3Htoubrx+DIKjw3u+KXAqf4wWDiTa58g+2Y9VTo1ZIRrFraVUfXACFM9b6t0?=
 =?us-ascii?Q?ec7Nk9OHyf5/+2+c5Rf4vGan97lBdRYA4I19hnWhsy/4FtAsQZFbKCFLza2j?=
 =?us-ascii?Q?ebruYmjp9Ur4bUEn2Vzwr1caO+IP/fG1L+tBNXMME7yAMMqCmJwwtUM1/ZjZ?=
 =?us-ascii?Q?ddQNLKMdgAmY5lrslPhjWjzrZVZnFpG81XY/XmWjshSOGl+yPSUFlalPzzQU?=
 =?us-ascii?Q?kUD2XJ86oYxbglIKxUD5a4M8RLUhinXtEmsLRZrYh0ZHMOSLa8JdOTUMakj1?=
 =?us-ascii?Q?bgqxsSEdrtUTjR1RK6Hcm5Egt1YVrnJJyIx9F3oAxrsN8bFpQa2mMRc7qZyx?=
 =?us-ascii?Q?33khwDlWxsATTXr/nGHBQTqbe52Q/x54lyxVNEuP?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c141fc-9b47-4b62-1ac6-08db213e5a02
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4370.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 08:06:28.7333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XckLgnalSz+Htb3IcXHGKq2pNhXq/PC1V/S/iPvtquYFHcoqePegU0yNhQAs1eU6ozBA7Y5Ke6Y3u68O9uYCNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6245
X-BESS-ID: 1678435590-102311-5471-91353-1
X-BESS-VER: 2019.1_20230309.2002
X-BESS-Apparent-Source-IP: 104.47.74.45
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVoaWFuZAVgZQMDHZLNk4xdjS3M
	jIMtkkLdkoyczMzMjUxCzJJDHFLMlYqTYWALiQpL9BAAAA
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.246690 [from 
	cloudscan8-136.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_000641_231115_ACEECDCA 
X-CRM114-Status: GOOD (  13.77  )
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
v5:
  Simplify bitwise operation.
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
index 0d4d4bbfdece..39076735a3fb 100644
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
+	p->sdr_timing_modes |= cpu_to_le16(BIT(0));
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
