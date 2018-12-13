Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXUeB-0005Ke-Ol
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 17:19:46 +0000
Received: by mail-io1-xd2e.google.com with SMTP id l14so2217812ioj.5
 for <linux-mtd@lists.infradead.org>; Thu, 13 Dec 2018 09:19:27 -0800 (PST)
MIME-Version: 1.0
References: <TY2PR01MB27000DE339F2C8C63CBEF4C49DA60@TY2PR01MB2700.jpnprd01.prod.outlook.com>
 <3417318.kOS8JojacP@blindfold>
 <TY2PR01MB2700C1902D91862C39D966E79DA00@TY2PR01MB2700.jpnprd01.prod.outlook.com>
 <1818742.2b902yA6mZ@blindfold>
In-Reply-To: <1818742.2b902yA6mZ@blindfold>
From: Steve deRosier <derosier@gmail.com>
Date: Thu, 13 Dec 2018 09:18:49 -0800
Message-ID: <CALLGbRLERrPHXbs9QJ4sVnqjC_0to7r0w+NkYqzAU8A7YPd1Ew@mail.gmail.com>
Subject: Re: Questions about ubifs,ubi and mtd?
To: takei744@oki.com
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
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

On Thu, Dec 13, 2018 at 3:36 AM Richard Weinberger <richard@nod.at> wrote:
>
> Hello Katsuaki Takei,
>
> Am Donnerstag, 13. Dezember 2018, 11:45:36 CET schrieb =E6=AD=A6=E4=BA=95=
 =E5=85=8B=E6=98=8E:
> > Dear Richard,
> >
> > We appreciate your precious advice.
> > We understood the quality status of kernel 3.2.26.
> > From now on, we would like to backport from the latest UBI and UBIFS.
> > Do you think that it is enough to backport the next part?
> >  - drivers/mtd
> >  - drivers/mtd/ubi
> >  - fs/ubifs
>
> Under the assumption that the root of the problem is the MTD/UBI stack,
> your problem should go away.
>

Katsuaki Takei,

Note that the MTD/UBI stack being at fault is an assumption. There's
other things that might be at fault, and in my experience, you usually
have multiple problems that all need to be solved.  Here's some other
possible issues (might not be everything):

1. Does your hardware work? Are you meeting all the setup and hold
times on all signals at all times.
2. Does the driver work? Could be a bug, especially a subtle one where
it usually works fine, but a missed command makes it unstable.
3. Does the rest of the MTD/UBI stack work?
4. Is your ECC on the NAND setup right and working?
5. Does whatever hardware or software you're using calculate the ECC
bits correctly? For example, on some Atmel processors, there's a bug
in the in-ROM PMECC algos so updated software does it in software
instead of using the ROM code, but older bootstraps used the ROM algo
and thus were bugged.
6. Are you flashing your NAND base image correctly (including getting
all the ECC bits in the right place and correct)?
7. When you flash updated images, is that done correctly?
8. During your writing of the filesystem that goes bad, do you write
it correctly and sync after each write? Note that 0-size files when
you know you wrote something is a key indicator of this problem.
9. When erasing the NAND, you do retain and honor the bad-block markers, ye=
s?

Only if the problem's root is in cases 2 and 3 will backporting
patches even help. And for the driver case, only if the relevant fix
is there.

(getting on my soapbox)
IMHO, the effort to backport the entire subsystem from HEAD will
actually be more effort than just upgrading your kernel to the most
recent LTS kernel. It is exceptionally rare that a kernel _can't_ be
upgraded, so it's likely more correct in referring to not wanting to
or your bosses not wanting you to, or not understanding how to upgrade
the kernel. And in any case, even _can't_ is an artificial existence
caused by external forces (loosing certifications or similar) and can
always be overcome. But doing so is an engineering tradeoff either
way. Staying on a kernel that is seven years old is a huge risk.
Upgrading your kernel is a huge benefit in security and bug fixes. But
more than that, once you get current (and it is a big effort), you can
simply stay current and everything gets easier going forward from
there. You end up leveraging all the work the community does in giving
you one of the highest quality and most complex code bases anywhere.
(stepping off)

In any case, I highly recommend you check all the other things too.
You might have multiple problems, and some of them may be easy to fix.

Good luck,
- Steve
