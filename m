Return-Path: <SRS0=ovMs=JU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2766C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Apr 2021 15:08:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C780613B6
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Apr 2021 15:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C780613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q3+5xvXIz2Fwbq+w7BSLhHeRqNlORKLiz/A7msDy5dM=; b=egQ/Pnl5zzOcdQ
	c6XjwpQH71ZDsaxUzRJrgAvK8aDX2HBVWAS6rDn05hdsXr9aJYUh3MoNkoTdX7Qdr24xQERKMlMFX
	YJCYglKwG0gdqDoHpthihAuExT96Bk1MMyZNwtBZCHtKof0cPvTs4H7cx2OYi2PBOmj6+fIUZQcjR
	o26l3sd36/uayqxMHxP951KMS/Jiqswg1YoZJ4za5L4QWW3yOvVk7s1rZM+XszpwcEahxbjhLiWOR
	bawty4dBRYAaYYmBE29t5XWaakkEXdmpRkdWiIektXb6iBSigLPv5vY23bifPN+nMRGu9KqYw2Ifd
	S8DB3ARaq2kQgHUzgQAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZxP0-001jSK-DU; Fri, 23 Apr 2021 15:07:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZxOv-001jS8-QH
 for linux-mtd@desiato.infradead.org; Fri, 23 Apr 2021 15:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=c4xPbeZq+RLYQa4IVyvl1iUFIo6J+7rHqNczdljCazA=; b=QilPuxXPQgQdQsTAxNjLYnfTux
 M+iWdJiZj3yIBGjGrRVhizKsPO0fCoQRWwc1gQJgU5aUR/RlGOmnm2tWcpqkB0lCr/CCyMlVzK+ey
 zrsovqXUwP+AckRxVpQl9WInvy5XSxTXopf/glO4/NgW4r8PfTI1EktSOaSIN6Csq5jDBqK/rTH4C
 7n8/Co+qc4MOTLMt0d96EN0cceWUNecFXUPDZayNqzBaZZxnmYQ6cxaKwAkPvwAcRLP6BqoESnZ6U
 8BtQrKK9EP9ZtZU8Iec3RmD1kYN5HL8uFg+RxfUQHEfaFG0Bhok8B/3hWtFQfu40aQPYs9Z+vGNvt
 w2FS2hMA==;
Received: from mail-vi1eur05on2067.outbound.protection.outlook.com
 ([40.107.21.67] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZxOt-00EV4V-1G
 for linux-mtd@lists.infradead.org; Fri, 23 Apr 2021 15:07:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nr4B48oDAP27wC6VQ35mz+hY8upwpwqj1ysS6+0a3s9krNrGHblcTW5oOOSsF0ARJP/zaVt6KtjlrLaazrOOlzSEYky3ckyBswHzzcOeKpNueOm/uTn+/qezPiDrjy8HNDxzqcC/6gW9tckLZscIMVzp8gElc2W7crqgu6+NU6dqwmLatk6tfvLkmQ99H+G+Z04vE7AklzixHxFgwOclx2GSjzzjvgBrBi9NS8EMnWfR6AKXEl6DjTGa/1yd48kxJ7kAeBiE9W/q30SAo9bUXDeQW4Whz4lGbB+cWcqGwts4h/PW/o9GmPJT7ssDhzOwsjDTxUDw9kHLgSVuJVhPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4xPbeZq+RLYQa4IVyvl1iUFIo6J+7rHqNczdljCazA=;
 b=Eykp3Cv8zvcve20kP1KekT7OHemq4Kw0nvPgcmAdx5hDiM6NSAWFQiTJq22Lj20ixRahRE9m4aWHMg949o7VOeddNwJTgUyUy1ZhCmgFJLZplpmg5h5oM7PDe1ocfu65bkC54FP4DTp23WB0ERxvEst4uZCcBnzuraq4Ne7piRDne9WgV94bFiR7e3n115OSQzRWtsthleOST7OyTgOVF2QnHUXyLTLoTF3jcw/dHz2lU2U5ImYMXy2FDFU+QNz6ZVf22HIMlIi9DCxkWyYkCwyBmca4CpImI05SfnZ1w2KGRi3pWFFocKFzcdLWNQZT2J/eUWnIBQgaqjrl3jew7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4xPbeZq+RLYQa4IVyvl1iUFIo6J+7rHqNczdljCazA=;
 b=ft5AEAglWe1ovEcJ7HxmsJoVDlw3tGDwqy/oKoPX7MyG0eMeyLOiRlmQt8ReTBDuaag1AXBGDy5Y10EI6XbaRn1T2KBM0T5L+9PKCdoV3X1D7v7cuMz4QvDHpDupbCqKVlBrMhwiBPoMlYvbOv4ykQX2XdmG4nuhcGz5hu0vXos=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR0402MB3343.eurprd04.prod.outlook.com (2603:10a6:803:8::28)
 by VI1PR04MB5615.eurprd04.prod.outlook.com (2603:10a6:803:e9::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 15:07:17 +0000
Received: from VI1PR0402MB3343.eurprd04.prod.outlook.com
 ([fe80::59c3:e8af:1482:ad35]) by VI1PR0402MB3343.eurprd04.prod.outlook.com
 ([fe80::59c3:e8af:1482:ad35%3]) with mapi id 15.20.4065.024; Fri, 23 Apr 2021
 15:07:16 +0000
From: Larisa Ileana Grigore <larisa.grigore@nxp.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Add full flash erase support in mtd-utils
Date: Fri, 23 Apr 2021 18:07:03 +0300
Message-Id: <20210423150704.7248-1-larisa.grigore@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM3PR07CA0086.eurprd07.prod.outlook.com
 (2603:10a6:207:6::20) To VI1PR0402MB3343.eurprd04.prod.outlook.com
 (2603:10a6:803:8::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-143.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0086.eurprd07.prod.outlook.com (2603:10a6:207:6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.17 via Frontend Transport; Fri, 23 Apr 2021 15:07:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10d3059d-8d4d-484a-cffc-08d906697bb2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5615:
X-Microsoft-Antispam-PRVS: <VI1PR04MB561552A307E214AF9E9CB5059A459@VI1PR04MB5615.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4661nYeUU6OTB0HvVX3/WeRLukcibOOQn35gzse+lUva7gWGyzV5e1O7VSDFsd3P/bH7uREpXmfNG1m1dp1HCO5kDRAq5KPYWoF5tgsp2JBUFo2osrntahrpOTAOcTyMzhGXdKVDY7WioKpW1N0vL0N4pwnMPZXEnxBafBMpYd1lRrWBQtx1M9datmqucj5fpdCdSwprFtYr8r4Ebgh9wUns3ucZJnPlt1nL9+eNX4G9w+yuV44h+CgjG60wLElJhWxo3/U8YRJlzuK3BoXqppxvhUrIQPPpP1b5AqFcOBdnfzs0nvUojt9tYFVxLKtH92Vsc+H1n7WEvUNl6mupksS5ULLwKqVZQCgyxCMn/Q5/5sMcBZqN4FR/uta4J9JDzPbvYd+lz70WAJuuB5gxs7FGiCHu58p0yEvKre70vC6zF3+JcUdfn6wpJzprFwFh2SDkM4HglMOhj8M11T8cJlAhbBJWLCy98jNYtO5IzJXWlth5X6s7tMXSD3nyc0wgTK0Doq8+Jxq1EVtjj+RsibxNLU9Lo5NZXdsaSGlSdYpqsYeUGed0IynLm1iE1hn4K+lYrHSMJ5erXISEbQBxTAyfewqSh2QmOUL12oC7TgVUPXAFFPV0Ggt8/yuaymGIK6qvVzBDOojar+57g4aXDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3343.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39850400004)(376002)(396003)(4744005)(186003)(5660300002)(6916009)(8676002)(6666004)(86362001)(316002)(2906002)(1076003)(83380400001)(52116002)(8936002)(66476007)(478600001)(2616005)(6512007)(6486002)(66946007)(956004)(36756003)(38100700002)(16526019)(26005)(66556008)(38350700002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?g5G2DXkLpWQNeCTGJWpAhWUzbCr5PWG36ZPkoq5aQ44VdMirvVmaPv3yLT/o?=
 =?us-ascii?Q?928YeAJT/4XlCYxrLcSc4Xq9ZTLebRgvDCLJ1xytjTyCT90uv3PfeDfkliwo?=
 =?us-ascii?Q?d99mrNjG9tT5EiGBVy6Yh9jpkflyKfSaaLg6NWLSAKuBUsDeO+04uR4aGKPu?=
 =?us-ascii?Q?HXXSo1sUOvANdW1HehY1/DHuVdcXke9eveM40wzZqWhUeaX5iSpsorl4FX7E?=
 =?us-ascii?Q?TS5QX55Qk2asGO/VD755bAowKQ8BuGJi/dC30NujbO64Ss47wwJaTKxvVhR9?=
 =?us-ascii?Q?JJtZ4B3liptKAy+5CcsWTLbrjT641BkZRAC07adYLqk3gv0Khl/9xF98ccHL?=
 =?us-ascii?Q?mj6WsAI15k9R6orV/3F9YVtL9cQovxVHqnpkwBzW8AGV7IbM5jbVcyPQ3Rqj?=
 =?us-ascii?Q?NTSc1+CLmFpWZZap4j3Tl3yGjRqGBcd+ZBzCR2fo6xyPc1VZrA1pFmM4P///?=
 =?us-ascii?Q?0+UNeIDedsWbaCPCJg4gK/hQjmxgws222BlCAvx5moc+O1OA9Cqp2bg7gax3?=
 =?us-ascii?Q?2Y8LTRlWrLylFVusqdCs2syuR13dF/09XcToaEcwCpaC0dz114Dxb2VaeTTc?=
 =?us-ascii?Q?CfY4bgwOHgJwKw7qwGD49RCtO3u09QzhWK7UF7FsDbqT7q0GJZ0zroXbR+N6?=
 =?us-ascii?Q?cLioR39jVktK78giHeGhZH8q2t2uoqGncA4JaehEwk2pSLytDKya3uJgJv2/?=
 =?us-ascii?Q?TdJdfyOz4rjma5vkc07YVsK+BGzFrrRGuuLrgSETIS1AgjE7AWvKruRFl8OE?=
 =?us-ascii?Q?94W/s9e/Cs6aFkGNBD0ol9PD244o1qRTFbjmMwMknZA+trXqvmoxzociocWQ?=
 =?us-ascii?Q?SPJGYBCdGzwAkOsrrsS144Sxlf8Rp18ZF26JHnI5sGSbxQH3uNUC2ZRPGTd5?=
 =?us-ascii?Q?f6sUsgdA8kgzftusg87mEQGIaBXPFc3hD2GNkSrrlrrRU+UHcDZyHJStKu9X?=
 =?us-ascii?Q?gpSnLx+lngFY2lUfYdpFiw7gpgBAPk64OUAUeu4zQgsk/l6iEvKus66LlSrD?=
 =?us-ascii?Q?Iiaxy2zLDAw9OxR6V2Hct5YS21NQQTZIfH6JZip2EcnrURVO0O8LQ+SjqWxy?=
 =?us-ascii?Q?+J/nkLiEb3R0pFH61mBjNWA7213il/iOsVP9rrGdvq+QgaEiFE7pfRXBMm9n?=
 =?us-ascii?Q?bgfbk+AN9DUNNgUPFlRSkbcCTh7S8IsvhuPP4/TjLT9gCrqutREtNaIyjowq?=
 =?us-ascii?Q?/n/H8ew/pNbR0Pz3l+xoXA9U36Alvt6pjqjbPgmkOz/YzqEAz4rcXMRS4bIL?=
 =?us-ascii?Q?8GoQYia4UTLKyuFuFXzw+GLNp2A/WhEmNNq0iwAuH+dvPG3lFU+C2XTxTwVz?=
 =?us-ascii?Q?fe7TE9tBbCSVJCfmPYiusH7L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d3059d-8d4d-484a-cffc-08d906697bb2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3343.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 15:07:16.8393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fud9nJ88kC/SUUHTXH5pPdv4ApR4WuqxVgrT1++sO9KQGtGq8RckVjbgg/bdlW041mzmst4oSGNkhrVT+r8w0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5615
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_080723_190802_6B8F5003 
X-CRM114-Status: UNSURE (   5.95  )
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

Some flash types support full erase chip command but there was no
support for it in mtd-utils. The full erase chip command can reduce the
flash erase time significantly. The patch will try first to erase the
entire flash and fall back to the old method if the operation fails.


Larisa Ileana Grigore (1):
  mtd-utils: flash_erase: Add flash erase chip

 include/libmtd.h         | 15 +++++++
 lib/libmtd.c             | 26 ++++++++---
 misc-utils/flash_erase.c | 95 ++++++++++++++++++++++++++++++----------
 3 files changed, 106 insertions(+), 30 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
