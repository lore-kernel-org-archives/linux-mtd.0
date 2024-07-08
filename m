Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678B1C3DA42
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2024 06:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2QzNRP2gSY65FRNtOXib5/pPfTDEXaWwcU2f6+Q9gw=; b=LU8VhiPlw/EOjIRt6H6ospQJXN
	2zPQ2ziDSzPiJ/USJQil/tQsDpOw6O8OsKywWPtbLylAh282W48eSRgYWhpKrBMt3qEysG6HNgHsy
	8syuI50tZQQ9r5GVgZtrxbLUHTqwpNFEyDvPXAOMEIAYrW3Sp9hKTTXOMvQqjgXoorDcGW6N5Vi07
	24fGF3LmAOwNEmwMGddAWYMwpMbuzLR55mtoI0DdPkG8GPW4CnEHkoGK+eKPTOIfhuqZ69d4shLnK
	rnrK4QE63O/dOUg+Rov3Wc9gBqccNnMJneH8HGqA1Bmi3M5ezVkpJn5B+3G5isC3c7p634cyX6lmx
	au0ZqQSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhnk-00000002ryM-4Aey;
	Mon, 08 Jul 2024 06:24:40 +0000
Received: from mxout70.expurgate.net ([91.198.224.70])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQhng-00000002rxS-2YA5
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jul 2024 06:24:38 +0000
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=0933383879=ms@dev.tdt.de>)
	id 1sQhnW-00Ettk-5Q; Mon, 08 Jul 2024 08:24:26 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ms@dev.tdt.de>)
	id 1sQhnU-008AJd-4H; Mon, 08 Jul 2024 08:24:24 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id C90D5240053;
	Mon,  8 Jul 2024 08:24:23 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 38FB4240050;
	Mon,  8 Jul 2024 08:24:23 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id 70A2A34AE0;
	Mon,  8 Jul 2024 08:24:22 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 08 Jul 2024 08:24:22 +0200
From: Martin Schiller <ms@dev.tdt.de>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linus.walleij@linaro.org, nico@fluxnic.net, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Disable write buffer
 functions if FORCE_WORD_WRITE is 1
Organization: TDT AG
In-Reply-To: <20240707094302.784948-2-olek2@wp.pl>
References: <20240707094302.784948-1-olek2@wp.pl>
 <20240707094302.784948-2-olek2@wp.pl>
Message-ID: <0135dec8e53837912712cb08ba2ddca7@dev.tdt.de>
X-Sender: ms@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
X-purgate: clean
X-purgate-type: clean
X-purgate-ID: 151534::1720419864-67452D95-A9D6B882/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_232436_829226_64AFF908 
X-CRM114-Status: GOOD (  19.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2024-07-07 11:43, Aleksander Jan Bajkowski wrote:
> Some write buffer functions are not used when FORCE_WORD_WRITE is set 
> to 1.
> So the compile warning messages are output if FORCE_WORD_WRITE is 1. To
> resolve this disable the write buffer functions if FORCE_WORD_WRITE is 
> 1.
> 
> This is similar fix to: 557c759036fc3976a5358cef23e65a263853b93f.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c
> b/drivers/mtd/chips/cfi_cmdset_0001.c
> index c10693ba265b..5404637e54e2 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -62,8 +62,10 @@
> 
>  static int cfi_intelext_read (struct mtd_info *, loff_t, size_t,
> size_t *, u_char *);
>  static int cfi_intelext_write_words(struct mtd_info *, loff_t,
> size_t, size_t *, const u_char *);
> +#if !FORCE_WORD_WRITE
>  static int cfi_intelext_write_buffers(struct mtd_info *, loff_t,
> size_t, size_t *, const u_char *);
>  static int cfi_intelext_writev(struct mtd_info *, const struct kvec
> *, unsigned long, loff_t, size_t *);
> +#endif
>  static int cfi_intelext_erase_varsize(struct mtd_info *, struct 
> erase_info *);
>  static void cfi_intelext_sync (struct mtd_info *);
>  static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, 
> uint64_t len);
> @@ -305,6 +307,7 @@ static void fixup_use_point(struct mtd_info *mtd)
>  	}
>  }
> 
> +#if !FORCE_WORD_WRITE
>  static void fixup_use_write_buffers(struct mtd_info *mtd)
>  {
>  	struct map_info *map = mtd->priv;
> @@ -315,6 +318,7 @@ static void fixup_use_write_buffers(struct mtd_info 
> *mtd)
>  		mtd->_writev = cfi_intelext_writev;
>  	}
>  }
> +#endif /* !FORCE_WORD_WRITE */
> 
>  /*
>   * Some chips power-up with all sectors locked by default.
> @@ -1720,6 +1724,7 @@ static int cfi_intelext_write_words (struct
> mtd_info *mtd, loff_t to , size_t le
>  }
> 
> 
> +#if !FORCE_WORD_WRITE
>  static int __xipram do_write_buffer(struct map_info *map, struct 
> flchip *chip,
>  				    unsigned long adr, const struct kvec **pvec,
>  				    unsigned long *pvec_seek, int len)
> @@ -1948,6 +1953,7 @@ static int cfi_intelext_write_buffers (struct
> mtd_info *mtd, loff_t to,
> 
>  	return cfi_intelext_writev(mtd, &vec, 1, to, retlen);
>  }
> +#endif /* !FORCE_WORD_WRITE */
> 
>  static int __xipram do_erase_oneblock(struct map_info *map, struct
> flchip *chip,
>  				      unsigned long adr, int len, void *thunk)

Thank you for sending this patch upstream.

Acked-by: Martin Schiller <ms@dev.tdt.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
