Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY841-0000xS-CG
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 11:24:59 +0000
Date: Sat, 15 Dec 2018 12:24:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Steve deRosier <derosier@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 goliath@sigma-star.at, takei744@oki.com
Subject: Re: Questions about ubifs,ubi and mtd?
Message-ID: <20181215122434.242cf2bb@xps13>
In-Reply-To: <CALLGbRJFDni1yEEqm-2kAZG2D5q0-mDth_gMb8PHu=Ns=XT=oQ@mail.gmail.com>
References: <TY2PR01MB27000DE339F2C8C63CBEF4C49DA60@TY2PR01MB2700.jpnprd01.prod.outlook.com>
 <1818742.2b902yA6mZ@blindfold>
 <CALLGbRLERrPHXbs9QJ4sVnqjC_0to7r0w+NkYqzAU8A7YPd1Ew@mail.gmail.com>
 <4423535.My00vEhdVK@blindfold>
 <CALLGbRJFDni1yEEqm-2kAZG2D5q0-mDth_gMb8PHu=Ns=XT=oQ@mail.gmail.com>
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

Hi Steve,

Great summary!

Steve deRosier <derosier@gmail.com> wrote on Thu, 13 Dec 2018 14:22:37
-0800:

> On Thu, Dec 13, 2018 at 1:16 PM Richard Weinberger <richard@nod.at> wrote:
> >
> > Steve,
> >
> > Am Donnerstag, 13. Dezember 2018, 18:18:49 CET schrieb Steve deRosier: =
=20
> > > On Thu, Dec 13, 2018 at 3:36 AM Richard Weinberger <richard@nod.at> w=
rote: =20
> > > >
> > > > Hello Katsuaki Takei,
> > > >
> > > > Am Donnerstag, 13. Dezember 2018, 11:45:36 CET schrieb =E6=AD=A6=E4=
=BA=95 =E5=85=8B=E6=98=8E: =20
> > > > > Dear Richard,
> > > > >
> > > > > We appreciate your precious advice.
> > > > > We understood the quality status of kernel 3.2.26.
> > > > > From now on, we would like to backport from the latest UBI and UB=
IFS.
> > > > > Do you think that it is enough to backport the next part?
> > > > >  - drivers/mtd
> > > > >  - drivers/mtd/ubi
> > > > >  - fs/ubifs =20
> > > >
> > > > Under the assumption that the root of the problem is the MTD/UBI st=
ack,
> > > > your problem should go away.
> > > > =20
> > >
> > > Katsuaki Takei,
> > >
> > > Note that the MTD/UBI stack being at fault is an assumption. There's
> > > other things that might be at fault, and in my experience, you usually
> > > have multiple problems that all need to be solved.  Here's some other
> > > possible issues (might not be everything):
> > >
> > > 1. Does your hardware work? Are you meeting all the setup and hold
> > > times on all signals at all times.
> > > 2. Does the driver work? Could be a bug, especially a subtle one where
> > > it usually works fine, but a missed command makes it unstable.

I think this is a very important point, most of the UBI/UBIFS issues
that were reported to me were just the consequence of an earlier
error that happened at the NAND controller driver level. People
reporting bugs tend to only copy/paste the last error they see (which
usually is UBI/UBIFS complaining), forgetting about the root cause
which has been printed earlier in the dmesg.

> > > 3. Does the rest of the MTD/UBI stack work?
> > > 4. Is your ECC on the NAND setup right and working?
> > > 5. Does whatever hardware or software you're using calculate the ECC
> > > bits correctly? For example, on some Atmel processors, there's a bug
> > > in the in-ROM PMECC algos so updated software does it in software
> > > instead of using the ROM code, but older bootstraps used the ROM algo
> > > and thus were bugged.
> > > 6. Are you flashing your NAND base image correctly (including getting
> > > all the ECC bits in the right place and correct)?
> > > 7. When you flash updated images, is that done correctly?
> > > 8. During your writing of the filesystem that goes bad, do you write
> > > it correctly and sync after each write? Note that 0-size files when
> > > you know you wrote something is a key indicator of this problem.
> > > 9. When erasing the NAND, you do retain and honor the bad-block marke=
rs, yes?
> > >
> > > Only if the problem's root is in cases 2 and 3 will backporting
> > > patches even help. And for the driver case, only if the relevant fix
> > > is there. =20
> >
> > Thanks a lot for your great summary!
> > IMHO it makes sense to put this in form of a checklist to the MTD websi=
te.
> > What do you think?

I also like the idea!

Thanks,
Miqu=C3=A8l
