Return-Path: <SRS0=ozsj=FN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFB4C4361B
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 03:52:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F946239FD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 03:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F946239FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+eUrkMm56Pk0mnIRfZUj/rbMwwu2YqVxqP/G5oj4NJg=; b=eufs/WOQduFlqQ6e12syqpRwq
	5RGrIM6KyRasQU4wN89Toz5BJ+RDPjj/rm46hWY9rYMMSLOh8xf99O5KohxbOG/wWcFBcTbF5gWKv
	Mc0K0Lz/fVMWymjzAt2xUAzklRgvJBvi8GNil8ClPnjvw9WFF93qvKfIOG39D/nfpv9TfL6BRu6iV
	UXB5fCRmA388NjspHg+lD551pcc5kzRGC8Q+KninGWLgiNYVyx7PlPaaVKLymhiR3gRukg+KGlPeQ
	wpf3pZQlVGnRTMg8OwZHv9jVclWNDTJR8Ps3/T1jsAny9He/qO/z046X16ysLKDjqORMvRXwkxbBl
	vNwoInZRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmqVn-0002oI-BO; Wed, 09 Dec 2020 03:51:31 +0000
Received: from mail-eopbgr150082.outbound.protection.outlook.com
 ([40.107.15.82] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmqVj-0002me-4r
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2020 03:51:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzbBZv+ukJN7BsfkP3Jw0OgBg9SjKMF5ufHdJ16IV2mD7neNZC78TNguO/46PlEj01+FtGZSA38cpZNixZgM1lz8Y0ngVaozmHPjeLSzSFC/Xfcxghc17/DSClWMGRTKI3jUUUQ2/y6K/0I3p/cj9q3iR21z41veRgKSYF+DLPWnD1iFn4W6wIAWfl2kc+y76ohEyCE0BJkEbmYqOPZpvyj1yVvEEj6Xjb+hR6nC6+2cGBCYG8wle5U2UanNXkeuSLx20VBdiwgNFVrDGZ2a6ixnY6KXpLLAhZBiTuMeANBpduFq0MMrULLPmaRNioeomIdLqlfrUyzQJYM9mESpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MXRtdZEuuRITVrScgTGjIkx4fLOe8RGS00WJB49kRs=;
 b=QK1Qv1h9QLLhhb5saVJavfpDqBuUFf0Vfmn+5eHzr8ROuckfRBKqrCyfTCJI8OXjjLYaQBvaYt4qOWc6JsqTvElNtsH2e8ImmVJcgKyUYWUr7sIc/OiglvuVYOZIN76T1ptWDMQWtYDNcQh5TVBPHz2h5PA9I637hlLLGf30afEotoA0mYYlXgDjDSBdFbqVQXadb+vEEatE6Ca/S3RLpvSBg66xJol6K8Yq6X2BtrtNO2sOv0DrpqhcPmWVSYWPI5cCcgvsFYO9bVnHNnbS8IcTI4adkLakT3m2uNY4l15VU9MNBvcGyUf2QwbZyCv8j9DZP1YfaFLUMgN4eEEAfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MXRtdZEuuRITVrScgTGjIkx4fLOe8RGS00WJB49kRs=;
 b=J9dkS25lhw2djIEqUKN5RA+ntFUzntpZ9CaisfMV1lURXn90z7Ha8/XaqB+1J3SxfdGdvqSCAfSwHOzRnerx+ZVQM+reCac49ktHfE8LPTx+4e/gQEwzUBbjR8Fwi3GpIC/Z8lg47Dsn1LfEp7q7V7m6mcB7vrpkX2ryL4iECdA=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16) by AM6PR0402MB3365.eurprd04.prod.outlook.com
 (2603:10a6:209:c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 03:51:22 +0000
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637]) by AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 03:51:22 +0000
From: Han Xu <han.xu@nxp.com>
To: miquel.raynal@bootlin.com,
	s.hauer@pengutronix.de
Subject: [PATCH v2 2/2] mtd: rawnand: gpmi: Fix the random DMA timeout issue
Date: Tue,  8 Dec 2020 21:51:04 -0600
Message-Id: <20201209035104.22679-3-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209035104.22679-1-han.xu@nxp.com>
References: <20201209035104.22679-1-han.xu@nxp.com>
X-Originating-IP: [70.112.23.252]
X-ClientProxiedBy: DM6PR07CA0096.namprd07.prod.outlook.com
 (2603:10b6:5:337::29) To AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from umbrella.lan (70.112.23.252) by
 DM6PR07CA0096.namprd07.prod.outlook.com (2603:10b6:5:337::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 03:51:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 53f57903-8946-4207-cbe5-08d89bf5b1b3
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3365:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3365F681410E775ECB97D67F97CC0@AM6PR0402MB3365.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aja6SO5Mu0OMK+8ALFqM9+B0rF4UDpHeM6t5+8lfs06sxM6tUBceLg9mBmv8j8oRubyzIrT7SnRnimrZyuEp0GiqkgYsfNDw9SxPJSEB51MbF2Gppw+vGeqOPiPnHb8o7RBX1gX3ElV9zxZAjhzfZIDL3ktee4eH6wqeUfGvIIghLdXiGfabsQrJBI8sEatvORn4dCOEEX+tEYHlWOFSERqpGO93uKGPksk3wbOA7tWgFwdTWCgyUnG9lfbRsSOgaYmm0TRfddRZ0uSvIWWOTNiyJmcjhsIAn8TQXdnRLeLqB2SqnchMcEwiGcnsdCzPE7UEQYLrIj3Qq/66rrxNmliRg+R5hXp+OVKAoMy6kwuDZ0MNX3cwFSgGyx88gNwB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3701.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(8936002)(44832011)(956004)(6512007)(52116002)(2616005)(26005)(2906002)(86362001)(8676002)(508600001)(8886007)(5660300002)(36756003)(66946007)(16526019)(186003)(6506007)(1076003)(4326008)(66476007)(34490700003)(66556008)(6666004)(6486002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gEOfXX8XqgI3il6QjYliDdMXz03InHZ7IEj1kmmWenYGcyHXYgEHWobprm7o?=
 =?us-ascii?Q?qtNlZv27VlRzHP+/uuB5kFTxF58sZjZQ1L8x9Ooxcx9A+7Fza6gBS60puQIq?=
 =?us-ascii?Q?1XsJgd0rTJlyAvZdm4+RGYtcS4YM0E6g1ueST4WpeZw/uuObDMWPlSYyNC1q?=
 =?us-ascii?Q?ZQLm6/sQSVT7H08yL9+OKrV+eIOdW+Cn5wxPk4VtuUqqKFlW84USP95vhqpG?=
 =?us-ascii?Q?8XiWRDz/NY4VBIEItx89bx8qGo9alrOhkpCFeRAM4mmD+/PQ/Le+zFQyj9Os?=
 =?us-ascii?Q?4m2AUIHqbLsKx87VRciXCv3PDgiEQefT96vW5YVnU238uHhPS7ShwPSq46oH?=
 =?us-ascii?Q?5fZUgXjLsK9hXMaxhfFHdKqGKERQkAPtCNNKlNz7MATrhW8PJIaMqfGlRF6L?=
 =?us-ascii?Q?8qG4EnrI/R7AVIj8DW/M93/qrWXC+zWz2v9nzBpoFuki5LQOozxROqdBDMVW?=
 =?us-ascii?Q?uPPYl9S+auVueo4O+4viIlR4HA33rZ4eDaLw0hX8vYP1gIvyebtvujFOA62g?=
 =?us-ascii?Q?qalL9gTNoVTqzPbodUgVkocWZgxh9mK77I1YTyqexAztyCVaTBSfRPzDTMWs?=
 =?us-ascii?Q?nBjJLu/tW8ge/HyJDlryNh42QhilATrENm33JMLUzT0B8NTjbEeEyTm/5RRQ?=
 =?us-ascii?Q?zm61JjBaNQDh6qR9q2tYvcPI5hjUL4A0QRyvkwh5Wa2KnvzBixcJNPbzlxVu?=
 =?us-ascii?Q?Hk52I3IrSZs97H3CK9V3ysZXluwaavf6o+46NzkiTmktPgevLb7vAD5ojvkj?=
 =?us-ascii?Q?PTJ97GkTX3oNYL8PjhxWo7xdkqFY/Vgt67TSqhohZf4saxraS+kPc21rB2CH?=
 =?us-ascii?Q?BWOzkVDZvKRea57pmnqUwCqxKFlf7cwIcqtlVTTfLzZU+A91LiHYU/VR+QUK?=
 =?us-ascii?Q?MCEKSs7mozwPAZ4DI7OF0C+F7DpEq/0J2GRBTMjtZwFuUtk9GGTH1A0uLjJY?=
 =?us-ascii?Q?Z5R2jQlmLEcKzJcCr/xggBDf1MvFf41TGZNSWFmyBCii0CuMIN0nh1/aSWiw?=
 =?us-ascii?Q?/L1E?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3701.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 03:51:22.2698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f57903-8946-4207-cbe5-08d89bf5b1b3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yriNnuDNrxdEy9saAQNp/G/fIXK60sAnYZUXHm9I/khz6S4VwD9i3np1xOCT5NSZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3365
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_225127_335081_7400C966 
X-CRM114-Status: GOOD (  17.16  )
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

To get better performance, current gpmi driver collected and chained all
small DMA transfers in gpmi_nfc_exec_op, the whole chain triggered and
wait for complete at the end.

But some random DMA timeout found in this new driver, with the help of
ftrace, we found the root cause is as follows:

Take gpmi_ecc_read_page() as an example, gpmi_nfc_exec_op collected 6
DMA transfers and the DMA chain triggered at the end. It waits for bch
completion and check jiffies if it's timeout. The typical function graph
shown below,

   63.216351 |   1)               |  gpmi_ecc_read_page() {
   63.216352 |   1)   0.750 us    |    gpmi_bch_layout_std();
   63.216354 |   1)               |    gpmi_nfc_exec_op() {
   63.216355 |   1)               |      gpmi_chain_command() {
   63.216356 |   1)               |        mxs_dma_prep_slave_sg() {
   63.216357 |   1)               |          /* mxs chan ccw idx: 0 */
   63.216358 |   1)   1.750 us    |        }
   63.216359 |   1)               |        mxs_dma_prep_slave_sg() {
   63.216360 |   1)               |          /* mxs chan ccw idx: 1 */
   63.216361 |   1)   2.000 us    |        }
   63.216361 |   1)   6.500 us    |      }
   63.216362 |   1)               |      gpmi_chain_command() {
   63.216363 |   1)               |        mxs_dma_prep_slave_sg() {
   63.216364 |   1)               |          /* mxs chan ccw idx: 2 */
   63.216365 |   1)   1.750 us    |        }
   63.216366 |   1)               |        mxs_dma_prep_slave_sg() {
   63.216367 |   1)               |          /* mxs chan ccw idx: 3 */
   63.216367 |   1)   1.750 us    |        }
   63.216368 |   1)   5.875 us    |      }
   63.216369 |   1)               |      /* gpmi_chain_wait_ready */
   63.216370 |   1)               |      mxs_dma_prep_slave_sg() {
   63.216372 |   1)               |        /* mxs chan ccw idx: 4 */
   63.216373 |   1)   3.000 us    |      }
   63.216374 |   1)               |      /* gpmi_chain_data_read */
   63.216376 |   1)               |      mxs_dma_prep_slave_sg() {
   63.216377 |   1)               |        /* mxs chan ccw idx: 5 */
   63.216378 |   1)   2.000 us    |      }
   63.216379 |   1)   1.125 us    |      mxs_dma_tx_submit();
   63.216381 |   1)   1.000 us    |      mxs_dma_enable_chan();
   63.216712 |   0)   2.625 us    |  mxs_dma_int_handler();
   63.216717 |   0)   4.250 us    |  bch_irq();
   63.216723 |   0)   1.250 us    |  mxs_dma_tasklet();
   63.216723 |   1)               |      /* jiffies left 250 */
   63.216725 |   1) ! 372.000 us  |    }
   63.216726 |   1)   2.625 us    |    gpmi_count_bitflips();
   63.216730 |   1) ! 379.125 us  |  }

but it's not gurantee that bch irq handled always after dma irq handled,
sometimes bch_irq comes first and gpmi_nfc_exec_op won't wait anymore,
another gpmi_nfc_exec_op may get invoked before last DMA chain IRQ
handled, this messed up the next DMA chain and causes DMA timeout. Check
the trace log when issue happened.

   63.218923 |   1)               |  gpmi_ecc_read_page() {
   63.218924 |   1)   0.625 us    |    gpmi_bch_layout_std();
   63.218926 |   1)               |    gpmi_nfc_exec_op() {
   63.218927 |   1)               |      gpmi_chain_command() {
   63.218928 |   1)               |        mxs_dma_prep_slave_sg() {
   63.218929 |   1)               |          /* mxs chan ccw idx: 0 */
   63.218929 |   1)   1.625 us    |        }
   63.218931 |   1)               |        mxs_dma_prep_slave_sg() {
   63.218931 |   1)               |          /* mxs chan ccw idx: 1 */
   63.218932 |   1)   1.750 us    |        }
   63.218933 |   1)   5.875 us    |      }
   63.218934 |   1)               |      gpmi_chain_command() {
   63.218934 |   1)               |        mxs_dma_prep_slave_sg() {
   63.218935 |   1)               |          /* mxs chan ccw idx: 2 */
   63.218936 |   1)   1.875 us    |        }
   63.218937 |   1)               |        mxs_dma_prep_slave_sg() {
   63.218938 |   1)               |          /* mxs chan ccw idx: 3 */
   63.218939 |   1)   1.625 us    |        }
   63.218939 |   1)   5.875 us    |      }
   63.218940 |   1)               |      /* gpmi_chain_wait_ready */
   63.218941 |   1)               |      mxs_dma_prep_slave_sg() {
   63.218942 |   1)               |        /* mxs chan ccw idx: 4 */
   63.218942 |   1)   1.625 us    |      }
   63.218943 |   1)               |      /* gpmi_chain_data_read */
   63.218944 |   1)               |      mxs_dma_prep_slave_sg() {
   63.218945 |   1)               |        /* mxs chan ccw idx: 5 */
   63.218947 |   1)   2.375 us    |      }
   63.218948 |   1)   0.625 us    |      mxs_dma_tx_submit();
   63.218949 |   1)   1.000 us    |      mxs_dma_enable_chan();
   63.219276 |   0)   5.125 us    |  bch_irq();                  <----
   63.219283 |   1)               |      /* jiffies left 250 */
   63.219285 |   1) ! 358.625 us  |    }
   63.219286 |   1)   2.750 us    |    gpmi_count_bitflips();
   63.219289 |   1) ! 366.000 us  |  }
   63.219290 |   1)               |  gpmi_ecc_read_page() {
   63.219291 |   1)   0.750 us    |    gpmi_bch_layout_std();
   63.219293 |   1)               |    gpmi_nfc_exec_op() {
   63.219294 |   1)               |      gpmi_chain_command() {
   63.219295 |   1)               |        mxs_dma_prep_slave_sg() {
   63.219295 |   0)   1.875 us    |  mxs_dma_int_handler();      <----
   63.219296 |   1)               |          /* mxs chan ccw idx: 6 */
   63.219297 |   1)   2.250 us    |        }
   63.219298 |   1)               |        mxs_dma_prep_slave_sg() {
   63.219298 |   0)   1.000 us    |  mxs_dma_tasklet();
   63.219299 |   1)               |          /* mxs chan ccw idx: 0 */
   63.219300 |   1)   1.625 us    |        }
   63.219300 |   1)   6.375 us    |      }
   63.219301 |   1)               |      gpmi_chain_command() {
   63.219302 |   1)               |        mxs_dma_prep_slave_sg() {
   63.219303 |   1)               |          /* mxs chan ccw idx: 1 */
   63.219304 |   1)   1.625 us    |        }
   63.219305 |   1)               |        mxs_dma_prep_slave_sg() {
   63.219306 |   1)               |          /* mxs chan ccw idx: 2 */
   63.219306 |   1)   1.875 us    |        }
   63.219307 |   1)   6.000 us    |      }
   63.219308 |   1)               |      /* gpmi_chain_wait_ready */
   63.219308 |   1)               |      mxs_dma_prep_slave_sg() {
   63.219309 |   1)               |        /* mxs chan ccw idx: 3 */
   63.219310 |   1)   2.000 us    |      }
   63.219311 |   1)               |      /* gpmi_chain_data_read */
   63.219312 |   1)               |      mxs_dma_prep_slave_sg() {
   63.219313 |   1)               |        /* mxs chan ccw idx: 4 */
   63.219314 |   1)   1.750 us    |      }
   63.219315 |   1)   0.625 us    |      mxs_dma_tx_submit();
   63.219316 |   1)   0.875 us    |      mxs_dma_enable_chan();
   64.224227 |   1)               |      /* jiffies left 0 */

In the first gpmi_nfc_exec_op, bch_irq comes first and gpmi_nfc_exec_op
exits, but DMA IRQ still not happened yet until the middle of following
gpmi_nfc_exec_op, the first DMA transfer index get messed and DMA get
timeout.

To fix the issue, when there is bch ops in DMA chain, the
gpmi_nfc_exec_op should wait for both completions rather than bch
completion only.

Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
Signed-off-by: Han Xu <han.xu@nxp.com>
Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 30 +++++++++++++++-------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index b06e202cdd0d..aaae000f9169 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2256,7 +2256,7 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	void *buf_read = NULL;
 	const void *buf_write = NULL;
 	bool direct = false;
-	struct completion *completion;
+	struct completion *dma_completion, *bch_completion;
 	unsigned long to;
 
 	if (check_only)
@@ -2353,22 +2353,24 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 		       this->resources.bch_regs + HW_BCH_FLASH0LAYOUT1);
 	}
 
+	desc->callback = dma_irq_callback;
+	desc->callback_param = this;
+	dma_completion = &this->dma_done;
+	bch_completion = NULL;
+
+	init_completion(dma_completion);
+
 	if (this->bch && buf_read) {
 		writel(BM_BCH_CTRL_COMPLETE_IRQ_EN,
 		       this->resources.bch_regs + HW_BCH_CTRL_SET);
-		completion = &this->bch_done;
-	} else {
-		desc->callback = dma_irq_callback;
-		desc->callback_param = this;
-		completion = &this->dma_done;
+		bch_completion = &this->bch_done;
+		init_completion(bch_completion);
 	}
 
-	init_completion(completion);
-
 	dmaengine_submit(desc);
 	dma_async_issue_pending(get_dma_chan(this));
 
-	to = wait_for_completion_timeout(completion, msecs_to_jiffies(1000));
+	to = wait_for_completion_timeout(dma_completion, msecs_to_jiffies(1000));
 	if (!to) {
 		dev_err(this->dev, "DMA timeout, last DMA\n");
 		gpmi_dump_info(this);
@@ -2376,6 +2378,16 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 		goto unmap;
 	}
 
+	if (this->bch && buf_read) {
+		to = wait_for_completion_timeout(bch_completion, msecs_to_jiffies(1000));
+		if (!to) {
+			dev_err(this->dev, "BCH timeout, last DMA\n");
+			gpmi_dump_info(this);
+			ret = -ETIMEDOUT;
+			goto unmap;
+		}
+	}
+
 	writel(BM_BCH_CTRL_COMPLETE_IRQ_EN,
 	       this->resources.bch_regs + HW_BCH_CTRL_CLR);
 	gpmi_clear_bch(this);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
