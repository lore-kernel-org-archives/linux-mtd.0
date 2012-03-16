Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S8Wa7-0007qH-VG
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 12:48:32 +0000
Message-ID: <1331902271.3730.76.camel@sauron.fi.intel.com>
Subject: Re: [patch] Remove notion of key schemes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Fri, 16 Mar 2012 14:51:11 +0200
In-Reply-To: <alpine.DEB.2.00.1203151545410.26775@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <1329152067.22240.214.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1202231558400.13720@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1203151545410.26775@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Sig/7iVrSPtJ51bG1RyB"
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
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


--=-Sig/7iVrSPtJ51bG1RyB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-15 at 15:48 +0100, Joel Reardon wrote:
> +       __u8 padding0[8]; /* Watch 'zero_dent_node_unused()' if changing!=
 */

Also please, be consistent with overall UBIFS coding style and comment
fields at the structure header comment, not near the field itself.

--=20
Best Regards,
Artem Bityutskiy

--=-Sig/7iVrSPtJ51bG1RyB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYzc/AAoJECmIfjd9wqK0FHYQALYK8W6S+J+BB6VQSQAnZ59x
/HB8OOxzFmP9ZQ+3X56KTH4aoGYZdIb8NxdEl2DtKfearOxQDXIr2m0wH+V5TYO/
4+s3oYxAKgS/i+QMCxZ5sMBATxQAyyW5LgRciFPVJJ7zBIQLsItU+NcI1PMHzBWb
3JVP/ORZMhthFRmB/+FfRVOv0Qrk5i+1q5pUYrZmI47fJVttMltkEYLF5XVMft+x
EWzr/K9su3fuXVw4R7sPh4AvVbTcC6yWEEQddW1N80pdvuZ9Ife+W81nHehbqZu5
66zuxaT3ikGYY5QchsLJ2L2MNbpT8lu0wBdDnjxpcCteOfIoRGsrpEq+MWdaaFNV
Sl1H5qaDpYENnsevR6Gu7XiZCblkMqrpNR1nzVCK8hO1M7sEbwvlmUd5QIxMLTbP
DzmrE7753A3YiQjc7sn/llsThqCdJg+Uq86y9ekzNULim7iU0KACOU6WL5rJ4PYo
3BT4P1F3azf9yhYpGDovMiXNJ4YbBRRCQQ9XzZsoGvqwIRbs+mW9RpSdz0NX4K9Y
Z7WxLb4qRYa4ityjYgLrHs4ALTPXrfUN//JmgfkptZZbxNcDTunmNtXDrVZieqH7
Wf61bqwHBRChJ8Cj3NklGKBwFc8mkZdz7KkDgFvv7F4XGKzXI6JINHe1cvF+lyWm
X0thRLlX/NUG4A3mbjnq
=cJId
-----END PGP SIGNATURE-----

--=-Sig/7iVrSPtJ51bG1RyB--
