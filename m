Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXYLJ-0005Uy-L0
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 21:16:27 +0000
From: Richard Weinberger <richard@nod.at>
To: Steve deRosier <derosier@gmail.com>
Cc: takei744@oki.com, linux-mtd@lists.infradead.org,
 "goliath@sigma-star.at" <goliath@sigma-star.at>
Subject: Re: Questions about ubifs,ubi and mtd?
Date: Thu, 13 Dec 2018 22:16:11 +0100
Message-ID: <4423535.My00vEhdVK@blindfold>
In-Reply-To: <CALLGbRLERrPHXbs9QJ4sVnqjC_0to7r0w+NkYqzAU8A7YPd1Ew@mail.gmail.com>
References: <TY2PR01MB27000DE339F2C8C63CBEF4C49DA60@TY2PR01MB2700.jpnprd01.prod.outlook.com>
 <1818742.2b902yA6mZ@blindfold>
 <CALLGbRLERrPHXbs9QJ4sVnqjC_0to7r0w+NkYqzAU8A7YPd1Ew@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steve,

Am Donnerstag, 13. Dezember 2018, 18:18:49 CET schrieb Steve deRosier:
> On Thu, Dec 13, 2018 at 3:36 AM Richard Weinberger <richard@nod.at> wrote:
> >
> > Hello Katsuaki Takei,
> >
> > Am Donnerstag, 13. Dezember 2018, 11:45:36 CET schrieb =E6=AD=A6=E4=BA=
=95 =E5=85=8B=E6=98=8E:
> > > Dear Richard,
> > >
> > > We appreciate your precious advice.
> > > We understood the quality status of kernel 3.2.26.
> > > From now on, we would like to backport from the latest UBI and UBIFS.
> > > Do you think that it is enough to backport the next part?
> > >  - drivers/mtd
> > >  - drivers/mtd/ubi
> > >  - fs/ubifs
> >
> > Under the assumption that the root of the problem is the MTD/UBI stack,
> > your problem should go away.
> >
>=20
> Katsuaki Takei,
>=20
> Note that the MTD/UBI stack being at fault is an assumption. There's
> other things that might be at fault, and in my experience, you usually
> have multiple problems that all need to be solved.  Here's some other
> possible issues (might not be everything):
>=20
> 1. Does your hardware work? Are you meeting all the setup and hold
> times on all signals at all times.
> 2. Does the driver work? Could be a bug, especially a subtle one where
> it usually works fine, but a missed command makes it unstable.
> 3. Does the rest of the MTD/UBI stack work?
> 4. Is your ECC on the NAND setup right and working?
> 5. Does whatever hardware or software you're using calculate the ECC
> bits correctly? For example, on some Atmel processors, there's a bug
> in the in-ROM PMECC algos so updated software does it in software
> instead of using the ROM code, but older bootstraps used the ROM algo
> and thus were bugged.
> 6. Are you flashing your NAND base image correctly (including getting
> all the ECC bits in the right place and correct)?
> 7. When you flash updated images, is that done correctly?
> 8. During your writing of the filesystem that goes bad, do you write
> it correctly and sync after each write? Note that 0-size files when
> you know you wrote something is a key indicator of this problem.
> 9. When erasing the NAND, you do retain and honor the bad-block markers, =
yes?
>=20
> Only if the problem's root is in cases 2 and 3 will backporting
> patches even help. And for the driver case, only if the relevant fix
> is there.
=20
Thanks a lot for your great summary!
IMHO it makes sense to put this in form of a checklist to the MTD website.
What do you think?

Thanks,
//richard
