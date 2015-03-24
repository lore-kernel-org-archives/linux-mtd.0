Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaS2N-0004Ra-0U
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2015 16:50:44 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>, Richard Weinberger
 <richard@nod.at>, "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: RE: RFC: detect and manage power cut on MLC NAND
Date: Tue, 24 Mar 2015 16:50:06 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7356B6C89FA@NTXBOIMBX03.micron.com>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com> <5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com>,<55000637.1030702@nod.at>
 <EACD232272DA4849B060F0828564D13B57804E2730@ntcex01.corp.netcomm.com.au>,
 <0D23F1ECC880A74392D56535BCADD7356B6C8603@NTXBOIMBX03.micron.com>
 <EACD232272DA4849B060F0828564D13B6EB7D55E72@ntcex01.corp.netcomm.com.au>
In-Reply-To: <EACD232272DA4849B060F0828564D13B6EB7D55E72@ntcex01.corp.netcomm.com.au>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Andrea Scian <rnd4@dave-tech.it>,
 =?iso-2022-jp?B?UWkgV2FuZyAbJEIyJjUvGyhCIChxaXdhbmcp?= <qiwang@micron.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From a simplified point of view you're right.  In reality the program/erase=
 recipes are actually quite advanced in order to get very tight distributio=
ns on a full page.  The lower/upper page sequence is designed to provide th=
e most reliable results and optimally we would like the lower and upper pag=
e programmed 100% of the time.  There's been a lot of work done over the ye=
ars to improve power loss and it's much better than in the past, but it's s=
till something to be avoided on NAND.  It's always best to check the integr=
ity of the page after a power loss event.=20

I want to make sure I understand your meaning of "aborted write".  If by ab=
orted write you are referring to stopping the command, not a power loss eve=
nt, then yes the internal circuitry will complete the write. =20

"What about the typical system, which has, say, a 3.3V supply rail and a sy=
stem reset firing when that falls below 3.0V or so. The processor core and =
NAND operate at 1.8V, so there are a few ms between the last possible NAND =
command and the breakdown of the NAND supply."

I have to be careful here because it's very dependent on the design and I r=
eally need to know the specifics to make a definitive statement, but a few =
ms should be enough time to protect the NAND.  WP# is your friend here.


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc


-----Original Message-----
From: Iwo Mergler [mailto:Iwo.Mergler@netcommwireless.com]=20
Sent: Monday, March 23, 2015 6:18 PM
To: Jeff Lauruhn (jlauruhn); Richard Weinberger; dedekind1@gmail.com
Cc: Andrea Scian; mtd_mailinglist; Qi Wang =1B$B2&5/=1B(B (qiwang)
Subject: RE: RFC: detect and manage power cut on MLC NAND

Hi Jeff,


thanks for the info. That sounds like very good news to me - it appears tha=
t the paired page problem isn't as bad as I thought.

> Lvl    LH
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1.0 =3D> 11
> 0.7 =3D> 01
> 0.3 =3D> 10
> 0.0 =3D> 00
         ||
Is this  HL?

This seems to match my second scenario (large step for low page) - we do no=
t lose the low page when the high page write fails. Here is what I understo=
od:

The low page distribution centres around 1.0 and 0.3, with a spread of 0.7.=
 Reading the low page as MLC at this point will classify everything above 0=
.5 as 1 and below as 0.

So the distance of a '1' from the threshold is 0.5, and the distance of a '=
0' is 0.2. It's asymmetric, with SLC distance on one side and MLC on the ot=
her.

The high page write (only when writing a '0'), moves the charge towards 0.0=
, by 0.3. So if the first page contains '1', the charge is lowered to 0.7, =
if the first page contains '0' the charge goes down to 0.0.

At no time is the charge crossing the 0.5 threshold.
An aborted high page write will have reduced the '1'
distance by 0.0-0.3 or increased the '0' distance by 0.0-0.3.

Why are we worried about the low page at all? The way I understand the gate=
 charge changes, the low page situation can not be, at any point, worse tha=
n the normal programmed MLC state.


Losing the high page isn't conceptually any worse than aborted writes on SL=
C. This has been called the "unstable bits problem".

As far as I understand, UBI/UBIFS currently don't mitigate for aborted writ=
e. The worry here is that an aborted write (SLC or MLC) gets you a page whe=
re the 0s are weak - they may pass ECC on read now but fail next month. Or =
if the abort was early, weaken some 1s in an erased-looking page.

Aborted erases are handled by UBI via the EC header write immediately after=
 erase. An erased block without an EC header is erased again at boot time, =
to avoid partially erased blocks (weak 1s).

Aborted writes are harder. UBI could deal with its own headers via sequence=
 number and always rewrite the last block when it has UBI headers but no pa=
yload.
Seems a bit wasteful, though.

UBIFS also has an idea which few blocks may have received a power cut durin=
g the last write - I think around 5 candidates or so. Rewriting them all ev=
ery mount time seems even more wasteful.

Then of course, the rewrite can also be aborted, so UBI's last atomic LEB c=
hange probably also needs redoing at attach time.


Jeff, what's the situation with aborted writes?
Is this problem real? I understand that there are charge pumps on board the=
 NAND chip - do they store sufficient energy to complete a page write?

What about the typical system, which has, say, a 3.3V supply rail and a sys=
tem reset firing when that falls below 3.0V or so. The processor core and N=
AND operate at 1.8V, so there are a few ms between the last possible NAND c=
ommand and the breakdown of the NAND supply.

Would that be safe from aborted writes?


Best regards,

Iwo


________________________________________
From: Jeff Lauruhn (jlauruhn) [jlauruhn@micron.com]
Sent: Tuesday, 24 March 2015 8:15 AM
To: Iwo Mergler; Richard Weinberger; dedekind1@gmail.com
Cc: Andrea Scian; mtd_mailinglist; Qi Wang =1B$B2&5/=1B(B (qiwang)
Subject: RE: RFC: detect and manage power cut on MLC NAND

This is a very simplified description, but actually it's more like this:

First pass, program the lower page.  If you the lower page is 1, do nothing=
.  If the lower page is 0 subtract 0.7v to 0.3.  Lower page is SLC like, tw=
o distributions spread apart by 0.7V.

Lvl    LH
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1.0 =3D> 1u
0.3 =3D> 0u

Now, program the upper page.  First, read lower page, if lower page is 1 an=
d upper page is 1, do nothing (11).  If lower page is 1 and upper page is 0=
, then subtract -0.3 and call that 01.  Next if lower page is 0 and upper p=
age is 1 do nothing and if lower page is 0 and upper page is 0 subtract 0.3=
v and call it 00.  Notice that state of lower page is on right of 11, 01,10=
, 00.

Lvl    LH
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1.0 =3D> 11
0.7 =3D> 01
0.3 =3D> 10
0.0 =3D> 00

Now what happens if there's a power loss during the programming of the uppe=
r page?  The upper page data will most likely be lost, and the lower page m=
ay be changed, but there's a good chance of recovery, because it will be in=
 the range of SLC.  It is highly recommended to read and refresh data after=
 a power loss.


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit

-----Original Message-----
From: Iwo Mergler [mailto:Iwo.Mergler@netcommwireless.com]
Sent: Sunday, March 22, 2015 9:09 PM
To: Richard Weinberger; dedekind1@gmail.com
Cc: Andrea Scian; mtd_mailinglist; Jeff Lauruhn (jlauruhn); Qi Wang =1B$B2&=
5/=1B(B (qiwang)
Subject: RE: RFC: detect and manage power cut on MLC NAND


Hi all,


I probably don't know enough about the silicon implementation of MLC paired=
 pages, but my feeling is that there should be a way to recover one of the =
pages if the paired write fails, at least in some cases.

Something along the lines of using both bits to map to a single good one.

2 bit MLC stores 4 levels - 1.0, 0.7, 0.3, 0.0. Obviously, the actual volta=
ge levels will be somewhat different, so take this as electrons on the floa=
ting gate: 1.0=3Dminimum, 0.0 maximum.

I imagine that there are two ways to achieve that - small step for low page=
 and large step for high page, or the other way 'round.

Assuming the first, the low page write would subtract 0.3 from the erased (=
1.0) cell if the bit is 0. That leaves the cell at either ~1.0 (1) or 0.7 (=
0).

Lvl    LH
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1.0 =3D> 1u
0.7 =3D> 0u

Then, the high page write would subtract either nothing (1) or
0.7 (0):

Lvl    LH
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1.0 =3D> 11
0.7 =3D> 01
0.3 =3D> 10
0.0 =3D> 00

So the MLC decoder logic gets 3 priority encoded bits from the sense amplif=
iers: 111, 011, 001, 000. The decoder turns this into 11, 01, 10, 00.

The process of writing a 0 to the high page, transitions low page 0-bits th=
rough 1 and back to 0, as the level moves down.

Low page 1 bits transition from 1 through 0 and back to 1.

So a half-completed high page 0-write can flip a low page bit both ways.

We can detect an incorrect 0-1 transition in the low page, because it's mar=
ked by a 0 bit in the high page.

We can't detect an incorrect 1-0 transition in the low page.

So assuming a failed high page write, this is what we get:

LH

11 =3D nothing happens, reads back as 11
     Correct level for both.

01 =3D Level stays at 0.7, reads back as 01,
     Correct level for low page.

10 =3D Level between 1.0 and 0.3, reads back as 11, 01 or 10.
     01 is wrong for low page, but can't be distinguished from 10.

00 =3D Level between 0.7 and 0.0, reads back as 01, 10, or 00.
     10 is wrong for low page, but can be distinguished from 01.

So, there are two bit combinations (50%) that have an undetectable failure,=
 and this failure will happen about half the time, for a total of 25% unfix=
able failure rate.

Not acceptable in the general case, but might be good enough for things lik=
e UBI EC & VID headers, if we ensure that the high page contains 1s at the =
offsets at which the low page stores the header.


Now, on the other hand, if the low page write uses the larger step, there s=
houldn't be any paired page problem at all, since the high page write would=
n't cross the low page thresholds on the way:

Lvl    LH
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1.0 =3D> 1u
0.3 =3D> 0u

Lvl    LH
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1.0 =3D> 11
0.7 =3D> 10
0.3 =3D> 01
0.0 =3D> 00


Which makes me think I'm misunderstanding something. If not, why isn't his =
scheme used in the first place?

What would happen if we reverse the paired page writing order?
Not recommended, we want pages programmed in sequence to mitigate disturbs =
and obtain the highest reliability.


Jeff, Qi, is the mechanism I described here anywhere near reality?
It's a simplified view, but fairly accurate.


Best regards,

Iwo
