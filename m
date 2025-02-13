Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84596C021A7
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Feb 2025 07:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZkWSVn2kIEsOnfst7MF+hgE4MQpPnvt50q//VPVXiFY=; b=wv9c2z468CQLGo
	iMHFBVUOpoG8jFJ2b/F0YaXlvoEJusDIkVumoRpzQQiLDEoMyvZd9JRU1mZCr+1KX0Kf85WrHxJeI
	wejmwAaAjcWwyMffxKByuCivmYzjZN/lVIgYDzB/vRS2J3HY5yU8WdAL231r23s+/X7fSENPFPapO
	GR0fzmQeuWlG035P4Xh3f3vHMi+HZSr9jC3hiom7ChCdwhKpIrVBri0LKf48okx3EbOrk/ORnQ9Ze
	uEBy41cnb1iLyd/YwdcfomTeYjHcPFkJr7RMq3k+3W6bHbkBjxI6W/DRXl0P9Z49uuCvQ/f3O/c07
	ymPMoSXoJ0a645kZ5JBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTPL-0000000A3PC-30r1;
	Thu, 13 Feb 2025 07:13:11 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTPJ-0000000A3Oj-2Fhk
	for linux-mtd@lists.infradead.org;
	Thu, 13 Feb 2025 07:13:10 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5de6e26d4e4so939488a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 12 Feb 2025 23:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739430788; x=1740035588; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WW/+2nrkRkDKggGJGdSSGbbs49npLS3rMdMLDLtNfQ=;
        b=ASJtegWEko3QIfajAhKIfF95+WOB79i+dfYiY54ppxy5/lnxeBILWbKu6800qfURo0
         0luyUPXJomOWpeXgAEpi1dXuF8bGy5/AkXVkUticS8xzG6dHUro5XDasyubYE5xuhBYa
         Uh7r9u7c9O/BsMaEIoYeBjfTdIV/yEv4lJAinqNzsS87KJjBy8pjCMeWVXYXUSPmcvZp
         1Cfb9/6U5qKCUfIzmqRxfwaL1eZU9AI8NuBAEl9zJ9eXAadLUOnQHZ8Okt5PhRfubY/H
         GPXkj0c08Zb/gyo/FGRTDpRgTiZn10jv01zj8TQNTIoB2gDIGabM4Be9xwFE2pPKy4xY
         7F6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739430788; x=1740035588;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3WW/+2nrkRkDKggGJGdSSGbbs49npLS3rMdMLDLtNfQ=;
        b=SASd+AAWemfY4wRgU2OgoN6/MOrzKQ/E30a9z2XBcHum/Kgk/XRe6t8XOQepLz0uan
         fOoHnZoWE0x/ofk2zHSOqz6mx+wfxg0323XuCLB0YdPifY16ZV1MztcmvT2cgQE6wtRT
         AoexDRQ1LPrq9d3CkCketrTKZC4LJ2FnjBomY3aXbpVr9Gj78YeP0IQGRQ89UCWSkb8K
         q+KepNDtBMqPHV/CS2g8rKjgEHKo5StAbDiA1uQDrThaddrIWSZl+/XQ3CyIszt7uAUJ
         eyRw4d16xrj9p5eTfBeE6odtvG90e4BjB9cxH6tkCV6S4KoubdA6tNkIdw+xLs+U+L6t
         JnBA==
X-Gm-Message-State: AOJu0YxtJHYnYIKaFAb2ESUCSzugg66J6z9fkj98QWqP3kIWDnCn2+l7
	kz+7sDzM4egWR4Iqov6T/rmaMEABqy0TxifqC6xxMRY+pUrZCezGdkLFXyv/j/2nSQC/Gt+wKf4
	3
X-Gm-Gg: ASbGncv8Lplmc+JNq1m1Clzc/jPbN/kzDdEnkDTc/WTgBwxY8Q6U2MqcF/MLTemWONt
	9usqeqbhj8WreB73siaSB8m1jIf2QgfWtd+uttN77kMvhGBh0hwr2R6XPEjve+Genh1/k/+b8Yc
	CVVR6aaPwP0WANTnhBuQsszjRlGbijSk08ktus0dGInqIqwMfbXLD4yHj8y0Z2O4OsSq37hpymc
	pdnJfGYdal/VTQGQuBEt2EjnN4AfAuo9JPu/Ba3E9zkppHjBryN0VzX6NGPqMhkIncJo7APswf6
	uoXUDal2cdVRRov0LbA2
X-Google-Smtp-Source: AGHT+IF2ZpB7VPEkaEDe3PPEygLeVbm5mwmYvAAPRK/9igttY28jM1YypDScZl9EfsJAnxF+jYDt6g==
X-Received: by 2002:a05:6402:34d2:b0:5d0:81af:4a43 with SMTP id 4fb4d7f45d1cf-5deadd04147mr6190990a12.0.1739430787874;
        Wed, 12 Feb 2025 23:13:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece1d3488sm659157a12.38.2025.02.12.23.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 23:13:07 -0800 (PST)
Date: Thu, 13 Feb 2025 10:13:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] mtd: rawnand: cadence: use dma_map_resource for sdma
 address
Message-ID: <e448a22c-bada-448d-9167-7af71305130d@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_231309_576289_89CF5F54 
X-CRM114-Status: UNSURE (   5.00  )
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

Commit d76d22b5096c ("mtd: rawnand: cadence: use dma_map_resource for
sdma address") from Feb 10, 2025, leads to the following Smatch
complaint:

    drivers/mtd/nand/raw/cadence-nand-controller.c:2982 cadence_nand_remove()
    warn: variable dereferenced before check 'cdns_ctrl->dmac' (see line 2975)

drivers/mtd/nand/raw/cadence-nand-controller.c
  2974		cadence_nand_chips_cleanup(cdns_ctrl);
  2975		dma_unmap_resource(cdns_ctrl->dmac->device->dev, cdns_ctrl->io.iova_dma,
                                   ^^^^^^^^^^^^^^^
The patch adds an unchecked dereference

  2976				   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
  2977		cadence_nand_irq_cleanup(cdns_ctrl->irq, cdns_ctrl);
  2978		kfree(cdns_ctrl->buf);
  2979		dma_free_coherent(cdns_ctrl->dev, sizeof(struct cadence_nand_cdma_desc),
  2980				  cdns_ctrl->cdma_desc, cdns_ctrl->dma_cdma_desc);
  2981	
  2982		if (cdns_ctrl->dmac)
                    ^^^^^^^^^^^^^^^
But the old code assumed ->dmac could be NULL

  2983			dma_release_channel(cdns_ctrl->dmac);
  2984	}

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
