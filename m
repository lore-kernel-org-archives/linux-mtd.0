Return-Path: <SRS0=EGP2=6R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCD0C28CBC
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 16:11:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED9DA20752
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 16:11:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FUbFsSuM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWBtFumf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED9DA20752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ABnQ2XEXBnuACfeQzSYdHGiUC2zZfO6GSU4mRVd2UfU=; b=FUbFsSuMxJs8UD
	zZun4F1OgymeCayWjoUE1byFir6Yz52lDiw7ot6IByHIbsPXVy/aEVBi7FgVaG7scK1BChDTxzRsK
	L2vldY9f1C0eRiIpbfTx3JxPSUtERoyESdX2l+sF+n8hPjLsOV9Xshygo4div8sXEu9zLPyRHVNhH
	ENj6B0Il7PdNebnpL3h3/3Nfcv27Qth30e2FC92LEmjUILNW0tKUi4VxZ80y4dzKNQVV48ljDVNbL
	z4mA0dFtSVzkVGBvjyND4B15aQdkbbdNATdwsqrWewJ6jcBsiqmoDiPkenr6GLQo6m4/JKTjciyWO
	S4yjygEeIFKHHFpTBZyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVHCj-0001Da-IC; Sun, 03 May 2020 16:10:57 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVHCg-0001D3-In
 for linux-mtd@lists.infradead.org; Sun, 03 May 2020 16:10:56 +0000
Received: by mail-qk1-x744.google.com with SMTP id n14so6109408qke.8
 for <linux-mtd@lists.infradead.org>; Sun, 03 May 2020 09:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eKmNE+YxyADhRtPoefr3bz79+iTPqs643PMRMJEXlDw=;
 b=EWBtFumfWWwZud/AVR4aFUa345rB9P9Oc8TyAeghDoDzDF5VZPGP6UnqvEzBYiTcg9
 b5W/FHd31jnehp0mZ0ds2jtHh5nMNu6Fz7TyOIWXYhHZoHI1oS0ypo/J58X500h6lFUL
 ok8U86li7KAZBOQquzXjrdPNnblXbVFZkGQlakgA/iqr59yvlS8T/9+l/shkgbTl6fND
 TZsgUwKMd0IQNA0rfvjzlCElKC5vlrF42DOyUzKD3BJ2SWl/lX0KY/J/AgYdGiA05/BA
 oRPp1V7soVfp/1ybTM9zn059y99B5OnJH/Mixa9EMq/mb/RJ4UcAt8cfhipVHTjXOiPS
 X03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eKmNE+YxyADhRtPoefr3bz79+iTPqs643PMRMJEXlDw=;
 b=V6iN/TN6+NrFVadTI93kIr02DqXCLOs24u/CMrKWnUOukOox/N5GjxdlpAvRdZt/Av
 v3W2B7QibZJx2nezQByVruaT/eGnzCUjeA5rxAvUs7J6u6WmrdBaKTffvQ4S1tcJ5+FN
 bkelRvRPOX0ixfk2ceWOst4z8eDUoUdpJjz4DAmjjX70utP5JEKtNcvFAxsiSxkmKxcb
 Ab32q2PMLRlAZ7S9oz0Mx/SfQncIZadOnuaqYj940s3AY+1J0pDcjub0J5lvDlranM77
 L2bxBpwKL0u8dSaRwAiuK9N/w6HtkLtufwjo4Q0CImcpwADhZM6jfQyeA57UqMOU32MV
 lkOw==
X-Gm-Message-State: AGi0PuYWrBc4Glbbt4OW08Mjqv8w30JbkbsTujVNeFnUHEfXUiViqDEd
 lHgiZ59XiA6WCKjiZNzQEOXnFBUWQX5a/VhCz1s=
X-Google-Smtp-Source: APiQypJqAzqUOf1SlxwlIfy1broj8jM6kWUiV5IIUlftsYDKutRGxvGEtsC/Ior8P8ZwOn3F3zJKRoJnqYxOOE+sW0k=
X-Received: by 2002:a37:7a07:: with SMTP id v7mr12527355qkc.198.1588522251558; 
 Sun, 03 May 2020 09:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-4-miquel.raynal@bootlin.com>
In-Reply-To: <20200503114029.30257-4-miquel.raynal@bootlin.com>
From: Steve deRosier <derosier@gmail.com>
Date: Sun, 3 May 2020 09:10:15 -0700
Message-ID: <CALLGbRJU5Hj0gxs_4WG0UUYYMDSF1MAiEjkqn0G-zenhVhnSFQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow erase
 issue
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_091054_620056_A2B892DC 
X-CRM114-Status: GOOD (  34.00  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Zoltan Szubbocsev <zszubbocsev@micron.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, tglx@linutronix.de,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, May 3, 2020 at 4:41 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> With recent SLC NANDs, Micron admits that a "shallow erase" issue may
> be observable. It is actually the chip itself not doing a correct
> erase operation because of its internal machinery stating that the
> pages have not been programmed. Micron told us that there is a way to
> workaround this issue: ensure that all the odd pages in the 16 first
> ones of each block to erase have been fully written.
>
> To avoid a very big performance drawback by re-writting all the pages
> for each erase operation, the fix proposed here overloads the ->erase
> and ->write_oob hooks to count the pages actually written at runtime
> and avoid re-writting them if not needed.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_micron.c | 121 +++++++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index 56654030ec7f..a9afd1b9a9e8 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -36,6 +36,15 @@
>  #define NAND_ECC_STATUS_1_3_CORRECTED  BIT(4)
>  #define NAND_ECC_STATUS_7_8_CORRECTED  (BIT(4) | BIT(3))
>
> +/*
> + * Micron SLC chips are subject to a shallow erase issue: if the first
> + * pages of a block have not enough bytes programmed, the internal
> + * machinery might declare the block empty and skip the actual erase
> + * operation. This is the number of pages we check by software.
> + */
> +#define MICRON_SHALLOW_ERASE_MIN_PAGE 16
> +#define MICRON_PAGE_MASK_TRIGGER GENMASK(MICRON_SHALLOW_ERASE_MIN_PAGE, 0)
> +
>  struct nand_onfi_vendor_micron {
>         u8 two_plane_read;
>         u8 read_cache;
> @@ -64,6 +73,7 @@ struct micron_on_die_ecc {
>
>  struct micron_nand {
>         struct micron_on_die_ecc ecc;
> +       u16 *writtenp;
>  };
>
>  static int micron_nand_setup_read_retry(struct nand_chip *chip, int retry_mode)
> @@ -429,6 +439,106 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
>         return MICRON_ON_DIE_SUPPORTED;
>  }
>
> +static int micron_nand_avoid_shallow_erase(struct nand_chip *chip,
> +                                          unsigned int eb)
> +{
> +       struct micron_nand *micron = nand_get_manufacturer_data(chip);
> +       unsigned int page = eb * nanddev_pages_per_eraseblock(&chip->base);
> +       u8 *databuf = nand_get_data_buf(chip);
> +       int ret, i;
> +
> +       memset(databuf, 0x00, nanddev_page_size(&chip->base));
> +
> +       /* Micron advises to only write the first 8 odd pages, counting from 1 */
> +       for (i = 0; i < MICRON_SHALLOW_ERASE_MIN_PAGE; i += 2, page += 2) {
> +               if (!(micron->writtenp[eb] & BIT(i))) {
> +                       ret = nand_write_page_raw(chip, databuf, false, page);
> +                       if (ret)
> +                               return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int micron_nand_erase(struct nand_chip *chip, struct erase_info *instr,
> +                       int allowbbt)
> +{
> +       struct micron_nand *micron = nand_get_manufacturer_data(chip);
> +       unsigned int eb_sz = nanddev_eraseblock_size(&chip->base);
> +       unsigned int first_eb = DIV_ROUND_DOWN_ULL(instr->addr, eb_sz);
> +       unsigned int nb_eb = DIV_ROUND_UP_ULL(instr->len, eb_sz);
> +       unsigned int eb;
> +
> +       if (!micron)
> +               return -EINVAL;
> +
> +       /*
> +        * Check that enough pages have been written in each block.
> +        * If not, write them before actually erasing.
> +        */
> +       for (eb = first_eb; eb < first_eb + nb_eb; eb++) {
> +               /* Il all the first pages are not written yet, do it */
> +               if (micron->writtenp[eb] != MICRON_PAGE_MASK_TRIGGER)
> +                       micron_nand_avoid_shallow_erase(chip, eb);
> +
> +               micron->writtenp[eb] = 0;
> +       }
> +
> +       return nand_erase_nand(chip, instr, allowbbt);
> +}
> +static int micron_nand_write_oob(struct nand_chip *chip, loff_t to,
> +                                struct mtd_oob_ops *ops)
> +{
> +       struct micron_nand *micron = nand_get_manufacturer_data(chip);
> +       unsigned int eb_sz = nanddev_eraseblock_size(&chip->base);
> +       unsigned int p_sz = nanddev_page_size(&chip->base);
> +       unsigned int ppeb = nanddev_pages_per_eraseblock(&chip->base);
> +       unsigned int nb_p_tot = ops->len / p_sz;
> +       unsigned int first_eb = DIV_ROUND_DOWN_ULL(to, eb_sz);
> +       unsigned int first_p = DIV_ROUND_UP_ULL(to - (first_eb * eb_sz), p_sz);
> +       unsigned int nb_eb = DIV_ROUND_UP_ULL(first_p + nb_p_tot, ppeb);
> +       unsigned int remaining_p, eb, nb_p;
> +       int ret;
> +
> +       ret = nand_write_oob_nand(chip, to, ops);
> +       if (ret || (ops->len != ops->retlen))
> +               return ret;
> +
> +       /* Mark the last pages of the first erase block to write */
> +       nb_p = min(nb_p_tot, ppeb - first_p);
> +       micron->writtenp[first_eb] |= GENMASK(first_p + nb_p, first_p) &
> +                                     MICRON_PAGE_MASK_TRIGGER;
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
> +
> +       return 0;
> +}
> +
> +static bool micron_nand_with_shallow_erase_issue(struct nand_chip *chip)
> +{
> +       /*
> +        * The shallow erase issue has been observed with MT29F*G*A
> +        * parts but Micron suspects that the issue can happen with
> +        * almost all recent SLC but at such a low probability that it
> +        * is almost invisible. Nevertheless, as we mitigate the
> +        * performance penalty at runtime by following the number of
> +        * written pages in a block before erasing it, we may want to
> +        * enable this fix by default.
> +        */
> +       return nand_is_slc(chip);
> +}


Whoa, let's hold our horses here!  "almost all recent" would imply
that older SLCs aren't affected. And the likelyhood that Micron will
fix newer parts is high - because why  would they leave in a major bug
like that in the next mask? So, what you're saying is when someone
goes to upgrade their older device's Linux they're going to take a
major filesystem performance hit without knowing it (because
realistically who reads 10,000s of patches before upgrading) when
their chip doesn't need it. Because we're too lazy to get the list
from Micron and code that ugliness?

We put this in and the resulting discussions for embedded systems
designers for the next decade are going to be one of two things:
* Oh, you want to use that SLC NAND from Micron? Well then don't use
Linux because it performs crappy on Micron SLC NANDs.
OR
* Oh, you want to use Linux? Well, don't use a Micron SLC NAND then
because they perform crappy on Linux.

Let's get a list of all chip that have this bug (and let's be clear -
it's a bug, not a "quirk") and enable it for those chips specifically.
Even better if there was something in the chipinfo itself that made it
obvious which ones had the problem (because realistically it's
probably specific to a particular geometry). In any case, it's in the
best interest of Micron to identify to us exactly which chips have or
are likely to have this issue and for us to be specific on which get
assigned this quirk. It is probably listed in an errata app-note, and
if not it should be.

Strong NAK to defaulting all Micron SLC NANDs to this - unless it
truly is the case that _all_ Micron SLC NANDs in the past and in the
future likely have this problem.



>
> +
>  static int micron_nand_init(struct nand_chip *chip)
>  {
>         struct mtd_info *mtd = nand_to_mtd(chip);
> @@ -513,6 +623,17 @@ static int micron_nand_init(struct nand_chip *chip)
>                 }
>         }
>
> +       if (micron_nand_with_shallow_erase_issue(chip)) {
> +               micron->writtenp = kzalloc(sizeof(u16) *
> +                                          nanddev_neraseblocks(&chip->base),
> +                                          GFP_KERNEL);
> +               if (!micron->writtenp)
> +                       goto err_free_manuf_data;
> +
> +               chip->erase = micron_nand_erase;
> +               chip->write_oob = micron_nand_write_oob;
> +       }
> +
>         return 0;
>
>  err_free_manuf_data:
> --
> 2.20.1
>
>

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
