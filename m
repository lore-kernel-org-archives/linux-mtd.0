Return-Path: <SRS0=olNe=KR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E102C2B9F2
	for <linux-mtd@archiver.kernel.org>; Sat, 22 May 2021 20:53:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E37B610A8
	for <linux-mtd@archiver.kernel.org>; Sat, 22 May 2021 20:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E37B610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5if39zJY+WjilKaKJKnVuDmeYz+vz1pieGzvXHcHRM=; b=dHHpyP8VnEaSQdg/9wKoFMJJc1
	3bxS3ViVR7CYYYMHtWhu4XnVNoex1kqAYEF0XpTFYSK0GUvPSx7nnffmUjfBXo4xy3ftU1/KZX8nm
	ei4ynGvv4jXloBFCnkWlE6Hc2wuUIYY47Hdx5CxbFM0IBis7XSBGHrN47XM2lYvXq0lL4H7AqmnaU
	GigcwdmsknbZ8ETaVFWeqq/y7kH4J6zNjOABjbdhnHNQyw3aOal7ojZbx3SPxGNdUJhpiVyP/cFwm
	klO0la87LPm6IiYQdYFDbo/R2O58a5Ll0w2WeCdRnoL21yOO4bJqE9/2KV+kDPOKEQoTcF9l0/xCM
	aX/3AruQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkYbh-0035Vo-Pk; Sat, 22 May 2021 20:52:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkYbN-0035Um-4l
 for linux-mtd@desiato.infradead.org; Sat, 22 May 2021 20:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ApkNm0WnV0hrf9HLNluiLuPwSg1BB9dZzxi0v1qWR+M=; b=G96k01rVjVwDqAUu7tb3Mf1yFO
 UHAiL4Yq4vTnYIb4j+FBa98W3SQxN/3rsjljmUIjlrY62WIPU03SAv9RvZGW4iM+I2m2XBpDa+Ynq
 QwOz+e9IlTZ5s6oZdaN51DXs0k5wA5QNco7Wm9uIZ3mYsAuDddUR4cfXxC51M5xziLw9sEfsjAF9G
 ZNDtW9alwdYUY78yMtEAnEWNatmFZ932qV6Bwp6oWD2hPiIBItyJ8H7LOs0yWYYicuOU6Q9DyH311
 Gh2T5AUTeN7pIb6YgiW+H8mxXVDdIUdXwDlP1uCpeK/3cRnan5pLNgJoVtOJ9fmu5UcvBC/6CMTcu
 1XVCcp2g==;
Received: from mail-eopbgr130083.outbound.protection.outlook.com
 ([40.107.13.83] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkYbK-000CcD-3O
 for linux-mtd@lists.infradead.org; Sat, 22 May 2021 20:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaGT6JHx8VpKaSOFtekvxkOseSAThzsUV2qzCddor2URnatHDj8nqlVf28hmr1CdP/avTnk4RGrMVWTprLb92j2nUMlUMIGCy5yup8HNRPbEz6U2WrJg6M78OQtbFesWG8i4BAiD9HTsvTyEqXp5hmRfOuP/8HbqZvbS/oMbfJGWbnIQLSUJM1D5aiZiMoeBhjZTWndvTc585M5fk+SQ9+7slqhVunL0u1DvEw+MnbgLkroIKbgRcPhtw+agSRTeJNTu6qyyOAB5Yq3csbjbejwf68DboBLlFBUP+ZtyCXcWU4h5j3d/YIBC8eg9s4EP+bci/B9ctIwWf57iI66Pog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApkNm0WnV0hrf9HLNluiLuPwSg1BB9dZzxi0v1qWR+M=;
 b=L8lhRPMjaXavJugem2s0dSwCOjdveTyucGUnLPKZ7HMsIxDE5ptC4qogmzXzwFsIRpXV2IlTziSQ/MpUZrJjZQS3QSm5+fM8BTaK9ke2mf1gU97gnSI2zpODEixBo970L6mruW6/RESkgEgKVfEMVSeoyds1zwnqt4IsLDjfPLjQDbQiuVd4m1/SYr+1ogMIqcx8CPIMKy/aTyfpXcDW9ZabUy22ZDqUfe6QImhY2fc6gfwrrLidVZZxUmCe3Jv9q3wZD4RSOQt2+nrjZolwdHmXCDSFXevfVdByBz+XWvf/DN8Xyu9KDiUOiaKUgg3NiNiu7XLSm4TdgJpZiLkqog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApkNm0WnV0hrf9HLNluiLuPwSg1BB9dZzxi0v1qWR+M=;
 b=nkgKzoXAQTjM2v5X/QcTqzFkP+qaj1kQSWrRkwFovJ0llmgct8eCw+MVZLJK9Y16ozzmkiStvmhDNuiWXEQb6ebBfpLeCYnqg6A7xigaB3k+ZtwmIe2bXKoac8UHI+BpCZQqLytGBKWIxtt5wvwn9GTd+tyetiE7sCuoa9+byeo=
Authentication-Results: geanix.com; dkim=none (message not signed)
 header.d=none;geanix.com; dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Sat, 22 May
 2021 20:51:53 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::285f:56e6:a248:1c78]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::285f:56e6:a248:1c78%5]) with mapi id 15.20.4150.027; Sat, 22 May 2021
 20:51:53 +0000
From: Han Xu <han.xu@nxp.com>
To: sean@geanix.com, han.xu@nxp.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: mtd: gpmi-nand: add new fsl,
 legacy-bch-geometry flag
Date: Sat, 22 May 2021 15:51:36 -0500
Message-Id: <20210522205136.19465-2-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210522205136.19465-1-han.xu@nxp.com>
References: <20210522205136.19465-1-han.xu@nxp.com>
X-Originating-IP: [70.112.23.252]
X-ClientProxiedBy: SA9PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:806:28::9) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from umbrella.lan (70.112.23.252) by
 SA9PR13CA0154.namprd13.prod.outlook.com (2603:10b6:806:28::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.11 via Frontend Transport; Sat, 22 May 2021 20:51:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 054d7a80-71ce-4daa-0e72-08d91d636dad
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8582C9FA0671A28196C801DF97289@DU2PR04MB8582.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xfCGj6M45O9ZjXOnTHorVgPfaafNwtG6p9ng5iOlyGhSOlwu7RhK8jFq+NrDw3Kho19U4giSX3IXrDZh+qmWzlyRwoHwdN9LOnDmzOG9QDHzXkqUnLtmQXpiOu7ymX3ymlSo7skQJUD8mnoizkvsOxBd+shNxlje5Cv6noBOTmV/mB1ZvpGTbj/9r1puylRY9H8pNQxNFIwbiWNyOOWeFMDlnGSA4njuFzM8kSrKmjWH5ZAcefIWkhgqTKmFjW1BUhi9//RDc/1zeBJISjwNLTQCDnnplcT1Ek7qO9+1ZgtB2m4NLKrhwDN4ZSqMMfkTZOkH4//qW+63bAvRxBvbHbh2gRAnNiWx1qi3QvBatnY6taAjix72855JErfjS0nYDN4IDP/Ei2bjhi0dxXkzgvwQwjkhLxXDenfX2YpmHJbFKCh1bLavZxGuIdzHf5mL51DgEeTykrxtqim1jTP/xnpvejLsSO0xTfdiZ+MMSZ1CPCy0S4espnIEvaiVT9hIJaJj2H8sNaQ4I3etBLHAEQunk8ESDUzmK/AQUje7f+9H35XqW6qK4fqTvcYpv6nL3TK0z3uiLenjn9ND8W5tXrb/4nBq1JHJvskScsq5mzBSK3Kjjc8XDzPBd8QUf903g/SMyr0/VjxcYT3P5dzTDgHYZN5cpJAXQnkSTS+1zUs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39850400004)(4326008)(83380400001)(8676002)(6666004)(5660300002)(86362001)(186003)(36756003)(6486002)(6512007)(8886007)(8936002)(66556008)(66476007)(2616005)(44832011)(16526019)(26005)(52116002)(1076003)(956004)(38350700002)(66946007)(478600001)(2906002)(316002)(6506007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ap1BaTCCW0VyeacdIHfFw7Wq72ZKvpkNfcZfSkk6kSytU+tCKkeo/LFabyp3?=
 =?us-ascii?Q?nEsvzB5ly2HyhWh651W4z7scFjsqCpQE1LDJnhqtXb4rLKfljrjTocp0Ai0H?=
 =?us-ascii?Q?FYst19xqBy6+BvNR5DWKyMXX/jydDP6eDOE8SapWJLNGiAKapG96kIMQmSpQ?=
 =?us-ascii?Q?eDFpYIiMpYcZCxF7e5N2VujgmMtqvfwidQcHoOpyOE7EpuHIoXa7B8wPzRej?=
 =?us-ascii?Q?M8/l5ihfNnodsukAtDe1OSsmAC8NwMw/AXsME4nfyppqdDKZdd0RobjC1R+F?=
 =?us-ascii?Q?sz9XfTNjp+XnZTAT00/96MHKkirxh7IAJmXZxGWwGw94apQwERj2eYgk62ph?=
 =?us-ascii?Q?Ud0Q9LxMmWn4nu+iZWdblDbvn+Nzt6oEMzk/2kL58DlJ+Rt15lcl9AfgdkCO?=
 =?us-ascii?Q?0iwSqz3cFWcCRSyAn4ChUq1uoD7aDSJbJ7FXi/w5/3omLz+f+JhRX4Zf/LLX?=
 =?us-ascii?Q?CmDPjGW6+fn29n2utaAmtLg5rzcFPSLt8auPgwNQz3u63+h0AvXFYIakaPfO?=
 =?us-ascii?Q?mvfCJJWPirYWGgRrqu+RWA2T3lifmvyZQp+BCpe6V7Al44YW2Z6N/HvFskrM?=
 =?us-ascii?Q?X7JxVLiDDT4l2OSDy/UUH3QQLTz1LhhHJECzh78UOS6+I1kyuM/kCPod8mky?=
 =?us-ascii?Q?nZ3oZ5kdw89T/ifXN5TwKRJhR1xFGlYPIbydmZBdikzUM/+q78xEzLVYP05J?=
 =?us-ascii?Q?XoBYjYZbI5zd4btFrDvp4BKVQAb+24i66CKY3hRLPO50Ypshhgyi/viqKJUi?=
 =?us-ascii?Q?kbxHfDT0oPKb4yEHBUfvYSUJVJIfOuwOV50lVk5oZK8d+yemy2wyfEfiVnzw?=
 =?us-ascii?Q?i+7pTP622nSk1bz16yspncTTOCgTbCm0lo4OsgAv7Vl/wnIsYKH/XpIBN+zz?=
 =?us-ascii?Q?at4L/lXa0iX9x3hpSdh3QNaLkIyDMLBTfCvIpZ/QH2f/6fP5F698PdP5M8Nl?=
 =?us-ascii?Q?4+ABN1mEBYMS2ExKcOXiG+onSNDaAR1ISh1OvMGha6pnRnMPwv3LRugxU7nY?=
 =?us-ascii?Q?FszvpV3l9yjN0rtCiVVSYhyIiTnoZ4ZjDWwgwzj/vd9HVgkDUTboICqH8UTB?=
 =?us-ascii?Q?ktcpB9Szh/hvXQ4Qd/yN+v+30IYOR4BD+FM2gYWx18Upk/InoCsHbQpBFSQZ?=
 =?us-ascii?Q?NYwLOHRPT3MQ64icNljHh4quEB0fBeu00VUZ2bB2To2/dcV34KRvN8F5u7iv?=
 =?us-ascii?Q?lccuMMXxYUtJ4zZ23uVfzeNlRgjEj27tXNIk3oHHRRlf41Ym+u3QfvgFWXcc?=
 =?us-ascii?Q?eRXBn2djIirE/G+oJRp8W0H0HpMyd4H4wXia9ZSvfW80FKvVyMelpa7Gn9BP?=
 =?us-ascii?Q?apdqkIYfWufvYo0WoMVmEatT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 054d7a80-71ce-4daa-0e72-08d91d636dad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2021 20:51:52.9806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFRqdJ1fyUqwmYrUTlBHRSd0SWiXCG7EvunPlxOt1sEIOWE4M/kyGuWlAzYK1rGo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_135202_165508_0656BFE3 
X-CRM114-Status: GOOD (  11.46  )
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

New bch geometry setting uses the minimum NAND chip required ecc
strength and step size by default. This flag was designed for backward
compatible. The fsl,use-minimum-ecc flag can be deprecated.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 Documentation/devicetree/bindings/mtd/gpmi-nand.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
index 9d764e654e1d..5f4eddd132a1 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
@@ -62,6 +62,7 @@ properties:
 
   fsl,use-minimum-ecc:
     type: boolean
+    deprecated: true
     description: |
       Protect this NAND flash with the minimum ECC strength required.
       The required ECC strength is automatically discoverable for some
@@ -69,6 +70,14 @@ properties:
       if this strength is not discoverable or this property is not enabled,
       the software may chooses an implementation-defined ECC scheme.
 
+  fsl,legacy-bch-geometry:
+    type: boolean
+    description: |
+      Enable the legacy bch geometry setting, which will set the data chunk
+      size larger than oob size and chose the maximum ecc strength oob can
+      hold. This flag was designed for backward compatible or old NAND chip
+      support, should be en/disabled in u-boot and kernel at the same time.
+
   fsl,no-blockmark-swap:
     type: boolean
     description: |
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
