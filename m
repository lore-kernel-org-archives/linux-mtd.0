Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWNfY-0007Oa-A9
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2018 15:40:30 +0000
Date: Mon, 10 Dec 2018 16:40:16 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Thomas Gleixner
 <tglx@linutronix.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>
Subject: Re: [EXT] Re: [PATCH RFC] mtd: rawnand: Cure MICRON NAND partial
 erase issue
Message-ID: <20181210164016.0a3cf27a@xps13>
In-Reply-To: <BYASPR01MB00310C7F883FF6E06A2DA5C5DBAA0@BYASPR01MB0031.namprd08.prod.outlook.com>
References: <alpine.DEB.2.21.1811292207570.1657@nanos.tec.linutronix.de>
 <20181202082918.3b5f303a@bbrezillon>
 <BYASPR01MB00310C7F883FF6E06A2DA5C5DBAA0@BYASPR01MB0031.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bean,

"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote on Fri, 7 Dec 2018
13:12:56 +0000:

> >+Bean,
> >
> >Hi Thomas,
> >
> >First of all, I'd like to thank you for sharing this patch. I'm pretty s=
ure this will
> >save days of painful debug sessions to a lot of people.
> >
> >On Thu, 29 Nov 2018 22:12:50 +0100 (CET) Thomas Gleixner
> ><tglx@linutronix.de> wrote:
> > =20
> >> On some Micron NAND chips block erase fails occasionaly despite the
> >> chip claiming that it succeeded. The flash block seems to be not
> >> completely erased and subsequent usage of the block results in hard to
> >> decode and very subtle failures or corruption.
> >>
> >> The exact reason is unknown, but experimentation has shown that it is
> >> only happening when erasing an erase block which is partially written.
> >> Partially written erase blocks are not uncommon with UBI/UBIFS.  Note,
> >> that this does not always happen. It's a rare and random, but eventual=
ly =20
> >fatal failure. =20
> >>
> >> For now, just blindly write 6 pages to 0. Again experimentation has
> >> shown that it's not sufficient to write pages at the beginning of the
> >> erase block. There need to be pages written in the second half of the
> >> erase block as well. So write 3 pages before and past the middle of th=
e block.
> >>
> >> Less than 6 pages might be sufficient, but it might even be necessary
> >> to write more pages to make sure that it's completely cured. Two pages
> >> still failed, but the 6 held up in a stress test scenario.
> >>
> >> This should be optimized by keeping track of writes, but that needs
> >> proper information about the issue.
> >>
> >> As it's just observation and experimentation based, it's probably wise
> >> to hold off on this until there is proper clarification about the root
> >> cause of the problem. The patch is for reference so others can avoid
> >> to decode this again, but there is no guarantee that it actually fixes
> >> the issue completely. =20
> >
> >I agree. I Cc-ed Bean from Micron. Maybe he can provide more information
> >on this issue.
> > =20
> >>
> >> Therefore:
> >>
> >> Not-yet-signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> >>
> >> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> >> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> >> Cc: Richard Weinberger <richard@nod.at>
> >>
> >> ---
> >>
> >> P.S.: This was debugged on an older kernel version (sigh) and ported
> >>       forward without actual testing on mainline. My MTD foo is a bit
> >>       rusty, so I won't be surprised if there are better ways to do th=
at. =20
> >
> >Let's first wait for Bean's feedback before discussing implementation de=
tails.
> >BTW, do you remember the part number(s) of the flash(es) impacted by this
> >problem in your case?
> > =20
> Thanks, let me know this issue, I will look at this

I think it's time for you to comment on the situation.


Thanks,
Miqu=C3=A8l
