Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SkYzJ-0001Gf-CA
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 11:03:45 +0000
Message-ID: <1340968069.3070.148.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] ubifs: Fix build warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Fri, 29 Jun 2012 14:07:49 +0300
In-Reply-To: <1340657269-8588-1-git-send-email-aletes.xgr@gmail.com>
References: <1340657269-8588-1-git-send-email-aletes.xgr@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-jxI3kNP2xoremLEeHj8C"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-jxI3kNP2xoremLEeHj8C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-25 at 17:47 -0300, Alexandre Pereira da Silva wrote:
>  #include "ubifs.h"
> +#include <linux/compiler.h>

This is not needed, I've removed this chunk and pushed to
linux-ubifs.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-jxI3kNP2xoremLEeHj8C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7YyFAAoJECmIfjd9wqK0mkMP/iE4463WSYETj0SxmddII1k+
9j8z6iZdM0lRPIlzIjUnmjB6gsmos4pGIm4aLltd37k2l+jlw1WJ2Bdh1k0480IC
uf1WVmTh/8m8nJh0bm/ctOygoxqcNQjUj6rGFHK6DBk6qPJ5yKnM6GeZ9z2kNqpF
F+8cP5n2a05mWqkmGwijJaFcbqhOJEKJgaT9y3t+bKPaYRbBowCj25MHgL1HDX0T
a9yQiOw2/WPDcj/0FOdEe0MSN96sM/H99m2YzegVH3tv2K4zu8DpQby+C0S5x44d
kUmgpeUHAXbtAiS/Z22fd5cgRYBZlER9A7gW9M0RaHzhPxK8D6wll2LOn9RqFQEO
nwH2iSc6IeHQKHcg0iIasMzD9HrRwu+fjuQgNTMVqKmDydtCt4WVoWbrKX9aIGN3
UgiwJUeo4y/QXaf8fV+9G4UpPbQo3BvT04o128V8NxcoUm1DYFdZacNjwUwP1zNX
mEW7WBy5qPadu8+SfGYA9Kv9PVsaMe1mb943RfTKxU9PsgMcQiPi7ieZRyGTkd5j
jMJIithaSV0JK6EQ5jMHyMUZc0j6bHfV65hmZhmtW1jPpeYeOQHyweulkqwf5yvH
EeTKB3JAutGu3PoNo21B65SyxpkWn+TxnSC9ryjb5No+vdmfanYwUUXi777auyj1
VJDyubZXLDFPSxP611PM
=ve2X
-----END PGP SIGNATURE-----

--=-jxI3kNP2xoremLEeHj8C--
