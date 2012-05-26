Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SYHmX-0001pw-O1
 for linux-mtd@lists.infradead.org; Sat, 26 May 2012 14:15:50 +0000
Received: by laap9 with SMTP id p9so1562335laa.36
 for <linux-mtd@lists.infradead.org>; Sat, 26 May 2012 07:15:47 -0700 (PDT)
Message-ID: <1338041744.2525.46.camel@koala>
Subject: Re: [RFC v7] UBI: Fastmap support (aka checkpointing)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Sat, 26 May 2012 17:15:44 +0300
In-Reply-To: <4FC0E257.1030403@nod.at>
References: <1337771191-95358-1-git-send-email-richard@nod.at>
 <1338036094.2525.7.camel@koala> <4FC0E257.1030403@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-20S/G86t3TDymXYh5elg"
Mime-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-20S/G86t3TDymXYh5elg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-05-26 at 16:01 +0200, Richard Weinberger wrote:
> > We can start with the UBI tests from the mtd-utils plust the integck
> > test. And whatever goes to my branch should never break them. Do these
> > tests pass now? If not, let's make them pass.
> >=20
>=20
> What is "integck" test?

It is a quite extensive FS check which we use for UBIFS. As UBIFS is the
main UBI client - it makes sense to run it. It lives in the
mtd-utils.git/tests/fs/integck

./integck -n8 /mnt/ubifs

would run in. /mnt/ubifs is the ubifs mount-point. -n8 means repeat 8
times.

> UBI tests from mtd-utils pass now.
> The io_paral triggered a race condition on my very fast qemu-kvm test sys=
tem.
> On my test board with real NAND flash this race never happened.
> Anyway, it's fixed now.

Cool!

> I'm mostly testing with custom scripts, shall I send a patch against UBI =
tests?

Yes, it would be great to integrate this, of course. I might also want
to send you a patch, then I'd run it.

--=20
Best Regards,
Artem Bityutskiy

--=-20S/G86t3TDymXYh5elg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPwOWQAAoJECmIfjd9wqK0ZCgP/3mqtNa+nR8Nz2IQjh2Nh4mE
HPzE9EHSOlgglKFqe1Dn2FZptU9rjqYJQrGXkRztc4mtHHnEfRgjVdDim2T/e6RV
xycI00Nj99Nv4kRiNV9vMSo7Bq6t6ekA0JXRkMx/UbXaHBnes8HOZGXxW/cCHc2s
R8WfWB2X8S9VcdnE3iEZLFrdCmEvs817OymJVSTxeO0M0/qYBnDkEND7PMx7JZ1P
OlIKMaXopQ7Ubc7FKPd9TkqA0h3hx98L7r7BLox7rFzA9mwgTTpKyoH7XEIMMnoj
JDMXxsSUtmuuDA9HDP6alSbL9OvVqczJ/OLirqw7VB9gTDZgtndM9koK7po1GYiy
LAmkZdAv2q8ga8Dfi1ACZpS1uI6EfGenNnGstFhDG6NGcoL42ZN1C3loR7/SbdcZ
6CptR+nXgyWbTRwf28bt0L4virMGHRaleAiP5Cps7zVkyqSmoAp9BnuPuB9dtC9L
C6YnlTVPKLxezgbTD6HGpHVcrBkVrwm8LlnCRBoAtUssG9M8d80wZ+lejlHl0Ugk
akgrQVUvmMEQjsE2nhMlQcmV8rWA5ZMi3ZL1LMWK0ELYjwRq0dR7sMiEAQUOuawU
ifQd5oxjrSuzj8C30O0BJT+1nilMs79mttDzcnBkJBXaoljna6dOY+igFX/8A/GK
iIYynJ1QlEsHCjHAIY0N
=/fPx
-----END PGP SIGNATURE-----

--=-20S/G86t3TDymXYh5elg--
