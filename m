Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWC40-0003U7-Oz
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 22:58:49 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Richard Weinberger <richard@nod.at>
Subject: RE: RFC: detect and manage power cut on MLC NAND
Date: Thu, 12 Mar 2015 22:57:59 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973DAD6@NTXBOIMBX03.micron.com>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com> <5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com> <55000637.1030702@nod.at>
 <550074D2.1070406@dave-tech.it>
 <0D23F1ECC880A74392D56535BCADD7354973D072@NTXBOIMBX03.micron.com>
 <55007B79.2090705@nod.at>
 <0D23F1ECC880A74392D56535BCADD7354973D2A1@NTXBOIMBX03.micron.com>
 <55016A43.3000201@nod.at>
In-Reply-To: <55016A43.3000201@nod.at>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Andrea Scian <rnd4@dave-tech.it>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc


-----Original Message-----
From: Richard Weinberger [mailto:richard@nod.at]=20
Sent: Thursday, March 12, 2015 3:28 AM
To: Jeff Lauruhn (jlauruhn)
Cc: Andrea Scian; dedekind1@gmail.com; Boris Brezillon; mtd_mailinglist
Subject: Re: RFC: detect and manage power cut on MLC NAND

Am 11.03.2015 um 22:16 schrieb Jeff Lauruhn (jlauruhn):
> Glad to help out.  I train FAE's and customers on many aspects of NAND in=
cluding MLC. =20

UBI (and UBIFS) was designed with SLC NAND in mind, so far we know that we =
have to address the following constraints when we want UBI on MLC NAND:


1. Avoid repeating bit patterns. This can be solved by scrambling. Boris di=
d some great work in this area.
2. Paired pages. We'll have choose pages we write to very carefully to not =
loss already written data in case of a power cut.
	For MLC we store 4 bits in the same cell has=20
3. Read disturb. Happens also on SLC but not that early. I'm working in thi=
s.
	=09
4. Data retention. i.e, blocks that have not been erased for a long time ha=
ve to be re-erased. I'm working in this too.
=09
5. Unstable bits (not MLC specific).
	Two types.  Data retention and Disturbs (read and program).   Data retenti=
on (charge loss) tends to shift left, =20
6. What did I miss?

Jeff, what do you think?
Can you point us to some hard facts? I'm specially interested in numbers on=
 read disturb and data retention.
I wish there were numbers, it would make my job a lot easier, but NAND does=
n't work that way.  Data retention is dependent on process node (35nm, 25nm=
, 20nm 15nm for example) P/E cycles and temperature. We generally specify o=
ur NAND using JEDC standards, x numbers of years at 55C with 10% cycling.  =
 If you apply our recommended ECC, then you will be able to store data and =
recover it after x numbers of years.  But temperature, P/E, process size an=
d usage have major effects on data retention so we recommend actively manag=
ing your NAND.  This is what you do and what I find so interesting about yo=
ur group.

I can speak in generalities for now, and when I get more specifics I can pr=
edict and recommend solutions.

Data Retention is characterized by a loss of charge.  We program a bit from=
 1 to 0 (just the opposite of what people think).  Over time the charge wil=
l leave the gate, this is normal NAND behavior.  I say that the distributio=
n of charged cell shifts left toward uncharged. Why is SLC better than MLC?=
  First SLC was first and used older larger lithographies.  You could store=
 10's of thousands of electrons on a 40nm gate and you only had two states =
L0 erased (0volts) or L1 programmed (1.5v for example). If you lose a few, =
it didn't make much difference and there was a lot of room between 0 and 1.=
5 volts.  Newer processes are 20nm and MLC.  With a smaller gate there are =
just a few hundred electrons and they need to be disturbed in one of 4 leve=
ls L0 (0 volts), L1(.5 volts), L2(1volts) or L3 (1.5 volts).  Now adding or=
 losing a few electrons can have a larger effect.  We determine a programme=
d cell by measuring between the L0 and L1.  If the levels have shifted, the=
y can shift to the point where you can't reliably tell the difference betwe=
en L0 and L1.  When there are more levels and they are closer together it m=
akes it just that much more challenging. =20


Program/Read Disturb are characterized by charge gain or a shift right.  Th=
e problem is the same.

These affects are not instantaneous, they happen over long periods of time.=
  Instead of trying to predict every case, we recommend actively managing N=
AND, and that's what your team does.  Read the data an use ECC to see how m=
uch the data has changed.  Create a threshold and when the data hits the th=
reshold move the data to a fresh block. =20


Thanks,
//richard
