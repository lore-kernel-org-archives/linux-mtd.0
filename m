Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sbsbl-0007NG-Ui
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 12:11:34 +0000
Message-ID: <1338898518.2507.47.camel@sauron.fi.intel.com>
Subject: Re: UBIFS master node corruption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Romain Izard <romain.izard.pro@gmail.com>
Date: Tue, 05 Jun 2012 15:15:18 +0300
In-Reply-To: <jqa0im$9gb$1@dough.gmane.org>
References: <jq7t2r$md2$1@dough.gmane.org> <4FC87383.2020303@intel.com>
 <jqa0im$9gb$1@dough.gmane.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ofOmGc7VyRhBLb3elTxk"
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


--=-ofOmGc7VyRhBLb3elTxk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-01 at 09:04 +0000, Romain Izard wrote:
> From what I understand of the user-space application running on the
> devices, there are many operations related to switching UBI and UBIFS to
> a read-only mode, to support a 'boot snapshot' feature implemented with
> Linux suspend. Since the patch you indicated me was related to changing
> the read-only property of the volume, I guess I should continue to
> search in this direction.

Can you share your corrupted image?

--=20
Best Regards,
Artem Bityutskiy

--=-ofOmGc7VyRhBLb3elTxk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzfhWAAoJECmIfjd9wqK0BEwP/02CnmrM3xGPLurYghip1XQ8
Xq4JVqaDgLyQWVwGSIjJTxEb07wFHlCxru7UyBvDjTdqBuFr9KK6ytsk1VPQc5e8
8UzIOqo2LxqPbsQUpdkvshEqYqMjVmTPUHvHW8Tc+6hN4q/4Ri2p91EgVaERezDW
+7lyoCooK5KExf0sH/PC4mRWSD2TK7VOv51AxxtRlPL6MIm+t++qti+rlTK90YP2
f0o3qTckgUyL5nuWEdnS1njUmC9KnvHqkcFwDQZF7emLC6zfcRwwQglEzDRcuCuB
Y03vDDtGQtUdrb5IAvAFaywwNkBt5bCewg8sldZFs9MDUDxqql7EjZ110NLcFH3Q
S38ouvEYvaZ7Ze2arAt7OX3qBedSWFKstv/L2jpe3/yqiEE5n3uESRMyGGc/j/1l
Fi5nTvmW/l+XKbJ49Zc7y+/XRMT8+I5eFdVouFHfbrB+GNnlTEPg2/fsRsCOtN//
J7248mS92aSOKnJrZJfAnbznBMzfSQkxnxMlOZAxnr/AhwhMr2aLSHPp2jhMgZ0K
PAVo6ndYFZr+2vt65FUmsfjkDxw6YN2GzQsiS9Axjqb+p0pVS3WSHgjgpgk1Fbr/
Pv+cewIRufz2s/VqhKHi1Ah8V6xfzEByIsf6KVN3VEGIYiyFQBv9L0VQQs+eGgg8
p6dvmSMnV0uTp6nUoa5r
=Y46b
-----END PGP SIGNATURE-----

--=-ofOmGc7VyRhBLb3elTxk--
