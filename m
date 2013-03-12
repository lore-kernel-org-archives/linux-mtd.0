MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
References: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
Date: Tue, 12 Mar 2013 12:21:19 +0100
Message-ID: <CAMuHMdWT1DXrOjpqXbLWqh982qHD8vAy-dwXGcUn4HoTMEZVxQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] mtd: remove dead map drivers
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-m68k@lists.linux-m68k.org, linux-pcmcia@lists.infradead.org,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 12, 2013 at 12:14 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> This patch-set removes a bunch of dean MTD map drivers. The way I judged
> whether a driver is dead or not was looking at driver's dependencies in the
> Kconfig file. Whenever I saw a driver depending on a Kconfig symbol which is
> not defined anywhere, I treated the driver as dead.
>
> The motivation for this patch-set is to clean up the MTD subsystem a little and
> lessen the maintenance burden. Indeed, the less drivers we have, the easier it
> is to do MTD framework refactoring.

Most of these are PPC boards, not m68k.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
