Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXYoA-0006AT-AS
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 17:28:07 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: RE: RFC: detect and manage power cut on MLC NAND
Date: Mon, 16 Mar 2015 17:27:39 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973E0EC@NTXBOIMBX03.micron.com>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com> <5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com> <55000637.1030702@nod.at>
 <550074D2.1070406@dave-tech.it>
 <0D23F1ECC880A74392D56535BCADD7354973D072@NTXBOIMBX03.micron.com>
 <55007B79.2090705@nod.at>
 <0D23F1ECC880A74392D56535BCADD7354973D2A1@NTXBOIMBX03.micron.com>
 <55016A43.3000201@nod.at>
 <0D23F1ECC880A74392D56535BCADD7354973DAD6@NTXBOIMBX03.micron.com>
 <20150313213134.1b53430b@bbrezillon>
 <alpine.DEB.2.02.1503160955000.7125@lnxricardw1.se.axis.com>
In-Reply-To: <alpine.DEB.2.02.1503160955000.7125@lnxricardw1.se.axis.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard;
I wish I could add some images, they would really help.  But, what you call=
 paired pages we call lower/upper pagers.  Any yes, it's all about the dist=
ribution.  I need to look in to other vendors but under program operations =
for Micron we have a requirement "Within a block, pages must be programmed =
sequentially from the least significant page address to the most significan=
t page address (i.e. 0, 1, 2, 3, .). Programming pages out of order within =
a block is prohibited." This ensures that the lower page is programmed, bef=
ore the upper page and that they are programmed together.  This sequence en=
sures the best reliability.  When we program the lower page it gets program=
med into L0 or L1 state, when we program the upper page we either move L0 o=
r L1 to its final location and we end up with L0, L1, L2, or L3.  Programmi=
ng takes longer because there are 4 levels on the same gate so tighter dist=
ribution is required.  Power loss isn't as big an issue as it was in the pa=
st, most vendors are aware and have power loss considerations, but there ar=
e still vendors who take the risk.  In the case of a power loss during a up=
per page program it's always a good idea to check the condition of the lowe=
r page.=20

Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit


-----Original Message-----
From: Ricard Wanderlof [mailto:ricard.wanderlof@axis.com]=20
Sent: Monday, March 16, 2015 2:02 AM
To: Jeff Lauruhn (jlauruhn)
Cc: mtd_mailinglist
Subject: Re: RFC: detect and manage power cut on MLC NAND


Hi Jeff,

I have a question regarding MLC:s, probably not so much something we can do=
 anything about, but I'm curious just the same:

If I understand correctly, page pairing in MLC's means that of the two bits=
 in a cell, one is allocated to one page and another one to a completely di=
fferent page. This means (among other things) that rewriting one page may i=
mpact the other, paired, page.


My question is: why is it done this way? Is it to distribute bit flips more=
 evenly?

An initial trivial allocation would otherwise be to put the paired bits in =
the same byte, for two reasons a) to avoid page-pairing issues, and b) beca=
use it simply would be easier to write both bits in a cell at the same time=
 rather than at different times.

Granted, without page pairing, any sort of failure or disturb in one bit ce=
ll would would require twice the amount of ECC as both bits would likely be=
 corrupted, on the other hand, we'd avoid having data in one part of the fl=
ash be corrupted by operations in another part of the flash.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
