Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gf9ih-0002C5-JF
 for linux-mtd@lists.infradead.org; Thu, 03 Jan 2019 20:36:00 +0000
Received: by mail-lf1-f42.google.com with SMTP id z13so24022012lfe.11
 for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2019 12:35:59 -0800 (PST)
MIME-Version: 1.0
References: <CANNa7-XH1Qm8A5fzUM29pDsmLke4SP-+=PoJtumai8jv1nqFBg@mail.gmail.com>
 <CAFLxGvw2QXVJ29mwJt-1WMkpXBrq4fAgzJPS2BQi+ErPZFL1Lg@mail.gmail.com>
 <CANNa7-XkT=PnK4P6g_T1NCSRC+2v_kpU2hNJJY8dv+UB0ifEdQ@mail.gmail.com>
 <7370989.dTfg6tCZom@blindfold>
In-Reply-To: <7370989.dTfg6tCZom@blindfold>
From: Ron Bowes <ron@skullsecurity.net>
Date: Thu, 3 Jan 2019 12:35:46 -0800
Message-ID: <CANNa7-WA3PQDQJr+OB1G1rf9rcRq50hH53_UXBwh8rEnFAv4oA@mail.gmail.com>
Subject: Re: Having trouble with a UBI filesystem
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I hadn't heard of nandsim, I'll take a look!

I was using -O for the VID header, but ubiattach was complaining about
data_offset being unusual.

It's probably the OOB data, though, so nandsim may fix all my problems.

Thanks so much!

On Thu, Jan 3, 2019 at 12:34 PM Richard Weinberger <richard@nod.at> wrote:
>
> Ron,
>
> Am Donnerstag, 3. Januar 2019, 21:30:59 CET schrieb Ron Bowes:
> > I tried using mtdram and ubiattach, but I couldn't get it to work
> > right. It always complained that the data started at 0x1000 instead of
> > 0x840, and I couldn't figure out why:
>
> I suggest using nandsim, since this is a NAND image.
>
> Find the id bytes if the NAND chip and pass them to nandsim, then use ubiattach.
> It has a "-O" parameter to set the offset of the VID header yourself.
> This is often needed when the sub-page configuration is different.
>
> Thanks,
> //richard
>
>
>
