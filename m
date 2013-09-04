Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VH9f3-0008Sl-1C
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 09:46:05 +0000
Date: Wed, 4 Sep 2013 10:45:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Trent Piepho <tpiepho@gmail.com>
Message-ID: <20130904094529.GO3084@sirena.org.uk>
References: <1376216117-5864-1-git-send-email-wangyuhang2014@gmail.com>
 <CA+7tXih4XkhZ8xGcaUdGU6O4ZN1ZLfqyjb2UEKsRxsZBA+=DZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="6kpOI20Kt7FNSDww"
Content-Disposition: inline
In-Reply-To: <CA+7tXih4XkhZ8xGcaUdGU6O4ZN1ZLfqyjb2UEKsRxsZBA+=DZw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2]spi: DUAL and QUAD support
Cc: "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 wangyuhang <wangyuhang2014@gmail.com>, "Gupta, Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--6kpOI20Kt7FNSDww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2013 at 08:24:08PM -0700, Trent Piepho wrote:

> So if no spi-tx-nbits property is supplied, the device is rejected and
> the loop continues to the next device entry?  This means ALL EXISTING
> DEVICE TREES with SPI devices will be rejected, since none of them
> have this new property!  Was this patch tested at all with any system
> before being accepted?

This particular issue is already fixed properly anyway.

--6kpOI20Kt7FNSDww
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSJwE2AAoJELSic+t+oim9tYgQAIKN67VNInqRIYw/lRd0r+X8
mcC0MC6/0mZt5yYnQvvJXklG7LLngjKtqV0Gy7G4NK+TN/aL85vFIjvMWF/9yxfC
G/J5DgTq18hHLrj4hS7//jjpkgzJkVTTYzEVt+1ZWPtDoyIUrOna8Ygb8wSHwfX+
6igKYvEVDgA5vcE3Xdyh07Eg7hQX0A0tn68ZTypMVndslLBGqQCBm9bUOGL468j1
33zwxeg/W20rBVVU4AFeOAQtPoEzqaeod8lrDS9blmaJ46nDP8og4d2PixQt8uHd
0QbmWWQaup6n2NHDtkaxLMtoQWuOI8Rt8j38L2StTXnG92816HGYAtOZ/Y9lTeRa
bGBY62GoCUt38uQgZU/JsCAfcWhOlpkETp7XvehTaYGlnBO83izgoSlVakAkJRmW
YTITmfqEHVu3yg/VD63jE7Z3zhKn6LsWKXJEKppZvAYJsOy+/jad17PXhtgYcYXz
OlalxoyTbI29HHIt7MgcFp9Cth1oKyCVNTWriUHDYYPoS3kv/PpuPCIN4WcD1yWB
aGMkg+eVsibnD4+uC+uCzj92DyvaXweWMtVTtLXiZNlHDptSEvtS/jlhrzgcRK/H
5A1u5EEXUflj9DxAT5dSGwddhUwAVJVrNtyIZvhqMNwTobYCEG74iSHEXFebLhWE
3Ksjwar6SdeBkPqbUGkn
=Tlc+
-----END PGP SIGNATURE-----

--6kpOI20Kt7FNSDww--
