Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F586C6379F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 06:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ml096bah18WO3gtNBXEBhvUMzVzvWR3G2pq9CcgXK2o=; b=T8+uXc6u6TXb/f
	q+SbvTkqBgeFV331Rgmkxq3jtaTYnLSox3yo5UZrhH6AFwMF5OW4DnCV9NjdZQ5rXVF/4GY/dNxxf
	rKbTIDVVHDjYrOIiZye9pI5WAIYm6XBuReZSMiU0HfSy9/n+fLv+gEqqkqx3gIrSOjawICAICVAYn
	ZOiEDO4hKUBFJRXvpXDMsiEZgf2XKjvF58QEJeFTZKLnreyz5DexKNNGugaTXECnfmC6zBPJNt7ii
	4Fylem3lKx89k0RfrOlAuZNd0P0U3CGoMSVQbnQACkxiasKWwo/npTOd2dnVkm1PDV0+xWANPz5W6
	oTuyE1xFFIrMaycQpLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHAt-00AvYz-LS; Tue, 07 Feb 2023 06:09:51 +0000
Received: from mail-dm6nam12on2060f.outbound.protection.outlook.com ([2a01:111:f400:fe59::60f] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPHAp-00AvXR-Cp
	for linux-mtd@lists.infradead.org; Tue, 07 Feb 2023 06:09:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jX1vEWOtMSB/fDZJ0HFBFDCA23lPF/FD0uEnT3LdqNYBqupX3rteVBDIRJkmvVoEnCX4S4rsvS6R4rezzbvmlY9HWd4OMzz7oI/2u2cKN2kZvNH+hs3hQnGB+WTKypT90UXyWfxq0T/bw9gOCgxbI6EOyza3tTruM0HTENB9PAWW8FbY47HhmXE/q8ZPbwptlbQ5oiyRH7cbON4ETwKdEeRw5pqBjEsUJekB6tsXcj5vCSvkhIHF0lUbSPJms2x0kdGEcXsyfNUslYbZpt/1TjPfi8W24D2OSFnkec7BpC1+qak+tplIYV+e3Vr/F0NO+oRZUXE900EQTLbJHHR6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lb39lMuGyKRA6a75xFxCEvckoMqixhUV+R0ScK0kG8Q=;
 b=dL63kpuYl94q+HQy0050s2wXRyKDvma5NY6eQu50WJRFU9z+K9H0xIvqPSPU8Dm+n80eMQGYHkJHpgN2VuvM/k9s7xEq0qRCaAzoI6RG/ggoI2pjmdTMnFcYXnqEg+ySZcOjGQ9uXd6Qf/f2bpSPd6mgAk5Chx+V07NdtoWspHCx1SpreqpsoLLw4jW5vNAXPXs1Qb65fRjkHXKGomd3a8wHhIpMqLWNZw+J5EePV7hGwTTa1o+C71fEaJcWdCOO2dzNCjTa/b9zv3mvrDrCxlOD0SwtQFYdHl1IHZTjrSbTgdLLm1JCEboi/CWPeGOtluWV03PoaluoXm7BcY5uDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb39lMuGyKRA6a75xFxCEvckoMqixhUV+R0ScK0kG8Q=;
 b=zMMRMYCjgw8fH7p9XK7jY9365YSbZKuaqKo0e2IzdXOgPyZNG5ccNDUs3owEeMhtCR9j/K8vXnWqpET3qFUqzHEt0j9vrgXYC5vDZLo38/zEW9TuLmkUCQqr80Pqrev3WR94mdxJv/VVo0Pf6sIqdj1Tme9iwuI1Lx6mBMvZla4=
Received: from DS7PR05CA0038.namprd05.prod.outlook.com (2603:10b6:8:2f::23) by
 SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.36; Tue, 7 Feb 2023 06:09:38 +0000
Received: from DM6NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::d6) by DS7PR05CA0038.outlook.office365.com
 (2603:10b6:8:2f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.16 via Frontend
 Transport; Tue, 7 Feb 2023 06:09:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT106.mail.protection.outlook.com (10.13.172.229) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.35 via Frontend Transport; Tue, 7 Feb 2023 06:09:38 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Feb
 2023 00:09:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 22:09:37 -0800
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Feb 2023 00:09:34 -0600
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Mark Brown <broonie@kernel.org>, Tudor Ambarus
	<tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, "Michael
 Walle" <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: [PATCH 0/3] spi: spi-cadence-quadspi: Add Rx tuning support for DTR mode
Date: Tue, 7 Feb 2023 11:39:21 +0530
Message-ID: <20230207060924.265789-1-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT106:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb77705-dea4-4068-5f0e-08db08d1e4ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	L+IrRVbu8vGmIHEJfhS7ZE2nz9csruYQ4SR57/cJbKq8QwYtnZYVaNyNhoRE11dGhkvg2CUWcWcm1MR/IiRGlVaRUKCJRq4MpRmIlhusIJj+3oYeD9WqeQFKY+il5uLuboO5yVySXNGhQZFUH29dqhVGlc/D7my16oUnTL5cYqvGOqvfYsJ5YlnnRAvomvnpYoCByLCFduyDA14RBbsAEfvNXYuloi50cFiO0YCe/rW61p9QvkWrOrtNs3DCRNID/3CK2jCpqlN5SKcl9s9/tkoVdJ1BAI9uDo2HS+VFeLZVwhYvlNTfT8tZcC9wD2S8b9PhfDXVVWs6XvDfTd3KLjfp/826zj+VOdTruC1GoKslV0Tj+tNoeUO2svc4It/Lbch3Fne+02hH0qmbYjVg25hhSr/s7jyx42GHAwJn9sT3D1pAjrPUkyODotcU50HnO7bthC5bWmEDD0gxwjb7QEA/mEddyAgb3zPHnY0XZtqCH8r1Oeqot+82MDyLpB7vJfx01Higu/963NB2XYKoVULMoLWrpvZR3oDDWNfMZuuz64QY1opvOznkV9DJ5kqxcvo0/NCJEfPgDE6F1eLFFDAVwyWxRhz2q5rajGtjUHzodEsavFs+I/CJZghMnUHZjr0/+McQVawed+LRjZNyRrRRDQzM6mT8yRveid+WjvPYKNESk6kAK4q2DtBP1GHBR3VXHUYxUOuNpgAWO3YfFlXl1RJTB1poiQG7dRZUFs0=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199018)(40470700004)(36840700001)(46966006)(2906002)(36756003)(103116003)(82310400005)(47076005)(426003)(83380400001)(336012)(6666004)(1076003)(26005)(186003)(40460700003)(478600001)(2616005)(70206006)(70586007)(4326008)(8676002)(86362001)(5660300002)(7416002)(8936002)(41300700001)(40480700001)(316002)(82740400003)(36860700001)(110136005)(54906003)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 06:09:38.4380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb77705-dea4-4068-5f0e-08db08d1e4ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_220947_770091_23A0E225 
X-CRM114-Status: GOOD (  12.51  )
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

Enable PHY and DQS required for Xilinx Versal Octal SPI to operate in DTR
protocol.
Add and update device_id field in spi_mem structure with flash id
information. Xilinx Versal Octal SPI driver requires the device id
information to perform the Rx tuning operation. Since there is no common
Tuning Data Pattern defined across all vendors, controllers like Xilinx
Versal Octal SPI which requires Rx tuning to find out the optimal sampling
point for data lines, this device id information will be used as a golden
data.
The reason behind choosing this approach instead of reading the ID again
in the controller driver is to make it generic solution.
- Other controller drivers which want to use similar tuning process, they
will make use of this ID instead of reading the ID again in the driver.
- Also, we can avoid hardcoding the command information and initiating the
transfer in the controller driver as this should happen from spi-nor.

Sai Krishna Potthuri (3):
  spi: cadence-quadspi: Add support for PHY module and DQS
  mtd: spi-nor: Add and update device_id field in spi_mem structure
  spi: cadence-quadspi: Add Rx tuning support for Xilinx Versal OSPI

 drivers/mtd/spi-nor/core.c        |   1 +
 drivers/spi/spi-cadence-quadspi.c | 226 +++++++++++++++++++++++++++++-
 include/linux/spi/spi-mem.h       |   4 +
 3 files changed, 230 insertions(+), 1 deletion(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
