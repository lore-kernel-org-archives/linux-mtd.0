Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqmVV-0004eV-M9
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 14:42:42 +0000
Received: by bkcji2 with SMTP id ji2so4554544bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 07:42:40 -0700 (PDT)
Message-ID: <1342449432.7270.4.camel@brekeke>
Subject: Re: mtd nand erase and bad block
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Date: Mon, 16 Jul 2012 17:37:12 +0300
In-Reply-To: <4FF30A22.8040500@st.com>
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com> <1338540121.2536.150.camel@sauron.fi.intel.com>
 <20120601140445.346e322e@halley> <4FC8CBA7.6000702@st.com>
 <20120601175407.7c39a8fb@halley>
 <1338898670.2507.48.camel@sauron.fi.intel.com> <4FDEF60A.7010607@st.com>
 <1340790846.29342.19.camel@sauron.fi.intel.com> <4FEAFE73.2040303@st.com>
 <1340965897.3070.144.camel@sauron.fi.intel.com> <4FF14A5E.2060301@st.com>
 <1341318170.2979.61.camel@sauron.fi.intel.com> <4FF30A22.8040500@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-0U264Ngbhs03VJPRI+8d"
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


--=-0U264Ngbhs03VJPRI+8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-03 at 16:05 +0100, Angus CLARK wrote:
> So, are you suggesting that I implement a MEMBBSCRUB ioctl, with a flag t=
o
> indicate whether or not the BBTs should be updated (and some extra paddin=
g for
> future-proofing)?  Might have think about what happens when called on blo=
cks
> reserved for the BBTs...

First of all, implement only what you really need and can test. Do not
try to implement too much of stuff you do not really need. Yes, the
above sounds good. And the BBT eraseblocks are not (and should not) be
directly accessible for erasure/scrubbing.

--=20
Best Regards,
Artem Bityutskiy

--=-0U264Ngbhs03VJPRI+8d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBCcYAAoJECmIfjd9wqK0640P/iJk6l5q1EGPSPEF1wW1Ski+
h9nyrbEi1L9WkicXSWfulwFdRvBZxSsBeCe+vQy9kXx6QUCjpmZYu6iOWP2OrR1I
wpIui/6P/ICDSrfOLLk7w085SHP1bSCGgKVMA6kyWW8ULgg/K/KYFz+ovJ8yDVif
QUl5AhAG9qZrhuIg+4iYaqSHZyNcge+3woHV+PT4YrlBFMgNGEYjn3qXze8wrYIA
2YoTLsVQ0Eb040uYIUksuynYiifOCGk30YlMZlnxdTZ8TWv/yUnXWqzizl0pbv8n
nRzDfKp51mK9MJe1fRzINwbDfD65M+X7bYGIrHD7Dz3WZSZynKQUi2E7uyLuP4xp
ED+WDRQs25vFST2NlNJAjKMGgBXX8WFyvp1TrBNBTdLroleRAF19zPQTB+rprzu+
TvETN2o2P7us8Abb63f8Id+yHz0O6kc/gS9aHESd71Vq7jHpl/3a1z5BjiDM+ElR
bo7+n8USSsL75v++6A3WsPij+Zw/guNYo/tkCEc2pKXkhB6nl/7+yAm1JY1YShQH
JUdMM4PVtv3/m40QMxVTbC4KqUpKBEfmQ2p/QQoZ/JFsMwveltjCD/wP2WIAjDpi
DbzXAZ3jqHy3+ld6G1zuVR05BNkrXLEfXt7klG+PXb/KZ0IG1o/elfjgeqH48CTu
/Z37SasobdFUVemJn0LF
=kW9n
-----END PGP SIGNATURE-----

--=-0U264Ngbhs03VJPRI+8d--
