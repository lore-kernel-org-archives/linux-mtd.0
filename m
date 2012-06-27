Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjpUf-0007eh-HU
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 10:29:06 +0000
Message-ID: <1340793187.29342.43.camel@sauron.fi.intel.com>
Subject: RE: Patch MTD: increase time out value for buffer program
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Youxin He (youxinhe)" <youxinhe@micron.com>
Date: Wed, 27 Jun 2012 13:33:07 +0300
In-Reply-To: <567E14D9F917DD43923114D48B1586363D569F2F@NTXBOIMBX01.micron.com>
References: <mailman.0.1338988276.11201.linux-mtd@lists.infradead.org>
 <6ACDE3A4C2F7E94C8DBB6FCC0D06A0873DA88046@NTXBOIMBX05.micron.com>
 <1340726334.3119.150.camel@sauron.fi.intel.com>
 <1340767634.2317.1.camel@koala>
 <567E14D9F917DD43923114D48B1586363D569F2F@NTXBOIMBX01.micron.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-brBqvWvar15IXxTXpOtG"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Changming Chen \(changmingche\)" <changmingche@micron.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "Frank Liu
 \(frankliu\)" <frankliu@micron.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-brBqvWvar15IXxTXpOtG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-27 at 05:23 +0000, Youxin He (youxinhe) wrote:
> Hi Artem,
> How about just change HZ/1000 stuff to msecs_to_jiffies()? Schedule_timeo=
ut() is a good idea but I don't see it is necessary to use schedule_timeout=
() to replace schedule(). The code you add below is just for suspend case, =
normal case will not go to schedule(), but normal case you should check for=
 timeout otherwise infinite loop in case a program failure occur. =20
>=20
> +	#define WRITE_TIEMEOUT 4
> .......
> -	unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
> +	unsigned long uWriteTimeout =3D msecs_to_jiffies(WRITE_TIEMEOUT);

I think that the current code simply buggy and needs to be re-wised.
E.g., what is this:


timeo =3D jiffies + (HZ / 2); /* FIXME */
mutex_lock(&chip->mutex);
...
if (time_after(jiffies, timeo) && !chip_ready(map, adr)){

What if we are not able to grab the mutex for longer than "HZ/2".

So I suggest you to try to come-up with the general clean-up of the
timeouts in this driver. AFAICS, but not sure because did not think hard
enough, schedule_tiemout() could be use in most places in this driver.

--=20
Best Regards,
Artem Bityutskiy

--=-brBqvWvar15IXxTXpOtG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6uFjAAoJECmIfjd9wqK0kDUP/3tXXn0DCDeUZsz8qINDiDHr
YAhHezgZ2Znow0RutLae0grMJJG8rS2GKoNUVzYC+PLwSDAtSU46QXc9oYnyDOMm
Coqnbc4M3Nkp9+HABQ+SnbACj/e8e1RalmDRI6aoW0Ktw8dSj1jsVNRUGd+Whg2d
ry34uX/sYQ9VsnxfFXhShEPIYtVpipoedmcbRSUPGxAKc5E+VSATYs0HweUKzqmN
KHnASCIxOHwmbpAUMHbL38Wds28TVy4LgYNXLuoTI7jcfFEFrt6p/VMUqAADi7JT
BgqsCBolCsMvAgXUL5GSe98P0jaUdQAZQTAs3s5Rp0MrQAWT+9W/Ux2O7DwN+9ma
x2bi4UKEPSPROw9+JYZIIv+lJwDKuvbZ+3bqZYXqpfIbnErZtgWOTwSE/26rgZRz
EZJ8wIrOr3B/a1t7DQAN8sK9pWIYoHNt6T57tpnebOxs0pTdTCnOsbrLTc7ISUSa
r8RCYDgBxmTtBmdNraR60rNX09tbV+vWRj/QsMlz8iGT3WhEMRVED4Eu5Gqz3iem
1VQMzpjmiUKirADipR27XAIRXnVOk88B3yj03ztx0FrdgGGO5FgEF2LbKBEc1UeE
e5vvYSzo6dgey3EU+bq0jkOgCobA48lm4uyGUtiNRbpmIY4s9d4cZFjymHSQIY6P
sF0ohS6V4IQdTHhMC39l
=bixO
-----END PGP SIGNATURE-----

--=-brBqvWvar15IXxTXpOtG--
