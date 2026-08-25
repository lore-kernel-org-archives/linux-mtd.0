Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9227EC61DBC
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+VMK2jWEJsAHmlO6GmYxaqvT0XcB4Sr+PId2kbm5Z4Y=; b=zDqkjjtSz9LCRV
	mUxBLbHPL0Fc9BzELDlWAEzPeTzrCu1FdJIq1iUNcT39MA50/22vA6xQ4IWkxMS3WfJhUTXsVhxu/
	sIPwl8fogCgtpg2uaMbYQ+x6FAK1F0vRiT6xwGxWEd2/+P9gOQSQZwXraWk02mhzaJJrpXbsOhknI
	lUEeJ7OQCrVDwJ52yaUZhUGvFpNc9HncIY+Z2G0/xQ85Fj4nDubS18Eq838MBk2kAN1qgO9DgWB+C
	rp04we46Hhw7xxCjymvQ9rIeMWOe0SxHjYgX+Yoa4S3N7TjcKq2mi6CAgXgpWBHHl3o2FLSggWrrv
	j73kiaXJI38wu200ee3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuoM-00000001CDe-3GBH;
	Tue, 25 Aug 2026 17:19:46 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyuoK-00000001CBO-1ZqM
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 17:19:45 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67PEVhgC1165448;
	Tue, 25 Aug 2026 12:19:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CaKka2TXrNmZxg/2rKa+E19ixmWvfwzQpJ0sWclJR
	yk=; b=LLzlt4ekNon2wJB0xCLIbhUU5cu1rmF983iw8uiE8vj32Fodj9ed1PdI6
	DHbkOL3G0oSMUkS+hIdexyVOefyb/0z1IT7Ox/NGEWP0qojSx6iQUIOZqBSrxk/b
	w9mg6BJiMvBASlgc6+8JhDhdkwuh1JxfMLsBkmd2tHiO4xa8tAgWpr3+oSS1ljT+
	qylyIDVTjk66/IW2hKw8aID52GdZWn6dLXHNPYbh3zmcuivGlItJRwOOxRQ/Abjv
	k+nBLDt5TOpGniFaCcOhOOpcZh6q4Bzcmky5LNFg8Fi1QYQzbKOPb1+h/tlDhYqT
	hozQ4Rit4rUz96y1N3CtpMJoZPdig==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g91sxmjpj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 12:19:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOrirgsCifc07QZHHTVN8yIgJox1jJQmHK7LcsYq9EnJpB98a7+HHekWPaEaMoUNlc0hLrZM5GaEpPrCzHrvxa+YSZLrQjDd9FfR2XClZBbgtZQ0sxXe8eYRZnlv8Dmwfe2CKm5I9kGosZXafgoiPTH4b+T0nIKH+LGYMqZEW9oK9JsEqAMLxSeHNYqXaRAihmiT9r5oJG2C/K0zVhDVyAup6m9ZoUf3lVmhYj5Pecm/QSqCURORXcZ1R0KjUIw+nC4kdSPDxIw6ncYvHOQ8mxtKaLL8ysDgMmMuxrItLwwolP71wG6xF7GQ9I/qBdHVcFLHwN5K2B4Whcy1oa+f1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaKka2TXrNmZxg/2rKa+E19ixmWvfwzQpJ0sWclJRyk=;
 b=N9rGE+41eODwtDVSWDDHyd1zcUsM6WRRkSZyuF8D67EgVwdyCfyLsnngN88eT59P0NOupbzbFHmqBKqArJNp4mkf+awoxr3Z76lgep0lGw4eHQecVJXoj2t6tyRBjBpKBNTsrPZe9Rc2ccSZbGtFV9q+YxdMNGj6Sh1guzyPTzoWJu7RD+lMxNaZ/DofWGTPo5fPhen04dqZ/T/XDKjXQC3/St6vLu+YcR2cUy9KNQyRcRMel1W7fYplf8vIvzex7AGAv0z6Savgx96Y5ddk7+wP0Ewy24wKOHk9XsRKWAu0w/FqQtbaBzgZ4DHos8Hc2xeUeoq7VjKx6UgJql/2Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaKka2TXrNmZxg/2rKa+E19ixmWvfwzQpJ0sWclJRyk=;
 b=MYAdZIC7wCPpIcv71UE8dZG9yEMtiKqnzEk5riPVxnj6Ot/MqMS7IvstMrObneLaYX/OsMs18++zzxPQD9RmqntRT2ZXFEJTTC+0JCDTuliGm5RyxnEGzdd7ivEAu2x+8U/ftpZkyK7Il7noTZXzlGYOPBjWUa8CswzSB0p66f0=
Received: from PH8P221CA0050.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::11)
 by CH3PR10MB7576.namprd10.prod.outlook.com (2603:10b6:610:17d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 17:19:30 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:510:346:cafe::9a) by PH8P221CA0050.outlook.office365.com
 (2603:10b6:510:346::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 17:19:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 17:19:28 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 12:19:27 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 12:19:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 12:19:27 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67PHHf3h1436664;
	Tue, 25 Aug 2026 12:19:22 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <sebin.francis@ti.com>, <u-kumar1@ti.com>,
        <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v9 18/18] mtd: spi-nor: run controller optimization before dirmap creation
Date: Tue, 25 Aug 2026 22:47:37 +0530
Message-ID: <20260825171737.776052-19-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825171737.776052-1-s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|CH3PR10MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b9f30c-1c59-4d4d-64c9-08df02cd04bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|23010399003|56012099006|10067099003|6133799003|3023799007|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: OdJUYByu6WSK3LR6qItjX3E7vqlRehreo2dbDvqK4A5sH2ARy0Unh/lGz+IBlB8hg9mJGKo/4yIYhWEA6DFyD05WFFkYcfiHeS7waDUsp3uReLUpxenrKI76DWnQbH7a038dGp79drmJdDr+Gt+NERoh5eg16b4CNhrCzGTwoN9DF2yud39UhRtbFCscwyzQI4YG/FqhoJeSIJZA6KHWVmCDW77HHSUN1VtS9oJFafu8DaTszOKsBFQdgL0Rq58Zb99XobfohEm6OuYDuFazcbqVSQqFPxrXKDONK7lEKp34kFavmM4G3xDiw+6MH/48LIu5QqoctpcAE8TV4ug4dt0/mrqk52QQZkNJ6iirmO12R4OiH4GqDFOFysbq14lFBmnHwOVpzT/BTbzk8hgeBcrR/wfY6N1ZW/jj7z8e6LSceJR/f6YsPulpljIGgST9/qolz7zmIayuAffDmV9iO2eyF8OX7WNpE0S8yENeTgkGPzzotZjmWw2b+pmdLxGxVGAruAYg1nF88Mpu7sHFXLqjX2bT/pOY1rkorcnoJrZObXP2sDlXZ2lXnmI5Dg8pymBBivRZGmqjS2JTq8FOwaWoeeghYmGu03gd3LszZPWqjoV8wPIdTCChP2sJRVr2eJGKLPULFXxcZaYAchTtLAPdbDmHd8JbNYk/gcySwRC+r8FHDTe5X7nNaACQ/TMdOgNw7T2wDnetwBRTNgimqTlMqMBjaHhxoJ4FF73J93JxjN/cH2gmHPxkZDeU5wTN
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(23010399003)(56012099006)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qW4JfmlkB4BmdZ+9xW53krhAIfjgbU7Jhmp+HTN9nOTLv57MX8MAaGzJWGwfHaAXbR0H8KoopuXrLIl8YBtXX1IWsPLMfuO62xS0zlQIYylbpywAAr5AzKfSjurCqzBrhrPY/Qkz+9/HHxoVcnOBfzBTqYcDsIAAuSXH4UWYvJlkd8Q/rYGunF6sZQYLkxlkSiMTjYZE/Sddik6AEeqwdqx3m9vhhkcN78O3SL4i2r8JQn8HLTEzAt6Vtagaux48oWT9pUkFYYyAkskvO5n5pVykE9FV4xPpDpY5c+ZpFzqp61jTzTf7Y9tF5KA+qTOfbSammeJ/EQXxBRSxffW0m7N6+xA4uaqMenR55Yfyv32q5lheQ2XZqXMbHQ+ROagKRYRleWrzsYb4M59uc71brLnjtvoySAdU/zJblar8FqPIEhnLWob+1iTXtkElaLwh
X-Exchange-RoutingPolicyChecked: sC6e4AjvTERbeE72eSm9JfPQ9EkRZwUxAp9tCXIy9BbuAFDHtn/HUjDW4lryuxn00b6pkOnN1XMSRlTTM/Ruok13eTwCv5QTeUZvlbRL4lzIBoiZXCHmZegPIBvcyQy45BC2oA+qY/LMP8ZAnel67n8iXyCq+4ZixMWLNbe02fBqTH4ZdnpUoVqnABNl5WHsjRICSRkouFOG+yVG+czwCsjqWRwgJP+A20Gh9UdQ1Be2dZjdRTXftvG0iLMhfFaDGpADRe8eH2LUxykFkE2wPqsiBPVeUBVmTvIj9fq5aHMUrify+wNuukmnCnrVqRsu/c0IXaakuoxhLJU+sXCnPw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 17:19:28.0377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b9f30c-1c59-4d4d-64c9-08df02cd04bf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7576
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE0NyBTYWx0ZWRfX8fp1mfqWE1IO
 2zREdq9RqAQpCAjHRKxQFRSX4KG6SdJGc+NCIyw8feSyOfaknbk/qsX1oWaP/Ptym5EhqvuMf6n
 NfF8C4rGjDaQcxZpVBSYLCGf86K0Llk=
X-Authority-Analysis: v=2.4 cv=HackiCE8 c=1 sm=1 tr=0 ts=6a8dceaa cx=c_pps
 a=miuBlqXM8bFb40OTON37XA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=dAWDYLcBFR4q-bF-ZFAA:9
X-Proofpoint-GUID: it0h-_CoUyiDuvL_tuvKAlQWSEAYY5OZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE0NyBTYWx0ZWRfX1yZcgZ98OVOC
 kG2uwyMNOya7dODO7yNfZbHHI28jrszv4j/Qav7YQ7XXw7F3hV2MsUdE3J7L812pmvjo38MVyeP
 72XOO/gzMZavjpYhTkKnsk29mxO9639pgTcE00UBkXY3BdWQsWIvH8QtVE9jRVRtOge2PZdNjUB
 BKXqtOJ+kzq0hfnBDCOZKg2Nz7WcZuyg5ORPp0WjwS7y+7kJGDgEdK/fO5R1m93d+jUIZT9XUeT
 kmK7W8UXknx62J7tc5yroWq4zT9TZRRE71VdS6cwBOPhs+2FFTvDvIjXkc/rOruSK4EKsVwSp4W
 TUMlLsuWrdSlR4eL7rTZ3/4AHk8Qj8NKh2+7X62OboNtRyY99cwOYRKKxnpEK6of61R1mkVzkTy
 bkp7XeZwnwUOLJWoyzGgpCZSeQt7HFoVAkiG1hSmI5/eVLVB8nnkf+/UYmMNwYMiY9n2T1hAyiM
 2Bx8vvBWtFkj3wQgedA==
X-Proofpoint-ORIG-GUID: it0h-_CoUyiDuvL_tuvKAlQWSEAYY5OZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_101944_420052_7E9571C8 
X-CRM114-Status: GOOD (  14.32  )
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

Run controller optimization in spi_nor_probe() before creating dirmaps
so the validated frequency is available at dirmap construction time.

Store the configured read op template in nor->max_read_op and pass it
to spi_mem_execute_tuning(). On success the controller sets
max_read_op.max_freq to the calibrated rate.
spi_nor_spimem_get_read_op() propagates nor->max_read_op.max_freq into
every op it returns, so the validated frequency flows automatically into
the dirmap template and into regular read ops.

Optimization failure is non-fatal; the device operates at the
conservative base rate.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/mtd/spi-nor/core.c  | 14 ++++++++++++++
 include/linux/mtd/spi-nor.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b683c077a233..2efcdc7f637f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -216,6 +216,9 @@ static struct spi_mem_op spi_nor_spimem_get_read_op(struct spi_nor *nor)
 	if (spi_nor_protocol_is_dtr(nor->read_proto))
 		op.dummy.nbytes *= 2;
 
+	/* Propagate the validated frequency; zero before tuning. */
+	op.max_freq = nor->max_read_op.max_freq;
+
 	return op;
 }
 
@@ -3843,6 +3846,17 @@ static int spi_nor_probe(struct spi_mem *spimem)
 			return -ENOMEM;
 	}
 
+	/*
+	 * Populate the persistent template and run PHY tuning before dirmap
+	 * creation so the validated frequency feeds into the dirmap op.
+	 * Tuning failure is non-fatal; the device operates at base speed.
+	 */
+	nor->max_read_op = spi_nor_spimem_get_read_op(nor);
+
+	ret = spi_mem_execute_tuning(spimem, &nor->max_read_op, NULL);
+	if (ret && ret != -EOPNOTSUPP)
+		dev_dbg(dev, "Controller optimization failed: %d\n", ret);
+
 	ret = spi_nor_create_read_dirmap(nor);
 	if (ret)
 		return ret;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 4b92494827b1..ab498a50f15f 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -422,6 +422,9 @@ struct spi_nor {
 		struct spi_mem_dirmap_desc *wdesc;
 	} dirmap;
 
+	/* Persistent op template updated by execute_tuning with validated speed. */
+	struct spi_mem_op max_read_op;
+
 	void *priv;
 };
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
