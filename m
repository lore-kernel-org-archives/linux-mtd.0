Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4wKI-00059q-30
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 16:01:38 +0000
Message-ID: <1345824387.2848.336.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cmdlinepart: fix the wrong check condition
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Fri, 24 Aug 2012 19:06:27 +0300
In-Reply-To: <1345355849-8992-1-git-send-email-shijie8@gmail.com>
References: <1345355849-8992-1-git-send-email-shijie8@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-eo3GkTmbg94/tQzSucT9"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-eo3GkTmbg94/tQzSucT9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-08-19 at 01:57 -0400, Huang Shijie wrote:
> If the mtd_id is NULL, the check condition will be true.
> So the cmdlinepart may parses out several mtd partitions.
> This is obviously wrong.
>=20
> Just fix it.
>=20
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

I do not understand from the description what is exactly the problem
with the current code, and how exactly you solve it. Please, elaborate
some more by re-sending the patch with better commit message.

> @@ -328,7 +328,7 @@ static int parse_cmdline_partitions(struct mtd_info *=
master,
> =20
>  	for(part =3D partitions; part; part =3D part->next)
>  	{
> -		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))
> +		if (mtd_id && (!strcmp(part->mtd_id, mtd_id)))
>  		{
>  			for(i =3D 0, offset =3D 0; i < part->num_parts; i++)
>  			{

So you may also just add

if (!mtd_id)
	return 0

at the beginning?

I guess you should first try to explain what that check is trying to do,
what is mtd_id and when it can be NULL. Then tell what is the problem
and how you solve it.

--=20
Best Regards,
Artem Bityutskiy

--=-eo3GkTmbg94/tQzSucT9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN6aDAAoJECmIfjd9wqK0JqcQAMjyFQOejzQJHZm8OsEsKsIG
0JvKLCds8qv7LqHI07cZV5MnHroIb+Vxqr3XzzTm5I0H/hdbQwDelqfJNUWqhy2C
mjeibO4FEIFTcaaucp+wpvtSlOAE8kfdkgSyfdmoD5YgkFo+SoNYZmJ6FDlYq18B
k3vB1OixuLtf5kmRrO94I6nzSCMQeuE0YtZTixwEHNCFu+A+7FpWXX8fshKsnaWQ
R1T1wNOJjwKfQRS/w98ThU24B3Ukl+S2j8e0k1sa5C7DD5qgfXJsHK3pqhWWVVgN
bMVMQj5jlDfy2ASzMqDsIVbIIHO/Ky50luoEUT91FI292nYgaBmeOV9xAbOxS20h
3LmJpDjwlnKGwUyG+hHNmfkcXMO0Id+FjReUgVfc4erPzeuZtUg+DQfwVocuqzi7
5FcYg2rid3VwJr29qwNLnWLvdYGhwuY6Bh18YD4yyQ/f4Tvwju74Z69hW9eId3qS
OaaQm62UapmUhG4AWOYOqErfIqa3BJytFFuYT1r1d4W2ovZkaka7fDXeNNC/BJjm
YNPTjPRT5M9NoxyNNjG6uu0lLos14b6o9335iqYbd5BX/PvC5Nv8FxWsga4quLSR
CmjOB9wusuy+w34hrnzOb8NvxkqnOyXBvficzvrvv37RWu/Y0S7gTzLet5m7F1PX
5tRJsysckiW4BBx4HV2a
=x7+Y
-----END PGP SIGNATURE-----

--=-eo3GkTmbg94/tQzSucT9--
