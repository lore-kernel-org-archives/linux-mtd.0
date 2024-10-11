Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8370D0D78F
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9E/f0HPgywf6+sLaQgjP9YdbMjYsc6r7XWp8AG3sI0s=; b=hichUGfi94HJbh
	Ve8II4suXvu6FVKFDEo1gxm4v5jvlp7YpZ/Nd8cekQelLz7yRXwL2oanzZkQITHNwoEwDVREtU7wt
	/crtsySlpF80xG4V6gVIad0G80F3L4EAluRgpqU+E17APzAy4A2JqlcqQNDK6vL82IXwkGTihPjJi
	HjPeeHrJ/P3mUlBz4y4wQjzIw83UmUZy0DrMep9N2tuCg8M2489dGuFF1YfLjuevCQZP7xlSLzeeu
	9B7btd1rkMDPprx9aejlKhI4jKErzHvM/5z5j+g44tqs7o9S/P0SPCgmIRq3RnW3635+PtUpSGqHF
	9lw8OQS4U2pk2HlgOI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFGi-0000000GNLw-0XH6;
	Fri, 11 Oct 2024 13:01:20 +0000
Received: from mail-vi1eur03on20630.outbound.protection.outlook.com ([2a01:111:f403:260c::630] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFFM-0000000GNDW-38IV
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:59:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Six9j9R8i/DJlic9OnBUgY2XnsMYDhvyf8dQze4OfH6k+2sYQSj7EqtbIK8KYpphZShPUMk52vcf5wyvMDE/kE/FGQ23yZMo2GJFTyvddCDXcB2CcSxKv4O6yu/Inm46DwZ3HCqjmJeJ3Hlxu4/LgmgtmJvYVGp6EB85zyu+Ga1lMpjXgSatCMvo8SXDX98NyiZbVRuk58TrMp4ETZ1LOeh3sncxNhOJD6rLIRj2jnDVgVue/p1KCWNQKBpkTMYIKJhxc/MUiWnmFaY7YRNudEKT/mdtaaNlLl72PMuzghbb3ibyE+0SR7HquiFkoehdJ/M1NeQO+hw6sR/5U5Og+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hweQN0LZSeBhQyD/wbfOcmGMntHcXtC7eUaF5OlVHws=;
 b=S5eE7nKjMBetXTTyJceLEY6zf4PlUoAuNqJ7Kd1a911ubrB6bg0J2KN4aa83tK5MNG6EpQslHQ3cXfh+5rwOOB+Ab9L3p87bdpkeDp1WXhbv2adiw2khdRH0jPBZPe9xvaYdQXKnKt1BiMCOdbLs1UA8fAtkkGYk+9f78msjJZ3AFlTHGhbSFiOuN4hSL3lZxZizOMJlemGjZIkZ74FffGNEMjvL3ov5lZlMHBTnFDTnxUok9gXi7cCD9v7r2bQTTdxWr0RBZTA5OrTQ8FDyU54gW+I+WC8z+LkKEKut/0yZz9Jj07Jep5Oyjav9HdLf9DQ4fYsfrbZitP7W21RP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hweQN0LZSeBhQyD/wbfOcmGMntHcXtC7eUaF5OlVHws=;
 b=KStySnPTWlPWQD9fo5p3VmicNpbqkSCpe8TpmGKrUUJYndeEvBIXUAzixQL/BEtk+oVg58h6FP6GbMU36HQo7fzs01c7Us/HaTCE4K4Ccot2IK43cEF2o9EByv+5U5TVG7Fz33C6jTY10y8A969EPTwjMYDk84jXpk5YnoIKzSI=
Received: from DUZPR01CA0190.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::8) by DBBPR02MB10508.eurprd02.prod.outlook.com
 (2603:10a6:10:535::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 12:59:48 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::57) by DUZPR01CA0190.outlook.office365.com
 (2603:10a6:10:4b6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 12:59:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 12:59:47 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 14:59:44 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v3 06/10] ubi: Add mean erase counter sysfs attribute
Date: Fri, 11 Oct 2024 14:59:00 +0200
Message-ID: <20241011125904.2915983-6-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011125904.2915983-1-rickard.andersson@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|DBBPR02MB10508:EE_
X-MS-Office365-Filtering-Correlation-Id: 7587f824-5cb2-4fd0-450a-08dce9f495a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yr1RY/EVEYJ1m8auPy7CBi41G3Zyu+oxvbccZclhxdg/+1a6AUSMRscRVmo3?=
 =?us-ascii?Q?XHkFI7GqouDf50bUB5VkgGaiwPfJSdrmc7x2GPajKkycai3rpU5RVbUTvBMC?=
 =?us-ascii?Q?jjmAbFbUCTtc3skfultc5JVgd6ymtf8DeGiIERlwr6/DI9x5htBySi8Gr08Z?=
 =?us-ascii?Q?AcO2zB3PDZ7tyPHON2o7uj2F/Niatmb9ETQYMedfjTtRpi8So1GaNSdPULcK?=
 =?us-ascii?Q?LS6lCXdSIjG9FLXs+r6/tMQCQztj+j0nBhuOee/w+8I1Z4E6dqDl8WMGzRzl?=
 =?us-ascii?Q?AcVbGzir0+n7I2hh/UpQMC4wWykG2ubSG1cAvk+EnyA3ERLKN9ULvZWpKMTR?=
 =?us-ascii?Q?oXjYLGNhKl3p8vSoYUzak8D/5qEE6E/aQG2jYbFNNsxRq27QhVVgcv1XvS2g?=
 =?us-ascii?Q?sVN+taKk5C9zjaovZVj6GmT52EfJ4wES7qQ9VIQZZXaIoKTw6FGcMFU/tv3h?=
 =?us-ascii?Q?ULaiHoX2JVpbtI9SBrJ9chULSY8tJxIVo0S6gR69VphnWNYczWWVS5yoLONn?=
 =?us-ascii?Q?ms1kiW4F+Md6dUPMrTa4T0AYPwIeGtynx7jFT3+V5iLG4CjcmGn5UcVGp+AY?=
 =?us-ascii?Q?Nf5X4zXhIHx86F0VrRoQWEe3yZMueFMdMN28U6KjGlzJxF4gtN6Y3WlP166L?=
 =?us-ascii?Q?i8ijaNpEtwCVMYXHNvln8FRW25hg2wyUpbUT0iSm9KvbKGjSyOzygRWWUzv4?=
 =?us-ascii?Q?N275nZy5/PZXzDsHJ1mLNR4Ad27G+PO8Tc06iNOzTqzkqe9DbJbnzH0ZMrQe?=
 =?us-ascii?Q?fc5ip0FAwbfaMgFVkQa7OJ9kqDfw02PlA3VDeUEdJsrxxKpsox0jaJonTbSH?=
 =?us-ascii?Q?mo8fEWgT5sEQEcq8iBybP2C6p2mSYd9D6gaXZCQ8Ptyuid53MSSfTckLrlHD?=
 =?us-ascii?Q?PmOhKyuJ5eGi2RQSXTdt3WcZBXr1vADjFLWWvNT+JUIw9HYDCOrynHKW34aR?=
 =?us-ascii?Q?4naaF7W1d2WG1GILf9TFC7xQsT7djlESoNZPvTO78pveBVQiT3iCjbeaJSWo?=
 =?us-ascii?Q?zqAEo2SELRuIPX0XA2gGIkLtv4DyDXPZYHQkUJpbkMSAPYKDbQFcS9s7JQSL?=
 =?us-ascii?Q?n493iUter/oEKv+P1yr9psVonIBhwjxdNQnjypZWhd0eun1d54qyLmKV81Ma?=
 =?us-ascii?Q?iCJFD4qqPhJiRoLTHPm+4sR4JOX1SkZ8BPHcDkjM4MTQLdvd3x7M9pKUDioJ?=
 =?us-ascii?Q?oAIGoZok9KajVSl7L3x0J5bB+hPmWKGQkaW2/Atlwloz+s6qvxj2WWUc+y4L?=
 =?us-ascii?Q?hV49L5Xx8h8bMnjTJ3hHWsTPQdbqMHDTaRx9tFhh9MnjU7O4bwV6G6SlRaIR?=
 =?us-ascii?Q?5Bdq72Vwj3AIG1M7Pamje7Phxwqgapdil+6v78VfPGm32kwUEi7i2Yg79dYb?=
 =?us-ascii?Q?R+otqxE=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:59:47.0940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7587f824-5cb2-4fd0-450a-08dce9f495a3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10508
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_055956_809083_E9D8D7C1 
X-CRM114-Status: UNSURE (   7.94  )
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

A mean erase counter gives a better understanding of the flash
wear.

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 Documentation/ABI/stable/sysfs-class-ubi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-class-ubi b/Documentation/ABI/stable/sysfs-class-ubi
index a6b324014692..535a3e6dab12 100644
--- a/Documentation/ABI/stable/sysfs-class-ubi
+++ b/Documentation/ABI/stable/sysfs-class-ubi
@@ -219,3 +219,10 @@ Description:
 		Logical eraseblock size of this volume. Equivalent to logical
 		eraseblock size of the device aligned on the volume alignment
 		value.
+
+What:		/sys/class/ubi/ubiX/mean_ec
+Date:		October 2024
+KernelVersion:	6.X
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Mean physical eraseblock erase counter value.
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
