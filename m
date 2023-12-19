Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C86C41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbXo225KJcvjZfaAA9rHMdTKjeTSdYXfBn5+B5L+8qA=; b=NWsYu7VUWLity6
	uXS611Wg8FObDAYQkiTXo0C7mu1mIveidX2AWtJa3NF+DZHfHCgr8PH1BfV3LcvInT10xu97Tst2W
	pVXgo9dRLS0NzVUJEW+xJQYVFZjYg7lhvyPrwE9egspIgDttZjyOpNFJxsKhp0oZuLhKuByR7T9R9
	sERLR12sTY2mF0KU5jGPAWmOkVRQmXuGRIcXhPwgXDQ+wcRysKRdOvzwogxfZtH3aF2TY+7RSHpbL
	lLp118Q2mBwEKU+5nCsFiXw9uNISQ83x3e1tEmojHj6MuOi50FqAumxN5twUEs4ceoLL3xvC0hyLr
	YbVo+UU21lJFo6cs16PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFWGh-00DQjH-1A;
	Tue, 19 Dec 2023 09:20:03 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFWGe-00DQhq-1U
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 09:20:01 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso85477a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 19 Dec 2023 01:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702977599; x=1703582399; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WooPgJy8IlUdpu4QpWsE5/7f4HUoOKIo4bVhGI6tok0=;
        b=D86HG8GF6IeXMVjwZV7rkqD4UwZXpBK2MeXWeWGUKujD0HMbhrH0X3NpOGZR+y4CcH
         xrUEOUOyssauBSuyjedmCt8XWFUMgTxdWELT+PPzTDVOvAOoKVTvWQfoaIlx/FBLs9GS
         y3BvCC+0RPIc0iLKN/8TOhGZoag13qYUEB5uYj3PnryrZdv8d/G+4ACid4jOV12uFd5F
         OC6rv6fF9YXRyDH4Ro/mGxny8XyOCW/iwC5sMId1TDkQvNIrmpWlA4ceOqlte74vi+Vy
         sC5xxl1YslqnfbUQ6qnl+SMAz+oqMceA9JfxQ9EWi1GRwXQyjLlM276U1NoJ/DMqNeZK
         g7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702977599; x=1703582399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WooPgJy8IlUdpu4QpWsE5/7f4HUoOKIo4bVhGI6tok0=;
        b=XQM7hMjx4qr+njYp40j3V4X8VTfoBC3xRZhDuNttlJV8K/EygIJv1eiIm/pNC1sUKP
         6EgKQxuK6qCykCExOQA/aFtVrG8zEhE7UR6EZYElg4DyzhaGOSoaWP8tKzfPGMwKKnsV
         xOlM+SSQTGcv01BFq/pjGYloiF5Hg0jnvBt1/9aNkEFXKR0CMU09fB2yQixxmYnxjumI
         93IuNLjUcF6vR1DOZFXLpAZxfbWrkUr4kFg3eagTGdItfOrR13tewcOoYdkFBGs6OX7D
         W6vQaucrMVT3Fc42gNADPUlZkwannMWS+FLECpO+C+NXhuRzdS4LcjNu3evdWnwql8/0
         beig==
X-Gm-Message-State: AOJu0Yyw/X55HL1elwJygWXJHIdPoT3QDk3uYV+DCZe1yloHe8gTdlxX
	v1XtOyo3bIqrcMex550QGxAaxnfma6Wi9Fk4yBE=
X-Google-Smtp-Source: AGHT+IHXxq4PknSbVnzrIsHrgEh3h1J2E1EckEPvRhMh4CarpHkkqsBl4ZcEfBBg41/oFvyThxS4rsC5pA/YqncN81k=
X-Received: by 2002:a05:6a21:6da1:b0:190:86b:ccf2 with SMTP id
 wl33-20020a056a216da100b00190086bccf2mr10428020pzb.59.1702977598918; Tue, 19
 Dec 2023 01:19:58 -0800 (PST)
MIME-Version: 1.0
References: <20231215073413.71443-1-jaimeliao.tw@gmail.com> <6eeb2dbb4f0ee4e0c8bfe381aa28ef3f@walle.cc>
In-Reply-To: <6eeb2dbb4f0ee4e0c8bfe381aa28ef3f@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 19 Dec 2023 17:19:35 +0800
Message-ID: <CAAQoYRnUf-_ukx1wjAiYoR88kfSJ6+0s3pgS2E56+o3QUOqORg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Discard HW capabilities if no enable function
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_012000_504715_61CF98F4 
X-CRM114-Status: GOOD (  22.41  )
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

Hi Michael

>
> Hi,
>
> > Discard corresponding HW capabilities to prevent carrying the
> > wrong protocol if no QUAD/Octal DTR enable function hooked.
> >
> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> > ---
> >  drivers/mtd/spi-nor/core.c  | 13 +++++++------
> >  include/linux/mtd/spi-nor.h |  3 +++
> >  2 files changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 1c443fe568cf..a3988e8768b3 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2621,6 +2621,13 @@ static int spi_nor_default_setup(struct spi_nor
> > *nor,
> >        */
> >       shared_mask = hwcaps->mask & params->hwcaps.mask;
> >
> > +     /* Mask out Octal DTR if no enable function */
> > +     if (!params->set_octal_dtr)
> > +             shared_mask &= ~SNOR_HWCAPS_X_X_X_DTR;
>
> please also create a new SNOR_HWCAPS_8_8_8_DTR. While this is
> the same for now, I suspect the SNOR_HWCAPS_X_X_X_DTR is might also
> carry the 2_2_2_DTR and 4_4_4_DTR flags, just like SNOR_HWCAPS_X_X_X.
> In any case, it's easier to read and more consistent with the code
> below if you use SNOR_HWCAPS_8_8_8_DTR.
Got it.
I will prepare the next version.

>
> > +
> > +     if (!params->quad_enable)
> > +             shared_mask &= ~SNOR_HWCAPS_4_4_4;
> > +
> >       if (nor->spimem) {
> >               /*
> >                * When called from spi_nor_probe(), all caps are set and we
> > @@ -3093,9 +3100,6 @@ static int spi_nor_set_octal_dtr(struct spi_nor
> > *nor, bool enable)
> >  {
> >       int ret;
> >
> > -     if (!nor->params->set_octal_dtr)
> > -             return 0;
> > -
>
> I'd keep these checks, just in case.
OK

>
> >       if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
> >             nor->write_proto == SNOR_PROTO_8_8_8_DTR))
> >               return 0;
> > @@ -3123,9 +3127,6 @@ static int spi_nor_set_octal_dtr(struct spi_nor
> > *nor, bool enable)
> >   */
> >  static int spi_nor_quad_enable(struct spi_nor *nor)
> >  {
> > -     if (!nor->params->quad_enable)
> > -             return 0;
> > -
>
> same here.
OK

>
> Otherwise looks good.
>
> -michael
>
> >       if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
> >             spi_nor_get_protocol_width(nor->write_proto) == 4))
> >               return 0;
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > index cdcfe0fd2e7d..c421018dadf7 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -266,6 +266,9 @@ struct spi_nor_hwcaps {
> >  #define SNOR_HWCAPS_PP_8_8_8         BIT(22)
> >  #define SNOR_HWCAPS_PP_8_8_8_DTR     BIT(23)
> >
> > +#define SNOR_HWCAPS_4_4_4    (SNOR_HWCAPS_READ_4_4_4 |       \
> > +                              SNOR_HWCAPS_PP_4_4_4)
> > +
> >  #define SNOR_HWCAPS_X_X_X    (SNOR_HWCAPS_READ_2_2_2 |       \
> >                                SNOR_HWCAPS_READ_4_4_4 |       \
> >                                SNOR_HWCAPS_READ_8_8_8 |       \

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
