Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41079C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 08:42:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C849760232
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 08:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C849760232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+TsPT0ezFTxdrkOEkqWcPyjXTV7KOn8v6yMazkk4Qc=; b=FZSvasOxJ0cn/E
	fKYQ9mmVgeShEOM212x09pT5BsQTDl9jEGeF45haG/qer1K+cIga4222FBmbfrakVxrSKwiBQPCEF
	SinixOGdvJ9FLgSm1sMPZoJomgNGK2BwkGt1/6n8ijMHCFXDLNPfD41WNMkMXmSKrAV6exWy86/ug
	tQreq9sRpCswfbDkYHAantM6MfEQMUMUgaefNKvv4YSo6Fd5Dqs3IsVQf9YvurDTiNITTTqtGA4Xn
	9GXwF2SdSQ1nVJzcm0DM9o7Nzkic9jXr8aC0MF6f1iKHYdvTDUf3hF0m6Amml0korQ0zMt+UJOudg
	ZA8I1HMCsyy4oukznmmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdq7h-00ADXa-Bh; Fri, 22 Oct 2021 08:41:57 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdq7e-00ADWW-BO
 for linux-mtd@lists.infradead.org; Fri, 22 Oct 2021 08:41:56 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1806A2197A;
 Fri, 22 Oct 2021 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634892113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lMKMYiSqPLZx6mI9tbSjyNPXZXonSrHh0yVcGp6Iofg=;
 b=ppn42qI+9E3KRRP5VuBY0b/5USQBOI2yhUHuDmaqX99K+roxPXisRc8RDxbVIkRrK1Mv6P
 FfiSP89Bnuwsg4ZNZINx1K4w/mDdLK8zb9QC94MDUrZw8yO3Rz83vRN05Twn3sJwSBbRME
 5xYbTAMjjh3k5YjeK53IgCqVTGdPh9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634892113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lMKMYiSqPLZx6mI9tbSjyNPXZXonSrHh0yVcGp6Iofg=;
 b=CeYX9S2+WW/qKiYbiSPqvJbsBYFuwF2O7DstixlFJEMmNGh/w0XvM1WbhwHDWbOH596Ael
 nPyNkicL7TSVRJAg==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id CD43EA3B81;
 Fri, 22 Oct 2021 08:41:52 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 8EF511E11B6; Fri, 22 Oct 2021 10:41:49 +0200 (CEST)
Date: Fri, 22 Oct 2021 10:41:49 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jan Kara <jack@suse.cz>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 1/5] mm: export bdi_unregister
Message-ID: <20211022084149.GB1026@quack2.suse.cz>
References: <20211021124441.668816-1-hch@lst.de>
 <20211021124441.668816-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021124441.668816-2-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_014154_567799_CDEE40F8 
X-CRM114-Status: GOOD (  16.77  )
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

On Thu 21-10-21 14:44:37, Christoph Hellwig wrote:
> To wind down the magic auto-unregister semantics we'll need to push this
> into modular code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  mm/backing-dev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> index 4a9d4e27d0d9b..8a46a0a4b72fa 100644
> --- a/mm/backing-dev.c
> +++ b/mm/backing-dev.c
> @@ -958,6 +958,7 @@ void bdi_unregister(struct backing_dev_info *bdi)
>  		bdi->owner = NULL;
>  	}
>  }
> +EXPORT_SYMBOL(bdi_unregister);
>  
>  static void release_bdi(struct kref *ref)
>  {
> -- 
> 2.30.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
