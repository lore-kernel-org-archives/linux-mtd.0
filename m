Received: from mail-vk1-f193.google.com ([209.85.221.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAFh1-0003f4-7p
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2018 14:42:43 +0000
Received: by mail-vk1-f193.google.com with SMTP id y128-v6so1326507vky.4
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2018 07:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20181010134036.8296-1-geert+renesas@glider.be>
 <20181010134317.8466-1-geert+renesas@glider.be>
 <20181010134317.8466-2-geert+renesas@glider.be>
 <CAK8P3a1vSqKk4jRoz-YOnLKP6uL7sPRLj9=BVz92mnjNjbJ3Tg@mail.gmail.com>
In-Reply-To: <CAK8P3a1vSqKk4jRoz-YOnLKP6uL7sPRLj9=BVz92mnjNjbJ3Tg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Oct 2018 16:42:06 +0200
Message-ID: <CAMuHMdVs7CTqeyxM_dZ2aLZOc_Deo3cOWocwFBCGCY8xcyJo0g@mail.gmail.com>
Subject: Re: [PATCH 1/3] eeprom: at25: Drop obsolete cast in at25_ee_write()
To: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg KH <gregkh@linuxfoundation.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd,

On Wed, Oct 10, 2018 at 4:01 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On 10/10/18, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > Since commit 01973a01f9ec34b7 ("eeprom: at25: remove nvmem regmap
> > dependency") changed the type of "off" from "loff_t" to "unsigned int",
> > there is no longer a need to cast it to "unsigned".
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/misc/eeprom/at25.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
> > index 840afb398f9e4c88..7707d3fb49b526d9 100644
> > --- a/drivers/misc/eeprom/at25.c
> > +++ b/drivers/misc/eeprom/at25.c
> > @@ -160,7 +160,7 @@ static int at25_ee_write(void *priv, unsigned int off,
> > void *val, size_t count)
> >       do {
> >               unsigned long   timeout, retries;
> >               unsigned        segment;
> > -             unsigned        offset = (unsigned) off;
> > +             unsigned        offset = off;
> >               u8              *cp = bounce;
> >               int             sr;
> >               u8              instr;
> > --
>
> This looks correct, but why not remove the extra variable completely
> and rename 'off' to 'offset'?

Thanks, good point. Will do.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
