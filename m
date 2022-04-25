Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C830C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Apr 2022 14:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=40IL4ZglPep8+xgCLYIrY4iT7wvI4+e1qDURVQsfcPc=; b=i4igf096WpaDuD
	KViV7BDZRu1uE7SFp1wpLEMWgmJFQ/3RgBETxsAY7eM0OGuvZtckcwisSVqzLUng6M2U91UkqyqRj
	eggDYf0bmxx8gqiRBmIikEYZdWPu5Phuyf3oYt4nAYYlMHMCVcWnAKKBN/2XyxsjFHz83xoRnjlmg
	j+cG1SbhJ4xstSJWWWxZiwNRUNLPlSlq6AIp8tUuOY+gCG5bNEUAYXGlaLb1Vc45KJjk/OMSs6PLr
	UGpKncpfZfMuCnDcQFDd89oPhEa7Yob6r8pUYnR1ncakGNMlqmVmpgP7CR5M5KJm1FGfGy5/FhWaU
	Qb9Wr42yQbSi6cfTpHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nizVe-009s9A-Ht; Mon, 25 Apr 2022 14:16:14 +0000
Received: from mail-he1eur02on0725.outbound.protection.outlook.com
 ([2a01:111:f400:fe05::725]
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nizVb-009s6V-Uc
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2022 14:16:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DI5ozrbt2LUpTxkiUh/5SZZyPYYiwrF0iyUkjuI6fd8mL5qdElwlF6G2IVj+gXQFz6qM9D7MFinuyOvM4hdsWxRobuQOUw1xz75gH4XNdnsxdt8iXn/4sN5MNygvtAUgB2MKWBfSqt9tvGEler2S1P4WAcjeoviQQ+GbiY8wTraE6FR6KGJ1Ym96dVmajbDMisf8UeWl56AZQhubXoZJhGnPJXly+7l6kRqcPHMIVTbNOyWtsaccgTt7TEqA/KR5Ls1WUTgGScu5ThDARmHvv0Xng0RUPyfFCI3diRKEmhuM6RQSGxN9QceDUFT2THlAnIFcan8xRuKr0ZEUfH2lZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVvpy7ABiEf76RSt2MzzGqWCQzTyEtIPOXFfMljF4aI=;
 b=QVRmISiwBGvmMpgKePrRUMlprmT16YqOslYyF4ZB1/s+7Iz29Moj6WHTg+QsoG4MB9jsTG695Oqj5k2SHq6o44wbryrLySaiJcSuiZOesv6TG3Bzr0hdLjrunJrqe+o8Y1vJWp3HrtSs7g2h1Gh9MBsfGqd5pvEzvvmfRXF2REoV/me81z/IoANU7iqeYG8L+FTCESOzgKim0k08NaUapyKlLGHqLmG8xb7KSQrrxy7mJT069lUOh3NuB7tHsoRRkA2Ev3I5mayAqfBZwwZ+j/zYbfYuyBtHggFlEr3OzyAdCcKKxNs3tzyDeDsljuD0vv5A3Wz3mynhxRLy3Mgsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVvpy7ABiEf76RSt2MzzGqWCQzTyEtIPOXFfMljF4aI=;
 b=Kh/qrg4r4HOVE6PI60kmWYwHJmL92VH9jzsZWHacWjwpgRST4pHeYYZzu8VWFn6Uew+Odfv/xZ9kKpyDmUrVQllpZZsUubiShHigrtUvjhOM9qY/HG1yQQy+hzsVUzEdblVNVbMv7C2KKNTZL7tYlNV0rb9V73XR+BIA2fbhHa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PAXPR07MB7727.eurprd07.prod.outlook.com (2603:10a6:102:135::8)
 by AM0PR07MB5379.eurprd07.prod.outlook.com (2603:10a6:208:10b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.6; Mon, 25 Apr
 2022 14:00:28 +0000
Received: from PAXPR07MB7727.eurprd07.prod.outlook.com
 ([fe80::44e1:e6d4:8a00:60ee]) by PAXPR07MB7727.eurprd07.prod.outlook.com
 ([fe80::44e1:e6d4:8a00:60ee%4]) with mapi id 15.20.5206.012; Mon, 25 Apr 2022
 14:00:27 +0000
From: Pascal Fabreges <pascal.fabreges@nokia.com>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 wladislav.wiebe@nokia.com, alexander.sverdlin@nokia.com,
 agathe.porte@nokia.com, matthias.robert@nokia.com
Subject: [PATCH] spi-nor: fix spi_nor_probe
Date: Mon, 25 Apr 2022 13:58:05 +0000
Message-Id: <20220425135805.32-1-pascal.fabreges@nokia.com>
X-Mailer: git-send-email 2.34.2
X-ClientProxiedBy: HE1PR02CA0102.eurprd02.prod.outlook.com
 (2603:10a6:7:29::31) To PAXPR07MB7727.eurprd07.prod.outlook.com
 (2603:10a6:102:135::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d178081-ec54-4bba-7e0c-08da26c3f3d7
X-MS-TrafficTypeDiagnostic: AM0PR07MB5379:EE_
X-Microsoft-Antispam-PRVS: <AM0PR07MB53792F12131C9A9563CB82C9F6F89@AM0PR07MB5379.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zcA4Q8dloConYdwgmrvSn5yfcfuxAWAfIybzBtXHDwSudm5y1E+iklQh5+1AlybQlNCfTZU31yLJ9KOGn0c7pr2ai+I3N5/0lUAselmNO6XPJQrGtNbG2gc54p3xSyUTdivDOGobU2m1jNDCKumBgv98CWOXqgMuX2ZHlRy8UUfE4iAfP7Q/hVX1LnQhZkxEX2tJpi5BVbi7CuQKKjbBFUMD/RI4bsvOGQg7HhJepj/0EQZOUHUAwK+hbIp7ybrXy/0X7uZN65/e0At0hSm4/IId6y4p6BaaZpCS2rar4RLcPaDdksTb06FC1HZEPNpNOm0JynR+uy/bBQG5cuWGL0dcbOUKs8AkWSmE4O5RV/ofCdbMxYKGYnk5Ii494cb0VRAciTAHrOAV9QOUM2nxz5m2tlJbmvIpvJr5p90sfmicfV7G/Qprru+XhSSFaYDQ4fjFZtQQzLaPPZdA+7yYGWxjkGFEjNBwcgOXfqksnswUaV97VcZNcTTiSweyulD/18QNRdzGcfT2JO6XdQQmJbbkinM8B8e4WWKfewruiztcdKe7rVm+yZ0NO7roL/1A98AIsbUWSXgXzlNUy7MAme4rJMQHQILQZsreILxczOoajZ1UhL9FSi6nSOse76ZiV+CI0yaGf190YTe/SY0hSCp7kpYUWThMwGyluyxxJHRSfvHm+eNRfcOAQPNsx8u/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR07MB7727.eurprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(36756003)(66946007)(38100700002)(5660300002)(82960400001)(54906003)(316002)(6916009)(6486002)(508600001)(8676002)(86362001)(26005)(6506007)(6512007)(6666004)(8936002)(44832011)(66476007)(66556008)(4326008)(2616005)(186003)(107886003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CAKCaE6MJ1ZWk6maqAFLeYf78t4aiiTLL3BEUzCK9esX8jM2qEGvXuSMRPLN?=
 =?us-ascii?Q?San9iJnIWWoEi+Ptmn9tiUh/LPu+u0pF4FJ9amV7tBn7MisDOFEW+4cYSFVZ?=
 =?us-ascii?Q?QCRvy0q1n19wJcaqjsMnj4B9+LUxAkWEC65CL0212ChFm76leHpQUD9x52tG?=
 =?us-ascii?Q?IEvkqzMLNnukNEGEkyAFnCwk3mHGbfoJWsabKlFYEpsyDcnzn6/z/4xApKKS?=
 =?us-ascii?Q?YB1hKy1JPvJo7eRLwBF+c8YEilmkJVgDJgtx1tRQ2gvwTaSlXgzTprVDYyy2?=
 =?us-ascii?Q?zs68Hdyi636VqYOjnbE94AvXKNn+cF7PNT5ftp0abrB7lfoGOwpEHoreSPj1?=
 =?us-ascii?Q?S5IwM6IKQk6YXG/PDcm7hzDK+G1Wxv3jQoZrY/NIgSClAJ9DOmAjOC1AMs4Z?=
 =?us-ascii?Q?gGO79qsNcEq+KSZs9Hir2vplq/qJfv0ghWE8hH3sPTsghpsHuH/4L3ulDmZN?=
 =?us-ascii?Q?YFy6uuDkPqGlizFY0PcOd/KiMqzE6dKHjiHM2KUPvQsxHA2QaC94qxNJSU7G?=
 =?us-ascii?Q?Qz4vQnPe0U75jlP1VlMTMaqdmljjnTZuMGsh8J4ZbPaJNnVjhMz8stRlphUl?=
 =?us-ascii?Q?Q4Afcfeg82dDetnVMm6yZdEBQmPnMfoWe8DhaPAw9rb05XNA6IC4AMzhNE1m?=
 =?us-ascii?Q?SPNmliBysXhxLxo84cv0kjU/3bOjWJk7WE4AxNkhkcFtMC37ObzWd1ZOaq6I?=
 =?us-ascii?Q?851Pk7cxUnKBjtBpk5Q8EmA7cZi0JN1ihm20aYgdzayAUaFgqgYUhcJ561dD?=
 =?us-ascii?Q?+WihKmx+hiK/WkqmSXrXY0kV80lOuplSXHB896cZM4mDwaJ1rujCf/OEnuHH?=
 =?us-ascii?Q?iAxLckuylho6HYUvr/QulEgFC+sn+dXM36xKJdNJamdy5eDbi6OCMymz58/l?=
 =?us-ascii?Q?E5h4XDFQ8rKsdTv1VohnO8O8GjQ7YI1KCuyqBQvAfBd8OQwW/HW2eUMMdGBn?=
 =?us-ascii?Q?f6aeN834tJJaZMRZbrhlSnBelEGMwXvK5iAnE4KRnpDl0mA7V2aNFKN28ptq?=
 =?us-ascii?Q?hxjGqyDRkM9zIHsQagJF0n45U7kSvtSsfvMyYnojWEAoH3aLI1Sa2SwSfo5D?=
 =?us-ascii?Q?vWP5jI2ogdRdptZqy2eIUoL4/OAamE7kE+38EzUefvCO23U4dyiN/zjFXdqP?=
 =?us-ascii?Q?dUf88fXLxmkviLQ8UiWbGYfTovuz7V7Ho234gKoB6Vpe2j5c81YJR3Y5NA8J?=
 =?us-ascii?Q?P8J4UMzG84DH5bGhsTDmHR+3jMugZTj0DAAkt8RmI9SdHgW1+onKmBI8djLO?=
 =?us-ascii?Q?+MnJENIL61XCS8YJWiuI5PXzvSqo7XWZXR+H9LC9NvV59jUDOQhIYhaVjttS?=
 =?us-ascii?Q?IsY0E9MFRH1w/kW0eudRODOArSo0aibkQKS2J89asM506sWXqmcIJqzlcIz3?=
 =?us-ascii?Q?PwDnsmyvd3MltN2Alnk6v88XVv7BjHUKu+mb725Sty2hyMuTMLOXbOCn+v4t?=
 =?us-ascii?Q?lORteiZn9SzXXdsBgMvCX5+rC4SvMwPXCysuke8YgHnhJcTEbh3q/rbwjKVI?=
 =?us-ascii?Q?n47zw+PrYN9Do50LKiFjWCEjKL9/VS4VuAuUFCwAUDJ9KDjsSmM/QCR3OIT8?=
 =?us-ascii?Q?YdZGDIz4kX2kFifoy5BYmkSSPy+/zPUgCFL+EDqNKfpHwTbTAhZo/wOMIkob?=
 =?us-ascii?Q?ccGF2sglmyjbT221eHORDwXxEJRlWAVvRJmAgYVK1jfWaAFGvAsOyLAJkDh9?=
 =?us-ascii?Q?SgFTdKSv2XFdJMKxG5HVS8ctwiEt69jH1ep6UQkIxDPg/osL3L3sVLm9lWoJ?=
 =?us-ascii?Q?XITGP/Luec06kqjfwNeBRN6DagpzFec=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d178081-ec54-4bba-7e0c-08da26c3f3d7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB7727.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 14:00:27.8603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gIhuF/1j7A+127RYQLyuJRWgyCHu5tXBWQTDZ7703OcwZwCkvWZPIc6GqiMr/ntUNDPHZVC2DUrPi0ahdSLIak154DUbL5F09MDJkwTXC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB5379
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_071612_046481_5B529147 
X-CRM114-Status: UNSURE (   9.62  )
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

In rare cases, 7 on 5000 power off/on, the spi-nor driver is probed
too soon.
The controller is not in "running" mode.

The spi-nor driver take the hand before the end of the
spi_start_queue procedure which set the running mode to true after
the spi_init_queue (Initialize and start queue).

kernel: spi_master spi0: spi_init_queue: ctlr->running = false
kernel: device: 'spi0.1': device_add
kernel: bus: 'spi': add device spi0.1
kernel: bus: 'spi': driver_probe_device: matched device spi0.1 with driver spi-nor
kernel: bus: 'spi': really_probe: probing driver spi-nor with device spi0.1
kernel: spi-nor spi0.1: no pinctrl handle
kernel: spi-nor spi0.1: spi_nor_probe: Caller name: really_probe+0x2b3/0x3e0
kernel: spi-nor spi0.1: spi_nor_probe: Call spi_nor_scan
kernel: spi_master spi0: spi_mem_exec_op: Caller name: spi_nor_read_id+0x89/0x190
kernel: spi-nor spi0.1: spi_sync: Caller name: spi_mem_exec_op+0x2f5/0x460
kernel: spi-nor spi0.1: __spi_sync:  call __spi_queued_transfer
kernel: spi-nor spi0.1: __spi_queued_transfer: return -ESHUTDOWN
kernel: spi-nor spi0.1: error -108 reading JEDEC ID  00 00 00 00 00 00
kernel: spi-nor: probe of spi0.1 failed with error -108

Signed-off-by: Pascal Fabreges <pascal.fabreges@nokia.com>
---
 drivers/mtd/spi-nor/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e6b8b19a68ee..dd82f42c29db 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3618,6 +3618,9 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	char *flash_name;
 	int ret;
 
+	if (!spi->controller->running)
+		return -EPROBE_DEFER;
+
 	nor = devm_kzalloc(&spi->dev, sizeof(*nor), GFP_KERNEL);
 	if (!nor)
 		return -ENOMEM;
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
