Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16305EB64DA
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CSQuqifUM7gr6rTIO+SGIa2cLcaHxItRIH40lePD0Q=; b=Cw9Jw6yKVRHml8
	nTjzX9xV5G3d9L7rcoGm2Y/dg91uDABsDtHQtyU99B0djjuUWpQy2cQZ8DitRKw//4mpmfz3A5bQc
	ujmFvCKhuxQp3MRHT6K4fvDWrD15jWI4N3eAczOJf/yadZr1Aos5++mjWFS3MgHG9GTgf2VYeTdYU
	fIkID7r86Pcu7cwAh/CwUjVyl0XUvmRFd0bnI7xBr+0uihv7GycCb7ugolrq/Fy8lLS1/uj5mhxtn
	3q+ztBKrpyScSYg2LsJwgC/euqclbItkg2TwJak0shiTkkDQCBXVdxdJMyP2NjXeJOi0LYoRSDCUl
	QSerpntT+fUoh670Mo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA5F6-00HN6O-08;
	Fri, 16 Jun 2023 08:55:40 +0000
Received: from mail-dm6nam10on2061a.outbound.protection.outlook.com ([2a01:111:f400:7e88::61a] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA5F3-00HN4r-05
	for linux-mtd@lists.infradead.org;
	Fri, 16 Jun 2023 08:55:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9th9zGJp0pah9OMCdRs43cJmrwR4q4U296q/6pD2pihXrFs1a3xH/0qrOD3IjyH2uJ8+Tjvrj+qaQ8GrS66+FrIYndO1WblTtMRepSjVsI2Z9RW0B3gWDczOEixq68oL+YfT1lxeNZt1rH0HlDuX6ilW9Vk+/WmBzolPCTHW4Re9reOiK5+IxX/YzaTtkrJ7Mj2t75lBeYGqkesFfsAadnuYAzH3Q3k30L9C8RN/Bp7Z5aZq5c/EkJTDAz/me+e74yXhj4EWowY6yZEow6uBusGpgZbelrmEwlL/rjW9tOlPoysYSyHBdZA89MPrrcGHvJX8Qk2a1+UpVleyyil0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTR6TjeDspJmp5Fo9pYiiKi+3nOC4nkqCcykXGpJGp8=;
 b=WN7frlfvDPsovDsWXYw+e5L81gwWJbWU4mw5KYxSCNNiB7kBB43senLKGsnxPpKFj+RQKtf2hDW8nYDM9Gm/gLH9KcOilwKbCYIJx34OEGIZsW72fncJW7xjxqe+GjOT2d64IYaw5agHARXpp2nf6KiPQKr4kZtEFzD17p7g/qXoBbgknntpe19MxC81NKZPRJRigJTtforq4/KfQ2zdY6EVHhAx960qnrSAI3Grayvv9GsPnb9zwtosIHlsjznThwZgRD1tqPDduBm3s6hP9qJvz/mas3sPgMiwdiNhrtJ1Q65ITApstHL72w2xxrDDe5nx+8JieM5x553s+n03WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTR6TjeDspJmp5Fo9pYiiKi+3nOC4nkqCcykXGpJGp8=;
 b=q39AeUUmZdIoXniJCZihSYuz13sypSYybUqVISIqBxTCaqcq7ba0dmBRgEPzBeEQa0reDhZ+ZFdqafSJUg+158rNzR/SflN775gqedQgj3BFdOJtOu9ltCgBrluSNXY4mbJUpV54usjTbssK6VzJ7PijTwJishpROlrE2eiqiAA=
Received: from DS7PR05CA0062.namprd05.prod.outlook.com (2603:10b6:8:57::8) by
 DS7PR12MB8229.namprd12.prod.outlook.com (2603:10b6:8:ea::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.29; Fri, 16 Jun 2023 08:55:29 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:8:57:cafe::a8) by DS7PR05CA0062.outlook.office365.com
 (2603:10b6:8:57::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.12 via Frontend
 Transport; Fri, 16 Jun 2023 08:55:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.22 via Frontend Transport; Fri, 16 Jun 2023 08:55:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 16 Jun
 2023 03:55:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 16 Jun
 2023 03:55:23 -0500
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Fri, 16 Jun 2023 03:55:19 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>
CC: <git@amd.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH v2 1/2] dt-bindings: mtd: jedec, spi-nor: Add DT property to avoid setting SRWD bit in status register
Date: Fri, 16 Jun 2023 14:25:12 +0530
Message-ID: <20230616085513.17632-2-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230616085513.17632-1-amit.kumar-mahapatra@amd.com>
References: <20230616085513.17632-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|DS7PR12MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 815ed521-7859-49f6-0371-08db6e476f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kR4E7+pN9e2u7nWFPksyWaE368X/cXebXm8HFDwKOzZWQGSgHFzaRHQAdpY+JxotX6h+PaUMNR8Yns0MtQdXkfDQOXHN3U9SD4meWdbowFt97NOOJe5sJcuyq8fVRy7ConMznn0pN+Xm16SVLngusrJHNkinEC0OBcVFcPjdXKr2bVi3oAPvhdzD3i1vBakNwlrxUgL4D8E2EEgOObMDdfLaB/7EE3fZoJOEhqh4Um0vahzt1ppFxqObOhho8cuLK1GWdyQ5oUumldqUz7tLMJ5TnUAOSMt7OLpawMtwEiPIwwlBahBWDhE4T84Ge92IbHJCqKSLeRKBgbYXoOjV0pV0Pw6IRlfievn2s8mt5YvqIt8rQlc9jBrmyMsuSKLBbhP7hz896S5tzwmeGf0NzwsLJsZOUlZRI1Qu4d90ClItW5/6DyEWqVv2FfbURLDHaQ1wyPO6jJae7GBhYw9V9aLyF7gYle8xwhJ0YbPGcQeQXaSJ4dvtw9A6BFFTnbJuYxDyQgP9kraO2nVuDL96sbrbV4v8hysUjuZQzbvn6oEeJ5/joVfdkbm8kFSlnVeU0ZO+36otGrF7j+U/s8I5BuGsOBn6TTYWImxWoL36lFhNOip+RpILr9N9cMIXUDXB6pESjiaMcTqgI86Fqil2BOK0s0KeATD9DdoKr9Xi/YK12UPUPhC2fiHdTBoDt3DGrZlOshqk7Wmqv9b2CWGDyzy5Y5VX2KbsZWIND9K+YWJjBW95siYDHdzxOIdjZaaJAVPFyX97LBAWOzN52ojVZw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(1076003)(26005)(4326008)(316002)(70206006)(70586007)(36860700001)(426003)(2616005)(47076005)(336012)(186003)(6666004)(356005)(81166007)(40460700003)(110136005)(478600001)(54906003)(82740400003)(40480700001)(7416002)(8676002)(8936002)(5660300002)(86362001)(82310400005)(41300700001)(2906002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 08:55:29.3112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 815ed521-7859-49f6-0371-08db6e476f6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_015537_064757_A5826C01 
X-CRM114-Status: GOOD (  15.55  )
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

If the WP signal of the flash device is not connected and the software sets
the status register write disable (SRWD) bit in the status register then
thestatus register permanently becomes read-only. To avoid this added a new
boolean DT property "broken-wp". If WP signal is not connected, then this
property should be set in the DT to avoid setting the SRWD during status
register write operation.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mtd/jedec,spi-nor.yaml    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 89959e5c47ba..10a6df752f6f 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -70,6 +70,21 @@ properties:
       be used on such systems, to denote the absence of a reliable reset
       mechanism.
 
+  broken-wp:
+    type: boolean
+    description:
+      The status register write disable (SRWD) bit in status register, combined
+      with the WP signal, provides hardware data protection for the device. When
+      the SRWD bit is set to 1, and the WP signal is either driven LOW or hard
+      strapped to LOW, the status register nonvolatile bits become read-only and
+      the WRITE STATUS REGISTER operation will not execute. The only way to exit
+      this hardware-protected mode is to drive WP HIGH. If the WP signal of the
+      flash device is not connected then status register permanently becomes
+      read-only as the SRWD bit cannot be reset. This boolean flag can be used
+      on systems in which WP signal is not connected, to avoid setting the SRWD
+      bit while writing the status register. If the WP signal is hard strapped
+      to LOW then it is not broken as it can be a valid use case.
+
   reset-gpios:
     description:
       A GPIO line connected to the RESET (active low) signal of the device.
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
