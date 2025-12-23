Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551AEE6B26F
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 03:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i8iAchF6HfY+3EbJsuBp0xSJvscAxNE59y8pZkOxk48=; b=qtdgBnTn9UPRaB
	6SVYY7KIris8ILNQ+MtY6ERlDfPfrfDxYdRX3yJzUzSf0JkYXHQL0LPgd9Xf4GNipWJ0oEvKoUr7W
	RCcRMMR2QbuyCMOfs9Ttp/HP0RB2faaVU2BlWDc6aNFnKJPHgJ9V62VQsC46pLatUDfoIJa51vS7U
	bIiOuP8h9N74bX4shF/ik/POo/lSZEkGkM7xR08Z95Gzvu3c+ZI8Ulbc23v+ESrJp9wHAPipq5bQX
	6ikySeBINU2bmLs3UB44avzxOD2RlFmVjqu/NUMNWuJxmQ88WhU1/fJCYeilrDEXBUQ4Xbq4oKwoz
	Fxtm7U5HvmcWdSRdoeOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXsdA-0000000ESEV-3fuA;
	Tue, 23 Dec 2025 03:00:12 +0000
Received: from mail-northeuropeazon11010004.outbound.protection.outlook.com ([52.101.84.4] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXsd7-0000000ESE1-4146
	for linux-mtd@lists.infradead.org;
	Tue, 23 Dec 2025 03:00:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrYN00FgWcgzGbfcEQ8+0Hdp+qlJnZcVCaxgzzmex56hSKvpXS1u1fOjNhW2c63a0fB2fqfW2fIUX6QNDCXhvPwdyAah0XuycXSJHFRbkYWmpThJWvA+y7RXOaunicgJSs9eQPkqOmTMkzfq9vO3ZITaG1Y7W0GWVDF914N0+ZskibpXvwotisXn2aH39g9brWmCu/D9QGgLtfJ7DjRsA4j7c9sBBnMWfqwYH/UHHhX6A0Bu8vyiVwCTcnRl1aOTMyUiUVdmwsSoL5wUtWgz/DwBWVR5kDpMpXiVYuuOMvtnGIcHj60bztm7ISfS8riRhuwGRJUqFWe7Qtl97mna+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iAujM2jTMOhgUA6EYCsSVRJgXcIxg1hcR+0Q6Kz8is=;
 b=dnoZgC4IkYzK3KYQjmME84ngzaqTmV9pSbh9JIpQWmbyCnOzBKzOdrJC/z9tY09TPzMPlOTtyXWlQS0FIDPuPyfZFnyzw6owF9MfAH2XKbjm8PDW3exU22N1HR4mz+t6v4PMfK8KIMyhYTwLOlX6kiCPuKQQezTbIDITsAI+osJhg+AN2kA1AR4vFZGow6yU6Ow5l97oEQjLEfnoMmQlgzAd9RVuc2Ff3A9dfS5z566p7+sKN8A3we098j7pgmQkZhqXAdMlmK5qcqJiM8BXjEVCPtSdOHo6E8kptrou/4ZPmbuFpj9SNcbF+FF5snS2g8qH/Wk6XlMdEhtF/kjmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iAujM2jTMOhgUA6EYCsSVRJgXcIxg1hcR+0Q6Kz8is=;
 b=M71ofcBk0viDgArBt9v+ONVGkuZCwOd/g7DcWxcKxJywhcEF3t54QTr0qkiL13YvQaBRpX8/2P4L1yUMAgdrkiLpYI+dLgB6CkSmKoD6WPQSEumF/UQcMrjhytz1HhPhhYCF+LrTXnIp28r4qRxVjACyrE5/h03asutrIuA1NckxnqbiG/og7GTQCArpRgfHKI5C4+libCrm9dqoWcwGU6z5dpc6CTRXbQAHxUPlY9UUVtEZhBkeYtXVVUqVqJuxYGoYMSzFnzNW4QQlDjDJMilSs5rkWz0JzdWJ2Zn7Kf8/ALniM957Wa7ali3gkKJnYIGDOya8FVQom9r0wBJEvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AM7PR04MB6807.eurprd04.prod.outlook.com (2603:10a6:20b:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 23 Dec
 2025 03:00:05 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 03:00:05 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Tue, 23 Dec 2025 11:01:02 +0800
Subject: [PATCH v3] mtd: spi-nor: micron-st: add SNOR_CMD_PP_8_8_8_DTR sfdp
 fixup for mt35xu512aba
Message-Id: <20251223-nor-v3-1-09e26797a8b5@nxp.com>
X-B4-Tracking: v=1; b=H4sIAO0FSmkC/1XMQQ7CIBCF4as0sxbTGSRYV97DuCA4WBZCA4bUN
 NxdWhfq8p/M9xbInDxnOHULJC4++xhayF0HdjThzsLfWgP1pJCQRIhJkJPaOiRma6B9Tomdn7e
 Vy7X16PMzptc2WnC9/vuCAgX1Rhl5xEEP9hzmaW/jA1Zd6Feoj6AmWCvbHxSyGvRX1FrfyL5FQ
 MYAAAA=
X-Change-ID: 20251212-nor-2f37cf12eeca
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, han.xu@nxp.com, Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766458889; l=13446;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=6qVKqmMCjyEo2suWP1m2XrUx2qAaRggXitfPHFLc2WM=;
 b=yxYfds2y10C7jcR1eL855NPY97cBC5M0pac3XcVTajiu3D9z9Vy3IWXOFxSXnsuLSuS166drv
 bioG3FHjBfdAtX7ozFPB95T6P4GGOfB/O/JnWS5E4Dume/aeY3dXLO0
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AM7PR04MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4b36c4-1477-4213-038c-08de41cf5f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVhRcHlBalpIMEVVcjZGRzRNdEpOSVc3MXFmdEhGOHNSVmQ2eHpDaTNaN1Zk?=
 =?utf-8?B?WCtpK3J5WE1zR3lTdU9jT1BlVmpOYkx3WjhuT1ZGN1VjMkhHOGJSOG91NDRY?=
 =?utf-8?B?KzhFazhtY0ROV2xzOFBUTDhONHVXQng2ZlZDSDFkQXpvR2xydDhndjlZRWhi?=
 =?utf-8?B?NEpsUmNITk1Xb2dENHUyZzE3T1dKUDhVWURMcUZHZFlkSUZwOXI1bFJNT2xl?=
 =?utf-8?B?RUFCc25naWY1ZE1vem12TVBjZHRyOUxZRW8yOEtQUjV6R0xzN2tCWTRIM0hS?=
 =?utf-8?B?S2NTVlR2bVdISi9EYU5sVjd1R2dWSnBkcXgwMkdKclpheFpFZXo0K3ppREtE?=
 =?utf-8?B?QTM0ci9zV043VEJIZXRIOHRRUGZ2b0laVmZ1eHU1KzQycEhzSXllaWdKYW5W?=
 =?utf-8?B?cjdLMUpGWGtqR2Mrc0RuaEppc0tOekd1eWpLdkE3YkRRTXo3KytBejh6dFZP?=
 =?utf-8?B?a2ova0xtTCswOGdvelk3aW9rWEpZanIzdTRFakovcHVTbURERE82eUwxSDhm?=
 =?utf-8?B?bUlxL2tHKzFZL0RWOGtPaWYxeW1JSXF5VEM2WGxUUitDbWVXM0JtWnlZZm5p?=
 =?utf-8?B?L0RnYVFWTGovQTZQWVUxVk1vWWc4NmZkV2hLMXIwbVdnYjdZdnJWUEVJRzNN?=
 =?utf-8?B?cXhBN2dlOFlMWlQwa2loQzM0Q1Z1di9NQkpObThNVGFQV3l6T3RtZzFqTmlw?=
 =?utf-8?B?SUNzTW1rVlF6VWI0aU5PMjNldGNSb1pyTEsxTmw2UTNwenVsbnkwS0s3WnZF?=
 =?utf-8?B?Zmx3TzFBTVY5WG03dThPbGliaWNBd3JBaDdsd2MzbENSOUtzOHZBQlA1aHVY?=
 =?utf-8?B?S3Z1WkFVZkFZbFFxdGZlU3V1TCtqUzR1V0NvcFJ3bVI1aHVrNEw2Q1EvY2xj?=
 =?utf-8?B?bjErUi82R0U1aTFDVWVDS0Y3RG1LcjBJYTU4ODFjTkJqMlFGU1U0a1R3alF3?=
 =?utf-8?B?V0M2RnVHcnlQbW1wN3ZBZUlhY1p2SkJQSFhod20wazVIVWN3UHdFVytoMnMr?=
 =?utf-8?B?K0dBbEpud2l5elB1M0lnNXBLVFJjNDdnOTgzejBTN0tUeXpyY1preG1odk5M?=
 =?utf-8?B?UkVkRExNenc2aExQNVhmSkxDV05tdXBXV2ZxaGkyUnc2V29xOVZkTE1rbmtO?=
 =?utf-8?B?elRQMWJaY1YxdVlGVFFUdzZBelhqTzRzR0Z4MzdDYTJLOXRpMU5rU0tsdGRN?=
 =?utf-8?B?UUJjbTdnL0NWY2c4TWpuREc1M0hlZjdIR1A5OUthRk9aeE02bklYcmZ3WDkr?=
 =?utf-8?B?WS9RUlFYbFFMUHZMUTRmRzdkZ0NROHNqMU44K3Z2WmdtbkNOc3NsVmFSUGlO?=
 =?utf-8?B?eGVqK0I5aUd6cWxvZ1c2SWJNZ0ErRWJVMkVBQ1dMMExjWGdqcWtobjF0VEF5?=
 =?utf-8?B?eHdyT3g2SkEwc2ZMVW0rYkp2Z3RxdXhhMEhHTWp6K0ZMMDZUeEhRZSsyY2hB?=
 =?utf-8?B?TEtwYnhVdUQ4ZVVZUjd4N216bmh3cHpjUFZjTjRScHJUSTEwSER2S3gvWVY2?=
 =?utf-8?B?T2lYM0FxRzEvZmlnYUNMV21McWYzMkVDVlNmMnZFMnh0Z2NWcUE1Y1N5UVll?=
 =?utf-8?B?MnJwUXIyYmdDbTZTMGNjRld4VEdKK3p4a1NjSkloMFRVT1dMRXhsd211U2px?=
 =?utf-8?B?anF3aDQ4dmh4eVdySlFPQ1hsMzZoeG9jdkVZeGJFYmVhT3NGV1B2bUl4K0RG?=
 =?utf-8?B?eklKRGZHbEFSZjJCaElUQm5GYWRCYjlmVkNDeEt6VVkyUXdUU1YyTFc2TkRs?=
 =?utf-8?B?Vzk2a01FbFl3WG5CWDFITVppekM5TVZ0eENDSTFOa2duOEkySzFqSTRxMnRQ?=
 =?utf-8?B?OHRHMERyZnBtTGVhK2V6VzNtWklMeHZnK3pKYlJyYmdnREZnY2lZNnk4eTVo?=
 =?utf-8?B?cWhrdjhHVlZRUXZTUG5PdlFhWVB6UzdETmxYd2dnazlDRGE2SWlWQkdGUXEz?=
 =?utf-8?B?a2FPQXpPcU45MldzSmxYQ3dLMFBHcW5la0l6aFh6eVQ5aXByUUlkZGVxV0di?=
 =?utf-8?B?eXNDR1Fnc2JrK3gyeitUNHBIbmJwRW9LcWZaOVU3Qkp3WUpLV2NYODdHMkF5?=
 =?utf-8?B?d0pUdW1FWE56c1QvZWFwSnZmR016eGFEdWQwQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEp1V0tnYUNRNHRRb25tbU5KRXVMYkhjVW9pd2pVQjFHMGpkWGhVNDMveWp0?=
 =?utf-8?B?WTRjQkpRMVMwajl3RGo5eEZ5TUtFTzh2QitVZkg1WTgyZ3BWN0NmeXJkMGts?=
 =?utf-8?B?UWJKd0wxVTkyN0lnMGVYamhxeWxiNUJ1WUVMd1h2YWo2dlNJd09IU3dJS0pt?=
 =?utf-8?B?MVhvRUg0TkIyQ3lTMHF2UXkzVHlSMTRLZUtkL2FxUlI0Q25sV3RvK0xGU2FT?=
 =?utf-8?B?OHBRTUROVVdialViVGpKRDhKYXNKZHQxbFdWWVNHVlJmZTVNSTh3M2VrUTJZ?=
 =?utf-8?B?TFhLUGJ2OWpvZllHSE5ReW81c3ozdjI5Y3hvMWc2V2J4b1V4ZVB6djlRVm4x?=
 =?utf-8?B?d0ptTGtPSklaNWprZ1JYVFdQVkI0RmNGRkczeWhwTTNIUXlub0dMRzArS2FC?=
 =?utf-8?B?cldzQm0zRUxXWHR2eG90YXlnSmg3NHFWTzFuRzNMd2ZPSVpobS9DVWJCZUN3?=
 =?utf-8?B?YjhCcHR1cE9WeEdHeHJ3SUJyQ3p1MHk0QjFmMjhJeWdsQ05lSThwS3J6Y0dy?=
 =?utf-8?B?SWJBTzJiQWxhdFpUL2syYzZrZjkveHQydWVRNEtaYkJEWG9wTldQZ2J6dUVK?=
 =?utf-8?B?NkxLUlpQUG9kZHlpY1VZN1hWTVlaem02QUtmQ252OVRHemxUMG9Yd1ExWUs0?=
 =?utf-8?B?cFBCd1dqRTlyS2tJNU5jOGIxSzBjbDFwQmtMSG5VT1B5VzFvbmlxTDY0WmQx?=
 =?utf-8?B?eFN5b2ZLaUJ1VlpNOWhsWkxBcjdSa2E0V1oraXJUVmVJeWVKeXRFUEdBK0xj?=
 =?utf-8?B?UEtDTnNBWnRTbW84U3ZaNHdpRWxNQ1dTT3VEQnBxQWJ1eHV4b0VCbW4zclg5?=
 =?utf-8?B?Y24zeGZRelp1T2FLSkRZNWlRV21KR204eGdGTkZENjA0eGxZMzdBbGU3U09i?=
 =?utf-8?B?dXd2TDhqa1FJRE1rUGEreWVPMFJKd1A0ZDNTYjl1SnNWT0ZnYUk2aWZNbEhN?=
 =?utf-8?B?SjJjZmFIeHNhQW5QMnVRbkJpVDdrM2hBblc1WVpSK3pDZXZ0TExiRlByZXdw?=
 =?utf-8?B?SWNVUE1YZ1RPT3h3NVYrQzdwSWJ6K0xldjBybUU0d1hhVEhwWVFVbE1lVlVF?=
 =?utf-8?B?M1Q1MXJ0VTVhbnFJMUhRRmJJSWpGTzFSb3RQSHA2VFlPb0pMemVmY0grT2F2?=
 =?utf-8?B?Q2gvYnFvbnpXVllCeUVacWpWdlFBK01jQ2lKS1lJWGlMSytleU02YU13bDc2?=
 =?utf-8?B?N1VpYS8vbGJRdzhMbTR6OVdXRVExYm1lVG1ZNVlVbjdxQzFJSUQ2UG14cTNq?=
 =?utf-8?B?QnE2UVVCaGs0QjVydUNnanVNOUVvUlRrQ2U0RWtFOFFObmFnc1EzUWpSSGpo?=
 =?utf-8?B?ZU94ajgxcTBnYjhvVEVrcmpXbnFoSzBiUUVaaHVXVFZGQ2JGNlF2SExKZWRq?=
 =?utf-8?B?MmtuczU1ajVWcjhDam9PcmRISllPVW15VzVmcnhoVnJDbHR1VDV6SUVlaU5U?=
 =?utf-8?B?TTFSTlg4L2ZnYmNzaGQzUnlFc2o1bkJIQ0ErQzJjKzZWV0NCaFJweVhxdlkw?=
 =?utf-8?B?am5YaUwyUjY1akN1ekpRWjRyWStPTUlkTzhCY2ZtYkY3YkM1enFEajVrMnVB?=
 =?utf-8?B?ZDdJeHpLWmU3YUNTVnkzWmFhRGpTdDBLQzkzTFVmblBYSUMyVTFybHd1L3I5?=
 =?utf-8?B?VWowcUY0MkM3c0RsaVI2RkRTR3NldXdYUzBJaVdrU0lLWlJibk5JR2JYaW5R?=
 =?utf-8?B?ai9uVmtIaHRxd0RZdy95dkdydzRITytkYzB2cW9BWmQ1ckFLOWtWRzEzcklU?=
 =?utf-8?B?UU5QV2xqNGNlODJ3MEVnMzdvNWlERGVLam1xaXFjY3VMdGR1cXNuVEVYaC9s?=
 =?utf-8?B?bGltVVNFSWZqYm1JVmZrRnE5ZTB0Um8za2phYWVSWkh4Zk9BTXhPanNvZ1Ew?=
 =?utf-8?B?UktibExTTGJ6TnpudTlWd1JzeTkvUFBzcHVTc0JlTzNHVjZzbzZZK1MrdmFD?=
 =?utf-8?B?Q1ZueDh0QTYyZXJlMFdKQVR6YUZDMTEyQlVoZ1hUQnJ3MnEzRS9YOEVVR0JY?=
 =?utf-8?B?aGlnd3BxbjlDWkVLZ1I2eFF3Q1JTQ3pxazM1d0JoQnFkNXVxcXUwd0pZcC90?=
 =?utf-8?B?VXQvclRPdzAyR2pkdCtkdnU3ejA3TGhYbHJpUW1XN2w2d2hpQ2cxY28wSlU2?=
 =?utf-8?B?a0hURVNQaC9haGM4S1dKOG9pbzgrWmdoVTl5RlJPQWdRbGhxck4zTEI2ODFp?=
 =?utf-8?B?NGErdzJOb2Y0c25hWDR5S2VqVWloRXBHREdod0R2NnJGUGdieGx0OXYzbjlZ?=
 =?utf-8?B?UFNVTWtZSjN0ODN3QWV4RVA1SUxsdExvTzZxcC9ZU3FKVlNheGd2M1VyTHRz?=
 =?utf-8?B?TG45SXdLcG1MQ1RWRWhjV3g4UDkxZTU5cjIxTk5SSWhpb2ZDOWFOZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4b36c4-1477-4213-038c-08de41cf5f96
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 03:00:05.2857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OeVFWL/qa1pgfNhN2O/ULohepSkVx9XBit4zvxXS8h196vNcdrP6sfByUzLsV6GO2CTle/Tf3FEH3usRTfvdGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6807
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_190010_184978_780F132F 
X-CRM114-Status: GOOD (  12.52  )
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

Find two batches mt35xu512aba has different SFDP but with same
jedec ID. The batch which use the new version of SFDP contain
all the necessary information to support OCT DTR mode. The batch
with old version do not contain the OCT DTR command information,
but in fact it did support OCT DTR mode.

Current mt35xu512aba_post_sfdp_fixup() add some setting including
SNOR_CMD_READ_8_8_8_DTR, but still lack SNOR_CMD_PP_8_8_8_DTR. Meet
issue on the batch mt35xu512aba with old SFDP version. Because no
SNOR_CMD_PP_8_8_8_DTR, micron_st_nor_octal_dtr_en() will not be
called, then use SNOR_CMD_READ_8_8_8_DTR will meet issue.

Fixes: 44dd635cd632 ("mtd: spi-nor: micron-st: use SFDP of mt35xu512aba")
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v3:
- add comment in the code to explain why this fixup is needed.
- Link to v2: https://lore.kernel.org/r/20251215-nor-v2-1-e75c0451e597@nxp.com

Changes in v2:
- add 8D pp command in post sfdp fix up for the chip with old SFDP
- Link to v1: https://lore.kernel.org/r/20251212-nor-v1-1-20a5a381979c@nxp.com
---
first part: the batch mt35xu512aba with old version
1) This mt35xu512aba with label 0DA15 RW303 (old version) is populated on
   the imx8qm-mek board, was tested at 166MHz using nxp,imx8qxp-fspi SPI
   controller.
2) root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# ls
   jedec_id  manufacturer  sfdp
   root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# cat jedec_id
   2c5b1a
   root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# cat manufacturer
   micron
   root@imx8qmmek:/sys/bus/spi/devices/spi4.0/spi-nor# hexdump -Cv sfdp
   00000000  53 46 44 50 06 01 01 ff  00 06 01 10 30 00 00 ff  |SFDP........0...|
   00000010  84 00 01 02 80 00 00 ff  ff ff ff ff ff ff ff ff  |................|
   00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
   00000030  e5 20 8a ff ff ff ff 1f  00 00 00 00 00 00 00 00  |. ..............|
   00000040  ee ff ff ff ff ff 00 00  ff ff 00 00 0c 20 11 d8  |............. ..|
   00000050  0f 52 00 00 24 5a 99 00  8b 8e 03 e1 ac 01 27 38  |.R..$Z........'8|
   00000060  7a 75 7a 75 fb bd d5 5c  00 00 70 ff 81 b0 38 36  |zuzu...\..p...86|
   00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
   00000080  43 0e ff ff 21 dc 5c ff                           |C...!.\.|
   00000088
   root@imx8qmmek:~# sha256sum /sys/bus/spi/devices/spi4.0/spi-nor/sfdp
   a2e3b364108c4d8052b26d50f31e7dfac6e4ad96aa3994f19678125ebdf8fb81  /sys/bus/spi/devices/spi4.0/spi-nor/sfdp
3) root@imx8qmmek:~# cat /sys/kernel/debug/spi-nor/spi4.0/capabilities
   Supported read modes by the flash
    1S-1S-1S
     opcode        0x13
     mode cycles   0
     dummy cycles  0
    8D-8D-8D
     opcode        0xfd
     mode cycles   0
     dummy cycles  20

   Supported page program modes by the flash
    1S-1S-1S
     opcode        0x12
    8D-8D-8D
     opcode        0x12

   root@imx8qmmek:~# cat /sys/kernel/debug/spi-nor/spi4.0/params
   name            (null)
   id              2c 5b 1a 10 41 00
   size            64.0 MiB
   write size      1
   page size       256
   address nbytes  4
   flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | NO_READ_CR | IO_MODE_EN_VOLATILE | SOFT_RESET

   opcodes
    read           0xfd
      dummy cycles  20
    erase          0xdc
    program        0x12
    8D extension   repeat

   protocols
    read           8D-8D-8D
    write          8D-8D-8D
    register       8D-8D-8D

   erase commands
    21 (4.00 KiB) [1]
    5c (32.0 KiB) [2]
    dc (128 KiB) [3]
    c7 (64.0 MiB)

   sector map
    region (in hex)   | erase mask | overlaid
    ------------------+------------+----------
    00000000-03ffffff |     [   3] | no

4)root@imx8qmmek:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
  2+0 records in
  2+0 records out
  2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.317497 s, 6.6 MB/s
  root@imx8qmmek:~# mtd_debug erase /dev/mtd0 0 2097152
  Erased 2097152 bytes from address 0x00000000 in flash
  root@imx8qmmek:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx8qmmek:~# hexdump spi_read
  0000000 ffff ffff ffff ffff ffff ffff ffff ffff
  *
  0200000
  root@imx8qmmek:~# sha256sum spi_read
  4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
  root@imx8qmmek:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
  Copied 2097152 bytes from spi_test to address 0x00000000 in flash
  root@imx8qmmek:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx8qmmek:~# sha256sum spi*
  16b3a0c63252b07501129a0e495e6c8cb8e40598e32bc9a9431838ba95266f3d  spi_read
  16b3a0c63252b07501129a0e495e6c8cb8e40598e32bc9a9431838ba95266f3d  spi_test
  root@imx8qmmek:~# mtd_debug erase /dev/mtd0 0 2097152
  Erased 2097152 bytes from address 0x00000000 in flash
  root@imx8qmmek:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx8qmmek:~# sha256sum spi*
  4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
  16b3a0c63252b07501129a0e495e6c8cb8e40598e32bc9a9431838ba95266f3d  spi_test
  root@imx8qmmek:~# hexdump spi_read
  0000000 ffff ffff ffff ffff ffff ffff ffff ffff
  *
  0200000
  root@imx8qmmek:~# mtd_debug info /dev/mtd0
  mtd.type = MTD_NORFLASH
  mtd.flags = MTD_CAP_NORFLASH
  mtd.size = 67108864 (64M)
  mtd.erasesize = 131072 (128K)
  mtd.writesize = 1
  mtd.oobsize = 0
  regions = 0
  root@imx8qmmek:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
  Copied 2097152 bytes from spi_test to address 0x00000000 in flash
  root@imx8qmmek:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx8qmmek:~# hexdump spi_read -n 20
  0000000 b6e2 a2b3 1b76 9184 3ee1 02c7 bc1f 23c0
  0000010 475f 6526
  0000014
  root@imx8qmmek:~# flash_erase /dev/mtd0 0 0
  Erasing 65536 Kibyte @ 0 -- 100 % complete
  root@imx8qmmek:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx8qmmek:~# hexdump spi_read
  0000000 ffff ffff ffff ffff ffff ffff ffff ffff
  *
  0200000

Second part: the batch mt35xu512aba with new version
1) This mt35xu512aba with label 4KA17 RW303 (new version) is populated on
   the imx943-evk board, was tested at 200MHz using nxp,imx94-xspi SPI
   controller.
2) root@imx943evk:~# cat /sys/bus/spi/devices/spi8.0/spi-nor/jedec_id
   2c5b1a
   root@imx943evk:~# cat /sys/bus/spi/devices/spi8.0/spi-nor/manufacturer
   micron
   root@imx943evk:/sys/bus/spi/devices/spi8.0/spi-nor# hexdump -Cv sfdp
   00000000  53 46 44 50 0a 01 03 ff  00 08 01 17 30 00 00 ff  |SFDP........0...|
   00000010  84 00 01 02 90 00 00 ff  05 01 01 06 a0 00 00 ff  |................|
   00000020  0a 00 01 08 b0 00 00 ff  ff ff ff ff ff ff ff ff  |................|
   00000030  e5 20 8a ff ff ff ff 1f  00 00 00 00 00 00 00 00  |. ..............|
   00000040  ee ff ff ff ff ff 00 00  ff ff 00 00 0c 20 11 d8  |............. ..|
   00000050  0f 52 00 00 39 61 99 00  87 8e 03 d3 ac a1 27 3d  |.R..9a........'=|
   00000060  7a 75 7a 75 fb bd d5 5c  00 00 70 ff 81 50 f8 a1  |zuzu...\..p..P..|
   00000070  2f cb 27 8b 00 00 04 01  00 06 01 00 ff ff ff 8e  |/.'.............|
   00000080  00 00 00 00 00 00 00 00  00 00 00 00 ff ff ff ff  |................|
   00000090  43 0e ff ff 21 dc 5c ff  ff ff ff ff ff ff ff ff  |C...!.\.........|
   000000a0  00 0b 80 9e b1 81 b5 85  00 f0 ff 9f 00 0a 00 00  |................|
   000000b0  00 0a 1a 88 10 00 00 00  ff ff ff ff ff ff ff ff  |................|
   000000c0  00 00 06 01 00 00 00 00  14 01 81 03 00 00 00 00  |................|
   000000d0
   root@imx943evk:~# sha256sum /sys/bus/spi/devices/spi8.0/spi-nor/sfdp
   809cbdfc57ae56771e017ff7bfdae7122afcbcbb238f2502420cfe3b2fe20d11  /sys/bus/spi/devices/spi8.0/spi-nor/sfdp
3) root@imx943evk:~# cat /sys/kernel/debug/spi-nor/spi8.0/capabilities
   Supported read modes by the flash
    1S-1S-1S
     opcode        0x13
     mode cycles   0
     dummy cycles  0
    1S-1S-8S
     opcode        0x7c
     mode cycles   1
     dummy cycles  7
    1S-8S-8S
     opcode        0xcc
     mode cycles   1
     dummy cycles  15
    8D-8D-8D
     opcode        0xfd
     mode cycles   0
     dummy cycles  20

   Supported page program modes by the flash
    1S-1S-1S
     opcode        0x12
    8D-8D-8D
     opcode        0x12

   root@imx943evk:~# cat /sys/kernel/debug/spi-nor/spi8.0/params
   name            (null)
   id              2c 5b 1a 10 41 00
   size            64.0 MiB
   write size      1
   page size       256
   address nbytes  4
   flags           4B_OPCODES | HAS_4BAIT | HAS_16BIT_SR | IO_MODE_EN_VOLATILE | SOFT_RESET

   opcodes
    read           0xfd
     dummy cycles  20
    erase          0xdc
    program        0x12
    8D extension   repeat

   protocols
    read           8D-8D-8D
    write          8D-8D-8D
    register       8D-8D-8D

   erase commands
    21 (4.00 KiB) [1]
    5c (32.0 KiB) [2]
    dc (128 KiB) [3]
    c7 (64.0 MiB)

   sector map
    region (in hex)   | erase mask | overlaid
    ------------------+------------+----------
    00000000-03ffffff |     [   3] | no

4) root@imx943evk:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
  2+0 records in
  2+0 records out
  2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.0216668 s, 96.8 MB/s
  root@imx943evk:~# mtd_debug erase /dev/mtd0 0 2097152
  Erased 2097152 bytes from address 0x00000000 in flash
  root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx943evk:~# hexdump spi_read
  0000000 ffff ffff ffff ffff ffff ffff ffff ffff
  *
  0200000
  root@imx943evk:~# sha256sum spi_read
  4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
  root@imx943evk:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
  Copied 2097152 bytes from spi_test to address 0x00000000 in flash
  root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx943evk:~# sha256sum spi_*
  8bf13c50e9f106d180e5657e803811e1721c0e092ff46281d5bf30d1b13ac368  spi_read
  8bf13c50e9f106d180e5657e803811e1721c0e092ff46281d5bf30d1b13ac368  spi_test
  root@imx943evk:~# mtd_debug erase /dev/mtd0 0 2097152
  Erased 2097152 bytes from address 0x00000000 in flash
  root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx943evk:~# sha256sum spi_*
  4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
  8bf13c50e9f106d180e5657e803811e1721c0e092ff46281d5bf30d1b13ac368  spi_test
  root@imx943evk:~# hexdump spi_read
  0000000 ffff ffff ffff ffff ffff ffff ffff ffff
  *
  0200000
  root@imx943evk:~# mtd_debug info /dev/mtd0
  mtd.type = MTD_NORFLASH
  mtd.flags = MTD_CAP_NORFLASH
  mtd.size = 67108864 (64M)
  mtd.erasesize = 131072 (128K)
  mtd.writesize = 1
  mtd.oobsize = 0
  regions = 0

  root@imx943evk:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
  Copied 2097152 bytes from spi_test to address 0x00000000 in flash
  root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx943evk:~# hexdump spi_read -n 20
  0000000 998e 471b fae3 9269 ce52 c6e5 42ae 5143
  0000010 8f20 c41f
  0000014
  root@imx943evk:~# flash_erase /dev/mtd0 0 0
  Erasing 65536 Kibyte @ 0 -- 100 % complete
  root@imx943evk:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
  Copied 2097152 bytes from address 0x00000000 in flash to spi_read
  root@imx943evk:~# hexdump spi_read
  0000000 ffff ffff ffff ffff ffff ffff ffff ffff
  *
  0200000
---
 drivers/mtd/spi-nor/micron-st.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 88033384a71e5d19f5a26ca91f56a49e3017183a..b35738833a13d447163e37fc769c4832b80cd9d8 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -167,6 +167,17 @@ static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
 				  0, 20, SPINOR_OP_MT_DTR_RD,
 				  SNOR_PROTO_8_8_8_DTR);
 
+	/*
+	 * Some batches mt35xu512aba do not contain the OCT DTR command
+	 * information, but did support OCT DTR mode.
+	 * So add the common SNOR_CMD_PP_8_8_8_DTR here, this can also
+	 * make sure micron_st_nor_octal_dtr_en() can be called when switch
+	 * to OCT DTR mode.
+	 */
+	nor->params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
+	spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
+				SPINOR_OP_PP_4B, SNOR_PROTO_8_8_8_DTR);
+
 	nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
 	nor->params->rdsr_dummy = 8;
 	nor->params->rdsr_addr_nbytes = 0;

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251212-nor-2f37cf12eeca

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
