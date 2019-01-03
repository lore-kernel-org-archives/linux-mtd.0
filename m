Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfCPZ-0003QW-CF
 for linux-mtd@lists.infradead.org; Thu, 03 Jan 2019 23:28:27 +0000
Received: by mail-lf1-f44.google.com with SMTP id z13so24279764lfe.11
 for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2019 15:28:24 -0800 (PST)
MIME-Version: 1.0
References: <CANNa7-XH1Qm8A5fzUM29pDsmLke4SP-+=PoJtumai8jv1nqFBg@mail.gmail.com>
 <7370989.dTfg6tCZom@blindfold>
 <CANNa7-WA3PQDQJr+OB1G1rf9rcRq50hH53_UXBwh8rEnFAv4oA@mail.gmail.com>
 <11295148.y3O6aSSZPf@blindfold>
In-Reply-To: <11295148.y3O6aSSZPf@blindfold>
From: Ron Bowes <ron@skullsecurity.net>
Date: Thu, 3 Jan 2019 15:28:09 -0800
Message-ID: <CANNa7-Wc4+cvPZBMWvVjPBkhMjQ-yV8iWXXqA+J-gzDvZjZ-Hg@mail.gmail.com>
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

Hey folks,

Thanks for the pointers! I removed all the OOB data, which gave me a
pristine dump. I was able to extract other stuff (like the kernel and
boot image) once that was all removed. I also grabbed a clean dump of
the UBI filesystem, without all the OOB stuff.

Once that was done, I used ubi_reader to convert it to a ubifs (I'm
sure I could have done that with mtdtools as well).

Then I used this guide, pretty much as-is, to mount it:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_extract

Thanks so much for your help!


Ron

On Thu, Jan 3, 2019 at 12:41 PM Richard Weinberger <richard@nod.at> wrote:
>
> Ron,
>
> Am Donnerstag, 3. Januar 2019, 21:35:46 CET schrieb Ron Bowes:
> > I hadn't heard of nandsim, I'll take a look!
> >
> > I was using -O for the VID header, but ubiattach was complaining about
> > data_offset being unusual.
>
> Yeah, I bet this was due to the simulated NOR chip. NOR does not have OOB.
>
> > It's probably the OOB data, though, so nandsim may fix all my problems.
>
> :-)
>
> Thanks,
> //richard
>
>
