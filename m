Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BC7C4706C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jan 2024 05:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxyRe+x8g6aWRe3GtO0EdRVQRz6Ot1cHqqZWao1NOyE=; b=ypYXujGOYAqdJy
	dTHzD+Y6exuPZ/Hrw16LnxFo7jknm32RmSJVNSQqAcDQ/vN1Fmwxu1U3Oe6HeCMZVKA+8Rdu8OdOD
	ZUm5FPVHNgJhEKr4pLIY3FBbJNJ5iWM54NHIXBxHtUz+/UquAWkBT/tAvS1dMLEKgrq7GupLSiZtF
	yiXfX48Rs3xbOR4elUCmiEQg/uCLtpM1u2fW/nVo8GoH9V5TRKdZPRTlJvWzReMa7Z/sTehLiStxm
	0epcV7NdnViMgT450rKbHHiTJkh6zspigRt6UjpyDzewBGnvUh1rvEROXEuS8KNZ3XlCl2aVTz3Rt
	en8+rbd+ms3umKh9pDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO9vp-001vTR-0I;
	Fri, 12 Jan 2024 05:18:13 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO9vm-001vSS-11
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jan 2024 05:18:11 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso3041481a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jan 2024 21:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705036687; x=1705641487; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=83LMJpVWJ/JIRe45nfGmp9pl37x3rJ9kYbE7u82046g=;
        b=CMBHQ7gEv0CU77CPIcuYlxG9dfJg4vRcmFREwOy1JxCTXbGl2sGEO//DpjIYIucbWT
         I2SkQ5vCHSMVn7N/JZAHLACD5MKk36Q9ymDI3Ngb11NoKMVegPtji1M+bmsdZ4u9kM4I
         qBn8Vw4CWIyNve1mDeEwpKWSwC+f//aH90tGeERe86KZXgc546IidTr5cQJ8c3ACq3Ig
         kBBxx7fWFOgDtMzkDMhAViLgK99Fu8Pqx3wR46hO6hTiJhgT5QyF58lB7+DuUaK9iStR
         p0tXeNpP78tAupp2c86ZfzJ6SZ4rld2JFO//espn44VMTs1PPpYsJndHKm5Wj9LIjLTh
         RbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705036687; x=1705641487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83LMJpVWJ/JIRe45nfGmp9pl37x3rJ9kYbE7u82046g=;
        b=XF5Ve8mNOXVCxXPdIfo/yYxpGNgyqtZRHHwLO61Svr6UAe+DJ7syZRBG0XSG1vVYuo
         +z3Qr1SPD/p6PFwAu6wBxuf/UTKTrhUC/0fgWA9jzqj3cy82rmTSl/Ou0NwmPCWAUT7o
         6cGpYj3OAzoSEGAOohrAlkDfayI24lQuv0Lgb9Fx5dbo09A3d2Wp2sJwxDnbO2xPhpQb
         ePU50rgUIb/FoEt22StHmw8PQ4i3vf0O11mh6NZAzafCyOr1KnD/0DJprbpwcn0qAPOh
         c3JBXU+4lY8vXWA6ExOOXrQgMp9IcMCThqe5rJ8NAtAY5InnBFFawh+v5lTuqF559M8T
         AUkQ==
X-Gm-Message-State: AOJu0YxDSIH16NQpvQHzN0I+uLjOddpfycTsg4FXwz2Mm1EU5/lhCWXx
	KDeLCEPNM52kimzZ6VisYfxxhfaxt5b9TFgvgKniHRWT
X-Google-Smtp-Source: AGHT+IFgMB7pvc0ekmaWR6GNlYucWDWHi8cbsdcQdAEP8/lZI0sQQgiY19wuCBhrMNmxL6mO24HfnSQvAl2NtT0UVP8=
X-Received: by 2002:a17:90b:1bc8:b0:28c:915c:5eca with SMTP id
 oa8-20020a17090b1bc800b0028c915c5ecamr757460pjb.89.1705036687296; Thu, 11 Jan
 2024 21:18:07 -0800 (PST)
MIME-Version: 1.0
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-4-jaimeliao.tw@gmail.com> <103152f83138bbbadeea2798a11e6e2c@kernel.org>
In-Reply-To: <103152f83138bbbadeea2798a11e6e2c@kernel.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 12 Jan 2024 13:17:27 +0800
Message-ID: <CAAQoYRn4WgGJbpJS5cq+yR4o48hfCv+Z-+ivSDNp51CGsEQWpA@mail.gmail.com>
Subject: Re: [PATCH v7 3/7] mtd: spi-nor: core: Allow specifying the byte
 order in DTR mode
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_211810_374634_D71A60E2 
X-CRM114-Status: GOOD (  26.91  )
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
> > Macronix swaps bytes on a 16-bit boundary when configured in Octal DTR.
> > The byte order of 16-bit words is swapped when read or written in
> > 8D-8D-8D
> > mode compared to STR modes. Allow operations to specify the byte order
> > in
> > DTR mode, so that controllers can swap the bytes back at run-time to
> > address the flash's endianness requirements, if they are capable. If
> > the
> > controllers are not capable of swapping the bytes, the protocol is
> > downgrade via spi_nor_spimem_adjust_hwcaps(). When available, the
> > swapping
> > of the bytes is always done regardless if it's a data or register
> > access,
> > so that we comply with the JESD216 requirements: "Byte order of 16-bit
> > words is swapped when read in 8D-8D-8D mode compared to 1-1-1".
> >
> > Merge Tudor's patch and add modifications for suiting newer version
> > of Linux kernel.
> >
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> > ---
> >  drivers/mtd/spi-nor/core.c | 8 ++++++++
> >  drivers/mtd/spi-nor/core.h | 1 +
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 1c443fe568cf..f659dd037a25 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -70,6 +70,13 @@ static u8 spi_nor_get_cmd_ext(const struct spi_nor
> > *nor,
> >       }
> >  }
> >
> > +static inline bool spi_nor_is_octal_dtr_swab16(const struct spi_nor
> > *nor,
> > +                                             enum spi_nor_protocol proto)
> > +{
> > +     return (proto == SNOR_PROTO_8_8_8_DTR) &&
> > +             (nor->flags & SNOR_F_DTR_SWAB16);
> > +}
> > +
> >  /**
> >   * spi_nor_spimem_setup_op() - Set up common properties of a spi-mem
> > op.
> >   * @nor:             pointer to a 'struct spi_nor'
> > @@ -105,6 +112,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor
> > *nor,
> >               op->addr.dtr = true;
> >               op->dummy.dtr = true;
> >               op->data.dtr = true;
> > +             op->data.dtr_swab16 = spi_nor_is_octal_dtr_swab16(nor, proto);
>
> Just use
>    dtr_swap16 = nor->flags & SNOR_F_DTR_SWAP16;
Got it.

>
> Again, I don't really like DTR_SWAP16. JESD216 just mention swapping for
> 8d8d8d. Depends on how generic we want to go. I'd go with swap16 and
> mention
> that for now, it is only applicable if data.buswidth == 8 and
> data.dtr == true.
>
> -michael
>
> >               /* 2 bytes per clock cycle in DTR mode. */
> >               op->dummy.nbytes *= 2;
> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index 93cd2fc3606d..fe1259b32110 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -140,6 +140,7 @@ enum spi_nor_option_flags {
> >       SNOR_F_RWW              = BIT(14),
> >       SNOR_F_ECC              = BIT(15),
> >       SNOR_F_NO_WP            = BIT(16),
> > +     SNOR_F_DTR_SWAB16       = BIT(17),
> >  };
> >
> >  struct spi_nor_read_command {

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
