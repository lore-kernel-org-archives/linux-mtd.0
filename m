Received: from mail-it0-x22d.google.com ([2607:f8b0:4001:c0b::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQ0DA-0002wg-R4
 for linux-mtd@lists.infradead.org; Tue, 27 Jun 2017 23:48:02 +0000
Received: by mail-it0-x22d.google.com with SMTP id b205so24771216itg.1
 for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2017 16:47:39 -0700 (PDT)
MIME-Version: 1.0
Sender: keescook@google.com
In-Reply-To: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 27 Jun 2017 16:47:37 -0700
Message-ID: <CAGXu5jK+oz7SoBKmHDjUpmZ96=keiou+75WK2or37Z8RL9jLxA@mail.gmail.com>
Subject: Re: [PATCH 0/9] Drop unnecessary static
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Linux PM list <linux-pm@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Linux mtd <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 drbd-dev@lists.linbit.com, linux-omap@vger.kernel.org,
 Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 linux-input <linux-input@vger.kernel.org>, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 4, 2017 at 1:10 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> These patches fix cases where there is a static on a local variable, but
> the variable is either first initialized or never used, on every possible
> execution path through the function.  The static has no benefit, and
> dropping it reduces the code size.
>
> ---
>
>  drivers/block/drbd/drbd_nl.c            |    2 +-
>  drivers/clocksource/timer-fttmr010.c    |    2 +-
>  drivers/iio/accel/hid-sensor-accel-3d.c |    2 +-
>  drivers/mfd/max8925-i2c.c               |    2 +-
>  drivers/mfd/twl4030-irq.c               |    2 +-
>  drivers/mtd/chips/cfi_cmdset_0020.c     |    2 +-
>  drivers/mtd/maps/physmap_of_gemini.c    |    2 +-
>  drivers/power/supply/axp20x_usb_power.c |    2 +-
>  drivers/regulator/palmas-regulator.c    |    2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)

It looks like most of these were taken. I pinged the other three. Thanks!

-Kees

-- 
Kees Cook
Pixel Security
