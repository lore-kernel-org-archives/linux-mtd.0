Return-Path: <SRS0=O8Pa=FO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A3E1C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 21:40:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40C1923DE3
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 21:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40C1923DE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wtVJ3AM8/Z3bXoGbCLZMvWcqj2EJ1NHXyPwSYqzDutU=; b=r63BC9mjWk3PR0Awz969SsQIk
	2xNX4WyuVZBm1YCL1+823FDtnUBsmA88OOEit24JAYyNPebPR7B2TeYJtH8mXilYOR0QGvuqrcMxv
	AU+W1xe7e+rulf3fCWSiYtGslwFSlq4npqG80ONCFEEx2MuuieX7W7HIjJYyoUPnIC6l5G5egnh5w
	WSBLqRfAwhq8ogDu/LC11DnrCxiK+w3I9RuO9WtB1Ol0lAElEkZTJa/Uv1eelwpWRgPHnLmP4rTiC
	ye+cTVvF/tEz4PzsEkipIz0jFScFgGPFKrA5O1WrO3dqU+fVWtLn6u9bvjbkdhxXCA5rS6QQcePir
	oZ/KjUplA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knTfC-0008B9-Fs; Thu, 10 Dec 2020 21:39:50 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knTeY-0007x5-VW
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2020 21:39:15 +0000
X-Originating-IP: 109.220.208.103
Received: from localhost.localdomain
 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr [109.220.208.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B555720002;
 Thu, 10 Dec 2020 21:39:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>, miquel.raynal@bootlin.com, s.hauer@pengutronix.de
Subject: Re: [PATCH v2 2/2] mtd: rawnand: gpmi: Fix the random DMA timeout
 issue
Date: Thu, 10 Dec 2020 22:39:06 +0100
Message-Id: <20201210213906.9706-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201209035104.22679-3-han.xu@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: ee4e0eafa43cfd9008722fe15e17b8bf62fb6e8d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_163912_314541_B2CB6FE7 
X-CRM114-Status: GOOD (  13.96  )
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

On Wed, 2020-12-09 at 03:51:04 UTC, Han Xu wrote:
> To get better performance, current gpmi driver collected and chained all
> small DMA transfers in gpmi_nfc_exec_op, the whole chain triggered and
> wait for complete at the end.
> 
> But some random DMA timeout found in this new driver, with the help of
> ftrace, we found the root cause is as follows:
> 
> Take gpmi_ecc_read_page() as an example, gpmi_nfc_exec_op collected 6
> DMA transfers and the DMA chain triggered at the end. It waits for bch
> completion and check jiffies if it's timeout. The typical function graph
> shown below,
> 
>    63.216351 |   1)               |  gpmi_ecc_read_page() {
>    63.216352 |   1)   0.750 us    |    gpmi_bch_layout_std();
>    63.216354 |   1)               |    gpmi_nfc_exec_op() {
>    63.216355 |   1)               |      gpmi_chain_command() {
>    63.216356 |   1)               |        mxs_dma_prep_slave_sg() {
>    63.216357 |   1)               |          /* mxs chan ccw idx: 0 */
>    63.216358 |   1)   1.750 us    |        }
>    63.216359 |   1)               |        mxs_dma_prep_slave_sg() {
>    63.216360 |   1)               |          /* mxs chan ccw idx: 1 */
>    63.216361 |   1)   2.000 us    |        }
>    63.216361 |   1)   6.500 us    |      }
>    63.216362 |   1)               |      gpmi_chain_command() {
>    63.216363 |   1)               |        mxs_dma_prep_slave_sg() {
>    63.216364 |   1)               |          /* mxs chan ccw idx: 2 */
>    63.216365 |   1)   1.750 us    |        }
>    63.216366 |   1)               |        mxs_dma_prep_slave_sg() {
>    63.216367 |   1)               |          /* mxs chan ccw idx: 3 */
>    63.216367 |   1)   1.750 us    |        }
>    63.216368 |   1)   5.875 us    |      }
>    63.216369 |   1)               |      /* gpmi_chain_wait_ready */
>    63.216370 |   1)               |      mxs_dma_prep_slave_sg() {
>    63.216372 |   1)               |        /* mxs chan ccw idx: 4 */
>    63.216373 |   1)   3.000 us    |      }
>    63.216374 |   1)               |      /* gpmi_chain_data_read */
>    63.216376 |   1)               |      mxs_dma_prep_slave_sg() {
>    63.216377 |   1)               |        /* mxs chan ccw idx: 5 */
>    63.216378 |   1)   2.000 us    |      }
>    63.216379 |   1)   1.125 us    |      mxs_dma_tx_submit();
>    63.216381 |   1)   1.000 us    |      mxs_dma_enable_chan();
>    63.216712 |   0)   2.625 us    |  mxs_dma_int_handler();
>    63.216717 |   0)   4.250 us    |  bch_irq();
>    63.216723 |   0)   1.250 us    |  mxs_dma_tasklet();
>    63.216723 |   1)               |      /* jiffies left 250 */
>    63.216725 |   1) ! 372.000 us  |    }
>    63.216726 |   1)   2.625 us    |    gpmi_count_bitflips();
>    63.216730 |   1) ! 379.125 us  |  }
> 
> but it's not gurantee that bch irq handled always after dma irq handled,
> sometimes bch_irq comes first and gpmi_nfc_exec_op won't wait anymore,
> another gpmi_nfc_exec_op may get invoked before last DMA chain IRQ
> handled, this messed up the next DMA chain and causes DMA timeout. Check
> the trace log when issue happened.
> 
>    63.218923 |   1)               |  gpmi_ecc_read_page() {
>    63.218924 |   1)   0.625 us    |    gpmi_bch_layout_std();
>    63.218926 |   1)               |    gpmi_nfc_exec_op() {
>    63.218927 |   1)               |      gpmi_chain_command() {
>    63.218928 |   1)               |        mxs_dma_prep_slave_sg() {
>    63.218929 |   1)               |          /* mxs chan ccw idx: 0 */
>    63.218929 |   1)   1.625 us    |        }
>    63.218931 |   1)               |        mxs_dma_prep_slave_sg() {
>    63.218931 |   1)               |          /* mxs chan ccw idx: 1 */
>    63.218932 |   1)   1.750 us    |        }
>    63.218933 |   1)   5.875 us    |      }
>    63.218934 |   1)               |      gpmi_chain_command() {
>    63.218934 |   1)               |        mxs_dma_prep_slave_sg() {
>    63.218935 |   1)               |          /* mxs chan ccw idx: 2 */
>    63.218936 |   1)   1.875 us    |        }
>    63.218937 |   1)               |        mxs_dma_prep_slave_sg() {
>    63.218938 |   1)               |          /* mxs chan ccw idx: 3 */
>    63.218939 |   1)   1.625 us    |        }
>    63.218939 |   1)   5.875 us    |      }
>    63.218940 |   1)               |      /* gpmi_chain_wait_ready */
>    63.218941 |   1)               |      mxs_dma_prep_slave_sg() {
>    63.218942 |   1)               |        /* mxs chan ccw idx: 4 */
>    63.218942 |   1)   1.625 us    |      }
>    63.218943 |   1)               |      /* gpmi_chain_data_read */
>    63.218944 |   1)               |      mxs_dma_prep_slave_sg() {
>    63.218945 |   1)               |        /* mxs chan ccw idx: 5 */
>    63.218947 |   1)   2.375 us    |      }
>    63.218948 |   1)   0.625 us    |      mxs_dma_tx_submit();
>    63.218949 |   1)   1.000 us    |      mxs_dma_enable_chan();
>    63.219276 |   0)   5.125 us    |  bch_irq();                  <----
>    63.219283 |   1)               |      /* jiffies left 250 */
>    63.219285 |   1) ! 358.625 us  |    }
>    63.219286 |   1)   2.750 us    |    gpmi_count_bitflips();
>    63.219289 |   1) ! 366.000 us  |  }
>    63.219290 |   1)               |  gpmi_ecc_read_page() {
>    63.219291 |   1)   0.750 us    |    gpmi_bch_layout_std();
>    63.219293 |   1)               |    gpmi_nfc_exec_op() {
>    63.219294 |   1)               |      gpmi_chain_command() {
>    63.219295 |   1)               |        mxs_dma_prep_slave_sg() {
>    63.219295 |   0)   1.875 us    |  mxs_dma_int_handler();      <----
>    63.219296 |   1)               |          /* mxs chan ccw idx: 6 */
>    63.219297 |   1)   2.250 us    |        }
>    63.219298 |   1)               |        mxs_dma_prep_slave_sg() {
>    63.219298 |   0)   1.000 us    |  mxs_dma_tasklet();
>    63.219299 |   1)               |          /* mxs chan ccw idx: 0 */
>    63.219300 |   1)   1.625 us    |        }
>    63.219300 |   1)   6.375 us    |      }
>    63.219301 |   1)               |      gpmi_chain_command() {
>    63.219302 |   1)               |        mxs_dma_prep_slave_sg() {
>    63.219303 |   1)               |          /* mxs chan ccw idx: 1 */
>    63.219304 |   1)   1.625 us    |        }
>    63.219305 |   1)               |        mxs_dma_prep_slave_sg() {
>    63.219306 |   1)               |          /* mxs chan ccw idx: 2 */
>    63.219306 |   1)   1.875 us    |        }
>    63.219307 |   1)   6.000 us    |      }
>    63.219308 |   1)               |      /* gpmi_chain_wait_ready */
>    63.219308 |   1)               |      mxs_dma_prep_slave_sg() {
>    63.219309 |   1)               |        /* mxs chan ccw idx: 3 */
>    63.219310 |   1)   2.000 us    |      }
>    63.219311 |   1)               |      /* gpmi_chain_data_read */
>    63.219312 |   1)               |      mxs_dma_prep_slave_sg() {
>    63.219313 |   1)               |        /* mxs chan ccw idx: 4 */
>    63.219314 |   1)   1.750 us    |      }
>    63.219315 |   1)   0.625 us    |      mxs_dma_tx_submit();
>    63.219316 |   1)   0.875 us    |      mxs_dma_enable_chan();
>    64.224227 |   1)               |      /* jiffies left 0 */
> 
> In the first gpmi_nfc_exec_op, bch_irq comes first and gpmi_nfc_exec_op
> exits, but DMA IRQ still not happened yet until the middle of following
> gpmi_nfc_exec_op, the first DMA transfer index get messed and DMA get
> timeout.
> 
> To fix the issue, when there is bch ops in DMA chain, the
> gpmi_nfc_exec_op should wait for both completions rather than bch
> completion only.
> 
> Fixes: ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")
> Signed-off-by: Han Xu <han.xu@nxp.com>
> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git 1406495, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
