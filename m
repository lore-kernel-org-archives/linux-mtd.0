Received: from mx0.aculab.com ([213.249.233.131])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TVhCM-0006yI-ON
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2012 11:20:03 +0000
Received: from mx0.aculab.com ([127.0.0.1])
 by localhost (mx0.aculab.com [127.0.0.1]) (amavisd-new, port 10024) with SMTP
 id 21579-04 for <linux-mtd@lists.infradead.org>;
 Tue,  6 Nov 2012 11:19:46 +0000 (GMT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH v2 00/11] introduce random32_get_bytes() and
 random32_get_bytes_state()
Date: Tue, 6 Nov 2012 11:18:22 -0000
Message-ID: <AE90C24D6B3A694183C094C60CF0A2F6026B7094@saturn3.aculab.com>
In-Reply-To: <90816.1352178872@turing-police.cc.vt.edu>
References: <1351957422-23243-1-git-send-email-akinobu.mita@gmail.com>
 <90816.1352178872@turing-police.cc.vt.edu>
From: "David Laight" <David.Laight@ACULAB.COM>
To: <Valdis.Kletnieks@vt.edu>,
	"Akinobu Mita" <akinobu.mita@gmail.com>
Cc: Michel Lespinasse <walken@google.com>, Theodore Ts'o <tytso@mit.edu>,
 Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, devel@open-fcoe.org, akpm@linux-foundation.org,
 Robert Love <robert.w.love@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Eilon Greenstein <eilong@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Sun, 04 Nov 2012 00:43:31 +0900, Akinobu Mita said:
> > This patchset introduces new functions into random32 library for
> > getting the requested number of pseudo-random bytes.
> >
> > Before introducing these new functions into random32 library,
> > prandom32() and prandom32_seed() with "prandom32" prefix are
> > renamed to random32_state() and srandom32_state() respectively.
> >
> > The purpose of this renaming is to prevent some kernel developers
> > from assuming that prandom32() and random32() might imply that only
> > prandom32() was the one using a pseudo-random number generator by
> > prandom32's "p", and the result may be a very embarassing security
> > exposure.
>=20
> Out of curiosity, why the '32'?  I'm just waiting for some kernel =
developer to
> do something stupid with this on a 64-bit arch because they think it's =
a 32-bit API. ;)
>=20
> Should we bite the bullet and lose the 32, as long as we're churning =
the code *anyhow*?

Also why remove the 'pseudo' part of the name?
It is an important part of the name.

	David
