Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAECC6FA8B
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Sep 2022 10:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6kOFywR8ZIUkkOFvG0uYxcgM1qyUzl006Ae5bgZtCE=; b=Nxt7QvgvEFhrkn
	E/WMltGlG2Uff/7G0CMinwyl/vDK3j4Rv7Kc56st2n7okHZBOz3Bwl4iYDwdzkdFdhouMxHkPNSqu
	CjMTlRa+SqiRDRwon+6uF6Jyw6a0WbY76CbVUMdImCIHV84/Qq4QryLQLMZuD/vsf5Fxa7Rc9bcbg
	2xQIHPwh39kQZPh6IaM8Rcg9UK7MMOCoPSnttQ47YrPjGUQbtZTIRPlIPlhh75mhwRVo2a2y2cD3G
	wR9rn8v82qijONCWwDTRKQ/aKjgClt1C4G1ozj/VkbEPhqgkpmn1A38Jv6Yhh7jSX044V/7roIQlp
	5fFZmXT106ZaUHT21EtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ8zT-00COtM-TF; Fri, 16 Sep 2022 10:54:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ8zI-00COlc-Vr
	for linux-mtd@lists.infradead.org; Fri, 16 Sep 2022 10:54:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id n8so8315030wmr.5
        for <linux-mtd@lists.infradead.org>; Fri, 16 Sep 2022 03:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date;
        bh=as5qbV1zgeHsUS0PT6BJlWeyoNQRvlWywcs7yIo6KkE=;
        b=IjAoTYpUj4L7seU/elTdtGkV+58urlsKmEb28xUwlAFOGP+QYdURtsS2r1nMwu6TKh
         LIAxp+nV6UxWcM7vsnFFx1LAUoi4AmHZ+sUhzkKUG74jnklrvIjdtiBQ0q+pb/x2Dpdo
         +5F0J17P+84g6XF+r34NK4xEm5l14BGWJcuK65Qdqd7n9fS/GpbEPWqYeBaAUQcuIcx6
         Zh2tgHJ3HmWGb2ru3nCMQ06GJMgJYhEZ1d3I2/B3eMTNSoQyq913W2zxt5czXwrCOFqy
         mfF8qA1RFE0+EPx3prR5axg4gpeMSRzGIVCaAjHorFvwaFBUFy9VybBlaDXhicwuMANk
         BFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=as5qbV1zgeHsUS0PT6BJlWeyoNQRvlWywcs7yIo6KkE=;
        b=J9M1aW+T0PN6rJSYsUPW0YugDYbn3p14mZiyuuk0eui9GzQmW2dqh8o2XB+j/QpObs
         GkTd1hwdHe+hmL7jCOQPB0jMwlccyGEUT22o9hMCwEZf1HPK8klZY30zhPFiZx5eAlwd
         WaMfQq8pvhweLIlfTCfNRLMMM27FguOfvkvAPWDFM+pz+59Oo02AOidXfW94U/5E9Mf7
         tv0nAAV4lA2TmpF7SqmHujgOZHdlRbZBbrrhdowVoTyVFMUJUP+nJwZy15h/d6pJnC2Q
         QOzbKJ/IwoPaHir/zBFVA0S1Bu5JHleUe3c3HgxKs1n1k9Qc10l6BRS3P8UUrkJ99Emr
         6HMg==
X-Gm-Message-State: ACrzQf1tl98t8zHp5jE/zqfNUukW97VE6wyLkoahyVYw6PBcdsVlxWNx
	fVIn9PdbC9iqRjZ/nnTPVsY=
X-Google-Smtp-Source: AMsMyM4/vz3bTIqD782eceBcv3WxXpbx7kU8s77sCUA728nVphdNUakbhnIE7OfoHmX/BrbAa1yZSg==
X-Received: by 2002:a1c:f709:0:b0:3a6:3452:fcbe with SMTP id v9-20020a1cf709000000b003a63452fcbemr2958300wmh.164.1663325660161;
        Fri, 16 Sep 2022 03:54:20 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-134.ip85.fastwebnet.it. [93.42.70.134])
        by smtp.gmail.com with ESMTPSA id d4-20020adffd84000000b00228daaa84aesm4646533wrr.25.2022.09.16.03.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 03:54:19 -0700 (PDT)
Message-ID: <632455db.df0a0220.9684.aafc@mx.google.com>
X-Google-Original-Message-ID: <YyPpZS9Cdteeiv4o@Ansuel-xps.>
Date: Fri, 16 Sep 2022 05:11:33 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: handle error pointer from
 adm prep_slave_sg
References: <20220916001038.11147-1-ansuelsmth@gmail.com>
 <4dcb0e76-b965-42da-b637-751d2f8e1c51@www.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4dcb0e76-b965-42da-b637-751d2f8e1c51@www.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_035425_104692_229D4FB3 
X-CRM114-Status: GOOD (  25.67  )
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

On Fri, Sep 16, 2022 at 11:01:11AM +0200, Arnd Bergmann wrote:
> On Fri, Sep 16, 2022, at 2:10 AM, Christian Marangi wrote:
> > ADM dma engine has changed to also provide error pointer instaed of
> > plain NULL pointer on invalid configuration of prep_slave_sg function.
> > Currently this is not handled and an error pointer is detected as a
> > valid dma_desc. This cause kernel panic as the driver doesn't fail
> > with an invalid dma engine configuration.
> >
> > Correctly handle this case by checking if dma_desc is NULL or IS_ERR.
> 
> Using IS_ERR_OR_NULL() is almost never a correct solution. I think
> in this case the problem is the adm_prep_slave_sg() function
> that returns an invalid error code.
>

Yes I was honestly not certain on what to fix... The adm driver or the
nand driver. Dediced to fix the nand driver since it was the one that
was causing the panic and to me it seemd bad to remove error code from
the adm driver. (But we have debug log anyway so...)

> While error pointers are often better than NULL pointers for
> passing information to the caller, a driver can't just change
> the calling conventions on its own. If we want to change
> the dmaengine_prep_slave_sg() API, I would suggest coming
> up with a new name for a replacement interface that uses
> error pointers instead of NULL first, and then changing
> all callers to the new interface.
> 
>        Arnd

I also notice this that dmaengine_prep_slave_sg always return NULL in
case of error so you are right and the real problem here is the changed
calling concention. Seems overkill to introduce a new API just for a
commit that changed the naming convention...

So I think we should just ignore this and I will send a better fix that
will just return NULL and fix the adm driver. 

Thanks for the review and the clarification!
(Also extra point the fixes tag will match the driver)

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
