Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8BDC3DA42
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qWcpPoJae1YD2dZ3hcR3o7a46EKyisyURnEmbhpQeXI=; b=5Af9yZ9dE1B6ru
	R+BdzSX4Zk+cpUHAjK+N1zws8GPAHBzXG41ZU/hFEzaXGIgF1gc0ea2T6eQzGaicWU+JJCfRUikGW
	zO6DnglV+fEDbEg7cEBR85t0vH2xbTOt5MNwSagYCsShHSgcakEML34ERdIoJTVpoz5vYDV9TkVAt
	XLzGA7YPR0EG+VAxx87zUkXz01Ya4z+MIzzpyHrPfL5K9ahzVjh5SkSHogpGKZFwieXDDowIWHcoo
	WXpuX+95jX8SiogkViS5hyiAG6SOvICR9JyBHYfi7VHZB0b4wt32/mvlshoypKZ2hLacozpiYGRUW
	359xqyLxhDOfI944JVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRVVs-0000000AMqR-1wli;
	Wed, 10 Jul 2024 11:29:32 +0000
Received: from mail-dbaeur03on20601.outbound.protection.outlook.com ([2a01:111:f403:260d::601] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRVVp-0000000AMov-3CUn
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 11:29:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjrPM0IbuqueygCs63gNgRl6CTJJQ57lCvXrBK7OQJJrq0dRDOvcqJ3Gxd5JrMtPj4XkpkD/cMfQweQ57p7hCeXfFBieQEdVfpIeDkS86D+4G8w1ww4fxrALOz3yZ4mLheroDl9e9gr7mtynqL3t5KxOaFpdSgOi3/YJxyILg4Rayt75Ns7vd0BaE1iAXPPsdtv5Xc9aFm5Lm9J96D5yWh3clSn9x+1MU01IDVgQJr9+SPAQ6XM4sEwFPUsobYPXS3jHO8h6HNIx2gasxkaWs74Rc5KK6LzzxM38TG+kSlyknKqkHxdHU+iLDSwVh8p55rJMoJk/0lQMOgiyHUhxvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fic66NmZNs4XchpNRfhWoEWI1AYOJfaEnSylgd8YxBs=;
 b=Sxeqwzx1Qsv7bzBH8rWzvbMhLiYBiKifaHL3zs88ty9+HO82oi000bQGfyibeOuuIU+nNkYe+pQsjhm2sLKzFbdTbrSWXyANSkNhUizrp4PGqk+4yvtvbDmWIA1NzXLXkz16bmxGwh+FW9rYQaE5fuAN4Ji44qrcZy/jhsgyjHdfsMTAUvONGCjrlfyr6t/U7spkqeRY0lluIK8iVtRATI+HrC6/lHD9/7Gq4gARmGUuuxlY/iClacuiDsQXViOvigUq26vy32Tjv6lui3rz12zt2B1If+RL8nPovuFlK+eKEn4LC5fIuc47+23k5QBN9uboOjCz3bFkK8YJEL02aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fic66NmZNs4XchpNRfhWoEWI1AYOJfaEnSylgd8YxBs=;
 b=s9DqVuhmJ96nAVyj1k6Tu+f1n+Mmk/YLOgjNDXSXkN5nOm0VfrNlCThpoFddgji2ChpG424E77aZtnYebtnl9xv0T8AUlLN/IM4jZizv5w9gmN/pTV9+2usHdw6E2BXzhhRkjeXHxQ5YDouZPkxlUMVBe0WWeSLAhJ+hikXSVqs=
Received: from DB7PR05CA0065.eurprd05.prod.outlook.com (2603:10a6:10:2e::42)
 by AS8PR07MB7704.eurprd07.prod.outlook.com (2603:10a6:20b:25b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 11:29:14 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:2e:cafe::fd) by DB7PR05CA0065.outlook.office365.com
 (2603:10a6:10:2e::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35 via Frontend
 Transport; Wed, 10 Jul 2024 11:29:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Wed, 10 Jul 2024 11:29:14 +0000
Received: from N9W6SW14.arri.de (10.30.4.252) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 10 Jul
 2024 13:29:13 +0200
From: Christian Eggers <ceggers@arri.de>
To: <linux-mtd@lists.infradead.org>
CC: <stefano.babic@swupdate.org>, Christian Eggers <ceggers@arri.de>
Subject: [PATCH] libubi: ubi_update_start: slightly improve documentation
Date: Wed, 10 Jul 2024 13:29:04 +0200
Message-ID: <20240710112904.15172-1-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.30.4.252]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|AS8PR07MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 09920901-a3ca-4a67-4c28-08dca0d38710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PESut/BZzYcOPpHq/TepkVdy9DQTKZ3p5o7YV0MjZrSDoqsK5RDbZjXj9cpN?=
 =?us-ascii?Q?IeURvAAKBRp6m8+Opbk+eec4QELAF4p3fYOnt+oByw3UAlsEAREj1PfLU/St?=
 =?us-ascii?Q?wcjTBG43Ns6RwyCyhnYYCUtGhBtgzbEiNvmYAsSZnpJvd+4LgKI33/hLG6j6?=
 =?us-ascii?Q?fE8KWSB2htTwZ2mgVcsqfDBDAbagtKTr/5hD27fS8D3Ve52riKKX33Zj5mBU?=
 =?us-ascii?Q?won/l3hYXtYyEZvS596DTrNS77FixZuncu3gMMQa15IEgJf7SIScfIO8upBz?=
 =?us-ascii?Q?Buc4tlBJDflfA5Ce84e+qv+sQEJHal1QstG+hCUDI2d0afK3dUSIMTcOCPUA?=
 =?us-ascii?Q?hwgm2tzqdfo0qUZdazGQrb/Kfz+8vWgBFwkpjYaP/RvDCLvUyXg+PYAdqSJE?=
 =?us-ascii?Q?YoC+OsAUByOKT4hBz2uth6sjt3hZt9E3jhjjpjeshl5FBb0+gdTKKmIXqPdW?=
 =?us-ascii?Q?/uApAr5uY1zGW9aOWLPCYPon7B4J7N1BjPOUByVkc7lq8DsrAORG1SO722Wx?=
 =?us-ascii?Q?HkvRbUufTt/IV7sN05oJDH73eq0/Pi4z+XqOHkhCwhSPHZILpV/HNHDEUElL?=
 =?us-ascii?Q?IKYtxDAH4b6n/eAlNMptKW3s3pBFdcezqTPLPHrPV3oIC4xZsnCLvsvNZZ5u?=
 =?us-ascii?Q?5qS2g4s7XWThwTFWmp6gB1ucPmIpzviq21ou9yykYWnbFQTg4ruhAA3cmim0?=
 =?us-ascii?Q?xmfCKmZuImSh5PA8ZCLcDfX0xd8W+TpzSgaG2qQ2NNoDXvNzAvZPBIFtOUSp?=
 =?us-ascii?Q?E8xz76e/Zsa9i5ID/WgoalzL+9qj0DVXr4n/4gSFSZs9KMaCIUGKOhHIzE5T?=
 =?us-ascii?Q?CFbWJjx+RNIW3mA9Omih56/SZlhcKiNAGgO/ziE7qOq2YBWzmwKu+u9HDI/B?=
 =?us-ascii?Q?IrLG8iuF6kbCpkp6yuT/Do440GOSmOKZZRs2fX2YekM4ncVElyTr0Zo/426D?=
 =?us-ascii?Q?+r/MtVrmdZ/gV8iNMDurcoBQFkzo9IPnI2V1v6lVSnZ/btr3IVQL6TniyNDo?=
 =?us-ascii?Q?3jIK1A3t+EJYQms1BtsM4em6Cw+RLME4ooZi93nbp2ewUHyyD/eLiO/utJ7U?=
 =?us-ascii?Q?rzpDAIlxB3GmXcFh9VLmMyBx3QOwQ9F4RILRXFWJCAuYa7UUCi2iTXWgz1kx?=
 =?us-ascii?Q?zn+f5Z9h3THQaXrwQ3E5EsA59/TpC9MUnYL6dYr2hkrLViX32vtgld6od9Ym?=
 =?us-ascii?Q?nwY3V6jx5VaOlr4UOFqYh1dWCPV3oK1JH3G1FceiF4YsAXgUxJnqtri4+Z1x?=
 =?us-ascii?Q?r/Y8pID+0wCPji1lSpH+1ktgY9wQcVTro1VII61RsTyKPF0ZzNNPc2IjtlN/?=
 =?us-ascii?Q?hy4jv9K5LeR5sRL864B+wF2s2FCH2tHnY464skf4nr3bueZd9yZSK2XAHf1r?=
 =?us-ascii?Q?SFx8GWUloGX374KOPqDLmwZlm5nZ?=
X-Forefront-Antispam-Report: CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 11:29:14.3522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09920901-a3ca-4a67-4c28-08dca0d38710
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_042930_026733_C586C05C 
X-CRM114-Status: GOOD (  12.09  )
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

Calling ubi_update_start() may fail if exclusive access to the UBI
volume cannot be established by the kernel. This is likely to happen if
an UBI volume is updated directly after creation, because current
versions of (systemd-)udevd run their internal 'blkid' also for UBI
volumes as soon as they appear (trying to read the UBIFS UUID).

There are mainly to options for this case:
1. Don't allow udevd to read UBI volumes at all (means loosing
functionatlity)
2. Wait until udevd has finished accessing a new volume (requires
cooperation with udevd)
3. Simply retry after short time in case of EBUSY

For using option 3, the documentation should state that the concrete
error code can be read via errno (this has always been the case since
libubi has been introduced).

Link: https://groups.google.com/g/swupdate/c/8NVooKjD9oo
Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 include/libubi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/libubi.h b/include/libubi.h
index e1e234e1b01b..9cb5037bb92a 100644
--- a/include/libubi.h
+++ b/include/libubi.h
@@ -431,8 +431,8 @@ int ubi_vol_block_remove(int fd);
  * @bytes: how many bytes will be written to the volume
  *
  * This function initiates UBI volume update and returns %0 in case of success
- * and %-1 in case of error. The caller is assumed to write @bytes data to the
- * volume @fd afterward.
+ * and %-1 in case of error (errno is set). The caller is assumed to write
+ * @bytes data to the volume @fd afterward.
  */
 int ubi_update_start(libubi_t desc, int fd, long long bytes);
 
-- 
2.44.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
