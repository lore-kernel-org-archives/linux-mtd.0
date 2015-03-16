Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXcIw-0003NZ-Pp
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 21:12:07 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: RE: RFC: detect and manage power cut on MLC NAND
Date: Mon, 16 Mar 2015 21:11:30 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973E2B8@NTXBOIMBX03.micron.com>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com>	<5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com>	<55000637.1030702@nod.at>
 <550074D2.1070406@dave-tech.it>
 <0D23F1ECC880A74392D56535BCADD7354973D072@NTXBOIMBX03.micron.com>
 <55007B79.2090705@nod.at>
 <0D23F1ECC880A74392D56535BCADD7354973D2A1@NTXBOIMBX03.micron.com>
 <55016A43.3000201@nod.at>
 <0D23F1ECC880A74392D56535BCADD7354973DAD6@NTXBOIMBX03.micron.com>
 <20150313213134.1b53430b@bbrezillon>
 <0D23F1ECC880A74392D56535BCADD7354973DF0B@NTXBOIMBX03.micron.com>
 <20150314113214.58d06f3d@bbrezillon>
In-Reply-To: <20150314113214.58d06f3d@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
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

Good morning Boris;
RR is a new feature and not available on all parts few.  I'm not sure about=
 others, but since these are features, you simply enable of disable via SET=
 FEATURE/GET FEATURE.  If you already provide that SET/GET FEATURE function=
ality then an end-user determine if their device supports a feature and the=
n write the code to enable when they need it on their particular design.


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit


-----Original Message-----
From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]=20
Sent: Saturday, March 14, 2015 3:32 AM
To: Jeff Lauruhn (jlauruhn)
Cc: Richard Weinberger; dedekind1@gmail.com; mtd_mailinglist; Andrea Scian
Subject: Re: RFC: detect and manage power cut on MLC NAND

Hi Jeff,

On Fri, 13 Mar 2015 23:51:53 +0000
"Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com> wrote:
>=20
> Hello Jeff,
>=20
> I'm joining the discussion to ask more questions about MLC NANDs ;-).
>=20
> Could you tell us more about how block wear impact the voltage level stor=
ed in NAND cells.
>=20
> 1/ Are all pages in a block impacted the same way ?
> 	Yes, because of block erase, P/E cycles affect all the pages in a block.

Okay, that's what I thought.

> 2/ Is wear more likely to induce voltage increase, voltage decrease
>    or is it unpredictable ?   Wear is a very well known a NAND characteri=
stic.   During P/E cycling there is a potential for electrons to get perman=
ently trapped in the oxide.  The more P/E cycles the more electrons get tra=
pped.  Over many P/E cycles cells well get to a point where they look perma=
nent programmed and can't be erased or programmed.  As cells begin to fail,=
 ECC can be used to recover the data.  If too many bits fail in page the de=
vice will respond with a FAIL status after a P/E cycle.

So voltage thresholds tends to increase with wear, right ?

> =09
> 3/ Is it possible to have more than one working voltage threshold
>    (read-retry mode): I did some testing on my Hynix chip (I know you
>    work for Micron but that's the only MLC chip I have :-)), and I
>    managed to get less bitflips by trying another read-retry mode even
>    if the previous one was allowing me to successfully fix existing
>    bitflips.
> Read Retry is available on some newer  products.  RR was introduced to he=
lp maintain and improve data retention and P/E cycles as geometry shrinks a=
nd bit/cell increase.  If the device supports RR, we have predefined RR Opt=
ions, based on the most  likely chance of success.  Start with option 1 and=
 step through the options until you get a successful read.  The DS usually =
has pretty good information.

When you say you have "predefined RR Options, based on the most  likely cha=
nce of success", does this mean these options are internally evolving durin=
g the NAND block lifetime, or is RR mode 0 always encoding the same thresho=
ld config.
In the latter case, maybe we should start with a different RR mode dependin=
g on the number of P/E cycles already done on the block, so that we have mo=
re chance to successfully read the page on our first read.

=20

>=20
> 4/ Do you have any numbers/statistics that could
>    help us choose the more appropriate read-retry mode according to the
>    number of P/E cycles ?  I don't have numbers or statistics, but I can =
tell you that the RR steps are generally defined based on known NAND behavi=
or.  Go to the Micron website and put in this PN MT29F128G08CBCCB and you w=
ill find good information on RR.

Okay, I'll have a look at the datasheet you pointed out (the Hynix one was =
not even talking about read-retry, I had to search in Allwinner code to und=
erstand how to change read-retry mode).

>   =20
> 5/ Any other things you'd like to share regarding read-retry ?=20
> RR isn't available on all devices.   From your prospective I would give t=
hem the option to use RR if it's available.

Yes, that's already done this way: we use RR on devices providing this feat=
ure. IIRC, only Micron chips are supported so far, but I added support for =
one of the Hynix chip.
The whole problem here is that each vendor implement RR in their own way (u=
sing ONFI params for Micron, OTP area and private commands for Hynix, and p=
robably something else for Samsung chips).

Anyway, that's just a matter of adding a NAND chip database + vendor specif=
ic code to deal with each read retry implementation (even if that would hav=
e helped us a lot if chip vendors had agreed on a standard way to control R=
R).

>=20
> Apart from that, we're currently trying to find the most appropriate way =
to deal with paired pages, and this sounds rather complicated.
> The current idea is to expose paired pages information up to the UBIFS la=
yer, and let UBIFS decide when it should stop writing on pages paired with =
already written pages.
> Moreover, we have a few pages we need to protect (UBI metadata: EC and VI=
D headers) in order to keep UBI/UBIFS consistent.
> Do you have anything to share on this topic (ideas, solutions we=20
> should consider, constraints we're not aware of, ...)
>=20
> This is one of the reasons I came to this site.  I have a great deal of d=
evice knowledge and I need to know more about how end users use the device.=
 =20
>=20
> Most designs today employ power loss detection and employ elegant shutdow=
n to the NAND.  In addition, we provide Write Protect, which provides an ex=
tra layer of protection against power loss.  There is still a chance that i=
f the power event happens during a program to a page, the previously progra=
mmed shared page can also be corrupted.  It's not clear to me how to keep t=
rack of shared pages for every device out there.  It's not like a parameter=
 page that you can read.  It's an interesting problem.

Of course, preventing page corruption is a good approach, but some board de=
signers are just simply not taking these constraints into account, and dete=
cting power loss in order to assert the WP pin is not possible in such desi=
gns.

I think we should also find a solution to recover from corruptions induced =
by paired pages write, and that's the direction we're currently investigati=
ng.

But if someone have real examples (boards) supporting power loss detection =
+ WP pin control in such cases, maybe we can start thinking about a standar=
d way to deal with that in Linux.

Thanks again for your answers.

Best Regards,

Boris

--
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
