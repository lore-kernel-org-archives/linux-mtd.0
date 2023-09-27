Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85770E80A8C
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Sep 2023 05:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=60qzmv7ReT2kxNNAF9bN9cVIEmpz9ssBFi4si98UJ3A=; b=15y62PQbN1ZEhC
	YYdq9Yq9jO+VF75gx8ITbid5tZYufxSJWKSk963hpQQefaHKNRZDXd/I95evOnwif2dJMDMqQonjV
	xtMIL/dykOOOF/JJZ4zMBaw1H+PeY+aGs4UKWyaeHCBupmA66JK7hSPTwAQKOBSf+IGPDHM7c43dl
	Jk0q6w4QMXG2j09SoZo+cQzc2v7tHDfvnBN+IDRIYUlixdUZPixqXALnpJd1Wk5rM/ZpKUU/XwQGJ
	PGhTiFIw+8Eunfqia0ciX+e4wfiWRrL7cvqOPcnahNH3hDxwV2xsYsu1YxwOC2IqSReTgnKT4RhHN
	xRC1FVx5JKZjFq5nrCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlNXW-0002Zn-2a;
	Wed, 27 Sep 2023 05:56:50 +0000
Received: from mail-bn8nam04on2062d.outbound.protection.outlook.com ([2a01:111:f400:7e8d::62d] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlNXT-0002ZK-1c
	for linux-mtd@lists.infradead.org;
	Wed, 27 Sep 2023 05:56:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0tjaXQmy+DmVwdHT7aEIAw+4tc0UEhx3+ZptHX15zfTMdCLIYWPPv/grtpWMytENM7xwonDw3n9+gJq6Wop6/RUyb946h+dxDQQhJ4i1CydJSJr6tP6hPl/XrPg5Ti0RQbnlbjdSn351VSgwM8PLF6YiAHAXaWlC4LyHIOQvIUhyxA8x9mNNZBab+ZO2PR2pGZKJDlPJ9L4b9eE17UNx6iWOyiNdEIewaCiY5pM4+cWKpCqOFSXkma3yh1+CMOnx1UNNiW1Y+vfCF5M+WKjiNO/mlsm0eEHrj1wh/g0LSgOhR+BLNm7Hegv18+cJC/hlGsHyEn1hvvxhIKHizk/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YfYbHAXTsUgodVMkBQvgwYzGrmj6VyvKfylFfQ6McE=;
 b=Ohx1w+9AiJokYIuaX9bS9lGkw8tLhDUY5afwbnzZuuM/hqPUACcjwX/LTI7gXOeeb8siO6s3gGzuNtS678ct2U5i1Q+8Hk+nQqAUnI+AQvAZ1BEhfCYOvKaG9PP7JvT55FGAri0W5e/jIL7I4VgwZWs8pYAvWZhTIbhtYUxCwsOwUtQbc8wPCL4RgjGhC3tLXvzC9dS79Lm4nama829+1Pi70ad/zjV8b+j/ZoDlFbKbuAm0LTmI0rZrYMKTZKz011r9MKh2tbswFZAhIqGcAUzXI63yMxgV7GrzhYlccrqCsWnvVpjMAkJcC+fYlHo8g6ZqA+XpmW8adCIpm7PAGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YfYbHAXTsUgodVMkBQvgwYzGrmj6VyvKfylFfQ6McE=;
 b=m8hrluBtFtW2Ymjph7KffzRcDSRsRV0sJeGg6KSWRuiks1L0I41MtbSZp+zQK70KIDkQaCz7UEV9xBmfTvNRoeEtppJFwoXzIIWOk1DVpNGQJBxWf0leDzcu1ke6pBGmltFsgRSTX5XRH6s2pNfB19amTlDRwpQueCS7hmSXq4M=
Received: from CY5PR15CA0167.namprd15.prod.outlook.com (2603:10b6:930:81::13)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 05:56:32 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:930:81:cafe::d0) by CY5PR15CA0167.outlook.office365.com
 (2603:10b6:930:81::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Wed, 27 Sep 2023 05:56:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.206) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 27 Sep 2023 05:56:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 00:56:31 -0500
Received: from xhdsgoud40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 27 Sep 2023 00:56:28 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <git@amd.com>, <michal.simek@amd.com>, <richard@nod.at>,
	<boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
	<akumarma@amd.com>, <amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH v2] mtd: rawnand: arasan: Include ECC syndrome along with in-band data while checking for ECC failure
Date: Wed, 27 Sep 2023 11:26:21 +0530
Message-ID: <20230927055621.2906454-1-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|MN2PR12MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: 180b41b9-acd8-47d4-b7f5-08dbbf1e800a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ic8FTohhNMu5l9rFZPf4rBGPCHBi7qwJRaW9pjaJezmLVuremTyogWxNzbCGwX5dqGd+WXbyzNchW1qdhAHAWJjB9oJglYL57RqCrBqwQ0NDsd0TtVMMwmsyC875Z3GEt7NUJHNm5NsNJ9uS7wkyx8cZAsdKyFtTLF9F1uA0M0HDpNKWkwUlLQrTB3xw5nW61HI5pIwL00J2YtFfc37H2XsP4lv9A5MxVnFuepROd5BTiM50mSMPxa9BYYik2XoiGWT1zszYrJydsCch3g6d7nGWJWy/Z8ylgRek3YAc7aC2bGYkj+1cwa5ZkG/jfZmBc46yOo7zN2vg4Fwt0tPDWNOBNcH7ygzknsG/hc2w3SgS8WgQ8jkwZWHfWvfRZcj81ybKJTMY634NeI1OlmRNTLWNVzEdPgzTQs+W14fLDY8VueNutLVl2qrbiD2+N3GePmgIuClzxlsQQGcObXi8cmdzxqSyHvSpVZh9OEeY447ElN+gTAH4axM/bxo2e8t/+eOD7205VR0dhT5hCqe26Fb3j4Bik+f+BNNAjz3mvegJ0B+A2SlV/Lu3J5WEng/avwdCs2uwDcAW1ybr7RmRnazNP6ADaHfJgrA61d47ZdFYuPXja+jY34wjMjE5VlmtEZgKvb0Q0n/nkzEWBeDFo40MlSSFdledK8Bi8tiUzcF92eDWteFKnd7EdERSRM/ojI5yw0oE+ss90EjjFggtZ3V/OACdbgB4N2GjmhAFi/eYSiCjU92IkmShqeX6BxqapxYz1KjO7iTK40eW2si3Bg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(82310400011)(1800799009)(186009)(451199024)(46966006)(36840700001)(40470700004)(2906002)(41300700001)(5660300002)(8676002)(8936002)(4326008)(316002)(54906003)(110136005)(1076003)(336012)(26005)(70206006)(70586007)(478600001)(40460700003)(82740400003)(6666004)(426003)(2616005)(83380400001)(36756003)(47076005)(40480700001)(36860700001)(86362001)(81166007)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 05:56:31.9917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 180b41b9-acd8-47d4-b7f5-08dbbf1e800a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_225647_563247_D17DFF1A 
X-CRM114-Status: GOOD (  14.35  )
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

Following an ECC failure condition upon page reads, we shall distinguish
between a real ECC failure and an empty page. This is handled with a call
to nand_check_erased_ecc_chunk() which looks at the data and counts the
number of bits which are not 'ones'. If we get less zeros than the ECC
strength, we assume the page was erased and we are in the presence of
natural bitflips. Otherwise, if we are above, we assume some data was
written and the ECC engine could not recover it all, so we report an ECC
failure.

In order for this logic to be as close as the reality as we can (this is
already a simplified condition but we can hardly be more precise), we
should check all the data that is covered by the ECC step not only the
in-band data, so we should also include the ECC syndrome in the check.

Fixes: 88ffef1b65cf ("mtd: rawnand: arasan: Support the hardware BCH ECC engine")
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
BRANCH: nand/next

Changes in v2:
- Updated commit message.
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 4621ec549cc7..547cc82b5d80 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -481,7 +481,7 @@ static int anfc_read_page_hw_ecc(struct nand_chip *chip, u8 *buf,
 		}
 
 		bf = nand_check_erased_ecc_chunk(raw_buf, chip->ecc.size,
-						 NULL, 0, NULL, 0,
+						 anand->hw_ecc, chip->ecc.bytes, NULL, 0,
 						 chip->ecc.strength);
 		if (bf > 0) {
 			mtd->ecc_stats.corrected += bf;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
