Return-Path: <SRS0=XIAy=2A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77066C43603
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 03:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48A5F20726
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 03:17:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A8tkbcmA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="CVxOpdwu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48A5F20726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vB3FqJ4LIPIbs+XKoZIT+A8+BCYLy0GcB1I4bojeKZE=; b=A8tkbcmApCF6As
	JCOZPWaAMODfVP0vRDtG0gUst8NigGP6BSVfJyjwEzP8csyDZtLZTUWfSTtYRUndDemyvX+sVuRo7
	ohh0VMcHz5wT/DCBqzVCFAE74y18UvKbe2zgAKAjEXG6Qh6c7EO4Ith89lOf4ogAhJ6bTndCWxIBZ
	BOiVFgahHCpVUAI0D6adJsvj+cur+nMZmJ5BWA3Gs5AuwOY7mBWzAt6qTmyOAjgkOjIEW6WCWGGUJ
	5NOdBvTvA4JOKu0jAUX5VoLPbxdfMXlR46XY4igEaqDMOg+TE1tfKh+tWoHk+dZXQlxZvb7e5hEe3
	6CSBhaEc+JYFswHa6Z1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieW15-0005dP-HL; Tue, 10 Dec 2019 03:16:51 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieW11-0005cu-9w
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2019 03:16:49 +0000
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id xBA3GP8O006575
 for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2019 12:16:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com xBA3GP8O006575
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1575947786;
 bh=4eTZG/RoLJ/4mbkyhkQkM6g7F7QLlFgMhm72sKyx0b4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CVxOpdwukJ9yvRexsat6IRd2zCC8tsJYyp5Ag4UjDtlPHjLedCsYxzOZeHQ+g/2Za
 3RaTn6PZ7e7E8UY70zSiaccPPPETmYKKbIsNrZM0XvgW6LF2UyKEmnmZXZRwEuwvD+
 6NKDFpsFcUzdbw7DmEPnTjZwAl02H314IzHO4bue1UUFQybzoAqn6HpXPzk7V61qvv
 gIwhZQ9tmMsfNlp4sqXVzOdpCJuKQpfmuodNSel8lsRLcekOoZC+zRxtL7n1EKZIiv
 wgt5jmr9bVmLP6C0oe5gBhKY0MDwxnpHuLlkh/wu+rA6iTEqIUchiNv/mvb1lnBnCZ
 TluvEcuwqfsuA==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id x123so12024778vsc.2
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2019 19:16:25 -0800 (PST)
X-Gm-Message-State: APjAAAU5rp3H1wpV2zdi5qkKyPO7926Tk/c4g5qDymtIOr+sk+LJ4djs
 avwWMOFmPo5XXl8EVEPmSdsv+DSXK+vRJ6nM9cs=
X-Google-Smtp-Source: APXvYqyowJjKtsXbbCpdT15fBtp03ucgDK1p+A1FPHemv7UaDl8fhXgS73Q9tu3KA+aH/1UdYGNWmz5U7z7e/U2TceM=
X-Received: by 2002:a67:30c3:: with SMTP id
 w186mr22777535vsw.179.1575947784682; 
 Mon, 09 Dec 2019 19:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20191207004855.11334-1-marex@denx.de>
 <CAK7LNAQsejXuwAZ6G5=G88GMj6P10bFkBwr4czL_BXkONSHsGw@mail.gmail.com>
 <ffdfa74a-f3cf-1c8a-4917-dabf7d8fc393@denx.de>
In-Reply-To: <ffdfa74a-f3cf-1c8a-4917-dabf7d8fc393@denx.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Dec 2019 12:15:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=y0hTFYzNodPr9LvGad76V7MeMfsX+58s+zCERx6Y-A@mail.gmail.com>
Message-ID: <CAK7LNAR=y0hTFYzNodPr9LvGad76V7MeMfsX+58s+zCERx6Y-A@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: Add support for configuring
 SPARE_AREA_SKIP_BYTES
To: Marek Vasut <marex@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_191647_986643_0594D880 
X-CRM114-Status: GOOD (  21.75  )
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

On Mon, Dec 9, 2019 at 9:57 PM Marek Vasut <marex@denx.de> wrote:
>
> On 12/9/19 6:38 AM, Masahiro Yamada wrote:
> [...]
>
> >> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> >> index 3102ddbd8abdb..b6c463d021677 100644
> >> --- a/drivers/mtd/nand/raw/denali.c
> >> +++ b/drivers/mtd/nand/raw/denali.c
> >> @@ -1302,14 +1302,21 @@ int denali_init(struct denali_controller *denali)
> >>
> >>         /*
> >>          * Set how many bytes should be skipped before writing data in OOB.
> >> +        * If a non-zero value has already been configured, update it in HW.
> >>          * If a non-zero value has already been set (by firmware or something),
> >>          * just use it. Otherwise, set the driver's default.
> >>          */
> >> -       denali->oob_skip_bytes = ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> >> -       if (!denali->oob_skip_bytes) {
> >> -               denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
> >> +       if (denali->oob_skip_bytes) {
> >>                 iowrite32(denali->oob_skip_bytes,
> >>                           denali->reg + SPARE_AREA_SKIP_BYTES);
> >> +       } else {
> >> +               denali->oob_skip_bytes =
> >> +                       ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> >> +               if (!denali->oob_skip_bytes) {
> >> +                       denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
> >> +                       iowrite32(denali->oob_skip_bytes,
> >> +                                 denali->reg + SPARE_AREA_SKIP_BYTES);
> >
> > This fallback is ugly, and should be removed, I think.
> > It is only reachable by PCI platform (Intel MRST), where
> > DENALI_DEFAULT_OOB_SKIP_BYTES is probably useless.
>
> This fallback retains the original behavior on all platforms. It might
> not be to your liking, but it does not break other platforms while
> fixing SoCFPGA. We don't know what other platforms might be depending on
> this behavior, do we ?

     if (denali->oob_skip_bytes) {
                 iowrite32(denali->oob_skip_bytes,
                                 denali->reg + SPARE_AREA_SKIP_BYTES);
     else
                denali->oob_skip_bytes =
                                 ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);


... retains the original behavior.


For denali_dt.c, it now explicitly sets SPARE_AREA_SKIP_BYTES
to the well-defined value.

denali_pci.c is the only platform that can read back the
register value.

See, how Intel originally wrote the code.

https://github.com/torvalds/linux/blob/v3.0/drivers/mtd/nand/denali.c#L1345


Please notice the part "if this value is 0, just let it be."
The Intel MRST platform happily accepts
SPARE_AREA_SKIP_BYTES being set to 0.

I am not sure how many people are using this platform,
but anyway it is how it has worked for a long time.





> >> @@ -209,6 +213,8 @@ static int denali_dt_probe(struct platform_device *pdev)
> >>         denali->clk_rate = clk_get_rate(dt->clk);
> >>         denali->clk_x_rate = clk_get_rate(dt->clk_x);
> >>
> >> +       denali->oob_skip_bytes = data->oob_skip_bytes;
> >> +
> >
> > Please move this to the relevant hunk.
> > Preferably, based on this:
> > http://patchwork.ozlabs.org/patch/1205912/
>
> I don't understand what you want me to change ? Shall I rebase this on
> top of your patch from today and repost ?

Yes.

I do not want to scatter the relevant code
(coping struct fields) to random places.

I want the code to look like this:

       denali->revision = data->revision;
       denali->caps = data->caps;
+     denali->oob_skip_bytes = data->oob_skip_bytes;
       denali->ecc_caps = data->ecc_caps;


-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
