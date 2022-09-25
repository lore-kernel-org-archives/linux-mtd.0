Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2403C04A95
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Sep 2022 19:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOLpfXBlMnX1ouvPcqUtPOuVCCWJ9cKwfxEok6Cz8fI=; b=wQlIIKAcZKvYrs
	63YMI8jB041xHISagUCeepUc0L9qNb18AaJom/r+SbvJLEtSTaFbm7dqE/R44RfyTsmYWOPe9fEUL
	MtPSy3tVvcGz2pmtbeZ4BqUQVLGME+qDcS6QRvC2QfmYu2yG47rPCKFNiVnbaGJd7V8bOkaiebHSj
	/30nYc8OI6p2AdD7ku6Dlif4VUphTedgJWvmkGP6CXN15Kp03HyvLLoGVXPk0ydNPIHCRZD4c/OMv
	yK+Zwhiy/y0ctTYCALTByPmCCXGrrtdxaEWFH/wHWaWmcSVMS8Q8bmRvJamIJuHaPf/Q0nE7Ysnl9
	jSuipXhVzJEtup1HlVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocXTJ-00G8sr-0T; Sun, 25 Sep 2022 19:39:25 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocXTA-00G8qU-W3
	for linux-mtd@lists.infradead.org; Sun, 25 Sep 2022 19:39:18 +0000
Received: by mail-ed1-x52d.google.com with SMTP id c30so5321290edn.2
        for <linux-mtd@lists.infradead.org>; Sun, 25 Sep 2022 12:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=urGmlBsPmJMkCtuizd02VBWgeT26lvTH0VQ2A0xyrP4=;
        b=S6Plts9P3P8Lu6te3g2qCOZi1/iV9qO9WzOULskoN9uaUqx6qmum9A0AIVk0uwXH5E
         k72IaE6LPHhe0yVoy/X6ERKF+1t8Qu1EuanJ9YnopMWK3/5OAiYW32ArSsAtOjaE7t9+
         xJpJnnTohfViyebiyFvGdCVQL7Arp3RFgYvC4RyOLWXXbFMAhbDe8cMykE01VSj8mFmK
         hBJwL9iLrz/gVdqg23qkqLjnzz+yWLi79pkQSCdi8jFc5YnmN5H6gOlamGEJ14J5dAIN
         B41cU5hz9pm/6EipSremamhKGP7FrkVUZYWlew3Y40Xdct9oMBujykv7xcG0gju96/No
         Fejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=urGmlBsPmJMkCtuizd02VBWgeT26lvTH0VQ2A0xyrP4=;
        b=sfOhD+jV023GzVmvvyb8GjmHP3OzWKBxSVX67oyo1zwlEduzE8tgY33JjWChkH7HQo
         v5toUoOp3rE6s7Z5UmLX1ACe+/hVzh+/3zyNrgFavDGPeQ4yBDQFfFaC6Y71o+jIKlRV
         S+ZMmjFxaDv82LzRVU81vjSTRMDIklai4whvZloSYlC0BG3GBvDN9Y+P5qwue+/MgOFw
         /zflDXw6ImZJfDMQUIRwSrUzN3UWiWeh58lHijj+OfqG7nE3Xs5RMCCCj1SXBmUiVASw
         BjJrISp19RTX7ea5XBYltEte62Gviio+HMBoMjO4reiC66N6SEPgT95FS13UKDLnbQGl
         eJ5A==
X-Gm-Message-State: ACrzQf1iC0ymtiuyqiBIQKakT0Vim+fs7nFlYasU1ig2kyhZa5isLb0S
	r5rK0Bsir14R/ahD46jnvOODHtiKYLfu5bb7qVo=
X-Google-Smtp-Source: AMsMyM4w2J0yEDfT3kqsHVrcn1iCqiYNfkphA8bek0KbQaAPDidVJEAgGp6ZE97Gre1MG/Um8WzdEZwIJl0D1vyvgqw=
X-Received: by 2002:a05:6402:90e:b0:443:ec4b:2b03 with SMTP id
 g14-20020a056402090e00b00443ec4b2b03mr18760480edz.71.1664134754248; Sun, 25
 Sep 2022 12:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220924131010.957117-1-yangyingliang@huawei.com>
In-Reply-To: <20220924131010.957117-1-yangyingliang@huawei.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 25 Sep 2022 21:39:03 +0200
Message-ID: <CAFBinCCFSrYv-JZrda27Ein=YrEik=yvOjHtiz-=aR0q-+FFFA@mail.gmail.com>
Subject: Re: [PATCH -next] mtd: rawnand: intel: Add missing of_node_put() in ebu_nand_probe()
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_123917_093493_51A46275 
X-CRM114-Status: GOOD (  12.93  )
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

Hello,

On Sat, Sep 24, 2022 at 3:03 PM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> The 'chip_np' returned by of_get_next_child() with refcount decremented,
> of_node_put() need be called in error path to decrease the refcount.
Thanks a lot for bringing this up!

[...]
> @@ -695,6 +700,8 @@ static int ebu_nand_probe(struct platform_device *pdev)
>         ebu_dma_cleanup(ebu_host);
>  err_disable_unprepare_clk:
>         clk_disable_unprepare(ebu_host->clk);
> +err_of_node_put:
> +       of_node_put(chip_np);
Here I have one question:
My understanding is that with this patch we now use
of_node_put(chip_np); in case any error occurs during probe.
But what about the case where there's no error and someone later
unloads the driver (using rmmod)? Or in other words: do we need
another of_node_put() call in ebu_nand_remove()?


Best regards,
Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
