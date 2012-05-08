Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRi8W-000325-QR
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 10:59:22 +0000
Message-ID: <4FA8FC83.7000503@nod.at>
Date: Tue, 08 May 2012 12:59:15 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBI: Replace yield() with cond_resched()
References: <1336465602-12627-1-git-send-email-richard@nod.at>
 <1336467723.23308.23.camel@sauron.fi.intel.com>
In-Reply-To: <1336467723.23308.23.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig8F5C05EDFA887649D3D72122"
Cc: peterz@infradead.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig8F5C05EDFA887649D3D72122
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 08.05.2012 11:02, schrieb Artem Bityutskiy:
> On Tue, 2012-05-08 at 10:26 +0200, Richard Weinberger wrote:
>> The comment above yield()'s definition says:
>>  * If you want to use yield() to wait for something, use wait_event().=

>>  * If you want to use yield() to be 'nice' for others, use cond_resche=
d().
>>  * If you still want to use yield(), do not!
>>
>> The yield() usage of UBI really looks like the "be nice for others" ca=
se,
>> so use cond_resched().
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> CC: peterz@infradead.org
>
> I guess we would better sleep for a couple of hundreds of milliseconds
> instead.

So, you'd prefer a msleep_interruptible(500) instead of yield() in this c=
ase?

> The purpose was different. If we have I/O error, we hope it is a
> transient failure. E.g., the HW is temporary unavailable because of an
> internal issue. And with yield() we hoped to schedule away for longer
> time than usual and let other processes which may affect that HW go
> forward and do something.

Okay, yield() is clearly the wrong choice here.
cond_resched() is better.

Thanks,
//richard


--------------enig8F5C05EDFA887649D3D72122
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPqPyDAAoJEN9758yqZn9ejpgH/2tvAjGBbOKEFwbnCCNgEnAz
zQ0tC1cM/IwU0pftqDd2MlPEVpkPNzqW/sFfDMAEqaF9kY+GFztY8piYaZX3Pqtc
w9kIvBU12QTAswZdvI4vFBybsumzLBRsQuSzDv+FiT19HolY90eUWXBAFC8oQT6I
bawGrXXH3uCIvgxgnF36irYRibq69fWeTFQOeBtiXnPt+RC/jzZO6CJwdpaCAJWq
mTwC5ckR9I61W2kUWMQpzg++wGKpEKw/SwXGpyxXXcqicjkVZ2zEqtft/d+rGjg7
DDHVYtNxNFuAjMC3m1rYgqRUOZuAcPVybr77JzF8x4S60eqaCY4Xk56DwPvUEY8=
=UWP6
-----END PGP SIGNATURE-----

--------------enig8F5C05EDFA887649D3D72122--
