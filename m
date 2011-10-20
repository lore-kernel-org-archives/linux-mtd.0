Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGvPi-0007YC-3B
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 16:24:14 +0000
Received: by wwj40 with SMTP id 40so2963703wwj.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2011 09:24:12 -0700 (PDT)
Subject: Re: Need to recover from corruption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Steve Iribarne <siribarne@grid-net.com>
Date: Thu, 20 Oct 2011 19:23:53 +0300
In-Reply-To: <4E9CA094.4090002@grid-net.com>
References: <4E975135.9090702@grid-net.com> <1318765406.2935.7.camel@sauron>
	<4E9CA094.4090002@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-6BBCeVLMMeKjtLoKCP5v"
Message-ID: <1319127839.20953.10.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-6BBCeVLMMeKjtLoKCP5v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-10-17 at 14:39 -0700, Steve Iribarne wrote:
> On 10/16/2011 04:43 AM, Artem Bityutskiy wrote:
> > On Thu, 2011-10-13 at 13:59 -0700, Steve Iribarne wrote:
> >> I work on a system where we need to be as 100% uptime as possible.  Th=
e
> >> other day we had an issue here where one of our applications was
> >> crashing while a write to one of the partitions was happening.
> >>
> >> I then turned on UBIFS debugging in u-boot and I have a bunch of info
> >> but I have no idea what is going on.
> > Well, judging from the log UBIFS went nuts for some reason (negative
> > free space). I've never seen this before.
> >
> > Could you please write some more information about your system, flash,
> > kernel version, etc. Please, follow these instructions:
> > http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_send_bugreport
>=20
> I'm working on getting this info for you now.

Could you please also verify your flash with the mtd tests. The symptoms
do not look like you have driver-level issues, but this is a good idea
to do anyway. You can find the tests in the kernel and some info at the
MTD web page.

--=20
Best Regards,
Artem Bityutskiy

--=-6BBCeVLMMeKjtLoKCP5v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOoEsZAAoJEJtuLFy+q7fe9/QH/iSqTTIU+5fWNkob5zZu8V9W
depxuCYY44XXprRJqiIzu09DBp/H2HSvhYBpDSOg3ZIvTwKATxIZexSXevAdPYL8
oX0ASOVp2PSSmV3J0Yu8UX8rOtcF9KWRSfxhxf8KEzFHlThTzvGv1H7/OG9IRtCM
HpeCAwp0yP+ZYiXspz41+i/zYRI45yvxG3HAAU4zfg4p1w/g8oAJiQ7D5MNU+CvY
E+1nb5BOlDinWMhi4J5tniPAQGPS7Rk5t4dw1U59405lUZGUagDB/juWRfDPvbwm
lBEBy9sIo3B/Gehf3OOf8aCd7kAVfC3nHX0CxjBlP2dnKHmqixpTbP8a4DfJur0=
=Ag5b
-----END PGP SIGNATURE-----

--=-6BBCeVLMMeKjtLoKCP5v--
