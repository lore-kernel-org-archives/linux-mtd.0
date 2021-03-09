Return-Path: <SRS0=cj04=IH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8CBC433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 07:07:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0670465287
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 07:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0670465287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f8RiIjstJRfccAE3e9YK/A6k0rCea5B/pLjKHIu5c4g=; b=Ny8NNEfvOwC3EG3cCoUPkPJXK
	2h0wByz0XkkameIn2ilo74QqKIbL71N/LtXOMgTmSMtDDmSslPao/iXKTLiUbvRg712lHfLBPABss
	gt2T5PPxe6dcK43RTN404osNslrh9JCMw0A7rtKAbGKbYGWockx1ZGprIMhPM+fraaRct0OydPJQ+
	XyXDMHatTb4vOd2cQ8RiOC5yOlRTyhXvT3bKxuRMJdEo9f+X/pLLQ7uhGRKA2yxb2OmqS8DqTLRP4
	/YqbXN+2eRELGWu15iAocXFmx+8R4B8BaxrwH74/jU7yTgzjwzB45iXyH2OL0RLHgSJVZpUpBubsd
	Sbpe9Mjyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJWRf-003wG0-Tk; Tue, 09 Mar 2021 07:06:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJWRX-003wFT-Rt; Tue, 09 Mar 2021 07:06:14 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2FB401F451E8;
 Tue,  9 Mar 2021 07:06:11 +0000 (GMT)
Date: Tue, 9 Mar 2021 08:06:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 matthias.bgg@gmail.com, linux-mtd@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: mtk: Fix WAITRDY break condition and timeout
Message-ID: <20210309080608.63373f78@collabora.com>
In-Reply-To: <20210309000107.1368404-1-hauke@hauke-m.de>
References: <20210309000107.1368404-1-hauke@hauke-m.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_070612_185964_352CD05C 
X-CRM114-Status: GOOD (  20.98  )
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

On Tue,  9 Mar 2021 01:01:07 +0100
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> This fixes NAND_OP_WAITRDY_INSTR operation in the driver. Without this
> change the driver waits till the system is busy, but we should wait till
> the busy flag is cleared. The readl_poll_timeout() function gets a break
> condition, not a wait condition.
> 
> In addition fix the timeout. The timeout_ms is given in ms, but the
> readl_poll_timeout() function takes the timeout in us. Multiple the
> given timeout by 1000 to convert it.
> 
> Without this change, the driver does not work at all, it doesn't even
> identify the NAND chip.
> 
> Fixes: 5197360f9e09 ("mtd: rawnand: mtk: Convert the driver to exec_op()")
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/mtk_nand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
> index 57f1f1708994..5c5c92132287 100644
> --- a/drivers/mtd/nand/raw/mtk_nand.c
> +++ b/drivers/mtd/nand/raw/mtk_nand.c
> @@ -488,8 +488,8 @@ static int mtk_nfc_exec_instr(struct nand_chip *chip,
>  		return 0;
>  	case NAND_OP_WAITRDY_INSTR:
>  		return readl_poll_timeout(nfc->regs + NFI_STA, status,
> -					  status & STA_BUSY, 20,
> -					  instr->ctx.waitrdy.timeout_ms);
> +					  !(status & STA_BUSY), 20,
> +					  instr->ctx.waitrdy.timeout_ms * 1000);
>  	default:
>  		break;
>  	}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
