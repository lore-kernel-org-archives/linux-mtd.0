Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7RbF-0003Dv-6Q
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 13:17:14 +0000
Message-ID: <1331644780.3595.56.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Mar 2012 15:19:40 +0200
In-Reply-To: <CACRpkdZw-nR3uS=FKrOtzgTACWc+=FfrspuT9PvyXDm+RMRFSg@mail.gmail.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
 <CACRpkdbf1_4otJFK728LKO=neGFdC6YEHFX+R00iTL0dcvKe1A@mail.gmail.com>
 <CACRpkda26TT24Wrm5A7u2T-zTgWYHWC2EJD=frBAQX8ffkB3eA@mail.gmail.com>
 <201203131353.40163.sr@denx.de>
 <CACRpkdZw-nR3uS=FKrOtzgTACWc+=FfrspuT9PvyXDm+RMRFSg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-w4M2cLTKFGzeO3ac4luZ"
Mime-Version: 1.0
Cc: Armando Visconti <armando.visconti@st.com>,
 Vipin KUMAR <vipin.kumar@st.com>, dbaryshkov@gmail.com,
 linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
 Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-w4M2cLTKFGzeO3ac4luZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-03-13 at 14:01 +0100, Linus Walleij wrote:
> On Tue, Mar 13, 2012 at 1:53 PM, Stefan Roese <sr@denx.de> wrote:
> > On Tuesday 13 March 2012 13:39:32 Linus Walleij wrote:
> >> > (...) and I get the default partitions from some SPEAr platform
> >> > currently,
> >>
> >> This is just because of the above bug.
> >>
> >> I'll fix!
> >
> > I already sent a fix for this:
> >
> > mtd: fsmc_nand.c: Partition info from pdata overrides driver defaults
>=20
> Oh sorry I was coding too quickly. Missed it previously.
> Thanks for fixing this.
>=20
> Artem, forget my patch if you like, if you already have Stefan's patch
> applied, please add Cc: stable@kernel.org on it because I'm using
> this driver...

I somehow missed Stefan's patch, and was not pinged, unfortunately. I
see it in my mailbox, but it does not apply anymore because it conflicts
with patches from st.com which I applied recently.

Stefan, would you re-send a new version and add:

Cc: stable@kernel.org [3.2+]

Sorry for missing your patch.

Additional notes about -stable.

When Greg will try to push this patch to -stable, the patch won't apply,
and he traditionally sends an e-mail in such cases with something like
"if you care, send me an applicable version, or I'll drop this patch".
He usually adds people who signed-off the patch to CC. So to make sure
Linus W. gets this patch in -stable, we need to add his Signed-off by as
well, and then he'll need to respond to Greg.

--=20
Best Regards,
Artem Bityutskiy

--=-w4M2cLTKFGzeO3ac4luZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPX0lsAAoJECmIfjd9wqK0RaMQAIPsdHPjsAhPgPTnck/T05us
EHyGZivGUKkvfyN9sYtLw1rk2XnIoU7Fn1U6bwKRn7pnHHM/ffshbo0cIxEVrnFb
K+MsDOj3SqJolGsEx7JigFWB8lVv6t6IiPTs6RK/oSUHmcMA/Y1MIoSi+lgDmZOJ
f+631BWGOF4GGwQF6mSLotUlgPY8WBpKCE+heAxZI0fLUkWUGOMEPdMgxuojn5O6
S6pO3YIYVEJLr2CTCGl7a2RpjWw4XHvAKyPMQaHMiowwgxfVUjf84YgzGa9Y3ct1
yzjohIVGxXTTcofZP9BlVhf5KPUM0NLKxeAbmwcxg6oAyg0Ux4CZOxNZl6oa0AUF
vurGpqB5mGHpsENVpVkpXjEfjM9hl7i9Dey6TZXzs17jXUJR8XfnXRllCH9kprO7
lnqjwX6sZI5SWDYL9T/mAIK9Qz/S4kkBVCls7F+eSp04e7ohiq/nkZ7BsI8oRJlR
/JOabqq3B7gowGHMu8BdcChhKUNxqRE0L5JKl6sm+j4L5BeVaYjbcUoBD+ak9gFy
h7vcJaijQkQShQi4/phehf3Ljw2dNt2SbPVny42yWZSrs72KsDifvXcr48UA2Y9l
V2s8RLIMXb9XCWR8U7w/PuW/Pn4rSsKSDXHM8+OC2UVwmKwX176n4h/PQB1YsMYB
EHTjIKz+uSTu0mJ/pmrL
=aYU4
-----END PGP SIGNATURE-----

--=-w4M2cLTKFGzeO3ac4luZ--
