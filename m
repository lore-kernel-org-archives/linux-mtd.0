Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTMGm-0002WZ-3q
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2018 07:34:25 +0000
Received: by mail-it1-x143.google.com with SMTP id c9so4333918itj.1
 for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2018 23:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20181202015417.9100-1-tiny.windzz@gmail.com>
 <20181202081832.08de39b2@bbrezillon>
In-Reply-To: <20181202081832.08de39b2@bbrezillon>
From: Frank Lee <tiny.windzz@gmail.com>
Date: Sun, 2 Dec 2018 15:33:45 +0800
Message-ID: <CAEExFWtho0qZd6mNZnT_uiYhXcfKzEaTnj81cx21Ny5m1xFgfA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: remove DEBUGFS_RO_ATTR()
To: boris.brezillon@bootlin.com
Cc: robert.jarzmik@free.fr, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 richard@nod.at, miquel.raynal@bootlin.com, Kees Cook <keescook@chromium.org>,
 Shreeya Patel <shreeya.patel23498@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 2, 2018 at 3:18 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Sat,  1 Dec 2018 20:54:17 -0500
> Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> > We already have the DEFINE_SHOW_ATTRIBUTE.There is no need to define
> > such a macro,so remove DEBUGFS_RO_ATTR.Also use DEFINE_SHOW_ATTRIBUTE
> > to simplify some code.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> > Changes in v2:
> > -Remove a missing DEBUGFS_RO_ATTR
> > ---
> >  drivers/mtd/devices/docg3.c    | 20 ++++++++++++--------
> >  drivers/mtd/devices/docg3.h    | 11 -----------
> >  drivers/mtd/mtdswap.c          | 12 +-----------
> >  drivers/mtd/nand/raw/nandsim.c | 16 +++-------------
> >  4 files changed, 16 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> > index 512bd4c2eec0..80143972963e 100644
> > --- a/drivers/mtd/devices/docg3.c
> > +++ b/drivers/mtd/devices/docg3.c
> > @@ -1603,7 +1603,7 @@ static void doc_unregister_sysfs(struct platform_device *pdev,
> >  /*
> >   * Debug sysfs entries
> >   */
> > -static int dbg_flashctrl_show(struct seq_file *s, void *p)
> > +static int flashcontrol_show(struct seq_file *s, void *p)
> >  {
> >       struct docg3 *docg3 = (struct docg3 *)s->private;
> >
> > @@ -1623,9 +1623,10 @@ static int dbg_flashctrl_show(struct seq_file *s, void *p)
> >
> >       return 0;
> >  }
> > -DEBUGFS_RO_ATTR(flashcontrol, dbg_flashctrl_show);
> >
> > -static int dbg_asicmode_show(struct seq_file *s, void *p)
> > +DEFINE_SHOW_ATTRIBUTE(flashcontrol);
>
> Just nitpicking, but can you remove the blank line between the function
> definition and DEFINE_SHOW_ATTRIBUTE()?
The third edition has been sent, can you review it?

Yours,
Yangtao
