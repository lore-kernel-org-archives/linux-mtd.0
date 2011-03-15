Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PzPsN-0007MP-V8
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 08:45:13 +0000
Date: Tue, 15 Mar 2011 09:45:08 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Andre Naujoks <nautsch2@googlemail.com>
Subject: Re: gcc 4.5 and copy_flag in libubigen.c
In-Reply-To: <4D7E4437.70300@googlemail.com>
Message-ID: <Pine.LNX.4.64.1103150930350.25520@lnxricardw.se.axis.com>
References: <4D7E4437.70300@googlemail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 14 Mar 2011, Andre Naujoks wrote:

> I am compiling a board support package with mtd-utils-1.3.1.
>
> After a gcc update to version 4.5 on my host the build fails and it
> tells me that:
>
> ./src/libubigen.c: In function 'ubigen_write_leb':
> ./src/libubigen.c:204:19: error: operation on 'u->v->copy_flag' may be
> undefined.
>
> This seems like a recently introduced warning by the new gcc version,
> but because of the -Werror halts my build.

> // This is the part gcc 4.5 complains about
> // ---------------------
>
>        if (action & MARK_AS_UPDATE) {
>                u->v->copy_flag =3D (u->v->copy_flag)++;
>        }
>
> // --------------------
>

I can understand why gcc warns about this, the operation is undefined. I=20
would think the problem is not with the pointer dereference, it is the way=
=20
the copy flag is used both before and after the ++. What you have is

   foo =3D foo++;

which is an undefined operation, for the following reason. While

   foo++;

says that foo has one value before this operation and the value +1 after=20
(the C standard talks about 'sequence points', i.e points in the code=20
where all variables have well defined values),

   foo =3D foo++;

is ambiguous in that it is not clear whether the ++ takes place after
the assignment or vice versa. Should the compiler bump the value of foo,=20
but return the old value, assign it to foo, and then assign foo the=20
incremented value, or increment the value, return the old value, and=20
assign it to foo, in effect not changing the value?

It might have worked by chance on an older compiler that didn't notice the=
=20
problem and consistently picked one of the two possibilities above=20
(preferebly the first one); however, according to the C standard, once an=
=20
operation becomes undefined all aspects of it become undefined so the=20
compiler could technically stuff any value in foo (or none at all).

Anyhow, technicalities aside, it looks like someone made a mental error=20
when simply trying to set the copy_flag. I'm fairly convinced that the=20
author simply meant:

   (u->v->copy_flag)++;

> My question is this. If this is indeed just a flag, can I just set
> copy_flag to 1 instead of incrementing it? Witout breaking anything?

It is (or perhaps was?) commonplace to set flags by incrementing them. I'm=
=20
not sure why this is considered a good idea. Possibly because

   flag++;

looks more elegant and cool than

   flag =3D 1;

although the latter is most certainly faster; in the first case the value=
=20
must be read, incremented and copied back to the variable. Of course, if=20
the variable is in a register there's no real overhead, but most=20
processors have fast ways of loading small immediate values so the latter=
=20
version will probably be just as quick and not need more code either.

I don't know if it could have something to do with the machines on which=20
Unix was originally written, that it was faster, or, more likely, used up=
=20
less code space, to increment something than to load it with 1.

I would agree with you in principle, especially since the variable is=20
called 'flag' something, then again, without a thorough understanding of=20
what the flag is used for, someone could conceivably have decided to use=20
it as a counter instead of a flag, but retain the name.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
