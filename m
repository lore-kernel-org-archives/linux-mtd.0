Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S8UI5-0000ep-AE
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 10:21:45 +0000
Message-ID: <1331893462.3730.41.camel@sauron.fi.intel.com>
Subject: Re: ubiattach oops/warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <rw@linutronix.de>
Date: Fri, 16 Mar 2012 12:24:22 +0200
In-Reply-To: <4F62076E.2080409@linutronix.de>
References: <4F62076E.2080409@linutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4AERg28vOTcvOmq+/WTn"
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


--=-4AERg28vOTcvOmq+/WTn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-15 at 16:14 +0100, Richard Weinberger wrote:
> Hi!
>=20
> While attaching to a NAND chip with lot's of damaged PEBs
> I UBI gone nuts.
>=20
> See the attached log file.
> Looks like a bug in an error path.
>=20
> Kernel is 3.0.23 plus some board specific fixes.
> I didn't touch any UBI stuff...

Can you reproduce this? Did you preserve the flash image?

--=20
Best Regards,
Artem Bityutskiy

--=-4AERg28vOTcvOmq+/WTn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYxTWAAoJECmIfjd9wqK0LloQAMa+SZp9fLJCZiq0yII2Kfug
19w5ABS7veIjHr9tQWJPS6jWyrAudsVQZNcjQfKVTxRC95MFCEL3l54CrUdVLvgw
avNdYEQ4sWMRip/a+IS+B9pF3Fk55gPuBPcKI3XQKFYNli29coV79oNm8yKU8KUM
C18HIONtD7ePX6EX/hQS0gX6h0sA5ej9VfvZMd9uewYy2J6IXOk8javsSoBxlnQ5
fvb3kwCopxByFsSCaoCQcmX5igXwYzC1h612efj0U4L5NQdkFjhYNYBpTPMy7bNC
htPex+KsKVTD0pezLrXr93kia02eg5da0nrKLClvt+xqdZMYlLIkYF8IELekxtG1
rYHXXRAknM/rs4uBwblA167ocQbNK2QoqnjgbO1+VBWugA3KhFBb9oceCiNlziUa
B0U0hMrCzeKJ9SoJ4aXyXbeUsfYW0iucCXr9LNNsvH7bNTPvgQ6RdqkDkoOoxqF8
68ZeivKrwBPCoHyTOgd0x2K776xdJPtFvOOvKa+ROsa+tmIbK7vMFOD9QWLTs2YD
2B5S0TFvVA55DqStzpfhRHi2Oc1o4g8mCfyUvXhf2+7yGjd2bvv9sVhOPColtADJ
GxOYQQhpyNqxGHRQQG7JNrkYc8VrXgfzDkeD+pZ4FRg0WemTNI5j5wPEfzTtyYcg
TZZ6AzLHnR8uY1L9vWCv
=MyuB
-----END PGP SIGNATURE-----

--=-4AERg28vOTcvOmq+/WTn--
