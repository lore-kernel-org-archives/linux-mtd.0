MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1412043352.9388.86.camel@decadent.org.uk>
References: <1412043222.9388.81.camel@decadent.org.uk>
 <1412043352.9388.86.camel@decadent.org.uk>
Date: Tue, 30 Sep 2014 09:22:44 +0200
Message-ID: <CAMuHMdXRu0tMc1kbWfoVzh=Efky31zQEJDZtRUg_EHXdi-xCjg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] m25p80,spi-nor: Share the list of supported chip
 type names again
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset=UTF-8
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ian Campbell <ijc@hellion.org.uk>, Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ben,

On Tue, Sep 30, 2014 at 4:15 AM, Ben Hutchings <ben@decadent.org.uk> wrote:
> Move the list of chip type information to a macro in spi-nor.h, but
> leave the definitions of INFO and CAT25_INFO in spi-nor.
>
> In m25p80, define the INFO and CAT25_INFO macros to initialise a
> struct spi_device_id with the name, ignoring the remaining parameters.
>
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>

Thanks!

I didn't have an in-depth look, but this looks much better, and has less
opportunities for getting out-of-sync.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
