Received: from mail-it1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXZOB-0003j1-9i
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 22:23:29 +0000
Received: by mail-it1-x12d.google.com with SMTP id p197so6463062itp.0
 for <linux-mtd@lists.infradead.org>; Thu, 13 Dec 2018 14:23:16 -0800 (PST)
MIME-Version: 1.0
References: <TY2PR01MB27000DE339F2C8C63CBEF4C49DA60@TY2PR01MB2700.jpnprd01.prod.outlook.com>
 <1818742.2b902yA6mZ@blindfold>
 <CALLGbRLERrPHXbs9QJ4sVnqjC_0to7r0w+NkYqzAU8A7YPd1Ew@mail.gmail.com>
 <4423535.My00vEhdVK@blindfold>
In-Reply-To: <4423535.My00vEhdVK@blindfold>
From: Steve deRosier <derosier@gmail.com>
Date: Thu, 13 Dec 2018 14:22:37 -0800
Message-ID: <CALLGbRJFDni1yEEqm-2kAZG2D5q0-mDth_gMb8PHu=Ns=XT=oQ@mail.gmail.com>
Subject: Re: Questions about ubifs,ubi and mtd?
To: Richard Weinberger <richard@nod.at>
Cc: takei744@oki.com, linux-mtd@lists.infradead.org, goliath@sigma-star.at
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 13, 2018 at 1:16 PM Richard Weinberger <richard@nod.at> wrote:
>
> Steve,
>
> Am Donnerstag, 13. Dezember 2018, 18:18:49 CET schrieb Steve deRosier:
> > On Thu, Dec 13, 2018 at 3:36 AM Richard Weinberger <richard@nod.at> wro=
te:
> > >
> > > Hello Katsuaki Takei,
> > >
> > > Am Donnerstag, 13. Dezember 2018, 11:45:36 CET schrieb =E6=AD=A6=E4=
=BA=95 =E5=85=8B=E6=98=8E:
> > > > Dear Richard,
> > > >
> > > > We appreciate your precious advice.
> > > > We understood the quality status of kernel 3.2.26.
> > > > From now on, we would like to backport from the latest UBI and UBIF=
S.
> > > > Do you think that it is enough to backport the next part?
> > > >  - drivers/mtd
> > > >  - drivers/mtd/ubi
> > > >  - fs/ubifs
> > >
> > > Under the assumption that the root of the problem is the MTD/UBI stac=
k,
> > > your problem should go away.
> > >
> >
> > Katsuaki Takei,
> >
> > Note that the MTD/UBI stack being at fault is an assumption. There's
> > other things that might be at fault, and in my experience, you usually
> > have multiple problems that all need to be solved.  Here's some other
> > possible issues (might not be everything):
> >
> > 1. Does your hardware work? Are you meeting all the setup and hold
> > times on all signals at all times.
> > 2. Does the driver work? Could be a bug, especially a subtle one where
> > it usually works fine, but a missed command makes it unstable.
> > 3. Does the rest of the MTD/UBI stack work?
> > 4. Is your ECC on the NAND setup right and working?
> > 5. Does whatever hardware or software you're using calculate the ECC
> > bits correctly? For example, on some Atmel processors, there's a bug
> > in the in-ROM PMECC algos so updated software does it in software
> > instead of using the ROM code, but older bootstraps used the ROM algo
> > and thus were bugged.
> > 6. Are you flashing your NAND base image correctly (including getting
> > all the ECC bits in the right place and correct)?
> > 7. When you flash updated images, is that done correctly?
> > 8. During your writing of the filesystem that goes bad, do you write
> > it correctly and sync after each write? Note that 0-size files when
> > you know you wrote something is a key indicator of this problem.
> > 9. When erasing the NAND, you do retain and honor the bad-block markers=
, yes?
> >
> > Only if the problem's root is in cases 2 and 3 will backporting
> > patches even help. And for the driver case, only if the relevant fix
> > is there.
>
> Thanks a lot for your great summary!
> IMHO it makes sense to put this in form of a checklist to the MTD website=
.
> What do you think?
>
> Thanks,
> //richard
>
>

Richard,

Please do. Perhaps in a "What should I check when I get errors on a
NAND using MTD and UBIFS?" FAQ entry? I'd be happy to author a more
extensive entry on NAND MTD/UBIFS troubleshooting in the future too if
desired; though not right away, I'm a bit slammed between holidays and
work for the next few weeks.

Thanks,
- Steve
