MIME-Version: 1.0
References: <20180926142029.619397-1-arnd@arndb.de>
 <20180926165240.77a78fc4@xps13>
In-Reply-To: <20180926165240.77a78fc4@xps13>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 26 Sep 2018 17:30:21 +0200
Message-ID: <CAK8P3a29=N9AoBAfKzNR-8fKQgoLGyPJJrqXn0eMwas+nKWN=A@mail.gmail.com>
Subject: Re: [PATCH] [v2] ARM: omap1: add nand_chip declaration
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Paul Burton <paul.burton@mips.com>,
 Wolfram Sang <wsa@the-dreams.de>, Suman Anna <s-anna@ti.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 26, 2018 at 4:52 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Arnd Bergmann <arnd@arndb.de> wrote on Wed, 26 Sep 2018 16:20:16 +0200:
> > @@ -82,6 +81,7 @@ void omap1_restart(enum reboot_mode, const char *);
> >
> >  extern void __init omap_check_revision(void);
> >
> > +struct nand_chip;
> >  extern void omap1_nand_cmd_ctl(struct nand_chip *this, int cmd,
> >                              unsigned int ctrl);
> >
>
> Boris pointed me that the commit introducing the regression is still
> in nand/next, so do you mind if I squash both patches with it?

No worries, please do that if it makes it easier for you.

      Arnd
