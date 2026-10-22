Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB79606A31A
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jcu9ul7c;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rM4p94WY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SOL6T3UibHYsTncLkHmCBC7x8DPUGYR62gEpVX1QtYs=; b=Jcu9ul7cc3l0UC
	Pt61XAqHpmb5UfDUmCFhmRs5Qx6Esbv27J6aWWuoedv7asztH/0mu52vmZ1Q8NGRYjd+G0/9wdas2
	MM6v4etezcWcmKGOF9IVPRe/pj9fTZsVRaGaM7htHdDKKzA93csTK+j50Ls72tsbVrx2VIsKi2RRy
	zjJcxVYB3RkvKV55tEnvUn5AoGgnwIMYLNXDyKFKxr9aufy3QX9ZI6WshmXzARqzrNqNky9lPMJYb
	6R1Sg5AFuL5B+W5UEeZ+eUdJPrCrAaACIOcudPDMFCNE/+XvaNx7c+fogxtUx1pZkyjh4LFfx2kTW
	XpiPaFPOIf5nCcQEE41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnmB-0000000Dc9a-00P3;
	Thu, 22 Oct 2026 08:03:51 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJnm8-0000000Dc8W-26E4
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 08:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQoNXqb2Bi9IW9y3yuAj80riAIUqJqxYUd7hY2fg9iWRoNEYqUjLvJcTxjDS3A2ubdCJrb7gYhN6/iHu7CixF7GGg+AhCK3q84mWnDYnBlq/YJJefAGt/KeBI4dIyWconLe0pdZNQAKTkoMd7EwrvOJWFl2CTH6B3FAPLdJy44aN7xTfrQuphuiSqN8eIJFwWpmNPX1WLcb6S+sV2pj54pVwlKBttk6A89EFlgr05uz+iVgcDcTKR03IV8g+PJ4jiNixIYDOO95zZXWcJlZZayBoXr1LqRCLSoQQ4PKtOvIb29ijHfhPGSPs/w6b0FP91luPluVSK45PNib31EKDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NeBe8KyMLJI4h2TqO3ITgsFT+Q9Q6UbxekqKFQKeOU=;
 b=CAlTjBJarLlsuECV2dvD4b+/Ia6dzC1BdRLcpu8mxxiMImE2S0xvMhBXIdoC/vBuySh/aNxGFlfR+8M8u9wll23iGewfskSjmGVgoffd+68gaeGtE01fllQ9I7utENa28btnE0CMsFJ4sY1e5Ss4OQqPvhKNNCuPHKoF7Q2+LAnvq+e9RQAoWWgN97YMLztv7PKRsJO+oGXkKciDSZkU4YQDcHwpSULCZwA5ZtdL594zHHe9uwOwoI/qwWCRmuUmykNergxEFU/n+cKsA9dHLFrYjMHCfoq0wkf4cnF6bomjX6x46tmak/bPvSLSQ3DHkApP/LCrFnB8/k4oSvkOgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NeBe8KyMLJI4h2TqO3ITgsFT+Q9Q6UbxekqKFQKeOU=;
 b=rM4p94WYCLHwFT6F1XbAhPeQzn04BNnoiDMaainpsmv9ZdzsUpHAIT30WUubiUwDpACQzNu5tdiG6YrNsGMTOppekybybXjpMoLjcnNm4GHkhbjVsN8ajF8NFlexKtzJQX8Y/QyyiHREiTNQvD7p+9ZARwiYPkqnX/8SHTIYx/I2pR4JpEVGOYSj0mZCHuVksCL7LVxPsrgkD96oB0x3jka3CVJdcVOfyxEtKzUe5YECOrS591GTK/HS/Py231RU2Z4F2+d3MkTtZ1vqmfsJ/AVd/tkw99JY78KzqvDqQX1+I8t12uh22FV0Tv8y514eLbL/qig/qNPb6g+7sYMpJw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by GV1PR04MB10352.eurprd04.prod.outlook.com
 (2603:10a6:150:1c4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 08:03:39 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 08:03:39 +0000
From: haibo.chen@oss.nxp.com
Date: Thu, 22 Oct 2026 16:07:25 +0800
Subject: [PATCH v3] mtd: spi-nor: clear the default read_sr2 opcode for
 xSPI Profile 1.0 flashes
Message-Id: <20261022-spi-nor-fix-v3-1-bffa00b75c27@nxp.com>
X-B4-Tracking: v=1; b=H4sIADzE2WoC/23MQQ6CMBCF4auQWTum1EKFlfcwLmgZpAtb0poGQ
 7i7Axs1cfle8v0LJIqOErTFApGySy54HqdDAXbs/J3Q9bxBClmLRp4xTQ59iDi4GcloMiRlp5U
 AFlMkvvfa9cZ7dOkZ4muP53J7/3dyiSVaqivTNcIOpr/4eTra8ICtkuW3bH6lZKkrpZiRIl1/5
 LqubyANWAzeAAAA
X-Change-ID: 20260928-spi-nor-fix-eb7ebe22a740
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, michael@walle.cc, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792656500; l=4114;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=knoERf6NsW1WZgyFT40myzJPgfP92oJfBKUlOcYhdMk=;
 b=JUyn/WSmXEbeCf/2oPdvs1lftrKO8z/XWgkp80GuLuojeb/PnQngqr9wsOdJ0fq9zw7GvjzC0
 ZwqYHGtHCX3AADffOm5nn6Z1qxPcytriQsw7jTJGQw60AOxgj1H8iaJ
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: MA5PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::16) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|GV1PR04MB10352:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3f8863-ddcb-4483-306a-08df3012fb3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|19092799006|366016|261021121427099003|56012099006|5023799004|11063799006|261009223027099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: xFF2+DVUILimSqeCbyrX2ZMJezFmabDkORytcAcI59RJZUP3tP5iSktqNoQObvSE3GzfLL2ELCnza1Nj38X53aPBNzGpj+UVoFJQ+CXFJmqJC/4PujASxvKT9PbqkWIdXbLSOoY+f4sqU2Xo7RASfvj5c9m5cXZrUtPguljxcWARbFdqRR5FvXDFj17PjOkRewwTAMDmex7twygJ21af81YNKS9XZj5fQqtsq6i9+1b3gMvD4A6ge+YS6SPbdA5TJfUjViqQFcq7cf8dTJt1WBmMwEewPyKPKLAE7iQS3mZvrfhPm07udCndHNzKrYFeyzzqChg0RlhD22dYNVMhKJqSSvi4ltMjAiAmGber3lVhGUbwZLzzyG4St6Z3KeiOxrUZ3tY1s+rd2JEfVBd4aRZ8k35Sr1ZJjif+nZqJvms5bbfzUUARYLHcDmObH+K2DKb3ZetcnzVJ4YrWUfLZXQ3VA06Gh2Do6E056cciMtxBVr+eBJvUnJBBVwSOZI2omdyMYDZlrwNClPsGM3LszbTSt6XYbTDwIYV0uc7dfqm1WmvQKUVcAPLCjGIFnZGcbPL0uVAGAQV0RZA8pZHhXlAIMkd7/nGC0c+6/tdbnZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(19092799006)(366016)(261021121427099003)(56012099006)(5023799004)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGJzQXhjV3Nnb0R1anVRbmpFc2lJYUJEV3pYQlVLNFVkazRMTm45S1pUNXdi?=
 =?utf-8?B?Q2JVQTM3VHdLN2FvdlY4NDc1N2lPUVEyRnRYL0Q1bjVXYW1BR1QzS2VJbFdH?=
 =?utf-8?B?U1ZnM1hNN01ReThQM3l1WE5VSG5TWm4wd1BnakRqOThyTmN3M29xaWIvMDR6?=
 =?utf-8?B?RUp4dWZZUjlMeHoxaHR5Q0xBOFVpVFU3ZkdyOHlRSnZxT1daNkFSUTdacWJv?=
 =?utf-8?B?ZUs5VmRHYms2eFg0UHpSaFo2M1lzTklBaWdCMFRQRVZTYTdVcnRjQ0JsVGpp?=
 =?utf-8?B?MkhNaVY0M2lkM0JIbVJYYTBQTlRLQjMwUXk2NEVXdXA0OHUwMnRGaVVIaGpX?=
 =?utf-8?B?dmlablBnUTNRNks0aUVvZ0h2MHlMaU41cyttNlkzNnlFeU5Rbks0UmlvZ210?=
 =?utf-8?B?OThxZVJjVEtGcUhnMjFBRzIyR05mR2hFbFhNYkdPOTdrb2o0a3N6eDE1R2Vx?=
 =?utf-8?B?by85NVVQbWZJRnZ6RjNOanNRUmduV0JaRkVab21BQnFnNGFhSGNlY1BSZTFl?=
 =?utf-8?B?VDVKRlN0QzVHVXlrMzVDRlM4Q0k5Z29sblI2UzFYcUlRNHB3S1hISzREb2dw?=
 =?utf-8?B?TW95QXlQSUxsNFErb1AxVmdhanhlOXVVRDFqYVlTaFBCbHZZUmFqU25RM2Ji?=
 =?utf-8?B?cnpzVFBHc3pqTTdiMzN5cXN2YUhZQXZQNS9meittOExuN1ZqcnZhUGw4TFhw?=
 =?utf-8?B?NWFQNHB1SzZvbVdBVUp2d25KQnlHSytmU1d1ZTlUYVJuZm51V0NGdFdQUzJz?=
 =?utf-8?B?R2FZa3BLdlMzU041SnV5Qng3MDFwSjhtN3hhNjdHang0VnUvSTFUTnBpYzJy?=
 =?utf-8?B?VHAzQmVBV3dhdk9HR3VGSWVaOU9tc1dEVGI5cmZaZGI1RXNCcCtLODQyZXAw?=
 =?utf-8?B?b3JYUVp4SlczdWdSNFR3Tk9hRHJsSG8yd2pWdzV4ZlVuRERxQnhuQzk2em9K?=
 =?utf-8?B?OTVCb1YxQzE4TXA2OXlhTFBJSW1iWS9WenE2enp3WVdoM0NuODAyV0s1WDhi?=
 =?utf-8?B?MkJUanNqazIxL1NTeVFTTmdOSWRWaGJXMjl0c2s2QXRYRjdXSlgwVHAwMDZa?=
 =?utf-8?B?YStJUkxpT1dKbWlyUHp1ZHN5NGF0NGpmMmpiOUFSRlU2ODBVMmhlbWxIa2Fw?=
 =?utf-8?B?OTg4Z2JjUHN4OWhCbTNpekY5ODJqWHRzUlRGSmlWZFhGWStCQjZuUHBEZWZN?=
 =?utf-8?B?UnJ0SWpnVzFZK1RzVGNWUzJiNFA1c2djc3pUYzkyV2VFRlN5YktJVHRDZnkr?=
 =?utf-8?B?ZmR0V1ZjVUxMcTNkSWdVeEVxUUdmaEgvT2hoc3d1RmZCdFpDSCtwMEM5aFV0?=
 =?utf-8?B?OEUzQmc4bmk4N05hZkJPRXd5eHJHUmlYT0tDbnJuemtuYlkyMEllZGxGVUd0?=
 =?utf-8?B?eFQ2N0kzTUNKUnZ6SWFaazQwVndKZjNkMStCeWMxWG5uUEx3eDRrWDU1SWUv?=
 =?utf-8?B?NzRzQkk2UWVIblZJSHR6RytwaU9oNXB4SHVROCtzanBBTWl1WVo2R1BjZEoz?=
 =?utf-8?B?SEwwcWFJMGpDZHZJUHNtWjF2aWQ5QXZOMkh2cGJFU0xWNmJxbzRmUVNhMS82?=
 =?utf-8?B?bkRiNWtob3gveVpRRGZZMXEyS215bUlHTkdjSEI0eDNqR2RoelFaQm5vMTYr?=
 =?utf-8?B?OGhTdWo4TEFHOEt6dEFEclVtYTg3NXNvTnVxRDNFWkVaa1NqWSs2SWpFQU0x?=
 =?utf-8?B?bkJGT0VYczlNMzB1VzZxS2VBMFJ5YVN1U3J6ek5VaGhZVVBsQk11UDBNenBv?=
 =?utf-8?B?Y2VpejRZWk95VXRXWjhCMFpDWjB1STZlYTA5Sk1sNVVqT0tXTDJZY1dkdkZm?=
 =?utf-8?B?cnYycWRDYTdBbHB6WEJNUEJ4MTcxclp2VkhYd0FINFdTa3A2WFZZdThUYWJS?=
 =?utf-8?B?L2Y2Q1M1dHpqd0RWbllRY2UzZzBsdTkrSjdiTjFRdHBQSTVlQWkra1JNSUk1?=
 =?utf-8?B?LyttTTFjZW4wVksrd1RzU1paMG1lZTl4WFUzWkxJVFlERWZtQ0Vmekh4V0Ev?=
 =?utf-8?B?cmptVld4aS9nUDJVYXhHN1o2QTBxWTRBdFlVRmF2SjZNNjVuZTVaNnRqazl4?=
 =?utf-8?B?bHN4ZG1aSFhEZjZkQTJab3RMSGFGSFlkMGgrSVlvcFJKMWkzZnhTRXZFQmM5?=
 =?utf-8?B?Q2ZEcmR2SW9yVG1samNGVng4NmlkTHlGL3JXbllDcENmYlBVUUxrdERkZitW?=
 =?utf-8?B?Wmo0TnZDdURKNGRNRTFHNmdsekFzdDNLT1dKWDNQSHM0SG42bUVMSUxQU3F1?=
 =?utf-8?B?Tk9DcDFRdWVKL0toU2VkZWRvMk9JZW9FcWc2a1FnS1NoQlRRRzlLZkRKZnJQ?=
 =?utf-8?B?elVCSXVyQkg2M0dvV0xNbVVCSUY5S0pBL1lMUXJTTWIvVXRRVTdhcnYxRDNn?=
 =?utf-8?Q?0u6vfcQA7UDHThlHsy0RnaWa0VEmYDZXXnbkj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3f8863-ddcb-4483-306a-08df3012fb3c
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 08:03:39.6917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRqZs8BAg9SM2/zFzFRA6KbjqozNNN60YxJj+JnVVSRoWdBL2wS1ItY6yvsZnoV/F1F9XPfBxlHE698L9CAk8EtTx7Yu5Pfu84JcjBuvZH17p0ymzBlQYg3XvZoeskQC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_010348_583124_57E77EC2 
X-CRM114-Status: GOOD (  16.76  )
X-Spam-Score: -1.0 (-)
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

From: Haibo Chen <haibo.chen@nxp.com>

The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35), and
spi_nor_cache_sr_lock_bits() reads SR2 during spi_nor_init(), i.e. after
the flash has been switched to its runtime protocol. On an octal flash
running in 8D-8D-8D mode the opcode is extended per cmd_ext_type (e.g.
0x3535), but RDCR is not a valid register read there: these parts access
their status/configuration registers through a vendor-specific indirect
space, if at all. The flash does not answer, the register read times out
and probe fails (on i.MX FlexSPI: -ETIMEDOUT and a controller WARN(),
seen with a Micron MT35XU01G and a Macronix MX25UW51345G).

A flash that supports 8D-8D-8D publishes the xSPI Profile 1.0 SFDP table,
and that table does not describe any SR2/RDCR read. Clear read_sr2 in
spi_nor_parse_profile1(): it runs only for octal-capable parts and before
the manufacturer late_init hooks, so spi_nor_read_sr1_and_sr2() degrades
to an SR1-only read and no unsupported command is issued. A manufacturer
driver that genuinely needs an SR2 read in this mode can still install
its own opcode in a later fixup.

CMP (the only user of SR2 beyond quad-enable in the locking code) is
Winbond-specific and is not placed in SR2 on their 8D-capable parts, so
no octal flash loses a usable SR2 read because of this change.

Fixes: b7b63475903c ("mtd: spi-nor: Create a local SR cache")
Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v3:
- Clear opcodes.read_sr2 in spi_nor_parse_profile1() (capability based)
  instead of in spi_nor_set_octal_dtr() (runtime-protocol based), as
  suggested by Miquel and Michael. It runs for octal-capable parts and
  before the manufacturer late_init, so a driver can still install its
  own SR2 opcode afterwards.
- Confirmed on a Micron MT35XU01G (i.MX95) and a Macronix MX25UW51345G
  (i.MX8ULP): both publish the xSPI Profile 1.0 table, and 0x35 is not a
  valid SR2 read in 8D mode on either.
- Drop the Assisted-by tag (removed upstream for 7.3).
- Link to v2: https://lore.kernel.org/r/20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com

Changes in v2:
- Rework the fix following review: instead of guarding the read at runtime
  in spi_nor_read_sr2(), clear the default RDCR opcode.read_sr2 once, at the
  point the switch to Octal DTR succeeds (spi_nor_set_octal_dtr()).
- Key the clear off the real runtime protocol so a flash that advertises
  Octal DTR but runs in (x)STR (host without 8D support) keeps its RDCR.
- Drop the swp.c change and the -EOPNOTSUPP handling; a cleared read_sr2
  already means "no SR2 read", handled by the existing debugfs caching path.
- Trim the code comment; move the details to the commit message.
- Link to v1: https://lore.kernel.org/r/20260928-spi-nor-fix-v1-1-ce65ba90cfbd@nxp.com
---
 drivers/mtd/spi-nor/sfdp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 4a3f82e97cef8a76c9704918aa6558ca4e2f2b97..722eeff71d0df8c47ec7bdd795c08ba1bdf5e9cc 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1344,6 +1344,17 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 	 */
 	nor->params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
 
+	/*
+	 * The xSPI Profile 1.0 table does not describe a Read Configuration
+	 * Register (RDCR, 35h) instruction, and the single-byte RDCR default
+	 * is not usable in 8D-8D-8D mode. Drop the SR2 read opcode for these
+	 * octal-capable flashes so spi_nor_read_sr1_and_sr2() degrades to an
+	 * SR1-only read and spi_nor_init() does not issue an unsupported
+	 * command that the flash never answers. A manufacturer driver that
+	 * actually needs SR2 can install its own opcode in a later fixup.
+	 */
+	nor->params->opcodes.read_sr2 = 0;
+
 out:
 	kfree(dwords);
 	return ret;

---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20260928-spi-nor-fix-eb7ebe22a740

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
