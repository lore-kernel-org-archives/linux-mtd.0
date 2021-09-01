Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90808C4320A
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 11:29:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CBFF60F6C
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 11:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CBFF60F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lOenXAcYjpBJroTioQs4lN9zYG2f2yDEHi7egVBhuI=; b=3E2hVIFI1Wu3dk
	29yu4yUsWospnrk8BHlf36wqyBP3E81h+deqAVrHpvd5YNTY8+2i78xsI6RqnHMZZ5g6Wwfcl3GEG
	bm6aI8CGRk2ZCsjX7wlpsYAgL+lxCZSCu2CaA3hl8SoBHuZi/aZaRwqTeVcn+r/XehlFazyM2xb44
	dN7WcbczlPb38i/yh0NTksazf+j2w4tSDuL1RUpwG/F0z9KSSod9rb1ICVcFfafQAk6EjBOsT7OMp
	hnJyGFf9a19kaKZJbDgl3XUou9g68Is4qFBAVxR9+C3v5x5XPATJtKq5VwwZp5/uHRU1aSygLO+4n
	xlnJFwfN7egZklL0Pi8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLOQQ-005aTO-8a; Wed, 01 Sep 2021 11:29:02 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLOII-005XyS-8v
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 11:20:42 +0000
Received: by mail-ua1-x92f.google.com with SMTP id r20so1139846uat.2
 for <linux-mtd@lists.infradead.org>; Wed, 01 Sep 2021 04:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wDU05qyMlurEptD3ge36yt8avgElKgTA+xLedQ2wfFk=;
 b=d3iPtE+8EirxpSiyPZfwSsP4vl5ksOU/K9JVtv7lP1YwvGYcu7u+l11xedPfNP1NqM
 43MhyetoOho0fRureNOZUS4EySrAjYF0/nctPVmGqNuGHwK78YTwvqnBJj0IGDqiHRuD
 jrx0zSYw385aRaPHhaXrAeJ4bkm4kfJhglz2LpQYEf++Cdd7EitJgZnQ/YBqVGBlmh72
 klQ1T7GkB1XiZzk8yQZF+uzGPaTyGWY7CcS+z3pDKHPuGPl6LYvmlGE49yCvkgNP6kpt
 tSkEk8/UcNSQe8SE/55l0Go4FjETBqmvAeDBzO5UD8tO/YUmA/TnF67XrW5PukTg/pKW
 GoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wDU05qyMlurEptD3ge36yt8avgElKgTA+xLedQ2wfFk=;
 b=ZVIgVJ73zDziyJKUl9hHFCJL/rNNoWPfUJrHqNJPy63ZB46h+BtF+/LgfxeteBz2ku
 WuOZqmng2WTzAynliim6KZ1we+EzM8guutLk3eVngUfdC0PCA3haMK9iqnQuMeTR/jqq
 +yZxNG8Iiqs3XVp0W1u74gH/jx0gxjn1psfvw0S7lSeZfPWvzLl8WmQ/SvsRxAPxVEvG
 weKN4z9YxeXEzVpJk1nY8so4G1toApW+qnCmtGFTWl0lMqFclqAIQZJt1uFQI7pkna5f
 debeHUNXNFJLhc6qvMtsRTFUpn8arjZHCY8S7SFnAnze/yLbqFDZht+/95wc2LfFNoQe
 tO4g==
X-Gm-Message-State: AOAM532KStorbZ8Tk/WVsLm5kC0kaGLQXOyu85ARuX8QjA9nAxEU5MgG
 F02oZvQHSp283KvO64zI7ewtVx2Dje5ynaXfVFA=
X-Google-Smtp-Source: ABdhPJwI/lp1cg8u7qJQv+eT2d/mMXhc/Gr9lRMgcyX+szMmEkn2tGlyVAZnMwOJbsQaC4co6auRq0p2cAp1/YQRmhM=
X-Received: by 2002:ab0:3c5:: with SMTP id 63mr22621397uau.106.1630495235937; 
 Wed, 01 Sep 2021 04:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210831081329.27420-1-andrea.zanotti@tyvak.eu>
 <3462300528bbe71207ef2164411e34d2@walle.cc>
 <CAGiusB1JvHkX7GSvD2JsqKWwC5xBePX_ruWk9nU9gugoroLnKA@mail.gmail.com>
 <CAGiusB0B5dN_K+bW1xudmT6UNmVOL=voBOuSVJeiYo3v6ywO8w@mail.gmail.com>
 <4bf9396505975e3fee2cc6396a6eeff7@walle.cc>
In-Reply-To: <4bf9396505975e3fee2cc6396a6eeff7@walle.cc>
From: Andrea Zanotti <andreazanottifo@gmail.com>
Date: Wed, 1 Sep 2021 13:20:25 +0200
Message-ID: <CAGiusB29O+sNn9j2U9-VG0QV=9npUuWV=d5_sLyqD54SRgq9qA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: added support for np8p128ax60
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_042038_406292_633FD662 
X-CRM114-Status: GOOD (  52.48  )
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

I performed the test with drivers/misc/eeprom/at25.c.

I configured the DTS as such:
spi_pcm@0 {
compatible = "atmel,at25";
reg = <0>;
spi-max-frequency = <50000000>;
size = <16777216>;
pagesize = <64>;
address-width = <24>;
label = "micron_pcm";
};
and activated the driver itself in the kernel configuration.

I think the system is recognizing it:
# ls -l /sys/bus/spi/devices/spi0.0/eeprom
-rw-------    1 root     root      16777216 Jan  1 00:01
/sys/bus/spi/devices/spi0.0/eeprom

However, if I am not wrong (again, please correct me if I am wrong)
this driver does not
work with the MTD layer (I am booting with the following cmdline bootargs:
mtdparts=micron_pcm:128k(bootstrap),128k(fdt),10M(kernel/rootfs),-(spare)
and I expected to have the same partitions as before, but of course
they are missing.)

I am checking the Company ID on the document "JEP106BC", revisioned on
June 2020,
downloaded from here https://www.jedec.org/system/files/docs/JEP106BC.pdf.

STMicroelectronics should be 20
Micron should be 2C
Intel is advertised as 89, in Table 1 "Manufacturer's Identification Code".

How do you suggest to proceed?

Andrea

Il giorno mar 31 ago 2021 alle ore 17:05 Michael Walle
<michael@walle.cc> ha scritto:
>
> Hi Andrea,
>
> Am 2021-08-31 12:11, schrieb Andrea Zanotti:
> > Il giorno mar 31 ago 2021 alle ore 11:09 Andrea Zanotti
> > <andreazanottifo@gmail.com> ha scritto:
> >>
> >> Hi Michael,
> >>
> >> Il giorno mar 31 ago 2021 alle ore 10:39 Michael Walle
> >> <michael@walle.cc> ha scritto:
> >>>
> >>> Hi Andrea,
> >>>
> >>> Am 2021-08-31 10:13, schrieb Andrea Zanotti:
> >>> > From: Andrea Zanotti <andreazanottifo@gmail.com>
> >>> >
> >>> > Added support for P8P Parallel Phase Change Memory.
> >>>
> >>> Please use present tense, eg "add support..."
> >>>
> >>> Is there a public datasheet? If so, please include it above
> >>> your SoB like so:
> >>> Datasheet: https://...
> >>>
> >>
> >> I will format the header as per your suggestions. I used the same
> >> datasheet
> >> linked by you at the end of the email
> >>
> >>>
> >>> > Added memory information (page size and sector size) as per data-
> >>> > sheet information, after typos corrections.
> >>>
> >>> After typos corrections?
> >>>
> >>
> >> The one specified in the following paragraph. I'll better write this.
> >> (What I meant
> >> is that there are some typos in the datasheet itself)
> >>
> >>>
> >>> > At page 37, paragraph 'SPI Memory Organization', it is written
> >>> > down that the memory is organized as:
> >>> >  * 16.772.216 bytes (typo here, there 16.777.216 bytes)
> >>> >  * 128 sectors of 128 Kbytes each (correct)
> >>> >  * 131.072 pages of 64 bytes each (typo here, as the total would be
> >>> >    64Mbit, but the total memory is actually 128Mbit, correct value
> >>> >    is 262.144 pages)
> >>> >
> >>> > Patch tested against the aforementioned PCM memory.
> >>>
> >>> What SPI host controller was used?
> >>>
> >>
> >> I used an AT91SAM9G20 processor, SPI controller "atmel,at91rm9200-spi"
> >> (spi-atmel.c)
> >>
> >>>
> >>> > No known regressions inserted, as the patch only adds the possibility
> >>> > to recognize said PCM memory inside the common spi-nor driver.
> >>>
> >>> Please drop this. If there were any regressions, the patch wouldn't
> >>> be picked up anyway.
> >>>
> >>
> >> It will be dropped.
> >>
> >>> >
> >>> > Signed-off-by: Andrea Zanotti <andreazanottifo@gmail.com>
> >>> > ---
> >>> >  drivers/mtd/spi-nor/micron-st.c | 1 +
> >>> >  1 file changed, 1 insertion(+)
> >>> >
> >>> > diff --git a/drivers/mtd/spi-nor/micron-st.c
> >>> > b/drivers/mtd/spi-nor/micron-st.c
> >>> > index c224e59820a1..c78331451082 100644
> >>> > --- a/drivers/mtd/spi-nor/micron-st.c
> >>> > +++ b/drivers/mtd/spi-nor/micron-st.c
> >>> > @@ -128,6 +128,7 @@ static const struct flash_info micron_parts[] = {
> >>> >       { "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
> >>> >                           SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
> >>> >                           SPI_NOR_4B_OPCODES) },
> >>> > +     { "np8p128ax60", {0x89, 0xda, 0x18}, 3, 128 * 1024, 128, 64, 0, 0 },
> >>>
> >>> Eh? Please use INFO(). And why isn't this 0x20 for micron.
> >>>
> >>
> >> With INFO() macro I am locked in with .page_size = 256 (I would need
> >> 64), or am I missing something?
>
> Ok I see. Mh, then maybe there should be a new macro where you can
> set the page_size?
>
> >>>
> >>> I found this datasheet:
> >>> https://media.digikey.com/pdf/Data%20Sheets/Micron%20Technology%20Inc%20PDFs/NP8P128Ax60E_Rev_K.pdf
> >>>
> >>> According to that datasheet, the manuf id is 0x20. And the device id
> >>> should be either 0x88e1 or 0x8821.
> >>>
> >>
> >> You are right, checking it right now.
> >>
> >
> > - As per datasheet, table 10 on page 18, Manufacturer code is 0x89
> > (column "data" for parameter "Manufacturer Code").
>
> That is for the command 90h (which is for the parallel interface?). We
> issue 9Fh and according to the "READ IDENTIFICATION (RDID)" chapter:
>
>    The manufacturer identification is assigned by JEDEC and has the
>    value 20h for Micron.
>
> And in fact it is assigned by JEDEC, see below.
>
> > - On the datasheet, I agree with you that the device code is
> > advertised as either 0x88e1 or 0x8821. I changed the byte array
> > to something wrong in order to have the debug warning on the JEDEC id
> > bytes, and this is the log:
> >
> > spi-nor spi0.0: unrecognized JEDEC id bytes: 89 da 18 00 00 00
> >
> > Second and third byte are "0xda" and "0x18". I am not an expert in the
> > spi-nor driver, but from my understanding
> > (if it's wrong, please correct me) the spi-nor driver tries to match
> > the the read bytes from the memory with the ones
> > in the tables. I don't know if the datasheet is wrong also in that
> > cell of the table, or if I am interpreting the data wrongly.
>
> Looks like the datasheet is wrong or something is broken here. Yes
> you are correct in assuming that these are in fact the ID bytes.
>
> We'd need to check what vendor 0x89 is to avoid collisions with other
> vendors/flashes.
>
> Btw this "flash" has no need for an erase, just like the MRAM or an
> SPI EEPROM. Could you have a look at drivers/misc/eeprom/at25.c if
> that will work for you?
>
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
