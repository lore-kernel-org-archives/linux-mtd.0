Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B46DC004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 11:14:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0D6120825
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 11:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g18HYiSh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="M+0buRHQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0D6120825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1thneqwe0scVA4SJvS0rkAlvbpjOrNiwKw+5eFyuQPI=; b=g18HYiShZEy99D7lI2DOK8ray
	OdpZgyhc2mxJ9VRyKJsUk/JQsWzw2dg8tic/RnOKFsTA+m+7Low+WqeJpOf+MpjVFyS3Ou7Tz/U7j
	YboIp+DHIcUN2JNu8/2U6xSlmpJPCi5rQ8gUf32g48MGTujSkYK22ZZ1NSPWrVUMdFYASSbe90IMk
	WllRTFZeh8VH/0zqJNL3jz0KHkoyQJFUkXmtnVt4rXQzFdlsJMKGD4kEBxSGLcyibaPVlCBBzHoXm
	AvJeKSFsVP0JrAoN8eMsymXbysFErBObs72lpNbSJQI66DhVx0NROH3gXddpZbb1BYUhO/WYIfmCh
	A9YVhTU+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNy2v-0002bv-2f; Tue, 07 May 2019 11:14:05 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNy2r-0002az-OY
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 11:14:04 +0000
Received: by mail-lj1-x244.google.com with SMTP id 132so6207583ljj.4
 for <linux-mtd@lists.infradead.org>; Tue, 07 May 2019 04:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fr3vVn+oweMugLS8/jeaJuQnWyQkFbMOMxTckpCBdBk=;
 b=M+0buRHQVu6DimA19bSbeWMveoG1+aO/R/TFPANMunLbaA+fZWyo4H643NoWjoyTso
 Ckn3JKbpl5aBmaN8EDg/YhCGwxMl1EMB7GtW4hpaXU4OyEROXiwgaCAE1d0NXOm8mY8P
 UTdgPeQVgtlkCUSz/awJhqdrAO7jmmrfI67fvMBKeVbzKxKX89LSkBAXBy8pJCiPVi2c
 KcAD7DJU5JZIZBpx8PLzLZroeSgc1V4NkKSwRBRbwX/dltOaYoXIvXtdDUTZDI3B01Lm
 5P5eNqIOI9W0584Tx+2VvojIcWtC+hFZUA1iHm4XXZ97MD/MYS9gTFH+W5gg31ZdbaIo
 MgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fr3vVn+oweMugLS8/jeaJuQnWyQkFbMOMxTckpCBdBk=;
 b=DNPkyJglLWN8nLhD6IivNO7igfDDjjruv2VpFxIR3vf/IKbfVxTqMu3vdtYJHXut+/
 u7eg8zCtdNm3jOnw2KFS/J5DaBMsKtxruz5d2+ky1UJjUatkOTlLRg0FRZ79ljvSxhi3
 xngXGzgnDMXwwvVu42zlJk+1v6ltdsg7AVu9Gbo84HPIayGa4PPgbv6oRPNRB1v+Tkgt
 9j0DHvpGhwQ3etPjmtgUAvcfBJJGVtQ4Ls/4OtKEfVsrlL0SaMzUjqTapGfbRtYKfK27
 KmXxjD4aPmSmrm5jZbd+1+3bIQp85s/zNZgyzZ05mlV7ZXsneGOgLNS7p9Nc84ZcgZPH
 jIKw==
X-Gm-Message-State: APjAAAXv+zvdqYMXuQlWVrLtbUIcjxQXKN/Tap7xC+M1yTCyLTWLqoKo
 tFy6fIDU2a+fRTc2REw7YqlY5Q==
X-Google-Smtp-Source: APXvYqyuU6WupvU+Etjx7HXolNuuS90yj0op6CzYncR+RcIZxcsJGFz25eXZaMtgXlnSQOUoY47n1Q==
X-Received: by 2002:a2e:8957:: with SMTP id b23mr5056705ljk.30.1557227639179; 
 Tue, 07 May 2019 04:13:59 -0700 (PDT)
Received: from [10.42.2.174] (78-69-122-97-no54.tbcn.telia.com. [78.69.122.97])
 by smtp.gmail.com with ESMTPSA id o7sm1505603lfl.13.2019.05.07.04.13.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 04:13:58 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
Date: Tue, 7 May 2019 13:13:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_041401_919213_F12CD4F0 
X-CRM114-Status: GOOD (  17.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Geert,

On 07/05/2019 12:50, Geert Uytterhoeven wrote:
> Hi Tudor,
> 
> On Tue, May 7, 2019 at 12:42 PM <Tudor.Ambarus@microchip.com> wrote:
>> On 05/07/2019 12:53 PM, Geert Uytterhoeven wrote:
>>> On Wed, Mar 20, 2019 at 8:16 AM Jonas Bonn <jonas@norrbonn.se> wrote:
>>>> Both the BP[0-2] bits and the TBPROT bit are supported on this chip.
>>>> Tested and verified on a Cypress s25fl512s.
>>>>
>>>> Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
>>>
>>> This is now commit dcb4b22eeaf44f91 ("spi-nor: s25fl512s supports region
>>> locking") in mtd/next.
>>>
>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>> @@ -1898,7 +1898,9 @@ static const struct flash_info spi_nor_ids[] = {
>>>>                          SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>>>          { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
>>>>          { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>>> -       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>>>> +       { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
>>>> +                       SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>>> +                       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | USE_CLSR) },
>>>
>>> Setting SPI_NOR_HAS_LOCK causes the QSPI FLASH on r8a7791/koelsch to fail
>>> probing.
>>>
>>> Before/after:
>>>
>>>      -m25p80 spi0.0: s25fl512s (65536 Kbytes)
>>>      -3 fixed-partitions partitions found on MTD device spi0.0
>>>      -Creating 3 MTD partitions on "spi0.0":
>>>      -0x000000000000-0x000000080000 : "loader"
>>>      -0x000000080000-0x000000600000 : "user"
>>>      -0x000000600000-0x000004000000 : "flash"
>>>      +m25p80 spi0.0: Erase Error occurred
>>>      +m25p80 spi0.0: Erase Error occurred
>>>      +m25p80 spi0.0: timeout while writing configuration register
>>>      +m25p80 spi0.0: quad mode not supported
>>>      +m25p80: probe of spi0.0 failed with error -5
>>>

In drivers/mtd/spi-nor/spi-nor.c you have:

static int spi_nor_init(struct spi_nor *nor)
{
         int err;

         /*
          * Atmel, SST, Intel/Numonyx, and others serial NOR tend to 
power up
          * with the software protection bits set
          */
         if (JEDEC_MFR(nor->info) == SNOR_MFR_ATMEL ||
             JEDEC_MFR(nor->info) == SNOR_MFR_INTEL ||
             JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
             nor->info->flags & SPI_NOR_HAS_LOCK) {
                 write_enable(nor);
                 write_sr(nor, 0);
                 spi_nor_wait_till_ready(nor);
         }

         if (nor->quad_enable) {
                 err = nor->quad_enable(nor);
                 if (err) {
                         dev_err(nor->dev, "quad mode not supported\n");
                         return err;
                 }
         }

This is the only meaningful thing that I can see may have changed with 
this flag.  We now have an additional write_enable before quad_enable. 
What happens if you swap those two blocks above so that quad_enable is 
called first?

If it's not that, I can't see how the extra flags can have any effect.

Regards,
Jonas

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
