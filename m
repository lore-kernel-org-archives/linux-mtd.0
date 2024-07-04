Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC9EC30653
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jul 2024 15:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T9CtlrtfxMb6X6RnYtsYsAl5PMw+sfjlvzQqdQnfclY=; b=y2BWkrWALyh+CL
	DCUpEL2rqs3CjHIA1KBg3UIxAuc8AZQj1Q82iP0zWzP14cAlYWWM5uJb/VkWFbLesvMQ8i4ZhF+zP
	NCa+HazDZCdEOQzt6aQ4U2uvzbUS4cJsr+6W5vn5upX/dsPcNmaw1RcDodZVGPw2yqaWxlTj57nmY
	eC4KwG9D5PUSObT0uUjT/L5v8pz+mC1dyNu8mmmlcoZgPd+usJW85S6sp5DPCgqOok4bpxPSHe8+N
	i522o/VbUrvk8kZx2Ugp4iU/nmDWVgzehLuXql2PidBi87D9OrMg913F/F09Gpf6wXejrMxurftQn
	KtttYHU/2MgXG96DWjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPOH6-0000000DgFE-37xn;
	Thu, 04 Jul 2024 15:21:32 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPOH4-0000000DgE7-0Ve9
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jul 2024 15:21:31 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3c9cc681ee7so279997b6e.1
        for <linux-mtd@lists.infradead.org>; Thu, 04 Jul 2024 08:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720106488; x=1720711288; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WaX8CCBrV7Ns4d1cmuX50bUgmfYZE40zweco6bwoQdg=;
        b=GNxiLlh7Ui0mNsjtUoJpoQJ6JiVfQ8wkiJPsct32klTyMJBE0wGqcGp7/IVN5LAMve
         WMmZsgTYV4rKltS8R/ub5dyuF73iYZ3wifb3NBYH/tKpdE+BUU+o3jkf2bX1oBHpRX1A
         X9osPcxxTqLUJK7mIift5Zd6v4cPR64JO7gzUE7/2rdx7XnDQsfnq2qqLI2y1EApmqgl
         7dNsiiQMcTT3KugJRwms/da9zG/s8bDFNnJehf+Ws3x1KaQypRLBxFtOZX9XjIw3yugV
         F0bTmSTWQ0R9kIK8bJaOhQTaNxZKT1/FQh96vi3CvfiQxUz+t3zC3ewVXRWiypavhSiv
         VEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106488; x=1720711288;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WaX8CCBrV7Ns4d1cmuX50bUgmfYZE40zweco6bwoQdg=;
        b=FRRDvSw1SjBN7BJs2khkE8KkECXc7Qr8aAPG4oowLAo/3WcLo+wsjSJFD9E+laYdaa
         T1n1YS3gx0iajAZ4ilLv842t4C94ECU0FgqgG+DLIwgqQLo2yQdl5+jtt2AUDDfp7Tdx
         dSm7WqoNN9+NAAjLwH12hfHH3DXnoo65Q2aWzqIANigV8/KZvIiYZOkik0TE0et8HNGr
         Y7S0eClsGymwB5kFvIAhoKVpfGQirDPRQeQIWZkOgQOjOS5rbKea0cdO5Z9p7Hda6Lou
         1uGR17dp3nN0q53q9PZsIB/2joRseBdG2uYxti2yM5z9Lvyvy7LM/EUGsMNi1xcFH1AP
         mx3Q==
X-Gm-Message-State: AOJu0Yx7pwIl3DPbM39cBzKLNn/1HDtuwzvqFeqstA5y6eP/nYaIysA3
	FL5idbB4O10pYhn9cfKfj+b5YcY2/mQuRU4Lm6HGripaFqDxh2XwgcTtN1j1H9w=
X-Google-Smtp-Source: AGHT+IHPMix6qcM+Nva0ZxsZ3hvJv95sc3hL3WE1yiFjOboD/FAcPZ3nhf3pNFPiOcE259rj4nTxtg==
X-Received: by 2002:a05:6808:30a2:b0:3d2:edf3:6fd7 with SMTP id 5614622812f47-3d915d549e4mr644866b6e.22.1720106488099;
        Thu, 04 Jul 2024 08:21:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:96a0:e6e9:112e:f4c])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c414939fdcsm1785257eaf.25.2024.07.04.08.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:21:27 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:21:25 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] mtd: rawnand: lpx32xx: Request DMA channels using DT
 entries
Message-ID: <da026465-a28b-44f6-8b79-cfacdd274874@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_082130_188463_9E9612BE 
X-CRM114-Status: UNSURE (   8.02  )
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

Hello Piotr Wojtaszczyk,

Commit 7326d3fb1ee3 ("mtd: rawnand: lpx32xx: Request DMA channels
using DT entries") from Jun 27, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/mtd/nand/raw/lpc32xx_mlc.c:609 lpc32xx_dma_setup()
	error: 'host->dma_chan' dereferencing possible ERR_PTR()

drivers/mtd/nand/raw/lpc32xx_mlc.c
    572 static int lpc32xx_dma_setup(struct lpc32xx_nand_host *host)
    573 {
    574         struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
    575         dma_cap_mask_t mask;
    576 
    577         host->dma_chan = dma_request_chan(mtd->dev.parent, "rx-tx");
                                 ^^^^^^^^^^^^^^^^

    578         if (!host->dma_chan) {

Why do we have two functions called dma_request_chan/channel()???  Confusing.
Anyway, the _chan() function returns error pointers and the _channel() function
returns NULL.  So this check is wrong.

    579                 /* fallback to request using platform data */
    580                 if (!host->pdata || !host->pdata->dma_filter) {
    581                         dev_err(mtd->dev.parent, "no DMA platform data\n");
    582                         return -ENOENT;
    583                 }
    584 
    585                 dma_cap_zero(mask);
    586                 dma_cap_set(DMA_SLAVE, mask);
    587                 host->dma_chan = dma_request_channel(mask, host->pdata->dma_filter, "nand-mlc");
                                         ^^^^^^^^^^^^^^^^^^^

    588 
    589                 if (!host->dma_chan) {
    590                         dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
    591                         return -EBUSY;
    592                 }
    593         }
    594 
    595         /*
    596          * Set direction to a sensible value even if the dmaengine driver
    597          * should ignore it. With the default (DMA_MEM_TO_MEM), the amba-pl08x
    598          * driver criticizes it as "alien transfer direction".
    599          */
    600         host->dma_slave_config.direction = DMA_DEV_TO_MEM;
    601         host->dma_slave_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
    602         host->dma_slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
    603         host->dma_slave_config.src_maxburst = 128;
    604         host->dma_slave_config.dst_maxburst = 128;
    605         /* DMA controller does flow control: */
    606         host->dma_slave_config.device_fc = false;
    607         host->dma_slave_config.src_addr = MLC_BUFF(host->io_base_phy);
    608         host->dma_slave_config.dst_addr = MLC_BUFF(host->io_base_phy);
--> 609         if (dmaengine_slave_config(host->dma_chan, &host->dma_slave_config)) {
    610                 dev_err(mtd->dev.parent, "Failed to setup DMA slave\n");
    611                 goto out1;
    612         }
    613 
    614         return 0;
    615 out1:
    616         dma_release_channel(host->dma_chan);
    617         return -ENXIO;
    618 }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
