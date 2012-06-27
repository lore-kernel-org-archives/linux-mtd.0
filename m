Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjosu-0006TA-Cc
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 09:50:05 +0000
Message-ID: <1340790846.29342.19.camel@sauron.fi.intel.com>
Subject: Re: mtd nand erase and bad block
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Date: Wed, 27 Jun 2012 12:54:06 +0300
In-Reply-To: <4FDEF60A.7010607@st.com>
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com> <1338540121.2536.150.camel@sauron.fi.intel.com>
 <20120601140445.346e322e@halley> <4FC8CBA7.6000702@st.com>
 <20120601175407.7c39a8fb@halley>
 <1338898670.2507.48.camel@sauron.fi.intel.com> <4FDEF60A.7010607@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-SNBX0kPGhT+Vu9eIH0Vc"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-SNBX0kPGhT+Vu9eIH0Vc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-18 at 10:34 +0100, Angus CLARK wrote:
> Hi Artem,
>=20
> On 06/05/2012 01:17 PM, Artem Bityutskiy wrote:
> > On Fri, 2012-06-01 at 17:54 +0300, Shmulik Ladkani wrote:
> >>
> >> My personal preference would be:
> >> 1. A new ioctl (MEMSCRUB?)
> >> 2. debugfs flag, PER MTD PART (slightly safer than your global flag)
> >> 3. global debugfs flag
> >>
> > Yes, I guess option 1 is the best I think. Option 2 needs too much work=
.
>=20
> Are you ok with the name MEMSCRUB?  I know previously you have objected t=
o this
> name, since it might get confused with UBI scrubbing
> (http://lists.infradead.org/pipermail/linux-mtd/2010-September/032031.htm=
l).  In
> fact, the conclusion of that thread was to add an extended erase IOCTL, w=
ith a
> 'flags' parameter to capture options such as erase bad blocks.  Would thi=
s be
> the preferred method (it didn't seem to go anywhere last time), or is 'ME=
MSCRUB'
> with the existing erase_info_user64 structure acceptable?

I think Shmulik had a good point - scrubbing is not only about erasing,
but also about changing the BBT. So a separate ioctl makes more sense.
As for the name, we could name it MEMBBSCRUB, I guess?

--=20
Best Regards,
Artem Bityutskiy

--=-SNBX0kPGhT+Vu9eIH0Vc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6tg+AAoJECmIfjd9wqK0XO4P/1peZFjFwk6dZMkgw3lzV7AB
S5XMUk4Y3AGM8NdkkI5TkkZvnCt6867ud9iktgFq/dFWrQ9LfOYNabwYb6RfEveP
b0PrZBxc/mdhkCH/kPdAUkbX8fTRNfolqzk+mIO4I+1iAbJRjYNEmNOQNpEPft+6
ace8pFujoAm4TlX9GJVcvElHpownvPBR6t/WBsnWeRoRAO2oOje9Oq+nvxCT7+Bp
QcZ2bwBQR58Qy3nDPjSYrawBY8UEIPFimmVti+IROqEB6OfznZ2Tg1eHgCFzTxrm
xN9wBufdv7/r1Q1uHrmTDwxeCrYLv8yent6PTSPzjVHygLvjn6SYdMvSCXBrs5Uk
6zdUgB30sVGQxd/TDCO4v9bw4WiUWitkSyZwIu3GaDX5SwHJ7rz2pMUbZ1yG+YRN
B5IM5n+wHZ+e+sNSsVy2zKOHlIMd0eOYR6gMxidkLb+xUtfeonsnNGM4JF3TlO2c
PigwssCP+thjGvsL5q69PAzKrRHrvko8wHyO5ddra+gdkdhOurBmp/CGQq0HdSdl
EFB+tPQtXX0/C0BFHLPomGurz857sM5n1PhnJKPT4UxYmwmyMCRWX4XO5fQfHKP9
i23IV315q3OrJtKpPOKk7rfCGEfK6RQHb3Z1h9RT9YHKOK0cuhFRo9sg208blvdJ
cFLj4pZUHpu1b2bC96pf
=wMjF
-----END PGP SIGNATURE-----

--=-SNBX0kPGhT+Vu9eIH0Vc--
