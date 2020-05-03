Return-Path: <SRS0=EGP2=6R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BFBC28CBC
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 19:57:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B409206D9
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 19:57:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SyNKJUh1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HV49zqJk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B409206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIWExFL0yjKG/yHH79/6990XECeWFJcsWwXdPMupc/A=; b=SyNKJUh17Oj9a9
	EoiKhGJmbe+GROnI3gGtFCvjMtKyYQTcpjLS5oQJF3fQBxIhfaF7On1WzIp6EdbGs+CqA48ZsZqdm
	H+8eHAH8pAcebogsTo6/QyaaVXzvDSuDjj4poVew9ZAfU9zWTJw4hci0cBmV27wN8wWgAAQCd8uwv
	aG2CNWraq0Knnrwp2JOdsNBB5hrlC3KLbNBa97D8hZSfecBJ5q7YquYdlAORARUVoW3tBb01XLWmz
	U+KXUE1dAjaHUL88/zIkptPpMWGGU8e+lm6nHA+uYLFR99GWOctIJzrqqb48S++XYMQOtKUf4cout
	/vdG0SULiW2tg90gJY8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVKkH-0000HU-PE; Sun, 03 May 2020 19:57:49 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVKkE-0000Gy-6h
 for linux-mtd@lists.infradead.org; Sun, 03 May 2020 19:57:48 +0000
Received: by mail-qk1-x744.google.com with SMTP id t3so14647959qkg.1
 for <linux-mtd@lists.infradead.org>; Sun, 03 May 2020 12:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XaFKwlcdt5Sbqd6aeBWV0B8FXbTX6tZrQlf4XUuOYxI=;
 b=HV49zqJkj1Ergmy90VRKM63r6t6xS6zLZbz3l3Zw/C8j28JgRt+1en5AbcWIbTag1g
 KypeWx0iW1HVRc1cAQu/LC2weGTb0cC8WlcNQGNudIfU9JwzHVO64EQxhJFUdWj308m5
 pCzamrv7U38INNWQTkyq7GP61V1q2jZhz/dKFt1tDifq2azNWkGHM3SBZByvqO7VeRjR
 53z4+LcXjeu/X0PqCYaduwX3GuzMqz8cUqNWKyl+a+0mUlbrLcnRk/Av614uJsHMLKh3
 6OMhVJyYMsNQvArbAzk3ToJ+c+O2DRNSF59K6n8QNkz/IXpGYpDz2vo/eYR0FopHgOKx
 +srQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XaFKwlcdt5Sbqd6aeBWV0B8FXbTX6tZrQlf4XUuOYxI=;
 b=b1BgtRIapulf5a0UeMP7JhmLHGxeD1zxfjyvdWo28QOy/ENlCl3CAfY/iFSNTmITpR
 l+mkWjuAX3h0MOg9FXLQatpjUTAp+eoHXc1DEUUtGGQ2lcEfgMmhhmnHIX0hLypYOlf0
 rX6vgwtNiRD+FTmYq+Rjxg9dj89K+zH1f9C9L4P2PWprXTpXWZ80192vMjgqh/RjNBqc
 V/QJONarXbKTHhc1wdv7lwChY0qzVhjKrOyAIXMOuAKIWq/6AnVGfLY2T8bbi5fzn7xc
 eV6R2/on8hpRrkbAw6YAdYNIZ5IjmP8r9xllMMo1UnvlH+AGWiB4J8Gc4n35wmqE+sRe
 2M5w==
X-Gm-Message-State: AGi0PuaoB49KOq5Lh5Nc4EjMeJYYSg+hzDpPE1Q2N6NgCiR8riV7IHgf
 IDBQ75Lvq1LlZ0eebAE6fPuTGcvxdRx6OAdhHfM=
X-Google-Smtp-Source: APiQypKkhAyOs+6fRCHCuVbXhuxZ0Oq5vmn/9hq69XXVoP3PcGv3IQAMxeRwyWfGu3A9rRU2+ryu8VzOtH+W+MiBajc=
X-Received: by 2002:a37:a45:: with SMTP id 66mr12827365qkk.395.1588535864538; 
 Sun, 03 May 2020 12:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-4-miquel.raynal@bootlin.com>
 <CALLGbRJU5Hj0gxs_4WG0UUYYMDSF1MAiEjkqn0G-zenhVhnSFQ@mail.gmail.com>
 <20200503183616.2a8a8d6a@xps13>
In-Reply-To: <20200503183616.2a8a8d6a@xps13>
From: Steve deRosier <derosier@gmail.com>
Date: Sun, 3 May 2020 12:57:08 -0700
Message-ID: <CALLGbR+Yqo31Oh0gnZS=URd15qjz2urROo8NM3K7-jvf7FFA1w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow erase
 issue
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_125746_271969_6FCDE17E 
X-CRM114-Status: GOOD (  48.45  )
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

Boris and Miquel,

On Sun, May 3, 2020 at 9:36 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Steve,
>
> Steve deRosier <derosier@gmail.com> wrote on Sun, 3 May 2020 09:10:15
> -0700:
>
> > On Sun, May 3, 2020 at 4:41 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >
> > > With recent SLC NANDs, Micron admits that a "shallow erase" issue may
> > > be observable. It is actually the chip itself not doing a correct
> > > erase operation because of its internal machinery stating that the
> > > pages have not been programmed. Micron told us that there is a way to
> > > workaround this issue: ensure that all the odd pages in the 16 first
> > > ones of each block to erase have been fully written.
> > >
> > > To avoid a very big performance drawback by re-writting all the pages
> > > for each erase operation, the fix proposed here overloads the ->erase
> > > and ->write_oob hooks to count the pages actually written at runtime
> > > and avoid re-writting them if not needed.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  drivers/mtd/nand/raw/nand_micron.c | 121 +++++++++++++++++++++++++++++
> > >  1 file changed, 121 insertions(+)
> > >
> > > diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> > > index 56654030ec7f..a9afd1b9a9e8 100644
> > > --- a/drivers/mtd/nand/raw/nand_micron.c
> > > +++ b/drivers/mtd/nand/raw/nand_micron.c
> > > @@ -36,6 +36,15 @@
> > >  #define NAND_ECC_STATUS_1_3_CORRECTED  BIT(4)
> > >  #define NAND_ECC_STATUS_7_8_CORRECTED  (BIT(4) | BIT(3))
> > >
> > > +/*
> > > + * Micron SLC chips are subject to a shallow erase issue: if the first
> > > + * pages of a block have not enough bytes programmed, the internal
> > > + * machinery might declare the block empty and skip the actual erase
> > > + * operation. This is the number of pages we check by software.
> > > + */
> > > +#define MICRON_SHALLOW_ERASE_MIN_PAGE 16
> > > +#define MICRON_PAGE_MASK_TRIGGER GENMASK(MICRON_SHALLOW_ERASE_MIN_PAGE, 0)
> > > +
> > >  struct nand_onfi_vendor_micron {
> > >         u8 two_plane_read;
> > >         u8 read_cache;
> > > @@ -64,6 +73,7 @@ struct micron_on_die_ecc {
> > >
> > >  struct micron_nand {
> > >         struct micron_on_die_ecc ecc;
> > > +       u16 *writtenp;
> > >  };
> > >
> > >  static int micron_nand_setup_read_retry(struct nand_chip *chip, int retry_mode)
> > > @@ -429,6 +439,106 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
> > >         return MICRON_ON_DIE_SUPPORTED;
> > >  }
> > >
> > > +static int micron_nand_avoid_shallow_erase(struct nand_chip *chip,
> > > +                                          unsigned int eb)
> > > +{
> > > +       struct micron_nand *micron = nand_get_manufacturer_data(chip);
> > > +       unsigned int page = eb * nanddev_pages_per_eraseblock(&chip->base);
> > > +       u8 *databuf = nand_get_data_buf(chip);
> > > +       int ret, i;
> > > +
> > > +       memset(databuf, 0x00, nanddev_page_size(&chip->base));
> > > +
> > > +       /* Micron advises to only write the first 8 odd pages, counting from 1 */
> > > +       for (i = 0; i < MICRON_SHALLOW_ERASE_MIN_PAGE; i += 2, page += 2) {
> > > +               if (!(micron->writtenp[eb] & BIT(i))) {
> > > +                       ret = nand_write_page_raw(chip, databuf, false, page);
> > > +                       if (ret)
> > > +                               return ret;
> > > +               }
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int micron_nand_erase(struct nand_chip *chip, struct erase_info *instr,
> > > +                       int allowbbt)
> > > +{
> > > +       struct micron_nand *micron = nand_get_manufacturer_data(chip);
> > > +       unsigned int eb_sz = nanddev_eraseblock_size(&chip->base);
> > > +       unsigned int first_eb = DIV_ROUND_DOWN_ULL(instr->addr, eb_sz);
> > > +       unsigned int nb_eb = DIV_ROUND_UP_ULL(instr->len, eb_sz);
> > > +       unsigned int eb;
> > > +
> > > +       if (!micron)
> > > +               return -EINVAL;
> > > +
> > > +       /*
> > > +        * Check that enough pages have been written in each block.
> > > +        * If not, write them before actually erasing.
> > > +        */
> > > +       for (eb = first_eb; eb < first_eb + nb_eb; eb++) {
> > > +               /* Il all the first pages are not written yet, do it */
> > > +               if (micron->writtenp[eb] != MICRON_PAGE_MASK_TRIGGER)
> > > +                       micron_nand_avoid_shallow_erase(chip, eb);
> > > +
> > > +               micron->writtenp[eb] = 0;
> > > +       }
> > > +
> > > +       return nand_erase_nand(chip, instr, allowbbt);
> > > +}
> > > +static int micron_nand_write_oob(struct nand_chip *chip, loff_t to,
> > > +                                struct mtd_oob_ops *ops)
> > > +{
> > > +       struct micron_nand *micron = nand_get_manufacturer_data(chip);
> > > +       unsigned int eb_sz = nanddev_eraseblock_size(&chip->base);
> > > +       unsigned int p_sz = nanddev_page_size(&chip->base);
> > > +       unsigned int ppeb = nanddev_pages_per_eraseblock(&chip->base);
> > > +       unsigned int nb_p_tot = ops->len / p_sz;
> > > +       unsigned int first_eb = DIV_ROUND_DOWN_ULL(to, eb_sz);
> > > +       unsigned int first_p = DIV_ROUND_UP_ULL(to - (first_eb * eb_sz), p_sz);
> > > +       unsigned int nb_eb = DIV_ROUND_UP_ULL(first_p + nb_p_tot, ppeb);
> > > +       unsigned int remaining_p, eb, nb_p;
> > > +       int ret;
> > > +
> > > +       ret = nand_write_oob_nand(chip, to, ops);
> > > +       if (ret || (ops->len != ops->retlen))
> > > +               return ret;
> > > +
> > > +       /* Mark the last pages of the first erase block to write */
> > > +       nb_p = min(nb_p_tot, ppeb - first_p);
> > > +       micron->writtenp[first_eb] |= GENMASK(first_p + nb_p, first_p) &
> > > +                                     MICRON_PAGE_MASK_TRIGGER;
> > > +       remaining_p = nb_p_tot - nb_p;
> > > +
> > > +       /* Mark all the pages of all "in-the-middle" erase blocks */
> > > +       for (eb = first_eb + 1; eb < first_eb + nb_eb - 1; eb++) {
> > > +               micron->writtenp[eb] |= MICRON_PAGE_MASK_TRIGGER;
> > > +               remaining_p -= ppeb;
> > > +       }
> > > +
> > > +       /* Mark the first pages of the last erase block to write */
> > > +       if (remaining_p)
> > > +               micron->writtenp[eb] |= GENMASK(remaining_p - 1, 0) &
> > > +                                       MICRON_PAGE_MASK_TRIGGER;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static bool micron_nand_with_shallow_erase_issue(struct nand_chip *chip)
> > > +{
> > > +       /*
> > > +        * The shallow erase issue has been observed with MT29F*G*A
> > > +        * parts but Micron suspects that the issue can happen with
> > > +        * almost all recent SLC but at such a low probability that it
> > > +        * is almost invisible. Nevertheless, as we mitigate the
> > > +        * performance penalty at runtime by following the number of
> > > +        * written pages in a block before erasing it, we may want to
> > > +        * enable this fix by default.
> > > +        */
> > > +       return nand_is_slc(chip);
> > > +}
> >
> >
> > Whoa, let's hold our horses here!  "almost all recent" would imply
> > that older SLCs aren't affected. And the likelyhood that Micron will
> > fix newer parts is high - because why  would they leave in a major bug
> > like that in the next mask? So, what you're saying is when someone
> > goes to upgrade their older device's Linux they're going to take a
> > major filesystem performance hit without knowing it (because
> > realistically who reads 10,000s of patches before upgrading) when
> > their chip doesn't need it. Because we're too lazy to get the list
> > from Micron and code that ugliness?
>
> Well, that's where I strongly disagree. I know about this for
> almost three years now. It took us this time to figure out:
> 1- what is impacted
> 2- why
> 3- what could work-around it
>
> As you can see, we failed in #1 and trust me, we tried. By e-mail,
> IRC, IRL. We tried hard. Bean and Zoltan in copy know about the
> issue and they tried to minimize and hide it as much as they could,
> lying shamelessly to us several times. Please do not call this
> laziness.
>


I apologize.  And to clarify - I am not calling you (nor Boris, nor
the MTD community) lazy. As a long-time member of this list, I know
that's far from the case. Maybe more in this case Micron deserves to
be called lazy now that I understand the history. Though that I know
is an oversimplification too. In any case, perhaps _I_ was lazy with
my phrasing and by not looking up the history here.

Again, I apologize.

> > We put this in and the resulting discussions for embedded systems
> > designers for the next decade are going to be one of two things:
> > * Oh, you want to use that SLC NAND from Micron? Well then don't use
> > Linux because it performs crappy on Micron SLC NANDs.
> > OR
> > * Oh, you want to use Linux? Well, don't use a Micron SLC NAND then
> > because they perform crappy on Linux.
> >
> > Let's get a list of all chip that have this bug (and let's be clear -
> > it's a bug, not a "quirk") and enable it for those chips specifically.
> > Even better if there was something in the chipinfo itself that made it
> > obvious which ones had the problem (because realistically it's
> > probably specific to a particular geometry). In any case, it's in the
> > best interest of Micron to identify to us exactly which chips have or
> > are likely to have this issue and for us to be specific on which get
> > assigned this quirk. It is probably listed in an errata app-note, and
> > if not it should be.
> >
> > Strong NAK to defaulting all Micron SLC NANDs to this - unless it
> > truly is the case that _all_ Micron SLC NANDs in the past and in the
> > future likely have this problem.
>

From your description then, there's enough denial in Micron within
Micron that my statement does apply - that at least all future Micron
parts will have this problem. Simple logic -> if engineering won't
admit there is a problem, they're not going to get funding to fix the
problem. And it's not just going to go away in the next part, because
we all know that new part designs usually start by borrowing the old
part design and since you can't admit there's an issue it's likely the
problem will come along in the next part.

> I am open to alternatives.
>

This may sound extreme, but if the point here is to force the
manufacturer to give us the information that is required to support
their devices, I'd even suggest we pull the support and either drop
the driver entirely, move it to staging, or some other extremely
obvious move that says, "we are unable to properly support this
without the manufacturers help and the manufacturer doesn't care about
it's customers." Personally, when I upgrade my kernel, I want the
kernel to SHOUT to me that there's a problem with this driver rather
than have a performance issue that I might spend the next six months
trying to figure out why.

When I start a new project, one of the first things I do is check to
see if the parts that we want to use are supported by Linux. I'd like
it when I check if a Micron SLC NAND part is supported that it is
clear there's a big issue with that part. It showing up in staging
instead in the main tree would be a clear signal.

A message to Micron and other chip vendors:  Do not attempt to hide
your bugs, we will find out and hiding this stuff simply pisses us
off. Bugs happen, we get it, expect it, and can work around or fix
them. Responsible companies do not dismiss their users and will
quickly and actively investigate reported problems and then disclose
via errata. This used to be common, even as little as 10 or 20 years
ago - there was rarely a chip that I'd use that didn't have a few
errata documents associated with it. Now, good luck getting them (even
if you can get a datasheet).

We in the embedded Linux community want to work with the vendors to
get good solid upstream support. And vendors, seriously, why the hell
are you resisting it? You've got a large number of people not on your
payroll that are invested in spending time in making you succeed
because it makes things better for them too. And note the use of the
word "upstream" - I no longer use vendor drivers. They're generally of
horribly low quality and either make me stuck on a particular 8 year
old kernel or require me to rewrite them for current versions anyway.

Tomorrow I'm calling my CMs and will start the process to remove
Micron as an approved vendor and will start qualifying alternatives.
While AFAIK (and I intend to find out for sure), we don't have a
problem with the parts we've been using, I don't want to work with a
company that is technically dishonest like Micron.

To Miquel - I appreciate your work in finding and working around the
issue.  And I appreciate the pragmatic approach to fixing it.  But
perhaps it's time to say enough is enough.

I withdraw my NAK (for what it's worth), but can we find something to
very clearly mark "you may be using a broken device, but we don't know
because Micro won't tell us and so we've conservitavely setup a
workaround for all devices that affects performance"?

I'll suggest several alternative things, from most forceful to least:
1. Drop the driver.
2. Move the driver to staging.
3. Make it a kconfig option that is on by default, with strong wording
along the way of "if you know you're using a device without this
problem, you can turn this off".
4. Shove a printk of warning level in there so it's clear in the logs
for those of use who look at the logs when we upgrade.
5. Keep it on by default, and add a white-list of known devices that
are OK to not use it. Add a big comment of why (which is there) and
instructions of how to test if your device has the problem and that if
you test and know it's clean how to send a patch to add to the
whitelist.

At a minimum, I'd like to see a combo of #3 and #4.

Thanks,
- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
