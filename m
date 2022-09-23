Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC3DC07E9D
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Sep 2022 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tq8fZcSlyJFQZWaZrzX2tqJC+R/RBdo5E9hr6nFiSXg=; b=EX/tJh0qCHgKVw
	2LyR4+ltgaqoth6HqbjhdZ6hk3k1P0J7oFW86EZbXXDVb0uTR9f48pd+oUIpghCsQ2rs2f+pQrQ1l
	MHcRuzWR/XOAA3eLfxqx+t1ASV8bpwlIHEyLlw0/ra5KKmlV5uleNfrN52dUEkOYA6KnWPmoMccI6
	4OmbTbafNBoR4yANWv8S9v/F3zzSI+N1n1pJ6jbiZFW+Kiv1HPLL1muI3kbG0xrjUJfcToBE+Fg89
	OyC/zC5yukgpx8BFCXyYvaZXLKcp3lX8UUd3Njim6zSTsiMpZr212aYJwTF0+i1upUelBXe/JMX3w
	iTc6e0kKvMolmCfYak8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnSL-005LoO-PD; Fri, 23 Sep 2022 18:31:21 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnSJ-005LnO-HE
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2022 18:31:21 +0000
Received: by mail-oi1-x233.google.com with SMTP id c81so871606oif.3
        for <linux-mtd@lists.infradead.org>; Fri, 23 Sep 2022 11:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=RQH0ikj6o1UT8tZfU0Tbzm64t8KnmNW2b00rreeuJH8=;
        b=EgQfxf51q6nSHS22d9TFQD++CVkawsWb1isejnpqd54A9ZSLICrUXqJEaBUP8AxQzD
         QFxwLuBOFIoNevwSSCybK/GyjLKvibG7vaQ5X0XJX3VlTZzKzHCBIKTdllfocN9UHFLz
         LIcv/mLbKsSRlyJZGOgtgiCxXZKzOIyW3SsIY0PyEtNZxMMz6pDXlBgr+PWGGxDh5+tz
         cL/S8hbTsZVExsrOb7AFTzJ9L8gTatVw++4PnFaqidwEeMBGe2/zpbZfJKKYalg7R89J
         MD9hNFZQIlVTLDkg1Vct2DlkfW+ciEOTeHH8A1TIt/y9xbcHq5e4wdthVNSeoOGtLK8Q
         HVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=RQH0ikj6o1UT8tZfU0Tbzm64t8KnmNW2b00rreeuJH8=;
        b=XYsA/D3q3DVZFPykM1Od6we6rxGrVH9+0iHsMYZbhNknHbXJGSe2RLPczagyXXpt8D
         ExZfvudECR9rwKVauSwDd7ADLH4KFcwqvWwENX8iZJ1YjX/pn49YMFU+/zQCmv637bDs
         VGipNintvad9QhiLufT0UC7C9jc73KO2u5Ht4UoZ2XlpblZOyKKKsx2vHCG9Ho39mbEJ
         xAmPHKCZA931f/fL+8aqGUFFURXSHpjyWIJSmKN5QJ6yHwV9PyzerkrXKJn1ObAP2RGN
         xEA1Exk6JQwEuqc6IvK2Q4HydnWSCpLfdP11ggItKcNK6vApmItbJpw9MngTRFJFVm0g
         FqIw==
X-Gm-Message-State: ACrzQf3JwgBOZa137B7+kOHCF2mFspg1/WX+Lwr5GCMw85hrlZwBgc9g
	pGYttDEUHpVjrxJmiWUW5Lt/LK1HQt/vBHIDd6wLfA==
X-Google-Smtp-Source: AMsMyM4StEFiN4OPqCyD+zkWZvRXYBnK1F8+6hKtr28dP2nSv+g5XDFPpjs0wKdqia6pvWtmwvkXTHC5iOg75np5uG4=
X-Received: by 2002:a05:6808:ec5:b0:337:ac3c:550c with SMTP id
 q5-20020a0568080ec500b00337ac3c550cmr5084267oiv.262.1663957877485; Fri, 23
 Sep 2022 11:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220920184808.44876-1-sudip.mukherjee@sifive.com> <1b62d0d80d3680e94172149946c936a0@walle.cc>
In-Reply-To: <1b62d0d80d3680e94172149946c936a0@walle.cc>
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Date: Fri, 23 Sep 2022 19:31:06 +0100
Message-ID: <CAHyZL-eU7t5aD5ube=L+7MWHow+1uXROfTXxmFdHQMj-w6jYVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: issi: is25wp256: Init flash based on SFDP
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, greentime.hu@sifive.com, jude.onyenegecha@sifive.com, 
	william.salmon@sifive.com, adnan.chowdhury@sifive.com, ben.dooks@sifive.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_113119_664065_4B095CE4 
X-CRM114-Status: GOOD (  24.43  )
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

HI Michael,

On Thu, Sep 22, 2022 at 3:19 PM Michael Walle <michael@walle.cc> wrote:
>
> Am 2022-09-20 20:48, schrieb Sudip Mukherjee:
> > The datasheet of is25wp256 says it supports SFDP. Get rid of the static
> > initialization of the flash parameters and init them when parsing SFDP.
> >
> > Testing showed the flash using SPINOR_OP_READ_1_1_4_4B 0x6c,
> > SPINOR_OP_PP_4B 0x12 and SPINOR_OP_BE_4K_4B 0x21 before enabling SFDP.
> > After this patch, it parses the SFDP information and still uses the
> > same opcodes.
> >
> > Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
> > ---
> >
> > No change from v2, just resending again with the next patch.
> > Results from the tests given by Tudor in the following mail.
> >
> >
> >  drivers/mtd/spi-nor/issi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> > index 89a66a19d754f..8b48459b5054c 100644
> > --- a/drivers/mtd/spi-nor/issi.c
> > +++ b/drivers/mtd/spi-nor/issi.c
> > @@ -71,7 +71,7 @@ static const struct flash_info issi_nor_parts[] = {
> >       { "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
> >               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >       { "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)
>
> I'm curious, does it also work with:
>         { "is25wp256", INFO(0x9d7019, 0, 0, 0)
>                 PARSE_SFDP

Applied this on top of my patch series:

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 014cd9038bed..a0ddad2afffc 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -70,7 +70,7 @@ static const struct flash_info issi_nor_parts[] = {
                NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
SPI_NOR_QUAD_READ) },
        { "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
                NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
SPI_NOR_QUAD_READ) },
-       { "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)
+       { "is25wp256", INFO(0x9d7019, 0, 0, 0)
                PARSE_SFDP
                FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
                FLAGS(SPI_NOR_QUAD_PP)

And, I can see it working. dmesg showed:
[   35.299888] spi-nor spi0.0: is25wp256 (32768 Kbytes)
[   35.403858] spi-nor spi0.0: mtd .name = spi0.0, .size = 0x2000000
(32MiB), .erasesize = 0x00001000 (4KiB) .numeraseregions = 0

The system booted and I can see all the partitions.

-- 
Regards
Sudip

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
