Received: from mail-la0-x22b.google.com ([2a00:1450:4010:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WarGJ-00066O-2c
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 18:42:15 +0000
Received: by mail-la0-f43.google.com with SMTP id e16so706715lan.30
 for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2014 11:41:50 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <201404171624.36700.marex@denx.de>
References: <1397641641-11430-1-git-send-email-b32955@freescale.com>
 <201404171624.36700.marex@denx.de>
Date: Thu, 17 Apr 2014 20:41:50 +0200
Message-ID: <CAMuHMdVY_n88uR7zOAZTo_V7Sg5zzaUFQjdaTSZeVj6Jbh0Txw@mail.gmail.com>
Subject: Re: [RFC PATCH] mtd: spi-nor: add DDR quad read support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: angus.clark@st.com, Huang Shijie <b32955@freescale.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 17, 2014 at 4:24 PM, Marek Vasut <marex@denx.de> wrote:
>> @@ -1016,8 +1038,15 @@ int spi_nor_scan(struct spi_nor *nor, const struct
>> spi_device_id *id, if (info->flags & SPI_NOR_NO_FR)
>>               nor->flash_read = SPI_NOR_NORMAL;
>>
>> -     /* Quad/Dual-read mode takes precedence over fast/normal */
>> -     if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
>> +     /* DDR Quad/Quad/Dual-read mode takes precedence over fast/normal */
>> +     if (mode == SPI_NOR_DDR_QUAD && info->flags & SPI_NOR_DDR_QUAD_READ) {
>> +             ret = set_ddr_quad_mode(nor, info->jedec_id);
>> +             if (ret) {
>> +                     dev_err(dev, "DDR quad mode not supported\n");
>> +                     return ret;
>
> Is it really necessary to fail here? Can we not fall back to some "lower" mode ?

IIRC, the original m25p80 also fails, FWIW...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
