Return-Path: <SRS0=IoAM=FJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591AEC4361A
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Dec 2020 06:31:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F3A22D0B
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Dec 2020 06:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F3A22D0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qI5UYfvs1oYSp5RWLRhDN4vVguhGYgDSFjOu+rtqWMc=; b=AT5l5c0WSnA5DMrxujByCB9iy
	m6Y4nU4GcUgynDLw28amrpbew4fyuNSNIWB9CSPr9nTXztdIXssvtc+chmcakwMLsRGmk19ofzqNc
	Vw6e7tIGSr4PChuGWUu9er7MrfC7AsWYrYBHiMhCvrGjr3ccleDtvpDRiuay8eRD2tLwRZmuzygcs
	R8rQeZIVazWCXb/TQGC33FRTDQeVySK1yCPijUJ/nW5zGVgvfnVxRMoEIgTFZcDC71+KP+RQZHUMT
	sfeTG82t09BIKRXnKS47UQCYk7gaGyLOvQFaQNZKdX/wqphLmusnnkAkmW5WQ/Xt1D+FprcF8Rzpn
	jc/TDwIOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klR5W-0008Nc-Ie; Sat, 05 Dec 2020 06:30:34 +0000
Received: from mail-db8eur05on2076.outbound.protection.outlook.com
 ([40.107.20.76] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klR5S-0008Mj-Qr
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2020 06:30:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4eIq4TJP/j/9EthFXXRWDlCWvSZPDN2/sNO1SDjViLCsGvtBOZf2uTEqWbO7G0e+6jdkqadsTR8Xh36jj0Iei2xa+pRmPrzhLwmdzWIzkmoeTdfMg5bMbZCPZ80/rrPWF2QnL1ApfsD2QjnfEjWl4lSUUY3eWR2y2zCMLFayYb6Loqc6W4knennlX3oJl9geyrlbDWuB2xy3fviwr8OWObtCh474EVAcwwoQzWH9AcIrXZo9EcWwHNI9ULgbQrkuKFcxIPtNBod9ktKxNn89lnkuUp2s2jY6uYnK5oba1u4xDcxlZz4L9I9x3+8tCH1Z0U1Z2oGalqov/kp/Kx4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS50k66Vr8fqjtF6s05NXm8Sin8bsWzw6vHJqoxxKuk=;
 b=Nh29TXaryirBIFbNZ1lxt58YrhnGScjI8byP49AWkrEnWClwnMyxCGiIT1jxAIL63lQu6S6e1/5NaNkaHJLakulOJFnXCUf6leN+VTYiUoblQgxRAEYSo8eTF6PNi3NzsbG8n7kRsAvlXt1egFA/NcEJ8EzKLtxpAWZW9HRJ8JutHSCKE1dZsvFUpYLi1wpOOBmQpyDJ+u0mZszd37e14f0oPwwH9PvQRXSIyTUJZXIR5jFrCwtk7KVuidgQq4wdL/+yXdQeXTQj84gdrrjZSn4xwsz6P9Ott0lShznYsLT23yM1mwlWEYy1P0OQYLCWJJx+x99WcmUraqy8MTqmdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS50k66Vr8fqjtF6s05NXm8Sin8bsWzw6vHJqoxxKuk=;
 b=Yi3p+dOiTsBbjGAg2qhvqL3yp6rFVIDAtJ1ULedAwRGgeutROxor0U7F9DO7rnZIyFdpojrADdBTib7IccJyfyq/c/L/z2/5D3kghzin35aryZ6jOPqFgxrcgyX7Cd6koUmvDsb5CukllEp6F+u+9WUwSIuCx2XHImbENffnyBg=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16) by AM7PR04MB6934.eurprd04.prod.outlook.com
 (2603:10a6:20b:10a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Sat, 5 Dec
 2020 06:30:25 +0000
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637]) by AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637%5]) with mapi id 15.20.3611.036; Sat, 5 Dec 2020
 06:30:25 +0000
From: Han Xu <han.xu@nxp.com>
To: miquel.raynal@bootlin.com,
	s.hauer@pengutronix.de
Subject: [PATCH 2/2] mtd: rawnand: gpmi: Fix the random DMA timeout issue
Date: Sat,  5 Dec 2020 00:30:04 -0600
Message-Id: <20201205063004.3099-2-han.xu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201205063004.3099-1-han.xu@nxp.com>
References: <20201205063004.3099-1-han.xu@nxp.com>
X-Originating-IP: [70.112.23.252]
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (70.112.23.252) by
 BY5PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:1e0::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Sat, 5 Dec 2020 06:30:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 57b99d09-0c30-4362-6a6b-08d898e73f8c
X-MS-TrafficTypeDiagnostic: AM7PR04MB6934:
X-Microsoft-Antispam-PRVS: <AM7PR04MB69348F051F2D69284665623997F00@AM7PR04MB6934.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/S9OonHP8Aa0nK05mH/j970fkFQgtNv6hU/B5GruW1uBszkZL+9bOLKE3gTOVVWHXWlz2cKgoz2Tkkipm2h1jQFkeKeZm3OjGBR5M6UIYjho1n0PIzsLARLswnO2Ke4ZwpV/TpIjxV46HrF5jbNINRCyApvedaf4JJ4+aR51mxv87oet+P0FnPpbqYBmQVOiJSwb7YMaa4IzpHNS3YBY6MzLXMbH9pqtFUd3b7rfpVj4jtH3hKcjaIA9gQhAYMQm+LpUyPGODI/VoQJPYDZ4YD68eKfep/ov4x4pY7NW8GnHt7yMX6Mk5HaiO7Su/5I+56E3tCyyV7LBOtHZXbwM4U+pQjp+QDruZwEUf0EZEiUJScFWEq/HH5oMsR7BlQx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3701.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(39860400002)(396003)(69590400008)(8676002)(86362001)(8936002)(478600001)(2906002)(6666004)(2616005)(956004)(16526019)(6506007)(83380400001)(44832011)(26005)(1076003)(52116002)(66476007)(6486002)(5660300002)(66556008)(4326008)(186003)(66946007)(316002)(36756003)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FYFflBIb8coVtuuh8HRIF37tlwvoNRlSL8My3GUcaEL8IJZyMrs1VQGugRTE?=
 =?us-ascii?Q?xeUMBFheZS7qDgaXVq9ggCqN9PB0dXW67AEp2MrrD2ECk3dRD4sUWe8KX6J9?=
 =?us-ascii?Q?iyUM7LMKedK/u92E7XBJBFLpcB8dr4EGpIUQTTFzv8oZiMPlpSpcBuS3usl3?=
 =?us-ascii?Q?3F9bPWRT0BaHiZZglcy1nYZ58aaW4y5x9JkC+wAeC+OW5tMRm4WCQm9ocHfE?=
 =?us-ascii?Q?aNX282iuXodiU/PKm30Rt7eYnhkfihgeHn3NPQTGBihtoc4KEc27vTxsHro0?=
 =?us-ascii?Q?K+p6H/P/43aXH3xp7QpNFWS0KY8sCgyovZP5y2EGmJcu5sThsThr+PBaW+ZG?=
 =?us-ascii?Q?/pSvLOqVOQjD2AJGWpk8bffNp6p0YPo9GPVJ7SU8Xy8deWApXrlUxniMbkVb?=
 =?us-ascii?Q?b4kNHgp/9r59W/f8m21I3X3WoOWBjKCB/ssLbUhMaw2lC72e1zX1vhSu9tSk?=
 =?us-ascii?Q?7KLFjupqHXPIhFR8Qgw79VHUgXDQjkNjnjZpFoqO/jk9RJSqk0OETOQLVTnG?=
 =?us-ascii?Q?lpm9w1aiyxqYTDv+qZv/usJnoSOOgAZANOLA/2Z21tIDapHBHqH+mPcEjKgP?=
 =?us-ascii?Q?wH8MU7oZMDjUAntJq5OHhW0p4H2gTuyh6dpv+JTtls562AR3qRWFpksGAPjY?=
 =?us-ascii?Q?UES18IkRvLQUy/+apgs93uRDbm5Wy4gksP8oOGTU/LZu7UhN9k5ptkoE+am0?=
 =?us-ascii?Q?HFtSX7NiVVSbh/QC4BhCYA6nRmW2UnscoswUcoh73YKt3dURudGLvvBG7bUz?=
 =?us-ascii?Q?2kx4wZxiBnQt/JCcNPhYSPG6/HzodLqwy7zsdzjAoAl7njm63VJ15qaarmAD?=
 =?us-ascii?Q?kHqR+fjfFRD6/YXsNPeU7rOnrMEEaMhksNiV0uPeB40T4aweXr9DI2yZUCK1?=
 =?us-ascii?Q?duNgo11OC3YuZMf6pOZji03ec/i53uWOJclYpOK8qpcROLBn8l8iRqwZw13g?=
 =?us-ascii?Q?T+OhHE6+CZhVemv9YmU2zTb3Mi/OR8IyZ4lG6iLRlqubeE6PPl/b2cJuepY1?=
 =?us-ascii?Q?p+2b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b99d09-0c30-4362-6a6b-08d898e73f8c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3701.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2020 06:30:25.0285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PIfYAlYiIpCMXdZLUJSY/OH8UJNBsO8p3oQct00ynr5uugSWAVHjuhv7dEzPjo8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6934
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_013030_973383_4AC1E6E1 
X-CRM114-Status: GOOD (  15.28  )
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
Cc: linux-mtd@lists.infradead.org
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
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 32 +++++++++++++++-------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 793a8e27ce66..5464850c427f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+// SPDX-License-Identifier: GPL- .0+
 /*
  * Freescale GPMI NAND Flash Driver
  *
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
