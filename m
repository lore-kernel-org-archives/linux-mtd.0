Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E33C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jul 2022 14:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1RqQgtuGR5ECj3auSeIiC4mUSnNyT/f+RhUvsbg378=; b=SKYDnlbpa5TGAr
	31EW/CbQXa4Zneux+n6v5+X/dLoGftN6Zakyla/bUbHEUfoukW264FKwZ9dv0E6PAQpuh2L23RYa5
	j+G2FtrLk6HAmbC7eUaXhQ9aS7Tgbe9iEEbphEQS7UxpI6lT23pkn7Gmj1bDqY+bT+KUHbWHJ1515
	otaL8mqWubv+6MovJUdnG1NqSnTE3CZLxI8NpvA5uuBrIhtLFopsf6UPdWRAF9DCID8nAkg602hRF
	EFfclzwW2Uw/tMGOX4FSttXXPhnT+aystjedr2FzhWPi/qeA3sySJqcRVJQL+d/SZ8yxnc/ft699I
	GbI7SiUey5FQTyQ0nT5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFzCM-00BqKo-CG; Mon, 25 Jul 2022 14:36:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFzCJ-00BqGs-5Y
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2022 14:36:40 +0000
Received: by mail-ed1-x535.google.com with SMTP id p5so3234943edi.12
        for <linux-mtd@lists.infradead.org>; Mon, 25 Jul 2022 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:in-reply-to;
        bh=U7gqn49lbPzCkN6CZdJ2abq6lvU7NwtrbN8uNWbpmIU=;
        b=XrMcnLovevb3XC97bcOUe1xL0nkeO3YGmhipt0MsoCuSfrCHEbzADIY4Y25BTVwHYr
         bbNEtjM0oKP/myt+zxL4CguwqZYy4hLwmtq6AyYWfka4k8ktKYuAdWdVA5XolqHHZMIg
         0fFDHZ72LsSfew4D3tIrCciAgTTku0up6uwjHXODJFtfADp1CeyNhQM0jO08k8QKMmxR
         uO2MsyTx2+ZTTd6P8Daz1Xu/qWFfH7sV5FBp87fh4YFs1QCdGdqGcfUai9acqMlYsmnR
         7UFl2boI7kDTLCLlosjUr0xArQxZaZ8neb72cIMEtWA+oRQ683DNYN/WUM0jhKWHPIjJ
         0lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=U7gqn49lbPzCkN6CZdJ2abq6lvU7NwtrbN8uNWbpmIU=;
        b=7JtvkhaiyWH4VhdSxGEyYhnYeAXS6LDl5lMbHwmmV3YD0vh8ELwY0YWvfOf90fOShc
         YlZ+lFTgYqg8cwW1s9piLp5wBHBLyK72Wh2W/mTPxyUlyO0mxSNc2ZWXZT6frAsc0Mak
         zw9nwiYgTLsd59CqytcVyqh/QZtrprsFeipZrOWK/9jbpmF70FCQ+TV4tCMJxWBVqGS1
         Cvh/v7vaeRqo1GQLiQK8LQuUoo7+AzKJD3UC8PuAeL5Qk8resaibfZAaPAaa5ibYJnyT
         +H7BSz+WTeLYfjlFOMpglXIf0im4dN6an+gkawpLecKvamw43Pv6XRUPYHG5UVO08qR8
         gq0w==
X-Gm-Message-State: AJIora/PN0x2P4lldATPqzAfCIQKmQH/iQ1SzX8wWJv8Vg5lO21rst+4
	SH2vSAqjdrGA6aRcFvc6YlxtJk58XQvzkQ==
X-Google-Smtp-Source: AGRyM1tVwmBfMJF2JI2gs4vzNAZeg+HePA4MdjkbBwSVKQtekiio1PH1suSsHY4+eJCJN6v3Q9Wa9A==
X-Received: by 2002:aa7:cac7:0:b0:43a:c5ba:24a6 with SMTP id l7-20020aa7cac7000000b0043ac5ba24a6mr13585876edt.84.1658759796251;
        Mon, 25 Jul 2022 07:36:36 -0700 (PDT)
Received: from Ansuel-xps. ([5.170.48.78])
        by smtp.gmail.com with ESMTPSA id ti4-20020a170907c20400b0072faba59dd1sm4011158ejc.165.2022.07.25.07.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 07:36:35 -0700 (PDT)
Message-ID: <62deaa73.1c69fb81.3bc99.8aef@mx.google.com>
X-Google-Original-Message-ID: <Yt6qc+Fk7Tg3DbdW@Ansuel-xps.>
Date: Mon, 25 Jul 2022 16:36:35 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: core: check partition before dereference
References: <a262d332-662d-57b9-b746-8d3779f4e878@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a262d332-662d-57b9-b746-8d3779f4e878@I-love.SAKURA.ne.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_073639_231613_A57C48D1 
X-CRM114-Status: GOOD (  16.58  )
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

On Mon, Jul 25, 2022 at 10:49:25PM +0900, Tetsuo Handa wrote:
> syzbot is reporting NULL pointer dereference at mtd_check_of_node() [1],
> for mtdram test device (CONFIG_MTD_MTDRAM) is not partition.
> 
> Link: https://syzkaller.appspot.com/bug?extid=fe013f55a2814a9e8cfd [1]
> Reported-by: syzbot <syzbot+fe013f55a2814a9e8cfd@syzkaller.appspotmail.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Fixes: ad9b10d1eaada169 ("mtd: core: introduce of support for dynamic partitions")
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
>  drivers/mtd/mtdcore.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 6fafea80fd98..a9b8be9f40dc 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -559,6 +559,8 @@ static void mtd_check_of_node(struct mtd_info *mtd)
>  		return;
>  
>  	/* Check if a partitions node exist */
> +	if (!mtd_is_partition(mtd))
> +		return;
>  	parent = mtd->parent;
>  	parent_dn = dev_of_node(&parent->dev);
>  	if (!parent_dn)
> --

Thanks for sorting this out. LGTM.

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
