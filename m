Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SkbXr-0007I9-GC
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 13:47:38 +0000
Message-ID: <1340977901.3070.210.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Change the default percentage of reserved PEB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 29 Jun 2012 16:51:41 +0300
In-Reply-To: <1340953061-15728-1-git-send-email-richard.genoud@gmail.com>
References: <1340953061-15728-1-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mp4pLt36clgX0v8TR3n8"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mp4pLt36clgX0v8TR3n8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-29 at 08:57 +0200, Richard Genoud wrote:
> The actual value (1%) is too low for actual NAND devices, a huge
> majority of device has 2% maximum bad blocks (SLC or MLC).
> (Actually it's 20 blocks on a 1024 blocks device, 40/2048...)
>=20
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Thanks. But I'd like to wait a bit - Shmulik's point is fair and the
current way UBI reserves PEBs is probably not the right thing to do. If
we are going to change it, I'd like to have this patch to go together
with that change. Just because it is better to change the default
behavior once, than 2 times, to possibly upset/surprise users less
times :-)

--=20
Best Regards,
Artem Bityutskiy

--=-mp4pLt36clgX0v8TR3n8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7bLtAAoJECmIfjd9wqK0e4YP/1MT5dnqEE9H5nCk/bvwTQ+N
8irFKi8ueUo2QxxxlHz8TWlSGpPLOd3yNUWUEwT9TuJ2cvOsYacmW3Veh7ddh/sk
YCLG+BkDsw7pXSXjQFqBrb9zjhpe1gpBQ8AlCSwQc6sv/mAzWJ4YiTyX4B8S8akK
7G6ID5eRK8vwboEtysSw/b0LgJcF+4i6gl5Zj/PrhU/Wi5oP6nvKPbxVnDGzN7lU
4hIeh+/GKLLzRH4nDeFmTvs9DTi72r/g3/fcUVtMZkCb+Tjhp8zyEaHv6QNyYSzO
ArjMiVBKRyPs13flFH2Ui/xqGGBQjZ6/kdXak3/xew8bvRXSXXZD0n3JYdV5wWbE
qaIhQUWZN+cMsqSIi+8S+zgRi5tPkKfrU6hUI19i6iRz+amDtx0h/R8+U0Or8rru
STRnC5gc8d79pUcBa9VyXjRpTuaxxKnCcVCL8dQrqz6UWUj0UXWxI/0AcGGQKHnw
CwgqroQvqT1dSa8VeHad822LuS8G1nDj1ywMX25ACF5RNd+uZI5JeHAK3wjq0hBh
36TRwgPCi2cav157TTeVUn7f6TmcFbtbrDuLGVR59IMzC+w8qcRCORVcloOSd58d
5qGXlj8chs/bERHlyFwFM/nceoczeMrw9YEZ3+qaHwmMvC1BK/NHYamP+qDXXdRO
HzhEWVEBYZ1TOBGpGDvc
=0kVn
-----END PGP SIGNATURE-----

--=-mp4pLt36clgX0v8TR3n8--
