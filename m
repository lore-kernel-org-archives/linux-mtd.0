Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26A7C33CB1
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 15:07:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD5F12072B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 15:07:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IaBrGbgK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tI3tU2nf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD5F12072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=veZz2PCpdDgoZzj4TLp6fCNjkFVj9pKrHUzEwiyU9VI=; b=IaBrGbgKuXXzPw
	LVOgodIbxNm2Z8OUeKAHFzf0bGbUCzfTx/IsAS+ezExXL6jdwj3R0RF2wd4itrqRTzAzQZouw8DAi
	QabHerdFEIElySYrWU0eRErC0pzU9Ja9yFWwNrte0DUNpWTalqgKZgYMcIiBxlhKI8SwUX4vt3/nK
	puzmOFvWlkhEh95NpFkIxo+NEjziS7VrSs9sze+pNzdhwZPD7FY/gYloRV1YlLMnfnA3Gly32JjJO
	d4GGWK4Cz/s8fRzAAXPkp7+nW9/TBb1YgyR/6JyuVY2InV59IBvDVqhQIMW7b5jIkCe/yTGXyyWl8
	T/16z5Rb0XuMre7ETC+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isTD2-000408-3B; Fri, 17 Jan 2020 15:06:52 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isTCw-0003zS-CA
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 15:06:50 +0000
Received: by mail-lf1-x143.google.com with SMTP id l18so18599690lfc.1
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jan 2020 07:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ex1M61+/ffbYaNI5gQYDDv6f7wmT3RL9xL/S7KKNQ5A=;
 b=tI3tU2nfPnhXVEZLgZ4v3sNTnOs2CkL/bEhO2TeoNCfrJiCZ4+Vy/OCJNtGpPF9xkm
 nh1QuiQ8VEj+iJhYQnmnH2hfIaXpJZ/iuMIB9Y0450Rg4b0eLzxx63xXpTvrrS7RPGq/
 oUyY1R74DamTJTS8ZCXxiCQ4+VCHrB0gGIRWXyl15g7r8e80lnkTKWw7AJ5IbOvnxdI/
 O04gYPEx+gskMpNNxXWl3nvytFy4eFm9W8dkx5i8C/SkemVeDZWc5u5L5BD+XFJL2+il
 QbQJXlcXFbsWbmK47j0XfsBuliIU7DjfpSKe35pVFu4AShosrltCpfRVN5FHwQci9C/0
 m9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ex1M61+/ffbYaNI5gQYDDv6f7wmT3RL9xL/S7KKNQ5A=;
 b=naAv7LcriUQw2B0pQ2TPc5nL7IQD1QZM/wvaNWfFMBy2XPkhFH29TLrFpJn35THfUJ
 ZMx/YllaOUM5bvSUPIgrCKewQjMWEoTHSYXI4rHfRwAMfpx0mKUFbz1/U+PMhA2ZRTbZ
 fkH+CE3Jj0uiw3klYzWI6jAT699msLXfXgee5EkfBDxIHzIG9W9wb4IsUcoUr61f3Cmq
 SwxgdnekuIC/vNmRiixR5HW4rNBYmMW+q569uqWCXanGEB4v7U0mYI9GBAUM3XUPVyaB
 ACPncn/ohaUY3MEyAS726vmrg2/9TR/sIX1w1+y1eKl74BOa6DCudJ0vWAeUzi3iop6B
 UFYw==
X-Gm-Message-State: APjAAAUNNA26mVqjK03iXu0LK+FvpBoVqxYn3FjmZq++2U3pSvrTsKty
 +rr4exPUBaeJuo/S4yrSJS1v+BUykXP/BdKaPpw=
X-Google-Smtp-Source: APXvYqxuaI1V047YqwhMN7GEJYzwgdA2r4paZGTZGevMfeR4PAZo2S0KMTaTlPdR7A5nR/7xKbC9B4YW7llRAoUfPX4=
X-Received: by 2002:a19:ae04:: with SMTP id f4mr5617721lfc.64.1579273604115;
 Fri, 17 Jan 2020 07:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CGME20200113055910epcas1p377b2618bea2ca860acac2b6f34e2b83e@epcas1p3.samsung.com>
 <20200113055907.9029-2-js07.lee@samsung.com>
 <3703036.Ns4Yp6NO8s@localhost.localdomain>
In-Reply-To: <3703036.Ns4Yp6NO8s@localhost.localdomain>
From: Jungseung Lee <js07.lee@gmail.com>
Date: Sat, 18 Jan 2020 00:06:32 +0900
Message-ID: <CAPP0e=NMzizy=fEZi4nWzo9GAJOpB2Qwv7ReK7HDvrGKUv+VEw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_070646_444461_7472FD5E 
X-CRM114-Status: GOOD (  21.97  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com,
 Jungseung Lee <js07.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Tudor,

On Tue, Jan 14, 2020 at 7:49 PM <Tudor.Ambarus@microchip.com> wrote:
>
> Hi, Jungseung,
>
> Thanks for working on this.
>
> On Monday, January 13, 2020 7:59:06 AM EET Jungseung Lee wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > content is safe
> >
> > Currently, we are supporting block protection only for
> > flash chips with 3 block protection bits in the SR register.
> > This patch enables block protection support for some flash with
> > 4 block protection bits(bp0-3).
>
> Some? Isn't this generic for all the flashes that support BP0-3?
>

This one would be a generic solution to support BP0-3 on Status Register.
From my study, this covers all the flashes listed on spi-nor.c that
have BP0-3 bit on SR.
It looks like I have to change this description.

Note that it is NOT for some flashes that have BP0-3 in another register.
As you know, just like SPI_NOR_HAS_TB did.

> >
> > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> > ---
> > v3 :
> >   Fix wrong ofs calculation on v2 patch
> > v2 :
> >   Add sample table portion about 4bit block protection on the comment
> >   Trivial coding style change
> >
> >  drivers/mtd/spi-nor/spi-nor.c | 127 +++++++++++++++++++++++++++++-----
> >  include/linux/mtd/spi-nor.h   |   8 +++
> >  2 files changed, 119 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index e3da6a8654a8..7e8af6c4fdfa 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -238,6 +238,14 @@ struct flash_info {
> >                                          * status register. Must be used
> > with * SPI_NOR_HAS_TB.
> >                                          */
> > +#define SPI_NOR_HAS_BP3                BIT(17) /*
> > +                                        * Flash SR has 4 bit fields (BP0-3)
> > +                                        * for block protection.
> > +                                        */
> > +#define SPI_NOR_BP3_SR_BIT6    BIT(18) /*
> > +                                        * BP3 is bit 6 of status register.
> > +                                        * Must be used with
>
> Are we safe to replace SPI_NOR_TB_SR_BIT6 and SPI_NOR_BP3_SR_BIT6 with a
> SPI_NOR_SR_TB_BIT6_BP3_BIT5? Or maybe with a SPI_NOR_SR_BP3_BIT6_TB_BIT5, how
> is more convenient?
>

Let's think about some flash in which BP0-3 exists in the status
register but TB exists in another register.
for example, mx25u12835f.
I haven't tested yet, but according to the datasheet, I think this
patch can support 4bit block protection for the flash.

In order to embrace the case, how about letting them as It is.
Is there any suggestion?

> Cheers,
> ta
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
