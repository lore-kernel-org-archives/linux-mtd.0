Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXXTv-0003DB-P2
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 16:03:09 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Andrea Marson - DAVE Embedded Systems <andrea.marson@dave.eu>
Subject: RE: RFC: detect and manage power cut on MLC NAND
Date: Mon, 16 Mar 2015 16:02:27 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973DFE3@NTXBOIMBX03.micron.com>
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
 <0D23F1ECC880A74392D56535BCADD7354973DF0B@NTXBOIMBX03.micron.com>
 <55040370.3040204@dave.eu>
In-Reply-To: <55040370.3040204@dave.eu>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Andrea Scian <rnd4@dave-tech.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"What if it is set low while NAND is ready - that is it can accept new comm=
ands - but an erase operation is in progress?".  Again, the likelihood is l=
ow, in this case a block that was intended to be erased my not be fully era=
se, it can be fully erased when power returns.  No data will lost because t=
he block was intended to be erased anyway.=20

"Does the erase operation complete anyway?"  There has been a lot of work d=
one to mitigate power loss on NAND, but I haven't ever seen a design from a=
ny NAND vendor that is 100%.  Surprise power loss should be avoided on NAND=
 or consider power detection and elegant shutdown circuitry.


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit


-----Original Message-----
From: Andrea Marson - DAVE Embedded Systems [mailto:andrea.marson@dave.eu]=
=20
Sent: Saturday, March 14, 2015 2:46 AM
To: Jeff Lauruhn (jlauruhn)
Cc: Boris Brezillon; Andrea Scian; Richard Weinberger; mtd_mailinglist; ded=
ekind1@gmail.com
Subject: Re: RFC: detect and manage power cut on MLC NAND

Hi Jeff,

thank you for your availability.
I would like to go back to your statement about Write Protect pin:

 > Power loss is actually very complex.  The Write Protect (WP) pin was  > =
added to NAND help lock the NAND when a power loss event is  > detected.  I=
 have extensive information on NAND and would be happy to  > discuss.

IIUC WP must respect several constraints. For example it must not be transi=
tioned while NAND is busy. What if it is set low while NAND is ready - that=
 is it can accept new commands - but an erase operation is in progress? Doe=
s the erase operation complete anyway?


Best regards,
Andrea MARSON
DAVE Embedded Systems
www.dave.eu


>
>
>
> Jeff Lauruhn
>
> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On=20
> Behalf Of Boris Brezillon
> Sent: Friday, March 13, 2015 1:32 PM
> To: Jeff Lauruhn (jlauruhn)
> Cc: Richard Weinberger; dedekind1@gmail.com; mtd_mailinglist; Andrea=20
> Scian
> Subject: Re: RFC: detect and manage power cut on MLC NAND
>
> Hello Jeff,
>
> I'm joining the discussion to ask more questions about MLC NANDs ;-).
>
> Could you tell us more about how block wear impact the voltage level stor=
ed in NAND cells.
>
> 1/ Are all pages in a block impacted the same way ?
> 	Yes, because of block erase, P/E cycles affect all the pages in a block.
> 2/ Is wear more likely to induce voltage increase, voltage decrease
>     or is it unpredictable ?   Wear is a very well known a NAND character=
istic.   During P/E cycling there is a potential for electrons to get perma=
nently trapped in the oxide.  The more P/E cycles the more electrons get tr=
apped.  Over many P/E cycles cells well get to a point where they look perm=
anent programmed and can't be erased or programmed.  As cells begin to fail=
, ECC can be used to recover the data.  If too many bits fail in page the d=
evice will respond with a FAIL status after a P/E cycle.
> =09
> 3/ Is it possible to have more than one working voltage threshold
>     (read-retry mode): I did some testing on my Hynix chip (I know you
>     work for Micron but that's the only MLC chip I have :-)), and I
>     managed to get less bitflips by trying another read-retry mode even
>     if the previous one was allowing me to successfully fix existing
>     bitflips.
> Read Retry is available on some newer  products.  RR was introduced to he=
lp maintain and improve data retention and P/E cycles as geometry shrinks a=
nd bit/cell increase.  If the device supports RR, we have predefined RR Opt=
ions, based on the most  likely chance of success.  Start with option 1 and=
 step through the options until you get a successful read.  The DS usually =
has pretty good information.
>
> 4/ Do you have any numbers/statistics that could
>     help us choose the more appropriate read-retry mode according to the
>     number of P/E cycles ?  I don't have numbers or statistics, but I can=
 tell you that the RR steps are generally defined based on known NAND behav=
ior.  Go to the Micron website and put in this PN MT29F128G08CBCCB and you =
will find good information on RR.
>
> 5/ Any other things you'd like to share regarding read-retry ?
> RR isn't available on all devices.   From your prospective I would give t=
hem the option to use RR if it's available.
>
> Apart from that, we're currently trying to find the most appropriate way =
to deal with paired pages, and this sounds rather complicated.
> The current idea is to expose paired pages information up to the UBIFS la=
yer, and let UBIFS decide when it should stop writing on pages paired with =
already written pages.
> Moreover, we have a few pages we need to protect (UBI metadata: EC and VI=
D headers) in order to keep UBI/UBIFS consistent.
> Do you have anything to share on this topic (ideas, solutions we=20
> should consider, constraints we're not aware of, ...)
>
> This is one of the reasons I came to this site.  I have a great deal of d=
evice knowledge and I need to know more about how end users use the device.
>
> Most designs today employ power loss detection and employ elegant shutdow=
n to the NAND.  In addition, we provide Write Protect, which provides an ex=
tra layer of protection against power loss.  There is still a chance that i=
f the power event happens during a program to a page, the previously progra=
mmed shared page can also be corrupted.  It's not clear to me how to keep t=
rack of shared pages for every device out there.  It's not like a parameter=
 page that you can read.  It's an interesting problem.
>
> Thanks for your valuable information.
>
> Best Regards,
>
> Boris
>
> --
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
