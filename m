Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BC3C4828D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 13:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kOSOOIeptXbTJ/Z0LEkNrCGjFsK3d4Yk5qE8AdnNy7w=; b=BcS6hDiN7zy17w
	4Rbez64FsvkQNz/q4S8FRL0+iqJwqlc/NgNfOHwqTDtJPi/tqOoc0OUPnA7Edivm45D4C6ssjSgR1
	01JSfnTsdgNrbiVJkhY2wJhGwx7O+RpIr8NBqDTkKiO8/dycl8AarMYez5Kps0zaXLqm0VrLXrjbP
	O42tDSGqTVaDj/dVkBjevrwukPARhwCx2n0iqB4lH+2KLV0tCJSVkWn9LbkXqDe61A6wNIQtmKRBt
	rZuqI+Xq6LRqgiMYBBN5pWraAkfpKIz7yAhjn75opQW6sSMrOHngKQc7mzg/4u4qCybS5W6KWGQga
	Nrw4KOzDuSEZYSa4ZzGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXHv-000000088A2-0DcF;
	Thu, 01 Feb 2024 13:39:31 +0000
Received: from mail-am6eur05on20701.outbound.protection.outlook.com ([2a01:111:f403:2612::701] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWxs-00000007zX5-3shF
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 13:18:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDQV8/6iZ/+rhDmrkzygVK5ppB1ctJepABaDHtQwLmwpKT1ODHiRA5ODwDP1HbdOoryPRfCs4iiv/QQc4DXcSvYrtv3U/XG3ifL/xBkt7vX7d3A44qsQmTt4eJQ3mM2eiR0wz792UcuLoJ3lKOeOVmBLBsXgVlJPcTcBxxgEy0fzxju/XEiNR6u1T2imni52lWt4KGsMA08gS1btZxTaBp6LH0RqTY4+TMC+wxP/5zQVPhMyrh4aeJ0N8oItBwkIWfPd94jIvlarrUx4q/ZBR09rley/9Wz8pOPTNrP0mcu+o2qHVUqGjg11V+JAAli9SU31wST00bXZX5XH/LRKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEE1Q44IuerTAix98C68lkBVz054z7wXlAMnf+3bW8g=;
 b=NjRHgde4xLT8hmAy4f/wm47CBLvXhFPiaaJu7iQPEQyGZc5FRcDrp2ZUheg5hJ6Ue48qCEeF1gjQnl9IdAfhiid7aw0IxcCSvW2vuGBVtrWxOQT4X7RV/ciGYF49xt67uOtCm6e12UBReKvKOEIFfXE5eJi6sgXRulDnCT18QbLk8pZHJr6q1I4kORoWS7q6Nxnp2DtaJetC4ELfFgXOa4BdSTkM44bqO5qMnGN8HHzNDAH5mRq7508pyuJ4aeL3K9EjWS0VW9r1zV0McBkHTDfiat+vDS6Qt2USGorV6GfV40PDMqEnXVNi3LbLLcAXK5MmTV9F3U28pBQcQagKeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEE1Q44IuerTAix98C68lkBVz054z7wXlAMnf+3bW8g=;
 b=DNA0fAmcNdlw2UUDbrA2qcNAPFSyk1I4Ke2+HIYoQvpttR6voOveA5xRL6fRhewC9Z43Z/sm5AH23rdzFhFaAB6ybQPmWJ0cMAYlrJfZ7EsZHp/iSP63JX1gOJoxshSH9RXtRO0ZXJGRDlvXeVSShEHe2mS11r74TJkvnxPuJ7s=
Received: from DU2PR04CA0046.eurprd04.prod.outlook.com (2603:10a6:10:234::21)
 by DU2PR01MB8608.eurprd01.prod.exchangelabs.com (2603:10a6:10:2f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.27; Thu, 1 Feb
 2024 13:18:40 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::29) by DU2PR04CA0046.outlook.office365.com
 (2603:10a6:10:234::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26 via Frontend
 Transport; Thu, 1 Feb 2024 13:18:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Thu, 1 Feb 2024 13:18:39 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 1 Feb 2024 14:18:38 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 0/1] mtd: spi-nor: everspin: add em004lxb entry
Date: Thu,  1 Feb 2024 14:17:09 +0100
Message-Id: <20240201131710.797505-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-OriginalArrivalTime: 01 Feb 2024 13:18:38.0573 (UTC) FILETIME=[2B09F9D0:01DA5511]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B99:EE_|DU2PR01MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 78dacf3b-1fb6-4680-61dd-08dc23284e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ruYp29VT3NvOpcb+4TxVsi5hEjkedGwMI/Z02g1anfVfKug/ZcSGK3O7BhQaZMdd0NVuLSbRL+nkFejvmhRfqDhAP+UNgw0nNPiCfggltHyqqbijvTz0qFgVpwc/aT9jyquVEnQsQbyXixUfhZ3v5Kvd2wVtZ8J7DieR6FQeYOF24091cR4st268gaHV33nFdr/IJNqQWw+t/1FFV+qRdaQtLoIIeELZ+nMJDKf15qzv2X8oO+/efQV/MTq9S6iZfezm4cKozdNYYGjhjDO9CK6OyvH0lNfd7tcCL0kvt2WXIU7XfaJ6Hy1XKSXu6w6T3ccHtADJmJUiVmU/3DSlIsKRl8w7dOL6GmYD4sg2PNv1tszRw4pwDCrsaqBkwpsMT8i5tGICjOWQyTVMn0ahMz50WIOHrip33l/XWrLhusXdwa7DtW/xgq7yz4haur+1cv8bHuCHa6D3Fma9CvLhy1QiLowjH8KGXVRcex3K8Cs3ynDM61gS1rG/cweHEcJMc+oQBE5hrS4pC1OKMjUZLadVuJ902kpI8khFjfbbtwyUPn0ERiTIp0looW63cy2fBYwtY9Zz0KtbZ0hPAznyYpRgBtHdXP/kjOPWMG3p1L4MPqypj8leZIPejEMpsYI6EX7QdcKxIyIzLdiMIGmvX+7ZEKi4brZnqUGDHf9iaAJyFUoO9/+UxIQpx87SHwVgzuWQTRGhrndFGMXzyaz0JiTKNkqDuhp1jNHf1hXl/pM=
X-Forefront-Antispam-Report: CIP:151.1.184.193;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:asas054.asem.intra;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(39840400004)(136003)(396003)(376002)(346002)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(46966006)(36840700001)(40480700001)(83380400001)(41300700001)(86362001)(36756003)(81166007)(356005)(36860700001)(47076005)(1076003)(107886003)(2616005)(26005)(336012)(110136005)(2906002)(4744005)(966005)(478600001)(70586007)(70206006)(316002)(6666004)(4326008)(5660300002)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 13:18:39.2023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78dacf3b-1fb6-4680-61dd-08dc23284e02
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2;Ip=[151.1.184.193];Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8608
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_051849_041224_EB22E923 
X-CRM114-Status: UNSURE (   5.84  )
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

Add the Everspin EM0004LXB 4Mb (512KB) Industrial STT-MRAM Persistent
Memory.
This device is JEDEC compatible (JESD251 and JESD251-1), but it is not able
to provide SFDP information.

Link: https://www.everspin.com/file/158244/download

I currently use this MRAM on one of our i.MX8MP boards.

Flavio Suligoi (1):
  mtd: spi-nor: everspin: add em004lxb entry

 drivers/mtd/spi-nor/everspin.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
