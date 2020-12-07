Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373CDC4361B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 10:43:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D53523339
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 10:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D53523339
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NIa6hx8YiXobUZ2AOG1U9VKFRG+cnyTleR6VOQu6JCA=; b=ntTno/YnNSFUpq2xVi8qZECcr
	qwc3l7QvBl0vNPCIxupDL5nf4szaC03fxaik6hrf77w/xOv3CXdwuGkKRoBPrvlYS5yTofNPdBzTq
	WReO9sjOvsGN7TM6CbPVYTIp+QUTHGB6M5EZ85z0zSSMvcR4SFGu9T0N4Yg6Ft3nVqBuNIwCN9E0q
	gRZvIIHjDaEEy14Wa71ysXbPzN0Ipca7hoZUzVSzfu73gMhzFyuIPsrOkSbTUSFYq4CO1Kax3nKw7
	Wf47DiCgTDTQ1KvOUz6BgiJif2UJTglUQdHs5loEFQ3u8ZXkyGCN+oDg5pKktczP4mmhH6Gfs+nvZ
	XZwcFCBwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmDxy-0007iZ-M0; Mon, 07 Dec 2020 10:42:02 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmDxw-0007hv-4L
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 10:42:01 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kmDxu-0003oy-9n; Mon, 07 Dec 2020 11:41:58 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kmDxt-00088h-Rv; Mon, 07 Dec 2020 11:41:57 +0100
Date: Mon, 7 Dec 2020 11:41:57 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: gpmi: Fix the random DMA timeout issue
Message-ID: <20201207104157.GM3977@pengutronix.de>
References: <20201205063004.3099-1-han.xu@nxp.com>
 <20201205063004.3099-2-han.xu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201205063004.3099-2-han.xu@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:31:55 up 4 days, 22:58, 64 users, load average: 0.12, 0.21, 0.24
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_054200_345471_56A76EDC 
X-CRM114-Status: GOOD (  25.90  )
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
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Dec 05, 2020 at 12:30:04AM -0600, Han Xu wrote:
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
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 32 +++++++++++++++-------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 793a8e27ce66..5464850c427f 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +// SPDX-License-Identifier: GPL- .0+

Ups?

> @@ -2353,22 +2353,24 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
>  		       this->resources.bch_regs + HW_BCH_FLASH0LAYOUT1);
>  	}
>  
> +	desc->callback = dma_irq_callback;
> +	desc->callback_param = this;
> +	dma_completion = &this->dma_done;
> +	bch_completion = NULL;
> +
> +	init_completion(dma_completion);
> +
>  	if (this->bch && buf_read) {
>  		writel(BM_BCH_CTRL_COMPLETE_IRQ_EN,
>  		       this->resources.bch_regs + HW_BCH_CTRL_SET);
> -		completion = &this->bch_done;
> -	} else {
> -		desc->callback = dma_irq_callback;
> -		desc->callback_param = this;
> -		completion = &this->dma_done;
> +		bch_completion = &this->bch_done;
> +		init_completion(bch_completion);
>  	}
>  
> -	init_completion(completion);
> -
>  	dmaengine_submit(desc);
>  	dma_async_issue_pending(get_dma_chan(this));
>  
> -	to = wait_for_completion_timeout(completion, msecs_to_jiffies(1000));
> +	to = wait_for_completion_timeout(dma_completion, msecs_to_jiffies(1000));
>  	if (!to) {
>  		dev_err(this->dev, "DMA timeout, last DMA\n");
>  		gpmi_dump_info(this);
> @@ -2376,6 +2378,16 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
>  		goto unmap;
>  	}
>  
> +	if (this->bch && buf_read) {
> +		to = wait_for_completion_timeout(bch_completion, msecs_to_jiffies(1000));
> +		if (!to) {
> +			dev_err(this->dev, "BCH timeout, last DMA\n");
> +			gpmi_dump_info(this);
> +			ret = -ETIMEDOUT;
> +			goto unmap;
> +		}
> +	}

Technically when reading we are not interested in the dma_completion,
but only in the bch completion. We are only interested that the dma
interrupt handler has been executed before we start the next command.
This might cause a little performance loss, but this is probably
negligible compared to the effort we have to do to synchronize the dma
handler to the correspoding events.

So with the accidently slipped in hunk removed I am fine with the patch
and you can add my:

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
