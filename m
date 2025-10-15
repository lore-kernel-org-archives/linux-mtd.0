Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF02CCD18E
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Oct 2025 00:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+km2s3xgOzXzdCaOIwF4tvw/82h6NW3AZKucgnvWL3Y=; b=sWyEI6gEYL9XP+
	uPalWUttZKAeAI4j+wY+QPP7HZgkgwnB1Hy8R/2WGiMVnXpDRACE5yeGuYCO2ckhIADvVn5BIeua7
	ahzLjPZnQKWfL5M4CSNyvamhGjR51hcC+MijqVCCSU9fLcN1bhGJhK7xtD1m+LgQ3DFE2OVyrrgUp
	vkIt2h1nZJ99Et8kknGRdj22C3/OA735TbAnPz/5OZLkAOpy2bB+ft09COsvokJGVDTJHMhv0oei4
	fupQnRhQMfrCnIkMjKk2/RaDHHgCMI7n6hSr+wH3nYogGoNudQrRSuvG6q6/Fm26NjImk917hovdd
	Ss0ufe9l1N7WSRM2ll4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8p9Y-0000000053y-2y4n;
	Wed, 15 Oct 2025 00:14:04 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8p9U-0000000052P-2eNW
	for linux-mtd@lists.infradead.org;
	Wed, 15 Oct 2025 00:14:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XI2CmjU+fhPVQYxHBXDIHkbNj7wivOEHc4wmocsmbq3M8zJJBi9uJjHWLJYzP7cg3rAqLQqgU1vYH4ZjoLua1/ykk4KKM+0xOQNAxrItSIKnl3BhQljmZHwcyjWx/d3OQ2+M+gOpt356LR0xcNuCvc/qFueX6LIwY9Qd/DkVIi0ABan6CTVu0rq9BAACn5AJF82cwdd6zSaAMF5SZWKXxaWBy7eirlAaS55V84+XwJFTgBswdtXVG69fS4odRNCMoJ3X2z7cXF7/rCXfPcWt+vfX8JFq7OgYYNyuOsAL2BPKs3+bid8QPLqzOQzHiAG8TZ66lTyuHSQ/m6dcH0UOMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvoazLV5J4TEZmK5+WQw+H6HKSf1cCX8FpgumH6O5PA=;
 b=YZP8rxlcjtzIrnO1DaiSAI/0pT/MrEAhV9VEjDaePxeBNFRWeETsBF/HSJxMIrit1b0ntgJRk3rWG/mmSlA4GD07Z0f0Dt8FHjLGUXxrLnwTcuDFp0YnmymspsjVVmDCK2C+hzPyipGYVjgWyNRmcmGHHW6h2eHRA/ozT/Pfyxc245JO+ioqTFnEQXBM8KWL/mz7SyvYTBupuQWuOzWxvn+tdr8Lr+w8vEiZ0w0IThIvzU5njk2mDkqSbSg15EGgRuN/vfan0QeTNNFMiOLHcZefV0QVWuDAvOXHlL86n5Fbu2sLLyGhfawWi0mugOEplQRmTAjvLvyeR3p0KNXeHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvoazLV5J4TEZmK5+WQw+H6HKSf1cCX8FpgumH6O5PA=;
 b=biDehQ5gK2EW4zZnIEaOHNerkS2qnhwNNJhqpfpazdKqy6GPMO8ZysLs+okiuZokYYE5xwWZnwudzrRxoQY5BF0rm+O0R8gBdAID+DpoDaO6wdfYeG0za0y6k8o3jOqnLEvQyUpnJLoHx12SzcUO0uA3u3HBeHf2jtUPYXlcdBpfeY7L4d961cwbQsok5wKAC2imVd1aeMBO0Mf/qefmxJfE2vMSc46YVU1NskYiVhAWdaOVUKnRe5Z1DLMkzbLduEst/ASI/ugVlpGqvZAM0E0IIe9gm3mOWoeVCp/SkA87pmGu+xggUEXX/sDz8bkqm+C8Fti+fnEo04oT99LjOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MN2PR03MB4927.namprd03.prod.outlook.com (2603:10b6:208:1a8::8)
 by BN9PR03MB6041.namprd03.prod.outlook.com (2603:10b6:408:136::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Wed, 15 Oct
 2025 00:13:48 +0000
Received: from MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419]) by MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 00:13:47 +0000
From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	linux-mtd@lists.infradead.org (open list:CADENCE NAND DRIVER),
	Dinh Nguyen <dinguyen@kernel.org>,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Subject: [PATCH v3 0/3] Add iommu supports
Date: Wed, 15 Oct 2025 08:13:36 +0800
Message-Id: <cover.1760486497.git.khairul.anuar.romli@altera.com>
X-Mailer: git-send-email 2.35.3
X-ClientProxiedBy: BY5PR16CA0001.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::14) To MN2PR03MB4927.namprd03.prod.outlook.com
 (2603:10b6:208:1a8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB4927:EE_|BN9PR03MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf2da77-0e21-472f-2817-08de0b7fb5d2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mi9WVmswUmgvcStkV3JpMW5MeWtUeldtZDBrQTRONjdkb1ZIQjZsVllDS1pU?=
 =?utf-8?B?a29qVjBYSHR1TG42blNLS1l5bEtDcVlTbllSeUtDa1FIeVIxQm50OXUzTmh2?=
 =?utf-8?B?NXNlOStrK2hsd3E3S3BxaEYzWEIrMXVHK2xnZnJVMTZmelNwQll2SWNBU0VC?=
 =?utf-8?B?ZXFlK2RnbktPQW94WnJuUG9CUVVSZEZ6ZFd1VTgxZEMzM3FOQ3lCMFB3NzVD?=
 =?utf-8?B?aFlEWGNLbCs3SVBKRGFJTzNuakc4SkVzdjF4bEFwYVZtRlo2UEZiNDFhTTV1?=
 =?utf-8?B?WDNRTWJUWVRjRklCYk8wcGdPelVYSXpReDdDSWpZeVNmZDZ4MTlGSGdLR2JC?=
 =?utf-8?B?d1o4ZjljVjEzVVJMN0RGRkZZZW4vVU9WR044UmxWYmE2dnRRMjBncmZldG51?=
 =?utf-8?B?R1grSE5DN1lrSTBYMExYcURFeG5yRFMvRnh3RkhiL1BHUTBPR0xUbis2aU1l?=
 =?utf-8?B?SWZ4S2ZNejZmTWNGMFloOUdZY1V5c3haSFhrTFF2Sm85eWdsY2o5YzlJUWs0?=
 =?utf-8?B?VjlGRnlwUXNaNURzanc5bHBIWlVWSFFYNWdmdDBXY1lSbVlIVlNVZWRDN3kr?=
 =?utf-8?B?RFhpQkV1V1NpNXhnVDcvNHRLcjJqR1Zzend6b3lrN0hIYnFNNWhzVko5bU9W?=
 =?utf-8?B?WTlLYk5XSU41Tit3TkhEOTJSMEhaQUpUUEplVCswdndtUllzZlltZlJxQW1j?=
 =?utf-8?B?WktXd2JTK1RRelBRemYxSVRhbnIrRytFQXB5TVN1elNWY0FaOTJueGU1YkFI?=
 =?utf-8?B?a3NPcFFGL0hnano5MHNVWFZQZlFQd0NFTHFvdFlrckFWTHpnZGlEcVZBMUxP?=
 =?utf-8?B?aVBJaFdkeGs5aVcwNUFES2Njd2JRUVZlT2R4VVNBeGoxV2w5WEh2RE44dGJl?=
 =?utf-8?B?MlhBUy9MVmR3WFNZZ0g0MWFLNjVUM3I4VkMwSHZZRWZGNmJ2YWNKOXZ5d2hD?=
 =?utf-8?B?cHNLVkZGOXl3Q2hQcnVXNWNPWkZjcXBLOGJWeklEbUM5djZjaWplU256S0RM?=
 =?utf-8?B?bktid2prbmdVYXRuVTBVOVVHc3duSEcvb0lwemNPNmJEL3BsU3NSZ3ZDUVRs?=
 =?utf-8?B?Qkozb1ZhZGhmSURWdTIrVUZJa1lpTyttTDhmdnNWYVVUNDhlRm80ekgyT08x?=
 =?utf-8?B?bXh0MUREZG5oaE1zSzR0YjBXbnZQUitLM21GdlNHclg2QlF0QjRLYTdLMkxU?=
 =?utf-8?B?OUlZaUZhNitaSzFXUHVEY0JCdStRZFE0Zyt0NE4yYjhZQ21CQXgxc1dqcTBU?=
 =?utf-8?B?bFc5eE9Bc3E4TThhY3NFOTFvRlo3bmVqMzJqdG00WW5nZWtaQlZ4ek5ER0RX?=
 =?utf-8?B?a0NsNkxmTk1rdm1xK3p3alZzRDM2R1NJbVZuQU5TemVkNE9ZeURmd0ZpRSth?=
 =?utf-8?B?Z0FBSWlmUnpTRE03SXpOSnhUMHZ2QzVrS0hXOGNZQWIwQVFKVllnbHdJZ2hY?=
 =?utf-8?B?T0FxQUdJMm84TjhCTjBvOVVSQXlaVXlzZGdEWVI1NVU5UU02NXo2VzVkK0pC?=
 =?utf-8?B?ZVoxbk1jVjBOM0JRV2dTTDlyVEdMcmtuKzBTc0ROMHVDamh4YnM4TWY3Vytl?=
 =?utf-8?B?YjNtZU5jcU5GRFdPZDNZbTNFTkY5M0V1UENNMk5SdVp3ZXlXS0RuOWcxS3E1?=
 =?utf-8?B?MFFvdlFUY3hQeGJSTjlOQktYOHBub1p0ZDc4ZDY1a0l4NGVHVUJLTEdFS0Q1?=
 =?utf-8?B?by9IbmlmRmV0S0lGQWVZcmZIRERVNFdQMkgyaUg3WGdVMWZ3d2kxWFZ1MVlX?=
 =?utf-8?B?YTRDNVR6OHljbWtaZmpxS3ZhcGhWRmh2UFcwMGdmbDJCaXZ0ZktTQ3BkSGJX?=
 =?utf-8?B?K0hoeVM0cnVsejUzNUMwclpFTFI2Q01ZdTcrZGhoK00wdzA4RWlzbkx3WDVw?=
 =?utf-8?B?RFcwT0EvUEI2aHREQlB0Z1JqZzl0YzhhckhSbXljRzB1ZGV0ZElISzNTUnNV?=
 =?utf-8?B?ejBiK0hnN3U0ZHcvOU5uOEpjblNIUkJVdmlyOXc3U3RBcGQzKzE2bnlRekF4?=
 =?utf-8?Q?CCNoCOENJdE+LNSIXhCZ/JDf4RGJh8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB4927.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N05uV2FOQlM3YzE0NlNya2pGWVc0RUNiejFRdm5GQURVYUxhUFFSV3ArVFdj?=
 =?utf-8?B?NnJxNWsyUVJwQVFldFo2TzVvNUpCTy80ajhEUlV6RFdRWHRCK2xqWjhIV0tU?=
 =?utf-8?B?V2JHNUhOV3RSUndpbXpIVWF4eFBJUHc2RmY0N3FlMHhIZUFtV3piNFhVMk16?=
 =?utf-8?B?TVVuNmNFWEF3TnNFYU9veDdLQzdhekFzdnFZRmdmeG85RFNXazIrWUYwT0ZY?=
 =?utf-8?B?d0VqcUxrRWlSMWJMUHZsZ3BsalVaaThZcWxwQkNXV09sYllnejdQUEVYUDVn?=
 =?utf-8?B?S0RQV1Z3czkyMnBkL09iL1dMZ0FTYlVmZlc2VTVaajVNbHhFZnBnTW84QmVM?=
 =?utf-8?B?RlUzbHZ1aVdmL2N4ZVg0Ti85OFNLbGUyV0VLdFR0ZkRsb0tVY0IzcU00RlNY?=
 =?utf-8?B?UXhad1FNV2swdGxkK0dsdHhaQUY1UWdWRVN0aXE1UWUzSjArMkRUQlJBelY4?=
 =?utf-8?B?YjRrUE00MHF6bmRuWUZ5NXJhNTlDeElWcnk1ZlZURGI4UXhLVWtUWWIveWxK?=
 =?utf-8?B?ZWloVHdxOGs1RVlUMWJBS2FUOWZJTVFMdHRVREZwWHZSQW1WUC9vNUdmN1JB?=
 =?utf-8?B?WkIvOWI2QVdmd3JZbU1BZFFkYTV3N1hhZ2FqaksrQ25tZ0V3SHJwenU2NzRh?=
 =?utf-8?B?ajFZUmRzNUpGK1hlMjNqS2kxYjlNaXYwMFNYR0xGUkZxemVnS3JWdFR3Mksx?=
 =?utf-8?B?ZjdMcWxUSWVwMkZuckpYa1JNZ1kzb3JDaHRJaGFVdVpFRWo4eVNldGpWRFFV?=
 =?utf-8?B?VEx6bUlvZDV2LzZkTHl5QWJ1Z2ZhbjJWSDhRd0VJalBwb2RJN0gxQ0pUSHVO?=
 =?utf-8?B?MHRlTHkyUk5taGJSem1TR0I5L1ZSSWFFbFVGQnVSRXZDZjVYR2U0NHp1Zk80?=
 =?utf-8?B?Zjh2dDB6dUNTMWVRdjR1dUorYXZRMmlnMXdDSU1TM2tQc0k4cWlTZy9pQlVR?=
 =?utf-8?B?aGVrdFlQS0RydGJ3b0gwWlR5YUs5UVJDK1hhZEtEbCtMa2dZK3dndFhzZnc3?=
 =?utf-8?B?WU9qZFRvYm4yL2JQK1lJblJlQklYY0FPMGl5K0FyczQwSXZHdEppZ081MjNN?=
 =?utf-8?B?U2Y5cENSTVNpWjc4LzZ1RTlWbTh2blZTYmtpMFZ3bHY1TWJ1Z3ZPTVRobTdX?=
 =?utf-8?B?aXVYM1B3TWc2M25xVS9xbXVlNHNBVkFjcUtUK2NOc3Z4RHR2R3BnUDhwdTVz?=
 =?utf-8?B?ejljaURrdkNFVVBscWpaNHlBNy9XYmowTnEvaVdRcXFNT3YyZ01IclQ0akpP?=
 =?utf-8?B?M0NKTUg0KzBuSjZKVlZpdE8rNzRVZnVibGlEWGoyN2JhVWlhRUszVUNlK3pW?=
 =?utf-8?B?UFEvRCtVQXI5L3FZWnpTUGVPUEJzS1R6eHBDc0c5amYzSnV2emNtZWU0MGFk?=
 =?utf-8?B?SDJiV1FpT1NlREZFL2xMNEM2NUJObmdta3BKeS9oMFh6djFBZUcxd3JabXlk?=
 =?utf-8?B?VlVpYlZUaGRuUWVrQ1B6V0hjQnBrU1Z6YmNnTHNMNzlZaWhHSml1dUx3TC9N?=
 =?utf-8?B?RkNXTlV6N0ZVVTZKVTNGVU9sODdVaHhCUWNPWE5LMmRJZ1RJNlRlcHliTkJs?=
 =?utf-8?B?Q1BjUmFLK0xCdjFLdWlMVitHRmhBcUc4THpwZ3hWTHVrTExMZHZQTWpzWjcv?=
 =?utf-8?B?OERYVXJBcTIxbzBGUXdjak5QU2hhS203UDRsWDZhYjRFTmFDcTFVV0JJeGtw?=
 =?utf-8?B?YTZoeXYrZmpqSWRuZTdrN003RDhPUmd5TE9yVnNNa0xEck9JM3pGNUltM2FC?=
 =?utf-8?B?c1VtZjNCZ09lcHVsK09xS3ZrekZMSnh4bGo4cklBRGh0cDY5aWtnV1pwOUF5?=
 =?utf-8?B?eUZBaWhDU0lKZEgrSkZ4RmRRSHFuWFJTcUh1Y0NkZE1GNktLYUxZV2pXRnRt?=
 =?utf-8?B?ZzBmWkFHTTNkd0hIVS9EbG9zV2hxaS9VM2ZQWEJsN3pyeDhQYWwwb2VLR3Zn?=
 =?utf-8?B?SDIxREtsem5yZmM1Yk9BaDlWZmovNU1QUThBb3VCd1I3WXFjeS9kR0xvblVE?=
 =?utf-8?B?d3phazd6T0NJNmgyUTgrTzhyN056ZndNT0xzRUU0aUNTVTNValN5NWtIemcy?=
 =?utf-8?B?SndGd3pUS1Z3VUR4V0VDdllYN1hYNmRpeTFobXhNdEF3NTI1Y3llSWxLQXFL?=
 =?utf-8?B?Q1dQR2dlODNHRmVmVUxqQlBEdy8reUQ3V2pJVVE5cTgzODR6SUYwRWhNWFdS?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf2da77-0e21-472f-2817-08de0b7fb5d2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB4927.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 00:13:47.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dulaP5N7KRs5UOhHVNvxKO1CwBAz3kDk9BNtrSLjjpyivKd/7euEoEsEbUAgK0FVbfpgkV1F+UwCvtBV67mE9EMlWv01/L5dCRzxQ7DAI4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_171401_100914_0940D5E7 
X-CRM114-Status: GOOD (  11.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBJT01NVSBzdXBwb3J0IGZvciB0aGUgQWdpbGV4NSBwbGF0
Zm9ybSBieToKCi0gVXBkYXRpbmcgdGhlIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvcjoKICAtIENh
ZGVuY2UgSFAgTkFORCBjb250cm9sbGVyIChgY2RucyxocC1uZmNgKQogIC0gU3lub3BzeXMgRGVz
aWduV2FyZSBBWEkgRE1BIGNvbnRyb2xsZXIgKGBzbnBzLGR3LWF4aS1kbWFjYCkKICB0byBhY2Nl
cHQgdGhlIGBpb21tdXNgIHByb3BlcnR5LgoKLSBBZGRpbmcgdGhlIFNNTVUgKFN5c3RlbSBNZW1v
cnkgTWFuYWdlbWVudCBVbml0KSBub2RlIHRvIHRoZSBBZ2lsZXg1CiAgZGV2aWNlIHRyZWUgYW5k
IHdpcmluZyB1cCB0aGUgSU9NTVUgcHJvcGVydGllcyB0byB0aGUgc3VwcG9ydGVkCiAgcGVyaXBo
ZXJhbHM6CiAgLSBOQU5EIGNvbnRyb2xsZXIKICAtIERNQSBjb250cm9sbGVyCiAgLSBTUEkgY29u
dHJvbGxlcgoKVGhlIEFnaWxleDUgU29DIGluY2x1ZGVzIGFuIEFSTSBTTU1VIHYzIHdpdGggZGVk
aWNhdGVkIFRyYW5zbGF0aW9uIEJ1ZmZlcgpVbml0cyAoVEJVcykgZm9yIHBlcmlwaGVyYWxzLiBU
aGVzZSBhbGxvdyBmb3IgaGFyZHdhcmUtZW5mb3JjZWQgRE1BCmFkZHJlc3MgdHJhbnNsYXRpb24g
YW5kIG1lbW9yeSBpc29sYXRpb24gdXNpbmcgdGhlIElPTU1VIGZyYW1ld29yay4KCkVuYWJsaW5n
IElPTU1VIHN1cHBvcnQgZW5zdXJlcyBwcm9wZXIgaW50ZWdyYXRpb24gb2YgdGhlc2UgZGV2aWNl
cyBpbgp2aXJ0dWFsaXplZCBvciBzZWN1cmUgZW52aXJvbm1lbnRzLCBhbmQgYWxpZ25zIHRoZSBw
bGF0Zm9ybSB3aXRoIEFSTeKAmXMKYXJjaGl0ZWN0dXJhbCByZXF1aXJlbWVudHMuCgotLS0KQ2hh
bmdlcyBpbiB2MzoKCS0gUmVmaW5lZCBjb21taXQgbWVzc2FnZXMgd2l0aCBkZXRhaWxlZCBoYXJk
d2FyZSBkZXNjcmlwdGlvbnMuCgktIENsYXJpZmllZCB3aGljaCBwZXJpcGhlcmFscyBhcmUgY292
ZXJlZCBpbiB0aGUgRFQgY2hhbmdlcy4KQ2hhbmdlcyBpbiB2MjoKCS0gQWRkIG1vcmUgZGVzY3Jp
cHRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGJvZHkgdG8gY2xhcmlmeQoJICBkZXZpY2UgcmVx
dWlyZWQgZm9yIHRoaXMgY2hhbmdlcy4KLS0tCktoYWlydWwgQW51YXIgUm9tbGkgKDMpOgogIGR0
LWJpbmRpbmdzOiBtdGQ6IGNkbnMsaHAtbmZjOiBBZGQgaW9tbXUgcHJvcGVydHkKICBkdC1iaW5k
aW5nczogZG1hOiBzbnBzLGR3LWF4aS1kbWFjOiBBZGQgaW9tbXUgcHJvcGVydHkKICBhcm02NDog
ZHRzOiBzb2NmcGdhOiBhZ2lsZXg1OiBBZGQgU01NVSBub2RlcwoKIC4uLi9iaW5kaW5ncy9kbWEv
c25wcyxkdy1heGktZG1hYy55YW1sICAgICAgICAgICB8ICAzICsrKwogLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL2NkbnMsaHAtbmZjLnlhbWwgICAgIHwgIDMgKysrCiBhcmNoL2FybTY0L2Jv
b3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4NS5kdHNpICAgfCAxNiArKysrKysrKysrKysrKysr
CiAzIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCi0tIAoyLjM1LjMKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
