Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEE4C197A0
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 10:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1uA2bgbG20p1qp0r8EfMQ8bmVPkOdhrUsqrrkcmV7tI=; b=4YCx1aKmOOPTvL
	amSaIhU7EdRovrDxZbrjQtD1rfQ7C8caZZsrPe4XCUCQBDLxjtBNd7n08mEt1qHoqyB51Yf8O1GOC
	G3orBToKofM9wJS25sNvx7Ei7D23GMNYoTb9MxSFU4zoXMboXw5MesZS32Dipo4KTVp54mYa+NAzJ
	71pnFII8K4k25Lb2zPQflvfflVvomDdWbbLy9Kbug1rbhTCvhaSX0nFTK46WH+H9dTHBzt3u9Y56m
	SRpJ7Nlg2461Z6vJWmIaKqtXDuF9F+JeN08gWX9exd8Fuxyo1atUrbeVhMwhJbS+rracLKizRMOPA
	FrwM55Bwqwi+7YbUZ9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vez-006Apl-2x;
	Fri, 17 Nov 2023 10:01:13 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vex-006AoZ-2R
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 10:01:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc5b705769so16083955ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 02:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700215267; x=1700820067; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i4DCpxp7FONfBHA5LZzYCqvFs2dg8dOsgyD3+RTcVpE=;
        b=F4Tsi3v/WFwhEvWJcO1VaH4skJhMAIFqLi3A0/u/dmofi88jpe0s5sYaeeLWGHMbBM
         hLXm1t6E7ccuaZhivTbexOLDwRzkrDCpjdHSoWB/yBXBRwZ2dkYqX95aR/6FhEeXB6ST
         sZAEfFJeVudiG7Pqk8wrVtwLi8UUTUSoidSPDOI28mEAH9hK8Sgw286x2MdjoiADmw7U
         Otc3qlfzfHK1f6GlZvDkpVi5PugOGxgnLY4Zg1GD/YXQUH0h+2MUjadIILVTVXCijPT7
         Dz98yc1sTbcM4Lp6bp9NB6gYSWI1BH39X0y40l3TV0Oh0x/eLq2zIaw8Vozm4Afds7De
         EHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700215267; x=1700820067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4DCpxp7FONfBHA5LZzYCqvFs2dg8dOsgyD3+RTcVpE=;
        b=b0Ygb0nUAoufTNqrMFe4AHcVSBoUR8aEH1VwiEvewn7mq5MOmSs/SeIVz6Z2hzNSdb
         MY6pKVIwl3K5Ioo+mBfgrDpvyV6Hab73gC2O6Jvr2FsvA1YDP9DsscVop0OH3DYfcIxR
         09B+7pIyghCy2GdTMhwdyX7VnhLNixBEZDjDkgvJAAsogie/fk9woAER7oJoMRkhlG3m
         1CMzr5X0gGWDq7Sj7PBOxfi4jMqd3/NRkXj614P4dXNkO3xOH3m6TKQgVN1sGAaRm1lZ
         UMGH0NOHENOb+LPtgEPBpmjsPs52WhsGrg7SdCSvh+lOEkBTYHQojJmon9ns02UAMr3g
         LDiA==
X-Gm-Message-State: AOJu0YxWb/9QyzneNaSS3+CsjND5wi+hkvKTBDE/bxIc8yxWLjWoPAdU
	jr3hnm+ujkfwshuG+5wfS50c4BGxBRVEcbaKgKw=
X-Google-Smtp-Source: AGHT+IG+3Ym3mP2QFzp8rJhepbdNJDo3aQHBLe2PcWhDYxchdbpAVs3RZyX146fgxbFzjx8m1zN1QIlTgagIWf8/DZk=
X-Received: by 2002:a17:90a:72c5:b0:280:1d67:16a6 with SMTP id
 l5-20020a17090a72c500b002801d6716a6mr20691201pjk.34.1700215266976; Fri, 17
 Nov 2023 02:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-3-jaimeliao.tw@gmail.com> <694aa042-ab25-44ca-b0fb-8cc95ba537ed@linaro.org>
In-Reply-To: <694aa042-ab25-44ca-b0fb-8cc95ba537ed@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 17 Nov 2023 18:00:54 +0800
Message-ID: <CAAQoYRkxaunh4c9jv1=97LJfr39ODnRvA5pjedR87tgXLHVisQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] spi: spi-mem: Allow specifying the byte order in
 DTR mode
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc, 
	miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_020111_793766_58D17239 
X-CRM114-Status: GOOD (  23.74  )
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

Hi

>
>
>
> On 11/17/23 08:38, Jaime Liao wrote:
> > From: JaimeLiao <jaimeliao@mxic.com.tw>
> >
> > There are NOR flashes (Macronix) that swap the bytes on a 16-bit
> > boundary when configured in Octal DTR mode. The byte order of
> > 16-bit words is swapped when read or written in Octal Double
> > Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
> > modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
> > 8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
> > Swapping the bytes may introduce some endianness problems. It can
> > affect the boot sequence if the entire boot sequence is not handled
> > in either 8D-8D-8D mode or 1-1-1 mode. So we must swap the bytes
> > back to have the same byte order as in STR modes. Fortunately there
> > are controllers that could swap the bytes back at runtime,
> > addressing the flash's endiannesses requirements. Provide a way for
> > the upper layers to specify the byte order in Octal DTR mode.
> >
> > Merge Tudor's patch and add modifications for suiting newer version
> > of Linux kernel.
> >
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> > ---
> >  drivers/spi/spi-mem.c       | 4 ++++
> >  include/linux/spi/spi-mem.h | 6 ++++++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> > index edd7430d4c05..9c03b5617fff 100644
> > --- a/drivers/spi/spi-mem.c
> > +++ b/drivers/spi/spi-mem.c
> > @@ -172,6 +172,10 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
> >               if (!spi_mem_controller_is_capable(ctlr, dtr))
> >                       return false;
> >
> > +             if (op->data.dtr_swab16 &&
> > +                 !(spi_mem_controller_is_capable(ctlr, dtr_swab16)))
> > +                     return false;
> > +
>
> so if the controller supports swapping back the bytes, then 8d-8d-8d
> will be supported, otherwise not. Shall the swap back be user configurable?
Yes, I validate it on macronix spi controller driver.
8d-8d-8d mode will not support if controller driver didn't support
swapping bytes.

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
