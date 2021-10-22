Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DCAC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 08:44:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C705610A4
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 08:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C705610A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7jBEssuVRF3tWokk5QDRlJ8nWISTzyCa6NkT7OJ/JA=; b=ggsSJodC1anPHO
	w76iywjOh2mIl2Y8ZWFPWdXXNTPuzfcBBfOjPYwF2PqtBIkhJhJu3T7kKPiYobZLPuoTZlBEI9vEs
	bD8suzu+6gG1WDZkjRzoYBxHPVVv9VjFbmI4szvV3t2tmN7ZoC24ussXA5mKfOO7FUPEmHOnqvbpb
	/oXKK3IN8LkKO5J/kL5kmrMvZSBcA/zoJsRnqoCqSAtiZPhZ3cX/JqeV/Tpj/0UF0xFdtR0zjeuXj
	wrs7/YgPXtmXHbxlVCZ0OAiZPkRODdC0mhgLhmI915a7RcFKWm0gFTXDhL4XoJBnf0Te3dyErGo3R
	iS8qt8ozXF8COjZNk6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdq9G-00ADil-AP; Fri, 22 Oct 2021 08:43:34 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdq9C-00ADhP-Ep
 for linux-mtd@lists.infradead.org; Fri, 22 Oct 2021 08:43:31 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 36A742199D;
 Fri, 22 Oct 2021 08:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634892209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MPkk1brJOSm3Yjvf8eNKc5Xgdk5rE0s6Q0mFNwK3L0=;
 b=ZMgBrFjusXhaQPvK4lMGfW8pXzkvKAK+UxUiULhKMhxkYb1mTnk8Zdhzg1GwrOyWIxHWkc
 kdzWCb2bwehDGt+xBCWTiTp1Z9JGCXx54IVfYNFRC8zcgnQsdXrl0eKT+yqI5o61q0bhxm
 wUn3zesrnmC1osXdKtqdsHWOaulzil0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634892209;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MPkk1brJOSm3Yjvf8eNKc5Xgdk5rE0s6Q0mFNwK3L0=;
 b=TPdYz8+hWK/Ce1UG2jCycUaJtBnbYQH4tCu3Vq3bhGRhGxbe9zhN1RiuqAVr+EUmo9Rxpz
 5D5RHngYDLqEVaBA==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id 2849BA3B83;
 Fri, 22 Oct 2021 08:43:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id B2C731E11B6; Fri, 22 Oct 2021 10:43:25 +0200 (CEST)
Date: Fri, 22 Oct 2021 10:43:25 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jan Kara <jack@suse.cz>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 2/5] mtd: call bdi_unregister explicitly
Message-ID: <20211022084325.GC1026@quack2.suse.cz>
References: <20211021124441.668816-1-hch@lst.de>
 <20211021124441.668816-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021124441.668816-3-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_014330_669345_A6CA13E7 
X-CRM114-Status: GOOD (  15.49  )
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

On Thu 21-10-21 14:44:38, Christoph Hellwig wrote:
> Call bdi_unregister explicitly instead of relying on the automatic
> unregistration.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/mtd/mtdcore.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index c8fd7f758938b..c904e23c82379 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -2409,6 +2409,7 @@ static void __exit cleanup_mtd(void)
>  	if (proc_mtd)
>  		remove_proc_entry("mtd", NULL);
>  	class_unregister(&mtd_class);
> +	bdi_unregister(mtd_bdi);
>  	bdi_put(mtd_bdi);
>  	idr_destroy(&mtd_idr);
>  }
> -- 
> 2.30.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
