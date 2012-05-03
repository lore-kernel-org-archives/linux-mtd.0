Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPtKH-0001JH-UQ
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 10:31:58 +0000
Message-ID: <1336041318.13013.30.camel@sauron.fi.intel.com>
Subject: Re: atmel_nand, DMA, and "Fall back to CPU I/O"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 03 May 2012 13:35:18 +0300
In-Reply-To: <CAN8TOE9+WpSrYufSpKXy6RW_V8M_1dZg+uBB6ChmcAWnxmVCnA@mail.gmail.com>
References: <037801cd2330$0cd747d0$2685d770$@com>
 <1335959619.10293.41.camel@sauron.fi.intel.com>
 <CAN8TOE9+WpSrYufSpKXy6RW_V8M_1dZg+uBB6ChmcAWnxmVCnA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kVJB7nGxbhU+Zu7utmMt"
Mime-Version: 1.0
Cc: George Pontis <GPontis@z9.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kVJB7nGxbhU+Zu7utmMt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-02 at 12:32 -0700, Brian Norris wrote:
>=20
> And how might you recommend we use kmalloc()'ed memory, Artem? We
> can't really kmalloc() whole eraseblock-sized chunks. Or is there an
> inexpensive way of providing an intermediary kmalloc'ed buffer? I'm
> not too familiar at hacking at UBI(FS), but it might be worth a shot
> sometime, if you think it's reasonable.

This would need to change several places in UBI and UBIFS and switch
from continuous vmalloc buffers to iterating over an array of smaller
buffers.

I was thinking about this in the past but this is rather big project (a
months or a couple I'd say) so I did not have time to do this.

I think we basically need to switch to flexible arrays
(Documentation/flexible-arrays.txt), but last time I looked at this I
remember I decided that flexible arrays functionality would need to be
extended for our purposes.

If someone seriously is going to do this work, I am happy to discuss.

--=20
Best Regards,
Artem Bityutskiy

--=-kVJB7nGxbhU+Zu7utmMt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPol9mAAoJECmIfjd9wqK0ZxwP/1M2vxsPoG0djeZDDJCg8w3d
FwoHnFWPtCm71xJCoBQgSzTsRZJG5cmj6kTPTOSfW2eW5i6bWtxA8gzao4Q/3ya2
bma2E+BNm84MPs8MsuTONxe4JsoN/LONmchnJILtsJQ1abQXRQ8LDLpXC//v9WJV
qIUR5AbaKZRPG7bRSzt/z02AsgwXsHiWkwvf9q3Sscyyz0LD9Qn8oRinTdlbe1UD
rNYTxbS/QxeEhLs0vLOWcnTSu1lSAy/WnuGnkcW9An+d03lAg1gHYYTeae43Ii3Q
EFUftlU142cPrtBPL+EzYraWMGlykNgBHN+kBAabbvr6jcQbgslB5hJNuYbmBAAl
6zfVEH84u/FWsP2YsEFLIvIYJrh89If0Lnc8pwKPLWLw135eKdwZoy+62jqGNMSN
UtfHbj0xz13iZgLoRXHkc+UrOFC4yHcwyARJYUOnsWcQ6R2x/7dqyk7zs8g9U2Tx
2I60BzBhZrv7iyrQXPOJTEHwt4ZX23Q5dKLEax2SEp8vLU6CyB2/UR7yagRTIR6D
2XaHq5EmOK6+6uzQHLmf8/F8y7y3fmtdfLUSmZQ6AEOSm8ZeUyvU7qzdT+WMJx/+
cnM+cAYzjN3bGRfxplwCDOcZJM2YkjMngPorjbUE3pIOumC55EJhliMwHppprqhZ
T67fKpirLQK/ZEPcGUjV
=o+Cy
-----END PGP SIGNATURE-----

--=-kVJB7nGxbhU+Zu7utmMt--
