Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3nRU-0004Mq-Gl
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 12:20:21 +0000
Message-ID: <1345551904.2848.95.camel@sauron.fi.intel.com>
Subject: Re: new 3.5.2 ubifs debug assert
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MichaelHench@gmail.com
Date: Tue, 21 Aug 2012 15:25:04 +0300
In-Reply-To: <CAHyXW63+bY-Dq_miAWMQc=RYqaBwGrZHn95wgJXuK3NHWsnzbg@mail.gmail.com>
References: <CAHyXW63+bY-Dq_miAWMQc=RYqaBwGrZHn95wgJXuK3NHWsnzbg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4TAx+IFN5y/+1fbabOuD"
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


--=-4TAx+IFN5y/+1fbabOuD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 13:09 -0500, Michael Hench wrote:
> apparently UBIFS debugging is always on in 3.5.2
> can anyone tell me what this means ?

It should not. We use 'pr_debug()' for debugging messages, which are
off by default. To enable them, you need to do something like described
here:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_debug

E.g.,
echo 'format "UBIFS DBG" +pf' > /sys/kernel/debug/dynamic_debug/control

would enable all UBIFS debugging messages.

I do not know why they are switched on in your system.

> UBIFS assert failed in dbg_snprintf_key at 136 (pid 28692)

Hmm, strange, would be interesting to see the length in your setup.
Would you try this patch:

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index bb31672..52b0290 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -133,6 +133,7 @@ const char *dbg_snprintf_key(const struct ubifs_info *c=
,
                }
        } else
                len -=3D snprintf(p, len, "bad key format %d", c->key_fmt);
+       printk(KERN_ERR "len %d, p %s\n", len, p);
        ubifs_assert(len > 0);
        return p;
 }

and send what that printk says?

--=20
Best Regards,
Artem Bityutskiy

--=-4TAx+IFN5y/+1fbabOuD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQM34gAAoJECmIfjd9wqK06twQAJWuWPszHbtizn1pRhyoGvJx
AikNyYc32MpH+BYOULOQCaTrAbcOSpVGfIoJb4WNQAJs4cXi0UIGTIYwMcguHLYt
GpS6OpkZVMt6T7Rfnq3UauvQS41VKo4jm1q+k8ET1LfPIf1kVmIpOx46+tRRoIhN
SZJk/RszcBI4xKMj3EC3fNNRG1DTeEH0wHCxQATdMHIAc6mIYURbtzZpoGGG5oIt
n6tQHuRvq1XsTmnkUMcEHZGbRwm9HI7WNWmo46p99PXPIlRJTZo2tJq2NLGROkoT
+Eu/CxuEIEl/jPSAdNyOyqsfk2V+i2Ps0aEtiTROHUMhbkhIAIMxrnCQXno8i77l
0+LeEZ3Lm+hYJauCEa5ge9qWBYocOUIWEvnEupgQl2oUjBHQXeDHs8Eu1KZ/0BvZ
YAe+XDMaOuoxMqO1Y7L7LDXGwGid7z4eiGOmjvfRTjMN5WZ3cTRqd3mXgoE/RSa9
INMs5O3IetEoATyDppi1tYLK8FO3qOUlFA6jK3E1klMX49yEZeU8H8/1b+4CeUUh
p8mUYkN3PBhcrLR9gRYV9Dz/1tiymxxDKa5u2Ad/NAsnIyy308/UV48Af6ON/L+U
Z4//UOg+inKqmMbOH99kEQksOzqbDUaBV1ZMCzZTSs3elDOCABFiZMmGSGP+j0Vn
NHjTVMo2f6KXGf53BSMZ
=Ft3+
-----END PGP SIGNATURE-----

--=-4TAx+IFN5y/+1fbabOuD--
