Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWZNY-0003x7-31
 for linux-mtd@lists.infradead.org; Fri, 13 Mar 2015 23:52:33 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: RE: RFC: detect and manage power cut on MLC NAND
Date: Fri, 13 Mar 2015 23:51:53 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973DF0B@NTXBOIMBX03.micron.com>
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
In-Reply-To: <20150313213134.1b53430b@bbrezillon>
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




Jeff Lauruhn

-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Boris Brezillon
Sent: Friday, March 13, 2015 1:32 PM
To: Jeff Lauruhn (jlauruhn)
Cc: Richard Weinberger; dedekind1@gmail.com; mtd_mailinglist; Andrea Scian
Subject: Re: RFC: detect and manage power cut on MLC NAND

Hello Jeff,

I'm joining the discussion to ask more questions about MLC NANDs ;-).

Could you tell us more about how block wear impact the voltage level stored=
 in NAND cells.

1/ Are all pages in a block impacted the same way ?
	Yes, because of block erase, P/E cycles affect all the pages in a block.  =
 =20
2/ Is wear more likely to induce voltage increase, voltage decrease
   or is it unpredictable ?   Wear is a very well known a NAND characterist=
ic.   During P/E cycling there is a potential for electrons to get permanen=
tly trapped in the oxide.  The more P/E cycles the more electrons get trapp=
ed.  Over many P/E cycles cells well get to a point where they look permane=
nt programmed and can't be erased or programmed.  As cells begin to fail, E=
CC can be used to recover the data.  If too many bits fail in page the devi=
ce will respond with a FAIL status after a P/E cycle.
=09
3/ Is it possible to have more than one working voltage threshold
   (read-retry mode): I did some testing on my Hynix chip (I know you
   work for Micron but that's the only MLC chip I have :-)), and I
   managed to get less bitflips by trying another read-retry mode even
   if the previous one was allowing me to successfully fix existing
   bitflips.
Read Retry is available on some newer  products.  RR was introduced to help=
 maintain and improve data retention and P/E cycles as geometry shrinks and=
 bit/cell increase.  If the device supports RR, we have predefined RR Optio=
ns, based on the most  likely chance of success.  Start with option 1 and s=
tep through the options until you get a successful read.  The DS usually ha=
s pretty good information. =20

4/ Do you have any numbers/statistics that could
   help us choose the more appropriate read-retry mode according to the
   number of P/E cycles ?  I don't have numbers or statistics, but I can te=
ll you that the RR steps are generally defined based on known NAND behavior=
.  Go to the Micron website and put in this PN MT29F128G08CBCCB and you wil=
l find good information on RR.
  =20
5/ Any other things you'd like to share regarding read-retry ?=20
RR isn't available on all devices.   From your prospective I would give the=
m the option to use RR if it's available. =20

Apart from that, we're currently trying to find the most appropriate way to=
 deal with paired pages, and this sounds rather complicated.
The current idea is to expose paired pages information up to the UBIFS laye=
r, and let UBIFS decide when it should stop writing on pages paired with al=
ready written pages.
Moreover, we have a few pages we need to protect (UBI metadata: EC and VID =
headers) in order to keep UBI/UBIFS consistent.
Do you have anything to share on this topic (ideas, solutions we should con=
sider, constraints we're not aware of, ...)

This is one of the reasons I came to this site.  I have a great deal of dev=
ice knowledge and I need to know more about how end users use the device. =
=20

Most designs today employ power loss detection and employ elegant shutdown =
to the NAND.  In addition, we provide Write Protect, which provides an extr=
a layer of protection against power loss.  There is still a chance that if =
the power event happens during a program to a page, the previously programm=
ed shared page can also be corrupted.  It's not clear to me how to keep tra=
ck of shared pages for every device out there.  It's not like a parameter p=
age that you can read.  It's an interesting problem.   =20

Thanks for your valuable information.

Best Regards,

Boris

--
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
