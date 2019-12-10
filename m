Return-Path: <SRS0=XIAy=2A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC882C43603
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 06:32:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD8C020637
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 06:32:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W/rZVnLj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="CdAoHVgG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD8C020637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxnuZ/dRe6y99s0o4R5zP5Vmo1nQb8gz/0zm29o8I9A=; b=W/rZVnLja3GW3z
	snXFDW+QAx+HlhQUfZj2KgOdm3kowe17ZbBZl0h7EqAJ+tmPIl+IvE4+v5PAKKhYHPAyiLP1xiL5A
	wUrN7kD6r28RW1PiIonCuzJnfJnmNVKzl+vRbyAkrCyKvxi1HZcOTe3lSdV16PKW5YNFw5cEJ9NqU
	lY2r9KSVreP2YYCvEHsNSRCiMQRafe4CMpCjTI8Wc3VtSYSkHN6IwekKoxxNEK8gKtwr1YE+lrh6P
	vJiZdS9i/TlVP6xWU8EstpJydEiygXq8BpXpSxEhXofjsx1CxHNFWAJMDyMdwR722fpIBpY6ojWob
	CwEVQ1ezjOaCuHINqirA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieZ3z-0002w5-2E; Tue, 10 Dec 2019 06:32:03 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieZ3t-0002vS-2f
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2019 06:31:59 +0000
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id xBA6VOJB022181
 for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2019 15:31:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com xBA6VOJB022181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1575959485;
 bh=KiVbgua1M5ZOAiAM8WMvr7U/TWImzK3O6KVwCmw57cc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CdAoHVgGv8/7f6E0dRS/AOoRIpLtrnlEyinSiBXMng4aPjgegNXXr26nPt1uvUk2P
 mIJXAxQ0j6ybTHBYuuZ0GVIXJtAP4RpQb9Et9cc9sZwAkwyc6CXhTq8tExku3vb3UJ
 K7jAJpVLQNdtwdzVSNVrx0L4EGnc3mi61hzOIzITkW/+qIDoC7Uf7RLsIho0WQnpBD
 exlWBZNPOwa5pUq8C5Lwskj/XmpoFcwWN2ILtKMGSqBg1hQ/JKsNpIDR1iz/J9euyN
 3GL5qOWmWEoBE8KQQQgpvph4i8IKQ/3Ur23GShtlddWfJcHPFgKRYjf4QDZicdaHEy
 hq2GQZr+ijJfQ==
X-Nifty-SrcIP: [209.85.221.176]
Received: by mail-vk1-f176.google.com with SMTP id u123so5252218vkb.9
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2019 22:31:25 -0800 (PST)
X-Gm-Message-State: APjAAAUndzGShkDQMVAQxCoFuF6XWuYsAxBPKIKk6vdCW2k7Qs3Zsh0V
 dWqowW9sFoSBfODQgvb2PXwFFl7Q1zAIVQ681+A=
X-Google-Smtp-Source: APXvYqx5U3zbH9eCKv1DCbEBU57NGui932Pp0MfXFSL9me4hzT+uUeNV4FGzXOrl0riEYmfgN3ugKj6BeznJ17TBQlI=
X-Received: by 2002:a1f:8cd5:: with SMTP id o204mr7667413vkd.66.1575959484106; 
 Mon, 09 Dec 2019 22:31:24 -0800 (PST)
MIME-Version: 1.0
References: <20191207004855.11334-1-marex@denx.de>
 <CAK7LNAQsejXuwAZ6G5=G88GMj6P10bFkBwr4czL_BXkONSHsGw@mail.gmail.com>
 <ffdfa74a-f3cf-1c8a-4917-dabf7d8fc393@denx.de>
 <CAK7LNAR=y0hTFYzNodPr9LvGad76V7MeMfsX+58s+zCERx6Y-A@mail.gmail.com>
 <c611d4ab-443d-1041-9301-6129fb3fcf81@denx.de>
In-Reply-To: <c611d4ab-443d-1041-9301-6129fb3fcf81@denx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Dec 2019 15:30:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNATYCvjqzctz+e-7Phh2No31xY891vK3e26c4OQLLdjKUA@mail.gmail.com>
Message-ID: <CAK7LNATYCvjqzctz+e-7Phh2No31xY891vK3e26c4OQLLdjKUA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: Add support for configuring
 SPARE_AREA_SKIP_BYTES
To: Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_223157_457847_A1B16C79 
X-CRM114-Status: GOOD (  32.35  )
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

On Tue, Dec 10, 2019 at 12:35 PM Marek Vasut <marex@denx.de> wrote:
>
> On 12/10/19 4:15 AM, Masahiro Yamada wrote:
> > On Mon, Dec 9, 2019 at 9:57 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 12/9/19 6:38 AM, Masahiro Yamada wrote:
> >> [...]
> >>
> >>>> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> >>>> index 3102ddbd8abdb..b6c463d021677 100644
> >>>> --- a/drivers/mtd/nand/raw/denali.c
> >>>> +++ b/drivers/mtd/nand/raw/denali.c
> >>>> @@ -1302,14 +1302,21 @@ int denali_init(struct denali_controller *denali)
> >>>>
> >>>>         /*
> >>>>          * Set how many bytes should be skipped before writing data in OOB.
> >>>> +        * If a non-zero value has already been configured, update it in HW.
> >>>>          * If a non-zero value has already been set (by firmware or something),
> >>>>          * just use it. Otherwise, set the driver's default.
> >>>>          */
> >>>> -       denali->oob_skip_bytes = ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> >>>> -       if (!denali->oob_skip_bytes) {
> >>>> -               denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
> >>>> +       if (denali->oob_skip_bytes) {
> >>>>                 iowrite32(denali->oob_skip_bytes,
> >>>>                           denali->reg + SPARE_AREA_SKIP_BYTES);
> >>>> +       } else {
> >>>> +               denali->oob_skip_bytes =
> >>>> +                       ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> >>>> +               if (!denali->oob_skip_bytes) {
> >>>> +                       denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
> >>>> +                       iowrite32(denali->oob_skip_bytes,
> >>>> +                                 denali->reg + SPARE_AREA_SKIP_BYTES);
> >>>
> >>> This fallback is ugly, and should be removed, I think.
> >>> It is only reachable by PCI platform (Intel MRST), where
> >>> DENALI_DEFAULT_OOB_SKIP_BYTES is probably useless.
> >>
> >> This fallback retains the original behavior on all platforms. It might
> >> not be to your liking, but it does not break other platforms while
> >> fixing SoCFPGA. We don't know what other platforms might be depending on
> >> this behavior, do we ?
> >
> >      if (denali->oob_skip_bytes) {
> >                  iowrite32(denali->oob_skip_bytes,
> >                                  denali->reg + SPARE_AREA_SKIP_BYTES);
> >      else
> >                 denali->oob_skip_bytes =
> >                                  ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> >
> >
> > ... retains the original behavior.
>
> It does not, because if the readback in the else branch sets
> oob_skip_bytes to 0, the controller is not updated with the default value.
>
> > For denali_dt.c, it now explicitly sets SPARE_AREA_SKIP_BYTES
> > to the well-defined value.
> >
> > denali_pci.c is the only platform that can read back the
> > register value.
> >
> > See, how Intel originally wrote the code.
> >
> > https://github.com/torvalds/linux/blob/v3.0/drivers/mtd/nand/denali.c#L1345
> >
> >
> > Please notice the part "if this value is 0, just let it be."
> > The Intel MRST platform happily accepts
> > SPARE_AREA_SKIP_BYTES being set to 0.
> >
> > I am not sure how many people are using this platform,
> > but anyway it is how it has worked for a long time.
>
> The intel platform might accept 0 happily, but that's not how the
> controller was configured for a long time.

It is.
It worked like that for 9 years. (i.e. v2.6.35 - v4.19)


> So if I were to change the
> code as you suggest, it would likely break some setups.

There is no perfect solution here
when SPARE_AREA_SKIP_BYTES was set to 0
before booting the kernel.

[A] Keep SPARE_AREA_SKIP_BYTES as it is.
     This might affect the factory-recorded BBM,
     but it should at least work if the firmware or the boot-loader
     has set up the controller this way.

[B] Override SPARE_AREA_SKIP_BYTES with
      a different value (8).
      This can keep the factory-based BBM, but
     this is very unlikely to work across software stages
     if the NAND device was formatted by the firmware or
     the boot-loader.


We need to give up something.
[A] was the original, 9 years' default, and cleaner.




> >>>> @@ -209,6 +213,8 @@ static int denali_dt_probe(struct platform_device *pdev)
> >>>>         denali->clk_rate = clk_get_rate(dt->clk);
> >>>>         denali->clk_x_rate = clk_get_rate(dt->clk_x);
> >>>>
> >>>> +       denali->oob_skip_bytes = data->oob_skip_bytes;
> >>>> +
> >>>
> >>> Please move this to the relevant hunk.
> >>> Preferably, based on this:
> >>> http://patchwork.ozlabs.org/patch/1205912/
> >>
> >> I don't understand what you want me to change ? Shall I rebase this on
> >> top of your patch from today and repost ?
> >
> > Yes.
> >
> > I do not want to scatter the relevant code
> > (coping struct fields) to random places.
> >
> > I want the code to look like this:
> >
> >        denali->revision = data->revision;
> >        denali->caps = data->caps;
> > +     denali->oob_skip_bytes = data->oob_skip_bytes;
> >        denali->ecc_caps = data->ecc_caps;
>
> Maybe you can rebase your patch on top of this one then ? It was posted
> later after all.

Neither is applied yet.
If you have a chance for v2,
it would not be so annoying to move the code
to the relevant place.

If you really do not like rebase,
the second best would be:



        if (data) {
                  denali->revision = data->revision;
                  denali->caps = data->caps;
+                denali->oob_skip_bytes = data->oob_skip_bytes;
                  denali->ecc_caps = data->ecc_caps;
        }

--
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
