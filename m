Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXuvK-000760-BM
 for linux-mtd@lists.infradead.org; Tue, 17 Mar 2015 17:04:58 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Andrea Scian <rnd4@dave-tech.it>
Subject: RE: RFC: detect and manage power cut on MLC NAND
Date: Tue, 17 Mar 2015 17:04:20 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973E536@NTXBOIMBX03.micron.com>
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
 <5507F436.7030903@dave-tech.it>
In-Reply-To: <5507F436.7030903@dave-tech.it>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, MT29F32G08CBADAWP is available under NDA.  These are actually two diff=
erent process nodes.  MT29F32G08CBADAWP is one of our latest processes. =20


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit


-----Original Message-----
From: Andrea Scian [mailto:rnd4@dave-tech.it]=20
Sent: Tuesday, March 17, 2015 2:30 AM
To: Jeff Lauruhn (jlauruhn)
Cc: Boris Brezillon; Richard Weinberger; dedekind1@gmail.com; mtd_mailingli=
st
Subject: Re: RFC: detect and manage power cut on MLC NAND



Dear Jeff,

Il 16/03/2015 22:11, Jeff Lauruhn (jlauruhn) ha scritto:
> Good morning Boris;
> RR is a new feature and not available on all parts few.  I'm not sure=20
> about others, but since these are features, you simply enable of=20
> disable via SET FEATURE/GET FEATURE.  If you already provide that=20
> SET/GET FEATURE functionality then an end-user determine if their=20
> device supports a feature and then write the code to enable when they=20
> need it on their particular design.

I can confirm this. In fact I'm currently working with two Micron NAND:

MT29F32G08CBACAWP
MT29F32G08CBADAWP

The latter should be "just" a newer die revision of the former (at least, t=
his is what our distributor says)

There's a technology change between the two and, in fact, the latter suppor=
ts RR while there's no mention of such a feature inside rev C.

Jeff, could you please help me in understanding which if the following sent=
ences are true and which are false?
- rev D is more "robust" than rev C because it has RR (so an additional fea=
ture that improve error correction)
- rev D is "robust" like rev C, if rev D is used with RR
- if RR is not used rev D is more error prone than rev C

I think this is crucial to understand how RR works and how much is needed i=
nside MTD/UBI code.
I hope that the above information are not under NDA ;-)

Thanks in advance,

--

Andrea SCIAN

DAVE Embedded Systems
