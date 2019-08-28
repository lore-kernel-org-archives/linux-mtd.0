Return-Path: <SRS0=Lrxn=WY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE246C3A5A1
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2019 18:09:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A48862053B
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2019 18:09:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C0Yt++jU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="T/GkjUuK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A48862053B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDXQXL6sMSLUh4AYHZrj/49pVYi/0kgLbW+M1nqCRKU=; b=C0Yt++jU7LqjR6
	Keyzssmi6tNGH4jNdYDxnpY9RcxI5hV1EF1laUdfk/GzSRzaJSAjN1FMsmzn0BXAqIos8g9JdnPLd
	fU9lneVQOdKNzYHDsP5Iz2a/dxqe+pgXHyZ3F9Mm/qzPj7m5q2Oc6FR0cK2dKhnwo9e11qojGTVB9
	XtwXO3KO11X9NhW0y1isp5qkE2FSeqfuxen52biavzxCpSZL5EGgtVZFarV0aGtku1QcdN5ZLJVz2
	58e4KpGGfd2iDihZJOm25xnw5+/XI2TmB8LLHdypVDjJZCcXa9QKwpR4jRjg8kd6HsE998+4FHg79
	rdYO+RBJYoXSMtrhZ7ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i32Na-0004No-EK; Wed, 28 Aug 2019 18:09:10 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i32NW-0004Mg-Nk
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2019 18:09:08 +0000
Received: by mail-vs1-xe42.google.com with SMTP id y16so617192vsc.3
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2019 11:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FH2NOkI7wNtasjU18y8L32Bmo2nfckBhtCBctsbMnr8=;
 b=T/GkjUuK2wuAJPAqyAxjsz1/mFpPPfWw/Xet/c7ibPqMgsoeq542KzUk+EBhER4BVg
 bkUHNvJ0grvtNI7Eo28Z0qAfQGpsk4IDbys6o5r3BxAQ0kEP8L73kQ39Cpr5ep67UPH6
 uPXzlohMnXIRz6lGViCgJCyVL89cqF/rI7odee9MU3MwmqXfeR+eCCNrhxbyWkFQA/XF
 /S+VAztP+ge/ZlnbyIKUJ9ta37ijdoVQ9q6wxSHzqpM14b40T2BoDHgFiaMQPQ7RJ056
 0VOQPrd/ckrptmi8vcn7lIxH57fUo9x0LDZsk+wjw9LSoVyUESJMhuyvg09mRWASzrTp
 QA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FH2NOkI7wNtasjU18y8L32Bmo2nfckBhtCBctsbMnr8=;
 b=dy6XZIR06xTqfiYjRIohqVmy3WGn6oClfnl/FTNPlvDTxzU1VzwlpRD6GZVKR3fG/K
 j3zjqeyjj7eciPiqIYsKclwHPp/0fLoyzmXwCTJJPGZaKV1VHtQCoI7ShgYpBEkS52yQ
 JE7PsQN1UoUZDfrYBJxEz6T9UMrLAWMrxF98Q0rn4I+SIrxTVvYQT8dl8IyqWNLJVoh+
 brhgZfMGtrCulNLExv+Ik7JFvsl1Nz8l+fgH03tQzMU6tSWKapUwTZ7oKpazcQzB5WOK
 yTKKg/fNioxxs5ER24FUhTS34xbq9TjMSx3/a875tcoQeUyPLckAjmWWWATmtixE5dGj
 J7xQ==
X-Gm-Message-State: APjAAAVf/gVoEA0MCxNpu6iz2VvnrFAft8oR3doe+PLF9UtEK4/4ZTyD
 9nDfmhBNk5JXQdAbrrUYWdryWZS7n2wTPvdKCjg8lQ==
X-Google-Smtp-Source: APXvYqyURo7rnH5WL7d4rlsbKyu3inzGzxxABHgNQwJFaoudu7gS//knOa/s/zMfx2shYgTXGc5/sEZ5pfMhx5xHJb8=
X-Received: by 2002:a67:2d08:: with SMTP id t8mr3371760vst.178.1567015744349; 
 Wed, 28 Aug 2019 11:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <1565699895-4770-1-git-send-email-sagar.kadam@sifive.com>
 <1565699895-4770-2-git-send-email-sagar.kadam@sifive.com>
 <CAEUhbmU6xHjUWK3iM_RqURHGuqgmSxQw6RtWthT4+2aL1xLDcA@mail.gmail.com>
In-Reply-To: <CAEUhbmU6xHjUWK3iM_RqURHGuqgmSxQw6RtWthT4+2aL1xLDcA@mail.gmail.com>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Wed, 28 Aug 2019 11:08:53 -0700
Message-ID: <CAARK3H=gNy7o0NL6KCkcBQANoutwhMHE_-nfbfB2NVUATRgemA@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] mtd: spi-nor: add support for is25wp256
To: Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_110906_805574_36823BF1 
X-CRM114-Status: GOOD (  19.27  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Vignesh R <vigneshr@ti.com>,
 tudor.ambarus@microchip.com, Richard Weinberger <richard@nod.at>,
 Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Bin,

On Mon, Aug 26, 2019 at 2:49 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Aug 13, 2019 at 8:40 PM Sagar Shrikant Kadam
> <sagar.kadam@sifive.com> wrote:
> >
> > Update spi_nor_id table for is25wp256 (32MB) device from ISSI,
> > present on HiFive Unleashed dev board (Rev: A00).
> >
> > Set method to enable quad mode for ISSI device in flash parameters
> > table.
> >
> > Based on code originally written by Wesley Terpstra <wesley@sifive.com>
> > and/or Palmer Dabbelt <palmer@sifive.com>
> > https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b
> >
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> > Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 9 ++++++++-
> >  include/linux/mtd/spi-nor.h   | 1 +
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 03cc788..6635127 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1946,7 +1946,10 @@ static int spi_nor_spansion_clear_sr_bp(struct spi_nor *nor)
> >                         SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >         { "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
> >                         SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > -
> > +       { "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
>
> The sector number should be 512, not 1024.

Thanks for pointing this out.
I had rectified it in recent U-boot patchset here
  https://patchwork.ozlabs.org/patch/1146522/
but I missed the change in the linux one as it was sent earlier.
I will include this change in the next version of the patch

Thanks & BR,
Sagar
>
> > +                       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> > +                       SPI_NOR_4B_OPCODES)
> > +       },
> >         /* Macronix */
> >         { "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> >         { "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
> > @@ -3776,6 +3779,10 @@ static int spi_nor_init_params(struct spi_nor *nor,
> >                 case SNOR_MFR_ST:
> >                 case SNOR_MFR_MICRON:
> >                         break;
> > +               case SNOR_MFR_ISSI:
> > +                       params->quad_enable = macronix_quad_enable;
> > +                       break;
> > +
> >
> >                 default:
> >                         /* Kept only for backward compatibility purpose. */
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > index 9f57cdf..5d6583e 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -21,6 +21,7 @@
> >  #define SNOR_MFR_INTEL         CFI_MFR_INTEL
> >  #define SNOR_MFR_ST            CFI_MFR_ST      /* ST Micro */
> >  #define SNOR_MFR_MICRON                CFI_MFR_MICRON  /* Micron */
> > +#define SNOR_MFR_ISSI          0x9d            /* ISSI */
> >  #define SNOR_MFR_MACRONIX      CFI_MFR_MACRONIX
> >  #define SNOR_MFR_SPANSION      CFI_MFR_AMD
> >  #define SNOR_MFR_SST           CFI_MFR_SST
>
> Regards,
> Bin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
