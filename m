Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1ydf-0001lf-1w
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 11:53:23 +0000
Message-ID: <1345118285.3393.217.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/4] UBI: use the whole MTD device size to get
 bad_peb_limit
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 16 Aug 2012 14:58:05 +0300
In-Reply-To: <CACQ1gAi+dDFBrLM0-cVAsFu6_7B3=ij9Lqm3W+SHCxTRSE9kww@mail.gmail.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-4-git-send-email-richard.genoud@gmail.com>
 <1345043331.3393.151.camel@sauron.fi.intel.com>
 <20120816112507.01b7c0f0@pixies.home.jungo.com>
 <CACQ1gAi+dDFBrLM0-cVAsFu6_7B3=ij9Lqm3W+SHCxTRSE9kww@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2ZtV2knUQJpb0XcOeMMq"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-2ZtV2knUQJpb0XcOeMMq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-16 at 12:35 +0200, Richard Genoud wrote:
> Ok, I'll change that, may be in a separate patch, as it's a bug fix.

Let me take care of this patch. I'll amend it myself, push to my tree
and re-send to the mailing list for your review. Please, provide an
updated version of the other patches instead.

P.S. Of course, your authorship will be preserved.

--=20
Best Regards,
Artem Bityutskiy

--=-2ZtV2knUQJpb0XcOeMMq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLOBNAAoJECmIfjd9wqK0WPoQAIbo/6e1nskfPYlgMJnGdtTn
O1icu6Xvo5PduRn75b4rbieT8YmC9i0RzuaPsbm+v7syMMgZ8fCmW4hG+KLUG+KR
P1qvc5Vv+5P7eVGH6kHhr45A4g72TPblb7GSzi/2CbH8csdW9OHuJADcGO+GefzH
iaveyspZktV8n5pKLWKwHNDSL3hopJ/olSDDW84cU+NJ2euwRVJSf7vVmeBLwq8d
7KgVb0LUG6JIEYL/cfabzMpSN+0F65sL32C6aU3TbJ4GN9iAD6PZ11YN7kCh7UFk
NqYprcjxspUYa6puV7QeObLsJoTHztJyNougmjmdrXEyEbD5VfLpse4XT0+2rIGi
B/AYnTGDveYyp5E6eeZuC7EhgKFW0wR/fev//sgdbHEcPLAmydPGIXAoR2vud3bQ
cw3M8wl7E+4EOHIyfXBPNWa9QtxcmgN1hYrCPApQgfyJ+uiTKu745kNRxi7Gaa9d
irIxAcLpNn131MlTtMNPS9nyq1by7vN/WxBlS95jFTsJVC01UkKrYFB8/KQOgYdk
I8+4aJuxxz29nQ8ynPGBxKNU75eeGulO2e76mMHI/mtc6g6+RwjxS/r33HlpgxQz
LL3jXoL/TvwgnErCaUePOLD6OBtl0HkbapcDrPNZsQ624PWLLAVCN4XqFbBbN8Na
Xn2twOmeTwgSL2Ecyb9f
=i6jo
-----END PGP SIGNATURE-----

--=-2ZtV2knUQJpb0XcOeMMq--
