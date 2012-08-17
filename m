Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2GZx-0004u0-9M
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 07:02:46 +0000
Message-ID: <1345187208.27859.3.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] UBI: replace MTD_UBI_BEB_LIMIT with user-space
 parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 17 Aug 2012 10:06:48 +0300
In-Reply-To: <20120816165027.6520c4f4@pixies.home.jungo.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-5-git-send-email-richard.genoud@gmail.com>
 <20120816115713.726da8f2@pixies.home.jungo.com>
 <1345123718.3393.235.camel@sauron.fi.intel.com>
 <20120816165027.6520c4f4@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-dNPF8/SWYIreIrZPrKEy"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
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


--=-dNPF8/SWYIreIrZPrKEy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-16 at 16:50 +0300, Shmulik Ladkani wrote:
> Yes, but the main drawback I was referring to is those platforms already
> setting MTD_UBI_BEB_RESERVE other than the default, by means of kernel
> configuration.
> (there's one platform known to do so in its defconfig, that's
> sam9_l9260_defconfig, which uses 3% instead of the "standard" 2%).

Yes, I understand this. I think there are few such systems and many of
them are fine to pass the parameter explicitly.

> We force these systems to change their usermode because we changed ubi's
> default BEB limit to be 20/1024 _hardcoded_ (instead of kernel
> configurable as previously was).

Not necessarily, they can come to us and ask to add the kernel option.

> Is this ok?

It is not ideal, but I am willing to take this risk.

--=20
Best Regards,
Artem Bityutskiy

--=-dNPF8/SWYIreIrZPrKEy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLe2IAAoJECmIfjd9wqK0gsUP/24p+5MxWjf48RMU/90T8f+k
H5movsNmYArcOduzG6ZQn+qYg/MQIy0juDJclEFT/HT8UJ8LlXfewNjz/aHVZ9nF
0Qe0PS15vwT1Z+D9ykYnkpHRFbxVCBwvGmDtd7Udbm4S0EGhnsEHMiwNOYimAc1r
tL+mrDZ81dS6UovafVtn3PdwpjVSxNkXMrwLnOL3kp4WQneKOPCjC/gSfhHvpau4
T7j6SpvpGOjV+i97tIpaHZLsDZpKsLY/c0OOqZ2J2vue7Za2Vkz6g4Ma3RqaGcxW
PjlyuRJDDev0FxrVP9jsziJESQGNJsj+y1zu4TE/Wbb/vV8zdYNSZt0X3y2RQcFx
IQCNlnZ6FThYynS+0llfUu9C0VauVjxbv2s/Bl0HwOzh/Wrt/OHlERhw7aITyJvy
kOWeb9dgOc5XVOaXW6Y8XVMF2URtXOiUO7AJL2s9E0cuE3YmXuqeyHy2QLRTYIn6
zi+lbz3PocHQXka9nMhifLUq+L1hbvHyhxAteWxJFbkGjU0czdSPIS8ChVbcmj9k
wSg1ekN82yuxgclI2e5VIUI0V1DRut0jnk6/1ZNapmSMKBCH61z/wbVCpJ7jp8Yn
VIASnT+dANbyA/sP02aDw0MdCGbng7oNYdqi6Ds5BZ8OObrUu7DNEVzdTvxzQNnE
hqUX0sWLZWF087eFVTWG
=5h0C
-----END PGP SIGNATURE-----

--=-dNPF8/SWYIreIrZPrKEy--
