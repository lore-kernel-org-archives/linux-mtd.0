Received: from mail1.bemta7.messagelabs.com ([216.82.254.110])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZtgb-0008KR-Qm
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2015 04:09:58 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: Richard Weinberger <richard@nod.at>, "dedekind1@gmail.com"
 <dedekind1@gmail.com>
Date: Mon, 23 Mar 2015 15:08:58 +1100
Subject: RE: RFC: detect and manage power cut on MLC NAND
Message-ID: <EACD232272DA4849B060F0828564D13B57804E2730@ntcex01.corp.netcomm.com.au>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com> <5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com>,<55000637.1030702@nod.at>
In-Reply-To: <55000637.1030702@nod.at>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Andrea Scian <rnd4@dave-tech.it>,
 "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>, Qi Wang <qiwang@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,


I probably don't know enough about the silicon implementation
of MLC paired pages, but my feeling is that there should be a
way to recover one of the pages if the paired write fails, at least
in some cases.

Something along the lines of using both bits to map to a single
good one.

2 bit MLC stores 4 levels - 1.0, 0.7, 0.3, 0.0. Obviously, the actual
voltage levels will be somewhat different, so take this as
electrons on the floating gate: 1.0=3Dminimum, 0.0 maximum.

I imagine that there are two ways to achieve that - small step
for low page and large step for high page, or the other way 'round.

Assuming the first, the low page write would subtract 0.3 from
the erased (1.0) cell if the bit is 0. That leaves the cell at
either ~1.0 (1) or 0.7 (0).

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

So the MLC decoder logic gets 3 priority encoded bits from the
sense amplifiers: 111, 011, 001, 000. The decoder turns this
into 11, 01, 10, 00.

The process of writing a 0 to the high page, transitions low page
0-bits through 1 and back to 0, as the level moves down.

Low page 1 bits transition from 1 through 0 and back to 1.

So a half-completed high page 0-write can flip a low page bit
both ways.

We can detect an incorrect 0-1 transition in the low page,
because it's marked by a 0 bit in the high page.

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

So, there are two bit combinations (50%) that have an
undetectable failure, and this failure will happen about half
the time, for a total of 25% unfixable failure rate.

Not acceptable in the general case, but might be good enough
for things like UBI EC & VID headers, if we ensure that the
high page contains 1s at the offsets at which the low page
stores the header.


Now, on the other hand, if the low page write uses the larger
step, there shouldn't be any paired page problem at all, since
the high page write wouldn't cross the low page thresholds
on the way:

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


Which makes me think I'm misunderstanding something. If not,
why isn't his scheme used in the first place?

What would happen if we reverse the paired page writing order?


Jeff, Qi, is the mechanism I described here anywhere near reality?


Best regards,

Iwo
