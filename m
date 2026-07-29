Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA06C53200
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2026 19:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=duuc2FTkBb3h5bJk7Q1cIeTJyXpUVU74K1b9E5cfZTk=; b=rW2VfEyq9lJZc2
	wbwwbmfNIMvrrxfSDHJgnq10sys83BZ9Ki/wojuMrP9M5zHJ1TmobLuOi6jixyiHIJADtytrLOLFV
	Qq/jQG8BK6lEjncpCTksX3+BiOveFBCx047mz4al1KKbf2kV0+X1YmQN/MjWwKvELPpeDTjZ7pVtR
	tsMNjpN5kGDwfjAPH8g1ddmoFBBEqLTqb3xNHc8f0mBlE5BSkZ/Pp6hmZc86Idd8OACNltT9OsvhS
	GznLbA0SSNxrDo8iaSY3PFkm9Y3Jqi/KJhNo1AyvYyMf+FOjCbDeDGDQOZPbxwDtVcP9IpMqXH6gC
	q86zm7crE/kTsoT7LcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9rQ-00000008shp-2HVs;
	Wed, 29 Jul 2026 19:22:36 +0000
Received: from mail-westeuropeazon11013033.outbound.protection.outlook.com ([52.101.72.33] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9rN-00000008sh4-1GKG
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jul 2026 19:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5/hEvw0oHLV/EO2ufoOqMCT5wNG4XtUhzxcn+jtTu5h64VcSSaX/m2812k4TmK3tfAK6S+afyNLWTT/A6RwOFMU7+s2ya7L4GNu/a7e3x+gQyvxgOZ4XXB6MPpFZJtLYd9XBFkfUgsdxdYfSw+BnP8UtC36gsCkOdii5VveGm6p0uh+RjiGxPUBGKvtJny/unS1rktjuJelHZM7nk+vnqyO8Tm2I1D4rcsnM5FF/jJ83t5j7J+RXU/7e/Af7luswurLfjeXEFF/dDEgIZGSqDVFK4aiwv8GmHdBKopIbzSCc99924cWIoygpwtsDWiC5KfFN3f4ejWT50NrP8nyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tbI/Ixn0hYpXUjCXKlYdvBYOGTkl0GB1GnUtn3lXAE=;
 b=dconX59bI7315zrX8Hftq3wEI06fJXJPmpxWliDoI8Q0ZJ16wd78JDTJ7H6+ZslplLPxcAlrX73bx+YrI9fyjppQ+FdTK0dWIwrnmUl0IXPIo/LGnNsQojU7HBLVZv+TGO6JvbCsJMC2vu2Ci15jsc7KKmW5zobEfQtwuvoMSAzusWHaM2pL5dYDtuPR1dOWOWZ+dZJQFgiEkqOVv/2Q7+UBNoydbe4CEgGA76IQfTrHiWc2NJ5E+UOraSfgcBa4VkzNd6w93Z3Etal6XnvXixCGeJtgZ4bOtyRP0fTVe5g0mv9/Gc5z1jd3iPJlyA7bTSY5EgVzyUWZvFDMZZ/hHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tbI/Ixn0hYpXUjCXKlYdvBYOGTkl0GB1GnUtn3lXAE=;
 b=pXEC70dXC4f4Wc5hpR9mqyOQ4EEE/bhMaYiltSFofRmk49iku0vIfx6sxiEfIRXoarWyPMPorX07DZWHaZnWQp0m410vIXdZ0RW2mRBl0YyfvFJmIzQvZpVdqR9srBl+UaeRJiKMTcYS0d4NcyrK1siFVR48uxmAnyU1KpEQux1DHo567e8zzucb5USclEQwmnF15VR9lBCWJihqneORuyMye3sfTwIqKIPLcAThMbPecLeV3ULYTpxRItnTXnalPFs91R+7UqoWZb4y7Gy8/Wt9dDh6ODF43iWveEO1aNAcp07Q+xPfID2F3f8y0/KKnKi7zETap4co3ERw6XiNyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com (2603:10a6:20b:446::12)
 by AS5PR04MB9941.eurprd04.prod.outlook.com (2603:10a6:20b:67c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 19:22:26 +0000
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308]) by AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308%3]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 19:22:26 +0000
From: han.xu@oss.nxp.com
Date: Wed, 29 Jul 2026 14:22:20 -0500
Subject: [PATCH v2] mtd: rawnand: gpmi: add debugfs entry for BCH geometry
Message-Id: <20260729-nand_debugfs-v2-1-2631e92adcb2@nxp.com>
X-B4-Tracking: v=1; b=H4sIAOtSamoC/3WNywrDIBQFfyXcdS1RGoWu+h8lBB/XxEJN0ERSg
 v9eTdddDsyZc0DE4DDCvTkgYHLRzb4AuzSgJ+lHJM4UBtYy3gomiJfeDAbVNtpIxM1ww5XsmLF
 QJktA6/Yz9+x/HDf1Qr3WRjUmF9c5fM6/RKv3J50ooURoJalGqTrEh9+Xq57f0Oecv2dJsfC4A
 AAA
X-Change-ID: 20260727-nand_debugfs-74d6d6ba52df
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Han Xu <han.xu@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785352942; l=3780;
 i=han.xu@nxp.com; s=20240131; h=from:subject:message-id;
 bh=1Ir8p0OaaZRzK+uNVv8/CPfGND24FaMn6+IhLvnO6Vc=;
 b=3655CysyBxEETNqLNnMrjp5atNHKHlQbqGzlZaCScXgsBRhQBfZ2W227kGMa3CzegG6Q8Xm1m
 qoPpCNk/mqKA5i33voHlZawoDCLL6649/S/Htu+gx3SeN2IidTmUjzl
X-Developer-Key: i=han.xu@nxp.com; a=ed25519;
 pk=XSryOlQ4EKXqt7ZHz2D+BcDu1AWYF0m5bX48xQOVF5A=
X-ClientProxiedBy: SA9PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:806:20::31) To AS8PR04MB9079.eurprd04.prod.outlook.com
 (2603:10a6:20b:446::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9079:EE_|AS5PR04MB9941:EE_
X-MS-Office365-Filtering-Correlation-Id: 184b069e-6a13-46e9-39ee-08deeda6b936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|6133799003|10067099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: UrHW7G2TbJKhzj2JI74W7bdFk15BCkUeEc4HO5tUq7MAQKkBdzZrtgCy8lbG3iB+8BmLn08djAyGqDSnJY7MB7B74fUKPYQqsrnn+wvXGAyeci7E3jTWnxKtyIsc84GBKa8CAz1s+kHE23sxZapCnkS9DnCTtsNsaskel7DvX9mH+WGOJcN+HvoJSJLT+P0DumtDryEz4OetUVtXQ20E9YgYhwqSqbrKGBsHGbVbY1JvSWd50HmHgyWQLXHxkQXMbozv/k6TBZUF8AytDXj52NVKkf0yRnxFsOm4vQUp4KpfcUliJ8EIbXrjQMMlgPKSYKrnH5CYqX+fzEPURl3ESd2hZW4jFpuvCKG8mlQvgUJdyo1L6jImV1OfZ4ndtqmQn/MC//hjHV5d9/QGBztWKjGFcyJ/3fX/AJCBmPeT7GjKMOrx1I/jvFZ4AJYVfSxhmwdmdbbXo0N0h9AbY/yyzzWhCF80JzK5iB3EEb8klsWP/aVMI/kUq8YmMNathwVQDRIGKirrzfjfT7GozdWEmekh70QmLx+YNHMtBWLl7y9NeUgXilR8oMcfKm+Zp5eJO8z+zQirQhdceMTtjjK2Qco4UwfkTUVM3PVPBuyYDum+0jqDP/XFz78ogSrP6+FtiDFkM4u/S9ucQhOthQTRVQ2OkdlaKvnxEj7GynQF4QE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9079.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGVtdUdCb0JHbW5zZnlxMHA3cTc3ZDlEMThHRmFMd0VJR2p3K25icEo2T2Ry?=
 =?utf-8?B?TXg2RjBGMFB6R2RIN0pMblZlY2dmVlVzTExVQW9zWmlwbGpKN1VmMWRrbnd5?=
 =?utf-8?B?ZFhqdTU2Z1dWSWpJcXhkRGZyMCtNdGk0U21MQzRTV2ZnN2ZLN1ZjeUlJOVY3?=
 =?utf-8?B?UlYwNVoyVldxUEh3ZkQ3UE1wWnNSRGNldGdKZXhmT2R5NTdZK0VSV3Q1T3RR?=
 =?utf-8?B?c1puZXluUGNmZ0hZRWMwU0hEdEdFMnc5VmdPZ2hBa2hVeE5FYjFKUVdlbDZW?=
 =?utf-8?B?UXhHUHNzMlVEdkhOanlOT1hGZUpRSUZkR2hXVC9ad3B1THVLVWcyQkt6aGg2?=
 =?utf-8?B?UlZBZFVYbUUweFhLck83S1hKNWJqQlVhdlpDSzE3U1NjQ01xM29kaGcwOU50?=
 =?utf-8?B?dTd3TnVuMWpPaFhiT2dkMUo2RzkwT1Y1K09tSnVTYzlOZkZZL0JTcDRQWDFP?=
 =?utf-8?B?MlU0MlFQYW1RNG81MTRxYXZLOEFRUVhOZEZDRkwrc2p6Y1dsRm5LNWN5Y0xu?=
 =?utf-8?B?aHd1elYvaVZvclhUa2txVDloWU9jemM5M1FMWmxQT3k1blliTEJ0dkZTUjd4?=
 =?utf-8?B?NmhwSzU1R2RWU3Fua0tUUDZtQzVJUDlWZmdPRmxuMHpxd29GWVVsTjFGVmFF?=
 =?utf-8?B?bnpJVGZ6Zzl4SS9XbzRnd0h5dm92WE4rWnpBZGd5YWhlaVNXYXFxQTM5WVMv?=
 =?utf-8?B?SWZQdGR0U3FmbDJ2ME1LaUtPbWN5S1VJVktxWDdldFJpb0Urc1VRVzJWbk5z?=
 =?utf-8?B?aGxwUFkxUm1CbWZHQzhTdW5qQjBINEdrWDRtYWtMQjhXbEFXR2ZBRC9PeUNU?=
 =?utf-8?B?TGRpVFZibml5NkUxd3NwMU00RWs4NG5tRm9mK0czVkNFUEI0QUR4M0NYa0lw?=
 =?utf-8?B?Rit4RlJWYUQ0dm9PNmtGeHBpSlNHSVJoTDZZMFJBL0VHK2VnK3AxcFAxRG5H?=
 =?utf-8?B?UW5UZmIvcDV6cTR0Q1R3OVd6QVZUS1lqMTNqYjJSSHJ3SjEyQWtZUTlxM2tu?=
 =?utf-8?B?K1ZuYkJCQWdRSE9UTGJncFRKemdxVGFpeEFFQ3U3Um9tUW5pZ0hQZFVGWDUr?=
 =?utf-8?B?K1JSUzVSZ1JLR2FwWWt1SFlBUC9ZdnBOOTBoTm1VYm9JbjNZa1VDKzVoc0dG?=
 =?utf-8?B?MEtMcExyNzNjdU9QRE96dXNXeHRSS0h4UjdORk1YNHNxQVQ0aUZneVNYRjNu?=
 =?utf-8?B?R3lQY2VMcHBqRVYrV2NJVk5zV3lCWHdXTlVhc2NvVjlRRGMvNUJzN09qUWFZ?=
 =?utf-8?B?Q2lYMUV0RG90MEFNS3dLWDNjZEdNYUhUK1FqRG9RQ1RKK2NWcjcxT2dSYU5w?=
 =?utf-8?B?UzJqSkkrRkhwVHBYTDR2NmZBd25XS25uRHl5ZDlOcFBzMW5FU3FrTXF4S3A3?=
 =?utf-8?B?SDRHRTdoaGdPQXJZMitTWit2VWFyMTA2Q1hQSmRjc2dHUXVvZUxDakRzdmJM?=
 =?utf-8?B?cE5QcW5qMHYzd3ZoVElpZzF3V0pGWHQ5OWZlR0dLNVl4Vm9CN00rZy9STGFQ?=
 =?utf-8?B?ekY3TTVGUGVtU0VxUnI2THNRZzMvUlhtbkNtUE56S2dBYUt1K05oVFo5V0pk?=
 =?utf-8?B?MHZyM3U5UG9YdTk3bUxMQSswTnNhcmltMTN4MEVIRGJUaG5GTzNYZmpaZlN2?=
 =?utf-8?B?cnZ6TnRRb1NPbEdVWGMwWC9pcGI2c0VrdU9CVDRmVTBNQlBSalp6ODdCa2pI?=
 =?utf-8?B?ZStNREU4NzJHUUViYy9ObG9ndEpvNnhJNzN2ZFVBWXFXakorOVBkNGN0RVAx?=
 =?utf-8?B?dUw4bkZQOUJNcEpUZVlsRzREMllGUHhQRUxvdzFISGdjc2pWcHB2ZWN1NDd2?=
 =?utf-8?B?ek1IWmtsVEJQSmdSNU9Ec1hpamlMZUpCRVNPaDVuMUwxNTB5VFloanVlSHhK?=
 =?utf-8?B?MzRGZ3FCRUUrRnhjVkY0VEFZR2Z6ck1wQVZ2b0ZrM3dSdXJkRlVmZDIyeHlx?=
 =?utf-8?B?aXhNQUIyOG1qQm1xNUdUaEc2UDMxZnc3UFdYalM5a2o1eHFzelE3VHZJNUt2?=
 =?utf-8?B?V0V2WkFEenJYdFp3SmY0R2tZaC9Oa1dDdlZVM1RDb2RpVnVaU05uNVphU0xn?=
 =?utf-8?B?RGJuSERNUnRPWS9mTDdJRUdXdGEwYlFvbjNsZU9pR24yTmpucXpsb3RBcFpi?=
 =?utf-8?B?bXhublgzSzRENFV2NDZmNTRvRHQ3bDJyRFVPOCtyODJXeFRhOUJQSHNGRit4?=
 =?utf-8?B?UlYrU3FpOTBMMjJyY2pZaTRBSHI2N2pWencrU3dIS0loTy9OYVRyaE9kTjRt?=
 =?utf-8?B?TjRya050REp1b3pSTG5xWHZCU0xvNTlkYTh2T1ZQRndwNndydlBLVnBiQy9v?=
 =?utf-8?B?YnhkZmhpVkYyY2pnbFcxdHFIeC8vV3pwMDZaeWpsRTVwN0lKSDVFbW9lVCtN?=
 =?utf-8?Q?XeBunhdh6P6lD2/I=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184b069e-6a13-46e9-39ee-08deeda6b936
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9079.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 19:22:26.1988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cf9xXEh1ugaFZ/WdG37gxS1zetP9xMdEuO1b14QmkN5tK3jQZLq9q5wktqochF/+myO3HUTKw3tZ1FMye2G9kl29WnFPmIE78GjwvyIFFkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_122233_352900_11351F6E 
X-CRM114-Status: GOOD (  15.52  )
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

From: Han Xu <han.xu@nxp.com>

Export the BCH geometry parameters via debugfs to aid debugging and
provide the necessary information for legacy kobs-ng tool. The debugfs
directory "gpmi-nand" is created under the root debugfs tree, exposing:

bch_geometry  - blob containing the struct bch_geometry fields
raw_mode      - flag indicating raw mode status

The implementation is guarded with #ifdef CONFIG_DEBUG_FS to avoid
build failures when debugfs is disabled.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
Changes in v2:
- Move dbg_root and dbg_bch_geo into struct gpmi_nand_data to fix
  use-after-free on device unbind.
- Replace debugfs_create_file_full() with debugfs_create_bool() to
  expose the raw_mode flag.
- Register a devm cleanup action to call debugfs_remove_recursive() on
  driver removal.

To: Han Xu <han.xu@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: imx@lists.linux.dev
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 29 +++++++++++++++++++++++++++++
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h |  6 ++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index c1f766cb225aa..527165ccc839d 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -7,6 +7,7 @@
  */
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/sched/task_stack.h>
@@ -732,6 +733,31 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
 	return err;
 }
 
+#ifdef CONFIG_DEBUG_FS
+static void bch_remove_debugfs(void *data)
+{
+	struct gpmi_nand_data *this = data;
+
+	debugfs_remove_recursive(this->dbg_root);
+	this->dbg_root = NULL;
+}
+
+static void bch_create_debugfs(struct gpmi_nand_data *this)
+{
+	struct bch_geometry *bch_geo = &this->bch_geometry;
+
+	this->dbg_root = debugfs_create_dir("gpmi-nand", NULL);
+	this->dbg_bch_geo.data = (void *)bch_geo;
+	this->dbg_bch_geo.size = sizeof(struct bch_geometry);
+	this->raw_mode = true;
+	debugfs_create_blob("bch_geometry", 0444, this->dbg_root, &this->dbg_bch_geo);
+	debugfs_create_bool("raw_mode", 0444, this->dbg_root, &this->raw_mode);
+	devm_add_action_or_reset(this->dev, bch_remove_debugfs, this);
+}
+#else
+static void bch_create_debugfs(struct gpmi_nand_data *this) {}
+#endif /* CONFIG_DEBUG_FS */
+
 /* Configures the geometry for BCH.  */
 static int bch_set_geometry(struct gpmi_nand_data *this)
 {
@@ -2282,6 +2308,9 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
+	/* save BCH geometry to debugfs if CONFIG_DEBUG_FS is enabled */
+	bch_create_debugfs(this);
+
 	/* Init the nand_ecc_ctrl{} */
 	ecc->read_page	= gpmi_ecc_read_page;
 	ecc->write_page	= gpmi_ecc_write_page;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
index 3e9bc985e44a3..80c32efbaef86 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h
@@ -161,6 +161,12 @@ struct gpmi_nand_data {
 #define DMA_CHANS		8
 	struct dma_chan		*dma_chans[DMA_CHANS];
 	struct completion	dma_done;
+
+#ifdef CONFIG_DEBUG_FS
+	struct			dentry *dbg_root;
+	struct			debugfs_blob_wrapper dbg_bch_geo;
+	bool			raw_mode;
+#endif
 };
 
 /* BCH : Status Block Completion Codes */

---
base-commit: f97bdc8ec1dc7b33781a702eeba55326c206be56
change-id: 20260727-nand_debugfs-74d6d6ba52df

Best regards,
--  
Han Xu <han.xu@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
