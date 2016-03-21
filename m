Date: Mon, 21 Mar 2016 13:07:34 +0000
From: Mark Brown <broonie@kernel.org>
To: P L Sai Krishna <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>,
 Soren Brinkmann <soren.brinkmann@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Stephen Warren <swarren@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Andrew F. Davis" <afd@ti.com>, Marek Vasut <marex@denx.de>,
 Jagan Teki <jteki@openedev.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Harini Katakam <harinik@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 Anirudha Sarangi <anirudh@xilinx.com>,
 P L Sai Krishna <lakshmis@xilinx.com>
Message-ID: <20160321130734.GS2566@sirena.org.uk>
References: <1458562809-36114-1-git-send-email-lakshmis@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jt7EHN8kmSCh+bhe"
Content-Disposition: inline
In-Reply-To: <1458562809-36114-1-git-send-email-lakshmis@xilinx.com>
Subject: Re: [LINUX PATCH 1/2] mtd: Added dummy entry in the spi_transfer
 structure.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--jt7EHN8kmSCh+bhe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2016 at 05:50:08PM +0530, P L Sai Krishna wrote:
> This patch does following things.
> 1. Added dummy entry in the spi_transfer structure.
> 2. Assigned dummy cycles to dummy member in the transfer
> structure during read operation.

Please try to follow the patch submission process covered in
SubmittingPatches, in particular please use subject lines reflecting the
style for the subsystem (which helps people identify relevant changes to
review) and...

>  drivers/mtd/devices/m25p80.c | 1 +
>  include/linux/spi/spi.h      | 2 ++
>  2 files changed, 3 insertions(+)

=2E..split things up into individual patches, for example here you're
both adding a new feature and adding a user of that feature in a single
patch.

> + * @dummy: number of dummy cycles.

This needs to be clearer about what a dummy cycle is and where it gets
inserted.  We probably also want a better name, just "dummy" makes it
look like a padding field in the structure.  How about dummy_cycles?

> @@ -752,6 +753,7 @@ struct spi_transfer {
>  	u8		bits_per_word;
>  	u16		delay_usecs;
>  	u32		speed_hz;
> +	u32		dummy;
> =20
>  	struct list_head transfer_list;
>  };

This isn't enough to add the feature - a client driver trying to make
use of this needs to be able to tell if the cycles are actually going to
be inserted.  I'd expect to see a capability flag that can be checked
and some error checking so that if we try to do a transfer with dummy
cycles and can't support it we don't silently ignore the dummy cycles,
ideally also something that'll handle multiples of 8 bits with SPI
controllers that don't otherwise support this feature.

--jt7EHN8kmSCh+bhe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW7/IUAAoJECTWi3JdVIfQZnQH/i7FHKVIOkFtymIUz9NRek6N
joT894mrU+y/6WJ+WilaLomxB/Wbh/Gkybhds69GmSREhu0lSJmWbRdm9XIhZeCk
50w309+ExCzzXb6TBSebuXOYXR9j8JIyNjrpgrU199ZtkUFlge8oqDqimKwM2tz/
WkD99CwQmd34TS5rgo2LnpqYq+nrbXYqcYGqJv3jXWrPYAJM/U4J/rTIkHPwXjrs
1dVRlXHHQnD9pvulc07exHfYH4Js4cNdir6MMyrCyA8K7jTHc165TQvJqFBnppVw
K8/DAY3z0/zBT1MlMcig2Nea0aX8Ct91xwng8LFRQ7P3edyEsjtp0kj5ZnHXyrk=
=XwVw
-----END PGP SIGNATURE-----

--jt7EHN8kmSCh+bhe--
