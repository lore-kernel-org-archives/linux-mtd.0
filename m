Received: from antispam02.maxim-ic.com ([205.153.101.183]
 helo=antispam02.maximintegrated.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIZ8Y-0004X0-H9
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 07:42:39 +0000
From: Brian Foster <brian.foster@maximintegrated.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [Q] `ubiattach: ioctl 0x40186f40 failed: Inappropriate ioctl for
 device' - What changed?
Date: Wed, 26 Feb 2014 08:42:11 +0100
Message-ID: <3376417.FgNKArDazm@laclwks004>
In-Reply-To: <20140226072141.GA13420@norris-Latitude-E6410>
References: <4790760.yeQTJBGPZK@laclwks004>
 <20140226072141.GA13420@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 25-February-2014 23:21:41 Brian Norris wrote:
> Hi Brian,
>=20
> On Tue, Feb 25, 2014 at 05:01:18PM +0100, Brian Foster wrote:
> >  Using an (admittedly ancient) BuildRoot v2010.11
> >  (which uses v2.6.36.4 kernel headers) with an
> >  (also admittedly ancient) v2.6.36.4 Linux kernel,
> >  ubiattach(1) works fine.  The =E2=80=98ubiattach=E2=80=99 is of
> >  vintage v1.4.6 (and has not been modified).
> >=20
> >  However, using that _identical_ =E2=80=98ubiattach=E2=80=99 binary=

> >  (which is for an ARM926EJ-S CPU) with a more recent
> >  v3.10.30 kernel, it fails.  For example:
> >=20
> >     # ubiattach -m7 -d0 /dev/ubi_ctrl
> >     ubiattach: ioctl 0x40186f40 failed: Inappropriate ioctl for dev=
ice
> >     #
>=20
> I'm honestly not sure where the above print came from. I'm checking o=
ut
> ubiattach.c in mtd-utils v1.4.6, and I don't see this print. But
> perhaps I'm just missing it...

Hi Brian.

 No, yer are not missing it.  I made a mistake,
 and accidently copy-and-pasted the text from
 BusyBox's built-in version of =E2=80=98ubiattach',
 not the mtd-tools version.  Not that it makes
 any difference, the behaviour is identical.

 I sent a correction to the list but it is stuck
 in moderation.

> >  I assume the value of, and/or parameter to, some
> >  ioctl command has changed v2.6.36 =E2=86=92 v3.10, but
> >  am at a loss as to just _what_ changed (or why).
>=20
> The parameter *shouldn't* have changed. We try to keep ABI
> compatibility, as Linus sometimes loudly proclaims. And I don't think=

> I've seen any changes to ioctl(UBI_IOCATT). In fact, the reported ioc=
tl
> number (0x40186f40) still matches my functioning mtd-utils + 3.8.x
> kernel.

 Exactly, this is why I am so puzzled.

> >  Any pointers would be appreciated.
>=20
> Well, here's a wild guess; it looks like struct ubi_attach_req is the=

> only UBI ioctl struct that does not have the __attribute__((packed))
> annotation. So it's possible that your compiler didn't pack the struc=
t
> the same for your 3.10 kernel. Perhaps the following patch would help=
?

 Maybe, but seems unlikely:  It's the same compiler.
 Also, one of our FAEs has just reported what looks
 like the same behaviour on v2.6.36, also suggesting
 the compiler is unlikely to be a fault here.
 Interesting possibility, however!  Thanks.

 Another guess: We are using a static /dev/ubi_ctrl
 node.  However, that is a dynamic minor misc device,
 so I am currently _guessing_ the v3.10 system assigned
 a different minor number than the v2.6.36 system usually
 does (and the FAE's system also picked a different minor
 for some currently unknown reason).   I will check this
 possibility as soon as I can ....

cheers!
=09-blf-

--=20
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated               |  http://www.maximintegrated.com/
