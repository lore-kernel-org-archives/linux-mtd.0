Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoR5L-0000bW-Hz
 for linux-mtd@lists.infradead.org; Wed, 12 Nov 2014 06:07:20 +0000
Received: by mail-ie0-f174.google.com with SMTP id x19so13001391ier.19
 for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2014 22:06:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20141111221152.GB24364@ld-irv-0074>
References: <14155940648@kroah.com> <20141110235349.GA24364@ld-irv-0074>
 <20141111051759.GC23920@kroah.com>
 <1415725705.3398.98.camel@decadent.org.uk>
 <20141111221152.GB24364@ld-irv-0074>
Date: Wed, 12 Nov 2014 07:06:57 +0100
Message-ID: <CACna6rzGgC3SvakPStqnydC1cgwrbSyX2WL6xVdfTdUE3mV6og@mail.gmail.com>
Subject: Re: FAILED: patch "[PATCH] mtd: m25p80,spi-nor: Fix module aliases
 for m25p80" failed to apply to 3.17-stable tree
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Greg KH <gregkh@linuxfoundation.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>, Stable <stable@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 November 2014 23:11, Brian Norris <computersforpeace@gmail.com> wrote=
:
> How about the following backport? I compile tested with
> CONFIG_MTD_M25P80 as 'm' and 'y', and I made sure the module aliases
> show up in modinfo.
>
> From: Ben Hutchings <ben@decadent.org.uk>
> Date: Tue, 30 Sep 2014 03:14:55 +0100
> Subject: [PATCH] mtd: m25p80: Fix module aliases for m25p80
>
> m25p80's device ID table is now spi_nor_ids, defined in spi-nor.  The
> MODULE_DEVICE_TABLE() macro doesn't work with extern definitions, but
> its use was also removed at the same time.  Now if m25p80 is built as
> a module it doesn't get the necessary aliases to be loaded
> automatically.
>
> A clean solution to this will involve defining the list of device
> IDs in spi-nor.h and removing struct spi_device_id from the spi-nor
> API, but this is quite a large change.
>
> As a quick fix suitable for stable, copy the device IDs back into
> m25p80.
>
> Fixes: 03e296f613af ("mtd: m25p80: use the SPI nor framework")
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> [Brian: backport without the dependencies]
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c | 50 ++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index ed7e0a1bed3c..5935f0a3ac6f 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -245,6 +245,56 @@ static int m25p_remove(struct spi_device *spi)
>  }
>
>
> +/*
> + * XXX This needs to be kept in sync with spi_nor_ids.  We can't share
> + * it with spi-nor, because if this is built as a module then modpost
> + * won't be able to read it and add appropriate aliases.
> + */
> +static const struct spi_device_id m25p_ids[] =3D {
> +       {"at25fs010"},  {"at25fs040"},  {"at25df041a"}, {"at25df321a"},
> +       {"at25df641"},  {"at26f004"},   {"at26df081a"}, {"at26df161a"},
> +       {"at26df321"},  {"at45db081d"},
> +       {"en25f32"},    {"en25p32"},    {"en25q32b"},   {"en25p64"},
> +       {"en25q64"},    {"en25qh128"},  {"en25qh256"},
> +       {"f25l32pa"},
> +       {"mr25h256"},   {"mr25h10"},
> +       {"gd25q32"},    {"gd25q64"},
> +       {"160s33b"},    {"320s33b"},    {"640s33b"},
> +       {"mx25l2005a"}, {"mx25l4005a"}, {"mx25l8005"},  {"mx25l1606e"},
> +       {"mx25l3205d"}, {"mx25l3255e"}, {"mx25l6405d"}, {"mx25l12805d"},
> +       {"mx25l12855e"},{"mx25l25635e"},{"mx25l25655e"},{"mx66l51235l"},
> +       {"mx66l1g55g"},
> +       {"n25q064"},    {"n25q128a11"}, {"n25q128a13"}, {"n25q256a"},
> +       {"n25q512a"},   {"n25q512ax3"}, {"n25q00"},
> +       {"pm25lv512"},  {"pm25lv010"},  {"pm25lq032"},
> +       {"s25sl032p"},  {"s25sl064p"},  {"s25fl256s0"}, {"s25fl256s1"},
> +       {"s25fl512s"},  {"s70fl01gs"},  {"s25sl12800"}, {"s25sl12801"},
> +       {"s25fl129p0"}, {"s25fl129p1"}, {"s25sl004a"},  {"s25sl008a"},
> +       {"s25sl016a"},  {"s25sl032a"},  {"s25sl064a"},  {"s25fl008k"},
> +       {"s25fl016k"},  {"s25fl064k"},
> +       {"sst25vf040b"},{"sst25vf080b"},{"sst25vf016b"},{"sst25vf032b"},
> +       {"sst25vf064c"},{"sst25wf512"}, {"sst25wf010"}, {"sst25wf020"},
> +       {"sst25wf040"},
> +       {"m25p05"},     {"m25p10"},     {"m25p20"},     {"m25p40"},
> +       {"m25p80"},     {"m25p16"},     {"m25p32"},     {"m25p64"},
> +       {"m25p128"},    {"n25q032"},
> +       {"m25p05-nonjedec"},    {"m25p10-nonjedec"},    {"m25p20-nonjedec=
"},
> +       {"m25p40-nonjedec"},    {"m25p80-nonjedec"},    {"m25p16-nonjedec=
"},
> +       {"m25p32-nonjedec"},    {"m25p64-nonjedec"},    {"m25p128-nonjede=
c"},
> +       {"m45pe10"},    {"m45pe80"},    {"m45pe16"},
> +       {"m25pe20"},    {"m25pe80"},    {"m25pe16"},
> +       {"m25px16"},    {"m25px32"},    {"m25px32-s0"}, {"m25px32-s1"},
> +       {"m25px64"},
> +       {"w25x10"},     {"w25x20"},     {"w25x40"},     {"w25x80"},
> +       {"w25x16"},     {"w25x32"},     {"w25q32"},     {"w25q32dw"},
> +       {"w25x64"},     {"w25q64"},     {"w25q128"},    {"w25q80"},
> +       {"w25q80bl"},   {"w25q128"},    {"w25q256"},    {"cat25c11"},
> +       {"cat25c03"},   {"cat25c09"},   {"cat25c17"},   {"cat25128"},
> +       { },
> +};
> +MODULE_DEVICE_TABLE(spi, m25p_ids);

One question: is changing MODULE_DEVICE_TABLE enough to trigger proper
module auto-load?

So far I believed MODULE_DEVICE_TABLE is used for "modinfo" only. I
also believed that loading module is triggered by the "id_table".

--=20
Rafa=C5=82
