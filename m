Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D361B606A31B
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 03:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T0Cbko9F;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=fVezlEhH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phKvA93J+VOqV3R/Guk1P7fU4YUAKo7cubfvwZuOBig=; b=T0Cbko9F0kVuKn
	9clnjFefMFxJKWXRgYIJ/N6+Ff1kgLaK5iZb7NDHQCntrWCivvTToFJf9AqYg0IishCRgRtFeenEj
	30tklBmElOaIAsqVzB+PH8KMBs87jrnBeS16xNYzFNtQPZq6bPNpBp9bKYi7B/1yWDWgeCH2EKfjm
	8aW5tFeKSSck06G6L5HEfKYN2eELcOiB11b21JFilE3emFTUQWSx/10J145paylYbwMPrgLSYbJG6
	bUgM4qbCOpNzcHm1Ea7yC2zbfuwz2DCix69IBrEIwCkVOhuVkTjh1SEnX9Lu8zyJBh38u1v8UIiyb
	nCf3BTfj7ZEBjULA36zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJjsZ-0000000DIme-3xmM;
	Thu, 22 Oct 2026 03:54:11 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJjsY-0000000DIlp-1O7w
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 03:54:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgueQPXqdY6txfkYYzQXdW4gAvSkuwwffJSLbs0bu+AboY9U7DidzYmnyQfFe3+NdNZpt5JGqxz1+/qStYSR7K6o899TK7/v2nZhMgAPIPfyLlMzML8Re0Gm2Zhphl//RuxmSxpoPkjaNjxq7JXKhMpI0FdZ2js/zxZsqDYs8bTMgX4R3U8NWf0X9p09Y9f0D0P64HDnOesqLTTzDfLYiUOwSudiOOSsM2eWNkpK0rZUuKyi7vgCsG9XLpA3GbcbiONpuE83YuVhAEnHLC5rD2vJUBjHB0Zyi/DBQ0ZnTUVXJBIZ99i8+sg9enbB6pxBmMajaQW/QQuMSdPJg44j+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlyokFrP2wJWN95QBQH4mJN3N8dZvk6qPkmvmJm0YXs=;
 b=xSsShzdba8x9uxemk5jBbB1BFMwERCBXNqgnirrNo8fmSzJw9F0/wVpVHWI0/HIpBrrXBCr86IwuoArRiNf0GOcQsu64afApgnm7jzOuhCGTusEAGRLo3HxkZ94gxDKP427C3B+bPA4KWNnEx/KpeemmN6B7bXJPN99C7RP+ZG7WgAO8ViMPNFxy+PWQY2xHJTkmgdtLh2xBDBtELGDQ4CryIEFTKDww7rp1pYCMvjQ1dLpDYHfJNzT0t9HtVqDP963w/q5hbSOQOmjybotTZDzFo7lL374qng4VN/Ek7gMs66F46lKCyM3amriudwuVO0YrZfceAME43iEpA5+DlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlyokFrP2wJWN95QBQH4mJN3N8dZvk6qPkmvmJm0YXs=;
 b=fVezlEhH66WohSIdY71PlHmaXC4CluCrdDz25UY/kDV4U/i1upMZLmNy4MPBqZMl0/FqijjWSf11TS+YNd+buivBCmO3985Dj1jbi50OiZPmgDMkTK21P3o2KjiIbPKOktbUQgvYDXNsqYutNaQyGyIZb7W/G8prcYisqP3TskRDuzzN2ZGD63CvVG0fWCgrcdBnJCC7cBzuvaFyvO0vTxprjOIJ3uDiayysi0ChX8aa2GM6JWQJ2Y6azGaKvbaQ2RMIGdrl6/zq7d1ECB+IQ5LDnyr+d5zQwDwdxTthqAuwQxhXJVqAmLxi+x7TVVJZ0s507oVk/ZpvPIZfA/CGMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by MW5PR03MB6930.namprd03.prod.outlook.com (2603:10b6:303:1cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 03:54:03 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 03:54:03 +0000
From: tze.yee.ng@altera.com
To: linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3 2/2] mtd: spi-nor: fix use-after-free on unbind with open handles
Date: Thu, 22 Oct 2026 11:53:52 +0800
Message-ID: <20261022035352.52129-3-tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261022035352.52129-1-tze.yee.ng@altera.com>
References: <20261022035352.52129-1-tze.yee.ng@altera.com>
X-ClientProxiedBy: SJ0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::6) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|MW5PR03MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: fa80e762-2ae8-4985-dea1-08df2ff01cae
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|261021123027099003|261009223027099003|56012099006|11063799006|18002099003|10067099003|22082099003|6133799003|55112099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: GaVGouNdX1QOwxfWIcQBCJJr77cyd+KtoR9EobhC7CoudKA6XGoCLalF1VsWcHOpCSaMarwufb3ryOXeLsSuNnSw1NR0qrQ8jtl9Ah6d9ZiEp4CEdth6hGsQjiMRc7/+ZgNhkqDZZtvvuV/3MID6tJY23fCkrWTRBFn3PQDHgrUe/MDpI9wJwhOo62NO4Furn31XV5vE/dCF8rGIwEP+aDGjReITQTZeuIHj1VagLnRBIl2c518Ai9idBEEbvLAIqAenBN/U2IUb5LB2RDVTaXIuQrnpwlfPG+ZafCojAKHyjPjchVr+NQofA5iwNYlw6WxBBMyXBiToJwW2TJbJs7ktz1ze8REO0ROlikzvngBJmITY5HeAzg1Oe9lu867vSMeJ5ptzP9GY5XhakcyiHL/1iIXlWa2hnJ2vHoPGTVdYaB1OHOtHfh5MwsSXaKCE743DNQ45Os7WMe5Ybsnlg+Lvr1OFhUmUcxQ27yuwxyYrotlQqYFZNgRoII0DlbsppUrBvlEwrU/pN6nsYOqbsX1wOZ8NVxxJGI3EZ2yyzvOeYUPpIzMkLfyUXV3ueYrck8F0Ltzuj8Atl/472UTyVgAZ9HhN8ol+G0/l5hHONMLKxNaR7uwUWBO/jL6VrxcsLIGm/OGdTp7lSnIaCRvgycy6vb+kMrwrOGNVyTxf/ZA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261021123027099003)(261009223027099003)(56012099006)(11063799006)(18002099003)(10067099003)(22082099003)(6133799003)(55112099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VBgA8oeVV2d9D//KvtYqt0KTz2gjUWecCkPclHd98tFgzrDsTnHy7pX/7Ok4?=
 =?us-ascii?Q?lSRq4CvEvqULQWfEf6NWMD+8vw6Dgz7h06ir6oGXzoUeOZdIZybEtk6xbpCE?=
 =?us-ascii?Q?Kae1024+dOYsPp7sVsxrjbTN9xqiGh6CFF1ychFBM2sv6z7QCnZU28CXJDQS?=
 =?us-ascii?Q?lkVEZ6PSSWPljfh7ReYqRQYgknYqjB+gJe6ynpPs/xz3/nheOtW4SCDW3Bbw?=
 =?us-ascii?Q?SxX9k5tO+muMLlcHK4J7WoOZ8xuigWTm+H9LmFCcmKBEhFhR24oodiGP07mu?=
 =?us-ascii?Q?mltj2Mo562fyj24RFvVZmnyeQ1d9LKJ/LY661kr5CIpVIk0zTABmVwH8P9PJ?=
 =?us-ascii?Q?IYNg7SjpsHam6jL287ghjDTxXh1aghxx1nFJuZfMAdyhi39H6sJi0EGQ+o2g?=
 =?us-ascii?Q?eFb2Kt2ujYg5qg3bIqH2XmqwvNsLBSYXjEbMAEbw9YBslPtPS468IzWv1aG5?=
 =?us-ascii?Q?xM3iuphSB3ntazINyVM2zJx6mye0ttEgBWD7sLtPc3NjK0XDbct8LL0r0vpM?=
 =?us-ascii?Q?E5kPl5EhA4+E9knjLcdsjD+lURjIOaVbjiANrD/vHJcfA9+v7qejncPvk1BR?=
 =?us-ascii?Q?wb4gGbBZuYhCDmn1RozlEOYv1k4S2joEuqEWelCWiFdEWQlQMLao9NOg1mGx?=
 =?us-ascii?Q?mFOrnI/E3VjEHXZ8P7vIiRBNP32ixCIHJ/Vmg673gv89VWvCBxFI4+QZH4oZ?=
 =?us-ascii?Q?BYAQ7Ll34guoRzVDV1SG8xA88VFkoTU+nIg5iZLMZ2C5lRU//7yUA+Vp6fgu?=
 =?us-ascii?Q?lEIhvVpswNGvjtleg71iPwXY2FZw0qWC+CeBPY0bIDMcqTrV8/YkIS/0VQf7?=
 =?us-ascii?Q?7rHF+hEuFCAaf9Ik6QJXdQkVudXW3A/HqWBtdJ+WrHE5LG6SO6HkKQqj52XY?=
 =?us-ascii?Q?6A5uYDucfxk2GK6EJsjCOP683WKnJaUBWPd60D7QB1MwyLShny3w0oMN+ZSc?=
 =?us-ascii?Q?XS0lgni2YEabMvj079dA4nHskEZP36TnNx0Ad763MB/3I1s+H3xNYUkvjWC3?=
 =?us-ascii?Q?tF6uLFKlyMU3CaC5rhQFGR7gMsZMn30d4w6JtUsIE4ywvVNCdrOQjhUpjQhI?=
 =?us-ascii?Q?4/yPSXhhiYt3TmpImyKVyedt2WDds5fHvc/k/SFAafSB98fwjEBjpyweIj1T?=
 =?us-ascii?Q?dPmuHAJizX00+0olV7ggLjBzgHh6QsjqiD/VmAHGtH4Y7ogBiSrNzRutvA9p?=
 =?us-ascii?Q?7yJQc8IpmTvjSHxJZLW/1/a9+x0WYNFkfL9ACw8vjEOB2j13QGCg1CaJGCP2?=
 =?us-ascii?Q?kJtPozmsYDMM7W7yPdjYnIgO0lAm8ofIOOHoBxL6/ZjmfeCBsfttRxNLB8cB?=
 =?us-ascii?Q?p0z8FUeHxmtV+Lo3Qr9jT0eywPtivrz0pFmEPdRTrqBSo/hOrC2NLv5YrBaF?=
 =?us-ascii?Q?wHHj2PnKUtLJySgNQzQjMIyyxHFZaPMUPusLDa20haDPPNRFID48Clx6U0vx?=
 =?us-ascii?Q?nNBwLfZwGEbI3OzVuYo/yBtfbNI0n3L41nwm5xzi0/yuzhZ8ZrIOLVgPNx4D?=
 =?us-ascii?Q?r/hspisvFWgZeHveuyayurjdEu+2bJMzuFRnkcihgbQHIQDlYDaRoC72AxFy?=
 =?us-ascii?Q?8VEgLachd/2BKaH7RngSas98RBSCaIFJ1dlKM8wn90xK6Liazq2bCdUJ/o2U?=
 =?us-ascii?Q?pzbjfXjms+cUGsX3/QEqSEUGEn6Ba/BC/OH6qJZpel9mFcJjJ8hhiVBtgcHj?=
 =?us-ascii?Q?AcgWKr05HBGAYURWAMRAoAF7LhuSH8undQKKDLwtyCJIwptQX7KVOofK6lx5?=
 =?us-ascii?Q?GBkvQS5+fA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa80e762-2ae8-4985-dea1-08df2ff01cae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 03:54:03.2427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9PZkRc/dvPxSiaaZdW1+wNRscKbejfBpo+MqkSONaz/qR1f5TED1X3/4zqg/ezaZjNyJLYxpkAQLsnGXRVbvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6930
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_205410_423312_830B4510 
X-CRM114-Status: GOOD (  22.98  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tze Yee Ng <tze.yee.ng@altera.com>

Unbind frees spi_nor and its buffers (devm) while /dev/mtdX may still be
open, so a later read, ioctl, close or mtdblock flush uses freed memory.

On the spi-mem probe path, allocate them with kmalloc/kzalloc and
refcount spi_nor: one reference for registration plus one per open
handle. The last put frees them.

In remove(), unregister debugfs (it reads devres data) and the MTD
device first, so mtdblock can still flush. Then set nor->removed under
the nor lock; prep_and_lock*() return -ENODEV once it is set. Cache the
controller module at probe, as ->_put_device() now runs after unbind.

Legacy controllers keep devres (nor->refcounted is unset).

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v3:
- Use a spi-nor kref again (nor->refcnt, nor->refcounted, nor->removed,
  nor->controller_module) and drop the core hooks from v2. Patch 1 is now
  only the module_put() reorder it needs.
- Re-check nor->removed under nor->lock (or the RWW exclusive section) in
  prep_and_lock*(), instead of a lockless check in the core. A check done
  before taking the lock can pass just before remove() and then operate on
  freed dirmaps.
- Cache the controller module at probe: ->_put_device() runs after unbind
  and dereferenced the freed nor->spimem and a NULL dev->driver.
- In remove(), unregister debugfs first (it reads devres data), then call
  mtd_device_unregister() before fencing, so that the mtdblock release
  notifier can still flush its dirty cache. Then set nor->removed, restore
  and drop the registration reference. The debugfs devres action is gone.
- Assign mtd->eraseregions right after allocation so the error path
  in spi_nor_set_mtd_eraseregions() doesn't leak it.
- Free through the kref on probe errors. On a failed mtd_device_register(),
  fence ops first, as a handle may already be open.
- Move the unlock_and_unprep_pe/rd() prototypes to the top of the file.

Changes in v2:
- Drop the spi-nor kref, nor->refcounted, and controller_module.
  Use mtd->_free / mtd->removed from patch 1.
- Drop the nor->removed checks in prep_and_lock*(). The core now
  fences hw ops, new openers, and suspend/resume.
- Keep eraseregions on the same lifetime as params/bouncebuf
  (plain kcalloc when mtd->_free is set).
- Free params/bouncebuf/eraseregions/nor on the probe error path.
  Unregister debugfs from _free instead of a devm action.
- Legacy controllers still use devm (no mtd->_free).
---
 drivers/mtd/spi-nor/core.c    | 173 +++++++++++++++++++++++++++-------
 drivers/mtd/spi-nor/core.h    |   2 +
 drivers/mtd/spi-nor/debugfs.c |   9 +-
 include/linux/mtd/spi-nor.h   |   9 ++
 4 files changed, 153 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b46e02..76928bd8413e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -45,6 +45,9 @@
 #define SPI_NOR_SRST_SLEEP_MIN 200
 #define SPI_NOR_SRST_SLEEP_MAX 400
 
+static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len);
+static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size_t len);
+
 /**
  * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
  *			   extension type.
@@ -1345,8 +1348,16 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 	else
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_exclusive(nor));
+	if (ret)
+		return ret;
 
-	return ret;
+	/* remove() sets @removed under the lock, so this check is race-free. */
+	if (nor->removed) {
+		spi_nor_unlock_and_unprep(nor);
+		return -ENODEV;
+	}
+
+	return 0;
 }
 
 void spi_nor_unlock_and_unprep(struct spi_nor *nor)
@@ -1416,8 +1427,15 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
 	else
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_pe(nor, start, len));
+	if (ret)
+		return ret;
 
-	return ret;
+	if (nor->removed) {
+		spi_nor_unlock_and_unprep_pe(nor, start, len);
+		return -ENODEV;
+	}
+
+	return 0;
 }
 
 static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len)
@@ -1489,8 +1507,15 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
 	else
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_rd(nor, start, len));
+	if (ret)
+		return ret;
 
-	return ret;
+	if (nor->removed) {
+		spi_nor_unlock_and_unprep_rd(nor, start, len);
+		return -ENODEV;
+	}
+
+	return 0;
 }
 
 static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size_t len)
@@ -3186,7 +3211,11 @@ static int spi_nor_init_params(struct spi_nor *nor)
 {
 	int ret;
 
-	nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params), GFP_KERNEL);
+	if (nor->refcounted)
+		nor->params = kzalloc_obj(*nor->params, GFP_KERNEL);
+	else
+		nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params),
+					   GFP_KERNEL);
 	if (!nor->params)
 		return -ENOMEM;
 
@@ -3420,20 +3449,48 @@ static void spi_nor_resume(struct mtd_info *mtd)
 		dev_err(dev, "resume() failed\n");
 }
 
-static int spi_nor_get_device(struct mtd_info *mtd)
+/* Free spi_nor and its buffers; safe on partial init. */
+static void spi_nor_free(struct spi_nor *nor)
+{
+	spi_nor_debugfs_unregister(nor);
+	kfree(nor->mtd.eraseregions);
+	kfree(nor->bouncebuf);
+	kfree(nor->params);
+	kfree(nor);
+}
+
+static void spi_nor_release(struct kref *kref)
+{
+	spi_nor_free(container_of(kref, struct spi_nor, refcnt));
+}
+
+static struct module *spi_nor_controller_owner(struct spi_nor *nor)
 {
-	struct mtd_info *master = mtd_get_master(mtd);
-	struct spi_nor *nor = mtd_to_spi_nor(master);
 	struct device *dev;
 
+	/* The controller may be gone on the last put; use the cached owner. */
+	if (nor->refcounted)
+		return nor->controller_module;
+
 	if (nor->spimem)
 		dev = nor->spimem->spi->controller->dev.parent;
 	else
 		dev = nor->dev;
 
-	if (!try_module_get(dev->driver->owner))
+	return dev->driver->owner;
+}
+
+static int spi_nor_get_device(struct mtd_info *mtd)
+{
+	struct mtd_info *master = mtd_get_master(mtd);
+	struct spi_nor *nor = mtd_to_spi_nor(master);
+
+	if (!try_module_get(spi_nor_controller_owner(nor)))
 		return -ENODEV;
 
+	if (nor->refcounted)
+		kref_get(&nor->refcnt);
+
 	return 0;
 }
 
@@ -3441,14 +3498,12 @@ static void spi_nor_put_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
 	struct spi_nor *nor = mtd_to_spi_nor(master);
-	struct device *dev;
 
-	if (nor->spimem)
-		dev = nor->spimem->spi->controller->dev.parent;
-	else
-		dev = nor->dev;
+	module_put(spi_nor_controller_owner(nor));
 
-	module_put(dev->driver->owner);
+	/* May free @nor. */
+	if (nor->refcounted)
+		kref_put(&nor->refcnt, spi_nor_release);
 }
 
 static void spi_nor_restore(struct spi_nor *nor)
@@ -3549,11 +3604,18 @@ static int spi_nor_set_mtd_eraseregions(struct spi_nor *nor)
 	struct mtd_info *mtd = &nor->mtd;
 	u32 erasesize, i;
 
-	mtd_region = devm_kcalloc(nor->dev, map->n_regions, sizeof(*mtd_region),
-				  GFP_KERNEL);
+	if (nor->refcounted)
+		mtd_region = kcalloc(map->n_regions, sizeof(*mtd_region),
+				     GFP_KERNEL);
+	else
+		mtd_region = devm_kcalloc(nor->dev, map->n_regions,
+					  sizeof(*mtd_region), GFP_KERNEL);
 	if (!mtd_region)
 		return -ENOMEM;
 
+	/* Let spi_nor_free() release it on the error path below. */
+	mtd->eraseregions = mtd_region;
+
 	for (i = 0; i < map->n_regions; i++) {
 		erasesize = spi_nor_get_region_erasesize(&region[i],
 							 map->erase_type);
@@ -3566,7 +3628,6 @@ static int spi_nor_set_mtd_eraseregions(struct spi_nor *nor)
 	}
 
 	mtd->numeraseregions = map->n_regions;
-	mtd->eraseregions = mtd_region;
 
 	return 0;
 }
@@ -3655,8 +3716,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * than 1KB) after spi_nor_scan() returns.
 	 */
 	nor->bouncebuf_size = PAGE_SIZE;
-	nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
-				      GFP_KERNEL);
+	if (nor->refcounted)
+		nor->bouncebuf = kmalloc(nor->bouncebuf_size, GFP_KERNEL);
+	else
+		nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
+					      GFP_KERNEL);
 	if (!nor->bouncebuf)
 		return -ENOMEM;
 
@@ -3770,6 +3834,24 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 	return PTR_ERR_OR_ZERO(nor->dirmap.wdesc);
 }
 
+/* Drain in-flight ops, then fence later ones with -ENODEV. */
+static void spi_nor_set_removed(struct spi_nor *nor)
+{
+	if (!spi_nor_use_parallel_locking(nor))
+		mutex_lock(&nor->lock);
+	else
+		wait_event(nor->rww.wait, spi_nor_rww_start_exclusive(nor));
+
+	nor->removed = true;
+
+	if (!spi_nor_use_parallel_locking(nor)) {
+		mutex_unlock(&nor->lock);
+	} else {
+		spi_nor_rww_end_exclusive(nor);
+		wake_up(&nor->rww.wait);
+	}
+}
+
 static int spi_nor_probe(struct spi_mem *spimem)
 {
 	struct spi_device *spi = spimem->spi;
@@ -3788,12 +3870,15 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	if (ret)
 		return ret;
 
-	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
+	nor = kzalloc_obj(*nor, GFP_KERNEL);
 	if (!nor)
 		return -ENOMEM;
 
 	nor->spimem = spimem;
 	nor->dev = dev;
+	nor->controller_module = spi->controller->dev.parent->driver->owner;
+	nor->refcounted = true;
+	kref_init(&nor->refcnt);
 	spi_nor_set_flash_node(nor, dev->of_node);
 
 	spi_mem_set_drvdata(spimem, nor);
@@ -3819,7 +3904,7 @@ static int spi_nor_probe(struct spi_mem *spimem)
 
 	ret = spi_nor_scan(nor, flash_name, &hwcaps);
 	if (ret)
-		return ret;
+		goto err_free;
 
 	spi_nor_debugfs_register(nor);
 
@@ -3830,33 +3915,57 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	 */
 	if (nor->params->page_size > PAGE_SIZE) {
 		nor->bouncebuf_size = nor->params->page_size;
-		devm_kfree(dev, nor->bouncebuf);
-		nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
-					      GFP_KERNEL);
-		if (!nor->bouncebuf)
-			return -ENOMEM;
+		kfree(nor->bouncebuf);
+		nor->bouncebuf = kmalloc(nor->bouncebuf_size, GFP_KERNEL);
+		if (!nor->bouncebuf) {
+			ret = -ENOMEM;
+			goto err_free;
+		}
 	}
 
 	ret = spi_nor_create_read_dirmap(nor);
 	if (ret)
-		return ret;
+		goto err_free;
 
 	ret = spi_nor_create_write_dirmap(nor);
 	if (ret)
-		return ret;
+		goto err_free;
 
-	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
-				   data ? data->nr_parts : 0);
+	ret = mtd_device_register(&nor->mtd, data ? data->parts : NULL,
+				  data ? data->nr_parts : 0);
+	if (ret) {
+		/* A handle may be open on a partition that was already visible. */
+		spi_nor_set_removed(nor);
+		goto err_free;
+	}
+
+	return 0;
+
+err_free:
+	spi_nor_debugfs_unregister(nor);
+	kref_put(&nor->refcnt, spi_nor_release);
+	return ret;
 }
 
 static int spi_nor_remove(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+	int ret;
+
+	/* debugfs reads devres data (nor->id, erase map) freed after remove() */
+	spi_nor_debugfs_unregister(nor);
+
+	/* Unregister first: notifiers (e.g. mtdblock) flush dirty data here. */
+	ret = mtd_device_unregister(&nor->mtd);
+
+	spi_nor_set_removed(nor);
 
 	spi_nor_restore(nor);
 
-	/* Clean up MTD stuff. */
-	return mtd_device_unregister(&nor->mtd);
+	/* Drop the registration reference; frees @nor unless handles are open. */
+	kref_put(&nor->refcnt, spi_nor_release);
+
+	return ret;
 }
 
 static void spi_nor_shutdown(struct spi_mem *spimem)
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index ba2d1a862c9d..e71b788b275c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -726,9 +726,11 @@ bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr
 
 #ifdef CONFIG_DEBUG_FS
 void spi_nor_debugfs_register(struct spi_nor *nor);
+void spi_nor_debugfs_unregister(struct spi_nor *nor);
 void spi_nor_debugfs_shutdown(void);
 #else
 static inline void spi_nor_debugfs_register(struct spi_nor *nor) {}
+static inline void spi_nor_debugfs_unregister(struct spi_nor *nor) {}
 static inline void spi_nor_debugfs_shutdown(void) {}
 #endif
 
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 288e2866daed..a0639e91cb2d 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -286,10 +286,8 @@ static int spi_nor_capabilities_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(spi_nor_capabilities);
 
-static void spi_nor_debugfs_unregister(void *data)
+void spi_nor_debugfs_unregister(struct spi_nor *nor)
 {
-	struct spi_nor *nor = data;
-
 	debugfs_remove(nor->debugfs_root);
 	nor->debugfs_root = NULL;
 }
@@ -299,15 +297,10 @@ static struct dentry *rootdir;
 void spi_nor_debugfs_register(struct spi_nor *nor)
 {
 	struct dentry *d;
-	int ret;
 
 	if (!rootdir)
 		rootdir = debugfs_create_dir(SPI_NOR_DEBUGFS_ROOT, NULL);
 
-	ret = devm_add_action(nor->dev, spi_nor_debugfs_unregister, nor);
-	if (ret)
-		return;
-
 	d = debugfs_create_dir(dev_name(nor->dev), rootdir);
 	nor->debugfs_root = d;
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 4b92494827b1..b67d720e809d 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -352,6 +352,11 @@ struct spi_nor_flash_parameter;
  * @rww.used_banks:	bitmap of the banks in use
  * @dev:		pointer to an SPI device or an SPI NOR controller device
  * @spimem:		pointer to the SPI memory device
+ * @refcnt:		registration + open handles; the last put frees @nor.
+ *			Only used when @refcounted is set.
+ * @refcounted:		@nor is not devres-managed (spi-mem probe path)
+ * @removed:		set under @lock on unbind; later operations fail
+ * @controller_module:	controller driver module, cached at probe
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
  *                      layer is not DMA-able
  * @bouncebuf_size:	size of the bounce buffer
@@ -393,6 +398,10 @@ struct spi_nor {
 	} rww;
 	struct device		*dev;
 	struct spi_mem		*spimem;
+	struct kref		refcnt;
+	bool			refcounted;
+	bool			removed;
+	struct module		*controller_module;
 	u8			*bouncebuf;
 	size_t			bouncebuf_size;
 	u8			*id;
-- 
2.43.7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
