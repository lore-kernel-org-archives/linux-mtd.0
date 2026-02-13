Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06179EEA84E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 17:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=atiVlBYohqx6VqL9zuwnCtnmwhdcgFSIJndU2NzhiwI=; b=bo0UOaw8r/YtlrfOMGHnFMA2Wd
	fV6QoN8qqRZkd7oOG37N2Wq7Y4H33Wi6D+P2blzVx6Y7OuVD5KNYQwq/+AhFzSteRjc5aJzzQiMpi
	E2buIh+fcBQf6C0ySqjoAGKV8loJbXQHVb8iKrjh8qfNaEe3ThUBy/s7DzbkxBsmjxtLVqlrL8YW4
	9tYH0WORXGx12oJkAPnpv5G5bcD5K73KrmSPVUEnVHRrvc07cMPnQztrabYHFo1i7bFLww5dQlDzg
	Xo6wrHx66zfVFIAYfRG+3FLE7njN8v7oLwW7yrBot2X+rTUq/ozenuCPOSLCRg+KTTwY84vMkcrnK
	cBQW/dPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwfO-00000003iUK-2bWs;
	Fri, 13 Feb 2026 17:09:18 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwfJ-00000003iQM-3Ll6;
	Fri, 13 Feb 2026 17:09:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YU5lfnVp/E61IvmCPNJIF0OsZYaKYuvX2l9KyyF88DKn7VkTrdo/ybZ8d+MkebOTxm19jRUuB2MCQs6kZ+4p6CERdLLQoSW+WmW+ItNYcdI+IG8zv7g7lypDwf9p2KumZz44bZpjvekH13iLUVvvfioXks+Anw0DytXebVmYtUrH76RyKIom0+kCtGyXBuL0RIOvv40ZRuEczASRmG+vNBCmJnIUiqfxqoQC+7fXw65sktZZp4/Y2O15DSLv6aaC+o8wF6FsOf+HxznGG2yoVnUB71pNSqt5hx0tlGNeSLsISHysXkdp/+RGuMGLHHRIq/fLHaLDL3jC/1F/EojDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=382GMBohgYtFmfOD1KgGjTvLv56XBHmU/jk5/j9q6zY=;
 b=Pd+TSEE90ehPGc/HFRH1QkXSZDznW4lFKqUuPU//nP+FPc2sJgV8DZgeZyPk5n1GEWKEL6pLpRxcltItk6JplNStYUdQ7g6uRx5LGCiLN1SaAY2LcwkCYOhlHhubFknycRX3eKM9kx3LjgxqcHrky5UzEnxgYjmXXPu600St1sBZIX1A+YP9YWvDM/tG9I5PHxbi7ZNnLx4Jrs7koy2s2jT1ux1tdC8tZGKKJgPSIwH6Ofir5U7cYOFaRYbkpeZKqnEmdSFJVXuMArCHNUe27E0Wkt1pXFng62/aegtdSrTN2Kkcgjn4uSTJ5YLdCMdpkKf5TBBSkI6mVAyoJrIRYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=382GMBohgYtFmfOD1KgGjTvLv56XBHmU/jk5/j9q6zY=;
 b=Pzi2tmpOg0iKgNdjQAYSWziDw9wo6EPje7PXJD4p9Xs5XrzvZLO7+ymANg+iWVtFK2FZIhgjXQQ06kaGS8SALRHsYqorJvrvdxcCmVgcR+gq5QFX8ll58PAa9mleLHdXM2tj8p6B60DIDmre8twY6mMM2ixUqzMedqp976zp48mV6VIw1sMD4FhAVz3F+5wiJ5nNpKICM4Ou3yhSgpFS3umqJNrJb8SZFR04b8XeKfFFWoLVwFU/dYPwcD0nJaLguvVHLM/qayKjI9e1WrroFbJxxCFbPXWvNSePkmMKMJLOcL8lMvaeWYB4aE6K9Whl8E9K5E+/0Enom5pzQD8Ixw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10441.eurprd04.prod.outlook.com (2603:10a6:102:447::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 17:09:11 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 17:09:11 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 13 Feb 2026 12:08:26 -0500
Subject: [PATCH v2 2/3] ARM: dts: imx: set #size-cells to 0 to align with
 nand-controller.yaml
Message-Id: <20260213-imx25_nand_dtb_warnings-v2-2-f9d4b43bba24@nxp.com>
References: <20260213-imx25_nand_dtb_warnings-v2-0-f9d4b43bba24@nxp.com>
In-Reply-To: <20260213-imx25_nand_dtb_warnings-v2-0-f9d4b43bba24@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771002540; l=1769;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=HL+LU0xFmeT1u981bztMabAYv9UbIx+FjFQLdYBdYQs=;
 b=r00StN58ns0HHmko9RYbFxLzgLrt6dHXu3ZrbKVLAZxso5hqPBmLuJ17ylbFvjlkpr/e4xSYR
 cUrlYPsl9JMAAKiTEk/ofBTzYvsI6RwaW+itGUy8vrM744K0KLKJwWe
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR22CA0013.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10441:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a3c136-b01b-47d1-e376-08de6b229b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm84YVRLUTg1VUdDTU5KQlZGeGFOb29SNVlyR2VVT0gya29mTytnVTg3SFRF?=
 =?utf-8?B?czFqV0FrN2tIY1VpY01OTEtJY2VJSE1neDNGK0t3ZERVVHo2RWJ5eU9zeUtt?=
 =?utf-8?B?blhpc2JjUERvMmpHc0FpYmZDbENUQVoyN2J5Y1BOL3JrcG9BbzNFM2d2WHFJ?=
 =?utf-8?B?bzRDQ3lSN2VpYkdlQjMvSFZjTnVWS01IZzM0TmlrY0NUZ2Y1bzBaK1lRMjdY?=
 =?utf-8?B?TUJ1dVZxWnZaQXBScE56T213cWNMYnRwQkN4VWNrRDgvMkpOWmhKTFBtUVk0?=
 =?utf-8?B?K2JGdFZWaXBaNWs0L3I5cG1jWExGK1hVTUpjQ2xnemc3ekhTUUVPTmJuQ0cv?=
 =?utf-8?B?OCtMTkRuQW1rK3lSUml1Q0tDc3RuQ3BtNnAzTkx5Ky9OS3N2S1FWSFhWajRW?=
 =?utf-8?B?NXZQNlY4bEU5UThaN3dkQk50RnY1MzFmMlNTOFhKdlJhb0h4OWFnR1FhWTJp?=
 =?utf-8?B?U2JKYTdYR21sTDVqKytWRmxiTWlLcXVNZFkzNXNaTjBHSEUyanpWWGVjYytx?=
 =?utf-8?B?MHZUblV0bkRJZFNWYVRXZkFqUWFLQmNnOUIwaitGYnMzYnBodnVvSFFIQXp0?=
 =?utf-8?B?cjNqVC9pWEVqSDhmQ3lVWWs3QloxbkFtV1M4R2J5NW44T3RFcnArV3ZvNVZt?=
 =?utf-8?B?Q3l3QXR5bWJhMWE2VXVhTmhBeEZGZ09qWDVKK254S0RJb1BULzAxK2ZSMWcv?=
 =?utf-8?B?Zkx4am5pM0J5SFA0WFc4R3R5b0kzakNOZ3lOVkV4a0Z0RUV1RWttRURjZEpM?=
 =?utf-8?B?WGJyOUFzbmJCMTNCbFByTjI2Z3hHWFZCRm9wTGRDRk8yaUp1RlhaTFo4ME5P?=
 =?utf-8?B?UVBzN2JNOWtETTZJYW9JZUtPdldUeEViSDRUZU9yamhlNk9ISGtBbzV4Ykxm?=
 =?utf-8?B?cHBUSURFYVRHRUNaeVRQdGNteFFSRStTWFAxcXd1UFFhbEh4OHgxK1pPdGJU?=
 =?utf-8?B?YjlyVENHV2t3OFhHZWdIUTBuSmRtR3VPanlidUVobVVJdDZQRU1FeFdwcTZy?=
 =?utf-8?B?S0dqWmNTdEZqMGN4ZitQR3hGSytBZ29Od3FLbEM0SEx6UkU2aDFRbWZFRWRZ?=
 =?utf-8?B?ckVJT0Nmci81U1ZaU0NoR2k0SUpJQWxyNzZnYVFES1gySCtQUlZoZ3poQjBN?=
 =?utf-8?B?cFhqUWRFZGVaN3M1SW5GejNIUWo2bHFqZEhaeUxnYmtKQnQ2RzBQM1dTRVVq?=
 =?utf-8?B?N1ZqWHBGQlc1ang5NjVEcTM4VVFWVG9ndHJXR212Snk5Wi9kRDJvL1ppK2VB?=
 =?utf-8?B?ejNxVnkydmkyZzNnTU0yYkowTmhzM2puR2ZMTnhVMlF6dE10OVJtaXhqSkw0?=
 =?utf-8?B?aE5pK0t5WExKaUJPR3JVK28rSE1mZkJwVHd3Rzk4NXFqZ3Jqc2RPK0lLSGZ3?=
 =?utf-8?B?d3lBOUxiOWRkelg5QUxvb1RnUlVFVHJHYWFGV2hlSHlrZnFKM0YyR1RTaDBN?=
 =?utf-8?B?Rk9FYkJ5Uytrc0JBRFhWZXJZNlBmWTFUT2JZc2pNdTZ3b0lNZHpHL05BQWo5?=
 =?utf-8?B?ei93eGJQeURVRkZseCtyYWxFdEgvVDJkTnU2ZzkwU3Z2WEtpYkRnRytRaU56?=
 =?utf-8?B?azlpZUEvVjhTcVlYcjJpTG4vQ1ZkNm1jdEJGRUl1ZDd0NUNZbVFtZlFPV3Jj?=
 =?utf-8?B?VGQ2K3dkY3FPOWExY25tZ2NMUUdTd2MxRjJrSW42cTArOG1MaWRLck5xNlpj?=
 =?utf-8?B?dW9nWmRxTDNpNFVFQ21wd2s5Wi9JbGkxaHlNMjNIYjBSSlAyUWZRN3NRUlZC?=
 =?utf-8?B?cWlaeWJZMjVJSE83Q3JIREw1aWdIVDJ1L0IwZEtXemZWTDlmMFlYRWE3SVN3?=
 =?utf-8?B?aTV4SmF3eDZUMmlRSUdxc0lVb2EzNmNYTGhlQjR2Wnk0b0lESlkwWkl4Nklv?=
 =?utf-8?B?S3BTZld3N21DcStDSzZZdGxWNVplcnJmTnhaYTE5ZmUzOUthSUNFSUtWY2lX?=
 =?utf-8?B?cUo5QVRVRXg4VGhSYUNORytZbG5qc0ZidFYrenUyWHd2djlnajhFTElhczU5?=
 =?utf-8?B?cVFJM0NCSlJ3YlUvQzhST2RrSmxKckdabFI3bVVhMnlwMzljeWwyQlhOenJW?=
 =?utf-8?B?bnNoVCtSQ3pGYmlITUY3a3psSDNWSHp4MkE4d2dGL2ZSUmM4MmxRaUt1Ums3?=
 =?utf-8?B?Y2dMSTUxZ1BRbDBOU1lKeWdKdzNFTEFKTERsU1d6OGw5TnI2bkphL21aQkRS?=
 =?utf-8?Q?wjMZuKUTGPOoXYVC+RPe6snTLRotA5rTP8+b+5IrLztb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHpKUzdFdWtINFF0OFhjMTdWbmgvWlFDSTlUdDRwbjlpeVhCKzR2ZTYrVjdG?=
 =?utf-8?B?akhkUzlBS1diaUh2emhCYjBuMUFuaG5oZkMyamMzTFgxY284V1lEblpHQVNq?=
 =?utf-8?B?Ymp0a0tLbUYyc2pkNEdHZmhkODA5Q2luWFZwZUpnU1NheVdkTXFENWZiaUM4?=
 =?utf-8?B?K2Z5V0xEV0hSQ1k4T3RyNXpBcXhkOUQvOGpLa3g0SnJRUUlTS0NyZ21UY0Za?=
 =?utf-8?B?WVJXaVYvY0M0YmcxT2RGWndPTEszdndWeWkvZWtLQUllbk9hdG1tbXVLaUdr?=
 =?utf-8?B?QUJsdm9XUkdLV0VmSk5nd0REWTNkRDBHKzcxVXFZVEdrc2xFN0VET1l2bTBJ?=
 =?utf-8?B?Sys2Wmp1dFJxbi9qTGhZaTNzUC9Zdm5ucTUvS3lHSmhRNk00eGRsMjF6UHVq?=
 =?utf-8?B?NjB1cUpOOHhKVUxTK0RaYkMvZzhlTStVeHZPaUJJWnlReFdhY0Vhd2E2SnRl?=
 =?utf-8?B?RXpybHZJNGlUSWRJbFUzWlJTZnpFL0xQMUg4blNGK3lCMkFYSDRmVkdOMm9L?=
 =?utf-8?B?b1BTbkZGcmZzSUJXcTE0YjZQMEw3Qnh5Y3VWMXVGMVBXMnBlSE9Gb2lmQitD?=
 =?utf-8?B?OU9FdGxBdVFmVS9VdkpHM1JNTEducWhQOHB3WmNCWTdnOWZKWTNQcTdHRkJM?=
 =?utf-8?B?bnMwS1VQYUJOZUluazZlNEtIc1BManV4alRpR0k2V1ZSREJRTGF2K2h3M2Mw?=
 =?utf-8?B?TVMrUCswS3hmbDY2S2l1WHM5WDYwTEExTXBKMTh6RUFxekhlWFVlQnM2RTVN?=
 =?utf-8?B?R3hNckdEYUVjTXJYdm8vMkVlbUh1Njc2d0ZjaGY2UlhwMnFiaGhsekZYeE1W?=
 =?utf-8?B?a0ttV2RzYkE3WDJxa3RxVDJ1NUYzUHI0OVFmN0ZCUk1UNEF4UTBzcWxsQlpm?=
 =?utf-8?B?VTkvaG00WTVWRFJRb0lBSEFtZ3dEK2tzSFRIcXJTcWMvRlNhYnpKbUhQckhv?=
 =?utf-8?B?V1VNenIyY3BiV1k3RFJYbGwrYTN6ZWJsS3RFQXVNcXlOaUtWdlErWm1sMHZE?=
 =?utf-8?B?YkVKKzJibXY5Z0R3ZGRKMVNPdHhwZzNHY3ZDU2lUK2pCNGZTcVl5UExWMms5?=
 =?utf-8?B?Q3NhQzdpWnVHQ0FibnpnUVk5TGhFRVhtTmhBcjFyYUt2WWgyMCtqSUVZRTBr?=
 =?utf-8?B?L0dFOTZmOU9YSmJLOTV0ZmNGUWl4WG1YOXp4L0d2WDROalhQM29LbjQxT0VI?=
 =?utf-8?B?Y212bU1FcE41UFpLd0JGYVFmVktyRXdDZFRBSllQK0ttVlkvbnJhQnhXZHdU?=
 =?utf-8?B?dnVRZDd6NjFjYW00aXAxZSszeTZNaXRiTU5GbFVhOU41MXA1bVlBRkNUQmMy?=
 =?utf-8?B?OTBQaG9oQXVwQmhydnJPNnVaalhxaVNVWVdqU2VXMFVaMFVYeGdTQ2VpMUd1?=
 =?utf-8?B?Rno0TEZQSUswMWVudGRwdzRON3FnaDE2aDZiSkRQNmJmQVhsenBPMXE2Tmk2?=
 =?utf-8?B?M2Z1RjQ0K3hoeGVoSzFESWJSYUhzWTU2cjI5eGo3cEtHbmwwcFB1dG5nK05P?=
 =?utf-8?B?NlhJU296QkV4SGhqdjBCWWhDR0g3cjV5cHNlS1Ntc2xld1E1RFBEZjk0M1dX?=
 =?utf-8?B?UFhFTS9rQS9iTGNXcmNVdVpDZDVKbDcyU2Z6NmJISStybmNBaHNkN2syMlJi?=
 =?utf-8?B?TzBjL1RxUWlHWU1nalRVZDlEYWVKcWJHK2FLT0NITlh4dEJoTU5FNW1KczhL?=
 =?utf-8?B?NFhUR3YzQkVxSnduKzN0V3dacUlHbG9VNmFxR3c1ODJPSUxyQnV1REE2VEQw?=
 =?utf-8?B?Z2ZJbVhieHNUenR1dlkwbDRzZnk0VW1weWd5L09qQmxHY3B5cHVhV1prR3Y5?=
 =?utf-8?B?Y1h4YXZiZGcvems1UE1VQlNpN1E4Y29tdmMyakRRdHIwMWVrd2ptcm1pUU1y?=
 =?utf-8?B?ZUFIelJjaVV0VGJVTlBhQWphMGppM25xVWdmL29IdlhRNmhwREhQRmJrVlpk?=
 =?utf-8?B?VEYrTUJCUVg4VDFidENMdmFlWW82OU42V1RnZVlYUEIxWmhuVFZOMTlEU1o5?=
 =?utf-8?B?b05XcTBvL0ZCQ0lDeFFXejZaNzJwNkVRVnE0ZGNJQ0Nud0dHaWJOMXh0Y0FL?=
 =?utf-8?B?UEZ0N2xNcDliREpCZ21hTDlZYnB4R01QMkNHVnY1L3NxRnNkbFBrVnEwM3hO?=
 =?utf-8?B?U1Nzbk9xb0dRbG9abldHUTZWN1NVcUdzWVFRS1kycldQOWdVNTlZVWthbkNl?=
 =?utf-8?B?eWhNVXFvTS9rbWJUMzRNL3R1eG1kZTl4eHczRmxWb2FsMjEyM3dDaVlrb1E3?=
 =?utf-8?B?aDEzYThKeGV1UURVRTFlTjNwcmt6NVdoTGJyTFVuN1pJVVpzVmpnN3FWcHFJ?=
 =?utf-8?B?UE42OEZEZUpnNjZXVytnYnNFOU9CVytsZlhrMTV3ZFB4SXl3cGVYZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a3c136-b01b-47d1-e376-08de6b229b15
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 17:09:10.9847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62cXvdzjGgRTyIWIKTCZTGVo2JJSnp6dzaR9sL6KPmIxWJSYtev9t5JZr1K/WE2vl07mwe/J0b7EHdMcpFz2Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10441
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_090913_852697_8E075A18 
X-CRM114-Status: GOOD (  10.83  )
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
        from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
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
