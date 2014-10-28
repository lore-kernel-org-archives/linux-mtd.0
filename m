Received: from mail-wi0-f176.google.com ([209.85.212.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xj2dZ-0006Th-He
 for linux-mtd@lists.infradead.org; Tue, 28 Oct 2014 09:00:22 +0000
Received: by mail-wi0-f176.google.com with SMTP id n3so8572221wiv.9
 for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2014 01:59:59 -0700 (PDT)
Message-ID: <544F5AAC.5010400@vanguardiasur.com.ar>
Date: Tue, 28 Oct 2014 05:58:20 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Frans Klaver <frans.klaver@xsens.com>
Subject: Re: [PATCH typo-resend] mtd: omap: fix mtd devices not showing up
References: <1414416749-19598-1-git-send-email-frans.klaver@xsens.com>
 <544E4F19.8060205@ti.com> <544E9CB1.5020804@vanguardiasur.com.ar>
 <20141028085740.GG2383@ci00147.xsens-tech.local>
In-Reply-To: <20141028085740.GG2383@ci00147.xsens-tech.local>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="hj45RK57SCOwik8osagw0TufHUd3lfqH0"
Cc: linux-omap@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hj45RK57SCOwik8osagw0TufHUd3lfqH0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 10/28/2014 05:57 AM, Frans Klaver wrote:
> On Mon, Oct 27, 2014 at 04:27:45PM -0300, Ezequiel Garcia wrote:
>>
>> On 10/27/2014 10:56 AM, Roger Quadros wrote:
>>
>>> Alternatively we could fix either elm_config() or omap_nand_probe() t=
o
>>> return -EPROBE_DEFER in case the device is present but driver not yet=
 probed.
>>>
>>
>> Yes, that's a good idea. Can't we do both? Getting a systematic deferr=
ed
>> probe sounds like a bit silly to me.
>=20
> It may be. If we do both and something moves again, or something is
> added that depends on omap_elm but is probed earlier, you won't be
> noticing the new systematic probe deferral until you really start
> looking at it.
>=20

That's correct. Relying on the link order is very fragile.

> There isn't a real dependency system in the drivers, is there?
>=20

Nope.

--=20
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar


--hj45RK57SCOwik8osagw0TufHUd3lfqH0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUT1qxAAoJEIOKbhOEIHKihI4P/02xnz2PypVY2ktqfSAfj/n0
r8Mk4Gh3NZ0AnzdFVcgmBFbrmrV8HXOPr8XLTk5c01pKp5ywcjTHBwSiAWvCSHFm
ar5JDptPasT066TNzJg/hbFx/402oyd7d44oXeL/q9+Q5tvXea37fnwcFIpqFa24
atcI8gerbNyTZuSOzc1POWSDKMaWE+h56pyrBiIAXXsEtmCZhShr/Q5GFgKLwjmb
j7KbvW1d3tDrfFdh41UI5aTi7fReinM1KJAFQ2E1vGTkPqgFuYfvYj0WMhHBybtn
xVGGU0XZL82dsdRxDs0KJemREzgQhxH1k3e4XweIhCojI/dzJwbOP8SP93UZ1lbi
+R+ocDvh5KmIy/r9EZGvtG8WUQAgAWi5nmtul9Y0XZCpEVMDz5JkUPcdHO9tW1z1
w7yqq8WlluduN4JCZDvV2qIm7e8WkYU9klQTmCtQAQzvLTC2qynQIVGql8zTVbeZ
B6KkV57KFpK0KC+2TOpClGR29mcSUrcnOGFrNGDngGVAAHEkc1S2GWmS2Ycw76oC
9GlPAz1giEl6qC8zsb9fJX4rtHveCh53/n0M8AGgWzUh2SatJnkLUNSiV7N9cfyi
mXGUcjAkZ1VNywVMEUfIgUQE459v5O026HbKodx1Py+fiVBfFv9KGEHvqnByFLwv
dTBeIvNe5QOqZZKUwE3a
=+zDK
-----END PGP SIGNATURE-----

--hj45RK57SCOwik8osagw0TufHUd3lfqH0--
