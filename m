Return-Path: <SRS0=P3/5=NW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA25C432BE
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 10:12:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 985DF60ED4
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 10:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 985DF60ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g/Lls/Ha/5TV/eeLHXgUhuptWaYu2rsvxzsAONhTxfE=; b=PdxF0YtkbJbqkh
	s9XOl//uuy2URK0NK5Yj7u9iWMpxW8MDbiZOTrAepqehWskJ85cqPiHxjRqN31UIb9k9a9jjeE8X7
	XFlwZDw38CbKxiz1tcDuJWNuYV30vtBS8A+VRsuY4yyVlUlHbrUAzr9Bxbx58Nb4MSq06RDjhla02
	sRo2eModOlzRjan8Td+f/Vrx8AE2fjKsIKEIApwwWYleI6E3oWC+dpLoG6LCzghCCs0diE1NEeqd0
	RswbE85OtCwMypz1etsXxP1s3oVuW4PajL0j1SI4oRVTo40mDatSe9btMyrspDhMc2gc6HcljFU7E
	4xDU54mhtelZTs6N5axg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL0kS-0020sT-SO; Tue, 31 Aug 2021 10:12:08 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL0kN-0020s1-Mn
 for linux-mtd@lists.infradead.org; Tue, 31 Aug 2021 10:12:07 +0000
Received: by mail-vs1-xe32.google.com with SMTP id q29so12747776vsj.13
 for <linux-mtd@lists.infradead.org>; Tue, 31 Aug 2021 03:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wUx9AilQ+AUyPyHc5fO1JUyPo2HU3YLKNAizhA+/8FE=;
 b=sOPJJ7n2Tmx2ziD+UDZjtQj/gs/Ps8snP6q1z0XiyW3jwkSZxRo8HulkCVR/mftPx0
 irPAqcrIjWATVUmClr36hJnwZbxmoeXKQWEaHMAeB6gw/ULMtNagd43WIxvrWh2G9PGY
 D/6A+W/ZqHSUvdsWXuVfCLz7iMjy1MU257lak/fzt3j7zP4jhz2pDB5G3/9F5YESyjEK
 KOoFc7hA7xfywJC49fnx8N79qbdZ76805Bd7O/wpfwYT1I1EBuO20WMfn3Q8PAMVYc06
 rpRREhRswcsE0NvYAltP/Acix/MAt+5qOvocD+LUP68sAYmx0XsP/CvbuN6ZJn30kd7j
 2Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wUx9AilQ+AUyPyHc5fO1JUyPo2HU3YLKNAizhA+/8FE=;
 b=tdYzQa5UxGdhjr7gYEuacWA75lYE3ZwtheNah++O4zr6WK9zI062p2g4O6JPCYAecO
 ecbNavR113Wa41tffGMTuIpwjtqta7SOgNgpFbsZUM45/yVZY3bT3n7bDQLts31FujV0
 hSfpFUXO4jhupfgZNFeM8Qnj+0hrty9PDTO6w0ZF6GCCAbWu8fSu1Tn3I0289iuOn8fh
 LcUAsX/n6+5OkZzQoVvv2f22dhqfqgkIBQF6DAbt0c8TFG99i02rqMMm6iDJZQUodAPF
 JNSJlk7fzTM+dyj1QgigsXpiQRBIHPk1p6yy1r//UpeWj+ktwlSDStmZKy9dxw8RjFpe
 vUaQ==
X-Gm-Message-State: AOAM530/6bctjLKxTG+SAheAivU+tNJrWAkWXub604k+KvCgptpR6jAK
 VS+dsdjwkhLOdhOtuoDKbsrRu3dsSSvIzxv55R8cQ/VGxvbVLJ6o
X-Google-Smtp-Source: ABdhPJye8rMX0HxgK/KxqQ6iMBZgBafrJ/5gFkBOep8PQRFiWZSzYG77BfW3DEQAHUpctBSnWFRoOlkFrmNSSVzDLUk=
X-Received: by 2002:a67:ee19:: with SMTP id f25mr12491527vsp.30.1630404722238; 
 Tue, 31 Aug 2021 03:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210831081329.27420-1-andrea.zanotti@tyvak.eu>
 <3462300528bbe71207ef2164411e34d2@walle.cc>
 <CAGiusB1JvHkX7GSvD2JsqKWwC5xBePX_ruWk9nU9gugoroLnKA@mail.gmail.com>
In-Reply-To: <CAGiusB1JvHkX7GSvD2JsqKWwC5xBePX_ruWk9nU9gugoroLnKA@mail.gmail.com>
From: Andrea Zanotti <andreazanottifo@gmail.com>
Date: Tue, 31 Aug 2021 12:11:51 +0200
Message-ID: <CAGiusB0B5dN_K+bW1xudmT6UNmVOL=voBOuSVJeiYo3v6ywO8w@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: added support for np8p128ax60
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_031203_791192_0CFB1511 
X-CRM114-Status: GOOD (  34.59  )
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

Il giorno mar 31 ago 2021 alle ore 11:09 Andrea Zanotti
<andreazanottifo@gmail.com> ha scritto:
>
> Hi Michael,
>
> Il giorno mar 31 ago 2021 alle ore 10:39 Michael Walle <michael@walle.cc> ha scritto:
>>
>> Hi Andrea,
>>
>> Am 2021-08-31 10:13, schrieb Andrea Zanotti:
>> > From: Andrea Zanotti <andreazanottifo@gmail.com>
>> >
>> > Added support for P8P Parallel Phase Change Memory.
>>
>> Please use present tense, eg "add support..."
>>
>> Is there a public datasheet? If so, please include it above
>> your SoB like so:
>> Datasheet: https://...
>>
>
> I will format the header as per your suggestions. I used the same datasheet
> linked by you at the end of the email
>
>>
>> > Added memory information (page size and sector size) as per data-
>> > sheet information, after typos corrections.
>>
>> After typos corrections?
>>
>
> The one specified in the following paragraph. I'll better write this. (What I meant
> is that there are some typos in the datasheet itself)
>
>>
>> > At page 37, paragraph 'SPI Memory Organization', it is written
>> > down that the memory is organized as:
>> >  * 16.772.216 bytes (typo here, there 16.777.216 bytes)
>> >  * 128 sectors of 128 Kbytes each (correct)
>> >  * 131.072 pages of 64 bytes each (typo here, as the total would be
>> >    64Mbit, but the total memory is actually 128Mbit, correct value
>> >    is 262.144 pages)
>> >
>> > Patch tested against the aforementioned PCM memory.
>>
>> What SPI host controller was used?
>>
>
> I used an AT91SAM9G20 processor, SPI controller "atmel,at91rm9200-spi" (spi-atmel.c)
>
>>
>> > No known regressions inserted, as the patch only adds the possibility
>> > to recognize said PCM memory inside the common spi-nor driver.
>>
>> Please drop this. If there were any regressions, the patch wouldn't
>> be picked up anyway.
>>
>
> It will be dropped.
>
>> >
>> > Signed-off-by: Andrea Zanotti <andreazanottifo@gmail.com>
>> > ---
>> >  drivers/mtd/spi-nor/micron-st.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/mtd/spi-nor/micron-st.c
>> > b/drivers/mtd/spi-nor/micron-st.c
>> > index c224e59820a1..c78331451082 100644
>> > --- a/drivers/mtd/spi-nor/micron-st.c
>> > +++ b/drivers/mtd/spi-nor/micron-st.c
>> > @@ -128,6 +128,7 @@ static const struct flash_info micron_parts[] = {
>> >       { "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
>> >                           SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
>> >                           SPI_NOR_4B_OPCODES) },
>> > +     { "np8p128ax60", {0x89, 0xda, 0x18}, 3, 128 * 1024, 128, 64, 0, 0 },
>>
>> Eh? Please use INFO(). And why isn't this 0x20 for micron.
>>
>
> With INFO() macro I am locked in with .page_size = 256 (I would need 64), or am I missing something?
>
>>
>> I found this datasheet:
>> https://media.digikey.com/pdf/Data%20Sheets/Micron%20Technology%20Inc%20PDFs/NP8P128Ax60E_Rev_K.pdf
>>
>> According to that datasheet, the manuf id is 0x20. And the device id
>> should be either 0x88e1 or 0x8821.
>>
>
> You are right, checking it right now.
>

- As per datasheet, table 10 on page 18, Manufacturer code is 0x89
(column "data" for parameter "Manufacturer Code").
- On the datasheet, I agree with you that the device code is
advertised as either 0x88e1 or 0x8821. I changed the byte array
to something wrong in order to have the debug warning on the JEDEC id
bytes, and this is the log:

spi-nor spi0.0: unrecognized JEDEC id bytes: 89 da 18 00 00 00

Second and third byte are "0xda" and "0x18". I am not an expert in the
spi-nor driver, but from my understanding
(if it's wrong, please correct me) the spi-nor driver tries to match
the the read bytes from the memory with the ones
in the tables. I don't know if the datasheet is wrong also in that
cell of the table, or if I am interpreting the data wrongly.


>>
>> >  };
>> >
>> >  static const struct flash_info st_parts[] = {
>>
>> --
>> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
