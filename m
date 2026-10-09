Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D0CCA5FED
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2026 07:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hCwjX63+UVKWUMlr21pOp40WunhspQZVgmSbMVVqNMY=; b=vXUwjA+hZ7ZpYY
	A4syEzPujN5GwWs80+kLG4jxfra2E/EijpljBwNEPeNlrlOneCe5v9eQyXY2EQ0iTK5IA8RP4hT8u
	FPLlqxyd24n96RL85AWesIMLwCSvitrcWXQR+CiTD0M9DETLz71yydEz8Oz0npShgYy2JK3E+tTpD
	EyjmjsH+/+CDs7na6PM3K279qlKiW0RRRWJmqN7mGexrVq4jLd14OpYkyrDm1lmjcEvf0MNC9u+6l
	0B0HfFBKLzVW1fGCz3XUOcj29Go2zjcRSQBR2K2BnCFixwtLQaDjD9CGTZzwyAe9MDOKS2ljtdsEc
	Zd/QAUTODD7gKKiz8RkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF59H-00000005kHu-1l1d;
	Fri, 09 Oct 2026 07:36:11 +0000
Received: from mail-northcentralusazon11012018.outbound.protection.outlook.com ([40.107.200.18] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF59D-00000005kH4-2WHA
	for linux-mtd@lists.infradead.org;
	Fri, 09 Oct 2026 07:36:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4Z/HBwRvn/+YyhLQXDYOwGZe1sueLamWT2JmFpNNmdoohplmuk8Jb0pUVpnm4p6LGcvggY+/8wACef5vucITGN8aeQzoMVBJsjb9ysgobZkevIKLgeJN1wlHcay6n7EwblUOdNeo123DehmmI0vRWWP4FPYXkODoHVGnIUD3LqrX014xA6KjYtS4SUp1Db3OBIChnH6qFEXDo2cdxR1o7jA12j79pMc7e2i6gRLoYBI+oqPpQrPGMcF1Tk7dhEm2JGiPYleuRAvAZ4yNTa1UNA5EAGc/Jzl0m5jsFq5QodRqF0vD3aKg8J5dIXEOFqAinFCVVYKLY1mzpFGsO2GCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPtYExY3q/fulSJr8WSevaWid2+0kbiuxu+E/W6u5lg=;
 b=XY/ZJRVSKM513zDpTvJmdAE8ypjU/SAkcx4DJhlxiSIxom1z0QpKOG2BwRGs2KbOK+iTCem5z4V1T9sdQt7RavYvABUlyZKtyhs2dDjLu4Ot/eVikJn1s6tjiETUETxv0bJ4KMD3hyHWb9i9I6wmCuIPmzbn8k/FSIZmKhtOxjU2UZxzSQN203sd18ylJ4z7rHD9J3P4uK8tEbNQWTTcVfYhilPMVLKDUnRYt8LfvZV/F7Ub5oc0Q+MkSKaAFb2tmceCc1iAjM4AOhY4LCnq16a9eM20EGravy3Dgj+qoaeFUhW31IGcYtNEhlKal4FtitLBg7HPQIhaTe5JZ0WaIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPtYExY3q/fulSJr8WSevaWid2+0kbiuxu+E/W6u5lg=;
 b=jtsy2nvq7XbgYeUTGJGlLp88DG5Dve0i5M4yaowO+yzvKD9/2+hpi/vsXlPgMwg+kWA8DUM34OVT2gnDhU3gRspbRwBuBxp9ifa4sMOt4PNe3Ob605tv9u2ok2tKuVCVRDQk80M7pWM+ytOxLqeEtFqAlk/oj4EV2hygv/STO+12WczaTixWUAshS2gMUaOMC/roO4zvdd6Ce/K4Vxotcexjh0lg3a8GK8HV8uA+zDy/6yaB6H+9A7pSqzv6jLSEVEYwFAMtDevNZPvkhIoTr/WtVTE+nCjc3iXhrcRLpSQhBfr+8ESaY1QEQaa9naRAenAz93ai4+GNL/gk/7FZ6Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by PH7PR03MB7224.namprd03.prod.outlook.com (2603:10b6:510:244::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 07:36:01 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 07:36:01 +0000
From: tze.yee.ng@altera.com
To: linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/2] mtd: fix use-after-free on unbind with open handles
Date: Fri,  9 Oct 2026 15:35:53 +0800
Message-ID: <cover.1791512623.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|PH7PR03MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: 2859e7c5-94ce-42c3-4584-08df25d7f755
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|10067099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: ELpQl+XSwl+27EOYoRvI/QPYEYw5gvyipM6hioRzJgaqQrS/OyqUpqTWpNVI7mNojSdadmsBEUvPwDaoLghNWjdsYoHsZQeq1aHJ41mskrpeJzW9fzGoXt7cA38nfusGcjeVyve8wE3XcCxQo1Ig+hoUySCJYyOOYWAxU1LvhTojmQedq+Nc1EuJAQbANXYOitewslrf6i7obHn9ymVjQDF2BM2NXPzKyfIJHGNpVlMGr2kFaoVz5rSRV4GPTMRMwaV2ccnMEAMEcE8awhi69xqzVzBNDKFSajaFkIjsiujzhWOLKnpHeebavT4LQAHuOFJKR1aV44GjDsG59p21rdpazE8+EBFghL2DGB8SPFYwz2uxdNAIM5GCVTDPlaKCWeT6Q9bj1+b4RpDU6v+gCiEO3JXinU76AIjfYzksVlpJnpD/Fl11r17Anz7AAGEnu4pWEe3snacE9dm9w8V/cXC8+RfGKO7dHNDlYCuZ98+3JgmZngFWf50VHbSK37IKODfcaQ0RPJKFleppneZ2ecP/4fR+0trjehasZ9p0Smi+syKEFEGxVm92Vah8AYvBL7yYjqyIgbUVl05WPncZ3lR7xnkiDOLiANAuLOnT5r6BGfIgEyxU7f1zcLnAQDh5xMXmKfbm+XRou350yb4uME3V8T9CPis16M9r9N82+ak=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGc0ZHAwSnU0aWFBOVZnTE9GWDB5RHFwU21kNnZMVFk4VGtTM1FPMTZXNmZj?=
 =?utf-8?B?OGUwZlVJRG80THd4Zk9kbVdnNStCSXJnelVJWVNHaTNFWWdscThzaWk2eUJo?=
 =?utf-8?B?bC9BejVxWHRTSWkweEYrR3VjWWhUSlJETVNBZ1JpREF0a3Z4U3JvNG5SNmt1?=
 =?utf-8?B?TUJ3QlpPVFJmQ1dtUWVUUThISjZWem5DQTdKd0FrVnRMeC9GS2RSUnRZSjJp?=
 =?utf-8?B?SVNCV2dmODRRK2kzVVhZNjN6VUxtZVRXMFJwWXM2RGQwNjZNTExPaUkrV01F?=
 =?utf-8?B?MUgxN0s5RFBLRi95ZENqdnhFQnBoOXBScUZLVm5YbXJHaUhqT3Rqbk1mVGxh?=
 =?utf-8?B?cmpIby9yT0JBcGRlcmlOUnB3YUorY2VBQ29sUTMwN0VCSXh5S3I3MFlDaXRh?=
 =?utf-8?B?TTRva3FCMlJ6b3ZCZ0UrRXhScldBeG5mcWo2dUdGZGszOTJ3SUxOMGZNUjE0?=
 =?utf-8?B?TkdGbkNtcGhlcENacHlzbDA1aUlqc2E4YmEvMFhrdTJ3bWVrNlM2bmVxcFJB?=
 =?utf-8?B?cTB5UUFITDNsc2dsazdJc0pkTkYrY0pUUkJSUVBEWldkQnNyUUcvUUNhUFY4?=
 =?utf-8?B?QnFkRTE4ZG4wK0pXRldndjhMdG95elBINXRESzBmbE9GSTJqVlBBNUhoaHVZ?=
 =?utf-8?B?U1g1dmlYOCtFbXlIb3RDT2drWlhHY0FTVUNER29XNGtEUkZxOStNYnJpcGN4?=
 =?utf-8?B?c1JtMFVHOU94U29wKzZGVndIbmNYMHcrbXpsNGN6TnhHcUwvSFBVQk5nYkgz?=
 =?utf-8?B?K1lFTVFEd0h0VEtrNEhNZFR5WDhYdnJ2QVdEZEpacW1xSzZGZFJ2SVA4bEww?=
 =?utf-8?B?cjdzY3BzRGdrdWdUbkRDNlpOL05jRldaZk5ucTFxNUFNTHQrRzdZZnNtV3Uz?=
 =?utf-8?B?a3VRSURwclFyNFVoS2Z2NkRYRHFjM0dGTU1tYy9qM0hoaUdCY284bitPa1JZ?=
 =?utf-8?B?Wk1PNGErckhEY3EreUk5dmZTTllVTGZXZDNkbVpRRmd2d3EvTlpRK3FJbXZF?=
 =?utf-8?B?SWc1Nm9majUweTRDT2lPVnlSUFV2bVBDMGRtcEJmcDdmaThnb3ZEZy9qVHdu?=
 =?utf-8?B?OVo1MnhMeFZKcjZqTFJZRU1zSzdvTHBySkh6TVNnbkZ6TWVGSjdJcHdTWWhq?=
 =?utf-8?B?MmtvK0c5cVRjU0tWRXpjMkJoa0dFSGI4aXp4NzJaUEdVU2VJcGxWYmxhNmpv?=
 =?utf-8?B?dGN1OC9Od2NtZzFZcXQ2eTBoZlEzc1B1V1pSdlE3M2VGUjBUTEFPTW1Wa2JG?=
 =?utf-8?B?M29BRWl5VkVJckVETERPVnUzWGZybG42L21kTVc1SzQ5cmNteFlWcEhNTzBZ?=
 =?utf-8?B?U0JWYXpudFRDc1NwT0NkVWpLWGJtb3ZlYXQ3SDlYWDF1TEpvdjI1MWVvVWNn?=
 =?utf-8?B?ZFlLT25YV0FGS3B5eFVYOWZ4L1lSTmRaYXhERW9sV2VvZnQ0Q3ZIWWNtQjR6?=
 =?utf-8?B?b2g3SGx5VzRic3Y3TmlnVER6YWx2elp5clIxZTlXb2V2M0JlMTAzclVkelQy?=
 =?utf-8?B?MEVCMUFLQ0wwWGdjeHVhdzF3Vkh0eXA4c3YwSHdRUU1icWZpVXhiWGs0Y3Jh?=
 =?utf-8?B?OTZ6NjluVjlpaVhiMm5ubWFlZVNQMFAwalBxSTYzTGFpL1AyM2w1dENiaU9u?=
 =?utf-8?B?b0NHUU5kOEd1TjN3YytFOGMyVHpKODM1dkVpRkR4RnpweWxUb2ViWDhXWCtL?=
 =?utf-8?B?U2duUm5VUjdNbTFPaE9Ub1pGNTVBSWVPVDN6K25hWGJxSWJaZVZYWTU1RzhS?=
 =?utf-8?B?N2lOUTlkMHZ4TFRULzRaeHFqTjZ3c3RlL3Z6MVBuTlRrWXlpTEUreTcwVFdC?=
 =?utf-8?B?ZU9LY0tWMW5tQk9pMUk5SFgyd2RaeHFiY1g1TFdJdzRmRENhcHRXYWFUbzVJ?=
 =?utf-8?B?Qi80dlk0QytaZjd2YjBOVDJYRkZhQTlrbjhxQ1lsSEZMbi9lNXhvSTlmblYr?=
 =?utf-8?B?Tkx1bVdQaWF3dEdBMVBGSHFIWUlPajFZSUFjVzVhaTNJWXViM0dnR08rc3Jl?=
 =?utf-8?B?Nk5neDlXQ3NMOXphWk02UDEvWGVsOFcxdGN1Y1YzUVZTaWljNnorMTU2OHV1?=
 =?utf-8?B?Y2xXelNvVGtmZFphVi9LbWllb0drK0gxRENnT09PNHRERkE2ZktPbFJIR1Bl?=
 =?utf-8?B?Rkl3VFNjN0lzNEdwaEErelN2TEpkUi9lVGpEQnlWRmE5anlqSm5uYU5VRGpy?=
 =?utf-8?B?MFlBSGVzSzV6MWJKQ1FrWXEyTGtvK1VLOE9SaC9zSEpoZFd4ck5EY3ZaOEZH?=
 =?utf-8?B?cXFKY25xNkVqQkptT3IwQ2Q4emN5RWhEYmZFZS9Fc0JyQmYrcGhJcnFFODN3?=
 =?utf-8?B?N25WdStUV2FzUFdZNWFiaFdwTnZaNVJtVWZxMy9TbG42bmNSV2RNQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2859e7c5-94ce-42c3-4584-08df25d7f755
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 07:36:01.0943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1OJR+i67EbyNzcGrE+I15DeRPmgoiGZ0EjtvQTQfOaneg7mAQsjl43hnnMh4g3Nr7m35J43FgaF6/1ZFXNe3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_003607_658423_5AC3B523 
X-CRM114-Status: UNSURE (   9.90  )
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

From: Tze Yee Ng <tze.yee.ng@altera.com>

An open /dev/mtdX can outlive driver unbind. The MTD core keeps
mtd_info registered until the last close, but a spi-nor allocated
with devm_*() on the SPI device is already freed, so a later
close/ioctl/read hits freed memory.

v1 tried to fix that with a spi-nor-local kref and nor->removed.
That duplicated mtd->refcnt and still missed get_device() after
unbind, suspend/resume, and eraseregions. v2 puts the lifetime in
the MTD core instead.

  - Patch 1: add optional mtd->_free() (called from kref release)
    and mtd->removed so the core returns -ENODEV for hw ops, new
    openers, and suspend/resume.
  - Patch 2: on the spi-mem path, allocate spi_nor / params /
    eraseregions / bouncebuf with kmalloc, install mtd->_free, and
    set mtd->removed in remove() after draining in-flight ops.
    Legacy controllers keep the old devres lifetime.

Changes in v2:
  - Drop the unrelated RWW self-deadlock fix.
  - New patch 1: MTD-core _free / removed hooks.
  - Patch 2: drop the spi-nor kref / refcounted / controller_module
    and the prep_and_lock*() removed checks; use the core hooks.
    Also keep eraseregions on that lifetime, free on the probe
    error path, and unregister debugfs from _free.

Tze Yee Ng (2):
  mtd: core: add release hook and removed flag for unbind with open
    handles
  mtd: spi-nor: fix use-after-free on unbind with open handles

 drivers/mtd/mtdcore.c         | 20 ++++++++
 drivers/mtd/spi-nor/core.c    | 92 +++++++++++++++++++++++++++++------
 drivers/mtd/spi-nor/core.h    |  2 +
 drivers/mtd/spi-nor/debugfs.c |  9 +---
 include/linux/mtd/mtd.h       | 13 +++++
 5 files changed, 112 insertions(+), 24 deletions(-)

-- 
2.43.7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
