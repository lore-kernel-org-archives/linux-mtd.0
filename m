Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUFfD-000560-5q
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 11:11:35 +0000
Message-ID: <1337080498.2528.161.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] UBI: add lnum to struct ubi_work
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Tue, 15 May 2012 14:14:58 +0300
In-Reply-To: <alpine.DEB.2.00.1205142046080.12448@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205142046080.12448@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-tC0oWOnLN8uLQcGQ3Xce"
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


--=-tC0oWOnLN8uLQcGQ3Xce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-14 at 20:47 +0200, Joel Reardon wrote:
> @@ -1086,13 +1090,14 @@ out_ro:
>   * @ubi: UBI device description object
>   * @pnum: physical eraseblock to return
>   * @torture: if this physical eraseblock has to be tortured
> + * @lnum: the last used logical eraseblock number for the PEB
>   *
>   * This function is called to return physical eraseblock @pnum to the po=
ol of
>   * free physical eraseblocks. The @torture flag has to be set if an I/O =
error
>   * occurred to this @pnum and it has to be tested. This function returns=
 zero
>   * in case of success, and a negative error code in case of failure.
>   */
> -int ubi_wl_put_peb(struct ubi_device *ubi, int pnum, int torture)
> +int ubi_wl_put_peb(struct ubi_device *ubi, int pnum, int torture, int ln=
um)

Joel, am sorry for nitpicking again, but could you please put the "lnum"
argument between "ubi" and "lnum" instead? Just feels more natural.
Otherwise the patch is OK. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-tC0oWOnLN8uLQcGQ3Xce
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsjqyAAoJECmIfjd9wqK0ij8QAMLIBEQzONNLDgMDCFeqUhnz
/J2hdxKvxwIl1uMNJg5+ODdKEBQLz7uoh86GIi6USCNxau7GtW3QS4KkAzsJGB3x
0NVghTyUw1CfvrTGwllM90KqU1vbKTbwY3inAuoVebdZTG0RtJmRhtkmkFgO15E0
AVwnnVFtz4Icn+0CTNzYFQ5mN5e3f3NNb3SwXHg8jUuAEh1EB4E6SqRXpoyOyhlj
Xi/mulT+0x2yRI2WSKujrqCYcqO64BPiEI1jO+BPwWLvignhAy+A7LqFwXR8S7bN
+Fg1qNgtlWv/AjxDsg5jcGByWk8sNpgWNKG/15m/Bz1Y5mCF9n8oFLjzf8ud41sO
azOq7zsIpG2f1cARbF6xpTDGQEITciL0eF7y2vH5DppriurIZGgqenzW2x1hPG2A
8kQtElveYZt3KEx68toQ0+wfbQ0rjQ9I7xtBO+g+J1bkaQttpBYUEVV/+fqoxnyi
p3k/BD4WwTofKUkxTBj4KypduoUGJ4BmjU2L0Da2q8jDqRsaQYZdf1R9sapVhi1f
ecFaouyk7KHSVKgrrNPlhLcBCknXGVUjdzOuqWdNsl3awsBefDwqSsW0hZyPFEhB
jFZ7PD5ekkEujoauTsvPOaATPNxgUNOH0mgjhOKlZniLIpd+EGZ2xj968mARwvza
0JaTnzcTpKeuTzmD70sh
=tGX5
-----END PGP SIGNATURE-----

--=-tC0oWOnLN8uLQcGQ3Xce--
