Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34081CAC5A5
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pa//9TtgTWUcPUevFh44fXHp9eboT6gm1v104F/5+g4=; b=mdzEZYJT6u92wh
	Q9c7GTXsJCH0dzoYO1MJmUJWvsI67SCvwLtkTr2NPltUrGsIvRB29JsITsooRkRP3qZNRYHExcG6z
	gQui6+tL8+XgTZYAHbY+5u8wYXq0qjJJq/aBEc+6H3OLpYH9RUYP39m9bHBpG3eIo54SWjNDgx7cb
	ss3SRn30W6vFAzeRMuPoxS1epSFo7oKdEwlEMkkivVFmH5g+Pi+lJnzjbdChy0mfVRhGf8pISoRh3
	OY2Faikp1EN3dBC8Oit1sQTj6zYSIvqRh9qUb1MdjgJD0n9+6awtP0UXgzhQp1/vxAxsVECHA3JYY
	4hbN0YmHm5w/U1N4M07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LMN-0000000Fy6l-3V6r;
	Wed, 24 Sep 2025 09:00:23 +0000
Received: from smtp15.bhosted.nl ([2a02:9e0:8000::26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LMJ-0000000Fy3p-3AmX
	for linux-mtd@lists.infradead.org;
	Wed, 24 Sep 2025 09:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=content-type:cc:to:subject:message-id:date:from:in-reply-to:references:
	 mime-version:from;
	bh=N2Vf72GOQ2rBbqeUFPI+Xp3IghKEqRQVXfDsNjYoGAk=;
	b=cDbNq5x+fmA6hbs5aFEvdRh8DGzoDLBnNasm34n/waknU96ls8i6qWKOX3E0xeGe0lADafbhiqzaE
	 CfUW5YOhqZTRcTwnmIuAKEv5F4E94mEbkYpEwfbrqpeioVV3LTAfKhTG2wwv9GdfDmMSKP+3bxJhmt
	 NbreDH5J+5C4deIlvA4f2ROGkQ/0MhruOt9+HUjJp7Qn/RcyPrOjIuts9zzk/mDRISnQkUHFu9JWXf
	 FVu0Bf2NmpiIWTM4cCXKMHfjsbFw6SOMM3v7Pxp4BGnscQ2HbIaa1SWLvK9h8mp7ww4jU7yVDIvk1k
	 FNLN9tGHHI6GcZ1sRsKxPL8WFn1kz0w==
X-MSG-ID: e1c7346c-9924-11f0-9d6a-00505681446f
X-Forwarded-Encrypted: i=1; AJvYcCX0ILIVyvu7cWC1+D78kObnb7BXaHRyjob8K2tVNMS7hFzIzJDCSluOt9RFrqeQMhbTgCcUjPeW5L4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUwc3hC40zcGV8odgIVnPHfwcl89Rvae7k/b91hZq8a3SpC1PY
	bHIUPzwOhC5gIjl+LWldNLMVOpFPs4g7iYxGT392AS1v4HOfBguPZd1qNh+HlRGSvYdRtxbIj1K
	pM8NIpVuHWRfjG0rtsR7Hn4AZrwXkSCs=
X-Google-Smtp-Source: AGHT+IEt2Po3Zh8TWxmaqm1I069rKBI2qYFkrIMdeYUdpiFn2AcDDTB4HVUmDo7RlxKe6UfsvRaIqWHN6n4DrO+OxlQ=
X-Received: by 2002:a05:690c:930e:10b0:72a:86fb:b436 with SMTP id
 00721157ae682-758a246a801mr38421997b3.25.1758704412978; Wed, 24 Sep 2025
 02:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250922155635.749975-1-maarten@zanders.be> <20250922155635.749975-3-maarten@zanders.be>
 <DD08QRGQSU2G.1GB9CNQJV82CW@kernel.org>
In-Reply-To: <DD08QRGQSU2G.1GB9CNQJV82CW@kernel.org>
From: Maarten Zanders <maarten@zanders.be>
Date: Wed, 24 Sep 2025 11:00:02 +0200
X-Gmail-Original-Message-ID: <CAPB_pELazUPccKa72_m7vb80Z7wLRO+PpgfeY-afDHSgg4eVNg@mail.gmail.com>
X-Gm-Features: AS18NWAGL9X1sJYkTcifCnTT5NHwoBx9uBcyAzc1C4e3__AXI1BfaLZ_b9jOvOU
Message-ID: <CAPB_pELazUPccKa72_m7vb80Z7wLRO+PpgfeY-afDHSgg4eVNg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: use RDCR opcode 0x15
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, chengminglin@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_020020_217217_030F95F9 
X-CRM114-Status: GOOD (  35.53  )
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

Hi Michael,

> Why isn't that also true for this device? It supports SFDP. Does it
> have a wrong value there?

You're right. I started working on this issue in an older kernel and
didn't check the full error path again on the most recent version. I
noted that the CR opcode was still wrong and went ahead forward
porting my patches without checking the erroneous behavior in the
latest kernel. My bad!

My particular part (MX25L12833F) has been working (by doing 8 bit SR
writes) since 947c86e481a0 ("mtd: spi-nor: macronix: Drop the
redundant flash info fields", 2025-04-07). This ensures that SFDP data
is read and behavior after that is OK. Before that commit, the SFDP
data wouldn't be read because the .size was filled in (and before that
because of .no_sfdp_flags). That in turn triggered the 16 bit writes.

> But I'm also not convinced that we should fix it that way. I just
> had a look at a random macronix flash MX25L12805D and it doesn't
> have that opcode. Thus, just adding that to all the macronix flashes
> doesn't make much sense. But it also doesn't seem to have a WRSR
> command that takes 16bits.. and the core unconditonally set
> SNOR_F_HAS_16BIT_SR. Hum.

Yes. That part (MX25L12805D) has the same ID code whilst it is not
supporting SFDP, RDCR or 16 bit SR writes (according to the
datasheet).
With the current flash info & logic in core.c, it will no longer work
at all as spi_nor_parse_sfdp() fails.

Consider a different example: 8M devices MX25L6433F, MX25L6436F and
MX25L6473F. The ID for these is 0xC22017. Flash info for this contains
a .size field (probably because of the legacy MX25L6405D) so SFDP will
not be parsed and we're falling back on the defaults - so it will do
16 bit SR writes. CR will get corrupted due to wrong CR read opcode.

So I believe this first problem boils down to the same ID representing
both flashes with and without SFDP. If we want to keep supporting the
old non-SFDP devices, the .size should be filled in for those ID's. Or
we drop support for them altogether and make SFDP a hard requirement
(solving the other issues in one go). But it should be consistent
across the different sizes.

> So maybe just clear the SNOR_F_HAS_16BIT_SR or add SNOR_F_NO_READ_CR
> for the macronix flashes by default as a fix. Not sure what's better
> here.

SNOR_F_NO_READ_CR doesn't help: this will write all 0's to the CR in a
16 bit SR write, which is not the default state of some parts
mentioned earlier.
Clearing SNOR_F_HAS_16BIT_SR could indeed be a solution for letting
these parts work properly in this non-sfdp mode. But we probably
shouldn't do it for *all* Macronix flashes?

> Then on top of that you might add the RDCR opcode, although
> I'm not sure for what it is used then.

There wouldn't be a real use until someone starts actually
implementing the features in the Macronix CR (like top/bottom SWP). Or
untill someone else is changing SNOR_F_HAS_16BIT_SR logic due to
additional SFDP/BFPT parsing. Which I still consider a risk due to the
weak link.

> > Fixes: 10526d85e4c6 ("mtd: spi-nor: Move Macronix bits out of core.c")
>
> I doubt that this is the correct Fixes tag as this only moves code
> around.

Essentially, I meant 'since the beginning of macronix introduction'.
In such a case, should we dig further through file renames & stale
LTS's?

Thanks for your input,
Maarten

>
> In any case, there seems to be another issue with your flash and the
> SFDP tables.
>
> -michael
>
> [1] https://docs.kernel.org/driver-api/mtd/spi-nor.html
>
> > Signed-off-by: Maarten Zanders <maarten@zanders.be>
> > ---
> >  drivers/mtd/spi-nor/macronix.c | 1 +
> >  include/linux/mtd/spi-nor.h    | 3 +++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> > index e97f5cbd9aad..de3f3d963f86 100644
> > --- a/drivers/mtd/spi-nor/macronix.c
> > +++ b/drivers/mtd/spi-nor/macronix.c
> > @@ -322,6 +322,7 @@ static int macronix_nor_late_init(struct spi_nor *nor)
> >       if (!nor->params->set_4byte_addr_mode)
> >               nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
> >       nor->params->set_octal_dtr = macronix_nor_set_octal_dtr;
> > +     nor->params->rdcr_opcode = SPINOR_OP_RDCR_MX;
> >
> >       return 0;
> >  }
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > index cdcfe0fd2e7d..e35405b126c2 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -92,6 +92,9 @@
> >  #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
> >  #define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
> >
> > +/* Used for Macronix flashes only. */
> > +#define SPINOR_OP_RDCR_MX    0x15    /* Read configuration register */
> > +
> >  /* Used for GigaDevices and Winbond flashes. */
> >  #define SPINOR_OP_ESECR              0x44    /* Erase Security registers */
> >  #define SPINOR_OP_PSECR              0x42    /* Program Security registers */
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
