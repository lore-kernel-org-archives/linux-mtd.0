Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjXVZ-0002Hw-8j
 for linux-mtd@lists.infradead.org; Mon, 12 Sep 2016 20:07:14 +0000
Received: by mail-wm0-x242.google.com with SMTP id a6so15195651wmc.2
 for <linux-mtd@lists.infradead.org>; Mon, 12 Sep 2016 13:06:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUb6nhzzkPy4z1tFouM+FAsNKhh=EXYFTSL00ziSUcKqw@mail.gmail.com>
References: <1473448438-13245-1-git-send-email-kdasu.kdev@gmail.com>
 <CAMuHMdUb6nhzzkPy4z1tFouM+FAsNKhh=EXYFTSL00ziSUcKqw@mail.gmail.com>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Mon, 12 Sep 2016 16:06:50 -0400
Message-ID: <CAC=U0a3Pm=raVj0HnBjwiyf0eZNnCv4KP=uys31fk1UxtYdTqQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: devices: m25p80: Add PM suspend resume support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-spi <linux-spi@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "Jayachandran C <jchandra@broadcom.com>,
 bcm-kernel-feedback-list" <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Geert,

 I agree that scan code can be refactored into a common function to be
called by probe and resume. Will send a v2 patch with the changes.

Thanks
Kamal

On Sun, Sep 11, 2016 at 6:10 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Sep 9, 2016 at 9:13 PM, Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>> Adding PM support so as to be able to probe spi-nor flash
>> on resume. There are vendor specific commands to setup
>> the transfer mode and enable read/write as part of
>> spi_nor_scan(), done on intial probe and needed on resume().
>> The spi-nor stucture is private to the m25p driver and hence
>> is the only place this can be done without having to duplicate
>> code in controller driver.
>>
>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>> ---
>>  drivers/mtd/devices/m25p80.c | 37 ++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 9cf7fcd..f8294b4 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>
>> +static int m25p_resume(struct device *dev)
>> +{
>> +       struct m25p *flash = dev_get_drvdata(dev);
>> +       struct flash_platform_data      *data;
>> +       char *flash_name = NULL;
>> +       enum read_mode mode = SPI_NOR_NORMAL;
>> +       int ret;
>> +
>> +       data = dev_get_platdata(&flash->spi->dev);
>> +
>> +       if (data && data->type)
>> +               flash_name = data->type;
>> +       else if (!strcmp(flash->spi->modalias, "spi-nor"))
>> +               flash_name = NULL; /* auto-detect */
>> +       else
>> +               flash_name = flash->spi->modalias;
>> +
>> +       if (flash->spi->mode & SPI_RX_QUAD)
>> +               mode = SPI_NOR_QUAD;
>> +       else if (flash->spi->mode & SPI_RX_DUAL)
>> +               mode = SPI_NOR_DUAL;
>> +
>> +       ret = spi_nor_scan(&flash->spi_nor, flash_name, mode);
>
> All of the above is also done in m25p_probe(). Hence please factor out the
> commonalities into its own function.
>
>> +
>> +       return ret;
>> +}
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
