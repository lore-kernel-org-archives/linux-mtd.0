Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBB7C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 18:33:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6BE320657
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 18:33:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D2pCDAde";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXCvPlbe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6BE320657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIfgGdeo1FIBNRZhTrVezDwz124lztE5zDSp5CmYxBY=; b=D2pCDAde4znFkx
	9ZfZ9rw8D7DKwnwbsfrLYnRnoUD0LUE1vat4aafMbkCRXySeD/ZX1od6ne4CoTCbYi2rb2Ar6Q8zG
	7CyAgLZdzxJKGveYsFfd7MOixKOkAJA7gEQXeDKXiAQdggQqPtc3ZNW44p5XTkWK0PZFs28FvVvh9
	njtcQR2fjIRqPdskZf/mzWi62gERDbw880WfS0eC3OfApKwCHbkTYCknrxtt5CDEMqtMgYr3LpWGi
	lpw0DocqLXjXp9QFmDJCa6ee9V2SDD7z9jGY2TQHoaMEcMJO81XhjfymmJKhvCYgHgZTn5a7e6aeb
	QgyFOKs+PAzEE5u6XPsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jakZR-00052k-Ok; Mon, 18 May 2020 18:33:01 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jakZP-00052K-CL
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 18:33:00 +0000
Received: by mail-qv1-xf43.google.com with SMTP id l3so5214335qvo.7
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2020 11:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z6hi1rrNtPKGurqtuvzRNaOED97sTicPfJzHu8wjv0A=;
 b=VXCvPlbewLRnjk+XCmKk3io0FDq/mVREC5+z/CS1b6F/6F5Vald7FO8ZUSxj09yygY
 wSM7JWf0IDyDq7NVBUbJqbV3oj9pLTvqBdoyUaL/TizOEXGoSoUU7i3q96JR+FBSr7UT
 Wi6aZCZb9Z6J7QM3TK++xp8jHhjDRNBiEZ4C36RBvCrQi5dB24g7q8JjDzCK25Fg52Vo
 ReG29DQ0RmBv7D4kd7FgQqTPs+Ow0htCs+M8X9AUhnUIvjmwV+QFBO+CRVDSwp76wnA8
 8B3laXVWE72oh4gGeGYcp19PPiksrKbiFsFXs6Zx+0aQMRZ3a0oXJu1ezlHcnuSyfm3j
 Vuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z6hi1rrNtPKGurqtuvzRNaOED97sTicPfJzHu8wjv0A=;
 b=h1URQuOJEE8zB/N/8Xvvnwo6jiGDYo/gbTE+pGhAKORzWZrqpTX32JXN+uJshlKnDQ
 SK/qxi5DyFHJDqiygdI87hA9G735O9CuJEKP58IQzyeu+TxBAy1BKmi6hf1b5hdeJAXe
 +IxW6RZZFzSiFpZapuI8m/sYNFHDmnfTOq2/rTIa2fgMp+NYlCtlOA8UnoTSRPmuJEYB
 3ieGNx/m+4eAK3gHAoCrgwp04jnQ+gwC+0Jf741BeWEatxTu3E92jz8kY5lbx6cf3gRA
 MZstnMdndTE7I6E4onL5vXXmrLSCuvbcNu8ZqRNx/hDhVRdKV97bbcHH9/c+7N2hXWX0
 sooA==
X-Gm-Message-State: AOAM532xcyv8LMTmNFBbUNxNKNthAt7btWZTOu3sD9U/bDxmNmqLxNmE
 0ZFkGpbLadcOtnVtZeP75QH/BXdRdWbSPvOK62s=
X-Google-Smtp-Source: ABdhPJyqxvmh9rJ31Mq/U5nvKnfwPluC1R2wT2iMF4O6fKI1BM5ejNKhZVf2iLmi66MdIYovUz+3S9wSdI8GxSOWGco=
X-Received: by 2002:ad4:4145:: with SMTP id z5mr17353001qvp.29.1589826777307; 
 Mon, 18 May 2020 11:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200518135943.11749-1-huobean@gmail.com>
 <20200518135943.11749-6-huobean@gmail.com>
In-Reply-To: <20200518135943.11749-6-huobean@gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Mon, 18 May 2020 11:32:21 -0700
Message-ID: <CALLGbR+MWz82hcC6jrv+MrH6Rhj5McW5vt9V+x4UhiZdsoqkRg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] mtd: rawnand: micron: Micron SLC NAND filling block
To: Bean Huo <huobean@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_113259_473104_BE4CA04E 
X-CRM114-Status: GOOD (  24.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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
 s.hauer@pengutronix.de, LKML <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, May 18, 2020 at 7:00 AM Bean Huo <huobean@gmail.com> wrote:
>
> From: Bean Huo <beanhuo@micron.com>
>
> On some legacy planar 2D Micron NAND devices when a block erase command

I object the use of the qualifications you're putting in this
sentence. By saying "some legacy...." you're implying that there's a
set that does and a set that doesn't require this. Which then leads
the reader of this commit message to #1 look for which ones this
applies to vs not, and #2 want to remove/exclude the feature when
they're using a "current" device. The wiggle-word wording is confusing
and dishonest.

I've followed this discussion now intently and it seems like Micron is
either unable or unwilling to determine which specific devices this
does or doesn't apply to. If you are unable to identify and restrict
this functionality to a specific subset of devices, then the fact is
it's "all."  Let's just say that and eliminate the confusion. And
please also update your datasheets to indicate that this is the
correct algorithm for working with these devices. Better would be to
issue an errata on the chips and notify your customers. I feel for
those customers who aren't using Linux and don't know the reliability
problem they've been tracking down for the last couple of years is
already known but they don't have any way of knowing about it.

In your commit message, rewording to "On planar 2D Micron NAND devices
when a block erase command..." is sufficient.

- Steve


> is issued, occasionally even though a block erase operation completes and
> returns a pass status, the flash block may not be completely erased.
> Subsequent operations to this block on very rare cases can result in subtle
> failures or corruption. These extremely rare cases should nevertheless be
> considered. These rare occurrences have been observed on partially written
> blocks.
>
> To avoid this rare occurrence, we should make sure that at least 15 pages
> have been programmed to a block before it is erased. In case we find that
> less than 15 pages have been programmed, we will rewrite first 15 pages of
> block.
>
> Signed-off-by: Bean Huo <beanhuo@micron.com>
> ---
>  drivers/mtd/nand/raw/nand_micron.c | 102 +++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index b3485b0995ad..c5fd9e60f46d 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -36,6 +36,9 @@
>  #define NAND_ECC_STATUS_1_3_CORRECTED  BIT(4)
>  #define NAND_ECC_STATUS_7_8_CORRECTED  (BIT(4) | BIT(3))
>
> +#define MICRON_SHALLOW_ERASE_MIN_PAGE 15
> +#define MICRON_PAGE_MASK_TRIGGER GENMASK(MICRON_SHALLOW_ERASE_MIN_PAGE, 0)
> +
>  struct nand_onfi_vendor_micron {
>         u8 two_plane_read;
>         u8 read_cache;
> @@ -64,6 +67,7 @@ struct micron_on_die_ecc {
>
>  struct micron_nand {
>         struct micron_on_die_ecc ecc;
> +       u16 *writtenp;
>  };
>
>  static int micron_nand_setup_read_retry(struct nand_chip *chip, int retry_mode)
> @@ -429,6 +433,93 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
>         return MICRON_ON_DIE_SUPPORTED;
>  }
>
> +static int micron_nand_pre_erase(struct nand_chip *chip, u32 eraseblock)
> +{
> +       struct micron_nand *micron = nand_get_manufacturer_data(chip);
> +       struct mtd_info *mtd = nand_to_mtd(chip);
> +       u8 last_page = MICRON_SHALLOW_ERASE_MIN_PAGE - 1;
> +       u32 page;
> +       u8 *data_buf;
> +       int ret, i;
> +
> +       data_buf = nand_get_data_buf(chip);
> +       WARN_ON(!data_buf);
> +
> +       if (likely(micron->writtenp[eraseblock] & BIT(last_page)))
> +               return 0;
> +
> +       page = eraseblock << (chip->phys_erase_shift - chip->page_shift);
> +
> +       if (unlikely(micron->writtenp[eraseblock] == 0)) {
> +               ret = nand_read_page_raw(chip, data_buf, 1, page + last_page);
> +               if (ret)
> +                       return ret; /* Read error */
> +               ret = nand_check_is_erased_page(chip, data_buf, true);
> +               if (!ret)
> +                       return 0;
> +       }
> +
> +       memset(data_buf, 0x00, mtd->writesize);
> +
> +       for (i = 0; i < MICRON_SHALLOW_ERASE_MIN_PAGE; i++) {
> +               ret = nand_write_page_raw(chip, data_buf, false, page + i);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int micron_nand_post_erase(struct nand_chip *chip, u32 eraseblock)
> +{
> +       struct micron_nand *micron = nand_get_manufacturer_data(chip);
> +
> +       if (!micron)
> +               return -EINVAL;
> +
> +       micron->writtenp[eraseblock] = 0;
> +
> +       return 0;
> +}
> +
> +static int micron_nand_write_oob(struct nand_chip *chip, loff_t to,
> +                                struct mtd_oob_ops *ops)
> +{
> +       struct micron_nand *micron = nand_get_manufacturer_data(chip);
> +       u32 eb_sz = nanddev_eraseblock_size(&chip->base);
> +       u32 p_sz = nanddev_page_size(&chip->base);
> +       u32 ppeb = nanddev_pages_per_eraseblock(&chip->base);
> +       u32 nb_p_tot = ops->len / p_sz;
> +       u32 first_eb = DIV_ROUND_DOWN_ULL(to, eb_sz);
> +       u32 first_p = DIV_ROUND_UP_ULL(to - (first_eb * eb_sz), p_sz);
> +       u32 nb_eb = DIV_ROUND_UP_ULL(first_p + nb_p_tot, ppeb);
> +       u32 remaining_p, eb, nb_p;
> +       int ret;
> +
> +       ret = nand_write_oob_nand(chip, to, ops);
> +
> +       if (ret || ops->len != ops->retlen)
> +               return ret;
> +
> +       /* Mark the last pages of the first erase block to write */
> +       nb_p = min(nb_p_tot, ppeb - first_p);
> +       micron->writtenp[first_eb] |= GENMASK(first_p + nb_p, 0) &
> +                                       MICRON_PAGE_MASK_TRIGGER;
> +       remaining_p = nb_p_tot - nb_p;
> +
> +       /* Mark all the pages of all "in-the-middle" erase blocks */
> +       for (eb = first_eb + 1; eb < first_eb + nb_eb - 1; eb++) {
> +               micron->writtenp[eb] |= MICRON_PAGE_MASK_TRIGGER;
> +               remaining_p -= ppeb;
> +       }
> +
> +       /* Mark the first pages of the last erase block to write */
> +       if (remaining_p)
> +               micron->writtenp[eb] |= GENMASK(remaining_p - 1, 0) &
> +                                       MICRON_PAGE_MASK_TRIGGER;
> +               return 0;
> +}
> +
>  static int micron_nand_init(struct nand_chip *chip)
>  {
>         struct mtd_info *mtd = nand_to_mtd(chip);
> @@ -515,6 +606,17 @@ static int micron_nand_init(struct nand_chip *chip)
>                 }
>         }
>
> +       if (nand_is_slc(chip)) {
> +               micron->writtenp = kcalloc(nanddev_neraseblocks(&chip->base),
> +                                          sizeof(u16), GFP_KERNEL);
> +               if (!micron->writtenp)
> +                       goto err_free_manuf_data;
> +
> +               chip->ops.write_oob = micron_nand_write_oob;
> +               chip->ops.pre_erase = micron_nand_pre_erase;
> +               chip->ops.post_erase = micron_nand_post_erase;
> +       }
> +
>         return 0;
>
>  err_free_manuf_data:
> --
> 2.17.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
