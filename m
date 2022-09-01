Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3909ECAAD1
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 07:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=29T6XVv0ErVw3lDuoazfc+j8H4wJ91JgHH3y5Oc/bOI=; b=NAYhQw37cJ6WqB
	akIXzZ8DUPCzpBAG+VZd0XrXkMhgIVsqdu9qLXlmQbaedzZJXC0VOmcYR7iv8D5h6iUNCXqHHe4Cd
	NtMmwtDkj5Rn58Uw5pbuI9lqTv8ANS6sTHVeTdTVge024Y8WKXtS7ZhrTGsfE+6pSt1+oQDQS0nw2
	TXUSYOo5/pmLWXiAB661Ub5ieKx/J3osUWIXwbYdI9se3G9Xyy7rMT9B24leNwuj8uBlWAA8tr4o8
	raeegEcnhfc2kJoWNj/2m882ZQ2P6NFpeJyjVmvWz3fiweyOtsbkt1whIntVSxQ+o5UDs9+5AhWxu
	iP6V1tQASJOkX+1l298w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTeeX-00AK92-3X; Thu, 01 Sep 2022 07:30:17 +0000
Received: from mail-bn8nam04on2084.outbound.protection.outlook.com ([40.107.100.84] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTeeQ-00AK4g-0J
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2022 07:30:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezQBh18rW6VeYOYghANg8pvq8QJdjvNmDbLatJnJ6AUEr6GZ+plk2f9D6kOaP3EdoQQzy4XFhG6nSLwEyvVPvq/Rd3UDsDRba7W+pYyhih6KX0p19sGByFy5CKLwbRfXVcz17AWiulH+JjaNEn6wH6QumnOyrd9cuf0CjBWv4ZgKPcEx41WNUqM3N6FscWtRa/jusVPjSaugxfrJSwENZj/3swxdNTsDKuJRqNg+ggCoxhztyLhXeiFKZ72wJJzkrgAElWg4kHwLftT+d/0AaP5h5r9zpsX3uTLCVT3yEmQAf3FzMv6m/KEcypZjoP2XVq71jOCRXimoCi30tb7ouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCeZU/3QXerhfsZ95HFIsLb3fc1xYh0CFgWSCnhs+Jg=;
 b=BqzuHaJdJqjr7R9Qo1qTEOEQQ5O8DY2R0OPPfCnDGxj07UV3SxcA1co/3wK77f2C3kvS/lvCn90woHh2xAzxJnzm4ITlkHBhpePHBPmDxAxSIuNPCFxeqU+r/ISm/aaZmPA4gVH1kW8oiR6YHnZiODWt3zUMvPpJvKX2l7kJFcQg2RLg5C6DCPfeqxea+Qo36DtUmSnKHM1VdoGyFvPd8rIvbXFyIPAEe+PqQLzpqh12O5IsUCfSUkpOjB61YvvHA7ldNPqTK+qcYKoseMj9R3IGOGXmM4SbenQsGb4zRy3WnW32UxBvZ3pj0PFxZG+uOGGF/qX85HGlnmnj9fs0nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=microchip.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCeZU/3QXerhfsZ95HFIsLb3fc1xYh0CFgWSCnhs+Jg=;
 b=eDw9nsGRtWOwMx+yfob7y6xLDFfLfwF5fcwJzLD4xL2/0Q6ujvVpUmrg48Jg7sagbeYohfce6LycNffogmK2NRfmF369cIQOriMd1wJeIY+LsAvJDXamXdJHziBBkKnu16lx2tPlqI7vTW+htdr0gxFC1PhKB27G65oWwBWprps=
Received: from MW4PR04CA0207.namprd04.prod.outlook.com (2603:10b6:303:86::32)
 by SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 07:30:05 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::3a) by MW4PR04CA0207.outlook.office365.com
 (2603:10b6:303:86::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.13 via Frontend
 Transport; Thu, 1 Sep 2022 07:30:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 07:30:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 1 Sep
 2022 02:29:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 1 Sep
 2022 02:29:28 -0500
Received: from xhdlakshmis40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 1 Sep 2022 02:29:24 -0500
From: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <saikrishna12468@gmail.com>, <git@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Subject: [PATCH v2 0/2] mtd: spi-nor: Add flash device reset support
Date: Thu, 1 Sep 2022 12:59:12 +0530
Message-ID: <20220901072914.30205-1-sai.krishna.potthuri@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b843323-3255-4026-9352-08da8bebc9c2
X-MS-TrafficTypeDiagnostic: SA0PR12MB4445:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	J61dxEXss499zOMGiBJ6kyezQdC9tDKFhY/STpTGMYIUQTqoRN78Yx/A1KLdtoSrL/EV4qsNtHa8EX0MB3nIdQpNM6Y0qUQ+l1D9I7wL5tr7iPHqbn6GvuofuT8X3FjATD/S+mg7KBOFOxA3kP4FFYzack1W2kVGSKQQU+bE13C+mZpwrK29IMWVTG6PZGGo2uKrYBm3ZdvaulFVXQwmpi2lOooyNtEK/gOaiFRs9ktgAeilRG5jN6By4lzCCAIST7Cl9CCWgyHbWsZA0DCALycHAK5ieKrPslfOfoUZetDvzEYHCNrexNu6CktJlCpl1kLMeqjJIhjiem2xtIq2kO6ii96p+YC3BMntuLnBT1c9khWYOxhk+PHpoJmqbNp+OltQSzJBgItHnVVyLXRq9N0gYNiAD+uUlRE+cPwSSFLseo2oc86xRJs+1mqxlPcImOahzNAGbiG/RR09aM6h7v/loD31SYnLEAsaxY915XKuPmgff1/PmpkucA5+QoT74e5gYM/+8AL43QR+Ka0alArBDyOEsejpHmw9Ps7QbeunEiMbgwyP7PWH8CvMUp+UQ9VJnV/b8RBF6w//LLuCKZM2jcgiiVaEx/qQ1HiGzyl3aVlfGbwI5S7W+ruzzkrUuH/+LMg0vUcI/eIqnrgwged14aWzyfODfkG21Flq2Z0MoMOQsc08yBqJrl27OcDtOZrtYidRNS8LdWsS9hrIRpYyl0aqQGDD+gqI/X4NyDHX6ioHk0bAWOPasQR05B4HH42xOpkRn2+gnIw1p2DGjBPlTcBYBpX5PNs7jS130fuDr7fArUFirDwXuIG695Hk
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(39860400002)(376002)(40470700004)(46966006)(36840700001)(7416002)(2906002)(4744005)(103116003)(82740400003)(40480700001)(110136005)(336012)(54906003)(41300700001)(47076005)(426003)(316002)(6666004)(83380400001)(40460700003)(81166007)(82310400005)(86362001)(1076003)(2616005)(356005)(4326008)(186003)(36860700001)(36756003)(8936002)(5660300002)(70206006)(26005)(478600001)(8676002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 07:30:04.3019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b843323-3255-4026-9352-08da8bebc9c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_003010_127288_DD58891D 
X-CRM114-Status: UNSURE (   9.34  )
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

Update spi-nor dt-binding and spi-nor core to support flash device
reset using reset-gpios property.

changes in v2:
-> 1/2 - Updated the description of the 'reset-gpios' property.
-> 2/2 - Updated the reset sequence to match with "active low" flag in
device-tree, also removed unwanted comments.
-> 2/2 - Updated the logic to perform the flash reset unconditionally.
-> 2/2 - Updated the delay values to support more number of flash devices.

Sai Krishna Potthuri (2):
  dt-bindings: mtd: spi-nor: Add reset-gpios property
  mtd: spi-nor: Add support for flash reset

 .../bindings/mtd/jedec,spi-nor.yaml           |  6 +++++
 drivers/mtd/spi-nor/core.c                    | 25 +++++++++++++++++++
 2 files changed, 31 insertions(+)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
