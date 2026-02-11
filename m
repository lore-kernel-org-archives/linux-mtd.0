Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFF9ECD6F1
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Feb 2026 21:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W3aXffsqbjki1JxYjAx0eobZGct9JelLop6hmFFvkB4=; b=IS8c23d9zYymqE+UzGL3pMARev
	P1cw2PlfjPP4YlOM9iZX2yolOhUYhqLkM6c6DW3+9X2nDX+oTqH+O+cpzWBHEgKct+1dcFWRrP7m1
	YX6pN/BnV+o7y8Wl7b4Yc/vflOEkVTC45yg2iI3lOwCmoNeX7qKRRmUR/x1+d7UiwI719bqAATiZg
	8KmHuQiSO0WPviNzU6l9jdGTpuK7lh9CakMK2NgsXXDJjTkFUs7Vtr4EKovhWTOu3crUmY2OlIzXU
	wm6ztxQFJIOYKBNuzjVfQoGJu9afi9ZbgdDCYA9RvCh8KTisYZy9ICSzqkduX9IHNPlCesp07gU6o
	OgotWL/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHd3-000000014Or-1hHS;
	Wed, 11 Feb 2026 21:20:09 +0000
Received: from mail-westeuropeazon11011020.outbound.protection.outlook.com ([52.101.70.20] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHd0-000000014LP-1urE;
	Wed, 11 Feb 2026 21:20:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUAyMR2cxhG5umnyJAvgz0YKhRk7eNWYmwKbCuFrC3Sbdv9Jw8qbDFYTm7j8cJ05YJoKtFgS92cice+cnOkkj9f1lnDy51jQI+kpA2Oln+IqevA3WEMDyN74ZdSyz5l8l2vmyEUWX1rMlSAWKgAhwpP4wi+pWcJ0MEeTgbiX/KFbXrtjaSVGhIBpM0xi7LwBSjrxVvbxdGNsCCVSzkVInLhsWC+D36ogHEccuCqYJAxw05jacgWpbNaN5SElaAvM4NLgALjlY9D2c/4sbRuQQaRjVzh4LyuEGWlTJVIXgbki49yU2mJT58wDFdC8x2KekIdIIy6Tftw5Wf1Ai2hadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvY7AiVscrqEieGv5atYZXcwN58vvwCvmN1paAv3/vE=;
 b=Pm4Q1c73vjSmi+cNG6Q4B2Ksyd1JdeAsNQl7FZy5zLza/59wMGbvZz8N7HgEEqmZ6XhaTMwP3h/ak0KYr/m879t8vx3e+4nbpB2ihaSEzyY5FW/TsFo3nGEyKDMnVxLz+UpsbchQaM/Z+/FLus7bXSiO0x1wkWu+Xv4cTtM9jEJbOi6K4UOwIL7JqXqg3iV6iFlbCTaaUHlxlM/7CxKudt0eNwSTe+1gtmK6W1Mg+PPLFnPcJPgrs+YHfhR3GcrfeDDVfVbLhIq6H1PnqiFy2vOmIkhD+1bjQwKcrtjVvO/25a8+LbiZQBmuD/a+EbSm/MBTx1uBE+tPU7swbTgk0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvY7AiVscrqEieGv5atYZXcwN58vvwCvmN1paAv3/vE=;
 b=CmGWK45b8oCPXiuF6xZHGfMPhEa2k75nZNOpzAf9FEb0rNvobN/4drweo0sXE+1b8vtEUq/hGktjJBFP/cKiikxZB/Gc2njz1Sip1f58TJCZlNZs/7u8iS2hXd5z01Mc3s0m9ME3vPDnlf+JzWoHkywpV9ihTLDj/QH/Xmv6YnKNy3toqnhkYT9D5GAESnj9W0+HzCMLTCn+jj9PLp67nLWzW1umE9YUWqdPvYuhZdD/KpEQiEZPsd8pM3PepUFEC3rQfaT2R8vPpxA8EtUJ6FnYyyXgB1z4Ooj72eEyxxKFOENqYCYlcIjQA+5FmDU95sSZ3O09VXrnvMX5InJeYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10154.eurprd04.prod.outlook.com (2603:10a6:150:1ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Wed, 11 Feb
 2026 21:20:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 21:20:01 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Feb 2026 16:19:40 -0500
Subject: [PATCH 2/3] RM: dts: imx: set #size-cells to 0 to align with
 nand-controller.yaml
Message-Id: <20260211-imx25_nand_dtb_warnings-v1-2-2f06aaa1e3b9@nxp.com>
References: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
In-Reply-To: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770844791; l=1712;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=n28q5xkVgieIqBBnj1ZpcJO0TlV9ixBfOy4hJQTIYYY=;
 b=5YqlZbw1M/uTp4mxL0loogaYgZvPGQVdEE+Y0eITAZWYG3xCS+jXddGg9uRYOyHKnVEBxq//D
 YcWFk7A5Eq3B+R4Ydlc8zS2EVxe7GRnSYtXRfaioNsn4D4mAP5rJjRC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10154:EE_
X-MS-Office365-Filtering-Correlation-Id: 14361880-7d56-4a9f-0af7-08de69b350e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qmlvb1ppM1Fmbjk5Z3VJd2M3OXBJakZlRUFQZW5xRlM5QzdxUG4yeXI1aWMr?=
 =?utf-8?B?dnY1M3ZPTFFsdUdWZHNsSHk4N05xL25SWU9HWTFyTFV3MVk4ZkVmSjk2dHg2?=
 =?utf-8?B?b3dqOEVQR3JBVTFTQkN3TVV2aUtNaTF4RjU0ZmQxVm5NczgrVjBlc2hkQm9i?=
 =?utf-8?B?YThqVExjeVgrd1JiSlZZZEt5R3VsTEFib09jVEUrRlhvNUIrV29STzIyRDJ1?=
 =?utf-8?B?OUVBa3Y3ZjU2R2doc1lFSlcyanBqNlZycjQxVlUyZDJrVkR1K2x4OFlka1ly?=
 =?utf-8?B?dGZ0bHJFTTR4dDZZaXRkOEhpcXpoUzlZRmYrMU1ZNFVWcnRta2RGYkRKNHcw?=
 =?utf-8?B?ckpyWUNnTmFjdFBUcVFMSElnTklKOEhmc3k5YlVJb2h0Q3JNSk5oclRZWmpU?=
 =?utf-8?B?NkpOUmJmaHovVEp5a2ZlVzVLVGtzTDR2MVpBc1lXbXRpd2ZXTTBoZFI3RThl?=
 =?utf-8?B?VTRHa2NqWWlZL2d5U1Y5dSt0UzNCR3VVU29HeDlDblEwWm8vNnFaWThGWktP?=
 =?utf-8?B?MkNDdW5jMHB4aGZOTytiM2V2YjF2aVZuYmtpU0J0R1hRUDh0Sm9FMXM0Qng1?=
 =?utf-8?B?S0pzYTVhRzlKUUxnTkJabTA2RWtnMEJnVzFTclZGYkpSczlDT3FxbnpveHBl?=
 =?utf-8?B?RGkvNVIvOURtSUxSZXZITlpkaXFYaVF6NDJmRzhQS3EwWS8zVGdQck9wVDhN?=
 =?utf-8?B?NVdUZXZLZVhnMnVxUWJDeldlektsazFkWGFsNS8zK29leFJ2R2tJaDRqM25H?=
 =?utf-8?B?WUI1TG5sdlgxZlJKYm0vT003UHRhMSthQ0hLTTU0MVphYjlqK2p1azBQb1pp?=
 =?utf-8?B?bTdkS0M1UDdoMFlYSGpNYXNPRlhEL21OME1vQmp1dUhwQVlhVUVldXQxQkpu?=
 =?utf-8?B?UXNpK1JwS2ZOeXNlMXM5L3ZIeEkvdktVQzJPb0ptYlJyZXg4VW1MeUh3blBu?=
 =?utf-8?B?UHgvUDcvTDZUNzZCK1Z6K1Y5U1JReUdlZUh6dFpBeUM2S0FXNmJGZlBaS1R3?=
 =?utf-8?B?c0xEM1poSjYrdDVlbzE2bUdiaG1ESFR5MURvVStoU0dIdFdhbmZTb2pnTjNa?=
 =?utf-8?B?L0c3TGppUXZ5ZFIrZFk5cEZiUlJBeHZnMWl0Q2ZYZTU5NTE4QTNhTTZ1ZDl2?=
 =?utf-8?B?NURVNlNyWXM3NkVOc1BYQVhERVNvQmRDL0dnNkhZMmdzaVM0VWpldXBZUVVD?=
 =?utf-8?B?ZzNJTkl1NGlVd3VaQzcwOVg2SFY0MzZQSnBXcHhjQmJ0eGVUd2U1U3Uxd2xn?=
 =?utf-8?B?UkZiU3F3RHhhbnFKdHptczJhMW5aQXJFVFBsTXNnUXdvSGllK3FNajdINEpC?=
 =?utf-8?B?d3dUd0FUY095Z244b2ZQUVpRdU5LSU9aQy9BL2FIU0F3RGdrVFViUFZROVFq?=
 =?utf-8?B?S2J5QzhrUjNIZDhOSTZYak12bHorQy8zdzlnc0ZxcUZiMitZWXRBem9VQmFa?=
 =?utf-8?B?VmtzVHRCSzFMYjRtZWdPbXh1MEo2TnJ2dDFlbzRncWExMFJyd0JxekFuMG1y?=
 =?utf-8?B?cm81Vit0aS9CSUhFeWRlSFp6UldwcHVQaWYvcWRtWU0yaFR5UlhOS3lVTjBn?=
 =?utf-8?B?ODUvMUgvWVcwcUkzRWloZGNNM093RGpWeUM1WXpMN2V0OCtmWDBlWktvdTFm?=
 =?utf-8?B?UFowM1NUSDZqRzg2T25lcWdKR004WmFnT1ZMODBySklIZjJuQkJPcnl5UXF5?=
 =?utf-8?B?Q085VFZseHVQMnRoWkVadlNuTlFXeWZmVUxPc0gvbmtKSEM0ZzNDdEJ6UlBi?=
 =?utf-8?B?ZTV2b0pkcGhIQnFoV3pJYTA5WEV3cHl0NU5ROVR3QmtidVpVWWVYUVVPQmNL?=
 =?utf-8?B?QW55NGJnM0hCNEp6NzVlQmVlSW51MFlQNUF5V1dONWJDUmtxdTlLQWNOczZL?=
 =?utf-8?B?REIyblJsdTRhaEFpY1JGQklLOGFFS0pibk9pdEkwL2kwZThLMzA0bkE4Uklt?=
 =?utf-8?B?d2p5NFlkWmlEU01XamlxVjgzZjBSMlhrNEp4K0FuNnQ0UzBYT3RPTzRRYVNW?=
 =?utf-8?B?aTkyMDBFNThJankrMTJGNWxnMkpuNXJyUG1GRFVGVXNpQ3FpTmZRYTVzd1Np?=
 =?utf-8?B?cnpvQVpkSnkwR0JLcVFoLy8wRGM2UUVxZFF1NkhuUU9hK1FIalpESUJqajBU?=
 =?utf-8?B?dFBodmwrZ3hLOHF0MmFhRGJEVnJSbnZ2R1JHV05JQnpnUG5pVlg2SFlMaGdh?=
 =?utf-8?B?YVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUYzb1J0RjZPcHcvOVhqUUZsK0ZMdnk3ek84NFduem5JVEVMZWF6Z3R2OEow?=
 =?utf-8?B?dUloQ2NKcS9rZDVqSmwzMHhyb3NRMGdlZlJ6ZlMzNmQ1WGRiQ2g1RzBjSWhO?=
 =?utf-8?B?bGsyRGhWU0MzelZpT2pibm9rQ1YzYnhMcjdlTU8wUlFSdFI3Zy9ma01xTFUz?=
 =?utf-8?B?SXlBcEQxdmx3ZnVhdFVWR0V5UjRyTzNBOVBmcFV5a1VEUzY5R0hLY3M2YzVB?=
 =?utf-8?B?dmh0dFZpNDRxNzFib2tKSnR6eVpHQjZhbFVTVHhKVy9sS0FwWXkways2WTFj?=
 =?utf-8?B?VjR4SEtSam9BQ200cWxDWnB1aVdKWWhKOUVtQTZZQXJqQVZVeW54MFAyTHp2?=
 =?utf-8?B?ZFMweTRUTkdDOHhmbEZXNTd0aHZlTEZWOS9oMVYweEVqUnNBaEU5RjJsbjlO?=
 =?utf-8?B?R3crd1BUT29ldlF1QXI4RWRrTjVyd3RMV0Y2UkVNUDNydkVyTTJpdzNsK1dq?=
 =?utf-8?B?RTRZdzlLWXp6d3NCVFN1VTNTNUUzUG9ZSjhpZW9kclNvUHpySlNWOGF5ejNj?=
 =?utf-8?B?WFM0a3JIZDJGWlg5WmJGOERqcUgwMk04cVY3dkFOOVhrQ1VDTENHMW5FYTIz?=
 =?utf-8?B?emlaOXBGZmUxbXFuc210aFZpQVNJS3hHRUxWTXBiYWE3N1B2RU1WbUpyNGN4?=
 =?utf-8?B?NE1xdWV3dGRRK1RnWGdmMTY2THYya2NqeU9oaENtUTdkRjI2MUE1cVc0WUNK?=
 =?utf-8?B?U2U2VmRKcmJOdm9IeEQzMlJOYVY3K0poVWYzZkVZL0NMcDg0VzJ1WUdVQmpk?=
 =?utf-8?B?bm5jR2JYOWxyMmJEQ3BnRGlRQ2FoSHhDc0Mvc214VjdmeUpsM1pKcXMvRjRP?=
 =?utf-8?B?dmJEL3ZFM2x4RHRna0VqZHBxc0hMQVV2MzZJRE9oZTF2VVljdFlwT0ZLaGtk?=
 =?utf-8?B?b0ZGdjltRDlhZHdYSkpCUnQwQWFmTTdwR3NzaU9HUjBwaEl4ZThsMk9RcHcx?=
 =?utf-8?B?dUNVeVdqMDlVdHRrSDV6OGRQTWJUYzdvMlluejg5enVSb2JNVkx0dW1rS3hv?=
 =?utf-8?B?RXZGZmcxakk3RVJ4Q0tkSmwrUmpwaSttZnNzdW9aeWRjWm4veVFEVGVWSG03?=
 =?utf-8?B?Ui9xRUhQRndYSXJvaTkyYnVabU4zaTMvNVROWCtTSjRFMHFSNlZUeURjUXY1?=
 =?utf-8?B?YnhCMmlieTQwVEpleVFwOHh1aTlwazM1SnMzZURIcGFkNVgwVHZDWEl4bmVu?=
 =?utf-8?B?Q3ErbVM3QW5TZFJDVXN3VFMzSm5scjR3V1RFSDdXNmQyRWMxQk9KdUFkczdm?=
 =?utf-8?B?WjI4UGRscUlaRE0vTFNTZkoxb1ZCUERYWkVNV285eTMwL2Q5NFZSTm9GaUxH?=
 =?utf-8?B?UXA1bFZvN0xXS3lTYll2S2JEekdWQkEyMFNqQ3poMWRaSEtVdjNBaHRXalp5?=
 =?utf-8?B?Ny9ZQU9TU3V5TXdSWkZ0aHdRbStpZW1LN2ZEakxYVUovL1ZqLzJnUmh1OEo3?=
 =?utf-8?B?cXd6cFQyMnAwZUhld2ZGSi9PMEQ4T3NyR2ZqaEtaUDhBeGU4ZCtYNzd4eCsx?=
 =?utf-8?B?UHYwN1ZYclVrSnpSWmROOVF0RmV6R0FzY2VoeStxSXhIU2VzRTlleEovU3Fo?=
 =?utf-8?B?YXJJR2lRVU9ZcjlUU2syanFCc1pESXlJcTE0aEZpWWtKS0dmR3NqY1RvMFRv?=
 =?utf-8?B?SkNEZ3VJMzRkbVdFaThnSDRweXZnbWtiam9iTXRtUHFBdTB4d1JNQkRKY2x2?=
 =?utf-8?B?Um1PZHhFSFdPdTRKaysxN3RmczdvV2pkNmp5NDFROGgxb0pkRytLeVNhejVm?=
 =?utf-8?B?SGJQSzFnK0NVYk53SENGaUVZM1prTlZlT3FVNFloN2kxcXk0cERVaTBCRUN6?=
 =?utf-8?B?RzhjbFhMYjg1QkFqL1RSZWVxeDJRVlQwbFZHemJDN3BsRlVGd3QwNitLVnZS?=
 =?utf-8?B?YzNoRUQ2OU1uWHVJYkZxTzQwaXBaSFVpU1czR2wvdGo4RTBTdUVYaWUvUXNs?=
 =?utf-8?B?dmdSMmNBK0lQc0ZLcGhISHpxSnhjdUZuYm9vZS9SZHpwVER1Qnc2L3JGQUVv?=
 =?utf-8?B?SzVJTXFHdmVzZmdsWE8rVnA0ZTU5Ukdhb1JNd2JYNlZobFppdTR0eWJMdCtW?=
 =?utf-8?B?NlVPRWNGUmlNTE94R1dVeUhVdytjaVdQNDJMNmRLL1lHNkZMbFl5SjhzWVRp?=
 =?utf-8?B?UDA0RlArYkJNTlZjOFU2UGp6WjJza00xVnJDMEhPSlZOb1hMWmlQam9BTnV1?=
 =?utf-8?B?NE41SGo2T3c3aldGOFRZNnVGZ0pqdFhTYy9IS0JDVGlMNmh0c1ZxVTBmcXBP?=
 =?utf-8?B?SFdOSzY0VmZER2xWa2VKdnBPNWtWZERtaXdCd2VBN21tZFM1NEFBalAvN0R1?=
 =?utf-8?Q?Uj/w1yRPW4XO8uYp/H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14361880-7d56-4a9f-0af7-08de69b350e8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:20:01.2440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wM4/1MB2qfi6BWiC+imZD5iEqc/dCO8t6L5M7WYFgktjirRFejC4cVBAlXWPORy5JXWqKgyp2X7H0evAqX3wjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_132006_508817_68186349 
X-CRM114-Status: GOOD (  11.79  )
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

Set #size-cells to 0 to align with nand-controller.yaml. Remove the
redundant empty clock-names property from the NFC node.

Fix below CHECK_DTBS warning:
arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
        from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yam

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx25.dtsi | 3 +--
 arch/arm/boot/dts/nxp/imx/imx27.dtsi | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx25.dtsi b/arch/arm/boot/dts/nxp/imx/imx25.dtsi
index 54a116533c45883d9a2f7823a2e48b2f82a17b1e..d0f01f9b76afcfa0f38398ec29697b6d590a613a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx25.dtsi
@@ -613,12 +613,11 @@ bus@80000000 {
 
 			nfc: nand-controller@bb000000 {
 				#address-cells = <1>;
-				#size-cells = <1>;
+				#size-cells = <0>;
 
 				compatible = "fsl,imx25-nand";
 				reg = <0xbb000000 0x2000>;
 				clocks = <&clks 50>;
-				clock-names = "";
 				interrupts = <33>;
 				status = "disabled";
 			};
diff --git a/arch/arm/boot/dts/nxp/imx/imx27.dtsi b/arch/arm/boot/dts/nxp/imx/imx27.dtsi
index 3a8ca1c3f179361870d95136b1141c147132c840..99a8f2b1f7d319fd8d25ff696d53622f8badf0c7 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27.dtsi
@@ -560,7 +560,7 @@ fec: ethernet@1002b000 {
 
 		nfc: nand-controller@d8000000 {
 			#address-cells = <1>;
-			#size-cells = <1>;
+			#size-cells = <0>;
 			compatible = "fsl,imx27-nand";
 			reg = <0xd8000000 0x1000>;
 			interrupts = <29>;

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
