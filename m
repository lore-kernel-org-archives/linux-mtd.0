Return-Path: <SRS0=ozsj=FN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33676C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 03:52:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D57A3239FD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 03:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D57A3239FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RbSXNvSMuXHnT2UtgjZe54eZQQRfEb8AWDhgMnpvHHg=; b=KY9xdRXNd1OcZ8754oTAmpTbxD
	R1LgvEs8oj24IyQUbX/28h/TtiIVxzqwJDw4MPYrV1AKLteJSbItxef9AG5QsTDDeW/yQVMQwaQ8T
	xdJvZyTg2BUzOpK0iF9btFInPMNxH6u4u4OdDd2iJF6Bj//pfaR4v4uuPGRC4GYMvR9eBf5jtNrsq
	pr3O3eo+jDBoyaG0++ZV5d3IzB8bwXIBeLDG35OOVW53nPlKyQpQIt6lATDe1hEpbkzWog7pgEhc6
	eXwWUVty1JtsqbSotM0Iks9/EznFsrM1iLS0Rnyf/rcLOCL2P66IR/7omyum3afHutXUQ9F+9G+xz
	0oa8weDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmqVj-0002nK-Il; Wed, 09 Dec 2020 03:51:27 +0000
Received: from mail-eopbgr150082.outbound.protection.outlook.com
 ([40.107.15.82] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmqVf-0002me-Qb
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2020 03:51:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N21AhuLZNRg4sacp3zYBZilpTScaB22Rrh11mYLwJMqR8cffr32cWuXYNGOlc4zweEJClNKA1NvAlDdMehwULoRccp+3LNhIjPi9M00IGSIGE9pAGT2eKh2ph6MAdmg+8QKaI0rM2/eKU7txm6JK5ZhmiCFyQZbQrBgexGW4ZslcMx49JfN/clkUU9nSakWKohLYcJaBJSgvoXFupS9FJC7lVdVq63H6GJrX59Q1xBvxaWFM0MtM2QT7RHzysuZUoc4+C/K6bpO/T9+2jyMcQ0mDxuh+skqiLNaeX2atdcH3m3ZjHbEVgK1GcaImaR72tmhZqyAr7yor+6u7JMSoEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iluagt7hr6xJCfA7eGl8as9LnTPJfOEanMxcYrHnZaQ=;
 b=PKl+gJzer3qwH22QVBjSgVWbjfNXa7JNmExEgRDWyj0EZ+rLU10gPEG739edItmjbQ4dNgirGvIdPXh6IBFslGln9uE7S2PLzZT3qV4R+nGzaY3CEfhL2NK+aqFgVtjycpU06PidhDbyjS2Y1zz+WD+oZah4ni1Y/+47s/dG4wu/ViQuXIZlq1hE3CXB4oVAE8Qbhy9gD3fqSCY0fC/4ZfK4x3YgG1vChSMy5vU/WJqy+2760cYT6qtlkSGV7AIR5fK+6NCAmdTJkAfPfC+tSnzfHR403WIl3OFTLvmdQB/nxnG0L6JmgnLBiWHvpHcKxiYASi0jVN29liLOTrfjCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iluagt7hr6xJCfA7eGl8as9LnTPJfOEanMxcYrHnZaQ=;
 b=LNmBWH3EY43MZIv12XDpP9pdEqPgdnRYckF9Z+fLsADZ4oqeuI2muPW+wlkTQrEeDU5e6K4yYnXvyuU4s4Bnhz9DcZ7VrzkaheGGHhRqDagsFZ1U++FXggduSOT7xBzx3YGJ4kP9nBpqgdGdPkPHrhL3NVFG18Qa3M4UAGdOpSg=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16) by AM6PR0402MB3365.eurprd04.prod.outlook.com
 (2603:10a6:209:c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 03:51:19 +0000
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637]) by AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 03:51:19 +0000
From: Han Xu <han.xu@nxp.com>
To: miquel.raynal@bootlin.com,
	s.hauer@pengutronix.de
Subject: [PATCH v2 0/2] fix some gpmi nand driver bugs
Date: Tue,  8 Dec 2020 21:51:02 -0600
Message-Id: <20201209035104.22679-1-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [70.112.23.252]
X-ClientProxiedBy: DM6PR07CA0096.namprd07.prod.outlook.com
 (2603:10b6:5:337::29) To AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from umbrella.lan (70.112.23.252) by
 DM6PR07CA0096.namprd07.prod.outlook.com (2603:10b6:5:337::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 03:51:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 16dd15ae-5b5f-40c4-0bb6-08d89bf5b018
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB33659A446544B20652AD356F97CC0@AM6PR0402MB3365.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7BQGzLaE1blyUtCTIdR9mXV9wnxQIWmnKhj43tZv4Dey00lPeflN320gkjL+HWycdm6QsX5WE2arWHtcO/HrR3/cemx3W8QsFXJWf6EHQsrICe7HpzMoL83TyrpLG2tOlYDjkpm0Z4V29z4fRkT3ig7jp9zzFlCTDZT6QxeV1Pou+h/569RNp3xNy8VGvr3xWDF4vXBuHGAWt7oWFpQ4IAgC5bSXAl+aayPpY9re2i+g88vUV29ZROR1bgWFsx+HALCuWD81mzPt7gAvXG0hS0+mLP6tbyIznqrgRdyhnvgdEvCnREErQw6DXnE9lJDQVbNuZCds7hOdKXukBOhGmuA7+0yOeFXzWmvPCt/fudQbYr2GneKAwYJGbgWDIfrs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3701.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(8936002)(44832011)(956004)(6512007)(52116002)(2616005)(26005)(2906002)(86362001)(8676002)(508600001)(8886007)(5660300002)(36756003)(66946007)(4744005)(16526019)(186003)(6506007)(1076003)(4326008)(66476007)(34490700003)(66556008)(6666004)(6486002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VDFzfpgS7eUM/ITbQHjh+RncTF3g8UbubtxcZ8pBnDVstadPGeJFGlVp0Qf/?=
 =?us-ascii?Q?lyKUFV6mQU5w+EsmnSBPnz0XUJopasx+TFFvSV6EjytATgQFhPNSnOg0yhzb?=
 =?us-ascii?Q?sulvYFYv3CSVIM3moJm78ka4SwiLCQULcxPpJHeXwxwe5ZPdtZnF9jBycL1n?=
 =?us-ascii?Q?wqHikRYiMgUBWOz+QNtgQjv1myG8vaJIeoqnIf4V8maeXRs1iJR/UGIbIfD4?=
 =?us-ascii?Q?pd8M+q8kF8B/Ct2n0UUCtcXuBWh4K6WkqKWL7N0+aT2XIDfBtidqfRs5ZKBQ?=
 =?us-ascii?Q?XrY4WWXfmf8P4AgwtVBQfQb7NURprbE/OE+YYan4JKuyKQqAuTsGtujEk7yV?=
 =?us-ascii?Q?IDbjpVtamyI9dELxIpWY2H4iK+CvjGJJGRd4uUhaeWAWLYm+W55BA9zOyOqw?=
 =?us-ascii?Q?47a6HMz7Xfb35+W7TZbNuJgltmd0eY1p8RXVGLTg4YVUJHtzDMHRBzxeuD2A?=
 =?us-ascii?Q?Ho5Y8yrbVhMYq/kTQLrIRhjHRpI3+0OJM3KjzjaPidnGufD0O11Si6fWTuGD?=
 =?us-ascii?Q?Q0SFBoKlKYFF8CmsYBJ3J68gDPcGVmX7TrAR30joKhAbCVd+1QYJLlRmegvl?=
 =?us-ascii?Q?hqC1fF53AWXK+EK8PGTAiNcZX+34PcPxqnQSxbIl3xuxmZ6HhpFz4ki57Y5k?=
 =?us-ascii?Q?txANlbEgDj881sit9boc5ZjpsJ++GCgBe/IUV7dgA3N/sUKj3sidxzuDlVGV?=
 =?us-ascii?Q?zwqRC/L60DW5VBHRVmcY55dYWh7C4EP2223tQcnUvyR1kdXQPyNIFVyuaQpP?=
 =?us-ascii?Q?HRft981bvW0u9baIIkXYRQaw5Z+MpWp9PYwUrcyrkJzrcgQa2YmMG+VtEFDK?=
 =?us-ascii?Q?JfpRSmGcA+yZyPBS401M4EIbFtF2aRHgUdr/PoieNPN1hbRbrpB0XZmTNEBR?=
 =?us-ascii?Q?JXgJvqzESKjX+zOLe9zkGb+NZQeEWOwKPr/u6cpm7hNZQghfjmkTREBFpuuV?=
 =?us-ascii?Q?T99NtTX14jMTgnHUjasZ1Iuj2uosFchHCe9CqGLkoXIsRvkduAIaLcerzGi4?=
 =?us-ascii?Q?cuzM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3701.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 03:51:19.5954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 16dd15ae-5b5f-40c4-0bb6-08d89bf5b018
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBQt0ZN/l3RX0ZqrjXkn/4XoxBxcAmJANajBxe/Eq1nPTW2okYefBolGkNpM3HSY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3365
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_225124_089692_B124097F 
X-CRM114-Status: GOOD (  10.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: han.xu@nxp.com, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

fix gpmi nand driver cannot sense multi-cs chip issue and the random DMA
timeout bug. 

changes from v1:
* fixed the typo
* removed the fixes tag
* added Sascha's review tag

Han Xu (2):
  mtd: rawnand: gpmi: Fix the driver only sense CS0 R/B issue
  mtd: rawnand: gpmi: Fix the random DMA timeout issue

 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 36 +++++++++++++++-------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-regs.h |  1 +
 2 files changed, 26 insertions(+), 11 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
