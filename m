Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SFFln-0006bz-Tc
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2012 02:16:25 +0000
Received: by bkcjk13 with SMTP id jk13so422534bkc.36
 for <linux-mtd@lists.infradead.org>; Tue, 03 Apr 2012 19:16:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5D308BD40154E4439D82454FE483A502065DD7FF@EVS4.nam.ci.root>
References: <5D308BD40154E4439D82454FE483A5020655576C@EVS4.nam.ci.root>
 <CAMjpGUenHB6VU7k84E1Qdh+h6V3C1ZY1DVkV3rBmMfCueh2c4A@mail.gmail.com>
 <5D308BD40154E4439D82454FE483A5020659EE00@EVS4.nam.ci.root>
 <CAMjpGUeMXtTTjdOjEyxZM2Gc0Ww9qyViMufSFu22voTLs33Xxg@mail.gmail.com>
 <5D308BD40154E4439D82454FE483A5020659F81E@EVS4.nam.ci.root>
 <CAMjpGUehny_-ZjoCseFDeqQjbrDy1BAe=bVB0bQfCRcyozfREA@mail.gmail.com>
 <5D308BD40154E4439D82454FE483A502065DD7FF@EVS4.nam.ci.root>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 3 Apr 2012 22:16:00 -0400
Message-ID: <CAMjpGUfwgraLTO+5WoDERk_Usi=6Kc6qEpFK08E3RDw3EWaY7g@mail.gmail.com>
Subject: Re: User error with fw_printenv - I hope
To: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 3, 2012 at 19:09, Bishop, Mark
<Mark.Bishop@cooperindustries.com> wrote:
> ioctl(3, MEMGETINFO or MFB_SET_CHROMA_KEY, {type=3DMTD_NANDFLASH, flags=
=3DMTD_WRITEABLE, size=3D0x80000, erasesize=3D0x20000, writesize=3D0x800, o=
obsize=3D0x40, padding=3D0xffffffff}) =3D 0
> ioctl(3, MEMGETBADBLOCK, [393216]) =C2=A0 =C2=A0 =C2=A0=3D 1
> ioctl(3, MEMGETBADBLOCK, [524288]) =C2=A0 =C2=A0 =C2=A0=3D -1 EINVAL (Inv=
alid argument)
> write(2, "Cannot read bad block mark", 26Cannot read bad block mark) =3D =
26

thanks, this shows the issue.  looks like a bug in u-boot's
fw_printenv code.  it first tests block 0x60000 to see if it's bad,
then tries 0x80000.

> root:/> cat /etc/fw_env.config
> /dev/mtd0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x60000 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 0x20000 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x20000 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1

your config though says you only have 1 block starting at 0x60000 with
a length of 0x20000.  so there's no reason it should be testing
0x80000 -- after all, you only care about bytes 0x60000 - 0x7ffff.

i guess time to raise the issue on the u-boot mailing list.  i'm
guessing you aren't running the latest mainline code, but in looking
at the git history, there doesn't seem to be many changes recently let
alone relevant ones.  wouldn't hurt to test though and should be easy
to try:
$ make env HOSTCC=3Dbfin-uclinux-gcc
-mike
