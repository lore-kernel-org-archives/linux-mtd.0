Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D10EC6FA89
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Sep 2022 16:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXMNHngfJp0tJp6gaOSJzRch6uybHZxgCh+edPPutd4=; b=sD2LI5tx6rcx8e
	gJOYKx7OzRWuGzW9xBuS9WQbFq0AKxks0ctB7LYNKZiGGrSeaEXWPafiPlVf3XYV9KZ7TtumAV6kZ
	Ru9RDEEAWUAmfrJhYlnvnvFtks6C0DEs8hO94ykTvHV9UA2rf19+Y4nxZLn8JR8nl76NriNKunrYP
	GbEmlBgstUcqxi1y5xhKolD3wySVDpBKoJ2dA45p+GuH483xRQDfUnph1v0Yn1ehJBQ+GkrCeSmuY
	mX8B+s9If8dEMc9leQYgafjo2fnMuko45GbJhO86ojP8EPf87T4Poavr2/SU0LPgn8t+uay/SFAGO
	+2FHwehpPStq0AfD8kUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYs5v-00DfR9-Kx; Thu, 15 Sep 2022 16:52:07 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYs5s-00DfP3-W6
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2022 16:52:06 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1274ec87ad5so48418992fac.0
        for <linux-mtd@lists.infradead.org>; Thu, 15 Sep 2022 09:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tOtVH4ixRGCe5uqoihAe8MK5fBynZJb5fcnks2GXImY=;
        b=TvLczY1t4EDKLbg08MYFD6pN8vktVGlKuT2XDNIfqwh/OI5WLnvWo3tm5sKdeb/7u1
         PBmQGDRthHxMtYgvWysJqnCLh0sbmX8zGc0MAhGvMV2hoCbRU4aSJSOamAplXO+T8j7N
         vtD8WR5GrRP59RXwiSqZE8J56o6Jp5InqFC02ROSmdYML7wHoIuTy7bYW0INETyz7fU+
         GGnI06U1rh3QnfdBiE5K6hm0NtXjhuV1D5ik3mmZznK6T+DMMN2Xw2ZJhPAbFPfCOxsa
         JuSasCv3MqcDhJH5NQhzxoRXJpjhEifZdbGDAX+ahd98Z/apViNuOzUAUfWvQUMREBz3
         IUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tOtVH4ixRGCe5uqoihAe8MK5fBynZJb5fcnks2GXImY=;
        b=5q3i0GBConvylMAOLD/HPx0I5myfivpmi1SDctmT8dsgdRN3/ANxcMP/MEHIZpUiw0
         oImNwSntlaXK6fDiZrQs5HuZqd2ZRZF+CN9Aj8Q/aJk02VcCF2Mq/+8UUav9IuhNCgnW
         Or3+y7DvScjDepN8xuOaDajMejhsHg7D6tl86cwzwW3tpwWGlV8GIXu3YpfDVtlJ5yFw
         sxMqCgajGr4xGSh+bAMsPvknnyA58ZsJ6/QxeNq+88Ks8GdfAyILnGRSGlOHKd6Z9AzY
         JssXOSrDu1meFCcDCVz3OyGB/gX7BaJC4YEKEs7628JgPWlzP4uJnWNUtINZB5VlRvNF
         p3bg==
X-Gm-Message-State: ACrzQf1FU5wmaL/oZ6lHkzRKtm9st0pwpiR2BP5lsgl18xKIuyqLYDpR
	IgcUnGTrhkSn66gpMJBdfRSHVr0R9IkPRi7OnvIU1Q==
X-Google-Smtp-Source: AMsMyM5SnZ8boja/eEQ65OZdUWRxu9Wq37qnXSNoTu87ivkLR6L3NK1Q4FF12nTu+0vua12P6qkAyirrVmf6vW/G32I=
X-Received: by 2002:a05:6870:3448:b0:12b:1a11:e868 with SMTP id
 i8-20020a056870344800b0012b1a11e868mr345228oah.198.1663260722395; Thu, 15 Sep
 2022 09:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
 <20220809201428.118523-2-sudip.mukherjee@sifive.com> <2a50d782-ff21-91af-8488-503168e29867@microchip.com>
In-Reply-To: <2a50d782-ff21-91af-8488-503168e29867@microchip.com>
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Date: Thu, 15 Sep 2022 17:51:51 +0100
Message-ID: <CAHyZL-fdW-r_6Tfx+jCiMip7XN-GWZ0PYAfLCrexoq8ayLdiyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: issi: is25wp256: Init flash based on SFDP
To: Tudor.Ambarus@microchip.com
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, greentime.hu@sifive.com, 
	jude.onyenegecha@sifive.com, william.salmon@sifive.com, 
	adnan.chowdhury@sifive.com, ben.dooks@sifive.com, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_095205_090715_B6B418A2 
X-CRM114-Status: GOOD (  27.00  )
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

Hi Tudor,

On Wed, Aug 10, 2022 at 8:55 AM <Tudor.Ambarus@microchip.com> wrote:
>
> On 8/9/22 23:14, Sudip Mukherjee wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
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
> >  drivers/mtd/spi-nor/issi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> > index 89a66a19d754..8b48459b5054 100644
> > --- a/drivers/mtd/spi-nor/issi.c
> > +++ b/drivers/mtd/spi-nor/issi.c
> > @@ -71,7 +71,7 @@ static const struct flash_info issi_nor_parts[] = {
> >         { "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
> >                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >         { "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)
> > -               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> > +               PARSE_SFDP
> >                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> >                 .fixups = &is25lp256_fixups },
> >
> > --
> > 2.30.2
> >
>
> Looks good to me.
> When submitting flash updates or new flash additions, we require contributors
> to do a little test using mtd-utils and to dump the SPI NOR sysfs entries.
> Would you please do that?
>
> Here's the simple test:

Here is the test result with only the PARSE_SFDP change. I can resend
the patch if you want.
I will work on the other patch enabling Quad PP now and send that
along with its own test result.

# dd if=/dev/urandom of=./qspi_test bs=1M count=6
6+0 records in
6+0 records out

# mtd_debug write /dev/mtd4 0 6291456 qspi_test
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash

# mtd_debug erase /dev/mtd4 0 6291456
Erased 6291456 bytes from address 0x00000000 in flash

# mtd_debug read /dev/mtd4 0 6291456 qspi_read
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read

# hexdump qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000

# mtd_debug write /dev/mtd4 0 6291456 qspi_test
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash

# mtd_debug read /dev/mtd4 0 6291456 qspi_read
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read

# sha1sum qspi_test qspi_read
57f8d4fee65622104e24276e865f662844f12242  qspi_test
57f8d4fee65622104e24276e865f662844f12242  qspi_read

# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
is25wp256

# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
9d7019

# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
issi

# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110300000ff9d05010380000002ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f9ffffffff0f44eb086b
083b80bbfeffffffffff00ffffff44eb0c200f5210d800ff234ac90082d8
11cecccd68467a757a75f7aed55c4a422cfff030faa9ffffffffffffffff
ffffffffffffffff501950169ff9c0648fefffff

# md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
ba14818b9ec42713f24d94d66bb90ba0  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp


--
Regards
Sudip

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
