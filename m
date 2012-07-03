Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sm246-00056Q-JL
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 12:18:51 +0000
Message-ID: <1341318170.2979.61.camel@sauron.fi.intel.com>
Subject: Re: mtd nand erase and bad block
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Date: Tue, 03 Jul 2012 15:22:50 +0300
In-Reply-To: <4FF14A5E.2060301@st.com>
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com> <1338540121.2536.150.camel@sauron.fi.intel.com>
 <20120601140445.346e322e@halley> <4FC8CBA7.6000702@st.com>
 <20120601175407.7c39a8fb@halley>
 <1338898670.2507.48.camel@sauron.fi.intel.com> <4FDEF60A.7010607@st.com>
 <1340790846.29342.19.camel@sauron.fi.intel.com> <4FEAFE73.2040303@st.com>
 <1340965897.3070.144.camel@sauron.fi.intel.com> <4FF14A5E.2060301@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Uy1Em/DMyoDJKzIfzvfv"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
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


--=-Uy1Em/DMyoDJKzIfzvfv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-02 at 08:14 +0100, Angus CLARK wrote:
> On 06/29/2012 11:31 AM, Artem Bityutskiy wrote:
> > On Wed, 2012-06-27 at 13:37 +0100, Angus CLARK wrote:
> >> However, for case 2, I just want to force the erase operation so I can=
 wipe the
> >> BBTs and return the device as close as possible to its original state.=
  We could
> >> put some logic in the kernel, "if 'MEMBBSCRUB" on BBT blocks, do not
> >> update/rewrite BBTs", but I think this "policy" decision would be bett=
er handled
> >> in userspace.
> >=20
> > Sounds like you need 2 separate ioctls:
> > 1. MEMBBSCRUB
>=20
> There are occasions when it is useful to unmark a bad block, but without =
erasing
> first.  Therefore, I guess my preference would be to split this further:
> 'erase-bad-block' and 'mark-block-as-good'.

I can smell over-engineering - any good example? Note, you will leave
unused bytes in the ioctl data structure an make it extandable in the
future.

--=20
Best Regards,
Artem Bityutskiy

--=-Uy1Em/DMyoDJKzIfzvfv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP8uQaAAoJECmIfjd9wqK0sioP/3sWNKAh7IMco+0Q2XbTwCYg
N4k8s4eDtqsZlU0aDYEt0Nd5YKfRoSP87oApSLgsGLjDMGenx76KpPpsXrshPhr4
Y5MB1mIKU1OhFTnYNHZBGRu+4p3Q7uW/eejcvV3dPoRR4TCG0mp6GefX/sptMdds
NOs0j9HizBC4Z1xnOxxabyu8D9NH/wwItNaa3jxkHj7sF0i6+nUOS3T4zrAdA39i
mKjahr+b78qFiGTqBeKBFKWQFwvKlzrxPKQsNoimB8oQW02Xg/Due+xjN0UIdQxb
UGdMgwLps82iPRZKrfAu7V+8CiiD4zYOAmDqXdUCULtqjs2hBHEDUG1330Hcevgw
bEXGi4A9k7VsyDxrM1BoJFoRr83WyquVuH0MHlLpIPmI1BVEVpZs1mcV2rxxYY/l
WbXipzsmdl5nkzhojGL4lT61iCZTwCbFTuqSpPl31J/xXYHYhQFYb2ke0H30qFke
cNifIErK2ljAxUVVnGQTUA7KpKIYWsqFIRnTjBq46TchI5nNRqTfQs4/SSQ4qY5K
5yKeysUGTQHWsRZH66gY7CQez0Aj++cmWGHn+7PD0kokEVGuRrqLvZKNa9NvIcEm
Ts9Y8XkCBVunr4bANRnsujQ5oogfQWVux0bW59dBZUy8Yx00/kfptJealCwYQDQC
BeVe34OkBOpkCRyaGiAf
=T3j0
-----END PGP SIGNATURE-----

--=-Uy1Em/DMyoDJKzIfzvfv--
