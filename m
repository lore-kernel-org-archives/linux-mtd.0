Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYk3t-0000Re-Kd
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 19:23:10 +0000
Received: by fxm14 with SMTP id 14so778026fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Jun 2011 12:23:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307563284-32416-1-git-send-email-computersforpeace@gmail.com>
References: <1307563284-32416-1-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 20 Jun 2011 15:22:40 -0400
Message-ID: <BANLkTi=aU5j9FJ_-bsye6Whh-+PzxrHKCA@mail.gmail.com>
Subject: Re: nanddump badblock options
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 8, 2011 at 16:01, Brian Norris wrote:
> I have some ideas to implement in nanddump regarding the variety of bad b=
lock
> handling options. I thought I'd at least get some feedback before working=
 up a
> full patch, so please comment on my ideas.

your ideas sound good to me

> (4) Can Mike provide a good explanation for --bb=3Domitbad in the table b=
elow? I
> personally don't understand it's exact use, nor do I know how to describe=
 it
> best (to provide contrast against the other options), but I understand th=
at you
> would like to keep the option. I would appreciate some help.
>
> (5) Summary table:
>
> -------------------------------------------------------------------------=
----------------------------------------
> =C2=A0Old option =C2=A0 =C2=A0 =C2=A0 =C2=A0 New option =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Comment
> -------------------------------------------------------------------------=
----------------------------------------
> =C2=A0<default> =C2=A0 =C2=A0 =3D> =C2=A0 --bb=3Dpadbad =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dump flash data, substituting =
0xFF for any bad blocks

maybe add a pad option so people can specify the data rather than just
0xff ?  although that's probably just overkill and no one would
actually use it ...

> =C2=A0--noskipbad =C2=A0 =3D> =C2=A0 --bb=3Ddumpbad =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dump flash data, including any bad block=
s
> =C2=A0--skipbad =C2=A0 =C2=A0 =3D> =C2=A0 --bb=3Dskipbad, <default> =C2=
=A0 =C2=A0 =C2=A0dump good data, completely skipping any bad blocks (new de=
fault)
> =C2=A0--omitbad =C2=A0 =C2=A0 =3D> =C2=A0 --bb=3Domitbad =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (dump flash data, substituting no=
thing for any bad blocks?)

i think omitbad is covered by the other options.  the one i'm really
concerned in keeping is --bb=3Ddumpbad for cases where the bbt says it's
bad, but it isnt really, so i want the data unmolested.
-mike
