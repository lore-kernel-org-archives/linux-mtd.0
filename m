Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174DFC282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 20:44:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06F620821
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 20:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cjfVM0J6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQwYJghn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B06F620821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYjsr0bTMxaWhLVYEEGoLDr97BLU/eOw+bFp7QXFw+4=; b=cjfVM0J6RskPGp
	0GueVELvlxx+S/M2AWeus9McsgtZ/if7/Enw053o8mhR3ZyD9gMzVJvZksNOIIt+sOpIwxnaF9jPS
	WM1tjiWYdmfUnh/SGckw51LrWXTO4FXPmLGcthd6OvytOYfTxTc6IejAQCb+xqjhg/FQBf4H5kEfU
	YFcDKz/t8eBkHznRQJEwKBBH0sXNe+01itEvBrCti3+gm+DqVyAm905sjowf1GlB14NxzQtcmGzoF
	GdbMeb3r46EGmxrUvsFX6OFdZI2cHQLEFxf6vuzWgTWw39V8qA7pRR1/CLxeG7OpkXSeX5PODulDa
	BKFP/O/24hxbnYWuYixA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTY63-0000rQ-So; Wed, 22 May 2019 20:44:23 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTY61-0000qx-4M
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 20:44:22 +0000
Received: by mail-wr1-x444.google.com with SMTP id f10so3786002wre.7
 for <linux-mtd@lists.infradead.org>; Wed, 22 May 2019 13:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=esU+3qm17qrDuexe7jxN3EvAQX5MaY6ZoatueVdr3qQ=;
 b=LQwYJghnsjhn591pkI1Li/RiGNLgcSIn+RKzEdMKdpMhy1XZToSM64anUNI9+saxK3
 ODHzCEFRE5XfoiS1p/TWCDYIthlUJIhYCafNd+cdkCt2FHwqrVkiDp1/srtU/+1359CV
 txZ5+WP6U+hiEJJHvBwIkHWRUKq/irVsr5+R2jyPac2VWFSABPEyi5GqcVp9/rAyKqud
 ivB+KBcPmscp8HxxBctoQj2bYm+rDsp9FShbnqUrka9POWYktrtNnuaqc+BEt9Mv5EM0
 CAGc29oBeJM56ZBnDgN2BCx4SrVkMck8aau30uIDwDZj6xI93LaWCiQSkJ4iIVp7cDgu
 c60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=esU+3qm17qrDuexe7jxN3EvAQX5MaY6ZoatueVdr3qQ=;
 b=oYfYhkizo2c0EtIrdsn3VyheOYUwjBMv7IUiprVzTTrUYArPkRSYQ+JPcUBMDUwSCj
 yueVUkhpE9NQYl2jBSDuMVsSfV17f+OdMm96bO1JwEtFYO86f5627JDck3IZfwAzLvNq
 aVIBv3DDHbMUXWIUUtlx8Vb/HREM74bdPZpNR3gl6w08G1R6HH+dR40Nlzyqfo9iRtXw
 xAU9LfQPA7V4ZDNYeBEcKd2vcGfqqL635+vClncIMZNgEeUhl1bYiItxh+AuKyR4ixo1
 12BfCRLS3RB+t1RR8n5RTe7gclnmQ5TTEs3KTbt+S4+vGZpjKY39q2ya5eOgVcOlNqI0
 9Biw==
X-Gm-Message-State: APjAAAWF5sHvk9NpLNe4u1L4Ehcpt2HHOQ/EZFr9KIWnEYPOQ2yXGXra
 mwt6zLiP4l3Y6prYIhT6DkldoyTufO+Byjh5bww=
X-Google-Smtp-Source: APXvYqxc45ky2GHi1FeZ+BIf3VnaFuT1mLCFliU3lSSeZiCzoTlqseE8pdpvOSSzz5iK6QZMeV6uMntQG00gwpjmjHI=
X-Received: by 2002:a5d:4e09:: with SMTP id p9mr11738017wrt.218.1558557859722; 
 Wed, 22 May 2019 13:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190522000753.13300-1-chris.packham@alliedtelesis.co.nz>
 <20190522000753.13300-2-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20190522000753.13300-2-chris.packham@alliedtelesis.co.nz>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 22 May 2019 22:44:08 +0200
Message-ID: <CAFLxGvy2c9KV1CyoFaD76jvThfPiotqfoeNchqjGcDp+uHie7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: concat: implement _is_locked mtd operation
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_134421_178388_F2279582 
X-CRM114-Status: GOOD (  14.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 22, 2019 at 2:08 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
> Add an implementation of the _is_locked operation for concatenated mtd
> devices. As with concat_lock/concat_unlock this can simply use the
> common helper and pass mtd_is_locked as the operation.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  drivers/mtd/mtdconcat.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
> index 9514cd2db63c..0e919f3423af 100644
> --- a/drivers/mtd/mtdconcat.c
> +++ b/drivers/mtd/mtdconcat.c
> @@ -496,6 +496,11 @@ static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>         return __concat_xxlock(mtd, ofs, len, mtd_unlock);
>  }
>
> +static int concat_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> +{
> +       return __concat_xxlock(mtd, ofs, len, mtd_is_locked);
> +}

Hmm, here you start abusing your own new API. :(

Did you verify that the unlock/lock-functions deal correctly with all
semantics from mtd_is_locked?
i.e. mtd_is_locked() with len = 0 returns 1 for spi-nor.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
