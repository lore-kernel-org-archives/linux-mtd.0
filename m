Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXuZt-0002wJ-5c
 for linux-mtd@lists.infradead.org; Tue, 17 Mar 2015 16:42:50 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Andrea Scian
 <rnd4@dave-tech.it>
Subject: RE: RFC: detect and manage power cut on MLC NAND
Date: Tue, 17 Mar 2015 16:42:07 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
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
 <0D23F1ECC880A74392D56535BCADD7354973E2B8@NTXBOIMBX03.micron.com>
 <5507F436.7030903@dave-tech.it> <20150317110230.28cfec36@bbrezillon>
In-Reply-To: <20150317110230.28cfec36@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>,
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

Very nice explanation!  Not sure if I could have done better myself. =20

Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc


-----Original Message-----
From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]=20
Sent: Tuesday, March 17, 2015 3:02 AM
To: Andrea Scian
Cc: Jeff Lauruhn (jlauruhn); Richard Weinberger; dedekind1@gmail.com; mtd_m=
ailinglist
Subject: Re: RFC: detect and manage power cut on MLC NAND

Hi Andrea,

I'll let Jeff answer this question, but I'd like to share my understanding.

On Tue, 17 Mar 2015 10:30:30 +0100
Andrea Scian <rnd4@dave-tech.it> wrote:

>=20
>=20
> Dear Jeff,
>=20
> Il 16/03/2015 22:11, Jeff Lauruhn (jlauruhn) ha scritto:
> > Good morning Boris;
> > RR is a new feature and not available on all parts few.  I'm not=20
> > sure about others, but since these are features, you simply enable=20
> > of disable via SET FEATURE/GET FEATURE.  If you already provide that=20
> > SET/GET FEATURE functionality then an end-user determine if their=20
> > device supports a feature and then write the code to enable when=20
> > they need it on their particular design.
>=20
> I can confirm this. In fact I'm currently working with two Micron NAND:
>=20
> MT29F32G08CBACAWP
> MT29F32G08CBADAWP
>=20
> The latter should be "just" a newer die revision of the former (at=20
> least, this is what our distributor says)
>=20
> There's a technology change between the two and, in fact, the latter=20
> supports RR while there's no mention of such a feature inside rev C.
>=20
> Jeff, could you please help me in understanding which if the following=20
> sentences are true and which are false?
> - rev D is more "robust" than rev C because it has RR (so an=20
> additional feature that improve error correction)
> - rev D is "robust" like rev C, if rev D is used with RR
> - if RR is not used rev D is more error prone than rev C

RR shouldn't change NAND robustness (or sensitivity to read/write disturban=
ce generating bitflips).

AFAIU RR will help you improve your NAND lifetime, because you're allowed t=
o change voltage thresholds which means you can fix errors that were previo=
usly considered as unfixable and lead to blocks being marked bad earlier.

I'll let Jeff correct me if I'm wrong ;-).

>=20
> I think this is crucial to understand how RR works and how much is=20
> needed inside MTD/UBI code.

Hopefully this can all be handled in the MTD layer, with some help from the=
 UBI layer to feed the wear information (number of P/E cycles on each block=
).

Best Regards,

Boris

--
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
