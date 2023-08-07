Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE45CC001DB
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLXoODDsGfmrZOUL/lIDcUqg0JI3+EpfzOvK1f1Ey6Y=; b=vrOoGCeq1+cKc1
	jVidODrLIuiey8R2zMfYl22N3QPWbR29mKW9RLHXiCznir9OxMEDPqHIxiMmSHnGfUOMmcD95XHR5
	pEL/xUdngS1B9KGcmUhozhYQy2voGisUWSW/tNl7PxqL/TuX9XVJ+j9QYKjK/PpjX/rGqwaizK+pD
	Y5dTjfZXBpqkFGXID4/R7MZ6Paz7wgnMalQCFPiqoewqmV14SKOaazUdlGMf2Wx7ZSuZ6uzMr4aNg
	w0SFX/eJC4p8ZO00EKNShZtNgDY89u1/oixiWVkTjzNBU9cG38KkHr1XqJ3hKqC4vF2MCL8zC5WB2
	tPfHiyd/KzbfQsJVdyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0bf-00HS25-24;
	Mon, 07 Aug 2023 13:49:11 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0bd-00HS12-1T
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:49:10 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d45caf42d73so2888835276.2
        for <linux-mtd@lists.infradead.org>; Mon, 07 Aug 2023 06:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691416148; x=1692020948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LrwjN5Q8LetwblRISR8oyofHz7AZ81IID5+NzR+/8cA=;
        b=V7Jh7Nsn3GJVY+ygsTFOkvGh4bLV8N8/Ew/DUfO2RWeke7HQyKDyjJX+JH09EUP2rA
         Jju6Z82uwl1JMOag6O15FNgv0xHCpxqyF6scOiN5H6wvWBVLBpQAZYVxgKhm29sonjSH
         TUYPL4ckDcXINMIpHVuFl+V+kpgsZjqnuZdEpGzTr8XStLu6S+g4JDUmGdlgBXaAUM9n
         bjPmpPjvVEQJr0K3eRuPaaXg4zdZFd/S2DaXMRrvLdjIBJLBqdqpOTfsnkgnGeK64FJR
         NxGiN3P3Vg/fHgZLkbbIvyLeA/NV8B11XiV/mObIGlymdQt9CJQqeELnuL5Kv2Sayvt0
         dJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691416148; x=1692020948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrwjN5Q8LetwblRISR8oyofHz7AZ81IID5+NzR+/8cA=;
        b=eNP0tS992DTXVMYzsr2LVj9Y2I6FWVNcoJ2LXLyCWtzy70Om716c/diXItWHYx6GXz
         5cvPbLCYCKYZRyB5fu55Ab4fDyzl325tCTF1Ki6t5fsiFTxUoEqrVH4109SkgLUo6H6y
         b+fHDhTbPxjDS6TxWNZkuXV3V70alI7lXOXuv1uMuUnFCUtXxRweXlXdssAs8v4ON7xN
         45mHivQgbxDVHy12Y0H5myMCOGp4rcHxa+dhVU8o92GqTZ9YfbIKVvvhmA0efjDsMKe2
         fvG9HIJs4qmNPQxeq/ca1Kg5twFdo1l1hAShbxEWKzaaXgFXfq8yuil43zyqfn/pXYsn
         rmYA==
X-Gm-Message-State: AOJu0YwQy3Y71kzedaUZRnofA4c1VC4ajy5lMF/0eKhn3YYt8oq2T65l
	HvFNLKprq6ZvTFISee21nv/WiOBvh+ZHMbL76RXuHg==
X-Google-Smtp-Source: AGHT+IFlfGibypvOnYH7G4eRsSzX2n2Sgj1wUF/VjFKrm12jEANuab024sswGKNkLGhC7dNM+6Cl6fZVefMCQC5Ucn4=
X-Received: by 2002:a25:b316:0:b0:cea:b62d:620f with SMTP id
 l22-20020a25b316000000b00ceab62d620fmr9376359ybj.45.1691416147971; Mon, 07
 Aug 2023 06:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689802933.git.daniel@makrotopia.org> <1ce5f56df546cec25ef741f381286f1d7c33d000.1689802933.git.daniel@makrotopia.org>
In-Reply-To: <1ce5f56df546cec25ef741f381286f1d7c33d000.1689802933.git.daniel@makrotopia.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Aug 2023 15:48:31 +0200
Message-ID: <CAPDyKFqhZtCHVmCNnm_Qm7X+=GtJY8uNJOWOgZXuTTVEw0msNA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] mmc: block: set fwnode of disk devices
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Dave Chinner <dchinner@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Jan Kara <jack@suse.cz>, Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>, 
	Min Li <min15.li@samsung.com>, Christian Loehle <CLoehle@hyperstone.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Hannes Reinecke <hare@suse.de>, Jack Wang <jinpu.wang@ionos.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Yeqi Fu <asuk4.q@gmail.com>, 
	Avri Altman <avri.altman@wdc.com>, Hans de Goede <hdegoede@redhat.com>, Ye Bin <yebin10@huawei.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_064909_498003_00E43144 
X-CRM114-Status: GOOD (  19.07  )
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

On Thu, 20 Jul 2023 at 00:02, Daniel Golle <daniel@makrotopia.org> wrote:
>
> Set fwnode of disk devices to 'block', 'boot0' and 'boot1' subnodes of
> the mmc-card. This is done in preparation for having the eMMC act as
> NVMEM provider.

Sorry, but I don't quite understand what you are trying to do here.
Maybe you should re-order the patches in the series so it becomes
clear why this is needed?

Moreover, I don't see any DT docs being updated as a part of the
series, which looks like it is needed too. That would also help to
understand what you are proposing, I think.

>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/mmc/core/block.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index f701efb1fa785..fc1a9f31bd253 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -2413,6 +2413,8 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
>                                               int area_type,
>                                               unsigned int part_type)
>  {
> +       struct fwnode_handle *fwnode;
> +       struct device *ddev;
>         struct mmc_blk_data *md;
>         int devidx, ret;
>         char cap_str[10];
> @@ -2509,6 +2511,12 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
>
>         blk_queue_write_cache(md->queue.queue, cache_enabled, fua_enabled);
>
> +       ddev = disk_to_dev(md->disk);
> +       fwnode = device_get_named_child_node(subname ? md->parent->parent :
> +                                                      md->parent,
> +                                            subname ? subname : "block");
> +       ddev->fwnode = fwnode;
> +
>         string_get_size((u64)size, 512, STRING_UNITS_2,
>                         cap_str, sizeof(cap_str));
>         pr_info("%s: %s %s %s%s\n",

Kind regards
Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
