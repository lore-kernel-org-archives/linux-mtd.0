Return-Path: <SRS0=Oj4s=2C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62021C43603
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Dec 2019 04:13:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33EC122B48
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Dec 2019 04:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UH+7oJkI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="Jn2y5o/G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33EC122B48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHeo0M/DXoVUN7tZG80z5KVp6LMhYpKp4iXsmv7pzW4=; b=UH+7oJkI7vHEUm
	Hn8Z6hSbt0UojpFOPJO0gZQch3AsTHfvlgzF4z4CwyVnj+2jNM1WZO/Ja8/wKDGhSG/vcx6qkxqOr
	WUXoU/R/LK0dV+5j5tkjI8yELJ4EFUFHKZnjK6Ptu5arB3IGjmxwFtn84redGT1hpsC+37OLl1msW
	J6cbq3K79ZQHGudIN+nI+hICiZHgPb6MzMj4mb7NCe8G6Bryfg28UGJgDLLleCSTLvoquFXoijwlV
	74LiXAhp1KjC+biIY3iGU/LWbZX0ZbKZ9+w22YdH2t85Zhk3H36GlAmol0S1jem7+SgpvuswErKwQ
	vL+LfKSeLEL3hvPjt84Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifFqs-0001F1-3r; Thu, 12 Dec 2019 04:13:22 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifFqn-0001EJ-DF
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2019 04:13:19 +0000
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id xBC4D0Fx027412
 for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2019 13:13:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com xBC4D0Fx027412
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1576123981;
 bh=OLE39NHHlB0QIu9dLR7E2Ssfa4ekHz3DTsIqmneEYDY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Jn2y5o/GvRSD1fyW2ph0l6L+KyIi0YOiaRxvKiF9TUCrPMSKMjgjjfpmogptgH6QV
 p6Icq7BIiMJssUSyJPQYRRYv65r2ILAg+ZajOceyWfp1XiN3y0ZRFxJi042fCDZC2K
 S78zr5bTRAxS2lAjWBZKdTTwN/A7xgoOc0sXWSsCQBZr9H2f9IGUrdNgZHA2TkMCWA
 uK0lyBCaY29beL0RD17a84yRoVVWEi8r/PC+03xcpAkVuKfq14DogfLNTk0jy6w2yD
 6ea0/XArYItn3phvH9QnUnk1OFswOmnDeLt6N8TfoqilvVkbnDpaDRdZlJ+m4WHol6
 2TjTL+WgGtJvw==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id x18so639665vsq.4
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2019 20:13:01 -0800 (PST)
X-Gm-Message-State: APjAAAV+UUg4IGkCkcJRSZS+zXWmO0ysZEDY8w8eG3pifQhfFoNSvDm3
 ulepX+IM3igVQGQ9CtPQK2CL6UCY2bDHPInbRoo=
X-Google-Smtp-Source: APXvYqzqUFulXneRuZ2aoR4z8w5J/cvcJnExgLVtCVbc9ik4emkLaF1M3yZru+Kvfls87OUju1hWXC+Z7+o3BPYj3pw=
X-Received: by 2002:a67:7904:: with SMTP id u4mr3205130vsc.155.1576123979998; 
 Wed, 11 Dec 2019 20:12:59 -0800 (PST)
MIME-Version: 1.0
References: <20191207004855.11334-1-marex@denx.de>
 <CAK7LNAQsejXuwAZ6G5=G88GMj6P10bFkBwr4czL_BXkONSHsGw@mail.gmail.com>
 <ffdfa74a-f3cf-1c8a-4917-dabf7d8fc393@denx.de>
 <CAK7LNAR=y0hTFYzNodPr9LvGad76V7MeMfsX+58s+zCERx6Y-A@mail.gmail.com>
 <c611d4ab-443d-1041-9301-6129fb3fcf81@denx.de>
 <CAK7LNATYCvjqzctz+e-7Phh2No31xY891vK3e26c4OQLLdjKUA@mail.gmail.com>
 <3f8417b7-56c4-8bf8-6c5b-99b4eb599e38@denx.de>
In-Reply-To: <3f8417b7-56c4-8bf8-6c5b-99b4eb599e38@denx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 Dec 2019 13:12:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQAzrKBF1UM5Eenx52Oxp4vnVBMK1KKKaLBAXik-ojhbQ@mail.gmail.com>
Message-ID: <CAK7LNAQAzrKBF1UM5Eenx52Oxp4vnVBMK1KKKaLBAXik-ojhbQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: Add support for configuring
 SPARE_AREA_SKIP_BYTES
To: Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_201317_672025_E9DFA35F 
X-CRM114-Status: GOOD (  30.45  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Dec 12, 2019 at 10:06 AM Marek Vasut <marex@denx.de> wrote:
>
> On 12/10/19 7:30 AM, Masahiro Yamada wrote:
> > On Tue, Dec 10, 2019 at 12:35 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 12/10/19 4:15 AM, Masahiro Yamada wrote:
> >>> On Mon, Dec 9, 2019 at 9:57 PM Marek Vasut <marex@denx.de> wrote:
> >>>>
> >>>> On 12/9/19 6:38 AM, Masahiro Yamada wrote:
> >>>> [...]
> >>>>
> >>>>>> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> >>>>>> index 3102ddbd8abdb..b6c463d021677 100644
> >>>>>> --- a/drivers/mtd/nand/raw/denali.c
> >>>>>> +++ b/drivers/mtd/nand/raw/denali.c
> >>>>>> @@ -1302,14 +1302,21 @@ int denali_init(struct denali_controller *denali)
> >>>>>>
> >>>>>>         /*
> >>>>>>          * Set how many bytes should be skipped before writing data in OOB.
> >>>>>> +        * If a non-zero value has already been configured, update it in HW.
> >>>>>>          * If a non-zero value has already been set (by firmware or something),
> >>>>>>          * just use it. Otherwise, set the driver's default.
> >>>>>>          */
> >>>>>> -       denali->oob_skip_bytes = ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> >>>>>> -       if (!denali->oob_skip_bytes) {
> >>>>>> -               denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
> >>>>>> +       if (denali->oob_skip_bytes) {
> >>>>>>                 iowrite32(denali->oob_skip_bytes,
> >>>>>>                           denali->reg + SPARE_AREA_SKIP_BYTES);
> >>>>>> +       } else {
> >>>>>> +               denali->oob_skip_bytes =
> >>>>>> +                       ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> >>>>>> +               if (!denali->oob_skip_bytes) {
> >>>>>> +                       denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
> >>>>>> +                       iowrite32(denali->oob_skip_bytes,
> >>>>>> +                                 denali->reg + SPARE_AREA_SKIP_BYTES);
> >>>>>
> >>>>> This fallback is ugly, and should be removed, I think.
> >>>>> It is only reachable by PCI platform (Intel MRST), where
> >>>>> DENALI_DEFAULT_OOB_SKIP_BYTES is probably useless.
> >>>>
> >>>> This fallback retains the original behavior on all platforms. It might
> >>>> not be to your liking, but it does not break other platforms while
> >>>> fixing SoCFPGA. We don't know what other platforms might be depending on
> >>>> this behavior, do we ?
> >>>
> >>>      if (denali->oob_skip_bytes) {
> >>>                  iowrite32(denali->oob_skip_bytes,
> >>>                                  denali->reg + SPARE_AREA_SKIP_BYTES);
> >>>      else
> >>>                 denali->oob_skip_bytes =
> >>>                                  ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> >>>
> >>>
> >>> ... retains the original behavior.
> >>
> >> It does not, because if the readback in the else branch sets
> >> oob_skip_bytes to 0, the controller is not updated with the default value.
> >>
> >>> For denali_dt.c, it now explicitly sets SPARE_AREA_SKIP_BYTES
> >>> to the well-defined value.
> >>>
> >>> denali_pci.c is the only platform that can read back the
> >>> register value.
> >>>
> >>> See, how Intel originally wrote the code.
> >>>
> >>> https://github.com/torvalds/linux/blob/v3.0/drivers/mtd/nand/denali.c#L1345
> >>>
> >>>
> >>> Please notice the part "if this value is 0, just let it be."
> >>> The Intel MRST platform happily accepts
> >>> SPARE_AREA_SKIP_BYTES being set to 0.
> >>>
> >>> I am not sure how many people are using this platform,
> >>> but anyway it is how it has worked for a long time.
> >>
> >> The intel platform might accept 0 happily, but that's not how the
> >> controller was configured for a long time.
> >
> > It is.
> > It worked like that for 9 years. (i.e. v2.6.35 - v4.19)
>
> So it is broken now ?

I do not know.
As I already said, there is no perfect solution about what
to do when SPARE_AREA_SKIP_BYTES is zero.

I received various feedback from SOCFPGA board users
about this driver, but nothing from denali_pci platfrom users.
Absolutely zero question/complaint.

I suspect there is no user of that platform, but who knows.


> If so, then that fix is for another patch.

So, do you want me to get back the original behavior,
then you want to send a new patch based on that?

I think it is a waste of time, but
it would be less worse than continuing this thread.



> >> So if I were to change the
> >> code as you suggest, it would likely break some setups.
> >
> > There is no perfect solution here
> > when SPARE_AREA_SKIP_BYTES was set to 0
> > before booting the kernel.
> >
> > [A] Keep SPARE_AREA_SKIP_BYTES as it is.
> >      This might affect the factory-recorded BBM,
> >      but it should at least work if the firmware or the boot-loader
> >      has set up the controller this way.
> >
> > [B] Override SPARE_AREA_SKIP_BYTES with
> >       a different value (8).
> >       This can keep the factory-based BBM, but
> >      this is very unlikely to work across software stages
> >      if the NAND device was formatted by the firmware or
> >      the boot-loader.
> >
> >
> > We need to give up something.
> > [A] was the original, 9 years' default, and cleaner.
>
> Or maybe
>
> commit 0d55c668b218a1db68b5044bce4de74e1bd0f0c8
>     mtd: rawnand: denali: set SPARE_AREA_SKIP_BYTES register to 8 if unset
>
> should be reverted, since it changed the behavior ?
>
> [...]



-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
