Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYnat-0003pE-Hk
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 23:09:28 +0000
Received: by wwi18 with SMTP id 18so3060600wwi.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Jun 2011 16:09:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=aU5j9FJ_-bsye6Whh-+PzxrHKCA@mail.gmail.com>
References: <1307563284-32416-1-git-send-email-computersforpeace@gmail.com>
	<BANLkTi=aU5j9FJ_-bsye6Whh-+PzxrHKCA@mail.gmail.com>
Date: Mon, 20 Jun 2011 16:09:14 -0700
Message-ID: <BANLkTikGuHsp8DOO3cBMJERwVAVPVW3-aw@mail.gmail.com>
Subject: Re: nanddump badblock options
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Mon, Jun 20, 2011 at 12:22 PM, Mike Frysinger <vapier.adi@gmail.com> wro=
te:
>> ------------------------------------------------------------------------=
-----------------------------------------
>> =A0Old option =A0 =A0 =A0 =A0 New option =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 Comment
>> ------------------------------------------------------------------------=
-----------------------------------------
>> =A0<default> =A0 =A0 =3D> =A0 --bb=3Dpadbad =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0dump flash data, substituting 0xFF for any bad blocks
>
> maybe add a pad option so people can specify the data rather than just
> 0xff ? =A0although that's probably just overkill and no one would
> actually use it ...

Hmm, I'm thinking that'd be a little bit of overkill.

>> =A0--noskipbad =A0 =3D> =A0 --bb=3Ddumpbad =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 dump flash data, including any bad blocks
>> =A0--skipbad =A0 =A0 =3D> =A0 --bb=3Dskipbad, <default> =A0 =A0 =A0dump =
good data, completely skipping any bad blocks (new default)
>> =A0--omitbad =A0 =A0 =3D> =A0 --bb=3Domitbad =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 (dump flash data, substituting nothing for any bad blocks?)
>
> i think omitbad is covered by the other options.

omitbad isn't *exactly* covered by the other options, but it is very
close to the same as skipbad (recall the conversation when I
introduced --skipbad a couple of weeks ago). The only difference is
that omitbad ensures you dump data only from a specified "address
range", perhaps at the expense of the correct dump length, while
skipbad ensures the correct dump length, continuing past the
"specified range" if bad blocks are found.

I'm all for killing omitbad though, so I'll just respin my patch set
and send out v2...

> the one i'm really
> concerned in keeping is --bb=3Ddumpbad for cases where the bbt says it's
> bad, but it isnt really, so i want the data unmolested.

Sure, that makes sense.

Also, I haven't heard any comments on my idea of changing the default
OOB options, where nanddump should NOT, by default, dump OOB data
(like nandwrite, which does NOT write OOB by default). I'm thinking we
could change the default here and add an option to force it to include
OOB:

--omitoob : do not dump OOB
--oob : dump OOB

So for the next release, I would implement the new --oob flag and add
appropriate warnings, and then following the release, we could change
the default. This leaves the question of the short option, -o, since
its current meaning (--omitoob) conflicts with the -o usage in
nandwrite (--oob). I'm thinking either:
1) Change -o so that it means "--oob" to match nandwrite (i.e.,
include OOB in dump)
2) Kill the short option -o entirely, since it's too confusing to
change it over to the nandwrite-compatible form.

This is mostly just a question of what is least confusing to the
mtd-utils user community; I can adapt to my own code changes!

Brian
