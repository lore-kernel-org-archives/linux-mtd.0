Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A39CCCF9EB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Oct 2025 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=msvFVq6pdGN2oNkFnbdabjgx0cKKyzokHMKfNIECvpk=; b=lJqztMKSl+SqEi
	tbUM3eHi+BGrHVoeokA4u5S6wZKKeR3sXk3m4EjZonlbeKo962POp9NZM9r7/MrnIXD/dV4cTV9BG
	xTPlMt6pdquGQNuIiu0CEsuC6rRapF/VvkDwuU6cipbyfn1EELi/K1hA+elntFepGvtGjHnWIGYPO
	wnDf+taeEQam/Ht4xYaAQjVbaOtWvsXRanACUL47RNou5aBq4NdNlStD7m7gMeNdt90loH5FtxuMK
	1EXPkgxhhOZwuDL3QqZr5KmIkVIz3/HL7Eie/R25MN1NSpj1dXfhCiilFPRqPRL+MQPuwyWrW2/9u
	8/1s77j1vypOYNso0QBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGqU-0000000DChq-3EkU;
	Mon, 27 Oct 2025 06:36:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGqS-0000000DCgt-2l19
	for linux-mtd@lists.infradead.org;
	Mon, 27 Oct 2025 06:36:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so41886745e9.1
        for <linux-mtd@lists.infradead.org>; Sun, 26 Oct 2025 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761547002; x=1762151802; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y5gq4c/qVPoxWi1VjLhaX4yLFLortyaUkJMQ10tAw5Y=;
        b=JMQcUQ1DjdtCUG4aa6lTWDvo2zdVU/wRpRutyMWHi0ZZ2zEOFTXS+fKw/SWudIdU5d
         qLJfJhEztnzDoc4FTOldxPpqKWEjAL5XjqzEyZTraOcylMzSlAhwTLmRuT3I2x2YK44G
         2OFvooQMvpUtBmAET0/ZqQgGebuaKzp/W2jxjg4lVw+kCi37HpnDUWLBzYRse/t08Drr
         BRP4oCKtRnT4/5gL4IUyKM2tNm6nFIMr6uj/xr4fwU6z91mGlZeKZe7mYU4RuJ7aJ+/T
         Nmpj1hiwyXoNZq2UqQxN5j3HuH45ADkrZE2kLdITcL6YZds0faU4JM2qmhRIPxTDalOV
         Xagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761547002; x=1762151802;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5gq4c/qVPoxWi1VjLhaX4yLFLortyaUkJMQ10tAw5Y=;
        b=gkoeBcIg9LWfdzdZqQRh6aw5WCQj4RHSNVoYJsJRshQIYmKwPnH3+BpR6JGvQZDAcp
         tpuXtzDthNYXa6g57qz0CECQv5Tj8Sgwn/kHu7Ih6SrSaOYNP2K8mg0bw5x8xBhXGyoQ
         NMBmt73MuBa0lVlFunoD2cKBuY2kV2n483M3xZffyAPTmnWSXmewzUxXB+rdqeimXf4Y
         SxKbCQ1AKKh6KWbk8NqGql+rZmxRHEWLEm1ao2siU7vIV+OHUwiBU88pWGw2JZbuPs4g
         My92nX8KxMpL8R5uwfSvX/3s4VrBWdQmS+DlMVHabvLLtUiQKo65uOFlNz2uSLi3HMKi
         6JOg==
X-Gm-Message-State: AOJu0YyM2KApuslnapo8nNhXESJ+HST0rhVZLwnm4BYQ4x6ebQU4sToB
	hF3l2pzf7C6yxfgO2XsDKWgDsQulLWaJvtQdlmZzj77JYmhf2L9VVcMV9CXyx2PbYCk=
X-Gm-Gg: ASbGncv7B9W0umdasnRhS75U4sRBMoilH1Y5v+vgUxVfBNyEPBlrK+2Zxj3c19yQmAg
	wTo7TxKL2lKSvRewt6eUU85ccGyhyQTl5EEaeo2soqr2nJvZkJyszXRAXKCipcD65FC3PKeCCd6
	Xw8islJBprtAFtGtTXkAkCPgKPthRseuwx35/Y72V9W4BQqm2N66els0ynwGmPtvs5DW0n+ql63
	KVRbP9mPpyTTlRzc8D3H4bfnxntOnpMH0B9/pIZTWEz++1eZFppBCTp033h0ZxGuYevVUpV+jC5
	crZX8Vkw5RzTZ2ISgYOKMy4emepFqlV+wgyjHKcWFXkcYxKdO6EgIvCjgpt7LQWNcxgSMNoxhHl
	inkzhwQp04EbSDKmZHkzwaOxhwRN/m3sONFULxxmVJQo6ZUbO4CtjBplsWYxJKIL3FZXUzTOBo2
	mm+37qBf97DfO7QQ0S
X-Google-Smtp-Source: AGHT+IGZYQs5F1Fop40THWyES0QKFRw33RtakXs+XdE227SJC521u8/LuvRbpyREYsRWcJjqtQsXLA==
X-Received: by 2002:a05:6000:98a:b0:427:7f0:95f0 with SMTP id ffacd0b85a97d-42707f09601mr23045220f8f.37.1761547002264;
        Sun, 26 Oct 2025 23:36:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952db964sm12398915f8f.33.2025.10.26.23.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 23:36:41 -0700 (PDT)
Date: Mon, 27 Oct 2025 09:36:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] mtd: rawnand: cadence: fix DMA device NULL pointer
 dereference
Message-ID: <aP8S9oEgMv6PXzax@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_233644_734895_CC120F55 
X-CRM114-Status: UNSURE (   5.72  )
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

Hello Niravkumar L Rabara,

This is a semi-automatic email about new static checker warnings.

Commit 5c56bf214af8 ("mtd: rawnand: cadence: fix DMA device NULL
pointer dereference") from Oct 23, 2025, leads to the following
Smatch complaint:

    drivers/mtd/nand/raw/cadence-nand-controller.c:2956 cadence_nand_init()
    warn: variable dereferenced before check 'cdns_ctrl->dmac' (see line 2918)

drivers/mtd/nand/raw/cadence-nand-controller.c
  2909          if (cdns_ctrl->caps1->has_dma) {
  2910                  cdns_ctrl->dmac = dma_request_chan_by_mask(&mask);
                        ^^^^^^^^^^^^^^^
This is only set sometimes


  2911                  if (IS_ERR(cdns_ctrl->dmac)) {
  2912                          ret = dev_err_probe(cdns_ctrl->dev, PTR_ERR(cdns_ctrl->dmac),
  2913                                              "%d: Failed to get a DMA channel\n", ret);
  2914                          goto disable_irq;
  2915                  }
  2916          }
  2917  
  2918          dma_dev = cdns_ctrl->dmac->device;
                          ^^^^^^^^^^^^^^^^^
Potential NULL dereference

  2919          cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
  2920                                                    cdns_ctrl->io.size,
  2921                                                    DMA_BIDIRECTIONAL, 0);
  2922  
  2923          ret = dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
  2924          if (ret) {
  2925                  dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
  2926                  goto dma_release_chnl;
  2927          }
  2928  
  2929          nand_controller_init(&cdns_ctrl->controller);
  2930          INIT_LIST_HEAD(&cdns_ctrl->chips);
  2931  
  2932          cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
  2933          cdns_ctrl->curr_corr_str_idx = 0xFF;
  2934  
  2935          ret = cadence_nand_chips_init(cdns_ctrl);
  2936          if (ret) {
  2937                  dev_err(cdns_ctrl->dev, "Failed to register MTD: %d\n",
  2938                          ret);
  2939                  goto unmap_dma_resource;
  2940          }
  2941  
  2942          kfree(cdns_ctrl->buf);
  2943          cdns_ctrl->buf = kzalloc(cdns_ctrl->buf_size, GFP_KERNEL);
  2944          if (!cdns_ctrl->buf) {
  2945                  ret = -ENOMEM;
  2946                  goto unmap_dma_resource;
  2947          }
  2948  
  2949          return 0;
  2950  
  2951  unmap_dma_resource:
  2952          dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
  2953                             cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
  2954  
  2955  dma_release_chnl:
  2956          if (cdns_ctrl->dmac)
                    ^^^^^^^^^^^^^^^
Checked here, after dereference.

  2957                  dma_release_channel(cdns_ctrl->dmac);
  2958  


regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
