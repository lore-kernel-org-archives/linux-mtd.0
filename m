Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SIlMF-0008LS-UE
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 18:36:34 +0000
Date: Fri, 13 Apr 2012 20:36:17 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Unstable bits and JFFS2
Message-ID: <20120413183617.GA22004@pengutronix.de>
References: <CAHMF36FsVeg=ZVtZZz8H6YLj3GhKwD-ofCV1hcJcL5cVVKRK1A@mail.gmail.com>
 <CAN8TOE-2exM1YomfbiQ_CzkZn=MbotYwSxJnzU6mNVK4WPBNdQ@mail.gmail.com>
 <CAHMF36GrBOZBTzyBpxD2U+nkBcZExGqkvKY7fkA6494M2PtShw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CAD87@dekaexchange07.deka.local>
 <1334334462.13160.10.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <1334334462.13160.10.camel@sauron.fi.intel.com>
Cc: 'Matej Kupljen' <matej.kupljen@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Atlant Schmidt <aschmidt@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> > > Artem, you said that this unstable bits only happen
> > > during power cuts, is this right? Would those appear
> > > also on simulated power cuts, the ones that integck
> > > can produce?

A bit of hijacking this thread, yet it fits somehow to the idea I got
yesterday:

There is the Open Project Proposal again, where the CEWG funds topics which
improve embedded linux in general [1]. I wonder if it makes sense to hand i=
n a
proposal starting to tackle the 'unstable bits' issue. I could imagine task=
 1
mentioned in the wiki page (1. Improve the existing power cut emulation
infrastructure in UBIFS and start emulating unstable bits. Start with emula=
ting
only one type of unstable bits, e.g., type 1.) could be a good candidate for
such a proposal. Since I am not deeply involved with this topic:

1) Is this task still needed?
2) Is it a good task for a 2-3 week period (I'd think so)
3) Are there people around up for the task?

I'd be willing to write the proposal, if nobody else volunteers. (yet, give=
n my
constraints, I am not the right person to actually work on it). Even if the
proposal doesn't get contracted, the topic itself might get some attention
since it will be discussed in the CEWG.

What do you think?

Regards,

   Wolfram

[1] http://elinux.org/CEWG_Open_Project_Proposal_2012

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk+IciEACgkQD27XaX1/VRuBtACeN8ZlG3MOn651LaHwXzVBG37g
eU4AoJMkMYouT1tELXgMwCLVnV/kLJVK
=qVUn
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
